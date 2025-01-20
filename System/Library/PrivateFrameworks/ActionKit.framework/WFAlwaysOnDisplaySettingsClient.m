@interface WFAlwaysOnDisplaySettingsClient
+ (BOOL)canRunIntent;
+ (id)alwaysOnPublisher;
+ (id)filteredPublisherForAlwaysOnPublisher:(id)a3;
+ (id)reversalArbiter;
+ (id)reverseAlwaysOnPublisher;
+ (void)createClientWithCompletionHandler:(id)a3;
+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3;
+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4;
- (BOOL)alwaysOnDisplayState;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFAlwaysOnDisplaySettingsClient

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, void))a4;
  if (+[WFAlwaysOnDisplaySettingsClient canRunIntent])
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.springboard"];
    [v6 setBool:v4 forKey:@"SBEnableAlwaysOn"];
    v7 = getWFBundledIntentsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFAlwaysOnDisplaySettingsClient setState:completionHandler:]";
      __int16 v11 = 1024;
      BOOL v12 = v4;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_DEFAULT, "%s Shortcuts action set Always On enabled to: %i", buf, 0x12u);
    }

    v5[2](v5, 0);
  }
  else
  {
    WFSettingsClientError();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, void)))v5[2])(v5);
  }
}

- (void)getStateWithCompletionHandler:(id)a3
{
  v6 = (void (**)(id, BOOL, void))a3;
  if (+[WFAlwaysOnDisplaySettingsClient canRunIntent])
  {
    v6[2](v6, [(WFAlwaysOnDisplaySettingsClient *)self alwaysOnDisplayState], 0);
    BOOL v4 = v6;
  }
  else
  {
    uint64_t v5 = WFSettingsClientError();
    v6[2](v6, 0, v5);

    BOOL v4 = (void *)v5;
  }
}

- (BOOL)alwaysOnDisplayState
{
  Boolean keyExistsAndHasValidFormat = 1;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SBEnableAlwaysOn", @"com.apple.springboard", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

+ (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 reversalArbiter];
  v9 = [v7 biomeBookmark];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__WFAlwaysOnDisplaySettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke;
  v11[3] = &unk_264E55F98;
  id v12 = v6;
  id v10 = v6;
  [v8 getReversalStateWithBookmark:v9 completionHandler:v11];
}

void __82__WFAlwaysOnDisplaySettingsClient_getReversalStateWithBookmark_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    BOOL v3 = [a2 userSetState] == 1;
    uint64_t v4 = *(void *)(a1 + 32);
    id v6 = [NSNumber numberWithBool:v3];
    (*(void (**)(uint64_t, id, void))(v4 + 16))(v4, v6, 0);
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

+ (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 reversalArbiter];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__WFAlwaysOnDisplaySettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E5A3A8;
  id v8 = v4;
  id v6 = v4;
  [v5 getBookmarkForCurrentStateWithCompletionHandler:v7];
}

void __83__WFAlwaysOnDisplaySettingsClient_getBookmarkForCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F86E58]) initWithBiomeBookmark:v5];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, a3);
  }
}

+ (id)reversalArbiter
{
  id v3 = objc_alloc(MEMORY[0x263F86E50]);
  id v4 = [a1 alwaysOnPublisher];
  id v5 = [a1 reverseAlwaysOnPublisher];
  uint64_t v6 = (void *)[v3 initWithPublisher:v4 reversePublisher:v5];

  return v6;
}

+ (id)reverseAlwaysOnPublisher
{
  id v3 = BiomeLibrary();
  id v4 = [v3 Device];
  id v5 = [v4 Display];
  uint64_t v6 = [v5 AlwaysOn];
  id v7 = [MEMORY[0x263F86E50] reversePublisherOptions];
  id v8 = [v6 publisherWithOptions:v7];
  v9 = [a1 filteredPublisherForAlwaysOnPublisher:v8];

  return v9;
}

+ (id)alwaysOnPublisher
{
  id v3 = BiomeLibrary();
  id v4 = [v3 Device];
  id v5 = [v4 Display];
  uint64_t v6 = [v5 AlwaysOn];
  id v7 = [v6 publisher];
  id v8 = [a1 filteredPublisherForAlwaysOnPublisher:v7];

  return v8;
}

+ (id)filteredPublisherForAlwaysOnPublisher:(id)a3
{
  id v3 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__WFAlwaysOnDisplaySettingsClient_filteredPublisherForAlwaysOnPublisher___block_invoke;
  v6[3] = &unk_264E55F70;
  v6[4] = v7;
  id v4 = [v3 filterWithIsIncluded:v6];
  _Block_object_dispose(v7, 8);

  return v4;
}

uint64_t __73__WFAlwaysOnDisplaySettingsClient_filteredPublisherForAlwaysOnPublisher___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  int v5 = [v3 userSetState];
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 != v5)
  {
    int v5 = [v3 userSetState];
LABEL_5:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
    uint64_t v6 = 1;
    goto LABEL_6;
  }
  uint64_t v6 = 0;
LABEL_6:

  return v6;
}

+ (BOOL)canRunIntent
{
  v2 = [MEMORY[0x263F85258] currentDevice];
  BOOL v3 = ![v2 idiom] && (objc_msgSend(v2, "hasCapability:", *MEMORY[0x263F85650]) & 1) != 0;

  return v3;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  BOOL v3 = (void (**)(id, WFAlwaysOnDisplaySettingsClient *, void))a3;
  if (+[WFAlwaysOnDisplaySettingsClient canRunIntent])
  {
    int v4 = objc_alloc_init(WFAlwaysOnDisplaySettingsClient);
    v3[2](v3, v4, 0);
  }
  else
  {
    WFSettingsClientError();
    int v4 = (WFAlwaysOnDisplaySettingsClient *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, WFAlwaysOnDisplaySettingsClient *, WFAlwaysOnDisplaySettingsClient *))v3)[2](v3, 0, v4);
  }
}

@end