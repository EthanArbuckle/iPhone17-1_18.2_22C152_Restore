@interface AXMMediaAnalysisTextDetectorNode
+ (BOOL)supportsSecureCoding;
+ (id)title;
+ (int64_t)recognitionLevelFromOptions:(id)a3;
- (AXMMediaAnalysisTextDetectorNode)initWithCoder:(id)a3;
- (AXMSemanticTextFactory)semanticTextFactory;
- (AXMTextLayoutManager)textLayoutManager;
- (AXMTextSpecialCase)specialCaseManager;
- (BOOL)requiresVisionFramework;
- (double)detectTextSkew:(id)a3;
- (id)_sequencesForObservations:(id)a3 canvasSize:(CGSize)a4;
- (id)_textDetectionOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)processResults:(id)a3 context:(id)a4 metrics:(id)a5 textDetectionLocales:(id)a6 textDetectionOptions:(id)a7 requestID:(int)a8 error:(id)a9;
- (void)setSemanticTextFactory:(id)a3;
- (void)setSpecialCaseManager:(id)a3;
- (void)setTextLayoutManager:(id)a3;
@end

@implementation AXMMediaAnalysisTextDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMMediaAnalysisTextDetectorNode)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXMMediaAnalysisTextDetectorNode;
  v3 = [(AXMEvaluationNode *)&v7 initWithCoder:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("process-results-queue-axmedia", 0);
    processResultQueue = v3->_processResultQueue;
    v3->_processResultQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXMMediaAnalysisTextDetectorNode;
  [(AXMEvaluationNode *)&v3 encodeWithCoder:a3];
}

- (BOOL)requiresVisionFramework
{
  return 0;
}

+ (id)title
{
  return @"AXM Media Analysis - Text Detector Node";
}

- (void)processResults:(id)a3 context:(id)a4 metrics:(id)a5 textDetectionLocales:(id)a6 textDetectionOptions:(id)a7 requestID:(int)a8 error:(id)a9
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v21 = AXMediaLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v41 = [v15 results];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = a8;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v20;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v41;
    _os_log_debug_impl(&dword_1B57D5000, v21, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Text Detection results: requestID: %d error: %@ results: %@", buf, 0x1Cu);
  }
  if (v20)
  {
    v22 = AXMediaLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[AXMMediaAnalysisTextDetectorNode processResults:context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:]((uint64_t)v20, v22);
    }
    goto LABEL_32;
  }
  if (a8 != -1)
  {
    v23 = [v16 sourceInput];
    v22 = [v23 ciImage];

    if (!v22)
    {
      v22 = [v16 generateImageRepresentation];
    }
    v47 = [v15 results];
    if (![v47 count]) {
      goto LABEL_31;
    }
    v24 = [v47 firstObject];
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2050000000;
    v25 = (void *)getMADVIDocumentRecognitionResultClass_softClass;
    uint64_t v52 = getMADVIDocumentRecognitionResultClass_softClass;
    if (!getMADVIDocumentRecognitionResultClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMADVIDocumentRecognitionResultClass_block_invoke;
      *(void *)&buf[24] = &unk_1E6116AD8;
      v54 = &v49;
      __getMADVIDocumentRecognitionResultClass_block_invoke((uint64_t)buf);
      v25 = (void *)v50[3];
    }
    id v26 = v25;
    _Block_object_dispose(&v49, 8);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_31;
    }
    v45 = [v47 firstObject];
    v28 = [v45 observations];
    v44 = [v28 firstObject];

    v46 = objc_msgSend(v44, "blocksWithTypes:inRegion:", 4, 0.0, 0.0, 1.0, 1.0);
    if ([v46 count])
    {
      v43 = [v16 mediaAnalysisSceneLabelsForOCRDocumentTypeDetection];
      v29 = AXMediaLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[AXMMediaAnalysisTextDetectorNode processResults:context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:]((uint64_t)v43, v29);
      }

      if (![v43 count])
      {
        v30 = [v16 analysisOptions];
        int v31 = [v30 detectMADScenes];

        if (v31)
        {
          v32 = [(AXMVisionEngineNode *)[AXMMediaAnalysisSceneDetectorNode alloc] initWithIdentifier:@"mad-scene"];
          [(AXMMediaAnalysisSceneDetectorNode *)v32 setTaxonomyOptions:7];
          [(AXMMediaAnalysisSceneDetectorNode *)v32 evaluate:v16 metrics:v17];
        }
      }
      if (v22)
      {
        [v16 size];
        v33 = -[AXMMediaAnalysisTextDetectorNode _sequencesForObservations:canvasSize:](self, "_sequencesForObservations:canvasSize:", v46);
        v34 = [(AXMMediaAnalysisTextDetectorNode *)self textLayoutManager];
        [v16 size];
        id v48 = 0;
        v37 = objc_msgSend(v34, "documentWithTextFeatures:canvasSize:preferredLocales:applySemanticAnalysis:error:", v33, v18, objc_msgSend(v19, "shouldApplySemanticTextFiltering"), &v48, v35, v36);
        id v38 = v48;
        v39 = v34;
        id v40 = v38;

        if (v37)
        {
          [v16 appendFeature:v37];
          [v16 setEffectiveTextDetectionLocales:v18];
LABEL_30:

LABEL_31:
          goto LABEL_32;
        }
LABEL_28:
        v37 = AXMediaLogOCR();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v40;
          _os_log_impl(&dword_1B57D5000, v37, OS_LOG_TYPE_DEFAULT, "Unable to convert detected text into document: %@", buf, 0xCu);
        }
        goto LABEL_30;
      }
      v42 = AXMediaLogOCR();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B57D5000, v42, OS_LOG_TYPE_DEFAULT, "Unable to convert detected text into document. Input image unexpectedly nil", buf, 2u);
      }
    }
    id v40 = 0;
    goto LABEL_28;
  }
  v22 = AXMediaLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[AXMMediaAnalysisTextDetectorNode processResults:context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:](v22);
  }
LABEL_32:
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)AXMMediaAnalysisTextDetectorNode;
  id v35 = a4;
  -[AXMEvaluationNode evaluate:metrics:](&v47, sel_evaluate_metrics_, v6);
  objc_super v7 = [v6 sourceInput];
  double v36 = [v7 phAssetLocalIdentifier];

  v8 = [v6 sourceInput];
  v37 = [v8 photoLibraryURL];

  v9 = [v6 sourceInput];
  v34 = [v9 ciImage];

  v10 = [v6 sourceInput];
  v33 = [v10 pixelBuffer];

  v11 = [(AXMMediaAnalysisTextDetectorNode *)self _textDetectionOptions:v6];
  int64_t v12 = +[AXMTextDetectorNode recognitionLevelFromOptions:v11];
  id v38 = +[AXMTextDetectorNode effectiveLanguagesFromOptions:v11];
  if ([v38 count])
  {
    v13 = objc_msgSend(v38, "ax_mappedArrayUsingBlock:", &__block_literal_global_18);
    *(void *)buf = 0;
    v50 = buf;
    uint64_t v51 = 0x2050000000;
    v14 = (void *)getMADVIDocumentRecognitionRequestClass_softClass;
    uint64_t v52 = getMADVIDocumentRecognitionRequestClass_softClass;
    if (!getMADVIDocumentRecognitionRequestClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getMADVIDocumentRecognitionRequestClass_block_invoke;
      location[3] = &unk_1E6116AD8;
      location[4] = buf;
      __getMADVIDocumentRecognitionRequestClass_block_invoke((uint64_t)location);
      v14 = (void *)*((void *)v50 + 3);
    }
    id v15 = v14;
    _Block_object_dispose(buf, 8);
    id v16 = objc_alloc_init(v15);
    [v16 setRecognitionLevel:v12];
    [v16 setLanguages:v38];
    [v11 normalizedMinimumTextHeightRatio];
    *(float *)&double v17 = v17;
    [v16 setMinimumTextHeight:v17];
    objc_msgSend(v16, "setUsesLanguageCorrection:", objc_msgSend(v11, "usesLanguageCorrection"));
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    objc_initWeak(location, self);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __53__AXMMediaAnalysisTextDetectorNode_evaluate_metrics___block_invoke_2;
    v39[3] = &unk_1E61182F0;
    v39[4] = self;
    objc_copyWeak(&v46, location);
    id v31 = v16;
    id v40 = v31;
    id v41 = v6;
    id v42 = v35;
    v30 = v13;
    v43 = v30;
    id v44 = v11;
    id v19 = v18;
    v45 = v19;
    v32 = (void *)MEMORY[0x1BA9A1340](v39);
    id v20 = +[AXMMADSService sharedInstance];
    v21 = [v20 service];

    if (v37 && v36)
    {
      v55[0] = v31;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
      uint64_t v23 = [v21 performRequests:v22 onAssetWithLocalIdentifier:v36 fromPhotoLibraryWithURL:v37 completionHandler:v32];
    }
    else if (v34)
    {
      id v54 = v31;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
      uint64_t v23 = [v21 performRequests:v22 onCIImage:v34 withOrientation:1 andIdentifier:&stru_1F0E72D10 completionHandler:v32];
    }
    else
    {
      if (!v33)
      {
        uint64_t v25 = 0xFFFFFFFFLL;
        goto LABEL_14;
      }
      id v53 = v31;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
      uint64_t v23 = objc_msgSend(v21, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v22, objc_msgSend(v33, "pixelBuffer"), objc_msgSend(v33, "orientation"), &stru_1F0E72D10, v32);
    }
    uint64_t v25 = v23;

LABEL_14:
    dispatch_time_t v26 = dispatch_time(0, 100000000);
    if (dispatch_semaphore_wait(v19, v26))
    {
      unint64_t v27 = 100000000;
      do
      {
        if (v27 >= 0x2540BE401)
        {
          v28 = AXMediaLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[AXMMediaAnalysisTextDetectorNode evaluate:metrics:](buf, &buf[1], v28);
          }

          [v21 cancelRequestID:v25];
        }
        dispatch_time_t v29 = dispatch_time(0, 100000000);
        v27 += 100000000;
      }
      while (dispatch_semaphore_wait(v19, v29));
    }

    objc_destroyWeak(&v46);
    objc_destroyWeak(location);

    v24 = v30;
    goto LABEL_22;
  }
  v24 = AXMediaLogOCR();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_1B57D5000, v24, OS_LOG_TYPE_DEFAULT, "Will not perform text detection. No effective languages resolved", (uint8_t *)location, 2u);
  }
LABEL_22:
}

id __53__AXMMediaAnalysisTextDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F1CA20];
  id v3 = a2;
  dispatch_queue_t v4 = (void *)[[v2 alloc] initWithLocaleIdentifier:v3];

  return v4;
}

void __53__AXMMediaAnalysisTextDetectorNode_evaluate_metrics___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AXMMediaAnalysisTextDetectorNode_evaluate_metrics___block_invoke_3;
  block[3] = &unk_1E61182C8;
  objc_copyWeak(&v17, (id *)(a1 + 88));
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  int v18 = a2;
  id v14 = v7;
  id v15 = v5;
  id v16 = *(id *)(a1 + 80);
  id v8 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v17);
}

intptr_t __53__AXMMediaAnalysisTextDetectorNode_evaluate_metrics___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  [WeakRetained processResults:*(void *)(a1 + 32) context:*(void *)(a1 + 40) metrics:*(void *)(a1 + 48) textDetectionLocales:*(void *)(a1 + 56) textDetectionOptions:*(void *)(a1 + 64) requestID:*(unsigned int *)(a1 + 96) error:*(void *)(a1 + 72)];

  id v3 = *(NSObject **)(a1 + 80);

  return dispatch_semaphore_signal(v3);
}

- (AXMSemanticTextFactory)semanticTextFactory
{
  semanticTextFactory = self->_semanticTextFactory;
  if (!semanticTextFactory)
  {
    dispatch_queue_t v4 = objc_alloc_init(AXMSemanticTextFactory);
    id v5 = self->_semanticTextFactory;
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
    dispatch_queue_t v4 = [AXMTextLayoutManager alloc];
    id v5 = [(AXMMediaAnalysisTextDetectorNode *)self semanticTextFactory];
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
    dispatch_queue_t v4 = objc_alloc_init(AXMTextSpecialCase);
    id v5 = self->_specialCaseManager;
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
        id v14 = objc_msgSend(v13, "topCandidates:", 1, (void)v31);
        id v15 = [v14 firstObject];

        if (v15)
        {
          id v16 = [v15 string];
          if ([v16 length])
          {
            [v16 rangeOfComposedCharacterSequenceAtIndex:0];
            if (v17 != 1 || [v16 characterAtIndex:0] != 0xFFFF)
            {
              int v18 = -[AXMVisionFeatureRecognizedText initWithRecognizedText:range:]([AXMVisionFeatureRecognizedText alloc], "initWithRecognizedText:range:", v15, 0, [v16 length]);
              [v13 boundingBox];
              double v20 = v19;
              double v22 = v21;
              double v24 = v23;
              double v26 = v25;
              id v35 = v18;
              unint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
              [v15 confidence];
              dispatch_time_t v29 = +[AXMVisionFeature textSequence:boundingBox:recognizedTextFeatures:confidence:canvasSize:](AXMVisionFeature, "textSequence:boundingBox:recognizedTextFeatures:confidence:canvasSize:", v16, v27, v20, v22, v24, v26, v28, width, height);

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
  dispatch_queue_t v4 = [v3 textDetectionOptions];

  if (!v4)
  {
    dispatch_queue_t v4 = +[AXMTextDetectionOptions defaultOptions];
  }
  id v5 = AXMediaLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1B57D5000, v5, OS_LOG_TYPE_INFO, "AXM Media analysis: Will detect text with options: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

+ (int64_t)recognitionLevelFromOptions:(id)a3
{
  return [a3 recognitionLevel] != 1;
}

- (double)detectTextSkew:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    dispatch_queue_t v4 = [v3 firstObject];
    id v5 = [v4 topCandidates:1];
    id v6 = [v5 firstObject];

    id v22 = 0;
    int v7 = objc_msgSend(v6, "boundingBoxForRange:error:", 1, 1, &v22);
    id v8 = v22;
    uint64_t v9 = [v6 string];
    id v21 = v8;
    uint64_t v10 = objc_msgSend(v6, "boundingBoxForRange:error:", objc_msgSend(v9, "length") - 2, 1, &v21);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialCaseManager, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_semanticTextFactory, 0);

  objc_storeStrong((id *)&self->_processResultQueue, 0);
}

- (void)processResults:(os_log_t)log context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Invalid request - MADVIDocumentRecognitionRequest", v1, 2u);
}

- (void)processResults:(uint64_t)a1 context:(NSObject *)a2 metrics:textDetectionLocales:textDetectionOptions:requestID:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "AXM Media analysis: sceneLabelsForOCRDocumentTypeDetection : %@", (uint8_t *)&v2, 0xCu);
}

- (void)processResults:(uint64_t)a1 context:(NSObject *)a2 metrics:textDetectionLocales:textDetectionOptions:requestID:error:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Error in text analysis: %@", (uint8_t *)&v2, 0xCu);
}

- (void)evaluate:(os_log_t)log metrics:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "AXM Media Analysis: Text Detection request timed out", buf, 2u);
}

@end