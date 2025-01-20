@interface WFDownloadURLAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (BOOL)isProgressIndeterminate;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)configureHTTPBodyForRequest:(id)a3 withMethod:(id)a4 completionHandler:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)getContentsOfURLItem:(id)a3 expectedByteCountHandler:(id)a4 writtenByteCountHandler:(id)a5 completionHandler:(id)a6;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFDownloadURLAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to send %2$@ to “%3$@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to connect to “%2$@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFDownloadURLAction *)self input];
  WFGetContentLocationFromURLActionInput();
}

- (void)configureHTTPBodyForRequest:(id)a3 withMethod:(id)a4 completionHandler:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (![a4 isEqualToString:@"GET"])
  {
    id v10 = [(WFDownloadURLAction *)self parameterValueForKey:@"WFHTTPBodyType" ofClass:objc_opt_class()];
    if ([v10 isEqualToString:@"File"])
    {
      v11 = [(WFDownloadURLAction *)self parameterValueForKey:@"WFRequestVariable" ofClass:objc_opt_class()];
      if (v11)
      {
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __80__WFDownloadURLAction_configureHTTPBodyForRequest_withMethod_completionHandler___block_invoke;
        v43[3] = &unk_264E5E098;
        id v44 = v8;
        id v45 = v9;
        [v11 getFileRepresentation:v43 forType:0];
      }
      else
      {
        (*((void (**)(id, void))v9 + 2))(v9, 0);
      }

      goto LABEL_31;
    }
    int v12 = [v10 isEqualToString:@"JSON"];
    int v13 = [v10 isEqualToString:@"Form"];
    int v14 = v13;
    if ((v12 & 1) != 0 || v13)
    {
      if (v12)
      {
        uint64_t v15 = [(WFDownloadURLAction *)self parameterValueForKey:@"WFJSONValues" ofClass:objc_opt_class()];
        if (v15)
        {
          id v16 = (id)v15;
          if (!v14)
          {
LABEL_25:
            v22 = (id *)MEMORY[0x263F33AE0];
            if (!v12) {
              v22 = (id *)MEMORY[0x263F33AE8];
            }
            v23 = (void *)MEMORY[0x263F33850];
            id v24 = *v22;
            v17 = [v23 itemWithObject:v16];
            v36[0] = MEMORY[0x263EF8330];
            v36[1] = 3221225472;
            v36[2] = __80__WFDownloadURLAction_configureHTTPBodyForRequest_withMethod_completionHandler___block_invoke_2;
            v36[3] = &unk_264E5E098;
            id v37 = v8;
            id v38 = v9;
            v25 = [MEMORY[0x263F852B8] typeFromMIMEType:v24];

            [v17 getFileRepresentation:v36 forType:v25];
LABEL_30:

            goto LABEL_31;
          }
LABEL_16:
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v35 = v16;
          v17 = [v16 allValues];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v53 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v40;
            while (2)
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v40 != v20) {
                  objc_enumerationMutation(v17);
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v26 = v8;
                  id v27 = v35;
                  id v28 = v9;
                  v29 = objc_opt_new();
                  v30 = [v27 allKeys];
                  v50[0] = MEMORY[0x263EF8330];
                  v50[1] = 3221225472;
                  v50[2] = __WFConfigureRequestBodyWithMultipartFormDictionary_block_invoke;
                  v50[3] = &unk_264E579C8;
                  id v51 = v27;
                  id v31 = v29;
                  id v52 = v31;
                  v46[0] = MEMORY[0x263EF8330];
                  v46[1] = 3221225472;
                  v46[2] = __WFConfigureRequestBodyWithMultipartFormDictionary_block_invoke_3;
                  v46[3] = &unk_264E579F0;
                  id v47 = v26;
                  id v48 = v31;
                  id v49 = v28;
                  id v32 = v28;
                  id v33 = v31;
                  id v34 = v26;
                  id v16 = v27;
                  objc_msgSend(v30, "if_enumerateAsynchronouslyInSequence:completionHandler:", v50, v46);

                  goto LABEL_30;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v53 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }

          id v16 = v35;
          goto LABEL_25;
        }
      }
      else if (v13)
      {
        id v16 = [(WFDownloadURLAction *)self parameterValueForKey:@"WFFormValues" ofClass:objc_opt_class()];
        if (v16) {
          goto LABEL_16;
        }
      }
    }
    (*((void (**)(id, void))v9 + 2))(v9, 0);
LABEL_31:

    goto LABEL_32;
  }
  (*((void (**)(id, void))v9 + 2))(v9, 0);
LABEL_32:
}

void __80__WFDownloadURLAction_configureHTTPBodyForRequest_withMethod_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  WFConfigureRequestBodyWithFile(v5, a2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__WFDownloadURLAction_configureHTTPBodyForRequest_withMethod_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  WFConfigureRequestBodyWithFile(v5, a2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getContentsOfURLItem:(id)a3 expectedByteCountHandler:(id)a4 writtenByteCountHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(WFDownloadURLAction *)self parameterValueForKey:@"WFHTTPMethod" ofClass:objc_opt_class()];
  uint64_t v15 = [(WFDownloadURLAction *)self parameterValueForKey:@"WFHTTPHeaders" ofClass:objc_opt_class()];
  id v16 = objc_alloc(MEMORY[0x263EFC5E8]);
  v17 = [v10 URL];
  uint64_t v18 = (void *)[v16 initWithURL:v17];

  [v18 _setNonAppInitiated:1];
  [v18 setHTTPMethod:v14];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke;
  v31[3] = &unk_264E57978;
  id v19 = v18;
  id v32 = v19;
  [v15 enumerateKeysAndObjectsUsingBlock:v31];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke_2;
  v25[3] = &unk_264E579A0;
  id v26 = v10;
  id v27 = v19;
  id v28 = v13;
  id v29 = v11;
  id v30 = v12;
  id v20 = v12;
  id v21 = v11;
  id v22 = v19;
  id v23 = v10;
  id v24 = v13;
  [(WFDownloadURLAction *)self configureHTTPBodyForRequest:v22 withMethod:v14 completionHandler:v25];
}

uint64_t __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addValue:a3 forHTTPHeaderField:a2];
}

void __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke_3;
    v8[3] = &unk_264E5E098;
    id v10 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    [v4 getContentsWithRequest:v5 expectedByteCountHandler:v6 writtenByteCountHandler:v7 completionHandler:v8];
  }
}

void __111__WFDownloadURLAction_getContentsOfURLItem_expectedByteCountHandler_writtenByteCountHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v8 = a1 + 32;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(v8 + 8);
  id v9 = a3;
  id v10 = [v7 attributionSet];
  id v17 = v5;
  id v11 = v10;
  id v12 = [v17 wfType];
  if ([v12 conformsToUTType:*MEMORY[0x263F1DB48]])
  {
    uint64_t v13 = [MEMORY[0x263F33850] itemsWithJSONFileRepresentation:v17 attributionSet:v11];
LABEL_5:
    int v14 = (void *)v13;
    goto LABEL_6;
  }
  if ([v12 conformsToString:*MEMORY[0x263F33B20]])
  {
    uint64_t v13 = [MEMORY[0x263F33850] itemsWithPlistFileRepresentation:v17 attributionSet:v11];
    goto LABEL_5;
  }
  if (v17)
  {
    id v15 = objc_alloc(MEMORY[0x263EFF8C0]);
    id v16 = [MEMORY[0x263F337C8] itemWithFile:v17 attributionSet:v11];
    int v14 = objc_msgSend(v15, "initWithObjects:", v16, 0);
  }
  else
  {
    int v14 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_6:

  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v14, v9);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v22[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_2;
    v18[3] = &unk_264E57950;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v19 = v8;
    uint64_t v20 = v9;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_6;
    v17[3] = &unk_264E5E840;
    v17[4] = v9;
    [v6 transformItemsAndFlattenUsingBlock:v18 completionHandler:v17];
    id v10 = v19;
  }
  else
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F870B8];
    v21[0] = *MEMORY[0x263F08338];
    id v10 = WFLocalizedString(@"No URL Specified");
    v22[0] = v10;
    v21[1] = *MEMORY[0x263F08320];
    int v14 = WFLocalizedString(@"Make sure to pass a valid URL to the Get Contents of URL action.");
    v22[1] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v16 = [v12 errorWithDomain:v13 code:6 userInfo:v15];
    [v11 finishRunningWithError:v16];
  }
}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, *(void *)(a1 + 32));
  }
  id v8 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_3;
  v15[3] = &unk_264E57928;
  v15[4] = v8;
  id v13 = v7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_4;
  v14[3] = &unk_264E57928;
  v14[4] = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_5;
  v11[3] = &unk_264E5E4B8;
  id v12 = v5;
  id v9 = v7;
  id v10 = v5;
  [v8 getContentsOfURLItem:v10 expectedByteCountHandler:v15 writtenByteCountHandler:v14 completionHandler:v11];
}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) progress];
  objc_msgSend(v3, "setTotalUnitCount:", objc_msgSend(v3, "totalUnitCount") + a2);
}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) progress];
  objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v3, "completedUnitCount") + a2);
}

void __50__WFDownloadURLAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) URL];
  if ([v6 isFileURL])
  {
    id v7 = [v5 domain];
    if ([v7 isEqualToString:*MEMORY[0x263F08570]])
    {
      uint64_t v8 = [v5 code];

      if (v8 != -1100) {
        goto LABEL_7;
      }
      id v6 = v5;
      id v5 = 0;
    }
    else
    {
    }
  }

LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end