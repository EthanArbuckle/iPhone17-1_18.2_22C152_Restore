@interface VCPImageFaceDetector
+ (BOOL)isLivePhotoKeyFrameEnabled;
+ (id)faceDetector;
- (BOOL)isDuplicate:(CGRect)a3 withRect:(CGRect)a4;
- (int)aggregateTileResults:(id)a3 tileRect:(CGRect)a4 imageSize:(CGSize)a5 landscape:(BOOL)a6 results:(id)a7;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)faceDetection:(__CVBuffer *)a3 faces:(id)a4 cancel:(id)a5;
@end

@implementation VCPImageFaceDetector

+ (BOOL)isLivePhotoKeyFrameEnabled
{
  return 0;
}

+ (id)faceDetector
{
  v2 = objc_alloc_init(VCPImageFaceDetector);
  return v2;
}

- (int)faceDetection:(__CVBuffer *)a3 faces:(id)a4 cancel:(id)a5
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v50 = a4;
  v51 = (uint64_t (**)(void))a5;
  uint64_t v7 = MEMORY[0x1C186D320]();
  int Width = CVPixelBufferGetWidth(a3);
  context = (void *)v7;
  int Height = CVPixelBufferGetHeight(a3);
  v52 = [MEMORY[0x1E4F1CA48] array];
  v49 = [MEMORY[0x1E4F1CA48] array];
  v10 = (void *)MEMORY[0x1C186D320]();
  id v11 = objc_alloc(MEMORY[0x1E4F45890]);
  v12 = (void *)[v11 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08]];
  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F457A8]);
    v14 = v13;
    if (v13
      && ([v13 setPreferBackgroundProcessing:1],
          [v14 setRevision:2],
          v58[0] = v14,
          [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1],
          v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v12 performRequests:v15 error:0],
          v15,
          (v16 & 1) != 0))
    {
      v17 = [v14 results];
      BOOL v18 = v17 == 0;

      if (!v18)
      {
        v19 = [v14 results];
        [v52 addObjectsFromArray:v19];
      }
      if (+[VCPImageFaceDetector isLivePhotoKeyFrameEnabled])
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4F45780]);
        v21 = v20;
        if (v20
          && ([v20 setRevision:1],
              [v21 setInputFaceObservations:v52],
              v57 = v21,
              [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1],
              v22 = objc_claimAutoreleasedReturnValue(),
              char v23 = [v12 performRequests:v22 error:0],
              v22,
              (v23 & 1) != 0))
        {
          v24 = [v21 results];
          BOOL v25 = v24 == 0;

          if (!v25)
          {
            v26 = [v21 results];
            [v49 addObjectsFromArray:v26];
          }
          int v27 = 0;
          int v46 = 0;
        }
        else
        {
          int v46 = -18;
          int v27 = 4;
        }
      }
      else
      {
        int v27 = 0;
        int v46 = 0;
      }
    }
    else
    {
      int v46 = -18;
      int v27 = 4;
    }
  }
  else
  {
    int v46 = -108;
    int v27 = 4;
  }

  if (v27)
  {
    int v28 = v46;
  }
  else
  {
    v48 = +[VCPCNNSmileDetector detector];
    v29 = +[VCPCNNPoseEstimator estimator];
    v30 = objc_alloc_init(VCPCNNGazeAnalysis);
    v31 = v30;
    int v28 = -18;
    if (v48 && v29 && v30)
    {
      unint64_t v32 = 0;
      double v33 = (double)Width;
      double v34 = (double)-Height;
      double v35 = (double)Height;
      while (1)
      {
        if ([v52 count] <= v32)
        {
          int v28 = v46;
          goto LABEL_35;
        }
        v36 = [v52 objectAtIndexedSubscript:v32];
        if (v51[2]()) {
          break;
        }
        [v36 boundingBox];
        v56.b = 0.0;
        v56.c = 0.0;
        v56.a = v33;
        v56.d = v34;
        v56.tdouble x = 0.0;
        v56.tdouble y = v35;
        CGRect v60 = CGRectApplyAffineTransform(v59, &v56);
        double x = v60.origin.x;
        double y = v60.origin.y;
        double v39 = v60.size.width;
        double v40 = v60.size.height;
        unsigned __int8 v55 = 0;
        int v28 = objc_msgSend(v48, "detectSmileForFace:inBuffer:smile:", a3, &v55);
        if (v28) {
          goto LABEL_34;
        }
        uint64_t v54 = 0;
        int v28 = objc_msgSend(v29, "detectPoseForFace:inBuffer:yaw:", a3, &v54, x, y, v39, v40);
        if (v28) {
          goto LABEL_34;
        }
        char v53 = 0;
        int v28 = -[VCPCNNGazeAnalysis detectEyeOpennessForFace:inBuffer:eyeOpenness:](v31, "detectEyeOpennessForFace:inBuffer:eyeOpenness:", a3, &v53, x, y, v39, v40);
        if (v28) {
          goto LABEL_34;
        }
        v41 = objc_alloc_init(VCPFace);
        -[VCPFace setBounds:](v41, "setBounds:", x, y, v39, v40);
        [(VCPFace *)v41 setSmile:v55];
        [(VCPFace *)v41 setLeftEyeClosed:v53 == 0];
        [(VCPFace *)v41 setRightEyeClosed:v53 == 0];
        [(VCPFace *)v41 setYaw:v54];
        LODWORD(v42) = -1.0;
        [(VCPFace *)v41 setFaceQuality:v42];
        if (+[VCPImageFaceDetector isLivePhotoKeyFrameEnabled])
        {
          v43 = [v49 objectAtIndexedSubscript:v32];
          v44 = [v43 faceCaptureQuality];
          [v44 floatValue];
          -[VCPFace setFaceQuality:](v41, "setFaceQuality:");
        }
        [v50 addObject:v41];

        ++v32;
      }
      int v28 = -128;
LABEL_34:
    }
LABEL_35:
  }

  return v28;
}

- (BOOL)isDuplicate:(CGRect)a3 withRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  BOOL v12 = CGRectIntersectsRect(a3, a4);
  if (v12)
  {
    float v13 = v9 * v8;
    float v14 = width * height;
    if (v13 >= v14) {
      float v15 = v9 * v8;
    }
    else {
      float v15 = width * height;
    }
    if (v14 >= v13) {
      float v14 = v9 * v8;
    }
    if (v15 <= (float)(v14 + v14))
    {
      v18.origin.CGFloat x = v11;
      float v16 = v14;
      v18.origin.CGFloat y = v10;
      v18.size.double width = v9;
      v18.size.double height = v8;
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.double width = width;
      v20.size.double height = height;
      CGRect v19 = CGRectIntersection(v18, v20);
      LOBYTE(v12) = v19.size.width * v19.size.height >= (float)(v16 * 0.5);
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (int)aggregateTileResults:(id)a3 tileRect:(CGRect)a4 imageSize:(CGSize)a5 landscape:(BOOL)a6 results:(id)a7
{
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v42 = a7;
  CGFloat v11 = [MEMORY[0x1E4F1CA48] array];
  if (v11)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = v40;
    uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(obj);
          }
          float v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          [v15 bounds];
          double v17 = v16;
          [v15 bounds];
          double v19 = v18;
          [v15 bounds];
          double v21 = v20;
          [v15 bounds];
          objc_msgSend(v15, "setBounds:", x + v17, y + v19, v21);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v22 = v42;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v44 != v24) {
                  objc_enumerationMutation(v22);
                }
                [*(id *)(*((void *)&v43 + 1) + 8 * j) bounds];
                double v27 = v26;
                double v29 = v28;
                double v31 = v30;
                double v33 = v32;
                [v15 bounds];
                if (-[VCPImageFaceDetector isDuplicate:withRect:](self, "isDuplicate:withRect:", v27, v29, v31, v33, v34, v35, v36, v37))
                {
                  [v11 addObject:v15];
                }
              }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
            }
            while (v23);
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v12);
    }

    if (obj && [obj count])
    {
      [v42 addObjectsFromArray:obj];
      [v42 removeObjectsInArray:v11];
    }
    int v38 = 0;
  }
  else
  {
    int v38 = -108;
  }

  return v38;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  long long v47 = a5;
  id v49 = a6;
  *long long v47 = 0;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  long long v50 = [MEMORY[0x1E4F1CA48] array];
  if (Height >= Width) {
    int v10 = Width;
  }
  else {
    int v10 = Height;
  }
  if (Width <= Height) {
    int v11 = Height;
  }
  else {
    int v11 = Width;
  }
  if ((float)((float)v11 / (float)v10) <= 2.0) {
    int v12 = [(VCPImageFaceDetector *)self faceDetection:a3 faces:v50 cancel:v49];
  }
  else {
    int v12 = [(VCPImageAnalyzer *)self analyzePixelBufferInTiles:a3 results:v50 cancel:v49];
  }
  int v13 = v12;
  if (!v12)
  {
    size_t v14 = CVPixelBufferGetWidth(a3);
    size_t v15 = CVPixelBufferGetHeight(a3);
    long long v63 = 0uLL;
    uint64_t v53 = [MEMORY[0x1E4F1CA48] array];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obuint64_t j = v50;
    uint64_t v16 = [obj countByEnumeratingWithState:&v59 objects:v74 count:16];
    if (v16)
    {
      double v17 = (double)v14;
      double v18 = (double)v15;
      unint64_t v19 = (unint64_t)(double)v14;
      unint64_t v20 = (unint64_t)v18;
      uint64_t v52 = *(void *)v60;
      double v21 = 0.0;
      do
      {
        uint64_t v22 = 0;
        uint64_t v55 = v16;
        do
        {
          if (*(void *)v60 != v52) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v59 + 1) + 8 * v22);
          memset(&v58, 0, sizeof(v58));
          objc_msgSend(v23, "faceBounds:height:", v19, v20, v47);
          CGRect v58 = v76;
          v57.a = 1.0;
          *(_OWORD *)&v57.b = v63;
          *(_OWORD *)&v57.d = xmmword_1BC280F00;
          v57.tdouble y = 1.0;
          CGRect v77 = CGRectApplyAffineTransform(v76, &v57);
          CGRect v58 = v77;
          if (v17 < v18) {
            double v24 = v77.size.width;
          }
          else {
            double v24 = v77.size.height;
          }
          if (v21 < v24) {
            double v21 = v24;
          }
          unint64_t v25 = v19;
          unint64_t v26 = v20;
          uint64_t v27 = [v23 flagsForOrientation:v17 >= v18 width:v19 height:v20];
          uint64_t v28 = MediaAnalysisFacePosition(&v58);
          v72[0] = @"flags";
          CGAffineTransform v56 = [NSNumber numberWithUnsignedLongLong:v27];
          v72[1] = @"attributes";
          v73[0] = v56;
          v70[0] = @"faceQuality";
          double v29 = NSNumber;
          [v23 faceQuality];
          double v30 = objc_msgSend(v29, "numberWithFloat:");
          v71[0] = v30;
          v70[1] = @"facePosition";
          uint64_t v31 = [NSNumber numberWithInteger:v28];
          double v32 = (void *)v31;
          if (v58.origin.x < 1.0) {
            CGFloat x = v58.origin.x;
          }
          else {
            CGFloat x = 1.0;
          }
          if (v58.origin.x <= 0.0) {
            CGFloat x = 0.0;
          }
          if (v58.origin.y < 1.0) {
            double y = v58.origin.y;
          }
          else {
            double y = 1.0;
          }
          if (v58.origin.y <= 0.0) {
            double y = 0.0;
          }
          double v35 = 1.0 - v58.origin.x;
          if (v58.size.width < 1.0 - v58.origin.x) {
            double v35 = v58.size.width;
          }
          v71[1] = v31;
          v70[2] = @"faceBounds";
          if (v58.size.width <= 0.0) {
            double v35 = 0.0;
          }
          double v36 = 1.0 - v58.origin.y;
          if (v58.size.height < 1.0 - v58.origin.y) {
            double v36 = v58.size.height;
          }
          if (v58.size.height <= 0.0) {
            double v36 = 0.0;
          }
          double v37 = NSStringFromRect(*(NSRect *)&x);
          v71[2] = v37;
          v70[3] = @"facePoseYaw";
          int v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "yaw"));
          v71[3] = v38;
          double v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:4];
          v73[1] = v39;
          id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
          [v53 addObject:v40];

          *a4 |= v27;
          ++v22;
          unint64_t v19 = v25;
          unint64_t v20 = v26;
        }
        while (v55 != v22);
        uint64_t v16 = [obj countByEnumeratingWithState:&v59 objects:v74 count:16];
      }
      while (v16);
    }
    else
    {
      double v21 = 0.0;
    }

    v41 = [MEMORY[0x1E4F1CA48] array];
    if ([obj count])
    {
      uint64_t v42 = MediaAnalysisShotType(v21);
      v68 = @"attributes";
      v66 = @"shotType";
      long long v43 = [NSNumber numberWithInteger:v42];
      v67 = v43;
      long long v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      v69 = v44;
      long long v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      [v41 addObject:v45];
    }
    if (objc_msgSend(obj, "count", v47))
    {
      *a4 |= 0x20uLL;
      v64[0] = @"FaceResults";
      v64[1] = @"ShotTypeResults";
      v65[0] = v53;
      v65[1] = v41;
      void *v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
    }

    int v13 = 0;
  }

  return v13;
}

@end