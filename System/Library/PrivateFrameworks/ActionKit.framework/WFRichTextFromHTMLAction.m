@interface WFRichTextFromHTMLAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFRichTextFromHTMLAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__WFRichTextFromHTMLAction_runAsynchronouslyWithInput___block_invoke_2;
  v6[3] = &unk_264E5E840;
  v6[4] = self;
  [v4 transformFirstObjectRepresentationForClass:v5 usingBlock:&__block_literal_global_3470 completionHandler:v6];
}

void __55__WFRichTextFromHTMLAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __55__WFRichTextFromHTMLAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a3;
  if (a2)
  {
    v8 = a5;
    id v9 = a4;
    id v10 = [a2 dataUsingEncoding:10];
    v11 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
    v12 = [MEMORY[0x263F33870] fileWithData:v10 ofType:v11 proposedFilename:v14];
    ((void (*)(void *, void *, id))v8[2])(v8, v12, v9);
  }
  else
  {
    v13 = (void (*)(void *, void, id))a5[2];
    v11 = a5;
    id v10 = a4;
    v13(v11, 0, v10);
  }
}

@end