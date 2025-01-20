@interface WFHTMLFromRichTextAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFHTMLFromRichTextAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = (void *)MEMORY[0x263F852B8];
  uint64_t v5 = *MEMORY[0x263F1DB00];
  id v6 = a3;
  v7 = [v4 typeWithUTType:v5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__WFHTMLFromRichTextAction_runAsynchronouslyWithInput___block_invoke;
  v9[3] = &unk_264E59DC8;
  v9[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__WFHTMLFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_264E5E840;
  v8[4] = self;
  [v6 transformFirstFileRepresentationForType:v7 usingBlock:v9 completionHandler:v8];
}

void __55__WFHTMLFromRichTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  v8 = a4;
  v9 = [v17 data];
  v10 = [*(id *)(a1 + 32) parameterValueForKey:@"WFMakeFullDocument" ofClass:objc_opt_class()];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F33960] normalizedHTMLDocumentFromHTMLData:v9];

    v9 = (void *)v12;
  }
  v13 = objc_msgSend(NSString, "wf_stringWithData:", v9);
  if (v13)
  {
    v14 = (void *)MEMORY[0x263F33908];
    v15 = [v17 wfName];
    v16 = [v14 object:v13 named:v15];
    v8[2](v8, v16, v7);
  }
  else
  {
    v8[2](v8, 0, v7);
  }
}

void __55__WFHTMLFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end