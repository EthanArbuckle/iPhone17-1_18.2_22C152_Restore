@interface VCPPriorityAnalysis
+ (id)priorityAnalysis;
- (VCPPriorityAnalysis)init;
- (id).cxx_construct;
- (int)addKeypointsToNSArray:(CGPoint *)a3 keypointConfidence:(float)a4[21] handBox:(id)a5 keypointsArray:(id)a6;
- (int)calculatePriorityScore:(float *)a3 ofPixelBuffer:(__CVBuffer *)a4 withMetadata:(id)a5;
- (int)fastSignLanguageDetection:(float *)a3 ofPixelBuffer:(__CVBuffer *)a4 withMetadata:(id)a5;
- (void)dealloc;
@end

@implementation VCPPriorityAnalysis

- (VCPPriorityAnalysis)init
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)VCPPriorityAnalysis;
  id v2 = [(VCPPriorityAnalysis *)&v25 init];
  v3 = (VCPPriorityAnalysis *)v2;
  if (v2)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Start initializing", buf, 2u);
      }
    }
    *((_DWORD *)v2 + 2) = 0;
    *((unsigned char *)v2 + 56) = 0;
    *((void *)v2 + 3) = 0;
    *(void *)buf = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int *,int *>((char *)v2 + 32, (char *)buf, (uint64_t)&v27, 2uLL);
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    v8 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = v9;

    uint64_t v11 = +[VCPCNNHandsDetector detector:2 forceCPU:0 sharedModel:1 inputConfig:@"res_192x192" revision:2];
    v12 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v11;

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Finished initializing hand detector", buf, 2u);
      }
    }
    uint64_t v14 = +[VCPCNNHandKeypointsDetector detector:0 sharedModel:1 modelName:@"hand_keypoint_detector_lite.espresso.net" enableHandObject:1 options:0];
    handsKeypointsDetector = v3->_handsKeypointsDetector;
    v3->_handsKeypointsDetector = (VCPCNNHandKeypointsDetector *)v14;

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Finished initializing hand keypoint detector with hand_keypoint_detector_lite.espresso.net", buf, 2u);
      }
    }
    uint64_t v17 = +[VCPCNNFastGestureRecognition detector];
    fastGestureDetector = v3->_fastGestureDetector;
    v3->_fastGestureDetector = (VCPCNNFastGestureRecognition *)v17;

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Finished initializing gesture recognizer", buf, 2u);
      }
    }
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
    frameStartTimeStamp = v3->_frameStartTimeStamp;
    v3->_frameStartTimeStamp = (NSDate *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
    frameEndTimeStamp = v3->_frameEndTimeStamp;
    v3->_frameEndTimeStamp = (NSDate *)v22;
  }
  return v3;
}

- (void)dealloc
{
  rotator = self->_rotator;
  if (rotator)
  {
    ma::Rotator::~Rotator((ma::Rotator *)rotator);
    MEMORY[0x1C186C7D0]();
  }
  [(VCPCNNFastGestureRecognition *)self->_fastGestureDetector planDestroy];
  v4.receiver = self;
  v4.super_class = (Class)VCPPriorityAnalysis;
  [(VCPPriorityAnalysis *)&v4 dealloc];
}

+ (id)priorityAnalysis
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (int)addKeypointsToNSArray:(CGPoint *)a3 keypointConfidence:(float)a4[21] handBox:(id)a5 keypointsArray:(id)a6
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  [v9 maxX];
  float v12 = v11;
  [v9 minX];
  float v14 = v13;
  [v9 maxY];
  float v16 = v15;
  [v9 minY];
  uint64_t v17 = 0;
  float v19 = v16 - v18;
  double v20 = (float)(v12 - v14);
  double v21 = v19;
  p_y = &a3->y;
  do
  {
    if (*(p_y - 1) == 0.0 && (double v23 = *p_y, *p_y == 0.0))
    {
      v38[0] = &unk_1F15EAD78;
      v38[1] = &unk_1F15EAD78;
      *(float *)&double v23 = a4[v17];
      v31 = [NSNumber numberWithFloat:v23];
      v38[2] = v31;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
      [v10 replaceObjectAtIndex:v17 withObject:v33];
    }
    else
    {
      [v9 minX];
      float v25 = v24;
      double v26 = *(p_y - 1);
      [v9 minY];
      float v28 = v27;
      double v29 = v25 + v26 / 255.0 * v20;
      *(float *)&double v29 = v29;
      double v30 = *p_y;
      v31 = [NSNumber numberWithFloat:v29];
      double v32 = v28 + v30 / 255.0 * v21;
      *(float *)&double v32 = v32;
      v39[0] = v31;
      *(float *)&double v32 = 1.0 - *(float *)&v32;
      v33 = [NSNumber numberWithFloat:v32];
      v39[1] = v33;
      *(float *)&double v34 = a4[v17];
      v35 = [NSNumber numberWithFloat:v34];
      v39[2] = v35;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
      [v10 replaceObjectAtIndex:v17 withObject:v36];
    }
    ++v17;
    p_y += 2;
  }
  while (v17 != 21);

  return 0;
}

- (int)fastSignLanguageDetection:(float *)a3 ofPixelBuffer:(__CVBuffer *)a4 withMetadata:(id)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  CFTypeRef cf = 0;
  CFTypeRef v81 = 0;
  uint64_t v79 = 0;
  __int16 v78 = 0;
  uint64_t v87 = 0;
  memset(v86, 0, sizeof(v86));
  v8 = [v7 objectForKeyedSubscript:@"faceMetadataArray"];
  id v9 = [v8 objectAtIndexedSubscript:0];
  id v10 = [v9 objectForKeyedSubscript:@"realtimeFaceRoll"];
  unsigned int v11 = [v10 intValue];

  v72 = [MEMORY[0x1E4F1CA48] array];
  float v12 = [MEMORY[0x1E4F1CA48] array];
  float v13 = [MEMORY[0x1E4F1CA48] array];
  v71 = [MEMORY[0x1E4F1CA48] array];
  if (!self->_inputWidth || !self->_inputHeight)
  {
    self->_inputWidth = CVPixelBufferGetWidth(a4);
    self->_inputHeight = CVPixelBufferGetHeight(a4);
  }
  if (v11 - 226 >= 0x5A)
  {
    int v14 = 0;
    if (v11 >= 0x2E && v11 - 316 >= 0x2D)
    {
      if (v11 - 136 >= 0x5A)
      {
        if (v11 - 46 > 0x59) {
          goto LABEL_13;
        }
        int v14 = 270;
      }
      else
      {
        int v14 = 180;
      }
    }
  }
  else
  {
    int v14 = 90;
  }
  self->_rotationAngle = v14;
LABEL_13:
  rotator = self->_rotator;
  if (!rotator) {
    goto LABEL_16;
  }
  if (rotator->var3 != self->_rotationAngle)
  {
    ma::Rotator::~Rotator((ma::Rotator *)self->_rotator);
    MEMORY[0x1C186C7D0]();
LABEL_16:
    operator new();
  }
  int v16 = ma::Rotator::Rotate((ma::Rotator *)rotator, a4, &cf);
  if (v16) {
    goto LABEL_20;
  }
  Scaler::Scale(&self->_scaler, (__CVBuffer *)cf, (__CVBuffer **)&v81, self->_inputWidth, self->_inputHeight, 1111970369);
  int v16 = v17;
  if (v17) {
    goto LABEL_20;
  }
  int v16 = [(VCPCNNHandsDetector *)self->_handsDetector handsDetection:v81 handsRegions:v72 cancel:0];
  if (v16) {
    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() > 6)
  {
    double v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = [v72 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v83 = v21;
      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Number of hand detected %lu", buf, 0xCu);
    }
  }
  int v22 = 21;
  do
  {
    [v12 addObject:&unk_1F15EE6E8];
    [v13 addObject:&unk_1F15EE700];
    --v22;
  }
  while (v22);
  if ([v72 count])
  {
    self->_handDetectedInPreviousFrame = 1;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obj = v72;
    uint64_t v23 = [obj countByEnumeratingWithState:&v74 objects:v85 count:16];
    if (v23)
    {
      uint64_t v69 = *(void *)v75;
      *(void *)&long long v24 = 67109632;
      long long v66 = v24;
      while (2)
      {
        uint64_t v68 = v23;
        for (uint64_t i = 0; i != v68; ++i)
        {
          if (*(void *)v75 != v69) {
            objc_enumerationMutation(obj);
          }
          double v26 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          uint64_t v27 = (int)((double)(int)(objc_msgSend(v26, "classIndex", v66) + 1) * 0.5);
          int v73 = 0;
          if (v27 >= 2)
          {
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v65 = VCPLogInstance();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v83 = v27;
                _os_log_impl(&dword_1BBEDA000, v65, OS_LOG_TYPE_ERROR, "indexMappedFromChirality = %d, out of range [0, 1]", buf, 8u);
              }
            }
            v57 = 0;
            int v16 = -50;
            goto LABEL_107;
          }
          if (!self->_dominantHand)
          {
            begin = self->_handChiralityCounter.__begin_;
            int v29 = *begin;
            double v30 = begin + 1;
            if (begin[1] + *begin < 1501) {
              goto LABEL_52;
            }
            end = self->_handChiralityCounter.__end_;
            double v32 = self->_handChiralityCounter.__begin_;
            if (begin != end && v30 != end)
            {
              double v32 = self->_handChiralityCounter.__begin_;
              v33 = begin + 1;
              do
              {
                int v35 = *v33++;
                int v34 = v35;
                BOOL v36 = v29 < v35;
                if (v29 <= v35) {
                  int v29 = v34;
                }
                if (v36) {
                  double v32 = v30;
                }
                double v30 = v33;
              }
              while (v33 != end);
            }
            unint64_t v37 = (unint64_t)((char *)v32 - (char *)begin) >> 2;
            self->_int dominantHand = v37;
            if (!v37)
            {
LABEL_52:
              if (begin[1] + *begin > 1500) {
                goto LABEL_54;
              }
              ++begin[v27];
              if (!self->_dominantHand) {
                goto LABEL_54;
              }
            }
          }
          if ([v26 classIndex] == self->_dominantHand)
          {
LABEL_54:
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              v38 = VCPLogInstance();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                int dominantHand = self->_dominantHand;
                v40 = self->_handChiralityCounter.__begin_;
                int v41 = *v40;
                LODWORD(v40) = v40[1];
                *(_DWORD *)buf = v66;
                *(_DWORD *)v83 = dominantHand;
                *(_WORD *)&v83[4] = 1024;
                *(_DWORD *)&v83[6] = v41;
                LOWORD(v84) = 1024;
                *(_DWORD *)((char *)&v84 + 2) = v40;
                _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - dominant hand: %d, hand chirality counter: left: %d, right: %d", buf, 0x14u);
              }
            }
            int v16 = [(VCPCNNHandKeypointsDetector *)self->_handsKeypointsDetector handKeypointsDetection:v81 box:v26 keypoints:v88 keypointConfidence:v86 handHoldsObjectConfidence:&v73];
            if (v16)
            {
              v57 = 0;
              goto LABEL_107;
            }
            if ([v26 classIndex])
            {
              if (!*((unsigned char *)&v78 + v27))
              {
                int v42 = [v26 classIndex];
                v43 = v12;
                if (v42 == -1 || (int v44 = [v26 classIndex], v43 = v13, v44 == 1)) {
                  [(VCPPriorityAnalysis *)self addKeypointsToNSArray:v88 keypointConfidence:v86 handBox:v26 keypointsArray:v43];
                }
              }
              *((unsigned char *)&v78 + v27) = 1;
            }
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v74 objects:v85 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    v45 = [MEMORY[0x1E4F1C9C8] date];
    frameEndTimeStamp = self->_frameEndTimeStamp;
    self->_frameEndTimeStamp = v45;

    [(NSDate *)self->_frameEndTimeStamp timeIntervalSinceDate:self->_frameStartTimeStamp];
    self->_singleFrameExecutionTime = v47;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v48 = VCPLogInstance();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        double v49 = self->_singleFrameExecutionTime * 1000.0;
        *(_DWORD *)buf = 134217984;
        *(double *)v83 = v49;
        _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - frame interval %f ms", buf, 0xCu);
      }
    }
    objc_storeStrong((id *)&self->_frameStartTimeStamp, self->_frameEndTimeStamp);
    v50 = [MEMORY[0x1E4F1C9C8] date];
    prevTimeStampHandDetected = self->_prevTimeStampHandDetected;
    self->_prevTimeStampHandDetected = v50;
  }
  else
  {
    self->_handDetectedInPreviousFrame = 0;
  }
  if ((unint64_t)[(NSMutableArray *)self->_leftHandKeypointTracker count] >= 6) {
    [(NSMutableArray *)self->_leftHandKeypointTracker removeObjectAtIndex:0];
  }
  if ((unint64_t)[(NSMutableArray *)self->_rightHandKeypointTracker count] >= 6) {
    [(NSMutableArray *)self->_rightHandKeypointTracker removeObjectAtIndex:0];
  }
  if (([(NSMutableArray *)self->_leftHandKeypointTracker addObject:v12],
        [(NSMutableArray *)self->_rightHandKeypointTracker addObject:v13],
        [(NSMutableArray *)self->_leftHandKeypointTracker count] == 6)
    && (_BYTE)v78
    && (int v16 = [(VCPCNNFastGestureRecognition *)self->_fastGestureDetector gestureDetection:self->_leftHandKeypointTracker score:(char *)&v79 + 4]) != 0|| [(NSMutableArray *)self->_rightHandKeypointTracker count] == 6&& HIBYTE(v78)&& (int v16 = [(VCPCNNFastGestureRecognition *)self->_fastGestureDetector gestureDetection:self->_rightHandKeypointTracker score:&v79]) != 0)
  {
LABEL_20:
    float v18 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v52 = VCPLogInstance();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)v83 = *((float *)&v79 + 1);
        *(_WORD *)&v83[8] = 2048;
        double v84 = *(float *)&v79;
        _os_log_impl(&dword_1BBEDA000, v52, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - gestureScoreRightHand %f, gestureScoreLeftHand %f", buf, 0x16u);
      }
    }
    if (*(float *)&v79 >= *((float *)&v79 + 1)) {
      float v53 = *(float *)&v79;
    }
    else {
      float v53 = *((float *)&v79 + 1);
    }
    float v54 = 0.0;
    if (v53 > 0.99) {
      float v54 = 1.0;
    }
    *a3 = v54;
    if (v53 > 0.99)
    {
      v55 = [MEMORY[0x1E4F1C9C8] date];
      prevTimeSignLanguageDetected = self->_prevTimeSignLanguageDetected;
      self->_prevTimeSignLanguageDetected = v55;
    }
    v57 = [MEMORY[0x1E4F1C9C8] date];
    [v57 timeIntervalSinceDate:self->_prevTimeSignLanguageDetected];
    BOOL v36 = v58 > 1.0;
    double v59 = 0.0;
    if (!v36) {
      double v59 = 1.0;
    }
    float v60 = v59;
    *a3 = v60;
    v61 = [MEMORY[0x1E4F1C978] arrayWithArray:v71];
    prevFrameHandKeypoint = self->_prevFrameHandKeypoint;
    self->_prevFrameHandKeypoint = v61;

    if ((int)MediaAnalysisLogLevel() < 7)
    {
      int v16 = 0;
    }
    else
    {
      v63 = VCPLogInstance();
      obj = v63;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        double v64 = *a3;
        *(_DWORD *)buf = 134218240;
        *(double *)v83 = v53;
        *(_WORD *)&v83[8] = 2048;
        double v84 = v64;
        _os_log_impl(&dword_1BBEDA000, v63, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - gesture score = %f, priority score after thresholding = %f", buf, 0x16u);
      }
      int v16 = 0;
LABEL_107:
    }
    float v18 = v57;
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v81)
  {
    CFRelease(v81);
    CFTypeRef v81 = 0;
  }

  return v16;
}

- (int)calculatePriorityScore:(float *)a3 ofPixelBuffer:(__CVBuffer *)a4 withMetadata:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (self->_handDetectedInPreviousFrame) {
    int v9 = 3;
  }
  else {
    int v9 = 10;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 134217984;
      double v24 = 1.0 / (double)v9;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Analysis subsampling ratio = %f", (uint8_t *)&v23, 0xCu);
    }
  }
  int v11 = (self->_frameCounter + 1) % v9;
  self->_frameCounter = v11;
  if (!v8 || v11)
  {
    float prevComputedScore = self->_prevComputedScore;
    if (!v8) {
      float prevComputedScore = 0.0;
    }
    *a3 = prevComputedScore;
  }
  else
  {
    float v12 = [v8 objectForKey:@"faceMetadataArray"];
    if ([v12 count])
    {
      float v13 = [v12 objectAtIndexedSubscript:0];
      int v14 = [v13 objectForKey:@"realtimeFaceYaw"];
      float v15 = v14;
      if (v14 && ((int)[v14 intValue] > 315 || (int)objc_msgSend(v15, "intValue") <= 44))
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          int v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            int v17 = [v15 intValue];
            int v23 = 67109120;
            LODWORD(v24) = v17;
            _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - Face yaw: %d", (uint8_t *)&v23, 8u);
          }
        }
        int v18 = [(VCPPriorityAnalysis *)self fastSignLanguageDetection:a3 ofPixelBuffer:a4 withMetadata:v8];
        if (v18)
        {

          goto LABEL_31;
        }
      }
      else
      {
        *a3 = 0.0;
      }

      float v20 = *a3;
    }
    else
    {
      *a3 = 0.0;
      float v20 = 0.0;
    }
    self->_float prevComputedScore = v20;
  }
  if ((int)MediaAnalysisLogLevel() < 7)
  {
    int v18 = 0;
    goto LABEL_33;
  }
  float v12 = VCPLogInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    double v21 = *a3;
    int v23 = 134217984;
    double v24 = v21;
    _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "VCPPriorityAnalysis - output priority score = %f", (uint8_t *)&v23, 0xCu);
  }
  int v18 = 0;
LABEL_31:

LABEL_33:
  return v18;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_rightHandKeypointTracker, 0);
  objc_storeStrong((id *)&self->_leftHandKeypointTracker, 0);
  objc_storeStrong((id *)&self->_handKeypointTracker, 0);
  objc_storeStrong((id *)&self->_classIndexTracker, 0);
  objc_storeStrong((id *)&self->_frameStartTimeStamp, 0);
  objc_storeStrong((id *)&self->_frameEndTimeStamp, 0);
  objc_storeStrong((id *)&self->_prevTimeSignLanguageDetected, 0);
  objc_storeStrong((id *)&self->_prevTimeStampHandDetected, 0);
  objc_storeStrong((id *)&self->_prevFrameHandKeypoint, 0);
  objc_storeStrong((id *)&self->_fastGestureDetector, 0);
  objc_storeStrong((id *)&self->_handsKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_handsDetector, 0);
  begin = self->_handChiralityCounter.__begin_;
  if (begin)
  {
    self->_handChiralityCounter.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 23) = 0;
  *((_DWORD *)self + 48) = 0;
  return self;
}

@end