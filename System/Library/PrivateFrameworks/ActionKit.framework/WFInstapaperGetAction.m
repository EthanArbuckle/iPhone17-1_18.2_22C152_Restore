@interface WFInstapaperGetAction
- (BOOL)includeSpecialFolders;
- (id)connectionTypes;
- (id)disabledOnPlatforms;
- (void)engine:(id)a3 connection:(id)a4 didReceiveBookmarks:(id)a5 ofUser:(id)a6 forFolder:(id)a7;
- (void)runAsynchronouslyWithInput:(id)a3 selectedFolder:(id)a4;
@end

@implementation WFInstapaperGetAction

- (void)engine:(id)a3 connection:(id)a4 didReceiveBookmarks:(id)a5 ofUser:(id)a6 forFolder:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFInstapaperAction *)self identifiers];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = [(WFInstapaperAction *)self identifiers];
    v14 = [(WFInstapaperAction *)self engine];
    v15 = [v14 identifierForConnection:v9];
    [v13 removeObject:v15];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v25 + 1) + 8 * v20);
        v22 = [(WFInstapaperGetAction *)self output];
        v23 = [v21 URL];
        v24 = [v21 title];
        [v22 addObject:v23 named:v24];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }
}

- (BOOL)includeSpecialFolders
{
  return 1;
}

- (id)connectionTypes
{
  return &unk_26F0766E0;
}

- (void)runAsynchronouslyWithInput:(id)a3 selectedFolder:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__WFInstapaperGetAction_runAsynchronouslyWithInput_selectedFolder___block_invoke;
  v7[3] = &unk_264E5DED8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __67__WFInstapaperGetAction_runAsynchronouslyWithInput_selectedFolder___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) parameterValueForKey:@"WFBookmarkCount" ofClass:objc_opt_class()];
  uint64_t v3 = [v2 unsignedIntegerValue];

  id v6 = [*(id *)(a1 + 32) identifiers];
  v4 = [*(id *)(a1 + 32) engine];
  id v5 = [v4 bookmarksInFolder:*(void *)(a1 + 40) limit:v3 existingBookmarks:0 userInfo:0];
  [v6 addObject:v5];
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFInstapaperGetAction;
  v2 = [(WFInstapaperGetAction *)&v5 disabledOnPlatforms];
  uint64_t v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end