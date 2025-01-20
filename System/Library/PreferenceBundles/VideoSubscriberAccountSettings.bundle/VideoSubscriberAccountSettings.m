void sub_3974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3988(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)(a1 + 32);
  [v3 setCachedLockupRequests:a2];
  [v3 enqueueEvent:@"AppsDidChange"];
}

void sub_3CD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "id", (void)v14);
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = [v4 copy];
  (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
}

void sub_3EB0(uint64_t a1)
{
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v2 = [*(id *)(a1 + 32) createAccountFooterSpecifier];
  [v6 addObject:v2];

  id v3 = [*(id *)(a1 + 32) createSignOutButtonSpecifier];
  [v6 addObject:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 loadingSpecifier];
  [v4 insertContiguousSpecifiers:v6 afterSpecifier:v5 animated:1];
}

void sub_3FDC(uint64_t a1)
{
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v2 = [*(id *)(a1 + 32) loadingTitleSpecifier];
  [v7 addObject:v2];

  id v3 = [*(id *)(a1 + 32) loadingSpecifier];
  [v7 addObject:v3];

  id v4 = [*(id *)(a1 + 32) createAppSpecifiers];
  id v5 = [v4 count];
  id v6 = *(void **)(a1 + 32);
  if (v5) {
    [v6 replaceContiguousSpecifiers:v7 withSpecifiers:v4 animated:1];
  }
  else {
    [v6 removeContiguousSpecifiers:v7 animated:1];
  }
  [*(id *)(a1 + 32) showMVPDIfNeeded];
  [*(id *)(a1 + 32) setReadyToHandleDeepLinks:1];
}

uint64_t sub_55DC(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 specifierForID:@"AccountUsername"];
    id v5 = [v3 selectSpecifier:v4];
  }
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

uint64_t sub_576C(uint64_t a1, char a2)
{
  if (a2) {
    [*(id *)(a1 + 32) highlightSpecifierWithID:@"AccountUsername"];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t sub_5A2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_621C(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_62F0;
  v5[3] = &unk_14660;
  v5[4] = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_64E0;
  v3[3] = &unk_14598;
  id v4 = *(id *)(a1 + 40);
  [a2 conditionallyUnwrapObject:v5 otherwise:v3];
}

id sub_62F0(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_63A8;
  v4[3] = &unk_14610;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_641C;
  v3[3] = &unk_14638;
  void v3[4] = v5;
  return [a2 unwrapObject:v4 error:v3];
}

id sub_63A8(uint64_t a1)
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Successfully saved account", v4, 2u);
  }

  return [*(id *)(a1 + 32) _setupAppropriateChildViewController];
}

void sub_641C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Failed to save account: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _presentError:v3];
}

id sub_64E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectSelectedProviderAnimated:1];
}

void sub_6664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id sub_67D0(uint64_t a1)
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Did sign out gracefully.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _setupAppropriateChildViewController];
}

void sub_6844(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_BB0C();
  }

  [*(id *)(a1 + 32) _forciblySignOutOfAccount:*(void *)(a1 + 40)];
}

id sub_6B70(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_6BF0;
  v3[3] = &unk_14638;
  v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 unwrapObject:&stru_14718 error:v3];
}

void sub_6BF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((VSErrorIsPublicError() & 1) == 0) {
    [*(id *)(a1 + 32) _presentAlertForError:v3 offeringToDeleteAccount:0];
  }
}

uint64_t sub_6C50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_6DA8()
{
  return VSPerformBlockOnMainThread();
}

id sub_6E18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupAppropriateChildViewController];
}

void sub_6FC0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) result];
  id v3 = [v2 forceUnwrapObject];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_70DC;
  v8[3] = &unk_14790;
  id v4 = *(void **)(a1 + 48);
  v8[4] = *(void *)(a1 + 40);
  id v9 = v4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_7234;
  v6[3] = &unk_146D8;
  int v5 = *(void **)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [v3 unwrapObject:v8 error:v6];
}

void sub_70DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFullySupportedForRequestsExpectingAuthenticationSchemes:0])
  {
    id v4 = [objc_alloc((Class)VSIdentityProviderRequestManager) initWithIdentityProvider:v3];
    [v4 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setRequestManager:v4];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) storage];
    id v7 = +[VSIdentityProviderRequest deleteAccountRequestWithAccount:v5 storage:v6];

    [v4 enqueueRequest:v7];
  }
  else
  {
    uint64_t v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Provider is not fully supported; forcibly signing out.", v11, 2u);
    }

    if (([v3 isDeveloper] & 1) == 0)
    {
      id v9 = [v3 providerID];
      v10 = [v9 forceUnwrapObject];
      +[VSMetricsManagerObjC recordSignOutEventWithProviderIdentifier:v10];
    }
    [*(id *)(a1 + 32) _forciblySignOutOfAccount:*(void *)(a1 + 40)];
  }
}

void sub_7234(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_BB74();
  }

  [*(id *)(a1 + 32) _forciblySignOutOfAccount:*(void *)(a1 + 40)];
}

void sub_73DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7404(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v1 _startSigningOutOfAccount:v2 withAccountInfoViewController:WeakRetained];
}

uint64_t sub_7714(uint64_t a1)
{
  return 1;
}

void sub_78D4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = [*(id *)(a1 + 32) forceUnwrapObject];
    id v3 = +[VSViewControllerFactory sharedFactory];
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_7A4C;
    id v13 = &unk_14740;
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = v2;
    id v4 = v2;
    uint64_t v5 = [v3 viewControllerToConfirmAccountDeletionForAccount:v4 preferredStyle:0 confirmationHandler:&v10];
    id v6 = objc_msgSend(v5, "forceUnwrapObject", v10, v11, v12, v13, v14);

    id v7 = [*(id *)(a1 + 48) recoveryButton];
    uint64_t v8 = [v6 popoverPresentationController];
    [v8 setSourceView:v7];
    [v7 bounds];
    objc_msgSend(v8, "setSourceRect:");
    [*(id *)(a1 + 40) presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    id v9 = *(void **)(a1 + 40);
    [v9 _setupAppropriateChildViewController];
  }
}

void sub_7A4C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) storage];
  id v3 = [v2 channelsCenter];
  [v3 _removeSavedAccountChannelsWithCompletionHandler:0];

  id v4 = [v2 privacyFacade];
  [v4 reset];

  uint64_t v5 = [v2 accountStore];
  uint64_t v8 = *(void *)(a1 + 40);
  id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7B84;
  v7[3] = &unk_14768;
  v7[4] = *(void *)(a1 + 32);
  [v5 removeAccounts:v6 withCompletionHandler:v7];
}

uint64_t sub_7B84()
{
  return VSPerformBlockOnMainThread();
}

id sub_7BF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupAppropriateChildViewController];
}

void sub_7E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7E2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7E3C(uint64_t a1)
{
}

void sub_7E44(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) result];
  id v3 = [v2 forceUnwrapObject];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7F48;
  v7[3] = &unk_14858;
  id v4 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7F5C;
  v5[3] = &unk_146D8;
  v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  [v3 unwrapObject:v7 error:v5];
}

id sub_7F48(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setIdentityProvider:a2];
}

void sub_7F5C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = +[VSOptional optionalWithObject:v3];
  [v2 _presentError:v4 withAccount:v5];
}

void sub_822C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v23 - 104));
  objc_destroyWeak((id *)(v23 - 96));
  objc_destroyWeak((id *)(v23 - 88));
  _Unwind_Resume(a1);
}

void sub_827C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained isFinished])
  {
    uint64_t v3 = objc_loadWeakRetained((id *)(a1 + 64));
    id v4 = objc_loadWeakRetained((id *)(a1 + 72));
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = sub_7E2C;
    v24[4] = sub_7E3C;
    id v25 = 0;
    id v5 = [v3 result];
    id v6 = [v5 forceUnwrapObject];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_863C;
    v23[3] = &unk_148A8;
    v23[4] = v24;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_864C;
    v22[3] = &unk_148D0;
    v22[4] = *(void *)(a1 + 48);
    [v6 unwrapObject:v23 error:v22];

    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_7E2C;
    v20[4] = sub_7E3C;
    id v21 = 0;
    id v7 = [v4 result];
    uint64_t v8 = [v7 forceUnwrapObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_86BC;
    v19[3] = &unk_148F8;
    v19[4] = v20;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_86CC;
    v18[3] = &unk_148D0;
    v18[4] = *(void *)(a1 + 48);
    [v8 unwrapObject:v19 error:v18];

    id v9 = [*(id *)(a1 + 32) result];
    v10 = [v9 forceUnwrapObject];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_873C;
    v13[3] = &unk_14920;
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = v24;
    long long v16 = v20;
    uint64_t v17 = v11;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_88DC;
    v12[3] = &unk_14638;
    v12[4] = v14;
    [v10 unwrapObject:v13 error:v12];

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v24, 8);
  }
  else
  {
    [WeakRetained cancel];
    uint64_t v3 = VSPrivateError();
    id v4 = VSPublicError();
    [*(id *)(a1 + 40) _presentError:v4];
  }
}

void sub_860C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_863C(uint64_t a1, void *a2)
{
}

void sub_864C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_BC44();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_86BC(uint64_t a1, void *a2)
{
}

void sub_86CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_BCAC();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_873C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)VSIdentityProviderFilter);
  [v4 setAllIdentityProviders:v3];

  uint64_t v5 = [v4 filteredIdentityProviders];
  if ([v5 count]
    && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = +[VSViewControllerFactory sharedFactory];
    id v7 = [v6 identityProviderPickerViewControllerWithIdentityProviders:v5];
    uint64_t v8 = [v7 forceUnwrapObject];

    [v8 setCancellationAllowed:1];
    [v8 setDelegate:*(void *)(a1 + 32)];
    [v8 setAllStorefronts:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [v8 setRequestedStorefrontCountryCode:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) defaultToDeveloperProviders:1];
    id v9 = *(void **)(a1 + 32);
    v10 = [v8 searchController];
    [v9 _updateChildViewController:v8 searchController:v10 rightBarButtonItem:0];
  }
  else
  {
    uint64_t v11 = VSErrorLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_BD14(v5, a1, v11);
    }

    uint64_t v8 = VSPublicUnsupportedProviderError();
    [*(id *)(a1 + 32) _presentError:v8];
  }
}

void sub_88DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_BCAC();
  }

  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = VSPublicUnsupportedProviderError();
  [v5 _presentError:v6];
}

id sub_8A3C(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_8AF4;
  v4[3] = &unk_14970;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8C10;
  v3[3] = &unk_14638;
  void v3[4] = v5;
  return [a2 unwrapObject:v4 error:v3];
}

void sub_8AF4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 count])
  {
    id v4 = [v2 firstObject];
    id v3 = v4;
    VSPerformBlockOnMainThread();
  }
  else
  {
    VSPerformBlockOnMainThread();
  }
}

id sub_8BFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentAccountsViewController:*(void *)(a1 + 40)];
}

id sub_8C08(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentIdentityProvidersViewController];
}

void sub_8C10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  VSPerformBlockOnMainThread();
}

id sub_8CA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentError:*(void *)(a1 + 40)];
}

void sub_9B68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentChildViewController];
  [v2 handleDestination:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_9DB0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_9F68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_9F84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained presenterViewController];
  id v4 = [objc_alloc((Class)AMSUIAuthenticateTask) initWithRequest:*(void *)(a1 + 32) presentingViewController:v3];
  uint64_t v5 = [v4 performAuthentication];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_A070;
  v6[3] = &unk_149C0;
  id v7 = *(id *)(a1 + 40);
  [v5 addFinishBlock:v6];
}

void sub_A070(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    a2;
    id v6 = VSErrorLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_BDE0((uint64_t)v5, v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void, void *, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, 0);
  }
}

void sub_A214(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_A230(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained presenterViewController];
  id v4 = [objc_alloc((Class)AMSUIAlertDialogTask) initWithRequest:*(void *)(a1 + 32) presentingViewController:v3];
  id v5 = [v4 present];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_A31C;
  v6[3] = &unk_14A10;
  id v7 = *(id *)(a1 + 40);
  [v5 addFinishBlock:v6];
}

void sub_A31C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    a2;
    id v6 = VSErrorLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_BE58((uint64_t)v5, v6);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void, void *, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, 0);
  }
}

void sub_B838(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) view];
  [v6 setUserInteractionEnabled:1];

  if (a2)
  {
    id v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 40) destination];
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Handled destination: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_BF48(a1, v5, v7);
    }
  }

  [*(id *)(a1 + 40) finishExecutionIfPossible];
}

void sub_BB0C()
{
  sub_9DCC();
  sub_9DB0(&dword_0, v0, v1, "Failed to nicely remove provider: %@", v2, v3, v4, v5, v6);
}

void sub_BB74()
{
  sub_9DCC();
  sub_9DB0(&dword_0, v0, v1, "Error fetching identity provider to sign out: %@", v2, v3, v4, v5, v6);
}

void sub_BBDC()
{
  sub_9DCC();
  sub_9DB0(&dword_0, v0, v1, "Will present alert for error: %@", v2, v3, v4, v5, v6);
}

void sub_BC44()
{
  sub_9DCC();
  sub_9DB0(&dword_0, v0, v1, "VSStorefrontCodeLoadOperation returned error: %@", v2, v3, v4, v5, v6);
}

void sub_BCAC()
{
  sub_9DCC();
  sub_9DB0(&dword_0, v0, v1, "VSAMSStorefrontFetchAllOperation returned error: %@", v2, v3, v4, v5, v6);
}

void sub_BD14(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = [a1 count];
  uint64_t v6 = *(void *)(a2 + 48);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a2 + 40) + 8) + 40);
  id v8 = [*(id *)(*(void *)(v6 + 8) + 40) count];
  int v9 = 134218498;
  id v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2048;
  id v14 = v8;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Failed to meet criteria to show picker UI: %tu, %@, %tu", (uint8_t *)&v9, 0x20u);
}

void sub_BDE0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "VSASDDialogObserver - Error presenting AMS Auth dialog -- error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_BE58(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "VSASDDialogObserver - Error presenting AMS Dialog - error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_BED0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Button pressed during state %@", (uint8_t *)&v2, 0xCu);
}

void sub_BF48(uint64_t a1, void *a2, NSObject *a3)
{
  id v5 = [*(id *)(a1 + 40) destination];
  uint64_t v6 = [v5 description];
  uint64_t v7 = [a2 debugDescription];
  int v8 = 138412546;
  int v9 = v6;
  __int16 v10 = 2112;
  __int16 v11 = v7;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Failed to handle destination: %@, error: %@", (uint8_t *)&v8, 0x16u);
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

uint64_t VSAlertForError()
{
  return _VSAlertForError();
}

uint64_t VSAppSettingsSectionLocalizedTitle()
{
  return _VSAppSettingsSectionLocalizedTitle();
}

uint64_t VSDefaultLogObject()
{
  return _VSDefaultLogObject();
}

uint64_t VSDestinationError()
{
  return _VSDestinationError();
}

uint64_t VSDestinationFromResourceDictionary()
{
  return _VSDestinationFromResourceDictionary();
}

uint64_t VSEnqueueCompletionOperation()
{
  return _VSEnqueueCompletionOperation();
}

uint64_t VSErrorIsPrivateError()
{
  return _VSErrorIsPrivateError();
}

uint64_t VSErrorIsPublicError()
{
  return _VSErrorIsPublicError();
}

uint64_t VSErrorLogObject()
{
  return _VSErrorLogObject();
}

uint64_t VSMainConcurrencyBindingOptions()
{
  return _VSMainConcurrencyBindingOptions();
}

uint64_t VSMainThreadOperationWithBlock()
{
  return _VSMainThreadOperationWithBlock();
}

uint64_t VSOpenURL()
{
  return _VSOpenURL();
}

uint64_t VSPerformBlockOnMainThread()
{
  return _VSPerformBlockOnMainThread();
}

uint64_t VSPrivateAccountLoadingErrorWithRecoveryHandler()
{
  return _VSPrivateAccountLoadingErrorWithRecoveryHandler();
}

uint64_t VSPrivateError()
{
  return _VSPrivateError();
}

uint64_t VSPublicError()
{
  return _VSPublicError();
}

uint64_t VSPublicUnsupportedProviderError()
{
  return _VSPublicUnsupportedProviderError();
}

uint64_t VSRequireMainThread()
{
  return _VSRequireMainThread();
}

uint64_t VSUserInfoForErrorRecoveryOptions()
{
  return _VSUserInfoForErrorRecoveryOptions();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__loadAppropriateChildViewController(void *a1, const char *a2, ...)
{
  return [a1 _loadAppropriateChildViewController];
}

id objc_msgSend__removeCurrentChildViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _removeCurrentChildViewControllerIfNecessary];
}

id objc_msgSend__setupAppropriateChildViewController(void *a1, const char *a2, ...)
{
  return [a1 _setupAppropriateChildViewController];
}

id objc_msgSend_accessibilityHint(void *a1, const char *a2, ...)
{
  return [a1 accessibilityHint];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_accessibilityValue(void *a1, const char *a2, ...)
{
  return [a1 accessibilityValue];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return [a1 accessoryView];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountInfoViewControllerDidShowMVPDAppInstallPrompt(void *a1, const char *a2, ...)
{
  return [a1 accountInfoViewControllerDidShowMVPDAppInstallPrompt];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_activateConstraints(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return [a1 adamID];
}

id objc_msgSend_appSections(void *a1, const char *a2, ...)
{
  return [a1 appSections];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_appStoreRoomURL(void *a1, const char *a2, ...)
{
  return [a1 appStoreRoomURL];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_cachedLockupRequests(void *a1, const char *a2, ...)
{
  return [a1 cachedLockupRequests];
}

id objc_msgSend_cachedRequest(void *a1, const char *a2, ...)
{
  return [a1 cachedRequest];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_channelsCenter(void *a1, const char *a2, ...)
{
  return [a1 channelsCenter];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createAccountFooterSpecifier(void *a1, const char *a2, ...)
{
  return [a1 createAccountFooterSpecifier];
}

id objc_msgSend_createAppSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 createAppSpecifiers];
}

id objc_msgSend_createConstraints(void *a1, const char *a2, ...)
{
  return [a1 createConstraints];
}

id objc_msgSend_createDecidedSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 createDecidedSpecifiers];
}

id objc_msgSend_createHeaderSpecifier(void *a1, const char *a2, ...)
{
  return [a1 createHeaderSpecifier];
}

id objc_msgSend_createLoadingSpecifier(void *a1, const char *a2, ...)
{
  return [a1 createLoadingSpecifier];
}

id objc_msgSend_createLoadingTitleSpecifier(void *a1, const char *a2, ...)
{
  return [a1 createLoadingTitleSpecifier];
}

id objc_msgSend_createLockupRequests(void *a1, const char *a2, ...)
{
  return [a1 createLockupRequests];
}

id objc_msgSend_createSignOutButtonSpecifier(void *a1, const char *a2, ...)
{
  return [a1 createSignOutButtonSpecifier];
}

id objc_msgSend_currentChildViewController(void *a1, const char *a2, ...)
{
  return [a1 currentChildViewController];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentOperation(void *a1, const char *a2, ...)
{
  return [a1 currentOperation];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_decidedLockupSubtitle(void *a1, const char *a2, ...)
{
  return [a1 decidedLockupSubtitle];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultRestrictionsCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultRestrictionsCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_dialogObserver(void *a1, const char *a2, ...)
{
  return [a1 dialogObserver];
}

id objc_msgSend_disableAccountSignOutButton(void *a1, const char *a2, ...)
{
  return [a1 disableAccountSignOutButton];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayPrivacySwitchIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 displayPrivacySwitchIfNeeded];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_facade(void *a1, const char *a2, ...)
{
  return [a1 facade];
}

id objc_msgSend_filteredIdentityProviders(void *a1, const char *a2, ...)
{
  return [a1 filteredIdentityProviders];
}

id objc_msgSend_finishExecutionIfPossible(void *a1, const char *a2, ...)
{
  return [a1 finishExecutionIfPossible];
}

id objc_msgSend_firstAccountIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 firstAccountIfLoaded];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_forceDSIDlessInstall(void *a1, const char *a2, ...)
{
  return [a1 forceDSIDlessInstall];
}

id objc_msgSend_forceUnwrapObject(void *a1, const char *a2, ...)
{
  return [a1 forceUnwrapObject];
}

id objc_msgSend_group(void *a1, const char *a2, ...)
{
  return [a1 group];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_id(void *a1, const char *a2, ...)
{
  return [a1 id];
}

id objc_msgSend_identityProvider(void *a1, const char *a2, ...)
{
  return [a1 identityProvider];
}

id objc_msgSend_identityProviderDisplayName(void *a1, const char *a2, ...)
{
  return [a1 identityProviderDisplayName];
}

id objc_msgSend_identityProviderID(void *a1, const char *a2, ...)
{
  return [a1 identityProviderID];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_isDecided(void *a1, const char *a2, ...)
{
  return [a1 isDecided];
}

id objc_msgSend_isDeveloper(void *a1, const char *a2, ...)
{
  return [a1 isDeveloper];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return [a1 isExecuting];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isReadyToHandleDeepLinks(void *a1, const char *a2, ...)
{
  return [a1 isReadyToHandleDeepLinks];
}

id objc_msgSend_isSynchronizable(void *a1, const char *a2, ...)
{
  return [a1 isSynchronizable];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leadingMargin(void *a1, const char *a2, ...)
{
  return [a1 leadingMargin];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadingSpecifier(void *a1, const char *a2, ...)
{
  return [a1 loadingSpecifier];
}

id objc_msgSend_loadingTitle(void *a1, const char *a2, ...)
{
  return [a1 loadingTitle];
}

id objc_msgSend_loadingTitleSpecifier(void *a1, const char *a2, ...)
{
  return [a1 loadingTitleSpecifier];
}

id objc_msgSend_loadingViewController(void *a1, const char *a2, ...)
{
  return [a1 loadingViewController];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedButtonTitle];
}

id objc_msgSend_lockup(void *a1, const char *a2, ...)
{
  return [a1 lockup];
}

id objc_msgSend_lockupView(void *a1, const char *a2, ...)
{
  return [a1 lockupView];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_onboardingInfoCenter(void *a1, const char *a2, ...)
{
  return [a1 onboardingInfoCenter];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_optionalIdentityProviderDisplayName(void *a1, const char *a2, ...)
{
  return [a1 optionalIdentityProviderDisplayName];
}

id objc_msgSend_performAuthentication(void *a1, const char *a2, ...)
{
  return [a1 performAuthentication];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presenterViewController(void *a1, const char *a2, ...)
{
  return [a1 presenterViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_privacyFacade(void *a1, const char *a2, ...)
{
  return [a1 privacyFacade];
}

id objc_msgSend_privacyState(void *a1, const char *a2, ...)
{
  return [a1 privacyState];
}

id objc_msgSend_privacySwitch(void *a1, const char *a2, ...)
{
  return [a1 privacySwitch];
}

id objc_msgSend_privateQueue(void *a1, const char *a2, ...)
{
  return [a1 privateQueue];
}

id objc_msgSend_providerID(void *a1, const char *a2, ...)
{
  return [a1 providerID];
}

id objc_msgSend_recoveryButton(void *a1, const char *a2, ...)
{
  return [a1 recoveryButton];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_restrictionsCenter(void *a1, const char *a2, ...)
{
  return [a1 restrictionsCenter];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_revokeVoucher(void *a1, const char *a2, ...)
{
  return [a1 revokeVoucher];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return [a1 searchController];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return [a1 sharedFactory];
}

id objc_msgSend_shouldDisplayPrivacySwitch(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayPrivacySwitch];
}

id objc_msgSend_shouldShowMVPDAppInstallPrompt(void *a1, const char *a2, ...)
{
  return [a1 shouldShowMVPDAppInstallPrompt];
}

id objc_msgSend_showMVPDIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 showMVPDIfNeeded];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return [a1 stateMachine];
}

id objc_msgSend_stopListening(void *a1, const char *a2, ...)
{
  return [a1 stopListening];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return [a1 storage];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topMargin(void *a1, const char *a2, ...)
{
  return [a1 topMargin];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_trailingMargin(void *a1, const char *a2, ...)
{
  return [a1 trailingMargin];
}

id objc_msgSend_updateCellHeight(void *a1, const char *a2, ...)
{
  return [a1 updateCellHeight];
}

id objc_msgSend_updateConstraintsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateConstraintsIfNeeded];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return [a1 viewModel];
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return [a1 visibleViewController];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}