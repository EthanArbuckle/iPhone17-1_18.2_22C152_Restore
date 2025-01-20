@interface GKAccountRemoteUIController
+ (void)accountRemoteUIControllerForPlayer:(id)a3 mode:(int64_t)a4 completionHandler:(id)a5;
+ (void)accountRemoteUIControllerForPlayer:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6 completionHandler:(id)a7;
- (BOOL)authenticatePlayerOnCompletion;
- (GKAccountRemoteUIController)initWithMode:(int64_t)a3;
- (GKAccountRemoteUIController)initWithMode:(int64_t)a3 player:(id)a4;
- (NSArray)availableExternalServices;
- (NSDictionary)postBody;
- (NSURL)url;
- (id)bagKey;
- (id)fallbackURL;
- (id)postBodyForInitialLoad;
- (int64_t)mode;
- (void)fireCompletionHandler;
- (void)setAuthenticatePlayerOnCompletion:(BOOL)a3;
- (void)setAvailableExternalServices:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setPostBody:(id)a3;
- (void)setUrl:(id)a3;
- (void)takeValuesFromClientInfo:(id)a3 withCompletionHandler:(id)a4;
- (void)updatePostbackDictionary:(id)a3 withHandler:(id)a4;
@end

@implementation GKAccountRemoteUIController

+ (void)accountRemoteUIControllerForPlayer:(id)a3 mode:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  [(id)objc_opt_class() accountRemoteUIControllerForPlayer:v8 mode:a4 url:0 postBody:0 completionHandler:v7];
}

+ (void)accountRemoteUIControllerForPlayer:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (v14)
  {
    v15 = [MEMORY[0x1E4F63760] localPlayer];
    [v15 setInsideAuthenticatorInvocation:1];

    v16 = (void *)MEMORY[0x1E4F636D8];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKAccountRemoteUIController.m", 45, "+[GKAccountRemoteUIController accountRemoteUIControllerForPlayer:mode:url:postBody:completionHandler:]");
    v18 = [v16 dispatchGroupWithName:v17];

    v19 = [[GKAccountRemoteUIController alloc] initWithMode:a4 player:v11];
    v20 = v19;
    if (v12)
    {
      [(GKAccountRemoteUIController *)v19 setUrl:v12];
      if (v13) {
        [(GKAccountRemoteUIController *)v20 setPostBody:v13];
      }
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke;
      v26[3] = &unk_1E5F62F28;
      v27 = v19;
      id v28 = v11;
      [v18 perform:v26];
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_2;
    v22[3] = &unk_1E5F62F50;
    v23 = v20;
    id v25 = v14;
    id v24 = v11;
    v21 = v20;
    [v18 notifyOnMainQueueWithBlock:v22];
  }
}

void __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 bagKey];
  [v3 configureFromBagKey:v5 player:*(void *)(a1 + 40) withCompletionHandler:v4];
}

void __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) error];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v6);
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_3;
    v7[3] = &unk_1E5F62F78;
    id v9 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 32);
    [v4 loadInitialRemoteUIForPlayer:v5 handler:v7];
  }
}

void __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_4;
  block[3] = &unk_1E5F62F50;
  id v6 = v3;
  id v8 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __102__GKAccountRemoteUIController_accountRemoteUIControllerForPlayer_mode_url_postBody_completionHandler___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, a1[5]);
  }
}

- (GKAccountRemoteUIController)initWithMode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKAccountRemoteUIController;
  id v4 = [(GKRemoteUIController *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    id v6 = v4;
  }

  return v5;
}

- (GKAccountRemoteUIController)initWithMode:(int64_t)a3 player:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKAccountRemoteUIController;
  id v7 = [(GKRemoteUIController *)&v11 init];
  objc_super v8 = v7;
  if (v7)
  {
    [(GKRemoteUIController *)v7 setPlayerForRemoteUI:v6];
    v8->_mode = a3;
    id v9 = v8;
  }

  return v8;
}

- (void)fireCompletionHandler
{
  uint64_t v3 = [(GKRemoteUIController *)self error];
  if (v3 || ![(GKAccountRemoteUIController *)self authenticatePlayerOnCompletion])
  {
  }
  else if ([(GKAccountRemoteUIController *)self mode] != 3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__GKAccountRemoteUIController_fireCompletionHandler__block_invoke;
    v4[3] = &unk_1E5F62EB0;
    v4[4] = self;
    [(GKRemoteUIController *)self updateAccountAndMarkComplete:1 completionHandler:v4];
    return;
  }
  v5.receiver = self;
  v5.super_class = (Class)GKAccountRemoteUIController;
  [(GKRemoteUIController *)&v5 fireCompletionHandler];
}

void __52__GKAccountRemoteUIController_fireCompletionHandler__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F63760] localPlayer];
  [v2 setInsideAuthenticatorInvocation:0];
  if ([*(id *)(a1 + 32) mode] == 1 && objc_msgSend(v2, "isPurpleBuddyAccount")) {
    [v2 setNewToGameCenter:1];
  }
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)GKAccountRemoteUIController;
  objc_msgSendSuper2(&v3, sel_fireCompletionHandler);
}

- (id)fallbackURL
{
  if ([(GKAccountRemoteUIController *)self mode] == 3)
  {
    uint64_t v2 = 0;
  }
  else
  {
    objc_super v3 = GKGameCenterUIFrameworkBundle();
    uint64_t v2 = [v3 URLForResource:@"GameCenterMissingUI" withExtension:@"xml"];
  }

  return v2;
}

- (id)bagKey
{
  uint64_t v2 = [(GKAccountRemoteUIController *)self mode];
  if ((unint64_t)(v2 - 1) <= 2) {
    uint64_t v2 = (char *)**((id **)&unk_1E5F62F98 + (void)(v2 - 1));
  }

  return v2;
}

- (id)postBodyForInitialLoad
{
  v16.receiver = self;
  v16.super_class = (Class)GKAccountRemoteUIController;
  objc_super v3 = [(GKRemoteUIController *)&v16 postBodyForInitialLoad];
  id v4 = [(GKRemoteUIController *)self authToken];

  if (v4)
  {
    objc_super v5 = [(GKRemoteUIController *)self authToken];
    [v3 setObject:v5 forKeyedSubscript:@"authToken"];
  }
  id v6 = [(GKRemoteUIController *)self pushToken];

  if (v6)
  {
    id v7 = [(GKRemoteUIController *)self pushToken];
    [v3 setObject:v7 forKeyedSubscript:@"pushToken"];
  }
  objc_super v8 = [(GKRemoteUIController *)self appleID];

  if (v8)
  {
    id v9 = [(GKRemoteUIController *)self altDSID];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"appleID"];
    }
    else
    {
      v10 = [(GKRemoteUIController *)self appleID];
      [v3 setObject:v10 forKeyedSubscript:@"appleID"];
    }
  }
  objc_super v11 = [(GKRemoteUIController *)self playerID];

  if (v11)
  {
    id v12 = [(GKRemoteUIController *)self playerID];
    [v3 setObject:v12 forKeyedSubscript:@"playerID"];
  }
  id v13 = [(GKAccountRemoteUIController *)self availableExternalServices];

  if (v13)
  {
    id v14 = [(GKAccountRemoteUIController *)self availableExternalServices];
    [v3 setObject:v14 forKeyedSubscript:@"availableExternalServices"];
  }
  if (self->_postBody) {
    objc_msgSend(v3, "addEntriesFromDictionary:");
  }

  return v3;
}

- (void)takeValuesFromClientInfo:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 objectForKeyedSubscript:@"finished"];
  id v9 = [v6 objectForKeyedSubscript:@"isAuthenticated"];
  v10 = v9;
  if (v9) {
    -[GKAccountRemoteUIController setAuthenticatePlayerOnCompletion:](self, "setAuthenticatePlayerOnCompletion:", [v9 BOOLValue]);
  }
  if (v8) {
    -[GKAccountRemoteUIController setAuthenticatePlayerOnCompletion:](self, "setAuthenticatePlayerOnCompletion:", [v8 BOOLValue]);
  }
  if ([(GKAccountRemoteUIController *)self mode] == 1)
  {
    objc_super v11 = [v6 objectForKeyedSubscript:@"alias"];

    if (!v11) {
      [(GKAccountRemoteUIController *)self setAuthenticatePlayerOnCompletion:0];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)GKAccountRemoteUIController;
  [(GKRemoteUIController *)&v12 takeValuesFromClientInfo:v6 withCompletionHandler:v7];
}

- (void)updatePostbackDictionary:(id)a3 withHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSArray)availableExternalServices
{
  return self->_availableExternalServices;
}

- (void)setAvailableExternalServices:(id)a3
{
}

- (BOOL)authenticatePlayerOnCompletion
{
  return self->_authenticatePlayerOnCompletion;
}

- (void)setAuthenticatePlayerOnCompletion:(BOOL)a3
{
  self->_authenticatePlayerOnCompletion = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSDictionary)postBody
{
  return self->_postBody;
}

- (void)setPostBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postBody, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_availableExternalServices, 0);
}

@end