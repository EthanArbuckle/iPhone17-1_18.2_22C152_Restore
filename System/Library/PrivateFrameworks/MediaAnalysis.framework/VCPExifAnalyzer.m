@interface VCPExifAnalyzer
- (CGAffineTransform)transformUprightAboutTopLeft:(SEL)a3;
- (VCPExifAnalyzer)initWithProperties:(id)a3 forAnalysisTypes:(unint64_t)a4;
- (int)addFaceResults:(id)a3 flags:(unint64_t *)a4;
- (int)analyzeAsset:(unint64_t *)a3 results:(id *)a4;
@end

@implementation VCPExifAnalyzer

- (VCPExifAnalyzer)initWithProperties:(id)a3 forAnalysisTypes:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VCPExifAnalyzer;
  v8 = [(VCPExifAnalyzer *)&v14 init];
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v8->_properties, a3);
      results = v9->_results;
      v9->_requestedAnalyses = a4;
      v9->_results = 0;

      v11 = v9;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CGAffineTransform)transformUprightAboutTopLeft:(SEL)a3
{
  switch(a4)
  {
    case 2u:
      retstr->b = 0.0;
      retstr->c = 0.0;
      retstr->a = -1.0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&retstr->d = _Q0;
      retstr->ty = 0.0;
      return self;
    case 3u:
      retstr->b = 0.0;
      retstr->c = 0.0;
      retstr->a = -1.0;
      *(_OWORD *)&retstr->d = xmmword_1BC281070;
      goto LABEL_6;
    case 4u:
      retstr->b = 0.0;
      retstr->c = 0.0;
      retstr->a = 1.0;
      *(_OWORD *)&retstr->d = xmmword_1BC280F00;
LABEL_6:
      retstr->ty = 1.0;
      return self;
    case 5u:
      *(_OWORD *)&retstr->a = xmmword_1BC281930;
      retstr->c = 1.0;
      retstr->d = 0.0;
      retstr->tx = 0.0;
      retstr->ty = 0.0;
      return self;
    case 6u:
      *(_OWORD *)&retstr->a = xmmword_1BC281930;
      *(_OWORD *)&retstr->c = xmmword_1BC280F00;
      _Q0 = xmmword_1BC2810A0;
      goto LABEL_10;
    case 7u:
      *(_OWORD *)&retstr->a = xmmword_1BC2810B0;
      *(_OWORD *)&retstr->c = xmmword_1BC280F00;
      __asm { FMOV            V0.2D, #1.0 }
      goto LABEL_10;
    case 8u:
      *(_OWORD *)&retstr->a = xmmword_1BC2810B0;
      retstr->c = 1.0;
      retstr->d = 0.0;
      retstr->tx = 0.0;
      retstr->ty = 1.0;
      return self;
    default:
      uint64_t v9 = MEMORY[0x1E4F1DAB8];
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&retstr->c = v10;
      _Q0 = *(_OWORD *)(v9 + 32);
LABEL_10:
      *(_OWORD *)&retstr->tx = _Q0;
      return self;
  }
}

- (int)addFaceResults:(id)a3 flags:(unint64_t *)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61 = v4;
  if (v4)
  {
    v5 = [v4 objectForKey:@"Orientation"];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v78.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v78.c = v6;
    *(_OWORD *)&v78.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v55 = v5;
    if (v5)
    {
      -[VCPExifAnalyzer transformUprightAboutTopLeft:](self, "transformUprightAboutTopLeft:", [v5 intValue]);
      *(CGPoint *)&v78.a = v76.origin;
      *(CGSize *)&v78.c = v76.size;
      *(_OWORD *)&v78.tx = v77;
    }
    CGAffineTransform t1 = v78;
    t2.b = 0.0;
    t2.c = 0.0;
    t2.a = 1.0;
    *(_OWORD *)&t2.d = xmmword_1BC280F00;
    t2.ty = 1.0;
    CGAffineTransformConcat(&v78, &t1, &t2);
    id v7 = [v61 objectForKey:*MEMORY[0x1E4F2F6D8]];
    v52 = v7;
    if (!v7)
    {
      int v62 = 0;
LABEL_50:

      goto LABEL_51;
    }
    v8 = [v7 objectForKey:@"Regions"];
    v50 = v8;
    if (!v8)
    {
      int v62 = 0;
LABEL_49:

      goto LABEL_50;
    }
    v49 = [v8 objectForKey:*MEMORY[0x1E4F2F778]];
    if (!v49)
    {
      int v62 = 0;
LABEL_48:

      goto LABEL_49;
    }
    v53 = [MEMORY[0x1E4F1CA48] array];
    if (v53)
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id obj = v49;
      uint64_t v9 = [obj countByEnumeratingWithState:&v70 objects:v88 count:16];
      if (v9)
      {
        int v62 = 0;
        uint64_t v66 = *(void *)v71;
        uint64_t v65 = *MEMORY[0x1E4F2F780];
        uint64_t v64 = *MEMORY[0x1E4F2F760];
        uint64_t v59 = *MEMORY[0x1E4F2F790];
        uint64_t v58 = *MEMORY[0x1E4F2F798];
        uint64_t v57 = *MEMORY[0x1E4F2F788];
        uint64_t v56 = *MEMORY[0x1E4F2F770];
        double v10 = 0.0;
LABEL_10:
        uint64_t v67 = v9;
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v71 != v66) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v70 + 1) + 8 * v11);
          v13 = [v12 objectForKey:v65];
          if ([v13 isEqualToString:v64])
          {
            v68 = [v12 objectForKey:v59];
            objc_super v14 = [v12 objectForKey:v58];
            v15 = [v12 objectForKey:v57];
            v16 = [v12 objectForKey:v56];
            BOOL v17 = !v68 || v14 == 0;
            BOOL v18 = v17 || v15 == 0;
            BOOL v19 = v18 || v16 == 0;
            BOOL v20 = !v19;
            BOOL v63 = v20;
            if (v19)
            {
              int v62 = -18;
            }
            else
            {
              memset(&v76, 0, sizeof(v76));
              [v68 floatValue];
              float v22 = v21;
              [v15 floatValue];
              float v24 = v23;
              [v14 floatValue];
              float v26 = v25;
              [v16 floatValue];
              float v28 = v27;
              [v15 floatValue];
              float v30 = v29;
              [v16 floatValue];
              double v32 = (float)(v22 + (float)(v24 * -0.5));
              double v35 = v31;
              v76.origin.x = v32;
              v76.origin.y = (float)(v26 + (float)(v28 * -0.5));
              v76.size.width = v30;
              v76.size.height = v31;
              double v36 = v31 >= v30 ? v31 : v30;
              if (v10 < v36) {
                double v10 = v36;
              }
              CGAffineTransform v69 = v78;
              double v37 = v32;
              double v33 = (float)(v26 + (float)(v28 * -0.5));
              double v34 = v30;
              CGRect v76 = CGRectApplyAffineTransform(*(CGRect *)(&v35 - 3), &v69);
              uint64_t v38 = MediaAnalysisFacePosition(&v76);
              v86[0] = @"flags";
              v39 = [NSNumber numberWithUnsignedLongLong:16 * (v36 >= 0.449999988)];
              v87[0] = v39;
              v86[1] = @"attributes";
              v84[0] = @"facePosition";
              v40 = [NSNumber numberWithInteger:v38];
              v85[0] = v40;
              v84[1] = @"faceBounds";
              v41 = NSStringFromRect(v76);
              v85[1] = v41;
              v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
              v87[1] = v42;
              v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];
              [v53 addObject:v43];
            }
            if (!v63) {
              break;
            }
          }

          if (v67 == ++v11)
          {
            uint64_t v9 = [obj countByEnumeratingWithState:&v70 objects:v88 count:16];
            if (v9) {
              goto LABEL_10;
            }
            goto LABEL_44;
          }
        }
      }
      else
      {
        int v62 = 0;
        double v10 = 0.0;
LABEL_44:

        if (![v53 count]) {
          goto LABEL_47;
        }
        *a4 |= 0x20uLL;
        [(NSMutableDictionary *)self->_results setObject:v53 forKey:@"FaceResults"];
        uint64_t v44 = MediaAnalysisShotType(v10);
        results = self->_results;
        v81 = @"attributes";
        v79 = @"shotType";
        id obj = [NSNumber numberWithInteger:v44];
        id v80 = obj;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        v82 = v13;
        v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        v83 = v46;
        v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
        [(NSMutableDictionary *)results setObject:v47 forKey:@"ShotTypeResults"];
      }
    }
    else
    {
      int v62 = -108;
    }
LABEL_47:

    goto LABEL_48;
  }
  int v62 = -50;
LABEL_51:

  return v62;
}

- (int)analyzeAsset:(unint64_t *)a3 results:(id *)a4
{
  *a4 = 0;
  long long v6 = [MEMORY[0x1E4F1CA60] dictionary];
  results = self->_results;
  self->_results = v6;

  v8 = self->_results;
  if (!v8) {
    return -108;
  }
  if (self->_properties && (self->_requestedAnalyses & 4) != 0)
  {
    int result = -[VCPExifAnalyzer addFaceResults:flags:](self, "addFaceResults:flags:");
    if (result) {
      return result;
    }
    v8 = self->_results;
  }
  double v10 = v8;
  int result = 0;
  *a4 = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end