@interface VCPImageHandsAnalyzer
+ (float)getExtendRatio;
+ (float)getInsetForRejectingHands;
- (BOOL)keypointsOutsideInset:(CGPoint)a3[21] handRegion:(id)a4;
- (BOOL)optimizeForDistance;
- (NSArray)handObjects;
- (VCPImageHandsAnalyzer)init;
- (VCPImageHandsAnalyzer)initWithKeypointsOption:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 enableHandDetection:(BOOL)a6 enableANSTHandDetection:(BOOL)a7 enableRejectHandsNearBoundaries:(BOOL)a8 enableHandObject:(BOOL)a9 sourceWidth:(int)a10 sourceHeight:(int)a11 modelName:(id)a12 revision:(int)a13 options:(id)a14;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 rotationInDegrees:(id)a4 flags:(unint64_t *)a5 results:(id *)a6 cancel:(id)a7;
- (int)configForAspectRatio:(id)a3;
- (int)convertSingleResultToDict:(CGPoint)a3[21] keypointConfidence:(float *)a4 box:(id)a5 handHoldsObjectConfidence:(float)a6 results:(id)a7;
- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5;
- (int)updateMaxNumHands:(id)a3;
- (int)updateModelForSourceWidth:(int)a3 sourceHeight:(int)a4;
- (int64_t)getClosestAspectRatio:(id)a3;
- (void)setHandObjects:(id)a3;
- (void)setOptimizeForDistance:(BOOL)a3;
@end

@implementation VCPImageHandsAnalyzer

- (VCPImageHandsAnalyzer)init
{
  return 0;
}

- (VCPImageHandsAnalyzer)initWithKeypointsOption:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 enableHandDetection:(BOOL)a6 enableANSTHandDetection:(BOOL)a7 enableRejectHandsNearBoundaries:(BOOL)a8 enableHandObject:(BOOL)a9 sourceWidth:(int)a10 sourceHeight:(int)a11 modelName:(id)a12 revision:(int)a13 options:(id)a14
{
  BOOL v43 = a7;
  BOOL v44 = a4;
  BOOL v15 = a6;
  BOOL v45 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v18 = a12;
  id v19 = a14;
  v46.receiver = self;
  v46.super_class = (Class)VCPImageHandsAnalyzer;
  v20 = [(VCPImageHandsAnalyzer *)&v46 init];
  v21 = v20;
  if (v20)
  {
    resConfig = v20->_resConfig;
    v20->_resConfig = (NSString *)@"res_384x384";

    v21->_inputWidth = 720;
    v21->_inputHeight = 720;
    v21->_int sourceWidth = a10;
    v21->_int sourceHeight = a11;
    v21->_optimizeForDistance = 0;
    v21->_enableRejectHandsNearBoundaries = a8;
    [(id)objc_opt_class() getInsetForRejectingHands];
    v21->_inset = *(float *)&v23;
    int sourceWidth = v21->_sourceWidth;
    if (sourceWidth >= 1
      && (int sourceHeight = v21->_sourceHeight, sourceHeight >= 1)
      && (*(float *)&double v23 = (float)sourceWidth / (float)sourceHeight,
          [NSNumber numberWithFloat:v23],
          (v26 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          [v26 floatValue];
          *(_DWORD *)buf = 134217984;
          double v48 = v28;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: input image aspectRatio = %f", buf, 0xCu);
        }
      }
      if ([(VCPImageHandsAnalyzer *)v21 configForAspectRatio:v26])
      {
        v29 = 0;
LABEL_25:
        v36 = v29;

        goto LABEL_26;
      }
      v30 = v26;
    }
    else
    {
      v30 = 0;
    }
    if (a3 >= 6) {
      int v31 = 6;
    }
    else {
      int v31 = a3;
    }
    if (v31 <= 1) {
      int v31 = 1;
    }
    v21->_maxNumRegions = v31;
    [(id)objc_opt_class() getExtendRatio];
    v21->_extendRatio = v32;
    if (v15)
    {
      if (v43 && DeviceHasANE())
      {
        *(float *)&double v33 = v21->_extendRatio;
        uint64_t v34 = +[VCPANSTHandsDetector anstHandsDetectorWithExtendRatio:v19 options:v33];
        uint64_t v35 = 64;
      }
      else
      {
        uint64_t v34 = +[VCPCNNHandsDetector detector:v21->_maxNumRegions forceCPU:v44 sharedModel:v45 inputConfig:v21->_resConfig revision:a13];
        uint64_t v35 = 80;
      }
      v37 = *(Class *)((char *)&v21->super.super.isa + v35);
      *(Class *)((char *)&v21->super.super.isa + v35) = (Class)v34;
    }
    uint64_t v38 = +[VCPCNNHandKeypointsDetector detector:v44 sharedModel:v45 modelName:v18 enableHandObject:a9 options:v19];
    handsKeypointsDetector = v21->_handsKeypointsDetector;
    v21->_handsKeypointsDetector = (VCPCNNHandKeypointsDetector *)v38;

    uint64_t v40 = [MEMORY[0x1E4F1CA48] array];
    results = v21->_results;
    v21->_results = (NSMutableArray *)v40;

    v26 = v30;
    v29 = v21;
    goto LABEL_25;
  }
  v36 = 0;
LABEL_26:

  return v36;
}

- (int64_t)getClosestAspectRatio:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_msgSend(&unk_1F15EE538, "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(&unk_1F15EE538, "count"), 1280, &__block_literal_global_55);
  uint64_t v5 = [&unk_1F15EE538 count];
  if (v4 >= v5 - 1) {
    unint64_t v4 = v5 - 1;
  }

  return v4;
}

uint64_t __47__VCPImageHandsAnalyzer_getClosestAspectRatio___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int)configForAspectRatio:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = NSNumber;
    [v4 floatValue];
    float v8 = v7;
    [v5 floatValue];
    *(float *)&double v9 = 1.0 / *(float *)&v9;
    if (v8 >= *(float *)&v9) {
      *(float *)&double v9 = v8;
    }
    v10 = [v6 numberWithFloat:v9];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)uint64_t v34 = v5;
        *(_WORD *)&v34[8] = 2112;
        uint64_t v35 = v10;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: aspectRatio = %@, queryAspectRatioVal = %@", buf, 0x16u);
      }
    }
    int v12 = [(VCPImageHandsAnalyzer *)self getClosestAspectRatio:v10];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)uint64_t v34 = v12;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: feasibleShapeIndex = %d", buf, 8u);
      }
    }
    [v5 floatValue];
    BOOL v15 = (float *)((char *)&kFeasibleInputShape + 8 * v12);
    float v16 = *v15;
    float v17 = v15[1];
    if (*v15 >= v17) {
      float v18 = v15[1];
    }
    else {
      float v18 = *v15;
    }
    if (*v15 < v17) {
      float v16 = v15[1];
    }
    if (v14 <= 1.0) {
      float v19 = v18;
    }
    else {
      float v19 = v16;
    }
    if (v14 <= 1.0) {
      float v20 = v16;
    }
    else {
      float v20 = v18;
    }
    int v21 = (int)v20;
    int v22 = (int)v19;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v34 = (int)v20;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = (int)v19;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: detectorHeight = %d, detectorWidth = %d", buf, 0xEu);
      }
    }
    int sourceWidth = self->_sourceWidth;
    float v25 = 2.5;
    if (sourceWidth >= 1)
    {
      int sourceHeight = self->_sourceHeight;
      if (sourceHeight >= 1 && self->_optimizeForDistance) {
        float v25 = fmaxf(fminf((float)sourceWidth / (float)v22, (float)sourceHeight / (float)v21), 2.5);
      }
    }
    self->_int inputWidth = (int)(float)(v25 * (float)v22);
    self->_int inputHeight = (int)(float)(v25 * (float)v21);
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        int inputWidth = self->_inputWidth;
        int inputHeight = self->_inputHeight;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v34 = inputWidth;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = inputHeight;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: preferred source width = %d, preferred source height = %d", buf, 0xEu);
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"res_%dx%d", (int)v19, (int)v20);
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    resConfig = self->_resConfig;
    self->_resConfig = v30;
  }
  return 0;
}

- (int)updateMaxNumHands:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: maxNumHands from options = %@", (uint8_t *)&v10, 0xCu);
    }
  }
  if (v4)
  {
    int v6 = [v4 intValue];
    if (v6 >= 6) {
      int v7 = 6;
    }
    else {
      int v7 = v6;
    }
    if (v7 <= 1) {
      int v8 = 1;
    }
    else {
      int v8 = v7;
    }
    self->_maxNumRegions = v8;
    -[VCPCNNHandsDetector updateMaxNumRegions:](self->_handsDetector, "updateMaxNumRegions:");
  }

  return 0;
}

- (int)updateModelForSourceWidth:(int)a3 sourceHeight:(int)a4
{
  int v7 = self->_resConfig;
  self->_int sourceWidth = a3;
  self->_int sourceHeight = a4;
  int v9 = -50;
  if (a3 >= 1 && a4 >= 1)
  {
    *(float *)&double v8 = (float)a3 / (float)a4;
    int v10 = [NSNumber numberWithFloat:v8];
    int v9 = [(VCPImageHandsAnalyzer *)self configForAspectRatio:v10];

    if (!v9)
    {
      if (v7 != self->_resConfig)
      {
        handsDetector = self->_handsDetector;
        if (handsDetector) {
          -[VCPCNNHandsDetector updateModelWithResConfig:](handsDetector, "updateModelWithResConfig:");
        }
      }
      int v9 = 0;
    }
  }

  return v9;
}

+ (float)getExtendRatio
{
  return 0.25;
}

+ (float)getInsetForRejectingHands
{
  return 0.08;
}

- (int)convertSingleResultToDict:(CGPoint)a3[21] keypointConfidence:(float *)a4 box:(id)a5 handHoldsObjectConfidence:(float)a6 results:(id)a7
{
  v80[6] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v71 = a7;
  v75 = [MEMORY[0x1E4F1CA48] array];
  v72 = [MEMORY[0x1E4F1CA48] array];
  v73 = [MEMORY[0x1E4F1CA60] dictionary];
  int v10 = NSNumber;
  [v9 minX];
  id v11 = objc_msgSend(v10, "numberWithFloat:");
  v80[0] = v11;
  uint64_t v12 = NSNumber;
  [v9 minY];
  v13 = objc_msgSend(v12, "numberWithFloat:");
  v80[1] = v13;
  float v14 = NSNumber;
  [v9 maxX];
  BOOL v15 = objc_msgSend(v14, "numberWithFloat:");
  v80[2] = v15;
  float v16 = NSNumber;
  [v9 maxY];
  float v17 = objc_msgSend(v16, "numberWithFloat:");
  v80[3] = v17;
  float v18 = NSNumber;
  [v9 confidence];
  float v19 = objc_msgSend(v18, "numberWithFloat:");
  v80[4] = v19;
  float v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "classIndex"));
  v80[5] = v20;
  int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:6];
  [v72 addObject:v21];

  [v9 minX];
  float v23 = v22;
  [v9 minY];
  float v25 = v24;
  [v9 maxX];
  float v27 = v26;
  [v9 minX];
  float v29 = v28;
  [v9 maxY];
  float v31 = v30;
  [v9 minY];
  uint64_t v32 = 0;
  double v68 = (float)(v27 - v29);
  double v69 = v23;
  double v66 = v25;
  double v67 = (float)(v31 - v33);
  p_y = &a3->y;
  do
  {
    objc_msgSend(v9, "maxX", *(void *)&v66, *(void *)&v67, *(void *)&v68, *(void *)&v69);
    float v36 = v35;
    [v9 minX];
    float v38 = v37;
    [v9 maxY];
    float v40 = v39;
    [v9 minY];
    float v42 = v41;
    if (*(p_y - 1) == 0.0 && (double v43 = *p_y, *p_y == 0.0))
    {
      v78[0] = &unk_1F15EAD18;
      v78[1] = &unk_1F15EAD18;
      *(float *)&double v43 = a4[v32];
      v51 = [NSNumber numberWithFloat:v43];
      v78[2] = v51;
      v53 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "classIndex"));
      v78[3] = v53;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:4];
      [v75 addObject:v55];
    }
    else
    {
      [v9 minX];
      float v45 = v44;
      double v46 = *(p_y - 1);
      [v9 minY];
      float v48 = v47;
      double v49 = v45 + v46 / 192.0 * (float)(v36 - v38);
      *(float *)&double v49 = v49;
      double v50 = *p_y;
      v51 = [NSNumber numberWithFloat:v49];
      double v52 = v48 + v50 / 192.0 * (float)(v40 - v42);
      *(float *)&double v52 = v52;
      *(float *)&double v52 = 1.0 - *(float *)&v52;
      v79[0] = v51;
      v53 = [NSNumber numberWithFloat:v52];
      v79[1] = v53;
      *(float *)&double v54 = a4[v32];
      v55 = [NSNumber numberWithFloat:v54];
      v79[2] = v55;
      v56 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "classIndex"));
      v79[3] = v56;
      v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:4];
      [v75 addObject:v57];
    }
    ++v32;
    p_y += 2;
  }
  while (v32 != 21);
  [v73 setObject:v75 forKeyedSubscript:@"handsKeypoints"];
  v58 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "trackID"));
  [v73 setObject:v58 forKeyedSubscript:@"handsTrackingID"];

  v59 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "groupID"));
  [v73 setObject:v59 forKeyedSubscript:@"handsGroupID"];

  v81.size.height = v67;
  v81.origin.y = 1.0 - v66 - v67;
  v81.size.width = v68;
  v81.origin.x = v69;
  v60 = NSStringFromRect(v81);
  [v73 setObject:v60 forKeyedSubscript:@"handsBounds"];

  LODWORD(v61) = 0.5;
  *(float *)&double v62 = a6;
  if (a6 > 0.5)
  {
    *(float *)&double v61 = a6;
    v63 = [NSNumber numberWithFloat:v61];
    [v73 setObject:v63 forKeyedSubscript:@"handsHoldObject"];
  }
  v76 = @"attributes";
  v77 = v73;
  v64 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1, v61, v62);
  [v71 addObject:v64];

  return 0;
}

- (BOOL)keypointsOutsideInset:(CGPoint)a3[21] handRegion:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      double inset = self->_inset;
      *(_DWORD *)buf = 134217984;
      double v57 = inset;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "VCPImageHandsAnalyzer - inset for rejecting hands near frame boundaries = %f", buf, 0xCu);
    }
  }
  [v6 maxX];
  float v10 = v9;
  [v6 minX];
  float v12 = v11;
  [v6 maxY];
  float v14 = v13;
  [v6 minY];
  float v16 = v15;
  [v6 minX];
  float v17 = v10 - v12;
  if (v18 == 0.0)
  {
    float v19 = self->_inset;
    if ((float)(v17 * 0.1) >= (float)(v17 - v19)) {
      float v20 = v17 * 0.1;
    }
    else {
      float v20 = v17 - v19;
    }
  }
  else
  {
    float v19 = 0.0;
    float v20 = v17;
  }
  [v6 maxX];
  if (v21 == 1.0)
  {
    if ((float)(v17 * 0.1) >= (float)(v20 - self->_inset)) {
      float v20 = v17 * 0.1;
    }
    else {
      float v20 = v20 - self->_inset;
    }
  }
  [v6 minY];
  float v23 = v14 - v16;
  float v24 = self->_inset;
  float v25 = (float)(v14 - v16) * 0.1;
  float v26 = v23 - v24;
  if (v25 >= (float)(v23 - v24)) {
    float v26 = v25;
  }
  if (v22 >= v24) {
    float v27 = 0.0;
  }
  else {
    float v27 = self->_inset;
  }
  if (v22 >= v24) {
    float v28 = v23;
  }
  else {
    float v28 = v26;
  }
  [v6 maxY];
  if (v29 == 1.0)
  {
    if (v25 >= (float)(v28 - self->_inset)) {
      float v28 = v25;
    }
    else {
      float v28 = v28 - self->_inset;
    }
  }
  [v6 minX];
  float v31 = v30;
  [v6 minY];
  uint64_t v32 = 0;
  unsigned int v33 = 0;
  double v54 = (float)(v27 + v34);
  double v55 = (float)(v19 + v31);
  double rect = v20;
  double v35 = v28;
  do
  {
    [v6 minX];
    float v37 = v36;
    double x = a3[v32].x;
    [v6 maxX];
    float v40 = v39;
    [v6 minX];
    float v42 = v41;
    [v6 minY];
    float v44 = v43;
    double y = a3[v32].y;
    [v6 maxY];
    float v47 = v46;
    [v6 minY];
    float v48 = v37 + x / 192.0 * (float)(v40 - v42);
    float v50 = v44 + y / 192.0 * (float)(v47 - v49);
    v59.double x = v48;
    v59.double y = v50;
    v60.origin.double y = v54;
    v60.origin.double x = v55;
    v60.size.width = rect;
    v60.size.height = v35;
    v33 += CGRectContainsPoint(v60, v59);
    ++v32;
  }
  while (v32 != 21);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v51 = VCPLogInstance();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v57) = 21 - v33;
      _os_log_impl(&dword_1BBEDA000, v51, OS_LOG_TYPE_DEBUG, "VCPImageHandAnalyzer - number of keypoints outside double inset = %d", buf, 8u);
    }
  }
  return v33 < 0x15;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 rotationInDegrees:(id)a4 flags:(unint64_t *)a5 results:(id *)a6 cancel:(id)a7
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v81 = a4;
  id v82 = a7;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  v79 = a6;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    float v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      int v92 = Width;
      __int16 v93 = 1024;
      int v94 = Height;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "HandPoseInputBuffer: width = %d,  height = %d", buf, 0xEu);
    }
  }
  float v14 = [MEMORY[0x1E4F1CA48] array];
  int v97 = 0;
  memset(v96, 0, sizeof(v96));
  [(NSMutableArray *)self->_results removeAllObjects];
  if (self->_anstHandsDetector)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      float v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "HandPoseInputBuffer: running VCPANSTHandsDetector", buf, 2u);
      }
    }
    float v16 = VCPSignPostLog();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    float v18 = VCPSignPostLog();
    float v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPImageHandsAnalyzer_anstHandDetection", "", buf, 2u);
    }

    int v20 = [(VCPANSTHandsDetector *)self->_anstHandsDetector handsDetection:a3 rotationInDegrees:v81 handsRegions:v14 cancel:v82];
    if (v20) {
      goto LABEL_59;
    }
    float v21 = VCPSignPostLog();
    float v22 = v21;
    if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    float v23 = "VCPImageHandsAnalyzer_anstHandDetection";
    goto LABEL_29;
  }
  if (self->_handsDetector)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      float v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_INFO, "HandPoseInputBuffer: running VCPCNNHandsDetector", buf, 2u);
      }
    }
    float v25 = VCPSignPostLog();
    os_signpost_id_t v17 = os_signpost_id_generate(v25);

    float v26 = VCPSignPostLog();
    float v27 = v26;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPImageHandsAnalyzer_handDetection", "", buf, 2u);
    }

    int v20 = [(VCPCNNHandsDetector *)self->_handsDetector handsDetection:a3 handsRegions:v14 cancel:v82];
    if (v20) {
      goto LABEL_59;
    }
    float v28 = VCPSignPostLog();
    float v22 = v28;
    if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28)) {
      goto LABEL_30;
    }
    *(_WORD *)buf = 0;
    float v23 = "VCPImageHandsAnalyzer_handDetection";
LABEL_29:
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_END, v17, v23, "", buf, 2u);
    goto LABEL_30;
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v78 = 120;
  obunint64_t j = self->_handObjects;
  uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v85 objects:v95 count:16];
  if (v43)
  {
    float v44 = (float)Width;
    uint64_t v45 = *(void *)v86;
    float v46 = (float)Height;
    while (2)
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v86 != v45) {
          objc_enumerationMutation(obj);
        }
        float v48 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        objc_msgSend(v48, "bounds", v78);
        double v50 = v49;
        double v52 = v51;
        double v54 = v53;
        double v56 = v55;
        double v57 = [VCPBoundingBox alloc];
        [v48 confidence];
        LODWORD(v59) = v58;
        *(float *)&double v60 = v56;
        *(float *)&double v61 = v54;
        double v62 = 1.0 - v52 - v56;
        *(float *)&double v63 = v62;
        *(float *)&double v62 = v50;
        v64 = [(VCPBoundingBox *)v57 initWithXYAndSize:v62 y:v63 width:v61 height:v60 confidence:v59];
        -[VCPBoundingBox setClassIndex:](v64, "setClassIndex:", [v48 chirality]);
        -[VCPBoundingBox setTrackID:](v64, "setTrackID:", [v48 handID]);
        -[VCPBoundingBox setGroupID:](v64, "setGroupID:", [v48 groupID]);
        [(VCPBoundingBox *)v64 minX];
        *(float *)&double v66 = v65 * v44;
        [(VCPBoundingBox *)v64 setMinX:v66];
        [(VCPBoundingBox *)v64 maxX];
        *(float *)&double v68 = v67 * v44;
        [(VCPBoundingBox *)v64 setMaxX:v68];
        [(VCPBoundingBox *)v64 minY];
        *(float *)&double v70 = v69 * v46;
        [(VCPBoundingBox *)v64 setMinY:v70];
        [(VCPBoundingBox *)v64 maxY];
        *(float *)&double v72 = v71 * v46;
        [(VCPBoundingBox *)v64 setMaxY:v72];
        *(float *)&double v73 = self->_extendRatio;
        *(float *)&double v74 = v44;
        *(float *)&double v75 = v46;
        int v20 = [(VCPBoundingBox *)v64 extendBoxBy:v73 scaleX:v74 scaleY:v75];
        if (v20)
        {

          goto LABEL_59;
        }
        [v14 addObject:v64];
      }
      uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v85 objects:v95 count:16];
      if (v43) {
        continue;
      }
      break;
    }
  }

  if ((int)MediaAnalysisLogLevel() < 5) {
    goto LABEL_31;
  }
  float v22 = VCPLogInstance();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v76 = [*(id *)((char *)&self->super.super.isa + v78) count];
    *(_DWORD *)buf = 67109120;
    int v92 = v76;
    _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEFAULT, "VCPImageHandAnalyzer - analyze %d handObjects", buf, 8u);
  }
LABEL_30:

LABEL_31:
  for (unint64_t j = 0; objc_msgSend(v14, "count", v78) > j; ++j)
  {
    float v30 = VCPSignPostLog();
    os_signpost_id_t v31 = os_signpost_id_generate(v30);

    uint64_t v32 = VCPSignPostLog();
    unsigned int v33 = v32;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)v84 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "VCPImageHandsAnalyzer_keypointsPerHand", "", v84, 2u);
    }

    *(_DWORD *)v84 = 0;
    handsKeypointsDetector = self->_handsKeypointsDetector;
    double v35 = [v14 objectAtIndexedSubscript:j];
    int v20 = [(VCPCNNHandKeypointsDetector *)handsKeypointsDetector handKeypointsDetection:a3 box:v35 keypoints:buf keypointConfidence:v96 handHoldsObjectConfidence:v84];

    if (v20) {
      goto LABEL_59;
    }
    float v36 = VCPSignPostLog();
    float v37 = v36;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)v83 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v37, OS_SIGNPOST_INTERVAL_END, v31, "VCPImageHandsAnalyzer_keypointsPerHand", "", v83, 2u);
    }

    if (self->_enableRejectHandsNearBoundaries)
    {
      float v38 = [v14 objectAtIndexedSubscript:j];
      BOOL v39 = [(VCPImageHandsAnalyzer *)self keypointsOutsideInset:buf handRegion:v38];

      if (v39) {
        continue;
      }
    }
    float v40 = [v14 objectAtIndexedSubscript:j];
    LODWORD(v41) = *(_DWORD *)v84;
    [(VCPImageHandsAnalyzer *)self convertSingleResultToDict:buf keypointConfidence:v96 box:v40 handHoldsObjectConfidence:self->_results results:v41];
  }
  results = self->_results;
  if (results)
  {
    v89 = @"HandsResults";
    v90 = results;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    int v20 = 0;
    id *v79 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v20 = 0;
  }
LABEL_59:

  return v20;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  return [(VCPImageHandsAnalyzer *)self analyzePixelBuffer:a3 rotationInDegrees:0 flags:a4 results:a5 cancel:a6];
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int result = -50;
  if (a3 && a4 && a5)
  {
    *a3 = self->_inputWidth;
    *a4 = self->_inputHeight;
    *a5 = 1111970369;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int inputWidth = self->_inputWidth;
        int inputHeight = self->_inputHeight;
        v10[0] = 67109376;
        v10[1] = inputWidth;
        __int16 v11 = 1024;
        int v12 = inputHeight;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "preferredInputFormat:  width = %d,  height = %d", (uint8_t *)v10, 0xEu);
      }
    }
    return 0;
  }
  return result;
}

- (NSArray)handObjects
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHandObjects:(id)a3
{
}

- (BOOL)optimizeForDistance
{
  return self->_optimizeForDistance;
}

- (void)setOptimizeForDistance:(BOOL)a3
{
  self->_optimizeForDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handObjects, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_handsKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_handsDetector, 0);
  objc_storeStrong((id *)&self->_anstHandsDetector, 0);
}

@end