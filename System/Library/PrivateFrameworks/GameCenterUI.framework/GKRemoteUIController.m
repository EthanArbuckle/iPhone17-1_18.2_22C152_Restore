@interface GKRemoteUIController
+ (id)remoteUIController;
- (BOOL)complete;
- (BOOL)isServerAuthenticated;
- (BOOL)isUserInteractionEnabled;
- (BOOL)loading;
- (BOOL)loadingInitialUI;
- (BOOL)objectModel:(id)a3 shouldShowModalHTMLViewWithURL:(id)a4;
- (BOOL)previousUseCustomBackButtonActionValue;
- (BOOL)shouldApplyGameCenterTheme;
- (Class)objectModel:(id)a3 customFooterClassForSection:(id)a4;
- (Class)objectModel:(id)a3 customHeaderClassForSection:(id)a4;
- (GKLocalPlayer)playerForRemoteUI;
- (GKRemoteUIController)init;
- (GKRemoteUIController)initWithObjectModel:(id)a3;
- (GKRemoteUIController)presentedRemoteUIController;
- (NSArray)staticViewControllers;
- (NSData)pushToken;
- (NSDictionary)authInfo;
- (NSError)error;
- (NSMutableArray)objectModels;
- (NSString)alias;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)authToken;
- (NSString)bagKey;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)playerID;
- (NSURL)fallbackURL;
- (NSURL)url;
- (RUILoader)loader;
- (UINavigationController)navigationController;
- (id)addThemeInfoToAttributes:(id)a3;
- (id)completionHandler;
- (id)loadHandler;
- (id)objectModel:(id)a3 tableFooterViewForAttributes:(id)a4 page:(id)a5;
- (id)objectModel:(id)a3 tableHeaderViewForAttributes:(id)a4 page:(id)a5;
- (id)postBodyForInitialLoad;
- (id)postbackDataForDictionary:(id)a3;
- (id)viewControllerForAlertPresentation;
- (id)viewControllers;
- (int)layoutStyle;
- (int)preferredLayoutStyle;
- (int64_t)indexOfVisiblePage;
- (void)configureFromBagKey:(id)a3 player:(id)a4 withCompletionHandler:(id)a5;
- (void)didLoadURL:(id)a3 data:(id)a4 error:(id)a5;
- (void)finishLoadingWithError:(id)a3;
- (void)fireCompletionHandler;
- (void)loadInitialRemoteUIForPlayer:(id)a3 handler:(id)a4;
- (void)loadInitialRemoteUIWithHandler:(id)a3;
- (void)loadURL:(id)a3 forPlayer:(id)a4 postBody:(id)a5;
- (void)loadURL:(id)a3 forPlayer:(id)a4 postData:(id)a5;
- (void)loadURL:(id)a3 postBody:(id)a4;
- (void)loadURL:(id)a3 postData:(id)a4;
- (void)loader:(id)a3 didFailWithError:(id)a4;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5;
- (void)objectModel:(id)a3 configureTableRow:(id)a4 page:(id)a5;
- (void)objectModel:(id)a3 configureTableSection:(id)a4 page:(id)a5;
- (void)objectModel:(id)a3 configureTableView:(id)a4 page:(id)a5;
- (void)objectModel:(id)a3 elementDidChange:(id)a4;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5;
- (void)objectModelPressedBack:(id)a3;
- (void)performAction:(unint64_t)a3 withObjectModel:(id)a4;
- (void)popObjectModelAnimated:(BOOL)a3;
- (void)presentInParentNavigationController:(id)a3 animated:(BOOL)a4;
- (void)presentObjectModel:(id)a3 animated:(BOOL)a4;
- (void)pushObjectModel:(id)a3 animated:(BOOL)a4;
- (void)replaceObjectModelAtIndex:(unint64_t)a3 withObjectObjectModel:(id)a4;
- (void)setAlias:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setAuthInfo:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setError:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setIsServerAuthenticated:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setLayoutStyle:(int)a3;
- (void)setLoadHandler:(id)a3;
- (void)setLoader:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLoadingInitialUI:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setObjectModels:(id)a3;
- (void)setPlayerForRemoteUI:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setPresentedRemoteUIController:(id)a3;
- (void)setPreviousUseCustomBackButtonActionValue:(BOOL)a3;
- (void)setPushToken:(id)a3;
- (void)setShouldApplyGameCenterTheme:(BOOL)a3;
- (void)setStaticViewControllers:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)takeValuesFromClientInfo:(id)a3 withCompletionHandler:(id)a4;
- (void)updateAccountAndMarkComplete:(BOOL)a3 completionHandler:(id)a4;
- (void)updatePostbackDictionary:(id)a3 withHandler:(id)a4;
@end

@implementation GKRemoteUIController

+ (id)remoteUIController
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (GKRemoteUIController)initWithObjectModel:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GKRemoteUIController;
  v5 = [(GKRemoteUIController *)&v25 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F63760] localPlayer];
    objc_storeStrong((id *)&v5->_playerForRemoteUI, v6);
    v7 = [v6 internal];
    uint64_t v8 = [v7 playerID];
    playerID = v5->_playerID;
    v5->_playerID = (NSString *)v8;

    uint64_t v10 = [v6 accountName];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objectModels = v5->_objectModels;
    v5->_objectModels = v12;

    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v14 = (void *)getRUILoaderClass_softClass;
    uint64_t v30 = getRUILoaderClass_softClass;
    if (!getRUILoaderClass_softClass)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __getRUILoaderClass_block_invoke;
      v26[3] = &unk_1E5F632D8;
      v26[4] = &v27;
      __getRUILoaderClass_block_invoke((uint64_t)v26);
      v14 = (void *)v28[3];
    }
    v15 = v14;
    _Block_object_dispose(&v27, 8);
    v16 = (RUILoader *)objc_alloc_init(v15);
    loader = v5->_loader;
    v5->_loader = v16;

    v5->_shouldApplyGameCenterTheme = 1;
    v5->_isServerAuthenticated = 1;
    v5->_layoutStyle = [(GKRemoteUIController *)v5 preferredLayoutStyle];
    v5->_previousUseCustomBackButtonActionValue = [MEMORY[0x1E4FB19D0] _useCustomBackButtonAction];
    [MEMORY[0x1E4FB19D0] _setUseCustomBackButtonAction:1];
    if (([MEMORY[0x1E4FB19D0] _useCustomBackButtonAction] & 1) == 0)
    {
      v18 = NSString;
      v19 = [NSString stringWithFormat:@"Must have custom back button action"];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/RemoteUI/GKRemoteUIController.m"];
      id v21 = [v20 lastPathComponent];
      v22 = [v18 stringWithFormat:@"%@ (useCustomBackButtonAction == YES)\n[%s (%s:%d)]", v19, "-[GKRemoteUIController initWithObjectModel:]", objc_msgSend(v21, "UTF8String"), 134];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v22 format];
    }
    [(RUILoader *)v5->_loader setDelegate:v5];
    if (v4) {
      [(GKRemoteUIController *)v5 pushObjectModel:v4 animated:0];
    }
    v23 = v5;
  }
  return v5;
}

- (GKRemoteUIController)init
{
  return [(GKRemoteUIController *)self initWithObjectModel:0];
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_appleID != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_appleID, a3);
    if (self->_appleID)
    {
      v6 = [MEMORY[0x1E4F637E8] shared];
      uint64_t v7 = [v6 environment];

      uint64_t v8 = [MEMORY[0x1E4F637D0] sharedController];
      v9 = [(GKLocalPlayer *)self->_playerForRemoteUI internal];
      uint64_t v10 = [v8 credentialForPlayer:v9 environment:v7];

      v11 = [v10 altDSID];
      altDSID = self->_altDSID;
      self->_altDSID = v11;
    }
    else
    {
      [(GKRemoteUIController *)self setAltDSID:0];
    }
    v5 = v13;
  }
}

- (void)updateAccountAndMarkComplete:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(void))a4;
  uint64_t v7 = (NSObject **)MEMORY[0x1E4F63860];
  uint64_t v8 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v9 = (id)GKOSLoggers();
    uint64_t v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v8;
    v11 = [(GKRemoteUIController *)self authToken];
    v12 = [(GKRemoteUIController *)self appleID];
    v13 = [(GKRemoteUIController *)self playerID];
    *(_DWORD *)buf = 138412802;
    v28 = v11;
    __int16 v29 = 2112;
    uint64_t v30 = v12;
    __int16 v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_1AF250000, v10, OS_LOG_TYPE_INFO, "Updating account with authToken = “%@”, appleID = “%@”, playerID = “%@”", buf, 0x20u);
  }
  v14 = [(GKRemoteUIController *)self authToken];
  if (![v14 length]) {
    goto LABEL_10;
  }
  v15 = [(GKRemoteUIController *)self appleID];
  if (![v15 length])
  {

LABEL_10:
    goto LABEL_11;
  }
  v16 = [(GKRemoteUIController *)self playerID];
  uint64_t v17 = [v16 length];

  if (!v17)
  {
LABEL_11:
    v6[2](v6);
    goto LABEL_12;
  }
  v18 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  v19 = [v18 accountServicePrivate];
  v20 = [(GKRemoteUIController *)self appleID];
  id v21 = [(GKRemoteUIController *)self playerID];
  v22 = [(GKRemoteUIController *)self authToken];
  v23 = [(GKRemoteUIController *)self alias];
  v24 = [(GKRemoteUIController *)self altDSID];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__GKRemoteUIController_updateAccountAndMarkComplete_completionHandler___block_invoke;
  v25[3] = &unk_1E5F65DA0;
  v26 = v6;
  [v19 accountCreated:v20 playerID:v21 authenticationToken:v22 alias:v23 altDSID:v24 finished:v4 handler:v25];

LABEL_12:
}

void __71__GKRemoteUIController_updateAccountAndMarkComplete_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    uint64_t v8 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __71__GKRemoteUIController_updateAccountAndMarkComplete_completionHandler___block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isUserInteractionEnabled
{
  id v2 = [(GKRemoteUIController *)self navigationController];
  v3 = [v2 view];
  char v4 = [v3 isUserInteractionEnabled];

  return v4;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKRemoteUIController *)self navigationController];
  char v4 = [v5 view];
  [v4 setUserInteractionEnabled:v3];
}

- (void)fireCompletionHandler
{
  if (![(GKRemoteUIController *)self complete])
  {
    [(GKRemoteUIController *)self setComplete:1];
    [(GKRemoteUIController *)self setUserInteractionEnabled:1];
    id v6 = self;
    BOOL v3 = [(GKRemoteUIController *)v6 completionHandler];

    if (v3)
    {
      char v4 = [(GKRemoteUIController *)v6 completionHandler];
      id v5 = [(GKRemoteUIController *)v6 error];
      ((void (**)(void, GKRemoteUIController *, void *))v4)[2](v4, v6, v5);
    }
    objc_msgSend(MEMORY[0x1E4FB19D0], "_setUseCustomBackButtonAction:", -[GKRemoteUIController previousUseCustomBackButtonActionValue](v6, "previousUseCustomBackButtonActionValue"));
    [(GKRemoteUIController *)v6 setCompletionHandler:0];
  }
}

- (void)presentInParentNavigationController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  id v7 = [(GKRemoteUIController *)self navigationController];

  if (v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"GKRemoteUIController.m" lineNumber:221 description:@"Can't call -presentInParentNavigationController: if the remote UI has already been presented"];
  }
  [(GKRemoteUIController *)self setNavigationController:v13];
  uint64_t v8 = [v13 viewControllers];
  id v9 = (void *)[v8 copy];
  [(GKRemoteUIController *)self setStaticViewControllers:v9];

  uint64_t v10 = [(GKRemoteUIController *)self objectModels];
  v11 = [v10 lastObject];

  if (v11) {
    [v11 presentInParentViewController:v13 animated:v4];
  }
}

- (id)addThemeInfoToAttributes:(id)a3
{
  BOOL v4 = (void *)[a3 mutableCopy];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GKRemoteUIController layoutStyle](self, "layoutStyle"));
  [v4 setObject:v5 forKeyedSubscript:@"GKLayoutStyle"];

  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[GKRemoteUIController shouldApplyGameCenterTheme](self, "shouldApplyGameCenterTheme"));
  [v4 setObject:v6 forKeyedSubscript:@"GKApplyTheme"];

  return v4;
}

- (void)configureFromBagKey:(id)a3 player:(id)a4 withCompletionHandler:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"GKRemoteUIController.m", 245, @"Invalid parameter not satisfying: %@", @"handler!=nil" object file lineNumber description];
  }
  v12 = [MEMORY[0x1E4F636C8] proxyForPlayer:v10];
  id v13 = [v12 utilityServicePrivate];
  v21[0] = v9;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__GKRemoteUIController_configureFromBagKey_player_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E5F65DC8;
  id v19 = v9;
  id v20 = v11;
  v18[4] = self;
  id v15 = v9;
  id v16 = v11;
  [v13 getCredentialInfoAndStoreBagValuesForKeys:v14 handler:v18];
}

void __73__GKRemoteUIController_configureFromBagKey_player_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (a7)
  {
    [*(id *)(a1 + 32) setError:a7];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CB10];
    v18 = [a6 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v19 = [v17 URLWithString:v18];
    [*(id *)(a1 + 32) setUrl:v19];

    id v20 = [*(id *)(a1 + 32) url];

    if (!v20)
    {
      id v21 = [*(id *)(a1 + 32) fallbackURL];
      [*(id *)(a1 + 32) setUrl:v21];
    }
    v22 = [*(id *)(a1 + 32) url];

    if (v22)
    {
      v23 = [*(id *)(a1 + 32) playerID];

      if (!v23) {
        [*(id *)(a1 + 32) setPlayerID:v13];
      }
      v24 = [*(id *)(a1 + 32) appleID];

      if (!v24) {
        [*(id *)(a1 + 32) setAppleID:v15];
      }
      [*(id *)(a1 + 32) setAuthToken:v14];
      [*(id *)(a1 + 32) setPushToken:v16];
    }
    else
    {
      objc_super v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v26 = GKGameCenterUIFrameworkBundle();
      uint64_t v27 = GKGetLocalizedStringFromTableInBundle();
      v31[0] = v27;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      __int16 v29 = [v25 errorWithDomain:@"GKRemoteUIErrorDomain" code:1 userInfo:v28];
      [*(id *)(a1 + 32) setError:v29];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)postbackDataForDictionary:(id)a3
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:100 options:0 error:0];
}

- (void)loadInitialRemoteUIWithHandler:(id)a3
{
  [(GKRemoteUIController *)self setLoadHandler:a3];
  [(GKRemoteUIController *)self setLoadingInitialUI:1];
  id v5 = [(GKRemoteUIController *)self postBodyForInitialLoad];
  BOOL v4 = [(GKRemoteUIController *)self url];
  [(GKRemoteUIController *)self loadURL:v4 postBody:v5];
}

- (void)loadInitialRemoteUIForPlayer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  [(GKRemoteUIController *)self setLoadHandler:a4];
  [(GKRemoteUIController *)self setLoadingInitialUI:1];
  id v8 = [(GKRemoteUIController *)self postBodyForInitialLoad];
  id v7 = [(GKRemoteUIController *)self url];
  [(GKRemoteUIController *)self loadURL:v7 forPlayer:v6 postBody:v8];
}

- (void)finishLoadingWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__GKRemoteUIController_finishLoadingWithError___block_invoke;
  v6[3] = &unk_1E5F63350;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __47__GKRemoteUIController_finishLoadingWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionEnabled:1];
  [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setLoading:0];
  [*(id *)(a1 + 32) setLoadingInitialUI:0];
  uint64_t v2 = [*(id *)(a1 + 32) loadHandler];
  id v3 = (id)v2;
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
  }
  else if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) fireCompletionHandler];
  }
  [*(id *)(a1 + 32) setLoadHandler:0];
}

- (void)loadURL:(id)a3 forPlayer:(id)a4 postBody:(id)a5
{
  id v9 = a3;
  id v8 = a4;
  if (a5)
  {
    a5 = [(GKRemoteUIController *)self postbackDataForDictionary:a5];
  }
  [(GKRemoteUIController *)self loadURL:v9 forPlayer:v8 postData:a5];
}

- (void)loadURL:(id)a3 postBody:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    a4 = [(GKRemoteUIController *)self postbackDataForDictionary:a4];
  }
  [(GKRemoteUIController *)self loadURL:v6 postData:a4];
}

- (void)didLoadURL:(id)a3 data:(id)a4 error:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = v10;
    v12 = [v10 userInfo];
    id v13 = (void *)[v12 mutableCopy];

    if (!v13)
    {
      id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

    if (!v15)
    {
      id v16 = GKGameCenterUIFrameworkBundle();
      uint64_t v17 = GKGetLocalizedStringFromTableInBundle();
      [v13 setObject:v17 forKeyedSubscript:v14];
    }
    v18 = (void *)MEMORY[0x1E4F28C58];
    id v19 = [v11 domain];
    id v20 = objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, objc_msgSend(v11, "code"), v13);

    [(GKRemoteUIController *)self finishLoadingWithError:v20];
  }
  else
  {
    if (v9)
    {
      id v21 = [(GKRemoteUIController *)self loader];
      [v21 loadXMLUIWithData:v9 baseURL:v8];

      goto LABEL_10;
    }
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v23 = GKGameCenterUIFrameworkBundle();
    v24 = GKGetLocalizedStringFromTableInBundle();
    v27[0] = v24;
    objc_super v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v11 = [v22 errorWithDomain:@"GKRemoteUIErrorDomain" code:2 userInfo:v25];

    [(GKRemoteUIController *)self finishLoadingWithError:v11];
  }

LABEL_10:
}

- (void)loadURL:(id)a3 postData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"GKRemoteUIController.m", 378, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }
  [(GKRemoteUIController *)self setLoading:1];
  if ([v7 isFileURL])
  {
    id v16 = 0;
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v7 options:1 error:&v16];
    id v10 = v16;
    [(GKRemoteUIController *)self didLoadURL:v7 data:v9 error:v10];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    v12 = [v11 utilityServicePrivate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__GKRemoteUIController_loadURL_postData___block_invoke;
    v14[3] = &unk_1E5F65DF0;
    v14[4] = self;
    id v15 = v7;
    [v12 loadDataForURL:v15 postBody:v8 completionHandler:v14];
  }
}

uint64_t __41__GKRemoteUIController_loadURL_postData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) didLoadURL:*(void *)(a1 + 40) data:a2 error:a3];
}

- (void)loadURL:(id)a3 forPlayer:(id)a4 postData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"GKRemoteUIController.m", 395, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }
  [(GKRemoteUIController *)self setLoading:1];
  if ([v9 isFileURL])
  {
    id v19 = 0;
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v9 options:1 error:&v19];
    id v13 = v19;
    [(GKRemoteUIController *)self didLoadURL:v9 data:v12 error:v13];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F636C8] proxyForPlayer:v10];
    id v15 = [v14 utilityServicePrivate];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__GKRemoteUIController_loadURL_forPlayer_postData___block_invoke;
    v17[3] = &unk_1E5F65DF0;
    v17[4] = self;
    id v18 = v9;
    [v15 loadDataForURL:v18 postBody:v11 completionHandler:v17];
  }
}

uint64_t __51__GKRemoteUIController_loadURL_forPlayer_postData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) didLoadURL:*(void *)(a1 + 40) data:a2 error:a3];
}

- (int)preferredLayoutStyle
{
  int v2 = [MEMORY[0x1E4F636F0] isPreferences];
  int v3 = [MEMORY[0x1E4F636F0] isGameCenter];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v2 | v3 ^ 1) {
    int v6 = 1;
  }
  else {
    int v6 = 2;
  }
  if (v5 == 1) {
    return v6;
  }
  else {
    return 0;
  }
}

- (NSURL)fallbackURL
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"GKRemoteUIController.m" lineNumber:427 description:@"Subclasses MUST implement fallbackURL"];

  return 0;
}

- (NSString)bagKey
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"GKRemoteUIController.m" lineNumber:433 description:@"Subclasses MUST implement bagKey"];

  return 0;
}

- (id)postBodyForInitialLoad
{
  return (id)[MEMORY[0x1E4F1CA60] dictionary];
}

- (void)updatePostbackDictionary:(id)a3 withHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)takeValuesFromClientInfo:(id)a3 withCompletionHandler:(id)a4
{
  id v56 = a3;
  id v7 = (void (**)(void))a4;
  if (!v7)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"GKRemoteUIController.m", 450, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];
  }
  v53 = [MEMORY[0x1E4F637E8] shared];
  uint64_t v8 = [v56 objectForKeyedSubscript:@"firstName"];
  uint64_t v9 = [v56 objectForKeyedSubscript:@"lastName"];
  uint64_t v10 = [v56 objectForKeyedSubscript:@"appleID"];
  uint64_t v11 = [v56 objectForKeyedSubscript:@"altDSID"];
  v12 = [v56 objectForKeyedSubscript:@"playerID"];
  id v13 = [v56 objectForKeyedSubscript:@"alias"];
  uint64_t v14 = [v56 objectForKeyedSubscript:@"authToken"];
  uint64_t v15 = [v56 objectForKeyedSubscript:@"shouldAllowNearbyMultiplayer"];
  v49 = [v56 objectForKeyedSubscript:@"isAuthenticated"];
  if ([v49 isEqualToString:@"false"]) {
    [(GKRemoteUIController *)self setIsServerAuthenticated:0];
  }
  v54 = (void *)v15;
  v55 = (void *)v11;
  v52 = (void *)v8;
  if (v8)
  {
    id v16 = [(GKRemoteUIController *)self firstName];
    char v17 = [v16 isEqualToString:v8];

    if ((v17 & 1) == 0)
    {
      [(GKRemoteUIController *)self setFirstName:v8];
      LODWORD(v8) = 1;
      if (!v9) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    LODWORD(v8) = 0;
  }
  if (!v9) {
    goto LABEL_13;
  }
LABEL_11:
  id v18 = [(GKRemoteUIController *)self lastName];
  char v19 = [v18 isEqualToString:v9];

  if ((v19 & 1) == 0)
  {
    [(GKRemoteUIController *)self setLastName:v9];
    LODWORD(v8) = 1;
  }
LABEL_13:
  if (v10)
  {
    id v20 = [(GKRemoteUIController *)self appleID];
    char v21 = [v20 isEqualToString:v10];

    if ((v21 & 1) == 0)
    {
      [(GKRemoteUIController *)self setAppleID:v10];
      LODWORD(v8) = 1;
    }
  }
  if (v55)
  {
    v22 = [(GKRemoteUIController *)self altDSID];
    char v23 = [v22 isEqualToString:v55];

    if ((v23 & 1) == 0)
    {
      [(GKRemoteUIController *)self setAltDSID:v55];
      LODWORD(v8) = 1;
    }
  }
  if (v12)
  {
    v24 = [(GKRemoteUIController *)self playerID];
    char v25 = [v24 isEqualToString:v12];

    if ((v25 & 1) == 0)
    {
      [(GKRemoteUIController *)self setPlayerID:v12];
      LODWORD(v8) = 1;
    }
  }
  if (v13)
  {
    uint64_t v26 = [(GKRemoteUIController *)self alias];
    char v27 = [v26 isEqualToString:v13];

    if ((v27 & 1) == 0)
    {
      [(GKRemoteUIController *)self setAlias:v13];
      LODWORD(v8) = 1;
    }
  }
  v50 = (void *)v10;
  v51 = (void *)v9;
  if (v14
    && ([(GKRemoteUIController *)self authToken],
        v28 = objc_claimAutoreleasedReturnValue(),
        char v29 = [v28 isEqualToString:v14],
        v28,
        (v29 & 1) == 0))
  {
    [(GKRemoteUIController *)self setAuthToken:v14];
    int v30 = 1;
    LODWORD(v8) = 1;
  }
  else
  {
    int v30 = 0;
  }
  if (v54)
  {
    objc_msgSend(v53, "setShouldAllowNearbyMultiplayer:", objc_msgSend(v54, "BOOLValue"));
    __int16 v31 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    v32 = [v31 utilityServicePrivate];
    [v32 refreshPreferences];
  }
  uint64_t v33 = [v56 objectForKeyedSubscript:@"authOkUrl"];

  if (v33)
  {
    v34 = [MEMORY[0x1E4F1CA60] dictionary];
    v35 = [v56 objectForKeyedSubscript:@"authTitle"];

    if (v35)
    {
      v36 = [v56 objectForKeyedSubscript:@"authTitle"];
      [v34 setObject:v36 forKeyedSubscript:@"authTitle"];
    }
    v37 = [v56 objectForKeyedSubscript:@"authOkUrl"];

    if (v37)
    {
      v38 = [v56 objectForKeyedSubscript:@"authOkUrl"];
      [v34 setObject:v38 forKeyedSubscript:@"authOkUrl"];
    }
    v39 = [v56 objectForKeyedSubscript:@"cancelUrl"];

    if (v39)
    {
      v40 = [v56 objectForKeyedSubscript:@"cancelUrl"];
      [v34 setObject:v40 forKeyedSubscript:@"cancelUrl"];
    }
    v41 = [v56 objectForKeyedSubscript:@"authUsername"];

    if (v41)
    {
      v42 = [v56 objectForKeyedSubscript:@"authUsername"];
      [v34 setObject:v42 forKeyedSubscript:@"authUsername"];
      v43 = [(GKRemoteUIController *)self appleID];

      if (!v43) {
        [(GKRemoteUIController *)self setAppleID:v42];
      }
    }
    v44 = [v56 objectForKeyedSubscript:@"altDSID"];

    if (v44)
    {
      v45 = [v56 objectForKeyedSubscript:@"altDSID"];
      [v34 setObject:v45 forKeyedSubscript:@"altDSID"];
    }
    v46 = [v56 objectForKeyedSubscript:@"authErrorMessage"];

    if (v46)
    {
      v47 = [v56 objectForKeyedSubscript:@"authErrorMessage"];
      [v34 setObject:v47 forKeyedSubscript:@"authErrorMessage"];
    }
    [(GKRemoteUIController *)self setAuthInfo:v34];
  }
  if ((v30 | v8) == 1) {
    [(GKRemoteUIController *)self updateAccountAndMarkComplete:0 completionHandler:v7];
  }
  else {
    v7[2](v7);
  }
}

- (id)viewControllers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(GKRemoteUIController *)self staticViewControllers];
  if (v4) {
    [v3 addObjectsFromArray:v4];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(GKRemoteUIController *)self objectModels];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) displayedPages];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (int64_t)indexOfVisiblePage
{
  id v4 = [(GKRemoteUIController *)self navigationController];

  if (!v4)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"GKRemoteUIController.m", 562, @"Not presented, so no pages can be visible" object file lineNumber description];
  }
  uint64_t v5 = [(GKRemoteUIController *)self objectModels];
  uint64_t v6 = [v5 lastObject];

  uint64_t v7 = [(GKRemoteUIController *)self navigationController];
  uint64_t v8 = [v7 topViewController];

  uint64_t v9 = [v6 displayedPages];
  int64_t v10 = [v9 count];
  while (v10-- >= 1)
  {
    long long v12 = [v9 objectAtIndexedSubscript:v10];

    if (v8 == v12) {
      goto LABEL_8;
    }
  }
  int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_8:

  return v10;
}

- (void)pushObjectModel:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  [v14 setDelegate:self];
  uint64_t v6 = [(GKRemoteUIController *)self objectModels];
  uint64_t v7 = [v6 firstObject];
  uint64_t v8 = [v7 defaultPages];
  uint64_t v9 = [v8 firstObject];

  int64_t v10 = GKGameCenterUIFrameworkBundle();
  uint64_t v11 = GKGetLocalizedStringFromTableInBundle();
  [v9 setBackButtonTitle:v11];

  long long v12 = [(GKRemoteUIController *)self objectModels];
  [v12 addObject:v14];

  long long v13 = [(GKRemoteUIController *)self navigationController];
  if (v13) {
    [v14 presentInParentViewController:v13 animated:v4];
  }
}

- (void)popObjectModelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = [(GKRemoteUIController *)self navigationController];

  if (!v6)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"GKRemoteUIController.m" lineNumber:596 description:@"Must be presented before popping an object model"];
  }
  id v13 = [(GKRemoteUIController *)self objectModels];
  uint64_t v7 = [v13 lastObject];
  uint64_t v8 = [(GKRemoteUIController *)self navigationController];
  int64_t v9 = [(GKRemoteUIController *)self indexOfVisiblePage];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v3;
    }
    id v11 = (id)[v8 popViewControllerAnimated:v10];
  }
  [v7 setDelegate:0];
  [v13 removeLastObject];
  if (![v13 count]) {
    [(GKRemoteUIController *)self fireCompletionHandler];
  }
}

- (void)replaceObjectModelAtIndex:(unint64_t)a3 withObjectObjectModel:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(GKRemoteUIController *)self navigationController];

  if (!v8)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"GKRemoteUIController.m" lineNumber:617 description:@"Should be presented before replacing an object model"];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__GKRemoteUIController_replaceObjectModelAtIndex_withObjectObjectModel___block_invoke;
  v11[3] = &unk_1E5F65E18;
  unint64_t v13 = a3;
  SEL v14 = a2;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  [v9 presentWithBlock:v11];
}

void __72__GKRemoteUIController_replaceObjectModelAtIndex_withObjectObjectModel___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) objectModels];
  unint64_t v3 = *(void *)(a1 + 48);
  id v7 = v2;
  if (v3 >= [v2 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"GKRemoteUIController.m" lineNumber:622 description:@"Index out of range of object models"];
  }
  [v7 replaceObjectAtIndex:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
  BOOL v4 = [*(id *)(a1 + 32) viewControllers];
  uint64_t v5 = [*(id *)(a1 + 32) navigationController];
  [v5 _gkSetViewControllers:v4 transition:*MEMORY[0x1E4F3A5B8]];
}

- (void)presentObjectModel:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = [(GKRemoteUIController *)self navigationController];

  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"GKRemoteUIController.m" lineNumber:634 description:@"Can't present a modal object model until the original object model is presented"];
  }
  id v9 = [(GKRemoteUIController *)self presentedRemoteUIController];

  if (v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"GKRemoteUIController.m" lineNumber:635 description:@"Already presenting a modal remote UI controller"];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4FB19E8]);
  id v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 1) {
    [v10 setModalPresentationStyle:16];
  }
  unint64_t v13 = [(GKRemoteUIController *)self navigationController];
  SEL v14 = [[GKRemoteUIController alloc] initWithObjectModel:v7];

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __52__GKRemoteUIController_presentObjectModel_animated___block_invoke;
  char v21 = &unk_1E5F63C38;
  id v22 = v13;
  char v23 = self;
  id v15 = v13;
  [(GKRemoteUIController *)v14 setCompletionHandler:&v18];
  -[GKRemoteUIController presentInParentNavigationController:animated:](v14, "presentInParentNavigationController:animated:", v10, v4, v18, v19, v20, v21);
  [(GKRemoteUIController *)self setPresentedRemoteUIController:v14];
  [v15 presentViewController:v10 animated:1 completion:0];
}

void __52__GKRemoteUIController_presentObjectModel_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  [*(id *)(a1 + 40) setPresentedRemoteUIController:0];
  BOOL v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 40) setError:v5];
    [*(id *)(a1 + 40) fireCompletionHandler];
    BOOL v4 = v5;
  }
}

- (void)loader:(id)a3 didFailWithError:(id)a4
{
}

- (void)performAction:(unint64_t)a3 withObjectModel:(id)a4
{
  id v16 = a4;
  id v7 = [(GKRemoteUIController *)self objectModels];
  if ([v7 count]) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = a3 - 3 >= 2;
  }
  if (v8) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = 2;
  }
  switch(v9)
  {
    case 1uLL:
      [(GKRemoteUIController *)self fireCompletionHandler];
      break;
    case 2uLL:
      [(GKRemoteUIController *)self pushObjectModel:v16 animated:1];
      break;
    case 3uLL:
      -[GKRemoteUIController replaceObjectModelAtIndex:withObjectObjectModel:](self, "replaceObjectModelAtIndex:withObjectObjectModel:", [v7 count] - 1, v16);
      break;
    case 4uLL:
      id v11 = [v16 defaultPages];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        unint64_t v13 = [v7 count];
        if (v13 <= 1)
        {
          unint64_t v14 = v13;
          id v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2 object:self file:@"GKRemoteUIController.m" lineNumber:689 description:@"Pop + replace requires at least 2 existing object models"];

          unint64_t v13 = v14;
        }
        [(GKRemoteUIController *)self replaceObjectModelAtIndex:v13 - 2 withObjectObjectModel:v16];
      }
      [(GKRemoteUIController *)self popObjectModelAnimated:1];
      break;
    case 5uLL:
      [(GKRemoteUIController *)self presentObjectModel:v16 animated:1];
      break;
    default:
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GKRemoteUIController.m", 709, @"Unhandled action signal type: %d", v9);

      break;
  }
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  id v7 = a4;
  [v7 setDelegate:self];
  BOOL v8 = [v7 clientInfo];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__GKRemoteUIController_loader_receivedObjectModel_actionSignal___block_invoke;
  v10[3] = &unk_1E5F63CA8;
  id v11 = v7;
  unint64_t v12 = a5;
  v10[4] = self;
  id v9 = v7;
  [(GKRemoteUIController *)self takeValuesFromClientInfo:v8 withCompletionHandler:v10];
}

void __64__GKRemoteUIController_loader_receivedObjectModel_actionSignal___block_invoke(uint64_t a1)
{
  int v2 = *(id **)(a1 + 32);
  if (!v2[13])
  {
LABEL_6:
    if ([v2 loadingInitialUI] && *(void *)(a1 + 48) == 1)
    {
      uint64_t v18 = *(void **)(a1 + 32);
      id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"GKRemoteUIErrorDomain" code:0 userInfo:0];
      [v18 finishLoadingWithError:v26];
    }
    else
    {
      [*(id *)(a1 + 32) finishLoadingWithError:0];
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      char v21 = *(void **)(a1 + 32);
      [v21 performAction:v19 withObjectModel:v20];
    }
    return;
  }
  unint64_t v3 = [*(id *)(a1 + 32) navigationController];

  int v2 = *(id **)(a1 + 32);
  if (v3)
  {
    if (v2[13])
    {
      BOOL v4 = [*(id *)(a1 + 32) navigationController];

      int v2 = *(id **)(a1 + 32);
      if (v4)
      {
        id v5 = (void *)[v2[13] copy];
        [*(id *)(a1 + 32) setAuthInfo:0];
        uint64_t v6 = [v5 objectForKeyedSubscript:@"authUsername"];
        id v7 = (void *)MEMORY[0x1E4F1CB10];
        BOOL v8 = [v5 objectForKeyedSubscript:@"authOkUrl"];
        id v9 = [v7 URLWithString:v8];

        id v10 = (void *)MEMORY[0x1E4F1CB10];
        id v11 = [v5 objectForKeyedSubscript:@"cancelUrl"];
        unint64_t v12 = [v10 URLWithString:v11];

        unint64_t v13 = (void *)MEMORY[0x1E4F639D0];
        unint64_t v14 = [*(id *)(a1 + 32) navigationController];
        id v15 = [v13 authenticatorForPlayerWithUsername:v6 password:0 withPresentingViewController:v14];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        void v27[2] = __64__GKRemoteUIController_loader_receivedObjectModel_actionSignal___block_invoke_2;
        v27[3] = &unk_1E5F65E40;
        v27[4] = *(void *)(a1 + 32);
        id v28 = v9;
        id v29 = v12;
        id v16 = v12;
        id v17 = v9;
        [v15 authenticateUsingAuthUIAllowingAppleIDCreation:0 usernameEditable:0 dismissHandler:0 completionHandler:v27];

        return;
      }
    }
    goto LABEL_6;
  }
  id v22 = (void *)MEMORY[0x1E4F28C58];
  char v23 = (void *)[v2[13] copy];
  v24 = [v22 errorWithDomain:@"GKRemoteUIErrorDomain" code:3 userInfo:v23];
  [v2 finishLoadingWithError:v24];

  char v25 = *(void **)(a1 + 32);

  [v25 setAuthInfo:0];
}

void __64__GKRemoteUIController_loader_receivedObjectModel_actionSignal___block_invoke_2(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v9 = (void *)a1[4];
  if (a2 && a3 && !a7)
  {
    uint64_t v10 = a1[5];
    if (a4) {
      id v11 = a4;
    }
    else {
      id v11 = a2;
    }
    v18[0] = @"authUsername";
    v18[1] = @"authPassword";
    v19[0] = v11;
    v19[1] = a3;
    unint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    id v13 = a4;
    id v14 = a3;
    id v15 = a2;
    id v16 = [v12 dictionaryWithObjects:v19 forKeys:v18 count:2];
    [v9 loadURL:v10 postBody:v16];
  }
  else
  {
    uint64_t v17 = a1[6];
    id v14 = a4;
    id v15 = a3;
    id v16 = a2;
    [v9 loadURL:v17 postBody:0];
  }
}

- (id)viewControllerForAlertPresentation
{
  int v2 = [(GKRemoteUIController *)self navigationController];
  unint64_t v3 = [v2 topViewController];

  return v3;
}

- (void)objectModelPressedBack:(id)a3
{
  BOOL v4 = [(GKRemoteUIController *)self objectModels];
  id v5 = [v4 lastObject];

  if (([v5 goBack] & 1) == 0) {
    [(GKRemoteUIController *)self popObjectModelAnimated:1];
  }
}

- (void)objectModel:(id)a3 elementDidChange:(id)a4
{
  id v5 = objc_msgSend(a4, "name", a3);
  int v6 = [v5 isEqualToString:@"Dismiss"];

  if (v6)
  {
    [(GKRemoteUIController *)self fireCompletionHandler];
  }
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(GKRemoteUIController *)self setUserInteractionEnabled:0];
  id v11 = [v10 lowercaseString];

  LOBYTE(v10) = [v11 isEqualToString:@"post"];
  if (v10)
  {
    unint64_t v12 = [v8 postbackDictionary];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__GKRemoteUIController_objectModel_pressedLink_httpMethod___block_invoke;
    v14[3] = &unk_1E5F63E80;
    v14[4] = self;
    id v15 = v12;
    id v16 = v9;
    id v13 = v12;
    [(GKRemoteUIController *)self updatePostbackDictionary:v13 withHandler:v14];
  }
  else
  {
    id v13 = [(GKRemoteUIController *)self playerForRemoteUI];
    [(GKRemoteUIController *)self loadURL:v9 forPlayer:v13 postBody:0];
  }
}

void __59__GKRemoteUIController_objectModel_pressedLink_httpMethod___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) postbackDataForDictionary:*(void *)(a1 + 40)];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  BOOL v4 = [v2 playerForRemoteUI];
  [v2 loadURL:v3 forPlayer:v4 postData:v5];
}

- (BOOL)objectModel:(id)a3 shouldShowModalHTMLViewWithURL:(id)a4
{
  return 1;
}

- (void)objectModel:(id)a3 configureTableView:(id)a4 page:(id)a5
{
  id v11 = a5;
  id v7 = [a4 tableView];
  [v7 _setTopPadding:0.0];
  [v7 _setBottomPadding:0.0];
  if ([(GKRemoteUIController *)self shouldApplyGameCenterTheme])
  {
    [v7 setSectionFooterHeight:0.0];
    int v8 = [(GKRemoteUIController *)self layoutStyle];
    double v9 = 60.0;
    if (v8 == 2) {
      double v9 = 72.0;
    }
    [v7 setRowHeight:v9];
    int v10 = [(GKRemoteUIController *)self layoutStyle];
    if (v10 <= 2) {
      [v11 setCustomMargin:dbl_1AF7CAF70[v10]];
    }
  }
}

- (void)objectModel:(id)a3 configureTableSection:(id)a4 page:(id)a5
{
  id v9 = a4;
  int v6 = [v9 footerView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setDelegate:self];
  }
  id v7 = [v9 attributes];
  int v8 = [v7 objectForKeyedSubscript:@"drawTopSeparator"];

  if (v8) {
    objc_msgSend(v9, "setDrawTopSeparator:", objc_msgSend(v8, "BOOLValue"));
  }
}

- (void)objectModel:(id)a3 configureTableRow:(id)a4 page:(id)a5
{
  id v50 = a4;
  BOOL v6 = [(GKRemoteUIController *)self shouldApplyGameCenterTheme];
  id v7 = v50;
  if (v6)
  {
    int v8 = [v50 tableCell];
    if ([(GKRemoteUIController *)self layoutStyle] == 2)
    {
      double v9 = 134.0;
    }
    else
    {
      [(GKRemoteUIController *)self layoutStyle];
      double v9 = 88.0;
    }
    [v8 setTextFieldOffset:v9];
    int v10 = [v50 attributes];
    id v11 = (void *)[v10 mutableCopy];

    [v11 removeObjectForKey:@"height"];
    [v50 setAttributes:v11];
    unint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    id v14 = (Class *)0x1E4F63A08;
    if (v13 == 1 && (*MEMORY[0x1E4F63A38] || *MEMORY[0x1E4F63830] == 0)) {
      id v14 = (Class *)0x1E4F63A00;
    }
    id v49 = objc_alloc_init(*v14);
    id v16 = [MEMORY[0x1E4F639F8] textStyle];
    uint64_t v17 = [v8 editableTextField];
    uint64_t v18 = [v11 objectForKeyedSubscript:@"editFieldStyle"];
    uint64_t v19 = objc_msgSend(v16, "styleWithName:fallback:layoutMode:", v18, @"remoteUIEditField", -[GKRemoteUIController layoutStyle](self, "layoutStyle"));

    v45 = v19;
    if (v17)
    {
      if (![(GKRemoteUIController *)self layoutStyle]) {
        [v50 setHeight:50.0];
      }
      if (v19)
      {
        uint64_t v20 = [v19 replayOnBaseStyle:v49 systemContentSizeDidChange:0];
        [v20 applyToEditField:v17];
      }
      char v21 = @"remoteUIEditLabel";
    }
    else
    {
      char v21 = @"remoteUILabel";
    }
    id v22 = [v8 textLabel];
    char v23 = [v11 objectForKeyedSubscript:@"class"];
    int v24 = [v23 isEqualToString:@"selectPage"];

    if (v24) {
      char v25 = @"remoteUISelectLabel";
    }
    else {
      char v25 = v21;
    }
    id v26 = [v11 objectForKeyedSubscript:@"labelStyle"];
    char v27 = objc_msgSend(v16, "styleWithName:fallback:layoutMode:", v26, v25, -[GKRemoteUIController layoutStyle](self, "layoutStyle"));

    v48 = v27;
    if (v27)
    {
      id v28 = [v22 text];

      if (v28)
      {
        id v29 = [v27 replayOnBaseStyle:v49 systemContentSizeDidChange:0];
        id v30 = objc_alloc(MEMORY[0x1E4F28B18]);
        [v22 text];
        v46 = v17;
        v32 = __int16 v31 = v8;
        uint64_t v33 = [v29 attributes];
        v34 = (void *)[v30 initWithString:v32 attributes:v33];

        int v8 = v31;
        uint64_t v17 = v46;
        [v22 setAttributedText:v34];
      }
    }
    v47 = v8;
    v35 = [v8 detailTextLabel];
    if (v24) {
      v36 = @"remoteUISelectField";
    }
    else {
      v36 = @"remoteUIDetailLabel";
    }
    v37 = [v11 objectForKeyedSubscript:@"detailLabelStyle"];
    v38 = objc_msgSend(v16, "styleWithName:fallback:layoutMode:", v37, v36, -[GKRemoteUIController layoutStyle](self, "layoutStyle"));

    if (v38)
    {
      v39 = [v35 text];

      if (v39)
      {
        v40 = [v38 replayOnBaseStyle:v49 systemContentSizeDidChange:0];
        id v41 = objc_alloc(MEMORY[0x1E4F28B18]);
        v42 = [v35 text];
        v43 = [v40 attributes];
        v44 = (void *)[v41 initWithString:v42 attributes:v43];

        [v35 setAttributedText:v44];
      }
    }

    id v7 = v50;
  }

  MEMORY[0x1F41817F8](v6, v7);
}

- (Class)objectModel:(id)a3 customHeaderClassForSection:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 attributes];
  id v7 = [v6 objectForKeyedSubscript:@"header"];
  if (v7)
  {
    int v8 = [(GKRemoteUIController *)self addThemeInfoToAttributes:v6];
    [v5 setAttributes:v8];

    double v9 = objc_opt_class();
  }
  else
  {
    double v9 = 0;
  }

  return (Class)v9;
}

- (Class)objectModel:(id)a3 customFooterClassForSection:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 attributes];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"footer"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"button"];
  if (v7 | v8)
  {
    double v9 = [(GKRemoteUIController *)self addThemeInfoToAttributes:v6];
    [v5 setAttributes:v9];

    int v10 = objc_opt_class();
  }
  else
  {
    int v10 = 0;
  }

  return (Class)v10;
}

- (id)objectModel:(id)a3 tableHeaderViewForAttributes:(id)a4 page:(id)a5
{
  BOOL v6 = [(GKRemoteUIController *)self addThemeInfoToAttributes:a4];
  uint64_t v7 = [[GKRemoteUITableHeaderView alloc] initWithAttributes:v6];
  [(GKRemoteUITableHeaderView *)v7 setDelegate:self];

  return v7;
}

- (id)objectModel:(id)a3 tableFooterViewForAttributes:(id)a4 page:(id)a5
{
  BOOL v6 = [(GKRemoteUIController *)self addThemeInfoToAttributes:a4];
  uint64_t v7 = [[GKRemoteUITableFooterView alloc] initWithAttributes:v6];
  [(GKRemoteUITableFooterView *)v7 setDelegate:self];

  return v7;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)shouldApplyGameCenterTheme
{
  return self->_shouldApplyGameCenterTheme;
}

- (void)setShouldApplyGameCenterTheme:(BOOL)a3
{
  self->_shouldApplyGameCenterTheme = a3;
}

- (NSMutableArray)objectModels
{
  return self->_objectModels;
}

- (void)setObjectModels:(id)a3
{
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (NSArray)staticViewControllers
{
  return self->_staticViewControllers;
}

- (void)setStaticViewControllers:(id)a3
{
}

- (RUILoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
}

- (GKRemoteUIController)presentedRemoteUIController
{
  return self->_presentedRemoteUIController;
}

- (void)setPresentedRemoteUIController:(id)a3
{
}

- (BOOL)previousUseCustomBackButtonActionValue
{
  return self->_previousUseCustomBackButtonActionValue;
}

- (void)setPreviousUseCustomBackButtonActionValue:(BOOL)a3
{
  self->_previousUseCustomBackButtonActionValue = a3;
}

- (BOOL)loadingInitialUI
{
  return self->_loadingInitialUI;
}

- (void)setLoadingInitialUI:(BOOL)a3
{
  self->_loadingInitialUI = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (id)loadHandler
{
  return self->_loadHandler;
}

- (void)setLoadHandler:(id)a3
{
}

- (int)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int)a3
{
  self->_layoutStyle = a3;
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (NSDictionary)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(id)a3
{
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
}

- (BOOL)isServerAuthenticated
{
  return self->_isServerAuthenticated;
}

- (void)setIsServerAuthenticated:(BOOL)a3
{
  self->_isServerAuthenticated = a3;
}

- (GKLocalPlayer)playerForRemoteUI
{
  return self->_playerForRemoteUI;
}

- (void)setPlayerForRemoteUI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerForRemoteUI, 0);
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_authInfo, 0);
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_presentedRemoteUIController, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_staticViewControllers, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_appleID, 0);
}

void __71__GKRemoteUIController_updateAccountAndMarkComplete_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "couldn't create account due to error = %@", (uint8_t *)&v2, 0xCu);
}

@end