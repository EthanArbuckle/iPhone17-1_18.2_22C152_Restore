@interface WFMarkdownFromRichTextAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFMarkdownFromRichTextAction

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
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__WFMarkdownFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_264E5E840;
  v8[4] = self;
  [v6 transformFirstFileRepresentationForType:v7 usingBlock:&__block_literal_global_53282 completionHandler:v8];
}

uint64_t __59__WFMarkdownFromRichTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setOutput:a2];
  v3 = *(void **)(a1 + 32);
  return [v3 finishRunningWithError:0];
}

void __59__WFMarkdownFromRichTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v16 = a2;
  if (v16)
  {
    uint64_t v5 = a4;
    id v6 = [v16 data];
    v7 = objc_msgSend(NSString, "wf_stringWithData:", v6);
    id v8 = objc_alloc(MEMORY[0x263F338A0]);
    v9 = [v16 originalURL];
    v10 = (void *)[v8 initWithBaseURL:v9];

    v11 = (void *)MEMORY[0x263F337C8];
    v12 = [v10 handleHTML:v7];
    v13 = [v16 wfName];
    v14 = [v11 itemWithObject:v12 named:v13];

    ((void (*)(void *, void *, void))v5[2])(v5, v14, 0);
  }
  else
  {
    v15 = (void (*)(void))a4[2];
    id v6 = a4;
    v15();
  }
}

@end