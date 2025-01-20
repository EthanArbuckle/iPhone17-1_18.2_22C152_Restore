@interface UIDocumentPickerViewServiceViewController
@end

@implementation UIDocumentPickerViewServiceViewController

void __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v4 = a3;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_2;
    block[3] = &unk_26492CFE8;
    id v11 = v4;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v12 = v5;
    uint64_t v13 = v6;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) hostingViewController];
    [v9 _didSelectURLBookmark:a2];
  }
}

void __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_2(uint64_t a1)
{
  v2 = NSString;
  v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v4 = [v3 localizedStringForKey:@"The file could not be made available to the application. (%@)" value:@"The file could not be made available to the application. (%@)" table:@"Localizable"];
  id v5 = [*(id *)(a1 + 32) localizedDescription];
  uint64_t v6 = objc_msgSend(v2, "stringWithFormat:", v4, v5);

  id v7 = (void *)MEMORY[0x263F1C3F8];
  v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v9 = [v8 localizedStringForKey:@"Failed to make file available" value:@"Failed to make file available" table:@"Localizable"];
  v10 = [v7 alertControllerWithTitle:v9 message:v6 preferredStyle:1];

  id v11 = cdui_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_2_cold_1(a1, (uint64_t *)(a1 + 32), v11);
  }

  id v12 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v14 = [v13 localizedStringForKey:@"Dismiss" value:@"Dismiss" table:@"Localizable"];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_92;
  v16[3] = &unk_26492D528;
  v16[4] = *(void *)(a1 + 48);
  v15 = [v12 actionWithTitle:v14 style:0 handler:v16];
  [v10 addAction:v15];

  [*(id *)(a1 + 48) presentViewController:v10 animated:1 completion:&__block_literal_global_11];
}

void __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_92(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) hostingViewController];
  [v1 _dismissViewController];
}

void __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v9)
  {
    uint64_t v13 = cdui_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_cold_2(a1, (uint64_t)v9, v13);
    }

    v14 = [*(id *)(a1 + 40) hostingViewController];
    [v14 _dismissViewController];
  }
  else
  {
    v15 = (id *)(a1 + 40);
    if ([*(id *)(a1 + 40) pickerMode] == 3)
    {
      v16 = cdui_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = [*(id *)(a1 + 40) uploadURL];
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v31 = v17;
        __int16 v32 = 2112;
        uint64_t v33 = v18;
        __int16 v34 = 2112;
        uint64_t v35 = v19;
        _os_log_impl(&dword_22CA47000, v16, OS_LOG_TYPE_INFO, "[INFO] File %@ has been written to %@ by provider %@. Removing original file since we are in Move mode.", buf, 0x20u);
      }
      id v20 = objc_alloc_init(MEMORY[0x263F08830]);
      v21 = [*v15 uploadURL];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_99;
      v28[3] = &unk_26492D6D0;
      v28[4] = *v15;
      id v29 = 0;
      [v20 coordinateWritingItemAtURL:v21 options:1 error:&v29 byAccessor:v28];
      id v22 = v29;

      if (v22)
      {
        v23 = cdui_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_cold_1((id *)(a1 + 40));
        }
      }
    }
    [MEMORY[0x263F1CC78] assembleURL:*(void *)(a1 + 32) sandbox:v10 physicalURL:v11 physicalSandbox:v12];
    objc_msgSend(*(id *)(a1 + 32), "ui_setIsFileProviderURL:", 1);
    v24 = cdui_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = *(void **)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v31 = v25;
      __int16 v32 = 2112;
      uint64_t v33 = v26;
      _os_log_impl(&dword_22CA47000, v24, OS_LOG_TYPE_INFO, "[INFO] Returning selected URL %@ to host app %@", buf, 0x16u);
    }

    v14 = [*(id *)(a1 + 40) hostingViewController];
    v27 = [MEMORY[0x263F1CC78] wrapperWithURL:*(void *)(a1 + 32)];
    [v14 _didSelectURLWrapper:v27];
  }
}

void __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_99(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a2;
  id v5 = [v3 defaultManager];
  id v11 = 0;
  char v6 = [v5 removeItemAtURL:v4 error:&v11];

  id v7 = v11;
  v8 = cdui_default_log();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_22CA47000, v9, OS_LOG_TYPE_INFO, "[INFO] Removed successfully", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_99_cold_1(a1);
  }
}

uint64_t __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) finishObserving];
  v2 = (void *)MEMORY[0x263F08AB8];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v2 _removeSubscriber:v3];
}

void __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_3;
  v4[3] = &unk_26492D798;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 56);
  [v2 coordinateReadingItemAtURL:v3 options:0 error:0 byAccessor:v4];
}

void __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_3(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_4;
  block[3] = &unk_26492D770;
  id v4 = a1[5];
  id v3 = a1[4];
  id v5 = a1[6];
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = [*(id *)(a1 + 32) presentingViewController];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_5;
  v3[3] = &unk_26492D748;
  id v4 = *(id *)(a1 + 48);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263F08A38] keyPathWithRootObject:a2 path:"fractionCompleted"];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_7;
  v11[3] = &unk_26492D7E8;
  uint64_t v14 = *(void *)(a1 + 72);
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 addObserverBlock:v11];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(a1 + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_9;
  v9[3] = &unk_26492D748;
  id v10 = *(id *)(a1 + 56);
  id v7 = (void *)MEMORY[0x230F72310](v9);

  return v7;
}

void __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_7(uint64_t a1, void *a2)
{
  [a2 floatValue];
  uint64_t v4 = [MEMORY[0x263F086F0] stringFromByteCount:(unint64_t)(float)(v3 * (float)*(unint64_t *)(a1 + 48)) countStyle:0];
  uint64_t v5 = NSString;
  id v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v7 = [v6 localizedStringForKey:@"%@ of %@ downloaded" value:@"%@ of %@ downloaded" table:@"Localizable"];
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v4, *(void *)(a1 + 32));

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_8;
  block[3] = &unk_26492CCC8;
  id v11 = *(id *)(a1 + 40);
  id v12 = v8;
  id v9 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMessage:*(void *)(a1 + 40)];
}

uint64_t __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_10(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __58___UIDocumentPickerViewServiceViewController__showPicker___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  if (a4) {
    return [v6 _presentError:a4 forThirdPartyPickerWithDescription:v7];
  }
  else {
    return [v6 _didInstantiateThirdPartyPickerWithDescription:v7 placeholder:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }
}

void __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = cdui_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_cold_1();
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_145;
  block[3] = &unk_26492CC78;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_145(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWithURL:0 forBundleIdentifier:0];
}

void __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v22[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _presentError:a2 forThirdPartyPickerWithDescription:v5];
  }
  else
  {
    id v6 = [a3 objectForKey:*(void *)(a1 + 48)];
    if (([*(id *)(a1 + 32) pickerMode] == 3 || objc_msgSend(*(id *)(a1 + 32), "pickerMode") == 1)
      && ([v6 objectForKey:@"documentStorageURL"],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v7))
    {
      id v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      id v9 = [v13 localizedStringForKey:@"File provider component not found" value:@"File provider component not found" table:@"Localizable"];

      uint64_t v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F053B8];
      uint64_t v21 = *MEMORY[0x263F08320];
      v22[0] = v9;
      v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v17 = [v14 errorWithDomain:v15 code:0 userInfo:v16];

      [*(id *)(a1 + 32) _presentError:v17 forThirdPartyPickerWithDescription:*(void *)(a1 + 40)];
    }
    else
    {
      v8 = [v6 dictionaryWithValuesForKeys:&unk_26E02D718];
      id v9 = (void *)[v8 mutableCopy];

      id v10 = [*(id *)(a1 + 40) fileProviderDocumentGroup];
      [v9 setValue:v10 forKey:@"documentGroup"];

      id v11 = [*(id *)(a1 + 40) localizedName];
      [v9 setValue:v11 forKey:@"localizedName"];

      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_3;
      v18[3] = &unk_26492D8B0;
      v18[4] = *(void *)(a1 + 32);
      id v12 = *(void **)(a1 + 56);
      id v19 = *(id *)(a1 + 64);
      id v20 = *(id *)(a1 + 40);
      [v12 _prepareWithExtensionInfo:v9 completionHandler:v18];
    }
  }
}

void __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_3(id *a1, unsigned int a2)
{
  if (a2 >> 8 >= 0x803)
  {
    id v3 = [a1[4] containedNavController];
    [v3 setNavigationBarHidden:1];
  }
  [a1[5] endDelayingDisplayOfRemoteController];
  id v4 = [a1[6] identifier];
  [a1[4] setCurrentPickerIdentifier:v4];
}

void __95___UIDocumentPickerViewServiceViewController__presentError_forThirdPartyPickerWithDescription___block_invoke(id *a1)
{
  v2 = NSString;
  id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v4 = [v3 localizedStringForKey:@"Failed to launch “%@”" value:@"Failed to launch “%@”" table:@"Localizable"];
  uint64_t v5 = [a1[4] localizedName];
  id v6 = objc_msgSend(v2, "stringWithFormat:", v4, v5);

  uint64_t v7 = NSString;
  v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v9 = [v8 localizedStringForKey:@"The document picker “%@” failed to launch (%i)." value:@"The document picker “%@” failed to launch (%i)." table:@"Localizable"];
  id v10 = [a1[4] localizedName];
  id v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10, objc_msgSend(a1[5], "code"));

  id v12 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v6 message:v11 preferredStyle:1];
  id v13 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  uint64_t v15 = [v14 localizedStringForKey:@"Dismiss" value:@"Dismiss" table:@"Localizable"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __95___UIDocumentPickerViewServiceViewController__presentError_forThirdPartyPickerWithDescription___block_invoke_2;
  v17[3] = &unk_26492D528;
  v17[4] = a1[6];
  v16 = [v13 actionWithTitle:v15 style:0 handler:v17];
  [v12 addAction:v16];

  [a1[6] presentViewController:v12 animated:0 completion:&__block_literal_global_173];
}

void __95___UIDocumentPickerViewServiceViewController__presentError_forThirdPartyPickerWithDescription___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) hostingViewController];
  [v1 _dismissViewController];
}

void __102___UIDocumentPickerViewServiceViewController_overviewController_selectedDocumentPickerWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = [_UIDocumentPickerModalManagementViewController alloc];
  id v3 = [*(id *)(a1 + 32) pickableTypes];
  id v4 = -[_UIDocumentPickerModalManagementViewController initWithFileTypes:mode:](v2, "initWithFileTypes:mode:", v3, [*(id *)(a1 + 32) pickerMode]);

  [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
}

void __102___UIDocumentPickerViewServiceViewController_overviewController_selectedDocumentPickerWithIdentifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentPickerIdentifier];
  char v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _showPicker:v5];
  }
}

void __88___UIDocumentPickerViewServiceViewController_documentListController_didSelectItemAtURL___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __88___UIDocumentPickerViewServiceViewController_documentListController_didSelectItemAtURL___block_invoke_2;
  v3[3] = &unk_26492D900;
  void v3[4] = v2;
  id v4 = v1;
  [v2 _waitForDownloadOfURL:v4 completion:v3];
}

uint64_t __88___UIDocumentPickerViewServiceViewController_documentListController_didSelectItemAtURL___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) dismissWithURL:*(void *)(result + 40) forBundleIdentifier:0];
  }
  return result;
}

void __106___UIDocumentPickerViewServiceViewController_documentListController_didSelectContainerWithViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentedURL];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __106___UIDocumentPickerViewServiceViewController_documentListController_didSelectContainerWithViewController___block_invoke_2;
  v7[3] = &unk_26492D928;
  v7[4] = *(void *)(a1 + 40);
  char v3 = +[_UIDocumentListController _listControllerHierarchyForURL:v2 withConstructorBlock:v7];

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [v3 firstObject];
  [v5 setDelegate:v4];

  id v6 = [*(id *)(a1 + 40) containedNavController];
  [v6 setViewControllers:v3];
}

_UIDocumentListController *__106___UIDocumentPickerViewServiceViewController_documentListController_didSelectContainerWithViewController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [_UIDocumentPickerURLContainerModel alloc];
  uint64_t v5 = [*(id *)(a1 + 32) pickableTypes];
  id v6 = -[_UIDocumentPickerURLContainerModel initWithURL:pickableTypes:mode:](v4, "initWithURL:pickableTypes:mode:", v3, v5, [*(id *)(a1 + 32) pickerMode]);

  uint64_t v7 = [[_UIDocumentListController alloc] initWithModel:v6];

  return v7;
}

uint64_t __99___UIDocumentPickerViewServiceViewController_documentTargetSelectionController_didSelectItemAtURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pickLocationForUpload:*(void *)(a1 + 40)];
}

void __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a2;
  uint64_t v5 = [v3 bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  id v6 = [v5 localizedStringForKey:@"New filename" value:@"New filename" table:@"Localizable"];
  [v4 setPlaceholder:v6];

  id v8 = [*(id *)(a1 + 32) _mangledFilenameForURL:*(void *)(a1 + 40)];
  uint64_t v7 = [v8 stringByDeletingPathExtension];
  [v4 setText:v7];
}

void __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [WeakRetained textFields];
  id v8 = [v3 firstObject];

  id v4 = [v8 text];
  uint64_t v5 = [v4 stringByAppendingPathExtension:*(void *)(a1 + 32)];

  id v6 = [*(id *)(a1 + 40) URLByDeletingLastPathComponent];
  uint64_t v7 = [v6 URLByAppendingPathComponent:v5];

  [*(id *)(a1 + 48) _tryExportingFile:*(void *)(a1 + 56) toLocation:v7];
}

uint64_t __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:&__block_literal_global_213];
}

void __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  [v3 moveItemAtURL:a2 toURL:a3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

void __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v12 = 0;
  uint64_t v6 = *MEMORY[0x263EFF760];
  id v7 = a2;
  [v7 getResourceValue:&v12 forKey:v6 error:0];
  id v8 = v12;
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v10 + 40);
  [v9 copyItemAtURL:v7 toURL:v5 error:&obj];

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v8) {
    [v5 setResourceValue:v8 forKey:v6 error:0];
  }
}

uint64_t __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:&__block_literal_global_221];
}

uint64_t __65___UIDocumentPickerViewServiceViewController__warnSharingPreMove__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWithURL:0 forBundleIdentifier:0];
}

uint64_t __79___UIDocumentPickerViewServiceViewController__warnSharingForTarget_completion___block_invoke(uint64_t a1)
{
  v2 = cdui_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_22CA47000, v2, OS_LOG_TYPE_INFO, "[INFO] owner decided to break share by moving it between containers", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79___UIDocumentPickerViewServiceViewController__warnSharingForTarget_completion___block_invoke_239(uint64_t a1)
{
  v2 = cdui_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_22CA47000, v2, OS_LOG_TYPE_INFO, "[INFO] owner decided to cancel move", v4, 2u);
  }

  return [*(id *)(a1 + 32) dismissWithURL:0 forBundleIdentifier:0];
}

void __84___UIDocumentPickerViewServiceViewController__createBookmarkAndDismissWithCloudURL___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 48) _hostApplicationBundleIdentifier];
  uint64_t v7 = *a2;
  int v8 = 138412802;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  id v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  _os_log_fault_impl(&dword_22CA47000, a3, OS_LOG_TYPE_FAULT, "[ERROR] error adding document %@ to bundle %@: %@", (uint8_t *)&v8, 0x20u);
}

void __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_cold_1(id *a1)
{
  id v1 = [*a1 uploadURL];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_22CA47000, v2, v3, "[ERROR] File coordination failed for removing %@ after moving (%@)", v4, v5, v6, v7, v8);
}

void __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_22CA47000, a2, a3, "[ERROR] Could not extend URL %@. Error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke_99_cold_1(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) uploadURL];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_22CA47000, v2, v3, "[ERROR] Deletion failed for removing %@ after moving (%@)", v4, v5, v6, v7, v8);
}

void __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_22CA47000, v0, v1, "[ERROR] Document controller remote proxy failed with error: %@", v2, v3, v4, v5, v6);
}

@end