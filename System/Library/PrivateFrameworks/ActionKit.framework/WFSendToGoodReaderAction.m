@interface WFSendToGoodReaderAction
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSendToGoodReaderAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to open %2$@ in GoodReader?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to open GoodReader?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  v3 = (void *)MEMORY[0x263F33708];
  v4 = [(WFSendToGoodReaderAction *)self appDescriptor];
  v5 = [v3 locationWithAppDescriptor:v4];

  return v5;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__WFSendToGoodReaderAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5D390;
  v3[4] = self;
  [a3 getFileRepresentation:v3 forType:0];
}

void __55__WFSendToGoodReaderAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [MEMORY[0x263F86828] sharedRegistry];
    v7 = [v6 appWithIdentifier:@"com.goodiware.goodreader4"];

    id v8 = [v5 fileURL];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__WFSendToGoodReaderAction_runAsynchronouslyWithInput___block_invoke_2;
    v12[3] = &unk_264E5C978;
    id v13 = v7;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v14 = v9;
    uint64_t v15 = v10;
    id v11 = v7;
    [v11 openFile:v8 completionHandler:v12];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

void __55__WFSendToGoodReaderAction_runAsynchronouslyWithInput___block_invoke_2(id *a1, char a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = *MEMORY[0x263F08438];
    uint64_t v12 = *MEMORY[0x263F08320];
    id v6 = NSString;
    v7 = WFLocalizedString(@"%1$@ is not installed or could not open the file %2$@.");
    id v8 = [a1[4] localizedName];
    id v9 = [a1[5] filename];
    uint64_t v10 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v9);
    v13[0] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v3 = [v4 errorWithDomain:v5 code:79 userInfo:v11];
  }
  [a1[6] finishRunningWithError:v3];
}

@end