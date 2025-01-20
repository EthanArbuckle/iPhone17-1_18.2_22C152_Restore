id sub_100005960(uint64_t a1, void *a2)
{
  return [a2 _updateAIEnabled];
}

id sub_100006350(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) AIEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != result)
  {
    [*(id *)(a1 + 32) setAIEnabled:v3 != 0];
    v4 = *(void **)(a1 + 32);
    return _[v4 _resetAllSpecifiers];
  }
  return result;
}

void sub_100006480(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) devicePickerSpecifier];
  [v1 refreshSpecifierIfNeeded];
}

void sub_100007794(id a1, BSProcessHandle *a2, NSError *a3)
{
  if (a3) {
    NSLog(@"open application request failed! error: %@", a2, a3);
  }
  else {
    NSLog(@"open application request succeeded! process: %@", a2, a2);
  }
}

void sub_100008008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008024(id a1, BOOL a2, NSError *a3)
{
  v4 = a3;
  if (v4 || !a2)
  {
    v5 = sub_100021030();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100065370((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void sub_100008084(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    uint64_t v8 = sub_100021030();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000653DC((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    [WeakRetained setFocusActive:[v5 isActive]];
  }
}

void sub_100008250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008274(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_100008820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008844(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 BOOLValue];

  [WeakRetained _updateAnnounceEnabled:v4];
}

void sub_1000089EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008A10(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 BOOLValue] ^ 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAnnounceMuted:v3];
}

id sub_100008AF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_100008B74(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingAnnounceEnablementChangeFromUserNotifications:0];
  unsigned int v2 = [*(id *)(a1 + 32) pendingAnnounceEnablementChangeFromSiri];
  uint64_t v3 = sub_100021030();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Settings] Waiting for pending Siri preferences change to reload specifiers.", buf, 2u);
    }
    goto LABEL_8;
  }
  if (v4)
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Settings] No Siri announce enablement change is pending.", v6, 2u);
  }

  [*(id *)(a1 + 32) reloadSpecifiers];
  if (([*(id *)(a1 + 32) _isAnnounceEnabled] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) panelController];
    id v5 = [*(id *)(a1 + 32) muteOptionsPanel];
    [v3 popIfPanel:v5];

LABEL_8:
  }
}

void sub_100008CF0(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingAnnounceEnablementChangeFromSiri:0];
  unsigned int v2 = [*(id *)(a1 + 32) pendingAnnounceEnablementChangeFromUserNotifications];
  uint64_t v3 = sub_100021030();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Settings] Waiting for pending User Notifications settings change to reload specifiers.", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Settings] No User Notifications settings change is pending", v5, 2u);
    }

    [*(id *)(a1 + 32) reloadSpecifiers];
  }
}

id sub_100008EC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_1000096AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009B38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_10000A430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A454(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_10000AB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AB64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_10000AD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000ADA8(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [CARWallpaperCellSpecifier alloc];
  id v5 = [a1[4] wallpaperPreferences];
  id v6 = [a1[4] panelController];
  uint64_t v7 = [v6 carSession];
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_10000AEF0;
  uint64_t v13 = &unk_100092058;
  objc_copyWeak(&v15, a1 + 6);
  id v8 = v3;
  id v14 = v8;
  uint64_t v9 = [(CARWallpaperCellSpecifier *)v4 initWithWallpaper:v8 wallpaperPreferences:v5 carSession:v7 actionBlock:&v10];

  [a1[5] addObject:v9, v10, v11, v12, v13];
  objc_destroyWeak(&v15);
}

void sub_10000AED8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000AEF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _newPreviewPanelForWallpaper:*(void *)(a1 + 32)];
  BOOL v4 = sub_100021030();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Settings] Presenting preview panel for #wallpaper %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [WeakRetained panelController];
  [v6 presentPanel:v3];
}

BOOL sub_10000B408(id a1, CARScreenInfo *a2)
{
  return [(CARScreenInfo *)a2 screenType] == 0;
}

void sub_10000B5AC(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) panelController];
  unsigned int v2 = [v4 vehicle];
  id v3 = [*(id *)(a1 + 32) wallpaperPreferences];
  [v3 setVehicle:v2];
}

uint64_t start(int a1, char **a2)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_10000D370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D394(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_10000E1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E20C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tappyTap];
}

void sub_10000E530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E56C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained groupSpecifier];
  unsigned int v2 = [v1 selectedTitle];
  id v3 = [WeakRetained cellSpecifier];
  [v3 setDetail:v2];

  id v4 = UIContentSizeCategoryLarge;
  uint64_t v5 = [WeakRetained groupSpecifier];
  id v6 = [v5 selectedIndex];

  if (v6)
  {
    if (v6 != (id)2) {
      goto LABEL_6;
    }
    uint64_t v7 = (id *)&UIContentSizeCategoryExtraLarge;
  }
  else
  {
    uint64_t v7 = (id *)&UIContentSizeCategoryMedium;
  }
  uint64_t v8 = (NSString *)*v7;

  id v4 = v8;
LABEL_6:
  uint64_t v9 = +[CARPrototypePref contentSize];
  [v9 setValue:v4];
}

id sub_10000E67C(uint64_t a1, void *a2)
{
  return [a2 _updateSelectedIndex];
}

void sub_10000E828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E850(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_10000F1B4(id a1)
{
  id v1 = sub_1000210C8(@"CARPLAY_START_SILENTMODE_MIRROR_IPHONE");
  unsigned int v2 = sub_1000210C8(@"CARPLAY_START_SILENTMODE_MIRROR_IPHONE_FOOTER");
  id v3 = +[CARSilentModeInCarPlayOption optionWithFullTitle:v1 footer:v2 silentModeType:0];
  id v4 = sub_1000210C8(@"CARPLAY_START_SILENTMODE_ON");
  uint64_t v5 = sub_1000210C8(@"CARPLAY_START_SILENTMODE_ON_FOOTER");
  id v6 = +[CARSilentModeInCarPlayOption optionWithFullTitle:footer:silentModeType:](CARSilentModeInCarPlayOption, "optionWithFullTitle:footer:silentModeType:", v4, v5, 1, v3);
  v12[1] = v6;
  uint64_t v7 = sub_1000210C8(@"CARPLAY_START_SILENTMODE_OFF");
  uint64_t v8 = sub_1000210C8(@"CARPLAY_START_SILENTMODE_OFF_FOOTER");
  uint64_t v9 = +[CARSilentModeInCarPlayOption optionWithFullTitle:v7 footer:v8 silentModeType:2];
  v12[2] = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:v12 count:3];
  uint64_t v11 = (void *)qword_1000B0848;
  qword_1000B0848 = v10;
}

void sub_10000F4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F508(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_10000F7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F7FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained silentModeOptions];
  unsigned int v2 = [WeakRetained groupSpecifier];
  id v3 = [v1 objectAtIndexedSubscript:[v2 selectedIndex]];

  id v4 = [WeakRetained silentModeStatus];
  [v4 setCarPlaySilentModePreference:[v3 silentModeType]];

  uint64_t v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 postNotificationName:CRSilentModePanelInteraction object:0 userInfo:0];

  [WeakRetained reloadSpecifiers];
}

void sub_10000F8E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShowThreeWaySwitch:1];
  unsigned int v2 = +[NSDistributedNotificationCenter defaultCenter];
  [v2 postNotificationName:CRSilentModePanelInteraction object:0 userInfo:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F9BC;
  block[3] = &unk_100091F38;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000F9BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_10000FFD8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = sub_100021030();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Settings] Silent mode panel: external process changed silent mode state", v3, 2u);
  }

  [WeakRetained setShowThreeWaySwitch:[WeakRetained _shouldShowThreeWaySwitch]];
  [WeakRetained reloadSpecifiers];
}

void sub_100010EDC(id a1, CRVehicle *a2, NSError *a3)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carkit.capabilities-changed", 0, 0, 1u);
}

void sub_1000116BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000116E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_100012FC8(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) tableSource];
  id v5 = [v4 specifierSections];
  id v9 = [v5 objectAtIndexedSubscript:a2];

  id v6 = [*(id *)(a1 + 32) tableView];
  uint64_t v7 = [v6 headerViewForSection:a2];

  uint64_t v8 = [v9 title];
  [v7 setText:v8];
}

void sub_10001308C(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) tableSource];
  id v5 = [v4 specifierSections];
  id v9 = [v5 objectAtIndexedSubscript:a2];

  id v6 = [*(id *)(a1 + 32) tableView];
  uint64_t v7 = [v6 footerViewForSection:a2];

  uint64_t v8 = [v9 footer];
  [v7 setText:v8];
}

void sub_100013150(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) tableView];
  [v2 beginUpdates];

  [*(id *)(a1 + 32) _performBatchUpdatesForReloadIndexPaths:*(void *)(a1 + 40) insertIndexPaths:*(void *)(a1 + 48) removeIndexPaths:*(void *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 endUpdates];
}

void sub_1000132E4(id *a1)
{
  if ([a1[4] count])
  {
    unsigned int v2 = [a1[5] tableView];
    [v2 deleteSections:a1[4] withRowAnimation:0];
  }
  if ([a1[6] count])
  {
    id v3 = [a1[5] tableView];
    [v3 insertSections:a1[6] withRowAnimation:0];
  }
  if ([a1[7] count])
  {
    id v4 = [a1[5] tableView];
    [v4 reloadSections:a1[7] withRowAnimation:0];
  }
}

BOOL sub_1000157CC(id a1, CARScreenInfo *a2)
{
  return [(CARScreenInfo *)a2 screenType] == 0;
}

void sub_100015CA4(id a1, id a2)
{
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  unsigned int v2 = +[NSNotification notificationWithName:@"com.apple.CarPlay.internal.default" object:0];
  [v3 postNotification:v2];
}

void sub_100015D20(id a1, id a2)
{
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  unsigned int v2 = +[NSNotification notificationWithName:@"com.apple.CarPlay.internal.instructionCard" object:0];
  [v3 postNotification:v2];
}

void sub_100015D9C(id a1, id a2)
{
  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  unsigned int v2 = +[NSNotification notificationWithName:@"com.apple.CarPlay.internal.map" object:0];
  [v3 postNotification:v2];
}

void sub_100015F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100015F58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_100016188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000161B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_100017464(uint64_t a1)
{
  id v2 = +[UIPasteboard generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

void sub_1000174C0(uint64_t a1)
{
  id v2 = +[UIPasteboard generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

void sub_10001751C(uint64_t a1)
{
  id v3 = +[UIPasteboard generalPasteboard];
  id v2 = [*(id *)(a1 + 32) stringValue];
  [v3 setString:v2];
}

void sub_100017590(uint64_t a1)
{
  id v2 = +[UIPasteboard generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

void sub_1000175E8(id a1, id a2)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"ResetUSBHostToDeviceModeConnectionDarwinNotification", 0, 0, 1u);
}

void sub_100017624(id a1, id a2)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.CarPlay.internal.toggleDynamicContent", 0, 0, 1u);
}

void sub_100017660(id a1, id a2)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.CarPlay.internal.toggleLayoutChange", 0, 0, 1u);
}

void sub_1000177CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000177F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_100017998(id a1)
{
  id v1 = (void *)qword_1000B0850;
  qword_1000B0850 = (uint64_t)&off_100097390;
}

void sub_100017E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017F20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    id v5 = [v3 BOOLValue];
    id v6 = sub_100021030();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67240192;
      v7[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] Sound Recognition preference is on: %{public}d", (uint8_t *)v7, 8u);
    }

    [WeakRetained setSoundRecognitionPreference:v5];
    [WeakRetained reloadSpecifiers];
  }
}

void sub_10001800C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    id v5 = [v3 BOOLValue];
    id v6 = sub_100021030();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67240192;
      v7[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] Sound Recognition Car Horn preference is on: %{public}d", (uint8_t *)v7, 8u);
    }

    [WeakRetained setCarHornPreference:v5];
  }
}

void sub_1000180F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    id v5 = [v3 BOOLValue];
    id v6 = sub_100021030();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67240192;
      v7[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] Sound Recognition Siren preference is on: %{public}d", (uint8_t *)v7, 8u);
    }

    [WeakRetained setSirenPreference:v5];
  }
}

void sub_100018304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018328(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_100018BC4(id a1)
{
  id v1 = sub_1000210C8(@"ACCESSIBILITY_CAR_HORN");
  id v2 = +[CARSoundRecognitionSetting settingWithSoundType:v1];
  v7[0] = v2;
  id v3 = sub_1000210C8(@"ACCESSIBILITY_SIREN");
  id v4 = +[CARSoundRecognitionSetting settingWithSoundType:v3];
  v7[1] = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:v7 count:2];
  id v6 = (void *)qword_1000B0868;
  qword_1000B0868 = v5;
}

void sub_1000193B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019418(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained appearanceGroupSpecifier];
  id v3 = [v2 selectedTitle];
  id v4 = [WeakRetained cellSpecifier];
  [v4 setDetail:v3];

  uint64_t v5 = [WeakRetained currentStyles];
  id v6 = [WeakRetained appearanceGroupSpecifier];
  uint64_t v7 = [v5 objectAtIndexedSubscript:[v6 selectedIndex]];

  uint64_t v8 = sub_100021030();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543362;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Settings] Setting new interface style preference: %{public}@", (uint8_t *)&v21, 0xCu);
  }

  if ([v7 style] == (id)2) {
    goto LABEL_6;
  }
  id v9 = [WeakRetained wallpaperPreferences];
  uint64_t v10 = [v9 currentWallpaper];
  uint64_t v11 = [v10 traits];
  unsigned __int8 v12 = [v11 supportsDynamicAppearance];

  if ((v12 & 1) != 0
    || ([WeakRetained wallpaperPreferences],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v13 updateWallpaperToSupportDynamicAppearance],
        v13,
        (v14 & 1) != 0))
  {
LABEL_6:
    id v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 style]);
    v16 = +[CARPrototypePref latestInterfaceStyle];
    [v16 setValue:v15];

    v17 = [WeakRetained panelController];
    v18 = [v17 vehicle];

    [v18 setAppearanceModePreference:[v7 style]];
    v19 = [WeakRetained panelController];
    [v19 saveVehicle:v18];
  }
  else
  {
    v20 = sub_100021030();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000654B4(v20);
    }

    [WeakRetained _updateSpecifiers];
  }
}

void sub_100019698(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    if ([v3 BOOLValue]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = sub_100021030();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134349056;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] Setting new interface style preference: %{public}ld", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = [WeakRetained panelController];
    uint64_t v8 = [v7 vehicle];

    [v8 setMapsAppearancePreference:v5];
    id v9 = [WeakRetained panelController];
    [v9 saveVehicle:v8];
  }
}

void sub_10001992C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019954(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_100019E4C(id a1)
{
  id v1 = sub_1000210C8(@"DISPLAY_MODE_AUTOMATIC");
  id v2 = +[CARDisplayStyle displayStyle:0 name:v1 enabled:1];
  id v3 = sub_1000210C8(@"DISPLAY_MODE_ALWAYS_LIGHT");
  id v4 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = +[CARDisplayStyle displayStyle:name:enabled:](CARDisplayStyle, "displayStyle:name:enabled:", 1, v3, [v4 BOOLForKey:@"allowLightModeOption"]);
  v10[1] = v5;
  id v6 = sub_1000210C8(@"DISPLAY_MODE_ALWAYS_DARK");
  uint64_t v7 = +[CARDisplayStyle displayStyle:2 name:v6 enabled:1];
  v10[2] = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:v10 count:3];
  id v9 = (void *)qword_1000B0878;
  qword_1000B0878 = v8;
}

id sub_10001A038(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) panelController];
  id v3 = [v2 vehicle];
  id v4 = [*(id *)(a1 + 32) wallpaperPreferences];
  [v4 setVehicle:v3];

  [*(id *)(a1 + 32) reloadSpecifiers];
  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 _updateSpecifiers];
}

void sub_10001A378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001A3A0(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  if (v4 || !a2)
  {
    uint64_t v5 = sub_100021030();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000654F8((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void sub_10001A400(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A4BC;
  v5[3] = &unk_1000924C0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10001A4BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _drivingToggleChanged:[*(id *)(a1 + 32) BOOLValue]];
}

void sub_10001A6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001A6D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

id sub_10001A8AC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dndSpecifier];
  id v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) _isDrivingToggleOn]);
  [v2 setCellValue:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 reloadSpecifiers];
}

void sub_10001AC50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_10001AC9C(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained dndStatus];
  [v2 setActivateWithCarPlay:v1];
}

void sub_10001ACFC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(unsigned __int8 *)(a1 + 40) != a2)
  {
    id v7 = sub_100021030();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000655D0((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ADDC;
  block[3] = &unk_100091F38;
  void block[4] = WeakRetained;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10001ADDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_10001B3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001B410(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_10001B5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001B5E8(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = [WeakRetained siriPreferences];
    unsigned __int8 v6 = [v5 mainAutoSendEnabled];

    if ((v6 & 1) == 0)
    {
      id v7 = [WeakRetained siriPreferences];
      id v8 = [v7 autoSendInHeadphonesEnabled];

      uint64_t v9 = +[AFPreferences sharedPreferences];
      [v9 setMessageWithoutConfirmationEnabled:1];

      uint64_t v10 = +[AFPreferences sharedPreferences];
      [v10 setMessageWithoutConfirmationHeadphonesEnabled:v8];
    }
  }
  uint64_t v11 = +[AFPreferences sharedPreferences];
  [v11 setMessageWithoutConfirmationInCarPlayEnabled:v4];
}

id sub_10001B774(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_10001B81C(id a1, id a2)
{
  id v2 = [a2 BOOLValue];
  id v3 = +[AFPreferences sharedPreferences];
  [v3 setShowAppsBehindSiriInCarPlayEnabled:v2];
}

id sub_10001B948(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_10001B9C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_10001BA40(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_10001BABC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_10001BD8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001BDB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

uint64_t sub_10001C0A8(uint64_t a1)
{
  qword_1000B0880 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10001D98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001D9B4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setOn:a2 animated:1];
}

void sub_10001FB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001FBBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001FC78;
  v5[3] = &unk_1000924C0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10001FC78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setIconState:*(void *)(a1 + 32)];
}

void sub_1000201F8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBarStyleAssertion];
  [v1 invalidate];
}

void sub_1000203D4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBarStyleAssertion];
  [v1 invalidate];
}

void sub_1000207C4(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
}

void sub_1000207CC(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] <= a3)
  {
    *a4 = 1;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    id v8 = [*(id *)(a1 + 40) _iconImageForIdentifier:v9];
    [v7 setImage:v8];
  }
}

void sub_100020B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100020B4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100020B5C(uint64_t a1)
{
}

void sub_100020B64(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 iconImageData];

  if (v3)
  {
    id v4 = objc_alloc((Class)UIImage);
    id v5 = [v9 iconImageData];
    [v9 iconImageScale];
    id v6 = [v4 initWithData:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100021030()
{
  if (qword_1000B0898 != -1) {
    dispatch_once(&qword_1000B0898, &stru_100092650);
  }
  v0 = (void *)qword_1000B0890;

  return v0;
}

void sub_100021084(id a1)
{
  qword_1000B0890 = (uint64_t)os_log_create("com.apple.carplay.settings", "General");

  _objc_release_x1();
}

id sub_1000210C8(void *a1)
{
  id v1 = a1;
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:v1 value:&stru_100094078 table:@"Localizable"];

  return v3;
}

id sub_10002115C(void *a1)
{
  id v1 = a1;
  v6.width = 40.0;
  v6.height = 40.0;
  UIGraphicsBeginImageContextWithOptions(v6, 1, 2.0);
  [v1 setFill];

  id v2 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, 40.0, 40.0);
  [v2 fill];

  id v3 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v3;
}

void sub_1000224CC(id a1)
{
  id v1 = sub_1000210C8(@"CARPLAY_START_ANNOUNCE_NEW_MESSAGES");
  id v2 = sub_1000210C8(@"CARPLAY_START_ANNOUNCE_SELECTED_SETTING_FOOTER");
  id v3 = +[CARMuteOptionsMode modeWithFullTitle:v1 footer:v2 muteType:1 announceType:2];
  id v4 = sub_1000210C8(@"CARPLAY_START_SILENCE_NEW_MESSAGES");
  id v5 = sub_1000210C8(@"CARPLAY_START_SILENCE_SELECTED_SETTING_FOOTER");
  CGSize v6 = +[CARMuteOptionsMode modeWithFullTitle:footer:muteType:announceType:](CARMuteOptionsMode, "modeWithFullTitle:footer:muteType:announceType:", v4, v5, 2, 3, v3);
  v12[1] = v6;
  uint64_t v7 = sub_1000210C8(@"CARPLAY_START_REMEMBER_PREVIOUS_SETTING");
  id v8 = sub_1000210C8(@"CARPLAY_START_REMEMBER_PREVIOUS_SETTING_FOOTER");
  id v9 = +[CARMuteOptionsMode modeWithFullTitle:v7 footer:v8 muteType:3 announceType:4];
  v12[2] = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:v12 count:3];
  uint64_t v11 = (void *)qword_1000B08A8;
  qword_1000B08A8 = v10;
}

void sub_100022858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100022880(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained modes];
  id v2 = [WeakRetained groupSpecifier];
  id v3 = [v1 objectAtIndexedSubscript:[v2 selectedIndex]];

  [WeakRetained _updateSettingsForMode:v3];
  [WeakRetained reloadSpecifiers];
}

void sub_100022A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100022A5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

id sub_100022CD4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCurrentMode];
  id v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_1000236BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 120));
  _Unwind_Resume(a1);
}

void sub_10002371C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [CARColorFiltersPanel alloc];
  id v2 = [WeakRetained panelController];
  id v3 = [(CARColorFiltersPanel *)v1 initWithPanelController:v2];

  id v4 = [WeakRetained panelController];
  [v4 pushPanel:v3];
}

void sub_1000237B4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 BOOLValue];

  [WeakRetained boldTextToggleChanged:v4];
}

void sub_100023820(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 BOOLValue];

  [WeakRetained voiceControlToggleChanged:v4];
}

void sub_10002388C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [CARSoundRecognitionPanel alloc];
  id v2 = [WeakRetained panelController];
  id v3 = [(CARSoundRecognitionPanel *)v1 initWithPanelController:v2];

  id v4 = [WeakRetained panelController];
  [v4 pushPanel:v3];
}

void sub_100023A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100023A78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

id sub_1000241B0(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v2 = *(void **)(a1 + 32);

  return [v2 _updateSpecifiers];
}

void sub_10002442C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) _isDevicePickerLimitedUIOn];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setEnabled:0];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v4 _limitedUIAttributedString];
    [v4 setAttributedTitle:v5];

    CGSize v6 = *(void **)(a1 + 32);
    [v6 setTitle:0];
  }
  else
  {
    [v3 setEnabled:1];
    [*(id *)(a1 + 32) setAttributedTitle:0];
    uint64_t v7 = *(void **)(a1 + 32);
    sub_1000210C8(@"DEVICE_PICKER_CELL_TITLE");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v7 setTitle:v8];
  }
}

void sub_100024934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002495C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v2 = [WeakRetained groupSpecifiers];
  id v3 = [v2 objectAtIndexedSubscript:*(int *)(a1 + 48)];
  unsigned int v4 = [v3 isEnabled];

  if (v4)
  {
    [WeakRetained setSelectedIndex:*(int *)(a1 + 48)];
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void sub_100025144(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) collectionView];
  unsigned int v2 = [v4 delegate];
  id v3 = [*(id *)(a1 + 32) collectionView];
  [v2 collectionView:didUpdateContentSize:v3, *(double *)(a1 + 40), *(double *)(a1 + 48)];
}

id sub_100025C1C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _reloadData];
}

id sub_10002615C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000261DC;
  v2[3] = &unk_100091F38;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v2 animations:0.0];
}

void sub_1000261DC(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) collectionView];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000262B0;
  v4[3] = &unk_100091F38;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002636C;
  v3[3] = &unk_100092750;
  v3[4] = v5;
  [v2 performBatchUpdates:v4 completion:v3];
}

void sub_1000262B0(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) collectionSource];
  id v3 = [*(id *)(a1 + 32) collectionView];
  uint64_t v4 = (uint64_t)[v2 numberOfSectionsInCollectionView:v3];

  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      CGSize v6 = [*(id *)(a1 + 32) collectionView];
      uint64_t v7 = +[NSIndexSet indexSetWithIndex:i];
      [v6 reloadSections:v7];
    }
  }
}

void sub_10002636C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) collectionView];
  id v3 = [v2 collectionViewLayout];
  [v3 invalidateLayout];

  uint64_t v4 = [*(id *)(a1 + 32) collectionView];
  [v4 setNeedsLayout];

  id v5 = [*(id *)(a1 + 32) collectionView];
  [v5 layoutIfNeeded];
}

void sub_100026F6C(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  unsigned int v2 = (void *)qword_1000B08B0;
  qword_1000B08B0 = (uint64_t)v1;

  id v3 = (void *)qword_1000B08B0;

  _[v3 setNumberStyle:6];
}

void sub_100027F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100027F7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

id sub_100028070(uint64_t a1, void *a2)
{
  return _[a2 _refreshConfig];
}

id sub_1000282FC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) action];
}

void sub_100028C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(location);
  objc_destroyWeak(&a26);
  _Unwind_Resume(a1);
}

void sub_100028C94(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    id v5 = [v3 BOOLValue];
    CGSize v6 = sub_100021030();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67240192;
      v7[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] New color filter preference is on: %{public}d", (uint8_t *)v7, 8u);
    }

    [WeakRetained setColorFiltersPreference:v5];
    [WeakRetained reloadSpecifiers];
  }
}

void sub_100028D80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = [WeakRetained colorFilterPickerGroupSpecifier];
  id v3 = [v2 selectedTitle];
  uint64_t v4 = [WeakRetained cellSpecifier];
  [v4 setDetail:v3];

  id v5 = sub_100021030();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CGSize v6 = [WeakRetained colorFilterPickerGroupSpecifier];
    int v7 = 134217984;
    id v8 = [v6 selectedIndex];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Settings] New color filter preference type selected: %lu", (uint8_t *)&v7, 0xCu);
  }
  [WeakRetained setColorFiltersPreference];
}

void sub_100028E94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = [WeakRetained colorFilterIntensityPickerGroupSpecifier];
  id v3 = [v2 selectedTitle];
  uint64_t v4 = [WeakRetained cellSpecifier];
  [v4 setDetail:v3];

  id v5 = sub_100021030();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CGSize v6 = [WeakRetained colorFilterIntensityPickerGroupSpecifier];
    int v7 = 134217984;
    id v8 = [v6 selectedIndex];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Settings] New color filter intensity preference type selected: %lu", (uint8_t *)&v7, 0xCu);
  }
  [WeakRetained setColorFiltersIntensityPreference];
}

void sub_1000290D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000290FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

void sub_100029B80(id a1)
{
  id v1 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_GRAYSCALE");
  unsigned int v2 = +[CARColorFilterSetting filterPreference:2 name:v1];
  v11[0] = v2;
  id v3 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_RED_GREEN");
  uint64_t v4 = +[CARColorFilterSetting filterPreference:3 name:v3];
  v11[1] = v4;
  id v5 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_GREEN_RED");
  CGSize v6 = +[CARColorFilterSetting filterPreference:4 name:v5];
  v11[2] = v6;
  int v7 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_BLUE_YELLOW");
  id v8 = +[CARColorFilterSetting filterPreference:5 name:v7];
  v11[3] = v8;
  uint64_t v9 = +[NSArray arrayWithObjects:v11 count:4];
  uint64_t v10 = (void *)qword_1000B08C8;
  qword_1000B08C8 = v9;
}

void sub_100029D58(id a1)
{
  id v1 = +[CARColorFilterSetting filterPreference:2 name:&stru_100094078];
  v10[0] = v1;
  unsigned int v2 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_PROTANOPIA");
  id v3 = +[CARColorFilterSetting filterPreference:3 name:v2];
  v10[1] = v3;
  uint64_t v4 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_DEUTERANOPIA");
  id v5 = +[CARColorFilterSetting filterPreference:4 name:v4];
  v10[2] = v5;
  CGSize v6 = sub_1000210C8(@"ACCESSIBILITY_COLOR_FILTERS_TRITANOPIA");
  int v7 = +[CARColorFilterSetting filterPreference:5 name:v6];
  void v10[3] = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:v10 count:4];
  uint64_t v9 = (void *)qword_1000B08D8;
  qword_1000B08D8 = v8;
}

void sub_10002A490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002A4B0(uint64_t a1, void *a2)
{
  unsigned int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performAction:v3];
}

void sub_10002A790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002A7AC(uint64_t a1, void *a2)
{
  unsigned int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performAction:v3];
}

void sub_10002AAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002AAC4(uint64_t a1, void *a2)
{
  unsigned int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performAction:v3];
}

void sub_10002AF74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002AF98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained panelController];
  [v1 pushPanel:WeakRetained];
}

uint64_t sub_10002CFF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002D398(&qword_1000AEB50);
  __chkstk_darwin();
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100030190(v2, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for ColorScheme();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    os_log_type_t v12 = static os_log_type_t.fault.getter();
    uint64_t v13 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v14 = v12;
    if (os_log_type_enabled(v13, v12))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v17[1] = a1;
      uint64_t v18 = v16;
      *(_DWORD *)id v15 = 136315138;
      v17[2] = sub_10002F8D4(0x686353726F6C6F43, 0xEB00000000656D65, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_10002D2AC()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10002D2D0(uint64_t a1)
{
  type metadata accessor for ColorScheme();
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_10002D398(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10002D3DC()
{
  sub_10002D398(&qword_1000AEB58);
  State.init(wrappedValue:)();
  return v1;
}

uint64_t sub_10002D41C()
{
  return 0;
}

id sub_10002D424()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for CARThemeLayoutPreview() + 24));

  return v1;
}

uint64_t type metadata accessor for CARThemeLayoutPreview()
{
  uint64_t result = qword_1000B09F0;
  if (!qword_1000B09F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002D4A4()
{
  type metadata accessor for CARThemeLayoutPreview();

  return swift_unknownObjectRetain();
}

uint64_t sub_10002D4D8()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CARThemeLayoutPreview() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

double sub_10002D518@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CARThemeLayoutPreview();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3);
  sub_10002D678((uint64_t)&v19);
  long long v18 = v19;
  uint64_t v6 = v20;
  char v7 = v21;
  uint64_t v8 = static Alignment.center.getter();
  uint64_t v10 = v9;
  uint64_t v11 = swift_unknownObjectRetain();
  uint64_t v14 = nullsub_8(v11, v12, v13);
  sub_10002DCCC(v1, (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v15 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v16 = swift_allocObject();
  sub_10002DD34((uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  double result = *(double *)&v18;
  *(_OWORD *)a1 = v18;
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v14;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = sub_10002DD98;
  *(void *)(a1 + 64) = v16;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  return result;
}

double sub_10002D678@<D0>(uint64_t a1@<X8>)
{
  long long v10 = *(_OWORD *)(v1 + *(int *)(type metadata accessor for CARThemeLayoutPreview() + 20));
  sub_10002D398(&qword_1000AECF0);
  State.wrappedValue.getter();
  if (v8)
  {
    id v3 = v8;
    uint64_t v4 = sub_10002DF64();
    uint64_t v9 = (void *)nullsub_8(v3, v4, v5);
    sub_10002F4B0();
    id v6 = v9;
    swift_bridgeObjectRetain();
    _ConditionalContent<>.init(storage:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    static Color.clear.getter();
    sub_10002F4B0();
    _ConditionalContent<>.init(storage:)();
  }
  double result = *(double *)&v10;
  *(_OWORD *)a1 = v10;
  *(void *)(a1 + 16) = v11;
  *(unsigned char *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_10002D7D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CARThemeLayoutPreview();
  __chkstk_darwin(v2);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  v19[4] = v3;
  v19[5] = v4;
  uint64_t v5 = __chkstk_darwin(v3);
  __chkstk_darwin(v5);
  char v7 = (char *)v19 - v6;
  sub_10002F83C(0, (unint64_t *)&unk_1000AECE0);
  uint64_t v20 = v2;
  uint64_t v8 = *(void **)(a1 + *(int *)(v2 + 24));
  id v9 = [v8 asset];
  id v10 = [v9 url];

  id v11 = [v10 url];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v12 = [v8 asset];
  id v13 = [v12 packageType];

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  id v17 = sub_10002DD9C((uint64_t)v7, v14, v16, 0);
  long long v22 = *(_OWORD *)(a1 + *(int *)(v20 + 20));
  id v21 = v17;
  sub_10002D398(&qword_1000AECF0);
  return State.wrappedValue.setter();
}

uint64_t sub_10002DCCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CARThemeLayoutPreview();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002DD34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CARThemeLayoutPreview();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_10002DD9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  char v7 = v6;
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  id v18 = 0;
  id v10 = [(id)swift_getObjCClassFromMetadata() packageWithContentsOfURL:v7 type:v8 options:v9.super.isa error:&v18];

  id v11 = v18;
  if (v10)
  {
    uint64_t v12 = type metadata accessor for URL();
    id v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
    id v14 = v11;
    v13(a1, v12);
  }
  else
  {
    id v15 = v18;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v16 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
  }
  return v10;
}

uint64_t sub_10002DF64()
{
  uint64_t v1 = type metadata accessor for ColorScheme();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v7 = (char *)&v22 - v6;
  uint64_t v8 = type metadata accessor for CARThemeLayoutPreview();
  NSDictionary v9 = *(void **)(v0 + *(int *)(v8 + 24));
  sub_10002CFF4((uint64_t)v7);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, enum case for ColorScheme.dark(_:), v1);
  char v10 = static ColorScheme.== infix(_:_:)();
  id v11 = *(void (**)(char *, uint64_t))(v2 + 8);
  v11(v5, v1);
  v11(v7, v1);
  if (v10) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  id v13 = [v9 stateForPaletteIDWithInterfaceStyle:v12];
  uint64_t v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v14 + 16))
  {
    id v15 = (uint64_t *)(v0 + *(int *)(v8 + 32));
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_100030034(v17, v16);
    if (v19)
    {
      uint64_t v20 = *(void *)(*(void *)(v14 + 56) + 16 * v18);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v20 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = 0;
  }
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_10002E178@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_10002D398(&qword_1000AEB50);

  return swift_storeEnumTagMultiPayload();
}

double sub_10002E1D0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  sub_10002E27C(a1, a6);
  id v11 = (int *)type metadata accessor for CARThemeLayoutPreview();
  uint64_t v12 = v11[5];
  sub_10002D398(&qword_1000AEB58);
  State.init(wrappedValue:)();
  double result = *(double *)&v15;
  *(_OWORD *)(a6 + v12) = v15;
  *(void *)(a6 + v11[6]) = a2;
  *(void *)(a6 + v11[7]) = a3;
  uint64_t v14 = (void *)(a6 + v11[8]);
  void *v14 = a4;
  v14[1] = a5;
  return result;
}

uint64_t sub_10002E27C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000AEB60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002E2EC()
{
  return static View._viewListCount(inputs:)();
}

double sub_10002E308@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1);
  sub_10002D678((uint64_t)&v19);
  long long v18 = v19;
  uint64_t v6 = v20;
  char v7 = v21;
  uint64_t v8 = static Alignment.center.getter();
  uint64_t v10 = v9;
  uint64_t v11 = swift_unknownObjectRetain();
  uint64_t v14 = nullsub_8(v11, v12, v13);
  sub_10002DCCC(v2, (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v15 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v16 = swift_allocObject();
  sub_10002DD34((uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  double result = *(double *)&v18;
  *(_OWORD *)a2 = v18;
  *(void *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = v14;
  *(void *)(a2 + 40) = v8;
  *(void *)(a2 + 48) = v10;
  *(void *)(a2 + 56) = sub_10002DD98;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0;
  return result;
}

uint64_t sub_10002E464@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = static Alignment.center.getter();
  uint64_t v6 = v5;
  uint64_t result = os_variant_has_internal_ui();
  if (result)
  {
    uint64_t v8 = static HorizontalAlignment.center.getter();
    uint64_t result = sub_10002E534(a1, (uint64_t)&v16);
    long long v9 = v16;
    uint64_t v10 = v17;
    uint64_t v11 = v18;
    long long v12 = v19;
    uint64_t v13 = v20;
    uint64_t v14 = 1;
    uint64_t v15 = v21;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v14 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    long long v9 = 0uLL;
    long long v12 = 0uLL;
  }
  *(_WORD *)a2 = 256;
  *(void *)(a2 + 8) = v8;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = v14;
  *(_OWORD *)(a2 + 32) = v9;
  *(void *)(a2 + 48) = v10;
  *(void *)(a2 + 56) = v11;
  *(_OWORD *)(a2 + 64) = v12;
  *(void *)(a2 + 80) = v13;
  *(void *)(a2 + 88) = v15;
  *(void *)(a2 + 96) = v4;
  *(void *)(a2 + 104) = v6;
  return result;
}

uint64_t sub_10002E534@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v4 - 8);
  id v5 = [a1 displayName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10002F7C8();
  uint64_t v6 = Text.init<A>(_:)();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  uint64_t v11 = Text.bold()();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  sub_10002F81C(v6, v8, v10);
  swift_bridgeObjectRelease();
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v18._countAndFlagsBits = 40;
  v18._object = (void *)0xE100000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v18);
  id v19 = [a1 identifier];
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;

  v23._countAndFlagsBits = v20;
  v23._object = v22;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v23);
  swift_bridgeObjectRelease();
  v24._countAndFlagsBits = 41;
  v24._object = (void *)0xE100000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v24);
  LocalizedStringKey.init(stringInterpolation:)();
  uint64_t v25 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v27 = v26;
  LOBYTE(v22) = v28 & 1;
  *(void *)a2 = v11;
  *(void *)(a2 + 8) = v13;
  *(unsigned char *)(a2 + 16) = v17;
  *(void *)(a2 + 24) = v15;
  *(void *)(a2 + 32) = v25;
  *(void *)(a2 + 40) = v26;
  *(unsigned char *)(a2 + 48) = v28 & 1;
  *(void *)(a2 + 56) = v29;
  sub_10002F82C(v11, v13, v17);
  swift_bridgeObjectRetain();
  sub_10002F82C(v25, v27, (char)v22);
  swift_bridgeObjectRetain();
  sub_10002F81C(v25, v27, (char)v22);
  swift_bridgeObjectRelease();
  sub_10002F81C(v11, v13, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002E77C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002E798()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002E7B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = static Alignment.center.getter();
  uint64_t v6 = v5;
  uint64_t result = os_variant_has_internal_ui();
  if (result)
  {
    uint64_t v8 = static HorizontalAlignment.center.getter();
    uint64_t result = sub_10002E534(v3, (uint64_t)&v16);
    long long v9 = v16;
    uint64_t v10 = v17;
    uint64_t v11 = v18;
    long long v12 = v19;
    uint64_t v13 = v20;
    uint64_t v14 = 1;
    uint64_t v15 = v21;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v14 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    long long v9 = 0uLL;
    long long v12 = 0uLL;
  }
  *(_WORD *)a1 = 256;
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = v14;
  *(_OWORD *)(a1 + 32) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(_OWORD *)(a1 + 64) = v12;
  *(void *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v4;
  *(void *)(a1 + 104) = v6;
  return result;
}

uint64_t *sub_10002E884(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    long long v12 = (char *)a2 + v9;
    uint64_t v13 = *(void **)v12;
    uint64_t v14 = *((void *)v12 + 1);
    *uint64_t v11 = *(void *)v12;
    v11[1] = v14;
    uint64_t v15 = *(void **)((char *)a2 + v10);
    *(uint64_t *)((char *)a1 + v10) = (uint64_t)v15;
    uint64_t v16 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    unsigned __int8 v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    id v20 = v13;
    swift_retain();
    id v21 = v15;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10002E9F4(uint64_t a1, uint64_t a2)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_10002EAD0(void *a1, void *a2, int *a3)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (char *)a2 + v7;
  uint64_t v11 = *(void **)v10;
  uint64_t v12 = *((void *)v10 + 1);
  *uint64_t v9 = *(void *)v10;
  v9[1] = v12;
  uint64_t v13 = *(void **)((char *)a2 + v8);
  *(void *)((char *)a1 + v8) = v13;
  uint64_t v14 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  id v18 = v11;
  swift_retain();
  id v19 = v13;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_10002EBF0(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10002ED60((uint64_t)a1);
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void **)((char *)a1 + v7);
  uint64_t v11 = *(void **)((char *)a2 + v7);
  *uint64_t v8 = v11;
  id v12 = v11;

  v8[1] = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = *(void **)((char *)a2 + v13);
  uint64_t v15 = *(void **)((char *)a1 + v13);
  *(void *)((char *)a1 + v13) = v14;
  id v16 = v14;

  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v17 = a3[8];
  id v18 = (void *)((char *)a1 + v17);
  id v19 = (void *)((char *)a2 + v17);
  void *v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10002ED60(uint64_t a1)
{
  uint64_t v2 = sub_10002D398(&qword_1000AEB50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_10002EDC0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  uint64_t v9 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  return a1;
}

char *sub_10002EEB0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_10002ED60((uint64_t)a1);
    uint64_t v6 = sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void **)&a1[v8];
  *(void *)uint64_t v9 = *(void *)v10;

  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v12 = a3[6];
  uint64_t v13 = *(void **)&a1[v12];
  *(void *)&a1[v12] = *(void *)&a2[v12];

  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_unknownObjectRelease();
  uint64_t v14 = a3[8];
  uint64_t v15 = &a1[v14];
  id v16 = &a2[v14];
  uint64_t v18 = *(void *)v16;
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = v18;
  *((void *)v15 + 1) = v17;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10002F000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002F014);
}

uint64_t sub_10002F014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000AEB60);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10002F0D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002F0EC);
}

uint64_t sub_10002F0EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10002D398(&qword_1000AEB60);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void sub_10002F1AC()
{
  sub_10002F264();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10002F264()
{
  if (!qword_1000AEBC0)
  {
    type metadata accessor for ColorScheme();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000AEBC0);
    }
  }
}

ValueMetadata *type metadata accessor for CARThemeLayoutPlaceholder()
{
  return &type metadata for CARThemeLayoutPlaceholder;
}

unint64_t sub_10002F2D0()
{
  unint64_t result = qword_1000AEC60;
  if (!qword_1000AEC60)
  {
    sub_10002F34C(&qword_1000AEC68);
    sub_10002F394();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AEC60);
  }
  return result;
}

uint64_t sub_10002F34C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10002F394()
{
  unint64_t result = qword_1000AEC70;
  if (!qword_1000AEC70)
  {
    sub_10002F34C(&qword_1000AEC78);
    sub_10002F434();
    sub_10002F5CC(&qword_1000AEC98, &qword_1000AECA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AEC70);
  }
  return result;
}

unint64_t sub_10002F434()
{
  unint64_t result = qword_1000AEC80;
  if (!qword_1000AEC80)
  {
    sub_10002F34C(&qword_1000AEC88);
    sub_10002F4B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AEC80);
  }
  return result;
}

unint64_t sub_10002F4B0()
{
  unint64_t result = qword_1000AEC90;
  if (!qword_1000AEC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AEC90);
  }
  return result;
}

unint64_t sub_10002F508()
{
  unint64_t result = qword_1000AECA8;
  if (!qword_1000AECA8)
  {
    sub_10002F34C(&qword_1000AECB0);
    sub_10002F5CC(&qword_1000AECB8, &qword_1000AECC0);
    sub_10002F5CC(&qword_1000AECC8, &qword_1000AECD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AECA8);
  }
  return result;
}

uint64_t sub_10002F5CC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F34C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002F614()
{
  uint64_t v1 = type metadata accessor for CARThemeLayoutPreview();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10002F768()
{
  uint64_t v1 = *(void *)(type metadata accessor for CARThemeLayoutPreview() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_10002D7D0(v2);
}

unint64_t sub_10002F7C8()
{
  unint64_t result = qword_1000AECD8;
  if (!qword_1000AECD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AECD8);
  }
  return result;
}

uint64_t sub_10002F81C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10002F82C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10002F83C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10002F878(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CARThemeLayoutPreview();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002F8D4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002F9A8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10002FFD4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10002FFD4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10002FF84((uint64_t)v12);
  return v7;
}

uint64_t sub_10002F9A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10002FB64(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10002FB64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002FBFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002FDDC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002FDDC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002FBFC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10002FD74(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10002FD74(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10002D398((uint64_t *)&unk_1000AFF50);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10002FDDC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10002D398((uint64_t *)&unk_1000AFF50);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_10002FF2C()
{
  unint64_t result = qword_1000AECF8;
  if (!qword_1000AECF8)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AECF8);
  }
  return result;
}

uint64_t sub_10002FF84(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10002FFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100030034(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000300AC(a1, a2, v4);
}

unint64_t sub_1000300AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100030190(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000AEB50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_1000301FC(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  id v5 = a1;
  unint64_t v6 = sub_1000307F4(v4);
  swift_bridgeObjectRelease();

  return v6;
}

uint64_t sub_10003027C(void *a1)
{
  id v1 = [a1 palettes];
  sub_10002F83C(0, &qword_1000AFDA0);
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t sub_1000302E0(int a1, id a2)
{
  id v2 = [a2 wallpapers];
  sub_10002F83C(0, (unint64_t *)&unk_1000AFA40);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id sub_100030348(void *a1)
{
  id v1 = [a1 defaultPalette];

  return v1;
}

void sub_10003037C(void *a1, void *a2)
{
  id v3 = [a1 defaultWallpaper];
  id v4 = [a2 wallpapers];
  sub_10002F83C(0, (unint64_t *)&unk_1000AFA40);
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v6 = v3;
  int64_t v7 = sub_100030A00(v5, v6);
  swift_bridgeObjectRelease();

  if (v7) {
  else
  }
    __break(1u);
}

void sub_100030444(void *a1, id a2, void *a3)
{
  id v6 = [a2 palettes];
  sub_10002F83C(0, &qword_1000AFDA0);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v8 = a1;
  uint64_t v9 = sub_100030BC8(v7, v8);
  swift_bridgeObjectRelease();

  if (!v9) {
    goto LABEL_6;
  }
  id v10 = [a2 wallpapers];
  sub_10002F83C(0, (unint64_t *)&unk_1000AFA40);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v12 = v8;
  uint64_t v13 = sub_100030D78(v11, v12);
  swift_bridgeObjectRelease();

  if (!v13)
  {

LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v14 = [a3 wallpapers];
  unint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v16 = v13;
  uint64_t v17 = sub_100030A00(v15, v16);
  swift_bridgeObjectRelease();

  if (v17)
  {
    type metadata accessor for CARThemeModel();
    id v21 = &type metadata for CARCenterConsoleLayoutThemeProvider;
    uint64_t v22 = &off_100092998;
    *(void *)&long long v20 = a2;
    *((void *)&v20 + 1) = a3;
    id v18 = a2;
    id v19 = a3;
    sub_10003E280((uint64_t)v9, (uint64_t)v17, &v20);

    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_100030624()
{
  id v1 = [*v0 palettes];
  sub_10002F83C(0, &qword_1000AFDA0);
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t sub_10003068C()
{
  id v1 = [*(id *)(v0 + 8) wallpapers];
  sub_10002F83C(0, (unint64_t *)&unk_1000AFA40);
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

id sub_1000306F4()
{
  id v1 = [*v0 defaultPalette];

  return v1;
}

void sub_10003072C()
{
  id v1 = *(void **)(v0 + 8);
  id v2 = [*(id *)v0 defaultWallpaper];
  id v3 = [v1 wallpapers];
  sub_10002F83C(0, (unint64_t *)&unk_1000AFA40);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v5 = v2;
  id v6 = sub_100030A00(v4, v5);
  swift_bridgeObjectRelease();

  if (v6) {
  else
  }
    __break(1u);
}

void *sub_1000307F4(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_24;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_10:
        id v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_23;
        }
        id v7 = [v4 associatedPaletteID];
        if (v7)
        {

          id v8 = [v5 associatedPaletteID];
          if (!v8)
          {
            CRSUIClusterThemePalette.id.getter();
LABEL_19:

            swift_bridgeObjectRelease();
            goto LABEL_6;
          }
          uint64_t v9 = v8;
          uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v12 = v11;

          uint64_t v13 = CRSUIClusterThemePalette.id.getter();
          if (!v12) {
            goto LABEL_19;
          }
          if (v10 == v13 && v12 == v14)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v15 & 1) == 0)
            {

              goto LABEL_6;
            }
          }
        }
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
LABEL_6:
        ++v3;
        if (v6 == v2) {
          return &_swiftEmptyArrayStorage;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_10;
  }
  return &_swiftEmptyArrayStorage;
}

void *sub_100030A00(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v4);
      unint64_t v6 = v5;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v20 = v4 - 3;
      id v7 = [a2 identifier];
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v10 = v9;

      uint64_t v11 = v6;
      id v12 = [v6 identifier];
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = v14;

      if (v8 == v13 && v10 == v15)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_16:
        swift_bridgeObjectRelease();
        return v11;
      }
      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_16;
      }

      ++v4;
      if (v20 == v3) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
LABEL_19:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_100030BC8(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v19 = v2;
    unint64_t v20 = v2 & 0xC000000000000001;
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = v20 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v2 + 8 * v4);
      unint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = v3;
      uint64_t v9 = CRSUIClusterThemePalette.id.getter();
      uint64_t v11 = v10;
      id v12 = [a2 currentPaletteID];
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = v14;

      BOOL v16 = v9 == v13 && v11 == v15;
      if (v16)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_17:
        swift_bridgeObjectRelease();
        return v6;
      }
      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_17;
      }

      ++v4;
      uint64_t v3 = v8;
      BOOL v16 = v7 == v8;
      unint64_t v2 = v19;
      if (v16) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
LABEL_20:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_100030D78(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v4);
      unint64_t v6 = v5;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v18 = v4 - 3;
      uint64_t v7 = CRSUIClusterThemeWallpaper.id.getter();
      uint64_t v9 = v8;
      id v10 = objc_msgSend(objc_msgSend(a2, "currentWallpaper"), "identifier");
      swift_unknownObjectRelease();
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v13 = v12;

      if (v7 == v11 && v9 == v13)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_16:
        swift_bridgeObjectRelease();
        return v6;
      }
      char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_16;
      }

      ++v4;
      if (v18 == v3) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
LABEL_19:
  swift_bridgeObjectRelease();
  return 0;
}

void *initializeBufferWithCopyOfBuffer for CARCenterConsoleLayoutThemeProvider(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for CARCenterConsoleLayoutThemeProvider(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for CARCenterConsoleLayoutThemeProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 initializeWithTake for CARCenterConsoleLayoutThemeProvider(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for CARCenterConsoleLayoutThemeProvider(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for CARCenterConsoleLayoutThemeProvider(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CARCenterConsoleLayoutThemeProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CARCenterConsoleLayoutThemeProvider()
{
  return &type metadata for CARCenterConsoleLayoutThemeProvider;
}

uint64_t sub_1000310F0(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = static os_log_type_t.fault.getter();
  id v9 = static Log.runtimeIssuesLog.getter();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_10002F8D4(1819242306, 0xE400000000000000, &v12);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  sub_1000313E0(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v13;
}

uint64_t sub_1000312C8@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_10002D398(&qword_1000AEB50);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100031320()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for CARSettingButtonStyle() + 20);
  uint64_t v2 = *(void *)v1;
  char v3 = *(unsigned char *)(v1 + 8);
  sub_1000313D4(*(void *)v1, v3);
  char v4 = sub_1000310F0(v2, v3);
  sub_1000313E0(v2, v3);
  return v4 & 1;
}

uint64_t type metadata accessor for CARSettingButtonStyle()
{
  uint64_t result = qword_1000B0B20;
  if (!qword_1000B0B20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000313D4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000313E0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000313EC()
{
  return swift_getKeyPath();
}

uint64_t sub_100031410@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100031440()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100031468()
{
  type metadata accessor for CARSettingButtonStyle();

  return swift_retain();
}

uint64_t sub_10003149C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  __chkstk_darwin(a1);
  os_log_type_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a3 = swift_getKeyPath();
  sub_10002D398(&qword_1000AEB50);
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = type metadata accessor for CARSettingButtonStyle();
  uint64_t v10 = (char *)a3 + *(int *)(v9 + 20);
  *(void *)uint64_t v10 = swift_getKeyPath();
  v10[8] = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  uint64_t v11 = AnyShape.init<A>(_:)();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  *(uint64_t *)((char *)a3 + *(int *)(v9 + 24)) = v11;
  return result;
}

uint64_t sub_1000315F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a1;
  uint64_t v60 = a2;
  uint64_t v3 = sub_10002D398(&qword_1000AEE90);
  __chkstk_darwin(v3 - 8);
  v59 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10002D398(&qword_1000AEE98);
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  os_log_type_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = type metadata accessor for Material();
  uint64_t v9 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10002D398(&qword_1000AEEA0);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  char v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_10002D398(&qword_1000AEEA8) - 8;
  __chkstk_darwin(v50);
  v49 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_10002D398(&qword_1000AEEB0) - 8;
  __chkstk_darwin(v56);
  uint64_t v53 = (uint64_t)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_10002D398(&qword_1000AEEB8) - 8;
  __chkstk_darwin(v54);
  uint64_t v52 = (uint64_t)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_10002D398(&qword_1000AEEC0) - 8;
  __chkstk_darwin(v57);
  uint64_t v55 = (uint64_t)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = *(int *)(type metadata accessor for CARSettingButtonStyle() + 24);
  uint64_t v20 = *(void *)(v2 + v51);
  swift_retain();
  uint64_t v21 = sub_100031B98();
  static Material.regular.getter();
  uint64_t v22 = v48;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v8, v11, v48);
  *(void *)&v8[*(int *)(v6 + 60)] = v20;
  *(_WORD *)&v8[*(int *)(v6 + 64)] = 256;
  sub_100033C94((uint64_t)v8, (uint64_t)&v15[*(int *)(v13 + 44)], &qword_1000AEE98);
  *(void *)char v15 = v20;
  *((void *)v15 + 1) = v21;
  *((_WORD *)v15 + 8) = 256;
  swift_retain_n();
  swift_retain();
  sub_100032F78((uint64_t)v8, &qword_1000AEE98);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v22);
  swift_release();
  swift_release();
  uint64_t v23 = static Alignment.center.getter();
  uint64_t v25 = v24;
  uint64_t v26 = (uint64_t)v49;
  uint64_t v27 = (uint64_t)&v49[*(int *)(v50 + 44)];
  sub_100031D98(v2, v27);
  char v28 = (uint64_t *)(v27 + *(int *)(sub_10002D398(&qword_1000AEEC8) + 36));
  uint64_t *v28 = v23;
  v28[1] = v25;
  uint64_t v29 = v26;
  sub_100033C30((uint64_t)v15, v26, &qword_1000AEEA0);
  static Font.Weight.semibold.getter();
  uint64_t v30 = type metadata accessor for Font.Design();
  uint64_t v31 = (uint64_t)v59;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v59, 1, 1, v30);
  uint64_t v32 = static Font.system(size:weight:design:)();
  sub_100032F78(v31, &qword_1000AEE90);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v34 = v53;
  sub_100033C94(v29, v53, &qword_1000AEEA8);
  v35 = (uint64_t *)(v34 + *(int *)(v56 + 44));
  uint64_t *v35 = KeyPath;
  v35[1] = v32;
  sub_100032F78(v29, &qword_1000AEEA8);
  uint64_t v36 = v52;
  uint64_t v37 = *(void *)(v2 + v51);
  sub_100033C94(v34, v52, &qword_1000AEEB0);
  uint64_t v38 = v36 + *(int *)(v54 + 44);
  *(void *)uint64_t v38 = v37;
  *(unsigned char *)(v38 + 8) = 0;
  swift_retain();
  sub_100032F78(v34, &qword_1000AEEB0);
  if (ButtonStyleConfiguration.isPressed.getter()) {
    double v39 = 0.96;
  }
  else {
    double v39 = 1.0;
  }
  static UnitPoint.center.getter();
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v44 = v55;
  sub_100033C94(v36, v55, &qword_1000AEEB8);
  uint64_t v45 = v44 + *(int *)(v57 + 44);
  *(double *)uint64_t v45 = v39;
  *(double *)(v45 + 8) = v39;
  *(void *)(v45 + 16) = v41;
  *(void *)(v45 + 24) = v43;
  sub_100032F78(v36, &qword_1000AEEB8);
  return sub_100033C30(v44, v60, &qword_1000AEEC0);
}

uint64_t sub_100031B98()
{
  uint64_t v1 = type metadata accessor for ColorScheme();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v16 - v6;
  sub_10002CFF4((uint64_t)&v16 - v6);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, enum case for ColorScheme.light(_:), v1);
  char v8 = static ColorScheme.== infix(_:_:)();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v5, v1);
  v9(v7, v1);
  if (v8)
  {
    uint64_t v10 = v0 + *(int *)(type metadata accessor for CARSettingButtonStyle() + 20);
    uint64_t v11 = *(void *)v10;
    char v12 = *(unsigned char *)(v10 + 8);
    sub_1000313D4(*(void *)v10, v12);
    char v13 = sub_1000310F0(v11, v12);
    sub_1000313E0(v11, v12);
    if ((v13 & 1) == 0)
    {
      uint64_t v17 = 3;
      sub_10002D398(&qword_1000AF028);
      sub_10002F5CC((unint64_t *)&unk_1000AF030, &qword_1000AF028);
      return AnyShapeStyle.init<A>(_:)();
    }
    uint64_t v14 = static Color.white.getter();
  }
  else
  {
    uint64_t v14 = static Color.clear.getter();
  }
  uint64_t v17 = v14;
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t sub_100031D98@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10002D398(&qword_1000AF020);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  ButtonStyleConfiguration.label.getter();
  uint64_t v11 = a1 + *(int *)(type metadata accessor for CARSettingButtonStyle() + 20);
  uint64_t v12 = *(void *)v11;
  char v13 = *(unsigned char *)(v11 + 8);
  sub_1000313D4(*(void *)v11, v13);
  char v14 = sub_1000310F0(v12, v13);
  sub_1000313E0(v12, v13);
  if (v14)
  {
    static Color.primary.getter();
  }
  else
  {
    id v15 = [self tertiaryLabelColor];
    Color.init(_:)();
  }
  ButtonStyleConfiguration.isPressed.getter();
  uint64_t v16 = Color.opacity(_:)();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v10, v7, v4);
  *(void *)&v10[*(int *)(v8 + 36)] = v16;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_100033C30((uint64_t)v10, a2, &qword_1000AF020);
}

uint64_t sub_100031FA8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100031FF8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100032028()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t sub_100032058@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  return result;
}

uint64_t sub_100032070@<X0>(uint64_t a1@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v35 = type metadata accessor for RoundedRectangle();
  uint64_t v2 = __chkstk_darwin(v35);
  uint64_t v36 = (uint64_t)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v5 = (_OWORD *)((char *)&v35 - v4);
  uint64_t v6 = type metadata accessor for CARSettingButtonStyle();
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t *)((char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = sub_10002D398(&qword_1000AEED0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v37 = v12;
  uint64_t v38 = v13;
  __chkstk_darwin(v12);
  id v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10002D398(&qword_1000AEED8);
  uint64_t v16 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = v1;
  swift_retain();
  sub_10002D398(&qword_1000AEEE0);
  sub_100032900();
  Button.init(action:label:)();
  uint64_t v19 = (char *)v5 + *(int *)(v35 + 20);
  uint64_t v20 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v21 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104))(v19, v20, v21);
  __asm { FMOV            V0.2D, #10.0 }
  _OWORD *v5 = _Q0;
  *uint64_t v9 = swift_getKeyPath();
  sub_10002D398(&qword_1000AEB50);
  swift_storeEnumTagMultiPayload();
  uint64_t v27 = (char *)v9 + *(int *)(v6 + 20);
  *(void *)uint64_t v27 = swift_getKeyPath();
  v27[8] = 0;
  sub_1000329A0((uint64_t)v5, v36);
  sub_100032A68(&qword_1000AEF00, (void (*)(uint64_t))&type metadata accessor for RoundedRectangle);
  uint64_t v28 = AnyShape.init<A>(_:)();
  sub_100032AB0((uint64_t)v5, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(uint64_t *)((char *)v9 + *(int *)(v6 + 24)) = v28;
  sub_100032A04((uint64_t)v9, (uint64_t)v11);
  sub_10002F5CC(&qword_1000AEF08, &qword_1000AEED0);
  sub_100032A68(&qword_1000AEF10, (void (*)(uint64_t))type metadata accessor for CARSettingButtonStyle);
  uint64_t v29 = v37;
  View.buttonStyle<A>(_:)();
  sub_100032AB0((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for CARSettingButtonStyle);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v29);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v31 = v39;
  uint64_t v30 = v40;
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 16))(v40, v18, v39);
  uint64_t v32 = (_OWORD *)(v30 + *(int *)(sub_10002D398(&qword_1000AEF18) + 36));
  long long v33 = v43;
  *uint64_t v32 = v42;
  v32[1] = v33;
  v32[2] = v44;
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v31);
}

uint64_t sub_100032534()
{
  uint64_t v1 = sub_10002D398(&qword_1000AF018);
  __chkstk_darwin(v1);
  uint64_t v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_10002D398(&qword_1000AEEF8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*(void *)(v0 + 40))
  {
    uint64_t v9 = __chkstk_darwin(v6);
    __chkstk_darwin(v9);
    Label.init(title:icon:)();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v3, v8, v4);
    swift_storeEnumTagMultiPayload();
    sub_10002F5CC(&qword_1000AEEF0, &qword_1000AEEF8);
    _ConditionalContent<>.init(storage:)();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    *(void *)uint64_t v3 = Text.init(_:tableName:bundle:comment:)();
    *((void *)v3 + 1) = v11;
    uint8_t v3[16] = v12 & 1;
    *((void *)v3 + 3) = v13;
    swift_storeEnumTagMultiPayload();
    sub_10002F5CC(&qword_1000AEEF0, &qword_1000AEEF8);
    return _ConditionalContent<>.init(storage:)();
  }
}

uint64_t sub_100032848@<X0>(uint64_t a1@<X8>)
{
  return sub_100032070(a1);
}

uint64_t sub_100032884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000328B0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000328DC()
{
  return sub_100032534();
}

unint64_t sub_100032900()
{
  unint64_t result = qword_1000AEEE8;
  if (!qword_1000AEEE8)
  {
    sub_10002F34C(&qword_1000AEEE0);
    sub_10002F5CC(&qword_1000AEEF0, &qword_1000AEEF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AEEE8);
  }
  return result;
}

uint64_t sub_1000329A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100032A04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CARSettingButtonStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100032A68(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100032AB0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100032B10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100032B2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_100032B48(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    char v13 = v11[8];
    sub_1000313D4(*(void *)v11, v13);
    *(void *)uint64_t v10 = v12;
    v10[8] = v13;
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  swift_retain();
  return a1;
}

uint64_t sub_100032C94(uint64_t a1, uint64_t a2)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_1000313E0(*(void *)(a1 + *(int *)(a2 + 20)), *(unsigned char *)(a1 + *(int *)(a2 + 20) + 8));

  return swift_release();
}

void *sub_100032D48(void *a1, void *a2, uint64_t a3)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_1000313D4(*(void *)v9, v11);
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_retain();
  return a1;
}

void *sub_100032E48(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100032F78((uint64_t)a1, &qword_1000AEB50);
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_1000313D4(*(void *)v9, v11);
  uint64_t v12 = *(void *)v8;
  char v13 = v8[8];
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  sub_1000313E0(v12, v13);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100032F78(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10002D398(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_100032FD4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = &a1[v8];
  char v11 = &a2[v8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  return a1;
}

char *sub_1000330C0(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100032F78((uint64_t)a1, &qword_1000AEB50);
    uint64_t v6 = sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)v10;
  LOBYTE(v10) = v10[8];
  uint64_t v12 = *(void *)v9;
  char v13 = v9[8];
  *(void *)uint64_t v9 = v11;
  v9[8] = (char)v10;
  sub_1000313E0(v12, v13);
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_release();
  return a1;
}

uint64_t sub_1000331DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000331F0);
}

uint64_t sub_1000331F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000AEB60);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1000332B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000332C8);
}

uint64_t sub_1000332C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10002D398(&qword_1000AEB60);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void sub_100033388()
{
  sub_10002F264();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for CARSettingsButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CARSettingsButton()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for CARSettingsButton(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CARSettingsButton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CARSettingsButton(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CARSettingsButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CARSettingsButton(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CARSettingsButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CARSettingsButton()
{
  return &type metadata for CARSettingsButton;
}

unint64_t sub_10003370C()
{
  unint64_t result = qword_1000AEFA8;
  if (!qword_1000AEFA8)
  {
    sub_10002F34C(&qword_1000AEEC0);
    sub_100033788();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AEFA8);
  }
  return result;
}

unint64_t sub_100033788()
{
  unint64_t result = qword_1000AEFB0;
  if (!qword_1000AEFB0)
  {
    sub_10002F34C(&qword_1000AEEB8);
    sub_100033828();
    sub_10002F5CC(&qword_1000AF000, &qword_1000AF008);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AEFB0);
  }
  return result;
}

unint64_t sub_100033828()
{
  unint64_t result = qword_1000AEFB8;
  if (!qword_1000AEFB8)
  {
    sub_10002F34C(&qword_1000AEEB0);
    sub_1000338C8();
    sub_10002F5CC(&qword_1000AEFF0, &qword_1000AEFF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AEFB8);
  }
  return result;
}

unint64_t sub_1000338C8()
{
  unint64_t result = qword_1000AEFC0;
  if (!qword_1000AEFC0)
  {
    sub_10002F34C(&qword_1000AEEA8);
    sub_100033968();
    sub_10002F5CC(&qword_1000AEFE8, &qword_1000AEEC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AEFC0);
  }
  return result;
}

unint64_t sub_100033968()
{
  unint64_t result = qword_1000AEFC8;
  if (!qword_1000AEFC8)
  {
    sub_10002F34C(&qword_1000AEEA0);
    sub_10002F5CC(&qword_1000AEFD0, &qword_1000AEFD8);
    sub_10002F5CC(&qword_1000AEFE0, &qword_1000AEE98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AEFC8);
  }
  return result;
}

unint64_t sub_100033A30()
{
  unint64_t result = qword_1000AF010;
  if (!qword_1000AF010)
  {
    sub_10002F34C(&qword_1000AEF18);
    sub_10002F34C(&qword_1000AEED0);
    type metadata accessor for CARSettingButtonStyle();
    sub_10002F5CC(&qword_1000AEF08, &qword_1000AEED0);
    sub_100032A68(&qword_1000AEF10, (void (*)(uint64_t))type metadata accessor for CARSettingButtonStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF010);
  }
  return result;
}

uint64_t sub_100033B54@<X0>(uint64_t a1@<X8>)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = Text.init(_:tableName:bundle:comment:)();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100033BEC@<X0>(uint64_t *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = Image.init(_internalSystemName:)();
  *a1 = result;
  return result;
}

uint64_t sub_100033C30(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10002D398(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100033C94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10002D398(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

id sub_100033CF8()
{
  return *(id *)(v0 + OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_clusterThemeManager);
}

uint64_t sub_100033D08()
{
  return 0;
}

char *sub_100033D10(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_100033D44(a1);
}

char *sub_100033D44(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_displays] = 0;
  *(void *)&v1[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeData] = 0;
  *(void *)&v1[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeManagerData] = 0;
  *(void *)&v1[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_layoutSelectorViewController] = 0;
  v1[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_wasInBackground] = 0;
  id v3 = objc_allocWithZone((Class)CRSUIClusterThemeManager);
  char v4 = v1;
  id v5 = [v3 init];
  *(void *)&v4[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_clusterThemeManager] = v5;
  *(void *)&v4[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_panelController] = a1;
  swift_unknownObjectRetain();

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for CARThemeSelectorViewController();
  uint64_t v6 = (char *)[v14 initWithNibName:0 bundle:0];
  uint64_t v7 = *(void **)&v6[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_clusterThemeManager];
  uint64_t v8 = v6;
  [v7 setDelegate:v8];
  uint64_t v9 = self;
  id v10 = [v9 defaultCenter];
  [v10 addObserver:v8 selector:"vehicleDidUpdate" name:@"CARSettingsPanelControllerVehicleDidChangeNotification" object:0];

  id v11 = [v9 defaultCenter];
  uint64_t v12 = v8;
  [v11 addObserver:v12 selector:"synchronizeThemeIfNeeded" name:UIApplicationDidBecomeActiveNotification object:0];

  swift_unknownObjectRelease();
  return v12;
}

uint64_t type metadata accessor for CARThemeSelectorViewController()
{
  return self;
}

id sub_100033F5C(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_100033FCC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CARThemeSelectorViewController();
  [super viewDidLoad];
}

void sub_100034040(char a1)
{
}

void sub_100034060(char a1)
{
}

void sub_100034070(char a1, SEL *a2, uint64_t a3)
{
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for CARThemeSelectorViewController();
  [super & 1];
  id v7 = [v3 navigationController];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [v7 navigationBar];

    [v9 setBarStyle:a3];
  }
}

void sub_100034124(void *a1, uint64_t a2, uint64_t a3, const char **a4, uint64_t a5)
{
  v13.receiver = a1;
  v13.super_class = (Class)type metadata accessor for CARThemeSelectorViewController();
  uint64_t v8 = *a4;
  id v9 = v13.receiver;
  [super v8:a3];
  id v10 = [v9 navigationController];
  if (v10)
  {
    id v11 = v10;
    id v12 = [v10 navigationBar];

    [v12 setBarStyle:a5];
    id v9 = v12;
  }
}

void sub_1000341E8()
{
  uint64_t v1 = v0;
  if (v0[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_wasInBackground] != 1)
  {
    char v19 = 0;
    goto LABEL_20;
  }
  uint64_t v2 = OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeManagerData;
  uint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeManagerData];
  if (v3)
  {
    char v4 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 200);
    uint64_t v5 = swift_retain();
    uint64_t v6 = v4(v5);
    uint64_t v8 = v7;
    swift_release();
    uint64_t v9 = *(void *)&v1[v2];
    if (v9)
    {
      id v10 = *(uint64_t (**)(uint64_t))(*(void *)v9 + 224);
      uint64_t v11 = swift_retain();
      id v12 = (void *)v10(v11);
      swift_release();
      id v13 = [v12 currentLayoutID];

      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v16 = v15;

      if (v8)
      {
        if (v16)
        {
          if (v6 == v14 && v8 == v16)
          {
            swift_bridgeObjectRelease();
            char v18 = 1;
          }
          else
          {
            char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
          }
          goto LABEL_18;
        }
        goto LABEL_13;
      }
      if (v16)
      {
        char v18 = 0;
        goto LABEL_18;
      }
    }
    else if (v8)
    {
LABEL_13:
      char v18 = 0;
LABEL_18:
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
  }
  char v18 = 1;
LABEL_19:
  char v19 = v18 ^ 1;
LABEL_20:
  uint64_t v20 = OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeData;
  uint64_t v21 = *(void *)&v1[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeData];
  uint64_t v22 = *(void **)&v1[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_panelController];
  swift_bridgeObjectRetain();
  id v23 = [v22 vehicle];
  uint64_t v24 = v23;
  if (!v23) {
    goto LABEL_23;
  }
  id v25 = [v23 displayThemeData];

  if (v25)
  {
    sub_10002F83C(0, &qword_1000AF088);
    uint64_t v24 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_23:
    if (v21) {
      goto LABEL_24;
    }
LABEL_28:
    if (!v24)
    {
      if ((v19 & 1) == 0) {
        return;
      }
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  uint64_t v24 = 0;
  if (!v21) {
    goto LABEL_28;
  }
LABEL_24:
  if (!v24)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  uint64_t v26 = swift_bridgeObjectRetain();
  sub_1000370F0(v26, (uint64_t)v24);
  char v28 = v27;
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  if (!(v19 & 1 | ((v28 & 1) == 0))) {
    return;
  }
LABEL_30:
  id v29 = [v22 vehicle];
  uint64_t v30 = v29;
  if (v29)
  {
    id v31 = [v29 displayThemeData];

    if (v31)
    {
      sub_10002F83C(0, &qword_1000AF088);
      uint64_t v30 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      uint64_t v30 = 0;
    }
  }
  *(void *)&v1[v20] = v30;
  swift_bridgeObjectRelease();
  uint64_t v32 = *(void *)&v1[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeManagerData];
  if (v32)
  {
    uint64_t v33 = *(void *)&v1[v20];
    if (v33)
    {
      uint64_t v34 = *(uint64_t (**)(void))(*(void *)v32 + 224);
      swift_retain();
      uint64_t v35 = swift_bridgeObjectRetain();
      uint64_t v36 = (void *)((uint64_t (*)(uint64_t))v34)(v35);
      id v37 = [v36 currentLayoutID];

      uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v40 = v39;

      (*(void (**)(uint64_t, void))(*(void *)v32 + 280))(v33, v19 & 1);
      swift_bridgeObjectRelease();
      sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
      swift_retain_n();
      uint64_t v41 = static OS_os_log.default.getter();
      os_log_type_t v42 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v41, v42))
      {
        long long v43 = (uint8_t *)swift_slowAlloc();
        uint64_t v69 = swift_slowAlloc();
        *(_DWORD *)long long v43 = 136446210;
        type metadata accessor for CARThemeManagerData();
        sub_1000382D4(&qword_1000AF080, (void (*)(uint64_t))type metadata accessor for CARThemeManagerData);
        uint64_t v44 = dispatch thunk of CustomStringConvertible.description.getter();
        sub_10002F8D4(v44, v45, &v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Reloaded theme data, new theme: %{public}s", v43, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_release_n();
      }

      id v47 = [v1 presentedViewController];
      if (!v47) {
        goto LABEL_49;
      }
      uint64_t v48 = v47;
      self;
      v49 = (void *)swift_dynamicCastObjCClass();
      if (!v49)
      {
        swift_bridgeObjectRelease();
        swift_release();

        return;
      }
      id v50 = [v49 topViewController];

      if (!v50)
      {
LABEL_49:
        swift_bridgeObjectRelease();
        goto LABEL_50;
      }
      type metadata accessor for CARThemeEditorViewController();
      uint64_t v51 = swift_dynamicCastClass();
      if (v51)
      {
        uint64_t v52 = (char *)v51;
        uint64_t v53 = (void *)v34();
        id v54 = [v53 currentLayoutID];

        uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v57 = v56;

        if (v38 == v55 && v40 == v57)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v58 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v58 & 1) == 0)
          {
            [v52 dismissViewControllerAnimated:1 completion:0];
            (*(void (**)(uint64_t, uint64_t))(*(void *)v32 + 208))(v55, v57);

            goto LABEL_50;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v59 = OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_theme;
        uint64_t v60 = *(void *)&v52[OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_theme];
        v61 = *(uint64_t (**)(uint64_t))(*(void *)v32 + 248);
        uint64_t v62 = swift_retain();
        uint64_t v63 = v61(v62);
        uint64_t v64 = (*(uint64_t (**)(uint64_t))(*(void *)v63 + 136))(v63);
        swift_release();
        (*(void (**)(uint64_t))(*(void *)v60 + 144))(v64);
        swift_release();
        uint64_t v65 = *(void *)&v52[v59];
        uint64_t v66 = swift_retain();
        uint64_t v67 = v61(v66);
        uint64_t v68 = (*(uint64_t (**)(uint64_t))(*(void *)v67 + 184))(v67);
        swift_release();
        (*(void (**)(uint64_t))(*(void *)v65 + 192))(v68);

        swift_release();
LABEL_50:
        swift_release();
        return;
      }
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
      swift_retain();
      v46 = (void *)static OS_os_log.default.getter();
      static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)();

      swift_release();
    }
  }
}

uint64_t sub_100034ADC()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_wasInBackground] = 1;
  sub_10002F83C(0, (unint64_t *)&qword_1000AF090);
  uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_1000373BC;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100034DA8;
  aBlock[3] = &unk_100092AF0;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v0;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000382D4((unint64_t *)&qword_1000AF098, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10002D398(&qword_1000AF0A0);
  sub_10003743C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100034DA8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100034E34()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002F83C(0, (unint64_t *)&qword_1000AF090);
  uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_100037498;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100034DA8;
  aBlock[3] = &unk_100092B40;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v0;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000382D4((unint64_t *)&qword_1000AF098, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10002D398(&qword_1000AF0A0);
  sub_10003743C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_100035138()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CARThemeSelectorViewController();
  [super dealloc];
}

void *sub_1000352C0(unint64_t a1, uint64_t a2)
{
  objc_super v3 = v2;
  uint64_t v80 = type metadata accessor for CARThemeSelectorWrapperView();
  __chkstk_darwin(v80);
  uint64_t v7 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10002D398(&qword_1000AF2B8);
  uint64_t v79 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_10002D398(&qword_1000AF2C0);
  uint64_t v11 = __chkstk_darwin(v78);
  id v13 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v74 - v14;
  type metadata accessor for CARThemeManagerData();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_100039280(a1, a2);
  if (result)
  {
    uint64_t v17 = result;
    uint64_t v76 = v8;
    sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
    swift_retain_n();
    char v18 = static OS_os_log.default.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    BOOL v20 = os_log_type_enabled(v18, v19);
    uint64_t v81 = (uint64_t)v17;
    v77 = v15;
    v75 = v13;
    if (v20)
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v74 = v3;
      *(_DWORD *)uint64_t v21 = 136446210;
      uint64_t v82 = v81;
      uint64_t v83 = v22;
      sub_1000382D4(&qword_1000AF080, (void (*)(uint64_t))type metadata accessor for CARThemeManagerData);
      uint64_t v23 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v82 = sub_10002F8D4(v23, v24, &v83);
      objc_super v3 = v74;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Creating layout selector with current theme: %{public}s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v15 = v77;
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_10003AC84();
    swift_release_n();
    uint64_t v25 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1000382D4(&qword_1000AF0B0, (void (*)(uint64_t))type metadata accessor for CARThemeManagerData);
    swift_retain();
    Bindable<A>.init(wrappedValue:)();
    uint64_t v26 = v80;
    char v27 = (void (**)())&v7[*(int *)(v80 + 20)];
    char *v27 = sub_100038140;
    v27[1] = (void (*)())v25;
    uint64_t result = [*(id *)&v3[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_panelController] carSession];
    uint64_t v28 = v76;
    if (result)
    {
      id v29 = result;
      sub_1000382D4(&qword_1000AF2C8, (void (*)(uint64_t))type metadata accessor for CARThemeSelectorWrapperView);
      sub_10004AA48(v29, v26);

      sub_10003831C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for CARThemeSelectorWrapperView);
      uint64_t KeyPath = swift_getKeyPath();
      id v31 = *(void **)&v3[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_clusterThemeManager];
      uint64_t v32 = v79;
      (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v15, v10, v28);
      uint64_t v33 = (uint64_t *)&v15[*(int *)(v78 + 36)];
      *uint64_t v33 = KeyPath;
      v33[1] = (uint64_t)v31;
      uint64_t v34 = *(void (**)(char *, uint64_t))(v32 + 8);
      id v35 = v31;
      v34(v10, v28);
      uint64_t v36 = OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_layoutSelectorViewController;
      id v37 = *(void **)&v3[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_layoutSelectorViewController];
      uint64_t v38 = (uint64_t)v75;
      if (v37)
      {
        id v39 = v37;
        [v39 willMoveToParentViewController:0];
        uint64_t result = [v39 view];
        if (!result)
        {
LABEL_38:
          __break(1u);
          return result;
        }
        uint64_t v40 = result;
        [result removeFromSuperview];

        [v39 removeFromParentViewController];
      }
      sub_100033C94((uint64_t)v15, v38, &qword_1000AF2C0);
      id v41 = objc_allocWithZone((Class)sub_10002D398((uint64_t *)&unk_1000AF2D0));
      os_log_type_t v42 = (void *)UIHostingController.init(rootView:)();
      uint64_t result = [v42 view];
      if (result)
      {
        long long v43 = result;
        id v44 = [self clearColor];
        [v43 setBackgroundColor:v44];

        uint64_t result = [v42 view];
        if (result)
        {
          unint64_t v45 = result;
          [result setClipsToBounds:1];

          [v42 willMoveToParentViewController:v3];
          [v3 addChildViewController:v42];
          uint64_t result = [v3 view];
          if (result)
          {
            v46 = result;
            uint64_t result = [v42 view];
            if (result)
            {
              id v47 = result;
              [v46 addSubview:result];

              uint64_t result = [v42 view];
              if (result)
              {
                uint64_t v48 = result;
                [result setTranslatesAutoresizingMaskIntoConstraints:0];

                sub_10002D398((uint64_t *)&unk_1000AFA30);
                uint64_t v49 = swift_allocObject();
                *(_OWORD *)(v49 + 16) = xmmword_100072210;
                uint64_t result = [v42 view];
                if (result)
                {
                  id v50 = result;
                  id v51 = [result leadingAnchor];

                  uint64_t result = [v3 view];
                  if (result)
                  {
                    uint64_t v52 = result;
                    id v53 = [result leadingAnchor];

                    id v54 = [v51 constraintEqualToAnchor:v53];
                    *(void *)(v49 + 32) = v54;
                    uint64_t result = [v42 view];
                    if (result)
                    {
                      uint64_t v55 = result;
                      id v56 = [result trailingAnchor];

                      uint64_t result = [v3 view];
                      if (result)
                      {
                        uint64_t v57 = result;
                        id v58 = [result trailingAnchor];

                        id v59 = [v56 constraintEqualToAnchor:v58];
                        *(void *)(v49 + 40) = v59;
                        uint64_t result = [v42 view];
                        if (result)
                        {
                          uint64_t v60 = result;
                          id v61 = [result topAnchor];

                          uint64_t result = [v3 view];
                          if (result)
                          {
                            uint64_t v62 = result;
                            id v63 = [result topAnchor];

                            id v64 = [v61 constraintEqualToAnchor:v63];
                            *(void *)(v49 + 48) = v64;
                            uint64_t result = [v42 view];
                            if (result)
                            {
                              uint64_t v65 = result;
                              id v66 = [result bottomAnchor];

                              uint64_t result = [v3 view];
                              if (result)
                              {
                                uint64_t v67 = result;
                                uint64_t v68 = self;
                                id v69 = [v67 bottomAnchor];

                                id v70 = [v66 constraintEqualToAnchor:v69];
                                *(void *)(v49 + 56) = v70;
                                uint64_t v83 = v49;
                                specialized Array._endMutation()();
                                sub_10002F83C(0, (unint64_t *)&qword_1000AF2E0);
                                Class isa = Array._bridgeToObjectiveC()().super.isa;
                                swift_bridgeObjectRelease();
                                [v68 activateConstraints:isa];

                                v72 = *(void **)&v3[v36];
                                *(void *)&v3[v36] = v42;
                                id v73 = v42;

                                *(void *)&v3[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeManagerData] = v81;
                                swift_release();
                                return (void *)sub_100032F78((uint64_t)v77, &qword_1000AF2C0);
                              }
                              goto LABEL_37;
                            }
LABEL_36:
                            __break(1u);
LABEL_37:
                            __break(1u);
                            goto LABEL_38;
                          }
LABEL_35:
                          __break(1u);
                          goto LABEL_36;
                        }
LABEL_34:
                        __break(1u);
                        goto LABEL_35;
                      }
LABEL_33:
                      __break(1u);
                      goto LABEL_34;
                    }
LABEL_32:
                    __break(1u);
                    goto LABEL_33;
                  }
LABEL_31:
                  __break(1u);
                  goto LABEL_32;
                }
LABEL_30:
                __break(1u);
                goto LABEL_31;
              }
LABEL_29:
              __break(1u);
              goto LABEL_30;
            }
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }
  return result;
}

void sub_100035D40(char a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v22 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v23 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
  uint64_t v8 = static OS_os_log.default.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v21 = v2;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v6;
    os_log_type_t v19 = v4;
    *(_DWORD *)uint64_t v11 = 136446210;
    aBlock[0] = v12;
    if (a1) {
      uint64_t v13 = 0x6673736563637573;
    }
    else {
      uint64_t v13 = 0x7365636375736E75;
    }
    if (a1) {
      unint64_t v14 = 0xEC000000796C6C75;
    }
    else {
      unint64_t v14 = 0xEE00796C6C756673;
    }
    uint64_t v24 = sub_10002F8D4(v13, v14, aBlock);
    char v4 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Updated theme data %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    uint64_t v6 = v20;
    swift_slowDealloc();
    uint64_t v2 = v21;
    swift_slowDealloc();
  }

  if ((a1 & 1) == 0)
  {
    sub_10002F83C(0, (unint64_t *)&qword_1000AF090);
    uint64_t v15 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = (uint64_t)sub_1000383E0;
    aBlock[5] = v16;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100034DA8;
    aBlock[3] = (uint64_t)&unk_100092C58;
    uint64_t v17 = _Block_copy(aBlock);
    swift_release();
    char v18 = v23;
    static DispatchQoS.unspecified.getter();
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_1000382D4((unint64_t *)&qword_1000AF098, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10002D398(&qword_1000AF0A0);
    sub_10003743C();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v22 + 8))(v4, v2);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v18, v5);
  }
}

uint64_t sub_100036184(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_1000361D8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  type metadata accessor for CARThemeManagerData();
  sub_1000382D4(&qword_1000AF0B0, (void (*)(uint64_t))type metadata accessor for CARThemeManagerData);
  Bindable<A>.init(wrappedValue:)();
  uint64_t result = type metadata accessor for CARThemeSelectorWrapperView();
  uint64_t v7 = (void *)(a3 + *(int *)(result + 20));
  *uint64_t v7 = a1;
  v7[1] = a2;
  return result;
}

uint64_t sub_10003627C()
{
  sub_100037540();
  EnvironmentValues.subscript.getter();
  if (v3[8])
  {
    uint64_t Strong = 0;
    id v1 = &qword_1000AF0B8;
  }
  else
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    id v1 = &qword_1000AF0C0;
  }
  sub_100032F78((uint64_t)v3, v1);
  return Strong;
}

uint64_t sub_1000362F4@<X0>(uint64_t *a1@<X8>)
{
  sub_100037540();
  EnvironmentValues.subscript.getter();
  if (v5[8])
  {
    uint64_t Strong = 0;
    uint64_t v3 = (uint64_t *)&unk_1000AF0B8;
  }
  else
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    uint64_t v3 = (uint64_t *)&unk_1000AF0C0;
  }
  uint64_t result = sub_100032F78((uint64_t)v5, v3);
  *a1 = Strong;
  return result;
}

uint64_t sub_100036374(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    sub_100037594((uint64_t)v3, (uint64_t)&v4);
  }
  else
  {
    uint64_t v4 = 0;
  }
  BOOL v5 = v1 == 0;
  sub_100037540();
  return EnvironmentValues.subscript.setter();
}

void sub_1000363F8(void *a1)
{
  if (a1)
  {
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    sub_100037594((uint64_t)v2, (uint64_t)&v3);
  }
  else
  {
    uint64_t v3 = 0;
  }
  BOOL v4 = a1 == 0;
  sub_100037540();
  EnvironmentValues.subscript.setter();
}

id sub_10003647C(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = v3;
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void sub_1000364F4()
{
}

id sub_100036558()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_clusterThemeManager) invalidate];
}

uint64_t sub_100036588(void *a1)
{
  id v2 = [a1 displays];
  sub_10002F83C(0, &qword_1000AF0C8);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v4 = [a1 themeData];
  sub_10002F83C(0, &qword_1000AF088);
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1000352C0(v3, v5);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100036784()
{
  type metadata accessor for CARThemeManagerData();
  sub_1000382D4(&qword_1000AF0B0, (void (*)(uint64_t))type metadata accessor for CARThemeManagerData);

  return Bindable<A>.init(wrappedValue:)();
}

uint64_t sub_100036810()
{
  sub_10002D398((uint64_t *)&unk_1000AF0D0);
  Bindable.wrappedValue.getter();
  return v1;
}

uint64_t sub_100036844()
{
  return Bindable.wrappedValue.setter();
}

void (*sub_10003687C(void *a1))(void *a1)
{
  id v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_10002D398((uint64_t *)&unk_1000AF0D0);
  v2[4] = Bindable.wrappedValue.modify();
  return sub_1000368E8;
}

void sub_1000368E8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_100036934()
{
  sub_10002D398((uint64_t *)&unk_1000AF0D0);

  return Bindable.projectedValue.getter();
}

uint64_t sub_100036974()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CARThemeSelectorWrapperView() + 20));
  swift_retain();
  return v1;
}

uint64_t sub_1000369B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v2 = sub_10002D398(&qword_1000AEB60);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10002D398((uint64_t *)&unk_1000AF0D0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  os_log_type_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v27 - v10;
  uint64_t v31 = type metadata accessor for CARThemeLayoutSelector(0);
  __chkstk_darwin(v31);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  Bindable.wrappedValue.getter();
  id v30 = *(id *)(v33.n128_u64[0] + 48);
  swift_release();
  Bindable.projectedValue.getter();
  swift_getKeyPath();
  Bindable<A>.subscript.getter();
  swift_release();
  unint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v11, v5);
  uint64_t v15 = v38;
  uint64_t v28 = v37;
  uint64_t v29 = v36;
  Bindable.projectedValue.getter();
  swift_getKeyPath();
  Bindable<A>.subscript.getter();
  swift_release();
  v14(v9, v5);
  __n128 v27 = v33;
  unint64_t v16 = v34;
  unint64_t v17 = v35;
  char v18 = (uint64_t *)(v1 + *(int *)(type metadata accessor for CARThemeSelectorWrapperView() + 20));
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  uint64_t v21 = swift_retain();
  sub_100041654(v21);
  uint64_t v22 = sub_1000457C4();
  LOBYTE(v5) = v23 & 1;
  uint64_t v24 = sub_10004AA3C();
  sub_1000457E8((uint64_t)v4, v22, v5, v24, v25 & 1, (uint64_t)v30, v29, v28, (uint64_t)v13, v15, v27, v16, v17, v20, v19);
  sub_1000382D4(&qword_1000AF0E0, (void (*)(uint64_t))type metadata accessor for CARThemeLayoutSelector);
  sub_10003C8FC(v31);
  return sub_10003831C((uint64_t)v13, type metadata accessor for CARThemeLayoutSelector);
}

uint64_t sub_100036CDC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 224))();
  *a2 = result;
  return result;
}

uint64_t sub_100036D28(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 232))(*a1);
}

uint64_t sub_100036D7C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 200))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_100036DC8(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 208);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_100036E34()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_100036E3C()
{
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

uint64_t sub_100036E7C()
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

void sub_100036EC4()
{
  qword_1000B0B38 = 0;
  byte_1000B0B40 = 1;
}

uint64_t sub_100036EDC@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000B0B30 != -1) {
    swift_once();
  }
  return sub_100033C94((uint64_t)&qword_1000B0B38, a1, &qword_1000AF0B8);
}

void (*sub_100036F48(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  void v3[5] = sub_100037540();
  EnvironmentValues.subscript.getter();
  if (v3[1])
  {
    uint64_t Strong = 0;
    uint64_t v5 = &qword_1000AF0B8;
  }
  else
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    uint64_t v5 = &qword_1000AF0C0;
  }
  sub_100032F78((uint64_t)v3, v5);
  v3[2] = Strong;
  return sub_100036FFC;
}

void sub_100036FFC(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void **)(*a1 + 16);
  if (a2)
  {
    if (v3)
    {
      swift_unknownObjectWeakInit();
      uint64_t v4 = swift_unknownObjectWeakAssign();
      sub_100037594(v4, v2);
    }
    else
    {
      *(void *)uint64_t v2 = 0;
    }
    *(unsigned char *)(v2 + 8) = v3 == 0;
    EnvironmentValues.subscript.setter();
  }
  else
  {
    if (v3)
    {
      swift_unknownObjectWeakInit();
      uint64_t v5 = swift_unknownObjectWeakAssign();
      sub_100037594(v5, v2);
      uint64_t v6 = v3;
    }
    else
    {
      uint64_t v6 = 0;
      *(void *)uint64_t v2 = 0;
    }
    *(unsigned char *)(v2 + 8) = v3 == 0;
    EnvironmentValues.subscript.setter();
  }

  free((void *)v2);
}

void sub_1000370F0(uint64_t a1, uint64_t a2)
{
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v12 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    char v18 = *(void **)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_100030034(v16, v17);
    char v22 = v21;
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {

      return;
    }
    sub_10002F83C(0, &qword_1000AF088);
    id v23 = *(id *)(*(void *)(a2 + 56) + 8 * v20);
    char v24 = static NSObject.== infix(_:_:)();

    if ((v24 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_31:
  __break(1u);
}

void sub_1000372E8()
{
  *(void *)&v0[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_displays] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeData] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeManagerData] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_layoutSelectorViewController] = 0;
  v0[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_wasInBackground] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100037384()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000373BC()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x108))();
  *((unsigned char *)v1 + OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_wasInBackground) = 0;
  return result;
}

uint64_t sub_100037424(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100037434()
{
  return swift_release();
}

unint64_t sub_10003743C()
{
  unint64_t result = qword_1000AF0A8;
  if (!qword_1000AF0A8)
  {
    sub_10002F34C(&qword_1000AF0A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF0A8);
  }
  return result;
}

uint64_t sub_100037498()
{
  return (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 16)) + 0x108))();
}

uint64_t type metadata accessor for CARThemeSelectorWrapperView()
{
  uint64_t result = qword_1000B0BE0;
  if (!qword_1000B0BE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100037540()
{
  unint64_t result = qword_1000B0B48[0];
  if (!qword_1000B0B48[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000B0B48);
  }
  return result;
}

uint64_t sub_100037594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000AF0C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000375FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_100037618(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10002D398((uint64_t *)&unk_1000AF0D0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    int64_t v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *int64_t v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t sub_1000376F0(uint64_t a1)
{
  uint64_t v2 = sub_10002D398((uint64_t *)&unk_1000AF0D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_release();
}

uint64_t sub_10003776C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398((uint64_t *)&unk_1000AF0D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  int64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

uint64_t sub_1000377F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398((uint64_t *)&unk_1000AF0D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  int64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100037890(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398((uint64_t *)&unk_1000AF0D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100037910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398((uint64_t *)&unk_1000AF0D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_10003799C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000379B0);
}

uint64_t sub_1000379B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398((uint64_t *)&unk_1000AF0D0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100037A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100037A88);
}

uint64_t sub_100037A88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10002D398((uint64_t *)&unk_1000AF0D0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

void sub_100037B48()
{
  sub_100037BE0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100037BE0()
{
  if (!qword_1000AF288)
  {
    type metadata accessor for CARThemeManagerData();
    unint64_t v0 = type metadata accessor for Bindable();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000AF288);
    }
  }
}

uint64_t sub_100037C38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t sub_100037C54(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100037C74(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for WeakBox()
{
  return sub_10003846C();
}

uint64_t sub_100037CB4()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for CRSUIClusterThemeManagerKey()
{
  return &type metadata for CRSUIClusterThemeManagerKey;
}

uint64_t sub_100037D4C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100037D84(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    char v3 = (char *)Strong;
    uint64_t v4 = OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeData;
    uint64_t v5 = *(void *)(Strong + OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeData);
    uint64_t v6 = *(void (**)(void))(*(void *)a1 + 152);
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = ((uint64_t (*)(uint64_t))v6)(v7);
    if (v5)
    {
      uint64_t v9 = swift_bridgeObjectRetain();
      sub_1000370F0(v9, v8);
      char v11 = v10;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      if (v11)
      {
LABEL_10:

        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
    swift_retain_n();
    uint64_t v12 = static OS_os_log.default.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      int64_t v14 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)int64_t v14 = 136446210;
      type metadata accessor for CARThemeManagerData();
      sub_1000382D4(&qword_1000AF080, (void (*)(uint64_t))type metadata accessor for CARThemeManagerData);
      uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
      sub_10002F8D4(v15, v16, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Updating theme data to: %{public}s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v17 = swift_release_n();
    }
    *(void *)&v3[v4] = ((uint64_t (*)(uint64_t))v6)(v17);
    swift_bridgeObjectRelease();
    id v18 = *(id *)&v3[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_clusterThemeManager];
    v6();
    sub_10002F83C(0, &qword_1000AF088);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v3;
    aBlock[4] = (uint64_t)sub_1000383D8;
    aBlock[5] = v20;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100036184;
    aBlock[3] = (uint64_t)&unk_100092C30;
    char v21 = _Block_copy(aBlock);
    char v22 = v3;
    swift_release();
    [v18 setThemeData:isa completion:v21];
    _Block_release(v21);

    goto LABEL_10;
  }
}

void sub_100038140()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    uint64_t v2 = *(void *)(Strong + OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_themeManagerData);
    if (v2)
    {
      char v3 = *(void (**)(uint64_t))(*(void *)v2 + 248);
      uint64_t v4 = swift_retain();
      v3(v4);
      swift_retain();
      sub_10003E8D0();
      swift_release();
      uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_panelController];
      id v6 = *(id *)&v1[OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_clusterThemeManager];
      id v7 = [v5 carSession];
      if (!v7)
      {
        __break(1u);
        return;
      }
      uint64_t v8 = (uint64_t)v7;
      type metadata accessor for CARThemeEditorViewController();
      uint64_t v9 = swift_retain();
      id v10 = sub_10005BCA4(v9, (uint64_t)v6, v8);
      id v11 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v10];
      [v1 presentViewController:v11 animated:1 completion:0];

      swift_release();
      swift_release();
    }
  }
}

uint64_t sub_1000382D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003831C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10003837C()
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)v0 + 256);
  uint64_t v1 = swift_retain();

  return v3(v1);
}

void sub_1000383D8(char a1)
{
}

void sub_1000383E0()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    (*(void (**)(void))((swift_isaMask & *Strong) + 0x108))();
  }
}

uint64_t sub_10003846C()
{
  return swift_getGenericMetadata();
}

void sub_10003849C()
{
}

uint64_t sub_1000384D0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000384D8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1000384E0()
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v0 + 304))();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_100038564@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 152))();
  *a2 = result;
  return result;
}

uint64_t sub_1000385B0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t KeyPath = swift_getKeyPath();
  _DWORD v7[2] = v3;
  v7[3] = v2;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t (*)(), void *, char *))(*(void *)v3 + 312);
  swift_bridgeObjectRetain();
  v5(KeyPath, sub_10003C8C8, v7, &type metadata for ()[8]);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003867C(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v4 = v1;
  uint64_t v5 = a1;
  (*(void (**)(void))(*(void *)v1 + 312))();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100038724(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 24) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100038784()
{
  return sub_100038724(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000387B0()
{
  return 0;
}

uint64_t (*sub_1000387BC())()
{
  return j__swift_endAccess;
}

uint64_t sub_100038814@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_10003881C()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 304))();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = v0[4];
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000388AC(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  uint64_t v6 = v2;
  uint64_t v7 = a1;
  uint64_t v8 = a2;
  (*(void (**)(void))(*(void *)v2 + 312))();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003895C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 32) = a2;
  *(void *)(a1 + 40) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000389C0()
{
  return sub_10003895C(v0[2], v0[3], v0[4]);
}

void (*sub_1000389F0(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 304))(KeyPath);
  swift_release();
  void v3[5] = OBJC_IVAR____TtC15CarPlaySettings19CARThemeManagerData___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_10003C838(&qword_1000AF0B0, (void (*)(uint64_t))type metadata accessor for CARThemeManagerData);
  ObservationRegistrar.willSet<A, B>(_:keyPath:)();
  swift_release();
  v3[7] = sub_1000387BC();
  return sub_100038B24;
}

void sub_100038B24(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  *uint64_t v1 = v1[4];
  swift_getKeyPath();
  ObservationRegistrar.didSet<A, B>(_:keyPath:)();
  swift_release();

  free(v1);
}

uint64_t type metadata accessor for CARThemeManagerData()
{
  uint64_t result = qword_1000B0E20;
  if (!qword_1000B0E20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_100038BFC()
{
  return *(id *)(v0 + 48);
}

id sub_100038C04()
{
  return *(id *)(v0 + 56);
}

uint64_t sub_100038C0C()
{
  return sub_100039B18(*(void **)(v0 + 48));
}

void sub_100038C14(void *a1)
{
  id v2 = [*(id *)(v1 + 48) identifier];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  sub_100039BDC(a1, v3, v5);
  swift_bridgeObjectRelease();
}

void (*sub_100038C9C(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v3 = *(void **)(v1 + 48);
  a1[1] = v1;
  a1[2] = (uint64_t)v3;
  *a1 = sub_100039B18(v3);
  return sub_100038CE8;
}

void sub_100038CE8(void **a1, char a2)
{
  id v2 = a1[2];
  uint64_t v3 = *a1;
  if (a2)
  {
    id v5 = v3;
    id v6 = [v2 identifier];
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    sub_100039BDC(v5, v7, v9);
    swift_bridgeObjectRelease();
    id v10 = *a1;
  }
  else
  {
    id v11 = [a1[2] identifier];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v13;

    sub_100039BDC(v3, v12, v14);
    swift_bridgeObjectRelease();
  }
}

void sub_100038DF0()
{
  uint64_t v1 = (void *)v0;
  id v2 = [*(id *)(v0 + 48) layouts];
  id v3 = (id)sub_10002F83C(0, &qword_1000AF350);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_retain();
  id v5 = sub_10003C134(v4, (uint64_t)v1);
  swift_bridgeObjectRelease();
  swift_release();
  if (!v5)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v6 = (void *)v1[7];
  id v7 = [v6 identifier];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  uint64_t v11 = (*(uint64_t (**)(void))(*v1 + 152))();
  if (!*(void *)(v11 + 16))
  {
LABEL_7:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_8;
  }
  unint64_t v12 = sub_100030034(v8, v10);
  if ((v13 & 1) == 0)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_9;
  }
  id v14 = *(id *)(*(void *)(v11 + 56) + 8 * v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v15 = [v6 layouts];
  unint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v3 = v14;
  uint64_t v17 = sub_10003C32C(v16, v3);
  swift_bridgeObjectRelease();

  if (v17)
  {
    id v18 = v5;
    id v19 = v17;
    char v21 = (void *)nullsub_8(v18, v19, v20);
    id v23 = v22;
    char v24 = (void *)(*(uint64_t (**)(void))(*v1 + 224))();
    sub_100030444(v24, v21, v23);

    return;
  }
LABEL_9:

  __break(1u);
}

uint64_t sub_100039048(uint64_t a1)
{
  id v3 = *(void **)(v1 + 56);
  unint64_t v4 = (void *)sub_100039B18(v3);
  id v5 = (void *)(*(uint64_t (**)(void))(*(void *)a1 + 136))();
  CRSUIClusterThemePalette.id.getter();

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v7 = [v4 themeDataWithCurrentPaletteID:v6];

  uint64_t v8 = (void *)(*(uint64_t (**)(void))(*(void *)a1 + 184))();
  id v9 = [v8 data];

  id v10 = [v7 themeDataWithCurrentWallpaper:v9];
  id v11 = [v3 identifier];
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  sub_100039BDC(v10, v12, v14);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t (*sub_1000391E0(void *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  sub_100038DF0();
  *a1 = v3;
  return sub_100039228;
}

uint64_t sub_100039228(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return sub_100039048(*a1);
  }
  uint64_t v2 = swift_retain();
  sub_100039048(v2);

  return swift_release();
}

void *sub_100039280(unint64_t a1, uint64_t a2)
{
  return sub_1000392CC(a1, a2);
}

void *sub_1000392CC(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v3[4] = 0;
  void v3[5] = 0;
  NSString v6 = (char *)v3 + OBJC_IVAR____TtC15CarPlaySettings19CARThemeManagerData___observationRegistrar;
  ObservationRegistrar.init()();
  if (!(a1 >> 62))
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_22;
  }
LABEL_32:
  swift_bridgeObjectRetain();
  uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
  if (!v7) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t v8 = a1 & 0xC000000000000001;
  uint64_t v9 = 4;
  while (1)
  {
    if (v8) {
      id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v10 = *(id *)(a1 + 8 * v9);
    }
    id v11 = v10;
    uint64_t v12 = v9 - 3;
    if (__OFADD__(v9 - 4, 1))
    {
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    if ([v10 displayType] == (id)1) {
      break;
    }

    ++v9;
    if (v12 == v7) {
      goto LABEL_10;
    }
  }
  long long v43 = v6;
  swift_bridgeObjectRelease();
  id v13 = [v11 identifier];
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  if (*(void *)(a2 + 16))
  {
    unint64_t v17 = sub_100030034(v14, v16);
    if (v18)
    {
      id v42 = *(id *)(*(void *)(a2 + 56) + 8 * v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v19 = 4;
      while (1)
      {
        if (v8) {
          id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v20 = *(id *)(a1 + 8 * v19);
        }
        char v21 = v20;
        NSString v6 = (char *)(v19 - 3);
        if (__OFADD__(v19 - 4, 1)) {
          goto LABEL_31;
        }
        if ([v20 displayType] == (id)2) {
          break;
        }

        ++v19;
        if (v6 == (char *)v7)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_29:
          swift_bridgeObjectRelease();
          sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
          char v22 = (void *)static OS_os_log.default.getter();
          static os_log_type_t.default.getter();
          os_log(_:dso:log:type:_:)();

          NSString v6 = v43;
          goto LABEL_23;
        }
      }
      swift_bridgeObjectRelease();
      id v25 = [v21 identifier];
      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v28 = v27;

      if (*(void *)(a2 + 16))
      {
        sub_100030034(v26, v28);
        if (v29)
        {
          swift_bridgeObjectRelease();
          v3[2] = a1;
          v3[3] = a2;
          v3[6] = v11;
          v3[7] = v21;
          id v30 = v11;
          id v31 = v21;
          id v32 = v42;
          id v33 = [v42 currentLayoutID];
          uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v36 = v35;

          uint64_t KeyPath = swift_getKeyPath();
          uint64_t v38 = __chkstk_darwin(KeyPath);
          id v39 = v3;
          uint64_t v40 = v34;
          uint64_t v41 = v36;
          (*(void (**)(uint64_t, uint64_t (*)()))(*v3 + 312))(v38, sub_10003C8E4);

          swift_release();
          swift_bridgeObjectRelease();
          return v3;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      goto LABEL_29;
    }
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v6 = v43;
LABEL_22:
  sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
  char v22 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
LABEL_23:

  swift_bridgeObjectRelease();
  uint64_t v23 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v6, v23);
  type metadata accessor for CARThemeManagerData();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_1000397B0(uint64_t a1, char a2)
{
  uint64_t v3 = (id *)v2;
  NSString v6 = *(void **)(v2 + 48);
  id v7 = [v6 identifier];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  if (!*(void *)(a1 + 16)) {
    goto LABEL_11;
  }
  sub_100030034(v8, v10);
  char v12 = v11;
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0) {
    goto LABEL_12;
  }
  id v13 = [v3[7] identifier];
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  if (!*(void *)(a1 + 16))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  sub_100030034(v14, v16);
  char v18 = v17;
  uint64_t v19 = swift_bridgeObjectRelease();
  if (v18)
  {
    uint64_t v20 = (*((uint64_t (**)(uint64_t))*v3 + 19))(v19);
    sub_1000370F0(v20, a1);
    char v22 = v21;
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {
      uint64_t KeyPath = swift_getKeyPath();
      id v37 = &v37;
      __chkstk_darwin(KeyPath);
      v36[2] = v3;
      v36[3] = a1;
      char v24 = (void (*)(uint64_t, uint64_t (*)(), void *, char *))*((void *)*v3 + 39);
      swift_bridgeObjectRetain();
      v24(KeyPath, sub_10003C8C8, v36, &type metadata for ()[8]);
      swift_release();
      swift_bridgeObjectRelease();
    }
    if (a2)
    {
      id v25 = [v6 identifier];
      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v28 = v27;

      if (*(void *)(a1 + 16) && (unint64_t v29 = sub_100030034(v26, v28), (v30 & 1) != 0))
      {
        id v31 = *(id *)(*(void *)(a1 + 56) + 8 * v29);
        swift_bridgeObjectRelease();
        id v32 = [v31 currentLayoutID];

        uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v35 = v34;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v33 = 0;
        uint64_t v35 = 0;
      }
      (*((void (**)(uint64_t, uint64_t))*v3 + 26))(v33, v35);
    }
    return;
  }
LABEL_12:
  sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
  id v37 = (id)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
}

uint64_t sub_100039B18(void *a1)
{
  id v2 = [a1 identifier];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v1 + 152))();
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_100030034(v3, v5), (v8 & 1) != 0))
  {
    id v9 = *(id *)(*(void *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v9;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

void sub_100039BDC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  NSString v8 = [a1 currentPaletteID];
  if (!v8)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = *(void (**)(void))(*v4 + 304);
  swift_bridgeObjectRetain();
  id v11 = a1;
  v129 = v10;
  ((void (*)(uint64_t))v10)(KeyPath);
  swift_release();
  v133[0] = (uint64_t)v4;
  swift_getKeyPath();
  sub_10003C838(&qword_1000AF0B0, (void (*)(uint64_t))type metadata accessor for CARThemeManagerData);
  ObservationRegistrar.willSet<A, B>(_:keyPath:)();
  swift_release();
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v131 = v4[3];
  v4[3] = 0x8000000000000000;
  sub_10003B8D8((uint64_t)v11, a2, a3, isUniquelyReferenced_nonNull_native);
  v4[3] = v131;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  v133[0] = (uint64_t)v4;
  swift_getKeyPath();
  ObservationRegistrar.didSet<A, B>(_:keyPath:)();
  swift_release();
  unint64_t v13 = v4[2];
  swift_bridgeObjectRetain();
  unint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = sub_10003BBFC(v14, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v15)
  {

    goto LABEL_84;
  }
  v130 = v8;
  uint64_t v16 = v15;
  char v17 = *(uint64_t (**)(void))(*v4 + 152);
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = ((uint64_t (*)(uint64_t))v17)(v18);
  if (!*(void *)(v19 + 16) || (unint64_t v20 = sub_100030034(a2, a3), (v21 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

LABEL_84:
    sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
    unint64_t v25 = static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    goto LABEL_85;
  }
  v116 = v4 + 3;
  id v22 = *(id *)(*(void *)(v19 + 56) + 8 * v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v23 = swift_bridgeObjectRetain();
  uint64_t v24 = ((uint64_t (*)(uint64_t))v17)(v23);
  unint64_t v25 = (unint64_t)v16;
  if (!*(void *)(v24 + 16) || (unint64_t v26 = sub_100030034(a2, a3), (v27 & 1) == 0))
  {

    swift_bridgeObjectRelease();
LABEL_83:
    swift_bridgeObjectRelease();
    goto LABEL_84;
  }
  v113 = v17;
  id v28 = *(id *)(*(void *)(v24 + 56) + 8 * v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v29 = [v28 currentWallpaper];

  id v30 = [v29 identifier];
  swift_unknownObjectRelease();
  uint64_t v111 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v32 = v31;

  id v33 = [(id)v25 layouts];
  sub_10002F83C(0, &qword_1000AF350);
  unint64_t v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v35 = v22;
  uint64_t v36 = (void *)sub_10003BDA4(v34, v35);
  swift_bridgeObjectRelease();

  if (!v36)
  {
LABEL_82:

    goto LABEL_83;
  }
  v107 = v36;
  id v37 = [v36 wallpapers];
  sub_10002F83C(0, (unint64_t *)&unk_1000AFA40);
  unint64_t v38 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRetain();
  id v39 = sub_10003BF6C(v38, v111, v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v112 = v39;
  if (!v39)
  {

    goto LABEL_82;
  }
  if (v13 >> 62) {
    goto LABEL_90;
  }
  uint64_t v40 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v40; uint64_t v40 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v41 = 0;
    unint64_t v124 = v13 & 0xC000000000000001;
    unint64_t v114 = v13 + 32;
    uint64_t v115 = v13 & 0xFFFFFFFFFFFFFF8;
    uint64_t v120 = a2;
    unint64_t v121 = v32;
    unint64_t v105 = v25;
    unint64_t v106 = v13;
    uint64_t v122 = v40;
    id v123 = v35;
    uint64_t v117 = a3;
    while (v124)
    {
      id v42 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      BOOL v43 = __OFADD__(v41, 1);
      unint64_t v44 = v41 + 1;
      if (v43) {
        goto LABEL_86;
      }
LABEL_23:
      unint64_t v128 = v44;
      unint64_t v45 = v42;
      id v46 = [v42 identifier:v105, v106];
      uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v49 = v48;

      BOOL v50 = v47 == a2 && v49 == a3;
      if (v50)
      {

        swift_bridgeObjectRelease();
      }
      else
      {
        v127 = v45;
        char v51 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v51 & 1) == 0)
        {
          id v52 = [v45 identifier];
          id v35 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v54 = v53;

          uint64_t v55 = v113();
          if (*(void *)(v55 + 16))
          {
            unint64_t v56 = sub_100030034((uint64_t)v35, v54);
            if (v57)
            {
              id v119 = *(id *)(*(void *)(v55 + 56) + 8 * v56);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              id v58 = [v45 layouts];
              unint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

              if (v25 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v59 = _CocoaArrayWrapper.endIndex.getter();
                if (v59) {
                  goto LABEL_33;
                }
              }
              else
              {
                uint64_t v59 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                if (v59)
                {
LABEL_33:
                  unint64_t v13 = 4;
                  while (1)
                  {
                    unint64_t v60 = v13 - 4;
                    if ((v25 & 0xC000000000000001) != 0)
                    {
                      id v61 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
                      unint64_t v62 = v13 - 3;
                      if (__OFADD__(v60, 1)) {
                        goto LABEL_87;
                      }
                    }
                    else
                    {
                      id v61 = *(id *)(v25 + 8 * v13);
                      unint64_t v62 = v13 - 3;
                      if (__OFADD__(v60, 1)) {
                        goto LABEL_87;
                      }
                    }
                    uint64_t v63 = v59;
                    id v125 = v61;
                    id v64 = [v61 identifier];
                    uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                    id v67 = v66;

                    id v68 = [v119 currentLayoutID];
                    uint64_t v69 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                    id v35 = v70;

                    if (v65 == v69 && v67 == v35)
                    {
                      swift_bridgeObjectRelease_n();
                      a2 = v120;
                      uint64_t v32 = v121;
                      goto LABEL_50;
                    }
                    char v72 = _stringCompareWithSmolCheck(_:_:expecting:)();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    uint64_t v32 = v121;
                    if (v72) {
                      break;
                    }

                    ++v13;
                    uint64_t v59 = v63;
                    BOOL v50 = v62 == v63;
                    a2 = v120;
                    a3 = v117;
                    if (v50) {
                      goto LABEL_46;
                    }
                  }
                  a2 = v120;
LABEL_50:
                  a3 = v117;
                  swift_bridgeObjectRelease_n();
                  id v74 = [v125 wallpapers];
                  unint64_t v75 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

                  if (v75 >> 62)
                  {
                    swift_bridgeObjectRetain();
                    uint64_t v76 = _CocoaArrayWrapper.endIndex.getter();
                    if (v76)
                    {
LABEL_52:
                      unint64_t v108 = v75;
                      unint64_t v109 = v75 & 0xC000000000000001;
                      unint64_t v13 = 4;
                      while (1)
                      {
                        unint64_t v77 = v13 - 4;
                        if (v109)
                        {
                          id v78 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
                          unint64_t v25 = v13 - 3;
                          if (__OFADD__(v77, 1)) {
                            goto LABEL_89;
                          }
                        }
                        else
                        {
                          id v78 = *(id *)(v75 + 8 * v13);
                          unint64_t v25 = v13 - 3;
                          if (__OFADD__(v77, 1)) {
                            goto LABEL_89;
                          }
                        }
                        uint64_t v79 = v76;
                        id v118 = v78;
                        id v80 = [v78 identifier];
                        uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                        id v83 = v82;

                        id v84 = [v112 identifier];
                        uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                        id v35 = v86;

                        if (v81 == v85 && v83 == v35) {
                          break;
                        }
                        char v88 = _stringCompareWithSmolCheck(_:_:expecting:)();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        if (v88) {
                          goto LABEL_72;
                        }

                        ++v13;
                        uint64_t v76 = v79;
                        BOOL v50 = v25 == v79;
                        a2 = v120;
                        uint64_t v32 = v121;
                        unint64_t v75 = v108;
                        if (v50) {
                          goto LABEL_65;
                        }
                      }
                      swift_bridgeObjectRelease_n();
LABEL_72:
                      a2 = v120;
                      swift_bridgeObjectRelease_n();
                      id v97 = [v127 identifier];
                      uint64_t v110 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                      uint64_t v99 = v98;

                      id v100 = [v119 themeDataWithCurrentPaletteID:v130];
                      id v101 = [v118 data];
                      id v102 = [v100 themeDataWithCurrentWallpaper:v101];

                      swift_getKeyPath();
                      v129();
                      swift_release();
                      v133[0] = (uint64_t)v4;
                      swift_getKeyPath();
                      ObservationRegistrar.willSet<A, B>(_:keyPath:)();
                      swift_release();
                      swift_beginAccess();
                      unint64_t v25 = v105;
                      unint64_t v13 = v106;
                      if (v102)
                      {
                        char v103 = swift_isUniquelyReferenced_nonNull_native();
                        uint64_t v132 = *v116;
                        uint64_t *v116 = 0x8000000000000000;
                        sub_10003B8D8((uint64_t)v102, v110, v99, v103);
                        uint64_t *v116 = v132;
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                      }
                      else
                      {
                        v104 = (void *)sub_10003B320(v110, v99);
                        swift_bridgeObjectRelease();
                      }
                      uint64_t v32 = v121;
                      swift_endAccess();
                      v133[0] = (uint64_t)v4;
                      swift_getKeyPath();
                      ObservationRegistrar.didSet<A, B>(_:keyPath:)();

                      swift_release();
                      goto LABEL_16;
                    }
                  }
                  else
                  {
                    uint64_t v76 = *(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10);
                    swift_bridgeObjectRetain();
                    if (v76) {
                      goto LABEL_52;
                    }
                  }
LABEL_65:
                  swift_bridgeObjectRelease_n();

                  id v73 = v125;
LABEL_66:

                  unint64_t v25 = v105;
                  unint64_t v13 = v106;
LABEL_67:
                  sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
                  swift_bridgeObjectRetain_n();
                  id v89 = v127;
                  v90 = static OS_os_log.default.getter();
                  os_log_type_t v91 = static os_log_type_t.default.getter();
                  if (os_log_type_enabled(v90, v91))
                  {
                    uint64_t v92 = swift_slowAlloc();
                    v133[0] = swift_slowAlloc();
                    *(_DWORD *)uint64_t v92 = 136315394;
                    id v93 = [v89 identifier];
                    uint64_t v94 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                    os_log_type_t v126 = v91;
                    unint64_t v96 = v95;

                    uint64_t v32 = v121;
                    *(void *)(v92 + 4) = sub_10002F8D4(v94, v96, v133);

                    swift_bridgeObjectRelease();
                    *(_WORD *)(v92 + 12) = 2080;
                    swift_bridgeObjectRetain();
                    *(void *)(v92 + 14) = sub_10002F8D4(v111, v121, v133);
                    swift_bridgeObjectRelease_n();
                    _os_log_impl((void *)&_mh_execute_header, v90, v126, "Failed to find matching wallpaper for display %s: %s", (uint8_t *)v92, 0x16u);
                    swift_arrayDestroy();
                    swift_slowDealloc();
                    a2 = v120;
                    swift_slowDealloc();
                  }
                  else
                  {
                    swift_bridgeObjectRelease_n();
                  }
                  goto LABEL_16;
                }
              }
LABEL_46:
              swift_bridgeObjectRelease_n();
              id v73 = v119;
              goto LABEL_66;
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_67;
        }
      }
LABEL_16:
      id v35 = v123;
      unint64_t v41 = v128;
      if (v128 == v122) {
        goto LABEL_91;
      }
    }
    if (v41 >= *(void *)(v115 + 16)) {
      goto LABEL_88;
    }
    id v42 = *(id *)(v114 + 8 * v41);
    BOOL v43 = __OFADD__(v41, 1);
    unint64_t v44 = v41 + 1;
    if (!v43) {
      goto LABEL_23;
    }
LABEL_86:
    __break(1u);
LABEL_87:
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
LABEL_90:
    swift_bridgeObjectRetain();
  }
LABEL_91:

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

LABEL_85:
}

uint64_t sub_10003A9E8()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_10003AA70()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_10003AB30()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = v0 + OBJC_IVAR____TtC15CarPlaySettings19CARThemeManagerData___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_10003ABBC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC15CarPlaySettings19CARThemeManagerData___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10003AC84()
{
  return withObservationTracking<A>(_:onChange:)();
}

uint64_t (*sub_10003ACE8(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  swift_retain();
  swift_retain();
  return sub_10003C78C;
}

uint64_t sub_10003AD64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = a2;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002F83C(0, (unint64_t *)&qword_1000AF090);
  id v11 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  unint64_t v13 = (void *)swift_allocObject();
  uint64_t v14 = v18;
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = a3;
  aBlock[4] = sub_10003C814;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100034DA8;
  aBlock[3] = &unk_100092CF8;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  unint64_t v20 = &_swiftEmptyArrayStorage;
  sub_10003C838((unint64_t *)&qword_1000AF098, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10002D398(&qword_1000AF0A0);
  sub_10003743C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v19);
  swift_release();
  return swift_release();
}

uint64_t sub_10003B068(uint64_t a1, uint64_t (*a2)(void))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = a2();
    __chkstk_darwin(v4);
    withObservationTracking<A>(_:onChange:)();
    return swift_release();
  }
  return result;
}

uint64_t sub_10003B140()
{
  uint64_t v1 = v0;
  id v2 = [*(id *)(v0 + 48) layouts];
  sub_10002F83C(0, &qword_1000AF350);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_retain();
  uint64_t v4 = sub_10003C4EC(v3, v1);
  swift_bridgeObjectRelease();
  swift_release();
  if (v4)
  {
    id v5 = [v4 displayName];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v6 = 0x6E776F6E6B6E55;
  }
  v7._countAndFlagsBits = 10272;
  v7._object = (void *)0xE200000000000000;
  String.append(_:)(v7);
  (*(void (**)(void))(*(void *)v1 + 248))();
  type metadata accessor for CARThemeModel();
  sub_10003C838(&qword_1000AF358, (void (*)(uint64_t))type metadata accessor for CARThemeModel);
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v8);
  swift_release();
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 41;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);

  return v6;
}

uint64_t sub_10003B2FC()
{
  return sub_10003B140();
}

uint64_t sub_10003B320(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100030034(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10003BA48();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_10003B700(v6, v9);
  *unint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10003B3F0(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10002D398(&qword_1000AF4E0);
  char v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
  id v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

unint64_t sub_10003B700(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_10003B8D8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100030034(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10003BA48();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10003B3F0(v15, a4 & 1);
  unint64_t v20 = sub_100030034(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

id sub_10003BA48()
{
  uint64_t v1 = v0;
  sub_10002D398(&qword_1000AF4E0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10003BBFC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        int64_t v13 = v10;
        uint64_t v14 = a3;
        id v15 = [v10 identifier:v22];
        uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10003BDA4(unint64_t a1, void *a2)
{
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v5 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v7 = i - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_18;
          }
        }
        else
        {
          id v6 = *(id *)(a1 + 8 * i);
          uint64_t v7 = i - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        char v20 = v6;
        id v8 = [v6 identifier];
        uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v11 = v10;

        id v12 = [a2 currentLayoutID];
        uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v15 = v14;

        if (v9 == v13 && v11 == v15)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_17:
          uint64_t v3 = (uint64_t)v20;
          swift_bridgeObjectRelease();
          return v3;
        }
        char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v17) {
          goto LABEL_17;
        }

        if (v7 == v3)
        {
          swift_bridgeObjectRelease();
          return 0;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v3;
}

void *sub_10003BF6C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v23 = v4;
      unint64_t v24 = v7;
      unint64_t v25 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v25)
        {
          id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v10;
        id v14 = [v10 data:v23];
        uint64_t v15 = a3;
        id v16 = [v14 identifier];

        uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v19 = v18;

        a3 = v15;
        BOOL v20 = v17 == a2 && v19 == v15;
        if (v20)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v21) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v20 = v11 == v12;
        unint64_t v7 = v24;
      }
      while (!v20);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_10003C134(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      char v21 = *(uint64_t (**)(void))(*(void *)a2 + 224);
      uint64_t v4 = 4;
      do
      {
        uint64_t v5 = v4 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_18;
          }
        }
        else
        {
          id v6 = *(id *)(a1 + 8 * v4);
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        uint64_t v8 = v3;
        uint64_t v23 = v6;
        uint64_t v9 = CRSUIClusterThemePalette.id.getter();
        uint64_t v11 = v10;
        uint64_t v12 = (void *)v21();
        id v13 = [v12 currentLayoutID];

        uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v16 = v15;

        if (v9 == v14 && v11 == v16)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_17:
          uint64_t v19 = v23;
          swift_bridgeObjectRelease();
          return v19;
        }
        char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v18) {
          goto LABEL_17;
        }

        ++v4;
        uint64_t v3 = v8;
      }
      while (v7 != v8);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_10003C32C(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v19 = v2;
    unint64_t v20 = v2 & 0xC000000000000001;
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = v20 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v2 + 8 * v4);
      id v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = v3;
      uint64_t v9 = CRSUIClusterThemePalette.id.getter();
      uint64_t v11 = v10;
      id v12 = [a2 currentLayoutID];
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = v14;

      BOOL v16 = v9 == v13 && v11 == v15;
      if (v16)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_17:
        swift_bridgeObjectRelease();
        return v6;
      }
      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_17;
      }

      ++v4;
      uint64_t v3 = v8;
      BOOL v16 = v7 == v8;
      unint64_t v2 = v19;
      if (v16) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
LABEL_20:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t (*sub_10003C4E0())()
{
  return sub_10003ACE8(v0[2], v0[3], v0[4]);
}

void *sub_10003C4EC(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    BOOL v16 = *(uint64_t (**)(void))(*(void *)a2 + 200);
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v4);
      id v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t v8 = v3;
      uint64_t v9 = CRSUIClusterThemePalette.id.getter();
      uint64_t v11 = v10;
      uint64_t v12 = v16();
      if (v13)
      {
        if (v9 == v12 && v13 == v11)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_17:
          swift_bridgeObjectRelease();
          return v6;
        }
        char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v14) {
          goto LABEL_17;
        }
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      ++v4;
      uint64_t v3 = v8;
      if (v7 == v8) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
LABEL_20:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10003C6C4()
{
  return type metadata accessor for CARThemeManagerData();
}

uint64_t sub_10003C6CC()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10003C78C()
{
  return sub_10003AD64(v0[2], v0[3], v0[4]);
}

uint64_t sub_10003C798()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003C7D4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003C814()
{
  return sub_10003B068(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24));
}

uint64_t sub_10003C820(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003C830()
{
  return swift_release();
}

uint64_t sub_10003C838(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003C880()
{
  (*(void (**)(void))(*(void *)v0 + 152))();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10003C8C8()
{
  return sub_100038784();
}

uint64_t sub_10003C8E4()
{
  return sub_1000389C0();
}

uint64_t sub_10003C8FC(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ThemeEditorBackground();
  uint64_t v4 = __chkstk_darwin(v3);
  id v6 = (uint64_t *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v13 - v8;
  __chkstk_darwin(v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v1, a1);
  *id v6 = swift_getKeyPath();
  sub_10002D398(&qword_1000AEB50);
  swift_storeEnumTagMultiPayload();
  sub_10003CD90((uint64_t)v6, (uint64_t)v9);
  return ModifiedContent.init(content:modifier:)();
}

uint64_t type metadata accessor for ThemeEditorBackground()
{
  uint64_t result = qword_1000B0E40;
  if (!qword_1000B0E40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003CAD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v3 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ColorScheme();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v26 - v12;
  uint64_t v14 = static Alignment.center.getter();
  uint64_t v27 = v15;
  uint64_t v28 = v14;
  sub_10002CFF4((uint64_t)v13);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for ColorScheme.light(_:), v7);
  char v16 = static ColorScheme.== infix(_:_:)();
  char v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v11, v7);
  v17(v13, v7);
  if (v16)
  {
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Color.RGBColorSpace.sRGB(_:), v3);
    uint64_t v18 = Color.init(_:red:green:blue:opacity:)();
  }
  else
  {
    uint64_t v18 = static Color.black.getter();
  }
  uint64_t v19 = v18;
  uint64_t v20 = static SafeAreaRegions.all.getter();
  char v21 = static Edge.Set.all.getter();
  uint64_t v22 = sub_10002D398(&qword_1000AF568);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(a2, v29, v22);
  uint64_t result = sub_10002D398(&qword_1000AF570);
  uint64_t v24 = a2 + *(int *)(result + 36);
  *(void *)uint64_t v24 = v19;
  *(void *)(v24 + 8) = v20;
  *(unsigned char *)(v24 + 16) = v21;
  uint64_t v25 = v27;
  *(void *)(v24 + 24) = v28;
  *(void *)(v24 + 32) = v25;
  return result;
}

uint64_t sub_10003CD70()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_10003CD90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ThemeEditorBackground();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003CDF4()
{
  return swift_getWitnessTable();
}

unint64_t sub_10003CE60()
{
  unint64_t result = qword_1000B0E38;
  if (!qword_1000B0E38)
  {
    type metadata accessor for ThemeEditorBackground();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0E38);
  }
  return result;
}

uint64_t *sub_10003CEB8(uint64_t *a1, uint64_t *a2)
{
  int v4 = *(_DWORD *)(*(void *)(sub_10002D398(&qword_1000AEB50) - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10003CFC4(uint64_t a1)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = type metadata accessor for ColorScheme();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_release();
  }
}

void *sub_10003D068(void *a1, void *a2)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_10003D124(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_10002ED60((uint64_t)a1);
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_10003D1F0(void *a1, const void *a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_10003D2B4(void *a1, const void *a2)
{
  if (a1 != a2)
  {
    sub_10002ED60((uint64_t)a1);
    uint64_t v4 = sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10003D388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003D39C);
}

uint64_t sub_10003D39C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000AEB60);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10003D40C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003D420);
}

uint64_t sub_10003D420(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000AEB60);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_10003D494()
{
  sub_10002F264();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10003D520()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10003D540()
{
  unint64_t result = qword_1000AF578;
  if (!qword_1000AF578)
  {
    sub_10002F34C(&qword_1000AF570);
    sub_10002F5CC(&qword_1000AF580, &qword_1000AF568);
    sub_10002F5CC(&qword_1000AF588, &qword_1000AF590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF578);
  }
  return result;
}

void (*sub_10003D604(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_10003D65C;
}

void sub_10003D65C(uint64_t a1, char a2)
{
  uint64_t v4 = swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = (void *)(*(uint64_t (**)(uint64_t))(**(void **)(a1 + 24) + 136))(v4);
    uint64_t v6 = sub_10003E440(v5);

    if (v6) {
      (*(void (**)(void *))(**(void **)(a1 + 24) + 192))(v6);
    }
  }
}

id sub_10003D6FC()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 256))();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = (void *)v0[2];

  return v1;
}

uint64_t sub_10003D78C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 136))();
  *a2 = result;
  return result;
}

uint64_t sub_10003D7D8(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 144))(*a1);
}

void sub_10003D82C(void *a1)
{
}

void sub_10003D84C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void **)(v1 + 24);
  swift_beginAccess();
  uint64_t v4 = (void *)v2[2];
  v2[2] = v3;
  id v5 = v3;

  uint64_t v6 = (void *)(*(uint64_t (**)(void))(*v2 + 136))();
  uint64_t v7 = sub_10003E440(v6);

  if (v7) {
    (*(void (**)(void *))(*v2 + 192))(v7);
  }
}

void (*sub_10003D924(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 256))(KeyPath);
  swift_release();
  void v3[5] = OBJC_IVAR____TtC15CarPlaySettings13CARThemeModel___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_10003F36C(&qword_1000AF598, (void (*)(uint64_t))type metadata accessor for CARThemeModel);
  ObservationRegistrar.willSet<A, B>(_:keyPath:)();
  swift_release();
  v3[7] = sub_10003D604((uint64_t)v3);
  return sub_10003DA58;
}

void sub_10003DA58(void *a1)
{
}

uint64_t type metadata accessor for CARThemeModel()
{
  uint64_t result = qword_1000B0FF0;
  if (!qword_1000B0FF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t (*sub_10003DAB0())()
{
  return j__swift_endAccess;
}

id sub_10003DB04()
{
  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 256))();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = (void *)v0[3];

  return v1;
}

uint64_t sub_10003DB94@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 184))();
  *a2 = result;
  return result;
}

uint64_t sub_10003DBE0(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 192))(*a1);
}

void sub_10003DC34(void *a1)
{
}

void sub_10003DC54(void *a1)
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v1 + 264))();
  swift_release();
}

void sub_10003DCF0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  swift_beginAccess();
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = v1;
  id v4 = v1;
}

void (*sub_10003DD4C(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))(*(void *)v1 + 256))(KeyPath);
  swift_release();
  void v3[5] = OBJC_IVAR____TtC15CarPlaySettings13CARThemeModel___observationRegistrar;
  *uint64_t v3 = v1;
  swift_getKeyPath();
  v3[6] = sub_10003F36C(&qword_1000AF598, (void (*)(uint64_t))type metadata accessor for CARThemeModel);
  ObservationRegistrar.willSet<A, B>(_:keyPath:)();
  swift_release();
  v3[7] = sub_10003DAB0();
  return sub_10003DE80;
}

void sub_10003DE80(void *a1)
{
}

void sub_10003DE8C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  *uint64_t v1 = v1[4];
  swift_getKeyPath();
  ObservationRegistrar.didSet<A, B>(_:keyPath:)();
  swift_release();

  free(v1);
}

uint64_t sub_10003DF18@<X0>(uint64_t a1@<X8>)
{
  return sub_10003DF24(v1 + 32, a1);
}

uint64_t sub_10003DF24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10003DF88()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)(*(uint64_t (**)(void))(*v0 + 136))();
  uint64_t v3 = CRSUIClusterThemePalette.id.getter();
  uint64_t v5 = v4;

  uint64_t v6 = v1 + 4;
  uint64_t v7 = v1[7];
  uint64_t v8 = v1[8];
  sub_10003E164(v1 + 4, v7);
  uint64_t v9 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8);
  uint64_t v10 = CRSUIClusterThemePalette.id.getter();
  uint64_t v12 = v11;

  if (v3 == v10 && v5 == v12)
  {
    uint64_t v15 = swift_bridgeObjectRelease_n();
  }
  else
  {
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t v15 = swift_bridgeObjectRelease();
    char v16 = 0;
    if ((v14 & 1) == 0) {
      return v16 & 1;
    }
  }
  char v17 = (void *)(*(uint64_t (**)(uint64_t))(*v1 + 184))(v15);
  uint64_t v18 = CRSUIClusterThemeWallpaper.id.getter();
  uint64_t v20 = v19;

  uint64_t v22 = v1[7];
  uint64_t v21 = v1[8];
  sub_10003E164(v6, v22);
  uint64_t v23 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v21 + 32))(v22, v21);
  uint64_t v24 = CRSUIClusterThemeWallpaper.id.getter();
  uint64_t v26 = v25;

  if (v18 == v24 && v20 == v26) {
    char v16 = 1;
  }
  else {
    char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16 & 1;
}

void *sub_10003E164(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10003E1A8()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  sub_10003E164(v0 + 4, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

void *sub_10003E1FC()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  sub_10003E164(v0 + 4, v1);
  uint64_t v3 = (void *)(*(uint64_t (**)(void))(*v0 + 136))();
  uint64_t v4 = sub_1000301FC(v3, v1, v2);

  return v4;
}

uint64_t sub_10003E280(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t v6 = swift_allocObject();
  ObservationRegistrar.init()();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  sub_10003E33C(a3, v6 + 32);
  return v6;
}

uint64_t sub_10003E2E8(uint64_t a1, uint64_t a2, long long *a3)
{
  ObservationRegistrar.init()();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  sub_10003E33C(a3, v3 + 32);
  return v3;
}

uint64_t sub_10003E33C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10003E354()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  sub_10003E164(v0 + 4, v1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
  (*(void (**)(uint64_t))(*v0 + 144))(v3);
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  sub_10003E164(v0 + 4, v4);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 32))(v4, v5);
  uint64_t v7 = *(uint64_t (**)(uint64_t))(*v0 + 192);

  return v7(v6);
}

void *sub_10003E440(void *a1)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(void))(*v1 + 136))();
  uint64_t v4 = (void *)(*(uint64_t (**)(void))(*v1 + 184))();
  uint64_t v5 = v1 + 4;
  uint64_t v7 = v1[7];
  uint64_t v6 = v1[8];
  sub_10003E164(v5, v7);
  unint64_t v8 = (unint64_t)sub_1000301FC(a1, v7, v6);
  id v9 = [v4 associatedPaletteID];
  if (v9)
  {

    id v10 = v3;
    id v11 = v4;
    uint64_t v4 = sub_10003EFFC(v8, (uint64_t)v10, v11);

    if (v4)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v8 >> 62) {
        goto LABEL_20;
      }
      uint64_t v12 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      for (; v12; uint64_t v12 = _CocoaArrayWrapper.endIndex.getter())
      {
        uint64_t v13 = 4;
        while (1)
        {
          id v14 = (v8 & 0xC000000000000001) != 0
              ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
              : *(id *)(v8 + 8 * v13);
          uint64_t v4 = v14;
          uint64_t v15 = v13 - 3;
          if (__OFADD__(v13 - 4, 1)) {
            break;
          }
          id v16 = [v14 associatedPaletteID];
          if (!v16)
          {

            swift_bridgeObjectRelease();
            goto LABEL_16;
          }
          char v17 = v16;

          ++v13;
          if (v15 == v12) {
            goto LABEL_14;
          }
        }
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
      }
LABEL_14:

      swift_bridgeObjectRelease();
      uint64_t v4 = 0;
LABEL_16:
      swift_bridgeObjectRelease();
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_10003E654()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_10003E6DC()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_10003E79C()
{
  sub_10002FF84(v0 + 32);
  uint64_t v1 = v0 + OBJC_IVAR____TtC15CarPlaySettings13CARThemeModel___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_10003E818()
{
  sub_10002FF84((uint64_t)(v0 + 4));
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC15CarPlaySettings13CARThemeModel___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10003E8D0()
{
  return withObservationTracking<A>(_:onChange:)();
}

void sub_10003E934(uint64_t a1)
{
  uint64_t v2 = (void *)(*(uint64_t (**)(void))(*(void *)a1 + 184))();
}

void sub_10003E9B0()
{
  sub_10003E934(v0);
}

uint64_t (*sub_10003E9B8(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  swift_retain();
  swift_retain();
  return sub_10003F2C0;
}

uint64_t (*sub_10003EA34())()
{
  return sub_10003E9B8(v0[2], v0[3], v0[4]);
}

uint64_t sub_10003EA40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v18 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F2CC();
  id v11 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a2;
  v13[4] = a3;
  aBlock[4] = sub_10003F348;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100034DA8;
  aBlock[3] = &unk_100092D98;
  id v14 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v19 = &_swiftEmptyArrayStorage;
  sub_10003F36C((unint64_t *)&qword_1000AF098, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10002D398(&qword_1000AF0A0);
  sub_10003743C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v17);
  swift_release();
  return swift_release();
}

uint64_t sub_10003ED34(uint64_t a1, uint64_t (*a2)(void))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = a2();
    __chkstk_darwin(v4);
    withObservationTracking<A>(_:onChange:)();
    return swift_release();
  }
  return result;
}

uint64_t sub_10003EE0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)(*(uint64_t (**)(void))(*(void *)v0 + 136))();
  id v3 = [v2 displayName];

  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v4;
  v5._countAndFlagsBits = 8236;
  v5._object = (void *)0xE200000000000000;
  String.append(_:)(v5);
  uint64_t v6 = (void *)(*(uint64_t (**)(void))(*(void *)v1 + 184))();
  id v7 = [v6 displayName];

  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = v9;

  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_10003EF24()
{
  return sub_10003EE0C();
}

uint64_t sub_10003EF48()
{
  return type metadata accessor for CARThemeModel();
}

uint64_t sub_10003EF50()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *sub_10003EFFC(unint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v3 = a1;
  if (a1 >> 62)
  {
LABEL_29:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      unint64_t v30 = v3;
      uint64_t v32 = v4;
      unint64_t v33 = v3 & 0xC000000000000001;
      uint64_t v5 = 4;
      do
      {
        if (v33) {
          id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v6 = *(id *)(v3 + 8 * v5);
        }
        id v7 = v6;
        uint64_t v8 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
        {
          __break(1u);
          goto LABEL_29;
        }
        id v9 = [v6 associatedPaletteID];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v13 = v12;

          uint64_t v14 = CRSUIClusterThemePalette.id.getter();
          if (v13)
          {
            if (v11 == v14 && v13 == v15)
            {
              swift_bridgeObjectRelease_n();
            }
            else
            {
              char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v17 & 1) == 0)
              {
LABEL_24:

                uint64_t v4 = v32;
                goto LABEL_6;
              }
            }
            id v18 = [v7 package];
            id v19 = [v18 type];

            uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v22 = v21;

            id v23 = [a3 package];
            id v24 = [v23 type];

            uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v27 = v26;

            if (v20 == v25 && v22 == v27)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
LABEL_27:
              swift_bridgeObjectRelease();
              return v7;
            }
            char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            unint64_t v3 = v30;
            if (v28) {
              goto LABEL_27;
            }
            goto LABEL_24;
          }
          uint64_t v4 = v32;
        }
        else
        {
          CRSUIClusterThemePalette.id.getter();
        }

        swift_bridgeObjectRelease();
LABEL_6:
        ++v5;
      }
      while (v8 != v4);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10003F2C0()
{
  return sub_10003EA40(v0[2], v0[3], v0[4]);
}

unint64_t sub_10003F2CC()
{
  unint64_t result = qword_1000AF090;
  if (!qword_1000AF090)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000AF090);
  }
  return result;
}

uint64_t sub_10003F30C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003F348()
{
  return sub_10003ED34(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24));
}

uint64_t sub_10003F354(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003F364()
{
  return swift_release();
}

uint64_t sub_10003F36C(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_10003F3C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for EnvironmentValues();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  sub_10002D398(&qword_1000AF6F0);
  UIViewRepresentableContext.environment.getter();
  id v7 = (void *)sub_10003627C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v8 = objc_allocWithZone((Class)type metadata accessor for CARWallpaperHostingView());
  return sub_10003FB20(a2, v7);
}

void *sub_10003F4CC(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_10003FB20(a1, a2);
}

uint64_t type metadata accessor for CARWallpaperHostingView()
{
  return self;
}

uint64_t sub_10003F534(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x78);
  swift_unknownObjectRetain();
  return v4(a3);
}

void *sub_10003F5A0()
{
  uint64_t v1 = type metadata accessor for EnvironmentValues();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  swift_unknownObjectRetain();
  sub_10002D398(&qword_1000AF6F0);
  UIViewRepresentableContext.environment.getter();
  id v6 = (void *)sub_10003627C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v7 = objc_allocWithZone((Class)type metadata accessor for CARWallpaperHostingView());
  return sub_10003FB20(v5, v6);
}

uint64_t sub_10003F6AC(void *a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x78);
  uint64_t v2 = swift_unknownObjectRetain();
  return v1(v2);
}

uint64_t sub_10003F724()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_10003F768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100040344();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10003F7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100040344();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10003F830()
{
}

uint64_t sub_10003F858()
{
  uint64_t v1 = (void *)((char *)v0 + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperID);
  uint64_t v3 = *(void *)((char *)v0 + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperID);
  uint64_t v2 = *(void *)((char *)v0 + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperID + 8);
  uint64_t v4 = (id *)((char *)v0 + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaper);
  swift_beginAccess();
  id v5 = *v4;
  swift_bridgeObjectRetain();
  id v6 = [v5 identifier];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  if (!v2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (v3 == v7 && v2 == v9)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
LABEL_9:
    id v13 = [*v4 identifier];
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v16 = v15;

    *uint64_t v1 = v14;
    v1[1] = v16;
    uint64_t v17 = swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0xC0))(v17);
  }
  return result;
}

uint64_t sub_10003F9CC()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_10003FA18(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaper);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  sub_10003F858();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_10003FA8C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_10003FAEC;
}

uint64_t sub_10003FAEC(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_10003F858();
  }
  return result;
}

void *sub_10003FB20(uint64_t a1, void *a2)
{
  uint64_t v4 = (uint64_t *)&v2[OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperID];
  uint64_t *v4 = 0;
  v4[1] = 0;
  *(void *)&v2[OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperView] = 0;
  *(void *)&v2[OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaper] = a1;
  id v5 = v2;
  id v6 = [(id)swift_unknownObjectRetain() identifier];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  uint64_t *v4 = v7;
  v4[1] = v9;
  swift_bridgeObjectRelease();
  *(void *)&v5[OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_themeManager] = a2;
  id v10 = a2;

  v15.receiver = v5;
  v15.super_class = (Class)type metadata accessor for CARWallpaperHostingView();
  char v11 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v12 = *(void (**)(void))((swift_isaMask & *v11) + 0xC0);
  id v13 = v11;
  v12();

  swift_unknownObjectRelease();
  return v13;
}

void sub_10003FC60()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperID];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperView] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10003FD64()
{
  uint64_t v1 = *(void **)((char *)v0 + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_themeManager);
  if (v1)
  {
    id v2 = [v1 loadWallpaperFromData:(*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x70))()];
    swift_unknownObjectRelease();
    if (v2)
    {
      id v3 = [v1 resolveWallpaper:v2];
      if (v3)
      {
        id v25 = v3;
        id v4 = [v3 view];
        if (v4)
        {
          id v5 = v4;
          [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v0 addSubview:v5];
          uint64_t v6 = OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperView;
          [*(id *)((char *)v0 + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperView) removeFromSuperview];
          uint64_t v7 = *(void **)((char *)v0 + v6);
          *(void *)((char *)v0 + v6) = v5;
          id v8 = v5;

          uint64_t v9 = self;
          sub_10002D398((uint64_t *)&unk_1000AFA30);
          uint64_t v10 = swift_allocObject();
          *(_OWORD *)(v10 + 16) = xmmword_100072210;
          id v11 = [v0 leadingAnchor];
          id v12 = [v8 leadingAnchor];
          id v13 = [v11 constraintEqualToAnchor:v12];

          *(void *)(v10 + 32) = v13;
          id v14 = [v0 trailingAnchor];
          id v15 = [v8 trailingAnchor];
          id v16 = [v14 constraintEqualToAnchor:v15];

          *(void *)(v10 + 40) = v16;
          id v17 = [v0 topAnchor];
          id v18 = [v8 topAnchor];
          id v19 = [v17 constraintEqualToAnchor:v18];

          *(void *)(v10 + 48) = v19;
          id v20 = [v0 bottomAnchor];
          id v21 = [v8 bottomAnchor];
          id v22 = [v20 constraintEqualToAnchor:v21];

          *(void *)(v10 + 56) = v22;
          specialized Array._endMutation()();
          sub_100040128();
          Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v9 activateConstraints:isa];
          swift_unknownObjectRelease();

          Class v23 = isa;
        }
        else
        {
          swift_unknownObjectRelease();
          Class v23 = (Class)v25;
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

unint64_t sub_100040128()
{
  unint64_t result = qword_1000AF2E0;
  if (!qword_1000AF2E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000AF2E0);
  }
  return result;
}

id sub_100040168(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return [v9 initWithFrame:a1, a2, a3, a4];
}

void sub_1000401CC()
{
}

id sub_10004022C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CARWallpaperHostingView();
  return [super dealloc];
}

unint64_t sub_1000402D4()
{
  unint64_t result = qword_1000AF718;
  if (!qword_1000AF718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF718);
  }
  return result;
}

void *sub_100040328()
{
  return &protocol witness table for Never;
}

ValueMetadata *type metadata accessor for CARThemeWallpaper()
{
  return &type metadata for CARThemeWallpaper;
}

unint64_t sub_100040344()
{
  unint64_t result = qword_1000AF748;
  if (!qword_1000AF748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF748);
  }
  return result;
}

id sub_1000403D4()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for CAFUILoadingViewController());

  return [v0 init];
}

id CARDevicePickerManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_100040440()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CARSettingsUtilities();
  return [super init];
}

uint64_t type metadata accessor for CARSettingsUtilities()
{
  return self;
}

id sub_1000404D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CARSettingsUtilities();
  return [super dealloc];
}

uint64_t NSURL.isDevicePickerURL.getter()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for URLQueryItem();
  uint64_t v55 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v4 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10002D398(&qword_1000AF750);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10002D398(&qword_1000AF758);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URLComponents();
  uint64_t v57 = *(void *)(v11 - 8);
  uint64_t v58 = v11;
  __chkstk_darwin(v11);
  unint64_t v56 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10002D398(&qword_1000AF760);
  __chkstk_darwin(v13 - 8);
  id v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for URL();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  id v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = [v1 absoluteString];
  if (v20)
  {
    id v21 = v20;
    uint64_t v54 = v7;
    uint64_t v59 = v2;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    URL.init(string:)();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
    {
      id v22 = &qword_1000AF760;
      uint64_t v23 = (uint64_t)v15;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
      URLComponents.init(url:resolvingAgainstBaseURL:)();
      uint64_t v25 = v57;
      uint64_t v24 = v58;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v10, 1, v58) == 1)
      {
        (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
        id v22 = &qword_1000AF758;
      }
      else
      {
        uint64_t v26 = v56;
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v56, v10, v24);
        uint64_t v27 = URLComponents.queryItems.getter();
        if (v27)
        {
          uint64_t v50 = v17;
          uint64_t v51 = v27;
          uint64_t v28 = *(void *)(v27 + 16);
          uint64_t v29 = v59;
          if (v28)
          {
            uint64_t v49 = v1;
            unint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v55 + 16);
            unint64_t v31 = v27 + ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80));
            uint64_t v32 = (void (**)(char *, uint64_t))(v55 + 8);
            uint64_t v52 = *(void *)(v55 + 72);
            uint64_t v53 = v30;
            swift_bridgeObjectRetain();
            while (1)
            {
              v53(v4, v31, v29);
              uint64_t v33 = URLQueryItem.name.getter();
              uint64_t v35 = v34;
              if (qword_1000B1100 != -1) {
                swift_once();
              }
              if (v33 == qword_1000B23D8 && v35 == unk_1000B23E0)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_22;
              }
              char v37 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if (v37) {
                break;
              }
              uint64_t v29 = v59;
              (*v32)(v4, v59);
              v31 += v52;
              if (!--v28)
              {
                swift_bridgeObjectRelease();
                uint64_t v38 = 1;
                id v1 = v49;
                uint64_t v10 = v54;
                uint64_t v39 = v55;
                goto LABEL_23;
              }
            }
            swift_bridgeObjectRelease();
            uint64_t v29 = v59;
LABEL_22:
            uint64_t v10 = v54;
            uint64_t v39 = v55;
            (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v54, v4, v29);
            uint64_t v38 = 0;
            id v1 = v49;
LABEL_23:
            uint64_t v25 = v57;
            uint64_t v24 = v58;
          }
          else
          {
            uint64_t v38 = 1;
            uint64_t v10 = v54;
            uint64_t v39 = v55;
          }
          uint64_t v40 = v56;
          uint64_t v41 = v50;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v10, v38, 1, v29);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v25 + 8))(v40, v24);
          (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v16);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v10, 1, v29) != 1)
          {
            sub_100032F78((uint64_t)v10, &qword_1000AF750);
            return 1;
          }
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v24);
          (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
          uint64_t v10 = v54;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v55 + 56))(v54, 1, 1, v59);
        }
        id v22 = &qword_1000AF750;
      }
      uint64_t v23 = (uint64_t)v10;
    }
    sub_100032F78(v23, v22);
  }
  sub_100040CDC();
  id v42 = static OS_os_log.default.getter();
  id v43 = v1;
  os_log_type_t v44 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v42, v44))
  {
    unint64_t v45 = (uint8_t *)swift_slowAlloc();
    id v46 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v45 = 138412290;
    id v60 = v43;
    id v47 = v43;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v46 = v43;

    _os_log_impl((void *)&_mh_execute_header, v42, v44, "URL %@ isn't about device picker.", v45, 0xCu);
    sub_10002D398((uint64_t *)&unk_1000AED00);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return 0;
}

uint64_t *sub_100040C90()
{
  if (qword_1000B1100 != -1) {
    swift_once();
  }
  return &qword_1000B23D8;
}

unint64_t sub_100040CDC()
{
  unint64_t result = qword_1000AFA80;
  if (!qword_1000AFA80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000AFA80);
  }
  return result;
}

void sub_100040D1C()
{
  unk_1000B23E5 = 0;
  unk_1000B23E6 = -5120;
}

uint64_t sub_100040D48()
{
  if (qword_1000B1100 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1000B23D8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t URL.isDevicePickerURL.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v49 = *(void *)(v2 - 8);
  uint64_t v50 = v2;
  __chkstk_darwin(v2);
  uint64_t v48 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URLQueryItem();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10002D398(&qword_1000AF750);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10002D398(&qword_1000AF758);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for URLComponents();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  URLComponents.init(url:resolvingAgainstBaseURL:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_100032F78((uint64_t)v13, &qword_1000AF758);
    uint64_t v18 = v49;
    uint64_t v19 = v50;
    id v20 = v48;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
    uint64_t v21 = URLComponents.queryItems.getter();
    if (v21)
    {
      uint64_t v45 = v14;
      id v46 = v17;
      uint64_t v44 = v15;
      uint64_t v22 = *(void *)(v21 + 16);
      uint64_t v47 = v21;
      if (v22)
      {
        uint64_t v41 = v10;
        uint64_t v42 = v5;
        uint64_t v43 = v1;
        uint64_t v23 = v5 + 16;
        uint64_t v51 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
        unint64_t v24 = v21 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
        uint64_t v25 = *(void *)(v23 + 56);
        swift_bridgeObjectRetain();
        while (1)
        {
          v51(v7, v24, v4);
          uint64_t v26 = URLQueryItem.name.getter();
          uint64_t v28 = v27;
          if (qword_1000B1100 != -1) {
            swift_once();
          }
          if (v26 == qword_1000B23D8 && v28 == unk_1000B23E0) {
            break;
          }
          char v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v30) {
            goto LABEL_18;
          }
          (*(void (**)(char *, uint64_t))(v23 - 8))(v7, v4);
          v24 += v25;
          if (!--v22)
          {
            swift_bridgeObjectRelease();
            uint64_t v33 = 1;
            uint64_t v18 = v49;
            uint64_t v19 = v50;
            id v20 = v48;
            uint64_t v5 = v42;
            uint64_t v1 = v43;
            uint64_t v10 = v41;
            goto LABEL_19;
          }
        }
        swift_bridgeObjectRelease();
LABEL_18:
        swift_bridgeObjectRelease();
        uint64_t v10 = v41;
        uint64_t v5 = v42;
        (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v7, v4);
        uint64_t v33 = 0;
        uint64_t v18 = v49;
        uint64_t v19 = v50;
        id v20 = v48;
        uint64_t v1 = v43;
LABEL_19:
        uint64_t v31 = v44;
        uint64_t v32 = v45;
      }
      else
      {
        uint64_t v33 = 1;
        uint64_t v31 = v44;
        uint64_t v32 = v45;
        uint64_t v18 = v49;
        uint64_t v19 = v50;
        id v20 = v48;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v33, 1, v4);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v46, v32);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) != 1)
      {
        sub_100032F78((uint64_t)v10, &qword_1000AF750);
        return 1;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
      uint64_t v18 = v49;
      uint64_t v19 = v50;
      id v20 = v48;
    }
    sub_100032F78((uint64_t)v10, &qword_1000AF750);
  }
  sub_100040CDC();
  uint64_t v34 = static OS_os_log.default.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v1, v19);
  os_log_type_t v35 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v35))
  {
    int64_t v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)int64_t v36 = 136315138;
    sub_10002FF2C();
    uint64_t v37 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v52 = sub_10002F8D4(v37, v38, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v19);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "URL %s isn't about device picker.", v36, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v19);
  }
  return 0;
}

double sub_100041448(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = static os_log_type_t.fault.getter();
  uint64_t v9 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_10002F8D4(0x74616F6C464743, 0xE700000000000000, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  sub_1000313E0(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v14;
}

double sub_100041658()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for CARThemeLayoutSelector(0) + 20);
  uint64_t v2 = *(void *)v1;
  char v3 = *(unsigned char *)(v1 + 8);
  sub_1000313D4(*(void *)v1, v3);
  double v4 = sub_100041448(v2, v3);
  sub_1000313E0(v2, v3);
  return v4;
}

uint64_t type metadata accessor for CARThemeLayoutSelector(uint64_t a1)
{
  return sub_100045670(a1, (uint64_t *)&unk_1000B1440);
}

uint64_t sub_1000416E0@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.displayScale.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_10004170C()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_100041734()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for CARThemeLayoutSelector(0) + 24);
  uint64_t v2 = *(void *)v1;
  char v3 = *(unsigned char *)(v1 + 8);
  sub_1000313D4(*(void *)v1, v3);
  char v4 = sub_1000310F0(v2, v3);
  sub_1000313E0(v2, v3);
  return v4 & 1;
}

uint64_t sub_10004179C()
{
  return swift_getKeyPath();
}

uint64_t sub_1000417C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10004AFB4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000417F0()
{
  return sub_10004B044();
}

id sub_100041818()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for CARThemeLayoutSelector(0) + 28));

  return v1;
}

uint64_t sub_10004184C()
{
  type metadata accessor for CARThemeLayoutSelector(0);
  sub_10002D398(&qword_1000AF798);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_1000418AC()
{
  return Binding.wrappedValue.setter();
}

void (*sub_100041910(void *a1))(uint64_t a1, char a2)
{
  char v3 = malloc(0x48uLL);
  *a1 = v3;
  char v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for CARThemeLayoutSelector(0) + 32));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  void v3[5] = *v4;
  v3[6] = v6;
  uint64_t v7 = (void *)v4[2];
  v3[7] = v7;
  *char v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  swift_retain();
  swift_retain();
  id v8 = v7;
  unsigned char v3[8] = sub_10002D398(&qword_1000AF798);
  Binding.wrappedValue.getter();
  return sub_1000419C4;
}

void sub_1000419C4(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  char v3 = *(void **)(*(void *)a1 + 24);
  *(void *)(*(void *)a1 + 32) = v3;
  char v4 = (void *)*((void *)v2 + 7);
  uint64_t v5 = *((void *)v2 + 6);
  *(void *)uint64_t v2 = *((void *)v2 + 5);
  *((void *)v2 + 1) = v5;
  *((void *)v2 + 2) = v4;
  if (a2)
  {
    id v6 = v3;
    Binding.wrappedValue.setter();
    swift_release();
    swift_release();
  }
  else
  {
    Binding.wrappedValue.setter();
    swift_release();
    swift_release();
  }

  free(v2);
}

uint64_t sub_100041A7C()
{
  type metadata accessor for CARThemeLayoutSelector(0);
  sub_10002D398(&qword_1000AF798);
  Binding.projectedValue.getter();
  return v1;
}

uint64_t sub_100041AE0()
{
  type metadata accessor for CARThemeLayoutSelector(0);
  sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_100041B40()
{
  return Binding.wrappedValue.setter();
}

void (*sub_100041BB4(void *a1))(uint64_t a1, char a2)
{
  char v3 = malloc(0x68uLL);
  *a1 = v3;
  char v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for CARThemeLayoutSelector(0) + 36));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  unsigned char v3[8] = *v4;
  v3[9] = v6;
  uint64_t v8 = v4[2];
  uint64_t v7 = v4[3];
  v3[10] = v8;
  v3[11] = v7;
  *char v3 = v5;
  v3[1] = v6;
  v3[2] = v8;
  v3[3] = v7;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v3[12] = sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  return sub_100041C6C;
}

void sub_100041C6C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)(*(void *)a1 + 48) = *(void *)(*(void *)a1 + 32);
  uint64_t v3 = v2[5];
  uint64_t v4 = v2[11];
  uint64_t v6 = v2[9];
  uint64_t v5 = v2[10];
  void *v2 = v2[8];
  v2[1] = v6;
  v2[2] = v5;
  v2[3] = v4;
  v2[7] = v3;
  if (a2)
  {
    swift_bridgeObjectRetain();
    Binding.wrappedValue.setter();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    Binding.wrappedValue.setter();
    swift_release();
    swift_release();
  }
  swift_bridgeObjectRelease();

  free(v2);
}

uint64_t sub_100041D34()
{
  type metadata accessor for CARThemeLayoutSelector(0);
  sub_10002D398(&qword_1000AF7A0);
  Binding.projectedValue.getter();
  return v1;
}

uint64_t sub_100041D98()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CARThemeLayoutSelector(0) + 40));
  swift_retain();
  return v1;
}

uint64_t sub_100041DD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v2 = type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10002D398(&qword_1000AF7A8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_10002D398(&qword_1000AF7B0);
  __chkstk_darwin(v23);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = static HorizontalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v12 = sub_10002D398(&qword_1000AF7B8);
  sub_1000420F4(v1, (uint64_t (**)@<X0>(uint64_t@<X8>))&v9[*(int *)(v12 + 44)]);
  uint64_t v21 = type metadata accessor for CARThemeLayoutSelector;
  sub_100045AB8(v1, (uint64_t)v6, type metadata accessor for CARThemeLayoutSelector);
  unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v14 = swift_allocObject();
  sub_100042A84((uint64_t)v6, v14 + v13);
  sub_100033C94((uint64_t)v9, (uint64_t)v11, &qword_1000AF7A8);
  uint64_t v15 = (uint64_t (**)())&v11[*(int *)(v23 + 36)];
  *uint64_t v15 = sub_100042AE8;
  v15[1] = (uint64_t (*)())v14;
  v15[2] = 0;
  v15[3] = 0;
  sub_100032F78((uint64_t)v9, &qword_1000AF7A8);
  uint64_t v16 = v1 + *(int *)(v3 + 44);
  uint64_t v17 = *(void *)(v16 + 8);
  *(void *)&long long v24 = *(void *)v16;
  *((void *)&v24 + 1) = v17;
  long long v25 = *(_OWORD *)(v16 + 16);
  sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  long long v24 = v26;
  sub_100045AB8(v1, (uint64_t)v6, v21);
  uint64_t v18 = swift_allocObject();
  sub_100042A84((uint64_t)v6, v18 + v13);
  sub_10002D398(&qword_1000AF7C0);
  sub_10004944C(&qword_1000AF7C8, &qword_1000AF7B0, &qword_1000AF7D0, &qword_1000AF7A8);
  sub_1000430D0();
  View.onChange<A>(of:initial:_:)();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_100032F78((uint64_t)v11, &qword_1000AF7B0);
}

uint64_t sub_1000420F4@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v3 = sub_10002D398(&qword_1000AFA90);
  __chkstk_darwin(v3 - 8);
  uint64_t v59 = (uint64_t)v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_10002D398(&qword_1000AFA98);
  uint64_t v5 = __chkstk_darwin(v58);
  uint64_t v60 = (uint64_t)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v63 = (uint64_t)v52 - v7;
  uint64_t v64 = type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v8 = *(void *)(v64 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v64);
  uint64_t v10 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045AB8(a1, (uint64_t)v10, type metadata accessor for CARThemeLayoutSelector);
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v65 = swift_allocObject();
  sub_100042A84((uint64_t)v10, v65 + ((v11 + 16) & ~v11));
  sub_100045AB8(a1, (uint64_t)v10, type metadata accessor for CARThemeLayoutSelector);
  type metadata accessor for MainActor();
  uint64_t v12 = static MainActor.shared.getter();
  uint64_t v13 = (v11 + 32) & ~v11;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  *(void *)(v14 + 24) = &protocol witness table for MainActor;
  sub_100042A84((uint64_t)v10, v14 + v13);
  sub_100045AB8(a1, (uint64_t)v10, type metadata accessor for CARThemeLayoutSelector);
  uint64_t v15 = static MainActor.shared.getter();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = &protocol witness table for MainActor;
  sub_100042A84((uint64_t)v10, v16 + v13);
  sub_10002D398(&qword_1000AFAA0);
  Binding.init(get:set:)();
  Binding.init(_:)();
  uint64_t v17 = v67;
  if (v67)
  {
    uint64_t v18 = v66;
    uint64_t v19 = v68;
    uint64_t v20 = *(void **)(a1 + *(int *)(v64 + 28));
    swift_retain();
    swift_retain();
    id v21 = [v20 layouts];
    sub_10002F83C(0, &qword_1000AF350);
    unint64_t v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    sub_100056000(v18, v17, v19, v23, 1, (uint64_t)&v66);
    uint64_t v24 = v66;
    uint64_t v25 = v67;
    uint64_t v26 = v68;
    uint64_t v64 = v69;
    uint64_t v27 = (uint64_t (*)@<X0>(uint64_t@<X8>))v70;
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    uint64_t v28 = v71;
    unint64_t v62 = (uint64_t (*)@<X0>(uint64_t@<X8>))v72;
    id v61 = v73;
    unint64_t v56 = (uint64_t (*)@<X0>(uint64_t@<X8>))v74;
    uint64_t v55 = v75;
    uint64_t v54 = v76;
    uint64_t v29 = v24;
    v77[0] = v24;
    sub_100049E98((uint64_t)v77);
    swift_retain();
    swift_release();
    swift_release();
    sub_100049EC4((uint64_t)v77);
    uint64_t v30 = v25;
    swift_release();
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v26 = 0;
    uint64_t v64 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    id v61 = 0;
    unint64_t v62 = 0;
    unint64_t v56 = 0;
    uint64_t v55 = 0;
    uint64_t v54 = 0;
  }
  uint64_t v31 = v59;
  sub_1000427A8(v59);
  char v32 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v41 = v60;
  sub_100033C94(v31, v60, &qword_1000AFA90);
  uint64_t v42 = v41 + *(int *)(v58 + 36);
  *(unsigned char *)uint64_t v42 = v32;
  *(void *)(v42 + 8) = v34;
  *(void *)(v42 + 16) = v36;
  *(void *)(v42 + 24) = v38;
  *(void *)(v42 + 32) = v40;
  *(unsigned char *)(v42 + 40) = 0;
  sub_100032F78(v31, &qword_1000AFA90);
  uint64_t v43 = v63;
  sub_100033C30(v41, v63, &qword_1000AFA98);
  sub_100033C94(v43, v41, &qword_1000AFA98);
  uint64_t v44 = v57;
  uint64_t v45 = v65;
  *uint64_t v57 = sub_1000498E0;
  v44[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v45;
  uint64_t v53 = v29;
  v44[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))v29;
  v44[3] = (uint64_t (*)@<X0>(uint64_t@<X8>))v30;
  uint64_t v46 = v64;
  v44[4] = (uint64_t (*)@<X0>(uint64_t@<X8>))v26;
  v44[5] = (uint64_t (*)@<X0>(uint64_t@<X8>))v46;
  uint64_t v64 = v46;
  v44[6] = v27;
  v44[7] = v28;
  v52[1] = v27;
  uint64_t v47 = v61;
  v44[8] = v62;
  v44[9] = v47;
  uint64_t v48 = v55;
  v44[10] = v56;
  v44[11] = v48;
  v44[12] = v54;
  uint64_t v49 = sub_10002D398(&qword_1000AFAA8);
  sub_100033C94(v41, (uint64_t)v44 + *(int *)(v49 + 64), &qword_1000AFA98);
  swift_retain();
  uint64_t v50 = v53;
  sub_100049E14(v53, v30);
  sub_100032F78(v63, &qword_1000AFA98);
  sub_100032F78(v41, &qword_1000AFA98);
  sub_100049E54(v50, v30);
  return swift_release();
}

uint64_t sub_1000427A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v2 = type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004313C();
  uint64_t v6 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v8 = v7;
  char v10 = v9;
  uint64_t v12 = v11;
  char v13 = sub_10004313C();
  unint64_t v14 = 0x676E697265657473;
  if ((v13 & 1) == 0) {
    unint64_t v14 = 0xD000000000000013;
  }
  unint64_t v15 = 0x8000000100081AD0;
  if (v13) {
    unint64_t v15 = 0xED00006C65656877;
  }
  if (v13 < 0) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v14;
  }
  if (v13 < 0) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v15;
  }
  sub_100045AB8(v1, (uint64_t)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for CARThemeLayoutSelector);
  unint64_t v18 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v19 = swift_allocObject();
  sub_100042A84((uint64_t)v5, v19 + v18);
  sub_100032058(v6, v8, v10 & 1, v12, v16, v17, (uint64_t)sub_100049EF4, v19, (uint64_t)&v46);
  uint64_t v21 = v46;
  uint64_t v20 = v47;
  uint64_t v33 = v47;
  char v22 = v48;
  uint64_t v23 = v49;
  uint64_t v24 = v50;
  uint64_t v25 = v51;
  uint64_t v32 = v52;
  uint64_t v26 = v53;
  char v27 = sub_10004313C() & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = v27;
  uint64_t v35 = v21;
  uint64_t v36 = v20;
  char v37 = v22;
  uint64_t v38 = v23;
  uint64_t v39 = v24;
  uint64_t v40 = v25;
  uint64_t v41 = v32;
  uint64_t v42 = v26;
  uint64_t v43 = KeyPath;
  uint64_t v44 = sub_100049F60;
  uint64_t v45 = v29;
  sub_10002D398(&qword_1000AFAB0);
  sub_100049F78();
  View.accessibilityIdentifier(_:)();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100042A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CARThemeLayoutSelector(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100042AE8()
{
  type metadata accessor for CARThemeLayoutSelector(0);
  sub_10002D398(&qword_1000AF798);
  Binding.wrappedValue.getter();
  id v0 = [v2 currentLayoutID];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10002D398(&qword_1000AF7A0);
  return Binding.wrappedValue.setter();
}

uint64_t sub_100042C00()
{
  uint64_t v1 = (int *)type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v4;
  sub_1000313E0(*(void *)(v5 + v1[5]), *(unsigned char *)(v5 + v1[5] + 8));
  sub_1000313E0(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));

  uint64_t v8 = v5 + v1[8];
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v7, v2 | 7);
}

void sub_100042D98()
{
  uint64_t v1 = type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80));
  uint64_t v3 = v2 + *(int *)(v1 + 36);
  uint64_t v4 = *(void *)(v3 + 8);
  v18[0] = *(void *)v3;
  v18[1] = v4;
  long long v19 = *(_OWORD *)(v3 + 16);
  sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  unint64_t v5 = v21;
  if (v21)
  {
    uint64_t v6 = v20;
    id v7 = [*(id *)(v2 + *(int *)(v1 + 28)) layouts];
    sub_10002F83C(0, &qword_1000AF350);
    unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    char v9 = sub_10003BBFC(v8, v20, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v9)
    {
      id v10 = [v9 displayName];

      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v13 = v12;
    }
    else
    {
      uint64_t v11 = 0;
      unint64_t v13 = 0;
    }
    sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v14 = static OS_os_log.default.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      v18[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136446466;
      if (v13)
      {
        unint64_t v17 = v13;
      }
      else
      {
        uint64_t v11 = 0x6E776F6E6B6E55;
        unint64_t v17 = 0xE700000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_10002F8D4(v11, v17, v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_10002F8D4(v6, v5, v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Viewing layout %{public}s (%{public}s)", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

unint64_t sub_1000430D0()
{
  unint64_t result = qword_1000AF7D8;
  if (!qword_1000AF7D8)
  {
    sub_10002F34C(&qword_1000AF7C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF7D8);
  }
  return result;
}

uint64_t sub_10004313C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v3 = (uint64_t *)(v0 + v2[8]);
  uint64_t v18 = *v3;
  long long v20 = *(_OWORD *)(v3 + 1);
  sub_10002D398(&qword_1000AF798);
  Binding.wrappedValue.getter();
  id v4 = [v23 currentLayoutID:v18, v20];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;

  unint64_t v8 = (uint64_t *)(v0 + v2[9]);
  uint64_t v19 = *v8;
  uint64_t v21 = v8[1];
  long long v22 = *((_OWORD *)v8 + 1);
  sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  if (!v24)
  {
    swift_bridgeObjectRelease();
    return 128;
  }
  if ((id)v5 == v23 && v24 == v7)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      return 128;
    }
  }
  uint64_t v11 = sub_10004384C();
  if (v11)
  {
    unint64_t v12 = v11;
    unsigned int v13 = [v11 isCustomizable:v19, v21, v22];

    if (!v13) {
      return 129;
    }
  }
  uint64_t v14 = v1 + v2[6];
  uint64_t v15 = *(void *)v14;
  char v16 = *(unsigned char *)(v14 + 8);
  sub_1000313D4(*(void *)v14, v16);
  char v17 = sub_1000310F0(v15, v16);
  sub_1000313E0(v15, v16);
  return v17 & 1;
}

void sub_1000432F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v3 = v0 + v2[9];
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t v44 = *(void *)v3;
  uint64_t v45 = v4;
  long long v46 = *(_OWORD *)(v3 + 16);
  sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  uint64_t v5 = v48;
  if (v48)
  {
    uint64_t v6 = v47;
    uint64_t v7 = sub_10004384C();
    if (v7)
    {
      id v8 = v7;
      char v9 = sub_10004313C();
      if (v9 < 0)
      {
        sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
        id v8 = v8;
        long long v22 = static OS_os_log.default.getter();
        os_log_type_t v23 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v22, v23))
        {
          os_log_type_t typea = v23;
          uint64_t v24 = swift_slowAlloc();
          uint64_t v42 = swift_slowAlloc();
          *(_DWORD *)uint64_t v24 = 136446466;
          uint64_t v44 = v42;
          id v25 = [v8 displayName];
          uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v28 = v27;

          uint64_t v47 = sub_10002F8D4(v26, v28, &v44);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          *(_WORD *)(v24 + 12) = 2082;
          id v29 = [v8 identifier];
          uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          unint64_t v32 = v31;

          uint64_t v47 = sub_10002F8D4(v30, v32, &v44);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v22, typea, "Selecting layout %{public}s (%{public}s)", (uint8_t *)v24, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        uint64_t v33 = (uint64_t *)(v1 + v2[8]);
        uint64_t v35 = v33[1];
        uint64_t v36 = v33[2];
        uint64_t v44 = *v33;
        uint64_t v34 = v44;
        uint64_t v45 = v35;
        *(void *)&long long v46 = v36;
        sub_10002D398(&qword_1000AF798);
        Binding.wrappedValue.getter();
        char v37 = (void *)v47;
        NSString v38 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        id v39 = [v37 themeDataWithCurrentLayoutID:v38];

        uint64_t v44 = v34;
        uint64_t v45 = v35;
        *(void *)&long long v46 = v36;
        uint64_t v47 = (uint64_t)v39;
        Binding.wrappedValue.setter();
      }
      else
      {
        if ((v9 & 1) == 0)
        {
          sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
          id v8 = v8;
          char v10 = static OS_os_log.default.getter();
          os_log_type_t v11 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v10, v11))
          {
            os_log_type_t type = v11;
            uint64_t v12 = swift_slowAlloc();
            uint64_t v44 = swift_slowAlloc();
            *(_DWORD *)uint64_t v12 = 136446466;
            id v13 = [v8 displayName];
            uint64_t v43 = v6;
            uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            unint64_t v16 = v15;

            uint64_t v47 = sub_10002F8D4(v14, v16, &v44);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            swift_bridgeObjectRelease();
            *(_WORD *)(v12 + 12) = 2082;
            id v17 = [v8 identifier];
            uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v19 = v10;
            unint64_t v21 = v20;

            uint64_t v47 = sub_10002F8D4(v18, v21, &v44);
            uint64_t v6 = v43;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v19, type, "Customizing layout %{public}s (%{public}s)", (uint8_t *)v12, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
          }
          (*(void (**)(uint64_t, uint64_t))(v1 + v2[10]))(v6, v5);
        }
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

void *sub_10004384C()
{
  uint64_t v1 = type metadata accessor for CARThemeLayoutSelector(0);
  sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  if (!v7) {
    return 0;
  }
  id v2 = [*(id *)(v0 + *(int *)(v1 + 28)) layouts];
  sub_10002F83C(0, &qword_1000AF350);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRetain();
  uint64_t v4 = sub_10003BBFC(v3, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v4;
}

uint64_t sub_100043950@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v63 = a2;
  uint64_t v62 = type metadata accessor for ContentMarginPlacement();
  uint64_t v61 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v60 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = type metadata accessor for ViewAlignedScrollTargetBehavior.LimitBehavior();
  uint64_t v4 = *(void *)(v46 - 8);
  uint64_t v5 = __chkstk_darwin(v46);
  uint64_t v44 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v8 = (char *)&v42 - v7;
  uint64_t v47 = type metadata accessor for ViewAlignedScrollTargetBehavior();
  uint64_t v49 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  char v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10002D398(&qword_1000AFAD8);
  uint64_t v45 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_10002D398(&qword_1000AFAE0);
  uint64_t v53 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v43 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_10002D398(&qword_1000AFAE8);
  uint64_t v54 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v48 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_10002D398(&qword_1000AFAF0);
  uint64_t v58 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v50 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_10002D398(&qword_1000AFAF8);
  uint64_t v56 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v55 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  GeometryProxy.size.getter();
  double v19 = v18 * 2.66666667;
  GeometryProxy.size.getter();
  double v21 = v20 + -112.0;
  if (v21 >= v19) {
    double v22 = v19;
  }
  else {
    double v22 = v21;
  }
  GeometryProxy.size.getter();
  static Axis.Set.horizontal.getter();
  uint64_t v64 = 0x4030000000000000;
  uint64_t v65 = a1;
  double v66 = v22;
  double v67 = v22 * 0.375;
  sub_10002D398(&qword_1000AFB00);
  uint64_t v23 = sub_10002F34C(&qword_1000AFB08);
  uint64_t v24 = sub_10002F5CC(&qword_1000AFB10, &qword_1000AFB08);
  uint64_t v71 = v23;
  unsigned __int8 v72 = (void *)v24;
  swift_getOpaqueTypeConformance2();
  ScrollView.init(_:showsIndicators:content:)();
  static ViewAlignedScrollTargetBehavior.LimitBehavior.always.getter();
  uint64_t v25 = v46;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v44, v8, v46);
  ViewAlignedScrollTargetBehavior.init(limitBehavior:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v25);
  uint64_t v26 = sub_10002F5CC(&qword_1000AFB18, &qword_1000AFAD8);
  unint64_t v27 = v43;
  uint64_t v28 = v47;
  View.scrollTargetBehavior<A>(_:)();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v10, v28);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v11);
  uint64_t v29 = v42 + *(int *)(type metadata accessor for CARThemeLayoutSelector(0) + 36);
  uint64_t v30 = *(void *)(v29 + 8);
  uint64_t v68 = *(void *)v29;
  uint64_t v69 = v30;
  long long v70 = *(_OWORD *)(v29 + 16);
  sub_10002D398(&qword_1000AF7A0);
  Binding.projectedValue.getter();
  static UnitPoint.center.getter();
  uint64_t v68 = v11;
  uint64_t v69 = v28;
  *(void *)&long long v70 = v26;
  *((void *)&v70 + 1) = &protocol witness table for ViewAlignedScrollTargetBehavior;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v32 = v48;
  uint64_t v33 = v52;
  View.scrollPosition<A>(id:anchor:)();
  swift_release();
  swift_release();
  uint64_t v34 = v51;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v27, v33);
  uint64_t v71 = v33;
  unsigned __int8 v72 = &type metadata for String;
  uint64_t v73 = OpaqueTypeConformance2;
  unsigned __int8 v74 = &protocol witness table for String;
  uint64_t v35 = v50;
  uint64_t v36 = swift_getOpaqueTypeConformance2();
  View.scrollClipDisabled(_:)();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v32, v34);
  LOBYTE(v33) = static Edge.Set.leading.getter();
  unsigned __int8 v37 = static Edge.Set.trailing.getter();
  Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v33) {
    Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v37) {
    Edge.Set.init(rawValue:)();
  }
  NSString v38 = v60;
  static ContentMarginPlacement.automatic.getter();
  uint64_t v71 = v34;
  unsigned __int8 v72 = (void *)v36;
  swift_getOpaqueTypeConformance2();
  id v39 = v55;
  uint64_t v40 = v59;
  View.contentMargins(_:_:for:)();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v38, v62);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v35, v40);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v56 + 32))(v63, v39, v57);
}

uint64_t sub_1000442D0(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v7 = type metadata accessor for PinnedScrollableViews();
  __chkstk_darwin(v7);
  uint64_t v8 = sub_10002D398(&qword_1000AFB08);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = a1;
  double v15 = a3;
  double v16 = a4;
  static VerticalAlignment.center.getter();
  int v17 = 0;
  sub_10004962C(&qword_1000AFB20, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)();
  sub_10002D398(&qword_1000AFB28);
  sub_10004A180(&qword_1000AFB30, &qword_1000AFB28, (void (*)(void))sub_10004A1EC);
  LazyHStack.init(alignment:spacing:pinnedViews:content:)();
  sub_10002F5CC(&qword_1000AFB10, &qword_1000AFB08);
  View.scrollTargetLayout(isEnabled:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10004453C(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [*(id *)(a1 + *(int *)(__chkstk_darwin(v6 - 8) + 36)) layouts];
  sub_10002F83C(0, &qword_1000AF350);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v16[1] = v11;
  sub_100045AB8(a1, (uint64_t)v9, type metadata accessor for CARThemeLayoutSelector);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v13 = (v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = swift_allocObject();
  sub_100042A84((uint64_t)v9, v14 + v12);
  *(double *)(v14 + v13) = a2;
  *(double *)(v14 + ((v13 + 15) & 0xFFFFFFFFFFFFFFF8)) = a3;
  sub_10002D398(&qword_1000AFB98);
  sub_10002D398(&qword_1000AFB40);
  sub_10002F5CC(&qword_1000AFBA0, &qword_1000AFB98);
  sub_10004A1EC();
  sub_10004A6D4();
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100044758@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v3 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v30 = *(void *)(v4 - 8);
  uint64_t v31 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10002D398(&qword_1000AFB60);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10002D398(&qword_1000AFB48);
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10002D398((uint64_t *)&unk_1000AFBB0);
  uint64_t v34 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_10002D398(&qword_1000AFB40);
  __chkstk_darwin(v33);
  double v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v17 = *a1;
  sub_100044C14(*a1, (uint64_t)v9);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100033C94((uint64_t)v9, (uint64_t)v12, &qword_1000AFB60);
  double v18 = &v12[*(int *)(v10 + 36)];
  long long v19 = v39;
  *(_OWORD *)double v18 = v38;
  *((_OWORD *)v18 + 1) = v19;
  *((_OWORD *)v18 + 2) = v40;
  sub_100032F78((uint64_t)v9, &qword_1000AFB60);
  static AccessibilityChildBehavior.ignore.getter();
  uint64_t v20 = sub_100046070(&qword_1000AFB50, &qword_1000AFB48, (void (*)(void))sub_10004A300);
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v31);
  sub_100032F78((uint64_t)v12, &qword_1000AFB48);
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v21);
  id v22 = [v17 displayName];
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v24;

  v26._countAndFlagsBits = v23;
  v26._object = v25;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v26);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 0x656D65685420;
  v27._object = (void *)0xE600000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v27);
  LocalizedStringKey.init(stringInterpolation:)();
  uint64_t v36 = v10;
  uint64_t v37 = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v32;
  View.accessibilityLabel(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v28);
  ModifiedContent<>.accessibilityIdentifier(_:)();
  return sub_100032F78((uint64_t)v16, &qword_1000AFB40);
}

uint64_t sub_100044C14@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v75 = a2;
  uint64_t v76 = type metadata accessor for ColorScheme();
  uint64_t v74 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v73 = (uint64_t)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v78 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v77 = (uint64_t)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = v7;
  __chkstk_darwin(v6);
  uint64_t v80 = (uint64_t)&v73 - v8;
  uint64_t v81 = type metadata accessor for CARLayoutPreviewButton(0);
  __chkstk_darwin(v81);
  uint64_t v10 = (uint64_t *)((char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v82 = sub_10002D398(&qword_1000AFB70);
  __chkstk_darwin(v82);
  uint64_t v83 = v5;
  id v84 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (uint64_t *)(v2 + *(int *)(v5 + 32));
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  uint64_t v15 = v12[2];
  uint64_t v85 = v2;
  uint64_t v86 = v14;
  uint64_t v87 = v13;
  *(void *)&long long v88 = v15;
  id v16 = a1;
  sub_10002D398(&qword_1000AF798);
  Binding.wrappedValue.getter();
  id v17 = v89;
  id v18 = [v89 wallpaperForLayout];

  sub_10002D398(&qword_1000AFA18);
  uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  id v20 = [v16 identifier];
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;

  if (*(void *)(v19 + 16) && (unint64_t v24 = sub_100030034(v21, v23), (v25 & 1) != 0))
  {
    uint64_t v26 = *(void *)(*(void *)(v19 + 56) + 8 * v24);
    swift_unknownObjectRetain();
  }
  else
  {
    uint64_t v26 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v86 = v14;
  uint64_t v87 = v13;
  *(void *)&long long v88 = v15;
  Binding.wrappedValue.getter();
  id v27 = v89;
  id v28 = [v89 paletteIDForLayout];

  uint64_t v29 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v30 = [v16 identifier];
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v33 = v32;

  if (*(void *)(v29 + 16))
  {
    unint64_t v34 = sub_100030034(v31, v33);
    uint64_t v35 = v85;
    if (v36)
    {
      uint64_t v37 = (uint64_t *)(*(void *)(v29 + 56) + 16 * v34);
      uint64_t v39 = *v37;
      uint64_t v38 = v37[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v39 = 0;
      uint64_t v38 = 0;
    }
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v38 = 0;
    uint64_t v35 = v85;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v40 = v80;
  sub_100045AB8(v35, v80, type metadata accessor for CARThemeLayoutSelector);
  unint64_t v41 = (*(unsigned __int8 *)(v78 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
  unint64_t v42 = (v79 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v43 = swift_allocObject();
  sub_100042A84(v40, v43 + v41);
  *(void *)(v43 + v42) = v16;
  *uint64_t v10 = swift_getKeyPath();
  sub_10002D398(&qword_1000AEB50);
  swift_storeEnumTagMultiPayload();
  uint64_t v44 = (int *)v81;
  *(uint64_t *)((char *)v10 + *(int *)(v81 + 20)) = (uint64_t)v16;
  *(uint64_t *)((char *)v10 + v44[6]) = v26;
  uint64_t v45 = (uint64_t *)((char *)v10 + v44[7]);
  *uint64_t v45 = v39;
  v45[1] = v38;
  uint64_t v46 = (void (**)())((char *)v10 + v44[8]);
  char *v46 = sub_10004A8F0;
  v46[1] = (void (*)())v43;
  uint64_t v47 = v83;
  uint64_t v48 = v35 + *(int *)(v83 + 36);
  uint64_t v49 = *(void *)(v48 + 8);
  uint64_t v86 = *(void *)v48;
  uint64_t v87 = v49;
  long long v88 = *(_OWORD *)(v48 + 16);
  id v50 = v16;
  sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  id v52 = v89;
  uint64_t v51 = v90;
  id v53 = [v50 identifier];
  uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v56 = v55;

  if (v51)
  {
    uint64_t v57 = (uint64_t)v84;
    if (v52 == (id)v54 && v51 == v56)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v58 = v77;
      sub_100045AB8(v35, v77, type metadata accessor for CARThemeLayoutSelector);
LABEL_16:
      char v60 = sub_10004313C();
      sub_100049818(v58, type metadata accessor for CARThemeLayoutSelector);
      char v61 = v60 & 1;
      goto LABEL_18;
    }
    char v59 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v58 = v77;
    sub_100045AB8(v35, v77, type metadata accessor for CARThemeLayoutSelector);
    if (v59) {
      goto LABEL_16;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v58 = v77;
    sub_100045AB8(v35, v77, type metadata accessor for CARThemeLayoutSelector);
    uint64_t v57 = (uint64_t)v84;
  }
  sub_100049818(v58, type metadata accessor for CARThemeLayoutSelector);
  char v61 = 0;
LABEL_18:
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v63 = swift_allocObject();
  *(unsigned char *)(v63 + 16) = v61;
  sub_100045AB8((uint64_t)v10, v57, type metadata accessor for CARLayoutPreviewButton);
  uint64_t v64 = (uint64_t *)(v57 + *(int *)(v82 + 36));
  *uint64_t v64 = KeyPath;
  v64[1] = (uint64_t)sub_10004AA44;
  v64[2] = v63;
  sub_100049818((uint64_t)v10, type metadata accessor for CARLayoutPreviewButton);
  if ([*(id *)(v35 + *(int *)(v47 + 28)) requiresDarkAppearance])
  {
    uint64_t v66 = v73;
    uint64_t v65 = v74;
    uint64_t v67 = v76;
    (*(void (**)(uint64_t, void, uint64_t))(v74 + 104))(v73, enum case for ColorScheme.dark(_:), v76);
    uint64_t v68 = v75;
  }
  else
  {
    uint64_t v66 = v73;
    sub_10002CFF4(v73);
    uint64_t v68 = v75;
    uint64_t v67 = v76;
    uint64_t v65 = v74;
  }
  uint64_t v69 = swift_getKeyPath();
  long long v70 = (uint64_t *)(v68 + *(int *)(sub_10002D398(&qword_1000AFB60) + 36));
  uint64_t v71 = sub_10002D398(&qword_1000AFB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))((char *)v70 + *(int *)(v71 + 28), v66, v67);
  *long long v70 = v69;
  sub_100033C94(v57, v68, &qword_1000AFB70);
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v66, v67);
  return sub_100032F78(v57, &qword_1000AFB70);
}

void sub_1000453F4(uint64_t a1, void *a2)
{
  type metadata accessor for CARThemeLayoutSelector(0);
  sub_10002D398(&qword_1000AF7A0);
  uint64_t v3 = Binding.wrappedValue.getter();
  if (!v11) {
    goto LABEL_7;
  }
  id v4 = [a2 identifier];
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;

  if (v10 == v5 && v11 == v7)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t v3 = swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
LABEL_7:
      __chkstk_darwin(v3);
      static Animation.default.getter();
      withAnimation<A>(_:_:)();
      swift_release();
      return;
    }
  }
  sub_1000432F8();
}

uint64_t CRSUIClusterThemePalette.id.getter()
{
  id v1 = [v0 identifier];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

int *sub_1000455C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  sub_100033C30(a1, a8, &qword_1000AEB60);
  unint64_t result = (int *)type metadata accessor for CARLayoutPreviewButton(0);
  *(void *)(a8 + result[5]) = a2;
  *(void *)(a8 + result[6]) = a3;
  id v16 = (void *)(a8 + result[7]);
  void *v16 = a4;
  v16[1] = a5;
  id v17 = (void *)(a8 + result[8]);
  void *v17 = a6;
  v17[1] = a7;
  return result;
}

uint64_t type metadata accessor for CARLayoutPreviewButton(uint64_t a1)
{
  return sub_100045670(a1, qword_1000B1450);
}

uint64_t sub_100045670(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000456A8(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a3 + 8 * v7 + 32);
      char v9 = v8;
      id v13 = v8;
      char v10 = a1(&v13);

      if (v3 || (v10 & 1) != 0) {
        break;
      }
      uint64_t v11 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_14:
        swift_bridgeObjectRetain();
        uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        uint64_t v7 = 0;
        if (!v6) {
          return v7;
        }
      }
      else
      {
        ++v7;
        if (v11 == v6) {
          return 0;
        }
      }
    }
  }
  return v7;
}

uint64_t sub_1000457C4()
{
  return swift_getKeyPath();
}

__n128 sub_1000457E8@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, __n128 a11, unint64_t a12, unint64_t a13, uint64_t a14, uint64_t a15)
{
  sub_100033C30(a1, a9, &qword_1000AEB60);
  uint64_t v22 = (int *)type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v23 = a9 + v22[5];
  *(void *)uint64_t v23 = a2;
  *(unsigned char *)(v23 + 8) = a3 & 1;
  uint64_t v24 = a9 + v22[6];
  *(void *)uint64_t v24 = a4;
  *(unsigned char *)(v24 + 8) = a5 & 1;
  *(void *)(a9 + v22[7]) = a6;
  char v25 = (void *)(a9 + v22[8]);
  void *v25 = a7;
  v25[1] = a8;
  v25[2] = a10;
  uint64_t v26 = (__n128 *)(a9 + v22[9]);
  __n128 result = a11;
  __n128 *v26 = a11;
  v26[1].n128_u64[0] = a12;
  v26[1].n128_u64[1] = a13;
  id v28 = (void *)(a9 + v22[10]);
  void *v28 = a14;
  v28[1] = a15;
  return result;
}

__n128 sub_1000458F4()
{
  uint64_t v0 = type metadata accessor for RoundedRectangle();
  sub_100049878(v0, qword_1000B23E8);
  id v1 = (__n128 *)sub_100045A00(v0, (uint64_t)qword_1000B23E8);
  uint64_t v2 = (char *)v1 + *(int *)(v0 + 20);
  uint64_t v3 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v4 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104))(v2, v3, v4);
  __asm { FMOV            V0.2D, #20.0 }
  *id v1 = result;
  return result;
}

uint64_t sub_10004599C()
{
  if (qword_1000B1110 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for RoundedRectangle();

  return sub_100045A00(v0, (uint64_t)qword_1000B23E8);
}

uint64_t sub_100045A00(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100045A38@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000B1110 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  uint64_t v3 = sub_100045A00(v2, (uint64_t)qword_1000B23E8);
  return sub_100045AB8(v3, a1, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
}

uint64_t sub_100045AB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100045B20@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_10002D398(&qword_1000AEB50);

  return swift_storeEnumTagMultiPayload();
}

id sub_100045B78()
{
  id v1 = *(void **)(v0 + *(int *)(type metadata accessor for CARLayoutPreviewButton(0) + 20));

  return v1;
}

uint64_t sub_100045BAC()
{
  type metadata accessor for CARLayoutPreviewButton(0);

  return swift_unknownObjectRetain();
}

uint64_t sub_100045BE0()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CARLayoutPreviewButton(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100045C20()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CARLayoutPreviewButton(0) + 32));
  swift_retain();
  return v1;
}

uint64_t sub_100045C60()
{
  uint64_t v1 = sub_10002D398(&qword_1000AF7E8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for CARLayoutPreviewButton(0);
  uint64_t v7 = v0;
  swift_retain();
  sub_10002D398(&qword_1000AF7F0);
  sub_100046070(&qword_1000AF7F8, &qword_1000AF7F0, (void (*)(void))sub_1000460EC);
  Button.init(action:label:)();
  sub_10002F5CC(&qword_1000AF870, &qword_1000AF7E8);
  sub_100046364();
  View.buttonStyle<A>(_:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_100045E1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10002D398(&qword_1000AF828);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10002D398(&qword_1000AF808);
  __chkstk_darwin(v7);
  char v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for CARLayoutPreviewButton(0);
  sub_1000463B8(*(void **)(a1 + *(int *)(v10 + 20)), a1);
  if (qword_1000B1110 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for RoundedRectangle();
  uint64_t v12 = sub_100045A00(v11, (uint64_t)qword_1000B23E8);
  uint64_t v13 = (uint64_t)&v9[*(int *)(sub_10002D398(&qword_1000AF818) + 36)];
  sub_100045AB8(v12, v13, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v13 + *(int *)(sub_10002D398(&qword_1000AF858) + 36)) = 256;
  sub_100033C30((uint64_t)v6, (uint64_t)v9, &qword_1000AF828);
  uint64_t v14 = static Alignment.center.getter();
  uint64_t v16 = v15;
  uint64_t v17 = (uint64_t)&v9[*(int *)(v7 + 36)];
  sub_1000466A4(v17);
  id v18 = (uint64_t *)(v17 + *(int *)(sub_10002D398(&qword_1000AF868) + 36));
  uint64_t *v18 = v14;
  v18[1] = v16;
  char v19 = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  sub_100033C94((uint64_t)v9, a2, &qword_1000AF808);
  uint64_t v28 = a2 + *(int *)(sub_10002D398(&qword_1000AF7F0) + 36);
  *(unsigned char *)uint64_t v28 = v19;
  *(void *)(v28 + 8) = v21;
  *(void *)(v28 + 16) = v23;
  *(void *)(v28 + 24) = v25;
  *(void *)(v28 + 32) = v27;
  *(unsigned char *)(v28 + 40) = 0;
  return sub_100032F78((uint64_t)v9, &qword_1000AF808);
}

uint64_t sub_100046068@<X0>(uint64_t a1@<X8>)
{
  return sub_100045E1C(*(void *)(v1 + 16), a1);
}

uint64_t sub_100046070(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F34C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000460EC()
{
  unint64_t result = qword_1000AF800;
  if (!qword_1000AF800)
  {
    sub_10002F34C(&qword_1000AF808);
    sub_10004618C();
    sub_10002F5CC(&qword_1000AF860, &qword_1000AF868);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF800);
  }
  return result;
}

unint64_t sub_10004618C()
{
  unint64_t result = qword_1000AF810;
  if (!qword_1000AF810)
  {
    sub_10002F34C(&qword_1000AF818);
    sub_10004A180(&qword_1000AF820, &qword_1000AF828, (void (*)(void))sub_100046264);
    sub_10002F5CC(&qword_1000AF850, &qword_1000AF858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF810);
  }
  return result;
}

unint64_t sub_100046264()
{
  unint64_t result = qword_1000AF830;
  if (!qword_1000AF830)
  {
    sub_10002F34C(&qword_1000AF838);
    sub_10004962C(&qword_1000AF840, (void (*)(uint64_t))type metadata accessor for CARThemeLayoutPreview);
    sub_100046310();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF830);
  }
  return result;
}

unint64_t sub_100046310()
{
  unint64_t result = qword_1000AF848;
  if (!qword_1000AF848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF848);
  }
  return result;
}

unint64_t sub_100046364()
{
  unint64_t result = qword_1000AF878;
  if (!qword_1000AF878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF878);
  }
  return result;
}

uint64_t sub_1000463B8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000AFA78);
  __chkstk_darwin(v4);
  uint64_t v6 = (uint64_t *)((char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_10002D398(&qword_1000AEB60);
  __chkstk_darwin(v7 - 8);
  char v9 = (uint64_t *)((char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = type metadata accessor for CARThemeLayoutPreview();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [a1 preview];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = type metadata accessor for CARLayoutPreviewButton(0);
    uint64_t v16 = *(void *)(a2 + *(int *)(v15 + 24));
    if (v16)
    {
      uint64_t v17 = (uint64_t *)(a2 + *(int *)(v15 + 28));
      uint64_t v18 = v17[1];
      if (v18)
      {
        uint64_t v19 = *v17;
        swift_unknownObjectRetain_n();
        swift_bridgeObjectRetain();
        id v20 = v14;
        sub_10002D2A8(v9);
        sub_10002E1D0((uint64_t)v9, (uint64_t)v20, v16, v19, v18, (uint64_t)v12);
        sub_100045AB8((uint64_t)v12, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CARThemeLayoutPreview);
        swift_storeEnumTagMultiPayload();
        sub_10004962C(&qword_1000AF840, (void (*)(uint64_t))type metadata accessor for CARThemeLayoutPreview);
        sub_100046310();
        _ConditionalContent<>.init(storage:)();

        swift_unknownObjectRelease();
        return sub_100049818((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for CARThemeLayoutPreview);
      }
    }
  }
  id v22 = a1;
  *uint64_t v6 = nullsub_8(v22, v23, v24);
  swift_storeEnumTagMultiPayload();
  sub_10004962C(&qword_1000AF840, (void (*)(uint64_t))type metadata accessor for CARThemeLayoutPreview);
  sub_100046310();
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000466A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v1 = type metadata accessor for ColorScheme();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v34 - v6;
  uint64_t v8 = type metadata accessor for RoundedRectangle._Inset();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10002D398(&qword_1000AFA50);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_10002D398(&qword_1000AFA58);
  __chkstk_darwin(v36);
  uint64_t v37 = (uint64_t)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000B1110 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for RoundedRectangle();
  uint64_t v16 = sub_100045A00(v15, (uint64_t)qword_1000B23E8);
  sub_100045AB8(v16, (uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v17 = (uint64_t)v10;
  *(void *)&v10[*(int *)(v8 + 20)] = 0xBFE0000000000000;
  sub_10002CFF4((uint64_t)v7);
  unint64_t v34 = *(void (**)(char *, void, uint64_t))(v2 + 104);
  v34(v5, enum case for ColorScheme.dark(_:), v1);
  char v18 = static ColorScheme.== infix(_:_:)();
  uint64_t v19 = v1;
  id v20 = *(void (**)(char *, uint64_t))(v2 + 8);
  v20(v5, v19);
  uint64_t v35 = v19;
  v20(v7, v19);
  if (v18) {
    static Color.white.getter();
  }
  else {
    static Color.black.getter();
  }
  uint64_t v21 = Color.opacity(_:)();
  swift_release();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  sub_100045AB8(v17, (uint64_t)v13, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle._Inset);
  id v22 = &v13[*(int *)(sub_10002D398(&qword_1000AFA60) + 36)];
  long long v23 = v40;
  *(_OWORD *)id v22 = v39;
  *((_OWORD *)v22 + 1) = v23;
  *((void *)v22 + 4) = v41;
  uint64_t v24 = sub_10002D398(&qword_1000AFA68);
  *(void *)&v13[*(int *)(v24 + 52)] = v21;
  *(_WORD *)&v13[*(int *)(v24 + 56)] = 256;
  uint64_t v25 = static Alignment.center.getter();
  uint64_t v27 = v26;
  uint64_t v28 = (uint64_t *)&v13[*(int *)(sub_10002D398(&qword_1000AFA70) + 36)];
  uint64_t *v28 = v25;
  v28[1] = v27;
  sub_100049818(v17, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle._Inset);
  sub_10002CFF4((uint64_t)v7);
  uint64_t v29 = v35;
  v34(v5, enum case for ColorScheme.light(_:), v35);
  LOBYTE(v25) = static ColorScheme.== infix(_:_:)();
  v20(v5, v29);
  v20(v7, v29);
  if (v25)
  {
    static Color.black.getter();
    uint64_t v30 = Color.opacity(_:)();
    swift_release();
  }
  else
  {
    uint64_t v30 = static Color.clear.getter();
  }
  uint64_t v31 = v37;
  sub_100033C94((uint64_t)v13, v37, &qword_1000AFA50);
  uint64_t v32 = v31 + *(int *)(v36 + 36);
  *(void *)uint64_t v32 = v30;
  *(_OWORD *)(v32 + 8) = xmmword_100072800;
  *(void *)(v32 + 24) = 0x4024000000000000;
  sub_100032F78((uint64_t)v13, &qword_1000AFA50);
  return sub_100033C30(v31, v38, &qword_1000AFA58);
}

uint64_t sub_100046B54()
{
  uint64_t v1 = sub_10002D398(&qword_1000AF7E8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = v0;
  swift_retain();
  sub_10002D398(&qword_1000AF7F0);
  sub_100046070(&qword_1000AF7F8, &qword_1000AF7F0, (void (*)(void))sub_1000460EC);
  Button.init(action:label:)();
  sub_10002F5CC(&qword_1000AF870, &qword_1000AF7E8);
  sub_100046364();
  View.buttonStyle<A>(_:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_100046D0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10002D398((uint64_t *)&unk_1000AF880);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  ButtonStyleConfiguration.label.getter();
  if (ButtonStyleConfiguration.isPressed.getter()) {
    double v10 = 0.96;
  }
  else {
    double v10 = 1.0;
  }
  static UnitPoint.center.getter();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v9, v5, v2);
  uint64_t v15 = &v9[*(int *)(v7 + 44)];
  *(double *)uint64_t v15 = v10;
  *((double *)v15 + 1) = v10;
  *((void *)v15 + 2) = v12;
  *((void *)v15 + 3) = v14;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_100033C30((uint64_t)v9, a1, (uint64_t *)&unk_1000AF880);
}

void sub_100046EA8()
{
  uint64_t v0 = type metadata accessor for UUID();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  char v59 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v58 = (char *)&v54 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v57 = (char *)&v54 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  double v10 = (char *)&v54 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v54 - v11;
  sub_10002D398((uint64_t *)&unk_1000AFA30);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100072810;
  UUID.init()();
  UUID.uuidString.getter();
  char v61 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v62 = v1 + 8;
  uint64_t v55 = v0;
  v61(v12, v0);
  id v14 = objc_allocWithZone((Class)CRSUIClusterThemeLayout);
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v16 = String._bridgeToObjectiveC()();
  sub_10002F83C(0, &qword_1000AFDA0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  uint64_t v60 = sub_10002F83C(0, (unint64_t *)&unk_1000AFA40);
  Class v18 = Array._bridgeToObjectiveC()().super.isa;
  id v19 = [v14 initWithIdentifier:v15 displayName:v16 palettes:isa wallpapers:v18 preview:0];

  uint64_t v56 = v13;
  *(void *)(v13 + 32) = v19;
  UUID.init()();
  UUID.uuidString.getter();
  id v20 = v61;
  v61(v10, v0);
  id v21 = objc_allocWithZone((Class)CRSUIClusterThemeLayout);
  NSString v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v23 = String._bridgeToObjectiveC()();
  Class v24 = Array._bridgeToObjectiveC()().super.isa;
  Class v25 = Array._bridgeToObjectiveC()().super.isa;
  id v26 = [v21 initWithIdentifier:v22 displayName:v23 palettes:v24 wallpapers:v25 preview:0];

  *(void *)(v13 + 40) = v26;
  uint64_t v27 = v57;
  UUID.init()();
  UUID.uuidString.getter();
  uint64_t v28 = v55;
  v20(v27, v55);
  id v29 = objc_allocWithZone((Class)CRSUIClusterThemeLayout);
  NSString v30 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v31 = String._bridgeToObjectiveC()();
  Class v32 = Array._bridgeToObjectiveC()().super.isa;
  Class v33 = Array._bridgeToObjectiveC()().super.isa;
  id v34 = [v29 initWithIdentifier:v30 displayName:v31 palettes:v32 wallpapers:v33 preview:0];

  uint64_t v35 = v56;
  *(void *)(v56 + 48) = v34;
  uint64_t v36 = v58;
  UUID.init()();
  UUID.uuidString.getter();
  v20(v36, v28);
  id v37 = objc_allocWithZone((Class)CRSUIClusterThemeLayout);
  NSString v38 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v39 = String._bridgeToObjectiveC()();
  Class v40 = Array._bridgeToObjectiveC()().super.isa;
  Class v41 = Array._bridgeToObjectiveC()().super.isa;
  id v42 = [v37 initWithIdentifier:v38 displayName:v39 palettes:v40 wallpapers:v41 preview:0];

  *(void *)(v35 + 56) = v42;
  uint64_t v43 = v59;
  UUID.init()();
  UUID.uuidString.getter();
  v61(v43, v28);
  id v44 = objc_allocWithZone((Class)CRSUIClusterThemeLayout);
  NSString v45 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v46 = String._bridgeToObjectiveC()();
  Class v47 = Array._bridgeToObjectiveC()().super.isa;
  Class v48 = Array._bridgeToObjectiveC()().super.isa;
  id v49 = [v44 initWithIdentifier:v45 displayName:v46 palettes:v47 wallpapers:v48 preview:0];

  *(void *)(v35 + 64) = v49;
  uint64_t v63 = v35;
  specialized Array._endMutation()();
  id v50 = objc_allocWithZone((Class)CRSUIClusterThemeDisplay);
  NSString v51 = String._bridgeToObjectiveC()();
  sub_10002F83C(0, &qword_1000AF350);
  Class v52 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v53 = [v50 initWithIdentifier:v51 displayType:1 size:0 requiresDarkAppearance:v52 layouts:1920.0, 720.0];

  qword_1000B2400 = (uint64_t)v53;
}

uint64_t *sub_100047570()
{
  if (qword_1000B1118 != -1) {
    swift_once();
  }
  return &qword_1000B2400;
}

id sub_1000475BC()
{
  return sub_100047994(&qword_1000B1118, (void **)&qword_1000B2400);
}

void sub_1000475E0()
{
  sub_1000476E4((uint64_t)&_swiftEmptyArrayStorage);
  sub_100047808((uint64_t)&_swiftEmptyArrayStorage);
  id v0 = objc_allocWithZone((Class)CRDisplayThemeData);
  NSString v1 = String._bridgeToObjectiveC()();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  sub_10002D398(&qword_1000AFA18);
  Class v3 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v4 = [v0 initWithCurrentLayoutID:v1 paletteIDForLayout:isa wallpaperForLayout:v3];

  qword_1000B2408 = (uint64_t)v4;
}

unint64_t sub_1000476E4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10002D398(&qword_1000AFA28);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100030034(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

unint64_t sub_100047808(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10002D398(&qword_1000AFA20);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_100030034(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

uint64_t *sub_100047924()
{
  if (qword_1000B1120 != -1) {
    swift_once();
  }
  return &qword_1000B2408;
}

id sub_100047970()
{
  return sub_100047994(qword_1000B1120, (void **)&qword_1000B2408);
}

id sub_100047994(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;

  return v3;
}

double sub_1000479E0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10002D398(&qword_1000AEB60);
  __chkstk_darwin(v2 - 8);
  id v4 = (uint64_t *)((char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_1000B1118 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_1000B1120[0];
  id v6 = (id)qword_1000B2400;
  if (v5 != -1) {
    swift_once();
  }
  *(void *)&long long v23 = qword_1000B2408;
  sub_10002F83C(0, &qword_1000AF088);
  static Binding.constant(_:)();
  uint64_t v7 = v26;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  sub_10002D398(&qword_1000AF7C0);
  long long v20 = v27;
  static Binding.constant(_:)();
  long long v19 = v23;
  uint64_t v8 = v24;
  uint64_t v9 = v25;
  uint64_t *v4 = swift_getKeyPath();
  sub_10002D398(&qword_1000AEB50);
  swift_storeEnumTagMultiPayload();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v11 = swift_getKeyPath();
  sub_100033C30((uint64_t)v4, a1, &qword_1000AEB60);
  BOOL v12 = (int *)type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v13 = a1 + v12[5];
  *(void *)uint64_t v13 = KeyPath;
  *(unsigned char *)(v13 + 8) = 0;
  uint64_t v14 = a1 + v12[6];
  *(void *)uint64_t v14 = v11;
  *(unsigned char *)(v14 + 8) = 0;
  *(void *)(a1 + v12[7]) = v6;
  uint64_t v15 = a1 + v12[8];
  *(void *)uint64_t v15 = v7;
  *(_OWORD *)(v15 + 8) = v20;
  uint64_t v16 = a1 + v12[9];
  double result = *(double *)&v19;
  *(_OWORD *)uint64_t v16 = v19;
  *(void *)(v16 + 16) = v8;
  *(void *)(v16 + 24) = v9;
  Class v18 = (void *)(a1 + v12[10]);
  void *v18 = nullsub_8;
  v18[1] = 0;
  return result;
}

uint64_t sub_100047C18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100047C34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100047C50()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100047C70()
{
  unint64_t result = qword_1000AF890;
  if (!qword_1000AF890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF890);
  }
  return result;
}

uint64_t sub_100047CC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100047CE8(uint64_t a1)
{
  unint64_t v2 = sub_1000496F8();

  return static PreviewProvider._previews.getter(a1, v2);
}

uint64_t sub_100047D34(uint64_t a1)
{
  unint64_t v2 = sub_1000496F8();

  return static PreviewProvider._platform.getter(a1, v2);
}

void *sub_100047D80()
{
  return &protocol witness table for String;
}

void sub_100047D8C(uint64_t *a1@<X8>)
{
  id v3 = [*v1 identifier];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

uint64_t *sub_100047DE4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      uint64_t *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    char v10 = (char *)v4 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    char v13 = v11[8];
    sub_1000313D4(*(void *)v11, v13);
    *(void *)char v10 = v12;
    v10[8] = v13;
    uint64_t v14 = a3[6];
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = *(void *)v16;
    char v18 = v16[8];
    sub_1000313D4(*(void *)v16, v18);
    *(void *)uint64_t v15 = v17;
    v15[8] = v18;
    uint64_t v19 = a3[7];
    uint64_t v20 = a3[8];
    uint64_t v21 = *(void **)((char *)a2 + v19);
    *(uint64_t *)((char *)v4 + v19) = (uint64_t)v21;
    uint64_t v22 = (uint64_t *)((char *)v4 + v20);
    long long v23 = (uint64_t *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    void *v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = (void *)v23[2];
    v22[2] = v25;
    uint64_t v26 = a3[9];
    uint64_t v27 = a3[10];
    uint64_t v28 = (uint64_t *)((char *)v4 + v26);
    id v29 = (uint64_t *)((char *)a2 + v26);
    uint64_t v30 = v29[1];
    void *v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = v29[3];
    v28[2] = v29[2];
    v28[3] = v31;
    Class v32 = (uint64_t *)((char *)v4 + v27);
    Class v33 = (uint64_t *)((char *)a2 + v27);
    uint64_t v34 = v33[1];
    *Class v32 = *v33;
    v32[1] = v34;
    id v35 = v21;
    swift_retain();
    swift_retain();
    id v36 = v25;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100047FD8(uint64_t a1, int *a2)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_1000313E0(*(void *)(a1 + a2[5]), *(unsigned char *)(a1 + a2[5] + 8));
  sub_1000313E0(*(void *)(a1 + a2[6]), *(unsigned char *)(a1 + a2[6] + 8));

  uint64_t v5 = a1 + a2[8];
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

void *sub_1000480F8(void *a1, void *a2, int *a3)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_1000313D4(*(void *)v9, v11);
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  uint64_t v12 = a3[6];
  char v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)v14;
  char v16 = v14[8];
  sub_1000313D4(*(void *)v14, v16);
  *(void *)char v13 = v15;
  v13[8] = v16;
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = *(void **)((char *)a2 + v17);
  *(void *)((char *)a1 + v17) = v19;
  uint64_t v20 = (void *)((char *)a1 + v18);
  uint64_t v21 = (void *)((char *)a2 + v18);
  uint64_t v22 = v21[1];
  void *v20 = *v21;
  v20[1] = v22;
  long long v23 = (void *)v21[2];
  v20[2] = v23;
  uint64_t v24 = a3[9];
  uint64_t v25 = a3[10];
  uint64_t v26 = (void *)((char *)a1 + v24);
  uint64_t v27 = (void *)((char *)a2 + v24);
  uint64_t v28 = v27[1];
  void *v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = v27[3];
  v26[2] = v27[2];
  v26[3] = v29;
  uint64_t v30 = (void *)((char *)a1 + v25);
  uint64_t v31 = (void *)((char *)a2 + v25);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  id v33 = v19;
  swift_retain();
  swift_retain();
  id v34 = v23;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_1000482A0(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100032F78((uint64_t)a1, &qword_1000AEB50);
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_1000313D4(*(void *)v9, v11);
  uint64_t v12 = *(void *)v8;
  char v13 = v8[8];
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  sub_1000313E0(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = (char *)a1 + v14;
  char v16 = (char *)a2 + v14;
  uint64_t v17 = *(void *)v16;
  char v18 = v16[8];
  sub_1000313D4(*(void *)v16, v18);
  uint64_t v19 = *(void *)v15;
  char v20 = v15[8];
  *(void *)uint64_t v15 = v17;
  v15[8] = v18;
  sub_1000313E0(v19, v20);
  uint64_t v21 = a3[7];
  uint64_t v22 = *(void **)((char *)a2 + v21);
  long long v23 = *(void **)((char *)a1 + v21);
  *(void *)((char *)a1 + v21) = v22;
  id v24 = v22;

  uint64_t v25 = a3[8];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  *(void *)((char *)a1 + v25) = *(void *)((char *)a2 + v25);
  swift_retain();
  swift_release();
  *((void *)v26 + 1) = *((void *)v27 + 1);
  swift_retain();
  swift_release();
  uint64_t v28 = (void *)*((void *)v27 + 2);
  uint64_t v29 = (void *)*((void *)v26 + 2);
  *((void *)v26 + 2) = v28;
  id v30 = v28;

  uint64_t v31 = a3[9];
  uint64_t v32 = (void *)((char *)a1 + v31);
  id v33 = (void *)((char *)a2 + v31);
  *(void *)((char *)a1 + v31) = *(void *)((char *)a2 + v31);
  swift_retain();
  swift_release();
  v32[1] = v33[1];
  swift_retain();
  swift_release();
  v32[2] = v33[2];
  v32[3] = v33[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[10];
  id v35 = (void *)((char *)a1 + v34);
  id v36 = (void *)((char *)a2 + v34);
  uint64_t v37 = v36[1];
  void *v35 = *v36;
  v35[1] = v37;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1000484D0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  char v11 = &a2[v8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  uint64_t v12 = &a1[v9];
  char v13 = &a2[v9];
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  uint64_t v15 = &a1[v14];
  char v16 = &a2[v14];
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *((void *)v15 + 2) = *((void *)v16 + 2);
  uint64_t v17 = a3[9];
  uint64_t v18 = a3[10];
  uint64_t v19 = &a1[v17];
  char v20 = &a2[v17];
  long long v21 = *((_OWORD *)v20 + 1);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v21;
  *(_OWORD *)&a1[v18] = *(_OWORD *)&a2[v18];
  return a1;
}

char *sub_10004860C(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100032F78((uint64_t)a1, &qword_1000AEB50);
    uint64_t v6 = sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)v10;
  LOBYTE(v10) = v10[8];
  uint64_t v12 = *(void *)v9;
  char v13 = v9[8];
  *(void *)uint64_t v9 = v11;
  v9[8] = (char)v10;
  sub_1000313E0(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  char v16 = &a2[v14];
  uint64_t v17 = *(void *)v16;
  LOBYTE(v16) = v16[8];
  uint64_t v18 = *(void *)v15;
  char v19 = v15[8];
  *(void *)uint64_t v15 = v17;
  v15[8] = (char)v16;
  sub_1000313E0(v18, v19);
  uint64_t v20 = a3[7];
  long long v21 = *(void **)&a1[v20];
  *(void *)&a1[v20] = *(void *)&a2[v20];

  uint64_t v22 = a3[8];
  long long v23 = &a1[v22];
  id v24 = &a2[v22];
  *(void *)&a1[v22] = *(void *)&a2[v22];
  swift_release();
  *((void *)v23 + 1) = *((void *)v24 + 1);
  swift_release();
  uint64_t v25 = (void *)*((void *)v23 + 2);
  *((void *)v23 + 2) = *((void *)v24 + 2);

  uint64_t v26 = a3[9];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  *(void *)&a1[v26] = *(void *)&a2[v26];
  swift_release();
  *((void *)v27 + 1) = *((void *)v28 + 1);
  swift_release();
  uint64_t v29 = *((void *)v28 + 3);
  *((void *)v27 + 2) = *((void *)v28 + 2);
  *((void *)v27 + 3) = v29;
  swift_bridgeObjectRelease();
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  swift_release();
  return a1;
}

uint64_t sub_1000487E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000487FC);
}

uint64_t sub_1000487FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000AEB60);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1000488C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000488D4);
}

uint64_t sub_1000488D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10002D398(&qword_1000AEB60);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

void sub_100048994()
{
  sub_10002F264();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_100048A5C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      uint64_t *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)v4 + v9) = (uint64_t)v11;
    *(uint64_t *)((char *)v4 + v10) = *(uint64_t *)((char *)a2 + v10);
    uint64_t v12 = a3[7];
    uint64_t v13 = a3[8];
    uint64_t v14 = (uint64_t *)((char *)v4 + v12);
    uint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = (uint64_t *)((char *)v4 + v13);
    uint64_t v18 = (uint64_t *)((char *)a2 + v13);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    id v20 = v11;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100048BBC(uint64_t a1, uint64_t a2)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

void *sub_100048C88(void *a1, void *a2, int *a3)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = v9;
  *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  uint64_t v10 = a3[7];
  uint64_t v11 = a3[8];
  uint64_t v12 = (void *)((char *)a1 + v10);
  uint64_t v13 = (void *)((char *)a2 + v10);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = (void *)((char *)a1 + v11);
  uint64_t v16 = (void *)((char *)a2 + v11);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  id v18 = v9;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_100048D9C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100032F78((uint64_t)a1, &qword_1000AEB50);
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)((char *)a2 + v7);
  uint64_t v9 = *(void **)((char *)a1 + v7);
  *(void *)((char *)a1 + v7) = v8;
  id v10 = v8;

  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[8];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_100048EF8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  uint64_t v9 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  return a1;
}

char *sub_100048FE8(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100032F78((uint64_t)a1, &qword_1000AEB50);
    uint64_t v6 = sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = *(void **)&a1[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];

  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_unknownObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v14 = *(void *)v12;
  uint64_t v13 = *((void *)v12 + 1);
  *(void *)uint64_t v11 = v14;
  *((void *)v11 + 1) = v13;
  swift_bridgeObjectRelease();
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  swift_release();
  return a1;
}

uint64_t sub_100049124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100049138);
}

uint64_t sub_100049138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000AEB60);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1000491FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100049210);
}

uint64_t sub_100049210(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10002D398(&qword_1000AEB60);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

void sub_1000492D0()
{
  sub_10002F264();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for CARScalingButtonStyle()
{
  return &type metadata for CARScalingButtonStyle;
}

ValueMetadata *type metadata accessor for CARThemeSelector_Previews()
{
  return &type metadata for CARThemeSelector_Previews;
}

uint64_t sub_1000493AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004944C(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F34C(a2);
    sub_10002F5CC(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000494E8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100049580()
{
  unint64_t result = qword_1000AF9E8;
  if (!qword_1000AF9E8)
  {
    sub_10002F34C((uint64_t *)&unk_1000AF880);
    sub_10004962C((unint64_t *)&unk_1000AF9F0, (void (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF9E8);
  }
  return result;
}

uint64_t sub_10004962C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100049674()
{
  return sub_10004962C(&qword_1000AF0E0, (void (*)(uint64_t))type metadata accessor for CARThemeLayoutSelector);
}

uint64_t sub_1000496BC()
{
  return sub_10002F5CC(&qword_1000AFA00, &qword_1000AFA08);
}

unint64_t sub_1000496F8()
{
  unint64_t result = qword_1000AFA10;
  if (!qword_1000AFA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFA10);
  }
  return result;
}

uint64_t sub_100049750(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100049818(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_100049878(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000498E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for CARThemeLayoutSelector(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100043950(v4, a1);
}

uint64_t sub_100049964@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v4 = v1
     + ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80));
  id v5 = [*(id *)(v4 + *(int *)(v3 + 28)) layouts];
  sub_10002F83C(0, &qword_1000AF350);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v10[2] = v4;
  uint64_t v7 = sub_1000456A8(sub_10004A06C, (uint64_t)v10, v6);
  LOBYTE(v4) = v8;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return result;
}

uint64_t sub_100049A64()
{
  uint64_t v1 = (int *)type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = v0 + v3;
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v4;
  sub_1000313E0(*(void *)(v5 + v1[5]), *(unsigned char *)(v5 + v1[5] + 8));
  sub_1000313E0(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));

  uint64_t v8 = v5 + v1[8];
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v7, v2 | 7);
}

void sub_100049C04(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for CARThemeLayoutSelector(0);
  if ((*(unsigned char *)(a1 + 8) & 1) == 0)
  {
    uint64_t v4 = v1
       + ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80));
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = *(void **)(v4 + *(int *)(v3 + 28));
    id v7 = [v6 layouts];
    sub_10002F83C(0, &qword_1000AF350);
    unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease_n();
      if (v9 < 0)
      {
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();
    }
    if ((v5 & 0x8000000000000000) == 0 && v5 < v9)
    {
      id v10 = [v6 layouts];
      uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if ((v11 & 0xC000000000000001) == 0)
      {
        if ((unint64_t)v5 >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v12 = *(id *)(v11 + 8 * v5 + 32);
        goto LABEL_9;
      }
LABEL_13:
      id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
      uint64_t v13 = v12;
      swift_bridgeObjectRelease();
      id v14 = [v13 identifier];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      sub_10002D398(&qword_1000AF7A0);
      Binding.wrappedValue.setter();
    }
  }
}

uint64_t sub_100049E14(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100049E54(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100049E98(uint64_t a1)
{
  return a1;
}

uint64_t sub_100049EC4(uint64_t a1)
{
  return a1;
}

void sub_100049EF4()
{
}

uint64_t sub_100049F50()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_100049F60(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_100049F78()
{
  unint64_t result = qword_1000AFAB8;
  if (!qword_1000AFAB8)
  {
    sub_10002F34C(&qword_1000AFAB0);
    sub_10004A018();
    sub_10002F5CC(&qword_1000AFAC8, &qword_1000AFAD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFAB8);
  }
  return result;
}

unint64_t sub_10004A018()
{
  unint64_t result = qword_1000AFAC0;
  if (!qword_1000AFAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFAC0);
  }
  return result;
}

uint64_t sub_10004A06C(id *a1)
{
  id v1 = [*a1 identifier];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;

  type metadata accessor for CARThemeLayoutSelector(0);
  sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  if (v9)
  {
    if (v2 == v8 && v9 == v4) {
      char v6 = 1;
    }
    else {
      char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = 0;
  }
  swift_bridgeObjectRelease();
  return v6 & 1;
}

uint64_t sub_10004A164()
{
  return sub_1000442D0(*(void *)(v0 + 24), *(double *)(v0 + 16), *(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_10004A174()
{
  return sub_10004453C(*(void *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_10004A180(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F34C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10004A1EC()
{
  unint64_t result = qword_1000AFB38;
  if (!qword_1000AFB38)
  {
    sub_10002F34C(&qword_1000AFB40);
    sub_10002F34C(&qword_1000AFB48);
    sub_100046070(&qword_1000AFB50, &qword_1000AFB48, (void (*)(void))sub_10004A300);
    swift_getOpaqueTypeConformance2();
    sub_10004962C((unint64_t *)&qword_1000AFB90, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFB38);
  }
  return result;
}

unint64_t sub_10004A300()
{
  unint64_t result = qword_1000AFB58;
  if (!qword_1000AFB58)
  {
    sub_10002F34C(&qword_1000AFB60);
    sub_10004A3A0();
    sub_10002F5CC(&qword_1000AFB80, &qword_1000AFB88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFB58);
  }
  return result;
}

unint64_t sub_10004A3A0()
{
  unint64_t result = qword_1000AFB68;
  if (!qword_1000AFB68)
  {
    sub_10002F34C(&qword_1000AFB70);
    sub_10004962C(&qword_1000AFB78, (void (*)(uint64_t))type metadata accessor for CARLayoutPreviewButton);
    sub_10002F5CC(&qword_1000AFAC8, &qword_1000AFAD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFB68);
  }
  return result;
}

uint64_t sub_10004A470()
{
  id v1 = (int *)type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  unint64_t v7 = ((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  sub_1000313E0(*(void *)(v5 + v1[5]), *(unsigned char *)(v5 + v1[5] + 8));
  sub_1000313E0(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));

  uint64_t v8 = v5 + v1[8];
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v7, v2 | 7);
}

uint64_t sub_10004A61C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for CARThemeLayoutSelector(0);

  return sub_100044758(a1, a2);
}

unint64_t sub_10004A6D4()
{
  unint64_t result = qword_1000AFBA8;
  if (!qword_1000AFBA8)
  {
    sub_10002F83C(255, &qword_1000AF350);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFBA8);
  }
  return result;
}

uint64_t sub_10004A73C()
{
  id v1 = (int *)type metadata accessor for CARThemeLayoutSelector(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1000313E0(*(void *)(v5 + v1[5]), *(unsigned char *)(v5 + v1[5] + 8));
  sub_1000313E0(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));

  uint64_t v8 = v5 + v1[8];
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v7 + 8, v2 | 7);
}

void sub_10004A8F0()
{
  uint64_t v1 = *(void *)(type metadata accessor for CARThemeLayoutSelector(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void **)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_1000453F4(v0 + v2, v3);
}

uint64_t sub_10004A97C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10004A98C()
{
  id v1 = [*(id *)(v0 + 24) identifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  type metadata accessor for CARThemeLayoutSelector(0);
  sub_10002D398(&qword_1000AF7A0);
  return Binding.wrappedValue.setter();
}

uint64_t sub_10004AA48(void *a1, uint64_t a2)
{
  __chkstk_darwin(a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a2);
  char v14 = 0;
  id v7 = a1;
  State.init(wrappedValue:)();
  char v8 = (char)v11;
  uint64_t v9 = v12;
  id v11 = v7;
  LOBYTE(v12) = v8;
  uint64_t v13 = v9;
  return ModifiedContent.init(content:modifier:)();
}

uint64_t sub_10004AB60@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v39 = a5;
  uint64_t v38 = type metadata accessor for NSNotificationCenter.Publisher();
  uint64_t v8 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  id v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10002D398(&qword_1000AFBC0);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  char v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10002D398(&qword_1000AFBC8);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15);
  uint64_t v36 = (uint64_t)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = [self defaultCenter];
  NSNotificationCenter.publisher(for:object:)();

  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  char v20 = a3;
  *(unsigned char *)(v19 + 24) = a3;
  uint64_t v21 = a4;
  *(void *)(v19 + 32) = a4;
  uint64_t v22 = sub_10002D398(&qword_1000AFBD0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v14, v37, v22);
  uint64_t v23 = v38;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(&v14[*(int *)(v12 + 60)], v10, v38);
  id v24 = (uint64_t (**)())&v14[*(int *)(v12 + 64)];
  char *v24 = sub_10004B420;
  v24[1] = (uint64_t (*)())v19;
  uint64_t v25 = *(void (**)(char *, uint64_t))(v8 + 8);
  id v26 = a2;
  swift_retain();
  v25(v10, v23);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v26;
  *(unsigned char *)(v27 + 24) = v20;
  *(void *)(v27 + 32) = v21;
  uint64_t v28 = v36;
  sub_100033C94((uint64_t)v14, v36, &qword_1000AFBC0);
  uint64_t v29 = (uint64_t (**)())(v28 + *(int *)(v16 + 44));
  *uint64_t v29 = sub_10004B420;
  v29[1] = (uint64_t (*)())v27;
  v29[2] = 0;
  v29[3] = 0;
  id v30 = v26;
  swift_retain();
  sub_100032F78((uint64_t)v14, &qword_1000AFBC0);
  uint64_t KeyPath = swift_getKeyPath();
  char v40 = v20;
  uint64_t v41 = v21;
  sub_10002D398(&qword_1000AFBD8);
  State.wrappedValue.getter();
  LOBYTE(v27) = v42;
  uint64_t v32 = v39;
  sub_100033C94(v28, v39, &qword_1000AFBC8);
  uint64_t v33 = v32 + *(int *)(sub_10002D398(&qword_1000AFBE0) + 36);
  *(void *)uint64_t v33 = KeyPath;
  *(unsigned char *)(v33 + 8) = v27;
  return sub_100032F78(v28, &qword_1000AFBC8);
}

uint64_t sub_10004AED8(void *a1)
{
  id v2 = [a1 limitUserInterfaces];
  if (v2)
  {
    uint64_t v3 = v2;
    unsigned int v4 = [v2 BOOLValue];

    if (v4)
    {
      id v5 = [a1 configuration];
      [v5 limitableUserInterfaces];
    }
  }
  sub_10002D398(&qword_1000AFBD8);
  return State.wrappedValue.setter();
}

uint64_t sub_10004AFB4()
{
  sub_10004AFF0();
  EnvironmentValues.subscript.getter();
  return v1;
}

unint64_t sub_10004AFF0()
{
  unint64_t result = qword_1000B1470;
  if (!qword_1000B1470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B1470);
  }
  return result;
}

uint64_t sub_10004B044()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_10004B080@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10004AB60(a1, *(void **)v2, *(unsigned char *)(v2 + 8), *(void *)(v2 + 16), a2);
}

void sub_10004B090(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_10004B098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, &protocol witness table for Bool);
}

uint64_t (*sub_10004B0A4(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(void *)(a1 + 8) = sub_10004AFF0();
  EnvironmentValues.subscript.getter();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 17);
  return sub_10004B118;
}

uint64_t sub_10004B118(uint64_t a1)
{
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 16);
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_10004B150()
{
  return swift_getWitnessTable();
}

unint64_t sub_10004B1B4()
{
  unint64_t result = qword_1000B1478[0];
  if (!qword_1000B1478[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000B1478);
  }
  return result;
}

ValueMetadata *type metadata accessor for CRSUIClusterThemeLimitedUIKey()
{
  return &type metadata for CRSUIClusterThemeLimitedUIKey;
}

uint64_t destroy for MonitorLimitedUIState(id *a1)
{
  return swift_release();
}

uint64_t _s15CarPlaySettings21MonitorLimitedUIStateVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  id v4 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MonitorLimitedUIState(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for MonitorLimitedUIState(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MonitorLimitedUIState(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MonitorLimitedUIState(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MonitorLimitedUIState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MonitorLimitedUIState()
{
  return &type metadata for MonitorLimitedUIState;
}

uint64_t sub_10004B400()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004B420()
{
  return sub_10004AED8(*(void **)(v0 + 16));
}

uint64_t sub_10004B434()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

unint64_t sub_10004B478()
{
  unint64_t result = qword_1000AFBE8;
  if (!qword_1000AFBE8)
  {
    sub_10002F34C(&qword_1000AFBE0);
    sub_10004B518();
    sub_10002F5CC(&qword_1000AFC00, &qword_1000AFC08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFBE8);
  }
  return result;
}

unint64_t sub_10004B518()
{
  unint64_t result = qword_1000AFBF0;
  if (!qword_1000AFBF0)
  {
    sub_10002F34C(&qword_1000AFBC8);
    sub_10002F5CC(&qword_1000AFBF8, &qword_1000AFBC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFBF0);
  }
  return result;
}

uint64_t sub_10004B5BC()
{
  sub_10002D398(&qword_1000AFC10);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_10004B604()
{
  return Binding.wrappedValue.setter();
}

void (*sub_10004B650(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5))(uint64_t, char)
{
  uint64_t v9 = malloc(0x48uLL);
  *a1 = v9;
  v9[6] = a4;
  v9[7] = a5;
  v9[5] = a3;
  *uint64_t v9 = a3;
  v9[1] = a4;
  v9[2] = a5;
  swift_retain();
  swift_retain();
  id v10 = a5;
  v9[8] = sub_10002D398(&qword_1000AFC10);
  Binding.wrappedValue.getter();
  return sub_10004B6FC;
}

uint64_t sub_10004B700()
{
  sub_10002D398(&qword_1000AFC10);
  Binding.projectedValue.getter();
  return v1;
}

void *sub_10004B74C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[0] = a3;
  v9[1] = a4;
  v9[2] = a5;
  swift_bridgeObjectRetain();
  sub_10002D398(&qword_1000AFC10);
  Binding.wrappedValue.getter();
  id v6 = objc_allocWithZone((Class)type metadata accessor for CARPaletteSelectorView());
  id v7 = (void *)sub_10004C390(a2, (void *)v9[5], 30.0, 30.0, 16.0, 3.0, 3.0, 16.0);
  v9[3] = type metadata accessor for CARThemePaletteSelector.Coordinator();
  v9[4] = &off_1000930A8;
  sub_10002D398(&qword_1000AFC18);
  UIViewRepresentableContext.coordinator.getter();
  (*(void (**)(void *))((swift_isaMask & *v7) + 0xA8))(v9);
  return v7;
}

double sub_10004B84C()
{
  return 30.0;
}

double sub_10004B858()
{
  return 16.0;
}

double sub_10004B860()
{
  return 3.0;
}

double sub_10004B868()
{
  return 3.0;
}

uint64_t sub_10004B874(unint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  id v17 = objc_allocWithZone(v8);
  return sub_10004C390(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t type metadata accessor for CARPaletteSelectorView()
{
  return self;
}

void sub_10004B924(void *a1)
{
  sub_10002D398(&qword_1000AFC10);
  Binding.wrappedValue.getter();
  sub_10002D398(&qword_1000AFC18);
  UIViewRepresentableContext.transaction.getter();
  char v2 = Transaction.disablesAnimations.getter();
  swift_release();
  (*(void (**)(void *, BOOL))((swift_isaMask & *a1) + 0xD8))(v3, (v2 & 1) == 0);
}

id sub_10004B9EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  sub_10002D398(&qword_1000AFC10);
  Binding.projectedValue.getter();
  id v4 = (objc_class *)type metadata accessor for CARThemePaletteSelector.Coordinator();
  long long v8 = v14;
  id v5 = (char *)objc_allocWithZone(v4);
  id v6 = &v5[OBJC_IVAR____TtCV15CarPlaySettings23CARThemePaletteSelector11Coordinator__selectedPalette];
  *(void *)id v6 = v13;
  *(_OWORD *)(v6 + 8) = v8;
  v9.receiver = v5;
  v9.super_class = v4;
  return [super init];
}

id sub_10004BA74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (char *)objc_allocWithZone(v3);
  long long v8 = &v7[OBJC_IVAR____TtCV15CarPlaySettings23CARThemePaletteSelector11Coordinator__selectedPalette];
  *(void *)long long v8 = a1;
  *((void *)v8 + 1) = a2;
  *((void *)v8 + 2) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return [super init];
}

uint64_t sub_10004BADC()
{
  sub_10002D398(&qword_1000AFC10);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_10004BB38()
{
  return Binding.wrappedValue.setter();
}

void (*sub_10004BB94(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = v1 + OBJC_IVAR____TtCV15CarPlaySettings23CARThemePaletteSelector11Coordinator__selectedPalette;
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtCV15CarPlaySettings23CARThemePaletteSelector11Coordinator__selectedPalette);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtCV15CarPlaySettings23CARThemePaletteSelector11Coordinator__selectedPalette + 8);
  void v3[5] = v5;
  v3[6] = v6;
  id v7 = *(void **)(v4 + 16);
  v3[7] = v7;
  *uint64_t v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  swift_retain();
  swift_retain();
  id v8 = v7;
  unsigned char v3[8] = sub_10002D398(&qword_1000AFC10);
  Binding.wrappedValue.getter();
  return sub_10004B6FC;
}

uint64_t sub_10004BC44()
{
  sub_10002D398(&qword_1000AFC10);
  Binding.projectedValue.getter();
  return v1;
}

id sub_10004BCA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = &v3[OBJC_IVAR____TtCV15CarPlaySettings23CARThemePaletteSelector11Coordinator__selectedPalette];
  *(void *)uint64_t v4 = a1;
  *((void *)v4 + 1) = a2;
  *((void *)v4 + 2) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for CARThemePaletteSelector.Coordinator();
  return [super init];
}

uint64_t sub_10004BCEC(void *a1)
{
  uint64_t v4 = *(uint64_t (**)(id))((swift_isaMask & *v1) + 0x60);
  id v2 = a1;

  return v4(v2);
}

void sub_10004BD50()
{
}

id sub_10004BDB0()
{
  return sub_10005025C(type metadata accessor for CARThemePaletteSelector.Coordinator);
}

uint64_t sub_10004BE18()
{
  return (*(uint64_t (**)(void))((swift_isaMask & **v0) + 0x80))();
}

void *sub_10004BE6C(uint64_t a1)
{
  return sub_10004B74C(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_10004BE78(void *a1)
{
  sub_10002D398(&qword_1000AFC10);
  Binding.wrappedValue.getter();
  sub_10002D398(&qword_1000AFC18);
  UIViewRepresentableContext.transaction.getter();
  char v2 = Transaction.disablesAnimations.getter();
  swift_release();
  (*(void (**)(void *, BOOL))((swift_isaMask & *a1) + 0xD8))(v3, (v2 & 1) == 0);
}

id sub_10004BF48@<X0>(void *a1@<X8>)
{
  uint64_t v9 = *(void *)(v1 + 8);
  long long v10 = *(_OWORD *)(v1 + 16);
  sub_10002D398(&qword_1000AFC10);
  Binding.projectedValue.getter();
  uint64_t v3 = (objc_class *)type metadata accessor for CARThemePaletteSelector.Coordinator();
  long long v7 = v12;
  uint64_t v4 = (char *)objc_allocWithZone(v3);
  uint64_t v5 = &v4[OBJC_IVAR____TtCV15CarPlaySettings23CARThemePaletteSelector11Coordinator__selectedPalette];
  *(void *)uint64_t v5 = v11;
  *(_OWORD *)(v5 + 8) = v7;
  v8.receiver = v4;
  v8.super_class = v3;
  id result = [super init];
  *a1 = result;
  return result;
}

uint64_t sub_10004BFE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100052340();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10004C04C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100052340();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10004C0B0()
{
}

uint64_t sub_10004C0D8()
{
  return swift_bridgeObjectRetain();
}

double sub_10004C0E8()
{
  return *(double *)(v0 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_pageSize);
}

double sub_10004C0FC()
{
  return *(double *)(v0 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_pageSpacing);
}

double sub_10004C10C()
{
  return *(double *)(v0 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_selectionRingWidth);
}

double sub_10004C11C()
{
  return *(double *)(v0 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorSize);
}

double sub_10004C130@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_10004C140@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_delegate;
  swift_beginAccess();
  return sub_100033C94(v3, a1, &qword_1000AFC58);
}

uint64_t sub_10004C19C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_delegate;
  swift_beginAccess();
  sub_10004CFA0(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_10004C1F8())()
{
  return j__swift_endAccess;
}

id sub_10004C254()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_selectedPalette);
  swift_beginAccess();
  char v2 = *v1;

  return v2;
}

void sub_10004C2AC(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_selectedPalette);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
}

id sub_10004C300()
{
  id v0 = objc_allocWithZone((Class)UIScrollView);

  return [v0 initWithFrame:0.0, 0.0, 0.0, 0.0];
}

id sub_10004C348()
{
  id v0 = objc_allocWithZone((Class)UIStackView);

  return [v0 initWithFrame:0.0, 0.0, 0.0, 0.0];
}

uint64_t sub_10004C390(unint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  id v17 = &v8[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_delegate];
  *(_OWORD *)id v17 = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  *((void *)v17 + 4) = 0;
  uint64_t v18 = OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_scrollView;
  id v19 = objc_allocWithZone((Class)UIScrollView);
  char v20 = v8;
  *(void *)&v8[v18] = [v19 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v21 = OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView;
  *(void *)&v20[v21] = [objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v22 = a2;
  uint64_t v23 = 0;
  LOBYTE(v21) = sub_100051E48(a1, v22);

  if ((v21 & 1) == 0) {
    goto LABEL_30;
  }
  if ((a1 & 0x8000000000000000) != 0 || (a1 & 0x4000000000000000) != 0) {
    goto LABEL_31;
  }
  uint64_t v24 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  while (1)
  {
    v110[0] = v24;
    sub_100050888(v110);
    if (v23) {
      goto LABEL_35;
    }
    swift_bridgeObjectRelease();
    uint64_t v25 = v110[0];
    if (v110[0] < 0 || (v110[0] & 0x4000000000000000) != 0) {
      break;
    }
    uint64_t v26 = *(void *)(v110[0] + 16);
    uint64_t v107 = v26;
    if (!v26) {
      goto LABEL_16;
    }
LABEL_9:
    uint64_t v23 = 0;
    while (1)
    {
      if ((v25 & 0xC000000000000001) != 0) {
        id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v27 = *(id *)(v25 + 8 * v23 + 32);
      }
      uint64_t v28 = v27;
      unsigned int v29 = [v27 isProminent];

      if (!v29)
      {
        BOOL v31 = v23 == 0;
        goto LABEL_18;
      }
      uint64_t v30 = v23 + 1;
      if (__OFADD__(v23, 1)) {
        break;
      }
      ++v23;
      if (v30 == v26) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    unint64_t v102 = swift_bridgeObjectRetain();
    uint64_t v24 = (uint64_t)sub_100050904(v102);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
  swift_release();
  uint64_t v107 = v26;
  if (v26) {
    goto LABEL_9;
  }
LABEL_16:
  uint64_t v23 = 0;
  BOOL v31 = 1;
LABEL_18:
  *(void *)&v20[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_palettes] = v25;
  uint64_t v32 = &v20[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorPosition];
  *(void *)uint64_t v32 = v23;
  BOOL v105 = v31;
  v32[8] = v31;
  *(void *)&v20[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_selectedPalette] = v22;
  uint64_t v33 = (double *)&v20[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_pageSize];
  *uint64_t v33 = a3;
  v33[1] = a4;
  *(double *)&v20[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_pageSpacing] = a5;
  *(double *)&v20[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_selectionRingWidth] = a6;
  uint64_t v34 = (double *)&v20[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorSize];
  *uint64_t v34 = a7;
  v34[1] = a8;
  id v103 = v22;
  swift_retain();

  v109.receiver = v20;
  v109.super_class = (Class)type metadata accessor for CARPaletteSelectorView();
  uint64_t v35 = (char *)objc_msgSendSuper2(&v109, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v36 = OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_scrollView;
  uint64_t v37 = *(void **)&v35[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_scrollView];
  uint64_t v38 = v35;
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v37 setClipsToBounds:0];
  [v37 setPagingEnabled:1];
  [v37 setDelegate:v38];
  [v38 addSubview:v37];
  id v108 = self;
  sub_10002D398((uint64_t *)&unk_1000AFA30);
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_100072210;
  id v40 = [v37 centerXAnchor];
  id v41 = [v38 centerXAnchor];
  id v42 = [v40 constraintEqualToAnchor:v41];

  *(void *)(v39 + 32) = v42;
  id v43 = [*(id *)&v35[v36] centerYAnchor];
  id v44 = [v38 centerYAnchor];
  id v45 = [v43 constraintEqualToAnchor:v44];

  *(void *)(v39 + 40) = v45;
  id v46 = [*(id *)&v35[v36] widthAnchor];
  id v47 = [v46 constraintEqualToConstant:a3 + a5];

  *(void *)(v39 + 48) = v47;
  uint64_t v106 = v36;
  uint64_t v48 = v36;
  id v49 = [*(id *)&v35[v36] heightAnchor];
  id v50 = [v49 constraintEqualToConstant:a4];

  *(void *)(v39 + 56) = v50;
  v110[0] = v39;
  specialized Array._endMutation()();
  sub_10002F83C(0, (unint64_t *)&qword_1000AF2E0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v108 activateConstraints:isa];

  Class v52 = *(void **)&v38[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView];
  uint64_t v53 = OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView;
  [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v52 setDistribution:3];
  [v52 setAlignment:3];
  [v52 setSpacing:a5];
  uint64_t v54 = *(void **)&v35[v48];
  [v54 addSubview:v52];
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_100072210;
  id v56 = [v52 topAnchor];
  id v57 = [v54 topAnchor];
  id v58 = [v56 constraintEqualToAnchor:v57];

  *(void *)(v55 + 32) = v58;
  id v59 = [*(id *)&v38[v53] bottomAnchor];
  id v60 = [*(id *)&v35[v106] bottomAnchor];
  id v61 = [v59 constraintEqualToAnchor:v60];

  *(void *)(v55 + 40) = v61;
  id v62 = [*(id *)&v38[v53] leadingAnchor];
  id v63 = [*(id *)&v35[v106] leadingAnchor];
  id v64 = [v62 constraintEqualToAnchor:v63 constant:a5 * 0.5];

  *(void *)(v55 + 48) = v64;
  id v65 = [*(id *)&v38[v53] trailingAnchor];
  id v66 = [*(id *)&v35[v106] trailingAnchor];
  id v67 = [v65 constraintEqualToAnchor:v66 constant:-(a5 * 0.5)];

  *(void *)(v55 + 56) = v67;
  v110[0] = v55;
  specialized Array._endMutation()();
  Class v68 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v108 activateConstraints:v68];

  uint64_t v69 = (objc_class *)type metadata accessor for CARPaletteSelectorView.SelectionRingView();
  long long v70 = (char *)objc_allocWithZone(v69);
  uint64_t v71 = OBJC_IVAR____TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView_shapeLayer;
  id v72 = objc_allocWithZone((Class)CAShapeLayer);
  uint64_t v73 = v70;
  *(void *)&v70[v71] = [v72 init];
  *(double *)&v73[OBJC_IVAR____TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView_strokeWidth] = a6;

  v111.receiver = v73;
  v111.super_class = v69;
  uint64_t v74 = (char *)[super initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v75 = OBJC_IVAR____TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView_shapeLayer;
  uint64_t v76 = *(void **)&v74[OBJC_IVAR____TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView_shapeLayer];
  uint64_t v77 = v74;
  [v76 setLineWidth:a6];
  uint64_t v78 = self;
  id v79 = v76;
  id v80 = [v78 clearColor];
  id v81 = [v80 CGColor];

  [v79 setFillColor:v81];
  id v82 = [v77 layer];
  [v82 addSublayer:*(void *)&v74[v75]];

  sub_10005005C();
  sub_10002D398(&qword_1000AFDC8);
  uint64_t v83 = swift_allocObject();
  *(_OWORD *)(v83 + 16) = xmmword_100072CC0;
  *(void *)(v83 + 32) = type metadata accessor for UITraitUserInterfaceStyle();
  *(void *)(v83 + 40) = &protocol witness table for UITraitUserInterfaceStyle;
  v110[3] = (uint64_t)v69;
  v110[0] = (uint64_t)v77;
  id v84 = v77;
  UIView.registerForTraitChanges(_:target:action:)();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  sub_10002FF84((uint64_t)v110);
  [v84 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v38 addSubview:v84];
  uint64_t v85 = swift_allocObject();
  *(_OWORD *)(v85 + 16) = xmmword_100072210;
  id v86 = [v84 centerXAnchor];
  id v87 = [v38 centerXAnchor];
  id v88 = [v86 constraintEqualToAnchor:v87];

  *(void *)(v85 + 32) = v88;
  id v89 = [v84 centerYAnchor];
  id v90 = [v38 centerYAnchor];
  id v91 = [v89 constraintEqualToAnchor:v90];

  *(void *)(v85 + 40) = v91;
  id v92 = [v84 widthAnchor];
  double v93 = a6 * 4.0;
  id v94 = [v92 constraintEqualToConstant:v93 + a3];

  *(void *)(v85 + 48) = v94;
  id v95 = [v84 heightAnchor];
  id v96 = [v95 constraintEqualToConstant:v93 + a4];

  *(void *)(v85 + 56) = v96;
  v110[0] = v85;
  specialized Array._endMutation()();
  Class v97 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v108 activateConstraints:v97];

  if (v107)
  {
    if (v107 < 1)
    {
      __break(1u);
LABEL_35:
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    swift_retain();
    for (uint64_t i = 0; i != v107; ++i)
    {
      if ((v25 & 0xC000000000000001) != 0) {
        id v99 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v99 = *(id *)(v25 + 8 * i + 32);
      }
      id v100 = v99;
      sub_10004DFA0(v99);
    }
    swift_release();
  }
  swift_release();
  if (!v105) {
    sub_10004E228(v23);
  }
  [v38 layoutIfNeeded:v103];
  sub_10004E540(v104, 0);

  return (uint64_t)v38;
}

uint64_t type metadata accessor for CARThemePaletteSelector.Coordinator()
{
  return self;
}

uint64_t sub_10004CFA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000AFC58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_10004D008()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_delegate];
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((void *)v1 + 4) = 0;
  uint64_t v2 = OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_scrollView;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UIScrollView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v3 = OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10004D1E4()
{
  return 1;
}

void sub_10004D1EC(void *a1, char a2)
{
  uint64_t v5 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v2) + 0xB8))();
  id v6 = [v5 identifier];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  id v10 = [a1 identifier];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  if (v7 == v11 && v9 == v13)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      id v16 = a1;
      unint64_t v17 = swift_bridgeObjectRetain();
      char v18 = sub_100051E48(v17, v16);
      swift_bridgeObjectRelease();

      if (v18)
      {
        sub_10004E540(v16, a2 & 1);
      }
    }
  }
}

id sub_10004D374(uint64_t a1, CGFloat a2, CGFloat a3)
{
  uint64_t v7 = *(void **)&v3[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_scrollView];
  [v7 frame];
  double MinX = CGRectGetMinX(v38);
  [v7 contentOffset];
  CGFloat v10 = MinX - v9;
  [v7 frame];
  double MinY = CGRectGetMinY(v39);
  [v7 contentOffset];
  CGFloat v13 = MinY - v12;
  [v7 contentSize];
  v40.size.width = v14;
  v40.size.height = v15;
  v40.origin.x = v10;
  v40.origin.y = v13;
  v36.x = a2;
  v36.y = a3;
  if (CGRectContainsPoint(v40, v36))
  {
    id v16 = [*(id *)&v3[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView] arrangedSubviews];
    sub_10002F83C(0, &qword_1000AFC80);
    unint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v17 >> 62) {
      goto LABEL_17;
    }
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v18; uint64_t v18 = _CocoaArrayWrapper.endIndex.getter())
    {
      uint64_t v19 = 4;
      while (1)
      {
        id v20 = (v17 & 0xC000000000000001) != 0
            ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
            : *(id *)(v17 + 8 * v19);
        uint64_t v21 = v20;
        uint64_t v22 = v19 - 3;
        if (__OFADD__(v19 - 4, 1)) {
          break;
        }
        [v20 bounds];
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        [v21 convertPoint:v3 fromCoordinateSpace:a2, a3];
        v37.x = v31;
        v37.y = v32;
        v41.origin.x = v24;
        v41.origin.y = v26;
        v41.size.width = v28;
        v41.size.height = v30;
        if (CGRectContainsPoint(v41, v37))
        {
          swift_bridgeObjectRelease_n();
          return v21;
        }

        ++v19;
        if (v22 == v18) {
          goto LABEL_11;
        }
      }
      __break(1u);
LABEL_17:
      swift_bridgeObjectRetain();
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    return v7;
  }
  else
  {
    v35.receiver = v3;
    v35.super_class = (Class)type metadata accessor for CARPaletteSelectorView();
    return [super hitTest:a1 withEvent:a2];
  }
}

uint64_t sub_10004D674()
{
  return (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0xE8))();
}

void sub_10004D748(void *a1)
{
  [a1 contentOffset];
  id v21 = sub_10004E6E8(v2);
  id v3 = [v21 identifier];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  uint64_t v7 = *(uint64_t (**)(void))((swift_isaMask & *v1) + 0xB8);
  uint64_t v8 = (void *)v7();
  id v9 = [v8 identifier];
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;

  if (v4 == v10 && v6 == v12)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v14)
    {
    }
    else
    {
      CGFloat v15 = (void **)((char *)v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_selectedPalette);
      swift_beginAccess();
      id v16 = *v15;
      *CGFloat v15 = v21;
      id v17 = v21;

      (*(void (**)(void *__return_ptr))((swift_isaMask & *v1) + 0xA0))(v25);
      if (v25[3])
      {
        sub_10003DF24((uint64_t)v25, (uint64_t)v22);
        sub_100032F78((uint64_t)v25, &qword_1000AFC58);
        uint64_t v18 = v23;
        uint64_t v19 = v24;
        sub_10003E164(v22, v23);
        id v20 = (void *)v7();
        (*(void (**)(void *, uint64_t, uint64_t))(v19 + 8))(v20, v18, v19);

        sub_10002FF84((uint64_t)v22);
      }
      else
      {

        sub_100032F78((uint64_t)v25, &qword_1000AFC58);
      }
    }
  }
}

void sub_10004DA10(void *a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorPosition + 8)) {
    return;
  }
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorPosition);
  [a1 contentOffset];
  double v5 = v4;
  id v6 = [*(id *)(v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView) arrangedSubviews];
  sub_10002F83C(0, &qword_1000AFC80);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v7 & 0xC000000000000001) != 0)
  {
    id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_6;
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v3 >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_14:
    __break(1u);
    return;
  }
  id v8 = *(id *)(v7 + 8 * v3 + 32);
LABEL_6:
  id v9 = v8;
  swift_bridgeObjectRelease();
  [v9 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v20.origin.x = v11;
  v20.origin.y = v13;
  v20.size.width = v15;
  v20.size.height = v17;
  if (CGRectGetMinX(v20) <= v5) {
    double v18 = *(double *)(v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorSize)
  }
        + *(double *)(v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_pageSpacing);
  else {
    double v18 = 0.0;
  }

  [a1 _setPagingOrigin:v18];
}

void sub_10004DC30(void *a1)
{
  CGFloat v2 = v1;
  id v3 = [a1 view];
  if (v3)
  {
    double v4 = v3;
    [v3 frame];
    CGFloat MinX = CGRectGetMinX(v32);
    id v26 = sub_10004E6E8(MinX);
    id v6 = [v26 identifier];
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    double v10 = *(uint64_t (**)(void))((swift_isaMask & *v2) + 0xB8);
    CGFloat v11 = (void *)v10();
    id v12 = [v11 identifier];
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = v14;

    if (v7 == v13 && v9 == v15)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17)
      {
      }
      else
      {
        double v18 = (void **)((char *)v2 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_selectedPalette);
        swift_beginAccess();
        uint64_t v19 = *v18;
        void *v18 = v26;
        id v20 = v26;

        (*(void (**)(void *__return_ptr))((swift_isaMask & *v2) + 0xA0))(v30);
        if (v30[3])
        {
          sub_10003DF24((uint64_t)v30, (uint64_t)v27);
          sub_100032F78((uint64_t)v30, &qword_1000AFC58);
          uint64_t v21 = v28;
          uint64_t v22 = v29;
          sub_10003E164(v27, v28);
          uint64_t v23 = (void *)v10();
          (*(void (**)(void *, uint64_t, uint64_t))(v22 + 8))(v23, v21, v22);

          sub_10002FF84((uint64_t)v27);
        }
        else
        {
          sub_100032F78((uint64_t)v30, &qword_1000AFC58);
        }
        [v4 frame];
        double v24 = CGRectGetMinX(v33);
        double v25 = *(void **)((char *)v2 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_scrollView);
        [v25 contentOffset];
        [v25 setContentOffset:1 animated:v24];
      }
    }
  }
}

void sub_10004DFA0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for CARPaletteSelectorView.Swatch();
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (void *)((char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v7 = swift_getKeyPath();
  sub_10002D398(&qword_1000AEB50);
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)v7 + *(int *)(v5 + 28)) = (uint64_t)a1;
  uint64_t v8 = (char *)v7 + *(int *)(v5 + 32);
  id v9 = a1;
  *(_DWORD *)uint64_t v8 = static HierarchicalShapeStyle.primary.getter();
  *((_WORD *)v8 + 2) = 256;
  id v10 = objc_allocWithZone((Class)sub_10002D398(&qword_1000AFDC0));
  CGFloat v11 = (void *)_UIHostingView.init(rootView:)();
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v2 action:"didTapPaletteWithSender:"];
  [v11 addGestureRecognizer:v12];

  [*(id *)(v2 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView) addArrangedSubview:v11];
  uint64_t v13 = self;
  sub_10002D398((uint64_t *)&unk_1000AFA30);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100072CD0;
  id v15 = [v11 widthAnchor];
  uint64_t v16 = v2 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_pageSize;
  id v17 = [v15 constraintEqualToConstant:*(double *)(v2 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_pageSize)];

  *(void *)(v14 + 32) = v17;
  id v18 = [v11 heightAnchor];
  id v19 = [v18 constraintEqualToConstant:*(double *)(v16 + 8)];

  *(void *)(v14 + 40) = v19;
  v21[1] = v14;
  specialized Array._endMutation()();
  sub_10002F83C(0, (unint64_t *)&qword_1000AF2E0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v13 activateConstraints:isa];
}

void sub_10004E228(uint64_t a1)
{
  id v3 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [v3 layer];
  uint64_t v5 = v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorSize;
  double v6 = *(double *)(v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorSize);
  [v4 setCornerRadius:v6 * 0.5];

  id v7 = objc_allocWithZone((Class)UIColor);
  v17[4] = sub_10004E4D4;
  v17[5] = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_100050820;
  void v17[3] = &unk_1000931B8;
  uint64_t v8 = _Block_copy(v17);
  id v9 = [v7 initWithDynamicProvider:v8];
  _Block_release(v8);
  swift_release();
  [v3 setBackgroundColor:v9];

  [*(id *)(v1 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView) insertArrangedSubview:v3 atIndex:a1];
  id v10 = self;
  sub_10002D398((uint64_t *)&unk_1000AFA30);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100072CD0;
  id v12 = [v3 widthAnchor];
  id v13 = [v12 constraintEqualToConstant:v6];

  *(void *)(v11 + 32) = v13;
  id v14 = [v3 heightAnchor];
  id v15 = [v14 constraintEqualToConstant:*(double *)(v5 + 8)];

  *(void *)(v11 + 40) = v15;
  v17[0] = v11;
  specialized Array._endMutation()();
  sub_10002F83C(0, (unint64_t *)&qword_1000AF2E0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v10 activateConstraints:isa];
}

id sub_10004E4D4(void *a1)
{
  id v1 = [a1 userInterfaceStyle];
  uint64_t v2 = self;
  id v3 = &selRef_whiteColor;
  if (v1 != (id)2) {
    id v3 = &selRef_systemGray2Color;
  }
  id v4 = [v2 *v3];

  return v4;
}

void sub_10004E540(void *a1, char a2)
{
  id v4 = a1;
  unint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_100051CA4(v5, v4);
  char v8 = v7;
  swift_bridgeObjectRelease();

  if (v8) {
    goto LABEL_14;
  }
  uint64_t v9 = (v6 >= *(void *)(v2 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorPosition)) & ~*(unsigned __int8 *)(v2 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorPosition + 8);
  id v10 = [*(id *)(v2 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView) arrangedSubviews];
  sub_10002F83C(0, &qword_1000AFC80);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v12 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
    __break(1u);
    goto LABEL_11;
  }
  if ((v11 & 0xC000000000000001) != 0)
  {
LABEL_11:
    id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_7;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v12 >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    return;
  }
  id v13 = *(id *)(v11 + 8 * v12 + 32);
LABEL_7:
  id v16 = v13;
  swift_bridgeObjectRelease();
  [v16 frame];
  double MinX = CGRectGetMinX(v18);
  id v15 = *(void **)(v2 + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_scrollView);
  [v15 contentOffset];
  [v15 setContentOffset:a2 & 1 animated:MinX];
}

id sub_10004E6E8(CGFloat a1)
{
  double v5 = 0.0;
  if (v2[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorPosition + 8]) {
    goto LABEL_8;
  }
  unint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorPosition];
  id v3 = [*(id *)&v2[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView] arrangedSubviews];
  sub_10002F83C(0, &qword_1000AFC80);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v7 & 0xC000000000000001) != 0) {
    goto LABEL_43;
  }
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    return (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  if (v6 >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_45;
  }
  for (id i = *(id *)(v7 + 8 * v6 + 32); ; id i = (id)specialized _ArrayBuffer._getElementSlowPath(_:)())
  {
    unint64_t v1 = (unint64_t)i;
    swift_bridgeObjectRelease();
    [(id)v1 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v27.origin.x = v10;
    v27.origin.y = v12;
    v27.size.width = v14;
    v27.size.height = v16;
    if (CGRectGetMinX(v27) <= a1) {
      double v5 = *(double *)&v2[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_separatorSize]
    }
         + *(double *)&v2[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_pageSpacing];
LABEL_8:
    [*(id *)&v2[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_scrollView] frame];
    a1 = floor((a1 - v5) / CGRectGetWidth(v28));
    if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    if (a1 <= -9.22337204e18) {
      goto LABEL_34;
    }
    if (a1 >= 9.22337204e18) {
      goto LABEL_35;
    }
    unint64_t v1 = *(void *)&v2[OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_palettes];
    id v3 = (id)(v1 >> 62);
    if (!(v1 >> 62))
    {
      uint64_t v17 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v18 = v17 - 1;
      if (__OFSUB__(v17, 1)) {
        goto LABEL_38;
      }
      goto LABEL_13;
    }
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v18 = v25 - 1;
    if (__OFSUB__(v25, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
LABEL_13:
    if (v18 >= ((uint64_t)a1 & ~((uint64_t)a1 >> 63))) {
      unint64_t v19 = (uint64_t)a1 & ~((uint64_t)a1 >> 63);
    }
    else {
      unint64_t v19 = v18;
    }
    id result = [v2 effectiveUserInterfaceLayoutDirection];
    if (!result)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        goto LABEL_46;
      }
      if ((v19 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v19 < *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        uint64_t v21 = (char *)(v1 + 8 * v19);
        goto LABEL_30;
      }
      __break(1u);
      return result;
    }
    if (v3)
    {
      swift_bridgeObjectRetain();
      uint64_t v2 = (unsigned char *)_CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v2 = *(unsigned char **)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v22 = &v2[-v19];
    if (__OFSUB__(v2, v19)) {
      goto LABEL_39;
    }
    uint64_t v23 = v22 - 1;
    if (__OFSUB__(v22, 1)) {
      goto LABEL_40;
    }
    if ((v1 & 0xC000000000000001) != 0) {
      goto LABEL_46;
    }
    if (((unint64_t)v23 & 0x8000000000000000) != 0) {
      goto LABEL_41;
    }
    if ((unint64_t)v23 < *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      break;
    }
LABEL_42:
    __break(1u);
LABEL_43:
    ;
  }
  uint64_t v21 = (char *)(v1 + 8 * (void)v23);
LABEL_30:
  double v24 = (void *)*((void *)v21 + 4);

  return v24;
}

uint64_t sub_10004EA0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v49 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v47 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  id v46 = &v34[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = type metadata accessor for ColorScheme();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = &v34[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  double v9 = &v34[-v8];
  uint64_t v45 = sub_10002D398(&qword_1000AFE70);
  uint64_t v10 = __chkstk_darwin(v45);
  CGFloat v12 = &v34[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  id v44 = &v34[-v13];
  sub_10004EED4(v1, (uint64_t)v72);
  long long v39 = v72[1];
  long long v40 = v72[0];
  uint64_t v38 = v73;
  uint64_t v41 = v74;
  uint64_t v36 = v75;
  int v37 = v76;
  uint64_t v14 = static Alignment.center.getter();
  uint64_t v42 = v15;
  uint64_t v43 = v14;
  unsigned int v35 = static HierarchicalShapeStyle.primary.getter();
  sub_10002CFF4((uint64_t)v9);
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v7, enum case for ColorScheme.dark(_:), v3);
  char v16 = static ColorScheme.== infix(_:_:)();
  uint64_t v17 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
  v17(v7, v3);
  v17(v9, v3);
  if (v16) {
    float v18 = 0.1;
  }
  else {
    float v18 = 0.15;
  }
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  double v19 = v77;
  uint64_t v20 = v79;
  uint64_t v21 = v80;
  uint64_t v22 = v81;
  uint64_t v23 = static Alignment.center.getter();
  uint64_t v25 = v24;
  uint64_t KeyPath = swift_getKeyPath();
  v62[0] = v40;
  v62[1] = v39;
  *(void *)&long long v63 = v38;
  BYTE12(v63) = v36;
  DWORD2(v63) = v41;
  BYTE13(v63) = v37;
  *(double *)&long long v64 = v19 * 0.5;
  *((double *)&v64 + 1) = v19;
  *(void *)&long long v65 = v78;
  *((void *)&v65 + 1) = v20;
  *(void *)&long long v66 = v21;
  *((void *)&v66 + 1) = v22;
  *(void *)&long long v67 = __PAIR64__(LODWORD(v18), v35);
  WORD4(v67) = 256;
  *(void *)&long long v68 = v23;
  *((void *)&v68 + 1) = v25;
  uint64_t v69 = KeyPath;
  uint64_t v70 = 0;
  *(void *)&long long v71 = v43;
  *((void *)&v71 + 1) = v42;
  long long v58 = v67;
  long long v59 = v68;
  long long v60 = (unint64_t)KeyPath;
  long long v61 = v71;
  long long v54 = v63;
  long long v55 = v64;
  long long v56 = v65;
  long long v57 = v66;
  long long v52 = v40;
  long long v53 = v39;
  id v27 = [*(id *)(v1 + *(int *)(type metadata accessor for CARPaletteSelectorView.Swatch() + 20)) displayName];
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v30 = v29;

  uint64_t v50 = v28;
  uint64_t v51 = v30;
  sub_10002D398(&qword_1000AFE78);
  sub_100052C3C();
  sub_10002F7C8();
  View.accessibilityLabel<A>(_:)();
  swift_bridgeObjectRelease();
  sub_10005308C((uint64_t)v62);
  uint64_t v31 = (uint64_t)v44;
  ModifiedContent<>.accessibilityIdentifier(_:)();
  sub_100032F78((uint64_t)v12, &qword_1000AFE70);
  CGRect v32 = v46;
  static AccessibilityChildBehavior.ignore.getter();
  sub_100053144();
  View.accessibilityElement(children:)();
  (*(void (**)(unsigned char *, uint64_t))(v47 + 8))(v32, v49);
  return sub_100032F78(v31, &qword_1000AFE70);
}

double sub_10004EED4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Image.ResizingMode();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v57[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for CARPaletteSelectorView.Swatch();
  double v9 = *(void **)(a1 + *(int *)(v8 + 20));
  id v10 = [v9 colorScheme];
  id v11 = [v10 colorScheme];

  switch((unint64_t)v11)
  {
    case 0uLL:
    case 4uLL:
      CGFloat v12 = (unsigned int *)(a1 + *(int *)(v8 + 24));
      uint64_t v13 = *v12;
      int v14 = *((unsigned __int8 *)v12 + 4);
      int v15 = *((unsigned __int8 *)v12 + 5);
      if (v14) {
        char v16 = &_mh_execute_header;
      }
      else {
        char v16 = 0;
      }
      unint64_t v17 = (unint64_t)v16 | v13;
      BOOL v18 = v15 == 0;
      uint64_t v19 = 0x10000000000;
      if (v18) {
        uint64_t v19 = 0;
      }
      *(void *)long long v63 = v17 | v19;
      *(void *)&v63[8] = 0;
      *(_WORD *)&v63[16] = 0;
      v63[18] = 1;
      sub_10002D398(&qword_1000AFF20);
      sub_10002D398(&qword_1000AFF00);
      sub_100053018();
      sub_10002F5CC(&qword_1000AFEF8, &qword_1000AFF00);
      _ConditionalContent<>.init(storage:)();
      uint64_t v20 = 0x10000;
      if (!BYTE2(v66)) {
        uint64_t v20 = 0;
      }
      uint64_t v67 = 0;
      unsigned long long v66 = (unint64_t)v20 | (unsigned __int128)(unsigned __int16)v66;
      unsigned int v68 = 0;
      unsigned __int8 v69 = 1;
      sub_10002D398(&qword_1000AFEC0);
      sub_10002D398(&qword_1000AFF10);
      sub_100052E14();
      sub_100052F74(&qword_1000AFF08, &qword_1000AFF10, (void (*)(void))sub_100053018);
      _ConditionalContent<>.init(storage:)();
      if (v62) {
        uint64_t v21 = &_mh_execute_header;
      }
      else {
        BYTE4(v21) = 0;
      }
      *(_OWORD *)long long v63 = v58;
      *(_OWORD *)&v63[16] = v59;
      *(void *)&v63[32] = v60;
      *(_DWORD *)&v63[40] = v61;
      v63[44] = BYTE4(v21);
      char v64 = 0;
      sub_10002D398(&qword_1000AFEB0);
      sub_100052D74();
      goto LABEL_51;
    case 1uLL:
      id v29 = [v9 colorScheme];
      id v30 = [v29 color];

      if (v30) {
        uint64_t v31 = Color.init(_:)();
      }
      else {
        uint64_t v31 = static Color.primary.getter();
      }
      *(void *)&long long v65 = v31;
      *((void *)&v65 + 1) = 256;
      uint64_t v67 = 0;
      unsigned long long v66 = 0uLL;
      unsigned int v68 = 0;
      swift_retain();
      sub_10002D398(&qword_1000AFED0);
      sub_10002D398(&qword_1000AFEE0);
      sub_10002F5CC(&qword_1000AFEC8, &qword_1000AFED0);
      sub_100052EB4();
      _ConditionalContent<>.init(storage:)();
      if (v63[43]) {
        int v41 = 0x1000000;
      }
      else {
        int v41 = 0;
      }
      long long v65 = *(_OWORD *)v63;
      unsigned long long v66 = *(_OWORD *)&v63[16];
      uint64_t v67 = *(void *)&v63[32];
      unsigned int v68 = v41 | *(unsigned __int16 *)&v63[40] | (v63[42] << 16);
      unsigned __int8 v69 = 0;
      sub_10002D398(&qword_1000AFEC0);
      sub_10002D398(&qword_1000AFF10);
      sub_100052E14();
      sub_100052F74(&qword_1000AFF08, &qword_1000AFF10, (void (*)(void))sub_100053018);
      _ConditionalContent<>.init(storage:)();
      uint64_t v42 = &_mh_execute_header;
      if (!v62) {
        BYTE4(v42) = 0;
      }
      *(_OWORD *)long long v63 = v58;
      *(_OWORD *)&v63[16] = v59;
      *(void *)&v63[32] = v60;
      *(_DWORD *)&v63[40] = v61;
      v63[44] = BYTE4(v42);
      char v64 = 0;
      sub_10002D398(&qword_1000AFEB0);
      sub_10002D398(&qword_1000AFF00);
      sub_100052D74();
      sub_10002F5CC(&qword_1000AFEF8, &qword_1000AFF00);
      goto LABEL_37;
    case 2uLL:
      id v32 = [v9 colorScheme];
      id v33 = [v32 linearGradient];

      if (v33)
      {
        id v34 = [v33 colors];
        sub_10002F83C(0, &qword_1000AFC88);
        unint64_t v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        id v36 = [v33 locations];
        sub_10002F83C(0, (unint64_t *)&unk_1000AFC90);
        unint64_t v37 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        sub_100050318(v35, v37);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        [v33 startPoint];
        [v33 startPoint];
        [v33 endPoint];
        [v33 endPoint];
        Gradient.init(stops:)();
        LinearGradient.init(gradient:startPoint:endPoint:)();
        *(void *)long long v63 = v71;
        *(_OWORD *)&v63[8] = v72;
        *(_OWORD *)&v63[24] = v73;
        *(_WORD *)&v63[40] = 256;
        v63[42] = 0;
        swift_bridgeObjectRetain();
        sub_10002D398(&qword_1000AFEF0);
        sub_10002D398(&qword_1000AFF00);
        sub_10002F5CC(&qword_1000AFEE8, &qword_1000AFEF0);
        sub_10002F5CC(&qword_1000AFEF8, &qword_1000AFF00);
        _ConditionalContent<>.init(storage:)();

        sub_100053218((uint64_t)&v71);
      }
      else
      {
        uint64_t v43 = (unsigned int *)(a1 + *(int *)(v8 + 24));
        uint64_t v44 = *v43;
        int v45 = *((unsigned __int8 *)v43 + 4);
        int v46 = *((unsigned __int8 *)v43 + 5);
        BOOL v18 = v45 == 0;
        uint64_t v47 = &_mh_execute_header;
        if (v18) {
          uint64_t v47 = 0;
        }
        unint64_t v48 = (unint64_t)v47 | v44;
        BOOL v18 = v46 == 0;
        uint64_t v49 = 0x10000000000;
        if (v18) {
          uint64_t v49 = 0;
        }
        *(void *)long long v63 = v48 | v49;
        memset(&v63[8], 0, 34);
        v63[42] = 1;
        sub_10002D398(&qword_1000AFEF0);
        sub_10002D398(&qword_1000AFF00);
        sub_10002F5CC(&qword_1000AFEE8, &qword_1000AFEF0);
        sub_10002F5CC(&qword_1000AFEF8, &qword_1000AFF00);
        _ConditionalContent<>.init(storage:)();
      }
      BYTE2(v68) = BYTE2(v68) != 0;
      HIBYTE(v68) = 1;
      sub_10002D398(&qword_1000AFED0);
      sub_10002D398(&qword_1000AFEE0);
      sub_10002F5CC(&qword_1000AFEC8, &qword_1000AFED0);
      sub_100052EB4();
      _ConditionalContent<>.init(storage:)();
      if (v63[43]) {
        int v50 = 0x1000000;
      }
      else {
        int v50 = 0;
      }
      long long v65 = *(_OWORD *)v63;
      unsigned long long v66 = *(_OWORD *)&v63[16];
      uint64_t v67 = *(void *)&v63[32];
      unsigned int v68 = v50 | *(unsigned __int16 *)&v63[40] | (v63[42] << 16);
      unsigned __int8 v69 = 0;
      sub_10002D398(&qword_1000AFEC0);
      sub_10002D398(&qword_1000AFF10);
      sub_100052E14();
      sub_100052F74(&qword_1000AFF08, &qword_1000AFF10, (void (*)(void))sub_100053018);
      _ConditionalContent<>.init(storage:)();
      uint64_t v51 = &_mh_execute_header;
      if (!v62) {
        BYTE4(v51) = 0;
      }
      *(_OWORD *)long long v63 = v58;
      *(_OWORD *)&v63[16] = v59;
      *(void *)&v63[32] = v60;
      *(_DWORD *)&v63[40] = v61;
      v63[44] = BYTE4(v51);
      char v64 = 0;
      sub_10002D398(&qword_1000AFEB0);
      sub_10002D398(&qword_1000AFF00);
      sub_100052D74();
      sub_10002F5CC(&qword_1000AFEF8, &qword_1000AFF00);
      goto LABEL_51;
    case 3uLL:
      Image.init(_:bundle:)();
      (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
      uint64_t v38 = Image.resizable(capInsets:resizingMode:)();
      swift_release();
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
      *(void *)long long v63 = v38;
      *(void *)&v63[8] = 0;
      *(_WORD *)&v63[16] = 1;
      v63[18] = 0;
      swift_retain();
      sub_10002D398(&qword_1000AFF20);
      sub_10002D398(&qword_1000AFF00);
      sub_100053018();
      sub_10002F5CC(&qword_1000AFEF8, &qword_1000AFF00);
      _ConditionalContent<>.init(storage:)();
      uint64_t v39 = 0x10000;
      if (!BYTE2(v66)) {
        uint64_t v39 = 0;
      }
      uint64_t v67 = 0;
      unsigned long long v66 = (unint64_t)v39 | (unsigned __int128)(unsigned __int16)v66;
      unsigned int v68 = 0;
      unsigned __int8 v69 = 1;
      sub_10002D398(&qword_1000AFEC0);
      sub_10002D398(&qword_1000AFF10);
      sub_100052E14();
      sub_100052F74(&qword_1000AFF08, &qword_1000AFF10, (void (*)(void))sub_100053018);
      _ConditionalContent<>.init(storage:)();
      long long v40 = &_mh_execute_header;
      if (!v62) {
        BYTE4(v40) = 0;
      }
      *(_OWORD *)long long v63 = v58;
      *(_OWORD *)&v63[16] = v59;
      *(void *)&v63[32] = v60;
      *(_DWORD *)&v63[40] = v61;
      v63[44] = BYTE4(v40);
      char v64 = 0;
      sub_10002D398(&qword_1000AFEB0);
      sub_100052D74();
LABEL_37:
      _ConditionalContent<>.init(storage:)();
      swift_release();
      break;
    default:
      uint64_t v22 = (unsigned int *)(a1 + *(int *)(v8 + 24));
      uint64_t v23 = *v22;
      int v24 = *((unsigned __int8 *)v22 + 4);
      int v25 = *((unsigned __int8 *)v22 + 5);
      BOOL v18 = v24 == 0;
      id v26 = &_mh_execute_header;
      if (v18) {
        id v26 = 0;
      }
      unint64_t v27 = (unint64_t)v26 | v23;
      BOOL v18 = v25 == 0;
      uint64_t v28 = 0x10000000000;
      if (v18) {
        uint64_t v28 = 0;
      }
      *(void *)long long v63 = v27 | v28;
      memset(&v63[8], 0, 37);
      char v64 = 1;
      sub_10002D398(&qword_1000AFEB0);
      sub_10002D398(&qword_1000AFF00);
      sub_100052D74();
      sub_10002F5CC(&qword_1000AFEF8, &qword_1000AFF00);
LABEL_51:
      _ConditionalContent<>.init(storage:)();
      break;
  }
  double result = *(double *)&v65;
  unsigned long long v53 = v66;
  uint64_t v54 = v67;
  unint64_t v55 = v68 | ((unint64_t)v69 << 32);
  char v56 = v70;
  *(_OWORD *)a2 = v65;
  *(_OWORD *)(a2 + 16) = v53;
  *(void *)(a2 + 32) = v54;
  *(_DWORD *)(a2 + 40) = v55;
  *(unsigned char *)(a2 + 44) = BYTE4(v55);
  *(unsigned char *)(a2 + 45) = v56;
  return result;
}

double sub_10004FC74@<D0>(uint64_t a1@<X8>)
{
  id v3 = [v1 colors];
  sub_10002F83C(0, &qword_1000AFC88);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v5 = [v1 locations];
  sub_10002F83C(0, (unint64_t *)&unk_1000AFC90);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100050318(v4, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  [v1 startPoint];
  [v1 startPoint];
  [v1 endPoint];
  [v1 endPoint];
  Gradient.init(stops:)();
  LinearGradient.init(gradient:startPoint:endPoint:)();
  double result = *(double *)&v8;
  *(_OWORD *)a1 = v8;
  *(_OWORD *)(a1 + 16) = v9;
  *(void *)(a1 + 32) = v10;
  return result;
}

id sub_10004FDF4()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for CARPaletteSelectorView.SelectionRingView();
  [super layoutSubviews];
  [v0 bounds];
  double MidX = CGRectGetMidX(v13);
  [v0 bounds];
  double MidY = CGRectGetMidY(v14);
  double v3 = *(double *)&v0[OBJC_IVAR____TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView_strokeWidth]
     * 0.5;
  [v0 bounds];
  double Width = CGRectGetWidth(v15);
  [v0 bounds];
  double Height = CGRectGetHeight(v16);
  if (Height >= Width) {
    double Height = Width;
  }
  double v6 = Height * 0.5 - v3;
  if (v6 > v3) {
    double v7 = v6;
  }
  else {
    double v7 = v3;
  }
  long long v8 = *(void **)&v0[OBJC_IVAR____TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView_shapeLayer];
  id v9 = [self bezierPathWithArcCenter:1, MidX, MidY, v7, 0.0, 6.28318531];
  id v10 = [v9 CGPath];

  [v8 setPath:v10];
  [v0 frame];
  return [v8 setFrame:0.0, 0.0];
}

void sub_10005005C()
{
  id v1 = [v0 traitCollection];
  id v2 = [v1 userInterfaceStyle];

  double v3 = self;
  unint64_t v4 = &selRef_whiteColor;
  if (v2 != (id)2) {
    unint64_t v4 = &selRef_systemGray2Color;
  }
  id v5 = [v3 *v4];
  double v6 = *(void **)&v0[OBJC_IVAR____TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView_shapeLayer];
  id v7 = [v5 CGColor];
  [v6 setStrokeColor:v7];
}

id sub_1000501A4()
{
  return sub_10005025C(type metadata accessor for CARPaletteSelectorView.SelectionRingView);
}

void sub_1000501CC()
{
}

void sub_100050218()
{
}

id sub_100050244()
{
  return sub_10005025C(type metadata accessor for CARPaletteSelectorView);
}

id sub_10005025C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

void sub_100050318(unint64_t a1, unint64_t a2)
{
  unint64_t v36 = a1 >> 62;
  if (!(a1 >> 62))
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_3;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
LABEL_3:
    unint64_t v40 = a2 >> 62;
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v7 = v6 >= v5 ? v5 : v6;
    int64_t v38 = v7 & ~(v7 >> 63);
    sub_100051840(0, v38, 0);
    if (v7 < 0) {
      break;
    }
    if (!v7)
    {
      id v2 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
      unint64_t v41 = a1 & 0xC000000000000001;
      uint64_t v8 = a2 & 0xFFFFFFFFFFFFFF8;
      unint64_t v39 = a2 & 0xC000000000000001;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_33;
    }
    if (v36)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v37 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    unint64_t v9 = 0;
    unint64_t v41 = a1 & 0xC000000000000001;
    uint64_t v8 = a2 & 0xFFFFFFFFFFFFFF8;
    unint64_t v39 = a2 & 0xC000000000000001;
    uint64_t v10 = v7;
    while (v38 != v9)
    {
      if (v37 == v9) {
        goto LABEL_59;
      }
      if (v41)
      {
        id v11 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (v9 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_66;
        }
        id v11 = *(id *)(a1 + 8 * v9 + 32);
      }
      id v2 = v11;
      if (v40)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v12 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v9 == v12) {
        goto LABEL_70;
      }
      if (v39)
      {
        id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (v9 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_60;
        }
        id v13 = *(id *)(a2 + 8 * v9 + 32);
      }
      CGRect v14 = v13;
      CGRect v15 = v2;
      Color.init(_:)();
      [v14 floatValue];
      id v2 = (void *)Gradient.Stop.init(color:location:)();
      uint64_t v17 = v16;

      unint64_t v19 = _swiftEmptyArrayStorage[2];
      unint64_t v18 = _swiftEmptyArrayStorage[3];
      if (v19 >= v18 >> 1) {
        sub_100051840((char *)(v18 > 1), v19 + 1, 1);
      }
      ++v9;
      _swiftEmptyArrayStorage[2] = v19 + 1;
      uint64_t v20 = &_swiftEmptyArrayStorage[2 * v19];
      v20[4] = v2;
      v20[5] = v17;
      if (v10 == v9)
      {
        uint64_t v7 = v10;
        id v2 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
LABEL_33:
        uint64_t v21 = v7 + 4;
        if (!v36)
        {
LABEL_34:
          uint64_t v22 = v2[2];
          goto LABEL_36;
        }
        while (1)
        {
          swift_bridgeObjectRetain();
          uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
LABEL_36:
          unint64_t v23 = v21 - 4;
          if (v21 - 4 == v22)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return;
          }
          if (v41)
          {
            id v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if ((v23 & 0x8000000000000000) != 0) {
              goto LABEL_61;
            }
            if (v23 >= v2[2]) {
              goto LABEL_62;
            }
            id v24 = *(id *)(a1 + 8 * v21);
          }
          int v25 = v24;
          if (__OFADD__(v23, 1)) {
            goto LABEL_63;
          }
          if (v40)
          {
            swift_bridgeObjectRetain();
            uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (v23 == v26)
            {
LABEL_57:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              return;
            }
          }
          else if (v23 == *(void *)(v8 + 16))
          {
            goto LABEL_57;
          }
          if (v39)
          {
            id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if ((v23 & 0x8000000000000000) != 0) {
              goto LABEL_64;
            }
            if (v23 >= *(void *)(v8 + 16)) {
              goto LABEL_65;
            }
            id v27 = *(id *)(a2 + 8 * v21);
          }
          uint64_t v28 = v27;
          id v29 = v25;
          Color.init(_:)();
          [v28 floatValue];
          uint64_t v30 = Gradient.Stop.init(color:location:)();
          uint64_t v32 = v31;

          unint64_t v34 = _swiftEmptyArrayStorage[2];
          unint64_t v33 = _swiftEmptyArrayStorage[3];
          if (v34 >= v33 >> 1) {
            sub_100051840((char *)(v33 > 1), v34 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v34 + 1;
          unint64_t v35 = &_swiftEmptyArrayStorage[2 * v34];
          v35[4] = v30;
          v35[5] = v32;
          ++v21;
          if (!v36) {
            goto LABEL_34;
          }
        }
      }
    }
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
  }
  __break(1u);
LABEL_70:

  __break(1u);
}

id sub_100050820(uint64_t a1, void *a2)
{
  objc_super v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_100050888(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_100051C6C(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1000509FC(v6);
  return specialized ContiguousArray._endMutation()();
}

void *sub_100050904(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      objc_super v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_10002D398((uint64_t *)&unk_1000AFA30);
      objc_super v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_100051A9C((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void sub_1000509FC(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  Swift::Int v5 = _minimumMergeRunLength(_:)(v4);
  if (v5 >= v4)
  {
    if (v4 < 0) {
      goto LABEL_147;
    }
    if (v4) {
      sub_10005120C(0, v4, 1, a1);
    }
    return;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_146;
  }
  Swift::Int v7 = v5;
  id v108 = a1;
  if (v4 <= 1)
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v117 = (uint64_t)&_swiftEmptyArrayStorage;
    __dst = (char *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v13 = *((void *)&_swiftEmptyArrayStorage + 2);
      if (v13 < 2) {
        goto LABEL_123;
      }
      goto LABEL_111;
    }
  }
  else
  {
    uint64_t v8 = v6 >> 1;
    sub_10002F83C(0, &qword_1000AFDA0);
    uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    __dst = (char *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v117 = v9;
  }
  Swift::Int v11 = 0;
  uint64_t v12 = *a1;
  uint64_t v109 = *a1 - 8;
  Swift::Int v110 = v7;
  uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v114 = v4;
  uint64_t v116 = *a1;
  while (1)
  {
    Swift::Int v14 = v11++;
    if (v11 < v4)
    {
      CGRect v15 = *(void **)(v12 + 8 * v14);
      id v16 = *(id *)(v12 + 8 * v11);
      id v17 = v15;
      unsigned int v18 = [v16 isProminent];
      if (v18 == [v17 isProminent])
      {
        id v19 = [v16 sortIndex];
        id v20 = [v17 sortIndex];

        Swift::Int v4 = v114;
        unsigned int v112 = (uint64_t)v19 < (uint64_t)v20;
      }
      else
      {
        unsigned int v112 = [v16 isProminent];
      }
      Swift::Int v21 = v14 + 2;
      if (v14 + 2 >= v4)
      {
        uint64_t v12 = v116;
        if (!v112)
        {
LABEL_40:
          Swift::Int v11 = v21;
          goto LABEL_41;
        }
      }
      else
      {
        uint64_t v12 = v116;
        do
        {
          uint64_t v26 = *(void **)(v12 + 8 * v11);
          id v27 = *(id *)(v12 + 8 * v21);
          id v28 = v26;
          unsigned int v29 = [v27 isProminent];
          if (v29 == [v28 isProminent])
          {
            id v22 = [v27 sortIndex];
            id v23 = [v28 sortIndex];

            BOOL v79 = (uint64_t)v22 < (uint64_t)v23;
            uint64_t v12 = v116;
            int v24 = !v79;
            if (((v112 ^ v24) & 1) == 0)
            {
LABEL_28:
              Swift::Int v4 = v114;
              if (!v112) {
                goto LABEL_40;
              }
              goto LABEL_33;
            }
          }
          else
          {
            unsigned int v30 = [v27 isProminent];

            if (v112 != v30) {
              goto LABEL_28;
            }
          }
          Swift::Int v25 = v21 + 1;
          Swift::Int v11 = v21;
          Swift::Int v21 = v25;
          Swift::Int v4 = v114;
        }
        while (v25 < v114);
        Swift::Int v21 = v25;
        if (!v112) {
          goto LABEL_40;
        }
      }
LABEL_33:
      if (v21 < v14) {
        goto LABEL_148;
      }
      if (v14 < v21)
      {
        uint64_t v31 = (uint64_t *)(v109 + 8 * v21);
        Swift::Int v32 = v21;
        Swift::Int v33 = v14;
        unint64_t v34 = (uint64_t *)(v12 + 8 * v14);
        while (1)
        {
          if (v33 != --v32)
          {
            if (!v12) {
              goto LABEL_153;
            }
            uint64_t v35 = *v34;
            *unint64_t v34 = *v31;
            *uint64_t v31 = v35;
          }
          ++v33;
          --v31;
          ++v34;
          if (v33 >= v32) {
            goto LABEL_40;
          }
        }
      }
      goto LABEL_40;
    }
LABEL_41:
    if (v11 < v4)
    {
      if (__OFSUB__(v11, v14)) {
        goto LABEL_145;
      }
      if (v11 - v14 < v110) {
        break;
      }
    }
LABEL_62:
    if (v11 < v14) {
      goto LABEL_140;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_1000516D8(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v48 = *((void *)v10 + 2);
    unint64_t v47 = *((void *)v10 + 3);
    unint64_t v13 = v48 + 1;
    if (v48 >= v47 >> 1) {
      uint64_t v10 = sub_1000516D8((char *)(v47 > 1), v48 + 1, 1, v10);
    }
    *((void *)v10 + 2) = v13;
    uint64_t v49 = v10 + 32;
    int v50 = &v10[16 * v48 + 32];
    *(void *)int v50 = v14;
    *((void *)v50 + 1) = v11;
    if (v48)
    {
      while (1)
      {
        unint64_t v51 = v13 - 1;
        if (v13 >= 4)
        {
          char v56 = &v49[16 * v13];
          uint64_t v57 = *((void *)v56 - 8);
          uint64_t v58 = *((void *)v56 - 7);
          BOOL v62 = __OFSUB__(v58, v57);
          uint64_t v59 = v58 - v57;
          if (v62) {
            goto LABEL_129;
          }
          uint64_t v61 = *((void *)v56 - 6);
          uint64_t v60 = *((void *)v56 - 5);
          BOOL v62 = __OFSUB__(v60, v61);
          uint64_t v54 = v60 - v61;
          char v55 = v62;
          if (v62) {
            goto LABEL_130;
          }
          unint64_t v63 = v13 - 2;
          char v64 = &v49[16 * v13 - 32];
          uint64_t v66 = *(void *)v64;
          uint64_t v65 = *((void *)v64 + 1);
          BOOL v62 = __OFSUB__(v65, v66);
          uint64_t v67 = v65 - v66;
          if (v62) {
            goto LABEL_131;
          }
          BOOL v62 = __OFADD__(v54, v67);
          uint64_t v68 = v54 + v67;
          if (v62) {
            goto LABEL_133;
          }
          if (v68 >= v59)
          {
            id v86 = &v49[16 * v51];
            uint64_t v88 = *(void *)v86;
            uint64_t v87 = *((void *)v86 + 1);
            BOOL v62 = __OFSUB__(v87, v88);
            uint64_t v89 = v87 - v88;
            if (v62) {
              goto LABEL_139;
            }
            BOOL v79 = v54 < v89;
            goto LABEL_99;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v80 = *((void *)v10 + 4);
            uint64_t v81 = *((void *)v10 + 5);
            BOOL v62 = __OFSUB__(v81, v80);
            uint64_t v73 = v81 - v80;
            char v74 = v62;
            goto LABEL_93;
          }
          uint64_t v53 = *((void *)v10 + 4);
          uint64_t v52 = *((void *)v10 + 5);
          BOOL v62 = __OFSUB__(v52, v53);
          uint64_t v54 = v52 - v53;
          char v55 = v62;
        }
        if (v55) {
          goto LABEL_132;
        }
        unint64_t v63 = v13 - 2;
        unsigned __int8 v69 = &v49[16 * v13 - 32];
        uint64_t v71 = *(void *)v69;
        uint64_t v70 = *((void *)v69 + 1);
        BOOL v72 = __OFSUB__(v70, v71);
        uint64_t v73 = v70 - v71;
        char v74 = v72;
        if (v72) {
          goto LABEL_134;
        }
        unsigned __int8 v75 = &v49[16 * v51];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v62 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v62) {
          goto LABEL_136;
        }
        if (__OFADD__(v73, v78)) {
          goto LABEL_138;
        }
        if (v73 + v78 >= v54)
        {
          BOOL v79 = v54 < v78;
LABEL_99:
          if (v79) {
            unint64_t v51 = v63;
          }
          goto LABEL_101;
        }
LABEL_93:
        if (v74) {
          goto LABEL_135;
        }
        id v82 = &v49[16 * v51];
        uint64_t v84 = *(void *)v82;
        uint64_t v83 = *((void *)v82 + 1);
        BOOL v62 = __OFSUB__(v83, v84);
        uint64_t v85 = v83 - v84;
        if (v62) {
          goto LABEL_137;
        }
        if (v85 < v73) {
          goto LABEL_14;
        }
LABEL_101:
        unint64_t v90 = v51 - 1;
        if (v51 - 1 >= v13)
        {
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
          goto LABEL_150;
        }
        if (!v116) {
          goto LABEL_152;
        }
        id v91 = v10;
        id v92 = &v49[16 * v90];
        uint64_t v93 = *(void *)v92;
        id v94 = &v49[16 * v51];
        uint64_t v95 = *((void *)v94 + 1);
        sub_100051348((char *)(v116 + 8 * *(void *)v92), (id *)(v116 + 8 * *(void *)v94), v116 + 8 * v95, __dst);
        if (v1) {
          goto LABEL_123;
        }
        if (v95 < v93) {
          goto LABEL_126;
        }
        if (v51 > *((void *)v91 + 2)) {
          goto LABEL_127;
        }
        *(void *)id v92 = v93;
        *(void *)&v49[16 * v90 + 8] = v95;
        unint64_t v96 = *((void *)v91 + 2);
        if (v51 >= v96) {
          goto LABEL_128;
        }
        uint64_t v10 = v91;
        unint64_t v13 = v96 - 1;
        memmove(&v49[16 * v51], v94 + 16, 16 * (v96 - 1 - v51));
        *((void *)v91 + 2) = v96 - 1;
        if (v96 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_14:
    Swift::Int v4 = v114;
    uint64_t v12 = v116;
    if (v11 >= v114)
    {
      uint64_t v2 = v1;
      if (v13 < 2)
      {
LABEL_123:
        swift_bridgeObjectRelease();
        *(void *)((v117 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
        specialized Array._endMutation()();
        swift_bridgeObjectRelease();
        return;
      }
LABEL_111:
      uint64_t v97 = *v108;
      while (1)
      {
        unint64_t v98 = v13 - 2;
        if (v13 < 2) {
          goto LABEL_141;
        }
        if (!v97) {
          goto LABEL_154;
        }
        id v99 = v10;
        id v100 = v10 + 32;
        uint64_t v101 = *(void *)&v10[16 * v98 + 32];
        uint64_t v102 = *(void *)&v10[16 * v13 + 24];
        sub_100051348((char *)(v97 + 8 * v101), (id *)(v97 + 8 * *(void *)&v100[16 * v13 - 16]), v97 + 8 * v102, __dst);
        if (v2) {
          goto LABEL_123;
        }
        if (v102 < v101) {
          goto LABEL_142;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v99 = sub_1000517D4((uint64_t)v99);
        }
        if (v98 >= *((void *)v99 + 2)) {
          goto LABEL_143;
        }
        id v103 = v99;
        v104 = v99 + 32;
        BOOL v105 = &v99[16 * v98 + 32];
        *(void *)BOOL v105 = v101;
        *((void *)v105 + 1) = v102;
        unint64_t v106 = *((void *)v99 + 2);
        if (v13 > v106) {
          goto LABEL_144;
        }
        uint64_t v10 = v103;
        memmove(&v104[16 * v13 - 16], &v104[16 * v13], 16 * (v106 - v13));
        *((void *)v10 + 2) = v106 - 1;
        unint64_t v13 = v106 - 1;
        if (v106 <= 2) {
          goto LABEL_123;
        }
      }
    }
  }
  if (__OFADD__(v14, v110)) {
    goto LABEL_149;
  }
  if (v14 + v110 >= v4) {
    Swift::Int v36 = v4;
  }
  else {
    Swift::Int v36 = v14 + v110;
  }
  if (v36 >= v14)
  {
    if (v11 != v36)
    {
      uint64_t v107 = v10;
      uint64_t v37 = v109 + 8 * v11;
      Swift::Int v111 = v14;
      Swift::Int v113 = v36;
      do
      {
        int64_t v38 = *(void **)(v12 + 8 * v11);
        uint64_t v39 = v37;
        do
        {
          unint64_t v40 = *(void **)v39;
          id v41 = v38;
          id v42 = v40;
          LODWORD(v40) = [v41 isProminent];
          if (v40 == [v42 isProminent])
          {
            id v44 = [v41 sortIndex];
            id v45 = [v42 sortIndex];

            BOOL v79 = (uint64_t)v44 < (uint64_t)v45;
            uint64_t v12 = v116;
            if (!v79) {
              break;
            }
          }
          else
          {
            unsigned int v43 = [v41 isProminent];

            if (!v43) {
              break;
            }
          }
          if (!v12) {
            goto LABEL_151;
          }
          int v46 = *(void **)v39;
          int64_t v38 = *(void **)(v39 + 8);
          *(void *)uint64_t v39 = v38;
          *(void *)(v39 + 8) = v46;
          v39 -= 8;
          ++v14;
        }
        while (v11 != v14);
        ++v11;
        v37 += 8;
        Swift::Int v14 = v111;
      }
      while (v11 != v113);
      Swift::Int v11 = v113;
      uint64_t v10 = v107;
    }
    goto LABEL_62;
  }
LABEL_150:
  __break(1u);
LABEL_151:
  __break(1u);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
}

void sub_10005120C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    Swift::Int v7 = *(void **)(v5 + 8 * v4);
    uint64_t v8 = a1;
    uint64_t v19 = v6;
    while (1)
    {
      uint64_t v9 = *(void **)v6;
      id v10 = v7;
      id v11 = v9;
      unsigned int v12 = [v10 isProminent];
      if (v12 == [v11 isProminent])
      {
        id v14 = [v10 sortIndex];
        id v15 = [v11 sortIndex];

        if ((uint64_t)v14 >= (uint64_t)v15) {
          goto LABEL_4;
        }
      }
      else
      {
        unsigned int v13 = [v10 isProminent];

        if (!v13) {
          goto LABEL_4;
        }
      }
      if (!v5) {
        break;
      }
      id v16 = *(void **)v6;
      Swift::Int v7 = *(void **)(v6 + 8);
      *(void *)uint64_t v6 = v7;
      *(void *)(v6 + 8) = v16;
      v6 -= 8;
      if (v4 == ++v8)
      {
LABEL_4:
        ++v4;
        uint64_t v6 = v19 + 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
    }
    __break(1u);
  }
}

uint64_t sub_100051348(char *__src, id *a2, unint64_t a3, char *__dst)
{
  __srca = a2;
  unint64_t v5 = a3;
  uint64_t v6 = (void **)__src;
  uint64_t v7 = (char *)a2 - __src;
  uint64_t v8 = (char *)a2 - __src + 7;
  if ((char *)a2 - __src >= 0) {
    uint64_t v8 = (char *)a2 - __src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  if (v9 >= v11 >> 3)
  {
    if (__dst != (char *)a2 || &a2[v12] <= (id *)__dst) {
      memmove(__dst, a2, 8 * v12);
    }
    id v41 = (void **)__dst;
    id v14 = &__dst[8 * v12];
    if (v6 >= __srca || v10 < 8)
    {
LABEL_46:
      unsigned int v13 = v41;
      goto LABEL_48;
    }
    id v27 = (id *)(v5 - 8);
    id v28 = &selRef_vehicleForCertificateSerial_;
    while (1)
    {
      id v42 = (char *)(v27 + 1);
      unsigned int v29 = v14 - 8;
      unsigned int v30 = __srca - 1;
      uint64_t v31 = *(__srca - 1);
      id v32 = *((id *)v14 - 1);
      id v33 = v31;
      unsigned int v34 = [v32 v28[242]];
      if (v34 == [v33 v28[242]])
      {
        id v40 = [v32 sortIndex];
        uint64_t v37 = v14;
        id v38 = [v33 sortIndex];

        BOOL v26 = (uint64_t)v40 < (uint64_t)v38;
        id v14 = v37;
        if (!v26)
        {
LABEL_31:
          unsigned int v30 = (id *)v29;
          if (v42 == v14)
          {
            BOOL v36 = v27 >= (id *)v14;
            id v14 = v29;
            goto LABEL_37;
          }
          id v14 = v29;
          goto LABEL_42;
        }
      }
      else
      {
        unsigned int v35 = [v32 v28[242]];

        if (!v35) {
          goto LABEL_31;
        }
      }
      if (v42 == (char *)__srca)
      {
        BOOL v36 = v27 >= __srca--;
LABEL_37:
        unsigned int v13 = v41;
        id v28 = &selRef_vehicleForCertificateSerial_;
        if (!v36) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
      --__srca;
LABEL_42:
      unsigned int v13 = v41;
      id v28 = &selRef_vehicleForCertificateSerial_;
LABEL_43:
      id *v27 = *v30;
LABEL_44:
      if (__srca <= v6) {
        goto LABEL_48;
      }
      --v27;
      if (v14 <= (char *)v13) {
        goto LABEL_46;
      }
    }
  }
  unsigned int v13 = (void **)__dst;
  if (__dst != __src || &__src[8 * v9] <= __dst) {
    memmove(__dst, __src, 8 * v9);
  }
  id v14 = &__dst[8 * v9];
  if ((unint64_t)__srca < v5 && v7 >= 8)
  {
    do
    {
      id v15 = v14;
      id v16 = *v13;
      id v17 = *__srca;
      id v18 = v16;
      unsigned int v19 = [v17 isProminent];
      if (v19 == [v18 isProminent])
      {
        id v23 = [v17 sortIndex];
        unint64_t v24 = v5;
        id v25 = [v18 sortIndex];

        BOOL v26 = (uint64_t)v23 < (uint64_t)v25;
        unint64_t v5 = v24;
        if (!v26)
        {
LABEL_13:
          Swift::Int v21 = v13;
          BOOL v22 = v6 == v13++;
          if (v22) {
            goto LABEL_15;
          }
LABEL_14:
          *uint64_t v6 = *v21;
          goto LABEL_15;
        }
      }
      else
      {
        unsigned int v20 = [v17 isProminent];

        if (!v20) {
          goto LABEL_13;
        }
      }
      Swift::Int v21 = __srca;
      BOOL v22 = v6 == __srca++;
      if (!v22) {
        goto LABEL_14;
      }
LABEL_15:
      ++v6;
      id v14 = v15;
    }
    while (v13 < (void **)v15 && (unint64_t)__srca < v5);
  }
  __srca = v6;
LABEL_48:
  if (__srca != v13
    || __srca >= (void **)((char *)v13
                         + ((v14 - (char *)v13 + (v14 - (char *)v13 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(__srca, v13, 8 * ((v14 - (char *)v13) / 8));
  }
  return 1;
}

char *sub_1000516D8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10002D398((uint64_t *)&unk_1000AFDD0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unsigned int v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1000517D4(uint64_t a1)
{
  return sub_1000516D8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000517E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100051814()
{
  return EnvironmentValues.foregroundColor.setter();
}

char *sub_100051840(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100051860(a1, a2, a3, *v3);
  *objc_super v3 = result;
  return result;
}

char *sub_100051860(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10002D398(&qword_1000AFD98);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unsigned int v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void (*sub_100051964(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100051A14(v6, a2, a3);
  return sub_1000519CC;
}

void sub_1000519CC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100051A14(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  objc_super v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)objc_super v3 = v4;
    return sub_100051A94;
  }
  __break(1u);
  return result;
}

void sub_100051A94(id *a1)
{
}

uint64_t sub_100051A9C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10002F5CC((unint64_t *)&unk_1000AFDB0, &qword_1000AFDA8);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_10002D398(&qword_1000AFDA8);
            uint64_t v10 = sub_100051964(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_10002F83C(0, &qword_1000AFDA0);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100051C6C(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t type metadata accessor for CARPaletteSelectorView.SelectionRingView()
{
  return self;
}

uint64_t sub_100051CA4(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v5)
  {
    uint64_t v6 = 0;
    uint64_t v20 = v3;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      id v9 = [v7 identifier:v20];
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v12 = v11;

      id v13 = [a2 identifier];
      uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = v14;

      if (v10 == v3 && v12 == v15)
      {

        swift_bridgeObjectRelease_n();
        return v6;
      }
      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17) {
        return v6;
      }
      uint64_t v18 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        break;
      }
      ++v6;
      if (v18 == v5) {
        return 0;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_100051E48(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      unint64_t v21 = v2;
      unint64_t v22 = v2 & 0xC000000000000001;
      uint64_t v4 = 4;
      while (1)
      {
        uint64_t v5 = v4 - 4;
        if (v22)
        {
          id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v6 = *(id *)(v2 + 8 * v4);
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v8 = v3;
        id v9 = v6;
        id v10 = [v6 identifier];
        uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v13 = v12;

        id v14 = [a2 identifier];
        uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v17 = v16;

        BOOL v18 = v11 == v15 && v13 == v17;
        if (v18)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          char v19 = 1;
          goto LABEL_22;
        }
        char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0)
        {
          ++v4;
          uint64_t v3 = v8;
          BOOL v18 = v7 == v8;
          unint64_t v2 = v21;
          if (!v18) {
            continue;
          }
        }
        goto LABEL_22;
      }
    }
  }
  char v19 = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v19 & 1;
}

unint64_t sub_100052014()
{
  unint64_t result = qword_1000B0420;
  if (!qword_1000B0420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0420);
  }
  return result;
}

void destroy for CARThemePaletteSelector(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  unint64_t v2 = *(void **)(a1 + 24);
}

void *initializeWithCopy for CARThemePaletteSelector(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for CARThemePaletteSelector(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)a2[3];
  id v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for CARThemePaletteSelector(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for CARThemePaletteSelector(uint64_t a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *a2;
  swift_release();
  swift_release();
  uint64_t v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  return a1;
}

uint64_t getEnumTagSinglePayload for CARThemePaletteSelector(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CARThemePaletteSelector(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CARThemePaletteSelector()
{
  return &type metadata for CARThemePaletteSelector;
}

void *sub_100052290()
{
  return &protocol witness table for LinearGradient;
}

uint64_t sub_1000522A0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000522C0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  if (!qword_1000AFD88)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000AFD88);
    }
  }
}

unint64_t sub_100052340()
{
  unint64_t result = qword_1000AFD90;
  if (!qword_1000AFD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFD90);
  }
  return result;
}

uint64_t sub_100052394(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000523A4()
{
  return swift_release();
}

uint64_t type metadata accessor for CARPaletteSelectorView.Swatch()
{
  uint64_t result = qword_1000B1718;
  if (!qword_1000B1718) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_1000523F8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v11;
    uint64_t v12 = (char *)a1 + v10;
    uint64_t v13 = (char *)a2 + v10;
    *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
    *((_WORD *)v12 + 2) = *((_WORD *)v13 + 2);
    id v14 = v11;
  }
  return a1;
}

void sub_100052530(uint64_t a1, uint64_t a2)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

void *sub_1000525D0(void *a1, void *a2, uint64_t a3)
{
  sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = *(void **)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = v9;
  uint64_t v10 = (char *)a1 + v8;
  uint64_t v11 = (char *)a2 + v8;
  *(_DWORD *)uint64_t v10 = *(_DWORD *)v11;
  *((_WORD *)v10 + 2) = *((_WORD *)v11 + 2);
  id v12 = v9;
  return a1;
}

void *sub_1000526B8(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100032F78((uint64_t)a1, &qword_1000AEB50);
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)((char *)a2 + v7);
  uint64_t v9 = *(void **)((char *)a1 + v7);
  *(void *)((char *)a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = *(int *)(a3 + 24);
  id v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(_DWORD *)id v12 = *(_DWORD *)v13;
  v12[4] = v13[4];
  v12[5] = v13[5];
  return a1;
}

char *sub_1000527CC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000AEB50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  uint64_t v9 = &a1[v8];
  id v10 = &a2[v8];
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v10;
  *((_WORD *)v9 + 2) = *((_WORD *)v10 + 2);
  return a1;
}

char *sub_1000528B8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100032F78((uint64_t)a1, &qword_1000AEB50);
    uint64_t v6 = sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(void **)&a1[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];

  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = &a1[v10];
  id v12 = &a2[v10];
  *(_DWORD *)uint64_t v11 = *(_DWORD *)v12;
  void v11[4] = v12[4];
  v11[5] = v12[5];
  return a1;
}

uint64_t sub_1000529D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000529E4);
}

uint64_t sub_1000529E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000AEB60);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100052AA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100052ABC);
}

uint64_t sub_100052ABC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10002D398(&qword_1000AEB60);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

void sub_100052B7C()
{
  sub_10002F264();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_100052C20()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100052C3C()
{
  unint64_t result = qword_1000AFE80;
  if (!qword_1000AFE80)
  {
    sub_10002F34C(&qword_1000AFE78);
    sub_100052CDC();
    sub_10002F5CC(&qword_1000AFF28, (uint64_t *)&unk_1000AFF30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFE80);
  }
  return result;
}

unint64_t sub_100052CDC()
{
  unint64_t result = qword_1000AFE88;
  if (!qword_1000AFE88)
  {
    sub_10002F34C(&qword_1000AFE90);
    sub_100052F74(&qword_1000AFE98, &qword_1000AFEA0, (void (*)(void))sub_100052D74);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFE88);
  }
  return result;
}

unint64_t sub_100052D74()
{
  unint64_t result = qword_1000AFEA8;
  if (!qword_1000AFEA8)
  {
    sub_10002F34C(&qword_1000AFEB0);
    sub_100052E14();
    sub_100052F74(&qword_1000AFF08, &qword_1000AFF10, (void (*)(void))sub_100053018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFEA8);
  }
  return result;
}

unint64_t sub_100052E14()
{
  unint64_t result = qword_1000AFEB8;
  if (!qword_1000AFEB8)
  {
    sub_10002F34C(&qword_1000AFEC0);
    sub_10002F5CC(&qword_1000AFEC8, &qword_1000AFED0);
    sub_100052EB4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFEB8);
  }
  return result;
}

unint64_t sub_100052EB4()
{
  unint64_t result = qword_1000AFED8;
  if (!qword_1000AFED8)
  {
    sub_10002F34C(&qword_1000AFEE0);
    sub_10002F5CC(&qword_1000AFEE8, &qword_1000AFEF0);
    sub_10002F5CC(&qword_1000AFEF8, &qword_1000AFF00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFED8);
  }
  return result;
}

uint64_t sub_100052F74(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F34C(a2);
    a3();
    sub_10002F5CC(&qword_1000AFEF8, &qword_1000AFF00);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100053018()
{
  unint64_t result = qword_1000AFF18;
  if (!qword_1000AFF18)
  {
    sub_10002F34C(&qword_1000AFF20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFF18);
  }
  return result;
}

uint64_t sub_10005308C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000530F8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if ((a7 & 1) == 0) {
    return sub_100053108(result, a2, a3, a4, a5, a6, BYTE4(a6) & 1);
  }
  return result;
}

uint64_t sub_100053108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7) {
    return sub_100053138(a1, a2, a3, BYTE2(a3) & 1);
  }
  else {
    return sub_10005311C(a1, a2, a3, a4, a5, a6, BYTE3(a6) & 1);
  }
}

uint64_t sub_10005311C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7) {
    return sub_10005312C(a1, a2, a3, a4, a5, a6, BYTE2(a6) & 1);
  }
  else {
    return swift_release();
  }
}

uint64_t sub_10005312C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if ((a7 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100053138(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0) {
    return swift_release();
  }
  return result;
}

unint64_t sub_100053144()
{
  unint64_t result = qword_1000AFF40;
  if (!qword_1000AFF40)
  {
    sub_10002F34C(&qword_1000AFE70);
    sub_100052C3C();
    sub_1000531C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFF40);
  }
  return result;
}

unint64_t sub_1000531C0()
{
  unint64_t result = qword_1000AFB90;
  if (!qword_1000AFB90)
  {
    type metadata accessor for AccessibilityAttachmentModifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFB90);
  }
  return result;
}

uint64_t sub_100053218(uint64_t a1)
{
  return a1;
}

uint64_t sub_100053244()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000532A0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000532A8()
{
  sub_10002D398(&qword_1000AFF60);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_1000532F8()
{
  return Binding.wrappedValue.setter();
}

void (*sub_10005334C(void *a1))(uint64_t a1, char a2)
{
  char v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  v3[6] = v4;
  v3[7] = v5;
  uint64_t v6 = (void *)v1[3];
  unsigned char v3[8] = v6;
  v3[3] = v4;
  *char v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  sub_100049E98((uint64_t)(v3 + 3));
  swift_retain();
  id v7 = v6;
  v3[9] = sub_10002D398(&qword_1000AFF60);
  Binding.wrappedValue.getter();
  return sub_1000533F4;
}

void sub_1000533F4(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)a1 + 24;
  uint64_t v4 = *(void **)(*(void *)a1 + 40);
  *(void *)(*(void *)a1 + 32) = v4;
  uint64_t v5 = (void *)*((void *)v2 + 8);
  uint64_t v6 = *((void *)v2 + 7);
  *(void *)uint64_t v2 = *((void *)v2 + 6);
  *((void *)v2 + 1) = v6;
  *((void *)v2 + 2) = v5;
  if (a2)
  {
    id v7 = v4;
    Binding.wrappedValue.setter();
    sub_100049EC4(v3);
    swift_release();
  }
  else
  {
    Binding.wrappedValue.setter();
    sub_100049EC4(v3);
    swift_release();
  }

  free(v2);
}

uint64_t sub_1000534B0()
{
  sub_10002D398(&qword_1000AFF60);
  Binding.projectedValue.getter();
  return v1;
}

uint64_t sub_100053504()
{
  sub_10002F83C(0, (unint64_t *)&unk_1000AFA40);
  State.init(wrappedValue:)();
  return v1;
}

uint64_t sub_100053550()
{
  sub_10002D398(&qword_1000AFF68);
  State.init(wrappedValue:)();
  return v1;
}

uint64_t sub_100053594()
{
  return 2;
}

uint64_t sub_10005359C()
{
  State.init(wrappedValue:)();
  return v1;
}

uint64_t sub_1000535D8()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_retain();
  return v1;
}

uint64_t sub_100053608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  sub_10002D398(&qword_1000AFF68);
  State.init(wrappedValue:)();
  LOBYTE(v17) = 1;
  State.init(wrappedValue:)();
  sub_10002D398(&qword_1000AFF60);
  uint64_t result = Binding.wrappedValue.getter();
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(void *)(a7 + 32) = v17;
  *(void *)(a7 + 40) = 0;
  *(unsigned char *)(a7 + 48) = v15;
  *(void *)(a7 + 56) = v16;
  *(unsigned char *)(a7 + 64) = v15;
  *(void *)(a7 + 72) = v16;
  *(void *)(a7 + 80) = a5;
  *(void *)(a7 + 88) = a6;
  return result;
}

uint64_t sub_100053700@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v96 = a1;
  uint64_t v3 = sub_10002D398(&qword_1000AFF70);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_10002D398(&qword_1000AFF78);
  uint64_t v6 = __chkstk_darwin(v91);
  uint64_t v89 = (uint64_t)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v92 = (uint64_t)&v86 - v8;
  uint64_t v9 = sub_10002D398(&qword_1000AFF80);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10002D398(&qword_1000AFF88);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  char v15 = (char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10002D398(&qword_1000AFF90);
  __chkstk_darwin(v16 - 8);
  BOOL v18 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_10002D398(&qword_1000AFF98);
  __chkstk_darwin(v88);
  uint64_t v20 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_10002D398(&qword_1000AFFA0);
  __chkstk_darwin(v93);
  uint64_t v86 = (uint64_t)&v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_10002D398(&qword_1000AFFA8);
  __chkstk_darwin(v94);
  uint64_t v95 = (uint64_t)&v86 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v11 = static VerticalAlignment.center.getter();
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  uint64_t v23 = sub_10002D398(&qword_1000AFFB0);
  sub_100054C00(v2, (uint64_t)&v11[*(int *)(v23 + 44)]);
  char v24 = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  sub_100033C94((uint64_t)v11, (uint64_t)v15, &qword_1000AFF80);
  id v33 = &v15[*(int *)(v13 + 44)];
  *id v33 = v24;
  *((void *)v33 + 1) = v26;
  *((void *)v33 + 2) = v28;
  *((void *)v33 + 3) = v30;
  *((void *)v33 + 4) = v32;
  v33[40] = 0;
  sub_100032F78((uint64_t)v11, &qword_1000AFF80);
  static Alignment.center.getter();
  unint64_t v90 = v18;
  sub_100054880(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v18, 0.0, 1, INFINITY, 0);
  sub_100032F78((uint64_t)v15, &qword_1000AFF88);
  uint64_t v34 = static Alignment.bottom.getter();
  uint64_t v87 = v35;
  *(void *)uint64_t v5 = static VerticalAlignment.center.getter();
  *((void *)v5 + 1) = 0;
  unsigned char v5[16] = 1;
  uint64_t v36 = sub_10002D398(&qword_1000AFFB8);
  sub_100055824(v2, (uint64_t)&v5[*(int *)(v36 + 44)]);
  unsigned __int8 v37 = static Edge.Set.leading.getter();
  unsigned __int8 v38 = static Edge.Set.trailing.getter();
  unsigned __int8 v39 = static Edge.Set.bottom.getter();
  char v40 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v37) {
    char v40 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v38) {
    char v40 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v39) {
    char v40 = Edge.Set.init(rawValue:)();
  }
  uint64_t v41 = (uint64_t)&v20[*(int *)(v88 + 36)];
  EdgeInsets.init(_all:)();
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v50 = v89;
  sub_100033C94((uint64_t)v5, v89, &qword_1000AFF70);
  uint64_t v51 = v50 + *(int *)(v91 + 36);
  *(unsigned char *)uint64_t v51 = v40;
  *(void *)(v51 + 8) = v43;
  *(void *)(v51 + 16) = v45;
  *(void *)(v51 + 24) = v47;
  *(void *)(v51 + 32) = v49;
  *(unsigned char *)(v51 + 40) = 0;
  sub_100032F78((uint64_t)v5, &qword_1000AFF70);
  uint64_t v52 = v50;
  uint64_t v53 = v92;
  sub_100033C30(v52, v92, &qword_1000AFF78);
  sub_100033C30(v53, v41, &qword_1000AFF78);
  uint64_t v54 = (uint64_t *)(v41 + *(int *)(sub_10002D398(&qword_1000AFFC0) + 36));
  uint64_t v55 = v87;
  *uint64_t v54 = v34;
  v54[1] = v55;
  sub_100033C30((uint64_t)v90, (uint64_t)v20, &qword_1000AFF90);
  uint64_t v56 = static Alignment.center.getter();
  uint64_t v58 = v57;
  uint64_t v59 = (_OWORD *)swift_allocObject();
  long long v60 = v2[3];
  v59[3] = v2[2];
  v59[4] = v60;
  long long v61 = v2[5];
  v59[5] = v2[4];
  v59[6] = v61;
  long long v62 = v2[1];
  v59[1] = *v2;
  v59[2] = v62;
  sub_100055DB0((uint64_t)v2);
  uint64_t v63 = static Alignment.center.getter();
  sub_100054A40(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v97, 0.0, 1, INFINITY, 0, v63, v64, (uint64_t)sub_100055DA8, (uint64_t)v59);
  swift_release();
  uint64_t v65 = static SafeAreaRegions.all.getter();
  char v66 = static Edge.Set.all.getter();
  uint64_t v67 = v86;
  sub_100033C94((uint64_t)v20, v86, &qword_1000AFF98);
  uint64_t v68 = v67 + *(int *)(v93 + 36);
  long long v69 = v97[5];
  *(_OWORD *)(v68 + 64) = v97[4];
  *(_OWORD *)(v68 + 80) = v69;
  long long v70 = v97[7];
  *(_OWORD *)(v68 + 96) = v97[6];
  *(_OWORD *)(v68 + 112) = v70;
  long long v71 = v97[1];
  *(_OWORD *)uint64_t v68 = v97[0];
  *(_OWORD *)(v68 + 16) = v71;
  long long v72 = v97[3];
  *(_OWORD *)(v68 + 32) = v97[2];
  *(_OWORD *)(v68 + 48) = v72;
  *(void *)(v68 + 128) = v65;
  *(unsigned char *)(v68 + 136) = v66;
  *(void *)(v68 + 144) = v56;
  *(void *)(v68 + 152) = v58;
  sub_100032F78((uint64_t)v20, &qword_1000AFF98);
  uint64_t v73 = (void (*)())swift_allocObject();
  long long v74 = v2[3];
  *((_OWORD *)v73 + 3) = v2[2];
  *((_OWORD *)v73 + 4) = v74;
  long long v75 = v2[5];
  *((_OWORD *)v73 + 5) = v2[4];
  *((_OWORD *)v73 + 6) = v75;
  long long v76 = v2[1];
  *((_OWORD *)v73 + 1) = *v2;
  *((_OWORD *)v73 + 2) = v76;
  uint64_t v77 = v95;
  sub_100033C94(v67, v95, &qword_1000AFFA0);
  uint64_t v78 = (void (**)())(v77 + *(int *)(v94 + 36));
  *uint64_t v78 = sub_100055E4C;
  v78[1] = v73;
  v78[2] = 0;
  v78[3] = 0;
  sub_100055DB0((uint64_t)v2);
  sub_100032F78(v67, &qword_1000AFFA0);
  BOOL v79 = (_OWORD *)swift_allocObject();
  long long v80 = v2[3];
  v79[3] = v2[2];
  v79[4] = v80;
  long long v81 = v2[5];
  v79[5] = v2[4];
  v79[6] = v81;
  long long v82 = v2[1];
  v79[1] = *v2;
  v79[2] = v82;
  uint64_t v83 = v96;
  sub_100033C94(v77, v96, &qword_1000AFFA8);
  uint64_t v84 = (void *)(v83 + *(int *)(sub_10002D398(&qword_1000AFFC8) + 36));
  *uint64_t v84 = 0;
  v84[1] = 0;
  v84[2] = sub_100055F64;
  v84[3] = v79;
  sub_100055DB0((uint64_t)v2);
  return sub_100032F78(v77, &qword_1000AFFA8);
}

uint64_t sub_100053EF4@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v51 = a3;
  uint64_t v46 = type metadata accessor for ViewAlignedScrollTargetBehavior.LimitBehavior();
  uint64_t v5 = *(void *)(v46 - 8);
  uint64_t v6 = __chkstk_darwin(v46);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v42 - v9;
  uint64_t v11 = type metadata accessor for ViewAlignedScrollTargetBehavior();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v47 = v11;
  uint64_t v48 = v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10002D398(&qword_1000B00F0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v44 = v15;
  uint64_t v45 = v16;
  __chkstk_darwin(v15);
  BOOL v18 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10002D398(&qword_1000B00F8);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v49 = v19;
  uint64_t v50 = v20;
  __chkstk_darwin(v19);
  uint64_t v43 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Axis.Set.horizontal.getter();
  uint64_t v52 = a2;
  uint64_t v53 = a1;
  sub_10002D398(&qword_1000B0100);
  uint64_t v22 = sub_10002F34C(&qword_1000B0108);
  uint64_t v23 = sub_10002F5CC(&qword_1000B0110, &qword_1000B0108);
  uint64_t v58 = v22;
  uint64_t v59 = v23;
  swift_getOpaqueTypeConformance2();
  ScrollView.init(_:showsIndicators:content:)();
  static ViewAlignedScrollTargetBehavior.LimitBehavior.always.getter();
  uint64_t v24 = v46;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v46);
  ViewAlignedScrollTargetBehavior.init(limitBehavior:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v24);
  uint64_t v25 = sub_10002F5CC(&qword_1000B0118, &qword_1000B00F0);
  uint64_t v26 = v43;
  uint64_t v27 = v44;
  uint64_t v28 = v47;
  View.scrollTargetBehavior<A>(_:)();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v14, v28);
  uint64_t v29 = v27;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v27);
  type metadata accessor for MainActor();
  sub_100055DB0((uint64_t)a2);
  uint64_t v30 = static MainActor.shared.getter();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  *(void *)(v31 + 24) = &protocol witness table for MainActor;
  long long v32 = a2[3];
  *(_OWORD *)(v31 + 64) = a2[2];
  *(_OWORD *)(v31 + 80) = v32;
  long long v33 = a2[5];
  *(_OWORD *)(v31 + 96) = a2[4];
  *(_OWORD *)(v31 + 112) = v33;
  long long v34 = a2[1];
  *(_OWORD *)(v31 + 32) = *a2;
  *(_OWORD *)(v31 + 48) = v34;
  sub_100055DB0((uint64_t)a2);
  uint64_t v35 = static MainActor.shared.getter();
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = v35;
  *(void *)(v36 + 24) = &protocol witness table for MainActor;
  long long v37 = a2[3];
  *(_OWORD *)(v36 + 64) = a2[2];
  *(_OWORD *)(v36 + 80) = v37;
  long long v38 = a2[5];
  *(_OWORD *)(v36 + 96) = a2[4];
  *(_OWORD *)(v36 + 112) = v38;
  long long v39 = a2[1];
  *(_OWORD *)(v36 + 32) = *a2;
  *(_OWORD *)(v36 + 48) = v39;
  sub_10002D398(&qword_1000AF7C0);
  Binding.init(get:set:)();
  static UnitPoint.center.getter();
  uint64_t v54 = v29;
  uint64_t v55 = v28;
  uint64_t v56 = v25;
  uint64_t v57 = &protocol witness table for ViewAlignedScrollTargetBehavior;
  swift_getOpaqueTypeConformance2();
  uint64_t v40 = v49;
  View.scrollPosition<A>(id:anchor:)();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v26, v40);
}

uint64_t sub_100054474(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PinnedScrollableViews();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_10002D398(&qword_1000B0108);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  static VerticalAlignment.center.getter();
  int v13 = 0;
  sub_100059130(&qword_1000AFB20, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)();
  sub_10002D398(&qword_1000B0120);
  sub_1000585E8();
  LazyHStack.init(alignment:spacing:pinnedViews:content:)();
  sub_10002F5CC(&qword_1000B0110, &qword_1000B0108);
  View.scrollTargetLayout(isEnabled:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100054688(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GeometryProxy();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  v10[1] = *a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  swift_bridgeObjectRetain();
  sub_10002D398(&qword_1000B0140);
  sub_10002D398(&qword_1000B0138);
  sub_10002F5CC(&qword_1000B0148, &qword_1000B0140);
  sub_100058688(&qword_1000B0130, &qword_1000B0138, (void (*)(void))sub_1000402D4);
  sub_100058880();
  return ForEach<>.init(_:content:)();
}

__n128 sub_100054880@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_100033C94(v13, a9, &qword_1000AFF88);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_10002D398(&qword_1000AFF90) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  _OWORD *v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_100054A40@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    long long v27 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    uint64_t v18 = a16;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(void *)a9 = v18;
  *(void *)(a9 + 8) = a17;
  *(_OWORD *)(a9 + 80) = v33;
  *(_OWORD *)(a9 + 96) = v34;
  *(_OWORD *)(a9 + 112) = v35;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 32) = v30;
  *(_OWORD *)(a9 + 48) = v31;
  *(_OWORD *)(a9 + 64) = v32;

  return swift_retain();
}

unint64_t sub_100054C00@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v93 = a2;
  uint64_t v116 = type metadata accessor for CARSettingButtonStyle();
  __chkstk_darwin(v116);
  uint64_t v4 = (uint64_t *)((char *)&v88 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_10002D398(&qword_1000B0168);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_10002D398(&qword_1000B0170);
  uint64_t v9 = *(void *)(v117 - 8);
  __chkstk_darwin(v117);
  uint64_t v11 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_10002D398(&qword_1000B0178);
  uint64_t v12 = __chkstk_darwin(v115);
  Swift::Int v111 = (char *)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unsigned int v112 = (char *)&v88 - v14;
  uint64_t v114 = sub_10002D398(&qword_1000B0180);
  uint64_t v15 = __chkstk_darwin(v114);
  uint64_t v89 = (uint64_t)&v88 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v105 = (uint64_t)&v88 - v17;
  uint64_t v18 = sub_10002D398(&qword_1000B0188);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v92 = (uint64_t)&v88 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v91 = (uint64_t)&v88 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v88 = (char *)&v88 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v90 = (uint64_t)&v88 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  id v103 = (char *)&v88 - v28;
  __chkstk_darwin(v27);
  uint64_t v113 = (uint64_t)&v88 - v29;
  long long v30 = (_OWORD *)swift_allocObject();
  long long v31 = a1[3];
  v30[3] = a1[2];
  v30[4] = v31;
  long long v32 = a1[5];
  void v30[5] = a1[4];
  v30[6] = v32;
  long long v33 = a1[1];
  v30[1] = *a1;
  v30[2] = v33;
  unint64_t v118 = 0xD000000000000010;
  unint64_t v119 = 0x8000000100081FB0;
  swift_retain();
  sub_100055DB0((uint64_t)a1);
  uint64_t v34 = sub_10002D398(&qword_1000B0190);
  uint64_t v35 = sub_10002F34C(&qword_1000B0198);
  unint64_t v36 = sub_10005903C();
  *(void *)&long long v123 = v35;
  *((void *)&v123 + 1) = v36;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v104 = v34;
  uint64_t v102 = OpaqueTypeConformance2;
  Button.init(action:label:)();
  unint64_t v101 = sub_1000590DC();
  sub_10003149C(v101, (uint64_t)&type metadata for Circle, v4);
  uint64_t v38 = sub_10002F5CC(&qword_1000B01B0, &qword_1000B0168);
  uint64_t v39 = sub_100059130(&qword_1000AEF10, (void (*)(uint64_t))type metadata accessor for CARSettingButtonStyle);
  uint64_t v100 = v38;
  uint64_t v99 = v39;
  View.buttonStyle<A>(_:)();
  uint64_t v109 = v4;
  sub_100059178((uint64_t)v4);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v6 + 8);
  unint64_t v106 = v8;
  id v108 = (char *)v5;
  uint64_t v107 = v6 + 8;
  v40(v8, v5);
  uint64_t v41 = (uint64_t)v112;
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  uint64_t v43 = v117;
  uint64_t v98 = v9 + 16;
  uint64_t v97 = v42;
  v42((char *)v41, v11, v117);
  uint64_t v44 = (_OWORD *)(v41 + *(int *)(v115 + 36));
  long long v45 = v121;
  *uint64_t v44 = v120;
  v44[1] = v45;
  v44[2] = v122;
  uint64_t v46 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v47 = v11;
  uint64_t v110 = v9 + 8;
  uint64_t v96 = v46;
  v46(v11, v43);
  swift_release();
  unint64_t v48 = *(void *)a1;
  sub_100055DB0((uint64_t)a1);
  uint64_t v49 = (char **)swift_bridgeObjectRetain();
  uint64_t v50 = sub_1000573F8(v49);
  LOBYTE(v9) = v51;
  sub_100058D1C((uint64_t)a1);
  swift_bridgeObjectRelease();
  char v52 = v9 | (v50 < 1);
  if (!(v9 & 1 | (v50 < 1)))
  {
    if ((v48 & 0xC000000000000001) != 0)
    {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
      swift_unknownObjectRelease();
    }
    else if ((unint64_t)(v50 - 1) >= *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_16;
    }
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v54 = swift_allocObject();
  *(unsigned char *)(v54 + 16) = v52 & 1;
  uint64_t v55 = v105;
  sub_100033C94(v41, v105, &qword_1000B0178);
  uint64_t v94 = (void (*)(char *, char *))v40;
  uint64_t v56 = v114;
  uint64_t v57 = (uint64_t *)(v55 + *(int *)(v114 + 36));
  *uint64_t v57 = KeyPath;
  v57[1] = (uint64_t)sub_100049F60;
  v57[2] = v54;
  sub_100032F78(v41, &qword_1000B0178);
  unint64_t v95 = sub_1000591E4();
  uint64_t v58 = (uint64_t)v103;
  View.accessibilityIdentifier(_:)();
  sub_100032F78(v55, &qword_1000B0180);
  unsigned int v112 = 0;
  uint64_t v59 = v113;
  sub_100033C30(v58, v113, &qword_1000B0188);
  long long v60 = (_OWORD *)swift_allocObject();
  long long v61 = a1[3];
  v60[3] = a1[2];
  v60[4] = v61;
  long long v62 = a1[5];
  v60[5] = a1[4];
  v60[6] = v62;
  long long v63 = a1[1];
  v60[1] = *a1;
  v60[2] = v63;
  __chkstk_darwin(v60);
  *(&v88 - 2) = (char *)0x2E6E6F7276656863;
  *(&v88 - 1) = (char *)0xEF64726177726F66;
  sub_100055DB0((uint64_t)a1);
  swift_retain();
  uint64_t v64 = v106;
  uint64_t v65 = Button.init(action:label:)();
  char v66 = v109;
  sub_10003149C(v65, (uint64_t)&type metadata for Circle, v109);
  uint64_t v11 = v108;
  View.buttonStyle<A>(_:)();
  sub_100059178((uint64_t)v66);
  v94(v64, v11);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v41 = (uint64_t)v111;
  uint64_t v67 = v117;
  v97(v111, v47, v117);
  uint64_t v68 = (_OWORD *)(v41 + *(int *)(v115 + 36));
  long long v69 = v124;
  *uint64_t v68 = v123;
  v68[1] = v69;
  v68[2] = v125;
  v96(v47, v67);
  uint64_t v70 = v59;
  swift_release();
  sub_100055DB0((uint64_t)a1);
  long long v71 = (char **)swift_bridgeObjectRetain();
  uint64_t v50 = sub_1000573F8(v71);
  LOBYTE(v59) = v72;
  sub_100058D1C((uint64_t)a1);
  swift_bridgeObjectRelease();
  char v52 = 1;
  LOBYTE(v11) = 1;
  if (v59)
  {
LABEL_13:
    uint64_t v76 = swift_getKeyPath();
    uint64_t v77 = swift_allocObject();
    *(unsigned char *)(v77 + 16) = (_BYTE)v11;
    uint64_t v78 = v89;
    sub_100033C94(v41, v89, &qword_1000B0178);
    BOOL v79 = (uint64_t *)(v78 + *(int *)(v56 + 36));
    *BOOL v79 = v76;
    v79[1] = (uint64_t)sub_10004AA44;
    v79[2] = v77;
    sub_100032F78(v41, &qword_1000B0178);
    uint64_t v80 = (uint64_t)v88;
    View.accessibilityIdentifier(_:)();
    sub_100032F78(v78, &qword_1000B0180);
    uint64_t v81 = v90;
    sub_100033C30(v80, v90, &qword_1000B0188);
    uint64_t v82 = v91;
    sub_100033C94(v70, v91, &qword_1000B0188);
    uint64_t v83 = v92;
    sub_100033C94(v81, v92, &qword_1000B0188);
    uint64_t v84 = v93;
    sub_100033C94(v82, v93, &qword_1000B0188);
    uint64_t v85 = sub_10002D398(&qword_1000B01C8);
    uint64_t v86 = v84 + *(int *)(v85 + 48);
    *(void *)uint64_t v86 = 0;
    *(unsigned char *)(v86 + 8) = v52;
    sub_100033C94(v83, v84 + *(int *)(v85 + 64), &qword_1000B0188);
    sub_100032F78(v81, &qword_1000B0188);
    sub_100032F78(v70, &qword_1000B0188);
    sub_100032F78(v83, &qword_1000B0188);
    return sub_100032F78(v82, &qword_1000B0188);
  }
  if (!(v48 >> 62))
  {
    uint64_t v73 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v74 = v73 - 1;
    if (!__OFSUB__(v73, 1)) {
      goto LABEL_7;
    }
LABEL_18:
    __break(1u);
LABEL_19:
    specialized _ArrayBuffer._getElementSlowPath(_:)();
    swift_unknownObjectRelease();
    goto LABEL_11;
  }
LABEL_16:
  swift_bridgeObjectRetain();
  uint64_t v87 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v74 = v87 - 1;
  if (__OFSUB__(v87, 1)) {
    goto LABEL_18;
  }
LABEL_7:
  if (v50 >= v74)
  {
LABEL_12:
    uint64_t v56 = v114;
    uint64_t v70 = v113;
    goto LABEL_13;
  }
  unint64_t result = v50 + 1;
  if ((v48 & 0xC000000000000001) != 0) {
    goto LABEL_19;
  }
  if (v50 < -1)
  {
    __break(1u);
  }
  else if (result < *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    LOBYTE(v11) = 0;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_100055824@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v62 = a2;
  uint64_t v3 = sub_10002D398(&qword_1000B05A0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v63 = (uint64_t)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v64 = (uint64_t)&v59 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  long long v61 = (char *)&v59 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v59 - v10;
  uint64_t v12 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v14 = v13;
  char v16 = v15;
  uint64_t v18 = v17;
  uint64_t v19 = (_OWORD *)swift_allocObject();
  long long v20 = a1[3];
  v19[3] = a1[2];
  v19[4] = v20;
  long long v21 = a1[5];
  v19[5] = a1[4];
  void v19[6] = v21;
  long long v22 = a1[1];
  v19[1] = *a1;
  v19[2] = v22;
  sub_100055DB0((uint64_t)a1);
  sub_100032058(v12, v14, v16 & 1, v18, 0, 0, (uint64_t)sub_1000588EC, (uint64_t)v19, (uint64_t)v69);
  long long v70 = v69[0];
  long long v71 = v69[1];
  long long v72 = v69[2];
  long long v73 = v69[3];
  unint64_t v23 = sub_10004A018();
  long long v60 = v11;
  unint64_t v59 = v23;
  View.accessibilityIdentifier(_:)();
  sub_1000589EC((uint64_t)v69);
  type metadata accessor for MainActor();
  sub_100055DB0((uint64_t)a1);
  uint64_t v24 = static MainActor.shared.getter();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v24;
  *(void *)(v25 + 24) = &protocol witness table for MainActor;
  long long v26 = a1[3];
  *(_OWORD *)(v25 + 64) = a1[2];
  *(_OWORD *)(v25 + 80) = v26;
  long long v27 = a1[5];
  *(_OWORD *)(v25 + 96) = a1[4];
  *(_OWORD *)(v25 + 112) = v27;
  long long v28 = a1[1];
  *(_OWORD *)(v25 + 32) = *a1;
  *(_OWORD *)(v25 + 48) = v28;
  sub_100055DB0((uint64_t)a1);
  uint64_t v29 = static MainActor.shared.getter();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v29;
  *(void *)(v30 + 24) = &protocol witness table for MainActor;
  long long v31 = a1[3];
  *(_OWORD *)(v30 + 64) = a1[2];
  *(_OWORD *)(v30 + 80) = v31;
  long long v32 = a1[5];
  *(_OWORD *)(v30 + 96) = a1[4];
  *(_OWORD *)(v30 + 112) = v32;
  long long v33 = a1[1];
  *(_OWORD *)(v30 + 32) = *a1;
  *(_OWORD *)(v30 + 48) = v33;
  sub_10002D398(&qword_1000AFAA0);
  Binding.init(get:set:)();
  Binding.init(_:)();
  uint64_t v34 = *((void *)&v65 + 1);
  if (*((void *)&v65 + 1))
  {
    uint64_t v35 = v65;
    uint64_t v36 = v66;
    unint64_t v74 = *(void *)a1;
    if (v74 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
      sub_100053218((uint64_t)&v74);
    }
    else
    {
      uint64_t v37 = *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
  }
  uint64_t v38 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v40 = v39;
  char v42 = v41;
  uint64_t v44 = v43;
  long long v45 = (_OWORD *)swift_allocObject();
  long long v46 = a1[3];
  v45[3] = a1[2];
  v45[4] = v46;
  long long v47 = a1[5];
  v45[5] = a1[4];
  v45[6] = v47;
  long long v48 = a1[1];
  v45[1] = *a1;
  v45[2] = v48;
  sub_100055DB0((uint64_t)a1);
  sub_100032058(v38, v40, v42 & 1, v44, 0, 0, (uint64_t)sub_100058C40, (uint64_t)v45, (uint64_t)&v70);
  long long v65 = v70;
  long long v66 = v71;
  long long v67 = v72;
  long long v68 = v73;
  uint64_t v49 = (uint64_t)v61;
  View.accessibilityIdentifier(_:)();
  sub_1000589EC((uint64_t)&v70);
  uint64_t v50 = (uint64_t)v60;
  uint64_t v51 = v64;
  sub_100033C94((uint64_t)v60, v64, &qword_1000B05A0);
  uint64_t v52 = v63;
  sub_100033C94(v49, v63, &qword_1000B05A0);
  uint64_t v53 = v62;
  sub_100033C94(v51, v62, &qword_1000B05A0);
  uint64_t v54 = (int *)sub_10002D398(&qword_1000B0158);
  uint64_t v55 = v53 + v54[12];
  *(void *)uint64_t v55 = 0;
  *(unsigned char *)(v55 + 8) = 1;
  uint64_t v56 = v53 + v54[16];
  *(void *)uint64_t v56 = v35;
  *(void *)(v56 + 8) = v34;
  *(void *)(v56 + 16) = v36;
  *(void *)(v56 + 24) = v37;
  *(unsigned char *)(v56 + 32) = 0;
  uint64_t v57 = v53 + v54[20];
  *(void *)uint64_t v57 = 0;
  *(unsigned char *)(v57 + 8) = 1;
  sub_100033C94(v52, v53 + v54[24], &qword_1000B05A0);
  sub_100049E14(v35, v34);
  sub_100032F78(v49, &qword_1000B05A0);
  sub_100032F78(v50, &qword_1000B05A0);
  sub_100032F78(v52, &qword_1000B05A0);
  sub_100049E54(v35, v34);
  return sub_100032F78(v51, &qword_1000B05A0);
}

uint64_t sub_100055DA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100053EF4(a1, (_OWORD *)(v2 + 16), a2);
}

uint64_t sub_100055DB0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void **)(a1 + 32);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v4 = v2;
  id v5 = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void sub_100055E4C()
{
  long long v3 = *(_OWORD *)(v0 + 64);
  sub_10002D398(&qword_1000B00E0);
  State.wrappedValue.getter();
  if (v4 == 2)
  {
    sub_10002F83C(0, &qword_1000B00E8);
    id v1 = [swift_getObjCClassFromMetadata() appearance:v3];
    [v1 bounces];

    State.wrappedValue.setter();
  }
  sub_10002F83C(0, &qword_1000B00E8);
  id v2 = [(id)swift_getObjCClassFromMetadata() appearance];
  [v2 setBounces:0];
}

void sub_100055F64()
{
  long long v2 = *(_OWORD *)(v0 + 64);
  sub_10002D398(&qword_1000B00E0);
  State.wrappedValue.getter();
  if (v3 != 2)
  {
    sub_10002F83C(0, &qword_1000B00E8);
    id v1 = [swift_getObjCClassFromMetadata() appearance:v2];
    [v1 setBounces:v3 & 1];
  }
}

uint64_t sub_100056000@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 32) = a5 & 1;
  return result;
}

uint64_t sub_100056014()
{
  return swift_release();
}

uint64_t CRSUIClusterThemeWallpaper.id.getter()
{
  id v1 = [v0 data];
  id v2 = [v1 identifier];

  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v3;
}

uint64_t sub_100056148@<X0>(uint64_t a1@<X8>)
{
  return sub_100053700(a1);
}

void sub_10005618C(uint64_t *a1@<X8>)
{
  id v3 = [*v1 data];
  id v4 = [v3 identifier];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;

  *a1 = v5;
  a1[1] = v7;
}

void *sub_100056204()
{
  id v1 = (objc_class *)type metadata accessor for CARPageControl();
  v8.receiver = v0;
  v8.super_class = v1;
  id v2 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v3 = [v2 setAllowsContinuousInteraction:0];
  (*(void (**)(id))((swift_isaMask & *v2) + 0x50))(v3);
  sub_10002D398(&qword_1000AFDC8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100072CC0;
  *(void *)(v4 + 32) = type metadata accessor for UITraitUserInterfaceStyle();
  *(void *)(v4 + 40) = &protocol witness table for UITraitUserInterfaceStyle;
  v7[3] = v1;
  v7[0] = v2;
  uint64_t v5 = v2;
  UIView.registerForTraitChanges(_:target:action:)();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_10002FF84((uint64_t)v7);
  return v5;
}

uint64_t type metadata accessor for CARPageControl()
{
  return self;
}

void sub_100056370()
{
}

void sub_100056428()
{
  id v1 = self;
  id v2 = [v1 labelColor];
  id v3 = [v0 traitCollection];
  id v4 = [v2 resolvedColorWithTraitCollection:v3];

  [v0 setCurrentPageIndicatorTintColor:v4];
  id v5 = [v1 _carSystemTertiaryColor];
  id v6 = [v0 traitCollection];
  id v7 = [v5 resolvedColorWithTraitCollection:v6];

  [v0 setPageIndicatorTintColor:v7];
}

void sub_1000565B0()
{
}

id sub_100056610()
{
  return sub_100057168(type metadata accessor for CARPageControl);
}

id sub_100056628()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for CARSmallPageControl();
  id v1 = [super init];
  id v2 = (void *)sub_100057628();
  [v1 setPreferredIndicatorImage:v2];

  return v1;
}

uint64_t type metadata accessor for CARSmallPageControl()
{
  return self;
}

double sub_100056728()
{
  return 7.5;
}

void sub_100056738(uint64_t a1, void *a2)
{
  id v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id sub_100056784()
{
  return sub_100057168(type metadata accessor for CARSmallPageControl);
}

BOOL sub_10005679C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_1000567AC(uint64_t a1, char a2)
{
}

Swift::Int sub_1000567D4(char a1)
{
  return Hasher._finalize()();
}

BOOL sub_10005681C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100056834()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10005687C()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000568A8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_1000568EC()
{
  sub_10002D398(&qword_1000AFFD0);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_10005693C()
{
  return Binding.wrappedValue.setter();
}

void (*sub_100056990(void *a1))(uint64_t a1)
{
  id v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  v3[6] = *v1;
  v3[7] = v5;
  uint64_t v6 = v1[2];
  unsigned char v3[8] = v6;
  v3[3] = v4;
  *id v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  sub_100049E98((uint64_t)(v3 + 3));
  swift_retain();
  v3[9] = sub_10002D398(&qword_1000AFFD0);
  Binding.wrappedValue.getter();
  return sub_100056A34;
}

void sub_100056A34(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)a1 + 24;
  uint64_t v3 = *(void *)(*(void *)a1 + 64);
  uint64_t v4 = *(void *)(*(void *)a1 + 56);
  uint64_t v5 = *(void *)(*(void *)a1 + 40);
  *uint64_t v1 = *(void *)(*(void *)a1 + 48);
  v1[1] = v4;
  v1[2] = v3;
  v1[4] = v5;
  Binding.wrappedValue.setter();
  sub_100049EC4(v2);
  swift_release();

  free(v1);
}

uint64_t sub_100056AA4()
{
  sub_10002D398(&qword_1000AFFD0);
  Binding.projectedValue.getter();
  return v1;
}

uint64_t sub_100056AF8()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_100056B00()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_100056B08(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result & 1;
  return result;
}

uint64_t (*sub_100056B14())()
{
  return nullsub_8;
}

id sub_100056B34()
{
  if (v0[2]) {
    uint64_t v1 = (objc_class *)type metadata accessor for CARSmallPageControl();
  }
  else {
    uint64_t v1 = (objc_class *)type metadata accessor for CARPageControl();
  }
  id v2 = [objc_allocWithZone(v1) init];
  long long v5 = *v0;
  id v3 = v2;
  sub_10002D398(&qword_1000AFFD0);
  Binding.wrappedValue.getter();
  [v3 setCurrentPage:v6];

  [v3 setNumberOfPages:*((void *)v0 + 3)];
  sub_10002D398(&qword_1000AFFD8);
  UIViewRepresentableContext.coordinator.getter();
  [v3 addTarget:(void)v5 action:"valueChanged:" forControlEvents:4096];

  return v3;
}

id sub_100056C2C(void *a1)
{
  long long v4 = *v1;
  uint64_t v5 = *((void *)v1 + 2);
  sub_10002D398(&qword_1000AFFD0);
  Binding.wrappedValue.getter();
  [a1 setCurrentPage:v6 v4, v5];
  return [a1 setNumberOfPages:*((void *)v1 + 3)];
}

id sub_100056CB0()
{
  long long v7 = *v0;
  uint64_t v8 = *((void *)v0 + 2);
  sub_10002D398(&qword_1000AFFD0);
  Binding.projectedValue.getter();
  uint64_t v1 = v10;
  id v2 = (objc_class *)type metadata accessor for PageControl.Coordinator();
  id v3 = (char *)objc_allocWithZone(v2);
  long long v4 = &v3[OBJC_IVAR____TtCV15CarPlaySettings11PageControl11Coordinator__currentPage];
  *(_OWORD *)long long v4 = v9;
  *((void *)v4 + 2) = v1;
  v6.receiver = v3;
  v6.super_class = v2;
  return [super init];
}

id sub_100056D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v7 = (char *)objc_allocWithZone(v3);
  uint64_t v8 = &v7[OBJC_IVAR____TtCV15CarPlaySettings11PageControl11Coordinator__currentPage];
  *(void *)uint64_t v8 = a1;
  *((void *)v8 + 1) = a2;
  *((void *)v8 + 2) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return [super init];
}

uint64_t sub_100056DA8()
{
  sub_10002D398(&qword_1000AFFD0);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_100056E04()
{
  return Binding.wrappedValue.setter();
}

void (*sub_100056E64(void *a1))(uint64_t a1)
{
  id v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = v1 + OBJC_IVAR____TtCV15CarPlaySettings11PageControl11Coordinator__currentPage;
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtCV15CarPlaySettings11PageControl11Coordinator__currentPage);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtCV15CarPlaySettings11PageControl11Coordinator__currentPage + 8);
  void v3[5] = v5;
  v3[6] = v6;
  uint64_t v7 = *(void *)(v4 + 16);
  v3[7] = v7;
  *id v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  swift_retain();
  swift_retain();
  unsigned char v3[8] = sub_10002D398(&qword_1000AFFD0);
  Binding.wrappedValue.getter();
  return sub_100056F08;
}

void sub_100056F08(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  uint64_t v3 = *(void *)(*(void *)a1 + 56);
  uint64_t v4 = *(void *)(*(void *)a1 + 48);
  *uint64_t v1 = *(void *)(*(void *)a1 + 40);
  v1[1] = v4;
  v1[2] = v3;
  v1[4] = v2;
  Binding.wrappedValue.setter();
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_100056F74()
{
  sub_10002D398(&qword_1000AFFD0);
  Binding.projectedValue.getter();
  return v1;
}

id sub_100056FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = &v3[OBJC_IVAR____TtCV15CarPlaySettings11PageControl11Coordinator__currentPage];
  *(void *)uint64_t v4 = a1;
  *((void *)v4 + 1) = a2;
  *((void *)v4 + 2) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for PageControl.Coordinator();
  return [super init];
}

uint64_t sub_10005701C(void *a1)
{
  id v2 = [a1 currentPage];
  uint64_t v3 = *(uint64_t (**)(id))((swift_isaMask & *v1) + 0x60);

  return v3(v2);
}

id sub_100057150()
{
  return sub_100057168(type metadata accessor for PageControl.Coordinator);
}

id sub_100057168(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

id sub_1000571E8(void *a1)
{
  uint64_t v3 = *((void *)v1 + 3);
  long long v5 = *v1;
  uint64_t v6 = *((void *)v1 + 2);
  sub_10002D398(&qword_1000AFFD0);
  Binding.wrappedValue.getter();
  [a1 setCurrentPage:v7, v5, v6];
  return [a1 setNumberOfPages:v3];
}

id sub_100057268@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *((void *)v1 + 2);
  long long v10 = *v1;
  uint64_t v11 = v3;
  sub_10002D398(&qword_1000AFFD0);
  Binding.projectedValue.getter();
  uint64_t v4 = v13;
  long long v5 = (objc_class *)type metadata accessor for PageControl.Coordinator();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  uint64_t v7 = &v6[OBJC_IVAR____TtCV15CarPlaySettings11PageControl11Coordinator__currentPage];
  *(_OWORD *)uint64_t v7 = v12;
  *((void *)v7 + 2) = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  id result = [super init];
  *a1 = result;
  return result;
}

uint64_t sub_100057308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000582D8();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10005736C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000582D8();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000573D0()
{
}

uint64_t sub_1000573F8(char **a1)
{
  uint64_t v2 = v1;
  p_types = a1;
  if ((unint64_t)a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    uint64_t v20 = v2;
    long long v21 = p_types;
    uint64_t v5 = 0;
    uint64_t v22 = v4;
    unint64_t v23 = (unint64_t)p_types & 0xC000000000000001;
    while (1)
    {
      if (v23) {
        unint64_t v6 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        unint64_t v6 = p_types[v5 + 4];
      }
      uint64_t v7 = v6;
      id v8 = [v6 data:v20];
      p_types = &stru_1000A8FF8.types;
      id v9 = [v8 identifier];

      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v12 = v11;

      sub_10002D398(&qword_1000AFF60);
      Binding.wrappedValue.getter();
      id v13 = [v24 data];
      id v14 = [v13 identifier];

      uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v16 = v15;

      if (v10 == v2 && v12 == v16)
      {

        swift_bridgeObjectRelease_n();
        return v5;
      }
      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17) {
        return v5;
      }
      uint64_t v18 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        break;
      }
      ++v5;
      p_types = v21;
      if (v18 == v22) {
        return 0;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_100057628()
{
  id v0 = [objc_allocWithZone((Class)UIGraphicsImageRenderer) initWithSize:6.0, 6.0];
  uint64_t v1 = swift_allocObject();
  __asm { FMOV            V0.2D, #6.0 }
  *(_OWORD *)(v1 + 16) = _Q0;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_10005833C;
  *(void *)(v7 + 24) = v1;
  v12[4] = sub_1000583F8;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100056738;
  uint64_t v12[3] = &unk_100093450;
  id v8 = _Block_copy(v12);
  swift_retain();
  swift_release();
  id v9 = [v0 imageWithActions:v8];
  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v8)
  {
    __break(1u);
  }
  else
  {
    id v11 = [v9 imageWithRenderingMode:2];
    swift_release();

    return (uint64_t)v11;
  }
  return result;
}

uint64_t type metadata accessor for PageControl.Coordinator()
{
  return self;
}

uint64_t sub_1000577F8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100057818()
{
  unint64_t result = qword_1000AFFE8;
  if (!qword_1000AFFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFFE8);
  }
  return result;
}

unint64_t sub_100057870()
{
  unint64_t result = qword_1000AFFF0;
  if (!qword_1000AFFF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AFFF0);
  }
  return result;
}

uint64_t destroy for CARThemeWallpaperSelector(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for CARThemeWallpaperSelector(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  unint64_t v6 = *(void **)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v7 = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = v7;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v8 = v4;
  id v9 = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CARThemeWallpaperSelector(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void **)(a2 + 24);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 32);
  id v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v7;
  id v9 = v7;

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CARThemeWallpaperSelector(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for CARThemeWallpaperSelector(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  long long v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CARThemeWallpaperSelector(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CARThemeWallpaperSelector(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CARThemeWallpaperSelector()
{
  return &type metadata for CARThemeWallpaperSelector;
}

uint64_t destroy for PageControl()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for PageControl(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PageControl(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for PageControl(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PageControl(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PageControl(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PageControl(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PageControl()
{
  return &type metadata for PageControl;
}

unsigned char *initializeBufferWithCopyOfBuffer for PageControl.Style(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PageControl.Style(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PageControl.Style(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100057FF0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_100058018(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100058020(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PageControl.Style()
{
  return &type metadata for PageControl.Style;
}

uint64_t sub_10005803C()
{
  return sub_100058688(&qword_1000B0070, &qword_1000B0078, (void (*)(void))sub_100058080);
}

uint64_t sub_100058080()
{
  return sub_100058688(&qword_1000B0080, &qword_1000B0088, (void (*)(void))sub_1000580B0);
}

unint64_t sub_1000580B0()
{
  unint64_t result = qword_1000B0090;
  if (!qword_1000B0090)
  {
    sub_10002F34C(&qword_1000B0098);
    swift_getOpaqueTypeConformance2();
    sub_10002F5CC(&qword_1000B00A0, &qword_1000B00A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0090);
  }
  return result;
}

unint64_t sub_10005816C()
{
  unint64_t result = qword_1000B00B0;
  if (!qword_1000B00B0)
  {
    sub_10002F34C(&qword_1000AFF98);
    sub_100058688(&qword_1000B00B8, &qword_1000AFF90, (void (*)(void))sub_100058238);
    sub_10002F5CC(&qword_1000B00D0, &qword_1000AFFC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B00B0);
  }
  return result;
}

unint64_t sub_100058238()
{
  unint64_t result = qword_1000B00C0;
  if (!qword_1000B00C0)
  {
    sub_10002F34C(&qword_1000AFF88);
    sub_10002F5CC(&qword_1000B00C8, &qword_1000AFF80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B00C0);
  }
  return result;
}

unint64_t sub_1000582D8()
{
  unint64_t result = qword_1000B00D8;
  if (!qword_1000B00D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B00D8);
  }
  return result;
}

uint64_t sub_10005832C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10005833C(void *a1)
{
  CGFloat v3 = *(double *)(v1 + 16);
  CGFloat v4 = *(double *)(v1 + 24);
  id v5 = [self whiteColor];
  [v5 setFill];

  unsigned int v6 = (CGContext *)[a1 CGContext];
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = v3;
  v8.size.height = v4;
  CGContextFillEllipseInRect(v6, v8);
}

uint64_t sub_1000583E8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000583F8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100058420(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100058430()
{
  return swift_release();
}

uint64_t sub_100058438()
{
  return sub_100054474(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_100058444(uint64_t *a1@<X8>)
{
  long long v8 = *(_OWORD *)(v1 + 40);
  uint64_t v9 = *(void *)(v1 + 56);
  sub_10002D398(&qword_1000AFF60);
  Binding.wrappedValue.getter();
  id v3 = [v10 data:v8, v9];
  id v4 = [v3 identifier];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;

  *a1 = v5;
  a1[1] = v7;
}

uint64_t *sub_100058500(uint64_t *result)
{
  uint64_t v1 = result[1];
  if (v1)
  {
    uint64_t v2 = *result;
    sub_10002D398(&qword_1000AFBD8);
    unint64_t result = (uint64_t *)State.wrappedValue.getter();
    if (v5 == 1)
    {
      swift_bridgeObjectRetain();
      unint64_t v3 = swift_bridgeObjectRetain();
      id v4 = sub_10003BF6C(v3, v2, v1);
      swift_bridgeObjectRelease();
      unint64_t result = (uint64_t *)swift_bridgeObjectRelease();
      if (v4)
      {
        sub_10002D398(&qword_1000AFF60);
        return (uint64_t *)Binding.wrappedValue.setter();
      }
      else
      {
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t sub_1000585E0()
{
  return sub_100054688(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_1000585E8()
{
  unint64_t result = qword_1000B0128;
  if (!qword_1000B0128)
  {
    sub_10002F34C(&qword_1000B0120);
    sub_100058688(&qword_1000B0130, &qword_1000B0138, (void (*)(void))sub_1000402D4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0128);
  }
  return result;
}

uint64_t sub_100058688(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F34C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100058704()
{
  uint64_t v1 = type metadata accessor for GeometryProxy();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

double sub_100058794@<D0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for GeometryProxy();
  id v4 = [*a1 data];
  uint64_t v7 = nullsub_8(v4, v5, v6);
  GeometryProxy.size.getter();
  GeometryProxy.size.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  *(void *)a2 = v7;
  *(void *)(a2 + 8) = v9;
  *(unsigned char *)(a2 + 16) = v10;
  *(void *)(a2 + 24) = v11;
  *(unsigned char *)(a2 + 32) = v12;
  double result = *(double *)&v13;
  *(_OWORD *)(a2 + 40) = v13;
  return result;
}

unint64_t sub_100058880()
{
  unint64_t result = qword_1000B0150;
  if (!qword_1000B0150)
  {
    sub_10002F83C(255, (unint64_t *)&unk_1000AFA40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0150);
  }
  return result;
}

uint64_t sub_1000588EC()
{
  uint64_t v1 = v0;
  sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
  uint64_t v2 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_10002D398(&qword_1000B0160);
  State.wrappedValue.getter();
  sub_10002D398(&qword_1000AFF60);
  Binding.wrappedValue.setter();
  sub_10002D398(&qword_1000AFBD8);
  uint64_t v3 = State.wrappedValue.setter();
  return (*(uint64_t (**)(uint64_t))(v1 + 96))(v3);
}

uint64_t sub_1000589EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100058A48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + 32;
  sub_100055DB0(v3);
  id v4 = (char **)swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000573F8(v4);
  char v7 = v6;
  sub_100058D1C(v3);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v7 & 1;
  return result;
}

uint64_t sub_100058AC8()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_100058B48(uint64_t result)
{
  if ((*(unsigned char *)(result + 8) & 1) == 0)
  {
    uint64_t result = *(void *)result;
    unint64_t v2 = *(void *)(v1 + 32);
    unint64_t v9 = v2;
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFFF8;
    if (v2 >> 62)
    {
      uint64_t v7 = v2 & 0xFFFFFFFFFFFFFF8;
      uint64_t v8 = result;
      unint64_t v6 = v2;
      swift_bridgeObjectRetain();
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      sub_100053218((uint64_t)&v9);
      if ((v4 & 0x8000000000000000) == 0) {
        goto LABEL_14;
      }
      __break(1u);
LABEL_12:
      specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_8:
      sub_10002D398(&qword_1000AFF60);
      return Binding.wrappedValue.setter();
    }
    else
    {
      uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if ((result & 0x8000000000000000) == 0)
      {
        while (result < v4)
        {
          if ((v2 & 0xC000000000000001) != 0) {
            goto LABEL_12;
          }
          if ((unint64_t)result < *(void *)(v3 + 16))
          {
            id v5 = *(id *)(v2 + 8 * result + 32);
            goto LABEL_8;
          }
          __break(1u);
LABEL_14:
          uint64_t v3 = v7;
          uint64_t result = v8;
          unint64_t v2 = v6;
          if (v8 < 0) {
            return result;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100058C40()
{
  uint64_t v1 = v0;
  sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
  unint64_t v2 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_10002D398(&qword_1000AFBD8);
  State.wrappedValue.setter();
  uint64_t v3 = State.wrappedValue.setter();
  return (*(uint64_t (**)(uint64_t))(v1 + 96))(v3);
}

uint64_t sub_100058D1C(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void **)(a1 + 32);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

unint64_t sub_100058DB8()
{
  unint64_t v1 = *(void *)(v0 + 16);
  unint64_t v24 = v1;
  uint64_t v2 = v1 & 0xFFFFFFFFFFFFFF8;
  if (!(v1 >> 62))
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
    return sub_100053218((uint64_t)&v24);
  }
LABEL_22:
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  if (!v3) {
    return sub_100053218((uint64_t)&v24);
  }
LABEL_3:
  uint64_t v20 = v2;
  uint64_t v21 = v3;
  uint64_t v2 = 0;
  unint64_t v22 = v1 & 0xC000000000000001;
  while (1)
  {
    id v4 = v22 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v1 + 8 * v2 + 32);
    id v5 = v4;
    id v6 = [v4 data];
    id v7 = [v6 identifier];

    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;

    sub_10002D398(&qword_1000AFF60);
    Binding.wrappedValue.getter();
    id v11 = [v23 data];
    id v12 = [v11 identifier];

    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = v14;

    if (v8 == v13 && v10 == v15) {
      break;
    }
    char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v16) {
      goto LABEL_14;
    }
    uint64_t v17 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_22;
    }
    ++v2;
    if (v17 == v21) {
      return sub_100053218((uint64_t)&v24);
    }
  }
  swift_bridgeObjectRelease_n();

LABEL_14:
  sub_100053218((uint64_t)&v24);
  unint64_t result = v2 - 1;
  if (v2 < 1) {
    return result;
  }
  if (v22)
  {
    specialized _ArrayBuffer._getElementSlowPath(_:)();
    return Binding.wrappedValue.setter();
  }
  if (result < *(void *)(v20 + 16))
  {
    id v19 = *(id *)(v1 + 8 * v2 + 24);
    return Binding.wrappedValue.setter();
  }
  __break(1u);
  return result;
}

uint64_t sub_100059034()
{
  return sub_100056014();
}

unint64_t sub_10005903C()
{
  unint64_t result = qword_1000B01A0;
  if (!qword_1000B01A0)
  {
    sub_10002F34C(&qword_1000B0198);
    sub_10002F5CC(&qword_1000AEFF0, &qword_1000AEFF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B01A0);
  }
  return result;
}

unint64_t sub_1000590DC()
{
  unint64_t result = qword_1000B01A8;
  if (!qword_1000B01A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B01A8);
  }
  return result;
}

uint64_t sub_100059130(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100059178(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CARSettingButtonStyle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000591D4()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_1000591E4()
{
  unint64_t result = qword_1000B01B8;
  if (!qword_1000B01B8)
  {
    sub_10002F34C(&qword_1000B0180);
    sub_100059284();
    sub_10002F5CC(&qword_1000AFAC8, &qword_1000AFAD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B01B8);
  }
  return result;
}

unint64_t sub_100059284()
{
  unint64_t result = qword_1000B01C0;
  if (!qword_1000B01C0)
  {
    sub_10002F34C(&qword_1000B0178);
    sub_10002F34C(&qword_1000B0168);
    type metadata accessor for CARSettingButtonStyle();
    sub_10002F5CC(&qword_1000B01B0, &qword_1000B0168);
    sub_100059130(&qword_1000AEF10, (void (*)(uint64_t))type metadata accessor for CARSettingButtonStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B01C0);
  }
  return result;
}

uint64_t sub_1000593AC()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 112, 7);
}

uint64_t sub_100059424()
{
  unint64_t v1 = *(void *)(v0 + 16);
  unint64_t v25 = v1;
  unint64_t v2 = v1 >> 62;
  if (!(v1 >> 62))
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
    return sub_100053218((uint64_t)&v25);
  }
LABEL_25:
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  if (!v3) {
    return sub_100053218((uint64_t)&v25);
  }
LABEL_3:
  unint64_t v21 = v2;
  uint64_t v22 = v3;
  uint64_t v4 = 0;
  unint64_t v23 = v1 & 0xC000000000000001;
  while (1)
  {
    id v5 = v23 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v1 + 8 * v4 + 32);
    id v6 = v5;
    id v7 = [v5 data];
    id v8 = [v7 identifier];

    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;

    sub_10002D398(&qword_1000AFF60);
    Binding.wrappedValue.getter();
    id v12 = [v24 data];
    id v13 = [v12 identifier];

    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v16 = v15;

    if (v9 == v14 && v11 == v16) {
      break;
    }
    unint64_t v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v2) {
      goto LABEL_14;
    }
    uint64_t v17 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    ++v4;
    if (v17 == v22) {
      return sub_100053218((uint64_t)&v25);
    }
  }
  swift_bridgeObjectRelease_n();

LABEL_14:
  uint64_t result = sub_100053218((uint64_t)&v25);
  if (v21)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = sub_100053218((uint64_t)&v25);
  }
  else
  {
    uint64_t v19 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (__OFSUB__(v19, 1))
  {
    __break(1u);
  }
  else if (v4 < v19 - 1)
  {
    if (v23) {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v20 = *(id *)(v1 + 8 * v4 + 40);
    }
    return Binding.wrappedValue.setter();
  }
  return result;
}

uint64_t sub_1000596D0()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000596EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100059720(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_100059758())()
{
  return nullsub_8;
}

uint64_t sub_100059778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v35 = a3;
  uint64_t v5 = type metadata accessor for LimitedUIBackground();
  __chkstk_darwin(v5 - 8);
  id v7 = (uint64_t *)((char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_10002D398(&qword_1000B01D0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10002D398(&qword_1000B01D8);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10002D398(&qword_1000B01E0);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10002D398(&qword_1000B01E8);
  __chkstk_darwin(v19 - 8);
  unint64_t v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v10 = static HorizontalAlignment.center.getter();
  *((void *)v10 + 1) = 0;
  unsigned char v10[16] = 0;
  uint64_t v22 = sub_10002D398(&qword_1000B01F0);
  sub_100059B10(a1, a2, (uint64_t)&v10[*(int *)(v22 + 44)]);
  uint64_t v23 = static Font.title.getter();
  uint64_t KeyPath = swift_getKeyPath();
  sub_100033C94((uint64_t)v10, (uint64_t)v14, &qword_1000B01D0);
  unint64_t v25 = (uint64_t *)&v14[*(int *)(v12 + 44)];
  uint64_t *v25 = KeyPath;
  v25[1] = v23;
  sub_100032F78((uint64_t)v10, &qword_1000B01D0);
  LODWORD(v12) = static HierarchicalShapeStyle.primary.getter();
  sub_100033C94((uint64_t)v14, (uint64_t)v18, &qword_1000B01D8);
  *(_DWORD *)&v18[*(int *)(v16 + 44)] = v12;
  sub_100032F78((uint64_t)v14, &qword_1000B01D8);
  static Alignment.center.getter();
  sub_10005A184(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v21, 0.0, 1, INFINITY, 0);
  sub_100032F78((uint64_t)v18, &qword_1000B01E0);
  uint64_t v26 = static Alignment.center.getter();
  uint64_t v28 = v27;
  uint64_t v29 = sub_10002D398(&qword_1000B01F8);
  uint64_t v30 = v35;
  uint64_t v31 = v35 + *(int *)(v29 + 36);
  *id v7 = swift_getKeyPath();
  sub_10002D398(&qword_1000AEB50);
  swift_storeEnumTagMultiPayload();
  sub_10005A940((uint64_t)v7, v31);
  long long v32 = (uint64_t *)(v31 + *(int *)(sub_10002D398(&qword_1000B0200) + 36));
  *long long v32 = v26;
  v32[1] = v28;
  return sub_100033C30((uint64_t)v21, v30, &qword_1000B01E8);
}

uint64_t type metadata accessor for LimitedUIBackground()
{
  uint64_t result = qword_1000B1B60;
  if (!qword_1000B1B60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100059B10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v74 = a2;
  uint64_t v73 = a1;
  uint64_t v75 = a3;
  uint64_t v3 = sub_10002D398(&qword_1000B02F0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  uint64_t v6 = (uint64_t *)((char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for Image.Scale();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10002D398(&qword_1000B02F8);
  uint64_t v12 = v11 - 8;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (uint64_t *)((char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v13);
  uint64_t v17 = (uint64_t)&v54 - v16;
  uint64_t v18 = Image.init(systemName:)();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Image.Scale.medium(_:), v7);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v6 + *(int *)(v4 + 36), v10, v7);
  *uint64_t v6 = KeyPath;
  sub_100033C94((uint64_t)v6, (uint64_t)v15 + *(int *)(v12 + 44), &qword_1000B02F0);
  *uint64_t v15 = v18;
  swift_retain();
  sub_100032F78((uint64_t)v6, &qword_1000B02F0);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  uint64_t v55 = v17;
  sub_100033C30((uint64_t)v15, v17, &qword_1000B02F8);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v72 = v76;
  int v71 = v77;
  uint64_t v70 = v78;
  int v69 = v79;
  uint64_t v68 = v80;
  uint64_t v67 = v81;
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v20 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v22 = v21;
  LOBYTE(v18) = v23 & 1;
  uint64_t v65 = Text.bold()();
  uint64_t v64 = v24;
  uint64_t v66 = v25;
  int v63 = v26 & 1;
  sub_10002F81C(v20, v22, v18);
  swift_bridgeObjectRelease();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v61 = v82;
  int v60 = v83;
  uint64_t v59 = v84;
  int v58 = v85;
  uint64_t v57 = v86;
  uint64_t v56 = v87;
  uint64_t v27 = LocalizedStringKey.init(stringLiteral:)();
  uint64_t v29 = v28;
  LOBYTE(KeyPath) = v30;
  uint64_t v32 = v31;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v73;
  *(void *)(v33 + 24) = v74;
  swift_retain();
  sub_100032058(v27, v29, KeyPath & 1, v32, 0, 0, (uint64_t)sub_10005B12C, v33, (uint64_t)v88);
  uint64_t v62 = v15;
  sub_100033C94(v17, (uint64_t)v15, &qword_1000B02F8);
  uint64_t v34 = v88[0];
  uint64_t v35 = v88[1];
  LOBYTE(v17) = v89;
  uint64_t v36 = v90;
  uint64_t v37 = v91;
  uint64_t v38 = v92;
  uint64_t v39 = v93;
  uint64_t v40 = v94;
  uint64_t v41 = (uint64_t)v15;
  uint64_t v42 = v75;
  sub_100033C94(v41, v75, &qword_1000B02F8);
  uint64_t v43 = (int *)sub_10002D398(&qword_1000B0300);
  uint64_t v44 = v42 + v43[12];
  *(void *)uint64_t v44 = 0;
  *(unsigned char *)(v44 + 8) = 1;
  *(void *)(v44 + 16) = v72;
  *(unsigned char *)(v44 + 24) = v71;
  *(void *)(v44 + 32) = v70;
  *(unsigned char *)(v44 + 40) = v69;
  *(void *)(v44 + 48) = v68;
  *(void *)(v44 + 56) = v67;
  uint64_t v45 = v42 + v43[16];
  uint64_t v46 = v65;
  uint64_t v47 = v64;
  *(void *)uint64_t v45 = v65;
  *(void *)(v45 + 8) = v47;
  char v48 = v63;
  *(unsigned char *)(v45 + 16) = v63;
  *(void *)(v45 + 24) = v66;
  uint64_t v49 = v42 + v43[20];
  *(void *)uint64_t v49 = 0;
  *(unsigned char *)(v49 + 8) = 1;
  *(void *)(v49 + 16) = v61;
  *(unsigned char *)(v49 + 24) = v60;
  *(void *)(v49 + 32) = v59;
  *(unsigned char *)(v49 + 40) = v58;
  *(void *)(v49 + 48) = v57;
  *(void *)(v49 + 56) = v56;
  uint64_t v50 = v42 + v43[24];
  *(void *)uint64_t v50 = v34;
  *(void *)(v50 + 8) = v35;
  *(unsigned char *)(v50 + 16) = v17 & 1;
  *(void *)(v50 + 24) = v36;
  *(void *)(v50 + 32) = v37;
  *(void *)(v50 + 40) = v38;
  *(void *)(v50 + 48) = v39;
  *(void *)(v50 + 56) = v40;
  uint64_t v51 = v46;
  uint64_t v52 = v47;
  LOBYTE(v37) = v48;
  sub_10002F82C(v46, v47, v48);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100032F78(v55, &qword_1000B02F8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002F81C(v51, v52, v37);
  swift_bridgeObjectRelease();
  return sub_100032F78((uint64_t)v62, &qword_1000B02F8);
}

__n128 sub_10005A184@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    char v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_100033C94(v13, a9, &qword_1000B01E0);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_10002D398(&qword_1000B01E8) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  _OWORD *v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_10005A344@<X0>(uint64_t a1@<X8>)
{
  return sub_100059778(*v1, v1[1], a1);
}

uint64_t sub_10005A34C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v1 = sub_10002D398(&qword_1000B02C8);
  uint64_t v39 = *(void *)(v1 - 8);
  uint64_t v40 = v1;
  __chkstk_darwin(v1);
  uint64_t v37 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_10002D398(&qword_1000B02D0);
  __chkstk_darwin(v35);
  uint64_t v38 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10002D398(&qword_1000B02D8);
  __chkstk_darwin(v4 - 8);
  uint64_t v36 = (uint64_t)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v30 = *(void *)(v6 - 8);
  uint64_t v31 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ColorScheme();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v33 = sub_10002D398(&qword_1000B02E0);
  __chkstk_darwin(v33);
  uint64_t v34 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002CFF4((uint64_t)v15);
  uint64_t v17 = enum case for ColorScheme.light(_:);
  long long v32 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v32(v13, enum case for ColorScheme.light(_:), v9);
  char v18 = static ColorScheme.== infix(_:_:)();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v13, v9);
  v19(v15, v9);
  if (v18)
  {
    (*(void (**)(char *, void, uint64_t))(v30 + 104))(v8, enum case for Color.RGBColorSpace.sRGB(_:), v31);
    uint64_t v20 = Color.init(_:red:green:blue:opacity:)();
  }
  else
  {
    uint64_t v20 = static Color.black.getter();
  }
  uint64_t v31 = v20;
  sub_10002CFF4((uint64_t)v15);
  uint64_t v21 = v32;
  v32(v13, v17, v9);
  static ColorScheme.== infix(_:_:)();
  v19(v13, v9);
  v19(v15, v9);
  sub_10002CFF4((uint64_t)v15);
  v21(v13, v17, v9);
  static ColorScheme.== infix(_:_:)();
  v19(v13, v9);
  v19(v15, v9);
  uint64_t v22 = v37;
  View.luminanceCurve(_:amount:)();
  uint64_t v24 = (uint64_t)v38;
  uint64_t v23 = v39;
  uint64_t v25 = v40;
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v38, v22, v40);
  *(void *)(v24 + *(int *)(v35 + 36)) = 0x3FF8000000000000;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v25);
  uint64_t v26 = v36;
  sub_100033C94(v24, v36, &qword_1000B02D0);
  uint64_t v27 = v26 + *(int *)(sub_10002D398(&qword_1000B02E8) + 36);
  *(void *)uint64_t v27 = 0x402E000000000000;
  *(unsigned char *)(v27 + 8) = 1;
  sub_100032F78(v24, &qword_1000B02D0);
  long long v28 = (uint64_t *)v34;
  sub_100033C94(v26, (uint64_t)&v34[*(int *)(v33 + 36)], &qword_1000B02D8);
  uint64_t *v28 = v31;
  sub_100032F78(v26, &qword_1000B02D8);
  return sub_100033C30((uint64_t)v28, v41, &qword_1000B02E0);
}

uint64_t sub_10005A940(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LimitedUIBackground();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005A9A4()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for CARLimitedUI(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for CARLimitedUI()
{
  return swift_release();
}

void *assignWithCopy for CARLimitedUI(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for CARLimitedUI(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for CARLimitedUI()
{
  return &type metadata for CARLimitedUI;
}

unint64_t sub_10005AA7C()
{
  unint64_t result = qword_1000B0208;
  if (!qword_1000B0208)
  {
    sub_10002F34C(&qword_1000B01F8);
    sub_10005AB1C();
    sub_10002F5CC(&qword_1000B0240, &qword_1000B0200);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0208);
  }
  return result;
}

unint64_t sub_10005AB1C()
{
  unint64_t result = qword_1000B0210;
  if (!qword_1000B0210)
  {
    sub_10002F34C(&qword_1000B01E8);
    sub_10005AB98();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0210);
  }
  return result;
}

unint64_t sub_10005AB98()
{
  unint64_t result = qword_1000B0218;
  if (!qword_1000B0218)
  {
    sub_10002F34C(&qword_1000B01E0);
    sub_10005AC38();
    sub_10002F5CC(&qword_1000B0230, &qword_1000B0238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0218);
  }
  return result;
}

unint64_t sub_10005AC38()
{
  unint64_t result = qword_1000B0220;
  if (!qword_1000B0220)
  {
    sub_10002F34C(&qword_1000B01D8);
    sub_10002F5CC(&qword_1000B0228, &qword_1000B01D0);
    sub_10002F5CC(&qword_1000AEFF0, &qword_1000AEFF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0220);
  }
  return result;
}

void *sub_10005ACFC(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_100032F78((uint64_t)a1, &qword_1000AEB50);
    sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_10005ADD0(void *a1, const void *a2)
{
  if (a1 != a2)
  {
    sub_100032F78((uint64_t)a1, &qword_1000AEB50);
    uint64_t v4 = sub_10002D398(&qword_1000AEB50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10005AEAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10005AEC0);
}

uint64_t sub_10005AEC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000AEB60);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10005AF30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10005AF44);
}

uint64_t sub_10005AF44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000AEB60);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_10005AFB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10005AFD4()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_10005AFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10005B024(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for Image.Scale, (uint64_t (*)(char *))&EnvironmentValues.imageScale.setter);
}

uint64_t sub_10005B024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_10005B0F4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10005B12C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_10005B158()
{
  unint64_t result = qword_1000B0308;
  if (!qword_1000B0308)
  {
    sub_10002F34C(&qword_1000B02E0);
    sub_10002F5CC(&qword_1000B0310, &qword_1000B02D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0308);
  }
  return result;
}

uint64_t sub_10005B2D0()
{
  uint64_t v0 = [objc_allocWithZone((Class)type metadata accessor for CAFUIAccountManager()) init];
  uint64_t v1 = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x68))();

  return v1;
}

NSData *_sSo13CARCarManagerC15CarPlaySettingsE29avatarImageAsNotificationIconSo014UNNotificationJ0CSgyF_0()
{
  uint64_t v0 = type metadata accessor for URL.DirectoryHint();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v29 - v9;
  uint64_t v11 = [objc_allocWithZone((Class)type metadata accessor for CAFUIAccountManager()) init];
  uint64_t v12 = (UIImage *)(*(uint64_t (**)(double))((swift_isaMask & *v11) + 0x70))(29.0);

  if (!v12) {
    return 0;
  }
  uint64_t v13 = UIImagePNGRepresentation(v12);
  if (v13)
  {
    uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v31 = v15;
    uint64_t v32 = v14;

    uint64_t v16 = self;
    id v17 = [v16 defaultManager];
    id v18 = [v17 temporaryDirectory];
    uint64_t v29 = v5;
    uint64_t v30 = v4;
    uint64_t v19 = v4;
    id v20 = v18;

    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v33 = 0xD00000000000001ALL;
    unint64_t v34 = 0x8000000100082080;
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for URL.DirectoryHint.inferFromPath(_:), v0);
    sub_10002F7C8();
    URL.appending<A>(component:directoryHint:)();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v29 + 8);
    v21(v8, v19);
    id v22 = [v16 defaultManager];
    URL.path(percentEncoded:)(1);
    NSString v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    unint64_t v25 = v31;
    uint64_t v24 = v32;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    [v22 createFileAtPath:v23 contents:isa attributes:0];

    URL.path(percentEncoded:)(1);
    NSString v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v13 = (NSData *)[self iconAtPath:v27 shouldSuppressMask:1];

    sub_10005B764(v24, v25);
    v21(v10, v30);
  }
  else
  {
  }
  return v13;
}

uint64_t sub_10005B764(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10005B7BC(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_10005B7F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v5 = a2;
    swift_bridgeObjectRetain();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = a2;
    NSString v6 = 0;
  }
  id v8 = [objc_allocWithZone((Class)CRSUICAPackageView) initWithPackage:a2 state:v6];

  return v8;
}

void sub_10005B884(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    NSString v6 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v6 = 0;
  }
  id v7 = v6;
  [a1 setState:];
}

id sub_10005B8F4()
{
  uint64_t v1 = *(void **)v0;
  if (*(void *)(v0 + 16))
  {
    id v2 = v1;
    swift_bridgeObjectRetain();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = v1;
    NSString v3 = 0;
  }
  id v5 = [objc_allocWithZone((Class)CRSUICAPackageView) initWithPackage:v1 state:v3];

  return v5;
}

void sub_10005B988(void *a1)
{
  if (*(void *)(v1 + 16)) {
    NSString v3 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v3 = 0;
  }
  id v4 = v3;
  [a1 setState:];
}

uint64_t sub_10005B9F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10005BC20();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10005BA58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10005BC20();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10005BABC()
{
}

uint64_t destroy for CAPackageView(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s15CarPlaySettings13CAPackageViewVwCP_0(void *a1, uint64_t a2)
{
  NSString v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CAPackageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CAPackageView(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CAPackageView()
{
  return &type metadata for CAPackageView;
}

unint64_t sub_10005BC20()
{
  unint64_t result = qword_1000B0318;
  if (!qword_1000B0318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0318);
  }
  return result;
}

uint64_t sub_10005BC74()
{
  return swift_retain();
}

id sub_10005BC84()
{
  return *(id *)(v0 + OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_clusterThemeManager);
}

id sub_10005BC94()
{
  return *(id *)(v0 + OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_carSession);
}

id sub_10005BCA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_theme] = a1;
  *(void *)&v7[OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_clusterThemeManager] = a2;
  *(void *)&v7[OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_carSession] = a3;
  v9.receiver = v7;
  v9.super_class = v3;
  return [super initWithNibName:0 bundle:0];
}

id sub_10005BD24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_theme] = a1;
  *(void *)&v3[OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_clusterThemeManager] = a2;
  *(void *)&v3[OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_carSession] = a3;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for CARThemeEditorViewController();
  return [super initWithNibName:0 bundle:0];
}

uint64_t type metadata accessor for CARThemeEditorViewController()
{
  return self;
}

void sub_10005BDA8()
{
}

id sub_10005BE60()
{
  uint64_t v1 = v0;
  uint64_t v126 = type metadata accessor for CARThemeEditor();
  __chkstk_darwin(v126);
  uint64_t v122 = (uint64_t)&v114 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10002D398(&qword_1000B0338);
  uint64_t v127 = *(void *)(v3 - 8);
  uint64_t v128 = v3;
  __chkstk_darwin(v3);
  long long v123 = (char *)&v114 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10002D398(&qword_1000B0340);
  uint64_t v129 = *(void *)(v5 - 8);
  uint64_t v130 = v5;
  __chkstk_darwin(v5);
  long long v124 = (char *)&v114 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_10002D398((uint64_t *)&unk_1000B0348);
  uint64_t v7 = __chkstk_darwin(v121);
  uint64_t v125 = (uint64_t)&v114 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v131 = (char *)&v114 - v9;
  uint64_t v10 = (objc_class *)type metadata accessor for CARThemeEditorViewController();
  v139.receiver = v0;
  v139.super_class = v10;
  [super viewDidLoad];
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = sub_1000210C8(v11);

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = objc_allocWithZone((Class)CPUIBarButtonItem);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v15 = [v13 initWithTitle:v14 image:0 style:0 type:2];

  id v16 = [v15 button];
  NSString v17 = String._bridgeToObjectiveC()();
  [v16 setAccessibilityIdentifier:v17];

  [v15 setCpui_delegate:v1];
  id v18 = [self preferredFontForTextStyle:UIFontTextStyleCallout];
  [v15 setFont:v18];

  uint64_t v19 = self;
  id v20 = [v19 labelColor];
  [v15 setNormalColor:v20];

  id v21 = [v19 labelColor];
  id v22 = [v21 colorWithAlphaComponent:0.2];

  [v15 setFocusedColor:v22];
  id v23 = [v19 clearColor];
  [v15 setNormalBackgroundColor:v23];

  id v24 = [v19 clearColor];
  [v15 setFocusedBackgroundColor:v24];

  NSString v25 = String._bridgeToObjectiveC()();
  id v26 = sub_1000210C8(v25);

  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  long long v28 = (void *)sub_100061020(v27);
  swift_bridgeObjectRelease();
  [v28 addTarget:v1 action:"resetHandler" forControlEvents:64];
  id v29 = v28;
  NSString v30 = String._bridgeToObjectiveC()();
  [v29 setAccessibilityIdentifier:v30];

  id v31 = [v1 navigationItem];
  id v133 = v15;
  [v31 setLeftBarButtonItem:v15];

  v134 = v1;
  id v32 = [v1 navigationItem];
  id v33 = [objc_allocWithZone((Class)UIBarButtonItem) initWithCustomView:v29];
  [v32 setRightBarButtonItem:v33];

  id v34 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v35 = self;
  id v36 = [v35 preferredFontForTextStyle:UIFontTextStyleCallout];
  id v37 = [v36 fontDescriptor];
  id v38 = [v37 fontDescriptorWithSymbolicTraits:2];

  if (v38)
  {
    [v36 pointSize];
    id v39 = [v35 fontWithDescriptor:v38];

    id v36 = v39;
  }
  [v34 setFont:v36];

  uint64_t v40 = v134;
  id v41 = [v134 navigationItem];
  [v41 setTitleView:v34];

  type metadata accessor for MainActor();
  id v42 = v34;
  uint64_t v43 = static MainActor.shared.getter();
  uint64_t v44 = (void *)swift_allocObject();
  v44[2] = v43;
  v44[3] = &protocol witness table for MainActor;
  v44[4] = v42;
  id v45 = v42;
  uint64_t v46 = static MainActor.shared.getter();
  uint64_t v47 = (void *)swift_allocObject();
  v47[2] = v46;
  v47[3] = &protocol witness table for MainActor;
  id v116 = v45;
  v47[4] = v45;
  sub_10002D398(&qword_1000AF7C0);
  Binding.init(get:set:)();
  uint64_t v49 = v135;
  uint64_t v48 = v136;
  uint64_t v120 = v137;
  uint64_t v132 = v138;
  uint64_t v119 = *(void *)&v40[OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_theme];
  swift_retain();
  id v50 = [v133 button];
  uint64_t v51 = static MainActor.shared.getter();
  uint64_t v52 = (void *)swift_allocObject();
  void v52[2] = v51;
  v52[3] = &protocol witness table for MainActor;
  v52[4] = v50;
  id v53 = v50;
  uint64_t v54 = static MainActor.shared.getter();
  uint64_t v55 = (void *)swift_allocObject();
  v55[2] = v54;
  v55[3] = &protocol witness table for MainActor;
  v55[4] = v53;
  Binding.init(get:set:)();

  uint64_t v56 = v136;
  uint64_t v118 = v135;
  int v117 = v137;
  swift_bridgeObjectRetain();
  id v57 = v29;
  uint64_t v58 = v48;
  swift_retain();
  swift_retain();
  uint64_t v59 = static MainActor.shared.getter();
  int v60 = (void *)swift_allocObject();
  v60[2] = v59;
  v60[3] = &protocol witness table for MainActor;
  v60[4] = v57;
  id v61 = v57;
  uint64_t v62 = static MainActor.shared.getter();
  int v63 = (void *)swift_allocObject();
  v63[2] = v62;
  v63[3] = &protocol witness table for MainActor;
  id v115 = v61;
  v63[4] = v61;
  Binding.init(get:set:)();
  uint64_t v64 = v135;
  uint64_t v65 = v136;
  LOBYTE(v61) = v137;
  uint64_t v66 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v113 = v64;
  uint64_t v67 = v122;
  uint64_t v68 = v119;
  uint64_t v69 = v118;
  uint64_t v119 = v49;
  uint64_t v118 = v58;
  sub_10005CFE0(v68, v69, v56, v117, v49, v58, v120, v132, v122, v113, v65, (char)v61, (uint64_t)sub_1000615A4, v66);
  uint64_t v70 = sub_1000632A0(&qword_1000B0358, (void (*)(uint64_t))type metadata accessor for CARThemeEditor);
  int v71 = v123;
  uint64_t v72 = v126;
  sub_10003C8FC(v126);
  sub_100061628(v67);
  uint64_t v73 = *(void **)&v40[OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_carSession];
  uint64_t v135 = v72;
  uint64_t v136 = v70;
  swift_getOpaqueTypeConformance2();
  uint64_t v74 = v124;
  uint64_t v75 = v128;
  sub_10004AA48(v73, v128);
  (*(void (**)(char *, uint64_t))(v127 + 8))(v71, v75);
  uint64_t KeyPath = swift_getKeyPath();
  unsigned __int8 v77 = *(void **)&v40[OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_clusterThemeManager];
  uint64_t v79 = v129;
  uint64_t v78 = v130;
  uint64_t v80 = (uint64_t)v131;
  (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v131, v74, v130);
  uint64_t v81 = (uint64_t *)(v80 + *(int *)(v121 + 36));
  *uint64_t v81 = KeyPath;
  v81[1] = (uint64_t)v77;
  uint64_t v82 = *(void (**)(char *, uint64_t))(v79 + 8);
  id v83 = v77;
  v82(v74, v78);
  sub_100033C94(v80, v125, (uint64_t *)&unk_1000B0348);
  id v84 = objc_allocWithZone((Class)sub_10002D398(&qword_1000B0360));
  unsigned __int8 v85 = (void *)UIHostingController.init(rootView:)();
  [v85 willMoveToParentViewController:v40];
  [v40 addChildViewController:v85];
  id result = [v40 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v87 = result;
  id result = [v85 view];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v88 = result;
  [v87 addSubview:result];

  id result = [v85 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  char v89 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_10002D398((uint64_t *)&unk_1000AFA30);
  uint64_t v90 = swift_allocObject();
  *(_OWORD *)(v90 + 16) = xmmword_100072210;
  id result = [v85 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v91 = result;
  id v92 = [result leadingAnchor];

  id result = [v134 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v93 = result;
  id v94 = [result leadingAnchor];

  id v95 = [v92 constraintEqualToAnchor:v94];
  *(void *)(v90 + 32) = v95;
  id result = [v85 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v96 = result;
  id v97 = [result trailingAnchor];

  id result = [v134 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v98 = result;
  id v99 = [result trailingAnchor];

  id v100 = [v97 constraintEqualToAnchor:v99];
  *(void *)(v90 + 40) = v100;
  id result = [v85 view];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v101 = result;
  id v102 = [result topAnchor];

  id result = [v134 view];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v103 = result;
  id v104 = [result topAnchor];

  id v105 = [v102 constraintEqualToAnchor:v104];
  *(void *)(v90 + 48) = v105;
  id result = [v85 view];
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v106 = result;
  id v107 = [result bottomAnchor];

  id result = [v134 view];
  if (result)
  {
    id v108 = result;
    uint64_t v109 = self;
    id v110 = [v108 bottomAnchor];

    id v111 = [v107 constraintEqualToAnchor:v110];
    *(void *)(v90 + 56) = v111;
    uint64_t v135 = v90;
    specialized Array._endMutation()();
    sub_10002F83C(0, (unint64_t *)&qword_1000AF2E0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v109 activateConstraints:isa];

    swift_bridgeObjectRelease();
    swift_release();
    swift_release();

    return (id)sub_100032F78(v80, (uint64_t *)&unk_1000B0348);
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CARThemeEditor()
{
  uint64_t result = qword_1000B1EA0;
  if (!qword_1000B1EA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10005CDFC(uint64_t *a1, int a2, id a3)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  id v6 = [a3 text];
  id v7 = v6;
  if (v6) {

  }
  if (v4) {
    NSString v8 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v8 = 0;
  }
  [a3 setText:v8];

  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(unsigned char *)(v9 + 24) = v7 != 0;
  *(void *)(v9 + 32) = v5;
  *(void *)(v9 + 40) = v4;
  id v10 = a3;
  swift_bridgeObjectRetain();
  if (Transaction.disablesAnimations.getter())
  {
    [v10 alpha];
    double v12 = 0.0;
    if (v4)
    {
      double v12 = v11;
      double v11 = 1.0;
    }
    if (v7) {
      double v11 = v12;
    }
    [v10 setAlpha:v11];
    return swift_release();
  }
  else
  {
    uint64_t v14 = sub_10002F83C(0, &qword_1000AFC80);
    __chkstk_darwin(v14);
    static Animation.default.getter();
    static UIView.animate(with:changes:completion:)();
    swift_release();
    return swift_release();
  }
}

uint64_t sub_10005CFE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  *(void *)a9 = swift_getKeyPath();
  *(unsigned char *)(a9 + 8) = 0;
  id v18 = (int *)type metadata accessor for CARThemeEditor();
  type metadata accessor for CARThemeModel();
  sub_1000632A0(&qword_1000AF598, (void (*)(uint64_t))type metadata accessor for CARThemeModel);
  swift_retain();
  Bindable<A>.init(wrappedValue:)();
  uint64_t v19 = (void *)(a9 + v18[9]);
  void *v19 = a13;
  v19[1] = a14;
  uint64_t v20 = a9 + v18[6];
  *(void *)uint64_t v20 = a2;
  *(void *)(v20 + 8) = a3;
  *(unsigned char *)(v20 + 16) = a4;
  id v21 = (void *)(a9 + v18[7]);
  void *v21 = a5;
  v21[1] = a6;
  void v21[2] = a7;
  v21[3] = a8;
  uint64_t v22 = a9 + v18[8];
  *(void *)uint64_t v22 = a10;
  *(void *)(v22 + 8) = a11;
  *(unsigned char *)(v22 + 16) = a12;
  NSString v30 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 216);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v23 = swift_bridgeObjectRetain();
  unint64_t v24 = v30(v23);
  if (v24 >> 62) {
    uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  uint64_t v27 = a9 + v18[10];
  *(unsigned char *)uint64_t v27 = v25 < 2;
  *(void *)(v27 + 8) = 0;
  return result;
}

void sub_10005D29C(char a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for CARThemeEditorViewController();
  [super viewWillAppear:a1 & 1];
  id v3 = [v1 navigationController];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [v3 navigationBar];

    [v5 setBarStyle:4];
  }
}

id sub_10005D3EC()
{
  uint64_t v1 = v0;
  sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
  uint64_t v2 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  return [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_10005D53C()
{
  id v1 = [v0 presentedViewController];

  if (!v1)
  {
    NSString v2 = String._bridgeToObjectiveC()();
    id v3 = sub_1000210C8(v2);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v5 = [self alertControllerWithTitle:0 message:v4 preferredStyle:0];

    NSString v6 = String._bridgeToObjectiveC()();
    id v7 = sub_1000210C8(v6);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    v17[4] = sub_100061684;
    v17[5] = v8;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 1107296256;
    v17[2] = sub_10005D860;
    void v17[3] = &unk_1000938C0;
    id v10 = _Block_copy(v17);
    swift_release();
    double v11 = self;
    id v12 = [v11 actionWithTitle:v9 style:2 handler:v10];
    _Block_release(v10);
    swift_release();

    [v5 addAction:v12];
    NSString v13 = String._bridgeToObjectiveC()();
    id v14 = sub_1000210C8(v13);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v16 = [v11 actionWithTitle:v15 style:1 handler:0];

    [v5 addAction:v16];
    [v5 setPreferredAction:v12];
    [v0 presentViewController:v5 animated:1 completion:0];
  }
}

void sub_10005D860(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

BOOL sub_10005D910(char a1, char a2)
{
  return a1 == a2;
}

unint64_t sub_10005D920(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10002D398(&qword_1000B05D0);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100033C94(v6, (uint64_t)&v13, &qword_1000B05D8);
    uint64_t v7 = v13;
    unint64_t result = sub_100060E14(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100063160(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

uint64_t sub_10005DA50()
{
  return (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x70))();
}

void sub_10005DB20()
{
}

id sub_10005DB84()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CARThemeEditorViewController();
  [super dealloc];
}

void sub_10005DC14(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10005DC3C(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL sub_10005DC84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10005DC98(char a1)
{
  if (a1) {
    return 0x657061706C6C6177;
  }
  else {
    return 0x657474656C6170;
  }
}

uint64_t sub_10005DCD4(char *a1, char *a2)
{
  return sub_10005DCE0(*a1, *a2);
}

uint64_t sub_10005DCE0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x657061706C6C6177;
  }
  else {
    uint64_t v3 = 0x657474656C6170;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE900000000000072;
  }
  if (a2) {
    uint64_t v5 = 0x657061706C6C6177;
  }
  else {
    uint64_t v5 = 0x657474656C6170;
  }
  if (a2) {
    unint64_t v6 = 0xE900000000000072;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_10005DD88()
{
  return sub_10005DD90();
}

Swift::Int sub_10005DD90()
{
  return Hasher._finalize()();
}

uint64_t sub_10005DE18()
{
  return sub_10005DE20();
}

uint64_t sub_10005DE20()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10005DE90()
{
  return sub_10005DE98();
}

Swift::Int sub_10005DE98()
{
  return Hasher._finalize()();
}

uint64_t sub_10005DF1C@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100093758, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_10005DF7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10005DC98(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10005DFA8()
{
  return sub_10005DC98(*v0);
}

uint64_t sub_10005DFB0()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  sub_1000313D4(v1, v2);
  char v3 = sub_1000310F0(v1, v2);
  sub_1000313E0(v1, v2);
  return v3 & 1;
}

uint64_t sub_10005E008()
{
  return swift_getKeyPath();
}

uint64_t sub_10005E02C()
{
  type metadata accessor for CARThemeModel();
  sub_1000632A0(&qword_1000AF598, (void (*)(uint64_t))type metadata accessor for CARThemeModel);

  return Bindable<A>.init(wrappedValue:)();
}

uint64_t sub_10005E0B8()
{
  type metadata accessor for CARThemeEditor();
  sub_10002D398(&qword_1000B0368);
  Bindable.wrappedValue.getter();
  return v1;
}

uint64_t sub_10005E104()
{
  return Bindable.wrappedValue.setter();
}

void (*sub_10005E154(void *a1))(void *a1)
{
  char v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CARThemeEditor();
  sub_10002D398(&qword_1000B0368);
  v2[4] = Bindable.wrappedValue.modify();
  return sub_1000368E8;
}

uint64_t sub_10005E1D0()
{
  return Bindable.projectedValue.getter();
}

uint64_t sub_10005E214()
{
  type metadata accessor for CARThemeEditor();
  sub_10002D398((uint64_t *)&unk_1000B0370);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_10005E274()
{
  return Binding.wrappedValue.setter();
}

uint64_t (*sub_10005E2DC(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for CARThemeEditor() + 24));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[3] = *v4;
  v3[4] = v6;
  LOBYTE(v4) = *((unsigned char *)v4 + 16);
  *((unsigned char *)v3 + 19) = (_BYTE)v4;
  *char v3 = v5;
  v3[1] = v6;
  *((unsigned char *)v3 + 16) = (_BYTE)v4;
  swift_retain();
  swift_retain();
  void v3[5] = sub_10002D398((uint64_t *)&unk_1000B0370);
  Binding.wrappedValue.getter();
  return sub_10005E384;
}

uint64_t sub_10005E388()
{
  type metadata accessor for CARThemeEditor();
  sub_10002D398((uint64_t *)&unk_1000B0370);
  Binding.projectedValue.getter();
  return v1;
}

uint64_t sub_10005E3EC()
{
  type metadata accessor for CARThemeEditor();
  sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_10005E44C()
{
  return Binding.wrappedValue.setter();
}

void (*sub_10005E4C0(void *a1))(uint64_t a1, char a2)
{
  char v3 = malloc(0x68uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for CARThemeEditor() + 28));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  unsigned char v3[8] = *v4;
  v3[9] = v6;
  uint64_t v8 = v4[2];
  uint64_t v7 = v4[3];
  v3[10] = v8;
  v3[11] = v7;
  *char v3 = v5;
  v3[1] = v6;
  v3[2] = v8;
  v3[3] = v7;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v3[12] = sub_10002D398(&qword_1000AF7A0);
  Binding.wrappedValue.getter();
  return sub_100041C6C;
}

uint64_t sub_10005E578()
{
  type metadata accessor for CARThemeEditor();
  sub_10002D398(&qword_1000AF7A0);
  Binding.projectedValue.getter();
  return v1;
}

uint64_t sub_10005E5DC()
{
  type metadata accessor for CARThemeEditor();
  sub_10002D398((uint64_t *)&unk_1000B0370);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_10005E63C()
{
  return Binding.wrappedValue.setter();
}

uint64_t (*sub_10005E6A4(void *a1))()
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for CARThemeEditor() + 32));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[3] = *v4;
  v3[4] = v6;
  LOBYTE(v4) = *((unsigned char *)v4 + 16);
  *((unsigned char *)v3 + 19) = (_BYTE)v4;
  *char v3 = v5;
  v3[1] = v6;
  *((unsigned char *)v3 + 16) = (_BYTE)v4;
  swift_retain();
  swift_retain();
  void v3[5] = sub_10002D398((uint64_t *)&unk_1000B0370);
  Binding.wrappedValue.getter();
  return sub_10005E384;
}

void sub_10005E74C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  char v2 = *(unsigned char *)(*(void *)a1 + 17);
  uint64_t v3 = *(void *)(*(void *)a1 + 32);
  char v4 = *(unsigned char *)(*(void *)a1 + 19);
  *uint64_t v1 = *(void *)(*(void *)a1 + 24);
  v1[1] = v3;
  *((unsigned char *)v1 + 16) = v4;
  *((unsigned char *)v1 + 18) = v2;
  Binding.wrappedValue.setter();
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_10005E7BC()
{
  type metadata accessor for CARThemeEditor();
  sub_10002D398((uint64_t *)&unk_1000B0370);
  Binding.projectedValue.getter();
  return v1;
}

uint64_t sub_10005E820()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CARThemeEditor() + 36));
  swift_retain();
  return v1;
}

uint64_t sub_10005E860()
{
  State.init(wrappedValue:)();
  return v1;
}

uint64_t sub_10005E8A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v91 = a1;
  uint64_t v3 = type metadata accessor for CARThemeEditor();
  uint64_t v93 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v94 = v4;
  uint64_t v96 = (uint64_t)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10002D398(&qword_1000B0380);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10002D398(&qword_1000B0388);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10002D398(&qword_1000B0390);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (uint64_t)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v95 = (int *)sub_10002D398(&qword_1000B0398);
  __chkstk_darwin(v95);
  uint64_t OpaqueTypeConformance2 = (uint64_t)&v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10002D398(&qword_1000B03A0);
  uint64_t v83 = *(void *)(v16 - 8);
  uint64_t v84 = v16;
  __chkstk_darwin(v16);
  uint64_t v82 = (char *)&v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_10002D398(&qword_1000B03A8);
  uint64_t v86 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  unsigned __int8 v85 = (char *)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10002D398(&qword_1000B03B0);
  uint64_t v89 = *(void *)(v19 - 8);
  uint64_t v90 = v19;
  __chkstk_darwin(v19);
  uint64_t v87 = (char *)&v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005F258(v2, (uint64_t)v7);
  static Alignment.center.getter();
  sub_10005F9FC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, INFINITY, 0);
  sub_100032F78((uint64_t)v7, &qword_1000B0380);
  uint64_t v21 = static SafeAreaRegions.container.getter();
  LOBYTE(v7) = static Edge.Set.top.getter();
  sub_100033C94((uint64_t)v10, v14, &qword_1000B0388);
  uint64_t v22 = v2;
  uint64_t v23 = v14;
  uint64_t v24 = v14 + *(int *)(v12 + 44);
  *(void *)uint64_t v24 = v21;
  *(unsigned char *)(v24 + 8) = (_BYTE)v7;
  sub_100032F78((uint64_t)v10, &qword_1000B0388);
  uint64_t v79 = static Alignment.center.getter();
  uint64_t v26 = v25;
  uint64_t v27 = *(void *)v2;
  LOBYTE(v2) = *(unsigned char *)(v2 + 8);
  sub_1000313D4(v27, v2);
  LOBYTE(v14) = sub_1000310F0(v27, v2);
  sub_1000313E0(v27, v2);
  if (v14)
  {
    long long v28 = (uint64_t *)(v22 + *(int *)(v3 + 36));
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    swift_retain();
    uint64_t v32 = nullsub_8(v29, v30, v31);
    uint64_t v34 = v33;
    uint64_t v35 = static SafeAreaRegions.container.getter();
    char v36 = static Edge.Set.top.getter();
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    char v36 = 0;
  }
  uint64_t v92 = v22;
  uint64_t v37 = v23;
  uint64_t v38 = v23;
  uint64_t v39 = OpaqueTypeConformance2;
  sub_100033C94(v38, OpaqueTypeConformance2, &qword_1000B0390);
  uint64_t v40 = v39 + v95[9];
  *(void *)uint64_t v40 = v32;
  *(void *)(v40 + 8) = v34;
  *(void *)(v40 + 16) = v35;
  *(unsigned char *)(v40 + 24) = v36;
  *(void *)(v40 + 32) = v79;
  *(void *)(v40 + 40) = v26;
  sub_100032F78(v37, &qword_1000B0390);
  uint64_t v80 = v3;
  uint64_t v41 = v22 + *(int *)(v3 + 40);
  char v42 = *(unsigned char *)v41;
  uint64_t v43 = *(ValueMetadata **)(v41 + 8);
  LOBYTE(v99) = v42;
  id v100 = v43;
  sub_10002D398(&qword_1000B03B8);
  State.wrappedValue.getter();
  LOBYTE(v99) = v97;
  uint64_t v44 = v96;
  sub_100061784(v22, v96);
  uint64_t v45 = *(unsigned __int8 *)(v93 + 80);
  v94 += (v45 + 16) & ~v45;
  uint64_t v46 = (v45 + 16) & ~v45;
  uint64_t v79 = v46;
  uint64_t v93 = v45 | 7;
  uint64_t v47 = swift_allocObject();
  sub_1000617EC(v44, v47 + v46);
  unint64_t v48 = sub_100061868();
  unint64_t v49 = sub_100061C90();
  id v50 = v82;
  uint64_t v51 = v95;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  sub_100032F78(v39, &qword_1000B0398);
  uint64_t v52 = *(void *)v22;
  char v53 = *(unsigned char *)(v22 + 8);
  sub_1000313D4(*(void *)v22, v53);
  char v54 = sub_1000310F0(v52, v53);
  sub_1000313E0(v52, v53);
  LOBYTE(v97) = v54 & 1;
  sub_100061784(v22, v44);
  uint64_t v55 = swift_allocObject();
  uint64_t v56 = v79;
  sub_1000617EC(v44, v55 + v79);
  id v99 = v51;
  id v100 = &type metadata for CARThemeEditor.EditingMode;
  uint64_t v101 = v48;
  id v102 = (void *)v49;
  id v95 = (int *)&opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v57 = v84;
  uint64_t v58 = v85;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v50, v57);
  uint64_t v59 = v92;
  uint64_t v83 = v92 + *(int *)(v80 + 20);
  uint64_t v82 = (char *)sub_10002D398(&qword_1000B0368);
  uint64_t v60 = Bindable.wrappedValue.getter();
  id v61 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v99 + 184))(v60);
  swift_release();
  uint64_t v62 = CRSUIClusterThemeWallpaper.id.getter();
  uint64_t v64 = v63;

  uint64_t v97 = v62;
  uint64_t v98 = v64;
  uint64_t v65 = v96;
  sub_100061784(v59, v96);
  uint64_t v66 = swift_allocObject();
  sub_1000617EC(v65, v66 + v56);
  id v99 = (int *)v57;
  id v100 = (ValueMetadata *)&type metadata for Bool;
  uint64_t v101 = OpaqueTypeConformance2;
  id v102 = &protocol witness table for Bool;
  uint64_t v67 = swift_getOpaqueTypeConformance2();
  uint64_t v68 = v87;
  uint64_t v69 = v88;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v58, v69);
  uint64_t v70 = Bindable.wrappedValue.getter();
  int v71 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v99 + 136))(v70);
  swift_release();
  uint64_t v72 = CRSUIClusterThemePalette.id.getter();
  uint64_t v74 = v73;

  uint64_t v97 = v72;
  uint64_t v98 = v74;
  sub_100061784(v92, v65);
  uint64_t v75 = swift_allocObject();
  sub_1000617EC(v65, v75 + v56);
  id v99 = (int *)v69;
  id v100 = (ValueMetadata *)&type metadata for String;
  uint64_t v101 = v67;
  id v102 = &protocol witness table for String;
  swift_getOpaqueTypeConformance2();
  uint64_t v76 = v90;
  View.onChange<A>(of:initial:_:)();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v89 + 8))(v68, v76);
}

uint64_t sub_10005F258@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v3 = type metadata accessor for CARThemeEditor();
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v27 + 64);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10002D398(&qword_1000B0368);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_10002D398(&qword_1000B0598);
  __chkstk_darwin(v28);
  uint64_t v10 = (_OWORD *)((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v29 = sub_10002D398(&qword_1000B03F8);
  __chkstk_darwin(v29);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1 + *(int *)(v3 + 40);
  char v14 = *(unsigned char *)v13;
  uint64_t v15 = *(void *)(v13 + 8);
  LOBYTE(v34[0]) = v14;
  *((void *)&v34[0] + 1) = v15;
  sub_10002D398(&qword_1000B03B8);
  State.wrappedValue.getter();
  if (v31)
  {
    uint64_t v16 = Bindable.wrappedValue.getter();
    uint64_t v17 = (*(uint64_t (**)(uint64_t))(**(void **)&v34[0] + 224))(v16);
    swift_release();
    Bindable.projectedValue.getter();
    swift_getKeyPath();
    Bindable<A>.subscript.getter();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v18 = v31;
    uint64_t v19 = v32;
    uint64_t v20 = v33;
    sub_100061784(a1, (uint64_t)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v21 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    uint64_t v22 = swift_allocObject();
    sub_1000617EC((uint64_t)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21);
    sub_100053608(v17, v18, v19, v20, (uint64_t)sub_100062CE8, v22, (uint64_t)v34);
    long long v23 = v34[3];
    void v10[2] = v34[2];
    void v10[3] = v23;
    long long v24 = v34[5];
    void v10[4] = v34[4];
    v10[5] = v24;
    long long v25 = v34[1];
    *uint64_t v10 = v34[0];
    v10[1] = v25;
    swift_storeEnumTagMultiPayload();
    sub_100061AD0();
    sub_100061C3C();
    return _ConditionalContent<>.init(storage:)();
  }
  else
  {
    sub_10005F64C((uint64_t)v12);
    sub_100033C94((uint64_t)v12, (uint64_t)v10, &qword_1000B03F8);
    swift_storeEnumTagMultiPayload();
    sub_100061AD0();
    sub_100061C3C();
    _ConditionalContent<>.init(storage:)();
    return sub_100032F78((uint64_t)v12, &qword_1000B03F8);
  }
}

uint64_t sub_10005F64C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = sub_10002D398(&qword_1000B0440) - 8;
  __chkstk_darwin(v43);
  uint64_t v42 = (uint64_t)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10002D398(&qword_1000B0368);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CARThemeEditor();
  uint64_t v7 = Bindable.wrappedValue.getter();
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v46 + 216))(v7);
  swift_release();
  Bindable.projectedValue.getter();
  swift_getKeyPath();
  Bindable<A>.subscript.getter();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v9 = nullsub_8(v8, v46, *((void *)&v46 + 1));
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v16 = static Alignment.center.getter();
  sub_10005FBBC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v45, 0.0, 1, INFINITY, 0, v16, v17, v9, v11, v13, v15);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  long long v52 = v45[6];
  long long v53 = v45[7];
  long long v54 = v45[8];
  long long v48 = v45[2];
  long long v49 = v45[3];
  long long v50 = v45[4];
  long long v51 = v45[5];
  long long v46 = v45[0];
  long long v47 = v45[1];
  uint64_t v18 = static Alignment.center.getter();
  uint64_t v40 = v19;
  uint64_t v20 = Bindable.wrappedValue.getter();
  unint64_t v21 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v44 + 184))(v20);
  swift_release();
  id v22 = [v21 data];

  uint64_t v25 = nullsub_8(v22, v23, v24);
  uint64_t v26 = static SafeAreaRegions.all.getter();
  LOBYTE(v3) = static Edge.Set.all.getter();
  uint64_t v27 = static Alignment.bottom.getter();
  uint64_t v29 = v28;
  uint64_t v30 = v42;
  sub_100060334(v41, v42);
  uint64_t v31 = (uint64_t *)(v30 + *(int *)(v43 + 44));
  *uint64_t v31 = v27;
  v31[1] = v29;
  uint64_t v32 = sub_10002D398(&qword_1000B03F8);
  sub_100033C94(v30, a1 + *(int *)(v32 + 36), &qword_1000B0440);
  long long v33 = v53;
  *(_OWORD *)(a1 + 96) = v52;
  *(_OWORD *)(a1 + 112) = v33;
  *(_OWORD *)(a1 + 128) = v54;
  long long v34 = v49;
  *(_OWORD *)(a1 + 32) = v48;
  *(_OWORD *)(a1 + 48) = v34;
  long long v35 = v51;
  *(_OWORD *)(a1 + 64) = v50;
  *(_OWORD *)(a1 + 80) = v35;
  long long v36 = v47;
  *(_OWORD *)a1 = v46;
  *(_OWORD *)(a1 + 16) = v36;
  *(void *)(a1 + 144) = v25;
  *(void *)(a1 + 152) = v26;
  *(unsigned char *)(a1 + 160) = v3;
  *(_DWORD *)(a1 + 161) = v45[0];
  *(_DWORD *)(a1 + 164) = *(_DWORD *)((char *)v45 + 3);
  uint64_t v37 = v40;
  *(void *)(a1 + 168) = v18;
  *(void *)(a1 + 176) = v37;
  return sub_100032F78(v30, &qword_1000B0440);
}

__n128 sub_10005F9FC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_100033C94(v13, a9, &qword_1000B0380);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_10002D398(&qword_1000B0388) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  _OWORD *v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_10005FBBC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  uint64_t v21 = a18;
  uint64_t v20 = a19;
  uint64_t v22 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  int v25 = a8 & 1;
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (v25) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    long long v32 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    uint64_t v20 = a19;
    uint64_t v22 = a16;
    uint64_t v21 = a18;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(void *)a9 = v22;
  *(void *)(a9 + 8) = a17;
  *(void *)(a9 + 16) = v21;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v39;
  *(_OWORD *)(a9 + 112) = v40;
  *(_OWORD *)(a9 + 128) = v41;
  *(_OWORD *)(a9 + 32) = v35;
  *(_OWORD *)(a9 + 48) = v36;
  *(_OWORD *)(a9 + 64) = v37;
  *(_OWORD *)(a9 + 80) = v38;
  swift_retain();
  swift_retain();
  id v33 = v20;

  return swift_bridgeObjectRetain();
}

uint64_t sub_10005FDA8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CARThemeEditor();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100061784(a1, (uint64_t)v4);
  sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
  uint64_t v5 = static OS_os_log.default.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446210;
    uint64_t v8 = &v4[*(int *)(v2 + 40)];
    char v9 = *v8;
    uint64_t v10 = *((void *)v8 + 1);
    LOBYTE(v14[0]) = v9;
    v14[1] = v10;
    sub_10002D398(&qword_1000B03B8);
    State.wrappedValue.getter();
    if (v15) {
      uint64_t v11 = 0x657061706C6C6177;
    }
    else {
      uint64_t v11 = 0x657474656C6170;
    }
    if (v15) {
      unint64_t v12 = 0xE900000000000072;
    }
    else {
      unint64_t v12 = 0xE700000000000000;
    }
    v14[0] = sub_10002F8D4(v11, v12, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100061628((uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Customizing theme's %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_100061628((uint64_t)v4);
  }
  return sub_10005FFDC();
}

uint64_t sub_10005FFDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  char v3 = *((unsigned char *)v1 + 8);
  sub_1000313D4(v2, v3);
  char v4 = sub_1000310F0(v2, v3);
  sub_1000313E0(v2, v3);
  uint64_t v5 = type metadata accessor for CARThemeEditor();
  if (v4)
  {
    sub_10002D398((uint64_t *)&unk_1000B0370);
    Binding.wrappedValue.setter();
    sub_10002D398(&qword_1000AF7A0);
    Binding.wrappedValue.setter();
  }
  else
  {
    sub_10002D398(&qword_1000B03B8);
    State.wrappedValue.getter();
    if (v11)
    {
      uint64_t v12 = *(uint64_t *)((char *)v1 + *(int *)(v5 + 24));
      LOBYTE(v11) = 2;
      sub_10002D398((uint64_t *)&unk_1000B0370);
      Binding.wrappedValue.setter();
      sub_10002D398(&qword_1000B0368);
      uint64_t v6 = Bindable.wrappedValue.getter();
      uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v12 + 184))(v6);
      swift_release();
      id v8 = [v7 displayName:v11];

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      sub_10002D398(&qword_1000AF7A0);
      Binding.wrappedValue.setter();
    }
    else
    {
      sub_10002D398((uint64_t *)&unk_1000B0370);
      Binding.wrappedValue.setter();
      uint64_t v13 = *(uint64_t *)((char *)v1 + *(int *)(v5 + 28));
      sub_10002D398(&qword_1000AF7A0);
      Binding.wrappedValue.setter();
      sub_10002D398(&qword_1000B0368);
      uint64_t v9 = Bindable.wrappedValue.getter();
      (*(void (**)(uint64_t))(*(void *)v13 + 208))(v9);
      swift_release();
    }
  }
  return Binding.wrappedValue.setter();
}

uint64_t sub_100060334@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CARThemeEditor();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v43 + 64);
  __chkstk_darwin(v4);
  uint64_t v6 = sub_10002D398(&qword_1000B05A0);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10002D398(&qword_1000B05A8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002D398(&qword_1000B0368);
  uint64_t v13 = Bindable.wrappedValue.getter();
  unint64_t v14 = (*(uint64_t (**)(uint64_t))(**(void **)&v48[0] + 224))(v13);
  swift_release();
  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v15 < 2)
  {
    uint64_t v38 = 1;
  }
  else
  {
    uint64_t v40 = LocalizedStringKey.init(stringLiteral:)();
    uint64_t v17 = v16;
    uint64_t v42 = a2;
    char v19 = v18;
    long long v41 = v8;
    uint64_t v21 = v20;
    sub_100061784(a1, (uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v22 = v10;
    uint64_t v23 = v9;
    unint64_t v24 = (*(unsigned __int8 *)(v43 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v25 = swift_allocObject();
    uint64_t v26 = v25 + v24;
    uint64_t v9 = v23;
    uint64_t v10 = v22;
    sub_1000617EC((uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v26);
    sub_100032058(v40, v17, v19 & 1, v21, 0xD000000000000012, 0x80000001000822C0, (uint64_t)sub_100062EE4, v25, (uint64_t)v48);
    long long v44 = v48[0];
    long long v45 = v48[1];
    long long v46 = v48[2];
    long long v47 = v48[3];
    sub_10004A018();
    uint64_t v27 = (uint64_t)v41;
    View.accessibilityIdentifier(_:)();
    sub_1000589EC((uint64_t)v48);
    char v28 = static Edge.Set.all.getter();
    EdgeInsets.init(_all:)();
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    sub_100033C94(v27, (uint64_t)v12, &qword_1000B05A0);
    long long v37 = &v12[*(int *)(v9 + 36)];
    *long long v37 = v28;
    a2 = v42;
    *((void *)v37 + 1) = v30;
    *((void *)v37 + 2) = v32;
    *((void *)v37 + 3) = v34;
    *((void *)v37 + 4) = v36;
    v37[40] = 0;
    sub_100032F78(v27, &qword_1000B05A0);
    sub_100062F8C((uint64_t)v12, a2);
    uint64_t v38 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a2, v38, 1, v9);
}

uint64_t sub_100060744(uint64_t a1)
{
  BOOL v2 = sub_100060808();
  if (v2)
  {
    __chkstk_darwin(v2);
    static Animation.default.getter();
    withAnimation<A>(_:_:)();
    return swift_release();
  }
  else
  {
    uint64_t v4 = type metadata accessor for CARThemeEditor();
    return (*(uint64_t (**)(void))(a1 + *(int *)(v4 + 36)))();
  }
}

BOOL sub_100060808()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CARThemeEditor();
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v0 + *(int *)(v3 + 40);
  char v7 = *(unsigned char *)v6;
  uint64_t v8 = *(void *)(v6 + 8);
  LOBYTE(v15) = v7;
  uint64_t v16 = v8;
  sub_10002D398(&qword_1000B03B8);
  State.wrappedValue.getter();
  if ((v17 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_100061784(v0, (uint64_t)v5);
    goto LABEL_7;
  }
  char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  sub_100061784(v1, (uint64_t)v5);
  if (v9)
  {
LABEL_7:
    sub_100061628((uint64_t)v5);
    return 0;
  }
  sub_10002D398(&qword_1000B0368);
  uint64_t v10 = Bindable.wrappedValue.getter();
  unint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 216))(v10);
  swift_release();
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  sub_100061628((uint64_t)v5);
  return v12 != 1;
}

uint64_t sub_1000609E0(uint64_t a1, uint64_t a2)
{
  return sub_100060B4C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000609F8(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100060A70(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100060AF0@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100060B34(uint64_t a1, uint64_t a2)
{
  return sub_100060B4C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100060B4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100060B90()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100060BE4()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100060C58()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100060CE4@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100060D2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100060D58(uint64_t a1)
{
  uint64_t v2 = sub_1000632A0(&qword_1000B0600, (void (*)(uint64_t))type metadata accessor for Key);
  uint64_t v3 = sub_1000632A0(&qword_1000B0608, (void (*)(uint64_t))type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_100060E14(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_100060EA8(a1, v2);
}

unint64_t sub_100060EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
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
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
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

uint64_t sub_100061020(uint64_t a1)
{
  v26[1] = a1;
  uint64_t v1 = type metadata accessor for AttributeContainer();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_10002D398(&qword_1000B05B0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for UIButton.Configuration();
  uint64_t v5 = *(void *)(v27 - 8);
  uint64_t v6 = __chkstk_darwin(v27);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v26 - v9;
  static UIButton.Configuration.plain()();
  id v11 = [self preferredFontForTextStyle:UIFontTextStyleCallout];
  id v12 = [self labelColor];
  UIButton.Configuration.baseForegroundColor.setter();
  sub_10002D398(&qword_1000B05B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100072CC0;
  *(void *)(inited + 32) = NSFontAttributeName;
  *(void *)(inited + 64) = sub_10002F83C(0, &qword_1000B05C0);
  *(void *)(inited + 40) = v11;
  swift_bridgeObjectRetain();
  uint64_t v14 = NSFontAttributeName;
  id v15 = v11;
  sub_10005D920(inited);
  AttributeContainer.init(_:)();
  AttributedString.init(_:attributes:)();
  uint64_t v16 = type metadata accessor for AttributedString();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v4, 0, 1, v16);
  UIButton.Configuration.attributedTitle.setter();
  [v15 pointSize];
  double v18 = v17;
  char v19 = self;
  id v20 = [v19 configurationWithPointSize:7 weight:2 scale:v18];
  id v21 = [v19 configurationPreferringMonochrome];
  id v22 = [v20 configurationByApplyingConfiguration:v21];

  UIButton.Configuration.image.setter();
  UIButton.Configuration.imagePadding.setter();
  sub_10002F83C(0, &qword_1000B05C8);
  uint64_t v23 = v27;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v27);
  uint64_t v24 = UIButton.init(configuration:primaryAction:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v23);
  return v24;
}

void sub_1000613E8(uint64_t *a1@<X8>)
{
  id v3 = [*(id *)(v1 + 32) text];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
}

uint64_t sub_100061454(uint64_t *a1, int a2)
{
  return sub_10005CDFC(a1, a2, *(id *)(v2 + 32));
}

id sub_100061470@<X0>(char *a1@<X8>)
{
  id v3 = *(void **)(v1 + 32);
  id result = [v3 isHidden];
  if (result)
  {
    char v5 = 2;
  }
  else
  {
    id result = [v3 isEnabled];
    char v5 = result ^ 1;
  }
  *a1 = v5;
  return result;
}

uint64_t sub_1000614CC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

id sub_10006150C(unsigned __int8 *a1)
{
  uint64_t v2 = *(void **)(v1 + 32);
  int v3 = *a1;
  [v2 setHidden:v3 == 2];

  return [v2 setEnabled:v3 == 0];
}

uint64_t sub_10006156C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000615A4()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    (*(void (**)(void))((swift_isaMask & *Strong) + 0x70))();
  }
}

uint64_t sub_100061628(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CARThemeEditor();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100061684()
{
  sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
  uint64_t v0 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v2 = (void *)result;
    uint64_t v3 = *(void *)(result + OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_theme);
    swift_retain();

    (*(void (**)(void))(*(void *)v3 + 240))();
    return swift_release();
  }
  return result;
}

uint64_t sub_10006176C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10006177C()
{
  return swift_release();
}

uint64_t sub_100061784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CARThemeEditor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000617EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CARThemeEditor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100061850()
{
  return sub_100062D00(sub_10005FDA8);
}

unint64_t sub_100061868()
{
  unint64_t result = qword_1000B03C0;
  if (!qword_1000B03C0)
  {
    sub_10002F34C(&qword_1000B0398);
    sub_100061964(&qword_1000B03C8, &qword_1000B0390, (void (*)(void))sub_100061934);
    sub_10002F5CC(&qword_1000B0450, &qword_1000B0458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B03C0);
  }
  return result;
}

uint64_t sub_100061934()
{
  return sub_100061964(&qword_1000B03D0, &qword_1000B0388, (void (*)(void))sub_1000619E0);
}

uint64_t sub_100061964(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F34C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000619E0()
{
  unint64_t result = qword_1000B03D8;
  if (!qword_1000B03D8)
  {
    sub_10002F34C(&qword_1000B0380);
    sub_100061A54();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B03D8);
  }
  return result;
}

unint64_t sub_100061A54()
{
  unint64_t result = qword_1000B03E0;
  if (!qword_1000B03E0)
  {
    sub_10002F34C(&qword_1000B03E8);
    sub_100061AD0();
    sub_100061C3C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B03E0);
  }
  return result;
}

unint64_t sub_100061AD0()
{
  unint64_t result = qword_1000B03F0;
  if (!qword_1000B03F0)
  {
    sub_10002F34C(&qword_1000B03F8);
    sub_100061B70();
    sub_10002F5CC(&qword_1000B0438, &qword_1000B0440);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B03F0);
  }
  return result;
}

unint64_t sub_100061B70()
{
  unint64_t result = qword_1000B0400;
  if (!qword_1000B0400)
  {
    sub_10002F34C(&qword_1000B0408);
    sub_100061964(&qword_1000B0410, &qword_1000B0418, (void (*)(void))sub_100052014);
    sub_10002F5CC(&qword_1000B0428, &qword_1000B0430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0400);
  }
  return result;
}

unint64_t sub_100061C3C()
{
  unint64_t result = qword_1000B0448;
  if (!qword_1000B0448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0448);
  }
  return result;
}

unint64_t sub_100061C90()
{
  unint64_t result = qword_1000B1D10[0];
  if (!qword_1000B1D10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000B1D10);
  }
  return result;
}

uint64_t sub_100061CF4()
{
  return sub_10005FFDC();
}

unint64_t sub_100061D54()
{
  unint64_t result = qword_1000B0460;
  if (!qword_1000B0460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000B0460);
  }
  return result;
}

uint64_t sub_100061DA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_100061DC4(uint64_t *a1, uint64_t a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v33 = *(void *)a2;
    *a1 = *(void *)a2;
    uint64_t v4 = (uint64_t *)(v33 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_1000313D4(*(void *)a2, v8);
    uint64_t *v4 = v7;
    *((unsigned char *)v4 + 8) = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = a2 + v9;
    uint64_t v12 = sub_10002D398(&qword_1000B0368);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    id v15 = (char *)v4 + v13;
    uint64_t v16 = a2 + v13;
    uint64_t v17 = *(void *)(v16 + 8);
    *(void *)id v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    v15[16] = *(unsigned char *)(v16 + 16);
    double v18 = (uint64_t *)((char *)v4 + v14);
    char v19 = (void *)(a2 + v14);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = v19[3];
    uint64_t v18[2] = v19[2];
    v18[3] = v21;
    uint64_t v22 = a3[8];
    uint64_t v23 = a3[9];
    uint64_t v24 = (char *)v4 + v22;
    uint64_t v25 = a2 + v22;
    uint64_t v26 = *(void *)(v25 + 8);
    *(void *)uint64_t v24 = *(void *)v25;
    *((void *)v24 + 1) = v26;
    v24[16] = *(unsigned char *)(v25 + 16);
    uint64_t v27 = (uint64_t *)((char *)v4 + v23);
    char v28 = (void *)(a2 + v23);
    uint64_t v29 = v28[1];
    void *v27 = *v28;
    v27[1] = v29;
    uint64_t v30 = a3[10];
    uint64_t v31 = (char *)v4 + v30;
    uint64_t v32 = (char *)(a2 + v30);
    *uint64_t v31 = *v32;
    *((void *)v31 + 1) = *((void *)v32 + 1);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100061F84(uint64_t a1, uint64_t a2)
{
  sub_1000313E0(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_10002D398(&qword_1000B0368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_10006207C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_1000313D4(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_10002D398(&qword_1000B0368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  uint64_t v16 = *(void *)(v15 + 8);
  *(void *)uint64_t v14 = *(void *)v15;
  *(void *)(v14 + 8) = v16;
  *(unsigned char *)(v14 + 16) = *(unsigned char *)(v15 + 16);
  uint64_t v17 = (void *)(a1 + v13);
  double v18 = (void *)(a2 + v13);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = v18[3];
  v17[2] = v18[2];
  void v17[3] = v20;
  uint64_t v21 = a3[8];
  uint64_t v22 = a3[9];
  uint64_t v23 = a1 + v21;
  uint64_t v24 = a2 + v21;
  uint64_t v25 = *(void *)(v24 + 8);
  *(void *)uint64_t v23 = *(void *)v24;
  *(void *)(v23 + 8) = v25;
  *(unsigned char *)(v23 + 16) = *(unsigned char *)(v24 + 16);
  uint64_t v26 = (void *)(a1 + v22);
  uint64_t v27 = (void *)(a2 + v22);
  uint64_t v28 = v27[1];
  void *v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = a3[10];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  *(unsigned char *)uint64_t v30 = *(unsigned char *)v31;
  *(void *)(v30 + 8) = *(void *)(v31 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_1000621F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_1000313D4(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_1000313E0(v8, v9);
  uint64_t v10 = a3[5];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_10002D398(&qword_1000B0368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  swift_retain();
  swift_release();
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v15 + 16) = *(unsigned char *)(v16 + 16);
  uint64_t v17 = a3[7];
  double v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  swift_retain();
  swift_release();
  v18[1] = v19[1];
  swift_retain();
  swift_release();
  uint64_t v18[2] = v19[2];
  v18[3] = v19[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  swift_retain();
  swift_release();
  *(void *)(v21 + 8) = *(void *)(v22 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v21 + 16) = *(unsigned char *)(v22 + 16);
  uint64_t v23 = a3[9];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  uint64_t v26 = v25[1];
  void *v24 = *v25;
  v24[1] = v26;
  swift_retain();
  swift_release();
  uint64_t v27 = a3[10];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  *(unsigned char *)uint64_t v28 = *(unsigned char *)v29;
  *(void *)(v28 + 8) = *(void *)(v29 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1000623D4(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_10002D398(&qword_1000B0368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = a2 + v10;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(unsigned char *)(v12 + 16) = *(unsigned char *)(v13 + 16);
  uint64_t v14 = (_OWORD *)(a1 + v11);
  uint64_t v15 = (_OWORD *)(a2 + v11);
  long long v16 = v15[1];
  _OWORD *v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = (long long *)(a2 + v17);
  long long v21 = *v20;
  *(unsigned char *)(v19 + 16) = *((unsigned char *)v20 + 16);
  *(_OWORD *)uint64_t v19 = v21;
  *(_OWORD *)(a1 + v18) = *(_OWORD *)(a2 + v18);
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_1000624C8(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_1000313E0(v8, v9);
  uint64_t v10 = a3[5];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (uint64_t)a2 + v10;
  uint64_t v13 = sub_10002D398(&qword_1000B0368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = (uint64_t)a2 + v14;
  *(void *)(a1 + v14) = *(uint64_t *)((char *)a2 + v14);
  swift_release();
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_release();
  *(unsigned char *)(v15 + 16) = *(unsigned char *)(v16 + 16);
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)((char *)a2 + v17);
  *(void *)(a1 + v17) = *(uint64_t *)((char *)a2 + v17);
  swift_release();
  v18[1] = v19[1];
  swift_release();
  uint64_t v20 = v19[3];
  uint64_t v18[2] = v19[2];
  v18[3] = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = (uint64_t)a2 + v21;
  *(void *)(a1 + v21) = *(uint64_t *)((char *)a2 + v21);
  swift_release();
  *(void *)(v22 + 8) = *(void *)(v23 + 8);
  swift_release();
  *(unsigned char *)(v22 + 16) = *(unsigned char *)(v23 + 16);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  swift_release();
  uint64_t v24 = a3[10];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = (uint64_t)a2 + v24;
  *(unsigned char *)uint64_t v25 = *(unsigned char *)v26;
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  swift_release();
  return a1;
}

uint64_t sub_10006264C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100062660);
}

uint64_t sub_100062660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002D398(&qword_1000B0368);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_10006272C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100062740);
}

uint64_t sub_100062740(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10002D398(&qword_1000B0368);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

void sub_100062808()
{
  sub_1000628CC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000628CC()
{
  if (!qword_1000B0548)
  {
    type metadata accessor for CARThemeModel();
    unint64_t v0 = type metadata accessor for Bindable();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000B0548);
    }
  }
}

uint64_t getEnumTagSinglePayload for CARThemeEditor.ButtonState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CARThemeEditor.ButtonState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100062A80);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_100062AA8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CARThemeEditor.ButtonState()
{
  return &type metadata for CARThemeEditor.ButtonState;
}

uint64_t sub_100062AC0()
{
  return swift_getOpaqueTypeConformance2();
}

unsigned char *storeEnumTagSinglePayload for CARThemeEditor.EditingMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100062CA8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CARThemeEditor.EditingMode()
{
  return &type metadata for CARThemeEditor.EditingMode;
}

uint64_t sub_100062CE8()
{
  return sub_100062D00(sub_100060744);
}

uint64_t sub_100062D00(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for CARThemeEditor() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_100062D78()
{
  uint64_t v1 = (int *)(type metadata accessor for CARThemeEditor() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_1000313E0(*(void *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8));
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_10002D398(&qword_1000B0368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100062EE4()
{
  return swift_release();
}

uint64_t sub_100062F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D398(&qword_1000B05A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100062FF4()
{
  return sub_10006302C();
}

uint64_t sub_100063010()
{
  return sub_10006302C();
}

uint64_t sub_10006302C()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000630A8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

id sub_1000630E8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  int v2 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 40);
  [v1 alpha];
  double v5 = 0.0;
  if (v3)
  {
    double v5 = v4;
    double v4 = 1.0;
  }
  if (v2) {
    double v4 = v5;
  }

  return [v1 setAlpha:v4];
}

_OWORD *sub_100063160(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for Key()
{
  if (!qword_1000B05E0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000B05E0);
    }
  }
}

uint64_t sub_1000631C8()
{
  return sub_1000632A0(&qword_1000B05E8, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_100063210()
{
  return sub_1000632A0(&qword_1000B05F0, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_100063258()
{
  return sub_1000632A0(&qword_1000B05F8, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_1000632A0(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_1000632E8()
{
  return *(id *)(v0 + OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_carSession);
}

id CARDevicePickerManager.viewController.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_viewController);
}

char *CARDevicePickerManager.__allocating_init(pairedDevices:carSession:)(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return CARDevicePickerManager.init(pairedDevices:carSession:)(a1, a2);
}

char *CARDevicePickerManager.init(pairedDevices:carSession:)(void *a1, void *a2)
{
  *(void *)&v2[OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_carSession] = a2;
  type metadata accessor for CAFUIRequestContentManager();
  swift_allocObject();
  id v5 = a2;
  uint64_t v6 = v2;
  CAFUIRequestContentManager.init(session:)();
  id v7 = objc_allocWithZone((Class)type metadata accessor for CAFUIDevicePickerViewController());
  id v8 = v5;
  swift_retain();
  id v9 = a1;
  *(void *)&v6[OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_viewController] = CAFUIDevicePickerViewController.init(requestContentManager:pairedDevices:carSession:)();

  v18.receiver = v6;
  v18.super_class = (Class)type metadata accessor for CARDevicePickerManager();
  uint64_t v10 = (char *)[super init];
  uint64_t v11 = *(void **)&v10[OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_viewController];
  unint64_t v12 = *(void (**)(char *, _UNKNOWN **))((swift_isaMask & *v11) + 0x1F0);
  uint64_t v13 = v10;
  uint64_t v14 = v11;
  v12(v10, &protocol witness table for CARDevicePickerManager);

  id v15 = [v9 pairedDevicesAction];
  uint64_t v16 = v13;
  [v15 registerObserver:v16];
  swift_release();

  return v16;
}

uint64_t type metadata accessor for CARDevicePickerManager()
{
  return self;
}

id CARDevicePickerManager.__deallocating_deinit()
{
  uint64_t v1 = v0;
  long long v2 = *(void **)&v0[OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_viewController];
  uint64_t v3 = *(void (**)(void, void))((swift_isaMask & *v2) + 0x1F0);
  double v4 = v2;
  v3(0, 0);

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for CARDevicePickerManager();
  return [super dealloc];
}

void CARDevicePickerManager.init()()
{
}

void CARDevicePickerManager.shouldRequest(action:for:)(char a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  id v8 = [self sharedDelegate];
  if (!v8)
  {
    __break(1u);
    goto LABEL_27;
  }
  id v9 = v8;
  id v10 = [v8 carManager];

  if (!v10)
  {
LABEL_27:
    __break(1u);
    JUMPOUT(0x100063E1CLL);
  }
  id v11 = [v10 currentCar];

  if (v11)
  {
    id v12 = [v11 pairedDevices];

    if (v12)
    {
      sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
      uint64_t v13 = static OS_os_log.default.getter();
      swift_bridgeObjectRetain_n();
      os_log_type_t v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v31 = v4;
        uint64_t v32 = a2;
        id v33 = v12;
        uint64_t v15 = 0xD000000000000011;
        uint64_t v16 = swift_slowAlloc();
        uint64_t aBlock = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136315394;
        unint64_t v17 = 0x8000000100082390;
        switch(a1)
        {
          case 1:
            unint64_t v17 = 0xEE00747365757165;
            uint64_t v15 = 0x527463656E6E6F43;
            break;
          case 2:
            break;
          case 3:
            uint64_t v15 = 0xD000000000000012;
            unint64_t v17 = 0x8000000100082370;
            break;
          default:
            unint64_t v17 = 0xE500000000000000;
            uint64_t v15 = 0x7964616552;
            break;
        }
        sub_10002F8D4(v15, v17, &aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 12) = 2080;
        swift_bridgeObjectRetain();
        a2 = v32;
        sub_10002F8D4(v32, a3, &aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Sending request for action: %s, device: %s.", (uint8_t *)v16, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        id v12 = v33;
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
      id v18 = [v12 pairedDevicesAction:v31];
      uint64_t v19 = v18;
      switch(a1)
      {
        case 0:
          CAFUIDevicePickerViewController.resetSpinningCellAndUserInteraction()();
          goto LABEL_24;
        case 1:
          if (![v18 hasConnectDevice]) {
            goto LABEL_21;
          }
          NSString v20 = String._bridgeToObjectiveC()();
          uint64_t v21 = swift_allocObject();
          swift_unknownObjectWeakInit();
          uint64_t v22 = (void *)swift_allocObject();
          v22[2] = v21;
          void v22[3] = a2;
          v22[4] = a3;
          uint64_t v38 = sub_1000647F8;
          long long v39 = v22;
          uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
          uint64_t v35 = 1107296256;
          uint64_t v36 = sub_100063E3C;
          long long v37 = &unk_100093C38;
          uint64_t v23 = _Block_copy(&aBlock);
          swift_bridgeObjectRetain();
          swift_release();
          [v19 connectDeviceWithIdentifier:v20 completion:v23];
          goto LABEL_20;
        case 2:
          if (![v18 hasDisconnectDevice]) {
            goto LABEL_21;
          }
          NSString v20 = String._bridgeToObjectiveC()();
          uint64_t v24 = swift_allocObject();
          swift_unknownObjectWeakInit();
          uint64_t v25 = (void *)swift_allocObject();
          v25[2] = v24;
          v25[3] = a2;
          v25[4] = a3;
          uint64_t v38 = sub_1000647A0;
          long long v39 = v25;
          uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
          uint64_t v35 = 1107296256;
          uint64_t v36 = sub_100063E3C;
          long long v37 = &unk_100093BE8;
          uint64_t v23 = _Block_copy(&aBlock);
          swift_bridgeObjectRetain();
          swift_release();
          [v19 disconnectDeviceWithIdentifier:v20 completion:v23];
          goto LABEL_20;
        case 3:
          if ([v18 hasForgetDevice])
          {
            NSString v20 = String._bridgeToObjectiveC()();
            uint64_t v26 = swift_allocObject();
            swift_unknownObjectWeakInit();
            uint64_t v27 = (void *)swift_allocObject();
            v27[2] = v26;
            void v27[3] = a2;
            v27[4] = a3;
            uint64_t v38 = sub_1000641F8;
            long long v39 = v27;
            uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
            uint64_t v35 = 1107296256;
            uint64_t v36 = sub_100063E3C;
            long long v37 = &unk_100093B98;
            uint64_t v23 = _Block_copy(&aBlock);
            swift_bridgeObjectRetain();
            swift_release();
            [v19 forgetDeviceWithIdentifier:v20 completion:v23];
LABEL_20:
            _Block_release(v23);

            id v12 = v19;
            uint64_t v19 = v20;
          }
          else
          {
LABEL_21:
            uint64_t v28 = static OS_os_log.default.getter();
            os_log_type_t v29 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v28, v29))
            {
              uint64_t v30 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v30 = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, v29, "Device action not supported.", v30, 2u);
              swift_slowDealloc();
            }
          }
LABEL_24:

          break;
        default:
          JUMPOUT(0);
      }
    }
  }
}

void sub_100063E3C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100063EA8(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v8 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002F83C(0, (unint64_t *)&qword_1000AF090);
  id v11 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  aBlock[4] = sub_100064F04;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100034DA8;
  aBlock[3] = &unk_100093D10;
  uint64_t v13 = _Block_copy(aBlock);
  swift_errorRetain();
  id v14 = a2;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_1000650BC();
  sub_10002D398(&qword_1000AF0A0);
  sub_10003743C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v17);
}

void sub_100064140(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_1000641BC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000641F8(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = *(void *)(v1 + 32);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v6 = (char *)Strong;
    if (a1)
    {
      sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
      swift_errorRetain();
      id v7 = static OS_os_log.default.getter();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      os_log_type_t v8 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = swift_slowAlloc();
        id v10 = (void *)swift_slowAlloc();
        aBlock[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 136315394;
        swift_bridgeObjectRetain();
        sub_10002F8D4(v3, v4, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v9 + 12) = 2112;
        swift_errorRetain();
        uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *id v10 = v26;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Forget device: %s failed with error: %@", (uint8_t *)v9, 0x16u);
        sub_10002D398((uint64_t *)&unk_1000AED00);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();

        swift_bridgeObjectRelease_n();
        swift_errorRelease();
        swift_errorRelease();
      }
    }
    else
    {
      sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
      id v11 = static OS_os_log.default.getter();
      swift_bridgeObjectRetain_n();
      os_log_type_t v12 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        aBlock[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 136315138;
        swift_bridgeObjectRetain();
        sub_10002F8D4(v3, v4, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Forget device: %s succeeded", v13, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v6;
    uint64_t v15 = *(void **)&v6[OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_carSession];
    uint64_t v16 = v6;
    id v17 = [v15 MFiCertificateSerialNumber];
    uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v20 = v19;

    id v21 = [objc_allocWithZone((Class)CRPairedVehicleManager) init];
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    id v23 = [v21 vehicleForCertificateSerial:isa];

    if (v23)
    {
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = sub_100064C04;
      *(void *)(v24 + 24) = v14;
      aBlock[4] = (uint64_t)sub_100064C44;
      aBlock[5] = v24;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100064140;
      aBlock[3] = (uint64_t)&unk_100093CC0;
      uint64_t v25 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v21 removeVehicle:v23 completion:v25];
      _Block_release(v25);
    }
    else
    {
      static os_log_type_t.error.getter();
      sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
      id v23 = (id)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();
    }

    sub_10005B764(v18, v20);
    swift_release();
  }
}

uint64_t sub_100064784(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100064794()
{
  return swift_release();
}

void sub_1000647A0(uint64_t a1)
{
}

uint64_t sub_1000647B8()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000647F8(uint64_t a1)
{
}

void sub_10006480C(uint64_t a1, const char *a2, const char *a3)
{
  uint64_t v7 = *(void *)(v3 + 24);
  unint64_t v8 = *(void *)(v3 + 32);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v10 = (char *)Strong;
    if (a1)
    {
      sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
      swift_errorRetain();
      id v11 = static OS_os_log.default.getter();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      os_log_type_t v12 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = swift_slowAlloc();
        uint64_t v14 = (void *)swift_slowAlloc();
        uint64_t v20 = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 136315394;
        swift_bridgeObjectRetain();
        sub_10002F8D4(v7, v8, &v20);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v13 + 12) = 2112;
        swift_errorRetain();
        uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v14 = v19;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v11, v12, a2, (uint8_t *)v13, 0x16u);
        sub_10002D398((uint64_t *)&unk_1000AED00);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_errorRelease();
        swift_errorRelease();
      }
      id v18 = *(id *)&v10[OBJC_IVAR____TtC15CarPlaySettings22CARDevicePickerManager_viewController];
      CAFUIDevicePickerViewController.resetSpinningCellAndUserInteraction()();

      swift_errorRelease();
    }
    else
    {
      sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
      uint64_t v15 = static OS_os_log.default.getter();
      swift_bridgeObjectRetain_n();
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v15, v16))
      {
        id v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v20 = swift_slowAlloc();
        *(_DWORD *)id v17 = 136315138;
        swift_bridgeObjectRetain();
        sub_10002F8D4(v7, v8, &v20);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v15, v16, a3, v17, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
}

uint64_t sub_100064BCC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100064C04(uint64_t a1)
{
  return sub_100063EA8(a1, *(void **)(v1 + 16));
}

uint64_t sub_100064C0C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100064C44(char a1, uint64_t a2)
{
  unint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 16);
  if ((a1 & 1) == 0 || a2)
  {
    os_log_type_t v9 = static os_log_type_t.error.getter();
    sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
    swift_errorRetain();
    swift_errorRetain();
    id v10 = static OS_os_log.default.getter();
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v11 = swift_slowAlloc();
      os_log_type_t v12 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 138412546;
      if (a2)
      {
        swift_errorRetain();
        uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
      }
      else
      {
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v13 = 0;
      }
      *os_log_type_t v12 = v13;
      swift_errorRelease();
      swift_errorRelease();
      *(_WORD *)(v11 + 12) = 1024;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v10, v9, "Issue when trying to remove car: %@, success: %{BOOL}d.", (uint8_t *)v11, 0x12u);
      sub_10002D398((uint64_t *)&unk_1000AED00);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v8 = a2;
  }
  else
  {
    sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
    uint64_t v5 = static OS_os_log.default.getter();
    uint64_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, (os_log_type_t)v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, (os_log_type_t)v6, "Car removed", v7, 2u);
      swift_slowDealloc();
    }

    uint64_t v8 = 0;
  }
  return v4(v8);
}

uint64_t sub_100064EC4()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100064F04()
{
  if (*(void *)(v0 + 16))
  {
    swift_errorRetain();
    os_log_type_t v1 = static os_log_type_t.error.getter();
    sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v2 = static OS_os_log.default.getter();
    os_log_type_t v3 = v1;
    if (os_log_type_enabled(v2, v1))
    {
      unint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v4 = 138412290;
      swift_errorRetain();
      uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v5 = v6;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Unable to remove car pairing: %@", v4, 0xCu);
      sub_10002D398((uint64_t *)&unk_1000AED00);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();

      swift_errorRelease();
      swift_errorRelease();
    }
  }
  CAFUIDevicePickerViewController.resetSpinningCellAndUserInteraction()();
}

unint64_t sub_1000650BC()
{
  unint64_t result = qword_1000AF098;
  if (!qword_1000AF098)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000AF098);
  }
  return result;
}

uint64_t sub_100065134()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_100065144()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_1000B23C8 = (uint64_t)result;
  return result;
}

uint64_t sub_100065198()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_100049878(v0, qword_1000B2410);
  sub_100045A00(v0, (uint64_t)qword_1000B2410);
  if (qword_1000B23C0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000B23C8;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100065240()
{
  if (qword_1000B23D0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for ImageResource();

  return sub_100045A00(v0, (uint64_t)qword_1000B2410);
}

uint64_t sub_1000652A4@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000B23D0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for ImageResource();
  uint64_t v3 = sub_100045A00(v2, (uint64_t)qword_1000B2410);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100065370(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000653DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100065448(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000654B4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[Settings] Failed setting wallpaper for new interface style", v1, 2u);
}

void sub_1000654F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100065564(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000655D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006563C(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[Settings] Unrecognized analytics event %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000656E0(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[Settings] Unexpected nil vehicle ID for vehicle: %@", buf, 0xCu);
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t type metadata accessor for AttributedString()
{
  return type metadata accessor for AttributedString();
}

uint64_t AttributedString.init(_:attributes:)()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t AttributeContainer.init(_:)()
{
  return AttributeContainer.init(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t withObservationTracking<A>(_:onChange:)()
{
  return withObservationTracking<A>(_:onChange:)();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t type metadata accessor for ImageResource()
{
  return type metadata accessor for ImageResource();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t type metadata accessor for CAFUIAccountManager()
{
  return type metadata accessor for CAFUIAccountManager();
}

uint64_t type metadata accessor for CAFUILoadingViewController()
{
  return type metadata accessor for CAFUILoadingViewController();
}

uint64_t CAFUIRequestContentManager.init(session:)()
{
  return CAFUIRequestContentManager.init(session:)();
}

uint64_t type metadata accessor for CAFUIRequestContentManager()
{
  return type metadata accessor for CAFUIRequestContentManager();
}

uint64_t CAFUIDevicePickerViewController.init(requestContentManager:pairedDevices:carSession:)()
{
  return CAFUIDevicePickerViewController.init(requestContentManager:pairedDevices:carSession:)();
}

Swift::Void __swiftcall CAFUIDevicePickerViewController.resetSpinningCellAndUserInteraction()()
{
}

uint64_t type metadata accessor for CAFUIDevicePickerViewController()
{
  return type metadata accessor for CAFUIDevicePickerViewController();
}

uint64_t type metadata accessor for UITraitUserInterfaceStyle()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t LazyHStack.init(alignment:spacing:pinnedViews:content:)()
{
  return LazyHStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t Transaction.disablesAnimations.getter()
{
  return Transaction.disablesAnimations.getter();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t static EnvironmentKey._valuesEqual(_:_:)()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t LinearGradient.init(gradient:startPoint:endPoint:)()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t _UIHostingView.init(rootView:)()
{
  return _UIHostingView.init(rootView:)();
}

uint64_t ModifiedContent.init(content:modifier:)()
{
  return ModifiedContent.init(content:modifier:)();
}

uint64_t ModifiedContent<>.accessibilityIdentifier(_:)()
{
  return ModifiedContent<>.accessibilityIdentifier(_:)();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t static PreviewProvider.platform.getter()
{
  return static PreviewProvider.platform.getter();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t static SafeAreaRegions.container.getter()
{
  return static SafeAreaRegions.container.getter();
}

uint64_t type metadata accessor for RoundedRectangle._Inset()
{
  return type metadata accessor for RoundedRectangle._Inset();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.displayScale.getter()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t EnvironmentValues.displayScale.setter()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for PinnedScrollableViews()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t static ContentMarginPlacement.automatic.getter()
{
  return static ContentMarginPlacement.automatic.getter();
}

uint64_t type metadata accessor for ContentMarginPlacement()
{
  return type metadata accessor for ContentMarginPlacement();
}

uint64_t static HierarchicalShapeStyle.primary.getter()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t ButtonStyleConfiguration.isPressed.getter()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t static AccessibilityChildBehavior.ignore.getter()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t UIViewRepresentableContext.environment.getter()
{
  return UIViewRepresentableContext.environment.getter();
}

uint64_t UIViewRepresentableContext.transaction.getter()
{
  return UIViewRepresentableContext.transaction.getter();
}

uint64_t type metadata accessor for AccessibilityAttachmentModifier()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t static ViewAlignedScrollTargetBehavior.LimitBehavior.always.getter()
{
  return static ViewAlignedScrollTargetBehavior.LimitBehavior.always.getter();
}

uint64_t type metadata accessor for ViewAlignedScrollTargetBehavior.LimitBehavior()
{
  return type metadata accessor for ViewAlignedScrollTargetBehavior.LimitBehavior();
}

uint64_t ViewAlignedScrollTargetBehavior.init(limitBehavior:)()
{
  return ViewAlignedScrollTargetBehavior.init(limitBehavior:)();
}

uint64_t type metadata accessor for ViewAlignedScrollTargetBehavior()
{
  return type metadata accessor for ViewAlignedScrollTargetBehavior();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.horizontal.getter()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t static Font.callout.getter()
{
  return static Font.callout.getter();
}

uint64_t Text.bold()()
{
  return Text.bold()();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.contentMargins(_:_:for:)()
{
  return View.contentMargins(_:_:for:)();
}

uint64_t View.luminanceCurve(_:amount:)()
{
  return View.luminanceCurve(_:amount:)();
}

uint64_t View.scrollPosition<A>(id:anchor:)()
{
  return View.scrollPosition<A>(id:anchor:)();
}

uint64_t View.accessibilityLabel(_:)()
{
  return View.accessibilityLabel(_:)();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t View.scrollClipDisabled(_:)()
{
  return View.scrollClipDisabled(_:)();
}

uint64_t View.scrollTargetLayout(isEnabled:)()
{
  return View.scrollTargetLayout(isEnabled:)();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.scrollTargetBehavior<A>(_:)()
{
  return View.scrollTargetBehavior<A>(_:)();
}

uint64_t View.accessibilityIdentifier(_:)()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t View.bold(_:)()
{
  return View.bold(_:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t type metadata accessor for Image.Scale()
{
  return type metadata accessor for Image.Scale();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Image.init(_:bundle:)()
{
  return Image.init(_:bundle:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t Binding.init(get:set:)()
{
  return Binding.init(get:set:)();
}

{
  return Binding.init(get:set:)();
}

uint64_t static Binding.constant(_:)()
{
  return static Binding.constant(_:)();
}

uint64_t Binding.init(_:)()
{
  return Binding.init(_:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t AnyShape.init<A>(_:)()
{
  return AnyShape.init<A>(_:)();
}

uint64_t Bindable.wrappedValue.modify()
{
  return Bindable.wrappedValue.modify();
}

uint64_t Bindable.wrappedValue.getter()
{
  return Bindable.wrappedValue.getter();
}

uint64_t Bindable.wrappedValue.setter()
{
  return Bindable.wrappedValue.setter();
}

uint64_t Bindable.projectedValue.getter()
{
  return Bindable.projectedValue.getter();
}

uint64_t Bindable<A>.init(wrappedValue:)()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t Bindable<A>.subscript.getter()
{
  return Bindable<A>.subscript.getter();
}

uint64_t type metadata accessor for Bindable()
{
  return type metadata accessor for Bindable();
}

uint64_t Gradient.Stop.init(color:location:)()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t Gradient.init(stops:)()
{
  return Gradient.init(stops:)();
}

uint64_t static Material.regular.getter()
{
  return static Material.regular.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.bottom.getter()
{
  return static Alignment.bottom.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t UIView.registerForTraitChanges(_:target:action:)()
{
  return UIView.registerForTraitChanges(_:target:action:)();
}

uint64_t static UIView.animate(with:changes:completion:)()
{
  return static UIView.animate(with:changes:completion:)();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t UIButton.Configuration.imagePadding.setter()
{
  return UIButton.Configuration.imagePadding.setter();
}

uint64_t UIButton.Configuration.attributedTitle.setter()
{
  return UIButton.Configuration.attributedTitle.setter();
}

uint64_t UIButton.Configuration.baseForegroundColor.setter()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t UIButton.Configuration.image.setter()
{
  return UIButton.Configuration.image.setter();
}

uint64_t static UIButton.Configuration.plain()()
{
  return static UIButton.Configuration.plain()();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return _AFDeviceSupportsSystemAssistantExperience();
}

uint64_t AFSiriCarPlayAnnounceEnablementTypeGetName()
{
  return _AFSiriCarPlayAnnounceEnablementTypeGetName();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t BSEqualStrings()
{
  return _BSEqualStrings();
}

uint64_t CAFSignpostEmit_Finalized()
{
  return _CAFSignpostEmit_Finalized();
}

uint64_t CAFSignpostEmit_InstantOn()
{
  return _CAFSignpostEmit_InstantOn();
}

uint64_t CAFSignpostEmit_Launched()
{
  return _CAFSignpostEmit_Launched();
}

uint64_t CAFSignpostEmit_Rendered()
{
  return _CAFSignpostEmit_Rendered();
}

uint64_t CARStringFromVoiceTriggerMode()
{
  return _CARStringFromVoiceTriggerMode();
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

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
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

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CPUIDeviceSupportsSoundRecognition()
{
  return _CPUIDeviceSupportsSoundRecognition();
}

uint64_t CRIsInternalInstall()
{
  return _CRIsInternalInstall();
}

uint64_t MADisplayFilterPrefGetBlueColorCorrectionIntensity()
{
  return _MADisplayFilterPrefGetBlueColorCorrectionIntensity();
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return _MADisplayFilterPrefGetCategoryEnabled();
}

uint64_t MADisplayFilterPrefGetGrayscaleCorrectionIntensity()
{
  return _MADisplayFilterPrefGetGrayscaleCorrectionIntensity();
}

uint64_t MADisplayFilterPrefGetGreenColorCorrectionIntensity()
{
  return _MADisplayFilterPrefGetGreenColorCorrectionIntensity();
}

uint64_t MADisplayFilterPrefGetRedColorCorrectionIntensity()
{
  return _MADisplayFilterPrefGetRedColorCorrectionIntensity();
}

uint64_t MADisplayFilterPrefGetType()
{
  return _MADisplayFilterPrefGetType();
}

uint64_t MADisplayFilterPrefSetBlueColorCorrectionIntensity()
{
  return _MADisplayFilterPrefSetBlueColorCorrectionIntensity();
}

uint64_t MADisplayFilterPrefSetCategoryEnabled()
{
  return _MADisplayFilterPrefSetCategoryEnabled();
}

uint64_t MADisplayFilterPrefSetGrayscaleCorrectionIntensity()
{
  return _MADisplayFilterPrefSetGrayscaleCorrectionIntensity();
}

uint64_t MADisplayFilterPrefSetGreenColorCorrectionIntensity()
{
  return _MADisplayFilterPrefSetGreenColorCorrectionIntensity();
}

uint64_t MADisplayFilterPrefSetRedColorCorrectionIntensity()
{
  return _MADisplayFilterPrefSetRedColorCorrectionIntensity();
}

uint64_t MADisplayFilterPrefSetType()
{
  return _MADisplayFilterPrefSetType();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromPairedDeviceState()
{
  return _NSStringFromPairedDeviceState();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIFloorToScale()
{
  return _UIFloorToScale();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t UIInterfaceDefaultCornerRadius()
{
  return _UIInterfaceDefaultCornerRadius();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRoundToScale()
{
  return _UIRoundToScale();
}

uint64_t _AXSCarPlayEnhanceTextLegibilityEnabled()
{
  return __AXSCarPlayEnhanceTextLegibilityEnabled();
}

uint64_t _AXSCommandAndControlCarPlayEnabled()
{
  return __AXSCommandAndControlCarPlayEnabled();
}

uint64_t _AXSCommandAndControlCarPlaySetEnabled()
{
  return __AXSCommandAndControlCarPlaySetEnabled();
}

uint64_t _AXSSetCarPlayEnhanceTextLegibilityEnabled()
{
  return __AXSSetCarPlayEnhanceTextLegibilityEnabled();
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

{
}

{
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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
  return [super a2];
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_AIEnabled(void *a1, const char *a2, ...)
{
  return _[a1 AIEnabled];
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_MFiCertificateSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 MFiCertificateSerialNumber];
}

id objc_msgSend_PPID(void *a1, const char *a2, ...)
{
  return _[a1 PPID];
}

id objc_msgSend_SDKVersion(void *a1, const char *a2, ...)
{
  return _[a1 SDKVersion];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return _[a1 _FBSScene];
}

id objc_msgSend__adjustDetailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 _adjustDetailTextLabel];
}

id objc_msgSend__analyticsEventNameForEvent_(void *a1, const char *a2, ...)
{
  return [a1 _analyticsEventNameForEvent];
}

id objc_msgSend__announceEnabledFooterText(void *a1, const char *a2, ...)
{
  return _[a1 _announceEnabledFooterText];
}

id objc_msgSend__applicationIconImageForBundleIdentifier_format_(void *a1, const char *a2, ...)
{
  return [a1 _applicationIconImageForBundleIdentifier:format:];
}

id objc_msgSend__applicationIconImageForFormat_precomposed_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applicationIconImageForFormat:precomposed:scale:");
}

id objc_msgSend__axColorFiltersAnalyticsString(void *a1, const char *a2, ...)
{
  return _[a1 _axColorFiltersAnalyticsString];
}

id objc_msgSend__axSoundRecognitionAnalyticsString(void *a1, const char *a2, ...)
{
  return _[a1 _axSoundRecognitionAnalyticsString];
}

id objc_msgSend__buttonWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buttonWithTitle:");
}

id objc_msgSend__carScreen(void *a1, const char *a2, ...)
{
  return _[a1 _carScreen];
}

id objc_msgSend__carSystemFocusColor(void *a1, const char *a2, ...)
{
  return _[a1 _carSystemFocusColor];
}

id objc_msgSend__carSystemFocusLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 _carSystemFocusLabelColor];
}

id objc_msgSend__carSystemFocusPrimaryColor(void *a1, const char *a2, ...)
{
  return _[a1 _carSystemFocusPrimaryColor];
}

id objc_msgSend__carSystemFocusSecondaryColor(void *a1, const char *a2, ...)
{
  return _[a1 _carSystemFocusSecondaryColor];
}

id objc_msgSend__carSystemPrimaryColor(void *a1, const char *a2, ...)
{
  return _[a1 _carSystemPrimaryColor];
}

id objc_msgSend__carSystemQuaternaryColor(void *a1, const char *a2, ...)
{
  return _[a1 _carSystemQuaternaryColor];
}

id objc_msgSend__carSystemSecondaryColor(void *a1, const char *a2, ...)
{
  return _[a1 _carSystemSecondaryColor];
}

id objc_msgSend__carSystemTertiaryColor(void *a1, const char *a2, ...)
{
  return _[a1 _carSystemTertiaryColor];
}

id objc_msgSend__currentUserInterfaceStylePreference(void *a1, const char *a2, ...)
{
  return _[a1 _currentUserInterfaceStylePreference];
}

id objc_msgSend__dictionaryRepresentationWithVehicle_session_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dictionaryRepresentationWithVehicle:session:");
}

id objc_msgSend__drivingToggleChanged_(void *a1, const char *a2, ...)
{
  return [_drivingToggleChanged:];
}

id objc_msgSend__emitFinalizedIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _emitFinalizedIfNeeded];
}

id objc_msgSend__getColorFilterTypePerVehiclePrefForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getColorFilterTypePerVehiclePrefForIndex:");
}

id objc_msgSend__getColorFiltersIntensityPerVehiclePrefForIndex_(void *a1, const char *a2, ...)
{
  return [_a1 _getColorFiltersIntensityPerVehiclePrefForIndex:];
}

id objc_msgSend__iconImageForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iconImageForIdentifier:");
}

id objc_msgSend__isAnnounceEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isAnnounceEnabled];
}

id objc_msgSend__isAnnounceMuted(void *a1, const char *a2, ...)
{
  return _[a1 _isAnnounceMuted];
}

id objc_msgSend__isDevicePickerLimitedUIOn(void *a1, const char *a2, ...)
{
  return _[a1 _isDevicePickerLimitedUIOn];
}

id objc_msgSend__isDrivingToggleOn(void *a1, const char *a2, ...)
{
  return _[a1 _isDrivingToggleOn];
}

id objc_msgSend__kitImageNamed_withTrait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_kitImageNamed:withTrait:");
}

id objc_msgSend__labelColor(void *a1, const char *a2, ...)
{
  return _[a1 _labelColor];
}

id objc_msgSend__limitedUIAttributedString(void *a1, const char *a2, ...)
{
  return _[a1 _limitedUIAttributedString];
}

id objc_msgSend__modeForSilentModeType_(void *a1, const char *a2, ...)
{
  return [a1 _modeForSilentModeType:];
}

id objc_msgSend__modeForSiriPreferences_(void *a1, const char *a2, ...)
{
  return [a1 _modeForSiriPreferences:];
}

id objc_msgSend__muteAnnouncementsSpecifierTitleForMuted_announceEnablementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_muteAnnouncementsSpecifierTitleForMuted:announceEnablementType:");
}

id objc_msgSend__newPreviewPanelForWallpaper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newPreviewPanelForWallpaper:");
}

id objc_msgSend__observeASCs(void *a1, const char *a2, ...)
{
  return _[a1 _observeASCs];
}

id objc_msgSend__performAction_(void *a1, const char *a2, ...)
{
  return [a1 _performAction:];
}

id objc_msgSend__performBatchUpdatesForReloadIndexPaths_insertIndexPaths_removeIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performBatchUpdatesForReloadIndexPaths:insertIndexPaths:removeIndexPaths:");
}

id objc_msgSend__performCARPreferencesBlock_forReading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performCARPreferencesBlock:forReading:");
}

id objc_msgSend__postInRangeNotificationIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _postInRangeNotificationIfNeeded];
}

id objc_msgSend__postNotification_isFallback_(void *a1, const char *a2, ...)
{
  return [a1 _postNotification:isFallback:];
}

id objc_msgSend__prepareForLayout(void *a1, const char *a2, ...)
{
  return _[a1 _prepareForLayout];
}

id objc_msgSend__printFonts(void *a1, const char *a2, ...)
{
  return _[a1 _printFonts];
}

id objc_msgSend__refreshStyleText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshStyleText:");
}

id objc_msgSend__requestFocusUpdate_(void *a1, const char *a2, ...)
{
  return [a1 _requestFocusUpdate:];
}

id objc_msgSend__sectionContentInset(void *a1, const char *a2, ...)
{
  return _[a1 _sectionContentInset];
}

id objc_msgSend__sessionSupportsVehicleData(void *a1, const char *a2, ...)
{
  return _[a1 _sessionSupportsVehicleData];
}

id objc_msgSend__setExistingNavigationItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setExistingNavigationItem:");
}

id objc_msgSend__setHeaderAndFooterViewsFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHeaderAndFooterViewsFloat:");
}

id objc_msgSend__setIconState_(void *a1, const char *a2, ...)
{
  return [a1 _setIconState:];
}

id objc_msgSend__shouldShowThreeWaySwitch(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowThreeWaySwitch];
}

id objc_msgSend__silentModeDebugDescription(void *a1, const char *a2, ...)
{
  return _[a1 _silentModeDebugDescription];
}

id objc_msgSend__sizeUpdated(void *a1, const char *a2, ...)
{
  return _[a1 _sizeUpdated];
}

id objc_msgSend__specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 _specifierAtIndexPath:];
}

id objc_msgSend__stopObservingASCs(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingASCs];
}

id objc_msgSend__stopObservingPairedDevicesASCs(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingPairedDevicesASCs];
}

id objc_msgSend__tappyTap(void *a1, const char *a2, ...)
{
  return _[a1 _tappyTap];
}

id objc_msgSend__updateAIEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _updateAIEnabled];
}

id objc_msgSend__updateAnnounceEnabled_(void *a1, const char *a2, ...)
{
  return [a1 _updateAnnounceEnabled:];
}

id objc_msgSend__updateAnnounceMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnnounceMuted:");
}

id objc_msgSend__updateColors(void *a1, const char *a2, ...)
{
  return _[a1 _updateColors];
}

id objc_msgSend__updateCurrentMode(void *a1, const char *a2, ...)
{
  return _[a1 _updateCurrentMode];
}

id objc_msgSend__updateFromValue_(void *a1, const char *a2, ...)
{
  return [a1 _updateFromValue:];
}

id objc_msgSend__updateMaterialForInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMaterialForInterfaceStyle:");
}

id objc_msgSend__updateSelectedIndex(void *a1, const char *a2, ...)
{
  return _[a1 _updateSelectedIndex];
}

id objc_msgSend__updateSettingsForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSettingsForMode:");
}

id objc_msgSend__updateSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _updateSpecifiers];
}

id objc_msgSend__updateStackViewEdgeConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _updateStackViewEdgeConstraints];
}

id objc_msgSend__userNotificationSettingForAnnounceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userNotificationSettingForAnnounceType:");
}

id objc_msgSend_accessibilityIcon(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityIcon];
}

id objc_msgSend_accessibilityNumberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityNumberFormatter];
}

id objc_msgSend_accessoryType(void *a1, const char *a2, ...)
{
  return _[a1 accessoryType];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return _[a1 accessoryView];
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return _[a1 accountName];
}

id objc_msgSend_acquireWithAnimationSettings_(void *a1, const char *a2, ...)
{
  return [a1 acquireWithAnimationSettings:];
}

id objc_msgSend_actionBlock(void *a1, const char *a2, ...)
{
  return _[a1 actionBlock];
}

id objc_msgSend_actioned(void *a1, const char *a2, ...)
{
  return _[a1 actioned];
}

id objc_msgSend_actionedImageView(void *a1, const char *a2, ...)
{
  return _[a1 actionedImageView];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return [a1 addArrangedSubview:];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return [a1 addIndex:];
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return [a1 addLayoutGuide:];
}

id objc_msgSend_addListener_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 addListener:withCompletionHandler:];
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 addNotificationRequest:withCompletionHandler:];
}

id objc_msgSend_addNotificationSettingsObserver_(void *a1, const char *a2, ...)
{
  return [a1 addNotificationSettingsObserver:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addObserver_selector_name_object_suspensionBehavior_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:suspensionBehavior:];
}

id objc_msgSend_addSessionObserver_(void *a1, const char *a2, ...)
{
  return [a1 addSessionObserver:];
}

id objc_msgSend_addSiriPreferencesObserver_(void *a1, const char *a2, ...)
{
  return [a1 addSiriPreferencesObserver:];
}

id objc_msgSend_addSoundDetectionType_(void *a1, const char *a2, ...)
{
  return [a1 addSoundDetectionType:];
}

id objc_msgSend_addStateUpdateListener_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 addStateUpdateListener:withCompletionHandler:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forControlEvents:];
}

id objc_msgSend_albumArtDisabled(void *a1, const char *a2, ...)
{
  return _[a1 albumArtDisabled];
}

id objc_msgSend_albumArtImage(void *a1, const char *a2, ...)
{
  return _[a1 albumArtImage];
}

id objc_msgSend_albumArtSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 albumArtSpecifier];
}

id objc_msgSend_albumArtUserPreference(void *a1, const char *a2, ...)
{
  return _[a1 albumArtUserPreference];
}

id objc_msgSend_allModes(void *a1, const char *a2, ...)
{
  return _[a1 allModes];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allOptions(void *a1, const char *a2, ...)
{
  return _[a1 allOptions];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateAlongsideTransition:completion:];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:];
}

id objc_msgSend_announceCarPlaySettingUpdated_(void *a1, const char *a2, ...)
{
  return [a1 announceCarPlaySettingUpdated:];
}

id objc_msgSend_announceEnabledSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 announceEnabledSpecifier];
}

id objc_msgSend_announceEnabledStateUpdated_(void *a1, const char *a2, ...)
{
  return [a1 announceEnabledStateUpdated:];
}

id objc_msgSend_announceImage(void *a1, const char *a2, ...)
{
  return _[a1 announceImage];
}

id objc_msgSend_announceNotificationsInCarPlayTemporarilyDisabled(void *a1, const char *a2, ...)
{
  return _[a1 announceNotificationsInCarPlayTemporarilyDisabled];
}

id objc_msgSend_announceNotificationsPanel(void *a1, const char *a2, ...)
{
  return _[a1 announceNotificationsPanel];
}

id objc_msgSend_announceType(void *a1, const char *a2, ...)
{
  return _[a1 announceType];
}

id objc_msgSend_announcementCarPlaySetting(void *a1, const char *a2, ...)
{
  return _[a1 announcementCarPlaySetting];
}

id objc_msgSend_announcementSetting(void *a1, const char *a2, ...)
{
  return _[a1 announcementSetting];
}

id objc_msgSend_appearanceGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 appearanceGroupSpecifier];
}

id objc_msgSend_appearanceImage(void *a1, const char *a2, ...)
{
  return _[a1 appearanceImage];
}

id objc_msgSend_appearanceModePreference(void *a1, const char *a2, ...)
{
  return _[a1 appearanceModePreference];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 appendAttributedString:];
}

id objc_msgSend_appleIntelligenceImage(void *a1, const char *a2, ...)
{
  return _[a1 appleIntelligenceImage];
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return _[a1 arrangedSubviews];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return [a1 attributedStringWithAttachment:];
}

id objc_msgSend_attributedTitle(void *a1, const char *a2, ...)
{
  return _[a1 attributedTitle];
}

id objc_msgSend_autoSendInCarPlayEnabled(void *a1, const char *a2, ...)
{
  return _[a1 autoSendInCarPlayEnabled];
}

id objc_msgSend_autoSendInHeadphonesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 autoSendInHeadphonesEnabled];
}

id objc_msgSend_autoSendMessagesSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 autoSendMessagesSpecifier];
}

id objc_msgSend_availableInteractionModels(void *a1, const char *a2, ...)
{
  return _[a1 availableInteractionModels];
}

id objc_msgSend_avatarImageAsNotificationIcon(void *a1, const char *a2, ...)
{
  return _[a1 avatarImageAsNotificationIcon];
}

id objc_msgSend_axBoldTextPrefChangedForVehicle_session_(void *a1, const char *a2, ...)
{
  return [a1 axBoldTextPrefChangedForVehicle:session:];
}

id objc_msgSend_axColorFiltersPrefChangedForVehicle_session_(void *a1, const char *a2, ...)
{
  return [a1 axColorFiltersPrefChangedForVehicle:session:];
}

id objc_msgSend_axSoundRecognitionChangedForVehicle_session_(void *a1, const char *a2, ...)
{
  return [a1 axSoundRecognitionChangedForVehicle:session:];
}

id objc_msgSend_axVoiceControlPrefChanged_forVehicle_session_(void *a1, const char *a2, ...)
{
  return [a1 axVoiceControlPrefChanged:forVehicle:session:];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithRect:];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_boldTextPreference(void *a1, const char *a2, ...)
{
  return _[a1 boldTextPreference];
}

id objc_msgSend_boldTextSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 boldTextSpecifier];
}

id objc_msgSend_boldTextToggleChanged_(void *a1, const char *a2, ...)
{
  return [a1 boldTextToggleChanged:];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
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

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 bs_firstObjectPassingTest:];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithType:];
}

id objc_msgSend_cachedEffectiveSectionInset(void *a1, const char *a2, ...)
{
  return _[a1 cachedEffectiveSectionInset];
}

id objc_msgSend_cachedEffectiveSectionInsetLayoutSize(void *a1, const char *a2, ...)
{
  return _[a1 cachedEffectiveSectionInsetLayoutSize];
}

id objc_msgSend_calculatedCellHeight(void *a1, const char *a2, ...)
{
  return _[a1 calculatedCellHeight];
}

id objc_msgSend_calculatedCellWidth(void *a1, const char *a2, ...)
{
  return _[a1 calculatedCellWidth];
}

id objc_msgSend_canBecomeFocused(void *a1, const char *a2, ...)
{
  return _[a1 canBecomeFocused];
}

id objc_msgSend_car(void *a1, const char *a2, ...)
{
  return _[a1 car];
}

id objc_msgSend_carHornSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 carHornSpecifier];
}

id objc_msgSend_carManager(void *a1, const char *a2, ...)
{
  return _[a1 carManager];
}

id objc_msgSend_carManager_didUpdateCurrentCar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carManager:didUpdateCurrentCar:");
}

id objc_msgSend_carManager_didUpdatePairedDevices_(void *a1, const char *a2, ...)
{
  return [a1 carManager:didUpdatePairedDevices:];
}

id objc_msgSend_carManagerRequestedDevicePicker_(void *a1, const char *a2, ...)
{
  return [a1 carManagerRequestedDevicePicker:];
}

id objc_msgSend_carPlayAnnounceEnablementType(void *a1, const char *a2, ...)
{
  return _[a1 carPlayAnnounceEnablementType];
}

id objc_msgSend_carSession(void *a1, const char *a2, ...)
{
  return _[a1 carSession];
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_options_(void *a1, const char *a2, ...)
{
  return [a1 categoryWithIdentifier:actions:intentIdentifiers:options:];
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 cellForRowAtIndexPath:];
}

id objc_msgSend_cellSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 cellSpecifier];
}

id objc_msgSend_cellSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 cellSpecifiers];
}

id objc_msgSend_cellValue(void *a1, const char *a2, ...)
{
  return _[a1 cellValue];
}

id objc_msgSend_cellView(void *a1, const char *a2, ...)
{
  return _[a1 cellView];
}

id objc_msgSend_cellViewSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 cellViewSpecifier];
}

id objc_msgSend_cells(void *a1, const char *a2, ...)
{
  return _[a1 cells];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_checkInRangeDevicesStartDate(void *a1, const char *a2, ...)
{
  return _[a1 checkInRangeDevicesStartDate];
}

id objc_msgSend_clearAnnounceNotificationsInCarPlayTemporarilyDisabled(void *a1, const char *a2, ...)
{
  return _[a1 clearAnnounceNotificationsInCarPlayTemporarilyDisabled];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clusterAssetIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clusterAssetIdentifier];
}

id objc_msgSend_clusterAssetVersion(void *a1, const char *a2, ...)
{
  return _[a1 clusterAssetVersion];
}

id objc_msgSend_clusterThemeManager(void *a1, const char *a2, ...)
{
  return _[a1 clusterThemeManager];
}

id objc_msgSend_collectionSource(void *a1, const char *a2, ...)
{
  return _[a1 collectionSource];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_collectionView_didUpdateContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:didUpdateContentSize:");
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewLayout];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _[a1 color];
}

id objc_msgSend_colorBlindnessTypes(void *a1, const char *a2, ...)
{
  return _[a1 colorBlindnessTypes];
}

id objc_msgSend_colorEffectSaturate_(void *a1, const char *a2, ...)
{
  return [a1 colorEffectSaturate:];
}

id objc_msgSend_colorFilterIntensityPickerGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 colorFilterIntensityPickerGroupSpecifier];
}

id objc_msgSend_colorFilterIntensityPreference(void *a1, const char *a2, ...)
{
  return _[a1 colorFilterIntensityPreference];
}

id objc_msgSend_colorFilterPickerGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 colorFilterPickerGroupSpecifier];
}

id objc_msgSend_colorFilterPreference(void *a1, const char *a2, ...)
{
  return _[a1 colorFilterPreference];
}

id objc_msgSend_colorFilterSwitchSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 colorFilterSwitchSpecifier];
}

id objc_msgSend_colorFilters(void *a1, const char *a2, ...)
{
  return _[a1 colorFilters];
}

id objc_msgSend_colorFiltersSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 colorFiltersSpecifier];
}

id objc_msgSend_colorFiltersSwitchIsOn(void *a1, const char *a2, ...)
{
  return _[a1 colorFiltersSwitchIsOn];
}

id objc_msgSend_colorModel(void *a1, const char *a2, ...)
{
  return _[a1 colorModel];
}

id objc_msgSend_colorModels(void *a1, const char *a2, ...)
{
  return _[a1 colorModels];
}

id objc_msgSend_colorViewWasTapped_(void *a1, const char *a2, ...)
{
  return [a1 colorViewWasTapped:];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_colors(void *a1, const char *a2, ...)
{
  return _[a1 colors];
}

id objc_msgSend_columns(void *a1, const char *a2, ...)
{
  return _[a1 columns];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _[a1 completionHandler];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return _[a1 config];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithHierarchicalColor:];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_connectToWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 connectToWindowScene:];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:constant:];
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToConstant:];
}

id objc_msgSend_constraintEqualToSystemSpacingBelowAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToSystemSpacingBelowAnchor:multiplier:];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_crsui_imageNamed_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 crsui_imageNamed:compatibleWithTraitCollection:];
}

id objc_msgSend_currentCar(void *a1, const char *a2, ...)
{
  return _[a1 currentCar];
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 currentNotificationCenter];
}

id objc_msgSend_currentNotificationSettingsCenter(void *a1, const char *a2, ...)
{
  return _[a1 currentNotificationSettingsCenter];
}

id objc_msgSend_currentNotificationSystemSettings(void *a1, const char *a2, ...)
{
  return _[a1 currentNotificationSystemSettings];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return _[a1 currentSession];
}

id objc_msgSend_currentSizeTitle(void *a1, const char *a2, ...)
{
  return _[a1 currentSizeTitle];
}

id objc_msgSend_currentStyles(void *a1, const char *a2, ...)
{
  return _[a1 currentStyles];
}

id objc_msgSend_currentViewArea(void *a1, const char *a2, ...)
{
  return _[a1 currentViewArea];
}

id objc_msgSend_currentViewController(void *a1, const char *a2, ...)
{
  return _[a1 currentViewController];
}

id objc_msgSend_currentWallpaper(void *a1, const char *a2, ...)
{
  return _[a1 currentWallpaper];
}

id objc_msgSend_darkMapsSwitchSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 darkMapsSwitchSpecifier];
}

id objc_msgSend_darkMaterial(void *a1, const char *a2, ...)
{
  return _[a1 darkMaterial];
}

id objc_msgSend_dashboardService(void *a1, const char *a2, ...)
{
  return _[a1 dashboardService];
}

id objc_msgSend_dataProvider(void *a1, const char *a2, ...)
{
  return _[a1 dataProvider];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_deactivationReasons(void *a1, const char *a2, ...)
{
  return _[a1 deactivationReasons];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return _[a1 defaultSound];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 deleteSections:withRowAnimation:];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:forIndexPath:];
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithReuseIdentifier:forIndexPath:];
}

id objc_msgSend_dequeueReusableHeaderFooterViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableHeaderFooterViewWithIdentifier:];
}

id objc_msgSend_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:];
}

id objc_msgSend_descriptionForAvailableInteractionModels(void *a1, const char *a2, ...)
{
  return _[a1 descriptionForAvailableInteractionModels];
}

id objc_msgSend_descriptionForLimitableUserInterfaces(void *a1, const char *a2, ...)
{
  return _[a1 descriptionForLimitableUserInterfaces];
}

id objc_msgSend_descriptionForPrimaryInteractionModel(void *a1, const char *a2, ...)
{
  return _[a1 descriptionForPrimaryInteractionModel];
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return [a1 deselectRowAtIndexPath:animated:];
}

id objc_msgSend_detail(void *a1, const char *a2, ...)
{
  return _[a1 detail];
}

id objc_msgSend_detailLineBreakMode(void *a1, const char *a2, ...)
{
  return _[a1 detailLineBreakMode];
}

id objc_msgSend_detailNumberOfLines(void *a1, const char *a2, ...)
{
  return _[a1 detailNumberOfLines];
}

id objc_msgSend_detailSizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 detailSizeToFit];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_devicePickerImage(void *a1, const char *a2, ...)
{
  return _[a1 devicePickerImage];
}

id objc_msgSend_devicePickerSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 devicePickerSpecifier];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_disabledFeature(void *a1, const char *a2, ...)
{
  return _[a1 disabledFeature];
}

id objc_msgSend_dismissPanel_(void *a1, const char *a2, ...)
{
  return [a1 dismissPanel:];
}

id objc_msgSend_dismissPanel_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissPanel:completion:];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:completion:];
}

id objc_msgSend_displayImage(void *a1, const char *a2, ...)
{
  return _[a1 displayImage];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_displayStyle_name_enabled_(void *a1, const char *a2, ...)
{
  return [a1 displayStyle:name:enabled:];
}

id objc_msgSend_dndImage(void *a1, const char *a2, ...)
{
  return _[a1 dndImage];
}

id objc_msgSend_dndSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 dndSpecifier];
}

id objc_msgSend_dndStatus(void *a1, const char *a2, ...)
{
  return _[a1 dndStatus];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_effectCompositingColor_withMode_alpha_(void *a1, const char *a2, ...)
{
  return [a1 effectCompositingColor:withMode:alpha:];
}

id objc_msgSend_effectWithBlurRadius_(void *a1, const char *a2, ...)
{
  return [a1 effectWithBlurRadius:];
}

id objc_msgSend_effectiveSectionHeaderInset(void *a1, const char *a2, ...)
{
  return _[a1 effectiveSectionHeaderInset];
}

id objc_msgSend_effectiveSectionInset(void *a1, const char *a2, ...)
{
  return _[a1 effectiveSectionInset];
}

id objc_msgSend_emitInstantOnIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 emitInstantOnIfNeeded];
}

id objc_msgSend_emitLaunched(void *a1, const char *a2, ...)
{
  return _[a1 emitLaunched];
}

id objc_msgSend_emitRenderedIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 emitRenderedIfNeeded];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_enumerateIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateIndexesUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_externalSystemTealColor(void *a1, const char *a2, ...)
{
  return _[a1 externalSystemTealColor];
}

id objc_msgSend_fakeNeatlineDashboardSupport(void *a1, const char *a2, ...)
{
  return _[a1 fakeNeatlineDashboardSupport];
}

id objc_msgSend_fetchApplicationIconInformationForBundleIdentifier_vehicleID_showBorder_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchApplicationIconInformationForBundleIdentifier:vehicleID:showBorder:completion:];
}

id objc_msgSend_fetchCarCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 fetchCarCapabilities];
}

id objc_msgSend_fetchIconStateForVehicleID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchIconStateForVehicleID:completion:");
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _[a1 fill];
}

id objc_msgSend_filterPreference_name_(void *a1, const char *a2, ...)
{
  return [a1 filterPreference:name:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_focusHighlightView(void *a1, const char *a2, ...)
{
  return _[a1 focusHighlightView];
}

id objc_msgSend_focusRingView(void *a1, const char *a2, ...)
{
  return _[a1 focusRingView];
}

id objc_msgSend_focusSystemForEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 focusSystemForEnvironment:];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorByAddingAttributes:];
}

id objc_msgSend_fontTextStyles(void *a1, const char *a2, ...)
{
  return _[a1 fontTextStyles];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithDescriptor:];
}

id objc_msgSend_footer(void *a1, const char *a2, ...)
{
  return _[a1 footer];
}

id objc_msgSend_footerViewForSection_(void *a1, const char *a2, ...)
{
  return [a1 footerViewForSection:];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return [a1 functionWithName:];
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return _[a1 generalPasteboard];
}

id objc_msgSend_getCarHornPreferenceIsOn(void *a1, const char *a2, ...)
{
  return _[a1 getCarHornPreferenceIsOn];
}

id objc_msgSend_getCarPlaySilentModePreference(void *a1, const char *a2, ...)
{
  return _[a1 getCarPlaySilentModePreference];
}

id objc_msgSend_getColorFiltersIntensityPerVehiclePreferenceDict(void *a1, const char *a2, ...)
{
  return _[a1 getColorFiltersIntensityPerVehiclePreferenceDict];
}

id objc_msgSend_getColorFiltersIntensityPreferenceTypeForIndex_(void *a1, const char *a2, ...)
{
  return [a1 getColorFiltersIntensityPreferenceTypeForIndex:];
}

id objc_msgSend_getColorFiltersPerVehiclePreferenceType(void *a1, const char *a2, ...)
{
  return _[a1 getColorFiltersPerVehiclePreferenceType];
}

id objc_msgSend_getColorFiltersPreferenceIsOn(void *a1, const char *a2, ...)
{
  return _[a1 getColorFiltersPreferenceIsOn];
}

id objc_msgSend_getColorFiltersPreferenceType(void *a1, const char *a2, ...)
{
  return _[a1 getColorFiltersPreferenceType];
}

id objc_msgSend_getSirenPreferenceIsOn(void *a1, const char *a2, ...)
{
  return _[a1 getSirenPreferenceIsOn];
}

id objc_msgSend_getSoundRecognitionPreferenceIsOn(void *a1, const char *a2, ...)
{
  return _[a1 getSoundRecognitionPreferenceIsOn];
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return _[a1 greenColor];
}

id objc_msgSend_groupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 groupSpecifier];
}

id objc_msgSend_groupSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 groupSpecifiers];
}

id objc_msgSend_hasEmittedFinalizedSignpost(void *a1, const char *a2, ...)
{
  return _[a1 hasEmittedFinalizedSignpost];
}

id objc_msgSend_hasEmittedInstantOnSignpost(void *a1, const char *a2, ...)
{
  return _[a1 hasEmittedInstantOnSignpost];
}

id objc_msgSend_hasEmittedRenderedSignpost(void *a1, const char *a2, ...)
{
  return _[a1 hasEmittedRenderedSignpost];
}

id objc_msgSend_hasEqualFooter_(void *a1, const char *a2, ...)
{
  return [a1 hasEqualFooter:];
}

id objc_msgSend_hasEqualHeader_(void *a1, const char *a2, ...)
{
  return [a1 hasEqualHeader:];
}

id objc_msgSend_hasEqualSpecifiers_(void *a1, const char *a2, ...)
{
  return [a1 hasEqualSpecifiers:];
}

id objc_msgSend_headerViewForSection_(void *a1, const char *a2, ...)
{
  return [a1 headerViewForSection:];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_iconColumns(void *a1, const char *a2, ...)
{
  return _[a1 iconColumns];
}

id objc_msgSend_iconImageData(void *a1, const char *a2, ...)
{
  return _[a1 iconImageData];
}

id objc_msgSend_iconImageScale(void *a1, const char *a2, ...)
{
  return _[a1 iconImageScale];
}

id objc_msgSend_iconLayoutController(void *a1, const char *a2, ...)
{
  return _[a1 iconLayoutController];
}

id objc_msgSend_iconRows(void *a1, const char *a2, ...)
{
  return _[a1 iconRows];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:inBundle:compatibleWithTraitCollection:];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return [a1 imageWithCGImage:scale:orientation:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return _[a1 indexPathForSelectedRow];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return [a1 indexSetWithIndex:];
}

id objc_msgSend_initAndWaitUntilSessionUpdated(void *a1, const char *a2, ...)
{
  return _[a1 initAndWaitUntilSessionUpdated];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithConfig_color_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfig:color:];
}

id objc_msgSend_initWithData_scale_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:scale:];
}

id objc_msgSend_initWithDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataProvider:];
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffect:];
}

id objc_msgSend_initWithEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 initWithEnvironment:];
}

id objc_msgSend_initWithFontTextStyles_(void *a1, const char *a2, ...)
{
  return [a1 initWithFontTextStyles:];
}

id objc_msgSend_initWithFooter_specifiers_(void *a1, const char *a2, ...)
{
  return [a1 initWithFooter:specifiers:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithFrame_collectionViewLayout_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:collectionViewLayout:];
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:style:];
}

id objc_msgSend_initWithFullTitle_footer_muteType_announceType_(void *a1, const char *a2, ...)
{
  return [a1 initWithFullTitle:footer:muteType:announceType:];
}

id objc_msgSend_initWithFullTitle_footer_silentModeType_(void *a1, const char *a2, ...)
{
  return [a1 initWithFullTitle:footer:silentModeType:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithInterfaceStyle_colorVariant_(void *a1, const char *a2, ...)
{
  return [a1 initWithInterfaceStyle:colorVariant:];
}

id objc_msgSend_initWithInternalSettingPrototype_(void *a1, const char *a2, ...)
{
  return [a1 initWithInternalSettingPrototype:];
}

id objc_msgSend_initWithModel_(void *a1, const char *a2, ...)
{
  return [a1 initWithModel:];
}

id objc_msgSend_initWithPairedDevices_carSession_(void *a1, const char *a2, ...)
{
  return [a1 initWithPairedDevices:carSession:];
}

id objc_msgSend_initWithPanel_sections_(void *a1, const char *a2, ...)
{
  return [a1 initWithPanel:sections:];
}

id objc_msgSend_initWithPanel_specifiers_(void *a1, const char *a2, ...)
{
  return [a1 initWithPanel:specifiers:];
}

id objc_msgSend_initWithPanelController_(void *a1, const char *a2, ...)
{
  return [a1 initWithPanelController:];
}

id objc_msgSend_initWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 initWithProtocol:];
}

id objc_msgSend_initWithSessionStatus_(void *a1, const char *a2, ...)
{
  return [a1 initWithSessionStatus:];
}

id objc_msgSend_initWithSpecifiers_(void *a1, const char *a2, ...)
{
  return [a1 initWithSpecifiers:];
}

id objc_msgSend_initWithSpecifiers_specifierSections_(void *a1, const char *a2, ...)
{
  return [a1 initWithSpecifiers:specifierSections:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithTitle_footer_specifiers_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:footer:specifiers:];
}

id objc_msgSend_initWithTitle_image_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:image:];
}

id objc_msgSend_initWithTitle_image_accessoryType_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:image:accessoryType:];
}

id objc_msgSend_initWithTitle_image_accessoryType_actionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:image:accessoryType:actionBlock:];
}

id objc_msgSend_initWithTitle_image_accessoryType_carSession_actionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:image:accessoryType:carSession:actionBlock:];
}

id objc_msgSend_initWithTitle_image_actionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:image:actionBlock:];
}

id objc_msgSend_initWithTitle_specifiers_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:specifiers:];
}

id objc_msgSend_initWithTitle_subtitle_image_accessoryType_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:subtitle:image:accessoryType:];
}

id objc_msgSend_initWithTitle_subtitle_image_accessoryType_actionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:subtitle:image:accessoryType:actionBlock:");
}

id objc_msgSend_initWithTitles_actionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitles:actionBlock:];
}

id objc_msgSend_initWithTitles_subtitles_actionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitles:subtitles:actionBlock:];
}

id objc_msgSend_initWithVehicle_(void *a1, const char *a2, ...)
{
  return [a1 initWithVehicle:];
}

id objc_msgSend_initWithView_actionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithView:actionBlock:];
}

id objc_msgSend_initWithWallpaper_wallpaperPreferences_(void *a1, const char *a2, ...)
{
  return [a1 initWithWallpaper:wallpaperPreferences:];
}

id objc_msgSend_initWithWallpaper_wallpaperPreferences_carSession_actionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithWallpaper:wallpaperPreferences:carSession:actionBlock:];
}

id objc_msgSend_initWithWallpaper_wallpaperPreferences_panelController_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithWallpaper:wallpaperPreferences:panelController:completionHandler:];
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:];
}

id objc_msgSend_insertSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSections:withRowAnimation:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intensities(void *a1, const char *a2, ...)
{
  return _[a1 intensities];
}

id objc_msgSend_internalImage(void *a1, const char *a2, ...)
{
  return _[a1 internalImage];
}

id objc_msgSend_internalSettingsState(void *a1, const char *a2, ...)
{
  return _[a1 internalSettingsState];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_intrinsictContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsictContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return _[a1 invalidateLayout];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isBoldTextEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isBoldTextEnabled];
}

id objc_msgSend_isCarHornOrSirenDetectionOn(void *a1, const char *a2, ...)
{
  return _[a1 isCarHornOrSirenDetectionOn];
}

id objc_msgSend_isCellFocused(void *a1, const char *a2, ...)
{
  return _[a1 isCellFocused];
}

id objc_msgSend_isDevicePickerURL(void *a1, const char *a2, ...)
{
  return _[a1 isDevicePickerURL];
}

id objc_msgSend_isDeviceSilentModeOn(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceSilentModeOn];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToAttributedString:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToSpecifierSection_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToSpecifierSection:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFocusActive(void *a1, const char *a2, ...)
{
  return _[a1 isFocusActive];
}

id objc_msgSend_isFocused(void *a1, const char *a2, ...)
{
  return _[a1 isFocused];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return _[a1 isHighlighted];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return _[a1 isOn];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isSpinnerVisible(void *a1, const char *a2, ...)
{
  return _[a1 isSpinnerVisible];
}

id objc_msgSend_isSupportedCarPlayFilterType_(void *a1, const char *a2, ...)
{
  return [a1 isSupportedCarPlayFilterType:];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelBottomConstraint(void *a1, const char *a2, ...)
{
  return _[a1 labelBottomConstraint];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_labelTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 labelTopConstraint];
}

id objc_msgSend_largeButton(void *a1, const char *a2, ...)
{
  return _[a1 largeButton];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_lastContentSize(void *a1, const char *a2, ...)
{
  return _[a1 lastContentSize];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_latestInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 latestInterfaceStyle];
}

id objc_msgSend_launchOnCarPlayButton(void *a1, const char *a2, ...)
{
  return _[a1 launchOnCarPlayButton];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 layoutDirection];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return _[a1 layoutFrame];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leadingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 leadingConstraint];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leftAnchor];
}

id objc_msgSend_leftChevron(void *a1, const char *a2, ...)
{
  return _[a1 leftChevron];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 lightGrayColor];
}

id objc_msgSend_lightMaterial(void *a1, const char *a2, ...)
{
  return _[a1 lightMaterial];
}

id objc_msgSend_limitUserInterfaces(void *a1, const char *a2, ...)
{
  return _[a1 limitUserInterfaces];
}

id objc_msgSend_limitableUserInterfaces(void *a1, const char *a2, ...)
{
  return _[a1 limitableUserInterfaces];
}

id objc_msgSend_loadWallpaperPreferences(void *a1, const char *a2, ...)
{
  return _[a1 loadWallpaperPreferences];
}

id objc_msgSend_loadingViewController(void *a1, const char *a2, ...)
{
  return _[a1 loadingViewController];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithFormat:];
}

id objc_msgSend_mainAutoSendEnabled(void *a1, const char *a2, ...)
{
  return _[a1 mainAutoSendEnabled];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return _[a1 manufacturerName];
}

id objc_msgSend_mapsAppearancePreference(void *a1, const char *a2, ...)
{
  return _[a1 mapsAppearancePreference];
}

id objc_msgSend_mediumButton(void *a1, const char *a2, ...)
{
  return _[a1 mediumButton];
}

id objc_msgSend_minimumInteritemSpacing(void *a1, const char *a2, ...)
{
  return _[a1 minimumInteritemSpacing];
}

id objc_msgSend_minimumLineSpacing(void *a1, const char *a2, ...)
{
  return _[a1 minimumLineSpacing];
}

id objc_msgSend_modeConfigurationForModeIdentifier_error_(void *a1, const char *a2, ...)
{
  return [a1 modeConfigurationForModeIdentifier:error:];
}

id objc_msgSend_modeWithFullTitle_footer_muteType_announceType_(void *a1, const char *a2, ...)
{
  return [a1 modeWithFullTitle:footer:muteType:announceType:];
}

id objc_msgSend_modelName(void *a1, const char *a2, ...)
{
  return _[a1 modelName];
}

id objc_msgSend_modelWithColor_name_(void *a1, const char *a2, ...)
{
  return [a1 modelWithColor:name:];
}

id objc_msgSend_modes(void *a1, const char *a2, ...)
{
  return _[a1 modes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_muteAnnouncementsSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 muteAnnouncementsSpecifier];
}

id objc_msgSend_muteOptionsPanel(void *a1, const char *a2, ...)
{
  return _[a1 muteOptionsPanel];
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

id objc_msgSend_needsScrollBar(void *a1, const char *a2, ...)
{
  return _[a1 needsScrollBar];
}

id objc_msgSend_nextFocusedItem(void *a1, const char *a2, ...)
{
  return _[a1 nextFocusedItem];
}

id objc_msgSend_notificationSettingsObservers(void *a1, const char *a2, ...)
{
  return _[a1 notificationSettingsObservers];
}

id objc_msgSend_notificationSystemSettings(void *a1, const char *a2, ...)
{
  return _[a1 notificationSystemSettings];
}

id objc_msgSend_notificationWithName_object_(void *a1, const char *a2, ...)
{
  return [a1 notificationWithName:object:];
}

id objc_msgSend_nowPlayingAlbumArt(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingAlbumArt];
}

id objc_msgSend_nowPlayingAlbumArtMode(void *a1, const char *a2, ...)
{
  return _[a1 nowPlayingAlbumArtMode];
}

id objc_msgSend_numberOfColumns(void *a1, const char *a2, ...)
{
  return _[a1 numberOfColumns];
}

id objc_msgSend_numberOfRows(void *a1, const char *a2, ...)
{
  return _[a1 numberOfRows];
}

id objc_msgSend_numberOfSectionsInCollectionView_(void *a1, const char *a2, ...)
{
  return [a1 numberOfSectionsInCollectionView:];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 openApplication:withOptions:completion:];
}

id objc_msgSend_openSettingsURL_(void *a1, const char *a2, ...)
{
  return [a1 openSettingsURL:];
}

id objc_msgSend_optionWithFullTitle_footer_silentModeType_(void *a1, const char *a2, ...)
{
  return [a1 optionWithFullTitle:footer:silentModeType:];
}

id objc_msgSend_pairedDeviceList(void *a1, const char *a2, ...)
{
  return _[a1 pairedDeviceList];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 pairedDevices];
}

id objc_msgSend_pairedDevicesInformation(void *a1, const char *a2, ...)
{
  return _[a1 pairedDevicesInformation];
}

id objc_msgSend_pairedManager(void *a1, const char *a2, ...)
{
  return _[a1 pairedManager];
}

id objc_msgSend_panel(void *a1, const char *a2, ...)
{
  return _[a1 panel];
}

id objc_msgSend_panelController(void *a1, const char *a2, ...)
{
  return _[a1 panelController];
}

id objc_msgSend_panelWrappingCellSpecifier_(void *a1, const char *a2, ...)
{
  return [a1 panelWrappingCellSpecifier:];
}

id objc_msgSend_panels(void *a1, const char *a2, ...)
{
  return _[a1 panels];
}

id objc_msgSend_pendingAnnounceEnablementChangeFromSiri(void *a1, const char *a2, ...)
{
  return _[a1 pendingAnnounceEnablementChangeFromSiri];
}

id objc_msgSend_pendingAnnounceEnablementChangeFromUserNotifications(void *a1, const char *a2, ...)
{
  return _[a1 pendingAnnounceEnablementChangeFromUserNotifications];
}

id objc_msgSend_performBatchUpdates_completion_(void *a1, const char *a2, ...)
{
  return [a1 performBatchUpdates:];
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return [a1 performWithoutAnimation:];
}

id objc_msgSend_platterLeftConstraint(void *a1, const char *a2, ...)
{
  return _[a1 platterLeftConstraint];
}

id objc_msgSend_platterRightConstraint(void *a1, const char *a2, ...)
{
  return _[a1 platterRightConstraint];
}

id objc_msgSend_platterView(void *a1, const char *a2, ...)
{
  return _[a1 platterView];
}

id objc_msgSend_popIfPanel_(void *a1, const char *a2, ...)
{
  return [a1 popIfPanel:];
}

id objc_msgSend_popToRootPanel(void *a1, const char *a2, ...)
{
  return _[a1 popToRootPanel];
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popToRootViewControllerAnimated:];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popViewControllerAnimated:];
}

id objc_msgSend_postNotification_(void *a1, const char *a2, ...)
{
  return [a1 postNotification:];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_preference(void *a1, const char *a2, ...)
{
  return _[a1 preference];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFocusEnvironmentsForTableView_(void *a1, const char *a2, ...)
{
  return [a1 preferredFocusEnvironmentsForTableView:];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_presentPanel_(void *a1, const char *a2, ...)
{
  return [a1 presentPanel:];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_previouslyFocusedItem(void *a1, const char *a2, ...)
{
  return _[a1 previouslyFocusedItem];
}

id objc_msgSend_prototype(void *a1, const char *a2, ...)
{
  return _[a1 prototype];
}

id objc_msgSend_pushPanel_(void *a1, const char *a2, ...)
{
  return [a1 pushPanel:];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 pushViewController:animated:];
}

id objc_msgSend_queryCurrentStateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 queryCurrentStateWithCompletionHandler:];
}

id objc_msgSend_receivedAllValues(void *a1, const char *a2, ...)
{
  return _[a1 receivedAllValues];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_refreshSpecifierIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 refreshSpecifierIfNeeded];
}

id objc_msgSend_refreshViewControllerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 refreshViewControllerIfNeeded];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forCellReuseIdentifier:];
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forCellWithReuseIdentifier:];
}

id objc_msgSend_registerClass_forHeaderFooterViewReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forHeaderFooterViewReuseIdentifier:];
}

id objc_msgSend_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forSupplementaryViewOfKind:withReuseIdentifier:];
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return [a1 registerObserver:];
}

id objc_msgSend_registerPanel_(void *a1, const char *a2, ...)
{
  return [a1 registerPanel:];
}

id objc_msgSend_relinquishWithAnimationSettings_(void *a1, const char *a2, ...)
{
  return [a1 relinquishWithAnimationSettings:];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_reloadSections_(void *a1, const char *a2, ...)
{
  return [a1 reloadSections:];
}

id objc_msgSend_reloadSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return [a1 reloadSections:withRowAnimation:];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeListener_(void *a1, const char *a2, ...)
{
  return [a1 removeListener:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeSoundDetectionType_(void *a1, const char *a2, ...)
{
  return [a1 removeSoundDetectionType:];
}

id objc_msgSend_representedElementKind(void *a1, const char *a2, ...)
{
  return _[a1 representedElementKind];
}

id objc_msgSend_requestWithIdentifier_content_trigger_destinations_(void *a1, const char *a2, ...)
{
  return [a1 requestWithIdentifier:content:trigger:destinations:];
}

id objc_msgSend_resolveWallpaper_(void *a1, const char *a2, ...)
{
  return [a1 resolveWallpaper:];
}

id objc_msgSend_resolvedColorWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 resolvedColorWithTraitCollection:];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 reuseIdentifier];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 rightAnchor];
}

id objc_msgSend_rightHandDrive(void *a1, const char *a2, ...)
{
  return _[a1 rightHandDrive];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_rootPanel(void *a1, const char *a2, ...)
{
  return _[a1 rootPanel];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_rows(void *a1, const char *a2, ...)
{
  return _[a1 rows];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_safeFrame(void *a1, const char *a2, ...)
{
  return _[a1 safeFrame];
}

id objc_msgSend_sampleTextCollectionView(void *a1, const char *a2, ...)
{
  return _[a1 sampleTextCollectionView];
}

id objc_msgSend_sampleTextDataSource(void *a1, const char *a2, ...)
{
  return _[a1 sampleTextDataSource];
}

id objc_msgSend_saveVehicle_(void *a1, const char *a2, ...)
{
  return [a1 saveVehicle:];
}

id objc_msgSend_saveVehicle_completion_(void *a1, const char *a2, ...)
{
  return [a1 saveVehicle:completion:];
}

id objc_msgSend_savedFocusedIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 savedFocusedIndexPath];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _[a1 screen];
}

id objc_msgSend_screenType(void *a1, const char *a2, ...)
{
  return _[a1 screenType];
}

id objc_msgSend_screens(void *a1, const char *a2, ...)
{
  return _[a1 screens];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_secondaryTextProperties(void *a1, const char *a2, ...)
{
  return _[a1 secondaryTextProperties];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sectionInset(void *a1, const char *a2, ...)
{
  return _[a1 sectionInset];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _[a1 sections];
}

id objc_msgSend_selectedFilterIntensity(void *a1, const char *a2, ...)
{
  return _[a1 selectedFilterIntensity];
}

id objc_msgSend_selectedImageView(void *a1, const char *a2, ...)
{
  return _[a1 selectedImageView];
}

id objc_msgSend_selectedIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectedIndex];
}

id objc_msgSend_selectedTitle(void *a1, const char *a2, ...)
{
  return _[a1 selectedTitle];
}

id objc_msgSend_selectionStyle(void *a1, const char *a2, ...)
{
  return _[a1 selectionStyle];
}

id objc_msgSend_selectorViewController(void *a1, const char *a2, ...)
{
  return _[a1 selectorViewController];
}

id objc_msgSend_sendEvent_withParameters_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:withParameters:];
}

id objc_msgSend_serviceForClientIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 serviceForClientIdentifier:];
}

id objc_msgSend_sessionDidConnect_(void *a1, const char *a2, ...)
{
  return [a1 sessionDidConnect:];
}

id objc_msgSend_sessionStatus(void *a1, const char *a2, ...)
{
  return _[a1 sessionStatus];
}

id objc_msgSend_setAIEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAIEnabled:];
}

id objc_msgSend_setAccessibilityUserInputLabels_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityUserInputLabels:];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryType:];
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryView:];
}

id objc_msgSend_setActionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setActionBlock:];
}

id objc_msgSend_setActivateWithCarPlay_(void *a1, const char *a2, ...)
{
  return [a1 setActivateWithCarPlay:];
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontForContentSizeCategory:];
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontSizeToFitWidth:];
}

id objc_msgSend_setAlbumArtDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setAlbumArtDisabled:];
}

id objc_msgSend_setAlbumArtUserPreference_(void *a1, const char *a2, ...)
{
  return [a1 setAlbumArtUserPreference:];
}

id objc_msgSend_setAllowedPressTypes_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedPressTypes:];
}

id objc_msgSend_setAllowsDeferral_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsDeferral:];
}

id objc_msgSend_setAnnounceNotificationsInCarPlayTemporarilyDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setAnnounceNotificationsInCarPlayTemporarilyDisabled:];
}

id objc_msgSend_setAnnouncementCarPlaySetting_(void *a1, const char *a2, ...)
{
  return [a1 setAnnouncementCarPlaySetting:];
}

id objc_msgSend_setAnnouncementSetting_(void *a1, const char *a2, ...)
{
  return [a1 setAnnouncementSetting:];
}

id objc_msgSend_setAppearanceModePreference_(void *a1, const char *a2, ...)
{
  return [a1 setAppearanceModePreference:];
}

id objc_msgSend_setAppleIntelligenceEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAppleIntelligenceEnabled:];
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedText:];
}

id objc_msgSend_setAttributedTitle_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedTitle:];
}

id objc_msgSend_setAutomaticDNDActive_withReply_(void *a1, const char *a2, ...)
{
  return [a1 setAutomaticDNDActive:withReply:];
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizesSubviews:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return [a1 setAxis:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundEffects_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundEffects:];
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundView:];
}

id objc_msgSend_setBoldTextPreference_(void *a1, const char *a2, ...)
{
  return [a1 setBoldTextPreference:];
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return [a1 setBorderColor:];
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return [a1 setBorderWidth:];
}

id objc_msgSend_setCachedEffectiveSectionInset_(void *a1, const char *a2, ...)
{
  return [a1 setCachedEffectiveSectionInset];
}

id objc_msgSend_setCachedEffectiveSectionInsetLayoutSize_(void *a1, const char *a2, ...)
{
  return [a1 setCachedEffectiveSectionInsetLayoutSize:];
}

id objc_msgSend_setCarHornPreference_(void *a1, const char *a2, ...)
{
  return [a1 setCarHornPreference:];
}

id objc_msgSend_setCarPlayAnnounceEnablementType_(void *a1, const char *a2, ...)
{
  return [a1 setCarPlayAnnounceEnablementType:];
}

id objc_msgSend_setCarPlaySilentModePreference_(void *a1, const char *a2, ...)
{
  return [a1 setCarPlaySilentModePreference:];
}

id objc_msgSend_setCarSession_(void *a1, const char *a2, ...)
{
  return [a1 setCarSession:];
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCategoryIdentifier:];
}

id objc_msgSend_setCellFocused_(void *a1, const char *a2, ...)
{
  return [a1 setCellFocused:];
}

id objc_msgSend_setCellHighlighted_(void *a1, const char *a2, ...)
{
  return [a1 setCellHighlighted:];
}

id objc_msgSend_setCellSelected_(void *a1, const char *a2, ...)
{
  return [a1 setCellSelected:];
}

id objc_msgSend_setCellValue_(void *a1, const char *a2, ...)
{
  return [a1 setCellValue:];
}

id objc_msgSend_setCheckInRangeDevicesStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setCheckInRangeDevicesStartDate:];
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setClipsToBounds:];
}

id objc_msgSend_setCollectionSource_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionSource:];
}

id objc_msgSend_setCollectionView_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionView:];
}

id objc_msgSend_setCollectionViewLayout_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionViewLayout:];
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return [a1 setColor:];
}

id objc_msgSend_setColorFilterIntensityPreference_(void *a1, const char *a2, ...)
{
  return [a1 setColorFilterIntensityPreference:];
}

id objc_msgSend_setColorFilterPreference_(void *a1, const char *a2, ...)
{
  return [a1 setColorFilterPreference:];
}

id objc_msgSend_setColorFiltersIntensityPreference(void *a1, const char *a2, ...)
{
  return _[a1 setColorFiltersIntensityPreference];
}

id objc_msgSend_setColorFiltersPreference(void *a1, const char *a2, ...)
{
  return _[a1 setColorFiltersPreference];
}

id objc_msgSend_setColorFiltersPreference_(void *a1, const char *a2, ...)
{
  return [a1 setColorFiltersPreference:];
}

id objc_msgSend_setConfig_(void *a1, const char *a2, ...)
{
  return [a1 setConfig:];
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return [a1 setConstant:];
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setContentConfiguration:];
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return [a1 setContentInset:];
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return [a1 setContentMode:];
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setContentSize:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCurrentCar_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentCar:];
}

id objc_msgSend_setCurrentNotificationSystemSettings_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentNotificationSystemSettings:];
}

id objc_msgSend_setCurrentSizeTitle_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentSizeTitle:];
}

id objc_msgSend_setCurrentViewController_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentViewController:];
}

id objc_msgSend_setCurrentWallpaper_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentWallpaper:];
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setDataSource:];
}

id objc_msgSend_setDefaultActionBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultActionBundleIdentifier:];
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultActionURL:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDetail_(void *a1, const char *a2, ...)
{
  return [a1 setDetail:];
}

id objc_msgSend_setDetail_sizeToFit_withNumberOfLines_lineBreakMode_(void *a1, const char *a2, ...)
{
  return [a1 setDetail:sizeToFit:withNumberOfLines:lineBreakMode:];
}

id objc_msgSend_setDistribution_(void *a1, const char *a2, ...)
{
  return [a1 setDistribution:];
}

id objc_msgSend_setDomainOverride(void *a1, const char *a2, ...)
{
  return _[a1 setDomainOverride];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFocusActive_(void *a1, const char *a2, ...)
{
  return [a1 setFocusActive:];
}

id objc_msgSend_setFocusRingView_(void *a1, const char *a2, ...)
{
  return [a1 setFocusRingView:];
}

id objc_msgSend_setFocused_(void *a1, const char *a2, ...)
{
  return [a1 setFocused:];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setFontTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 setFontTextStyle:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return [a1 setHandler:];
}

id objc_msgSend_setHasEmittedFinalizedSignpost_(void *a1, const char *a2, ...)
{
  return [a1 setHasEmittedFinalizedSignpost:];
}

id objc_msgSend_setHasEmittedInstantOnSignpost_(void *a1, const char *a2, ...)
{
  return [a1 setHasEmittedInstantOnSignpost:];
}

id objc_msgSend_setHasEmittedRenderedSignpost_(void *a1, const char *a2, ...)
{
  return [a1 setHasEmittedRenderedSignpost:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return [a1 setHighlighted:];
}

id objc_msgSend_setHighlighted_animated_(void *a1, const char *a2, ...)
{
  return [a1 setHighlighted:animated:];
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return [a1 setIcon:];
}

id objc_msgSend_setIconColumns_(void *a1, const char *a2, ...)
{
  return [a1 setIconColumns:];
}

id objc_msgSend_setIconLayoutController_(void *a1, const char *a2, ...)
{
  return [a1 setIconLayoutController:];
}

id objc_msgSend_setIconRows_(void *a1, const char *a2, ...)
{
  return [a1 setIconRows:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setInternalSettingsState_(void *a1, const char *a2, ...)
{
  return [a1 setInternalSettingsState:];
}

id objc_msgSend_setIsSpinnerVisible_(void *a1, const char *a2, ...)
{
  return [a1 setIsSpinnerVisible:];
}

id objc_msgSend_setItemSize_(void *a1, const char *a2, ...)
{
  return [a1 setItemSize:];
}

id objc_msgSend_setLargeButton_(void *a1, const char *a2, ...)
{
  return [a1 setLargeButton:];
}

id objc_msgSend_setLastContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setLastContentSize:];
}

id objc_msgSend_setLaunchOnCarPlayButton_(void *a1, const char *a2, ...)
{
  return [a1 setLaunchOnCarPlayButton:];
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return [a1 setLineBreakMode:];
}

id objc_msgSend_setMapsAppearancePreference_(void *a1, const char *a2, ...)
{
  return [a1 setMapsAppearancePreference:];
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setMasksToBounds:];
}

id objc_msgSend_setMediumButton_(void *a1, const char *a2, ...)
{
  return [a1 setMediumButton:];
}

id objc_msgSend_setMessageWithoutConfirmationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setMessageWithoutConfirmationEnabled:];
}

id objc_msgSend_setMessageWithoutConfirmationHeadphonesEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setMessageWithoutConfirmationHeadphonesEnabled:];
}

id objc_msgSend_setMessageWithoutConfirmationInCarPlayEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setMessageWithoutConfirmationInCarPlayEnabled:];
}

id objc_msgSend_setMinimumFontSize_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumFontSize:];
}

id objc_msgSend_setMinimumInteritemSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumInteritemSpacing:];
}

id objc_msgSend_setMinimumLineSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumLineSpacing:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsScrollBar_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsScrollBar:];
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationCategories:];
}

id objc_msgSend_setNotificationSystemSettings_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationSystemSettings:];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOn_animated_(void *a1, const char *a2, ...)
{
  return [a1 setOn:animated:];
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideUserInterfaceStyle:];
}

id objc_msgSend_setPairedDevices_(void *a1, const char *a2, ...)
{
  return [a1 setPairedDevices:];
}

id objc_msgSend_setPendingAnnounceEnablementChangeFromSiri_(void *a1, const char *a2, ...)
{
  return [a1 setPendingAnnounceEnablementChangeFromSiri:];
}

id objc_msgSend_setPendingAnnounceEnablementChangeFromUserNotifications_(void *a1, const char *a2, ...)
{
  return [a1 setPendingAnnounceEnablementChangeFromUserNotifications:];
}

id objc_msgSend_setPreference_(void *a1, const char *a2, ...)
{
  return [a1 setPreference:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setSampleTextCollectionView_(void *a1, const char *a2, ...)
{
  return [a1 setSampleTextCollectionView:];
}

id objc_msgSend_setSampleTextDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setSampleTextDataSource:];
}

id objc_msgSend_setSavedFocusedIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 setSavedFocusedIndexPath:];
}

id objc_msgSend_setSecondaryText_(void *a1, const char *a2, ...)
{
  return [a1 setSecondaryText:];
}

id objc_msgSend_setSectionInset_(void *a1, const char *a2, ...)
{
  return [a1 setSectionInset:];
}

id objc_msgSend_setSectionInsets_(void *a1, const char *a2, ...)
{
  return [a1 setSectionInsets:];
}

id objc_msgSend_setSections_(void *a1, const char *a2, ...)
{
  return [a1 setSections:];
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return [a1 setSelected:];
}

id objc_msgSend_setSelected_animated_(void *a1, const char *a2, ...)
{
  return [a1 setSelected:animated:];
}

id objc_msgSend_setSelectedFilterForType_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedFilterForType:];
}

id objc_msgSend_setSelectedIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedIndex:];
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSelectionStyle:];
}

id objc_msgSend_setSelectorViewController_(void *a1, const char *a2, ...)
{
  return [a1 setSelectorViewController:];
}

id objc_msgSend_setSessionStatus_(void *a1, const char *a2, ...)
{
  return [a1 setSessionStatus:];
}

id objc_msgSend_setSettingsWindow_(void *a1, const char *a2, ...)
{
  return [a1 setSettingsWindow:];
}

id objc_msgSend_setShowAppsBehindSiriInCarPlayEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setShowAppsBehindSiriInCarPlayEnabled:];
}

id objc_msgSend_setShowCellImages_(void *a1, const char *a2, ...)
{
  return [a1 setShowCellImages:];
}

id objc_msgSend_setShowImageView_(void *a1, const char *a2, ...)
{
  return [a1 setShowImageView:];
}

id objc_msgSend_setShowThreeWaySwitch_(void *a1, const char *a2, ...)
{
  return [a1 setShowThreeWaySwitch:];
}

id objc_msgSend_setSirenPreference_(void *a1, const char *a2, ...)
{
  return [a1 setSirenPreference:];
}

id objc_msgSend_setSmartWidgetHidden_(void *a1, const char *a2, ...)
{
  return [a1 setSmartWidgetHidden:];
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return [a1 setSound:];
}

id objc_msgSend_setSoundDetectionState_(void *a1, const char *a2, ...)
{
  return [a1 setSoundDetectionState:];
}

id objc_msgSend_setSoundRecognitionPreference_(void *a1, const char *a2, ...)
{
  return [a1 setSoundRecognitionPreference:];
}

id objc_msgSend_setSpecifier_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifier:];
}

id objc_msgSend_setSpecifierSections_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifierSections:];
}

id objc_msgSend_setSpecifiers_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifiers:];
}

id objc_msgSend_setStackView_(void *a1, const char *a2, ...)
{
  return [a1 setStackView:];
}

id objc_msgSend_setStackViewEdgeConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setStackViewEdgeConstraints:];
}

id objc_msgSend_setStackViewLayoutGuide_(void *a1, const char *a2, ...)
{
  return [a1 setStackViewLayoutGuide:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStatusBarStyleAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setStatusBarStyleAssertion:];
}

id objc_msgSend_setStopTrackingInRangeNotification_(void *a1, const char *a2, ...)
{
  return [a1 setStopTrackingInRangeNotification];
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return [a1 setString:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitle:];
}

id objc_msgSend_setSystemButton_(void *a1, const char *a2, ...)
{
  return [a1 setSystemButton:];
}

id objc_msgSend_setTableSource_(void *a1, const char *a2, ...)
{
  return [a1 setTableSource:];
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return [a1 setTableView:];
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return [a1 setTag:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setTextAlignment:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setTintColor:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:forState:];
}

id objc_msgSend_setTitleColor_(void *a1, const char *a2, ...)
{
  return [a1 setTitleColor:];
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitleColor:forState:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setVehicle_(void *a1, const char *a2, ...)
{
  return [a1 setVehicle:];
}

id objc_msgSend_setVehicleDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setVehicleDelegate:];
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return [a1 setViewController:];
}

id objc_msgSend_setVoiceControlPreference_(void *a1, const char *a2, ...)
{
  return [a1 setVoiceControlPreference:];
}

id objc_msgSend_setWallpaperView_(void *a1, const char *a2, ...)
{
  return [a1 setWallpaperView:];
}

id objc_msgSend_setWrappedSpecifier_(void *a1, const char *a2, ...)
{
  return [a1 setWrappedSpecifier:];
}

id objc_msgSend_setXtraLargeButton_(void *a1, const char *a2, ...)
{
  return [a1 setXtraLargeButton:];
}

id objc_msgSend_settingWithSoundType_(void *a1, const char *a2, ...)
{
  return [a1 settingWithSoundType:];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_settingsWindow(void *a1, const char *a2, ...)
{
  return _[a1 settingsWindow];
}

id objc_msgSend_settingsWithDuration_timingFunction_(void *a1, const char *a2, ...)
{
  return [a1 settingsWithDuration:timingFunction:];
}

id objc_msgSend_setupObservers(void *a1, const char *a2, ...)
{
  return _[a1 setupObservers];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedDelegate(void *a1, const char *a2, ...)
{
  return _[a1 sharedDelegate];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_shouldActivateWithCarPlay(void *a1, const char *a2, ...)
{
  return _[a1 shouldActivateWithCarPlay];
}

id objc_msgSend_shouldSendAnalyticsEvents(void *a1, const char *a2, ...)
{
  return _[a1 shouldSendAnalyticsEvents];
}

id objc_msgSend_showAppsBehindSiriInCarPlayEnabled(void *a1, const char *a2, ...)
{
  return _[a1 showAppsBehindSiriInCarPlayEnabled];
}

id objc_msgSend_showAppsBehindSiriSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 showAppsBehindSiriSpecifier];
}

id objc_msgSend_showCellImages(void *a1, const char *a2, ...)
{
  return _[a1 showCellImages];
}

id objc_msgSend_showDisclaimerLabel(void *a1, const char *a2, ...)
{
  return _[a1 showDisclaimerLabel];
}

id objc_msgSend_showImageView(void *a1, const char *a2, ...)
{
  return _[a1 showImageView];
}

id objc_msgSend_showInternalApps(void *a1, const char *a2, ...)
{
  return _[a1 showInternalApps];
}

id objc_msgSend_showInternalSettings(void *a1, const char *a2, ...)
{
  return _[a1 showInternalSettings];
}

id objc_msgSend_showSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 showSerialNumber];
}

id objc_msgSend_showThreeWaySwitch(void *a1, const char *a2, ...)
{
  return _[a1 showThreeWaySwitch];
}

id objc_msgSend_signpostManager(void *a1, const char *a2, ...)
{
  return _[a1 signpostManager];
}

id objc_msgSend_silentModeIcon(void *a1, const char *a2, ...)
{
  return _[a1 silentModeIcon];
}

id objc_msgSend_silentModeOptions(void *a1, const char *a2, ...)
{
  return _[a1 silentModeOptions];
}

id objc_msgSend_silentModeStatus(void *a1, const char *a2, ...)
{
  return _[a1 silentModeStatus];
}

id objc_msgSend_silentModeType(void *a1, const char *a2, ...)
{
  return _[a1 silentModeType];
}

id objc_msgSend_sirenSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 sirenSpecifier];
}

id objc_msgSend_siriImage(void *a1, const char *a2, ...)
{
  return _[a1 siriImage];
}

id objc_msgSend_siriPreferences(void *a1, const char *a2, ...)
{
  return _[a1 siriPreferences];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_smartWidgetDebugGestures(void *a1, const char *a2, ...)
{
  return _[a1 smartWidgetDebugGestures];
}

id objc_msgSend_smartWidgetDebugShowScore(void *a1, const char *a2, ...)
{
  return _[a1 smartWidgetDebugShowScore];
}

id objc_msgSend_smartWidgetHidden(void *a1, const char *a2, ...)
{
  return _[a1 smartWidgetHidden];
}

id objc_msgSend_sound(void *a1, const char *a2, ...)
{
  return _[a1 sound];
}

id objc_msgSend_soundDetectionState(void *a1, const char *a2, ...)
{
  return _[a1 soundDetectionState];
}

id objc_msgSend_soundRecognitionPreference(void *a1, const char *a2, ...)
{
  return _[a1 soundRecognitionPreference];
}

id objc_msgSend_soundRecognitionSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 soundRecognitionSpecifier];
}

id objc_msgSend_soundRecognitionSwitchIsOn(void *a1, const char *a2, ...)
{
  return _[a1 soundRecognitionSwitchIsOn];
}

id objc_msgSend_soundRecognitionSwitchSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 soundRecognitionSwitchSpecifier];
}

id objc_msgSend_sourceVersion(void *a1, const char *a2, ...)
{
  return _[a1 sourceVersion];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifier_didUpdateAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifier:didUpdateAccessoryType:");
}

id objc_msgSend_specifier_didUpdateAttributedTitle_(void *a1, const char *a2, ...)
{
  return [a1 specifier:didUpdateAttributedTitle:];
}

id objc_msgSend_specifier_didUpdateDetail_(void *a1, const char *a2, ...)
{
  return [a1 specifier:didUpdateDetail:];
}

id objc_msgSend_specifier_didUpdateEnabled_(void *a1, const char *a2, ...)
{
  return [a1 specifier:didUpdateEnabled:];
}

id objc_msgSend_specifier_didUpdateImage_(void *a1, const char *a2, ...)
{
  return [a1 specifier:didUpdateImage:];
}

id objc_msgSend_specifier_didUpdateSelectionStyle_(void *a1, const char *a2, ...)
{
  return [a1 specifier:didUpdateSelectionStyle:];
}

id objc_msgSend_specifier_didUpdateSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifier:didUpdateSubtitle:");
}

id objc_msgSend_specifier_didUpdateTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifier:didUpdateTitle:");
}

id objc_msgSend_specifier_didUpdateTitleColor_(void *a1, const char *a2, ...)
{
  return [a1 specifier:didUpdateTitleColor:];
}

id objc_msgSend_specifier_didUpdateValue_(void *a1, const char *a2, ...)
{
  return [a1 specifier:didUpdateValue:];
}

id objc_msgSend_specifierSections(void *a1, const char *a2, ...)
{
  return _[a1 specifierSections];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_stackView(void *a1, const char *a2, ...)
{
  return _[a1 stackView];
}

id objc_msgSend_stackViewEdgeConstraints(void *a1, const char *a2, ...)
{
  return _[a1 stackViewEdgeConstraints];
}

id objc_msgSend_stackViewLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 stackViewLayoutGuide];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startSoundDetectionEngineIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 startSoundDetectionEngineIfNeeded];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_statusBarStyleAssertion(void *a1, const char *a2, ...)
{
  return _[a1 statusBarStyleAssertion];
}

id objc_msgSend_stopSoundDetectionEngineIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 stopSoundDetectionEngineIfNeeded];
}

id objc_msgSend_stopTrackingInRangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 stopTrackingInRangeNotification];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNumber:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_styles(void *a1, const char *a2, ...)
{
  return _[a1 styles];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_subtitleCellConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 subtitleCellConfiguration];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_supportsDynamicAppearance(void *a1, const char *a2, ...)
{
  return _[a1 supportsDynamicAppearance];
}

id objc_msgSend_supportsFocus(void *a1, const char *a2, ...)
{
  return _[a1 supportsFocus];
}

id objc_msgSend_supportsHighFidelityTouch(void *a1, const char *a2, ...)
{
  return _[a1 supportsHighFidelityTouch];
}

id objc_msgSend_supportsSiriZLL(void *a1, const char *a2, ...)
{
  return _[a1 supportsSiriZLL];
}

id objc_msgSend_supportsVehicleData(void *a1, const char *a2, ...)
{
  return _[a1 supportsVehicleData];
}

id objc_msgSend_switchBackButtonSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 switchBackButtonSpecifier];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlackColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemButton(void *a1, const char *a2, ...)
{
  return _[a1 systemButton];
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:weight:];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGreenColor];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:];
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:withConfiguration:];
}

id objc_msgSend_systemIndigoColor(void *a1, const char *a2, ...)
{
  return _[a1 systemIndigoColor];
}

id objc_msgSend_systemLayoutSize(void *a1, const char *a2, ...)
{
  return _[a1 systemLayoutSize];
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return [a1 systemLayoutSizeFittingSize:];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _[a1 systemOrangeColor];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return _[a1 systemPinkColor];
}

id objc_msgSend_systemPurpleColor(void *a1, const char *a2, ...)
{
  return _[a1 systemPurpleColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_systemTealColor(void *a1, const char *a2, ...)
{
  return _[a1 systemTealColor];
}

id objc_msgSend_systemVoiceControlEnabled(void *a1, const char *a2, ...)
{
  return _[a1 systemVoiceControlEnabled];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return _[a1 systemYellowColor];
}

id objc_msgSend_tableBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 tableBackgroundColor];
}

id objc_msgSend_tableSource(void *a1, const char *a2, ...)
{
  return _[a1 tableSource];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textAlignment(void *a1, const char *a2, ...)
{
  return _[a1 textAlignment];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return _[a1 textProperties];
}

id objc_msgSend_thumbnailWithCompatibleTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 thumbnailWithCompatibleTraitCollection:];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleColor(void *a1, const char *a2, ...)
{
  return _[a1 titleColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_titleView(void *a1, const char *a2, ...)
{
  return _[a1 titleView];
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

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithUserInterfaceIdiom_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithUserInterfaceIdiom:];
}

id objc_msgSend_traitStyleLabel(void *a1, const char *a2, ...)
{
  return _[a1 traitStyleLabel];
}

id objc_msgSend_traits(void *a1, const char *a2, ...)
{
  return _[a1 traits];
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return [a1 unregisterObserver:];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateWallpaperToSupportDynamicAppearance(void *a1, const char *a2, ...)
{
  return _[a1 updateWallpaperToSupportDynamicAppearance];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_userSettingControlAvailable(void *a1, const char *a2, ...)
{
  return _[a1 userSettingControlAvailable];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_vehicle(void *a1, const char *a2, ...)
{
  return _[a1 vehicle];
}

id objc_msgSend_vehicleDelegate(void *a1, const char *a2, ...)
{
  return _[a1 vehicleDelegate];
}

id objc_msgSend_vehicleFirmwareVersion(void *a1, const char *a2, ...)
{
  return _[a1 vehicleFirmwareVersion];
}

id objc_msgSend_vehicleForCertificateSerial_(void *a1, const char *a2, ...)
{
  return [a1 vehicleForCertificateSerial:];
}

id objc_msgSend_vehicleHardwareVersion(void *a1, const char *a2, ...)
{
  return _[a1 vehicleHardwareVersion];
}

id objc_msgSend_vehicleManufacturer(void *a1, const char *a2, ...)
{
  return _[a1 vehicleManufacturer];
}

id objc_msgSend_vehicleModelName(void *a1, const char *a2, ...)
{
  return _[a1 vehicleModelName];
}

id objc_msgSend_vehicleName(void *a1, const char *a2, ...)
{
  return _[a1 vehicleName];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _[a1 viewController];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_voiceControlSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 voiceControlSpecifier];
}

id objc_msgSend_voiceControlToggleChanged_(void *a1, const char *a2, ...)
{
  return [a1 voiceControlToggleChanged:];
}

id objc_msgSend_voiceTriggerMode(void *a1, const char *a2, ...)
{
  return _[a1 voiceTriggerMode];
}

id objc_msgSend_wallpaper(void *a1, const char *a2, ...)
{
  return _[a1 wallpaper];
}

id objc_msgSend_wallpaperImage(void *a1, const char *a2, ...)
{
  return _[a1 wallpaperImage];
}

id objc_msgSend_wallpaperPreferences(void *a1, const char *a2, ...)
{
  return _[a1 wallpaperPreferences];
}

id objc_msgSend_wallpaperView(void *a1, const char *a2, ...)
{
  return _[a1 wallpaperView];
}

id objc_msgSend_wallpapers(void *a1, const char *a2, ...)
{
  return _[a1 wallpapers];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 willMoveToParentViewController:];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_xtraLargeButton(void *a1, const char *a2, ...)
{
  return _[a1 xtraLargeButton];
}