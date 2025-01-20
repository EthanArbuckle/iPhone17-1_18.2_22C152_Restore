@interface WFInstapaperAction
- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4;
- (BOOL)hasFetchedFolders;
- (BOOL)includeSpecialFolders;
- (IKEngine)engine;
- (NSArray)connectionTypes;
- (NSMutableArray)identifiers;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)folders;
- (id)possibleStatesForEnumeration:(id)a3;
- (void)dealloc;
- (void)engine:(id)a3 connection:(id)a4 didReceiveFolders:(id)a5;
- (void)engine:(id)a3 didFailConnection:(id)a4 error:(id)a5;
- (void)engine:(id)a3 didFinishConnection:(id)a4;
- (void)engine:(id)a3 willStartConnection:(id)a4;
- (void)finishRunningWithError:(id)a3;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3 selectedFolder:(id)a4;
- (void)setHasFetchedFolders:(BOOL)a3;
- (void)updateFolders;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
@end

@implementation WFInstapaperAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

- (void)setHasFetchedFolders:(BOOL)a3
{
  self->_hasFetchedFolders = a3;
}

- (BOOL)hasFetchedFolders
{
  return self->_hasFetchedFolders;
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  return (id)objc_msgSend(a4, "value", a3);
}

- (id)possibleStatesForEnumeration:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF980]);
  v6 = [(WFInstapaperAction *)self folders];
  v7 = [v6 allKeys];
  v8 = (void *)[v5 initWithArray:v7];

  if (![(WFInstapaperAction *)self includeSpecialFolders])
  {
    id v20 = v4;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = (void *)[v8 copy];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v15 = [(WFInstapaperAction *)self folders];
          v16 = [v15 objectForKey:v14];
          uint64_t v17 = [v16 integerValue];

          if (v17 < 0) {
            [v8 removeObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v4 = v20;
  }
  v18 = objc_msgSend(v8, "if_map:", &__block_literal_global_9950);
  objc_msgSend(v4, "setHidden:", objc_msgSend(v18, "count") == 0);

  return v18;
}

id __51__WFInstapaperAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (void)engine:(id)a3 connection:(id)a4 didReceiveFolders:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v9 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "folderID"));
        uint64_t v17 = [v15 title];
        [v9 setObject:v16 forKey:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }

  v18 = NSNumber;
  v19 = +[IKFolder starredFolder];
  id v20 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "folderID"));
  [v9 setObject:v20 forKey:@"Starred"];

  long long v21 = NSNumber;
  long long v22 = +[IKFolder unreadFolder];
  long long v23 = objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "folderID"));
  [v9 setObject:v23 forKey:@"Unread"];

  long long v24 = NSNumber;
  v25 = +[IKFolder archiveFolder];
  uint64_t v26 = objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v25, "folderID"));
  [v9 setObject:v26 forKey:@"Archive"];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__WFInstapaperAction_engine_connection_didReceiveFolders___block_invoke;
  block[3] = &unk_264E5E938;
  block[4] = self;
  id v30 = v9;
  id v31 = v7;
  id v27 = v7;
  id v28 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__WFInstapaperAction_engine_connection_didReceiveFolders___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasFetchedFolders:1];
  v2 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  [v2 setObject:*(void *)(a1 + 40) forKey:@"WFInstapaperFolders"];

  id v3 = [*(id *)(a1 + 32) parameterForKey:@"WFInstapaperFolder"];
  [v3 reloadPossibleStates];

  if (![*(id *)(a1 + 48) numberOfConnections])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 336);
    *(void *)(v4 + 336) = 0;
  }
}

- (void)engine:(id)a3 didFailConnection:(id)a4 error:(id)a5
{
}

- (void)engine:(id)a3 didFinishConnection:(id)a4
{
  id v9 = a4;
  id v5 = [(WFInstapaperAction *)self identifiers];
  if ([v5 count])
  {
  }
  else
  {
    v6 = [(WFInstapaperAction *)self connectionTypes];
    id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "type"));
    int v8 = [v6 containsObject:v7];

    if (v8) {
      [(WFInstapaperAction *)self finishRunningWithError:0];
    }
  }
}

- (void)engine:(id)a3 willStartConnection:(id)a4
{
  id v11 = a4;
  id v5 = [(WFInstapaperAction *)self connectionTypes];
  v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "type"));
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    int v8 = [(WFInstapaperAction *)self identifiers];
    id v9 = [(WFInstapaperAction *)self engine];
    id v10 = [v9 identifierForConnection:v11];
    [v8 addObject:v10];
  }
}

- (void)runAsynchronouslyWithInput:(id)a3 selectedFolder:(id)a4
{
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:3 userInfo:0];
  [(WFInstapaperAction *)self finishRunningWithError:v5];
}

- (BOOL)includeSpecialFolders
{
  return 0;
}

- (NSArray)connectionTypes
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  if (a4 == 1)
  {
    id v5 = objc_msgSend(MEMORY[0x263F33718], "sharedContext", a3);
    v6 = [NSURL URLWithString:@"https://www.instapaper.com/premium"];
    int v7 = [(WFInstapaperAction *)self userInterface];
    [v5 openURL:v6 userInterface:v7 completionHandler:0];
  }
  return 1;
}

- (void)finishRunningWithError:(id)a3
{
  engine = self->_engine;
  self->_engine = 0;
  id v5 = a3;

  identifiers = self->_identifiers;
  self->_identifiers = 0;

  v7.receiver = self;
  v7.super_class = (Class)WFInstapaperAction;
  [(WFInstapaperAction *)&v7 finishRunningWithError:v5];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v10 = [(WFInstapaperAction *)self parameterValueForKey:@"WFInstapaperFolder" ofClass:objc_opt_class()];
  id v5 = [(WFInstapaperAction *)self folders];
  v6 = [v5 objectForKey:v10];
  objc_super v7 = +[IKFolder folderWithFolderID:](IKFolder, "folderWithFolderID:", [v6 integerValue]);

  int v8 = (NSMutableArray *)objc_opt_new();
  identifiers = self->_identifiers;
  self->_identifiers = v8;

  [(WFInstapaperAction *)self runAsynchronouslyWithInput:v4 selectedFolder:v7];
}

- (IKEngine)engine
{
  engine = self->_engine;
  if (!engine)
  {
    id v4 = [[IKEngine alloc] initWithDelegate:self];
    id v5 = self->_engine;
    self->_engine = v4;

    v6 = +[WFInstapaperAccessResource instapaperToken];
    [(IKEngine *)self->_engine setOAuthToken:v6];

    objc_super v7 = +[WFInstapaperAccessResource instapaperTokenSecret];
    [(IKEngine *)self->_engine setOAuthTokenSecret:v7];

    engine = self->_engine;
  }
  return engine;
}

- (id)folders
{
  v2 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  id v3 = [v2 objectForKey:@"WFInstapaperFolders"];

  return v3;
}

- (void)updateFolders
{
  if (![(WFInstapaperAction *)self hasFetchedFolders])
  {
    id v3 = [(WFInstapaperAction *)self resourceManager];
    int v4 = [v3 resourcesAvailable];

    if (v4)
    {
      id v6 = [(WFInstapaperAction *)self engine];
      id v5 = (id)[v6 foldersWithUserInfo:0];
    }
  }
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFInstapaperAction;
  [(WFInstapaperAction *)&v5 wasRemovedFromWorkflow:a3];
  int v4 = [(WFInstapaperAction *)self resourceManager];
  [v4 removeTarget:self selector:sel_updateFolders];
}

- (void)wasAddedToWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFInstapaperAction;
  [(WFInstapaperAction *)&v5 wasAddedToWorkflow:a3];
  [(WFInstapaperAction *)self updateFolders];
  int v4 = [(WFInstapaperAction *)self resourceManager];
  [v4 addTarget:self selector:sel_updateFolders];
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFInstapaperAction;
  [(WFInstapaperAction *)&v4 initializeParameters];
  id v3 = [(WFInstapaperAction *)self parameterForKey:@"WFInstapaperFolder"];
  [v3 setDataSource:self];
}

- (void)dealloc
{
  id v3 = [(WFInstapaperAction *)self engine];
  [v3 setDelegate:0];

  objc_super v4 = [(WFInstapaperAction *)self engine];
  [v4 cancelAllConnections];

  v5.receiver = self;
  v5.super_class = (Class)WFInstapaperAction;
  [(WFInstapaperAction *)&v5 dealloc];
}

@end