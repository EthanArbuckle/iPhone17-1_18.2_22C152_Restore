@interface WFInstapaperAddAction
- (id)connectionTypes;
- (id)contentDestinationWithError:(id *)a3;
- (id)disabledOnPlatforms;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)engine:(id)a3 connection:(id)a4 didAddBookmark:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3 selectedFolder:(id)a4;
@end

@implementation WFInstapaperAddAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to add %2$@ to Instapaper?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to add content to Instapaper?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "instapaperLocation", a3);
}

- (void)engine:(id)a3 connection:(id)a4 didAddBookmark:(id)a5
{
  id v11 = a4;
  id v6 = [(WFInstapaperAction *)self identifiers];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [(WFInstapaperAction *)self identifiers];
    v9 = [(WFInstapaperAction *)self engine];
    v10 = [v9 identifierForConnection:v11];
    [v8 removeObject:v10];
  }
}

- (id)connectionTypes
{
  return &unk_26F076590;
}

- (void)runAsynchronouslyWithInput:(id)a3 selectedFolder:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__WFInstapaperAddAction_runAsynchronouslyWithInput_selectedFolder___block_invoke;
  v11[3] = &unk_264E585E8;
  v11[4] = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__WFInstapaperAddAction_runAsynchronouslyWithInput_selectedFolder___block_invoke_2;
  v10[3] = &unk_264E5E8E8;
  v10[4] = self;
  [v8 enumerateObjectRepresentations:v11 forClass:v9 completionHandler:v10];
}

void __67__WFInstapaperAddAction_runAsynchronouslyWithInput_selectedFolder___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a2;
  uint64_t v9 = [v8 wfName];
  int v10 = [v15 isEqualToString:v9];

  id v11 = v15;
  if (v10)
  {

    id v11 = 0;
  }
  id v12 = [*(id *)(a1 + 32) identifiers];
  v13 = [*(id *)(a1 + 32) engine];
  v14 = [v13 addBookmarkWithURL:v8 title:v11 description:0 folder:*(void *)(a1 + 40) resolveFinalURL:1 userInfo:0];

  [v12 addObject:v14];
  v7[2](v7, 0);
}

uint64_t __67__WFInstapaperAddAction_runAsynchronouslyWithInput_selectedFolder___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) finishRunningWithError:0];
  }
  return result;
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFInstapaperAddAction;
  v2 = [(WFInstapaperAddAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end