@interface WFWebResourceCapturer
+ (void)getImageRepresentationForWebResource:(id)a3 atSize:(CGSize)a4 coercionOptions:(id)a5 completionHandler:(id)a6;
+ (void)getPasteboardRepresentationForWebResource:(id)a3 type:(id)a4 coercionOptions:(id)a5 completionHandler:(id)a6;
+ (void)getPrintFormatterForWebResource:(id)a3 coercionOptions:(id)a4 completionHandler:(id)a5;
- (void)generatePDFForWebResource:(id)a3 includeMargin:(BOOL)a4 coercionOptions:(id)a5 completionHandler:(id)a6;
@end

@implementation WFWebResourceCapturer

- (void)generatePDFForWebResource:(id)a3 includeMargin:(BOOL)a4 coercionOptions:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __99__WFWebResourceCapturer_generatePDFForWebResource_includeMargin_coercionOptions_completionHandler___block_invoke;
  v11[3] = &unk_264288180;
  id v12 = v9;
  BOOL v13 = a4;
  id v10 = v9;
  +[WFWebResourceCapturer getPrintFormatterForWebResource:a3 coercionOptions:a5 completionHandler:v11];
}

void __99__WFWebResourceCapturer_generatePDFForWebResource_includeMargin_coercionOptions_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    v8[0] = a2;
    v5 = (void *)MEMORY[0x263EFF8C0];
    id v6 = a2;
    v7 = [v5 arrayWithObjects:v8 count:1];
    +[WFPDFContentItem getPDFFromPrintFormatters:v7 nameIfKnown:0 matchingInputSize:1 withMargin:*(unsigned __int8 *)(a1 + 40) startingAtPage:1 endingAtPage:0x7FFFFFFFFFFFFFFFLL completionHandler:*(void *)(a1 + 32)];
  }
  else
  {
    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, a4);
    v7 = 0;
  }
}

+ (void)getImageRepresentationForWebResource:(id)a3 atSize:(CGSize)a4 coercionOptions:(id)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __103__WFWebResourceCapturer_getImageRepresentationForWebResource_atSize_coercionOptions_completionHandler___block_invoke;
  v12[3] = &unk_264288158;
  id v13 = v10;
  id v11 = v10;
  +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", a3, 0, a5, v12, width, height);
}

void __103__WFWebResourceCapturer_getImageRepresentationForWebResource_atSize_coercionOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __103__WFWebResourceCapturer_getImageRepresentationForWebResource_atSize_coercionOptions_completionHandler___block_invoke_2;
    v4[3] = &unk_2642881A8;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    [v5 takeSnapshotWithConfiguration:0 completionHandler:v4];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __103__WFWebResourceCapturer_getImageRepresentationForWebResource_atSize_coercionOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = objc_alloc(MEMORY[0x263F85308]);
    v4 = [MEMORY[0x263F85258] currentDevice];
    [v4 screenScale];
    id v5 = objc_msgSend(v3, "initWithPlatformImage:scale:", v8);

    uint64_t v6 = *(void *)(a1 + 40);
    v7 = [*(id *)(a1 + 32) title];
    (*(void (**)(uint64_t, void *, void *, void))(v6 + 16))(v6, v5, v7, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)getPrintFormatterForWebResource:(id)a3 coercionOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = getWFContentGraphLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "+[WFWebResourceCapturer getPrintFormatterForWebResource:coercionOptions:completionHandler:]";
    _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_INFO, "%s getting print formatter", buf, 0xCu);
  }

  id v11 = [MEMORY[0x263F852B8] typeFromFileExtension:@"pages"];
  v35[0] = v11;
  id v12 = [MEMORY[0x263F852B8] typeFromFileExtension:@"key"];
  v35[1] = v12;
  id v13 = [MEMORY[0x263F852B8] typeFromFileExtension:@"numbers"];
  v35[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [v7 file];
    v16 = [v15 wfType];
    int v17 = [v16 conformsToTypes:v14];

    if (v17)
    {
      id v29 = v8;
      v18 = [v15 fileURL];
      uint64_t v34 = *MEMORY[0x263EFF6A8];
      uint64_t v19 = v34;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
      v21 = [v18 resourceValuesForKeys:v20 error:0];
      v22 = [v21 objectForKey:v19];
      int v23 = [v22 BOOLValue];

      if (v23)
      {
        v33 = v15;
        v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
        v25 = [v15 filename];
        id v32 = 0;
        v26 = WFCreateArchiveWithFiles(v24, v25, @"zip", &v32);
        id v27 = v32;

        if (!v26)
        {
          (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v27);

          id v8 = v29;
          goto LABEL_11;
        }
        uint64_t v28 = +[WFWebResource webResourceWithFile:v26];

        id v7 = (id)v28;
      }
      id v8 = v29;
    }
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __91__WFWebResourceCapturer_getPrintFormatterForWebResource_coercionOptions_completionHandler___block_invoke;
  v30[3] = &unk_264288158;
  id v31 = v9;
  +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", v7, 0, v8, v30, 612.0, 792.0);
  v15 = v31;
LABEL_11:
}

void __91__WFWebResourceCapturer_getPrintFormatterForWebResource_coercionOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v5;
  if (v5)
  {
    id v7 = a3;
    id v8 = [v12 viewPrintFormatter];
    id v9 = (void *)[v8 copy];
    id v10 = [v12 title];
    (*(void (**)(uint64_t, void *, void *, id))(v6 + 16))(v6, v9, v10, v7);
  }
  else
  {
    id v11 = *(void (**)(uint64_t, void, void, id))(v6 + 16);
    id v8 = a3;
    v11(v6, 0, 0, v8);
  }
}

+ (void)getPasteboardRepresentationForWebResource:(id)a3 type:(id)a4 coercionOptions:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x263F852B8] typeFromPasteboardType:*MEMORY[0x263F85A38]];
  if (![v10 conformsToType:v13])
  {

    goto LABEL_5;
  }
  int v14 = [getWKWebViewClass() instancesRespondToSelector:sel__getWebArchiveDataWithCompletionHandler_];

  if (!v14)
  {
LABEL_5:
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_3;
    id v27 = &unk_264288DB8;
    v15 = &v29;
    v16 = &v28;
    id v28 = v10;
    id v29 = v12;
    double v17 = *MEMORY[0x263F001B0];
    double v18 = *(double *)(MEMORY[0x263F001B0] + 8);
    id v22 = v10;
    id v23 = v12;
    v21 = &v24;
    goto LABEL_6;
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke;
  v30[3] = &unk_264288DB8;
  v15 = &v32;
  v16 = &v31;
  id v31 = v10;
  id v32 = v12;
  double v17 = *MEMORY[0x263F001B0];
  double v18 = *(double *)(MEMORY[0x263F001B0] + 8);
  id v19 = v10;
  id v20 = v12;
  v21 = v30;
LABEL_6:
  +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", v9, 0, v11, v21, v17, v18, v24, v25, v26, v27);
}

void __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_2;
    v4[3] = &unk_26428A910;
    id v7 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 32);
    id v6 = v3;
    [v6 _getWebArchiveDataWithCompletionHandler:v4];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    id v13 = __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_4;
    int v14 = &unk_264288130;
    id v7 = *(void **)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 32);
    id v16 = v5;
    id v17 = v6;
    id v8 = v16;
    id v9 = v7;
    id v10 = v12;
    if [getWKWebViewClass() instancesRespondToSelector:sel__executeEditCommand_argument_completion_]&& (objc_msgSend(getWKWebViewClass(), "instancesRespondToSelector:", sel__doAfterNextPresentationUpdateWithoutWaitingForPainting_))
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __WFGetPasteboardRepresentationFromWKWebView_block_invoke;
      v19[3] = &unk_264288238;
      id v11 = v8;
      id v20 = v11;
      id v21 = v9;
      id v22 = v10;
      [v11 _executeEditCommand:@"selectAll" argument:0 completion:v19];
    }
    else
    {
      v13(v10, 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_4(void *a1, void *a2)
{
  uint64_t v3 = a1[7];
  uint64_t v4 = a1[4];
  id v5 = (void *)a1[5];
  id v6 = a2;
  id v7 = [v5 title];
  (*(void (**)(uint64_t, id, uint64_t, id, void))(v3 + 16))(v3, v6, v4, v7, a1[6]);
}

void __106__WFWebResourceCapturer_getPasteboardRepresentationForWebResource_type_coercionOptions_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[5];
  uint64_t v4 = a1[6];
  uint64_t v6 = a1[4];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v5 title];
  (*(void (**)(uint64_t, id, uint64_t, id, id))(v4 + 16))(v4, v8, v6, v9, v7);
}

@end