@interface GKReportProblemRemoteUIController
+ (id)controllerForProblemPlayer:(id)a3 completionHandler:(id)a4;
- (GKPlayer)problemPlayer;
- (GKReportProblemRemoteUIController)initWithProblemPlayer:(id)a3;
- (NSURL)url;
- (id)bagKey;
- (id)fallbackURL;
- (id)postBodyForInitialLoad;
- (int)preferredLayoutStyle;
- (void)setProblemPlayer:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation GKReportProblemRemoteUIController

+ (id)controllerForProblemPlayer:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"GKReportProblemRemoteUIController.m", 33, @"Invalid parameter not satisfying: %@", @"problemPlayer!=nil" object file lineNumber description];
  }
  v9 = [v7 internal];
  v10 = [v9 playerID];

  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"GKReportProblemRemoteUIController.m", 34, @"Invalid parameter not satisfying: %@", @"problemPlayer.internal.playerID!=nil" object file lineNumber description];

    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v8)
  {
LABEL_5:
    v15 = [[GKReportProblemRemoteUIController alloc] initWithProblemPlayer:v7];
    id v16 = v8;
    v11 = v15;
    gk_dispatch_as_group();
  }
LABEL_6:

  return 0;
}

void __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_2;
  v12 = &unk_1E5F63650;
  id v13 = *(id *)(a1 + 32);
  v4 = a2;
  gk_dispatch_group_do();
  v5 = dispatch_queue_create(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_3;
  block[3] = &unk_1E5F63E30;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  dispatch_group_notify(v4, v5, block);
}

void __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 bagKey];
  v4 = [MEMORY[0x1E4F63760] localPlayer];
  [v2 configureFromBagKey:v5 player:v4 withCompletionHandler:v3];
}

void __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) error];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_4;
    v6[3] = &unk_1E5F62F78;
    v4 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    [v4 loadInitialRemoteUIWithHandler:v6];
  }
}

uint64_t __82__GKReportProblemRemoteUIController_controllerForProblemPlayer_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

- (GKReportProblemRemoteUIController)initWithProblemPlayer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKReportProblemRemoteUIController;
  v6 = [(GKRemoteUIController *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_problemPlayer, a3);
    id v8 = v7;
  }

  return v7;
}

- (int)preferredLayoutStyle
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return v3 == 1;
}

- (id)fallbackURL
{
  v2 = GKGameCenterUIFrameworkBundle();
  uint64_t v3 = [v2 URLForResource:@"GameCenterMissingUI" withExtension:@"xml"];

  return v3;
}

- (id)bagKey
{
  return (id)*MEMORY[0x1E4F63468];
}

- (id)postBodyForInitialLoad
{
  v15.receiver = self;
  v15.super_class = (Class)GKReportProblemRemoteUIController;
  uint64_t v3 = [(GKRemoteUIController *)&v15 postBodyForInitialLoad];
  v4 = [(GKRemoteUIController *)self playerID];

  if (v4)
  {
    id v5 = [(GKRemoteUIController *)self playerID];
    [v3 setObject:v5 forKeyedSubscript:@"playerID"];
  }
  v6 = [(GKRemoteUIController *)self authToken];

  if (v6)
  {
    id v7 = [(GKRemoteUIController *)self authToken];
    [v3 setObject:v7 forKeyedSubscript:@"authToken"];
  }
  id v8 = [(GKReportProblemRemoteUIController *)self problemPlayer];
  uint64_t v9 = [v8 internal];
  objc_super v10 = [v9 playerID];

  if (v10)
  {
    v11 = [(GKReportProblemRemoteUIController *)self problemPlayer];
    v12 = [v11 internal];
    id v13 = [v12 playerID];
    [v3 setObject:v13 forKeyedSubscript:@"problemPlayerID"];
  }

  return v3;
}

- (GKPlayer)problemPlayer
{
  return self->_problemPlayer;
}

- (void)setProblemPlayer:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_problemPlayer, 0);
}

@end