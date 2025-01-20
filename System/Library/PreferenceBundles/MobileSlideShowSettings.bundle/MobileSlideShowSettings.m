void sub_3F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, void);
  v12 = va_arg(va1, void);
  v13 = va_arg(va1, void);
  v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3F48()
{
  return px_dispatch_on_main_queue();
}

void sub_41B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  SettingsBaseControllerLocalizedStringResource(@"PHOTOS_SETTINGS_TITLE");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.mobileslideshow", v7, v6, v5);
}

id SettingsBaseControllerLocalizedStringResource(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc((Class)_NSLocalizedStringResource);
  v3 = +[NSLocale currentLocale];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 bundleURL];
  id v6 = [v2 initWithKey:v1 table:@"Photos" locale:v3 bundleURL:v5];

  return v6;
}

void sub_458C(void *a1, void *a2, unsigned __int8 a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  objc_initWeak(&location, a4);
  if (v7)
  {
    uint64_t v9 = [v8 failureDescription];
    v10 = v9;
    if ((a3 & (v9 != 0)) != 0) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = &stru_29018;
    }
    v12 = v11;
    v13 = [v8 action];
    if (v13)
    {
      v14 = [v8 actionTitle];
      if ([v14 length])
      {
        BOOL v15 = sub_47F4(v8);

        if (v15)
        {
          v16 = [v8 actionTitle];
          if ([(__CFString *)v12 length])
          {
            v17 = +[NSBundle bundleForClass:objc_opt_class()];
            v18 = [v17 localizedStringForKey:@"SETTINGS_ICLOUDPHOTOS_ACTION_DESCRIPTION_TITLE_FORMAT" value:&stru_29018 table:@"Photos"];
            uint64_t v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v12, v16);

            v12 = (__CFString *)v19;
          }
          else
          {
            v17 = v12;
            v12 = v16;
          }

          v20 = NSStringFromSelector("_performICloudPhotosAction:");
          id v21 = objc_loadWeakRetained(&location);
          SettingsBaseConfigureSpecifierFooterWithHyperlink(v7, v12, v16, v20, v21);

          goto LABEL_14;
        }
      }
      else
      {
      }
    }
    [v7 setProperty:v12 forKey:PSFooterTextGroupKey];
LABEL_14:

    goto LABEL_15;
  }
  v10 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Settings: Attempting to update nil specifier: iCPL status group footer", buf, 2u);
  }
LABEL_15:

  objc_destroyWeak(&location);
}

void sub_47D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

BOOL sub_47F4(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 serviceAction] != (char *)&dword_0 + 1
    && [v1 serviceAction] != (char *)&dword_0 + 2
    && [v1 serviceAction] != &dword_8;

  return v2;
}

void SettingsBaseConfigureSpecifierFooterWithHyperlink(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  objc_initWeak(&location, a5);
  v19.id location = (NSUInteger)[v10 rangeOfString:v11];
  v13 = NSStringFromRange(v19);
  [v9 setProperty:v13 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id v14 = objc_loadWeakRetained(&location);
  BOOL v15 = +[NSValue valueWithNonretainedObject:v14];
  [v9 setProperty:v15 forKey:PSFooterHyperlinkViewTargetKey];

  [v9 setProperty:v12 forKey:PSFooterHyperlinkViewActionKey];
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  [v9 setProperty:v17 forKey:PSFooterCellClassGroupKey];

  [v9 setProperty:v10 forKey:PSFooterHyperlinkViewTitleKey];
  objc_destroyWeak(&location);
}

void sub_49BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

uint64_t sub_4EDC(uint64_t a1)
{
  BOOL v2 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) actionTitle];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Settings: User confirmed action with title: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_4FAC(uint64_t a1)
{
  BOOL v2 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) actionTitle];
    int v4 = 138543362;
    int v5 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Settings: User dismissed action with title: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

id sub_5144(void *a1)
{
  id v1 = a1;
  if ([v1 serviceAction] == (char *)&dword_0 + 1)
  {
    BOOL v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = v2;
    CFStringRef v4 = @"SETTINGS_ICLOUDPHOTOS_ACTION_PAUSE";
LABEL_5:
    int v5 = [v2 localizedStringForKey:v4 value:&stru_29018 table:@"Photos"];

    goto LABEL_7;
  }
  if ([v1 serviceAction] == (char *)&dword_0 + 2)
  {
    BOOL v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = v2;
    CFStringRef v4 = @"SETTINGS_ICLOUDPHOTOS_ACTION_SYNC_NOW";
    goto LABEL_5;
  }
  int v5 = [v1 actionTitle];
LABEL_7:

  return v5;
}

BOOL sub_534C(void *a1, int a2, int a3)
{
  id v5 = a1;
  id v6 = v5;
  BOOL v7 = 0;
  if (a2 && a3)
  {
    id v8 = [v5 action];
    if (v8)
    {
      id v9 = [v6 actionTitle];
      BOOL v7 = [v9 length] && !sub_47F4(v6) && objc_msgSend(v6, "serviceAction") != &dword_8;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

void sub_56C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_56E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v7 = v5;
  id v8 = v6;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void sub_57BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_57D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v2 = [*(id *)(a1 + 32) storageUsed];
  [WeakRetained _updatePhotosCloudSpace:v2 error:*(void *)(a1 + 40)];
}

void sub_61A0(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  CFStringRef v4 = a3;
  id v5 = PLUserStatusUIGetLog();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      id v7 = "Did navigate to iCloud Storage Settings";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_0, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v4;
    id v7 = "Failed to navigate to iCloud Storage Settings: %@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

void sub_6310(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  CFStringRef v4 = a3;
  id v5 = PLUserStatusUIGetLog();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      id v7 = "Did navigate to iCloud Storage Settings";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_0, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v4;
    id v7 = "Failed to navigate to iCloud Storage Settings: %@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

id sub_6524(int a1, int a2)
{
  CFStringRef v4 = @"ICLOUDPHOTOS_OPTIMIZE_STORAGE_FOOTER_";
  if (a1) {
    CFStringRef v4 = @"ICLOUDPHOTOS_KEEP_ORIGINALS_FOOTER_";
  }
  id v5 = v4;
  if (!a2)
  {
    uint32_t v10 = v5;
    id v8 = +[UIDevice currentDevice];
    int v11 = [v8 model];
    os_log_type_t v9 = [(__CFString *)v10 stringByAppendingString:v11];

    goto LABEL_7;
  }
  if (a1)
  {
    id v6 = +[UIDevice currentDevice];
    id v7 = [v6 model];
    id v8 = [@"ICLOUDPHOTOS_KEEP_ORIGINALS_FOOTER_" stringByAppendingString:v7];

    os_log_type_t v9 = [v8 stringByAppendingString:@"_ExitMode"];
LABEL_7:

    goto LABEL_9;
  }
  os_log_type_t v9 = [@"ICLOUDPHOTOS_OPTIMIZE_STORAGE_FOOTER_" stringByAppendingString:@"ExitMode"];
LABEL_9:
  id v12 = PULocalizedString();

  return v12;
}

void sub_6794(void *a1, int a2, int a3, int a4, uint64_t a5, int a6, void *a7)
{
  id v13 = a1;
  objc_initWeak(&location, a7);
  if (v13)
  {
    if (a2)
    {
      id v14 = +[NSBundle bundleForClass:objc_opt_class()];
      BOOL v15 = [v14 localizedStringForKey:@"ICLOUDPHOTOS_GROUP_FOOTER_EXITING_STORAGE_MANAGEMENT_LINK_TITLE" value:&stru_29018 table:@"Photos"];
      int v16 = a3 ^ 1 | a4;

      if (a5 < 1)
      {
        v25 = @"ICLOUDPHOTOS_GROUP_FOOTER_FALLBACK_DESCRIPTION_EXITING_OPTIMIZE_STORAGE";
        if (v16) {
          v25 = @"ICLOUDPHOTOS_GROUP_FOOTER_FALLBACK_DESCRIPTION_EXITING_KEEP_ORIGINALS";
        }
        v18 = v25;
        v26 = +[NSBundle bundleForClass:objc_opt_class()];
        NSRange v19 = [v26 localizedStringForKey:v18 value:&stru_29018 table:@"Photos"];

        v31 = v15;
        uint64_t v20 = PFStringWithValidatedFormat();
      }
      else
      {
        v17 = @"ICLOUDPHOTOS_GROUP_FOOTER_DESCRIPTION_EXITING_OPTIMIZE_STORAGE_FORMAT";
        if (v16) {
          v17 = @"ICLOUDPHOTOS_GROUP_FOOTER_DESCRIPTION_EXITING_KEEP_ORIGINALS_FORMAT";
        }
        v18 = v17;
        NSRange v19 = PULocalizedString();
        v31 = (void *)a5;
        v32 = v15;
        uint64_t v20 = PFStringWithValidatedFormat();
      }
      v22 = (__CFString *)v20;

      uint64_t v27 = NSStringFromSelector("_openStorageManagement:");
    }
    else
    {
      if (!a6)
      {
        v23 = +[NSBundle bundleForClass:objc_opt_class()];
        v24 = SFLocalizableWAPIStringKeyForKey();
        v22 = [v23 localizedStringForKey:v24 value:&stru_29018 table:@"Photos"];

        BOOL v15 = 0;
        id v21 = 0;
        goto LABEL_18;
      }
      if (a3)
      {
        BOOL v15 = 0;
        id v21 = 0;
        v22 = &stru_29018;
        goto LABEL_18;
      }
      v29 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = [v29 localizedStringForKey:@"SETTINGS_ICLOUDPHOTOS_BACKUP_DESCRIPTION_FORMAT" value:&stru_29018 table:@"Photos"];

      v30 = +[NSBundle bundleForClass:objc_opt_class()];
      BOOL v15 = [v30 localizedStringForKey:@"SETTINGS_ICLOUDPHOTOS_BACKUP_LINK_TITLE" value:&stru_29018 table:@"Photos"];

      v31 = v15;
      PFStringWithValidatedFormat();
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = NSStringFromSelector("_openBackupManagement:");
    }
    id v21 = (void *)v27;

    if (v15 && v21)
    {
      id v28 = objc_loadWeakRetained(&location);
      SettingsBaseConfigureSpecifierFooterWithHyperlink(v13, v22, v15, v21, v28);

LABEL_19:
      goto LABEL_20;
    }
LABEL_18:
    objc_msgSend(v13, "setProperty:forKey:", v22, PSFooterTextGroupKey, v31, v32);
    goto LABEL_19;
  }
LABEL_20:
  objc_destroyWeak(&location);
}

void sub_6B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_6E7C(uint64_t a1)
{
  [*(id *)(a1 + 32) hide];
  [*(id *)(a1 + 40) _setDisplayedSpinner:0];
  id v3 = [*(id *)(a1 + 40) view];
  BOOL v2 = [v3 window];
  [v2 setUserInteractionEnabled:1];
}

void sub_6EF4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  PLRecordiCPLDisableState();
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_7050;
    block[3] = &unk_28FE0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v5;
      id v9 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "<%@: %p> Failed to disable iCPL: %@", buf, 0x20u);
    }
  }
}

id sub_7050(uint64_t a1)
{
  BOOL v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    id v5 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "<%@: %p> Did disable iCPL", (uint8_t *)&v8, 0x16u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 240) = 0;
  id v6 = [*(id *)(a1 + 32) parentController];
  [v6 reloadSpecifier:*(void *)(*(void *)(a1 + 32) + OBJC_IVAR___PSViewController__specifier)];

  return [*(id *)(a1 + 32) _updateSpecifiersForCPLEnablementChange];
}

uint64_t sub_7588(uint64_t a1)
{
  BOOL v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Enable iCPL ignoring Exit Mode Warning", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_7608(uint64_t a1)
{
  BOOL v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Cancel enable iCPL due to Exit Mode Warning", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_7688(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v1 = PLUIGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "Cancel enable iCPL and Navigate to cloud storage settings", v3, 2u);
  }

  return +[PXSystemNavigation navigateToDestination:5 completion:0];
}

void sub_7920(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  PLRecordiCPLEnableState();
  if (v5 && [v5 code] == (char *)&dword_4 + 3)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      id v21 = v7;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      __int16 v24 = 1024;
      int v25 = 1;
      __int16 v26 = 1024;
      int v27 = v9;
      id v10 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "<%@: %p> Insufficient storage: %d (Ignoring storage: %d)", buf, 0x22u);
    }
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_7ADC;
  v14[3] = &unk_28BE8;
  char v17 = a2;
  char v18 = v11;
  char v19 = *(unsigned char *)(a1 + 48);
  id v12 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v12;
  id v16 = v5;
  id v13 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
}

void sub_7ADC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) || *(unsigned char *)(a1 + 57) && *(unsigned char *)(a1 + 58))
  {
    BOOL v2 = PLUIGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = objc_opt_class();
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      int v25 = v3;
      __int16 v26 = 2048;
      uint64_t v27 = v4;
      id v5 = v3;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "<%@: %p> Will enable iCPL", buf, 0x16u);
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_7DA0;
    v22[3] = &unk_28DD0;
    id v6 = *(void **)(a1 + 40);
    v22[4] = *(void *)(a1 + 32);
    id v23 = v6;
    +[PLCloudPhotoLibraryHelper enableCPL:v22];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 240) = 0;
    [*(id *)(a1 + 32) reloadSpecifierID:@"iCloudPhotosSwitch" animated:1];
    [*(id *)(a1 + 32) _updateSharedLibrarySpecifiersAnimated:1];
    if ([*(id *)(a1 + 48) code] == (char *)&dword_8 + 2)
    {
      id v7 = +[PLAccountStore pl_sharedAccountStore];
      uint64_t v8 = +[PLAccountStore pl_sharedAccountStore];
      int v9 = [v8 cachedPrimaryAppleAccount];
      [v7 renewCredentialsForAccount:v9 completion:0];
    }
    else
    {
      id v10 = *(void **)(a1 + 48);
      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      char v18 = sub_7E60;
      char v19 = &unk_28DA8;
      id v11 = v10;
      uint64_t v12 = *(void *)(a1 + 32);
      id v20 = v11;
      uint64_t v21 = v12;
      id v13 = +[UIAlertController px_alertForCPLEnableError:v11 actionHandler:&v16 cancelHandler:0];
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v13, 1, 0, v16, v17, v18, v19);
    }
    [*(id *)(a1 + 40) hide];
    [*(id *)(a1 + 32) _setDisplayedSpinner:0];
    uint64_t v14 = [*(id *)(a1 + 32) view];
    id v15 = [v14 window];
    [v15 setUserInteractionEnabled:1];
  }
}

void sub_7DA0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7EC8;
  v8[3] = &unk_28BC0;
  char v11 = a2;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

char *sub_7E60(uint64_t a1)
{
  result = (char *)[*(id *)(a1 + 32) code];
  if (result == (unsigned char *)&dword_4 + 3)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 264) = PLCPLShouldRequireStorageUpgradeForError();
    id v3 = *(void **)(a1 + 40);
    return (char *)_[v3 _showStorageOptions];
  }
  return result;
}

void sub_7EC8(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = PLUIGetLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)v31 = 138412546;
      *(void *)&v31[4] = v5;
      *(_WORD *)&v31[12] = 2048;
      *(void *)&v31[14] = v6;
      id v7 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> Did enable iCPL", v31, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 240) = 1;
    uint64_t v8 = +[PLPhotoLibrary systemPhotoLibrary];
    unsigned __int8 v9 = [v8 isReadyForCloudPhotoLibrary];

    if ((v9 & 1) == 0)
    {
      id v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        char v11 = objc_opt_class();
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)v31 = 138412546;
        *(void *)&v31[4] = v11;
        *(_WORD *)&v31[12] = 2048;
        *(void *)&v31[14] = v12;
        id v13 = v11;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "<%@: %p> Library is not ready for iCPL, showing prompt", v31, 0x16u);
      }
      uint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
      id v15 = [v14 localizedStringForKey:@"iCLOUDPHOTOS_RESTORE_PAUSE_TITLE" value:&stru_29018 table:@"Photos"];
      id v16 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v17 = [v16 localizedStringForKey:@"iCLOUDPHOTOS_RESTORE_PAUSE_MESSAGE" value:&stru_29018 table:@"Photos"];
      char v18 = +[UIAlertController alertControllerWithTitle:v15 message:v17 preferredStyle:1];

      char v19 = +[NSBundle bundleForClass:objc_opt_class()];
      id v20 = [v19 localizedStringForKey:@"ICLOUDPHOTOS_OK" value:&stru_29018 table:@"Photos"];
      uint64_t v21 = +[UIAlertAction actionWithTitle:v20 style:1 handler:0];
      [v18 addAction:v21];

      [*(id *)(a1 + 32) presentViewController:v18 animated:1 completion:0];
    }
    objc_msgSend(*(id *)(a1 + 32), "_updateSpecifiersForCPLEnablementChange", *(_OWORD *)v31, *(void *)&v31[16]);
    uint64_t v4 = [*(id *)(a1 + 32) parentController];
    [v4 reloadSpecifier:*(void *)(*(void *)(a1 + 32) + OBJC_IVAR___PSViewController__specifier)];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __int16 v22 = objc_opt_class();
    uint64_t v23 = *(void *)(a1 + 32);
    id v24 = v22;
    int v25 = +[PLAccountStore pl_sharedAccountStore];
    __int16 v26 = [v25 cachedPrimaryAppleAccount];
    uint64_t v27 = [v26 identifier];
    uint64_t v28 = *(void *)(a1 + 40);
    *(_DWORD *)v31 = 138413058;
    *(void *)&v31[4] = v22;
    *(_WORD *)&v31[12] = 2048;
    *(void *)&v31[14] = v23;
    *(_WORD *)&v31[22] = 2112;
    v32 = v27;
    __int16 v33 = 2112;
    uint64_t v34 = v28;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "<%@: %p> Failed to enable iCPL on account: %@. Error: %@", v31, 0x2Au);
  }
  [*(id *)(a1 + 48) hide];
  [*(id *)(a1 + 32) _setDisplayedSpinner:0];
  v29 = [*(id *)(a1 + 32) view];
  v30 = [v29 window];
  [v30 setUserInteractionEnabled:1];
}

id sub_8384(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return _[v3 _enableCloudPhotosIgnoringStorageLimits:*(unsigned __int8 *)(a1 + 40)];
  }
  else {
    return [v3 reloadSpecifierID:@"iCloudPhotosSwitch" animated:1];
  }
}

void sub_8610(void *a1, int a2)
{
  if (a2) {
    CFStringRef v2 = @"iCloudKeepOriginalsOption";
  }
  else {
    CFStringRef v2 = @"iCloudOptimizeStorageOption";
  }
  id v3 = a1;
  id v5 = [v3 specifierForID:v2];
  uint64_t v4 = [v3 specifierForID:@"iCloudKeepOriginalsGroup"];

  [v4 setProperty:v5 forKey:PSRadioGroupCheckedSpecifierKey];
}

uint64_t sub_88D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_88E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_8F60(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelDisableCloudPhotos];
}

id sub_8F68(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _confirmDeletePrunedResourcesWithNonLocalResourceInfo:*(void *)(a1 + 40)];
}

id sub_926C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelDisableCloudPhotos];
}

id sub_9274(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _disableCloudPhotos];
}

id sub_966C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _showManageStorage];
}

id sub_9D0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelDisableCloudPhotos];
}

id sub_9D14(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _disableCloudPhotos];
}

id sub_9D1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelDisableCloudPhotos];
}

id sub_9D24(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _disableCloudPhotos];
}

id sub_A194(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelDisableCloudPhotos];
}

id sub_A19C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _confirmDeletePrunedResourcesWithNonLocalResourceInfo:*(void *)(a1 + 40)];
}

id sub_A1A8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _enableKeepOriginalsWithNonLocalResourceInfo:*(void *)(a1 + 40)];
}

void sub_A2BC(uint64_t a1)
{
  CFStringRef v2 = [*(id *)(a1 + 32) _nonLocalResourceInfo];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_A360;
  v4[3] = &unk_28DA8;
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

id sub_A360(uint64_t a1)
{
  [*(id *)(a1 + 32) _hideDisplayedSpinner];
  CFStringRef v2 = [*(id *)(a1 + 32) systemPhotoLibrary];
  unsigned __int8 v3 = [v2 isKeepOriginalsEnabled];

  uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"kCPLExistNonLocalOriginalsKey"];
  unsigned __int8 v5 = [v4 BOOLValue];

  unsigned int v7 = [*(id *)(*(void *)(a1 + 32) + 272) hasChangesToProcess];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v5)
  {
    if (v7)
    {
      return _objc_msgSend(v8, "_confirmCloudPhotosDisableWithSyncInProgress", v6);
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 40);
      if (v3)
      {
        return _[v8 _confirmCloudPhotosDisableWithNonLocalResourceInfo:v9];
      }
      else
      {
        return _[v8 _confirmCloudPhotosDisableWhilePrunedWithNonLocalResourceInfo:v9];
      }
    }
  }
  else
  {
    return _objc_msgSend(v8, "_disableCloudPhotos", v6);
  }
}

void sub_A708(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) systemPhotoLibrary];
  +[PXPeopleUtilities unblockPersonsInLibrary:v1 completion:&stru_28AF8];
}

void sub_A76C(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (v4 || !a2)
  {
    unsigned __int8 v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      unsigned int v7 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "SettingsBaseController: resetting blocked persons failed with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_AB64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_ABA8(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B0AC;
  block[3] = &unk_28E48;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_AC38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v3 = [WeakRetained _fetchBlockedMemoryFeatures];
  uint64_t v4 = [WeakRetained _fetchMemoriesWithUserFeedback];
  unsigned __int8 v5 = [WeakRetained _fetchDeniedSuggestions];
  if (![v3 count] && !objc_msgSend(v4, "count") && !objc_msgSend(v5, "count"))
  {
    id v9 = 0;
    goto LABEL_5;
  }
  int v6 = [v3 fetchOptions];
  unsigned int v7 = [v6 photoLibrary];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_AE68;
  v15[3] = &unk_28FB8;
  id v16 = v3;
  id v17 = v4;
  id v18 = v5;
  id v14 = 0;
  unsigned int v8 = [v7 performChangesAndWait:v15 error:&v14];
  id v9 = v14;

  if (v8)
  {
LABEL_5:
    [WeakRetained _removeResetBlacklistedMemoryButton];
    goto LABEL_9;
  }
  id v10 = PLUIGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = objc_opt_class();
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    id v20 = v11;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    id v24 = v9;
    id v13 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "<%@: %p> Resetting Blacklisted Memories failed with error: %@", buf, 0x20u);
  }
LABEL_9:
}

void sub_AE68(id *a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = a1[4];
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v9 = [v8 blacklistedFeature];
        id v10 = (char *)[v9 type];

        if (v10 != (unsigned char *)&dword_0 + 1)
        {
          if ([v8 category] == (char *)&stru_158.reloff + 1)
          {
            [v2 addObject:v8];
          }
          else
          {
            char v11 = +[PHMemoryChangeRequest changeRequestForMemory:v8];
            [v11 setBlacklistedFeature:0];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  +[PHMemoryChangeRequest deleteMemories:v2];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = a1[5];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = +[PHMemoryChangeRequest changeRequestForMemory:](PHMemoryChangeRequest, "changeRequestForMemory:", *(void *)(*((void *)&v18 + 1) + 8 * (void)j), (void)v18);
        [v17 setUserFeedback:0];
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  if ([a1[6] count]) {
    +[PHSuggestionChangeRequest deleteSuggestions:a1[6]];
  }
}

void sub_B0AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void sub_BB70(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 200));
  _Unwind_Resume(a1);
}

uint64_t sub_BB98(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_BBA8(uint64_t a1)
{
}

void sub_BBB0(uint64_t a1)
{
  id v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    if (v5) {
      CFStringRef v6 = @"Yes!";
    }
    else {
      CFStringRef v6 = @"Nope.";
    }
    id v12 = v3;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    CFStringRef v16 = v6;
    id v7 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "<%@: %p> Did check if iCPL has exited: %@", buf, 0x20u);
  }
  unsigned int v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v9 + 40);
  [v8 _filterAndConfigureSpecifiers:&obj isAsync:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  objc_storeStrong((id *)(v9 + 40), obj);
}

id sub_C0DC(uint64_t a1)
{
  [*(id *)(a1 + 32) hide];
  [*(id *)(a1 + 40) _setDisplayedSpinner:0];
  id v2 = *(void **)(a1 + 48);

  return [v2 setUserInteractionEnabled:1];
}

void sub_C4BC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    CFStringRef v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = v7;
      id v10 = +[PLAccountStore pl_sharedAccountStore];
      char v11 = [v10 cachedPrimaryAppleAccount];
      id v12 = [v11 identifier];
      *(_DWORD *)buf = 138413058;
      __int16 v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      long long v19 = v12;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "<%@: %p> Could not enable photo/shared streams on account %@. Error: %@", buf, 0x2Au);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C668;
  block[3] = &unk_28FE0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_C668(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) parentController];
  [v2 reloadSpecifier:*(void *)(*(void *)(a1 + 32) + OBJC_IVAR___PSViewController__specifier)];
}

void sub_CC3C(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  id v5 = PLUIGetLog();
  CFStringRef v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      id v7 = "[FeaturedContentAllowedToggled] request to reload wallpaper suggestions failed : %@";
      uint64_t v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    id v7 = "[FeaturedContentAllowedToggled] request to reload wallpaper suggestions completed";
    uint64_t v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    uint32_t v10 = 2;
    goto LABEL_6;
  }
}

void sub_D1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_D220(uint64_t a1, const void *a2)
{
  CFPreferencesSetAppValue(*(CFStringRef *)(a1 + 32), a2, @"com.apple.mobileslideshow");
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.PreferenceChanged", 0, 0, 1u);
}

void sub_D280(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
  }
}

void sub_D70C(void *a1, uint64_t a2)
{
  CFStringRef v2 = @"TransferKeepOriginalsOption";
  if (a2 != 1) {
    CFStringRef v2 = 0;
  }
  if (a2) {
    CFStringRef v3 = v2;
  }
  else {
    CFStringRef v3 = @"TransferAutomaticOption";
  }
  id v4 = a1;
  id v6 = [v4 specifierForID:v3];
  id v5 = [v4 specifierForID:@"TransferGroup"];

  [v5 setProperty:v6 forKey:PSRadioGroupCheckedSpecifierKey];
}

void sub_DAA8(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  [*(id *)(a1 + 40) reloadSpecifier:*(void *)(a1 + 32) animated:1];
  CFStringRef v2 = +[MCProfileConnection sharedConnection];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_DBDC;
  v5[3] = &unk_288B0;
  v5[4] = *(void *)(a1 + 40);
  [v2 removeProfileAsyncWithIdentifier:@"com.apple.Photos.Rebuild.iOS" installationType:1 completion:v5];

  CFStringRef v3 = dispatch_get_global_queue(0, 0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_DCCC;
  v4[3] = &unk_28FE0;
  v4[4] = *(void *)(a1 + 40);
  dispatch_async(v3, v4);
}

void sub_DBDC(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    CFStringRef v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412802;
      id v6 = (id)objc_opt_class();
      __int16 v7 = 2114;
      CFStringRef v8 = @"com.apple.Photos.Rebuild.iOS";
      __int16 v9 = 2112;
      id v10 = v2;
      id v4 = v6;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "<%@: error removing profile %{public}@: %@", (uint8_t *)&v5, 0x20u);
    }
  }
}

void sub_DCCC(uint64_t a1)
{
  id v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138412546;
    id v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    id v5 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "<%@: %p> Photos Rebuild started", (uint8_t *)&v9, 0x16u);
  }
  id v6 = objc_alloc((Class)PLPhotoLibraryPathManager);
  __int16 v7 = +[PHPhotoLibrary systemPhotoLibraryURL];
  id v8 = [v6 initWithLibraryURL:v7];

  [v8 setSqliteErrorForRebuildReason:17 allowsExit:1];
}

void sub_E090(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) specifierForID:@"photosDiagnose"];
  if (v6)
  {
    id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    [v6 setProperty:v2 forKey:PSEnabledKey];

    if (*(void *)(a1 + 40))
    {
      CFStringRef v3 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v4 = SFLocalizableWAPIStringKeyForKey();
      id v5 = [v3 localizedStringForKey:v4 value:&stru_29018 table:@"Photos"];
      [v6 setName:v5];
    }
    [*(id *)(a1 + 32) reloadSpecifier:v6];
  }
}

void sub_E358(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412802;
    int v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    id v7 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "<%@: %p> Error running diagnose: %@", (uint8_t *)&v8, 0x20u);
  }
  [*(id *)(a1 + 32) diagnosticServiceStateDidChange:0xFFFFFFFFLL outputURL:0 error:v3];
}

void sub_E454(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = PLUIGetLog();
  int v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      int v18 = 138412546;
      long long v19 = v9;
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      id v11 = v9;
      __int16 v12 = "<%@: %p> Diagnose started";
      id v13 = v8;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_0, v13, v14, v12, (uint8_t *)&v18, v15);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = objc_opt_class();
    uint64_t v17 = *(void *)(a1 + 32);
    int v18 = 138412802;
    long long v19 = v16;
    __int16 v20 = 2048;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    id v23 = v6;
    id v11 = v16;
    __int16 v12 = "<%@: %p> Error starting diagnose: %@";
    id v13 = v8;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 32;
    goto LABEL_6;
  }
}

void sub_E7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_E7FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained diagnosticServiceStateDidChange:0xFFFFFFFFLL outputURL:0 error:0];
}

void sub_EA78(uint64_t a1)
{
  id v2 = +[PLPhotoLibrary systemPhotoLibrary];
  id v3 = [v2 assetsdClient];

  uint64_t v4 = [v3 libraryInternalClient];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_EB48;
  v5[3] = &unk_28E20;
  v5[4] = *(void *)(a1 + 32);
  [v4 deleteiTunesSyncedContentWithCompletionHandler:v5];
}

id sub_EB38(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

void sub_EB48(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_EBC4;
  v2[3] = &unk_28900;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

id *sub_EBC4(id *result)
{
  if (*((unsigned char *)result + 40)) {
    return (id *)[result[4] _enableCloudPhotosWithExitModeWarningIgnoringStorageLimits:0];
  }
  return result;
}

id sub_F03C(uint64_t a1, int a2)
{
  char v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 _setSharedStreamsEnabled:0];
  }
  else {
    return [v3 reloadSpecifier:*(void *)(a1 + 40) animated:1];
  }
}

void sub_F114(uint64_t a1)
{
  [*(id *)(a1 + 32) unregisterAvailabilityObserver:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = *(void **)(v2 + 288);
  *(void *)(v2 + 288) = 0;
}

void sub_F9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_F9F4(void *a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_FB14;
    int v8 = &unk_28900;
    uint64_t v9 = a1[4];
    char v10 = a2;
    px_dispatch_on_main_queue();
  }
  else
  {
    [*(id *)(a1[4] + 304) setCanEnableSharedLibrary:a2];
    if ([*(id *)(a1[4] + OBJC_IVAR___PSListController__specifiers) count])
    {
      char v3 = PXAssertGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_fault_impl(&dword_0, v3, OS_LOG_TYPE_FAULT, "Specifiers are already created, shared library settings will not be updated", v4, 2u);
      }
    }
  }
}

id sub_FB14(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 304) canEnableSharedLibrary];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != result)
  {
    [*(id *)(*(void *)(a1 + 32) + 304) setCanEnableSharedLibrary:v3 != 0];
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 reloadSpecifiers];
  }
  return result;
}

id sub_FDCC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) diagnosticServiceStateDidChange:0xFFFFFFFFLL outputURL:0 error:a2];
}

id sub_FDE0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) diagnosticServiceStateDidChange:a2 outputURL:0 error:0];
}

void sub_10340(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) _isAppleInternal];
  byte_2F6E0 = v2;
  if (v2)
  {
    int v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"PhotosDiagnosticsDisabled"];

    if (v4)
    {
      byte_2F6E0 = 0;
      id v5 = PLUIGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = objc_opt_class();
        uint64_t v7 = *(void *)(a1 + 32);
        int v9 = 138412546;
        char v10 = v6;
        __int16 v11 = 2048;
        uint64_t v12 = v7;
        id v8 = v6;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> Internal Photos diagnostics disabled", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

void sub_10498(id a1)
{
  byte_2F6D0 = os_variant_has_internal_diagnostics();
}

void sub_125F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id location)
{
}

id sub_12950(uint64_t a1, void *a2)
{
  unsigned int v2 = *(void **)(a1 + 32);
  int v3 = [a2 identifier];
  id v4 = [v2 containsObject:v3];

  return v4;
}

id SettingsBaseStringForSwitchValue(int a1)
{
  unsigned int v2 = +[NSBundle bundleForClass:objc_opt_class()];
  int v3 = v2;
  if (a1) {
    CFStringRef v4 = @"On";
  }
  else {
    CFStringRef v4 = @"Off";
  }
  id v5 = [v2 localizedStringForKey:v4 value:&stru_29018 table:@"Photos"];

  return v5;
}

void sub_12C04(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Failed to open Learn More URL %@: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void sub_12DE4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_12F14;
    v8[3] = &unk_28DA8;
    uint64_t v6 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
  else
  {
    int v7 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Failed to pass APGuard check with error: %@", buf, 0xCu);
    }
  }
}

void sub_12F14(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) statusProvider];
  PXSharedLibrarySetupSharedLibraryOrPreview();
}

id sub_12FB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSharedLibrarySpecifiers];
}

void sub_13688(uint64_t a1, unsigned int a2)
{
  if (PXSharedLibraryLocalModeFeatureEnabled())
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = PSEnabledKey;
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:v5];
  }
  else
  {
    if (!*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41) || *(unsigned char *)(a1 + 42))
    {
      uint64_t v6 = 0;
    }
    else if (*(unsigned char *)(a1 + 43))
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = a2;
    }
    id v7 = +[NSNumber numberWithInt:v6];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:PSEnabledKey];
  }
}

void sub_13A5C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  id v10 = objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
  uint64_t v11 = [v10 string];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v11;

  id v20 = v9;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v14 = v20;
  }
  else {
    id v14 = 0;
  }

  uint64_t v15 = *(void *)(a1 + 32);
  __int16 v16 = *(void **)(v15 + 32);
  *(void *)(v15 + 32) = v14;

  if (!*(void *)(*(void *)(a1 + 32) + 32))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = +[NSURL URLWithString:v20];
      uint64_t v18 = *(void *)(a1 + 32);
      long long v19 = *(void **)(v18 + 32);
      *(void *)(v18 + 32) = v17;
    }
  }
  *a5 = 1;
}

void sub_14138(id a1)
{
}

void sub_14E34(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) navigationController];
    id v2 = [v3 popToRootViewControllerAnimated:1];
  }
}

void sub_16024(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id sub_1603C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = [a2 enabled];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_16080(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = a2;
  id v4 = +[NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKeyedSubscript:PSEnabledKey];

  [*(id *)(a1 + 32) reloadSpecifier:v5];
}

void sub_168B0(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 cellType])
  {
    [a1[4] addObject:v3];
    objc_initWeak(&location, a1[5]);
    id v4 = [_MSSCellularDataEnabledInvocation alloc];
    uint64_t v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    uint64_t v8 = sub_169CC;
    id v9 = &unk_28E48;
    objc_copyWeak(&v10, &location);
    id v5 = [(_MSSCellularDataEnabledInvocation *)v4 initWithSpecifier:v3 changeHandler:&v6];
    objc_msgSend(a1[6], "addObject:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void sub_169A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_169CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _validateUnlimitedUpdatesSpecifiers];
}

id sub_17A8C(uint64_t a1, void *a2)
{
  return _[a2 _preferencesDidChange];
}

id sub_17B00(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isViewLoaded];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 reloadSpecifiers];
  }
  return result;
}

void sub_17F40(id *a1)
{
  objc_initWeak(&location, a1[4]);
  id v2 = [a1[4] statusProvider];
  id v3 = [v2 sharedLibrary];

  id v4 = +[PXViewControllerPresenter defaultPresenterWithViewController:a1[4]];
  id v5 = a1[5];
  id v6 = a1[6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_18094;
  v7[3] = &unk_28F90;
  objc_copyWeak(&v10, &location);
  id v8 = a1[5];
  id v9 = a1[6];
  [v3 addParticipantsWithEmailAddresses:v5 phoneNumbers:v6 presentationEnvironment:v4 withCompletion:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void sub_1806C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18094(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id *)(a1 + 48);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleDidAddParticipantsWithEmailAddresses:*(void *)(a1 + 32) phoneNumbers:*(void *)(a1 + 40) success:a2 error:v6];
}

void sub_183E8(id *a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v12)
  {
    [a1[4] setObject:v12 forKeyedSubscript:PSIconImageKey];
    id v9 = [a1[5] specifier];
    id v10 = a1[4];

    if (v9 == v10)
    {
      uint64_t v11 = [a1[6] imageView];
      [v11 setImage:v12];
    }
  }
}

id sub_1923C(id a1, PXSharedLibraryParticipant *a2)
{
  return (id)_PXSharedLibraryAddressForParticipant(a2);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPLStatusFromPathManager()
{
  return _CPLStatusFromPathManager();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return _NSLocalizedFileSizeDescription();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PFStringWithValidatedFormat()
{
  return _PFStringWithValidatedFormat();
}

uint64_t PLCPLAllowsUnlimitedSyncOverCellular()
{
  return _PLCPLAllowsUnlimitedSyncOverCellular();
}

uint64_t PLCPLLocalStorageAvailableForResources()
{
  return _PLCPLLocalStorageAvailableForResources();
}

uint64_t PLCPLShouldRequireStorageUpgradeForError()
{
  return _PLCPLShouldRequireStorageUpgradeForError();
}

uint64_t PLCanEnableCloudPhotoLibraryForAccount()
{
  return _PLCanEnableCloudPhotoLibraryForAccount();
}

uint64_t PLCanEnableSharedStreamsForAccount()
{
  return _PLCanEnableSharedStreamsForAccount();
}

uint64_t PLContentPrivacyUIGetLog()
{
  return _PLContentPrivacyUIGetLog();
}

uint64_t PLDisableCPLIfExited()
{
  return _PLDisableCPLIfExited();
}

uint64_t PLHasInternalUI()
{
  return _PLHasInternalUI();
}

uint64_t PLIsFeaturedContentAllowed()
{
  return _PLIsFeaturedContentAllowed();
}

uint64_t PLLocalizedCountDescription()
{
  return _PLLocalizedCountDescription();
}

uint64_t PLPreferencesGetLog()
{
  return _PLPreferencesGetLog();
}

uint64_t PLRecordiCPLDisableState()
{
  return _PLRecordiCPLDisableState();
}

uint64_t PLRecordiCPLEnableState()
{
  return _PLRecordiCPLEnableState();
}

uint64_t PLSetFeaturedContentAllowed()
{
  return _PLSetFeaturedContentAllowed();
}

uint64_t PLSharedLibraryGetLog()
{
  return _PLSharedLibraryGetLog();
}

uint64_t PLShouldShowSharedLibrarySetting()
{
  return _PLShouldShowSharedLibrarySetting();
}

uint64_t PLUIGetLog()
{
  return _PLUIGetLog();
}

uint64_t PLUserStatusUIGetLog()
{
  return _PLUserStatusUIGetLog();
}

uint64_t PULocalizedString()
{
  return _PULocalizedString();
}

uint64_t PXAssertGetLog()
{
  return _PXAssertGetLog();
}

uint64_t PXCPLNumberOfCalendarDaysUntilDate()
{
  return _PXCPLNumberOfCalendarDaysUntilDate();
}

uint64_t PXHandleErrorAddingParticipants()
{
  return _PXHandleErrorAddingParticipants();
}

uint64_t PXLocalizedSharedLibraryString()
{
  return _PXLocalizedSharedLibraryString();
}

uint64_t PXMap()
{
  return _PXMap();
}

uint64_t PXPreferencesIsCameraAutoShareEnabled()
{
  return _PXPreferencesIsCameraAutoShareEnabled();
}

uint64_t PXPreferencesIsCameraSharingEnabled()
{
  return _PXPreferencesIsCameraSharingEnabled();
}

uint64_t PXPreferencesIsSharedLibraryDeletionNotificationEnabled()
{
  return _PXPreferencesIsSharedLibraryDeletionNotificationEnabled();
}

uint64_t PXPreferencesIsSharedLibrarySuggestionsEnabled()
{
  return _PXPreferencesIsSharedLibrarySuggestionsEnabled();
}

uint64_t PXPreferencesSetCameraAutoShareEnabled()
{
  return _PXPreferencesSetCameraAutoShareEnabled();
}

uint64_t PXPreferencesSetCameraSharingEnabled()
{
  return _PXPreferencesSetCameraSharingEnabled();
}

uint64_t PXSharedLibraryAnnotatedDisplayNameForParticipant()
{
  return _PXSharedLibraryAnnotatedDisplayNameForParticipant();
}

uint64_t PXSharedLibraryCanSetupSharedLibraryOrPreview()
{
  return _PXSharedLibraryCanSetupSharedLibraryOrPreview();
}

uint64_t PXSharedLibraryExitButtonTitle()
{
  return _PXSharedLibraryExitButtonTitle();
}

uint64_t PXSharedLibraryExitSharedLibraryOrPreview()
{
  return _PXSharedLibraryExitSharedLibraryOrPreview();
}

uint64_t PXSharedLibraryHandleInvitationForLocalMode()
{
  return _PXSharedLibraryHandleInvitationForLocalMode();
}

uint64_t PXSharedLibraryLearnMoreString()
{
  return _PXSharedLibraryLearnMoreString();
}

uint64_t PXSharedLibraryLocalModeFeatureEnabled()
{
  return _PXSharedLibraryLocalModeFeatureEnabled();
}

uint64_t PXSharedLibrarySendInvitation()
{
  return _PXSharedLibrarySendInvitation();
}

uint64_t PXSharedLibrarySettingsDescription()
{
  return _PXSharedLibrarySettingsDescription();
}

uint64_t PXSharedLibrarySettingsSubtitle()
{
  return _PXSharedLibrarySettingsSubtitle();
}

uint64_t PXSharedLibrarySettingsSubtitleForParticipant()
{
  return _PXSharedLibrarySettingsSubtitleForParticipant();
}

uint64_t PXSharedLibrarySetupSharedLibraryOrPreview()
{
  return _PXSharedLibrarySetupSharedLibraryOrPreview();
}

uint64_t PXSharedLibraryShouldDisplayInvitation()
{
  return _PXSharedLibraryShouldDisplayInvitation();
}

uint64_t PXSharedLibraryShouldDisplaySettings()
{
  return _PXSharedLibraryShouldDisplaySettings();
}

uint64_t PXSharedLibraryViewInvitation()
{
  return _PXSharedLibraryViewInvitation();
}

uint64_t PXSizeMakeSquare()
{
  return _PXSizeMakeSquare();
}

uint64_t PXSupportsImageModulation()
{
  return _PXSupportsImageModulation();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return _SFLocalizableWAPIStringKeyForKey();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return _UIAccessibilityIsVideoAutoplayEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t px_dispatch_on_main_queue()
{
  return _px_dispatch_on_main_queue();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__beginCloudPhotosDisableFlow(void *a1, const char *a2, ...)
{
  return _[a1 _beginCloudPhotosDisableFlow];
}

id objc_msgSend__beginObservingPhotosAppPrefs(void *a1, const char *a2, ...)
{
  return _[a1 _beginObservingPhotosAppPrefs];
}

id objc_msgSend__cancelDisableCloudPhotos(void *a1, const char *a2, ...)
{
  return _[a1 _cancelDisableCloudPhotos];
}

id objc_msgSend__cellularDataEnabledForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cellularDataEnabledForSpecifier:");
}

id objc_msgSend__confirmWithTitle_message_confirmationButtonTitle_cancelButtonTtle_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_confirmWithTitle:message:confirmationButtonTitle:cancelButtonTtle:completion:");
}

id objc_msgSend__daysUntilExit(void *a1, const char *a2, ...)
{
  return _[a1 _daysUntilExit];
}

id objc_msgSend__emitNavigationEvent(void *a1, const char *a2, ...)
{
  return _[a1 _emitNavigationEvent];
}

id objc_msgSend__enableCloudPhotosWithExitModeWarningIgnoringStorageLimits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableCloudPhotosWithExitModeWarningIgnoringStorageLimits:");
}

id objc_msgSend__fetchBlockedMemoryFeatures(void *a1, const char *a2, ...)
{
  return _[a1 _fetchBlockedMemoryFeatures];
}

id objc_msgSend__fetchDeniedSuggestions(void *a1, const char *a2, ...)
{
  return _[a1 _fetchDeniedSuggestions];
}

id objc_msgSend__fetchMemoriesWithUserFeedback(void *a1, const char *a2, ...)
{
  return _[a1 _fetchMemoriesWithUserFeedback];
}

id objc_msgSend__filterAndConfigureSpecifiers_isAsync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterAndConfigureSpecifiers:isAsync:");
}

id objc_msgSend__formatKeepOriginalsAndOptimizeSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _formatKeepOriginalsAndOptimizeSpecifiers];
}

id objc_msgSend__getPhotosCloudSpaceInBytes(void *a1, const char *a2, ...)
{
  return _[a1 _getPhotosCloudSpaceInBytes];
}

id objc_msgSend__handleDeferredPushIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _handleDeferredPushIdentifier];
}

id objc_msgSend__handleDidAddParticipantsWithEmailAddresses_phoneNumbers_success_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDidAddParticipantsWithEmailAddresses:phoneNumbers:success:error:");
}

id objc_msgSend__hideDisplayedSpinner(void *a1, const char *a2, ...)
{
  return _[a1 _hideDisplayedSpinner];
}

id objc_msgSend__initializeCPLStatusProvider(void *a1, const char *a2, ...)
{
  return _[a1 _initializeCPLStatusProvider];
}

id objc_msgSend__initializeSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _initializeSpecifiers];
}

id objc_msgSend__isAppleInternal(void *a1, const char *a2, ...)
{
  return _[a1 _isAppleInternal];
}

id objc_msgSend__isSettingsPaneInLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSettingsPaneInLocation:");
}

id objc_msgSend__labelForCellularData(void *a1, const char *a2, ...)
{
  return _[a1 _labelForCellularData];
}

id objc_msgSend__needsChangeForSpecifiers_shouldShow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_needsChangeForSpecifiers:shouldShow:");
}

id objc_msgSend__nonLocalResourceInfo(void *a1, const char *a2, ...)
{
  return _[a1 _nonLocalResourceInfo];
}

id objc_msgSend__presentAlertExitModeBeforeCPLEnableWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAlertExitModeBeforeCPLEnableWithCompletion:");
}

id objc_msgSend__removeResetBlacklistedMemoryButton(void *a1, const char *a2, ...)
{
  return _[a1 _removeResetBlacklistedMemoryButton];
}

id objc_msgSend__saveUserAccount(void *a1, const char *a2, ...)
{
  return _[a1 _saveUserAccount];
}

id objc_msgSend__setCameraAutoShareEnabled_enableAutoshare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCameraAutoShareEnabled:enableAutoshare:");
}

id objc_msgSend__setDisplayedSpinner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDisplayedSpinner:");
}

id objc_msgSend__setInteractiveTextSelectionDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInteractiveTextSelectionDisabled:");
}

id objc_msgSend__setSharedStreamsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSharedStreamsEnabled:");
}

id objc_msgSend__settingsDebugOverrideLocation(void *a1, const char *a2, ...)
{
  return _[a1 _settingsDebugOverrideLocation];
}

id objc_msgSend__setupCPLStatus(void *a1, const char *a2, ...)
{
  return _[a1 _setupCPLStatus];
}

id objc_msgSend__setupSharedLibrarySettings(void *a1, const char *a2, ...)
{
  return _[a1 _setupSharedLibrarySettings];
}

id objc_msgSend__sharedLibraryButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 _sharedLibraryButtonTitle];
}

id objc_msgSend__shouldHideCPL(void *a1, const char *a2, ...)
{
  return _[a1 _shouldHideCPL];
}

id objc_msgSend__showSpinnerWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showSpinnerWithText:");
}

id objc_msgSend__shownFromAccountSettings(void *a1, const char *a2, ...)
{
  return _[a1 _shownFromAccountSettings];
}

id objc_msgSend__stopObservingPhotosAppPrefs(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingPhotosAppPrefs];
}

id objc_msgSend__updateAccountCloudPhotoFooterTextAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAccountCloudPhotoFooterTextAnimated:");
}

id objc_msgSend__updateCloudPhotoFooterTextAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCloudPhotoFooterTextAnimated:");
}

id objc_msgSend__updateDiagnoseSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _updateDiagnoseSpecifier];
}

id objc_msgSend__updateKeepOriginalsFooterTextAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateKeepOriginalsFooterTextAnimated:");
}

id objc_msgSend__updatePhotosCloudSpace_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePhotosCloudSpace:error:");
}

id objc_msgSend__updateSharedLibrarySpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _updateSharedLibrarySpecifiers];
}

id objc_msgSend__updateSharedLibrarySpecifiersAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSharedLibrarySpecifiersAnimated:");
}

id objc_msgSend__updateSpecifiersForCPLEnablementChange(void *a1, const char *a2, ...)
{
  return _[a1 _updateSpecifiersForCPLEnablementChange];
}

id objc_msgSend__updateStatusActionLabelForSpecifier_reload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateStatusActionLabelForSpecifier:reload:");
}

id objc_msgSend__updateStatusActionSpecifierVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateStatusActionSpecifierVisibility];
}

id objc_msgSend__useInternalDiagnostics(void *a1, const char *a2, ...)
{
  return _[a1 _useInternalDiagnostics];
}

id objc_msgSend__validateUnlimitedUpdatesSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _validateUnlimitedUpdatesSpecifiers];
}

id objc_msgSend__viewForSpinnerPresentation(void *a1, const char *a2, ...)
{
  return _[a1 _viewForSpinnerPresentation];
}

id objc_msgSend__wantsInstalledPhotosAppSpecificOptions(void *a1, const char *a2, ...)
{
  return _[a1 _wantsInstalledPhotosAppSpecificOptions];
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_actionConfirmationAlertButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 actionConfirmationAlertButtonTitle];
}

id objc_msgSend_actionConfirmationAlertTitle(void *a1, const char *a2, ...)
{
  return _[a1 actionConfirmationAlertTitle];
}

id objc_msgSend_actionTitle(void *a1, const char *a2, ...)
{
  return _[a1 actionTitle];
}

id objc_msgSend_actionViewController(void *a1, const char *a2, ...)
{
  return _[a1 actionViewController];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addParticipantsWithEmailAddresses_phoneNumbers_presentationEnvironment_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addParticipantsWithEmailAddresses:phoneNumbers:presentationEnvironment:withCompletion:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allCloudSharedAlbumsInLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allCloudSharedAlbumsInLibrary:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_applicationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWithBundleIdentifier:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetsCount(void *a1, const char *a2, ...)
{
  return _[a1 assetsCount];
}

id objc_msgSend_assetsdClient(void *a1, const char *a2, ...)
{
  return _[a1 assetsdClient];
}

id objc_msgSend_attributedSubstringFromRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedSubstringFromRange:");
}

id objc_msgSend_authenticateForSubject_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateForSubject:completion:");
}

id objc_msgSend_authenticationType(void *a1, const char *a2, ...)
{
  return _[a1 authenticationType];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _[a1 authorizationStatus];
}

id objc_msgSend_beginFlowWithNavigationController_modally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginFlowWithNavigationController:modally:");
}

id objc_msgSend_beginLoadingForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginLoadingForSpecifier:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_blacklistedFeature(void *a1, const char *a2, ...)
{
  return _[a1 blacklistedFeature];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLRestrictionForFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLRestrictionForFeature:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_buttonIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 buttonIdentifier];
}

id objc_msgSend_bytesNeededToDownloadOriginalResourcesInLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytesNeededToDownloadOriginalResourcesInLibrary:");
}

id objc_msgSend_cachedPrimaryAppleAccount(void *a1, const char *a2, ...)
{
  return _[a1 cachedPrimaryAppleAccount];
}

id objc_msgSend_canEditParticipants(void *a1, const char *a2, ...)
{
  return _[a1 canEditParticipants];
}

id objc_msgSend_canEnableSharedLibrary(void *a1, const char *a2, ...)
{
  return _[a1 canEnableSharedLibrary];
}

id objc_msgSend_cancelLoad(void *a1, const char *a2, ...)
{
  return _[a1 cancelLoad];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _[a1 category];
}

id objc_msgSend_cellType(void *a1, const char *a2, ...)
{
  return _[a1 cellType];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_cgColor(void *a1, const char *a2, ...)
{
  return _[a1 cgColor];
}

id objc_msgSend_changeRequestForMemory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeRequestForMemory:");
}

id objc_msgSend_checkStateWithReplyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkStateWithReplyHandler:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearPendingURL(void *a1, const char *a2, ...)
{
  return _[a1 clearPendingURL];
}

id objc_msgSend_cloudAssetCountPerType(void *a1, const char *a2, ...)
{
  return _[a1 cloudAssetCountPerType];
}

id objc_msgSend_cloudPhotosEnabled(void *a1, const char *a2, ...)
{
  return _[a1 cloudPhotosEnabled];
}

id objc_msgSend_cloudPhotosInExitMode(void *a1, const char *a2, ...)
{
  return _[a1 cloudPhotosInExitMode];
}

id objc_msgSend_cloudPhotosStatus(void *a1, const char *a2, ...)
{
  return _[a1 cloudPhotosStatus];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_configurationByApplyingConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationByApplyingConfiguration:");
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithHierarchicalColor:");
}

id objc_msgSend_configurationWithPaletteColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPaletteColors:");
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_configurationWithWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithWeight:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _[a1 contact];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfAssetsWithRequiredResourcesNotLocallyAvailableInLibrary_outCount_photoCount_videoCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfAssetsWithRequiredResourcesNotLocallyAvailableInLibrary:outCount:photoCount:videoCount:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_deepLinkURL(void *a1, const char *a2, ...)
{
  return _[a1 deepLinkURL];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultPresenterWithViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPresenterWithViewController:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deleteButtonSpecifierWithName_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteButtonSpecifierWithName:target:action:");
}

id objc_msgSend_deleteMemories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMemories:");
}

id objc_msgSend_deleteSuggestions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSuggestions:");
}

id objc_msgSend_deleteiTunesSyncedContentWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteiTunesSyncedContentWithCompletionHandler:");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_diagnoseServiceConnection(void *a1, const char *a2, ...)
{
  return _[a1 diagnoseServiceConnection];
}

id objc_msgSend_diagnosticServiceStateDidChange_outputURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diagnosticServiceStateDidChange:outputURL:error:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableCPL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableCPL:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_emailAddressString(void *a1, const char *a2, ...)
{
  return _[a1 emailAddressString];
}

id objc_msgSend_enableCPL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableCPL:");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_estimatedLibrarySizes(void *a1, const char *a2, ...)
{
  return _[a1 estimatedLibrarySizes];
}

id objc_msgSend_exitDeleteTime(void *a1, const char *a2, ...)
{
  return _[a1 exitDeleteTime];
}

id objc_msgSend_exiting(void *a1, const char *a2, ...)
{
  return _[a1 exiting];
}

id objc_msgSend_failureDescription(void *a1, const char *a2, ...)
{
  return _[a1 failureDescription];
}

id objc_msgSend_fetchBlockedMemoriesWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchBlockedMemoriesWithOptions:");
}

id objc_msgSend_fetchMemoriesWithUserFeedbackWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMemoriesWithUserFeedbackWithOptions:");
}

id objc_msgSend_fetchOptions(void *a1, const char *a2, ...)
{
  return _[a1 fetchOptions];
}

id objc_msgSend_fetchStorageByApp_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchStorageByApp:completion:");
}

id objc_msgSend_fetchSuggestionsWithState_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSuggestionsWithState:withOptions:");
}

id objc_msgSend_filterAndConfigureSpecifiers_shownFromAccountSettings_cloudPhotosEnabled_cplKeepOriginals_isCPLInExitMode_cplDaysUntilExit_shouldHideCPL_shouldHideTransferBehaviors_cloudPhotosPaused_canEnableSharedStreams_cplStatus_cplActionPerformer_showPhotosDiagnoseButton_showPhotosRebuildButton_accountModificationAllowed_isOLEDDevice_wantsPhotosAppSpecificSettings_isLocationBeingOverridden_currentAuthenticationType_systemPolicyOptions_bundleIdentifier_transferBehaviorUserPreference_sharedLibraryInvitationSpecifiers_sharedLibrarySettingsSpecifiers_instanceLogInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterAndConfigureSpecifiers:shownFromAccountSettings:cloudPhotosEnabled:cplKeepOriginals:isCPLInExitMode:cplDaysUntilExit:shouldHideCPL:shouldHideTransferBehaviors:cloudPhotosPaused:canEnableSharedStreams:cplStatus:cplActionPerformer:showPhotosDiagnoseButton:showPhotosRebuildButton:accountModificationAllowed:isOLEDDevice:wantsPhotosAppSpecificSettings:isLocationBeingOverridden:currentAuthenticationType:systemPolicyOptions:bundleIdentifier:transferBehaviorUserPreference:sharedLibraryInvitationSpecifiers:sharedLibrarySettingsSpecifiers:instanceLogInfo:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handlePendingURL(void *a1, const char *a2, ...)
{
  return _[a1 handlePendingURL];
}

id objc_msgSend_hasChangesToProcess(void *a1, const char *a2, ...)
{
  return _[a1 hasChangesToProcess];
}

id objc_msgSend_hasCompletedInitialSync(void *a1, const char *a2, ...)
{
  return _[a1 hasCompletedInitialSync];
}

id objc_msgSend_hasPreview(void *a1, const char *a2, ...)
{
  return _[a1 hasPreview];
}

id objc_msgSend_hasSharedLibrary(void *a1, const char *a2, ...)
{
  return _[a1 hasSharedLibrary];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_hide(void *a1, const char *a2, ...)
{
  return _[a1 hide];
}

id objc_msgSend_iTunesSyncedContentInfo(void *a1, const char *a2, ...)
{
  return _[a1 iTunesSyncedContentInfo];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_imageProvider(void *a1, const char *a2, ...)
{
  return _[a1 imageProvider];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_inResetSync(void *a1, const char *a2, ...)
{
  return _[a1 inResetSync];
}

id objc_msgSend_indexOfSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifier:");
}

id objc_msgSend_indexOfSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifierWithID:");
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndexesInRange:");
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithAppBundleID_account_navigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppBundleID:account:navigationController:");
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArrangedSubviews:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithLibraryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLibraryURL:");
}

id objc_msgSend_initWithLogIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLogIdentifier:");
}

id objc_msgSend_initWithParticipant_sharedLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParticipant:sharedLibrary:");
}

id objc_msgSend_initWithPhotoLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhotoLibrary:");
}

id objc_msgSend_initWithPhotoLibrary_actionManager_presentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhotoLibrary:actionManager:presentationStyle:");
}

id objc_msgSend_initWithPhotoLibraryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhotoLibraryURL:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithSettingsBaseController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSettingsBaseController:");
}

id objc_msgSend_initWithSharedLibraryStatusProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSharedLibraryStatusProvider:");
}

id objc_msgSend_initWithSpecifier_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpecifier:changeHandler:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_insertContiguousSpecifiers_afterSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertContiguousSpecifiers:afterSpecifier:");
}

id objc_msgSend_insertObjects_atIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObjects:atIndexes:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invitation(void *a1, const char *a2, ...)
{
  return _[a1 invitation];
}

id objc_msgSend_invitationSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 invitationSpecifiers];
}

id objc_msgSend_isCloudSharedAlbum(void *a1, const char *a2, ...)
{
  return _[a1 isCloudSharedAlbum];
}

id objc_msgSend_isEnabledForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledForDataclass:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInLocalMode(void *a1, const char *a2, ...)
{
  return _[a1 isInLocalMode];
}

id objc_msgSend_isKeepOriginalsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isKeepOriginalsEnabled];
}

id objc_msgSend_isOwned(void *a1, const char *a2, ...)
{
  return _[a1 isOwned];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return _[a1 isPaused];
}

id objc_msgSend_isReadyForCloudPhotoLibrary(void *a1, const char *a2, ...)
{
  return _[a1 isReadyForCloudPhotoLibrary];
}

id objc_msgSend_isRestoringLibrary(void *a1, const char *a2, ...)
{
  return _[a1 isRestoringLibrary];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_keepOriginals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keepOriginals:");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 leftBarButtonItem];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_libraryInternalClient(void *a1, const char *a2, ...)
{
  return _[a1 libraryInternalClient];
}

id objc_msgSend_librarySpecificFetchOptions(void *a1, const char *a2, ...)
{
  return _[a1 librarySpecificFetchOptions];
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localIdentifier];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedButtonTitle];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_mss_specifiersWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mss_specifiersWithIdentifiers:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_navigateToDestination_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToDestination:completion:");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationEventParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationEventParameters:");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_notificationSettings(void *a1, const char *a2, ...)
{
  return _[a1 notificationSettings];
}

id objc_msgSend_numberOfOtherAssets(void *a1, const char *a2, ...)
{
  return _[a1 numberOfOtherAssets];
}

id objc_msgSend_numberOfPhotoAssets(void *a1, const char *a2, ...)
{
  return _[a1 numberOfPhotoAssets];
}

id objc_msgSend_numberOfVideoAssets(void *a1, const char *a2, ...)
{
  return _[a1 numberOfVideoAssets];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openAndWaitWithUpgrade_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openAndWaitWithUpgrade:error:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_owner(void *a1, const char *a2, ...)
{
  return _[a1 owner];
}

id objc_msgSend_paneTitleLocalizedResource(void *a1, const char *a2, ...)
{
  return _[a1 paneTitleLocalizedResource];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return _[a1 parentController];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _[a1 participants];
}

id objc_msgSend_pathComponentsLocalizedResource(void *a1, const char *a2, ...)
{
  return _[a1 pathComponentsLocalizedResource];
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_performChangesAndWait_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performChangesAndWait:error:");
}

id objc_msgSend_performUserAuthenticationIfNeededWithTitle_passcodeTitle_passcodeSubtitle_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performUserAuthenticationIfNeededWithTitle:passcodeTitle:passcodeSubtitle:completion:");
}

id objc_msgSend_phoneNumberString(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumberString];
}

id objc_msgSend_photoAnalysisClient(void *a1, const char *a2, ...)
{
  return _[a1 photoAnalysisClient];
}

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return _[a1 photoLibrary];
}

id objc_msgSend_photoStreamAlbums(void *a1, const char *a2, ...)
{
  return _[a1 photoStreamAlbums];
}

id objc_msgSend_photosMainPaneLocalizedResource(void *a1, const char *a2, ...)
{
  return _[a1 photosMainPaneLocalizedResource];
}

id objc_msgSend_pl_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pl_sharedAccountStore");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_popToViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToViewController:animated:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presenterForPrivacySplashWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenterForPrivacySplashWithIdentifier:");
}

id objc_msgSend_privacyFlow(void *a1, const char *a2, ...)
{
  return _[a1 privacyFlow];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_provisionedDataclasses(void *a1, const char *a2, ...)
{
  return _[a1 provisionedDataclasses];
}

id objc_msgSend_ps_insertObjectsFromArray_afterObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ps_insertObjectsFromArray:afterObject:");
}

id objc_msgSend_px_addFullBoundsSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_addFullBoundsSubview:");
}

id objc_msgSend_px_alertForCPLEnableError_actionHandler_cancelHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_alertForCPLEnableError:actionHandler:cancelHandler:");
}

id objc_msgSend_px_bundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_bundle");
}

id objc_msgSend_px_deleteITunesContentAlertWithAssetCount_includesPhotos_includesVideos_actionHandler_cancelHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_deleteITunesContentAlertWithAssetCount:includesPhotos:includesVideos:actionHandler:cancelHandler:");
}

id objc_msgSend_px_descriptionForAssertionMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_descriptionForAssertionMessage");
}

id objc_msgSend_px_imageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_imageNamed:");
}

id objc_msgSend_px_insertFooterToolbarWithItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_insertFooterToolbarWithItems:");
}

id objc_msgSend_px_removeFooterToolbar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_removeFooterToolbar");
}

id objc_msgSend_px_screenScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_screenScale");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_recipientPickerViewControllerWithTitle_doneLabel_toLabel_usedAddresses_maxRecipients_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recipientPickerViewControllerWithTitle:doneLabel:toLabel:usedAddresses:maxRecipients:delegate:");
}

id objc_msgSend_registerAvailabilityObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAvailabilityObserver:");
}

id objc_msgSend_registerChangeObserver_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerChangeObserver:context:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:animated:");
}

id objc_msgSend_reloadSpecifierID_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifierID:animated:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_reloadWallpaperSuggestions_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadWallpaperSuggestions:reply:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeProfileAsyncWithIdentifier_installationType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeProfileAsyncWithIdentifier:installationType:completion:");
}

id objc_msgSend_renewCredentialsForAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:completion:");
}

id objc_msgSend_requestForYouWidgetTimelineReloadWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestForYouWidgetTimelineReloadWithError:");
}

id objc_msgSend_requestImageWithTargetSize_displayScale_isRTL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImageWithTargetSize:displayScale:isRTL:completionHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return _[a1 rootController];
}

id objc_msgSend_runDiagnoseWithOptions_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runDiagnoseWithOptions:replyHandler:");
}

id objc_msgSend_saveAccount_withDataclassActions_doVerify_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveAccount:withDataclassActions:doVerify:completion:");
}

id objc_msgSend_serviceAction(void *a1, const char *a2, ...)
{
  return _[a1 serviceAction];
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityLabel:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackButtonDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackButtonDisplayMode:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBlacklistedFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlacklistedFeature:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setCanEnableSharedLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanEnableSharedLibrary:");
}

id objc_msgSend_setCloudPhotosEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudPhotosEnabled:");
}

id objc_msgSend_setCloudPhotosInExitMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudPhotosInExitMode:");
}

id objc_msgSend_setCloudPhotosStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudPhotosStatus:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setControllerLoadAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControllerLoadAction:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCustomSpacing_afterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomSpacing:afterView:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetailControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailControllerClass:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setEnabled_forDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:forDataclass:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFontSize:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setKeepOriginalsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeepOriginalsEnabled:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOwner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOwner:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSelectable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectable:");
}

id objc_msgSend_setShouldIgnoreCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIgnoreCache:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifier:");
}

id objc_msgSend_setSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiers:");
}

id objc_msgSend_setSqliteErrorForRebuildReason_allowsExit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSqliteErrorForRebuildReason:allowsExit:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserFeedback:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_settingsBaseController(void *a1, const char *a2, ...)
{
  return _[a1 settingsBaseController];
}

id objc_msgSend_settingsSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 settingsSpecifiers];
}

id objc_msgSend_shareFromCameraEnabledForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareFromCameraEnabledForSpecifier:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedGuard(void *a1, const char *a2, ...)
{
  return _[a1 sharedGuard];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedLibrary(void *a1, const char *a2, ...)
{
  return _[a1 sharedLibrary];
}

id objc_msgSend_sharedLibraryPaneLocalizedResource(void *a1, const char *a2, ...)
{
  return _[a1 sharedLibraryPaneLocalizedResource];
}

id objc_msgSend_sharedLibraryStatusProviderWithPhotoLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedLibraryStatusProviderWithPhotoLibrary:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_shouldShowCellularDataSettings(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowCellularDataSettings];
}

id objc_msgSend_showController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showController:");
}

id objc_msgSend_showInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showInView:");
}

id objc_msgSend_simulationMode(void *a1, const char *a2, ...)
{
  return _[a1 simulationMode];
}

id objc_msgSend_sourceLibraryInfo(void *a1, const char *a2, ...)
{
  return _[a1 sourceLibraryInfo];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_specifiersForPolicyOptions_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersForPolicyOptions:force:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_stateDescription(void *a1, const char *a2, ...)
{
  return _[a1 stateDescription];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusProvider(void *a1, const char *a2, ...)
{
  return _[a1 statusProvider];
}

id objc_msgSend_storageUsed(void *a1, const char *a2, ...)
{
  return _[a1 storageUsed];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromByteCount:countStyle:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_systemExtraLightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemExtraLightGrayColor];
}

id objc_msgSend_systemFillColor(void *a1, const char *a2, ...)
{
  return _[a1 systemFillColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemLibraryPathManager(void *a1, const char *a2, ...)
{
  return _[a1 systemLibraryPathManager];
}

id objc_msgSend_systemPhotoLibrary(void *a1, const char *a2, ...)
{
  return _[a1 systemPhotoLibrary];
}

id objc_msgSend_systemPhotoLibraryURL(void *a1, const char *a2, ...)
{
  return _[a1 systemPhotoLibraryURL];
}

id objc_msgSend_systemPolicyOptions(void *a1, const char *a2, ...)
{
  return _[a1 systemPolicyOptions];
}

id objc_msgSend_tapToRadarURL(void *a1, const char *a2, ...)
{
  return _[a1 tapToRadarURL];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_transferBehaviorUserPreference(void *a1, const char *a2, ...)
{
  return _[a1 transferBehaviorUserPreference];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unblockPersonsInLibrary_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unblockPersonsInLibrary:completion:");
}

id objc_msgSend_unregisterAvailabilityObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterAvailabilityObserver:");
}

id objc_msgSend_unregisterChangeObserver_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterChangeObserver:context:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAuthenticationTypeImmediately(void *a1, const char *a2, ...)
{
  return _[a1 updateAuthenticationTypeImmediately];
}

id objc_msgSend_updateDiagnoseButtonName_enabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDiagnoseButtonName:enabled:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}