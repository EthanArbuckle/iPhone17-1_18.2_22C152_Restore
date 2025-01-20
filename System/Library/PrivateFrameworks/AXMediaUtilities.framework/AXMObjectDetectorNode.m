@interface AXMObjectDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)possibleObjectClassifications;
+ (id)title;
+ (void)possibleObjectClassifications;
- (AXMObjectDetectorNode)initWithCoder:(id)a3;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMObjectDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMObjectDetectorNode)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXMObjectDetectorNode;
  return [(AXMEvaluationNode *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXMObjectDetectorNode;
  [(AXMEvaluationNode *)&v3 encodeWithCoder:a3];
}

+ (BOOL)isSupported
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  BOOL v3 = (unint64_t)[v2 physicalMemory] > 0x773593FF;

  return v3;
}

+ (id)title
{
  return @"Object Detector";
}

+ (id)possibleObjectClassifications
{
  id v2 = objc_alloc_init((Class)getVNRecognizeObjectsRequestClass());
  uint64_t v6 = 0;
  BOOL v3 = [v2 supportedIdentifiersAndReturnError:&v6];
  if (v6)
  {
    objc_super v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[AXMObjectDetectorNode possibleObjectClassifications](v4);
    }
  }
  if (!v3) {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNRecognizeObjectsRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMObjectDetectorNode;
    return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
  }
  else
  {
    objc_super v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMObjectDetectorNode validateVisionKitSoftLinkSymbols](v4);
    }

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)AXMObjectDetectorNode;
  id v8 = [(AXMEvaluationNode *)&v58 evaluate:v6 metrics:v7];
  context = (void *)MEMORY[0x1BA9A10B0](v8);
  recognizeObjectsRequest = self->_recognizeObjectsRequest;
  if (!recognizeObjectsRequest)
  {
    v10 = (VNRecognizeObjectsRequest *)objc_alloc_init((Class)getVNRecognizeObjectsRequestClass());
    v11 = self->_recognizeObjectsRequest;
    self->_recognizeObjectsRequest = v10;

    +[AXMEvaluationNode configureForRunningOnANEIfPossibleWithRequest:](AXMEvaluationNode, "configureForRunningOnANEIfPossibleWithRequest:", self->_recognizeObjectsRequest, context);
    recognizeObjectsRequest = self->_recognizeObjectsRequest;
  }
  v62[0] = recognizeObjectsRequest;
  v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v62, 1, context);
  v52 = v6;
  v51 = v7;
  [(AXMEvaluationNode *)self evaluateRequests:v12 withContext:v6 requestHandlerOptions:0 metrics:v7 error:0];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v13 = [(VNRecognizeObjectsRequest *)self->_recognizeObjectsRequest results];
  uint64_t v53 = [v13 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v53)
  {
    uint64_t v14 = *(void *)v55;
    v15 = off_1E6116000;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v18 = [(__objc2_class *)v15[60] axmTaxonomyNodeForObjectObservation:v17];
        v19 = v18;
        if (v18)
        {
          uint64_t v20 = [v18 label];
          if (!v20) {
            goto LABEL_13;
          }
          v21 = (void *)v20;
          v22 = [(__objc2_class *)v15[60] _deniedVoiceOverObjectClassificationLabels];
          v23 = [v19 label];
          int v24 = [v22 containsObject:v23];

          if (v24)
          {
            v25 = AXMediaLogCommon();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = [v19 label];
              *(_DWORD *)buf = 138412290;
              v60 = v26;
              _os_log_impl(&dword_1B57D5000, v25, OS_LOG_TYPE_INFO, "Object classifier detected but denied for VoiceOver: %@", buf, 0xCu);
            }
          }
          else
          {
LABEL_13:
            v25 = [v19 localizedName];
            if (![v25 length])
            {
              v27 = AXMediaLogCommon();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v60 = v25;
                _os_log_impl(&dword_1B57D5000, v27, OS_LOG_TYPE_DEFAULT, "Could not get localized value for label: %@. Falling back to raw value", buf, 0xCu);
              }

              uint64_t v28 = [v19 label];

              v25 = v28;
            }
            [v17 confidence];
            if (v29 > 0.4)
            {
              v30 = [v19 label];
              [v17 boundingBox];
              double v32 = v31;
              double v34 = v33;
              double v36 = v35;
              double v38 = v37;
              [v17 confidence];
              int v40 = v39;
              [v52 size];
              double v42 = v41;
              double v44 = v43;
              v45 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "sceneClassId"));
              v46 = [v45 stringValue];
              LODWORD(v47) = v40;
              v48 = +[AXMVisionFeature objectClassificationWithLabel:localizedValue:boundingBox:confidence:canvasSize:sceneClassId:](AXMVisionFeature, "objectClassificationWithLabel:localizedValue:boundingBox:confidence:canvasSize:sceneClassId:", v30, v25, v46, v32, v34, v36, v38, v47, v42, v44);

              v15 = off_1E6116000;
              [v52 appendFeature:v48];
            }
          }
        }
        else
        {
          v25 = AXMediaLogCommon();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B57D5000, v25, OS_LOG_TYPE_DEFAULT, "Recognized object result produced no labels", buf, 2u);
          }
        }
      }
      uint64_t v53 = [v13 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v53);
  }

  [v52 addEvaluatedFeatureType:10];
}

- (void).cxx_destruct
{
}

+ (void)possibleObjectClassifications
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not look up supported identifiers for VNRecognizeObjectsRequest", v1, 2u);
}

- (void)validateVisionKitSoftLinkSymbols
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNRecognizeObjectsRequestSoft was nil", v1, 2u);
}

@end