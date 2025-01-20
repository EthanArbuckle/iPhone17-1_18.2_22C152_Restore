@interface VCPImageFaceExpressionAnalyzer
- (VCPImageFaceExpressionAnalyzer)initWithFaceResults:(id)a3;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
@end

@implementation VCPImageFaceExpressionAnalyzer

- (VCPImageFaceExpressionAnalyzer)initWithFaceResults:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPImageFaceExpressionAnalyzer;
  v5 = [(VCPImageFaceExpressionAnalyzer *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 objectForKey:@"FaceResults"];
      faces = v5->_faces;
      v5->_faces = (NSArray *)v6;
    }
    v8 = v5;
  }

  return v5;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v44 = (uint64_t (**)(void))a6;
  *a5 = 0;
  faces = self->_faces;
  if (!faces || ![(NSArray *)faces count])
  {
    int v14 = 0;
    goto LABEL_33;
  }
  v40 = [MEMORY[0x1E4F1CA48] array];
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  long long v53 = 0uLL;
  uint64_t v13 = MEMORY[0x1C186D320]();
  v43 = +[VCPCNNSmileDetector detector];
  v42 = +[VCPCNNPoseEstimator estimator];
  v35 = a5;
  context = (void *)v13;
  v41 = objc_alloc_init(VCPCNNGazeAnalysis);
  int v14 = -18;
  int v15 = 6;
  if (!v43 || !v42 || !v41) {
    goto LABEL_29;
  }
  *a4 &= 0xFFFFFFFFFFFFFFF9;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obj = self->_faces;
  uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (!v16)
  {
    int v15 = 0;
    int v14 = 0;
    goto LABEL_28;
  }
  double v17 = (double)Width;
  double v18 = (double)-Height;
  double v19 = (double)Height;
  uint64_t v39 = *(void *)v50;
  while (2)
  {
    uint64_t v38 = v16;
    for (uint64_t i = 0; i != v38; ++i)
    {
      if (*(void *)v50 != v39) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      if (v44[2]())
      {
        int v14 = -128;
        goto LABEL_27;
      }
      v22 = [v21 objectForKeyedSubscript:@"attributes"];
      v23 = [v22 objectForKeyedSubscript:@"faceBounds"];

      if (!v23)
      {
        int v14 = -18;
        goto LABEL_27;
      }
      NSRect v60 = NSRectFromString(v23);
      *(_OWORD *)&v48.b = v53;
      v48.a = v17;
      v48.d = v18;
      v48.tdouble x = 0.0;
      v48.tdouble y = v19;
      CGRect v61 = CGRectApplyAffineTransform(v60, &v48);
      double x = v61.origin.x;
      double y = v61.origin.y;
      double v26 = v61.size.width;
      double v27 = v61.size.height;
      unsigned __int8 v47 = 0;
      int v14 = objc_msgSend(v43, "detectSmileForFace:inBuffer:smile:", a3, &v47);
      if (v14
        || (v46 = 0, (int v14 = objc_msgSend(v42, "detectPoseForFace:inBuffer:yaw:", a3, &v46, x, y, v26, v27)) != 0)
        || (char v45 = 0,
            (int v14 = -[VCPCNNGazeAnalysis detectEyeOpennessForFace:inBuffer:eyeOpenness:](v41, "detectEyeOpennessForFace:inBuffer:eyeOpenness:", a3, &v45, x, y, v26, v27)) != 0))
      {

LABEL_27:
        int v15 = 6;
        goto LABEL_28;
      }
      if (v45) {
        uint64_t v28 = 2 * v47;
      }
      else {
        uint64_t v28 = (2 * v47) | 4;
      }
      v29 = objc_msgSend(v21, "objectForKeyedSubscript:", @"attributes", v35, context);
      v30 = (void *)[v29 mutableCopy];

      v31 = [NSNumber numberWithInteger:v46];
      [v30 setObject:v31 forKey:@"facePoseYaw"];

      v56[0] = @"flags";
      v32 = [NSNumber numberWithUnsignedLongLong:v28];
      v56[1] = @"attributes";
      v57[0] = v32;
      v57[1] = v30;
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
      [v40 addObject:v33];

      *a4 |= v28;
    }
    uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    int v15 = 0;
    int v14 = 0;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_28:

LABEL_29:
  if (!v15 && [v40 count])
  {
    *a4 |= 0x20uLL;
    v54 = @"FaceResults";
    v55 = v40;
    id *v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  }

LABEL_33:
  return v14;
}

- (void).cxx_destruct
{
}

@end