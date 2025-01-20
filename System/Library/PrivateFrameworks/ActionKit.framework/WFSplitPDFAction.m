@interface WFSplitPDFAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSplitPDFAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__WFSplitPDFAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_264E57A18;
  v4[4] = self;
  id v3 = a3;
  [v3 getObjectRepresentation:v4 forClass:getPDFDocumentClass()];
}

void __47__WFSplitPDFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v24 = a2;
  v21 = a3;
  id v20 = a4;
  if ([v24 pageCount])
  {
    unint64_t v6 = 0;
    v7 = @"PDF";
    if (v21) {
      v7 = v21;
    }
    v22 = v7;
    uint64_t v8 = *MEMORY[0x263F1DBF0];
    do
    {
      v9 = [v24 pageAtIndex:v6];
      id v10 = objc_alloc_init((Class)getPDFDocumentClass());
      [v10 insertPage:v9 atIndex:0];
      v11 = [NSString stringWithFormat:@"%@-%li", v22, v6];
      v12 = (void *)MEMORY[0x263F33870];
      v13 = [MEMORY[0x263F852B8] typeWithUTType:v8];
      v14 = [v12 proposedFilenameForFile:v11 ofType:v13];

      v15 = [MEMORY[0x263F339A0] createTemporaryFileWithFilename:v14];
      [v10 writeToURL:v15];
      v16 = (void *)MEMORY[0x263F33870];
      v17 = [MEMORY[0x263F852B8] typeWithUTType:v8];
      v18 = [v16 fileWithURL:v15 options:1 ofType:v17];

      v19 = [*(id *)(a1 + 32) output];
      [v19 addFile:v18];

      ++v6;
    }
    while (v6 < [v24 pageCount]);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v20];
}

@end