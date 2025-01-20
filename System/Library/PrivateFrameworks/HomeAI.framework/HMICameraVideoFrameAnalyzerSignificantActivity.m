@interface HMICameraVideoFrameAnalyzerSignificantActivity
+ (NSDictionary)classHierarchyMap;
+ (id)desLabelIndexForEventClass:(Class)a3;
+ (id)labelIndexForEventClass:(Class)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundTimeStamp;
- (CGRect)regionOfInterestForMotionDetections:(id)a3 foregroundEvents:(id)a4 frameSize:(CGSize)a5;
- (CGSize)inputDimensions;
- (HMFOSTransaction)transaction;
- (HMICameraVideoFrameAnalyzerSignificantActivity)initWithMediumConfidenceThresholds:(id)a3 highConfidenceThresholds:(id)a4 analyzerConfiguration:(id)a5 error:(id *)a6;
- (HMIFaceClassifierVIP)faceClassifier;
- (HMISessionEntityManager)sessionEntityManager;
- (HMISignificantActivityFcosDetector)significantActivityFcosDetector;
- (HMITorsoClassifier)torsoClassifier;
- (HMIVideoAnalyzerConfiguration)analyzerConfiguration;
- (NSDictionary)highConfidenceThresholds;
- (NSDictionary)mediumConfidenceThresholds;
- (NSMutableArray)backgroundEvents;
- (id)_analyzerEventsFromObjectDetections:(id)a3;
- (id)_eventsWithClassificationsFromEvents:(id)a3 videoFrame:(id)a4 regionOfInterest:(CGRect)a5 homeUUID:(id)a6;
- (id)_eventsWithSessionEntitiesFromEvents:(id)a3 regionOfInterest:(CGRect)a4 timeStamp:(id *)a5 homeUUID:(id)a6;
- (id)_filterPackageEvents:(id)a3 backgroundEvents:(id)a4;
- (id)_predictEventsFromCropPixelBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4 imageSize:(CGSize)a5 error:(id *)a6;
- (id)_simulatedEventForEventClass:(Class)a3;
- (id)_targetEventsSetFromEventTriggers:(int64_t)a3 enableFaceClassification:(BOOL)a4 enableTorsoRecognition:(BOOL)a5;
- (id)analyzeBackgroundFrame:(id)a3 packageEvents:(id)a4 newBackgroundEvents:(id)a5 regionOfInterest:(CGRect)a6;
- (id)analyzeFrame:(id)a3 regionOfInterest:(CGRect)a4;
- (id)analyzePixelBuffer:(__CVBuffer *)a3 regionOfInterest:(CGRect)a4 error:(id *)a5;
- (id)eventsWithFaceEventsFromTorsoEventsFromEvents:(id)a3 homeUUID:(id)a4;
- (id)flushAndGetAnalysisStateUpdateForHome:(id)a3 enableFaceClassification:(BOOL)a4;
- (id)getAnalyzerEvents:(id)a3 eventTriggers:(int64_t)a4 enableFaceClassification:(BOOL)a5 enableTorsoRecognition:(BOOL)a6;
- (id)getPackageEvents:(id)a3 foregroundEvents:(id)a4 newBackgroundEvents:(id)a5 backgroundTimeStamp:(id *)a6;
- (id)recognizeEvents:(id)a3 frame:(id)a4 regionOfInterest:(CGRect)a5 homeUUID:(id)a6;
- (void)setBackgroundTimeStamp:(id *)a3;
- (void)setTransaction:(id)a3;
@end

@implementation HMICameraVideoFrameAnalyzerSignificantActivity

- (HMICameraVideoFrameAnalyzerSignificantActivity)initWithMediumConfidenceThresholds:(id)a3 highConfidenceThresholds:(id)a4 analyzerConfiguration:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v44.receiver = self;
  v44.super_class = (Class)HMICameraVideoFrameAnalyzerSignificantActivity;
  v14 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)&v44 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v14->_analyzerConfiguration, a5);
  v16 = [MEMORY[0x263EFF980] arrayWithCapacity:7];
  for (uint64_t i = 0; i != 7; ++i)
    [v16 setObject:&unk_26D9A9570 atIndexedSubscript:i];
  v18 = +[HMICameraVideoFrameAnalyzerSignificantActivity classHierarchyMap];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __138__HMICameraVideoFrameAnalyzerSignificantActivity_initWithMediumConfidenceThresholds_highConfidenceThresholds_analyzerConfiguration_error___block_invoke;
  v41[3] = &unk_26477E7C8;
  id v42 = v11;
  id v19 = v16;
  id v43 = v19;
  [v18 enumerateKeysAndObjectsUsingBlock:v41];

  objc_storeStrong((id *)&v15->_mediumConfidenceThresholds, a3);
  objc_storeStrong((id *)&v15->_highConfidenceThresholds, a4);
  v20 = [HMISignificantActivityFcosDetector alloc];
  v21 = +[HMISignificantActivityFcosDetector defaultNMSConfiguration];
  id v40 = 0;
  uint64_t v22 = [(HMISignificantActivityFcosDetector *)v20 initWithConfidenceThresholds:v19 nmsConfiguration:v21 error:&v40];
  id v23 = v40;
  significantActivityFcosDetector = v15->_significantActivityFcosDetector;
  v15->_significantActivityFcosDetector = (HMISignificantActivityFcosDetector *)v22;

  uint64_t v25 = MEMORY[0x263F010E0];
  *(_OWORD *)&v15->_backgroundTimeStamp.value = *MEMORY[0x263F010E0];
  v15->_backgroundTimeStamp.epoch = *(void *)(v25 + 16);
  uint64_t v26 = [MEMORY[0x263EFF980] array];
  backgroundEvents = v15->_backgroundEvents;
  v15->_backgroundEvents = (NSMutableArray *)v26;

  if (v15->_significantActivityFcosDetector)
  {
    v28 = +[HMIPreference sharedInstance];
    int v29 = [v28 shouldEnableTorsoRecognition];

    if (!v29
      || (v30 = objc_alloc_init(HMITorsoClassifier),
          torsoClassifier = v15->_torsoClassifier,
          v15->_torsoClassifier = v30,
          torsoClassifier,
          v15->_torsoClassifier))
    {
      id v39 = v23;
      v32 = [[HMIFaceClassifierVIP alloc] initWithError:&v39];
      id v33 = v39;

      faceClassifier = v15->_faceClassifier;
      v15->_faceClassifier = v32;

      if (v15->_faceClassifier)
      {
        uint64_t v35 = [objc_alloc(MEMORY[0x263F425C0]) initWithName:@"HMICameraVideoFrameAnalyzerSignificantActivity"];
        transaction = v15->_transaction;
        v15->_transaction = (HMFOSTransaction *)v35;

LABEL_9:
        v37 = v15;
        goto LABEL_14;
      }
      id v23 = v33;
    }
  }
  if (a6)
  {
    id v23 = v23;
    *a6 = v23;
  }
  HMIErrorLog(v15, v23);

  v37 = 0;
LABEL_14:

  return v37;
}

void __138__HMICameraVideoFrameAnalyzerSignificantActivity_initWithMediumConfidenceThresholds_highConfidenceThresholds_analyzerConfiguration_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  if (v5) {
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v5, objc_msgSend(v6, "integerValue"));
  }
}

- (CGSize)inputDimensions
{
  v2 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self significantActivityFcosDetector];
  [v2 inputDimensions];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)regionOfInterestForMotionDetections:(id)a3 foregroundEvents:(id)a4 frameSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = a4;
  id v11 = +[HMIMotionDetection firstMotionDetectionInArray:v9 withMode:2];
  uint64_t v40 = 0;
  v41 = (CGRect *)&v40;
  uint64_t v42 = 0x4010000000;
  id v43 = &unk_225F58031;
  long long v44 = 0u;
  long long v45 = 0u;
  [v11 motionScore];
  if (v12 <= 0.0)
  {
    long long v17 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    long long v44 = *MEMORY[0x263F001A0];
    long long v45 = v17;
  }
  else
  {
    [v11 boundingBox];
    *(void *)&long long v44 = v13;
    *((void *)&v44 + 1) = v14;
    *(void *)&long long v45 = v15;
    *((void *)&v45 + 1) = v16;
  }
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __113__HMICameraVideoFrameAnalyzerSignificantActivity_regionOfInterestForMotionDetections_foregroundEvents_frameSize___block_invoke;
  v39[3] = &unk_26477BE58;
  v39[4] = &v40;
  objc_msgSend(v10, "na_each:", v39);
  if (CGRectIsNull(v41[1]))
  {
    double v20 = v41[1].size.width;
    double v19 = v41[1].size.height;
    double x = v41[1].origin.x;
    double y = v41[1].origin.y;
  }
  else
  {
    LODWORD(v18) = 1.0;
    +[HMIVisionUtilities maintainAspectRatio:originalSize:ratioThreshold:](HMIVisionUtilities, "maintainAspectRatio:originalSize:ratioThreshold:", v41[1].origin.x, v41[1].origin.y, v41[1].size.width, v41[1].size.height, width, height, v18);
    id v23 = v41;
    v41[1].origin.double x = v24;
    v23[1].origin.double y = v25;
    v23[1].size.double width = v26;
    v23[1].size.double height = v27;
    [(HMICameraVideoFrameAnalyzerSignificantActivity *)self inputDimensions];
    +[HMIVisionUtilities imposeMinSizeFor:withOriginalSize:minCrop:](HMIVisionUtilities, "imposeMinSizeFor:withOriginalSize:minCrop:", v23[1].origin.x, v23[1].origin.y, v23[1].size.width, v23[1].size.height, width, height, v28, v29);
    double x = v30;
    double y = v31;
    double v20 = v32;
    double v19 = v33;
    p_double x = &v41->origin.x;
    v41[1].origin.double x = v30;
    p_x[5] = v31;
    p_x[6] = v32;
    p_x[7] = v33;
  }
  _Block_object_dispose(&v40, 8);

  double v35 = x;
  double v36 = y;
  double v37 = v20;
  double v38 = v19;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

void __113__HMICameraVideoFrameAnalyzerSignificantActivity_regionOfInterestForMotionDetections_foregroundEvents_frameSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 boundingBox];
  CGFloat v20 = v5;
  CGFloat v21 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [v3 boundingBox];
  CGFloat v10 = CGRectGetWidth(v22) * -0.4;
  [v3 boundingBox];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v23.origin.double x = v12;
  v23.origin.double y = v14;
  v23.size.double width = v16;
  v23.size.double height = v18;
  CGFloat v19 = CGRectGetHeight(v23) * -0.4;
  v24.origin.double y = v20;
  v24.origin.double x = v21;
  v24.size.double width = v7;
  v24.size.double height = v9;
  CGRect v25 = CGRectInset(v24, v10, v19);
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v25);
}

- (id)analyzeFrame:(id)a3 regionOfInterest:(CGRect)a4
{
  uint64_t v9 = 0;
  double v4 = -[HMICameraVideoFrameAnalyzerSignificantActivity analyzePixelBuffer:regionOfInterest:error:](self, "analyzePixelBuffer:regionOfInterest:error:", [a3 pixelBuffer], &v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v5 = v4;
  if (v9)
  {
    id v6 = [MEMORY[0x263EFFA08] set];
  }
  else
  {
    id v6 = v4;
  }
  CGFloat v7 = v6;

  return v7;
}

- (id)getAnalyzerEvents:(id)a3 eventTriggers:(int64_t)a4 enableFaceClassification:(BOOL)a5 enableTorsoRecognition:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v45[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  double v11 = objc_msgSend(v10, "na_filter:", &__block_literal_global_36);
  CGFloat v12 = +[HMIPreference sharedInstance];
  double v13 = &off_225F2D000;
  if ([v12 hasPreferenceForKey:@"personDetected"]) {
    goto LABEL_6;
  }
  CGFloat v14 = +[HMIPreference sharedInstance];
  if ([v14 hasPreferenceForKey:@"petDetected"])
  {
LABEL_5:

LABEL_6:
LABEL_7:
    CGFloat v16 = (void *)MEMORY[0x263EFFA08];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    v45[2] = objc_opt_class();
    v45[3] = objc_opt_class();
    double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:4];
    CGFloat v18 = [v16 setWithArray:v17];

    v40[0] = MEMORY[0x263EF8330];
    v40[1] = *((void *)v13 + 375);
    v40[2] = __130__HMICameraVideoFrameAnalyzerSignificantActivity_getAnalyzerEvents_eventTriggers_enableFaceClassification_enableTorsoRecognition___block_invoke_2;
    v40[3] = &unk_26477BE80;
    v40[4] = self;
    uint64_t v19 = objc_msgSend(v18, "na_map:", v40);

    double v11 = (void *)v19;
    goto LABEL_8;
  }
  double v15 = +[HMIPreference sharedInstance];
  if ([v15 hasPreferenceForKey:@"vehicleDetected"])
  {

    double v13 = &off_225F2D000;
    goto LABEL_5;
  }
  +[HMIPreference sharedInstance];
  double v35 = v37 = v10;
  char v36 = [v35 hasPreferenceForKey:@"packageDetected"];

  id v10 = v37;
  double v13 = &off_225F2D000;
  if (v36) {
    goto LABEL_7;
  }
LABEL_8:
  CGFloat v20 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self _targetEventsSetFromEventTriggers:a4 enableFaceClassification:v7 enableTorsoRecognition:v6];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = *((void *)v13 + 375);
  v38[2] = __130__HMICameraVideoFrameAnalyzerSignificantActivity_getAnalyzerEvents_eventTriggers_enableFaceClassification_enableTorsoRecognition___block_invoke_3;
  v38[3] = &unk_26477E050;
  id v21 = v20;
  id v39 = v21;
  CGRect v22 = objc_msgSend(v11, "na_filter:", v38);

  CGRect v23 = +[HMIFaceUtilities mergedPersonEventsFromEvents:v22];

  CGRect v24 = +[HMIPreference sharedInstance];
  int v25 = [v24 hasPreferenceForKey:@"syntheticEvents"];

  if (v25)
  {
    CGFloat v26 = +[HMIPreference sharedInstance];
    CGFloat v27 = [v26 stringPreferenceForKey:@"syntheticEvents" defaultValue:&stru_26D98B6C8];

    double v28 = +[HMIVideoAnalyzerEvent eventsWithContentsOfFile:v27];
    if (v28)
    {
      double v29 = (void *)MEMORY[0x22A641C70]();
      double v30 = self;
      double v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        double v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v32;
        __int16 v43 = 2112;
        long long v44 = v27;
        _os_log_impl(&dword_225DC6000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Reading and injecting synthesized events from path %@", buf, 0x16u);
      }
      id v33 = v28;

      CGRect v23 = v33;
    }
  }
  return v23;
}

BOOL __130__HMICameraVideoFrameAnalyzerSignificantActivity_getAnalyzerEvents_eventTriggers_enableFaceClassification_enableTorsoRecognition___block_invoke(uint64_t a1, void *a2)
{
  return [a2 confidenceLevel] == 2;
}

uint64_t __130__HMICameraVideoFrameAnalyzerSignificantActivity_getAnalyzerEvents_eventTriggers_enableFaceClassification_enableTorsoRecognition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _simulatedEventForEventClass:a2];
}

uint64_t __130__HMICameraVideoFrameAnalyzerSignificantActivity_getAnalyzerEvents_eventTriggers_enableFaceClassification_enableTorsoRecognition___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = objc_opt_class();
  return [v1 containsObject:v2];
}

- (id)getPackageEvents:(id)a3 foregroundEvents:(id)a4 newBackgroundEvents:(id)a5 backgroundTimeStamp:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  double v13 = objc_msgSend(v12, "na_filter:", &__block_literal_global_26_0);
  CGFloat v14 = objc_msgSend(v12, "na_filter:", &__block_literal_global_28);

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_3;
  v31[3] = &unk_26477E7F0;
  id v32 = v14;
  id v33 = v11;
  id v15 = v11;
  id v16 = v14;
  double v17 = objc_msgSend(v13, "na_filter:", v31);

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_6;
  v29[3] = &unk_26477E050;
  id v30 = v10;
  id v18 = v10;
  uint64_t v19 = objc_msgSend(v17, "na_filter:", v29);

  [(HMICameraVideoFrameAnalyzerSignificantActivity *)self backgroundTimeStamp];
  CMTime time2 = *(CMTime *)a6;
  if (CMTimeCompare(&time1, &time2))
  {
    long long v25 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    [(HMICameraVideoFrameAnalyzerSignificantActivity *)self setBackgroundTimeStamp:&v25];
    CGFloat v20 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self backgroundEvents];
    [v20 removeAllObjects];
  }
  id v21 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self backgroundEvents];
  CGRect v22 = (void *)[v21 copy];
  CGRect v23 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self _filterPackageEvents:v19 backgroundEvents:v22];

  return v23;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  BOOL v4 = v3 == objc_opt_class() && [v2 confidenceLevel] == 2;

  return v4;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  if (v4 == v5)
  {
    id v2 = [v3 confidence];
    [v2 value];
    if (v6 > 0.41)
    {
      BOOL v7 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    uint64_t v9 = [v3 confidence];
    [v9 value];
    BOOL v7 = v10 > 0.44;
  }
  else
  {
    BOOL v7 = 0;
  }
  if (v4 == v5) {
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

uint64_t __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 confidence];
  [v4 value];
  if (v5 <= 0.24)
  {
  }
  else
  {
    double v6 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_4;
    v14[3] = &unk_26477E050;
    id v7 = v3;
    id v15 = v7;
    LODWORD(v6) = objc_msgSend(v6, "na_any:", v14);

    if (v6) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
  uint64_t v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_5;
  v12[3] = &unk_26477E050;
  id v13 = v3;
  id v9 = v3;
  uint64_t v10 = objc_msgSend(v8, "na_any:", v12) ^ 1;

  return v10;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    [*(id *)(a1 + 32) boundingBox];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v3 boundingBox];
    v20.origin.double x = v14;
    v20.origin.double y = v15;
    v20.size.double width = v16;
    v20.size.double height = v17;
    v19.origin.double x = v7;
    v19.origin.double y = v9;
    v19.size.double width = v11;
    v19.size.double height = v13;
    BOOL v5 = CGRectIntersectsRect(v19, v20);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class() || (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    [*(id *)(a1 + 32) boundingBox];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v3 boundingBox];
    v21.origin.double x = v15;
    v21.origin.double y = v16;
    v21.size.double width = v17;
    v21.size.double height = v18;
    v20.origin.double x = v8;
    v20.origin.double y = v10;
    v20.size.double width = v12;
    v20.size.double height = v14;
    BOOL v6 = CGRectIntersectsRect(v20, v21);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_7;
  v8[3] = &unk_26477E050;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_getPackageEvents_foregroundEvents_newBackgroundEvents_backgroundTimeStamp___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 boundingBox];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 boundingBox];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  HMICGRectIntersectionOverUnion(v5, v7, v9, v11, v13, v15, v17, v19);
  return v20 > 0.2;
}

- (id)analyzeBackgroundFrame:(id)a3 packageEvents:(id)a4 newBackgroundEvents:(id)a5 regionOfInterest:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v13 = a5;
  id v14 = a4;
  double v15 = -[HMICameraVideoFrameAnalyzerSignificantActivity analyzePixelBuffer:regionOfInterest:error:](self, "analyzePixelBuffer:regionOfInterest:error:", [a3 pixelBuffer], 0, x, y, width, height);
  double v16 = objc_msgSend(v15, "na_filter:", &__block_literal_global_30_0);

  [v13 unionSet:v16];
  double v17 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self _filterPackageEvents:v14 backgroundEvents:v13];

  double v18 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self backgroundEvents];
  double v19 = [v13 allObjects];
  [v18 addObjectsFromArray:v19];

  float v20 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self backgroundEvents];
  unint64_t v21 = [v20 count];

  if (v21 >= 0x65)
  {
    do
    {
      CGRect v22 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self backgroundEvents];
      objc_msgSend(v22, "hmf_removeFirstObject");

      CGRect v23 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self backgroundEvents];
      unint64_t v24 = [v23 count];
    }
    while (v24 > 0x64);
  }

  return v17;
}

BOOL __124__HMICameraVideoFrameAnalyzerSignificantActivity_analyzeBackgroundFrame_packageEvents_newBackgroundEvents_regionOfInterest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  if (v4 == v5)
  {
    double v6 = [v3 confidence];
    [v6 value];
    if (v7 > 0.41)
    {
      BOOL v8 = 1;
LABEL_20:

      goto LABEL_21;
    }
    unint64_t v21 = v6;
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  if (v9 == v10)
  {
    double v11 = [v3 confidence];
    [v11 value];
    if (v12 > 0.44)
    {

      BOOL v8 = 1;
      goto LABEL_19;
    }
    float v20 = v11;
  }
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  if (v13 == v14
    && ([v3 confidence],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 value],
        v15 > 0.42))
  {

    BOOL v8 = 1;
  }
  else
  {
    uint64_t v16 = objc_opt_class();
    if (v16 == objc_opt_class())
    {
      double v17 = [v3 confidence];
      [v17 value];
      BOOL v8 = v18 > 0.24;
    }
    else
    {
      BOOL v8 = 0;
    }
    if (v13 == v14) {
  }
    }
  if (v9 == v10) {

  }
LABEL_19:
  double v6 = v21;
  if (v4 == v5) {
    goto LABEL_20;
  }
LABEL_21:

  return v8;
}

- (id)recognizeEvents:(id)a3 frame:(id)a4 regionOfInterest:(CGRect)a5 homeUUID:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a4;
  id v14 = a6;
  id v15 = a3;
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  BOOL IsNull = CGRectIsNull(v27);
  double v17 = 0.0;
  if (IsNull) {
    double v18 = 1.0;
  }
  else {
    double v18 = height;
  }
  if (IsNull) {
    double v19 = 1.0;
  }
  else {
    double v19 = width;
  }
  if (IsNull) {
    double v20 = 0.0;
  }
  else {
    double v20 = y;
  }
  if (!IsNull) {
    double v17 = x;
  }
  unint64_t v21 = -[HMICameraVideoFrameAnalyzerSignificantActivity _eventsWithClassificationsFromEvents:videoFrame:regionOfInterest:homeUUID:](self, "_eventsWithClassificationsFromEvents:videoFrame:regionOfInterest:homeUUID:", v15, v13, v14, v17, v20, v19, v18);

  if (v13) {
    [v13 presentationTimeStamp];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  CGRect v22 = -[HMICameraVideoFrameAnalyzerSignificantActivity _eventsWithSessionEntitiesFromEvents:regionOfInterest:timeStamp:homeUUID:](self, "_eventsWithSessionEntitiesFromEvents:regionOfInterest:timeStamp:homeUUID:", v21, v25, v14, x, y, width, height);

  CGRect v23 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self eventsWithFaceEventsFromTorsoEventsFromEvents:v22 homeUUID:v14];

  return v23;
}

- (id)analyzePixelBuffer:(__CVBuffer *)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (CGRectIsNull(a4))
  {
    double v12 = [MEMORY[0x263EFFA08] set];
  }
  else
  {
    double Size = HMICVPixelBufferGetSize(a3);
    HMICGRectPixelFromNormalized(x, y, width, height, Size, v14);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(HMICameraVideoFrameAnalyzerSignificantActivity *)self inputDimensions];
    long long v25 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a3, CVPixelBufferGetPixelFormatType(a3), 0, a5, v16, v18, v20, v22, v23, v24);
    double v26 = HMICVPixelBufferGetSize(a3);
    double v12 = -[HMICameraVideoFrameAnalyzerSignificantActivity _predictEventsFromCropPixelBuffer:cropRect:imageSize:error:](self, "_predictEventsFromCropPixelBuffer:cropRect:imageSize:error:", v25, a5, v16, v18, v20, v22, v26, v27);
    CVPixelBufferRelease(v25);
  }
  return v12;
}

- (id)_predictEventsFromCropPixelBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4 imageSize:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v15 = [MEMORY[0x263EFF980] array];
  double v16 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self significantActivityFcosDetector];
  LOBYTE(a6) = [v16 predict:a3 detectedObjects:v15 error:a6];

  if (a6)
  {
    double v17 = +[HMIObjectDetectionUtils convertObjectDetections:cropRect:originalImageSize:](HMIObjectDetectionUtils, "convertObjectDetections:cropRect:originalImageSize:", v15, x, y, v10, v9, width, height);
    double v18 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self _analyzerEventsFromObjectDetections:v17];
  }
  else
  {
    double v18 = [MEMORY[0x263EFFA08] set];
  }

  return v18;
}

- (id)flushAndGetAnalysisStateUpdateForHome:(id)a3 enableFaceClassification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = 0;
  if (v6 && v4)
  {
    BOOL v8 = +[HMIPreference sharedInstance];
    int v9 = [v8 shouldEnableTorsoRecognition];

    if (!v9)
    {
LABEL_6:
      double v7 = 0;
      goto LABEL_10;
    }
    double v10 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self sessionEntityManager];
    double v11 = [v10 updateTorsoModelAndGetTorsoAnnotationsForHome:v6];

    if (objc_msgSend(v11, "hmf_isEmpty"))
    {

      goto LABEL_6;
    }
    double v12 = (void *)MEMORY[0x22A641C70]();
    id v13 = self;
    CGFloat v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double v15 = HMFGetLogIdentifier();
      int v19 = 138543618;
      double v20 = v15;
      __int16 v21 = 2048;
      uint64_t v22 = [v11 count];
      _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_INFO, "%{public}@Creating analysis state update with %lu torso annotations", (uint8_t *)&v19, 0x16u);
    }
    double v16 = [HMIAnalysisStateUpdate alloc];
    double v17 = [MEMORY[0x263EFFA08] setWithArray:v11];
    double v7 = [(HMIAnalysisStateUpdate *)v16 initWithTorsoAnnotations:v17];
  }
LABEL_10:

  return v7;
}

- (id)eventsWithFaceEventsFromTorsoEventsFromEvents:(id)a3 homeUUID:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __105__HMICameraVideoFrameAnalyzerSignificantActivity_eventsWithFaceEventsFromTorsoEventsFromEvents_homeUUID___block_invoke;
  v10[3] = &unk_26477E840;
  id v11 = v6;
  double v12 = self;
  id v7 = v6;
  BOOL v8 = objc_msgSend(a3, "na_map:", v10);

  return v8;
}

HMIVideoAnalyzerEventPerson *__105__HMICameraVideoFrameAnalyzerSignificantActivity_eventsWithFaceEventsFromTorsoEventsFromEvents_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 torso];
  id v7 = [v6 torsoRecognition];
  BOOL v8 = [v7 classification];
  int v9 = [v8 personUUID];

  if (v9)
  {
    double v10 = [v5 face];
    id v11 = [(HMIVideoAnalyzerEventFace *)v10 faceRecognition];
    if (!v11)
    {
      id v11 = [(HMIVideoAnalyzerEvent *)v10 userInfo];
      double v12 = [v11 objectForKeyedSubscript:@"FaceFilteredState"];
      id v13 = HMIFaceFilteredStateAsString(2);
      if (([v12 isEqualToString:v13] & 1) == 0)
      {
        uint64_t v98 = a1;
        double v16 = [(HMIVideoAnalyzerEvent *)v10 userInfo];
        double v17 = [v16 objectForKeyedSubscript:@"FaceFilteredState"];
        double v18 = HMIFaceFilteredStateAsString(4);
        char v19 = [v17 isEqualToString:v18];

        if ((v19 & 1) == 0)
        {
          v97 = [v5 torso];
          v96 = [v97 torsoRecognition];
          double v20 = [v96 classification];
          __int16 v21 = +[HMIPersonsModelManager sharedInstance];
          uint64_t v22 = v98;
          uint64_t v23 = *(void *)(v98 + 32);
          double v24 = [v20 personUUID];
          long long v25 = [v20 sourceUUID];
          uint64_t v26 = [v21 faceCropFromTorsoModelForHomeUUID:v23 personUUID:v24 sourceUUID:v25];

          v95 = (void *)v26;
          if (v26)
          {
            double v27 = [MEMORY[0x263F08C38] UUID];
            double v28 = [MEMORY[0x263F08C38] UUID];
            double v29 = [MEMORY[0x263F08C38] UUID];
            v88 = +[HMIFaceprint sentinelFaceprintWithUUID:v27 modelUUID:v28 faceCropUUID:v29];

            id v30 = [HMIPersonsModelPrediction alloc];
            double v31 = [v20 sourceUUID];
            id v32 = [v20 personUUID];
            id v33 = NSNumber;
            [v20 confidence];
            v34 = objc_msgSend(v33, "numberWithDouble:");
            uint64_t v35 = [(HMIPersonsModelPrediction *)v30 initWithSourceUUID:v31 personUUID:v32 confidence:v34 linkedEntityUUID:0];

            char v36 = +[HMIPersonsModelManager sharedInstance];
            uint64_t v37 = *(void *)(v98 + 32);
            id v103 = 0;
            v92 = (void *)v35;
            double v38 = [v36 linkedPredictionsForPrediction:v35 homeUUID:v37 error:&v103];
            id v91 = v103;

            if (!v38 || objc_msgSend(v38, "hmf_isEmpty"))
            {
              v93 = v38;
              id v39 = (void *)MEMORY[0x22A641C70]();
              id v40 = *(id *)(v98 + 40);
              v41 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                uint64_t v42 = HMFGetLogIdentifier();
                __int16 v43 = [v20 personUUID];
                long long v44 = *(void **)(v98 + 32);
                *(_DWORD *)buf = 138544130;
                v105 = v42;
                __int16 v106 = 2112;
                v107 = v43;
                __int16 v108 = 2112;
                v109 = v44;
                __int16 v110 = 2112;
                id v111 = v91;
                _os_log_impl(&dword_225DC6000, v41, OS_LOG_TYPE_ERROR, "%{public}@Couldn't retrieve linked predictions from torsomodel for personUUID: %@ homeUUID: %@ error: %@", buf, 0x2Au);

                uint64_t v22 = v98;
              }

              double v38 = [MEMORY[0x263EFFA08] setWithObject:v92];
            }
            if (v10)
            {
              long long v45 = (void *)MEMORY[0x22A641C70]();
              id v46 = *(id *)(v22 + 40);
              v47 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                v48 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v105 = v48;
                __int16 v106 = 2112;
                v107 = v10;
                _os_log_impl(&dword_225DC6000, v47, OS_LOG_TYPE_INFO, "%{public}@Dropping Face event: %@ due to torso recognition", buf, 0x16u);

                uint64_t v22 = v98;
              }

              uint64_t v49 = *(void *)(v22 + 32);
              v50 = [*(id *)(v22 + 40) analyzerConfiguration];
              v51 = [v50 camera];
              +[HMIAnalytics sendEventForFaceEvent:v10 homePersonManagerUUID:v49 camera:v51];
            }
            v90 = v20;
            v99[0] = MEMORY[0x263EF8330];
            v99[1] = 3221225472;
            v99[2] = __105__HMICameraVideoFrameAnalyzerSignificantActivity_eventsWithFaceEventsFromTorsoEventsFromEvents_homeUUID___block_invoke_39;
            v99[3] = &unk_26477E818;
            id v52 = v96;
            id v100 = v52;
            id v53 = v95;
            id v101 = v53;
            id v54 = v88;
            id v102 = v54;
            v94 = v38;
            uint64_t v55 = objc_msgSend(v38, "na_map:", v99);
            v56 = [HMIFaceRecognition alloc];
            v57 = [v52 predictedLinkedEntityUUIDs];
            uint64_t v58 = [v52 sessionEntityAssignment];
            v59 = [v52 sessionEntityUUID];
            v60 = v56;
            v89 = v54;
            v61 = (void *)v55;
            v62 = [(HMIFaceRecognition *)v60 initWithFaceCrop:v53 faceprint:v54 classifications:v55 predictedLinkedEntityUUIDs:v57 faceQualityScore:v58 sessionEntityAssignment:v59 sessionEntityUUID:1.0];

            v63 = [HMIVideoAnalyzerEventFace alloc];
            v64 = [v97 confidence];
            [v97 boundingBox];
            v65 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:faceRecognition:](v63, "initWithConfidence:boundingBox:faceRecognition:", v64, v62);

            v66 = (void *)MEMORY[0x22A641C70]();
            id v67 = *(id *)(v98 + 40);
            v68 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
            {
              v69 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v105 = v69;
              __int16 v106 = 2112;
              v107 = v65;
              __int16 v108 = 2112;
              v109 = v97;
              _os_log_impl(&dword_225DC6000, v68, OS_LOG_TYPE_INFO, "%{public}@Creating face recognition event: %@ from torso recognition event: %@", buf, 0x20u);
            }
            v70 = [HMIVideoAnalyzerEventPerson alloc];
            v71 = [v5 confidence];
            [v5 boundingBox];
            double v73 = v72;
            double v75 = v74;
            double v77 = v76;
            double v79 = v78;
            v80 = [v5 torso];
            CGFloat v14 = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:torso:](v70, "initWithConfidence:boundingBox:face:torso:", v71, v65, v80, v73, v75, v77, v79);

            v81 = v96;
            double v20 = v90;
          }
          else
          {
            v82 = (void *)MEMORY[0x22A641C70]();
            id v83 = *(id *)(v98 + 40);
            v84 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              v85 = HMFGetLogIdentifier();
              v86 = [v20 personUUID];
              v87 = *(void **)(v98 + 32);
              *(_DWORD *)buf = 138543874;
              v105 = v85;
              __int16 v106 = 2112;
              v107 = v86;
              __int16 v108 = 2112;
              v109 = v87;
              _os_log_impl(&dword_225DC6000, v84, OS_LOG_TYPE_ERROR, "%{public}@Error while retrieving facecrop from torsomodel for personUUID: %@ homeUUID: %@", buf, 0x20u);
            }
            CGFloat v14 = (HMIVideoAnalyzerEventPerson *)v5;
            v81 = v96;
          }

          goto LABEL_10;
        }
LABEL_9:
        CGFloat v14 = (HMIVideoAnalyzerEventPerson *)v5;
LABEL_10:

        goto LABEL_12;
      }
    }
    goto LABEL_9;
  }
  CGFloat v14 = (HMIVideoAnalyzerEventPerson *)v3;
LABEL_12:

  return v14;
}

HMIFaceClassification *__105__HMICameraVideoFrameAnalyzerSignificantActivity_eventsWithFaceEventsFromTorsoEventsFromEvents_homeUUID___block_invoke_39(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [HMIFaceClassification alloc];
  id v5 = [v3 personUUID];
  id v6 = [v3 sourceUUID];
  id v7 = [*(id *)(a1 + 32) sessionEntityUUID];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  double v10 = [v3 confidence];

  [v10 doubleValue];
  id v11 = -[HMIFaceClassification initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:fromTorsoClassification:familiarity:](v4, "initWithUUID:sourceUUID:sessionEntityUUID:faceCrop:faceprint:confidence:fromTorsoClassification:familiarity:", v5, v6, v7, v9, v8, 1, 2);

  return v11;
}

- (id)_simulatedEventForEventClass:(Class)a3
{
  v32[4] = *MEMORY[0x263EF8340];
  v31[0] = objc_opt_class();
  v32[0] = @"personDetected";
  v31[1] = objc_opt_class();
  v32[1] = @"petDetected";
  v31[2] = objc_opt_class();
  v32[2] = @"vehicleDetected";
  v31[3] = objc_opt_class();
  v32[3] = @"packageDetected";
  id v5 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
  id v6 = [v5 objectForKeyedSubscript:a3];
  if (!v6)
  {
    id v13 = 0;
    goto LABEL_25;
  }
  id v7 = +[HMIPreference sharedInstance];
  uint64_t v8 = [v7 valuePreferenceForKey:v6 defaultValue:@"none" withParser:&__block_literal_global_51];

  uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D9A98A0];
  int v10 = [v9 containsObject:v8];

  if (v10)
  {
    id v11 = [&unk_26D9A9D00 objectForKeyedSubscript:v8];
    uint64_t v12 = [v11 integerValue];

    if ((Class)objc_opt_class() != a3 || v12 != 1)
    {
      if (v12 == 2)
      {
        double v14 = 1.0;
      }
      else
      {
        double v14 = 0.0;
        if (v12 == 1)
        {
          double v15 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self highConfidenceThresholds];
          double v16 = [v15 objectForKeyedSubscript:a3];
          [v16 doubleValue];
          double v14 = v17 + -0.01;
        }
      }
      double v18 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self mediumConfidenceThresholds];
      char v19 = [v18 objectForKeyedSubscript:a3];
      v30[0] = v19;
      double v20 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self highConfidenceThresholds];
      __int16 v21 = [v20 objectForKeyedSubscript:a3];
      v30[1] = v21;
      uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];

      if ((Class)objc_opt_class() == a3)
      {
        uint64_t v23 = HMIVideoAnalyzerEventPerson;
      }
      else
      {
        if ((Class)objc_opt_class() == a3)
        {
          double v27 = [HMIVideoAnalyzerEventFace alloc];
          long long v25 = [[HMIConfidence alloc] initWithValue:v22 levelThresholds:v14];
          uint64_t v26 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v27, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v25, &unk_26D9A95B8, &unk_26D9A95B8, 0, 0, 0.0, 0.0, 1.0, 1.0);
          goto LABEL_22;
        }
        if ((Class)objc_opt_class() == a3)
        {
          double v28 = [HMIVideoAnalyzerEventTorso alloc];
          long long v25 = [[HMIConfidence alloc] initWithValue:v22 levelThresholds:v14];
          uint64_t v26 = -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](v28, "initWithConfidence:boundingBox:roll:torsoRecognition:", v25, &unk_26D9A95B8, 0, 0.0, 0.0, 1.0, 1.0);
          goto LABEL_22;
        }
        if ((Class)objc_opt_class() == a3)
        {
          uint64_t v23 = HMIVideoAnalyzerEventPet;
        }
        else if ((Class)objc_opt_class() == a3)
        {
          uint64_t v23 = HMIVideoAnalyzerEventVehicle;
        }
        else
        {
          if ((Class)objc_opt_class() != a3)
          {
            id v13 = 0;
LABEL_23:

            goto LABEL_24;
          }
          uint64_t v23 = HMIVideoAnalyzerEventPackage;
        }
      }
      id v24 = [v23 alloc];
      long long v25 = [[HMIConfidence alloc] initWithValue:v22 levelThresholds:v14];
      uint64_t v26 = objc_msgSend(v24, "initWithConfidence:boundingBox:", v25, 0.0, 0.0, 1.0, 1.0);
LABEL_22:
      id v13 = (void *)v26;

      goto LABEL_23;
    }
  }
  id v13 = 0;
LABEL_24:

LABEL_25:
  return v13;
}

__CFString *__79__HMICameraVideoFrameAnalyzerSignificantActivity__simulatedEventForEventClass___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 lowercaseString];
LABEL_7:
    id v6 = v3;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [v2 BOOLValue];
    id v5 = @"none";
    if (v4) {
      id v5 = @"high";
    }
    id v3 = v5;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (id)_targetEventsSetFromEventTriggers:(int64_t)a3 enableFaceClassification:(BOOL)a4 enableTorsoRecognition:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  char v7 = a3;
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  if ((v7 & 2) != 0)
  {
    [v8 addObject:objc_opt_class()];
    if (v6)
    {
      [v8 addObject:objc_opt_class()];
      if (v5) {
        [v8 addObject:objc_opt_class()];
      }
    }
  }
  if ((v7 & 4) != 0)
  {
    [v8 addObject:objc_opt_class()];
    if ((v7 & 8) == 0)
    {
LABEL_7:
      if ((v7 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_7;
  }
  [v8 addObject:objc_opt_class()];
  if ((v7 & 0x10) != 0) {
LABEL_8:
  }
    [v8 addObject:objc_opt_class()];
LABEL_9:
  uint64_t v9 = (void *)[v8 copy];

  return v9;
}

- (id)_analyzerEventsFromObjectDetections:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__HMICameraVideoFrameAnalyzerSignificantActivity__analyzerEventsFromObjectDetections___block_invoke;
  v7[3] = &unk_26477E888;
  v7[4] = self;
  int v4 = objc_msgSend(a3, "na_map:", v7);
  BOOL v5 = [v3 setWithArray:v4];

  return v5;
}

HMIVideoAnalyzerEventFace *__86__HMICameraVideoFrameAnalyzerSignificantActivity__analyzerEventsFromObjectDetections___block_invoke(uint64_t a1, void *a2)
{
  v38[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 labelIndex];
  objc_opt_class();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [*(id *)(a1 + 32) mediumConfidenceThresholds];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];
  v38[0] = v6;
  char v7 = [*(id *)(a1 + 32) highConfidenceThresholds];
  uint64_t v8 = [v7 objectForKeyedSubscript:v4];
  v38[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];

  if (v4 != (id)objc_opt_class())
  {
    if (v4 == (id)objc_opt_class())
    {
      double v15 = [HMIVideoAnalyzerEventFace alloc];
      double v16 = [HMIConfidence alloc];
      [v3 confidence];
      double v14 = -[HMIConfidence initWithValue:levelThresholds:](v16, "initWithValue:levelThresholds:", v9);
      [v3 boundingBox];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      long long v25 = [v3 yaw];
      uint64_t v26 = [v3 roll];
      int v10 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v15, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v14, v25, v26, 0, 0, v18, v20, v22, v24);
    }
    else
    {
      if (v4 != (id)objc_opt_class())
      {
        if (v4 == (id)objc_opt_class())
        {
          id v11 = HMIVideoAnalyzerEventPet;
        }
        else if (v4 == (id)objc_opt_class())
        {
          id v11 = HMIVideoAnalyzerEventVehicle;
        }
        else
        {
          if (v4 != (id)objc_opt_class())
          {
            int v10 = 0;
            goto LABEL_14;
          }
          id v11 = HMIVideoAnalyzerEventPackage;
        }
        goto LABEL_9;
      }
      double v27 = [HMIVideoAnalyzerEventTorso alloc];
      double v28 = [HMIConfidence alloc];
      [v3 confidence];
      double v14 = -[HMIConfidence initWithValue:levelThresholds:](v28, "initWithValue:levelThresholds:", v9);
      [v3 boundingBox];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      long long v25 = [v3 roll];
      int v10 = -[HMIVideoAnalyzerEventTorso initWithConfidence:boundingBox:roll:torsoRecognition:](v27, "initWithConfidence:boundingBox:roll:torsoRecognition:", v14, v25, 0, v30, v32, v34, v36);
    }

    goto LABEL_13;
  }
  id v11 = HMIVideoAnalyzerEventPerson;
LABEL_9:
  id v12 = [v11 alloc];
  id v13 = [HMIConfidence alloc];
  [v3 confidence];
  double v14 = -[HMIConfidence initWithValue:levelThresholds:](v13, "initWithValue:levelThresholds:", v9);
  [v3 boundingBox];
  int v10 = (HMIVideoAnalyzerEventFace *)objc_msgSend(v12, "initWithConfidence:boundingBox:", v14);
LABEL_13:

LABEL_14:
  return v10;
}

- (id)_filterPackageEvents:(id)a3 backgroundEvents:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__HMICameraVideoFrameAnalyzerSignificantActivity__filterPackageEvents_backgroundEvents___block_invoke;
  v9[3] = &unk_26477E050;
  id v10 = v5;
  id v6 = v5;
  char v7 = objc_msgSend(a3, "na_filter:", v9);

  return v7;
}

uint64_t __88__HMICameraVideoFrameAnalyzerSignificantActivity__filterPackageEvents_backgroundEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__HMICameraVideoFrameAnalyzerSignificantActivity__filterPackageEvents_backgroundEvents___block_invoke_2;
  v8[3] = &unk_26477E050;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

BOOL __88__HMICameraVideoFrameAnalyzerSignificantActivity__filterPackageEvents_backgroundEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    [*(id *)(a1 + 32) boundingBox];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [v3 boundingBox];
    HMICGRectIntersectionOverUnion(v9, v11, v13, v15, v16, v17, v18, v19);
    BOOL v7 = v20 > 0.4;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class()))
    {
      [*(id *)(a1 + 32) boundingBox];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      [v3 boundingBox];
      v35.origin.double x = v29;
      v35.origin.double y = v30;
      v35.size.double width = v31;
      v35.size.double height = v32;
      v34.origin.double x = v22;
      v34.origin.double y = v24;
      v34.size.double width = v26;
      v34.size.double height = v28;
      BOOL v7 = CGRectIntersectsRect(v34, v35);
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)_eventsWithClassificationsFromEvents:(id)a3 videoFrame:(id)a4 regionOfInterest:(CGRect)a5 homeUUID:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  double v16 = [MEMORY[0x263EFF9C0] set];
  BOOL v19 = +[HMIPreference isProductTypeJ105]
     && (+[HMIThermalMonitor sharedInstance],
         double v17 = objc_claimAutoreleasedReturnValue(),
         unint64_t v18 = [v17 thermalLevel],
         v17,
         v18 > 1)
     || +[HMIPreference isProductTypeB238];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  int v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  int v38 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __124__HMICameraVideoFrameAnalyzerSignificantActivity__eventsWithClassificationsFromEvents_videoFrame_regionOfInterest_homeUUID___block_invoke;
  void v25[3] = &unk_26477E8B0;
  id v20 = v16;
  CGFloat v30 = v39;
  id v26 = v20;
  double v27 = self;
  id v21 = v14;
  id v28 = v21;
  BOOL v36 = v19;
  id v22 = v15;
  id v29 = v22;
  CGFloat v31 = v37;
  CGFloat v32 = x;
  CGFloat v33 = y;
  CGFloat v34 = width;
  CGFloat v35 = height;
  [v13 enumerateObjectsUsingBlock:v25];
  double v23 = (void *)[v20 copy];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  return v23;
}

void __124__HMICameraVideoFrameAnalyzerSignificantActivity__eventsWithClassificationsFromEvents_videoFrame_regionOfInterest_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (!v5)
  {
    [*(id *)(a1 + 32) addObject:v3];
    goto LABEL_30;
  }
  uint64_t v6 = [v5 face];
  if (!v6 || (uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8), v8 = *(_DWORD *)(v7 + 24), v8 > 4))
  {
    uint64_t v14 = 0;
    goto LABEL_18;
  }
  *(_DWORD *)(v7 + 24) = v8 + 1;
  double v9 = [[HMISignpost alloc] initWithName:@"ClassifyFaceEvent"];
  double v10 = *(void **)(*(void *)(a1 + 40) + 40);
  uint64_t v11 = [*(id *)(a1 + 48) pixelBuffer];
  uint64_t v12 = *(unsigned __int8 *)(a1 + 112);
  uint64_t v13 = *(void *)(a1 + 56);
  id v43 = 0;
  uint64_t v14 = [v10 classifyFaceEvent:v6 pixelBuffer:v11 fastMode:v12 homeUUID:v13 error:&v43];
  id v15 = v43;
  uint64_t v16 = [(HMISignpost *)v9 end];
  if (!v14)
  {
    unint64_t v18 = (void *)MEMORY[0x22A641C70](v16);
    id v19 = *(id *)(a1 + 40);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = int v40 = v18;
      *(_DWORD *)buf = 138543874;
      long long v45 = v21;
      __int16 v46 = 2112;
      v47 = v6;
      __int16 v48 = 2112;
      id v49 = v15;
      id v22 = "%{public}@Faceprinting failed for face: %@, error: %@";
      double v23 = v20;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
      uint32_t v25 = 32;
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  double v17 = [(id)v14 faceRecognition];

  if (!v17)
  {
    unint64_t v18 = (void *)MEMORY[0x22A641C70]();
    id v19 = *(id *)(a1 + 40);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = int v40 = v18;
      *(_DWORD *)buf = 138543618;
      long long v45 = v21;
      __int16 v46 = 2112;
      v47 = v6;
      id v22 = "%{public}@Face: %@ didn't produce any classifications";
      double v23 = v20;
      os_log_type_t v24 = OS_LOG_TYPE_INFO;
      uint32_t v25 = 22;
LABEL_15:
      _os_log_impl(&dword_225DC6000, v23, v24, v22, buf, v25);

      unint64_t v18 = v40;
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_17:

LABEL_18:
  id v26 = [v5 torso];
  if (v26 && (uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8), v28 = *(_DWORD *)(v27 + 24), v28 <= 4))
  {
    *(_DWORD *)(v27 + 24) = v28 + 1;
    id v29 = [[HMISignpost alloc] initWithName:@"ClassifyTorsoEvent"];
    CGFloat v30 = *(void **)(*(void *)(a1 + 40) + 48);
    uint64_t v31 = [*(id *)(a1 + 48) pixelBuffer];
    uint64_t v32 = *(void *)(a1 + 56);
    id v42 = 0;
    uint64_t v33 = objc_msgSend(v30, "classifyTorsoEvent:regionOfInterest:pixelBuffer:homeUUID:error:", v26, v31, v32, &v42, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    id v34 = v42;
    uint64_t v35 = [(HMISignpost *)v29 end];
    if (!v33)
    {
      context = (void *)MEMORY[0x22A641C70](v35);
      id v41 = *(id *)(a1 + 40);
      BOOL v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        int v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        long long v45 = v38;
        __int16 v46 = 2112;
        v47 = v26;
        __int16 v48 = 2112;
        id v49 = v34;
        _os_log_impl(&dword_225DC6000, v36, OS_LOG_TYPE_ERROR, "%{public}@Torsoprinting failed for torso: %@, error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v33 = 0;
  }
  if (v14 | v33)
  {
    uint64_t v37 = (void *)[v5 copyWithFaceEvent:v14 torso:v33];
    [*(id *)(a1 + 32) addObject:v37];
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v3];
  }

LABEL_30:
}

- (id)_eventsWithSessionEntitiesFromEvents:(id)a3 regionOfInterest:(CGRect)a4 timeStamp:(id *)a5 homeUUID:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x263EFF9C0];
  id v15 = a3;
  uint64_t v16 = [v14 set];
  double v17 = [MEMORY[0x263EFF9C0] set];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __123__HMICameraVideoFrameAnalyzerSignificantActivity__eventsWithSessionEntitiesFromEvents_regionOfInterest_timeStamp_homeUUID___block_invoke;
  v29[3] = &unk_26477E8D8;
  id v18 = v17;
  id v30 = v18;
  id v19 = v16;
  id v31 = v19;
  objc_msgSend(v15, "na_each:", v29);

  id v20 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self sessionEntityManager];

  if (!v20)
  {
    id v21 = objc_alloc_init(HMISessionEntityManager);
    sessionEntityManager = self->_sessionEntityManager;
    self->_sessionEntityManager = v21;
  }
  if ((objc_msgSend(v18, "hmf_isEmpty") & 1) == 0)
  {
    double v23 = [(HMICameraVideoFrameAnalyzerSignificantActivity *)self sessionEntityManager];
    long long v27 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    os_log_type_t v24 = objc_msgSend(v23, "assignSessionEntitiesToPersonEvents:regionOfInterest:timeStamp:homeUUID:", v18, &v27, v13, x, y, width, height);

    [v19 unionSet:v24];
  }
  uint32_t v25 = (void *)[v19 copy];

  return v25;
}

void __123__HMICameraVideoFrameAnalyzerSignificantActivity__eventsWithSessionEntitiesFromEvents_regionOfInterest_timeStamp_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v7;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = v7;
  }
  [v5 addObject:v6];
}

+ (NSDictionary)classHierarchyMap
{
  if (classHierarchyMap_onceToken != -1) {
    dispatch_once(&classHierarchyMap_onceToken, &__block_literal_global_84);
  }
  id v2 = (void *)classHierarchyMap_hierarchyMap;
  return (NSDictionary *)v2;
}

void __67__HMICameraVideoFrameAnalyzerSignificantActivity_classHierarchyMap__block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26D9A9588;
  v3[0] = objc_opt_class();
  v2[1] = &unk_26D9A95D0;
  v3[1] = objc_opt_class();
  v2[2] = &unk_26D9A95A0;
  v3[2] = objc_opt_class();
  v2[3] = &unk_26D9A95E8;
  v3[3] = objc_opt_class();
  v2[4] = &unk_26D9A9600;
  v3[4] = objc_opt_class();
  v2[5] = &unk_26D9A9618;
  v3[5] = objc_opt_class();
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)classHierarchyMap_hierarchyMap;
  classHierarchyMap_hierarchyMap = v0;
}

+ (id)labelIndexForEventClass:(Class)a3
{
  if (labelIndexForEventClass__onceToken != -1) {
    dispatch_once(&labelIndexForEventClass__onceToken, &__block_literal_global_94);
  }
  id v4 = (void *)labelIndexForEventClass__map;
  return (id)[v4 objectForKeyedSubscript:a3];
}

void __74__HMICameraVideoFrameAnalyzerSignificantActivity_labelIndexForEventClass___block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v3[0] = &unk_26D9A9588;
  v2[1] = objc_opt_class();
  v3[1] = &unk_26D9A95A0;
  v2[2] = objc_opt_class();
  v3[2] = &unk_26D9A95D0;
  v2[3] = objc_opt_class();
  v3[3] = &unk_26D9A95E8;
  v2[4] = objc_opt_class();
  v3[4] = &unk_26D9A9600;
  v2[5] = objc_opt_class();
  v3[5] = &unk_26D9A9618;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)labelIndexForEventClass__map;
  labelIndexForEventClass__map = v0;
}

+ (id)desLabelIndexForEventClass:(Class)a3
{
  if (desLabelIndexForEventClass__onceToken != -1) {
    dispatch_once(&desLabelIndexForEventClass__onceToken, &__block_literal_global_96);
  }
  id v4 = (void *)desLabelIndexForEventClass__map;
  return (id)[v4 objectForKeyedSubscript:a3];
}

void __77__HMICameraVideoFrameAnalyzerSignificantActivity_desLabelIndexForEventClass___block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v3[0] = &unk_26D9A9588;
  v2[1] = objc_opt_class();
  v3[1] = &unk_26D9A9630;
  v2[2] = objc_opt_class();
  v3[2] = &unk_26D9A95D0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)desLabelIndexForEventClass__map;
  desLabelIndexForEventClass__map = v0;
}

- (NSDictionary)mediumConfidenceThresholds
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)highConfidenceThresholds
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (HMISignificantActivityFcosDetector)significantActivityFcosDetector
{
  return (HMISignificantActivityFcosDetector *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)backgroundEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)backgroundTimeStamp
{
  objc_copyStruct(retstr, &self->_backgroundTimeStamp, 24, 1, 0);
  return result;
}

- (void)setBackgroundTimeStamp:(id *)a3
{
}

- (HMIFaceClassifierVIP)faceClassifier
{
  return (HMIFaceClassifierVIP *)objc_getProperty(self, a2, 40, 1);
}

- (HMITorsoClassifier)torsoClassifier
{
  return (HMITorsoClassifier *)objc_getProperty(self, a2, 48, 1);
}

- (HMFOSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (HMIVideoAnalyzerConfiguration)analyzerConfiguration
{
  return (HMIVideoAnalyzerConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (HMISessionEntityManager)sessionEntityManager
{
  return (HMISessionEntityManager *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEntityManager, 0);
  objc_storeStrong((id *)&self->_analyzerConfiguration, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_torsoClassifier, 0);
  objc_storeStrong((id *)&self->_faceClassifier, 0);
  objc_storeStrong((id *)&self->_backgroundEvents, 0);
  objc_storeStrong((id *)&self->_significantActivityFcosDetector, 0);
  objc_storeStrong((id *)&self->_highConfidenceThresholds, 0);
  objc_storeStrong((id *)&self->_mediumConfidenceThresholds, 0);
}

@end