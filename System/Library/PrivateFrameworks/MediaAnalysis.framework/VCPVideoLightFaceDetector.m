@interface VCPVideoLightFaceDetector
- (VCPVideoLightFaceDetector)initWithTransform:(CGAffineTransform *)a3 faceDominated:(BOOL)a4;
- (float)minProcessTimeIntervalInSecs;
- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7;
- (int)detectFaces:(__CVBuffer *)a3 faces:(id)a4 frameStats:(id)a5;
- (int)finishAnalysisPass:(id *)a3;
@end

@implementation VCPVideoLightFaceDetector

- (VCPVideoLightFaceDetector)initWithTransform:(CGAffineTransform *)a3 faceDominated:(BOOL)a4
{
  v15.receiver = self;
  v15.super_class = (Class)VCPVideoLightFaceDetector;
  v6 = [(VCPVideoLightFaceDetector *)&v15 init];
  if (v6)
  {
    long long v7 = *(_OWORD *)&a3->c;
    v14[0] = *(_OWORD *)&a3->a;
    v14[1] = v7;
    v14[2] = *(_OWORD *)&a3->tx;
    *((_DWORD *)v6 + 2) = angleForTransform(v14);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    v9 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v8;

    uint64_t v10 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    *(_OWORD *)(v6 + 12) = *MEMORY[0x1E4F1FA08];
    *(void *)(v6 + 28) = v10;
    v11 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = 0;

    *((_DWORD *)v6 + 14) = 0;
    *((_DWORD *)v6 + 15) = 0;
    v6[64] = a4;
    v12 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = 0;
  }
  return (VCPVideoLightFaceDetector *)v6;
}

- (int)detectFaces:(__CVBuffer *)a3 faces:(id)a4 frameStats:(id)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v49 = a4;
  id v46 = a5;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  context = (void *)MEMORY[0x1C186D320]();
  id obj = [MEMORY[0x1E4F1CA48] array];
  v47 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = (void *)MEMORY[0x1C186D320]();
  id v11 = objc_alloc(MEMORY[0x1E4F45890]);
  v12 = (void *)[v11 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08]];
  if (!v12)
  {
    int v44 = -108;
    int v20 = 4;
    goto LABEL_20;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F457A8]);
  v14 = v13;
  if (v13)
  {
    [v13 setPreferBackgroundProcessing:1];
    [v14 setRevision:2];
    v56[0] = v14;
    objc_super v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    v16 = (void *)[v15 mutableCopy];

    if (self->_faceDominated)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F45798]);
      v18 = v17;
      if (!v17)
      {
        v19 = 0;
        goto LABEL_17;
      }
      [v17 setPreferBackgroundProcessing:1];
      [v18 setRevision:2];
      v19 = v18;
      [v16 addObject:v18];
    }
    else
    {
      v19 = 0;
    }
    if ([v12 performRequests:v16 error:0])
    {
      v21 = [v14 results];
      BOOL v22 = v21 == 0;

      if (!v22)
      {
        v23 = [v14 results];
        [obj addObjectsFromArray:v23];
      }
      if (v19)
      {
        v24 = [v19 results];
        BOOL v25 = v24 == 0;

        if (!v25)
        {
          v26 = [v19 results];
          [v47 addObjectsFromArray:v26];
        }
      }
      int v20 = 0;
      int v44 = 0;
      goto LABEL_18;
    }
LABEL_17:
    int v44 = -18;
    int v20 = 4;
LABEL_18:

    goto LABEL_19;
  }
  int v44 = -18;
  int v20 = 4;
LABEL_19:

LABEL_20:
  if (!v20)
  {
    v27 = v47;
    if (!v47) {
      v27 = obj;
    }
    id v28 = v27;

    unsigned int lastestFaceID = self->_lastestFaceID;
    if (v28 && [v28 count])
    {
      int v30 = [v28 count];
      int numFacesLastFrame = self->_numFacesLastFrame;
      if (numFacesLastFrame >= v30) {
        int numFacesLastFrame = v30;
      }
      lastestFaceID -= numFacesLastFrame;
      self->_int numFacesLastFrame = v30;
    }
    else
    {
      self->_int numFacesLastFrame = 0;
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v28;
    uint64_t v32 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v32)
    {
      double v33 = (double)-Height;
      double v34 = (double)Height;
      uint64_t v35 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(obj);
          }
          v37 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          [v37 boundingBox];
          v50.b = 0.0;
          v50.c = 0.0;
          v50.a = (double)Width;
          v50.d = v33;
          v50.tdouble x = 0.0;
          v50.tdouble y = v34;
          CGRect v58 = CGRectApplyAffineTransform(v57, &v50);
          double x = v58.origin.x;
          double y = v58.origin.y;
          double v40 = v58.size.width;
          double v41 = v58.size.height;
          v42 = objc_alloc_init(VCPFace);
          [(VCPFace *)v42 setObservation:v37];
          -[VCPFace setBounds:](v42, "setBounds:", x, y, v40, v41);
          [(VCPFace *)v42 setTrackID:lastestFaceID + i];
          self->_unsigned int lastestFaceID = lastestFaceID + i + 1;
          [v49 addObject:v42];
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
        lastestFaceID += i;
      }
      while (v32);
    }

    int v20 = 0;
  }

  if (!v20) {
    [v46 setFrameProcessedByFaceDetector:1];
  }

  return v44;
}

- (float)minProcessTimeIntervalInSecs
{
  return 0.16667;
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v66 = a6;
  if (self->super._results)
  {
    int v11 = -18;
LABEL_3:
    int v57 = v11;
    goto LABEL_54;
  }
  if (CVPixelBufferGetPixelFormatType(a3) != 875704438 && CVPixelBufferGetPixelFormatType(a3) != 875704422)
  {
    int v11 = -50;
    goto LABEL_3;
  }
  v12 = [v66 detectedFaces];
  [v12 removeAllObjects];

  context = (void *)MEMORY[0x1C186D320]([v66 setFrameProcessedByFaceDetector:0]);
  lhs.origin = *(CGPoint *)&a4->var0;
  *(void *)&lhs.size.width = a4->var3;
  CMTime rhs = *(CMTime *)(&self->super._angle + 1);
  CMTimeSubtract(&time, (CMTime *)&lhs, &rhs);
  double Seconds = CMTimeGetSeconds(&time);
  [(VCPVideoLightFaceDetector *)self minProcessTimeIntervalInSecs];
  if (Seconds >= v14)
  {
    long long v17 = *(_OWORD *)&a4->var0;
    *(void *)&self->super._timeLastDetection.flags = a4->var3;
    *(_OWORD *)(&self->super._angle + 1) = v17;
    v55 = [MEMORY[0x1E4F1CA48] array];
    float v16 = 0.0;
    int v57 = -[VCPVideoLightFaceDetector detectFaces:faces:frameStats:](self, "detectFaces:faces:frameStats:", a3);
    v68 = self;
    if (v57)
    {
      id v65 = 0;
      int v15 = 1;
    }
    else
    {
      if (v55 && [v55 count])
      {
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
        int angle = self->super._angle;
        if (angle) {
          BOOL v21 = angle == 180;
        }
        else {
          BOOL v21 = 1;
        }
        int v22 = v21;
        unsigned int v63 = v22;
        *a7 |= 0x20uLL;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id obj = v55;
        uint64_t v64 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
        if (v64)
        {
          size_t v60 = HeightOfPlane;
          size_t v61 = WidthOfPlane;
          v67 = a4;
          v59 = a7;
          id v65 = 0;
          uint64_t v62 = *(void *)v80;
          do
          {
            for (uint64_t i = 0; i != v64; ++i)
            {
              if (*(void *)v80 != v62) {
                objc_enumerationMutation(obj);
              }
              v24 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              uint64_t v25 = [v24 flagsForOrientation:v63 width:v61 height:v60];
              v75[1] = 0;
              v75[2] = 0;
              memset(&lhs, 0, sizeof(lhs));
              v75[0] = 0x3FF0000000000000;
              long long v76 = xmmword_1BC280F00;
              uint64_t v77 = 0x3FF0000000000000;
              [v24 faceBoundsWithTransform:v61 height:v60 transform:v75];
              lhs.origin.double x = v26;
              lhs.origin.double y = v27;
              lhs.size.width = v28;
              lhs.size.height = v29;
              uint64_t v30 = MediaAnalysisFacePosition(&lhs);
              v31 = objc_alloc_init(VCPFace);
              -[VCPFace setBounds:](v31, "setBounds:", lhs.origin.x, lhs.origin.y, lhs.size.width, lhs.size.height);
              uint64_t v32 = [v24 observation];
              [(VCPFace *)v31 setObservation:v32];

              double v33 = [v66 detectedFaces];
              [v33 addObject:v31];

              activeFaces = v68->super._activeFaces;
              uint64_t v35 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v24, "trackID"));
              v36 = [(NSMutableDictionary *)activeFaces objectForKey:v35];

              if (v36)
              {
                long long v73 = *(_OWORD *)&v67->var0;
                int64_t var3 = v67->var3;
                [v36 setLast:&v73];
                objc_msgSend(v36, "setFlags:", objc_msgSend(v36, "flags") | v25);
                objc_msgSend(v36, "setPosition:", objc_msgSend(v36, "position") | v30);
              }
              else
              {
                v37 = objc_alloc_init(VCPFaceDetectionRange);
                long long v71 = *(_OWORD *)&v67->var0;
                int64_t v72 = v67->var3;
                [(VCPFaceDetectionRange *)v37 setStart:&v71];
                long long v69 = *(_OWORD *)&v67->var0;
                int64_t v70 = v67->var3;
                [(VCPFaceDetectionRange *)v37 setLast:&v69];
                [(VCPFaceDetectionRange *)v37 setFlags:v25];
                -[VCPFaceDetectionRange setBounds:](v37, "setBounds:", lhs.origin.x, lhs.origin.y, lhs.size.width, lhs.size.height);
                [(VCPFaceDetectionRange *)v37 setPosition:v30];
                v38 = v68->super._activeFaces;
                v39 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v24, "trackID"));
                [(NSMutableDictionary *)v38 setObject:v37 forKey:v39];
              }
              *v59 |= v25;
              double v40 = lhs.size.height * lhs.size.width;
              if (lhs.size.height * lhs.size.width > v16)
              {
                id v41 = v24;

                float v16 = v40;
                id v65 = v41;
              }
            }
            uint64_t v64 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
          }
          while (v64);
        }
        else
        {
          id v65 = 0;
        }
      }
      else
      {
        id v65 = 0;
      }
      int v15 = 0;
    }

    self = v68;
  }
  else
  {
    id v65 = 0;
    int v57 = 0;
    int v15 = 1;
    float v16 = 0.0;
  }
  if (!v15)
  {
    if ([v66 frameProcessedByFaceDetector] && self->_lastDominantFace && v16 > 0.2)
    {
      v42 = [v65 observation];
      v43 = [v42 landmarks65];
      int v44 = self;
      v45 = [v43 allPoints];

      id v46 = [(VCPFace *)self->_lastDominantFace observation];
      v47 = [v46 landmarks65];
      v48 = [v47 allPoints];

      if (v45 && v48)
      {
        unint64_t v49 = 0;
        float v50 = 0.0;
        while ([v45 pointCount] > v49)
        {
          float32x2_t v51 = vcvt_f32_f64(vsubq_f64(*(float64x2_t *)([v45 normalizedPoints] + 16 * v49), *(float64x2_t *)(objc_msgSend(objc_retainAutorelease(v48), "normalizedPoints") + 16 * v49)));
          float v50 = v50 + sqrtf(vaddv_f32(vmul_f32(v51, v51)));
          ++v49;
        }
        float v52 = 1.0;
        if ((float)(v50 / 9.1924) < 1.0) {
          float v52 = v50 / 9.1924;
        }
        double v53 = 0.0;
        if ((float)(v50 / 9.1924) > 0.0) {
          *(float *)&double v53 = v52;
        }
        [v66 setFrameExpressionScore:v53];
      }

      self = v44;
    }
    objc_storeStrong((id *)&self->_lastDominantFace, v65);
    int v57 = 0;
  }

LABEL_54:
  return v57;
}

- (int)finishAnalysisPass:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (self->super._results) {
    return -18;
  }
  memset(&v39, 0, sizeof(v39));
  [(VCPVideoLightFaceDetector *)self minProcessTimeIntervalInSecs];
  CMTimeMakeWithSeconds(&v39, (float)(v4 * 0.5), 100);
  CGFloat v27 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = self->super._activeFaces;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v5)
  {
    uint64_t v26 = *(void *)v36;
    do
    {
      uint64_t v28 = v5;
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(obj);
        }
        long long v7 = [(NSMutableDictionary *)self->super._activeFaces objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        uint64_t v8 = v7;
        memset(&v34[32], 0, 24);
        if (v7)
        {
          [v7 start];
          memset(v34, 0, 24);
          [v8 last];
        }
        else
        {
          memset(v34, 0, 24);
        }
        [(VCPVideoLightFaceDetector *)self minProcessTimeIntervalInSecs];
        if (v9 > 0.0)
        {
          CMTime lhs = *(CMTime *)&v34[32];
          CMTime rhs = v39;
          CMTimeSubtract(&v33, &lhs, &rhs);
          CMTime lhs = v33;
          CMTime rhs = (CMTime)a3->var0;
          int32_t v10 = CMTimeCompare(&lhs, &rhs);
          int v11 = &v33;
          if (v10 < 0) {
            int v11 = (CMTime *)a3;
          }
          *(CMTime *)&v34[32] = *v11;
          CMTime lhs = *(CMTime *)v34;
          CMTime rhs = v39;
          CMTimeAdd(&v33, &lhs, &rhs);
          long long v12 = *(_OWORD *)&a3->var0.var3;
          *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
          *(_OWORD *)&range.start.epoch = v12;
          *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
          CMTimeRangeGetEnd(&v32, &range);
          CMTime lhs = v32;
          CMTime rhs = v33;
          int32_t v13 = CMTimeCompare(&lhs, &rhs);
          float v14 = &v33;
          if (v13 < 0) {
            float v14 = &v32;
          }
          *(CMTime *)double v34 = *v14;
        }
        v46[0] = @"start";
        CMTime lhs = *(CMTime *)&v34[32];
        CFDictionaryRef v15 = CMTimeCopyAsDictionary(&lhs, 0);
        v47[0] = v15;
        v46[1] = @"duration";
        CMTime lhs = *(CMTime *)v34;
        CMTime rhs = *(CMTime *)&v34[32];
        CMTimeSubtract(&v30, &lhs, &rhs);
        CMTime lhs = v30;
        CFDictionaryRef v16 = CMTimeCopyAsDictionary(&lhs, 0);
        v47[1] = v16;
        v46[2] = @"flags";
        long long v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "flags"));
        v47[2] = v17;
        v46[3] = @"attributes";
        v44[0] = @"facePosition";
        v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "position"));
        v44[1] = @"faceBounds";
        v45[0] = v18;
        [v8 bounds];
        v19 = NSStringFromRect(v50);
        v45[1] = v19;
        int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
        v47[3] = v20;
        BOOL v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:4];
        [v27 addObject:v21];
      }
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v5);
  }

  v42 = @"FaceResults";
  v43 = v27;
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  results = self->super._results;
  self->super._results = v22;

  return 0;
}

- (void).cxx_destruct
{
}

@end