@interface AXMTextDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)effectiveLanguagesFromOptions:(id)a3;
+ (id)filterPreferredDetectionLanguages:(id)a3 withSupportedDetectionLanguages:(id)a4;
+ (id)supportedDetectionLanguagesForLevel:(int64_t)a3;
+ (id)textDetectionLanguagesFromOptions:(id)a3;
+ (id)title;
+ (int64_t)recognitionLevelFromOptions:(id)a3;
- (AXMSemanticTextFactory)semanticTextFactory;
- (AXMTextLayoutManager)textLayoutManager;
- (AXMTextSpecialCase)specialCaseManager;
- (BOOL)requiresVisionFramework;
- (BOOL)shouldEvaluate:(id)a3;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (NSArray)sceneLabelsForOCRDocumentTypeDetection;
- (double)detectTextSkew:(id)a3;
- (id)_sequencesForObservations:(id)a3 canvasSize:(CGSize)a4;
- (id)_textDetectionOptions:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)nodeInitialize;
- (void)setSceneLabelsForOCRDocumentTypeDetection:(id)a3;
- (void)setSemanticTextFactory:(id)a3;
- (void)setSpecialCaseManager:(id)a3;
- (void)setTextLayoutManager:(id)a3;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMTextDetectorNode

- (void)nodeInitialize
{
  v2.receiver = self;
  v2.super_class = (Class)AXMTextDetectorNode;
  [(AXMEvaluationNode *)&v2 nodeInitialize];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return @"Text Detector";
}

- (BOOL)requiresVisionFramework
{
  return 1;
}

- (BOOL)shouldEvaluate:(id)a3
{
  return 1;
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNRecognizeTextRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMTextDetectorNode;
    return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
  }
  else
  {
    v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMTextDetectorNode validateVisionKitSoftLinkSymbols](v4);
    }

    return 0;
  }
}

+ (id)effectiveLanguagesFromOptions:(id)a3
{
  id v3 = a3;
  int64_t v4 = +[AXMTextDetectorNode recognitionLevelFromOptions:v3];
  objc_super v5 = +[AXMTextDetectorNode textDetectionLanguagesFromOptions:v3];

  v6 = +[AXMTextDetectorNode supportedDetectionLanguagesForLevel:v4];
  v7 = +[AXMTextDetectorNode filterPreferredDetectionLanguages:v5 withSupportedDetectionLanguages:v6];

  return v7;
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1BA9A10B0]();
  v9 = [(AXMTextDetectorNode *)self _textDetectionOptions:v6];
  int64_t v10 = +[AXMTextDetectorNode recognitionLevelFromOptions:v9];
  v11 = +[AXMTextDetectorNode effectiveLanguagesFromOptions:v9];
  if ([v11 count])
  {
    v87.receiver = self;
    v87.super_class = (Class)AXMTextDetectorNode;
    [(AXMEvaluationNode *)&v87 evaluate:v6 metrics:v7];
    v12 = objc_msgSend(v11, "ax_mappedArrayUsingBlock:", &__block_literal_global_6);
    id v13 = objc_alloc_init((Class)getVNRecognizeTextRequestClass());
    [v13 setRecognitionLanguages:v11];
    [v13 setRecognitionLevel:v10];
    objc_msgSend(v13, "setUsesLanguageCorrection:", objc_msgSend(v9, "usesLanguageCorrection"));
    [v9 normalizedMinimumTextHeightRatio];
    *(float *)&double v14 = v14;
    [v13 setMinimumTextHeight:v14];
    v90[0] = v13;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:1];
    id v86 = 0;
    [(AXMEvaluationNode *)self evaluateRequests:v15 withContext:v6 requestHandlerOptions:0 metrics:v7 error:&v86];
    v16 = v86;

    if (v16)
    {
      v17 = AXMediaLogOCR();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v16;
        v18 = "Text detection error occurred: %@";
LABEL_36:
        _os_log_impl(&dword_1B57D5000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
        goto LABEL_37;
      }
      goto LABEL_37;
    }
    v19 = [v13 results];
    uint64_t v20 = [v19 count];

    if (!v20)
    {
      v16 = 0;
      goto LABEL_34;
    }
    v80 = v12;
    v21 = [v6 sceneLabelsForOCRDocumentTypeDetection];
    if (AXRuntimeCheck_MediaAnalysisSupport())
    {
      uint64_t v22 = [v6 mediaAnalysisSceneLabelsForOCRDocumentTypeDetection];

      v21 = (void *)v22;
    }
    v79 = v21;
    uint64_t v23 = [v21 count];
    v12 = v80;
    if (!v23)
    {
      int v24 = AXRuntimeCheck_MediaAnalysisSupport();
      v25 = [v6 analysisOptions];
      v26 = v25;
      if (v24)
      {
        char v27 = [v25 detectMADScenes];

        if (v27)
        {
          v28 = @"mad-scene";
          v29 = off_1E6116160;
LABEL_17:
          v31 = (void *)[objc_alloc(*v29) initWithIdentifier:v28];
          [v31 setTaxonomyOptions:7];
          [v31 evaluate:v6 metrics:v7];
        }
      }
      else
      {
        int v30 = [v25 detectScenes];

        if (v30)
        {
          v28 = @"scene";
          v29 = off_1E6116210;
          goto LABEL_17;
        }
      }
    }
    v78 = v8;
    v32 = [v6 sourceInput];
    v33 = [v32 ciImage];

    if (!v33)
    {
      v33 = [v6 generateImageRepresentation];
      if (!v33)
      {
        v66 = AXMediaLogOCR();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B57D5000, v66, OS_LOG_TYPE_DEFAULT, "Unable to convert detected text into document. Input image unexpectedly nil", buf, 2u);
        }

        v16 = 0;
        v12 = v80;
LABEL_33:
        v8 = v78;
LABEL_34:
        v17 = AXMediaLogOCR();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v89 = v16;
          v18 = "Unable to convert detected text into document: %@";
          goto LABEL_36;
        }
LABEL_37:

        goto LABEL_38;
      }
    }
    v34 = [v13 results];
    [v6 size];
    v35 = -[AXMTextDetectorNode _sequencesForObservations:canvasSize:](self, "_sequencesForObservations:canvasSize:", v34);

    v77 = v35;
    uint64_t v36 = objc_msgSend(v35, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_55);
    v37 = [(AXMTextDetectorNode *)self specialCaseManager];
    v76 = (void *)v36;
    v38 = [v37 detectSpecialCase:v36 preferredLocales:v80];

    v75 = v38;
    if ([v38 isEqualToString:@"NutritionLabel"])
    {
      v39 = [(AXMTextDetectorNode *)self textLayoutManager];
      [v6 size];
      double v41 = v40;
      double v43 = v42;
      v44 = [v6 visionImageRequestHandler];
      v85 = 0;
      v74 = v39;
      v17 = objc_msgSend(v39, "documentWithNutritionLabel:canvasSize:requestHandler:metrics:error:", v33, v44, v7, &v85, v41, v43);
      v45 = v85;
LABEL_22:
      v16 = v45;

LABEL_25:
      v57 = v79;
      goto LABEL_26;
    }
    v46 = [v79 firstObject];
    int v47 = [v46 isEqualToString:@"receipt"];

    if (v47)
    {
      uint64_t v48 = [(AXMTextDetectorNode *)self textLayoutManager];
      v73 = [v13 results];
      [(AXMTextDetectorNode *)self detectTextSkew:v73];
      double v50 = v49;
      [v6 size];
      double v52 = v51;
      double v54 = v53;
      v55 = [v6 visionImageRequestHandler];
      id v84 = 0;
      v74 = (void *)v48;
      v56 = (void *)v48;
      v12 = v80;
      v17 = objc_msgSend(v56, "documentWithReceipt:withTextSkew:canvasSize:preferredLocales:requestHandler:metrics:error:", v33, v80, v55, v7, &v84, v50, v52, v54);
      v16 = v84;

      goto LABEL_25;
    }
    v57 = v79;
    if ([v79 containsObject:@"envelope"])
    {
      uint64_t v58 = [(AXMTextDetectorNode *)self textLayoutManager];
      [v6 size];
      double v60 = v59;
      double v62 = v61;
      uint64_t v63 = [v9 shouldApplySemanticTextFiltering];
      v83 = 0;
      v74 = (void *)v58;
      v64 = (void *)v58;
      v12 = v80;
      v17 = objc_msgSend(v64, "envelopeWithTextFeatures:canvasSize:preferredLocales:applySemanticAnalysis:error:", v77, v80, v63, &v83, v60, v62);
      v65 = v83;
    }
    else
    {
      int v67 = [v79 containsObject:@"diagram"];
      v68 = [(AXMTextDetectorNode *)self textLayoutManager];
      [v6 size];
      double v71 = v69;
      double v72 = v70;
      v12 = v80;
      v74 = v68;
      if (v67)
      {
        v44 = [v6 visionImageRequestHandler];
        v82 = 0;
        v17 = objc_msgSend(v68, "documentWithTable:canvasSize:preferredLocales:requestHandler:metrics:error:", v33, v80, v44, v7, &v82, v71, v72);
        v45 = v82;
        goto LABEL_22;
      }
      v81 = 0;
      v17 = objc_msgSend(v68, "documentWithTextFeatures:canvasSize:preferredLocales:applySemanticAnalysis:error:", v77, v80, objc_msgSend(v9, "shouldApplySemanticTextFiltering"), &v81, v69, v70);
      v65 = v81;
    }
    v16 = v65;
LABEL_26:

    if (v17)
    {
      [v6 appendFeature:v17];
      [v6 setEffectiveTextDetectionLocales:v12];
      v8 = v78;
      goto LABEL_37;
    }
    goto LABEL_33;
  }
  v16 = AXMediaLogOCR();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B57D5000, v16, OS_LOG_TYPE_DEFAULT, "Will not perform text detection. No effective languages resolved", buf, 2u);
  }
LABEL_38:
}

id __40__AXMTextDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = (objc_class *)MEMORY[0x1E4F1CA20];
  id v3 = a2;
  int64_t v4 = (void *)[[v2 alloc] initWithLocaleIdentifier:v3];

  return v4;
}

uint64_t __40__AXMTextDetectorNode_evaluate_metrics___block_invoke_52(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (NSArray)sceneLabelsForOCRDocumentTypeDetection
{
  sceneLabelsForOCRDocumentTypeDetection = self->_sceneLabelsForOCRDocumentTypeDetection;
  if (!sceneLabelsForOCRDocumentTypeDetection)
  {
    int64_t v4 = [MEMORY[0x1E4F1C978] array];
    objc_super v5 = self->_sceneLabelsForOCRDocumentTypeDetection;
    self->_sceneLabelsForOCRDocumentTypeDetection = v4;

    sceneLabelsForOCRDocumentTypeDetection = self->_sceneLabelsForOCRDocumentTypeDetection;
  }

  return sceneLabelsForOCRDocumentTypeDetection;
}

- (AXMSemanticTextFactory)semanticTextFactory
{
  semanticTextFactory = self->_semanticTextFactory;
  if (!semanticTextFactory)
  {
    int64_t v4 = objc_alloc_init(AXMSemanticTextFactory);
    objc_super v5 = self->_semanticTextFactory;
    self->_semanticTextFactory = v4;

    semanticTextFactory = self->_semanticTextFactory;
  }

  return semanticTextFactory;
}

- (AXMTextLayoutManager)textLayoutManager
{
  textLayoutManager = self->_textLayoutManager;
  if (!textLayoutManager)
  {
    int64_t v4 = [AXMTextLayoutManager alloc];
    objc_super v5 = [(AXMTextDetectorNode *)self semanticTextFactory];
    id v6 = [(AXMTextLayoutManager *)v4 initWithSemanticTextFactory:v5];
    id v7 = self->_textLayoutManager;
    self->_textLayoutManager = v6;

    textLayoutManager = self->_textLayoutManager;
  }

  return textLayoutManager;
}

- (AXMTextSpecialCase)specialCaseManager
{
  specialCaseManager = self->_specialCaseManager;
  if (!specialCaseManager)
  {
    int64_t v4 = objc_alloc_init(AXMTextSpecialCase);
    objc_super v5 = self->_specialCaseManager;
    self->_specialCaseManager = v4;

    specialCaseManager = self->_specialCaseManager;
  }

  return specialCaseManager;
}

- (id)_sequencesForObservations:(id)a3 canvasSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        double v14 = objc_msgSend(v13, "topCandidates:", 1, (void)v31);
        v15 = [v14 firstObject];

        if (v15)
        {
          v16 = [v15 string];
          if ([v16 length])
          {
            [v16 rangeOfComposedCharacterSequenceAtIndex:0];
            if (v17 != 1 || [v16 characterAtIndex:0] != 0xFFFF)
            {
              v18 = -[AXMVisionFeatureRecognizedText initWithRecognizedText:range:]([AXMVisionFeatureRecognizedText alloc], "initWithRecognizedText:range:", v15, 0, [v16 length]);
              [v13 boundingBox];
              double v20 = v19;
              double v22 = v21;
              double v24 = v23;
              double v26 = v25;
              v35 = v18;
              char v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
              [v15 confidence];
              v29 = +[AXMVisionFeature textSequence:boundingBox:recognizedTextFeatures:confidence:canvasSize:](AXMVisionFeature, "textSequence:boundingBox:recognizedTextFeatures:confidence:canvasSize:", v16, v27, v20, v22, v24, v26, v28, width, height);

              [v7 addObject:v29];
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_textDetectionOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 analysisOptions];
  int64_t v4 = [v3 textDetectionOptions];

  if (!v4)
  {
    int64_t v4 = +[AXMTextDetectionOptions defaultOptions];
  }
  objc_super v5 = AXMediaLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1B57D5000, v5, OS_LOG_TYPE_INFO, "Will detect text with options: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

+ (int64_t)recognitionLevelFromOptions:(id)a3
{
  return [a3 recognitionLevel] != 1;
}

+ (id)textDetectionLanguagesFromOptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v5 = objc_msgSend(v3, "textDetectionLocales", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) languageCode];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if (![v4 count])
  {
    uint64_t v11 = AXMediaLogOCR();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[AXMTextDetectorNode textDetectionLanguagesFromOptions:](v11);
    }

    [v4 addObject:@"en-US"];
  }

  return v4;
}

+ (id)supportedDetectionLanguagesForLevel:(int64_t)a3
{
  id v7 = 0;
  id v3 = [getVNRecognizeTextRequestClass() supportedRecognitionLanguagesForTextRecognitionLevel:a3 revision:2 error:&v7];
  id v4 = v7;
  if (v4 || ![v3 count])
  {
    objc_super v5 = AXMediaLogOCR();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[AXMTextDetectorNode supportedDetectionLanguagesForLevel:]((uint64_t)v4, v5);
    }

    id v3 = &unk_1F0E94128;
  }

  return v3;
}

+ (id)filterPreferredDetectionLanguages:(id)a3 withSupportedDetectionLanguages:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v8 = objc_msgSend(v6, "ax_mappedArrayUsingBlock:", &__block_literal_global_68);
  double v20 = v5;
  uint64_t v9 = objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_70);
  if ([v6 count])
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = [v8 objectAtIndexedSubscript:v10];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = v9;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            if ([v11 containsString:*(void *)(*((void *)&v21 + 1) + 8 * i)])
            {
              uint64_t v17 = [v6 objectAtIndexedSubscript:v10];
              [v7 addObject:v17];

              goto LABEL_13;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      ++v10;
    }
    while (v10 < [v6 count]);
  }
  uint64_t v18 = [v7 array];

  return v18;
}

id __89__AXMTextDetectorNode_filterPreferredDetectionLanguages_withSupportedDetectionLanguages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v2];
  if (![v3 length])
  {
    id v4 = v2;

    id v3 = v4;
  }

  return v3;
}

id __89__AXMTextDetectorNode_filterPreferredDetectionLanguages_withSupportedDetectionLanguages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v2];
  if (![v3 length])
  {
    id v4 = v2;

    id v3 = v4;
  }

  return v3;
}

- (double)detectTextSkew:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    id v5 = [v4 topCandidates:1];
    id v6 = [v5 firstObject];

    id v22 = 0;
    id v7 = objc_msgSend(v6, "boundingBoxForRange:error:", 1, 1, &v22);
    id v8 = v22;
    uint64_t v9 = [v6 string];
    id v21 = v8;
    unint64_t v10 = objc_msgSend(v6, "boundingBoxForRange:error:", objc_msgSend(v9, "length") - 2, 1, &v21);
    id v11 = v21;

    [v7 bottomLeft];
    double v13 = v12;
    double v15 = v14;
    [v10 bottomRight];
    double v18 = v17 - v13;
    if (v18 == 0.0) {
      double v19 = 0.0;
    }
    else {
      double v19 = atan((v16 - v15) / v18);
    }
  }
  else
  {
    double v19 = 0.0;
  }

  return v19;
}

- (void)setSemanticTextFactory:(id)a3
{
}

- (void)setTextLayoutManager:(id)a3
{
}

- (void)setSpecialCaseManager:(id)a3
{
}

- (void)setSceneLabelsForOCRDocumentTypeDetection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneLabelsForOCRDocumentTypeDetection, 0);
  objc_storeStrong((id *)&self->_specialCaseManager, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);

  objc_storeStrong((id *)&self->_semanticTextFactory, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNRecognizeTextRequestSoft was nil", v1, 2u);
}

+ (void)textDetectionLanguagesFromOptions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "textDetectionLocales unexpectedly empty! falling back to en-US", v1, 2u);
}

+ (void)supportedDetectionLanguagesForLevel:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Could not get supported text detection languages: %@", (uint8_t *)&v2, 0xCu);
}

@end