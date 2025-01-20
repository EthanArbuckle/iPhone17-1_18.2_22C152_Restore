@interface LSApplicationWorkspace(SafariServicesExtras)
- (uint64_t)_sf_openURL:()SafariServicesExtras withOptions:completionHandler:;
- (uint64_t)_sf_shouldOverrideiCloudSharingURL:()SafariServicesExtras withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:;
- (void)_sf_openURL:()SafariServicesExtras inApplication:withOptions:completionHandler:;
- (void)_sf_tryOpeningURLInDefaultApp:()SafariServicesExtras isContentManaged:completionHandler:;
@end

@implementation LSApplicationWorkspace(SafariServicesExtras)

- (uint64_t)_sf_openURL:()SafariServicesExtras withOptions:completionHandler:
{
  return objc_msgSend(a1, "_sf_openURL:inApplication:withOptions:completionHandler:", a3, 0, a4, a5);
}

- (void)_sf_openURL:()SafariServicesExtras inApplication:withOptions:completionHandler:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__LSApplicationWorkspace_SafariServicesExtras___sf_openURL_inApplication_withOptions_completionHandler___block_invoke;
  block[3] = &unk_1E5C743A0;
  id v22 = v12;
  id v23 = v13;
  block[4] = a1;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, block);
}

- (uint64_t)_sf_shouldOverrideiCloudSharingURL:()SafariServicesExtras withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:
{
  if (a6) {
    return objc_msgSend(a4, "safari_hasScheme:", @"icloud-sharing") ^ 1;
  }
  else {
    return 1;
  }
}

- (void)_sf_tryOpeningURLInDefaultApp:()SafariServicesExtras isContentManaged:completionHandler:
{
  id v7 = a3;
  if (a5) {
    v8 = a5;
  }
  else {
    v8 = &__block_literal_global_19;
  }
  v9 = (void *)MEMORY[0x1AD0C36A0](v8);
  id v10 = [MEMORY[0x1E4F25D38] defaultManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __113__LSApplicationWorkspace_SafariServicesExtras___sf_tryOpeningURLInDefaultApp_isContentManaged_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5C743F0;
  char v16 = a4;
  id v14 = v7;
  id v15 = v9;
  id v11 = v9;
  id v12 = v7;
  [v10 fetchItemForURL:v12 completionHandler:v13];
}

@end