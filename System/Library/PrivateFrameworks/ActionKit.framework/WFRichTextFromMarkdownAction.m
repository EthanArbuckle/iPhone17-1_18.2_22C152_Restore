@interface WFRichTextFromMarkdownAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFRichTextFromMarkdownAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = (void *)MEMORY[0x263F852B8];
  id v5 = a3;
  v6 = [v4 typeFromFileExtension:@"md"];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke;
  v19[3] = &unk_264E5D018;
  id v7 = v6;
  id v20 = v7;
  id v18 = v5;
  v8 = [v5 collectionByFilteringItemsWithBlock:v19 excludedItems:&v18];
  id v9 = v18;

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_3;
  aBlock[3] = &unk_264E5E840;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  if ([v8 numberOfItems])
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_4;
    v15[3] = &unk_264E5D060;
    v11 = &v16;
    v16 = &__block_literal_global_49140;
    [v8 transformFirstFileRepresentationForType:v7 usingBlock:v15 completionHandler:v10];
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_5;
    v13[3] = &unk_264E5D088;
    v11 = &v14;
    v14 = &__block_literal_global_49140;
    [v9 transformFirstObjectRepresentationForClass:v12 usingBlock:v13 completionHandler:v10];
  }
}

uint64_t __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    v6 = [v3 preferredFileType];
    uint64_t v5 = [v6 conformsToType:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = (objc_class *)NSString;
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 alloc];
  id v14 = [v10 data];
  uint64_t v12 = (void *)[v11 initWithData:v14 encoding:10];
  v13 = [v10 wfName];

  (*(void (**)(uint64_t, void *, void *, id, id))(v6 + 16))(v6, v12, v13, v9, v8);
}

uint64_t __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (a2)
  {
    id v17 = 0;
    uint64_t v12 = +[MMMarkdown HTMLStringWithMarkdown:a2 extensions:873 error:&v17];
    id v13 = v17;
    if (v12)
    {
      id v14 = [v12 dataUsingEncoding:10];
      v15 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
      v16 = [MEMORY[0x263F33870] fileWithData:v14 ofType:v15 proposedFilename:v8];
      ((void (**)(void, void *, id))v11)[2](v11, v16, v9);
    }
    else
    {
      ((void (**)(void, void, id))v11)[2](v11, 0, v13);
    }
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v9);
  }
}

@end