@interface WFExtractTextFromImageAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFExtractTextFromImageAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClasses:v5 completionHandler:v6];
}

void __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8 = [v6 items];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &unk_264E5CA28;
    uint64_t v11 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_209;
    v9[3] = &unk_264E5E8E8;
    v9[4] = v11;
    objc_msgSend(v8, "if_enumerateAsynchronouslyInSequence:completionHandler:", v10, v9);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_264E5ED28;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v7 = v6;
  id v8 = a2;
  [v8 getObjectRepresentations:v9 forClass:objc_opt_class()];
}

uint64_t __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_209(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v29 = a3;
  id v30 = a4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v7;
  uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2050000000;
        id v10 = (void *)getVNRecognizeDocumentsRequestClass_softClass;
        uint64_t v45 = getVNRecognizeDocumentsRequestClass_softClass;
        if (!getVNRecognizeDocumentsRequestClass_softClass)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getVNRecognizeDocumentsRequestClass_block_invoke;
          v49 = &unk_264E5EC88;
          v50 = &v42;
          __getVNRecognizeDocumentsRequestClass_block_invoke((uint64_t)buf);
          id v10 = (void *)v43[3];
        }
        uint64_t v11 = v10;
        _Block_object_dispose(&v42, 8);
        id v12 = [v11 alloc];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_4;
        v36[3] = &unk_264E5AA78;
        id v13 = *(id *)(a1 + 40);
        v36[4] = *(void *)(a1 + 32);
        id v37 = v13;
        v14 = (void *)[v12 initWithCompletionHandler:v36];
        [v14 setRecognitionLevel:0];
        [v14 setUsesLanguageDetection:1];
        [v14 setUsesLanguageCorrection:1];
        [v14 setMaximumCandidateCount:1];
        id v35 = 0;
        v15 = [v14 supportedRecognitionLanguagesAndReturnError:&v35];
        id v16 = v35;
        if (v15)
        {
          [v14 setRecognitionLanguages:v15];
          v17 = getWFActionsLogObject();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[WFExtractTextFromImageAction runAsynchronouslyWithInput:]_block_invoke_3";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          v18 = v17;
          os_log_type_t v19 = OS_LOG_TYPE_INFO;
          v20 = "%s Supported detection languages: %@";
        }
        else
        {
          v17 = getWFActionsLogObject();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[WFExtractTextFromImageAction runAsynchronouslyWithInput:]_block_invoke";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          v18 = v17;
          os_log_type_t v19 = OS_LOG_TYPE_ERROR;
          v20 = "%s Error determining supported languages: %@";
        }
        _os_log_impl(&dword_23C364000, v18, v19, v20, buf, 0x16u);
LABEL_14:

        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2050000000;
        v21 = (void *)getVNImageRequestHandlerClass_softClass;
        uint64_t v45 = getVNImageRequestHandlerClass_softClass;
        if (!getVNImageRequestHandlerClass_softClass)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getVNImageRequestHandlerClass_block_invoke;
          v49 = &unk_264E5EC88;
          v50 = &v42;
          __getVNImageRequestHandlerClass_block_invoke((uint64_t)buf);
          v21 = (void *)v43[3];
        }
        v22 = v21;
        _Block_object_dispose(&v42, 8);
        id v23 = [v22 alloc];
        uint64_t v24 = [v9 CGImage];
        v25 = (void *)[v23 initWithCGImage:v24 options:MEMORY[0x263EFFA78]];
        v46 = v14;
        v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
        id v34 = v16;
        LOBYTE(v23) = [v25 performRequests:v26 error:&v34];
        id v27 = v34;

        if ((v23 & 1) == 0)
        {
          v28 = getWFActionsLogObject();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "-[WFExtractTextFromImageAction runAsynchronouslyWithInput:]_block_invoke";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v27;
            _os_log_impl(&dword_23C364000, v28, OS_LOG_TYPE_ERROR, "%s Could not perform recognition request: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v33);
  }
}

void __59__WFExtractTextFromImageAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = [v5 results];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(id *)(*((void *)&v17 + 1) + 8 * i);
          if (v11)
          {
            uint64_t v22 = 0;
            id v23 = &v22;
            uint64_t v24 = 0x2050000000;
            id v12 = (void *)getVNDocumentObservationClass_softClass;
            uint64_t v25 = getVNDocumentObservationClass_softClass;
            if (!getVNDocumentObservationClass_softClass)
            {
              v21[0] = MEMORY[0x263EF8330];
              v21[1] = 3221225472;
              v21[2] = __getVNDocumentObservationClass_block_invoke;
              v21[3] = &unk_264E5EC88;
              v21[4] = &v22;
              __getVNDocumentObservationClass_block_invoke((uint64_t)v21);
              id v12 = (void *)v23[3];
            }
            id v13 = v12;
            _Block_object_dispose(&v22, 8);
            if (objc_opt_isKindOfClass())
            {
              v14 = [v11 getTranscript];
              if ([v14 length])
              {
                v15 = [*(id *)(a1 + 32) output];
                id v16 = [MEMORY[0x263F33998] itemWithObject:v14];
                [v15 addItem:v16];
              }
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }
      while (v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = 0;
  }
}

@end