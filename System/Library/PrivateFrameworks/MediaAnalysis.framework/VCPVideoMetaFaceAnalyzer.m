@interface VCPVideoMetaFaceAnalyzer
- (CGAffineTransform)flipTransform:(SEL)a3;
- (VCPVideoMetaFaceAnalyzer)initWithTransform:(CGAffineTransform *)a3;
- (id)publicResults;
- (int)finalizeAnalysis;
- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4;
@end

@implementation VCPVideoMetaFaceAnalyzer

- (VCPVideoMetaFaceAnalyzer)initWithTransform:(CGAffineTransform *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VCPVideoMetaFaceAnalyzer;
  v4 = [(VCPVideoMetaFaceAnalyzer *)&v14 init];
  v5 = v4;
  if (v4)
  {
    activeFaces = v4->_activeFaces;
    v4->_activeFaces = 0;

    long long v7 = *(_OWORD *)&a3->c;
    v13[0] = *(_OWORD *)&a3->a;
    v13[1] = v7;
    v13[2] = *(_OWORD *)&a3->tx;
    [(VCPVideoMetaFaceAnalyzer *)v5 flipTransform:v13];
    long long v9 = v13[4];
    long long v8 = v13[5];
    *(_OWORD *)&v5->_transform.a = v13[3];
    *(_OWORD *)&v5->_transform.c = v9;
    *(_OWORD *)&v5->_transform.tx = v8;
    faceResults = v5->_faceResults;
    v5->_faceResults = 0;

    v11 = v5;
  }

  return v5;
}

- (CGAffineTransform)flipTransform:(SEL)a3
{
  if (a4->tx != 0.0) {
    a4->tx = 1.0;
  }
  if (a4->ty != 0.0) {
    a4->ty = 1.0;
  }
  v6.b = 0.0;
  v6.c = 0.0;
  long long v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  v6.a = 1.0;
  *(_OWORD *)&v6.d = xmmword_1BC280F00;
  v6.ty = 1.0;
  return CGAffineTransformConcat(retstr, &t1, &v6);
}

- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v24 = v6;
  if (v6)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v7 = objc_msgSend(v6, "items", v6);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v8)
    {
      id obj = v7;
      uint64_t v26 = *(void *)v40;
      while (2)
      {
        uint64_t v27 = v8;
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v11 = [v10 value];
          memset(&v38, 0, sizeof(v38));
          [v11 bounds];
          long long v12 = *(_OWORD *)&self->_transform.c;
          *(_OWORD *)&v37.a = *(_OWORD *)&self->_transform.a;
          *(_OWORD *)&v37.c = v12;
          *(_OWORD *)&v37.tx = *(_OWORD *)&self->_transform.tx;
          CGRect v38 = CGRectApplyAffineTransform(v47, &v37);
          uint64_t v13 = MediaAnalysisFacePosition(&v38);
          *a4 |= 0x20uLL;
          activeFaces = self->_activeFaces;
          if (!activeFaces)
          {
            v15 = [MEMORY[0x1E4F1CA60] dictionary];
            v16 = self->_activeFaces;
            self->_activeFaces = v15;

            activeFaces = self->_activeFaces;
            if (!activeFaces)
            {

              int v22 = -108;
              goto LABEL_26;
            }
          }
          v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "faceID"));
          v18 = [(NSMutableDictionary *)activeFaces objectForKey:v17];

          if (v18)
          {
            if (v10)
            {
              [v10 time];
              [v10 duration];
            }
            else
            {
              memset(v35, 0, sizeof(v35));
            }
            CMTime lhs = v35[1];
            CMTime rhs = v35[0];
            CMTimeAdd(&v36, &lhs, &rhs);
            CMTime v34 = v36;
            [v18 setLast:&v34];
            objc_msgSend(v18, "setPosition:", objc_msgSend(v18, "position") | v13);
          }
          else
          {
            v19 = objc_alloc_init(VCPFaceDetectionRange);
            if (v10)
            {
              [v10 time];
            }
            else
            {
              long long v32 = 0uLL;
              uint64_t v33 = 0;
            }
            long long v30 = v32;
            uint64_t v31 = v33;
            [(VCPFaceDetectionRange *)v19 setStart:&v30];
            if (v10)
            {
              [v10 time];
              [v10 duration];
            }
            else
            {
              memset(v35, 0, sizeof(v35));
            }
            CMTime lhs = v35[1];
            CMTime rhs = v35[0];
            CMTimeAdd(&v29, &lhs, &rhs);
            CMTime v28 = v29;
            [(VCPFaceDetectionRange *)v19 setLast:&v28];
            -[VCPFaceDetectionRange setBounds:](v19, "setBounds:", *(_OWORD *)&v38.origin, *(_OWORD *)&v38.size);
            [(VCPFaceDetectionRange *)v19 setPosition:v13];
            v20 = self->_activeFaces;
            v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "faceID"));
            [(NSMutableDictionary *)v20 setObject:v19 forKey:v21];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      int v22 = 0;
LABEL_26:
      long long v7 = obj;
    }
    else
    {
      int v22 = 0;
    }
  }
  else
  {
    int v22 = -50;
  }

  return v22;
}

- (int)finalizeAnalysis
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!self->_faceResults)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    faceResults = self->_faceResults;
    self->_faceResults = v3;

    if (!self->_faceResults) {
      return -108;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = self->_activeFaces;
    uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v5)
    {
      uint64_t v18 = *(void *)v24;
      do
      {
        uint64_t v19 = v5;
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v7 = [(NSMutableDictionary *)self->_activeFaces objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          uint64_t v8 = v7;
          long long v9 = self->_faceResults;
          v31[0] = @"start";
          if (v7) {
            [v7 start];
          }
          else {
            memset(&v22, 0, sizeof(v22));
          }
          CMTime time = v22;
          CFDictionaryRef v10 = CMTimeCopyAsDictionary(&time, 0);
          v32[0] = v10;
          v31[1] = @"duration";
          if (v8)
          {
            [v8 last];
            [v8 start];
          }
          else
          {
            memset(v20, 0, sizeof(v20));
          }
          CMTime time = v20[1];
          CMTime rhs = v20[0];
          CMTimeSubtract(&v21, &time, &rhs);
          CMTime time = v21;
          CFDictionaryRef v11 = CMTimeCopyAsDictionary(&time, 0);
          v32[1] = v11;
          v32[2] = &unk_1F15EB448;
          v31[2] = @"flags";
          v31[3] = @"attributes";
          v29[0] = @"facePosition";
          long long v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "position"));
          v29[1] = @"faceBounds";
          v30[0] = v12;
          [v8 bounds];
          uint64_t v13 = NSStringFromRect(v35);
          v30[1] = v13;
          objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
          v32[3] = v14;
          v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
          [(NSMutableArray *)v9 addObject:v15];
        }
        uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v5);
    }
  }
  return 0;
}

- (id)publicResults
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_faceResults count];
  if (v3)
  {
    faceResults = self->_faceResults;
    id v6 = @"FaceResults";
    v7[0] = faceResults;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceResults, 0);
  objc_storeStrong((id *)&self->_activeFaces, 0);
}

@end