@interface QLExtensionManager(Internal)
- (void)remoteViewControllerForContentType:()Internal applicationBundleIdentifier:extensionType:generatonType:withCompletionHandler:;
@end

@implementation QLExtensionManager(Internal)

- (void)remoteViewControllerForContentType:()Internal applicationBundleIdentifier:extensionType:generatonType:withCompletionHandler:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (a5)
  {
    v15 = (NSObject **)MEMORY[0x263F62940];
    v16 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v16 = *v15;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F61000, v16, OS_LOG_TYPE_ERROR, "Remove view controllers can be provided for UI extensions only. #Remote", buf, 2u);
    }
    (*((void (**)(id, void, void, void, void))v14 + 2))(v14, 0, 0, 0, 0);
  }
  else
  {
    LOBYTE(v19) = 1;
    v17 = [a1 extensionForContentType:v12 allowExtensionsForParentTypes:0 applicationBundleIdentifier:v13 extensionPath:0 extensionType:0 generationType:a6 shouldUseRestrictedExtension:v19];
    v18 = v17;
    if (v17)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __145__QLExtensionManager_Internal__remoteViewControllerForContentType_applicationBundleIdentifier_extensionType_generatonType_withCompletionHandler___block_invoke;
      v20[3] = &unk_2642F5C08;
      id v21 = v17;
      id v22 = v14;
      [v21 instantiateViewControllerWithInputItems:0 connectionHandler:v20];
    }
    else
    {
      (*((void (**)(id, void, void, void, void))v14 + 2))(v14, 0, 0, 0, 0);
    }
  }
}

@end