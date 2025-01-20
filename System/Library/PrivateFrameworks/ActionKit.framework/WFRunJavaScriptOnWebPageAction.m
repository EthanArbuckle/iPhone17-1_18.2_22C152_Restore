@interface WFRunJavaScriptOnWebPageAction
- (id)_getErrorFromScript:(id)a3;
- (id)invalidJavaScriptErrorWithSyntaxErrorString:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)missingCompletionError;
- (id)noWebPageProvidedError;
- (id)parameterSummary;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)evaluateQuarantineWithJavaScript:(id)a3 webPageURL:(id)a4 completionHandler:(id)a5;
- (void)getWebPageFromInput:(id)a3 completionHandler:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFRunJavaScriptOnWebPageAction

- (id)parameterSummary
{
  id v2 = objc_alloc(MEMORY[0x263F86888]);
  v3 = WFLocalizedStringResourceWithKey(@"Run JavaScript on ${WFInput}", @"Run JavaScript on ${WFInput}");
  v4 = (void *)[v2 initWithString:v3];

  return v4;
}

- (id)localizedNameWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Run JavaScript on Web Page", @"Run JavaScript on Web Page");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to use %2$@ in JavaScript on a webpage?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to run JavaScript?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)noWebPageProvidedError
{
  v9[2] = *MEMORY[0x263EF8340];
  id v2 = WFLocalizedString(@"No Web Page");
  id v3 = WFLocalizedString(@"Run JavaScript on Web Page failed because no web page was passed as input.");
  uint64_t v4 = *MEMORY[0x263F08320];
  v8[0] = *MEMORY[0x263F08338];
  v8[1] = v4;
  v9[0] = v2;
  v9[1] = v3;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:6 userInfo:v5];

  return v6;
}

- (id)_getErrorFromScript:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x23ECE6170]();
  id v5 = objc_alloc_init(MEMORY[0x263F10378]);
  id v6 = v3;
  v7 = JSStringCreateWithUTF8CString((const char *)[v6 UTF8String]);
  JSValueRef exception = 0;
  BOOL v8 = JSCheckScriptSyntax((JSContextRef)[v5 JSGlobalContextRef], v7, 0, 0, &exception);
  JSStringRelease(v7);
  v9 = 0;
  if (!v8)
  {
    v10 = (const OpaqueJSContext *)[v5 JSGlobalContextRef];
    v11 = JSValueToStringCopy(v10, exception, 0);
    v9 = (__CFString *)JSStringCopyCFString(0, v11);
    JSStringRelease(v11);
  }

  return v9;
}

- (void)getWebPageFromInput:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke;
  void v9[3] = &unk_264E5CDA8;
  v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  id v8 = a3;
  [v8 getObjectRepresentationAndAttributionSet:v9 forClass:objc_opt_class()];
}

void __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke_2;
    v8[3] = &unk_264E5DC38;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v6;
    id v11 = *(id *)(a1 + 40);
    id v10 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke_2(id *a1)
{
  id v2 = [a1[4] workflow];
  id v3 = [a1[5] URL];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "_lp_highLevelDomain");
  }
  else {
  uint64_t v4 = [v3 host];
  }
  id v5 = [a1[4] userInterface];
  id v6 = [MEMORY[0x263F86A50] defaultDatabase];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke_3;
  v7[3] = &unk_264E5CD80;
  id v10 = a1[7];
  id v8 = a1[5];
  id v9 = a1[6];
  [v2 requestToRunScriptsOnDomain:v4 withUserInterface:v5 database:v6 completionHandler:v7];
}

void __72__WFRunJavaScriptOnWebPageAction_getWebPageFromInput_completionHandler___block_invoke_3(void *a1, char a2)
{
  uint64_t v2 = a1[6];
  if (a2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    id v5 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v6 = a1[6];
    v5(v6, v3, v4, 0);
  }
  else
  {
    id v7 = [MEMORY[0x263F087E8] userCancelledError];
    (*(void (**)(uint64_t, void, void, id))(v2 + 16))(v2, 0, 0, v7);
  }
}

- (void)evaluateQuarantineWithJavaScript:(id)a3 webPageURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WFRunJavaScriptOnWebPageAction *)self parameterStateForKey:@"WFJavaScript"];
  uint64_t v12 = [v11 variableString];

  id v13 = objc_alloc(MEMORY[0x263F86C48]);
  v14 = [(WFRunJavaScriptOnWebPageAction *)self workflow];
  v15 = (void *)[v13 initWithWorkflow:v14 runtimeType:1 targetURL:v9 preRuntimeVariableString:v12 runtimeString:v10];

  v16 = [MEMORY[0x263F86E18] sharedEvaluator];
  [v16 setDelegate:self];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __96__WFRunJavaScriptOnWebPageAction_evaluateQuarantineWithJavaScript_webPageURL_completionHandler___block_invoke;
  v18[3] = &unk_264E5CD58;
  v18[4] = self;
  id v19 = v8;
  id v17 = v8;
  [v16 evaluatePolicyForRequest:v15 completion:v18];
}

void __96__WFRunJavaScriptOnWebPageAction_evaluateQuarantineWithJavaScript_webPageURL_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__WFRunJavaScriptOnWebPageAction_evaluateQuarantineWithJavaScript_webPageURL_completionHandler___block_invoke_2;
  block[3] = &unk_264E5CD30;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __96__WFRunJavaScriptOnWebPageAction_evaluateQuarantineWithJavaScript_webPageURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFRunJavaScriptOnWebPageAction *)self parameterValueForKey:@"WFJavaScript" ofClass:objc_opt_class()];
  if ([v5 containsString:@"completion"])
  {
    uint64_t v6 = [(WFRunJavaScriptOnWebPageAction *)self _getErrorFromScript:v5];
    if ([v6 length])
    {
      id v7 = [(WFRunJavaScriptOnWebPageAction *)self invalidJavaScriptErrorWithSyntaxErrorString:v6];
      [(WFRunJavaScriptOnWebPageAction *)self finishRunningWithError:v7];
    }
    else
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      void v8[2] = __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke;
      v8[3] = &unk_264E5CD08;
      v8[4] = self;
      id v9 = v5;
      [(WFRunJavaScriptOnWebPageAction *)self getWebPageFromInput:v4 completionHandler:v8];
    }
  }
  else
  {
    uint64_t v6 = [(WFRunJavaScriptOnWebPageAction *)self missingCompletionError];
    [(WFRunJavaScriptOnWebPageAction *)self finishRunningWithError:v6];
  }
}

void __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [v10 URL];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke_2;
    v16[3] = &unk_264E5CCE0;
    v14 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v10;
    id v18 = v14;
    id v19 = v8;
    id v15 = v10;
    [v11 evaluateQuarantineWithJavaScript:v12 webPageURL:v13 completionHandler:v16];
  }
  else
  {

    [*(id *)(a1 + 32) finishRunningWithError:v9];
  }
}

void __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      goto LABEL_7;
    }
    uint64_t v6 = [*(id *)(a1 + 32) variableSource];
    id v7 = [v6 listenerEndpoints];
    id v8 = [*(id *)(a1 + 40) javaScriptRunnerIdentifier];
    id v9 = [v7 objectForKey:v8];

    if (v9)
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x263F338B8]) initWithEndpoint:v9];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke_3;
      v13[3] = &unk_264E5CCB8;
      v13[4] = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 48);
      id v14 = *(id *)(a1 + 56);
      [v10 runJavaScript:v11 completionHandler:v13];
    }
    else
    {
LABEL_7:
      uint64_t v12 = *(void **)(a1 + 32);
      id v9 = [v12 noWebPageProvidedError];
      [v12 finishRunningWithError:v9];
    }
  }
}

void __61__WFRunJavaScriptOnWebPageAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v32[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      id v7 = [v5 objectForKey:@"success"];
      uint64_t v8 = objc_opt_class();
      id v9 = WFEnforceClass(v7, v8);

      if ([v9 BOOLValue])
      {
        id v10 = [v5 objectForKey:@"userResult"];
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = WFEnforceClass(v10, v11);

        if (v12)
        {
          id v13 = [v12 dataUsingEncoding:4];
          id v14 = (void *)MEMORY[0x263F33870];
          id v15 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DD38]];
          v16 = [v14 fileWithData:v13 ofType:v15 proposedFilename:0];

          id v17 = [MEMORY[0x263F33850] itemsWithJSONFileRepresentation:v16 attributionSet:*(void *)(a1 + 40)];
          id v18 = [MEMORY[0x263F337B0] collectionWithItems:v17];
          [*(id *)(a1 + 32) setOutput:v18];
        }
        [*(id *)(a1 + 32) finishRunningWithError:0];
        goto LABEL_13;
      }
      uint64_t v12 = WFLocalizedString(@"JavaScript Exception");
      v23 = [v5 objectForKey:@"exception"];
      uint64_t v24 = objc_opt_class();
      v20 = WFEnforceClass(v23, v24);

      if (![v20 length])
      {
        uint64_t v25 = WFLocalizedString(@"An unknown error occurred when running JavaScript.");

        v20 = (void *)v25;
      }
      uint64_t v26 = *MEMORY[0x263F08320];
      v29[0] = *MEMORY[0x263F08338];
      v29[1] = v26;
      v30[0] = v12;
      v30[1] = v20;
      v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
      v27 = *(void **)(a1 + 32);
      v28 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:6 userInfo:v22];
      [v27 finishRunningWithError:v28];
    }
    else
    {
      id v9 = WFLocalizedString(@"JavaScript Timeout");
      uint64_t v12 = WFLocalizedString(@"Run JavaScript on Web Page failed because the script took too long to call the completion handler.");
      uint64_t v19 = *MEMORY[0x263F08320];
      v31[0] = *MEMORY[0x263F08338];
      v31[1] = v19;
      v32[0] = v9;
      v32[1] = v12;
      v20 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
      v21 = *(void **)(a1 + 32);
      v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:6 userInfo:v20];
      [v21 finishRunningWithError:v22];
    }

LABEL_13:
    goto LABEL_14;
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
LABEL_14:
}

- (id)invalidJavaScriptErrorWithSyntaxErrorString:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = WFLocalizedString(@"Invalid JavaScript");
  uint64_t v5 = *MEMORY[0x263F08320];
  v9[0] = *MEMORY[0x263F08338];
  v9[1] = v5;
  v10[0] = v4;
  v10[1] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:6 userInfo:v6];

  return v7;
}

- (id)missingCompletionError
{
  void v9[2] = *MEMORY[0x263EF8340];
  v3 = uint64_t v2 = WFLocalizedString(@"Invalid JavaScript");
  uint64_t v4 = *MEMORY[0x263F08320];
  v8[0] = *MEMORY[0x263F08338];
  v8[1] = v4;
  v9[0] = v2;
  v9[1] = v3;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:6 userInfo:v5];

  return v6;
}

@end