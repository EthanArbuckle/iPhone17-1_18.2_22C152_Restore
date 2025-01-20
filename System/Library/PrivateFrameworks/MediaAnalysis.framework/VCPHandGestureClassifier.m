@interface VCPHandGestureClassifier
+ (float)enableFlip;
+ (id)twoHandGestureTypes;
- (VCPHandGestureClassifier)init;
- (VCPHandGestureClassifier)initWithMinHandSize:(float)a3 options:(id)a4;
- (id)existingGroupIDs;
- (int)processLeftHand:(id)a3 rightHand:(id)a4 results:(id)a5 resultsFlip:(id)a6 faceRects:(id)a7 faceYaws:(id)a8;
- (int)processPerson:(int)a3 withObservations:(id)a4 andFaceRects:(id)a5 faceYaws:(id)a6;
- (int)rotationInDegrees;
- (void)reset;
- (void)setHandGestureForHand:(id)a3 withResult:(id)a4 andMapping:(id)a5;
- (void)setRotationInDegrees:(int)a3;
@end

@implementation VCPHandGestureClassifier

+ (float)enableFlip
{
  return 1.0;
}

- (VCPHandGestureClassifier)init
{
  return 0;
}

- (VCPHandGestureClassifier)initWithMinHandSize:(float)a3 options:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)VCPHandGestureClassifier;
  v7 = [(VCPHandGestureClassifier *)&v32 init];
  if (!v7)
  {
    v19 = 0;
    goto LABEL_14;
  }
  v8 = objc_alloc_init(VCPCoreMLFeatureProviderGestureVideo);
  featureProvider = v7->_featureProvider;
  v7->_featureProvider = v8;

  v10 = @"hand_gesture_dynamic_two_hand_5fps";
  v11 = [[VCPCoreMLRequest alloc] initWithModelName:v10];
  gestureCoreMLRequest = v7->_gestureCoreMLRequest;
  v7->_gestureCoreMLRequest = v11;

  v13 = objc_alloc_init(VCPHandGestureMitigator);
  mitigator = v7->_mitigator;
  v7->_mitigator = v13;

  if (!v7->_gestureCoreMLRequest || !v7->_featureProvider || (v16 = v7->_mitigator) == 0)
  {
    v19 = 0;
    goto LABEL_12;
  }
  *(float *)&double v15 = a3;
  [(VCPHandGestureMitigator *)v16 setMinHandSize:v15];
  v17 = [v6 objectForKeyedSubscript:@"MLAneQoS"];
  BOOL v18 = v17 == 0;

  v19 = v7;
  if (!v18)
  {
    v20 = [v6 objectForKeyedSubscript:@"MLAneQoS"];
    v21 = v20;
    if (v20 == (void *)*MEMORY[0x1E4F1E878])
    {
    }
    else
    {
      v22 = [v6 objectForKeyedSubscript:@"MLAneQoS"];
      BOOL v23 = v22 == (void *)*MEMORY[0x1E4F1E880];

      if (!v23)
      {
        v19 = v7;
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v24 = VCPLogInstance();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = [v6 objectForKeyedSubscript:@"MLAneQoS"];
            *(_DWORD *)buf = 138412290;
            v34 = v25;
            _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEFAULT, "Gesture classifier - invalid input CoreML aneExecutionPriority %@", buf, 0xCu);
          }
LABEL_19:

          v19 = v7;
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    uint64_t v28 = [MEMORY[0x1E4F1E9E0] defaultOptions];
    MLOptions = v7->_MLOptions;
    v7->_MLOptions = (MLPredictionOptions *)v28;

    v30 = [v6 objectForKeyedSubscript:@"MLAneQoS"];
    [(MLPredictionOptions *)v7->_MLOptions setAneExecutionPriority:v30];

    v19 = v7;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v31 = [v6 objectForKeyedSubscript:@"MLAneQoS"];
        *(_DWORD *)buf = 138412290;
        v34 = v31;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEBUG, "Gesture classifier - CoreML aneExecutionPriority is set to %@", buf, 0xCu);
      }
      goto LABEL_19;
    }
  }
LABEL_12:

LABEL_14:
  v26 = v19;

  return v26;
}

- (void)reset
{
}

- (void)setRotationInDegrees:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[VCPCoreMLFeatureProviderGestureVideo setRotationInDegrees:](self->_featureProvider, "setRotationInDegrees:");
  mitigator = self->_mitigator;
  [(VCPHandGestureMitigator *)mitigator setRotationInDegrees:v3];
}

- (int)rotationInDegrees
{
  return [(VCPCoreMLFeatureProviderGestureVideo *)self->_featureProvider rotationInDegrees];
}

- (id)existingGroupIDs
{
  return [(VCPCoreMLFeatureProviderGestureVideo *)self->_featureProvider existingGroupIDs];
}

- (void)setHandGestureForHand:(id)a3 withResult:(id)a4 andMapping:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v7 && v8)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v9;
    uint64_t v12 = 0;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v24;
      float v15 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          BOOL v18 = objc_msgSend(v8, "objectForKeyedSubscript:", v17, (void)v23);
          [v18 floatValue];
          float v20 = v19;

          if (v20 > v15)
          {
            v21 = [v11 objectForKeyedSubscript:v17];
            uint64_t v12 = [v21 intValue];

            float v15 = v20;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }
    else
    {
      float v15 = 0.0;
    }

    if ([v7 gestureType])
    {
      if ([v7 gestureType] != v12) {
        goto LABEL_22;
      }
      [v7 gestureConfidence];
      if (v15 <= *(float *)&v22) {
        goto LABEL_22;
      }
    }
    else if (v15 <= 0.5)
    {
      float v15 = 1.0;
      [v7 setGestureType:0];
    }
    else
    {
      [v7 setGestureType:v12];
    }
    *(float *)&double v22 = v15;
    objc_msgSend(v7, "setGestureConfidence:", v22, (void)v23);
  }
LABEL_22:
}

+ (id)twoHandGestureTypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F15EDE90];
}

- (int)processLeftHand:(id)a3 rightHand:(id)a4 results:(id)a5 resultsFlip:(id)a6 faceRects:(id)a7 faceYaws:(id)a8
{
  unint64_t v14 = (unint64_t)a3;
  unint64_t v15 = (unint64_t)a4;
  unint64_t v16 = (unint64_t)a5;
  unint64_t v17 = (unint64_t)a6;
  id v18 = a7;
  id v19 = a8;
  if (v14 | v15)
  {
    if (v16 | v17)
    {
      if (v14)
      {
        if (v16) {
          [(VCPHandGestureClassifier *)self setHandGestureForHand:v14 withResult:v16 andMapping:&unk_1F15EE838];
        }
        if (v17) {
          [(VCPHandGestureClassifier *)self setHandGestureForHand:v14 withResult:v17 andMapping:&unk_1F15EE860];
        }
      }
      if (v15)
      {
        if (v16) {
          [(VCPHandGestureClassifier *)self setHandGestureForHand:v15 withResult:v16 andMapping:&unk_1F15EE860];
        }
        if (v17) {
          [(VCPHandGestureClassifier *)self setHandGestureForHand:v15 withResult:v17 andMapping:&unk_1F15EE838];
        }
      }
      int v20 = [(VCPHandGestureMitigator *)self->_mitigator mitigate:v14 rightHand:v15 featureProvider:self->_featureProvider faceRects:v18 faceYaws:v19];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long v23 = 0;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "processLeftHand : missing results", v23, 2u);
        }
      }
      int v20 = -50;
    }
  }
  else
  {
    int v20 = 0;
  }

  return v20;
}

- (int)processPerson:(int)a3 withObservations:(id)a4 andFaceRects:(id)a5 faceYaws:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v62 = a5;
  id v63 = a6;
  [(VCPCoreMLFeatureProviderGestureVideo *)self->_featureProvider setCurrentGroupID:v8];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v11 = v10;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = [v11 countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v69 != v15) {
          objc_enumerationMutation(v11);
        }
        unint64_t v17 = *(VCPHandObservation **)(*((void *)&v68 + 1) + 8 * i);
        if ([(VCPHandObservation *)v17 chirality] == -1)
        {
          if (!v13 || (float v20 = handArea(v13), v20 < handArea(v17)))
          {
            v21 = v17;

            uint64_t v13 = v21;
            [(VCPHandObservation *)v21 setGestureType:0];
          }
        }
        else if ([(VCPHandObservation *)v17 chirality] == 1)
        {
          if (!v12 || (float v18 = handArea(v12), v18 < handArea(v17)))
          {
            id v19 = v17;

            uint64_t v12 = v19;
            [(VCPHandObservation *)v19 setGestureType:0];
          }
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v14);
  }

  [(VCPCoreMLFeatureProviderGestureVideo *)self->_featureProvider addLeftHand:v13 andRightHand:v12];
  if ([(VCPCoreMLFeatureProviderGestureVideo *)self->_featureProvider ready]
    && (unint64_t)v13 | (unint64_t)v12)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      double v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v73) = v8;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : classify group %d", buf, 8u);
      }
    }
    long long v23 = VCPSignPostLog();
    os_signpost_id_t v24 = os_signpost_id_generate(v23);

    long long v25 = VCPSignPostLog();
    long long v26 = v25;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "VCPHandGestureVideoRequest_classifier", "", buf, 2u);
    }

    [(VCPCoreMLFeatureProviderGestureVideo *)self->_featureProvider setScaleUpSmallHandGroup:1];
    if (!v12)
    {
      [(id)objc_opt_class() enableFlip];
      if (v34 != 0.0)
      {
        id v35 = 0;
        os_log_t log = 0;
LABEL_35:
        [(id)objc_opt_class() enableFlip];
        v41 = 0;
        if (!v13 || v40 == 0.0)
        {
          id v49 = v35;
          goto LABEL_53;
        }
        [(VCPCoreMLFeatureProviderGestureVideo *)self->_featureProvider setLrFlip:1];
        gestureCoreMLRequest = self->_gestureCoreMLRequest;
        if (self->_MLOptions)
        {
          v43 = [(VCPCoreMLRequest *)gestureCoreMLRequest model];
          featureProvider = self->_featureProvider;
          MLOptions = self->_MLOptions;
          v46 = &v65;
          id v65 = v35;
          os_log_t v60 = [v43 predictionFromFeatures:featureProvider options:MLOptions error:&v65];
        }
        else
        {
          v43 = [(VCPCoreMLRequest *)gestureCoreMLRequest model];
          v51 = self->_featureProvider;
          id v64 = v35;
          v46 = &v64;
          os_log_t v60 = [v43 predictionFromFeatures:v51 error:&v64];
        }
        id v49 = *v46;

        if (v60)
        {
          v52 = [v60 featureValueForName:@"classLabel_probs"];
          v53 = v52;
          if (v52)
          {
            v41 = [v52 dictionaryValue];

LABEL_53:
            v54 = VCPSignPostLog();
            v55 = v54;
            if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v55, OS_SIGNPOST_INTERVAL_END, v24, "VCPHandGestureVideoRequest_classifier", "", buf, 2u);
            }

            int v33 = [(VCPHandGestureClassifier *)self processLeftHand:v13 rightHand:v12 results:log resultsFlip:v41 faceRects:v62 faceYaws:v63];
            goto LABEL_66;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v58 = VCPLogInstance();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v58, OS_LOG_TYPE_ERROR, "Failed to get probs", buf, 2u);
            }
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 3)
          {
LABEL_65:
            v41 = 0;
            int v33 = -18;
LABEL_66:

            id v35 = v49;
            goto LABEL_67;
          }
          VCPLogInstance();
          os_log_t v60 = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            id v56 = [v49 description];
            uint64_t v57 = [v56 UTF8String];
            *(_DWORD *)buf = 136315138;
            uint64_t v73 = v57;
            _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_ERROR, "Failed to get output feature %s", buf, 0xCu);
          }
        }

        goto LABEL_65;
      }
    }
    [(VCPCoreMLFeatureProviderGestureVideo *)self->_featureProvider setLrFlip:0];
    v27 = self->_gestureCoreMLRequest;
    if (self->_MLOptions)
    {
      uint64_t v28 = [(VCPCoreMLRequest *)v27 model];
      v29 = self->_featureProvider;
      v30 = self->_MLOptions;
      v31 = (id *)&v67;
      uint64_t v67 = 0;
      uint64_t v32 = [v28 predictionFromFeatures:v29 options:v30 error:&v67];
    }
    else
    {
      uint64_t v28 = [(VCPCoreMLRequest *)v27 model];
      v36 = self->_featureProvider;
      uint64_t v66 = 0;
      v31 = (id *)&v66;
      uint64_t v32 = [v28 predictionFromFeatures:v36 error:&v66];
    }
    os_log_t log = (os_log_t)v32;
    id v35 = *v31;

    if (log)
    {
      v37 = [log featureValueForName:@"classLabel_probs"];
      v38 = v37;
      if (v37)
      {
        uint64_t v39 = [v37 dictionaryValue];

        os_log_t log = (os_log_t)v39;
        goto LABEL_35;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v50 = VCPLogInstance();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "Failed to get probs", buf, 2u);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v33 = -18;
LABEL_68:

        goto LABEL_69;
      }
      VCPLogInstance();
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        id v47 = [v35 description];
        uint64_t v48 = [v47 UTF8String];
        *(_DWORD *)buf = 136315138;
        uint64_t v73 = v48;
        _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "Failed to get output feature %s", buf, 0xCu);
      }
    }
    int v33 = -18;
LABEL_67:

    goto LABEL_68;
  }
  int v33 = 0;
LABEL_69:

  return v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MLOptions, 0);
  objc_storeStrong((id *)&self->_mitigator, 0);
  objc_storeStrong((id *)&self->_gestureCoreMLRequest, 0);
  objc_storeStrong((id *)&self->_featureProvider, 0);
}

@end