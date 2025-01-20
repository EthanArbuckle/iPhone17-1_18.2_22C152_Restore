@interface MUPlaceAttributionUtilities
+ (BOOL)shouldPresentStoreProductViewControllerWithAttribution:(id)a3;
+ (id)overriddenIfNecessaryAppAdamID:(id)a3;
+ (void)presentStoreProductViewControllerWithAppAdamID:(id)a3 bundleIdentifier:(id)a4 presentingViewController:(id)a5;
@end

@implementation MUPlaceAttributionUtilities

+ (BOOL)shouldPresentStoreProductViewControllerWithAttribution:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 shouldOpenInAppStore])
  {
    v5 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_INFO, "Attribution allows opening in app store", buf, 2u);
    }

    if (+[MapsUIUtilities deviceIsLockedAndNeedsPasscode])
    {
      v6 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1931EA000, v6, OS_LOG_TYPE_INFO, "Should not present store product VC, device is locked", buf, 2u);
      }
    }
    else
    {
      v8 = [v4 appAdamID];
      v6 = [a1 overriddenIfNecessaryAppAdamID:v8];

      if ([v6 length])
      {
        id v16 = 0;
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F223C8]), "initWithStoreItemIdentifier:error:", -[NSObject longLongValue](v6, "longLongValue"), &v16);
        id v10 = v16;
        v11 = [v9 applicationState];
        int v12 = [v11 isInstalled];

        if (v10)
        {
          v13 = MUGetPlaceCardLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v10;
            _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_ERROR, "Unable to check install state with error %@", buf, 0xCu);
          }
        }
        char v7 = v12 ^ 1;
        if (v12)
        {
          v14 = MUGetPlaceCardLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1931EA000, v14, OS_LOG_TYPE_INFO, "Cannot present store product VC", buf, 2u);
          }
        }
        goto LABEL_19;
      }
    }
    char v7 = 0;
LABEL_19:

    goto LABEL_20;
  }
  char v7 = 0;
LABEL_20:

  return v7;
}

+ (void)presentStoreProductViewControllerWithAppAdamID:(id)a3 bundleIdentifier:(id)a4 presentingViewController:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = [a1 overriddenIfNecessaryAppAdamID:a3];
  if ([v8 length])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F3C310]);
    uint64_t v11 = *MEMORY[0x1E4F3C3A8];
    v12[0] = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v9 loadProductWithParameters:v10 completionBlock:0];

    [v7 presentViewController:v9 animated:1 completion:0];
  }
}

+ (id)overriddenIfNecessaryAppAdamID:(id)a3
{
  v3 = (__CFString *)a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"MKPlacecardOverridePhotosAttributionYelpAdamID"];

  if (v5)
  {

    v3 = @"284910350";
  }
  return v3;
}

@end