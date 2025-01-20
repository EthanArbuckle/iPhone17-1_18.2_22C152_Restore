void sub_34F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3518(uint64_t a1)
{
  v2 = ENUILogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = (id)objc_opt_class();
    id v3 = v7;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Done adding a region", buf, 0xCu);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3670;
  v4[3] = &unk_2C6A0;
  v4[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 40));
  +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v4];
  objc_destroyWeak(&v5);
}

void sub_3654(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_3670(uint64_t a1)
{
  v2 = ENUILogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v3 = v7;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Done refreshing regions", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifiers];
  id v5 = [WeakRetained presentedViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

void sub_3C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3C90(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    int v6 = ENUILogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1CE64();
    }
  }
  [*(id *)(a1 + 32) setEnableDeleteButton:a2];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

id sub_3D14(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_3D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLastKnownStatus:a3];
}

id sub_4538(uint64_t a1, void *a2)
{
  id result = [a2 count];
  if (result)
  {
    +[ENUITitleWithCountCell addCount:result toSpecifier:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    return [v4 reloadSpecifier:v5];
  }
  return result;
}

id sub_4844(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteExposureLog];
}

void sub_4910(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_4934(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  int v6 = ENUILogForCategory();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Delete exposure checks completed", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1CEE8((uint64_t)v5, v7);
  }

  v8 = [*(id *)(a1 + 32) store];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_4A88;
  v11[3] = &unk_2C7F8;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 32);
  id v12 = v9;
  uint64_t v13 = v10;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  [v8 fetchExposureLogsExistWithCompletion:v11];

  objc_destroyWeak(&v14);
}

void sub_4A74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_4A88(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    int v6 = ENUILogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1CF60();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setEnableDeleteButton:a2];
  [WeakRetained reloadSpecifiers];
}

void sub_4DB0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4E98;
    v8[3] = &unk_2C848;
    int v6 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
  else
  {
    id v7 = ENUILogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1D064();
    }
  }
}

id sub_4E98(uint64_t a1)
{
  uint64_t v2 = ENUILogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1D0E8(a1, v2);
  }

  return [*(id *)(a1 + 32) _showControllerForSpecifier:*(void *)(a1 + 40)];
}

id sub_5194(id a1)
{
  return a1;
}

void sub_51B8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_52F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_530C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshRegionsAndReloadSpecifiers];
  uint64_t v1 = +[UIApplication sharedApplication];
  id v2 = [v1 applicationState];

  if (v2)
  {
    id v3 = [WeakRetained navigationController];
    id v4 = [v3 popToViewController:WeakRetained animated:0];
  }
}

void sub_56C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_56EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshRegionsAndReloadSpecifiers];
}

void sub_5C74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 112));
  _Unwind_Resume(a1);
}

void sub_5CE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = +[NSDate date];
  [WeakRetained setLastRegionRefreshDate:v2];

  id v3 = [WeakRetained adapter];
  objc_msgSend(WeakRetained, "setLastKnownStatus:", objc_msgSend(v3, "exposureNotificationStatus"));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_5D7C(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setLatestNotification:v4];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_5DEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = ENUILogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1D184();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsExtraLoggingEnabled:", objc_msgSend(v5, "BOOLValue"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_5E90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = ENUILogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1D1EC();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = [v5 firstObject];
  [WeakRetained setLatestExposureCheckSession:v9];

  uint64_t v10 = [WeakRetained latestExposureCheckSession];
  v11 = [v10 date];
  [WeakRetained setLastExposureCheckTime:v11];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_5F78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = ENUILogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1D254();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsWeeklySummaryEnabled:", objc_msgSend(v5, "BOOLValue"));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_601C(uint64_t a1)
{
}

void sub_6024(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsDataLoaded:1];
  [WeakRetained reloadSpecifiers];
  if ([*(id *)(a1 + 32) shouldShowTurndownScreen])
  {
    uint64_t v2 = +[ENUIViewControllerFactory sharedInstance];
    id v3 = [v2 createTurndownStackWithEnteredFromMainScreen:1 completion:&stru_2C950];

    [*(id *)(a1 + 32) presentViewController:v3 animated:1 completion:0];
  }
}

void sub_69D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_6A54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained presentedViewController];
    [v2 dismissViewControllerAnimated:1 completion:0];

    id WeakRetained = v3;
  }
}

void sub_6AB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained presentedViewController];
    [v2 dismissViewControllerAnimated:1 completion:0];

    id WeakRetained = v3;
  }
}

void sub_6B1C(uint64_t a1)
{
  uint64_t v2 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  id v3 = v2;
  if (v2)
  {
    if ([v2 isRegionUsingApp] && objc_msgSend(v3, "isAppInstalled"))
    {
      id v4 = ENUILogForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v5 = [v3 appBundleId];
        *(_DWORD *)buf = 138412290;
        v37 = v5;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "### Request pre-authorization needs to open app - %@", buf, 0xCu);
      }
      id v6 = +[LSApplicationWorkspace defaultWorkspace];
      id v7 = [v3 appBundleId];
      [v6 openApplicationWithBundleID:v7];
    }
    else
    {
      v8 = ENUILogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [v3 region];
        *(_DWORD *)buf = 138412290;
        v37 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "### Request pre-authorization for - %@", buf, 0xCu);
      }
      uint64_t v10 = +[ENUIViewControllerFactory sharedInstance];
      v11 = [*(id *)(a1 + 32) adapter];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_6FD0;
      v34[3] = &unk_2C9A0;
      id v12 = *(id *)(a1 + 48);
      v34[4] = *(void *)(a1 + 32);
      id v35 = v12;
      uint64_t v13 = [v10 createPreAuthorizationStackForAgencyModel:v3 exposureManager:v11 completion:v34];

      id v14 = [*(id *)(a1 + 32) navigationController];
      [v14 presentViewController:v13 animated:1 completion:0];

      uint64_t v15 = *(void *)(a1 + 56);
      if (v15) {
        (*(void (**)(void))(v15 + 16))();
      }

      id v6 = v35;
    }
  }
  else
  {
    v16 = ENUILogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v37 = v17;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "### No active region Request to present onboarding for - %@, presenting onboarding instead", buf, 0xCu);
    }

    v18 = ENUILocalizedString();
    v19 = ENUILocalizedString();
    v20 = +[UIAlertController alertControllerWithTitle:v18 message:v19 preferredStyle:1];

    v21 = ENUILocalizedString();
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_71B0;
    v31[3] = &unk_2C9C8;
    v22 = *(void **)(a1 + 40);
    v31[4] = *(void *)(a1 + 32);
    id v32 = v22;
    id v33 = *(id *)(a1 + 56);
    v23 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v31];

    v24 = ENUILocalizedString();
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_71C4;
    v29 = &unk_2C7D0;
    id v30 = v20;
    id v6 = v20;
    v25 = +[UIAlertAction actionWithTitle:v24 style:1 handler:&v26];

    objc_msgSend(v6, "addAction:", v23, v26, v27, v28, v29);
    [v6 addAction:v25];
    [v6 setPreferredAction:v23];
    [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
  }
}

void sub_6FD0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];

  if (v2)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_7084;
    v3[3] = &unk_2C758;
    v3[4] = *(void *)(a1 + 32);
    +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v3];
  }
}

void sub_7084(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_70FC;
  block[3] = &unk_2C758;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_70FC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  id v4 = [v2 specifierForHealthAgencyModel:v3];
  id v6 = [v2 selectSpecifier:v4];

  if (v6)
  {
    id v5 = [*(id *)(a1 + 32) navigationController];
    [v5 pushViewController:v6 animated:0];
  }
}

id sub_71B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentOnboardingForPath:*(void *)(a1 + 40) fromDeepLink:1 completion:*(void *)(a1 + 48)];
}

id sub_71C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_71D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[ENUIViewControllerFactory sharedInstance];
    v8 = [*(id *)(a1 + 40) adapter];
    id v9 = [v7 createOnboardingStackForAgencyModel:v5 exposureManager:v8 fromAvailabilityAlert:1 fromDeepLink:0 subsequentFlow:0 completion:*(void *)(a1 + 56)];

    [*(id *)(a1 + 40) presentUIFlowStack:v9 forRegionModel:v5 onboardingSource:3 completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v10 = ENUILogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1D2F0();
    }

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
  }
}

void sub_72DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[ENUIViewControllerFactory sharedInstance];
    v8 = [*(id *)(a1 + 40) adapter];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_7438;
    v12[3] = &unk_2CA40;
    id v13 = *(id *)(a1 + 56);
    id v9 = [v7 createAnalyticsConsentStackForAgencyModel:v5 exposureManager:v8 completion:v12];

    [*(id *)(a1 + 40) presentUIFlowStack:v9 forRegionModel:v5 onboardingSource:0 completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v10 = ENUILogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1D35C();
    }

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
  }
}

uint64_t sub_7438(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_7448(uint64_t a1)
{
  return [*(id *)(a1 + 32) showLatestExposureDetailWithCompletion:*(void *)(a1 + 40)];
}

void sub_7454(uint64_t a1)
{
  uint64_t v2 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];

  id v3 = ENUILogForCategory();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Bringing up web self report flow", buf, 2u);
    }

    id v5 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
    id v6 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    id v7 = +[ENUIViewControllerFactory sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_762C;
    v9[3] = &unk_2C978;
    objc_copyWeak(&v10, (id *)(a1 + 56));
    v8 = [v7 createVerificationStackForAgencyModel:v5 exposureManager:v6 sessionIdentifier:0 reportType:0 enteredFromMainScreen:1 completion:v9];

    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
    objc_destroyWeak(&v10);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "No active region for web report, starting onboarding flow instead", buf, 2u);
    }

    [*(id *)(a1 + 32) presentOnboardingForPath:*(void *)(a1 + 40) fromDeepLink:1 completion:*(void *)(a1 + 48)];
  }
}

void sub_7614(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_762C(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_76D4;
  v1[3] = &unk_2CA90;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v1];
  objc_destroyWeak(&v2);
}

void sub_76C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_76D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained presentedViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_7734(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(unsigned int *)(a1 + 72);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    [v3 presentVerificationFlowForAgencyModel:a2 sessionIdentifier:v4 reportType:v5 onboardingCompletionHandler:v6 completionHandler:v7];
  }
  else
  {
    v8 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_7858;
    v11[3] = &unk_2CAE0;
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    void v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    int v15 = *(_DWORD *)(a1 + 72);
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    [v8 fetchAgencyModelForRegionCode:v10 reason:2 completion:v11];
  }
}

id sub_7858(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentVerificationFlowForAgencyModel:a2 sessionIdentifier:*(void *)(a1 + 40) reportType:*(unsigned int *)(a1 + 64) onboardingCompletionHandler:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void sub_7870(uint64_t a1)
{
  id v2 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  [*(id *)(a1 + 32) presentVerificationFlowForAgencyModel:v2 sessionIdentifier:*(void *)(a1 + 40) reportType:*(unsigned int *)(a1 + 64) onboardingCompletionHandler:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void sub_794C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_79C4;
  block[3] = &unk_2C758;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_79C4(uint64_t a1)
{
  id v2 = objc_alloc((Class)_TtC28HealthExposureNotificationUI34VerificationFinishedViewController);
  id v3 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  uint64_t v4 = [v3 name];
  id v5 = [v2 initWithRegionDisplayName:v4];

  [v5 setModalPresentationStyle:2];
  uint64_t v6 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7AA8;
  v7[3] = &unk_2C758;
  v7[4] = v6;
  [v6 presentViewController:v5 animated:1 completion:v7];
}

id sub_7AA8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_7B24;
  v2[3] = &unk_2C758;
  v2[4] = *(void *)(a1 + 32);
  return +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v2];
}

void sub_7B24(uint64_t a1)
{
  id v2 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];

  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_7BC4;
    block[3] = &unk_2C758;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_7BC4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  uint64_t v4 = [v2 specifierForHealthAgencyModel:v3];
  id v6 = [v2 selectSpecifier:v4];

  if (v6)
  {
    id v5 = [*(id *)(a1 + 32) navigationController];
    [v5 pushViewController:v6 animated:0];
  }
}

void sub_8034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  _Block_object_dispose((const void *)(v9 - 200), 8);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v9 - 112));
  _Unwind_Resume(a1);
}

void sub_8064(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained presentedViewController];
    [v2 dismissViewControllerAnimated:1 completion:0];

    id WeakRetained = v3;
  }
}

uint64_t sub_80C8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_80D8(uint64_t a1)
{
}

void sub_80E0(uint64_t a1)
{
  id v2 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(*(void *)(v3 + 8) + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_81DC;
  v8[3] = &unk_2CB80;
  uint64_t v13 = v3;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  char v15 = *(unsigned char *)(a1 + 80);
  uint64_t v14 = *(void *)(a1 + 72);
  id v11 = v7;
  id v12 = *(id *)(a1 + 56);
  [v2 fetchAgencyModelForRegionCode:v4 reason:2 completion:v8];
}

void sub_81DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ENUILogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "### Request to present onboarding for - %@, path: %@", buf, 0x16u);
  }

  uint64_t v7 = +[ENUIViewControllerFactory sharedInstance];
  v8 = [*(id *)(a1 + 40) adapter];
  uint64_t v9 = *(unsigned __int8 *)(a1 + 80);
  BOOL v10 = *(unsigned char *)(a1 + 80) == 0;
  uint64_t v11 = *(void *)(a1 + 72);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_83B4;
  v16[3] = &unk_2CB58;
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 72);
  id v17 = v12;
  uint64_t v18 = v13;
  v16[4] = *(void *)(a1 + 40);
  uint64_t v14 = [v7 createOnboardingStackForAgencyModel:v3 exposureManager:v8 fromAvailabilityAlert:v10 fromDeepLink:v9 subsequentFlow:v11 completion:v16];

  if (*(unsigned char *)(a1 + 80)) {
    uint64_t v15 = 4;
  }
  else {
    uint64_t v15 = 3;
  }
  [*(id *)(a1 + 40) presentUIFlowStack:v14 forRegionModel:v3 onboardingSource:v15 completion:*(void *)(a1 + 56)];
}

id sub_83B4(void *a1)
{
  id result = (id)(*(uint64_t (**)(void))(a1[5] + 16))();
  if (a1[6] == 5)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_8454;
    v3[3] = &unk_2C758;
    v3[4] = a1[4];
    return +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v3];
  }
  return result;
}

void sub_8454(uint64_t a1)
{
  id v2 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  unsigned int v3 = [v2 isPreauthorizationDomainAllowed];

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_8504;
    block[3] = &unk_2C758;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_8504(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  unsigned int v3 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  uint64_t v4 = [v2 specifierForHealthAgencyModel:v3];
  id v6 = [v2 selectSpecifier:v4];

  if (v6)
  {
    uint64_t v5 = [*(id *)(a1 + 32) navigationController];
    [v5 pushViewController:v6 animated:0];
  }
}

void sub_85B8(uint64_t a1)
{
  id v2 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_86D0;
  v8[3] = &unk_2CBD0;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 72);
  id v11 = v4;
  uint64_t v14 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = v6;
  uint64_t v10 = v7;
  char v16 = *(unsigned char *)(a1 + 88);
  uint64_t v15 = *(void *)(a1 + 80);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  [v2 fetchAgencyModelForRegionCode:v3 reason:0 completion:v8];
}

void sub_86D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = ENUILogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "### Locally requested to present onboarding for - %@, path: %@", buf, 0x16u);
    }

    uint64_t v7 = +[ENUIViewControllerFactory sharedInstance];
    v8 = [*(id *)(a1 + 40) adapter];
    uint64_t v9 = *(unsigned __int8 *)(a1 + 88);
    BOOL v10 = *(unsigned char *)(a1 + 88) == 0;
    uint64_t v11 = *(void *)(a1 + 80);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_88C0;
    v16[3] = &unk_2CB58;
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 80);
    id v17 = v12;
    uint64_t v18 = v13;
    v16[4] = *(void *)(a1 + 40);
    uint64_t v14 = [v7 createOnboardingStackForAgencyModel:v3 exposureManager:v8 fromAvailabilityAlert:v10 fromDeepLink:v9 subsequentFlow:v11 completion:v16];

    if (*(unsigned char *)(a1 + 88)) {
      uint64_t v15 = 4;
    }
    else {
      uint64_t v15 = 3;
    }
    [*(id *)(a1 + 40) presentUIFlowStack:v14 forRegionModel:v3 onboardingSource:v15 completion:*(void *)(a1 + 64)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_88C0(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  if (a1[6] == 5)
  {
    id v2 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
    unsigned int v3 = [v2 isPreauthorizationDomainAllowed];

    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_898C;
      block[3] = &unk_2C758;
      block[4] = a1[4];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

void sub_898C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  unsigned int v3 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  id v4 = [v2 specifierForHealthAgencyModel:v3];
  id v6 = [v2 selectSpecifier:v4];

  if (v6)
  {
    uint64_t v5 = [*(id *)(a1 + 32) navigationController];
    [v5 pushViewController:v6 animated:0];
  }
}

void sub_8A40(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) count] > 1)
  {
    uint64_t v5 = [*(id *)(a1 + 48) lastPathComponent];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v8();
  }
  else
  {
    id v2 = ENUILogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "### fetching last region", buf, 2u);
    }

    unsigned int v3 = [*(id *)(a1 + 40) adapter];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_8B90;
    v10[3] = &unk_2CC20;
    long long v9 = *(_OWORD *)(a1 + 56);
    id v4 = (id)v9;
    long long v11 = v9;
    [v3 getLastVisitedRegionWithCompletion:v10];
  }
}

void sub_8B90(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = ENUILogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "### fetched last region: %@", (uint8_t *)&v7, 0xCu);
  }
}

void sub_90FC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_9210(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setLatestNotification:a2];
  if (a2)
  {
    uint64_t v8 = objc_alloc_init(ENUIExposureDetailsViewController);
    id v4 = [*(id *)(a1 + 32) _latestNotificationSpecifier];
    [(ENUIExposureDetailsViewController *)v8 setSpecifier:v4];

    [*(id *)(a1 + 32) showController:v8 animate:1];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
  else
  {
    uint64_t v6 = ENUILogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1D52C();
    }

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

void sub_BB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_BB28(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 1) {
      [WeakRetained setNotificationsEnabled:1];
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_BC08;
    v6[3] = &unk_2CA90;
    objc_copyWeak(&v7, v3);
    +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v6];
    objc_destroyWeak(&v7);
  }
}

void sub_BBF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_BC08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
  uint64_t v1 = [WeakRetained presentedViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_BE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_BE5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didConfirmTurnOffExposureNotifications];
}

void sub_C05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_C084(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didConfirmTurnOffExposureNotifications];
}

void sub_C13C(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    unsigned int v3 = ENUILogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1D5A0();
    }
  }
}

void sub_C2C0(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    unsigned int v3 = ENUILogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1D608();
    }
  }
}

void sub_C430(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_C454(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained refreshRegionsAndReloadSpecifiers];
    uint64_t v2 = [v3 view];
    [v2 setUserInteractionEnabled:1];

    id WeakRetained = v3;
  }
}

void sub_C588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_C5AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained adapter];
  objc_msgSend(WeakRetained, "setLastKnownStatus:", objc_msgSend(v1, "exposureNotificationStatus"));

  [WeakRetained reloadSpecifiers];
}

void sub_C9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_CA1C(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_CAC4;
  v1[3] = &unk_2CA90;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v1];
  objc_destroyWeak(&v2);
}

void sub_CAB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_CAC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained presentedViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

id sub_CB98(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshRegionsAndReloadSpecifiers];
}

void sub_CE08(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_34170;
  qword_34170 = (uint64_t)v1;

  [(id)qword_34170 setDoesRelativeDateFormatting:1];
  [(id)qword_34170 setDateStyle:2];
  id v3 = (void *)qword_34170;

  [v3 setTimeStyle:1];
}

void sub_CE70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_CE98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_CED8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id sub_CFC8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setExposureChecks:a2];
  [*(id *)(a1 + 32) setFetchCompleted:1];
  id v3 = *(void **)(a1 + 32);

  return [v3 reloadSpecifiers];
}

id sub_D8D0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enui_jsonSerializationWithDateFormatter:", *(void *)(a1 + 32));
}

void sub_D8DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = ENUILogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v20 = (id)objc_opt_class();
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 2112;
    id v24 = v6;
    id v8 = v20;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Created export file at URL: %@, error: %@", buf, 0x20u);
  }
  if (v5)
  {
    id v9 = objc_alloc((Class)UIActivityViewController);
    id v18 = v5;
    BOOL v10 = +[NSArray arrayWithObjects:&v18 count:1];
    id v11 = [v9 initWithActivityItems:v10 applicationActivities:0];

    v17[0] = @"com.apple.Health.ShareExtension";
    v17[1] = UIActivityTypePostToFacebook;
    v17[2] = UIActivityTypePostToTwitter;
    v17[3] = UIActivityTypePostToWeibo;
    v17[4] = UIActivityTypePrint;
    v17[5] = UIActivityTypeAssignToContact;
    v17[6] = UIActivityTypeSaveToCameraRoll;
    v17[7] = UIActivityTypeAddToReadingList;
    v17[8] = UIActivityTypePostToFlickr;
    v17[9] = UIActivityTypePostToVimeo;
    v17[10] = UIActivityTypePostToTencentWeibo;
    id v12 = +[NSArray arrayWithObjects:v17 count:11];
    [v11 setExcludedActivityTypes:v12];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_DBC8;
    v16[3] = &unk_2CE70;
    v16[4] = *(void *)(a1 + 32);
    [v11 setCompletionWithItemsHandler:v16];
    uint64_t v13 = ENUILogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v20 = v14;
      id v15 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting Share Sheet", buf, 0xCu);
    }
    [*(id *)(a1 + 32) presentViewController:v11 animated:1 completion:0];
  }
}

void sub_DBC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = ENUILogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    id v10 = v9;
    id v11 = +[NSNumber numberWithBool:a3];
    int v13 = 138543874;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    char v16 = v11;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Share Sheet completed: %@, error: %@", (uint8_t *)&v13, 0x20u);
  }
  id v12 = [*(id *)(a1 + 32) exportManager];
  [v12 removeExportFile];
}

id *sub_DD7C(id *result, int a2)
{
  if (a2)
  {
    id v2 = result;
    [result[4] setExposureChecks:&__NSArray0__struct];
    id v3 = v2[4];
    return (id *)[v3 reloadSpecifiers];
  }
  return result;
}

void sub_DEBC(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_34180;
  qword_34180 = (uint64_t)v1;

  [(id)qword_34180 setDoesRelativeDateFormatting:1];
  [(id)qword_34180 setDateStyle:2];
  id v3 = (void *)qword_34180;

  [v3 setTimeStyle:1];
}

BOOL sub_E14C(id a1, id a2)
{
  id v2 = [a2 objectForKey:kTCCInfoGranted];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

id sub_10A98(id a1)
{
  return a1;
}

void sub_11414(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = ENUILogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1D92C();
    }
  }
  id v5 = [*(id *)(a1 + 32) activationGroup];
  dispatch_group_leave(v5);
}

void sub_11588(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1162C;
  v4[3] = &unk_2CF70;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 getDetectionHistoryChecksWithCompletion:v4];
}

void sub_1162C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v7 = ENUILogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2114;
    id v15 = v6;
    id v8 = v11;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received exposure checks: %@, error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v6, v9);
}

void sub_117E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11888;
  v4[3] = &unk_2CF70;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 getDetectionHistorySessionsWithCompletion:v4];
}

void sub_11888(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v7 = ENUILogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2114;
    id v15 = v6;
    id v8 = v11;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received exposure check sessions: %@, error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v6, v9);
}

void sub_11A48(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_11B00;
  v5[3] = &unk_2CF98;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  int v7 = v3;
  id v6 = v4;
  [v2 resetDataWithFlags:v3 completionHandler:v5];
}

void sub_11B00(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ENUILogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1D9A8(a1, v5);
    }

    (*(void (**)(void, void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_opt_class();
      int v7 = *(_DWORD *)(a1 + 48);
      int v9 = 138543618;
      int v10 = v6;
      __int16 v11 = 1024;
      int v12 = v7;
      id v8 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] reset data with flags %x", (uint8_t *)&v9, 0x12u);
    }
    (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0);
  }
}

void sub_11CC8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11D74;
  v4[3] = &unk_2CFE8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 getInfoForKey:@"profileInstalled" completion:v4];
}

void sub_11D74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v8 = ENUILogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1DA50();
    }

    int v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

void sub_11EC8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11F74;
  v4[3] = &unk_2CFE8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 getInfoForKey:@"weeklySummaryAlertEnabled" completion:v4];
}

void sub_11F74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v8 = ENUILogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1DACC();
    }

    int v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

void sub_120C8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_12174;
  v4[3] = &unk_2CFE8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 getInfoForKey:@"supported" completion:v4];
}

void sub_12174(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v8 = ENUILogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1DB48();
    }

    int v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

void sub_122C8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_12374;
  v4[3] = &unk_2CFE8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 getInfoForKey:@"dataPresent" completion:v4];
}

void sub_12374(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v5 BOOLValue], v6);
  }
  else
  {
    int v7 = ENUILogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1DBC4();
    }

    (*(void (**)(void, void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v6);
  }
}

void sub_124D8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manager];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_12578;
  v3[3] = &unk_2D010;
  id v4 = *(id *)(a1 + 40);
  [v2 resetAllDataWithCompletionHandler:v3];
}

uint64_t sub_12578(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_125F4(id a1)
{
  return a1;
}

uint64_t sub_12618()
{
  return objc_opt_class();
}

id sub_134DC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enui_jsonSerializationWithDateFormatter:", *(void *)(a1 + 32));
}

void sub_13D08(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) specifier];
  id v3 = [v2 userInfo];

  id v4 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_13DCC;
  v5[3] = &unk_2D080;
  v5[4] = *(void *)(a1 + 32);
  [v4 getAgencyModelForBundleID:v3 completion:v5];
}

id sub_13DCC(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setModel:a2];
  [*(id *)(a1 + 32) setDidRefreshModelSinceLoading:1];
  id v3 = *(void **)(a1 + 32);

  return [v3 refreshSwitchStates];
}

void sub_13EC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_13EE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshSwitchStates];
  [WeakRetained reloadSpecifiers];
}

void sub_14138(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "set_travelStatusFlag:", a2);
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_14178(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  objc_msgSend(*(id *)(a1 + 32), "set_preAuthorizationFlag:", a2);
  if (!v2)
  {
LABEL_8:
    int v12 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v12);
    return;
  }
  if (([*(id *)(a1 + 32) didRefreshModelSinceLoading] & 1) == 0)
  {
    id v13 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    __int16 v14 = [*(id *)(a1 + 32) model];
    id v15 = [v14 region];
    char v16 = [v15 regionCode];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_14450;
    v25[3] = &unk_2D0A8;
    __int16 v17 = *(void **)(a1 + 40);
    v25[4] = *(void *)(a1 + 32);
    id v26 = v17;
    [v13 getAgencyModelForRegionCode:v16 completion:v25];

    return;
  }
  id v4 = +[NSDate date];
  id v5 = [*(id *)(a1 + 32) model];
  id v6 = [v5 diagnosisKeysPreAuthorization];
  int v7 = [v6 expirationDate];

  id v8 = +[NSCalendar currentCalendar];
  int v9 = [v8 components:16 fromDate:v4 toDate:v7 options:0];

  int v10 = (char *)[v9 day];
  if ((unint64_t)v10 < 6)
  {
    if (v10 == (unsigned char *)&dword_4 + 1) {
      uint64_t v11 = 5;
    }
    else {
      uint64_t v11 = (uint64_t)(v10 + 1);
    }
    objc_msgSend(*(id *)(a1 + 32), "set_daysUntilPreAuthExpires:", v11);
    [*(id *)(a1 + 32) reloadSpecifiers];

    goto LABEL_8;
  }
  id v18 = ENUILogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1DC40();
  }

  v19 = *(void **)(a1 + 48);
  id v20 = [*(id *)(a1 + 32) model];
  __int16 v21 = [v20 region];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_144A8;
  v23[3] = &unk_2D0D0;
  id v22 = *(void **)(a1 + 40);
  v23[4] = *(void *)(a1 + 32);
  id v24 = v22;
  [v19 setPreAuthorizeDiagnosisKeysEnabled:0 forRegion:v21 completion:v23];
}

void sub_14450(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) setModel:a2];
  }
  [*(id *)(a1 + 32) setDidRefreshModelSinceLoading:1];
  [*(id *)(a1 + 32) refreshSwitchStates];
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_144A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = ENUILogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1DCC4();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "set_preAuthorizationFlag:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

id sub_14524(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLastKnownStatus:", objc_msgSend(*(id *)(a1 + 40), "exposureNotificationStatus"));
  [*(id *)(a1 + 32) setIsDataLoaded:1];
  int v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_16110(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_16138(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshRegionAndReloadSpecifiers];
}

void sub_16178(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshRegionAndReloadSpecifiers];
}

void sub_1637C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_163A4(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_1644C;
  v1[3] = &unk_2CA90;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v1];
  objc_destroyWeak(&v2);
}

void sub_16438(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1644C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained presentedViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];

  id v2 = [WeakRetained navigationController];
  id v3 = [v2 popViewControllerAnimated:1];
}

void sub_164D0(uint64_t a1)
{
  id v4 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
  id v2 = [*(id *)(a1 + 32) model];
  id v3 = [v2 region];
  [v4 onboardingDidStartForRegion:v3 source:1];
}

void sub_16784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_167A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didConfirmRemoveRegion];
}

void sub_169AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_169C8(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16A58;
  block[3] = &unk_2CA90;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_16A58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained navigationController];
  id v2 = [v1 popViewControllerAnimated:1];
}

void sub_16ABC(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_16B4C;
  v1[3] = &unk_2D140;
  id v2 = *(id *)(a1 + 32);
  +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v1];
}

uint64_t sub_16B4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id *sub_16C70(id *result, uint64_t a2)
{
  if (a2) {
    return (id *)[result[4] refreshSwitchStates];
  }
  return result;
}

void sub_16F28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = ENUILogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1DD70();
    }
  }
  [*(id *)(a1 + 32) refreshSwitchStates];
}

void sub_171A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_171C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained presentedViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_1753C(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v3 = [*(id *)(a1 + 32) navigationController];
  id v2 = [v3 presentedViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

void sub_175AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = ENUILogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1DDD8();
    }

    id v5 = [*(id *)(a1 + 32) model];
    [v5 setAnalyticsConsentStatus:0];

    [*(id *)(a1 + 32) reloadSpecifiers];
  }
}

id sub_19180()
{
  if (qword_341A8 != -1) {
    dispatch_once(&qword_341A8, &stru_2D1D8);
  }
  uint64_t v0 = (void *)qword_341A0;

  return v0;
}

void sub_19348(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_34190;
  qword_34190 = (uint64_t)v1;

  [(id)qword_34190 setDateStyle:2];
  id v3 = (void *)qword_34190;

  [v3 setTimeStyle:1];
}

void sub_193A4(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  id v2 = (void *)qword_341A0;
  qword_341A0 = (uint64_t)v1;

  id v3 = (void *)qword_341A0;

  [v3 setNumberStyle:1];
}

void sub_19B2C(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  id v2 = (void *)qword_341B0;
  qword_341B0 = (uint64_t)v1;

  id v3 = (void *)qword_341B0;

  [v3 setNumberStyle:1];
}

void sub_19B7C(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_341C0;
  qword_341C0 = (uint64_t)v1;

  [(id)qword_341C0 setDateStyle:2];
  id v3 = (void *)qword_341C0;

  [v3 setTimeStyle:1];
}

void sub_19C84(uint64_t a1)
{
  id v2 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/ExposureNotification/" isDirectory:1];
  id v3 = +[NSFileManager defaultManager];
  id v10 = 0;
  id v4 = [v3 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:0 options:4 error:&v10];
  id v5 = v10;

  if (v5)
  {
    id v6 = ENUILogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1DE40((uint64_t)v2, (uint64_t)v5, v6);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_19DD0;
  block[3] = &unk_2C848;
  void block[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_19DD0(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnalyticsDataFileURLs:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setFetchCompleted:1];
  id v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_1A790(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  id v2 = (void *)qword_341D0;
  qword_341D0 = (uint64_t)v1;

  id v3 = (void *)qword_341D0;

  [v3 setNumberStyle:1];
}

void sub_1CE64()
{
  sub_51D8();
  uint64_t v0 = objc_opt_class();
  id v1 = sub_5194(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Unable to get whether logs exist with error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1CEE8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error in response to delete exposure checks. (%@)", (uint8_t *)&v2, 0xCu);
}

void sub_1CF60()
{
  sub_51D8();
  uint64_t v0 = objc_opt_class();
  id v1 = sub_5194(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Unable to get whether logs exist with error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1CFE4()
{
  sub_51D8();
  uint64_t v0 = objc_opt_class();
  id v1 = sub_5194(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Cannot evaluate authentication for Exposure Checks: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1D064()
{
  sub_51D8();
  uint64_t v0 = objc_opt_class();
  id v1 = sub_5194(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Failed to evaluate authentication for Exposure Checks: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1D0E8(uint64_t a1, NSObject *a2)
{
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Authentication succeeded, allowing access to Exposure Checks", (uint8_t *)&v4, 0xCu);
}

void sub_1D184()
{
  sub_CEB4();
  sub_CE98(&dword_0, v0, v1, "Failed to fetch logging profile status: %@", v2, v3, v4, v5, v6);
}

void sub_1D1EC()
{
  sub_CEB4();
  sub_CE98(&dword_0, v0, v1, "Error fetching exposure check sessions: %@", v2, v3, v4, v5, v6);
}

void sub_1D254()
{
  sub_CEB4();
  sub_CE98(&dword_0, v0, v1, "Failed to fetch weekly summary enabled status: %@", v2, v3, v4, v5, v6);
}

void sub_1D2BC()
{
  sub_CE8C();
  sub_CE70(&dword_0, v0, v1, "Request to present onboarding stack when there's already one inflight", v2, v3, v4, v5, v6);
}

void sub_1D2F0()
{
  sub_CEC0();
  sub_CED8(&dword_0, v0, v1, "Failed to handle an onboarding from AA request as fetch for region code: %{public}@ failed: %{public}@");
}

void sub_1D35C()
{
  sub_CEC0();
  sub_CED8(&dword_0, v0, v1, "Failed to handle a deeplink request as fetch for region code: %{public}@ failed: %{public}@");
}

void sub_1D3C8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 name];
  sub_CEB4();
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Agency model for %@", v4, 0xCu);
}

void sub_1D45C()
{
  sub_CE8C();
  sub_CE70(&dword_0, v0, v1, "Agency model is not available for triggering verification flow", v2, v3, v4, v5, v6);
}

void sub_1D490()
{
  sub_CE8C();
  sub_CE70(&dword_0, v0, v1, "Session Identifier is null for verification flow", v2, v3, v4, v5, v6);
}

void sub_1D4C4()
{
  sub_CE8C();
  sub_CE70(&dword_0, v0, v1, "Cannot create session ID for verification flow", v2, v3, v4, v5, v6);
}

void sub_1D4F8()
{
  sub_CE8C();
  sub_CE70(&dword_0, v0, v1, "Cannot find the matching agency model to record the start of onboarding", v2, v3, v4, v5, v6);
}

void sub_1D52C()
{
  sub_CE8C();
  sub_CE70(&dword_0, v0, v1, "No notification found to present the details view controller", v2, v3, v4, v5, v6);
}

void sub_1D560()
{
  sub_CE8C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "User tapped on turn on EN when the system state is already enabled", v1, 2u);
}

void sub_1D5A0()
{
  sub_CEB4();
  sub_CE98(&dword_0, v0, v1, "Error toggling availability alert switch: %@", v2, v3, v4, v5, v6);
}

void sub_1D608()
{
  sub_CEB4();
  sub_CE98(&dword_0, v0, v1, "Error toggling weekly summary switch: %@", v2, v3, v4, v5, v6);
}

void sub_1D670()
{
  sub_CE8C();
  sub_CE70(&dword_0, v0, v1, "Failed to initiate share diagnosis flow due to empty active region", v2, v3, v4, v5, v6);
}

void sub_1D6A4(uint64_t a1, NSObject *a2)
{
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Ignoring request to export since no exposure checks have been loaded", (uint8_t *)&v4, 0xCu);
}

void sub_1D73C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "### Failed to get Exposure Notifications override value", v1, 2u);
}

void sub_1D780()
{
  id v0 = (id)objc_opt_class();
  sub_51B8(&dword_0, v1, v2, "[%{public}@] Attempting to export nil exposure checks: %@", v3, v4, v5, v6, 2u);
}

void sub_1D81C()
{
  id v0 = objc_opt_class();
  id v1 = sub_10A98(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Failed to create empty file: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1D8A4()
{
  id v0 = objc_opt_class();
  id v1 = sub_10A98(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Removing unexpected existing export file: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1D92C()
{
  sub_51D8();
  id v0 = (void *)sub_12618();
  id v1 = sub_125F4(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Unable to activate Exposure Notification manager: %@", v4, v5, v6, v7, v8);
}

void sub_1D9A8(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = (void *)sub_12618();
  int v5 = *(_DWORD *)(a1 + 48);
  int v7 = 138543618;
  uint8_t v8 = v4;
  __int16 v9 = 1024;
  int v10 = v5;
  id v6 = v4;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[%{public}@] could not reset data with flags %x", (uint8_t *)&v7, 0x12u);
}

void sub_1DA50()
{
  sub_51D8();
  id v0 = (void *)sub_12618();
  id v1 = sub_125F4(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Exposure check 'profileInstalled' is not a number: %@", v4, v5, v6, v7, v8);
}

void sub_1DACC()
{
  sub_51D8();
  id v0 = (void *)sub_12618();
  id v1 = sub_125F4(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Exposure check 'weeklySummaryAlertEnabled' is not a number: %@", v4, v5, v6, v7, v8);
}

void sub_1DB48()
{
  sub_51D8();
  id v0 = (void *)sub_12618();
  id v1 = sub_125F4(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Exposure check 'supported' is not a number: %@", v4, v5, v6, v7, v8);
}

void sub_1DBC4()
{
  sub_51D8();
  id v0 = (void *)sub_12618();
  id v1 = sub_125F4(v0);
  sub_51B8(&dword_0, v2, v3, "[%{public}@] Exposure check 'exposureAccessEvents' is not a number: %@", v4, v5, v6, v7, v8);
}

void sub_1DC40()
{
  sub_CEB4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Invalide PreAuth Consent from daemon, it's likely that user has changed device's time after consenting. Revoking the consent now. CurrentDate: %@, ExpirationDate: %@", v2, 0x16u);
}

void sub_1DCC4()
{
  sub_CEB4();
  sub_CE98(&dword_0, v0, v1, "Failed to revoke the invalid PreAuth consent. Error: %@", v2, v3, v4, v5, v6);
}

void sub_1DD2C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "PreAuthorization switch got turned on by user, this shouldn't happen and needs investigation. Deactivating the switch and reverting to OFF", v1, 2u);
}

void sub_1DD70()
{
  sub_CEB4();
  sub_CE98(&dword_0, v0, v1, "Failed to revoke region PreAuthorization: %@", v2, v3, v4, v5, v6);
}

void sub_1DDD8()
{
  sub_CEB4();
  sub_CE98(&dword_0, v0, v1, "Failed to set analytics: %@", v2, v3, v4, v5, v6);
}

void sub_1DE40(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error enumerating %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1DEC8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to load %@: %@", (uint8_t *)&v3, 0x16u);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t ENErrorF()
{
  return _ENErrorF();
}

uint64_t ENUILocalizedString()
{
  return _ENUILocalizedString();
}

uint64_t ENUILogForCategory()
{
  return _ENUILogForCategory();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
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

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t TCCAccessCopyInformation()
{
  return _TCCAccessCopyInformation();
}

uint64_t TCCAccessGetOverride()
{
  return _TCCAccessGetOverride();
}

uint64_t TCCAccessSetForBundle()
{
  return _TCCAccessSetForBundle();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__activeRegion(void *a1, const char *a2, ...)
{
  return [a1 _activeRegion];
}

id objc_msgSend__activeRegionSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _activeRegionSpecifiers];
}

id objc_msgSend__addRegionSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _addRegionSpecifiers];
}

id objc_msgSend__applessSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _applessSpecifiers];
}

id objc_msgSend__authorizedRegions(void *a1, const char *a2, ...)
{
  return [a1 _authorizedRegions];
}

id objc_msgSend__availabilityAlertSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _availabilityAlertSpecifiers];
}

id objc_msgSend__availableRegions(void *a1, const char *a2, ...)
{
  return [a1 _availableRegions];
}

id objc_msgSend__daysUntilPreAuthExpires(void *a1, const char *a2, ...)
{
  return [a1 _daysUntilPreAuthExpires];
}

id objc_msgSend__deleteExposureDataSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _deleteExposureDataSpecifiers];
}

id objc_msgSend__exposureNotificationStatusText(void *a1, const char *a2, ...)
{
  return [a1 _exposureNotificationStatusText];
}

id objc_msgSend__featureAvailableSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _featureAvailableSpecifiers];
}

id objc_msgSend__hashTextSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _hashTextSpecifier];
}

id objc_msgSend__headerSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _headerSpecifiers];
}

id objc_msgSend__installedAppSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _installedAppSpecifiers];
}

id objc_msgSend__latestNotificationSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _latestNotificationSpecifier];
}

id objc_msgSend__loggingProfileSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _loggingProfileSpecifiers];
}

id objc_msgSend__loggingStatusSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _loggingStatusSpecifier];
}

id objc_msgSend__marginWidth(void *a1, const char *a2, ...)
{
  return [a1 _marginWidth];
}

id objc_msgSend__preAuthorizationFlag(void *a1, const char *a2, ...)
{
  return [a1 _preAuthorizationFlag];
}

id objc_msgSend__preAuthorizationSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _preAuthorizationSpecifiers];
}

id objc_msgSend__refreshRegionAndReloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _refreshRegionAndReloadSpecifiers];
}

id objc_msgSend__shareDiagnosisSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _shareDiagnosisSpecifiers];
}

id objc_msgSend__systemFunctionalitySpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _systemFunctionalitySpecifiers];
}

id objc_msgSend__travelStatusFlag(void *a1, const char *a2, ...)
{
  return [a1 _travelStatusFlag];
}

id objc_msgSend__turnOffExposureNotificationSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _turnOffExposureNotificationSpecifiers];
}

id objc_msgSend__viewExposureInAppSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _viewExposureInAppSpecifiers];
}

id objc_msgSend__weeklySummarySpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _weeklySummarySpecifiers];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activationGroup(void *a1, const char *a2, ...)
{
  return [a1 activationGroup];
}

id objc_msgSend_activeRegion(void *a1, const char *a2, ...)
{
  return [a1 activeRegion];
}

id objc_msgSend_adapter(void *a1, const char *a2, ...)
{
  return [a1 adapter];
}

id objc_msgSend_agencyModel(void *a1, const char *a2, ...)
{
  return [a1 agencyModel];
}

id objc_msgSend_agencyNameLabel(void *a1, const char *a2, ...)
{
  return [a1 agencyNameLabel];
}

id objc_msgSend_allRegions(void *a1, const char *a2, ...)
{
  return [a1 allRegions];
}

id objc_msgSend_analyticsConsentStatus(void *a1, const char *a2, ...)
{
  return [a1 analyticsConsentStatus];
}

id objc_msgSend_analyticsDataFileURLs(void *a1, const char *a2, ...)
{
  return [a1 analyticsDataFileURLs];
}

id objc_msgSend_appBundleId(void *a1, const char *a2, ...)
{
  return [a1 appBundleId];
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appBundleIdentifier];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_areAvailabilityAlertsEnabled(void *a1, const char *a2, ...)
{
  return [a1 areAvailabilityAlertsEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authorizedRegions(void *a1, const char *a2, ...)
{
  return [a1 authorizedRegions];
}

id objc_msgSend_availableRegions(void *a1, const char *a2, ...)
{
  return [a1 availableRegions];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_capsule(void *a1, const char *a2, ...)
{
  return [a1 capsule];
}

id objc_msgSend_cellType(void *a1, const char *a2, ...)
{
  return [a1 cellType];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_classification(void *a1, const char *a2, ...)
{
  return [a1 classification];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return [a1 commonInit];
}

id objc_msgSend_consentStatus(void *a1, const char *a2, ...)
{
  return [a1 consentStatus];
}

id objc_msgSend_consentVersion(void *a1, const char *a2, ...)
{
  return [a1 consentVersion];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_continueButton(void *a1, const char *a2, ...)
{
  return [a1 continueButton];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countLabel(void *a1, const char *a2, ...)
{
  return [a1 countLabel];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateConsented(void *a1, const char *a2, ...)
{
  return [a1 dateConsented];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultAdapter(void *a1, const char *a2, ...)
{
  return [a1 defaultAdapter];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_diagnosisKeysPreAuthorization(void *a1, const char *a2, ...)
{
  return [a1 diagnosisKeysPreAuthorization];
}

id objc_msgSend_didConfirmRemoveRegion(void *a1, const char *a2, ...)
{
  return [a1 didConfirmRemoveRegion];
}

id objc_msgSend_didConfirmTurnOffExposureNotifications(void *a1, const char *a2, ...)
{
  return [a1 didConfirmTurnOffExposureNotifications];
}

id objc_msgSend_didRefreshModelSinceLoading(void *a1, const char *a2, ...)
{
  return [a1 didRefreshModelSinceLoading];
}

id objc_msgSend_didRequestRegionRemoval(void *a1, const char *a2, ...)
{
  return [a1 didRequestRegionRemoval];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_enabledExposureNotificationApps(void *a1, const char *a2, ...)
{
  return [a1 enabledExposureNotificationApps];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_exportManager(void *a1, const char *a2, ...)
{
  return [a1 exportManager];
}

id objc_msgSend_exposureChecks(void *a1, const char *a2, ...)
{
  return [a1 exposureChecks];
}

id objc_msgSend_exposureNotificationStatus(void *a1, const char *a2, ...)
{
  return [a1 exposureNotificationStatus];
}

id objc_msgSend_exposureServiceKey(void *a1, const char *a2, ...)
{
  return [a1 exposureServiceKey];
}

id objc_msgSend_exposureStore(void *a1, const char *a2, ...)
{
  return [a1 exposureStore];
}

id objc_msgSend_fetchCompleted(void *a1, const char *a2, ...)
{
  return [a1 fetchCompleted];
}

id objc_msgSend_fileHash(void *a1, const char *a2, ...)
{
  return [a1 fileHash];
}

id objc_msgSend_files(void *a1, const char *a2, ...)
{
  return [a1 files];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hasExposureNotificationAppsFromTCC(void *a1, const char *a2, ...)
{
  return [a1 hasExposureNotificationAppsFromTCC];
}

id objc_msgSend_hashText(void *a1, const char *a2, ...)
{
  return [a1 hashText];
}

id objc_msgSend_header(void *a1, const char *a2, ...)
{
  return [a1 header];
}

id objc_msgSend_headerStack(void *a1, const char *a2, ...)
{
  return [a1 headerStack];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return [a1 headerView];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return [a1 indexPathForSelectedRow];
}

id objc_msgSend_inflightOnboardingStack(void *a1, const char *a2, ...)
{
  return [a1 inflightOnboardingStack];
}

id objc_msgSend_inflightPreAuthorizationStack(void *a1, const char *a2, ...)
{
  return [a1 inflightPreAuthorizationStack];
}

id objc_msgSend_inflightVerificationStack(void *a1, const char *a2, ...)
{
  return [a1 inflightVerificationStack];
}

id objc_msgSend_installedAppName(void *a1, const char *a2, ...)
{
  return [a1 installedAppName];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_introductoryText(void *a1, const char *a2, ...)
{
  return [a1 introductoryText];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActiveRegion(void *a1, const char *a2, ...)
{
  return [a1 isActiveRegion];
}

id objc_msgSend_isAppInstalled(void *a1, const char *a2, ...)
{
  return [a1 isAppInstalled];
}

id objc_msgSend_isAuthorized(void *a1, const char *a2, ...)
{
  return [a1 isAuthorized];
}

id objc_msgSend_isAvailabilityAlertsSwitchEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAvailabilityAlertsSwitchEnabled];
}

id objc_msgSend_isDataLoaded(void *a1, const char *a2, ...)
{
  return [a1 isDataLoaded];
}

id objc_msgSend_isDaysUntilPreAuthExpiresValid(void *a1, const char *a2, ...)
{
  return [a1 isDaysUntilPreAuthExpiresValid];
}

id objc_msgSend_isExposureLoggingDataPresent(void *a1, const char *a2, ...)
{
  return [a1 isExposureLoggingDataPresent];
}

id objc_msgSend_isExposureNotificationsEnabledFromTCC(void *a1, const char *a2, ...)
{
  return [a1 isExposureNotificationsEnabledFromTCC];
}

id objc_msgSend_isExtraLoggingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isExtraLoggingEnabled];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isPreauthorizationDomainAllowed(void *a1, const char *a2, ...)
{
  return [a1 isPreauthorizationDomainAllowed];
}

id objc_msgSend_isRegionUsingApp(void *a1, const char *a2, ...)
{
  return [a1 isRegionUsingApp];
}

id objc_msgSend_isShareAnalyticsRestricted(void *a1, const char *a2, ...)
{
  return [a1 isShareAnalyticsRestricted];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isWeeklySummaryEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWeeklySummaryEnabled];
}

id objc_msgSend_keyCount(void *a1, const char *a2, ...)
{
  return [a1 keyCount];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastExposureCheckTime(void *a1, const char *a2, ...)
{
  return [a1 lastExposureCheckTime];
}

id objc_msgSend_lastKnownStatus(void *a1, const char *a2, ...)
{
  return [a1 lastKnownStatus];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_latestExposureCheckSession(void *a1, const char *a2, ...)
{
  return [a1 latestExposureCheckSession];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return [a1 layoutDirection];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_learnMoreURL(void *a1, const char *a2, ...)
{
  return [a1 learnMoreURL];
}

id objc_msgSend_legalTextView(void *a1, const char *a2, ...)
{
  return [a1 legalTextView];
}

id objc_msgSend_legalese(void *a1, const char *a2, ...)
{
  return [a1 legalese];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkArrowImageView(void *a1, const char *a2, ...)
{
  return [a1 linkArrowImageView];
}

id objc_msgSend_localizedDetailBodyText(void *a1, const char *a2, ...)
{
  return [a1 localizedDetailBodyText];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedSubjectText(void *a1, const char *a2, ...)
{
  return [a1 localizedSubjectText];
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return [a1 locationServicesEnabled];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_matchCount(void *a1, const char *a2, ...)
{
  return [a1 matchCount];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageTextView(void *a1, const char *a2, ...)
{
  return [a1 messageTextView];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notificationDate(void *a1, const char *a2, ...)
{
  return [a1 notificationDate];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_presentPreAuthorizedKeyReleasedThankYouScreen(void *a1, const char *a2, ...)
{
  return [a1 presentPreAuthorizedKeyReleasedThankYouScreen];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_processDate(void *a1, const char *a2, ...)
{
  return [a1 processDate];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_refreshRegionsAndReloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 refreshRegionsAndReloadSpecifiers];
}

id objc_msgSend_refreshSwitchStates(void *a1, const char *a2, ...)
{
  return [a1 refreshSwitchStates];
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return [a1 region];
}

id objc_msgSend_regionCapsuleLabel(void *a1, const char *a2, ...)
{
  return [a1 regionCapsuleLabel];
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return [a1 regionCode];
}

id objc_msgSend_regionFAQWebsiteURL(void *a1, const char *a2, ...)
{
  return [a1 regionFAQWebsiteURL];
}

id objc_msgSend_regionIsPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 regionIsPlaceholder];
}

id objc_msgSend_regionVersion(void *a1, const char *a2, ...)
{
  return [a1 regionVersion];
}

id objc_msgSend_regionWebsiteURL(void *a1, const char *a2, ...)
{
  return [a1 regionWebsiteURL];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeExportFile(void *a1, const char *a2, ...)
{
  return [a1 removeExportFile];
}

id objc_msgSend_revoked(void *a1, const char *a2, ...)
{
  return [a1 revoked];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_sectionLabel(void *a1, const char *a2, ...)
{
  return [a1 sectionLabel];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return [a1 separatorColor];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setUp(void *a1, const char *a2, ...)
{
  return [a1 setUp];
}

id objc_msgSend_setupSubviewsAndContstraints(void *a1, const char *a2, ...)
{
  return [a1 setupSubviewsAndContstraints];
}

id objc_msgSend_setupText(void *a1, const char *a2, ...)
{
  return [a1 setupText];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldShowSplashScreen(void *a1, const char *a2, ...)
{
  return [a1 shouldShowSplashScreen];
}

id objc_msgSend_shouldShowTurndownScreen(void *a1, const char *a2, ...)
{
  return [a1 shouldShowTurndownScreen];
}

id objc_msgSend_sourceAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceAppBundleIdentifier];
}

id objc_msgSend_sourceRegion(void *a1, const char *a2, ...)
{
  return [a1 sourceRegion];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_splashController(void *a1, const char *a2, ...)
{
  return [a1 splashController];
}

id objc_msgSend_statusChangeObserver(void *a1, const char *a2, ...)
{
  return [a1 statusChangeObserver];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 subtitleLabel];
}

id objc_msgSend_subtitleText(void *a1, const char *a2, ...)
{
  return [a1 subtitleText];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGray2Color(void *a1, const char *a2, ...)
{
  return [a1 systemGray2Color];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tableViewStyle(void *a1, const char *a2, ...)
{
  return [a1 tableViewStyle];
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 tertiaryLabelColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_textConsented(void *a1, const char *a2, ...)
{
  return [a1 textConsented];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return [a1 textContainer];
}

id objc_msgSend_textContainerInset(void *a1, const char *a2, ...)
{
  return [a1 textContainerInset];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return [a1 textView];
}

id objc_msgSend_textViewLeadingConstraint(void *a1, const char *a2, ...)
{
  return [a1 textViewLeadingConstraint];
}

id objc_msgSend_textViewTrailingConstraint(void *a1, const char *a2, ...)
{
  return [a1 textViewTrailingConstraint];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleIconImageView(void *a1, const char *a2, ...)
{
  return [a1 titleIconImageView];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_turndownEntity(void *a1, const char *a2, ...)
{
  return [a1 turndownEntity];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_versionConsented(void *a1, const char *a2, ...)
{
  return [a1 versionConsented];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_wantsAnalytics(void *a1, const char *a2, ...)
{
  return [a1 wantsAnalytics];
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}