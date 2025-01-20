@interface UIWindowScene(SafariServicesExtras)
- (void)_sf_destroyScene;
- (void)_sf_openFaceTimeMultiWayURL:()SafariServicesExtras completionHandler:;
- (void)_sf_openTelURL:()SafariServicesExtras completionHandler:;
@end

@implementation UIWindowScene(SafariServicesExtras)

- (void)_sf_openTelURL:()SafariServicesExtras completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFaceTimeMultiwayURL])
  {
    objc_msgSend(a1, "_sf_openFaceTimeMultiWayURL:completionHandler:", v6, v7);
  }
  else
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FADBC0]) initWithURL:v6];
    if ([v8 isValid])
    {
      if ([v8 showUIPrompt])
      {
        v9 = +[SFTelephonyURLHandler sharedInstance];
        if (([v9 openURLForDialRequest:v8 withScene:a1 completionHandler:v7] & 1) == 0)
        {
          id v10 = objc_alloc((Class)getTPDialPromptAlertClass());
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __72__UIWindowScene_SafariServicesExtras___sf_openTelURL_completionHandler___block_invoke;
          v12[3] = &unk_1E5C72E88;
          id v15 = v7;
          id v13 = v8;
          v14 = a1;
          v11 = (void *)[v10 initWithDialRequest:v13 dialAction:v12];
          [v11 show];
        }
      }
      else
      {
        [a1 openURL:v6 options:0 completionHandler:v7];
      }
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)_sf_openFaceTimeMultiWayURL:()SafariServicesExtras completionHandler:
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4FADBE8];
  id v8 = a3;
  v9 = (void *)[[v7 alloc] initWithURL:v8];

  if (v9)
  {
    id v10 = objc_alloc((Class)getTPDialPromptAlertClass());
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__UIWindowScene_SafariServicesExtras___sf_openFaceTimeMultiWayURL_completionHandler___block_invoke;
    v12[3] = &unk_1E5C72E88;
    id v15 = v6;
    id v13 = v9;
    uint64_t v14 = a1;
    v11 = (void *)[v10 initWithJoinRequest:v13 dialAction:v12];
    [v11 show];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)_sf_destroyScene
{
  id v2 = objc_alloc(MEMORY[0x1E4FB16C0]);
  id v5 = (id)[v2 initWithPreferredAnimationType:1 callbackQueue:MEMORY[0x1E4F14428] completion:&__block_literal_global_3];
  v3 = [a1 _FBSScene];
  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
  [v3 sendActions:v4];
}

@end