@interface VCPCaptureAnalysisSession
+ (id)aggregateAnalysisForTypes:(unint64_t)a3 withFramesMeta:(id)a4 properties:(id)a5;
+ (id)analyzerForAnalysisTypes:(unint64_t)a3 withPreferredTransform:(CGAffineTransform *)a4 properties:(id)a5;
- (BOOL)finalizeAnalysis;
- (BOOL)shouldCutAt:(id *)a3 stillPTS:(id *)a4 withCut:(BOOL)a5;
- (BOOL)updatePreferredTransform:(const CGAffineTransform *)a3 properties:(id)a4;
- (CGAffineTransform)flipTransform:(SEL)a3;
- (CGAffineTransform)transformForAngle:(SEL)a3 pixelBuffer:(int)a4;
- (NSDictionary)aggregatedResults;
- (VCPCaptureAnalysisSession)init;
- (VCPCaptureAnalysisSession)initWithAnalysisTypes:(unint64_t)a3 withPreferredTransform:(CGAffineTransform *)a4 withFocalLengthInPixels:(float)a5 withAnalysisQueue:(id)a6 withTurbo:(BOOL)a7;
- (double)rotateTransform:(uint64_t)a3 byAngle:(int)a4;
- (id)analyzePixelBuffer:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 properties:(id)a6 error:(id *)a7;
- (int)analyzeAudioBuffer:(opaqueCMSampleBuffer *)a3;
- (int)analyzeFrameWithTimeRange:(id *)a3 analysisData:(id)a4;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 properties:(id)a6 completion:(id)a7;
- (int)prewarmWithProperties:(id)a3;
- (void)dealloc;
@end

@implementation VCPCaptureAnalysisSession

+ (id)analyzerForAnalysisTypes:(unint64_t)a3 withPreferredTransform:(CGAffineTransform *)a4 properties:(id)a5
{
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = [v8 objectForKeyedSubscript:@"focalLengthInPixels"];
    v11 = v10;
    if (v10)
    {
      [v10 floatValue];
      float v13 = fmaxf(v12, 1.0);
    }
    else
    {
      float v13 = 1000.0;
    }
    v15 = [v9 objectForKeyedSubscript:@"dispatchQueue"];
    v16 = [v9 objectForKeyedSubscript:@"turboMode"];
    v17 = v16;
    if (v16) {
      uint64_t v14 = [v16 BOOLValue];
    }
    else {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
    v15 = 0;
    float v13 = 1000.0;
  }
  id v18 = objc_alloc((Class)a1);
  long long v19 = *(_OWORD *)&a4->c;
  v22[0] = *(_OWORD *)&a4->a;
  v22[1] = v19;
  long long v23 = *(_OWORD *)&a4->tx;
  v20 = objc_msgSend(v18, "initWithAnalysisTypes:withPreferredTransform:withFocalLengthInPixels:withAnalysisQueue:withTurbo:", a3, v22, v15, v14, COERCE_DOUBLE(__PAIR64__(DWORD1(v23), LODWORD(v13))));

  return v20;
}

- (VCPCaptureAnalysisSession)initWithAnalysisTypes:(unint64_t)a3 withPreferredTransform:(CGAffineTransform *)a4 withFocalLengthInPixels:(float)a5 withAnalysisQueue:(id)a6 withTurbo:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a6;
  v61.receiver = self;
  v61.super_class = (Class)VCPCaptureAnalysisSession;
  uint64_t v14 = [(VCPCaptureAnalysisSession *)&v61 init];
  v15 = v14;
  if (!v14
    || (v14->_unint64_t analysisTypes = a3,
        v14->_focalLengthInPixels = a5,
        p_analysisQueue = &v14->_analysisQueue,
        objc_storeStrong((id *)&v14->_analysisQueue, a6),
        v15->_preWarmed = 0,
        a3 != 4)
    && v15->_analysisQueue)
  {
    v17 = 0;
    goto LABEL_5;
  }
  uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
  aggregatedResults = v15->_aggregatedResults;
  v15->_aggregatedResults = (NSMutableDictionary *)v20;

  if ((a3 & 0x20) == 0) {
    goto LABEL_36;
  }
  v22 = [VCPVideoFullFaceDetector alloc];
  long long v23 = *(_OWORD *)&a4->c;
  v60[0] = *(_OWORD *)&a4->a;
  v60[1] = v23;
  v60[2] = *(_OWORD *)&a4->tx;
  uint64_t v24 = [(VCPVideoFullFaceDetector *)v22 initWithTransform:v60];
  faceDetector = v15->_faceDetector;
  v15->_faceDetector = (VCPVideoFullFaceDetector *)v24;

  v17 = v15->_faceDetector;
  if (v17)
  {
LABEL_36:
    if ((a3 & 0x200) == 0
      || (v26 = [[VCPImageBlurAnalyzer alloc] initWithFaceResults:0 sdof:0], blurAnalyzer = v15->_blurAnalyzer, v15->_blurAnalyzer = v26, blurAnalyzer, (v17 = v15->_blurAnalyzer) != 0))
    {
      if ((a3 & 0x40) == 0
        || (v28 = [[VCPAudioAnalyzer alloc] initWithAnalysisTypes:16 forStreaming:1], audioAnalyzer = v15->_audioAnalyzer, v15->_audioAnalyzer = v28, audioAnalyzer, (v17 = v15->_audioAnalyzer) != 0))
      {
        unint64_t analysisTypes = v15->_analysisTypes;
        if ((analysisTypes & 0x802) != 0)
        {
          v31 = [VCPVideoFaceMeshAnalyzer alloc];
          *(float *)&double v32 = v15->_focalLengthInPixels;
          uint64_t v33 = [(VCPVideoFaceMeshAnalyzer *)v31 initWithFocalLengthInPixels:0 offline:1 isFastMode:v32];
          meshAnalyzer = v15->_meshAnalyzer;
          v15->_meshAnalyzer = (VCPVideoFaceMeshAnalyzer *)v33;

          v17 = v15->_meshAnalyzer;
          if (!v17) {
            goto LABEL_5;
          }
        }
        else if (analysisTypes)
        {
          v35 = [VCPVideoFacePoseAnalyzer alloc];
          *(float *)&double v36 = v15->_focalLengthInPixels;
          uint64_t v37 = [(VCPVideoFacePoseAnalyzer *)v35 initWithFocalLengthInPixels:v36];
          poseAnalyzer = v15->_poseAnalyzer;
          v15->_poseAnalyzer = (VCPVideoFacePoseAnalyzer *)v37;

          v17 = v15->_poseAnalyzer;
          if (!v17) {
            goto LABEL_5;
          }
        }
        unint64_t v39 = v15->_analysisTypes;
        if ((v39 & 0x2198) != 0)
        {
          v40 = [VCPFullVideoAnalyzer alloc];
          long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          v59[0] = *MEMORY[0x1E4F1DAB8];
          v59[1] = v41;
          v59[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          uint64_t v42 = [(VCPFullVideoAnalyzer *)v40 initWithTransform:v59];
          videoAnalysis = v15->_videoAnalysis;
          v15->_videoAnalysis = (VCPFullVideoAnalyzer *)v42;

          v17 = v15->_videoAnalysis;
          if (!v17) {
            goto LABEL_5;
          }
        }
        else if ((v39 & 4) != 0)
        {
          v46 = [[VCPLightMotionAnalyzer alloc] initWithQueue:*p_analysisQueue turbo:v7];
          lightMotionAnalyzer = v15->_lightMotionAnalyzer;
          v15->_lightMotionAnalyzer = v46;

          v17 = v15->_lightMotionAnalyzer;
          if (!v17) {
            goto LABEL_5;
          }
        }
        else if ((v39 & 0x4000) != 0)
        {
          v44 = objc_alloc_init(VCPHomeKitMotionAnalyzer);
          homeKitMotionAnalyzer = v15->_homeKitMotionAnalyzer;
          v15->_homeKitMotionAnalyzer = v44;

          v17 = v15->_homeKitMotionAnalyzer;
          if (!v17) {
            goto LABEL_5;
          }
        }
        if ((a3 & 0x400) != 0)
        {
          v48 = objc_alloc_init(VCPSceneChangeAnalyzer);
          sceneChangeAnalyzer = v15->_sceneChangeAnalyzer;
          v15->_sceneChangeAnalyzer = v48;
        }
        if ((a3 & 0x1000) != 0)
        {
          v50 = objc_alloc_init(VCPTrimAnalyzer);
          trimAnalyzer = v15->_trimAnalyzer;
          v15->_trimAnalyzer = v50;
        }
        long long v52 = *(_OWORD *)&a4->a;
        long long v53 = *(_OWORD *)&a4->tx;
        *(_OWORD *)&v15->_preferredTransform.c = *(_OWORD *)&a4->c;
        *(_OWORD *)&v15->_preferredTransform.tx = v53;
        *(_OWORD *)&v15->_preferredTransform.a = v52;
        v15->_rotationAngleForFacePose = 0;
        v15->_rotator = 0;
        v15->_rotatorForFacePose = 0;
        long long v54 = *(_OWORD *)&a4->c;
        v58[0] = *(_OWORD *)&a4->a;
        v58[1] = v54;
        v58[2] = *(_OWORD *)&a4->tx;
        int v55 = angleForTransform(v58);
        v15->_preferredAngle = v55;
        v17 = v15;
        if (v55)
        {
          v56 = (Rotator *)operator new(0x20uLL, MEMORY[0x1E4FBA2D0]);
          v57 = v56;
          if (v56)
          {
            ma::Rotator::Rotator((uint64_t)v56, v55);
            v17 = v15;
          }
          else
          {
            v17 = 0;
          }
          v15->_rotator = v57;
        }
      }
    }
  }
LABEL_5:
  id v18 = v17;

  return v18;
}

- (int)prewarmWithProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_preWarmed)
  {
    int v6 = 0;
  }
  else
  {
    BOOL v7 = [v4 objectForKeyedSubscript:@"frameWidth"];
    id v8 = v7;
    if (v7) {
      uint64_t v9 = [v7 intValue];
    }
    else {
      uint64_t v9 = 0;
    }
    v10 = [v5 objectForKeyedSubscript:@"frameHeight"];
    v11 = v10;
    if (v10 && (uint64_t v12 = [v10 intValue], v12) && v9)
    {
      lightMotionAnalyzer = self->_lightMotionAnalyzer;
      if (!lightMotionAnalyzer
        || (int v6 = [(VCPLightMotionAnalyzer *)lightMotionAnalyzer prewarmWithWidth:v9 height:v12]) == 0)
      {
        int v6 = 0;
        self->_preWarmed = 1;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        uint64_t v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEFAULT, "VCPCaptureAnalysis - missing resolution properties for prewarming", v16, 2u);
        }
      }
      int v6 = 0;
    }
  }
  return v6;
}

- (VCPCaptureAnalysisSession)init
{
  return 0;
}

- (BOOL)updatePreferredTransform:(const CGAffineTransform *)a3 properties:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    long long v7 = *(_OWORD *)&a3->c;
    v14[0] = *(_OWORD *)&a3->a;
    v14[1] = v7;
    v14[2] = *(_OWORD *)&a3->tx;
    self->_preferredAngle = angleForTransform(v14);
  }
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:@"focalLengthInPixels"];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 floatValue];
      *(float *)&double v10 = fmaxf(*(float *)&v10, 1.0);
      if (vabds_f32(*(float *)&v10, self->_focalLengthInPixels) > 1.0)
      {
        self->_focalLengthInPixels = *(float *)&v10;
        poseAnalyzer = self->_poseAnalyzer;
        if (!poseAnalyzer
          || -[VCPVideoFacePoseAnalyzer updateFocalLengthInPixels:](poseAnalyzer, "updateFocalLengthInPixels:"))
        {
          meshAnalyzer = self->_meshAnalyzer;
          if (meshAnalyzer)
          {
            *(float *)&double v10 = self->_focalLengthInPixels;
            [(VCPVideoFaceMeshAnalyzer *)meshAnalyzer updateFocalLengthInPixels:v10];
          }
        }
      }
    }
  }
  return 1;
}

+ (id)aggregateAnalysisForTypes:(unint64_t)a3 withFramesMeta:(id)a4 properties:(id)a5
{
  char v5 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v5)
  {
    +[VCPLightMotionAnalyzer autoLiveMotionScore:v6];
    double v10 = @"aggSubjectMotionScore";
    id v8 = objc_msgSend(NSNumber, "numberWithFloat:");
    v11[0] = v8;
    long long v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  rotator = self->_rotator;
  if (rotator)
  {
    ma::Rotator::~Rotator((ma::Rotator *)rotator);
    MEMORY[0x1C186C7D0]();
  }
  rotatorForFacePose = self->_rotatorForFacePose;
  if (rotatorForFacePose)
  {
    ma::Rotator::~Rotator((ma::Rotator *)rotatorForFacePose);
    MEMORY[0x1C186C7D0]();
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPCaptureAnalysisSession;
  [(VCPCaptureAnalysisSession *)&v5 dealloc];
}

- (CGAffineTransform)flipTransform:(SEL)a3
{
  if (a4->tx != 0.0) {
    a4->tx = 1.0;
  }
  if (a4->ty != 0.0) {
    a4->ty = 1.0;
  }
  long long v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  v6.b = 0.0;
  v6.c = 0.0;
  v6.a = 1.0;
  *(_OWORD *)&v6.d = xmmword_1BC280F00;
  v6.ty = 1.0;
  return CGAffineTransformConcat(retstr, &t1, &v6);
}

- (CGAffineTransform)transformForAngle:(SEL)a3 pixelBuffer:(int)a4
{
  uint64_t v6 = MEMORY[0x1E4F1DAB8];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  if (a5)
  {
    int Width = CVPixelBufferGetWidth(a5);
    self = (CGAffineTransform *)CVPixelBufferGetHeight(a5);
    switch(a4)
    {
      case 270:
        *(_OWORD *)&retstr->a = xmmword_1BC2810B0;
        retstr->d = 0.0;
        retstr->tx = 0.0;
        retstr->c = 1.0;
        retstr->ty = (double)Width;
        break;
      case 180:
        retstr->a = -1.0;
        retstr->b = 0.0;
        retstr->c = 0.0;
        retstr->d = -1.0;
        retstr->tx = (double)Width;
        retstr->ty = (double)(int)self;
        break;
      case 90:
        *(_OWORD *)&retstr->a = xmmword_1BC281930;
        *(_OWORD *)&retstr->c = xmmword_1BC280F00;
        retstr->tx = (double)(int)self;
        retstr->ty = 0.0;
        break;
    }
  }
  return self;
}

- (double)rotateTransform:(uint64_t)a3 byAngle:(int)a4
{
  switch(a4)
  {
    case 270:
      *(float *)&unint64_t v4 = -a1.f32[1];
      HIDWORD(v4) = a1.i32[0];
      a1.i64[0] = v4;
      break;
    case 180:
      a1.i64[0] = vnegq_f32(a1).u64[0];
      break;
    case 90:
      a1.i64[0] = __PAIR64__(-a1.f32[0], a1.u32[1]);
      break;
  }
  return *(double *)a1.i64;
}

- (id)analyzePixelBuffer:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 properties:(id)a6 error:(id *)a7
{
  v144[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [v11 removeObjectForKey:@"quality"];
  [v11 removeObjectForKey:@"subjectMotionScore"];
  [v11 removeObjectForKey:@"interestingnessScore"];
  [v11 removeObjectForKey:@"obstructionScore"];
  [v11 removeObjectForKey:@"trackingScore"];
  v141 = 0;
  v142 = 0;
  v112 = [MEMORY[0x1E4F1CA60] dictionary];
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v140 = 0;
  if (!a3)
  {
    v17 = 0;
    v16 = 0;
    v28 = 0;
    int v29 = -50;
    goto LABEL_86;
  }
  if (!v10)
  {
    unsigned int v108 = 0;
    v17 = 0;
    v16 = 0;
    goto LABEL_20;
  }
  v16 = [v10 objectForKeyedSubscript:@"faceBounds"];
  v17 = [v10 objectForKeyedSubscript:@"faceRollAngles"];
  if ([v16 count])
  {
    id v18 = [v16 objectAtIndexedSubscript:0];
    NSRect v146 = NSRectFromString(v18);
    double x = v146.origin.x;
    double y = v146.origin.y;
    double width = v146.size.width;
    double height = v146.size.height;
  }
  v147.origin.double x = x;
  v147.origin.double y = y;
  v147.size.double width = width;
  v147.size.double height = height;
  if (CGRectIsEmpty(v147) || ![v17 count])
  {
    unsigned int v108 = 0;
  }
  else
  {
    long long v19 = [v17 objectAtIndexedSubscript:0];
    int v20 = [v19 intValue];
    int v21 = ((v20 + 45) % 90 - v20 + 315) % 360;

    int rotationAngleForFacePose = self->_rotationAngleForFacePose;
    BOOL v23 = __OFSUB__(v21, rotationAngleForFacePose);
    int v24 = v21 - rotationAngleForFacePose;
    if (v24 < 0 != v23) {
      v24 += 360;
    }
    unsigned int v108 = v24;
    self->_int rotationAngleForFacePose = v21;
    if (v21)
    {
      rotatorForFacePose = self->_rotatorForFacePose;
      if (rotatorForFacePose)
      {
        if (v21 == rotatorForFacePose->var3) {
          goto LABEL_17;
        }
        ma::Rotator::~Rotator((ma::Rotator *)rotatorForFacePose);
        MEMORY[0x1C186C7D0]();
      }
      v26 = (Rotator *)operator new(0x20uLL, MEMORY[0x1E4FBA2D0]);
      if (!v26)
      {
        v28 = 0;
        self->_rotatorForFacePose = 0;
        int v29 = -108;
        goto LABEL_86;
      }
      v27 = v26;
      ma::Rotator::Rotator((uint64_t)v26, self->_rotationAngleForFacePose);
      self->_rotatorForFacePose = v27;
    }
  }
LABEL_17:
  uint64_t v30 = [v10 objectForKeyedSubscript:@"objects"];
  if (v30)
  {
    v28 = (void *)v30;
    objc_msgSend(v112, "setObject:forKeyedSubscript:");
    goto LABEL_21;
  }
LABEL_20:
  v28 = 0;
LABEL_21:
  rotator = self->_rotator;
  if (rotator)
  {
    int v29 = ma::Rotator::Rotate((ma::Rotator *)rotator, a3, (CFTypeRef *)&v142);
    if (v29) {
      goto LABEL_86;
    }
  }
  else
  {
    v142 = (__CVBuffer *)CFRetain(a3);
  }
  if (!self->_rotationAngleForFacePose)
  {
    v34 = (__CVBuffer *)CFRetain(a3);
    goto LABEL_31;
  }
  double v32 = self->_rotatorForFacePose;
  if (!v32) {
    goto LABEL_85;
  }
  uint64_t v33 = self->_rotator;
  if (v33 && v32->var3 == v33->var3)
  {
    v34 = (__CVBuffer *)CFRetain(v142);
LABEL_31:
    v141 = v34;
    goto LABEL_32;
  }
  int v29 = ma::Rotator::Rotate((ma::Rotator *)v32, a3, (CFTypeRef *)&v141);
  if (v29) {
    goto LABEL_86;
  }
LABEL_32:
  videoAnalysis = self->_videoAnalysis;
  if (!videoAnalysis)
  {
    lightMotionAnalyzer = self->_lightMotionAnalyzer;
    if (!lightMotionAnalyzer) {
      goto LABEL_52;
    }
    long long v134 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    long long v132 = *(_OWORD *)&a5->var0;
    int64_t v133 = a5->var3;
    int v29 = [(VCPLightMotionAnalyzer *)lightMotionAnalyzer analyzeFrame:v142 withTimestamp:&v134 andDuration:&v132 flags:&v140];
    if (v29) {
      goto LABEL_86;
    }
    v56 = NSNumber;
    [(VCPLightMotionAnalyzer *)self->_lightMotionAnalyzer actionScore];
    v57 = objc_msgSend(v56, "numberWithFloat:");
    [v11 setObject:v57 forKeyedSubscript:@"subjectMotionScore"];

    v58 = NSNumber;
    [(VCPLightMotionAnalyzer *)self->_lightMotionAnalyzer motionDivScore];
    long long v54 = objc_msgSend(v58, "numberWithFloat:");
    [v11 setObject:v54 forKeyedSubscript:@"motionDivScore"];
    goto LABEL_51;
  }
  long long v138 = *(_OWORD *)&a4->var0;
  int64_t v139 = a4->var3;
  long long v136 = *(_OWORD *)&a5->var0;
  int64_t v137 = a5->var3;
  int v29 = [(VCPFullVideoAnalyzer *)videoAnalysis analyzeFrame:v142 timestamp:&v138 duration:&v136 properties:v112 frameStats:0 flags:&v140 cancel:&__block_literal_global_61];
  if (v29) {
    goto LABEL_86;
  }
  unint64_t analysisTypes = self->_analysisTypes;
  if ((analysisTypes & 8) != 0)
  {
    uint64_t v37 = NSNumber;
    [(VCPFullVideoAnalyzer *)self->_videoAnalysis qualityScore];
    v38 = objc_msgSend(v37, "numberWithFloat:");
    [v11 setObject:v38 forKeyedSubscript:@"quality"];

    unint64_t analysisTypes = self->_analysisTypes;
  }
  if ((analysisTypes & 0x2004) != 0)
  {
    unint64_t v39 = NSNumber;
    [(VCPFullVideoAnalyzer *)self->_videoAnalysis actionScore];
    v40 = objc_msgSend(v39, "numberWithFloat:");
    [v11 setObject:v40 forKeyedSubscript:@"subjectMotionScore"];

    long long v41 = [(VCPFullVideoAnalyzer *)self->_videoAnalysis objectsMotion];
    if (v41)
    {
      uint64_t v42 = [(VCPFullVideoAnalyzer *)self->_videoAnalysis globalMotion];
      BOOL v43 = v42 == 0;

      if (!v43)
      {
        v44 = [(VCPFullVideoAnalyzer *)self->_videoAnalysis objectsMotion];
        v45 = (void *)[v44 copy];
        [v11 setObject:v45 forKeyedSubscript:@"objectsMotion"];

        v46 = [(VCPFullVideoAnalyzer *)self->_videoAnalysis globalMotion];
        v47 = (void *)[v46 copy];
        [v11 setObject:v47 forKeyedSubscript:@"globalMotion"];
      }
    }
  }
  unint64_t v48 = self->_analysisTypes;
  if ((v48 & 0x10) != 0)
  {
    v49 = NSNumber;
    [(VCPFullVideoAnalyzer *)self->_videoAnalysis interestingnessScore];
    v50 = objc_msgSend(v49, "numberWithFloat:");
    [v11 setObject:v50 forKeyedSubscript:@"interestingnessScore"];

    unint64_t v48 = self->_analysisTypes;
  }
  if ((v48 & 0x80) != 0)
  {
    v51 = NSNumber;
    [(VCPFullVideoAnalyzer *)self->_videoAnalysis obstructionScore];
    long long v52 = objc_msgSend(v51, "numberWithFloat:");
    [v11 setObject:v52 forKeyedSubscript:@"obstructionScore"];

    unint64_t v48 = self->_analysisTypes;
  }
  if ((v48 & 0x100) != 0)
  {
    long long v53 = NSNumber;
    [(VCPFullVideoAnalyzer *)self->_videoAnalysis trackingScore];
    long long v54 = objc_msgSend(v53, "numberWithFloat:");
    [v11 setObject:v54 forKeyedSubscript:@"trackingScore"];
LABEL_51:
  }
LABEL_52:
  faceDetector = self->_faceDetector;
  if (faceDetector)
  {
    long long v130 = *(_OWORD *)&a4->var0;
    int64_t v131 = a4->var3;
    long long v128 = *(_OWORD *)&a5->var0;
    int64_t v129 = a5->var3;
    int v29 = [(VCPVideoAnalyzer *)faceDetector analyzeFrame:v142 withTimestamp:&v130 andDuration:&v128 flags:&v140];
    if (v29) {
      goto LABEL_86;
    }
    v60 = [(VCPVideoFullFaceDetector *)self->_faceDetector frameFaceResults];
    [v11 addEntriesFromDictionary:v60];
  }
  blurAnalyzer = self->_blurAnalyzer;
  if (blurAnalyzer)
  {
    id v127 = 0;
    int v29 = [(VCPImageBlurAnalyzer *)blurAnalyzer analyzePixelBuffer:v142 flags:&v140 results:&v127 cancel:&__block_literal_global_543_0];
    id v62 = v127;
    id v63 = v62;
    if (v29)
    {

      goto LABEL_86;
    }
    v64 = objc_msgSend(v62, "objectForKeyedSubscript:");
    v106 = v63;
    BOOL v65 = [v64 count] == 0;

    if (!v65)
    {
      v104 = [v106 objectForKeyedSubscript:@"BlurResults"];
      v102 = [v104 objectAtIndexedSubscript:0];
      v66 = [v102 objectForKeyedSubscript:@"attributes"];
      v67 = [v66 objectForKeyedSubscript:@"sharpness"];

      [v11 setObject:v67 forKeyedSubscript:@"sharpnessScore"];
    }
  }
  if (self->_poseAnalyzer || self->_meshAnalyzer)
  {
    [(VCPCaptureAnalysisSession *)self transformForAngle:self->_rotationAngleForFacePose pixelBuffer:a3];
    [(VCPCaptureAnalysisSession *)self flipTransform:v125];
    v148.origin.double x = x;
    v148.origin.double y = y;
    v148.size.double width = width;
    v148.size.double height = height;
    CGRect v149 = CGRectApplyAffineTransform(v148, &v126);
    double x = v149.origin.x;
    double y = v149.origin.y;
    double width = v149.size.width;
    double height = v149.size.height;
    uint64_t v68 = ((self->_preferredAngle - self->_rotationAngleForFacePose + 360) % 360);
    if (self->_poseAnalyzer && !CGRectIsEmpty(v149))
    {
      poseAnalyzer = self->_poseAnalyzer;
      long long v123 = *(_OWORD *)&a4->var0;
      int64_t v124 = a4->var3;
      int v29 = -[VCPVideoFacePoseAnalyzer analyzeFrameForPose:withFaceRect:withTimestamp:](poseAnalyzer, "analyzeFrameForPose:withFaceRect:withTimestamp:", v141, &v123, x, y, width, height);
      if (v29) {
        goto LABEL_86;
      }
      [(VCPVideoFacePoseAnalyzer *)self->_poseAnalyzer pose];
      -[VCPCaptureAnalysisSession rotateTransform:byAngle:](self, "rotateTransform:byAngle:", v68);
      v74 = -[VCPFaceAnchor initWithTransform:blendShapes:geometry:]([VCPFaceAnchor alloc], "initWithTransform:blendShapes:geometry:", 0, 0, v70, v71, v72, v73);
      v75 = v74;
      if (!v74) {
        goto LABEL_85;
      }
      v144[0] = v74;
      v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:1];
      [v11 setObject:v76 forKeyedSubscript:@"faceAnchor"];
    }
  }
  else
  {
    uint64_t v68 = 0;
  }
  meshAnalyzer = self->_meshAnalyzer;
  if (!meshAnalyzer) {
    goto LABEL_76;
  }
  long long v121 = *(_OWORD *)&a4->var0;
  int64_t v122 = a4->var3;
  int v29 = -[VCPVideoFaceMeshAnalyzer analyzeFrame:withFaceRect:withRotation:withTimestamp:](meshAnalyzer, "analyzeFrame:withFaceRect:withRotation:withTimestamp:", v141, v108, &v121, x, y, width, height);
  if (v29) {
    goto LABEL_86;
  }
  if (![(VCPVideoFaceMeshAnalyzer *)self->_meshAnalyzer isTracked]) {
    goto LABEL_76;
  }
  v78 = [[VCPFaceGeometry alloc] initWithVertices:[(VCPVideoFaceMeshAnalyzer *)self->_meshAnalyzer vertices] vertexCount:[(VCPVideoFaceMeshAnalyzer *)self->_meshAnalyzer vertexCount]];
  if (!v78)
  {
LABEL_85:
    int v29 = -18;
    goto LABEL_86;
  }
  v109 = v78;
  [(VCPVideoFaceMeshAnalyzer *)self->_meshAnalyzer pose];
  -[VCPCaptureAnalysisSession rotateTransform:byAngle:](self, "rotateTransform:byAngle:", v68);
  double v105 = v80;
  double v107 = v79;
  double v101 = v82;
  double v103 = v81;
  v83 = [VCPFaceAnchor alloc];
  v84 = [(VCPVideoFaceMeshAnalyzer *)self->_meshAnalyzer blendShapes];
  v85 = -[VCPFaceAnchor initWithTransform:blendShapes:geometry:](v83, "initWithTransform:blendShapes:geometry:", v84, v109, v107, v105, v103, v101);

  if (!v85)
  {

    goto LABEL_85;
  }
  v143 = v85;
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:1];
  [v11 setObject:v86 forKeyedSubscript:@"faceAnchor"];

LABEL_76:
  sceneChangeAnalyzer = self->_sceneChangeAnalyzer;
  if (sceneChangeAnalyzer)
  {
    long long v119 = *(_OWORD *)&a4->var0;
    int64_t v120 = a4->var3;
    long long v117 = *(_OWORD *)&a5->var0;
    int64_t v118 = a5->var3;
    int v29 = [(VCPSceneChangeAnalyzer *)sceneChangeAnalyzer analyzeFrame:v142 withTimestamp:&v119 andDuration:&v117 flags:&v140];
    if (v29) {
      goto LABEL_86;
    }
    v88 = objc_msgSend(NSNumber, "numberWithBool:", -[VCPSceneChangeAnalyzer isSegmentPoint](self->_sceneChangeAnalyzer, "isSegmentPoint"));
    [v11 setObject:v88 forKeyedSubscript:@"sceneChangeScore"];
  }
  homeKitMotionAnalyzer = self->_homeKitMotionAnalyzer;
  if (homeKitMotionAnalyzer)
  {
    long long v115 = *(_OWORD *)&a4->var0;
    int64_t v116 = a4->var3;
    long long v113 = *(_OWORD *)&a5->var0;
    int64_t v114 = a5->var3;
    int v29 = [(VCPHomeKitMotionAnalyzer *)homeKitMotionAnalyzer analyzeFrame:v142 withTimestamp:&v115 andDuration:&v113 flags:&v140];
    if (v29) {
      goto LABEL_86;
    }
    v90 = NSNumber;
    [(VCPHomeKitMotionAnalyzer *)self->_homeKitMotionAnalyzer actionScore];
    v91 = objc_msgSend(v90, "numberWithFloat:");
    [v11 setObject:v91 forKeyedSubscript:@"subjectMotionScore"];

    v92 = [(VCPHomeKitMotionAnalyzer *)self->_homeKitMotionAnalyzer regionsOfInterest];
    BOOL v93 = [v92 count] == 0;

    if (!v93)
    {
      v94 = (void *)MEMORY[0x1E4F1C978];
      v95 = [(VCPHomeKitMotionAnalyzer *)self->_homeKitMotionAnalyzer regionsOfInterest];
      v96 = [v94 arrayWithArray:v95];
      [v11 setObject:v96 forKeyedSubscript:@"regionsOfInterest"];
    }
  }
  v97 = [NSNumber numberWithUnsignedLongLong:v140];
  [v11 setObject:v97 forKey:@"flags"];

  int v29 = 0;
LABEL_86:
  if (v142) {
    CFRelease(v142);
  }
  if (v141) {
    CFRelease(v141);
  }
  if (a7 && v29)
  {
    *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCPCaptureAnalysis" code:v29 userInfo:0];
  }
  if (v29) {
    v98 = 0;
  }
  else {
    v98 = v11;
  }
  id v99 = v98;

  return v99;
}

uint64_t __91__VCPCaptureAnalysisSession_analyzePixelBuffer_withTimestamp_andDuration_properties_error___block_invoke()
{
  return 0;
}

uint64_t __91__VCPCaptureAnalysisSession_analyzePixelBuffer_withTimestamp_andDuration_properties_error___block_invoke_2()
{
  return 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 properties:(id)a6 completion:(id)a7
{
  id v11 = a7;
  uint64_t v12 = v11;
  if (self->_analysisQueue && (lightMotionAnalyzer = self->_lightMotionAnalyzer) != 0)
  {
    long long v20 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    long long v18 = *(_OWORD *)&a5->var0;
    int64_t v19 = a5->var3;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96__VCPCaptureAnalysisSession_analyzePixelBuffer_withTimestamp_andDuration_properties_completion___block_invoke;
    v16[3] = &unk_1E629B9A8;
    id v17 = v11;
    [(VCPLightMotionAnalyzer *)lightMotionAnalyzer analyzeFrame:a3 withTimestamp:&v20 andDuration:&v18 completion:v16];

    int v14 = 0;
  }
  else
  {
    int v14 = -18;
  }

  return v14;
}

void __96__VCPCaptureAnalysisSession_analyzePixelBuffer_withTimestamp_andDuration_properties_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, float a4, float a5)
{
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v10 = a4;
  id v11 = [NSNumber numberWithFloat:v10];
  [v16 setObject:v11 forKeyedSubscript:@"subjectMotionScore"];

  *(float *)&double v12 = a5;
  id v13 = [NSNumber numberWithFloat:v12];
  [v16 setObject:v13 forKeyedSubscript:@"motionDivScore"];

  int v14 = [NSNumber numberWithUnsignedLongLong:a2];
  [v16 setObject:v14 forKeyedSubscript:@"flags"];

  if (a3)
  {
    v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:a3 userInfo:0];
  }
  else
  {
    v15 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)analyzeAudioBuffer:(opaqueCMSampleBuffer *)a3
{
  int result = -18;
  if (a3 && self->_audioAnalyzer)
  {
    [(NSMutableDictionary *)self->_aggregatedResults removeObjectForKey:@"VoiceResults"];
    audioAnalyzer = self->_audioAnalyzer;
    if (audioAnalyzer)
    {
      int result = [(VCPAudioAnalyzer *)audioAnalyzer analyzeSampleBuffer:a3];
      if (result) {
        return result;
      }
      audioAnalyzer = self->_audioAnalyzer;
    }
    long long v7 = [(VCPAudioAnalyzer *)audioAnalyzer voiceDetections];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [(VCPAudioAnalyzer *)self->_audioAnalyzer voiceDetections];
      [(NSMutableDictionary *)self->_aggregatedResults setObject:v9 forKeyedSubscript:@"VoiceResults"];
    }
    return 0;
  }
  return result;
}

- (BOOL)finalizeAnalysis
{
  sceneChangeAnalyzer = self->_sceneChangeAnalyzer;
  if (!sceneChangeAnalyzer
    || (long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16),
        v9[0] = *MEMORY[0x1E4F1FA20],
        v9[1] = v4,
        v9[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32),
        LODWORD(faceDetector) = [(VCPVideoAnalyzer *)sceneChangeAnalyzer finishAnalysisPass:v9],
        !faceDetector))
  {
    faceDetector = self->_faceDetector;
    if (faceDetector)
    {
      long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
      v8[0] = *MEMORY[0x1E4F1FA30];
      v8[1] = v6;
      v8[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
      LODWORD(faceDetector) = [(VCPVideoFullFaceDetector *)faceDetector finishAnalysisPass:v8];
    }
  }
  return faceDetector == 0;
}

- (NSDictionary)aggregatedResults
{
  sceneChangeAnalyzer = self->_sceneChangeAnalyzer;
  if (sceneChangeAnalyzer)
  {
    aggregatedResults = self->_aggregatedResults;
    objc_super v5 = [(VCPSceneChangeAnalyzer *)sceneChangeAnalyzer results];
    [(NSMutableDictionary *)aggregatedResults addEntriesFromDictionary:v5];
  }
  faceDetector = self->_faceDetector;
  if (faceDetector)
  {
    long long v7 = self->_aggregatedResults;
    uint64_t v8 = [(VCPVideoFaceDetector *)faceDetector results];
    [(NSMutableDictionary *)v7 addEntriesFromDictionary:v8];
  }
  uint64_t v9 = self->_aggregatedResults;
  return (NSDictionary *)v9;
}

- (int)analyzeFrameWithTimeRange:(id *)a3 analysisData:(id)a4
{
  id v6 = a4;
  trimAnalyzer = self->_trimAnalyzer;
  if (trimAnalyzer)
  {
    long long v8 = *(_OWORD *)&a3->var0.var3;
    v11[0] = *(_OWORD *)&a3->var0.var0;
    v11[1] = v8;
    void v11[2] = *(_OWORD *)&a3->var1.var1;
    int v9 = [(VCPTrimAnalyzer *)trimAnalyzer analyzeFrameWithTimeRange:v11 analysisData:v6];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (BOOL)shouldCutAt:(id *)a3 stillPTS:(id *)a4 withCut:(BOOL)a5
{
  trimAnalyzer = self->_trimAnalyzer;
  if (trimAnalyzer)
  {
    BOOL v7 = a5;
    LODWORD(trimAnalyzer) = [(VCPTrimAnalyzer *)trimAnalyzer isReady];
    if (trimAnalyzer)
    {
      double v10 = self->_trimAnalyzer;
      long long v14 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      long long v12 = *(_OWORD *)&a4->var0;
      int64_t v13 = a4->var3;
      LOBYTE(trimAnalyzer) = [(VCPTrimAnalyzer *)v10 shouldCutAt:&v14 stillPTS:&v12 withCut:v7];
    }
  }
  return (char)trimAnalyzer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisQueue, 0);
  objc_storeStrong((id *)&self->_aggregatedResults, 0);
  objc_storeStrong((id *)&self->_homeKitMotionAnalyzer, 0);
  objc_storeStrong((id *)&self->_trimAnalyzer, 0);
  objc_storeStrong((id *)&self->_lightMotionAnalyzer, 0);
  objc_storeStrong((id *)&self->_sceneChangeAnalyzer, 0);
  objc_storeStrong((id *)&self->_faceDetector, 0);
  objc_storeStrong((id *)&self->_audioAnalyzer, 0);
  objc_storeStrong((id *)&self->_blurAnalyzer, 0);
  objc_storeStrong((id *)&self->_videoAnalysis, 0);
  objc_storeStrong((id *)&self->_meshAnalyzer, 0);
  objc_storeStrong((id *)&self->_poseAnalyzer, 0);
}

@end