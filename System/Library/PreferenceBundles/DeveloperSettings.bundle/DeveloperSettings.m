void sub_5D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5D64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_alloc_init((Class)PSConfirmationSpecifier);
  v2 = +[NSMutableDictionary dictionary];
  v3 = sub_1A030(@"CONFIRMATION_PROMPT");
  [v2 setObject:v3 forKey:PSConfirmationPromptKey];

  v4 = sub_1A030(@"CONFIRMATION_CANCEL");
  [v2 setObject:v4 forKey:PSConfirmationCancelKey];

  v5 = +[DBSDisplayZoomConfigurationController defaultController];
  v6 = [v5 currentDisplayZoomMode];
  [v6 displayZoomOption];

  v7 = [WeakRetained specifierForID:@"DISPLAY_ZOOM"];
  v8 = [v7 objectForKeyedSubscript:PSRadioGroupCheckedSpecifierKey];

  v9 = [v8 objectForKeyedSubscript:@"displayZoomMode"];
  unint64_t v10 = (unint64_t)[v9 displayZoomOption];
  if (v10 <= 3)
  {
    v11 = off_34BB8[v10];
    v12 = sub_1A030(v11);
    [v2 setObject:v12 forKey:PSConfirmationOKKey];

    v13 = sub_1A030(v11);
    [v2 setObject:v13 forKey:PSConfirmationTitleKey];
  }
  [v1 setupWithDictionary:v2];
  [v1 setTarget:WeakRetained];
  [v1 setConfirmationAction:"_userDidConfirmDisplayZoomModeWithSpecifier:"];
  v14 = +[UIDevice currentDevice];
  objc_msgSend(WeakRetained, "showConfirmationViewForSpecifier:useAlert:", v1, objc_msgSend(v14, "sf_isiPad"));
}

void sub_5F88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained navigationController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

id sub_640C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [v5 localizedName];
  v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];

  [v8 setIdentifier:v6];
  [v8 setButtonAction:"_userDidSelectSpecifier:"];
  [v8 setObject:v5 forKeyedSubscript:@"displayZoomMode"];

  return v8;
}

void sub_6C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v12 - 128));
  _Unwind_Resume(a1);
}

void sub_6C68(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_6D04;
  v2[3] = &unk_34BE0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = WeakRetained;
  [v1 updateHangEventsWithCompletion:v2];
  [v1 updateProcessingHangEventsWithCompletion:0];
}

void sub_6D04(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    HTUIFetchingHangsErrorTitle();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = HTUIFetchingHangsErrorMessage();
    [v2 presentErrorWithTitle:v5 message:v3];
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    [v4 handlePendingURL];
  }
}

void sub_6D94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateProcessingHangEventsWithCompletion:0];
}

void sub_6DD8(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained shareSelectedHangs:v4];
}

void sub_6E4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEditing:1 animated:1];
}

void sub_7120(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) specifierForID:*(void *)(a1 + 40)];
  v2 = [v5 objectForKeyedSubscript:PSHeaderViewKey];
  id v3 = v2;
  if (*(unsigned char *)(a1 + 48)) {
    [v2 startAnimating];
  }
  else {
    [v2 stopAnimating];
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"HANGTRACER_EXTERNAL_DEVELOPER_APPS"])
  {
    if (*(unsigned char *)(a1 + 48))
    {
      [v5 setObject:&stru_35910 forKeyedSubscript:PSFooterTextGroupKey];
    }
    else
    {
      v4 = HTUIAppsSectionFooter();
      [v5 setObject:v4 forKeyedSubscript:PSFooterTextGroupKey];
    }
    [*(id *)(a1 + 32) reloadSpecifier:v5];
  }
}

void sub_735C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_7380(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = &__NSDictionary0__struct;
  }
  v9 = [WeakRetained processingHangsEvents];
  [v7 updateSpecifiersWithHangEvents:v8 processingHangEvents:v9];

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }
}

void sub_7578(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_759C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) markGroup:@"HANGTRACER_EXTERNAL_DEVELOPER_APPS" asLoading:0];
    [WeakRetained goToNextAppsState];
    if (v5)
    {
      v8 = +[NSMutableSet set];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v9 = [WeakRetained developerApps];
      id v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v35;
        do
        {
          v13 = 0;
          do
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)v13) bundleID];
            [v8 addObject:v14];

            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v11);
      }
      id v29 = v6;

      v15 = +[NSMutableSet set];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v16 = v5;
      id v17 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v31;
        do
        {
          v20 = 0;
          do
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)v20) bundleID];
            [v15 addObject:v21];

            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v18);
      }

      uint64_t v22 = [v8 isEqualToSet:v15] ^ 1;
      NSLog(@"Apps list have changed, we need to reload");
      [WeakRetained setDeveloperApps:v16];
      if ([v16 count])
      {
        v23 = [WeakRetained developerAppsSpecifiersFromList:v16];
      }
      else
      {
        v24 = HTUIPlaceholderNoApps();
        v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

        [v25 setIdentifier:@"HANGTRACER_EXTERNAL_NO_DEVELOPER_APPS"];
        v38 = v25;
        v23 = +[NSArray arrayWithObjects:&v38 count:1];
      }
      id v6 = v29;
      v26 = [WeakRetained cachedDeveloperAppsSpecifiers];
      [WeakRetained removeContiguousSpecifiers:v26 animated:v22];

      [WeakRetained setCachedDeveloperAppsSpecifiers:v23];
      v27 = [WeakRetained cachedDeveloperAppsSpecifiers];
      [WeakRetained insertContiguousSpecifiers:v27 afterSpecifierID:@"HANGTRACER_EXTERNAL_DEVELOPER_APPS" animated:v22];
    }
  }
  uint64_t v28 = *(void *)(a1 + 40);
  if (v28) {
    (*(void (**)(uint64_t, id))(v28 + 16))(v28, v6);
  }
}

void sub_7A1C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_7A40(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = [WeakRetained hangsEvents];
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = &__NSDictionary0__struct;
  }
  [WeakRetained updateSpecifiersWithHangEvents:v7 processingHangEvents:v8];

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }
}

BOOL sub_8130(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  v4 = a2;
  id v5 = a3;
  id v6 = [(PSSpecifier *)v4 identifier];
  v7 = [(PSSpecifier *)v5 identifier];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8
    && (-[PSSpecifier objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"HangsDataControllerIsProcessing"), v9 = objc_claimAutoreleasedReturnValue(), -[PSSpecifier objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"HangsDataControllerIsProcessing"), id v10 = objc_claimAutoreleasedReturnValue(), v11 = [v9 isEqual:v10], v10, v9, v11))
  {
    uint64_t v12 = [(PSSpecifier *)v4 objectForKeyedSubscript:@"HangsDataControllerDuration"];
    v13 = [(PSSpecifier *)v5 objectForKeyedSubscript:@"HangsDataControllerDuration"];
    unsigned __int8 v14 = [v12 isEqual:v13];
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

void sub_8434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v13);
  _Unwind_Resume(a1);
}

void sub_8454(uint64_t a1, uint64_t a2)
{
}

void sub_8460(uint64_t a1)
{
}

void sub_8468(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

id sub_84B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_8718(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 128), 8);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_8738(uint64_t a1, uint64_t a2)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    v4 = HTUIFetchingAppsErrorTitle();
    id v5 = HTUIFetchingAppsErrorMessage();
    [WeakRetained presentErrorWithTitle:v4 message:v5];
  }
}

void sub_87D8(uint64_t a1, uint64_t a2)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    v4 = HTUIFetchingHangsErrorTitle();
    id v5 = HTUIFetchingHangsErrorMessage();
    [WeakRetained presentErrorWithTitle:v4 message:v5];
  }
}

void sub_8878(uint64_t a1)
{
}

uint64_t sub_8880(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_8A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_8A74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEditing:0 animated:1];
}

void sub_955C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

UIViewController *__cdecl sub_9580(id a1)
{
  return 0;
}

id sub_9588(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = HTUIShareButton();
  id v5 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_973C;
  v13 = &unk_34DC8;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v14 = *(id *)(a1 + 32);
  id v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:0 handler:&v10];
  id v16 = v6;
  v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1, v10, v11, v12, v13);
  unsigned int v8 = +[UIMenu menuWithChildren:v7];

  objc_destroyWeak(&v15);

  return v8;
}

void sub_9720(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_973C(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained shareLogs:*(void *)(a1 + 32) sender:v4];
}

void sub_9884(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_9918;
  v3[3] = &unk_34E18;
  v3[4] = *(void *)(a1 + 32);
  [WeakRetained updateDeveloperAppsWithCompletion:v3];
}

void sub_9918(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    uint64_t v2 = HTUIFetchingAppsErrorTitle();
    id v3 = HTUIFetchingAppsErrorMessage();
    [WeakRetained presentErrorWithTitle:v2 message:v3];
  }
}

void sub_A974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void sub_A994(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained developerApps];
    id v4 = [v3 count];

    +[HTHangsAnalytics sendActivationEvent:*(unsigned __int8 *)(a1 + 40) developerAppCount:v4];
    id WeakRetained = v5;
  }
}

void sub_AB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

uint64_t sub_ABA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [WeakRetained handlePendingURL];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_B4C4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_BD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_BDC0(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v7 traitCollection];
    id v5 = [v4 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    [WeakRetained[4] setActive:*(unsigned char *)(a1 + 40) == 0];
    [WeakRetained[5] setActive:*(unsigned char *)(a1 + 40) == 0];
    [WeakRetained[6] setActive:*(unsigned char *)(a1 + 40) == 0];
    [WeakRetained[3] setAxis:IsAccessibilityCategory];
    [WeakRetained setNeedsLayout];
    [WeakRetained layoutIfNeeded];
  }
}

void sub_DED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_DEFC(uint64_t a1, uint64_t a2)
{
}

void sub_DF08(uint64_t a1)
{
}

void sub_DF10(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_DFC0;
    v7[3] = &unk_34F50;
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

void sub_DFC0(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) UIImage];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  id v3 = [WeakRetained iconView];
  [v3 setImage:v4];
}

void sub_F030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

UIViewController *__cdecl sub_F04C(id a1)
{
  return 0;
}

id sub_F054(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = HTUIShareButton();
  id v5 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_F21C;
  v10[3] = &unk_34FC0;
  objc_copyWeak(&v13, a1 + 6);
  id v11 = a1[4];
  id v12 = a1[5];
  id v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:0 handler:v10];
  id v14 = v6;
  id v7 = +[NSArray arrayWithObjects:&v14 count:1];
  id v8 = +[UIMenu menuWithChildren:v7];

  objc_destroyWeak(&v13);

  return v8;
}

void sub_F200(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_F21C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained shareEntry:*(void *)(a1 + 32) forRowAtIndexPath:*(void *)(a1 + 40)];
}

id sub_FE30(uint64_t a1)
{
  return _[*(id *)(a1 + 32) updateCellularToInexpensive:1];
}

uint64_t sub_FFAC(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (*(unsigned char *)(a1 + 40)) {
      a2 = 1;
    }
    else {
      a2 = a2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_10530(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) symptomsFeed];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_105DC;
  v4[3] = &unk_35060;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 getPreferCellOverWiFiWithOptions:v3 reply:v4];
}

void sub_105DC(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  NSLog(@"NCO Prefer5G (get) returned %@ err: %@", v7, a3);
  id v5 = &__kCFBooleanFalse;
  if (v7 && !a3)
  {
    id v5 = [v7 objectForKey:kSymptomForcePreferCellOverWiFiEnableKey];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, [v5 BOOLValue]);
  }
}

void sub_1081C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) symptomsFeed];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_108C8;
  v4[3] = &unk_35060;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 setPreferCellOverWiFiWithOptions:v3 reply:v4];
}

uint64_t sub_108C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSLog(@"NCO Prefer5G (set) returned %@ err: %@", a2, a3);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_10AA0(uint64_t a1)
{
  for (i = *(const __SCPreferences **)(a1 + 40); !SCPreferencesLock(i, 1u); i = *(const __SCPreferences **)(a1 + 40))
  {
    int v3 = SCError();
    if (v3 != 3005)
    {
      uint64_t v6 = SCErrorString(v3);
      NSLog(@"NCO WiFi: Could not acquire prefs lock: %s", v6);
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
      }
      id v8 = *(const void **)(a1 + 40);
      CFRelease(v8);
      return;
    }
    SCPreferencesSynchronize(*(SCPreferencesRef *)(a1 + 40));
  }
  if (SCNetworkInterfaceTypeSetTemporaryOverrideCost())
  {
    NSLog(@"NCO WiFi: Persisted override %d", *(unsigned int *)(a1 + 48));
    SCPreferencesCommitChanges(*(SCPreferencesRef *)(a1 + 40));
    SCPreferencesApplyChanges(*(SCPreferencesRef *)(a1 + 40));
  }
  else
  {
    NSLog(@"NCO WiFi: Error persisting override %d", *(unsigned int *)(a1 + 48));
  }
  SCPreferencesUnlock(*(SCPreferencesRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = *(void (**)(void))(v4 + 16);
    v5();
  }
}

void sub_11340(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setCachedPrefer5GValue:a2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_113D0;
  block[3] = &unk_350D8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_113D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_11A9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadPrefer5GSpecifier:*(void *)(a1 + 40)];
}

id sub_11AA8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ncoData];
  [v2 setCellularInexpensive:0];

  int v3 = [*(id *)(a1 + 32) ncoData];
  [v3 setCellularInexpensive:1];

  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) BOOLValue];
  uint64_t v6 = *(void *)(a1 + 48);

  return [v4 enablePrefer5G:v5 specifier:v6];
}

id sub_11B24(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadPrefer5GSpecifier:*(void *)(a1 + 40)];
}

id sub_11B30(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ncoData];
  [v2 setCellularInexpensive:1];

  int v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) BOOLValue];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v3 enablePrefer5G:v4 specifier:v5];
}

void sub_11CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_11CD8(uint64_t a1, uint64_t a2)
{
}

void sub_11CE4(uint64_t a1)
{
}

void sub_11CEC(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11D7C;
  block[3] = &unk_34F50;
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  long long v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_11D7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [WeakRetained reloadPrefer5GSpecifier:*(void *)(a1 + 32)];
}

uint64_t sub_120DC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_120F4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_127E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1280C(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_128A4;
    block[3] = &unk_34C08;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v3);
  }
}

void sub_128A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

id sub_129EC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) setWifiOverrideValue:1];
}

id sub_145FC(uint64_t a1, void *a2)
{
  if (dword_412E8)
  {
    id v3 = [a2 title];
    NSLog(@"Delete profile clicked %@", v3);
  }
  long long v4 = *(void **)(a1 + 32);

  return _[v4 deleteNLCProfile:0];
}

void sub_18768(void *a1, void *a2)
{
  id v11 = a1;
  id v3 = a2;
  long long v4 = v3;
  if (dword_412E8) {
    NSLog(@"%@", v3);
  }
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"DEVELOPER_SETTINGS_ERROR" value:&stru_35910 table:@"NLCSettings"];
  uint64_t v7 = +[UIAlertController alertControllerWithTitle:v6 message:v4 preferredStyle:1];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"ERROR_OK" value:&stru_35910 table:@"NLCSettings"];
  id v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:0];
  [v7 addAction:v10];

  [v11 presentViewController:v7 animated:1 completion:0];
}

id sub_1A030(void *a1)
{
  id v1 = a1;
  long long v2 = sub_1A0A0();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"DTDisplayZoom"];

  return v3;
}

id sub_1A0A0()
{
  if (qword_412D0 != -1) {
    dispatch_once(&qword_412D0, &stru_351E8);
  }
  v0 = (void *)qword_412C8;

  return v0;
}

id sub_1A0F4(void *a1)
{
  id v1 = a1;
  long long v2 = sub_1A0A0();
  id v3 = [v2 localizedStringForKey:v1 value:0 table:@"ResetMediaServices"];

  return v3;
}

void sub_1A164(id a1)
{
  qword_412C8 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id sub_1A1F4()
{
  v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  id v1 = [v0 firstObject];

  long long v2 = [v1 stringByAppendingPathComponent:@"PreferenceBundles"];
  id v3 = [v2 stringByAppendingPathComponent:@"AppClipDeveloperSettings.bundle"];
  long long v4 = +[NSBundle bundleWithPath:v3];

  return v4;
}

id sub_1A3EC()
{
  v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  id v1 = [v0 firstObject];

  long long v2 = [v1 stringByAppendingPathComponent:@"PreferenceBundles"];
  id v3 = [v2 stringByAppendingPathComponent:@"DeviceManagementClientDeveloperSettings.bundle"];
  long long v4 = +[NSBundle bundleWithPath:v3];

  return v4;
}

void sub_1B1C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 downlinkResponsiveness];
  id v8 = [v7 value];

  if (v8)
  {
    uint64_t v9 = [v5 downlinkResponsiveness];
    uint64_t v10 = [v9 value];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 144);
    *(void *)(v11 + 144) = v10;

    id v13 = [v5 downlinkResponsiveness];
    id v14 = [v13 rating];
    *(void *)(*(void *)(a1 + 32) + 152) = (int)[v14 intValue];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v5 downlinkResponsiveness];
      id v16 = [v15 value];
      int v19 = 136315394;
      v20 = "-[DTNetQualSettingsCell runNetworkQualityWithCompletionHandler:]_block_invoke";
      __int16 v21 = 2048;
      id v22 = [v16 unsignedLongValue];
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NetQuality: %s: Got responsiveness %lu", (uint8_t *)&v19, 0x16u);
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    v20 = "-[DTNetQualSettingsCell runNetworkQualityWithCompletionHandler:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NetQuality: %s: Completed! Error: %@", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(void **)(v17 + 160);
  *(void *)(v17 + 160) = 0;

  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6 == 0);
}

void sub_1B6F8(id a1, UIAlertAction *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    id v3 = "-[DTNetQualSettingsCell _runNetworkQuality]_block_invoke";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "NetQuality: %s: User canceled test-run", (uint8_t *)&v2, 0xCu);
  }
}

id sub_1B794(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = 1;
  [*(id *)(a1 + 32) _fillNetworkQualityCell];
  int v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1B82C;
  v4[3] = &unk_35100;
  void v4[4] = v2;
  return [v2 runNetworkQualityWithCompletionHandler:v4];
}

void sub_1B82C(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1B8A8;
  v2[3] = &unk_35280;
  char v3 = a2;
  void v2[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

id sub_1B8A8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40) && *(unsigned char *)(*(void *)(a1 + 32) + 136))
  {
    int v2 = +[NSBundle bundleForClass:objc_opt_class()];
    char v3 = [v2 localizedStringForKey:@"FAILURE_TITLE" value:&stru_35910 table:@"DTNetQualSettings"];

    long long v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"FAILURE_TEXT" value:&stru_35910 table:@"DTNetQualSettings"];

    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"FAILURE_OK" value:&stru_35910 table:@"DTNetQualSettings"];

    id v8 = +[UIAlertController alertControllerWithTitle:v3 message:v5 preferredStyle:1];
    uint64_t v9 = +[UIAlertAction actionWithTitle:v7 style:0 handler:0];
    [v8 addAction:v9];
    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 128) target];
    [v10 presentViewController:v8 animated:1 completion:0];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = 0;
  uint64_t v11 = *(void **)(a1 + 32);

  return [v11 _fillNetworkQualityCell];
}

void sub_1D018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_1D038(uint64_t a1, uint64_t a2)
{
}

void sub_1D044(uint64_t a1)
{
}

void sub_1D04C(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1D0C8;
  v2[3] = &unk_34E68;
  void v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_1D0C8(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  char v3 = +[NSBundle bundleForClass:objc_opt_class()];
  long long v4 = v3;
  if (v2) {
    CFStringRef v5 = @"ON";
  }
  else {
    CFStringRef v5 = @"OFF";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_35910 table:@"DTSettings"];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [WeakRetained setCachedNCOStatus:v6];

  id v8 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [v8 reloadSpecifierID:@"NCO"];
}

void sub_1D370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_1D398(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[AdAttributionKit] Developer mode set", buf, 2u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1D45C;
  block[3] = &unk_34E40;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1D45C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [WeakRetained refreshAdAttributionKitDeveloperModeEnabled];
}

void sub_1D5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_1D5C4(uint64_t a1, int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = a2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[AdAttributionKit] Got developer mode enabled: %d", buf, 8u);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1D6C8;
  v4[3] = &unk_34E68;
  void v4[4] = *(void *)(a1 + 32);
  char v5 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_1D6C8(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [WeakRetained setCachedAdAttributionKitDeveloperModeEnabled:v2];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [v4 reloadSpecifierID:@"ADATTRIBUTIONKIT_DEVELOPER_MODE_ENABLED"];
}

id sub_1DBBC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) didSelectAlertAction:*(void *)(a1 + 40)];
}

uint64_t sub_1DBD4(uint64_t a1)
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))off_412D8;
  uint64_t v9 = off_412D8;
  if (!off_412D8)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1FAD8;
    v5[3] = &unk_34E40;
    v5[4] = &v6;
    sub_1FAD8((uint64_t)v5);
    uint64_t v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    id v4 = (_Unwind_Exception *)sub_2380C();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  return v2(a1);
}

void sub_1DF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DF90(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 bundleIdentifier];
  if ([v5 hasPrefix:@"com.apple."]
    && [v5 hasSuffix:@".ClassKitApp"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void sub_1E4F4(id a1, BOOL a2, NSError *a3)
{
  if (a3) {
    NSLog(@"Error when try to clear ABR data: %@", a2, a3);
  }
}

void sub_1EA78(uint64_t a1)
{
  uint64_t v2 = +[AMSProcessInfo currentProcess];
  [v2 setAccountMediaType:AMSAccountMediaTypeAppStoreSandbox];
  char v3 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreSandbox];
  id v4 = objc_msgSend(v3, "ams_activeiTunesAccount");
  id v5 = +[AMSBag bagForProfile:@"Accounts" profileVersion:@"1" processInfo:v2];
  id v6 = [objc_alloc((Class)AMSUIWebViewController) initWithBag:v5 account:v4 clientInfo:v2];
  [v6 setDelegate:*(void *)(a1 + 32)];
  id v7 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 200);
  *(void *)(v8 + 200) = v7;

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = v10[25];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1EC70;
  v16[3] = &unk_350D8;
  v16[4] = v10;
  [v10 presentViewController:v11 animated:1 completion:v16];
  id v12 = [v5 URLForKey:@"manage-sandbox-account-url"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1EC7C;
  v14[3] = &unk_35338;
  v14[4] = *(void *)(a1 + 32);
  id v15 = v6;
  id v13 = v6;
  [v12 valueWithCompletion:v14];
}

id sub_1EC70(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSandboxSpecifier:0];
}

void sub_1EC7C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    id v7 = [*(id *)(a1 + 40) loadURL:a2];
  }
  else
  {
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      id v12 = AMSHashIfNeeded();
      int v16 = 138543874;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      int v19 = v11;
      __int16 v20 = 2114;
      __int16 v21 = v12;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load the manage account URL. error = %{public}@", (uint8_t *)&v16, 0x20u);
    }
    [*(id *)(a1 + 40) dismissAnimated:1];
    id v13 = [objc_alloc((Class)AMSDialogRequest) initWithError:v6];
    id v14 = [objc_alloc((Class)AMSUIAlertDialogTask) initWithRequest:v13 presentingViewController:*(void *)(a1 + 32)];
    id v15 = [v14 present];
  }
}

void sub_1EE2C(uint64_t a1)
{
  uint64_t v2 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreSandbox];
  char v3 = objc_msgSend(v2, "ams_activeiTunesAccount");
  [v3 setActive:0];
  id v4 = objc_msgSend(v2, "ams_saveAccount:verifyCredentials:", v3, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1EF14;
  v5[3] = &unk_35360;
  v5[4] = *(void *)(a1 + 32);
  [v4 addFinishBlock:v5];
  [*(id *)(a1 + 32) _updateSandboxSpecifier:0];
}

void sub_1EF14(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1EF8C;
  block[3] = &unk_350D8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1EF8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSandboxSpecifier:0];
}

void sub_1F0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1F118(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 184) = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1F1B8;
  block[3] = &unk_34C08;
  objc_copyWeak(&v2, (id *)(a1 + 40));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_1F1B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSandboxSpecifier:0];
}

uint64_t sub_1F6A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1F9CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *sub_1FAD8(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_412E0)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_1FC18;
    v5[4] = &unk_35410;
    void v5[5] = v5;
    long long v6 = off_353F8;
    uint64_t v7 = 0;
    qword_412E0 = _sl_dlopen();
    char v3 = (void *)v5[0];
    id v2 = (void *)qword_412E0;
    if (qword_412E0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      char v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_412E0;
LABEL_5:
  uint64_t result = dlsym(v2, "MX_MediaServicesUtilitiesResetMediaServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_412D8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1FC18()
{
  uint64_t result = _sl_dlopen();
  qword_412E0 = result;
  return result;
}

void sub_2074C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = (char *)[WeakRetained testStatus];

  if (v3 == (unsigned char *)&dword_0 + 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_23830();
    }
    [*(id *)(a1 + 32) setTestObject:0];
    [*(id *)(a1 + 32) updateTestStatus:0];
  }
}

id sub_20A4C(uint64_t a1)
{
  [*(id *)(a1 + 32) updateTestStatus:1];
  id v2 = *(void **)(a1 + 32);

  return _[v2 startSpeedTest];
}

id sub_20B10(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_20C64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20C88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [WeakRetained testObject];

  if (v8)
  {
    if (v5)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 40));
      [v9 setTestResults:v5];
    }
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_238C0((uint64_t)v6);
      }
      uint64_t v10 = [v6 lastObject];
      uint64_t v11 = [v10 localizedDescription];
      id v12 = [v11 lowercaseString];
      unsigned int v13 = [v12 isEqualToString:@"cancelled"];

      if (!v13) {
        goto LABEL_10;
      }

      id v14 = objc_loadWeakRetained((id *)(a1 + 40));
      [v14 setTestResults:0];
    }
    uint64_t v10 = 0;
LABEL_10:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_20E58;
    block[3] = &unk_35480;
    objc_copyWeak(&v20, (id *)(a1 + 40));
    uint64_t v15 = *(void *)(a1 + 32);
    id v18 = v10;
    uint64_t v19 = v15;
    id v16 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v20);
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_23878();
  }
LABEL_13:
}

void sub_20E58(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setTestObject:0];

  id v4 = objc_loadWeakRetained(v2);
  [v4 updateTestStatus:0];

  if (a1[4])
  {
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"THROUGHPUT_ERROR" value:&stru_35910 table:@"DTSettings"];
    uint64_t v7 = [a1[4] localizedDescription];
    id v11 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"OK" value:&stru_35910 table:@"DTSettings"];
    uint64_t v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:0];

    [v11 addAction:v10];
    [a1[5] presentViewController:v11 animated:1 completion:0];
  }
}

uint64_t sub_21358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  id v6 = (void *)swift_task_alloc();
  void v5[5] = v6;
  void *v6 = v5;
  v6[1] = sub_213EC;
  return static DeveloperMode.isDeveloperModeEnabled.getter();
}

uint64_t sub_213EC(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v5 = sub_21580;
  }
  else
  {
    *(unsigned char *)(v4 + 56) = a1 & 1;
    id v5 = sub_21518;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_21518()
{
  (*(void (**)(void))(v0 + 24))(*(unsigned __int8 *)(v0 + 56));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21580()
{
  os_log_type_t v1 = sub_23990();
  sub_226E0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_239A0();
  os_log_type_t v3 = v1;
  if (os_log_type_enabled(v2, v1))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    id v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v6;
    sub_239B0();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "[AdAttributionKit] Failed to get developer enabled with error: %@", v4, 0xCu);
    sub_2241C(&qword_41280);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(void))(v0 + 24))(0);
  swift_errorRelease();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_217C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a5;
  *(void *)(v6 + 32) = a6;
  *(unsigned char *)(v6 + 60) = a4;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v6 + 40) = v8;
  void *v8 = v6;
  v8[1] = sub_21868;
  return static DeveloperMode.setDeveloperModeEnabled(_:)(a4);
}

uint64_t sub_21868()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_219E0;
  }
  else {
    uint64_t v2 = sub_2197C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_2197C()
{
  (*(void (**)(void))(v0 + 24))();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_219E0()
{
  os_log_type_t v1 = sub_23990();
  sub_226E0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_239A0();
  if (os_log_type_enabled(v2, v1))
  {
    int v3 = *(unsigned __int8 *)(v0 + 60);
    uint64_t v4 = swift_slowAlloc();
    id v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109378;
    *(_DWORD *)(v0 + 56) = v3;
    sub_239B0();
    *(_WORD *)(v4 + 8) = 2112;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v6;
    sub_239B0();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v1, "[AdAttributionKit] Failed to set developer enabled with value: %{BOOL}d, error: %@", (uint8_t *)v4, 0x12u);
    sub_2241C(&qword_41280);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();

    swift_errorRelease();
    uint64_t v7 = swift_errorRelease();
  }
  (*(void (**)(uint64_t))(v0 + 24))(v7);
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

id AdAttributionKitBridge.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id AdAttributionKitBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

id AdAttributionKitBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_21D34(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_21E10;
  return v6(a1);
}

uint64_t sub_21E10()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _s17DeveloperSettings22AdAttributionKitBridgeC03getA11ModeEnabled10completionyySbc_tFZ_0(uint64_t a1, uint64_t a2)
{
  sub_2241C(&qword_41250);
  __chkstk_darwin();
  id v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23980();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  swift_retain();
  if (a1 == 1)
  {
    sub_22590((uint64_t)v5);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_23970();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    if (v8[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_23960();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_41290;
  *(void *)(v12 + 24) = v8;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t _s17DeveloperSettings22AdAttributionKitBridgeC03setA11ModeEnabled_10completionySb_yyctFZ_0(char a1, uint64_t a2, uint64_t a3)
{
  sub_2241C(&qword_41250);
  __chkstk_darwin();
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23980();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  *(void *)(v10 + 24) = 0;
  *(unsigned char *)(v10 + 32) = a1;
  *(void *)(v10 + 40) = a2;
  *(void *)(v10 + 48) = a3;
  LODWORD(a2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  swift_retain();
  if (a2 == 1)
  {
    sub_22590((uint64_t)v7);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    sub_23970();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(void *)(v10 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_23960();
      uint64_t v12 = v13;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
  }
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = &unk_41260;
  *(void *)(v14 + 24) = v10;
  if (v12 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v12;
  }
  swift_task_create();
  return swift_release();
}

uint64_t type metadata accessor for AdAttributionKitBridge()
{
  return self;
}

uint64_t sub_223BC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_223F4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_22404(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_2241C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_22460()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_224A0()
{
  uint64_t v2 = *(unsigned __int8 *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_229E8;
  *(_OWORD *)(v3 + 24) = v4;
  *(unsigned char *)(v3 + 60) = v2;
  id v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 40) = v5;
  void *v5 = v3;
  v5[1] = sub_21868;
  return static DeveloperMode.setDeveloperModeEnabled(_:)(v2);
}

uint64_t sub_22590(uint64_t a1)
{
  uint64_t v2 = sub_2241C(&qword_41250);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_225F0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_22628(uint64_t a1)
{
  long long v4 = *(int **)(v1 + 16);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_229E8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_41268 + dword_41268);
  return v6(a1, v4);
}

unint64_t sub_226E0()
{
  unint64_t result = qword_41278;
  if (!qword_41278)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_41278);
  }
  return result;
}

uint64_t sub_22720()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_22760()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_2283C;
  *(_OWORD *)(v2 + 24) = v3;
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 40) = v4;
  void *v4 = v2;
  v4[1] = sub_213EC;
  return static DeveloperMode.isDeveloperModeEnabled.getter();
}

uint64_t sub_2283C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22930(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2283C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_41268 + dword_41268);
  return v6(a1, v4);
}

uint64_t _nlc_connect(_DWORD *a1)
{
  *(void *)sp = 0;
  bootstrap_look_up(bootstrap_port, "com.apple.NetworkLinkConditioner", sp);
  if (bootstrap_look_up(bootstrap_port, "com.apple.NetworkLinkConditioner", sp))
  {
    puts("NLCd : Bootstrap failure");
    return 100;
  }
  else
  {
    mach_error_t v3 = nlc_connect(sp[0], a1, a1 + 1, &sp[1]);
    if (v3) {
      mach_error("nlc_connect:", v3);
    }
    return sp[1];
  }
}

uint64_t _nlc_disconnect(uint64_t a1)
{
  unsigned int v4 = 0;
  mach_error_t v2 = nlc_disconnect(*(_DWORD *)a1, *(_DWORD *)(a1 + 4), &v4);
  if (v2) {
    mach_error("nlc_disconnect:", v2);
  }
  mach_port_deallocate(mach_task_self_, *(_DWORD *)a1);
  return v4;
}

uint64_t _nlc_start_simulation(uint64_t a1, long long *a2)
{
  unsigned int v17 = 0;
  *((_DWORD *)a2 + 1) = 0;
  long long v3 = a2[11];
  long long v28 = a2[10];
  long long v29 = v3;
  long long v30 = a2[12];
  long long v4 = a2[7];
  long long v24 = a2[6];
  long long v25 = v4;
  long long v5 = a2[9];
  long long v26 = a2[8];
  long long v27 = v5;
  long long v6 = a2[3];
  long long v20 = a2[2];
  long long v21 = v6;
  long long v7 = a2[5];
  long long v22 = a2[4];
  long long v23 = v7;
  long long v8 = a2[1];
  long long v18 = *a2;
  long long v19 = v8;
  mach_error_t v9 = nlc_simulate(*(_DWORD *)a1, (uint64_t)&v18, 0xD0u, *(_DWORD *)(a1 + 4), &v17);
  if (v9) {
    mach_error("_nlc_start_simulation:", v9);
  }
  long long v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  long long v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  long long v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  long long v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  long long v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  long long v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_stop_simulation(uint64_t a1, long long *a2)
{
  unsigned int v17 = 0;
  *((_DWORD *)a2 + 1) = 1;
  long long v3 = a2[11];
  long long v28 = a2[10];
  long long v29 = v3;
  long long v30 = a2[12];
  long long v4 = a2[7];
  long long v24 = a2[6];
  long long v25 = v4;
  long long v5 = a2[9];
  long long v26 = a2[8];
  long long v27 = v5;
  long long v6 = a2[3];
  long long v20 = a2[2];
  long long v21 = v6;
  long long v7 = a2[5];
  long long v22 = a2[4];
  long long v23 = v7;
  long long v8 = a2[1];
  long long v18 = *a2;
  long long v19 = v8;
  mach_error_t v9 = nlc_stop_simulation(*(_DWORD *)a1, (uint64_t)&v18, 0xD0u, *(_DWORD *)(a1 + 4), &v17);
  if (v9) {
    mach_error("_nlc_stop_simulation:", v9);
  }
  long long v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  long long v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  long long v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  long long v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  long long v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  long long v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_get_status(uint64_t a1, _DWORD *a2)
{
  a2[1] = 2;
  size_t __n = 208;
  long long v4 = *((_OWORD *)a2 + 11);
  v14[10] = *((_OWORD *)a2 + 10);
  v14[11] = v4;
  v14[12] = *((_OWORD *)a2 + 12);
  long long v5 = *((_OWORD *)a2 + 7);
  v14[6] = *((_OWORD *)a2 + 6);
  v14[7] = v5;
  long long v6 = *((_OWORD *)a2 + 9);
  v14[8] = *((_OWORD *)a2 + 8);
  v14[9] = v6;
  long long v7 = *((_OWORD *)a2 + 3);
  v14[2] = *((_OWORD *)a2 + 2);
  v14[3] = v7;
  long long v8 = *((_OWORD *)a2 + 5);
  void v14[4] = *((_OWORD *)a2 + 4);
  void v14[5] = v8;
  long long v9 = *((_OWORD *)a2 + 1);
  v14[0] = *(_OWORD *)a2;
  v14[1] = v9;
  bzero(__src, 0x400uLL);
  mach_error_t status = nlc_get_status(*(_DWORD *)a1, (uint64_t)v14, 0xD0u, __src, &__n, *(_DWORD *)(a1 + 4), (_DWORD *)&__n + 1);
  if (status) {
    mach_error("_nlc_get_status:", status);
  }
  memcpy(a2, __src, __n);
  return HIDWORD(__n);
}

uint64_t nlc_connect(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  memset(v18, 0, sizeof(v18));
  *(_OWORD *)&rcv_name_12[4] = 0u;
  int rcv_name = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_t rcv_name_8 = reply_port;
  int v13 = 5395;
  *(void *)rcv_name_12 = 0x9D4C00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v13);
    mach_port_name_t reply_port = rcv_name_8;
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)&v13, 3, 0x18u, 0x40u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 40368)
      {
        if (v13 < 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[8] == 1 && rcv_name == 56 && !rcv_name_4 && HIWORD(v18[0]) << 16 == 1114112)
          {
            uint64_t v10 = 0;
            int v11 = v18[3];
            *a2 = *(_DWORD *)&rcv_name_12[12];
            *a3 = v11;
            *a4 = v18[4];
            return v10;
          }
        }
        else if (rcv_name == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[16])
          {
            if (rcv_name_4) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&rcv_name_12[16];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v13);
      return v10;
    }
    mig_dealloc_reply_port(rcv_name_8);
  }
  return v10;
}

uint64_t nlc_disconnect(mach_port_t a1, int a2, _DWORD *a3)
{
  long long v12 = 0u;
  v10.msgh_size = 0;
  NDR_record_t v11 = NDR_record;
  LODWORD(v12) = a2;
  mach_port_t reply_port = mig_get_reply_port();
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_port = 0x9D4D00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    mach_port_t reply_port = v10.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }
    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (v10.msgh_id == 40369)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = DWORD1(v12);
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v10);
    return v7;
  }
  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

uint64_t nlc_simulate(mach_port_t a1, uint64_t a2, unsigned int a3, int a4, _DWORD *a5)
{
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  NDR_record_t v17 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(_DWORD *)((char *)&rcv_name + v10 + 36) = a4;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = a1;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = 5395;
    *(void *)&rcv_name.msgh_voucher_port = 0x9D4E00000000;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v13 = mach_msg(&rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
      return v5;
    }
    if (v13)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v5;
    }
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v5 = 4294966988;
    }
    else if (rcv_name.msgh_id == 40370)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }
      uint64_t v5 = 4294966996;
    }
    else
    {
      uint64_t v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy(&rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_stop_simulation(mach_port_t a1, uint64_t a2, unsigned int a3, int a4, _DWORD *a5)
{
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  NDR_record_t v17 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(_DWORD *)((char *)&rcv_name + v10 + 36) = a4;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = a1;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = 5395;
    *(void *)&rcv_name.msgh_voucher_port = 0x9D4F00000000;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v13 = mach_msg(&rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
      return v5;
    }
    if (v13)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v5;
    }
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v5 = 4294966988;
    }
    else if (rcv_name.msgh_id == 40371)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }
      uint64_t v5 = 4294966996;
    }
    else
    {
      uint64_t v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy(&rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_get_status(mach_port_t a1, uint64_t a2, unsigned int a3, void *a4, _DWORD *a5, int a6, _DWORD *a7)
{
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)size_t __n = 0u;
  long long v27 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  NDR_record_t v25 = NDR_record;
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(__n[0]) = a3;
    uint64_t v14 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v15 = v14 + 40;
    *(_DWORD *)((char *)&rcv_name + v14 + 36) = a6;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = a1;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = 5395;
    *(void *)&rcv_name.msgh_voucher_port = 0x9D5000000000;
    if (&_voucher_mach_msg_set)
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v17 = mach_msg(&rcv_name, 3, v15, 0x434u, reply_port, 0, 0);
    uint64_t v7 = v17;
    if ((v17 - 268435458) <= 0xE && ((1 << (v17 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
      return v7;
    }
    if (v17)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v7;
    }
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (rcv_name.msgh_id == 40372)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size - 1069 <= 0xFFFFFBFE)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v18 = 1;
          }
          else {
            BOOL v18 = LODWORD(__n[0]) == 0;
          }
          if (!v18 && rcv_name.msgh_size == 36) {
            uint64_t v7 = LODWORD(__n[0]);
          }
          else {
            uint64_t v7 = 4294966996;
          }
          goto LABEL_27;
        }
        if (!rcv_name.msgh_remote_port)
        {
          uint64_t v7 = LODWORD(__n[0]);
          if (LODWORD(__n[0])) {
            goto LABEL_27;
          }
          int v21 = HIDWORD(__n[0]);
          if (HIDWORD(__n[0]) <= 0x400)
          {
            uint64_t v7 = 4294966996;
            if (rcv_name.msgh_size - 44 >= HIDWORD(__n[0]))
            {
              unsigned int v22 = (HIDWORD(__n[0]) + 3) & 0xFFFFFFFC;
              if (rcv_name.msgh_size == v22 + 44)
              {
                long long v23 = (char *)&rcv_name + v22 - 1024;
                memcpy(a4, &__n[1], HIDWORD(__n[0]));
                uint64_t v7 = 0;
                *a5 = v21;
                *a7 = *((_DWORD *)v23 + 266);
                return v7;
              }
            }
            goto LABEL_27;
          }
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_27:
    mach_msg_destroy(&rcv_name);
    return v7;
  }
  return 4294966989;
}

uint64_t sub_2380C()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_23830(v0);
}

void sub_23830()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Tput: Cleanup Cancel if still Cancelling after 5 seconds", v0, 2u);
}

void sub_23878()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Tput: Discard results, no active test", v0, 2u);
}

void sub_238C0(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Tput: Errors:\n%@", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_23960()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_23970()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_23980()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_23990()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_239A0()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_239B0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t AMSHashIfNeeded()
{
  return _AMSHashIfNeeded();
}

uint64_t AMSLogKey()
{
  return _AMSLogKey();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return _CFCalendarAddComponents(calendar, at, options, componentDesc);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return _CFCalendarComposeAbsoluteTime(calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return _CFCalendarCopyCurrent();
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  long long v3 = va_arg(va, const char *);
  return _CFCalendarDecomposeAbsoluteTime(calendar, at, v3);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
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

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t DBSStringForDisplayZoomOption()
{
  return _DBSStringForDisplayZoomOption();
}

uint64_t HTUIActivationToggleFooterPart1()
{
  return _HTUIActivationToggleFooterPart1();
}

uint64_t HTUIActivationToggleFooterPart2()
{
  return _HTUIActivationToggleFooterPart2();
}

uint64_t HTUIActivationToggleFooterPartJoiner_Part1_Part2()
{
  return _HTUIActivationToggleFooterPartJoiner_Part1_Part2();
}

uint64_t HTUIActivationToggleTitle()
{
  return _HTUIActivationToggleTitle();
}

uint64_t HTUIAppsSectionFooter()
{
  return _HTUIAppsSectionFooter();
}

uint64_t HTUIAppsSectionTitle()
{
  return _HTUIAppsSectionTitle();
}

uint64_t HTUIAsteriskedRangeFromString()
{
  return _HTUIAsteriskedRangeFromString();
}

uint64_t HTUIDialogOKButton()
{
  return _HTUIDialogOKButton();
}

uint64_t HTUIDurationLabel()
{
  return _HTUIDurationLabel();
}

uint64_t HTUIFetchingAppsErrorMessage()
{
  return _HTUIFetchingAppsErrorMessage();
}

uint64_t HTUIFetchingAppsErrorTitle()
{
  return _HTUIFetchingAppsErrorTitle();
}

uint64_t HTUIFetchingHangsErrorMessage()
{
  return _HTUIFetchingHangsErrorMessage();
}

uint64_t HTUIFetchingHangsErrorTitle()
{
  return _HTUIFetchingHangsErrorTitle();
}

uint64_t HTUIFileFormatSpindump()
{
  return _HTUIFileFormatSpindump();
}

uint64_t HTUIFileFormatTailspin()
{
  return _HTUIFileFormatTailspin();
}

uint64_t HTUIInternalRedirect()
{
  return _HTUIInternalRedirect();
}

uint64_t HTUILearnMoreFileTypesIPS()
{
  return _HTUILearnMoreFileTypesIPS();
}

uint64_t HTUILearnMoreFileTypesShare()
{
  return _HTUILearnMoreFileTypesShare();
}

uint64_t HTUILearnMoreFileTypesTailspin()
{
  return _HTUILearnMoreFileTypesTailspin();
}

uint64_t HTUILearnMoreFileTypesTitle()
{
  return _HTUILearnMoreFileTypesTitle();
}

uint64_t HTUILearnMoreHUDContent()
{
  return _HTUILearnMoreHUDContent();
}

uint64_t HTUILearnMoreHUDTitle()
{
  return _HTUILearnMoreHUDTitle();
}

uint64_t HTUILearnMoreLogLimitContent()
{
  return _HTUILearnMoreLogLimitContent();
}

uint64_t HTUILearnMoreLogLimitTitle()
{
  return _HTUILearnMoreLogLimitTitle();
}

uint64_t HTUILearnMoreTitle()
{
  return _HTUILearnMoreTitle();
}

uint64_t HTUILearnMoreURL()
{
  return _HTUILearnMoreURL();
}

uint64_t HTUILearnMoreURLPrefix()
{
  return _HTUILearnMoreURLPrefix();
}

uint64_t HTUILearnMoreWhatAreHangsContent()
{
  return _HTUILearnMoreWhatAreHangsContent();
}

uint64_t HTUILearnMoreWhatAreHangsTitle()
{
  return _HTUILearnMoreWhatAreHangsTitle();
}

uint64_t HTUILogsSectionTitle()
{
  return _HTUILogsSectionTitle();
}

uint64_t HTUILogsThresholdSelectorTitle()
{
  return _HTUILogsThresholdSelectorTitle();
}

uint64_t HTUIPlaceholderNoApps()
{
  return _HTUIPlaceholderNoApps();
}

uint64_t HTUIPlaceholderNoLogs()
{
  return _HTUIPlaceholderNoLogs();
}

uint64_t HTUISelectButton()
{
  return _HTUISelectButton();
}

uint64_t HTUIShareButton()
{
  return _HTUIShareButton();
}

uint64_t HTUITimestampLabel()
{
  return _HTUITimestampLabel();
}

uint64_t LocalizableGTStringKeyForKey()
{
  return _LocalizableGTStringKeyForKey();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

uint64_t SCNetworkInterfaceTypeGetTemporaryOverrideCost()
{
  return _SCNetworkInterfaceTypeGetTemporaryOverrideCost();
}

uint64_t SCNetworkInterfaceTypeSetTemporaryOverrideCost()
{
  return _SCNetworkInterfaceTypeSetTemporaryOverrideCost();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesApplyChanges(prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return _SCPreferencesCreateWithAuthorization(allocator, name, prefsID, authorization);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

uint64_t SFKillProcessNamed()
{
  return _SFKillProcessNamed();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return _SFLocalizableWAPIStringKeyForKey();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t UISystemFontBoldForSize()
{
  return _UISystemFontBoldForSize();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_look_up(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t lockdown_delete_pair_records()
{
  return _lockdown_delete_pair_records();
}

long double log(long double __x)
{
  return _log(__x);
}

void mach_error(const char *str, mach_error_t error_value)
{
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

uint64_t network_config_get_default_multipath_service_type()
{
  return _network_config_get_default_multipath_service_type();
}

uint64_t network_config_get_l4s_enabled()
{
  return _network_config_get_l4s_enabled();
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

void objc_moveWeak(id *to, id *from)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

int puts(const char *a1)
{
  return _puts(a1);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _[a1 OSLogObject];
}

id objc_msgSend_UIImage(void *a1, const char *a2, ...)
{
  return _[a1 UIImage];
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__defaultFontForTableViewStyle_isSectionHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultFontForTableViewStyle:isSectionHeader:");
}

id objc_msgSend__defaultTextColorForTableViewStyle_isSectionHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultTextColorForTableViewStyle:isSectionHeader:");
}

id objc_msgSend__disclosureIndicatorSize(void *a1, const char *a2, ...)
{
  return _[a1 _disclosureIndicatorSize];
}

id objc_msgSend__fillNetworkQualityCell(void *a1, const char *a2, ...)
{
  return _[a1 _fillNetworkQualityCell];
}

id objc_msgSend__setCentersPopoverIfSourceViewNotSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCentersPopoverIfSourceViewNotSet:");
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__textColorForDurationLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textColorForDurationLevel:");
}

id objc_msgSend__updateNavigationButtonStateWithNewOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateNavigationButtonStateWithNewOption:");
}

id objc_msgSend__updateSandboxSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSandboxSpecifier:");
}

id objc_msgSend_accessoryButton(void *a1, const char *a2, ...)
{
  return _[a1 accessoryButton];
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithTitle_image_identifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:image:identifier:handler:");
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

id objc_msgSend_addBulletedListItemWithTitle_description_accessoryButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBulletedListItemWithTitle:description:accessoryButton:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addFooterHyperlinkWithRange_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFooterHyperlinkWithRange:target:action:");
}

id objc_msgSend_addNewProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNewProfile:");
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

id objc_msgSend_addSectionWithHeader_content_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSectionWithHeader:content:");
}

id objc_msgSend_addSectionWithHeader_content_accessoryButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSectionWithHeader:content:accessoryButton:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allProfilesArray(void *a1, const char *a2, ...)
{
  return _[a1 allProfilesArray];
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_saveAccount_verifyCredentials_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_saveAccount:verifyCredentials:");
}

id objc_msgSend_ams_sharedAccountStoreForMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStoreForMediaType:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyChanges(void *a1, const char *a2, ...)
{
  return _[a1 applyChanges];
}

id objc_msgSend_applySimulationStatusChanges(void *a1, const char *a2, ...)
{
  return _[a1 applySimulationStatusChanges];
}

id objc_msgSend_appsFinder(void *a1, const char *a2, ...)
{
  return _[a1 appsFinder];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_availableThresholdsShortNames(void *a1, const char *a2, ...)
{
  return _[a1 availableThresholdsShortNames];
}

id objc_msgSend_availableThresholdsValues(void *a1, const char *a2, ...)
{
  return _[a1 availableThresholdsValues];
}

id objc_msgSend_bagForProfile_profileVersion_processInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForProfile:profileVersion:processInfo:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cachedCellularOverrideValue(void *a1, const char *a2, ...)
{
  return _[a1 cachedCellularOverrideValue];
}

id objc_msgSend_cachedDeveloperAppsSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 cachedDeveloperAppsSpecifiers];
}

id objc_msgSend_cachedHangEventsSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 cachedHangEventsSpecifiers];
}

id objc_msgSend_cachedPrefer5GValue(void *a1, const char *a2, ...)
{
  return _[a1 cachedPrefer5GValue];
}

id objc_msgSend_cachedSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 cachedSpecifiers];
}

id objc_msgSend_cachedValue(void *a1, const char *a2, ...)
{
  return _[a1 cachedValue];
}

id objc_msgSend_cachedWifiOverrideValue(void *a1, const char *a2, ...)
{
  return _[a1 cachedWifiOverrideValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAllNetworking(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllNetworking];
}

id objc_msgSend_cellType(void *a1, const char *a2, ...)
{
  return _[a1 cellType];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_classKitAppInstalled(void *a1, const char *a2, ...)
{
  return _[a1 classKitAppInstalled];
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classNamed:");
}

id objc_msgSend_clearCachesForType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCachesForType:completion:");
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _[a1 clientInfo];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configurationState(void *a1, const char *a2, ...)
{
  return _[a1 configurationState];
}

id objc_msgSend_configurationWithIdentifier_previewProvider_actionProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithIdentifier:previewProvider:actionProvider:");
}

id objc_msgSend_configurationWithTextStyle_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithTextStyle:scale:");
}

id objc_msgSend_configureWithOpaqueBackground(void *a1, const char *a2, ...)
{
  return _[a1 configureWithOpaqueBackground];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintEqualToSystemSpacingAfterAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToSystemSpacingAfterAnchor:multiplier:");
}

id objc_msgSend_constraintGreaterThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return _[a1 control];
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

id objc_msgSend_createPresetProfiles(void *a1, const char *a2, ...)
{
  return _[a1 createPresetProfiles];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_ctClient(void *a1, const char *a2, ...)
{
  return _[a1 ctClient];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentDisplayZoomMode(void *a1, const char *a2, ...)
{
  return _[a1 currentDisplayZoomMode];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _[a1 currentProcess];
}

id objc_msgSend_currentProfile(void *a1, const char *a2, ...)
{
  return _[a1 currentProfile];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatter];
}

id objc_msgSend_defaultBackgroundConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultBackgroundConfiguration];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultConfiguration];
}

id objc_msgSend_defaultController(void *a1, const char *a2, ...)
{
  return _[a1 defaultController];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delayedAsyncLoadSpecifiersWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delayedAsyncLoadSpecifiersWithCompletion:");
}

id objc_msgSend_deleteButtonSpecifierWithName_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteButtonSpecifierWithName:target:action:");
}

id objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_developerApps(void *a1, const char *a2, ...)
{
  return _[a1 developerApps];
}

id objc_msgSend_developerAppsSpecifiersFromList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "developerAppsSpecifiersFromList:");
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

id objc_msgSend_differenceFromArray_withOptions_usingEquivalenceTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "differenceFromArray:withOptions:usingEquivalenceTest:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return _[a1 dismiss];
}

id objc_msgSend_dismissAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissAnimated:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_displayZoomModes(void *a1, const char *a2, ...)
{
  return _[a1 displayZoomModes];
}

id objc_msgSend_displayZoomOption(void *a1, const char *a2, ...)
{
  return _[a1 displayZoomOption];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downlinkResponsiveness(void *a1, const char *a2, ...)
{
  return _[a1 downlinkResponsiveness];
}

id objc_msgSend_downloadResults(void *a1, const char *a2, ...)
{
  return _[a1 downloadResults];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_durationFormatter(void *a1, const char *a2, ...)
{
  return _[a1 durationFormatter];
}

id objc_msgSend_durationLevel(void *a1, const char *a2, ...)
{
  return _[a1 durationLevel];
}

id objc_msgSend_editingStyle(void *a1, const char *a2, ...)
{
  return _[a1 editingStyle];
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_enableNLC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableNLC:");
}

id objc_msgSend_enablePrefer5G_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enablePrefer5G:completion:");
}

id objc_msgSend_enablePrefer5G_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enablePrefer5G:specifier:");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_entries(void *a1, const char *a2, ...)
{
  return _[a1 entries];
}

id objc_msgSend_enumerateApplicationsOfType_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateApplicationsOfType:block:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_expirationTimeInterval(void *a1, const char *a2, ...)
{
  return _[a1 expirationTimeInterval];
}

id objc_msgSend_fetchNCOStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchNCOStatusWithCompletion:");
}

id objc_msgSend_fetchPrefer5GEnabledWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPrefer5GEnabledWithCompletion:");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return _[a1 fileSize];
}

id objc_msgSend_fileTypeLabel(void *a1, const char *a2, ...)
{
  return _[a1 fileTypeLabel];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_findApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findApps:");
}

id objc_msgSend_findEventsFilteringDeveloperApps_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEventsFilteringDeveloperApps:completionHandler:");
}

id objc_msgSend_findProcessingEventsFilteringDeveloperApps_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findProcessingEventsFilteringDeveloperApps:completionHandler:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return _[a1 firstResponder];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontAttributes(void *a1, const char *a2, ...)
{
  return _[a1 fontAttributes];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_formattedUsernameFromUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedUsernameFromUsername:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_generateBestRepresentationForRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateBestRepresentationForRequest:completionHandler:");
}

id objc_msgSend_getActiveConditions(void *a1, const char *a2, ...)
{
  return _[a1 getActiveConditions];
}

id objc_msgSend_getCurrentDataServiceDescriptorSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCurrentDataServiceDescriptorSync:");
}

id objc_msgSend_getDeveloperModeEnabledWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDeveloperModeEnabledWithCompletion:");
}

id objc_msgSend_getPreferCellOverWiFiWithOptions_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPreferCellOverWiFiWithOptions:reply:");
}

id objc_msgSend_goToNextAppsState(void *a1, const char *a2, ...)
{
  return _[a1 goToNextAppsState];
}

id objc_msgSend_goToNextLogsState(void *a1, const char *a2, ...)
{
  return _[a1 goToNextLogsState];
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_handlePendingURL(void *a1, const char *a2, ...)
{
  return _[a1 handlePendingURL];
}

id objc_msgSend_hangEventsSpecifiersForDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangEventsSpecifiersForDict:");
}

id objc_msgSend_hangID(void *a1, const char *a2, ...)
{
  return _[a1 hangID];
}

id objc_msgSend_hangTracerSettings(void *a1, const char *a2, ...)
{
  return _[a1 hangTracerSettings];
}

id objc_msgSend_hangTracerThreshold(void *a1, const char *a2, ...)
{
  return _[a1 hangTracerThreshold];
}

id objc_msgSend_hangsDataFinder(void *a1, const char *a2, ...)
{
  return _[a1 hangsDataFinder];
}

id objc_msgSend_hangsEvents(void *a1, const char *a2, ...)
{
  return _[a1 hangsEvents];
}

id objc_msgSend_hasActiveNetworkCondition(void *a1, const char *a2, ...)
{
  return _[a1 hasActiveNetworkCondition];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return _[a1 iconView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _[a1 index];
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForIndexPath:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifierID:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathsForSelectedRows(void *a1, const char *a2, ...)
{
  return _[a1 indexPathsForSelectedRows];
}

id objc_msgSend_initWithAccount_presentingViewController_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:presentingViewController:options:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithActivityItems_applicationActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityItems:applicationActivities:");
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArrangedSubviews:");
}

id objc_msgSend_initWithBag_account_clientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBag:account:clientInfo:");
}

id objc_msgSend_initWithBarButtonSystemItem_primaryAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:primaryAction:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithDoubleValue_unit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDoubleValue:unit:");
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithError:");
}

id objc_msgSend_initWithFileAtURL_size_scale_representationTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileAtURL:size:scale:representationTypes:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithLogUpdateCallback_tailspinSavedCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLogUpdateCallback:tailspinSavedCallback:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:forKeys:");
}

id objc_msgSend_initWithPrimaryAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrimaryAction:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRequest_presentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:presentingViewController:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTitle_detailText_symbolName_contentLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:detailText:symbolName:contentLayout:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithWorkspace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWorkspace:");
}

id objc_msgSend_initWorkspaceWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWorkspaceWithService:");
}

id objc_msgSend_insertContiguousSpecifiers_afterSpecifierID_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertContiguousSpecifiers:afterSpecifierID:animated:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_insertions(void *a1, const char *a2, ...)
{
  return _[a1 insertions];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isAdAttributionKitSupported(void *a1, const char *a2, ...)
{
  return _[a1 isAdAttributionKitSupported];
}

id objc_msgSend_isAnimating(void *a1, const char *a2, ...)
{
  return _[a1 isAnimating];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isBeingProcessed(void *a1, const char *a2, ...)
{
  return _[a1 isBeingProcessed];
}

id objc_msgSend_isCellularInexpensive(void *a1, const char *a2, ...)
{
  return _[a1 isCellularInexpensive];
}

id objc_msgSend_isClassKitAppInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isClassKitAppInstalled];
}

id objc_msgSend_isDeveloperModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isDeveloperModeEnabled];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _[a1 isEditing];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHangTracerEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isHangTracerEnabled];
}

id objc_msgSend_isHighDataModeSupported(void *a1, const char *a2, ...)
{
  return _[a1 isHighDataModeSupported];
}

id objc_msgSend_isHighDataModeSupported_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHighDataModeSupported:error:");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _[a1 isInternalBuild];
}

id objc_msgSend_isLogFile(void *a1, const char *a2, ...)
{
  return _[a1 isLogFile];
}

id objc_msgSend_isNCOSupported(void *a1, const char *a2, ...)
{
  return _[a1 isNCOSupported];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isValid_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid:format:");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_legibilityWeight(void *a1, const char *a2, ...)
{
  return _[a1 legibilityWeight];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 lightGrayColor];
}

id objc_msgSend_loadFromSelectedProfile(void *a1, const char *a2, ...)
{
  return _[a1 loadFromSelectedProfile];
}

id objc_msgSend_loadPreferences(void *a1, const char *a2, ...)
{
  return _[a1 loadPreferences];
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_loadURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadURL:");
}

id objc_msgSend_loadValuesFromCurrentProfile(void *a1, const char *a2, ...)
{
  return _[a1 loadValuesFromCurrentProfile];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
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

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 localizedUppercaseString];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeSpecifierForHangsDataEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeSpecifierForHangsDataEntry:");
}

id objc_msgSend_markGroup_asLoading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markGroup:asLoading:");
}

id objc_msgSend_meanLatency(void *a1, const char *a2, ...)
{
  return _[a1 meanLatency];
}

id objc_msgSend_menuWithChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithChildren:");
}

id objc_msgSend_milliseconds(void *a1, const char *a2, ...)
{
  return _[a1 milliseconds];
}

id objc_msgSend_monospacedDigitSystemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monospacedDigitSystemFontOfSize:weight:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_na_dictionaryByMappingValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_dictionaryByMappingValues:");
}

id objc_msgSend_na_safeAddObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_safeAddObject:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_ncoAlertWithText_cancelHandler_defaultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ncoAlertWithText:cancelHandler:defaultHandler:");
}

id objc_msgSend_ncoData(void *a1, const char *a2, ...)
{
  return _[a1 ncoData];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_overriddenInterfaceCostInexpensive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overriddenInterfaceCostInexpensive:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_percentLost(void *a1, const char *a2, ...)
{
  return _[a1 percentLost];
}

id objc_msgSend_performAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 performAuthentication];
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performanceTestWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performanceTestWithConfiguration:");
}

id objc_msgSend_pingResults(void *a1, const char *a2, ...)
{
  return _[a1 pingResults];
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return _[a1 placeholder];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 popoverPresentationController];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_prepareSpecifiersMetadata(void *a1, const char *a2, ...)
{
  return _[a1 prepareSpecifiersMetadata];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_presentErrorWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentErrorWithTitle:message:");
}

id objc_msgSend_presentModalViewController_withTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentModalViewController:withTransition:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return _[a1 principalClass];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processingHangsEvents(void *a1, const char *a2, ...)
{
  return _[a1 processingHangsEvents];
}

id objc_msgSend_profileDictionaryWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profileDictionaryWithName:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_rating(void *a1, const char *a2, ...)
{
  return _[a1 rating];
}

id objc_msgSend_rectForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectForRowAtIndexPath:");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_refreshAdAttributionKitDeveloperModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 refreshAdAttributionKitDeveloperModeEnabled];
}

id objc_msgSend_refreshArrays(void *a1, const char *a2, ...)
{
  return _[a1 refreshArrays];
}

id objc_msgSend_refreshContentsWithSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshContentsWithSpecifier:");
}

id objc_msgSend_registerForTraitChanges_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTraitChanges:withHandler:");
}

id objc_msgSend_registerForTraitChanges_withTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTraitChanges:withTarget:action:");
}

id objc_msgSend_reloadAsyncSpecifiersWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadAsyncSpecifiersWithCompletion:");
}

id objc_msgSend_reloadNCOGroup(void *a1, const char *a2, ...)
{
  return _[a1 reloadNCOGroup];
}

id objc_msgSend_reloadPrefer5GSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadPrefer5GSpecifier:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:animated:");
}

id objc_msgSend_reloadSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifierID:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removals(void *a1, const char *a2, ...)
{
  return _[a1 removals];
}

id objc_msgSend_removeContiguousSpecifiers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContiguousSpecifiers:animated:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeProfileWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeProfileWithName:");
}

id objc_msgSend_removeSpecifierID_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifierID:animated:");
}

id objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectsInRange:withObjectsFromArray:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 rightBarButtonItem];
}

id objc_msgSend_runNetworkQualityWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runNetworkQualityWithCompletionHandler:");
}

id objc_msgSend_runWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithCompletionHandler:");
}

id objc_msgSend_saveValuesToCurrentProfile(void *a1, const char *a2, ...)
{
  return _[a1 saveValuesToCurrentProfile];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_selectRowAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectRowAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_selectedOverride(void *a1, const char *a2, ...)
{
  return _[a1 selectedOverride];
}

id objc_msgSend_selectedProfileName(void *a1, const char *a2, ...)
{
  return _[a1 selectedProfileName];
}

id objc_msgSend_sendActivationEvent_developerAppCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendActivationEvent:developerAppCount:");
}

id objc_msgSend_sendHangThresholdChangedEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHangThresholdChangedEvent:");
}

id objc_msgSend_sendLogSharedEvent(void *a1, const char *a2, ...)
{
  return _[a1 sendLogSharedEvent];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return _[a1 sender];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setAccountMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountMediaType:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAllProfilesArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllProfilesArray:");
}

id objc_msgSend_setAllowsMultipleSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsMultipleSelection:");
}

id objc_msgSend_setAlwaysShowsDecimalSeparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysShowsDecimalSeparator:");
}

id objc_msgSend_setAutomaticallyUpdatesBackgroundConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyUpdatesBackgroundConfiguration:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundConfiguration:");
}

id objc_msgSend_setBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarButtonItem:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setCachedAdAttributionKitDeveloperModeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedAdAttributionKitDeveloperModeEnabled:");
}

id objc_msgSend_setCachedCellularOverrideValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedCellularOverrideValue:");
}

id objc_msgSend_setCachedDeveloperAppsSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedDeveloperAppsSpecifiers:");
}

id objc_msgSend_setCachedEntries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedEntries:");
}

id objc_msgSend_setCachedHangEventsSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedHangEventsSpecifiers:");
}

id objc_msgSend_setCachedNCOStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedNCOStatus:");
}

id objc_msgSend_setCachedPrefer5GValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedPrefer5GValue:");
}

id objc_msgSend_setCachedSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedSpecifiers:");
}

id objc_msgSend_setCachedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedValue:");
}

id objc_msgSend_setCachedWifiOverrideValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedWifiOverrideValue:");
}

id objc_msgSend_setCellularInexpensive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellularInexpensive:");
}

id objc_msgSend_setChecked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChecked:");
}

id objc_msgSend_setClientName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientName:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setCompactAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompactAppearance:");
}

id objc_msgSend_setConcurrentStreams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConcurrentStreams:");
}

id objc_msgSend_setConfirmationAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationAction:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentTypeUTI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentTypeUTI:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCurrentProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentProfile:");
}

id objc_msgSend_setCustomProfilesArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomProfilesArray:");
}

id objc_msgSend_setCustomSpacing_afterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomSpacing:afterView:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeveloperApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeveloperApps:");
}

id objc_msgSend_setDeveloperModeEnabled_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeveloperModeEnabled:completion:");
}

id objc_msgSend_setDisplayZoomMode_withRelaunchURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayZoomMode:withRelaunchURL:");
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:animated:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGroupingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupingSize:");
}

id objc_msgSend_setHangTracerThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangTracerThreshold:");
}

id objc_msgSend_setHangsEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangsEvents:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setIconVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconVariant:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInterfaceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceType:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLeftBarButtonItem_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:animated:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLinkRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkRange:");
}

id objc_msgSend_setMaximum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximum:");
}

id objc_msgSend_setMaximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumContentSizeCategory:");
}

id objc_msgSend_setMaximumFractionDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumFractionDigits:");
}

id objc_msgSend_setMinimum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimum:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setNumberFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberFormatter:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverriddenInterfaceCostInexpensive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverriddenInterfaceCostInexpensive:");
}

id objc_msgSend_setParentController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentController:");
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermittedArrowDirections:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPreferCellOverWiFiWithOptions_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferCellOverWiFiWithOptions:reply:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setProcessingHangsEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessingHangsEvents:");
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperties:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setReusesCells_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReusesCells:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRightBarButtonItem_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:animated:");
}

id objc_msgSend_setRootController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootController:");
}

id objc_msgSend_setScrollEdgeAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEdgeAppearance:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setSelected_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:animated:");
}

id objc_msgSend_setSelectedDisplayZoomOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedDisplayZoomOption:");
}

id objc_msgSend_setSelectedProfileName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedProfileName:");
}

id objc_msgSend_setSimulatorRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSimulatorRunning:");
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceRect:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifier:");
}

id objc_msgSend_setStandardAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStandardAppearance:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setSuppliedProfilesArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuppliedProfilesArray:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTestDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestDuration:");
}

id objc_msgSend_setTestObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestObject:");
}

id objc_msgSend_setTestResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestResults:");
}

id objc_msgSend_setTestStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestStatus:");
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

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUnifiedHangsEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnifiedHangsEvents:");
}

id objc_msgSend_setUnitOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnitOptions:");
}

id objc_msgSend_setUnitStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnitStyle:");
}

id objc_msgSend_setUseSecureConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseSecureConnection:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValues_titles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:titles:");
}

id objc_msgSend_setValues_titles_shortTitles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:titles:shortTitles:");
}

id objc_msgSend_setValuesForKeysWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesForKeysWithDictionary:");
}

id objc_msgSend_setWifiOverride_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWifiOverride:completion:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setupController(void *a1, const char *a2, ...)
{
  return _[a1 setupController];
}

id objc_msgSend_setupWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithDictionary:");
}

id objc_msgSend_sf_isiPad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sf_isiPad");
}

id objc_msgSend_shareEntry_forRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareEntry:forRowAtIndexPath:");
}

id objc_msgSend_shareLogs_sender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareLogs:sender:");
}

id objc_msgSend_shareSelectedHangs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareSelectedHangs:");
}

id objc_msgSend_sharedAccountsConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountsConfig];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfig];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedGenerator(void *a1, const char *a2, ...)
{
  return _[a1 sharedGenerator];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldEnableSelectButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 shouldEnableSelectButtonItem];
}

id objc_msgSend_shouldShowExpirationFooter(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowExpirationFooter];
}

id objc_msgSend_showConfirmationViewForSpecifier_useAlert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showConfirmationViewForSpecifier:useAlert:");
}

id objc_msgSend_showController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showController:");
}

id objc_msgSend_simulatedProfileName(void *a1, const char *a2, ...)
{
  return _[a1 simulatedProfileName];
}

id objc_msgSend_simulatorRunning(void *a1, const char *a2, ...)
{
  return _[a1 simulatorRunning];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sortedEntriesByFileType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedEntriesByFileType:");
}

id objc_msgSend_sortedHangIDsByCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedHangIDsByCreationDate:");
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndex:");
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifierNameForEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierNameForEntry:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_specifiersOnlyWhenEnabled(void *a1, const char *a2, ...)
{
  return _[a1 specifiersOnlyWhenEnabled];
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return _[a1 speed];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startTestWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTestWithCompletion:");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromByteCount:countStyle:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromMeasurement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromMeasurement:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_symptomsFeed(void *a1, const char *a2, ...)
{
  return _[a1 symptomsFeed];
}

id objc_msgSend_synchronizeUserDefaultsDomain_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeUserDefaultsDomain:keys:");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _[a1 systemOrangeColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_tableCellBlueTextColor(void *a1, const char *a2, ...)
{
  return _[a1 tableCellBlueTextColor];
}

id objc_msgSend_tableView_shouldHighlightRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:shouldHighlightRowAtIndexPath:");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_testObject(void *a1, const char *a2, ...)
{
  return _[a1 testObject];
}

id objc_msgSend_testResults(void *a1, const char *a2, ...)
{
  return _[a1 testResults];
}

id objc_msgSend_testStatus(void *a1, const char *a2, ...)
{
  return _[a1 testStatus];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_thresholdSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 thresholdSpecifiers];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topItem(void *a1, const char *a2, ...)
{
  return _[a1 topItem];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_unifiedHangsEvents(void *a1, const char *a2, ...)
{
  return _[a1 unifiedHangsEvents];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_updateAndReloadNCOStatusIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updateAndReloadNCOStatusIfNeeded];
}

id objc_msgSend_updateConfigurationUsingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfigurationUsingState:");
}

id objc_msgSend_updateDeveloperAppsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDeveloperAppsWithCompletion:");
}

id objc_msgSend_updateDoneButton(void *a1, const char *a2, ...)
{
  return _[a1 updateDoneButton];
}

id objc_msgSend_updateDurationFont(void *a1, const char *a2, ...)
{
  return _[a1 updateDurationFont];
}

id objc_msgSend_updateFromHangEventSpecifiers_toSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFromHangEventSpecifiers:toSpecifiers:");
}

id objc_msgSend_updateFromSelectedProfile(void *a1, const char *a2, ...)
{
  return _[a1 updateFromSelectedProfile];
}

id objc_msgSend_updateHangEventsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHangEventsWithCompletion:");
}

id objc_msgSend_updateProcessingHangEventsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProcessingHangEventsWithCompletion:");
}

id objc_msgSend_updateRightBarButtonItemAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRightBarButtonItemAnimated:");
}

id objc_msgSend_updateRightBarButtonItems(void *a1, const char *a2, ...)
{
  return _[a1 updateRightBarButtonItems];
}

id objc_msgSend_updateShareButtonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 updateShareButtonEnabled];
}

id objc_msgSend_updateSpecifiersWithHangEvents_processingHangEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSpecifiersWithHangEvents:processingHangEvents:");
}

id objc_msgSend_updateTestStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTestStatus:");
}

id objc_msgSend_updatedConfigurationForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedConfigurationForState:");
}

id objc_msgSend_uploadResults(void *a1, const char *a2, ...)
{
  return _[a1 uploadResults];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueLabel(void *a1, const char *a2, ...)
{
  return _[a1 valueLabel];
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCompletion:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_wifiOverride(void *a1, const char *a2, ...)
{
  return _[a1 wifiOverride];
}

id objc_msgSend_wifiShortTitles(void *a1, const char *a2, ...)
{
  return _[a1 wifiShortTitles];
}