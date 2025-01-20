void sub_4C04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_4C38(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_6238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_625C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained view];
  v6 = [v5 window];

  if (v6)
  {
    uint64_t v7 = *(__int16 *)(a1 + 40);
    id v8 = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = [v8 account];
    uint64_t v10 = +[ICAuthenticationPrompt promptForChangingMode:v7 account:v9];

    v11 = +[ICAuthentication shared];
    id v12 = objc_loadWeakRetained((id *)(a1 + 32));
    v13 = [v12 view];
    v14 = [v13 window];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_6408;
    v16[3] = &unk_1C8A8;
    objc_copyWeak(&v17, (id *)(a1 + 32));
    HIDWORD(v15) = *(_DWORD *)(a1 + 40);
    LODWORD(v15) = HIDWORD(v15);
    int v18 = v15 >> 16;
    [v11 authenticateWithPrompt:v10 displayWindow:v14 completionHandler:v16];

    objc_destroyWeak(&v17);
  }
}

void sub_63F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_6408(uint64_t a1, uint64_t a2)
{
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (a2 == 2 && WeakRetained)
  {
    id v6 = objc_alloc_init((Class)ICInstrumentationUtilitiesRecentPasswordMode);
    [v6 setLockedNotesMode:*(__int16 *)(a1 + 40)];
    [v6 setContextPath:2];
    id v7 = objc_loadWeakRetained(v4);
    id v8 = [v7 account];
    +[ICInstrumentationUtilities addRecentPasswordMode:v6 forAccount:v8];

    v9 = +[ICLockedNotesModeMigrator sharedMigrator];
    id v10 = objc_loadWeakRetained(v4);
    v11 = [v10 account];
    uint64_t v12 = *(__int16 *)(a1 + 42);
    id v13 = objc_loadWeakRetained(v4);
    v14 = [v13 view];
    unint64_t v15 = [v14 window];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_660C;
    v17[3] = &unk_1C880;
    objc_copyWeak(&v18, v4);
    [v9 migrateLockedNotesInAccount:v11 toMode:v12 window:v15 completionHandler:v17];

    objc_destroyWeak(&v18);
  }
  else
  {
    id v16 = objc_loadWeakRetained(v4);
    [v16 reloadSpecifiers];
  }
}

void sub_65F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_660C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained account];
  id v7 = +[ICAuthenticationAlert switchedModeInfoAlertWithAccount:v6];

  id v8 = objc_loadWeakRetained(v4);
  v9 = [v8 view];
  id v10 = [v9 window];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_674C;
  v11[3] = &unk_1C858;
  objc_copyWeak(&v12, v4);
  [v7 presentInWindow:v10 completionHandler:v11];

  objc_destroyWeak(&v12);
}

void sub_6738(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_674C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_689C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_68C0(uint64_t a1, int a2)
{
  v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  id v6 = objc_loadWeakRetained(v4);
  id v27 = v6;
  if (a2 || !WeakRetained)
  {

    if (a2 == 1 && v27)
    {
      id v9 = objc_alloc((Class)ICPasswordChangeViewController);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_6C30;
      v31[3] = &unk_1C8F8;
      objc_copyWeak(&v32, v4);
      id v10 = [v9 initWithCompletionHandler:v31];
      [v10 setIsInSettings:1];
      [v10 setIsSettingInitialPassword:1];
      v11 = [*(id *)(a1 + 32) account];
      [v10 setUpForAddingPasswordWithAccount:v11];

      id v12 = [ICSettingsNavigationController alloc];
      id v13 = objc_loadWeakRetained(v4);
      v14 = [v13 navigationController];
      unint64_t v15 = -[ICSettingsNavigationController initWithRootViewController:supportedInterfaceOrientations:](v12, "initWithRootViewController:supportedInterfaceOrientations:", v10, [v14 supportedInterfaceOrientations]);

      [(ICSettingsNavigationController *)v15 setModalPresentationStyle:2];
      id v16 = objc_loadWeakRetained(v4);
      id v17 = [(ICSettingsNavigationController *)v15 presentationController];
      [v17 setDelegate:v16];

      id v18 = [*(id *)(a1 + 32) navigationController];
      [v18 presentViewController:v15 animated:1 completion:0];

      objc_destroyWeak(&v32);
    }
    else
    {
      id v19 = objc_loadWeakRetained(v4);

      if (a2 == 2 && v19)
      {
        id v20 = objc_loadWeakRetained(v4);
        v21 = [v20 account];
        v22 = +[ICAuthenticationPrompt promptForChangingMode:2 account:v21];

        v23 = +[ICAuthentication shared];
        id v24 = objc_loadWeakRetained(v4);
        v25 = [v24 view];
        v26 = [v25 window];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_6D28;
        v28[3] = &unk_1C920;
        objc_copyWeak(&v29, v4);
        __int16 v30 = 2;
        [v23 authenticateWithPrompt:v22 displayWindow:v26 completionHandler:v28];

        objc_destroyWeak(&v29);
      }
    }
  }
  else
  {
    id v7 = [v6 navigationController];
    id v8 = [v7 popViewControllerAnimated:1];
  }
}

void sub_6C10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_6C30(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained account];
  unsigned int v4 = [v3 hasPassphraseSet];

  if (v4)
  {
    v5 = +[ICAuthentication shared];
    id v6 = objc_loadWeakRetained(v1);
    id v7 = [v6 account];
    [v5 setBiometricsEnabled:1 account:v7];

    id v10 = objc_loadWeakRetained(v1);
    [v10 reloadSpecifiers];
  }
  else
  {
    id v10 = objc_loadWeakRetained(v1);
    id v8 = [v10 navigationController];
    id v9 = [v8 popViewControllerAnimated:1];
  }
}

void sub_6D28(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v2 = *(__int16 *)(a1 + 40);
    id v3 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = [WeakRetained account];
    [v5 setResolvedLockedNotesMode:v2];

    id v6 = objc_loadWeakRetained(v3);
    id v7 = [v6 account];
    id v8 = [v7 managedObjectContext];
    objc_msgSend(v8, "ic_save");

    id v9 = +[ICAuthentication shared];
    id v10 = objc_loadWeakRetained(v3);
    v11 = [v10 account];
    [v9 setBiometricsEnabled:1 account:v11];

    id v14 = objc_loadWeakRetained(v3);
    [v14 reloadSpecifiers];
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)(a1 + 32));
    id v12 = [v14 navigationController];
    id v13 = [v12 popViewControllerAnimated:1];
  }
}

void sub_77C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_77E8(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (a2 == 2 && WeakRetained)
  {
    id v6 = +[ICAuthentication shared];
    id v7 = [*(id *)(a1 + 32) BOOLValue];
    id v8 = objc_loadWeakRetained(v4);
    id v9 = [v8 account];
    [v6 setBiometricsEnabled:v7 account:v9];
  }
  id v10 = objc_loadWeakRetained(v4);
  [v10 reloadSpecifier:*(void *)(a1 + 40)];
}

void sub_7C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7C98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_7CD8(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (a2 == 2 && WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = objc_loadWeakRetained(v4);
    id v8 = [v7 account];
    id v9 = v6;
    id v10 = v8;
    uint64_t v11 = 1;
LABEL_7:
    [v9 setUpForChangePasswordWithAccount:v10 didAuthenticateWithBiometrics:v11];

    id v15 = objc_loadWeakRetained(v4);
    id v14 = [v15 navigationController];
    [v14 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];

    goto LABEL_9;
  }
  id v12 = objc_loadWeakRetained(v4);

  if (a2 == 1 && v12)
  {
    id v13 = *(void **)(a1 + 32);
    id v7 = objc_loadWeakRetained(v4);
    id v8 = [v7 account];
    id v9 = v13;
    id v10 = v8;
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  id v15 = objc_loadWeakRetained(v4);
  [v15 reloadSpecifiers];
LABEL_9:
}

void sub_80D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_80FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_84B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_84DC(uint64_t a1, uint64_t a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained view];
  id v6 = [v5 window];

  if (a2 == 2 && v6)
  {
    id v7 = objc_loadWeakRetained(v3);
    id v8 = [v7 account];
    id v9 = +[ICAuthenticationAlert resetCustomPasswordConfirmationAlertWithAccount:v8];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_8704;
    v16[3] = &unk_1C998;
    objc_copyWeak(&v17, v3);
    [v9 setActionHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_8774;
    v14[3] = &unk_1C998;
    objc_copyWeak(&v15, v3);
    [v9 setDismissHandler:v14];
    id v10 = objc_loadWeakRetained(v3);
    uint64_t v11 = [v10 view];
    id v12 = [v11 window];
    [v9 presentInWindow:v12 completionHandler:0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
  }
  else
  {
    id v13 = objc_loadWeakRetained(v3);
    [v13 reloadSpecifiers];
  }
}

void sub_86DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_8704(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 account];
  [v2 resetCustomPasswordForAccount:v1];
}

void sub_8774(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_88D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_88F4(id *a1, int a2)
{
  if (a2 == 2)
  {
    id v15 = a1 + 6;
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v17 = [WeakRetained account];
    id v3 = +[ICAuthenticationPrompt promptForChangingMode:2 account:v17];

    if ([v3 authenticationAction] != (char *)&dword_0 + 1)
    {
      id v22 = objc_alloc_init((Class)ICInstrumentationUtilitiesRecentPasswordMode);
      [v22 setLockedNotesMode:1];
      [v22 setContextPath:1];
      +[ICInstrumentationUtilities addRecentPasswordMode:v22 forAccount:a1[4]];
      [a1[4] setResolvedLockedNotesMode:2];
      v23 = [a1[4] managedObjectContext];
      objc_msgSend(v23, "ic_save");

      id v24 = +[ICAuthentication shared];
      id v25 = objc_loadWeakRetained(a1 + 6);
      v26 = [v25 account];
      [v24 setBiometricsEnabled:1 account:v26];

      id v27 = objc_loadWeakRetained(v15);
      v28 = [v27 account];
      id v29 = +[ICAuthenticationAlert switchedModeInfoAlertWithAccount:v28];

      id v30 = objc_loadWeakRetained(v15);
      v31 = [v30 view];
      id v32 = [v31 window];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_8EB4;
      v36[3] = &unk_1C858;
      objc_copyWeak(&v37, v15);
      [v29 presentInWindow:v32 completionHandler:v36];

      objc_destroyWeak(&v37);
      goto LABEL_11;
    }
    id v18 = [v3 failureAlerts];
    id v19 = objc_loadWeakRetained(v15);
    id v20 = [v19 view];
    v21 = [v20 window];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_8EF4;
    v34[3] = &unk_1C858;
    v5 = &v35;
    objc_copyWeak(&v35, v15);
    +[ICAuthenticationAlert presentAlertsIfNeeded:v18 window:v21 completionHandler:v34];

LABEL_6:
    objc_destroyWeak(v5);
LABEL_11:

    return;
  }
  if (a2 == 1)
  {
    id v3 = [objc_alloc((Class)ICAccountPassphraseManager) initWithAccount:a1[4]];
    [v3 removePassphrase];
    id v4 = objc_alloc((Class)ICPasswordChangeViewController);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_8DBC;
    v38[3] = &unk_1C8F8;
    v5 = &v39;
    objc_copyWeak(&v39, a1 + 6);
    id v6 = [v4 initWithCompletionHandler:v38];
    [v6 setIsInSettings:1];
    [v6 setIsSettingInitialPassword:1];
    id v7 = [a1[5] account];
    [v6 setUpForAddingPasswordWithAccount:v7];

    id v8 = [ICSettingsNavigationController alloc];
    id v9 = objc_loadWeakRetained(a1 + 6);
    id v10 = [v9 navigationController];
    uint64_t v11 = -[ICSettingsNavigationController initWithRootViewController:supportedInterfaceOrientations:](v8, "initWithRootViewController:supportedInterfaceOrientations:", v6, [v10 supportedInterfaceOrientations]);

    [(ICSettingsNavigationController *)v11 setModalPresentationStyle:2];
    id v12 = objc_loadWeakRetained(a1 + 6);
    id v13 = [(ICSettingsNavigationController *)v11 presentationController];
    [v13 setDelegate:v12];

    id v14 = [a1[5] navigationController];
    [v14 presentViewController:v11 animated:1 completion:0];

    goto LABEL_6;
  }
  id v33 = objc_loadWeakRetained(a1 + 6);
  [v33 reloadSpecifiers];
}

void sub_8D98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_8DBC(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained account];
  unsigned int v4 = [v3 hasPassphraseSet];

  if (v4)
  {
    v5 = +[ICAuthentication shared];
    id v6 = objc_loadWeakRetained(v1);
    id v7 = [v6 account];
    [v5 setBiometricsEnabled:1 account:v7];

    id v10 = objc_loadWeakRetained(v1);
    [v10 reloadSpecifiers];
  }
  else
  {
    id v10 = objc_loadWeakRetained(v1);
    id v8 = [v10 navigationController];
    id v9 = [v8 popViewControllerAnimated:1];
  }
}

void sub_8EB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_8EF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

id sub_94A8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) specifierForAccount:a2];
}

void sub_E3CC(id a1, UIAlertAction *a2)
{
  id v5 = +[ICAppURLUtilities appURLForFolderList];
  id v2 = +[UIApplication sharedApplication];
  unsigned int v3 = [v2 canOpenURL:v5];

  if (v3)
  {
    unsigned int v4 = +[UIApplication sharedApplication];
    [v4 openURL:v5 options:&__NSDictionary0__struct completionHandler:0];
  }
}

id sub_E470(uint64_t a1)
{
  [*(id *)(a1 + 32) deleteLocalAccount];
  +[ICSettingsUtilities setObject:*(void *)(a1 + 40) forKey:@"LocalNotes"];
  id v2 = *(void **)(a1 + 32);

  return [v2 accountsDidChange];
}

void sub_F404(uint64_t a1)
{
  [*(id *)(a1 + 32) setStalenessInterval:0.0];
  id v1 = +[ICNoteContext sharedContext];
  [v1 refreshAll];
}

void sub_F458(void *a1, double a2)
{
  uint64_t v4 = sub_11350();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_11370();
  uint64_t v43 = *(void *)(v8 - 8);
  __chkstk_darwin();
  id v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [a1 specifier];
  if (v11)
  {
    id v44 = v11;
    id v12 = [v11 target];
    if (v12)
    {
      id v13 = v12;
      self;
      id v14 = (void *)swift_dynamicCastObjCClass();
      if (v14)
      {
        id v39 = [v14 navigationItem];
        id v15 = [objc_allocWithZone((Class)UILabel) init];
        id v38 = v15;
        id v16 = self;
        NSString v17 = sub_113A0();
        uint64_t v42 = v8;
        id v18 = v17;
        id v19 = [v16 preferredFontForTextStyle:v17];

        [v15 setFont:v19];
        sub_10B60(&qword_22E40);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1ABD0;
        uint64_t v41 = v5;
        *(void *)(inited + 32) = NSForegroundColorAttributeName;
        uint64_t v21 = self;
        id v40 = v13;
        id v22 = (void *)v21;
        swift_bridgeObjectRetain();
        v23 = NSForegroundColorAttributeName;
        id v24 = [v22 labelColor];
        id v25 = [v24 colorWithAlphaComponent:a2];

        *(void *)(inited + 64) = sub_10D78(0, &qword_22E48);
        *(void *)(inited + 40) = v25;
        sub_FA94(inited, &qword_22E78, &qword_22E80, (uint64_t (*)(uint64_t))sub_105C4);
        id v26 = objc_allocWithZone((Class)NSAttributedString);
        NSString v27 = sub_113A0();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_10D30(&qword_22E50, type metadata accessor for Key);
        Class isa = sub_11390().super.isa;
        swift_bridgeObjectRelease();
        id v29 = [v26 initWithString:v27 attributes:isa];

        id v30 = v38;
        [v38 setAttributedText:v29];

        sub_10D78(0, &qword_22E58);
        v31 = (void *)sub_11400();
        uint64_t v32 = swift_allocObject();
        id v33 = v39;
        *(void *)(v32 + 16) = v39;
        *(void *)(v32 + 24) = v30;
        aBlock[4] = sub_10DF4;
        aBlock[5] = v32;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_FBC4;
        aBlock[3] = &unk_1CBF0;
        v34 = _Block_copy(aBlock);
        id v39 = v33;
        id v35 = v30;
        swift_release();
        sub_11360();
        aBlock[0] = &_swiftEmptyArrayStorage;
        sub_10D30(&qword_22E60, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_10B60(&qword_22E68);
        sub_10E1C(&qword_22E70, &qword_22E68);
        sub_11420();
        sub_11410();

        _Block_release(v34);
        swift_unknownObjectRelease();

        (*(void (**)(char *, uint64_t))(v41 + 8))(v7, v4);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v42);
        return;
      }
      swift_unknownObjectRelease();
    }
    id v36 = v44;
  }
}

unint64_t sub_FA94(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10B60(a2);
  uint64_t v7 = sub_11430();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10E60(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_10CC4(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_FBC4(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_FC08()
{
  return sub_11380();
}

void sub_FCCC()
{
  id v0 = [self sharedApplication];
  sub_11310(v1);
  unsigned int v3 = v2;
  sub_FA94((uint64_t)&_swiftEmptyArrayStorage, &qword_22E30, &qword_22E38, (uint64_t (*)(uint64_t))sub_105C4);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_10D30(&qword_22E28, type metadata accessor for OpenExternalURLOptionsKey);
  Class isa = sub_11390().super.isa;
  swift_bridgeObjectRelease();
  [v0 openURL:v3 options:isa completionHandler:0];
}

id sub_FE5C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    NSString v10 = sub_113A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, "initWithStyle:reuseIdentifier:specifier:", a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_1005C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NotesSettingsPlacardCell()
{
  return self;
}

uint64_t sub_100B8(uint64_t a1, uint64_t a2)
{
  return sub_10238(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100DC(uint64_t a1, uint64_t a2)
{
  return sub_10238(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100FC(uint64_t a1, id *a2)
{
  uint64_t result = sub_113B0();
  *a2 = 0;
  return result;
}

uint64_t sub_10174(uint64_t a1, id *a2)
{
  char v3 = sub_113C0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_101F4@<X0>(void *a1@<X8>)
{
  sub_113D0();
  NSString v2 = sub_113A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10238(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_113D0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1027C()
{
  sub_113D0();
  sub_113E0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_102D0()
{
  sub_113D0();
  sub_11460();
  sub_113E0();
  Swift::Int v0 = sub_11470();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10348()
{
  uint64_t v0 = sub_113D0();
  uint64_t v2 = v1;
  if (v0 == sub_113D0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_11450();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_103D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_113D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10404(uint64_t a1)
{
  uint64_t v2 = sub_10D30(&qword_22E50, type metadata accessor for Key);
  uint64_t v3 = sub_10D30(&qword_22EC8, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_104C0@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_113A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10508(uint64_t a1)
{
  uint64_t v2 = sub_10D30(&qword_22E28, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_10D30((unint64_t *)&unk_22ED0, type metadata accessor for OpenExternalURLOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_105C4(uint64_t a1)
{
  sub_113D0();
  sub_11460();
  sub_113E0();
  Swift::Int v2 = sub_11470();
  swift_bridgeObjectRelease();

  return sub_10658(a1, v2);
}

unint64_t sub_10658(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_113D0();
    uint64_t v8 = v7;
    if (v6 == sub_113D0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_11450();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_113D0();
          uint64_t v15 = v14;
          if (v13 == sub_113D0() && v15 == v16) {
            break;
          }
          char v18 = sub_11450();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_107D0()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_10B60(&qword_22E08);
  uint64_t v24 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  [v1 setSelectionStyle:0];
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v6 = self;
  id v7 = [v6 bundleForClass:ObjCClassFromMetadata];
  NSString v8 = sub_113A0();
  NSString v9 = sub_113A0();
  id v10 = [v7 localizedStringForKey:v8 value:0 table:v9];

  uint64_t v11 = sub_113D0();
  uint64_t v13 = v12;

  id v14 = [v6 bundleForClass:ObjCClassFromMetadata];
  NSString v15 = sub_113A0();
  NSString v16 = sub_113A0();
  id v17 = [v14 localizedStringForKey:v15 value:0 table:v16];

  uint64_t v18 = sub_113D0();
  uint64_t v20 = v19;

  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = v1;
  v21[3] = v11;
  v21[4] = v13;
  uint64_t v25 = v11;
  uint64_t v26 = v13;
  uint64_t v27 = v18;
  uint64_t v28 = v20;
  unint64_t v29 = 0xD000000000000015;
  unint64_t v30 = 0x8000000000016F80;
  v31 = sub_10BE4;
  uint64_t v32 = v21;
  v1;
  swift_bridgeObjectRetain();
  sub_10B60(&qword_22E10);
  sub_10E1C(&qword_22E18, &qword_22E10);
  sub_11330();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_11340();
  v33[3] = v2;
  v33[4] = sub_10E1C(&qword_22E20, &qword_22E08);
  sub_10C4C(v33);
  sub_11320();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v2);
  sub_113F0();
  return swift_release();
}

uint64_t sub_10B60(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10BA4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10BE4(double a1)
{
  sub_F458(*(void **)(v1 + 16), a1);
}

uint64_t sub_10BF0()
{
  return sub_FC08();
}

uint64_t sub_10C04(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_10C4C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

_OWORD *sub_10CC4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_10CE8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10D30(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10D78(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10DB4()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10DF4()
{
  return [*(id *)(v0 + 16) setTitleView:*(void *)(v0 + 24)];
}

uint64_t sub_10E04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10E14()
{
  return swift_release();
}

uint64_t sub_10E1C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10C04(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10E60(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10B60(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10EC4()
{
  return sub_10D30(&qword_22E98, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_10F0C()
{
  return sub_10D30(&qword_22EA0, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_10F54()
{
  return sub_10D30(&qword_22EA8, type metadata accessor for Key);
}

uint64_t sub_10F9C()
{
  return sub_10D30(&qword_22EB0, type metadata accessor for Key);
}

uint64_t sub_10FE4()
{
  return sub_10D30(&qword_22EB8, type metadata accessor for Key);
}

uint64_t sub_1102C()
{
  return sub_10D30(&qword_22EC0, type metadata accessor for OpenExternalURLOptionsKey);
}

void sub_1107C(uint64_t a1, const char *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = NSStringFromSelector(a2);
  sub_4C20();
  sub_4C38(&dword_0, v6, v7, "%@ %@ missing state", v8, v9, v10, v11, v12);
}

void sub_11124(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11190(uint64_t a1, const char *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = NSStringFromSelector(a2);
  sub_4C20();
  sub_4C38(&dword_0, v6, v7, "%@ %@ missing duration", v8, v9, v10, v11, v12);
}

void sub_11238(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_112A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11310(NSURL *retstr@<X8>)
{
}

uint64_t sub_11320()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t sub_11330()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_11340()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_11350()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_11360()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_11370()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_11380()
{
  return SettingsPlacardView<>.init(localizedTitle:localizedSubtitle:applicationBundleIdentifier:updateNavigationTitleAlpha:linkAction:)();
}

NSDictionary sub_11390()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_113A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_113B0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_113C0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_113D0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_113E0()
{
  return String.hash(into:)();
}

uint64_t sub_113F0()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t sub_11400()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_11410()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_11420()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_11430()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_11450()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_11460()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_11470()
{
  return Hasher._finalize()();
}

uint64_t ICCheckedDynamicCast()
{
  return _ICCheckedDynamicCast();
}

uint64_t ICDynamicCast()
{
  return _ICDynamicCast();
}

uint64_t ICInternalSettingsIsSystemPaperEnabled()
{
  return _ICInternalSettingsIsSystemPaperEnabled();
}

uint64_t ICKeyPathFromSelector()
{
  return _ICKeyPathFromSelector();
}

uint64_t ICNotesAppBundleIdentifier()
{
  return _ICNotesAppBundleIdentifier();
}

uint64_t ICSettingsBundleID()
{
  return _ICSettingsBundleID();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __ICAccessibilityStringForVariables()
{
  return ___ICAccessibilityStringForVariables();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

id objc_msgSend_ICTintColor(void *a1, const char *a2, ...)
{
  return _[a1 ICTintColor];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__accountsSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _accountsSpecifiers];
}

id objc_msgSend__appLinksSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _appLinksSpecifiers];
}

id objc_msgSend__appPolicySpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _appPolicySpecifiers];
}

id objc_msgSend__currentNoteSortType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentNoteSortType:");
}

id objc_msgSend__heroPlacardSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _heroPlacardSpecifiers];
}

id objc_msgSend__localAccountSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _localAccountSpecifiers];
}

id objc_msgSend__lockscreenSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _lockscreenSpecifiers];
}

id objc_msgSend__mediaSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _mediaSpecifiers];
}

id objc_msgSend__mentionsSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _mentionsSpecifiers];
}

id objc_msgSend__systemPaperSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _systemPaperSpecifiers];
}

id objc_msgSend__tagsSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _tagsSpecifiers];
}

id objc_msgSend__viewingSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _viewingSpecifiers];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_account_supportsMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:supportsMode:");
}

id objc_msgSend_accountData(void *a1, const char *a2, ...)
{
  return _[a1 accountData];
}

id objc_msgSend_accountGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 accountGroupSpecifier];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _[a1 accountID];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 accountIdentifier];
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return _[a1 accountName];
}

id objc_msgSend_accountSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 accountSpecifiers];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _[a1 accountType];
}

id objc_msgSend_accountsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 accountsDidChange];
}

id objc_msgSend_actionTitle(void *a1, const char *a2, ...)
{
  return _[a1 actionTitle];
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

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraints:");
}

id objc_msgSend_addLocalAccount(void *a1, const char *a2, ...)
{
  return _[a1 addLocalAccount];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOrDeleteLocalAccountIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 addOrDeleteLocalAccountIfNecessary];
}

id objc_msgSend_addRecentPasswordMode_forAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRecentPasswordMode:forAccount:");
}

id objc_msgSend_addSizeConstraint(void *a1, const char *a2, ...)
{
  return _[a1 addSizeConstraint];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allAccounts(void *a1, const char *a2, ...)
{
  return _[a1 allAccounts];
}

id objc_msgSend_allAccountsIncludingThoseInHTMLNoteContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allAccountsIncludingThoseInHTMLNoteContext:");
}

id objc_msgSend_allActiveAccountsInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allActiveAccountsInContext:");
}

id objc_msgSend_allActiveAccountsInContextSortedByAccountType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allActiveAccountsInContextSortedByAccountType:");
}

id objc_msgSend_allowFingerToSwipeFromCornerOrDefaultFallback(void *a1, const char *a2, ...)
{
  return _[a1 allowFingerToSwipeFromCornerOrDefaultFallback];
}

id objc_msgSend_anyCornerGestureAllowsDirectTouches(void *a1, const char *a2, ...)
{
  return _[a1 anyCornerGestureAllowsDirectTouches];
}

id objc_msgSend_appURLForFolderList(void *a1, const char *a2, ...)
{
  return _[a1 appURLForFolderList];
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

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticateWithPrompt_displayWindow_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateWithPrompt:displayWindow:completionHandler:");
}

id objc_msgSend_authenticationAction(void *a1, const char *a2, ...)
{
  return _[a1 authenticationAction];
}

id objc_msgSend_backingStoreForAllowFingerToSwipeFromCorner(void *a1, const char *a2, ...)
{
  return _[a1 backingStoreForAllowFingerToSwipeFromCorner];
}

id objc_msgSend_biometricsEnabledForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "biometricsEnabledForAccount:");
}

id objc_msgSend_biometricsEnrolled(void *a1, const char *a2, ...)
{
  return _[a1 biometricsEnrolled];
}

id objc_msgSend_biometricsGroupFooter(void *a1, const char *a2, ...)
{
  return _[a1 biometricsGroupFooter];
}

id objc_msgSend_biometricsGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 biometricsGroupSpecifier];
}

id objc_msgSend_biometricsSwitchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 biometricsSwitchEnabled];
}

id objc_msgSend_biometricsSwitchSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 biometricsSwitchSpecifier];
}

id objc_msgSend_biometricsSwitchTitle(void *a1, const char *a2, ...)
{
  return _[a1 biometricsSwitchTitle];
}

id objc_msgSend_biometricsType(void *a1, const char *a2, ...)
{
  return _[a1 biometricsType];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomLeftFeature(void *a1, const char *a2, ...)
{
  return _[a1 bottomLeftFeature];
}

id objc_msgSend_bottomLeftTouchTypes(void *a1, const char *a2, ...)
{
  return _[a1 bottomLeftTouchTypes];
}

id objc_msgSend_bottomRightFeature(void *a1, const char *a2, ...)
{
  return _[a1 bottomRightFeature];
}

id objc_msgSend_bottomRightTouchTypes(void *a1, const char *a2, ...)
{
  return _[a1 bottomRightTouchTypes];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_canOpenURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canOpenURL:");
}

id objc_msgSend_chamoisWindowingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 chamoisWindowingEnabled];
}

id objc_msgSend_changeCustomPasswordSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 changeCustomPasswordSpecifier];
}

id objc_msgSend_checkedLockedNotesModeSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 checkedLockedNotesModeSpecifier];
}

id objc_msgSend_clearPersistentContainer(void *a1, const char *a2, ...)
{
  return _[a1 clearPersistentContainer];
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return _[a1 constraints];
}

id objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintsWithVisualFormat:options:metrics:views:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_cornerGestureDefaults(void *a1, const char *a2, ...)
{
  return _[a1 cornerGestureDefaults];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfVisibleNotesInCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfVisibleNotesInCollection:");
}

id objc_msgSend_crossProcessChangeCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 crossProcessChangeCoordinator];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentNoteListSortType(void *a1, const char *a2, ...)
{
  return _[a1 currentNoteListSortType];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _[a1 currentUser];
}

id objc_msgSend_defaultAccountInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultAccountInContext:");
}

id objc_msgSend_defaultAccountWithHTMLNoteContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultAccountWithHTMLNoteContext:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultDateHeadersType(void *a1, const char *a2, ...)
{
  return _[a1 defaultDateHeadersType];
}

id objc_msgSend_defaultStoreSyncIdWithDesiredSyncId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultStoreSyncIdWithDesiredSyncId:");
}

id objc_msgSend_deleteAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAccount:");
}

id objc_msgSend_deleteLocalAccount(void *a1, const char *a2, ...)
{
  return _[a1 deleteLocalAccount];
}

id objc_msgSend_descriptionForNoteListSortType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForNoteListSortType:");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_deviceSupportsSystemPaper(void *a1, const char *a2, ...)
{
  return _[a1 deviceSupportsSystemPaper];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didChooseToMigrate(void *a1, const char *a2, ...)
{
  return _[a1 didChooseToMigrate];
}

id objc_msgSend_disableNotesOnLockScreenIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 disableNotesOnLockScreenIfNecessary];
}

id objc_msgSend_durationSpecifierNamed_duration_group_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationSpecifierNamed:duration:group:");
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_failureAlerts(void *a1, const char *a2, ...)
{
  return _[a1 failureAlerts];
}

id objc_msgSend_findSizeLayoutConstraintIfExists(void *a1, const char *a2, ...)
{
  return _[a1 findSizeLayoutConstraintIfExists];
}

id objc_msgSend_fingerSwipeSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 fingerSwipeSpecifier];
}

id objc_msgSend_firstAttribute(void *a1, const char *a2, ...)
{
  return _[a1 firstAttribute];
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return _[a1 firstItem];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_footerString(void *a1, const char *a2, ...)
{
  return _[a1 footerString];
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_handleFailedAssertWithCondition_functionName_simulateCrash_showAlert_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:");
}

id objc_msgSend_hasMigratedLocalAccountWithNotes(void *a1, const char *a2, ...)
{
  return _[a1 hasMigratedLocalAccountWithNotes];
}

id objc_msgSend_hasMultipleAccounts(void *a1, const char *a2, ...)
{
  return _[a1 hasMultipleAccounts];
}

id objc_msgSend_hasPassphraseSet(void *a1, const char *a2, ...)
{
  return _[a1 hasPassphraseSet];
}

id objc_msgSend_hasSetUpSizeConstraint(void *a1, const char *a2, ...)
{
  return _[a1 hasSetUpSizeConstraint];
}

id objc_msgSend_hasSyncingAccount(void *a1, const char *a2, ...)
{
  return _[a1 hasSyncingAccount];
}

id objc_msgSend_iCloudACAccountWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iCloudACAccountWithIdentifier:");
}

id objc_msgSend_ic_addNonNilObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_addNonNilObject:");
}

id objc_msgSend_ic_addObjectsFromNonNilArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_addObjectsFromNonNilArray:");
}

id objc_msgSend_ic_alwaysShowLightContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_alwaysShowLightContent");
}

id objc_msgSend_ic_didAddObserverForContext_inScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_didAddObserverForContext:inScope:");
}

id objc_msgSend_ic_fontWithSingleLineA(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_fontWithSingleLineA");
}

id objc_msgSend_ic_isDark(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_isDark");
}

id objc_msgSend_ic_isVision(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_isVision");
}

id objc_msgSend_ic_isiPad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_isiPad");
}

id objc_msgSend_ic_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_map:");
}

id objc_msgSend_ic_save(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_save");
}

id objc_msgSend_ic_shouldIgnoreObserveValue_ofObject_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:");
}

id objc_msgSend_ic_submitNavigationEventForIdentifier_titleStringKey_navigationComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_submitNavigationEventForIdentifier:titleStringKey:navigationComponents:");
}

id objc_msgSend_ic_traitsAffectingSizeAndColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_traitsAffectingSizeAndColor");
}

id objc_msgSend_ic_trimmedString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_trimmedString");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_incrementAutoSortSelectionChangeCountForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementAutoSortSelectionChangeCountForState:");
}

id objc_msgSend_indicatorCoverage(void *a1, const char *a2, ...)
{
  return _[a1 indicatorCoverage];
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountID:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCompletionHandler:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithLargeIcons_forPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLargeIcons:forPreferences:");
}

id objc_msgSend_initWithPrivateQueue(void *a1, const char *a2, ...)
{
  return _[a1 initWithPrivateQueue];
}

id objc_msgSend_initWithRootViewController_supportedInterfaceOrientations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:supportedInterfaceOrientations:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isSubscribedToMentionNotificationsForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscribedToMentionNotificationsForAccount:");
}

id objc_msgSend_isTransientUser(void *a1, const char *a2, ...)
{
  return _[a1 isTransientUser];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadAdditionalPersistentStores(void *a1, const char *a2, ...)
{
  return _[a1 loadAdditionalPersistentStores];
}

id objc_msgSend_localAccount(void *a1, const char *a2, ...)
{
  return _[a1 localAccount];
}

id objc_msgSend_localAccountExists(void *a1, const char *a2, ...)
{
  return _[a1 localAccountExists];
}

id objc_msgSend_localAccountHasNotes(void *a1, const char *a2, ...)
{
  return _[a1 localAccountHasNotes];
}

id objc_msgSend_localAccountInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localAccountInContext:");
}

id objc_msgSend_localAccountName(void *a1, const char *a2, ...)
{
  return _[a1 localAccountName];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_localizedTitleForLocalSourceOfDataclass_usedAtBeginningOfSentence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTitleForLocalSourceOfDataclass:usedAtBeginningOfSentence:");
}

id objc_msgSend_lockedNotesMode(void *a1, const char *a2, ...)
{
  return _[a1 lockedNotesMode];
}

id objc_msgSend_lockedNotesModeCustomPasswordSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 lockedNotesModeCustomPasswordSpecifier];
}

id objc_msgSend_lockedNotesModeDevicePasswordSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 lockedNotesModeDevicePasswordSpecifier];
}

id objc_msgSend_lockedNotesModeGroupFooter(void *a1, const char *a2, ...)
{
  return _[a1 lockedNotesModeGroupFooter];
}

id objc_msgSend_lockedNotesModeGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 lockedNotesModeGroupSpecifier];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectContext];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_migrateLockedNotesInAccount_toMode_window_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateLockedNotesInAccount:toMode:window:completionHandler:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_newLocalAccountInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newLocalAccountInContext:");
}

id objc_msgSend_noteDefaultNamedStyle(void *a1, const char *a2, ...)
{
  return _[a1 noteDefaultNamedStyle];
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

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return _[a1 objectID];
}

id objc_msgSend_objectWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectWithID:");
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_persistentStoreURL(void *a1, const char *a2, ...)
{
  return _[a1 persistentStoreURL];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_postAccountDidChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 postAccountDidChangeNotification];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_presentAlertsIfNeeded_window_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAlertsIfNeeded:window:completionHandler:");
}

id objc_msgSend_presentBackwardsCompatibilityAlertIfNeededForAccount_mode_window_confirmHandler_cancelHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentBackwardsCompatibilityAlertIfNeededForAccount:mode:window:confirmHandler:cancelHandler:");
}

id objc_msgSend_presentInWindow_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentInWindow:completionHandler:");
}

id objc_msgSend_presentLockedNotesLearnMoreViewForAccount_window_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentLockedNotesLearnMoreViewForAccount:window:");
}

id objc_msgSend_presentLockedNotesSwitchMigrationPromptIfSupportedForAccount_window_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentLockedNotesSwitchMigrationPromptIfSupportedForAccount:window:completionHandler:");
}

id objc_msgSend_presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount_window_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentLockedNotesWelcomeMigrationPromptIfSupportedForAccount:window:completionHandler:");
}

id objc_msgSend_presentLockedNotesWelcomePrompt(void *a1, const char *a2, ...)
{
  return _[a1 presentLockedNotesWelcomePrompt];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _[a1 presentationController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_promptForChangingMode_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptForChangingMode:account:");
}

id objc_msgSend_promptForIntent_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptForIntent:object:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_refreshAll(void *a1, const char *a2, ...)
{
  return _[a1 refreshAll];
}

id objc_msgSend_refreshBiometricsContext(void *a1, const char *a2, ...)
{
  return _[a1 refreshBiometricsContext];
}

id objc_msgSend_refreshHasPasscode(void *a1, const char *a2, ...)
{
  return _[a1 refreshHasPasscode];
}

id objc_msgSend_registerForTraitChanges(void *a1, const char *a2, ...)
{
  return _[a1 registerForTraitChanges];
}

id objc_msgSend_registerForTraitChanges_withAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTraitChanges:withAction:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:animated:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_reloadTitle(void *a1, const char *a2, ...)
{
  return _[a1 reloadTitle];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removePassphrase(void *a1, const char *a2, ...)
{
  return _[a1 removePassphrase];
}

id objc_msgSend_resetCustomPasswordConfirmationAlertWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetCustomPasswordConfirmationAlertWithAccount:");
}

id objc_msgSend_resetCustomPasswordForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetCustomPasswordForAccount:");
}

id objc_msgSend_resetCustomPasswordGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 resetCustomPasswordGroupSpecifier];
}

id objc_msgSend_resetCustomPasswordInfoAlertWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetCustomPasswordInfoAlertWithAccount:");
}

id objc_msgSend_resetCustomPasswordSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 resetCustomPasswordSpecifier];
}

id objc_msgSend_resolvedLockedNotesMode(void *a1, const char *a2, ...)
{
  return _[a1 resolvedLockedNotesMode];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return _[a1 save];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return _[a1 secondItem];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sessionDuration(void *a1, const char *a2, ...)
{
  return _[a1 sessionDuration];
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackingStoreForAllowFingerToSwipeFromCorner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackingStoreForAllowFingerToSwipeFromCorner:");
}

id objc_msgSend_setBiometricsEnabled_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBiometricsEnabled:account:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBottomLeftFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottomLeftFeature:");
}

id objc_msgSend_setBottomLeftTouchTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottomLeftTouchTypes:");
}

id objc_msgSend_setBottomRightFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottomRightFeature:");
}

id objc_msgSend_setBottomRightTouchTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottomRightTouchTypes:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContextPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextPath:");
}

id objc_msgSend_setCurrentNoteListSortType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentNoteListSortType:");
}

id objc_msgSend_setDefaultDateHeadersType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultDateHeadersType:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDismissHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissHandler:");
}

id objc_msgSend_setFingerSwipeSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFingerSwipeSpecifier:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHasSetUpSizeConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasSetUpSizeConstraint:");
}

id objc_msgSend_setIc_alwaysShowLightContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIc_alwaysShowLightContent:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIndicatorCoverage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorCoverage:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setIsAccessibilityElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAccessibilityElement:");
}

id objc_msgSend_setIsInSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInSettings:");
}

id objc_msgSend_setIsSettingInitialPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSettingInitialPassword:");
}

id objc_msgSend_setLockedNotesMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockedNotesMode:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNoteDefaultNamedStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNoteDefaultNamedStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPersistentStoreURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentStoreURL:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setResolvedLockedNotesMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResolvedLockedNotesMode:");
}

id objc_msgSend_setSessionDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionDuration:");
}

id objc_msgSend_setShowOnLockScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowOnLockScreen:");
}

id objc_msgSend_setSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiers:");
}

id objc_msgSend_setStalenessInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStalenessInterval:");
}

id objc_msgSend_setSubtitleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitleLabel:");
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

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleDictionary:");
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabel:");
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleView:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUpForAddingPasswordWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpForAddingPasswordWithAccount:");
}

id objc_msgSend_setUpForChangePasswordWithAccount_didAuthenticateWithBiometrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpForChangePasswordWithAccount:didAuthenticateWithBiometrics:");
}

id objc_msgSend_setUpHeightConstraintIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 setUpHeightConstraintIfNecessary];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_settingsBundle(void *a1, const char *a2, ...)
{
  return _[a1 settingsBundle];
}

id objc_msgSend_settingsDescriptionForNamedStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsDescriptionForNamedStyle:");
}

id objc_msgSend_setupCrossProcessChangeCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 setupCrossProcessChangeCoordinator];
}

id objc_msgSend_setupNoteContextWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNoteContextWithOptions:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedAccountUtilities(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountUtilities];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedContext];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _[a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedMigrator(void *a1, const char *a2, ...)
{
  return _[a1 sharedMigrator];
}

id objc_msgSend_sharedState(void *a1, const char *a2, ...)
{
  return _[a1 sharedState];
}

id objc_msgSend_shouldAutoConvertToTag(void *a1, const char *a2, ...)
{
  return _[a1 shouldAutoConvertToTag];
}

id objc_msgSend_showOnLockScreen(void *a1, const char *a2, ...)
{
  return _[a1 showOnLockScreen];
}

id objc_msgSend_sizeLayoutAttribute(void *a1, const char *a2, ...)
{
  return _[a1 sizeLayoutAttribute];
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifiersForPolicyOptions_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersForPolicyOptions:force:");
}

id objc_msgSend_springBoardDefaults(void *a1, const char *a2, ...)
{
  return _[a1 springBoardDefaults];
}

id objc_msgSend_springboardDefaults(void *a1, const char *a2, ...)
{
  return _[a1 springboardDefaults];
}

id objc_msgSend_startKeepingAccountInfosUpToDate(void *a1, const char *a2, ...)
{
  return _[a1 startKeepingAccountInfosUpToDate];
}

id objc_msgSend_startSharedContextWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSharedContextWithOptions:");
}

id objc_msgSend_stateIsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateIsSet:");
}

id objc_msgSend_stateSpecifierNamed_isChecked_group_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateSpecifierNamed:isChecked:group:");
}

id objc_msgSend_stateSpecifierNamed_state_group_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateSpecifierNamed:state:group:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabel];
}

id objc_msgSend_supportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return _[a1 supportedInterfaceOrientations];
}

id objc_msgSend_switchedModeInfoAlertWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchedModeInfoAlertWithAccount:");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemPolicy(void *a1, const char *a2, ...)
{
  return _[a1 systemPolicy];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_tableSeparatorLightColor(void *a1, const char *a2, ...)
{
  return _[a1 tableSeparatorLightColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateNotesOnLockScreenWhenAccountSupportingLockScreenAdded(void *a1, const char *a2, ...)
{
  return _[a1 updateNotesOnLockScreenWhenAccountSupportingLockScreenAdded];
}

id objc_msgSend_updateSubscriptionPreferenceForMentionNotifications_forAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSubscriptionPreferenceForMentionNotifications:forAccount:");
}

id objc_msgSend_upgradeToLockNotesInfoAlert(void *a1, const char *a2, ...)
{
  return _[a1 upgradeToLockNotesInfoAlert];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return _[a1 userType];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_visibleNotesIncludingTrashCount(void *a1, const char *a2, ...)
{
  return _[a1 visibleNotesIncludingTrashCount];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}