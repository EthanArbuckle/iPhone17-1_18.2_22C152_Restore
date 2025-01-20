void sub_6D98(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char *v4;
  char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_6F44;
  v14 = sub_6F54;
  v15 = objc_alloc_init((Class)NSMutableArray);
  v3 = [WeakRetained orderedScheduledDeliveryTimes];
  v4 = (char *)[v3 count];
  if (v4)
  {
    v5 = 0;
    do
    {
      v6 = [v3 objectAtIndex:v5];
      v7 = [*(id *)(a1 + 32) _digestTimeSpecifierAtIndex:v5 forScheduleTime:v6];
      [(id)v11[5] addObject:v7];

      ++v5;
    }
    while (v4 != v5);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6F5C;
  block[3] = &unk_40CB8;
  block[6] = &v10;
  v8 = *(void *)(a1 + 32);
  block[4] = WeakRetained;
  block[5] = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v10, 8);
}

void sub_6F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_6F44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_6F54(uint64_t a1)
{
}

id sub_6F5C(uint64_t a1)
{
  [*(id *)(a1 + 32) setOrderedDigestTimeSpecifiers:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [*(id *)(a1 + 32) removeSpecifierID:@"SCHEDULE_DELIVERY_TIMES_LOAD_SPINNER_ID" animated:1];
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] <= 0xB)
  {
    uint64_t v2 = +[NSMutableArray arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    v5 = [*(id *)(a1 + 40) _specifierForAddNewScheduledTime];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v5];
  }
  [*(id *)(a1 + 32) insertContiguousSpecifiers:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) afterSpecifierID:@"SCHEDULE_DELIVERY_TIMES_GROUP_ID" animated:1];
  v6 = *(void **)(a1 + 32);

  return [v6 setPopulatingDigestTimeSpecifiers:0];
}

id sub_7820(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

void sub_83A4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)ATXDigestSetupFlowClient);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8474;
  v3[3] = &unk_40D58;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(void *)(a1 + 32);
  [v2 appsSortedByNotificationsReceivedInPreviousNumDaysRaw:&off_445B0 completionHandler:v3];
  objc_destroyWeak(&v4);
}

void sub_8460(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_8474(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_853C;
  v9[3] = &unk_40D30;
  objc_copyWeak(v12, (id *)(a1 + 40));
  v12[1] = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(v12);
}

void sub_853C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setLoadedSortOrderByNumberOfNotifications:1];
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "setRankedDigestSetupResponses:");
    [WeakRetained setNumberOfDaysForNotificationCount:*(void *)(a1 + 56)];
    id v2 = [*(id *)(a1 + 32) firstObject];
    objc_msgSend(WeakRetained, "setMaximumAverageNumberOfNotifications:", 7* (uint64_t)objc_msgSend(v2, "numBasicNotifications")/ (unint64_t)objc_msgSend(*(id *)(a1 + 40), "numberOfDaysForNotificationCount"));

    [WeakRetained reloadSpecifiers];
  }
}

BOOL sub_865C(id a1, BBSectionInfo *a2)
{
  id v2 = a2;
  if ([(BBSectionInfo *)v2 authorizationStatus] == (char *)&dword_0 + 1
    || ![(BBSectionInfo *)v2 scheduledDeliverySetting]
    || ([(BBSectionInfo *)v2 suppressFromSettings] & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    unsigned int v3 = [(BBSectionInfo *)v2 isRestricted] ^ 1;
  }

  return v3;
}

int64_t sub_86D0(id a1, BBSectionInfo *a2, BBSectionInfo *a3)
{
  id v4 = a3;
  v5 = BBSettingsDisplayNameForBBSection(a2);
  id v6 = BBSettingsDisplayNameForBBSection(v4);

  id v7 = [v5 localizedStandardCompare:v6];
  return (int64_t)v7;
}

void sub_8824(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_88F4;
  v9[3] = &unk_40E00;
  id v5 = v3;
  id v10 = v5;
  id v6 = [v4 indexOfObjectPassingTest:v9];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) objectAtIndex:v6];
    [v7 addObject:v8];
  }
}

id sub_88F4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 bundleId];
  id v5 = [v3 sectionID];

  id v6 = [v4 isEqualToString:v5];
  return v6;
}

id sub_8A78(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleId];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id sub_8C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) _compareScheduleTime:a2 withScheduleTime:a3];
}

id sub_9F90(uint64_t a1, void *a2)
{
  id v3 = [a2 sectionID];
  id v4 = [*(id *)(a1 + 32) sectionID];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_A39C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) specifiers];
  id v3 = [*(id *)(a1 + 40) sectionID];
  id v5 = [v2 specifierForID:v3];

  if (v5)
  {
    id v4 = [v5 propertyForKey:@"BBSECTION_INFO_KEY"];
    if (([v4 isEqual:*(void *)(a1 + 40)] & 1) == 0)
    {
      [*(id *)(a1 + 32) _updateStoredSectionsWithSectionInfo:*(void *)(a1 + 40)];
      [v5 setProperty:*(void *)(a1 + 40) forKey:@"BBSECTION_INFO_KEY"];
      [*(id *)(a1 + 32) reloadSpecifier:v5];
    }
  }
  else if ([*(id *)(a1 + 40) isAppClip])
  {
    [*(id *)(a1 + 32) reloadSpecifiers];
  }
}

void sub_A4DC(id a1)
{
  qword_50128 = objc_alloc_init(NCAssistantPreferencesController);

  _objc_release_x1();
}

void sub_A6FC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_A804(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void sub_A91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_A934(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) cachedCarPlayAnnounceEnablementType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_AA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_AA98(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) cachedAnnounceNotificationsInCarPlayTemporarilyDisabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_ABF4(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v1 = +[AFPreferences sharedPreferences];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_AD68;
  v5[3] = &unk_40F08;
  objc_copyWeak(&v6, &location);
  [v1 getAnnounceNotificationsInCarPlayTypeWithCompletion:v5];

  id v2 = +[AFPreferences sharedPreferences];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_ADBC;
  v3[3] = &unk_40F30;
  objc_copyWeak(&v4, &location);
  [v2 getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void sub_AD30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_AD68(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _updateCarPlayAnnounceEnablementType:a2];
    id WeakRetained = v4;
  }
}

void sub_ADBC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _updateAnnounceNotificationsInCarPlayTemporarilyDisabled:a2];
    id WeakRetained = v4;
  }
}

id sub_AEA8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) cachedAnnounceNotificationsInCarPlayTemporarilyDisabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != result)
  {
    [*(id *)(a1 + 32) setCachedAnnounceNotificationsInCarPlayTemporarilyDisabled:v3 != 0];
    id v4 = *(void **)(a1 + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_AF50;
    v5[3] = &unk_40F80;
    void v5[4] = v4;
    char v6 = *(unsigned char *)(a1 + 40);
    return [v4 _notifyObserversOfSettingsChangeWithBlock:v5];
  }
  return result;
}

id sub_AF50(uint64_t a1, void *a2)
{
  return _[a2 controller:*(void *)(a1 + 32) announceNotificationsInCarPlayTemporarilyDisabledChanged:*(unsigned __int8 *)(a1 + 40)];
}

id sub_AFF4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) cachedCarPlayAnnounceEnablementType];
  if (result != *(id *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedCarPlayAnnounceEnablementType:");
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_B08C;
    v4[3] = &unk_40FD0;
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = v3;
    return [v5 _notifyObserversOfSettingsChangeWithBlock:v4];
  }
  return result;
}

id sub_B08C(uint64_t a1, void *a2)
{
  return _[a2 controller:*(void *)(a1 + 32) carPlayAnnounceEnablementTypeChanged:*(void *)(a1 + 40)];
}

id sub_C3FC(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

id sub_C440(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

id sub_C4DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

unint64_t sub_CDD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  unint64_t v5 = (unint64_t)[v4 summarizePreviewsDetailController:*(void *)(a1 + 32) shouldShowSection:v3];

  if (v5) {
    unint64_t v5 = [v3 summarizationSetting] != 0;
  }

  return v5;
}

int64_t sub_CE48(id a1, BBSectionInfo *a2, BBSectionInfo *a3)
{
  id v4 = a3;
  unint64_t v5 = BBSettingsDisplayNameForBBSection(a2);
  uint64_t v6 = BBSettingsDisplayNameForBBSection(v4);

  id v7 = [v5 localizedStandardCompare:v6];
  return (int64_t)v7;
}

void sub_D090(id a1)
{
  qword_50130 = objc_alloc_init(NCSettingsGatewayController);

  _objc_release_x1();
}

id sub_D400(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:", *(void *)(a1 + 40));
}

id sub_D4A4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:", *(void *)(a1 + 40));
}

id sub_D548(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_applicationWillEnterForegroundNotification:", *(void *)(a1 + 40));
}

id sub_D5EC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_applicationDidEnterBackgroundNotification:", *(void *)(a1 + 40));
}

void sub_D6A8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = [*(id *)(a1 + 40) sectionID];
  id v4 = [v2 sectionInfoForSectionID:v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 32);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "settingsGateway:didUpdateSectionInfo:", *(void *)(a1 + 32), v4, (void)v11);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

void sub_D874(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "settingsGatewayDidUpdateGlobalSettings:", *(void *)(a1 + 32), (void)v8);
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

uint64_t NCIsSystemApertureAvailable()
{
  if (qword_50148 != -1) {
    dispatch_once(&qword_50148, &stru_410C0);
  }
  return byte_50140;
}

void sub_DA38(id a1)
{
  byte_50140 = MGGetBoolAnswer();
}

BOOL sub_10938(uint64_t a1, void *a2)
{
  return (*(void *)(a1 + 32) & (unint64_t)[a2 suppressedSettings]) == 0;
}

BOOL sub_109EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = (unint64_t)[v3 suppressedSettings];
  unint64_t v5 = (unint64_t)[v3 pushSettings];

  return (*(void *)(a1 + 32) & v4) == 0 && (*(void *)(a1 + 40) & v5) != 0;
}

BOOL sub_110A0(id a1, BBSectionInfo *a2)
{
  id v2 = a2;
  unsigned __int8 v3 = [(BBSectionInfo *)v2 suppressedSettings];
  unsigned __int8 v4 = [(BBSectionInfo *)v2 suppressedSettings];
  BOOL v5 = ([(BBSectionInfo *)v2 suppressedSettings] & 0x20) != 0
    || ((unint64_t)[(BBSectionInfo *)v2 pushSettings] & 4) == 0;
  char v6 = !v5;
  if ((v4 & 1) == 0) {
    char v6 = 1;
  }
  if ((v3 & 2) != 0) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

BOOL sub_11238(id a1, BBSectionInfo *a2)
{
  return ((unint64_t)[(BBSectionInfo *)a2 suppressedSettings] & 1) == 0;
}

BOOL sub_11374(id a1, BBSectionInfo *a2)
{
  id v2 = a2;
  if (([(BBSectionInfo *)v2 suppressedSettings] & 0x20) != 0) {
    LOBYTE(v3) = 0;
  }
  else {
    unint64_t v3 = ((unint64_t)[(BBSectionInfo *)v2 pushSettings] >> 2) & 1;
  }

  return v3;
}

BOOL sub_115FC(id a1, BBSectionInfo *a2)
{
  id v2 = a2;
  unsigned __int8 v3 = [(BBSectionInfo *)v2 suppressedSettings];
  unsigned __int8 v4 = [(BBSectionInfo *)v2 pushSettings];

  return (v3 & 0x20) == 0 && (v4 & 4) != 0;
}

void sub_11858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_11878(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_11888(uint64_t a1)
{
}

void sub_11890(uint64_t a1, void *a2)
{
}

void sub_13BF0(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 224);
  id v3 = *(id *)(a1 + 40);
  unsigned __int8 v4 = [v2 sectionID];
  BOOL v5 = [v3 sectionID];
  int v6 = BSEqualStrings();

  if (v6)
  {
    BOOL v7 = [v2 parentSection];

    if (v7)
    {
      long long v8 = [v3 subsections];
      long long v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      long long v11 = sub_13D48;
      long long v12 = &unk_411D0;
      id v13 = v2;
      id v14 = v3;
      objc_msgSend(v8, "bs_firstObjectPassingTest:", &v9);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v2, "isEqual:", v3, v9, v10, v11, v12) & 1) == 0) {
      [*(id *)(a1 + 32) _updateSpecifiersWithSectionInfo:v3];
    }
  }
}

uint64_t sub_13D48(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) subsectionID];
  id v3 = [*(id *)(a1 + 40) subsectionID];
  uint64_t v4 = BSEqualStrings();

  return v4;
}

void sub_1452C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_14548(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id result = objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 40), *(double *)(a1 + 56));
  if (v3 >= v5) {
    double v6 = v3;
  }
  else {
    double v6 = v5;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  return result;
}

void **sub_146A8(void **result, void *a2)
{
  if (result[4] != a2) {
    return (void **)[a2 setSelected:0];
  }
  return result;
}

void sub_147D0(uint64_t a1, void *a2)
{
  id v3 = [a2 unsignedIntegerValue];
  id v7 = +[NCNotificationListDisplayStyleSelectionView notificationListDisplayStyleSelectionViewOfType:v3];
  [v7 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) addSubview:v7];
  [*(id *)(a1 + 40) addObject:v7];
  uint64_t v4 = [*(id *)(a1 + 32) specifier];
  double v5 = [v4 performGetter];

  id v6 = [v5 unsignedIntegerValue];
  if (v6 == [*(id *)(a1 + 32) _notificationListDisplayStyleSettingForSelectionType:v3]) {
    [v7 setSelected:1];
  }
}

void sub_149F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_14A0C(uint64_t a1, void *a2, unint64_t a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = *(double *)(a1 + 40) * (double)a3;
  return objc_msgSend(a2, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
}

id sub_15F08(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAnnounceOptionsGroupSpecifiersAnimated:1];
}

id sub_15F88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAnnounceSwitchGroupSpecifierAnimated:0];
}

id sub_16008(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAnnounceSwitchGroupSpecifierAnimated:1];
}

uint64_t BBSectionShouldShowInNotificationCenter(void *a1)
{
  id v1 = a1;
  if ([v1 allowsNotifications])
  {
    if ([v1 suppressedSettings]
      && (([v1 suppressedSettings] & 1) == 0
       || ([v1 subsections],
           id v2 = objc_claimAutoreleasedReturnValue(),
           id v3 = [v2 count],
           v2,
           v3)))
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      uint64_t v4 = objc_msgSend(v1, "subsections", 0);
      uint64_t v5 = (uint64_t)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v10;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v10 != v6) {
              objc_enumerationMutation(v4);
            }
            if ([*(id *)(*((void *)&v9 + 1) + 8 * i) notificationCenterSetting] == (char *)&dword_0 + 2)
            {
              uint64_t v5 = 1;
              goto LABEL_17;
            }
          }
          uint64_t v5 = (uint64_t)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
    else
    {
      uint64_t v5 = [v1 notificationCenterSetting] == (char *)&dword_0 + 2;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_17698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t sub_176B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_176C8(uint64_t a1)
{
}

void sub_176D0(uint64_t a1, void *a2)
{
}

id sub_17C18(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

int64_t sub_1A380(id a1, id a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = BBSettingsDisplayNameForBBSection(a2);
  uint64_t v6 = BBSettingsDisplayNameForBBSection(v4);

  id v7 = [v5 localizedStandardCompare:v6];
  return (int64_t)v7;
}

id sub_1B580(uint64_t a1, void *a2)
{
  id v3 = [a2 sectionID];
  id v4 = [*(id *)(a1 + 32) sectionID];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_1B888(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) specifiers];
  id v3 = [*(id *)(a1 + 40) sectionID];
  id v5 = [v2 specifierForID:v3];

  if (v5)
  {
    id v4 = [v5 propertyForKey:@"BBSECTION_INFO_KEY"];
    if (([v4 isEqual:*(void *)(a1 + 40)] & 1) == 0)
    {
      [*(id *)(a1 + 32) _updateStoredSectionsWithSectionInfo:*(void *)(a1 + 40)];
      [v5 setProperty:*(void *)(a1 + 40) forKey:@"BBSECTION_INFO_KEY"];
      [*(id *)(a1 + 32) reloadSpecifier:v5];
    }
  }
  else if ([*(id *)(a1 + 32) _shouldShowSection:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) _reloadSections];
  }
}

id sub_1B9E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_1BA64(uint64_t a1)
{
  NSLog(@"AppProtectionSubjectsChanged, reloading list");
  id v2 = *(void **)(a1 + 32);

  return [v2 _reloadSections];
}

void NCRegisterNCNotificationsSettingsLogging()
{
  if (qword_50158 != -1) {
    dispatch_once(&qword_50158, &stru_41300);
  }
}

void sub_1C10C(id a1)
{
  os_log_t v1 = os_log_create(NCLogSubsystem, "EmergencyAlerts");
  uint64_t v2 = NCLogEmergencyAlerts;
  NCLogEmergencyAlerts = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id BBSettingsDisplayNameForBBSection(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 displayName];
  if ([v2 length]) {
    [v1 displayName];
  }
  else {
  id v3 = [v1 appName];
  }

  return v3;
}

id NCDetailStringForCustomToneSpecifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 propertyForKey:@"alertType"];
  if (v2)
  {
    uint64_t v3 = TLAlertTypeFromString();
    id v4 = [v1 propertyForKey:@"accountIdentifier"];
    id v5 = +[TLToneManager sharedToneManager];
    uint64_t v6 = [v5 currentToneIdentifierForAlertType:v3 topic:v4];
    id v7 = [v5 nameForToneIdentifier:v6];
    if ([v6 isEqualToString:TLToneIdentifierNone] && MGGetBoolAnswer())
    {
      long long v8 = +[TLVibrationManager sharedVibrationManager];
      long long v9 = [v8 currentVibrationIdentifierForAlertType:v3 topic:v4];
      if (([v9 isEqualToString:TLVibrationIdentifierNone] & 1) == 0)
      {
        long long v10 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
        uint64_t v11 = [v10 localizedStringForKey:@"VIBRATE_ONLY" value:&stru_419A0 table:@"NotificationsSettings"];

        id v7 = (void *)v11;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id NCStringForScheduledDeliveryTime(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSCalendar currentCalendar];
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  id v4 = +[NSLocale currentLocale];
  id v5 = +[NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:v4];

  CFStringRef v6 = @"jmm";
  if ([v5 rangeOfString:@"a"] != (id)0x7FFFFFFFFFFFFFFFLL && !objc_msgSend(v1, "minute")) {
    CFStringRef v6 = @"j";
  }
  [v3 setLocalizedDateFormatFromTemplate:v6];
  id v7 = [v2 dateFromComponents:v1];

  long long v8 = [v3 stringFromDate:v7];

  return v8;
}

id NCStringForScheduledDeliverySummary(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1C980;
  v24 = sub_1C990;
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  id v25 = [v4 localizedStringForKey:@"OFF" value:&stru_419A0 table:@"NotificationsSettings"];

  if (a1 != 2)
  {
    CFStringRef v6 = v3;
    goto LABEL_9;
  }
  id v5 = (void *)v21[5];
  v21[5] = (uint64_t)&stru_419A0;

  CFStringRef v6 = [v3 sortedArrayUsingComparator:&stru_41340];

  id v7 = (char *)[v6 count];
  if (v7 == (unsigned char *)&dword_0 + 2)
  {
    uint64_t v11 = [v6 objectAtIndex:0];
    long long v8 = NCStringForScheduledDeliveryTime(v11);

    long long v12 = [v6 objectAtIndex:1];
    long long v10 = NCStringForScheduledDeliveryTime(v12);

    id v13 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    id v14 = [v13 localizedStringForKey:@"SCHEDULED_DELIVERY_TIMES_CONJUNCTION" value:&stru_419A0 table:@"NotificationsSettings"];
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v8, v10);
    v16 = (void *)v21[5];
    v21[5] = v15;

    goto LABEL_7;
  }
  if (v7 == (unsigned char *)&dword_0 + 1)
  {
    long long v8 = [v6 objectAtIndex:0];
    uint64_t v9 = NCStringForScheduledDeliveryTime(v8);
    long long v10 = (void *)v21[5];
    v21[5] = v9;
LABEL_7:

    goto LABEL_9;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1CA44;
  v19[3] = &unk_41368;
  v19[4] = &v20;
  [v6 enumerateObjectsUsingBlock:v19];
LABEL_9:
  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

void sub_1C95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C980(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1C990(uint64_t a1)
{
}

int64_t sub_1C998(id a1, NSDateComponents *a2, NSDateComponents *a3)
{
  id v4 = a2;
  id v5 = a3;
  NSInteger v6 = [(NSDateComponents *)v4 hour];
  if (v6 >= [(NSDateComponents *)v5 hour])
  {
    id v8 = [(NSDateComponents *)v4 hour];
    if (v8 == (id)[(NSDateComponents *)v5 hour])
    {
      NSInteger v9 = [(NSDateComponents *)v4 minute];
      if (v9 < [(NSDateComponents *)v5 minute]) {
        int64_t v7 = -1;
      }
      else {
        int64_t v7 = 1;
      }
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

void sub_1CA44(uint64_t a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  if (a3)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    NSInteger v6 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    int64_t v7 = [v6 localizedStringForKey:@"SEPERATOR" value:&stru_419A0 table:@"NotificationsSettings"];
    uint64_t v8 = [v5 stringByAppendingString:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  long long v12 = NCStringForScheduledDeliveryTime(v16);
  uint64_t v13 = [v11 stringByAppendingString:v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

BOOL NCGetAllowNotificationsDuringScreenSharing()
{
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(@"SBAllowNotificationsDuringScreenSharing", @"com.apple.springboard", &keyExistsAndHasValidFormat) != 0;
}

void NCSetAllowNotificationsDuringScreenSharing(uint64_t a1)
{
  CFPreferencesSetAppValue(@"SBAllowNotificationsDuringScreenSharing", +[NSNumber numberWithBool:a1], @"com.apple.springboard");
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:kNCScreenSharingSettingChangedNotification object:0];
}

__CFString *NCDeviceTypePrefix()
{
  v0 = +[BSPlatform sharedInstance];
  unsigned int v1 = [v0 deviceClass];

  uint64_t v2 = @"iphone";
  id v3 = @"ipad";
  if (v1 == 2) {
    uint64_t v2 = @"ipad";
  }
  id v4 = v2;
  if (v1 != 2)
  {
    id v5 = +[BSPlatform sharedInstance];
    NSInteger v6 = (char *)[v5 homeButtonType];

    if (v6 == (unsigned char *)&dword_0 + 2)
    {
      if (MGIsDeviceOfType() & 1) != 0 || (MGIsDeviceOfType()) {
        int64_t v7 = @"D6x";
      }
      else {
        int64_t v7 = NCIsSystemApertureAvailable() ? @"D7x" : @"D5x";
      }
    }
    else
    {
      int64_t v7 = @"D20";
    }
    id v3 = @"iphone";
    if (([(__CFString *)v7 isEqualToString:&stru_419A0] & 1) == 0)
    {
      id v3 = +[NSString stringWithFormat:@"%@-%@", @"iphone", v7];
    }
  }

  return v3;
}

id NCLockScreenTimeAttributedStringWithFont()
{
  v0 = +[BSPlatform sharedInstance];
  if ([v0 homeButtonType] == (char *)&dword_0 + 2) {
    double v1 = 11.0;
  }
  else {
    double v1 = 10.0;
  }

  CTFontRef v2 = CTFontCreateWithNameAndOptions(@".SFSoftTime-Semibold", v1, 0, 0x20000uLL);
  id v3 = +[UIColor systemGrayColor];
  id v4 = objc_alloc_init((Class)NSDateComponents);
  [v4 setHour:9];
  [v4 setMinute:41];
  [v4 setSecond:0];
  id v5 = +[NSCalendar currentCalendar];
  NSInteger v6 = [v5 dateFromComponents:v4];
  id v7 = objc_alloc_init((Class)NSDateFormatter);
  [v7 setLocalizedDateFormatFromTemplate:@"Jmm"];
  uint64_t v8 = [v7 stringFromDate:v6];
  id v9 = objc_alloc((Class)NSAttributedString);
  v13[0] = NSFontAttributeName;
  v13[1] = NSForegroundColorAttributeName;
  v14[0] = v2;
  v14[1] = v3;
  long long v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v11 = [v9 initWithString:v8 attributes:v10];

  return v11;
}

id NCDeviceImageWithDefaultSystemClock(void *a1)
{
  id v1 = a1;
  CTFontRef v2 = NCLockScreenTimeAttributedStringWithFont();
  [v2 size];
  id v3 = +[BSPlatform sharedInstance];
  [v3 deviceClass];
  id v4 = +[BSPlatform sharedInstance];
  [v4 homeButtonType];

  [v1 size];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  UIRectCenteredXInRect();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = +[UIScreen mainScreen];
  [v17 scale];
  CGFloat v19 = v18;
  v23.width = v6;
  v23.height = v8;
  UIGraphicsBeginImageContextWithOptions(v23, 0, v19);

  if (UIGraphicsGetCurrentContext())
  {
    objc_msgSend(v1, "drawAtPoint:", CGPointZero.x, CGPointZero.y);
    objc_msgSend(v2, "drawInRect:", v10, v12, v14, v16);
    uint64_t v20 = UIGraphicsGetImageFromCurrentImageContext();

    id v1 = (id)v20;
  }

  return v1;
}

BOOL _NCAreGenerativeModelsAvailable(void *a1)
{
  CGFloat v6 = a1;
  id v1 = a1;
  CTFontRef v2 = +[NSArray arrayWithObjects:&v6 count:1];
  unint64_t v3 = (unint64_t)+[GMAvailabilityWrapper currentWithUseCaseIdentifiers:](GMAvailabilityWrapper, "currentWithUseCaseIdentifiers:", v2, v6);

  return (v3 & 7) == 0 && v3 < 3;
}

BOOL NCAreGenerativeSummarizationModelsAvailable()
{
  return _NCAreGenerativeModelsAvailable(@"summarization.summarizeUserNotification");
}

BOOL NCAreGenerativePrioritizationModelsAvailable()
{
  return _NCAreGenerativeModelsAvailable(@"classification.classifyUserNotification");
}

BOOL AlertDeliveryLocationTypeShouldBeHiddenForDescriptor(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 == 2)
  {
    id v5 = [v3 bannerSetting];
  }
  else if (a1 == 1)
  {
    id v5 = [v3 notificationCenterSetting];
  }
  else
  {
    if (a1)
    {
      BOOL v6 = 0;
      goto LABEL_9;
    }
    id v5 = [v3 lockScreenSetting];
  }
  BOOL v6 = v5 == 0;
LABEL_9:

  return v6;
}

id sub_1E0C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_1F034(uint64_t a1, int a2)
{
  CTFontRef v2 = *(void **)(a1 + 32);
  if (a2) {
    return _[v2 _setGlobalAnnounceSetting:2];
  }
  else {
    return [v2 reloadSpecifier:v2[23] animated:1];
  }
}

id sub_1F2D0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _presentPasscodeView];
}

id sub_1F2D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(*(void *)(a1 + 32) + 184) animated:1];
}

void sub_1F3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1F408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (a3) {
    [WeakRetained didCancelEnteringPIN];
  }
  else {
    [WeakRetained didAcceptEnteredPIN];
  }
}

BOOL sub_1FD30(id a1, BBSectionInfo *a2)
{
  CTFontRef v2 = a2;
  if ([(BBSectionInfo *)v2 announceSetting]
    && ([(BBSectionInfo *)v2 suppressFromSettings] & 1) == 0)
  {
    unsigned int v3 = [(BBSectionInfo *)v2 isRestricted] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

int64_t sub_1FD84(id a1, BBSectionInfo *a2, BBSectionInfo *a3)
{
  id v4 = a3;
  id v5 = BBSettingsDisplayNameForBBSection(a2);
  BOOL v6 = BBSettingsDisplayNameForBBSection(v4);

  id v7 = [v5 localizedStandardCompare:v6];
  return (int64_t)v7;
}

id sub_202C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"SPOKEN_NOTIFICATIONS_ANNOUNCE_DESTINATION_CARPLAY"];
}

id sub_221DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

BOOL sub_22B88(id a1, BBSectionInfo *a2)
{
  CTFontRef v2 = [(BBSectionInfo *)a2 subsectionID];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.VIP"];

  return v3;
}

BOOL sub_22BCC(id a1, BBSectionInfo *a2)
{
  CTFontRef v2 = [(BBSectionInfo *)a2 subsectionID];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.FavoriteMailboxes"];

  return v3;
}

BOOL sub_22C10(id a1, BBSectionInfo *a2)
{
  CTFontRef v2 = [(BBSectionInfo *)a2 subsectionID];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.ThreadNotify"];

  return v3;
}

BOOL sub_22C54(id a1, BBSectionInfo *a2)
{
  CTFontRef v2 = [(BBSectionInfo *)a2 subsectionID];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.RemindMe"];

  return v3;
}

BOOL sub_22C98(id a1, BBSectionInfo *a2)
{
  CTFontRef v2 = [(BBSectionInfo *)a2 subsectionID];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.PrimaryInbox"];

  return v3;
}

BOOL sub_22CDC(id a1, BBSectionInfo *a2)
{
  CTFontRef v2 = [(BBSectionInfo *)a2 subsectionID];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.PrimaryMessages"];

  return v3;
}

BOOL sub_22D20(id a1, BBSectionInfo *a2)
{
  CTFontRef v2 = [(BBSectionInfo *)a2 subsectionID];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.AllMessages"];

  return v3;
}

uint64_t *sub_240FC()
{
  if (qword_50160 != -1) {
    swift_once();
  }
  return &qword_50480;
}

uint64_t RemoteNotificationsManager.addObserver(_:)(uint64_t a1)
{
  unsigned __int8 v3 = *(NSObject **)&v1[OBJC_IVAR___NCRemoteNotificationsManager_queue];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_2A038;
  *(void *)(v5 + 24) = v4;
  v10[4] = sub_2A050;
  v10[5] = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_24894;
  v10[3] = &unk_41560;
  BOOL v6 = _Block_copy(v10);
  swift_unknownObjectRetain();
  id v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t RemoteNotificationsManager.removeObserver(_:)(uint64_t a1)
{
  unsigned __int8 v3 = *(NSObject **)&v1[OBJC_IVAR___NCRemoteNotificationsManager_queue];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_2A258;
  *(void *)(v5 + 24) = v4;
  v10[4] = sub_2AD74;
  v10[5] = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_24894;
  v10[3] = &unk_415D8;
  BOOL v6 = _Block_copy(v10);
  swift_unknownObjectRetain();
  id v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_2444C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  a4(a3);

  return swift_unknownObjectRelease();
}

uint64_t RemoteNotificationsManager.featureIsAvailable.getter()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR___NCRemoteNotificationsManager_protectedFeatureIsAvailable);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  sub_24C54((unsigned char *)(v2 + 16), &v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  uint64_t v3 = v5;
  swift_release();
  return v3;
}

uint64_t sub_2454C(uint64_t a1, char *a2)
{
  sub_2A368(&qword_4FF48);
  __chkstk_darwin();
  uint64_t v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2A368(&qword_50000);
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  BOOL v6 = &a2[OBJC_IVAR___NCRemoteNotificationsManager_observers];
  swift_beginAccess();
  swift_retain();
  sub_284A4(&v16, v5);
  swift_endAccess();
  swift_release();
  uint64_t v7 = *(void *)v6;
  if ((v7 & 0xC000000000000001) == 0)
  {
    if (*(uint64_t *)(v7 + 16) < 1) {
      return swift_release();
    }
    goto LABEL_3;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_2C590();
  swift_bridgeObjectRelease();
  if (v8 >= 1)
  {
LABEL_3:
    sub_2C470();
    uint64_t v9 = sub_2C490();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 0, 1, v9);
    double v10 = (void *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = a2;
    double v11 = a2;
    uint64_t v12 = sub_265C0((uint64_t)v4, (uint64_t)&unk_50078, (uint64_t)v10);
    double v13 = (uint64_t *)&v11[OBJC_IVAR___NCRemoteNotificationsManager_monitor];
    swift_beginAccess();
    *double v13 = v12;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_24760()
{
  sub_2A368(&qword_4FF48);
  __chkstk_darwin();
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2C470();
  uint64_t v3 = sub_2C490();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 0, 1, v3);
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  void v4[4] = v0;
  uint64_t v5 = v0;
  uint64_t v6 = sub_265C0((uint64_t)v2, (uint64_t)&unk_4FF58, (uint64_t)v4);
  uint64_t v7 = (uint64_t *)&v5[OBJC_IVAR___NCRemoteNotificationsManager_monitor];
  swift_beginAccess();
  *uint64_t v7 = v6;
  return swift_release();
}

uint64_t sub_24894(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_248D4(uint64_t a1, uint64_t a2)
{
  sub_2A368(&qword_50000);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  uint64_t v3 = (uint64_t *)(a2 + OBJC_IVAR___NCRemoteNotificationsManager_observers);
  swift_beginAccess();
  sub_29500();
  swift_endAccess();
  swift_release();
  uint64_t v4 = *v3;
  if ((v4 & 0xC000000000000001) == 0)
  {
    if (*(void *)(v4 + 16)) {
      return swift_release();
    }
    goto LABEL_3;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2C590();
  swift_bridgeObjectRelease();
  if (!v5) {
LABEL_3:
  }
    sub_249C8();
  return swift_release();
}

uint64_t sub_249C8()
{
  uint64_t v1 = v0;
  if (qword_50168 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2C3D0();
  sub_2A484(v2, (uint64_t)qword_50170);
  uint64_t v3 = sub_2C3B0();
  os_log_type_t v4 = sub_2C4D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "Cancelling monitor...", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = (void *)(v1 + OBJC_IVAR___NCRemoteNotificationsManager_monitor);
  swift_beginAccess();
  if (*v6)
  {
    swift_retain();
    sub_2C4A0();
    swift_release();
  }
  void *v6 = 0;
  return swift_release();
}

void sub_24B30(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  a4(a3);
  swift_unknownObjectRelease();
}

unsigned char *sub_24C54@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id static RemoteNotificationsManager.sharedInstance.getter()
{
  if (qword_50160 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_50480;

  return v0;
}

id sub_24D5C()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for RemoteNotificationsManager()) init];
  qword_50480 = (uint64_t)result;
  return result;
}

id sub_24D8C()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void sub_24DC0(uint64_t a1)
{
  if (qword_50160 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_50480;
  qword_50480 = a1;
}

uint64_t (*sub_24E40())()
{
  if (qword_50160 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of RemoteNotificationsManager.companionDeviceManager()
{
  return sub_2C390();
}

uint64_t sub_24EF4()
{
  return sub_24FAC();
}

uint64_t sub_24F00(uint64_t a1)
{
  return sub_25000(a1, &OBJC_IVAR___NCRemoteNotificationsManager_companionDeviceManager);
}

uint64_t (*sub_24F0C())()
{
  return j__swift_endAccess;
}

uint64_t variable initialization expression of RemoteNotificationsManager.protectedFeatureIsAvailable()
{
  sub_2A368(&qword_4FF70);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 20) = 0;
  *(unsigned char *)(result + 16) = 0;
  return result;
}

uint64_t sub_24FA0()
{
  return sub_24FAC();
}

uint64_t sub_24FAC()
{
  return swift_retain();
}

uint64_t sub_24FF4(uint64_t a1)
{
  return sub_25000(a1, &OBJC_IVAR___NCRemoteNotificationsManager_protectedFeatureIsAvailable);
}

uint64_t sub_25000(uint64_t a1, void *a2)
{
  os_log_type_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_release();
}

uint64_t (*sub_25050())()
{
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of RemoteNotificationsManager.monitor()
{
  return 0;
}

uint64_t sub_250B4()
{
  return swift_retain();
}

uint64_t sub_25100(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___NCRemoteNotificationsManager_monitor);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_release();
}

uint64_t (*sub_25154())()
{
  return j_j__swift_endAccess;
}

void *variable initialization expression of RemoteNotificationsManager.observers()
{
  return &_swiftEmptySetSingleton;
}

uint64_t variable initialization expression of RemoteNotificationsManager.queue()
{
  uint64_t v0 = sub_2C510();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2C500();
  __chkstk_darwin();
  sub_2C3F0();
  __chkstk_darwin();
  sub_2A4BC();
  sub_2C3E0();
  v5[1] = &_swiftEmptyArrayStorage;
  sub_2A5FC(&qword_4FF80, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_2A368(&qword_4FF88);
  sub_2A544(&qword_4FF90, &qword_4FF88);
  sub_2C550();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  return sub_2C520();
}

id sub_253F4()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = sub_2C510();
  uint64_t v1 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2C500();
  __chkstk_darwin();
  sub_2C3F0();
  __chkstk_darwin();
  uint64_t v4 = OBJC_IVAR___NCRemoteNotificationsManager_companionDeviceManager;
  sub_2C3A0();
  uint64_t v5 = v0;
  *(void *)&v0[v4] = sub_2C390();
  uint64_t v6 = OBJC_IVAR___NCRemoteNotificationsManager_protectedFeatureIsAvailable;
  sub_2A368(&qword_4FF70);
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 20) = 0;
  *(unsigned char *)(v7 + 16) = 0;
  *(void *)&v5[v6] = v7;
  *(void *)&v5[OBJC_IVAR___NCRemoteNotificationsManager_monitor] = 0;
  *(void *)&v5[OBJC_IVAR___NCRemoteNotificationsManager_observers] = &_swiftEmptySetSingleton;
  uint64_t v9 = OBJC_IVAR___NCRemoteNotificationsManager_queue;
  sub_2A4BC();
  sub_2C3E0();
  double v13 = &_swiftEmptyArrayStorage;
  sub_2A5FC(&qword_4FF80, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_2A368(&qword_4FF88);
  sub_2A544(&qword_4FF90, &qword_4FF88);
  sub_2C550();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v10);
  *(void *)&v5[v9] = sub_2C520();

  v12.receiver = v5;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, "init");
}

uint64_t sub_25704()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_25794;
  return sub_259A4();
}

uint64_t sub_25794()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_25890, 0, 0);
}

uint64_t sub_25890()
{
  if (qword_50168 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2C3D0();
  sub_2A484(v1, (uint64_t)qword_50170);
  uint64_t v2 = sub_2C3B0();
  os_log_type_t v3 = sub_2C4D0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "Monitor finished.", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_259A4()
{
  v1[13] = v0;
  uint64_t v2 = sub_2A368(&qword_4FFA8);
  v1[14] = v2;
  v1[15] = *(void *)(v2 - 8);
  v1[16] = swift_task_alloc();
  uint64_t v3 = sub_2C370();
  v1[17] = v3;
  v1[18] = *(void *)(v3 - 8);
  v1[19] = swift_task_alloc();
  uint64_t v4 = sub_2A368(&qword_4FFB0);
  v1[20] = v4;
  v1[21] = *(void *)(v4 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  return _swift_task_switch(sub_25B34, 0, 0);
}

uint64_t sub_25B34()
{
  uint64_t v1 = (void *)(v0[13] + OBJC_IVAR___NCRemoteNotificationsManager_companionDeviceManager);
  swift_beginAccess();
  v0[24] = *v1;
  sub_2A368(&qword_4FFB8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_33EB0;
  swift_retain();
  sub_2C360();
  v0[8] = v2;
  sub_2A5FC(&qword_4FFC0, (void (*)(uint64_t))&type metadata accessor for CompanionDeviceManager.Options);
  sub_2A368(&qword_4FFC8);
  sub_2A544(&qword_4FFD0, &qword_4FFC8);
  sub_2C550();
  sub_2C3A0();
  sub_2A5FC(&qword_4FFD8, (void (*)(uint64_t))&type metadata accessor for CompanionDeviceManager);
  uint64_t v4 = sub_2C430();
  return _swift_task_switch(sub_25D04, v4, v3);
}

uint64_t sub_25D04()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[17];
  sub_2C380();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_25DA0, 0, 0);
}

uint64_t sub_25DA0()
{
  (*(void (**)(void, void, void))(v0[21] + 16))(v0[22], v0[23], v0[20]);
  v0[25] = swift_getOpaqueTypeConformance2();
  sub_2C4B0();
  v0[26] = OBJC_IVAR___NCRemoteNotificationsManager_monitor;
  swift_beginAccess();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[27] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_25F10;
  uint64_t v3 = v0[14];
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 9, 0, 0, v0 + 10, v3, AssociatedConformanceWitness);
}

uint64_t sub_25F10()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_26370;
  }
  else {
    uint64_t v1 = sub_26020;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_26020()
{
  uint64_t v1 = v0[9];
  if (v1)
  {
    if (qword_50168 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2C3D0();
    sub_2A484(v2, (uint64_t)qword_50170);
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2C3B0();
    os_log_type_t v4 = sub_2C4D0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 134217984;
      v0[12] = *(void *)(v1 + 16);
      sub_2C530();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v3, v4, "Sequence yielded %ld devices.", v5, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    uint64_t v8 = v0[26];
    uint64_t v9 = v0[13];
    sub_2676C(v1);
    swift_bridgeObjectRelease();
    if (!*(void *)(v9 + v8)
      || (swift_retain(), char isCancelled = swift_task_isCancelled(), swift_release(), (isCancelled & 1) != 0))
    {
      double v11 = sub_2C3B0();
      os_log_type_t v12 = sub_2C4F0();
      if (os_log_type_enabled(v11, v12))
      {
        double v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v13 = 0;
        _os_log_impl(&dword_0, v11, v12, "Sequence cancelled.", v13, 2u);
        swift_slowDealloc();
      }
    }
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    double v15 = (void *)swift_task_alloc();
    v0[27] = v15;
    *double v15 = v0;
    v15[1] = sub_25F10;
    uint64_t v16 = v0[14];
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 9, 0, 0, v0 + 10, v16, AssociatedConformanceWitness);
  }
  else
  {
    (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
    (*(void (**)(void, void))(v0[21] + 8))(v0[23], v0[20]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_26370()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  if (qword_50168 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2C3D0();
  sub_2A484(v1, (uint64_t)qword_50170);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_2C3B0();
  os_log_type_t v3 = sub_2C4E0();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v4 = 138543362;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    v0[11] = v6;
    sub_2C530();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Device stream failed; %{public}@", v4, 0xCu);
    sub_2A368(&qword_4FFE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  swift_errorRelease();
  (*(void (**)(void, void))(v0[21] + 8))(v0[23], v0[20]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_265C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2C490();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2C480();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2A888(a1, &qword_4FF48);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2C430();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2676C(uint64_t a1)
{
  sub_2A368(&qword_4FF48);
  ((void (*)(void))__chkstk_darwin)();
  os_log_type_t v3 = (char *)v81 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2C340();
  uint64_t v93 = *(void *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v87 = (char *)v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = (char *)sub_2A368(&qword_4FFE8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2A368(&qword_4FFF0);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v100 = (char *)v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  os_log_type_t v12 = (char *)v81 - v11;
  __chkstk_darwin(v10);
  uint64_t v103 = (uint64_t)v81 - v13;
  uint64_t v82 = sub_2C3D0();
  uint64_t v14 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v16 = (char *)v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = (char *)sub_2C350();
  uint64_t v17 = *((void *)v104 - 1);
  uint64_t v18 = __chkstk_darwin(v104);
  v92 = (char *)v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v102 = (char *)v81 - v20;
  v21 = &_swiftEmptyArrayStorage;
  v112[0] = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t v22 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  v101 = v3;
  uint64_t v85 = v14;
  v84 = v16;
  if (v22)
  {
    v24 = *(void (**)(char *, uint64_t, char *))(v17 + 16);
    uint64_t v23 = v17 + 16;
    v96 = v24;
    unint64_t v25 = (*(unsigned __int8 *)(v23 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 64);
    v26 = *(uint64_t **)(v23 + 56);
    v81[1] = a1;
    unint64_t v88 = v25;
    uint64_t v27 = a1 + v25;
    v95 = (void (**)(char *, void, uint64_t))(v93 + 104);
    v94 = (void (**)(char *, void, uint64_t, uint64_t))(v93 + 56);
    v28 = (unsigned int (**)(char *, uint64_t, uint64_t))(v93 + 48);
    v86 = (void (**)(char *, uint64_t, uint64_t))(v93 + 32);
    v89 = (void (**)(uint64_t, uint64_t))(v93 + 8);
    LODWORD(v93) = enum case for CompanionDevice.PairingState.paired(_:);
    v90 = (void (**)(char *, char *))(v23 - 8);
    v91 = (void (**)(char *, char *, char *))(v23 + 16);
    uint64_t v29 = (uint64_t)v100;
    uint64_t v97 = v23;
    v98 = v26;
    while (1)
    {
      v96(v102, v27, v104);
      uint64_t v32 = v103;
      sub_2C330();
      (*v95)(v12, v93, v4);
      (*v94)(v12, 0, 1, v4);
      uint64_t v33 = (uint64_t)&v7[*((int *)v99 + 12)];
      sub_2A594(v32, (uint64_t)v7);
      sub_2A594((uint64_t)v12, v33);
      v34 = *v28;
      if ((*v28)(v7, 1, v4) == 1) {
        break;
      }
      sub_2A594((uint64_t)v7, v29);
      if (v34((char *)v33, 1, v4) == 1)
      {
        (*v89)(v29, v4);
LABEL_4:
        sub_2A888((uint64_t)v7, &qword_4FFE8);
        sub_2A888((uint64_t)v12, &qword_4FFF0);
        sub_2A888(v103, &qword_4FFF0);
        v30 = v101;
        goto LABEL_5;
      }
      v35 = v87;
      (*v86)(v87, v33, v4);
      sub_2A5FC(&qword_4FFF8, (void (*)(uint64_t))&type metadata accessor for CompanionDevice.PairingState);
      char v36 = sub_2C410();
      v37 = *v89;
      (*v89)((uint64_t)v100, v4);
      v38 = v35;
      uint64_t v29 = (uint64_t)v100;
      v37((uint64_t)v38, v4);
      sub_2A888((uint64_t)v7, &qword_4FFF0);
      sub_2A888((uint64_t)v12, &qword_4FFF0);
      sub_2A888(v103, &qword_4FFF0);
      v30 = v101;
      if (v36) {
        goto LABEL_12;
      }
LABEL_5:
      (*v90)(v102, v104);
      v31 = v98;
LABEL_6:
      v27 += (uint64_t)v31;
      if (!--v22)
      {
        os_log_type_t v3 = v30;
        v21 = (void *)v112[0];
        uint64_t v14 = v85;
        uint64_t v16 = v84;
        goto LABEL_18;
      }
    }
    if (v34((char *)v33, 1, v4) == 1)
    {
      sub_2A888((uint64_t)v7, &qword_4FFF0);
      sub_2A888((uint64_t)v12, &qword_4FFF0);
      sub_2A888(v103, &qword_4FFF0);
LABEL_12:
      v39 = *v91;
      (*v91)(v92, v102, v104);
      uint64_t v40 = v112[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_29C10(0, *(void *)(v40 + 16) + 1, 1);
        uint64_t v40 = v112[0];
      }
      v41 = v98;
      unint64_t v43 = *(void *)(v40 + 16);
      unint64_t v42 = *(void *)(v40 + 24);
      if (v43 >= v42 >> 1)
      {
        sub_29C10(v42 > 1, v43 + 1, 1);
        v41 = v98;
        uint64_t v40 = v112[0];
      }
      *(void *)(v40 + 16) = v43 + 1;
      v31 = v41;
      v39((char *)(v40 + v88 + v43 * (void)v41), v92, v104);
      v112[0] = v40;
      v30 = v101;
      uint64_t v29 = (uint64_t)v100;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_18:
  swift_bridgeObjectRelease();
  unint64_t v44 = v21[2];
  swift_release();
  uint64_t v45 = v82;
  if (qword_50168 != -1) {
LABEL_69:
  }
    swift_once();
  uint64_t v46 = sub_2A484(v45, (uint64_t)qword_50170);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v46, v45);
  v47 = sub_2C3B0();
  os_log_type_t v48 = sub_2C4D0();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    *(_DWORD *)v49 = 136315138;
    v112[0] = v50;
    if (v44) {
      uint64_t v51 = 28239;
    }
    else {
      uint64_t v51 = 6710863;
    }
    if (v44) {
      unint64_t v52 = 0xE200000000000000;
    }
    else {
      unint64_t v52 = 0xE300000000000000;
    }
    uint64_t v111 = sub_27E4C(v51, v52, v112);
    sub_2C530();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v47, v48, "New state: %s.", v49, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v85 + 8))(v84, v45);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v45);
  }
  uint64_t v16 = v83;
  v53 = &v83[OBJC_IVAR___NCRemoteNotificationsManager_protectedFeatureIsAvailable];
  uint64_t v54 = swift_beginAccess();
  uint64_t v14 = (uint64_t)v81;
  uint64_t v55 = *(void *)v53;
  __chkstk_darwin(v54);
  LOBYTE(v81[-2]) = v44 != 0;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v55 + 20));
  sub_2A644((unsigned char *)(v55 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v55 + 20));
  swift_release();
  v56 = (uint64_t *)&v16[OBJC_IVAR___NCRemoteNotificationsManager_observers];
  swift_beginAccess();
  v98 = v56;
  uint64_t v57 = *v56;
  if ((*v56 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_2C580();
    sub_2A368(&qword_50000);
    sub_2A65C();
    sub_2C4C0();
    uint64_t v57 = v112[0];
    uint64_t v103 = v112[1];
    uint64_t v58 = v112[2];
    uint64_t v59 = v112[3];
    unint64_t v44 = v112[4];
  }
  else
  {
    uint64_t v60 = -1 << *(unsigned char *)(v57 + 32);
    uint64_t v61 = *(void *)(v57 + 56);
    uint64_t v103 = v57 + 56;
    uint64_t v62 = ~v60;
    uint64_t v63 = -v60;
    if (v63 < 64) {
      uint64_t v64 = ~(-1 << v63);
    }
    else {
      uint64_t v64 = -1;
    }
    unint64_t v44 = v64 & v61;
    swift_bridgeObjectRetain();
    uint64_t v58 = v62;
    uint64_t v59 = 0;
  }
  v100 = (char *)(v57 & 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v97 = v58;
  v102 = (char *)((unint64_t)(v58 + 64) >> 6);
  v104 = (char *)&type metadata for () + 8;
  v99 = (char *)&type metadata for Swift.AnyObject + 8;
  while (v57 < 0)
  {
    uint64_t v66 = sub_2C5B0();
    if (!v66) {
      return sub_2A6B8();
    }
    uint64_t v105 = v66;
    swift_unknownObjectRetain();
    sub_2A368(&qword_50000);
    swift_dynamicCast();
    uint64_t v45 = v110;
    swift_unknownObjectRelease();
    uint64_t v14 = v59;
    uint64_t v16 = (char *)v44;
    if (!v45) {
      return sub_2A6B8();
    }
LABEL_58:
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
      swift_beginAccess();
      sub_29500();
      swift_endAccess();
      swift_release();
      goto LABEL_36;
    }
    uint64_t v71 = Strong;
    uint64_t v72 = sub_2C490();
    uint64_t v73 = *(void *)(v72 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v73 + 56))(v3, 1, 1, v72);
    sub_2C460();
    swift_unknownObjectRetain();
    uint64_t v74 = sub_2C450();
    v75 = (void *)swift_allocObject();
    v75[2] = v74;
    v75[3] = &protocol witness table for MainActor;
    v75[4] = v71;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48))(v3, 1, v72) == 1)
    {
      sub_2A888((uint64_t)v3, &qword_4FF48);
      if (!v75[2]) {
        goto LABEL_63;
      }
    }
    else
    {
      sub_2C480();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v3, v72);
      if (!v75[2])
      {
LABEL_63:
        uint64_t v76 = 0;
        uint64_t v78 = 0;
        goto LABEL_64;
      }
    }
    swift_getObjectType();
    swift_unknownObjectRetain();
    uint64_t v76 = sub_2C430();
    uint64_t v78 = v77;
    swift_unknownObjectRelease();
LABEL_64:
    uint64_t v79 = swift_allocObject();
    *(void *)(v79 + 16) = &unk_50010;
    *(void *)(v79 + 24) = v75;
    if (v78 | v76)
    {
      uint64_t v106 = 0;
      uint64_t v107 = 0;
      uint64_t v108 = v76;
      uint64_t v109 = v78;
    }
    os_log_type_t v3 = v101;
    swift_task_create();
    swift_release();
    swift_unknownObjectRelease();
LABEL_36:
    swift_release();
    uint64_t v59 = v14;
    unint64_t v44 = (unint64_t)v16;
  }
  if (v44)
  {
    uint64_t v16 = (char *)((v44 - 1) & v44);
    unint64_t v65 = __clz(__rbit64(v44)) | (v59 << 6);
    uint64_t v14 = v59;
    goto LABEL_57;
  }
  uint64_t v67 = v59 + 1;
  if (__OFADD__(v59, 1))
  {
    __break(1u);
    goto LABEL_69;
  }
  if (v67 >= (uint64_t)v102) {
    return sub_2A6B8();
  }
  unint64_t v68 = *(void *)(v103 + 8 * v67);
  uint64_t v14 = v59 + 1;
  if (v68) {
    goto LABEL_56;
  }
  uint64_t v14 = v59 + 2;
  if (v59 + 2 >= (uint64_t)v102) {
    return sub_2A6B8();
  }
  unint64_t v68 = *(void *)(v103 + 8 * v14);
  if (v68) {
    goto LABEL_56;
  }
  uint64_t v14 = v59 + 3;
  if (v59 + 3 >= (uint64_t)v102) {
    return sub_2A6B8();
  }
  unint64_t v68 = *(void *)(v103 + 8 * v14);
  if (v68) {
    goto LABEL_56;
  }
  uint64_t v14 = v59 + 4;
  if (v59 + 4 >= (uint64_t)v102) {
    return sub_2A6B8();
  }
  unint64_t v68 = *(void *)(v103 + 8 * v14);
  if (v68)
  {
LABEL_56:
    uint64_t v16 = (char *)((v68 - 1) & v68);
    unint64_t v65 = __clz(__rbit64(v68)) + (v14 << 6);
LABEL_57:
    uint64_t v45 = *(void *)(*(void *)(v57 + 48) + 8 * v65);
    swift_retain();
    if (!v45) {
      return sub_2A6B8();
    }
    goto LABEL_58;
  }
  v69 = (char *)(v59 + 5);
  while (v102 != v69)
  {
    unint64_t v68 = *(void *)(v103 + 8 * (void)v69++);
    if (v68)
    {
      uint64_t v14 = (uint64_t)(v69 - 1);
      goto LABEL_56;
    }
  }
  return sub_2A6B8();
}

uint64_t sub_276E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a4;
  sub_2C460();
  *(void *)(v4 + 32) = sub_2C450();
  uint64_t v6 = sub_2C430();
  return _swift_task_switch(sub_2777C, v6, v5);
}

uint64_t sub_2777C()
{
  swift_release();
  if (qword_50168 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2C3D0();
  sub_2A484(v1, (uint64_t)qword_50170);
  swift_unknownObjectRetain();
  uint64_t v2 = sub_2C3B0();
  os_log_type_t v3 = sub_2C4F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    *(void *)(v0 + 16) = sub_2C400();
    sub_2C530();
    swift_unknownObjectRelease();
    _os_log_impl(&dword_0, v2, v3, "Notifying observer %ld of change.", v4, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_unknownObjectRelease();
  }

  [*(id *)(v0 + 24) remoteNotificationsStateDidChange];
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

id RemoteNotificationsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_279D0()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  uint64_t v1 = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    if (!v1 || Strong != (void *)v1)
    {
      id v2 = [Strong isEqual:v1];
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return (uint64_t)v2;
    }
    swift_unknownObjectRelease_n();
    return 1;
  }
  if (!v1) {
    return 1;
  }
  swift_unknownObjectRelease();
  return 0;
}

void sub_27A78()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = [Strong hash];
    swift_unknownObjectRelease();
    sub_2C670(1u);
    sub_2C660((Swift::UInt)v1);
  }
  else
  {
    sub_2C670(0);
  }
}

uint64_t sub_27AE4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocClassInstance(v0, 24, 7);
}

Swift::Int sub_27B1C()
{
  return sub_2C680();
}

Swift::Int sub_27B5C()
{
  return sub_27B1C();
}

void sub_27B80()
{
}

Swift::Int sub_27BA4()
{
  return sub_2C680();
}

uint64_t sub_27BE4()
{
  return sub_279D0();
}

uint64_t sub_27BF0()
{
  uint64_t v0 = sub_2C3D0();
  sub_2AB7C(v0, qword_50170);
  sub_2A484(v0, (uint64_t)qword_50170);
  return sub_2C3C0();
}

uint64_t sub_27C78(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_27D54;
  return v6(a1);
}

uint64_t sub_27D54()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_27E4C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_27F20(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2AB1C((uint64_t)v12, *a3);
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
      sub_2AB1C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2AACC((uint64_t)v12);
  return v7;
}

uint64_t sub_27F20(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2C540();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_280DC(a5, a6);
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
  uint64_t v8 = sub_2C610();
  if (!v8)
  {
    sub_2C620();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2C630();
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

uint64_t sub_280DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_28174(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_28354(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_28354(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_28174(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_282EC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2C600();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_2C620();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2C420();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_2C630();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_2C620();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_282EC(uint64_t a1, uint64_t a2)
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
  sub_2A368(&qword_50058);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_28354(char a1, int64_t a2, char a3, char *a4)
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
    sub_2A368(&qword_50058);
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
  uint64_t result = sub_2C630();
  __break(1u);
  return result;
}

uint64_t sub_284A4(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v8 = sub_2C5A0();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_unknownObjectRetain();
      sub_2A368(&qword_50000);
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_2C590();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v13 = sub_28804(v7, result + 1);
    Swift::Int v27 = v13;
    if (*(void *)(v13 + 24) <= *(void *)(v13 + 16))
    {
      swift_retain();
      sub_28A3C();
      uint64_t v14 = v27;
    }
    else
    {
      uint64_t v14 = v13;
      swift_retain();
    }
    sub_28D50(a2, v14);
    *unint64_t v3 = v14;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  sub_2C650();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v10 = (void *)Strong;
    swift_bridgeObjectRetain();
    id v11 = [v10 hash];
    swift_unknownObjectRelease();
    sub_2C670(1u);
    sub_2C660((Swift::UInt)v11);
  }
  else
  {
    sub_2C670(0);
    swift_bridgeObjectRetain();
  }
  unint64_t v25 = v3;
  Swift::Int v15 = sub_2C680();
  uint64_t v16 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v17 = v15 & ~v16;
  if (((*(void *)(v6 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17) & 1) == 0)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v25;
    *unint64_t v25 = 0x8000000000000000;
    Swift::Int v24 = swift_retain();
    sub_28E34(v24, v17, isUniquelyReferenced_nonNull_native);
    *unint64_t v25 = v28;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  uint64_t v18 = ~v16;
  while (1)
  {
    uint64_t v20 = (void *)swift_unknownObjectWeakLoadStrong();
    uint64_t v21 = swift_unknownObjectWeakLoadStrong();
    uint64_t v22 = v21;
    if (v20) {
      break;
    }
    if (!v21) {
      goto LABEL_27;
    }
    swift_unknownObjectRelease();
LABEL_16:
    unint64_t v17 = (v17 + 1) & v18;
    if (((*(void *)(v6 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17) & 1) == 0) {
      goto LABEL_23;
    }
  }
  if (v21 && v20 == (void *)v21)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    goto LABEL_28;
  }
  swift_retain();
  unsigned int v19 = [v20 isEqual:v22];
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (!v19) {
    goto LABEL_16;
  }
LABEL_27:
  swift_release();
  swift_bridgeObjectRelease();
LABEL_28:
  *a1 = *(void *)(*(void *)(*v25 + 48) + 8 * v17);
  swift_retain();
  return 0;
}

Swift::Int sub_28804(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_2A368(&qword_50060);
    uint64_t v2 = sub_2C5F0();
    uint64_t v16 = v2;
    sub_2C580();
    for (; sub_2C5B0(); ++*(void *)(v2 + 16))
    {
      sub_2A368(&qword_50000);
      swift_dynamicCast();
      if (*(void *)(v2 + 24) <= *(void *)(v2 + 16))
      {
        sub_28A3C();
        uint64_t v2 = v16;
      }
      sub_2C650();
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v5 = [Strong hash];
        swift_unknownObjectRelease();
        sub_2C670(1u);
        sub_2C660((Swift::UInt)v5);
      }
      else
      {
        sub_2C670(0);
      }
      Swift::Int result = sub_2C680();
      uint64_t v7 = v2 + 56;
      uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v9 = result & ~v8;
      unint64_t v10 = v9 >> 6;
      if (((-1 << v9) & ~*(void *)(v2 + 56 + 8 * (v9 >> 6))) != 0)
      {
        unint64_t v3 = __clz(__rbit64((-1 << v9) & ~*(void *)(v2 + 56 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v11 = 0;
        unint64_t v12 = (unint64_t)(63 - v8) >> 6;
        do
        {
          if (++v10 == v12 && (v11 & 1) != 0)
          {
            __break(1u);
            return result;
          }
          BOOL v13 = v10 == v12;
          if (v10 == v12) {
            unint64_t v10 = 0;
          }
          v11 |= v13;
          uint64_t v14 = *(void *)(v7 + 8 * v10);
        }
        while (v14 == -1);
        unint64_t v3 = __clz(__rbit64(~v14)) + (v10 << 6);
      }
      *(void *)(v7 + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v3;
      *(void *)(*(void *)(v2 + 48) + 8 * v3) = v15;
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_28A3C()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_2A368(&qword_50060);
  uint64_t v3 = sub_2C5E0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v29 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v11 << 6);
      }
      else
      {
        int64_t v15 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v15 >= v8) {
          goto LABEL_36;
        }
        unint64_t v16 = v29[v15];
        ++v11;
        if (!v16)
        {
          int64_t v11 = v15 + 1;
          if (v15 + 1 >= v8) {
            goto LABEL_36;
          }
          unint64_t v16 = v29[v11];
          if (!v16)
          {
            int64_t v11 = v15 + 2;
            if (v15 + 2 >= v8) {
              goto LABEL_36;
            }
            unint64_t v16 = v29[v11];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v8)
              {
LABEL_36:
                swift_release();
                id v1 = v0;
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v29 = -1 << v28;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v11 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_42;
                  }
                  if (v11 >= v8) {
                    goto LABEL_36;
                  }
                  unint64_t v16 = v29[v11];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_2C650();
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v20 = [Strong hash];
        swift_unknownObjectRelease();
        sub_2C670(1u);
        sub_2C660((Swift::UInt)v20);
      }
      else
      {
        sub_2C670(0);
      }
      uint64_t result = sub_2C680();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v9 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v22) & ~*(void *)(v9 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v12 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_28D50(uint64_t a1, uint64_t a2)
{
  sub_2C650();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = [Strong hash];
    swift_unknownObjectRelease();
    sub_2C670(1u);
    sub_2C660((Swift::UInt)v5);
  }
  else
  {
    sub_2C670(0);
  }
  sub_2C680();
  unint64_t result = sub_2C570();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

Swift::Int sub_28E34(Swift::Int result, unint64_t a2, char a3)
{
  unint64_t v5 = *(void *)(*v3 + 16);
  unint64_t v6 = *(void *)(*v3 + 24);
  Swift::Int v21 = result;
  if (v6 <= v5 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_28A3C();
    }
    else
    {
      if (v6 > v5)
      {
        unint64_t result = (Swift::Int)sub_29064();
        goto LABEL_21;
      }
      sub_29210();
    }
    uint64_t v7 = *v3;
    sub_2C650();
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v9 = [Strong hash];
      swift_unknownObjectRelease();
      sub_2C670(1u);
      sub_2C660((Swift::UInt)v9);
    }
    else
    {
      sub_2C670(0);
    }
    unint64_t result = sub_2C680();
    uint64_t v10 = -1 << *(unsigned char *)(v7 + 32);
    a2 = result & ~v10;
    if ((*(void *)(v7 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v11 = ~v10;
      do
      {
        unint64_t v13 = (void *)swift_unknownObjectWeakLoadStrong();
        uint64_t v14 = swift_unknownObjectWeakLoadStrong();
        uint64_t v15 = v14;
        if (v13)
        {
          if (v14 && v13 == (void *)v14) {
            goto LABEL_24;
          }
          swift_retain();
          unsigned __int8 v12 = [v13 isEqual:v15];
          swift_release();
          swift_unknownObjectRelease();
          unint64_t result = swift_unknownObjectRelease();
          if (v12) {
            goto LABEL_25;
          }
        }
        else
        {
          if (!v14) {
            goto LABEL_25;
          }
          unint64_t result = swift_unknownObjectRelease();
        }
        a2 = (a2 + 1) & v11;
      }
      while (((*(void *)(v7 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_21:
  uint64_t v16 = *v20;
  *(void *)(*v20 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = v21;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18)
  {
    __break(1u);
LABEL_24:
    swift_unknownObjectRelease_n();
LABEL_25:
    sub_2A368(&qword_50000);
    unint64_t result = sub_2C640();
    __break(1u);
  }
  else
  {
    *(void *)(v16 + 16) = v19;
  }
  return result;
}

void *sub_29064()
{
  id v1 = v0;
  sub_2A368(&qword_50060);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2C5D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    unint64_t result = (void *)swift_retain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_29210()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_2A368(&qword_50060);
  uint64_t v3 = sub_2C5E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_38:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  uint64_t v29 = v0;
  int64_t v30 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v15 >= v30) {
      goto LABEL_36;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v11);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_2C650();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v20 = (void *)Strong;
      swift_retain();
      id v21 = [v20 hash];
      swift_unknownObjectRelease();
      sub_2C670(1u);
      sub_2C660((Swift::UInt)v21);
    }
    else
    {
      sub_2C670(0);
      swift_retain();
    }
    uint64_t result = sub_2C680();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v30)
  {
LABEL_36:
    uint64_t result = swift_release_n();
    id v1 = v29;
    goto LABEL_38;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v30) {
      goto LABEL_36;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_29500()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  if ((*v0 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    char v3 = sub_2C5C0();
    swift_release();
    if (v3)
    {
      uint64_t v4 = sub_29770();
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  sub_2C650();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    swift_bridgeObjectRetain();
    id v7 = [v6 hash];
    swift_unknownObjectRelease();
    sub_2C670(1u);
    sub_2C660((Swift::UInt)v7);
  }
  else
  {
    sub_2C670(0);
    swift_bridgeObjectRetain();
  }
  Swift::Int v8 = sub_2C680();
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v2 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v11 = ~v9;
  while (1)
  {
    unint64_t v13 = (void *)swift_unknownObjectWeakLoadStrong();
    uint64_t v14 = swift_unknownObjectWeakLoadStrong();
    uint64_t v15 = v14;
    if (v13) {
      break;
    }
    if (!v14) {
      goto LABEL_18;
    }
    swift_unknownObjectRelease();
LABEL_10:
    unint64_t v10 = (v10 + 1) & v11;
    if (((*(void *)(v2 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
      goto LABEL_17;
    }
  }
  if (v14 && v13 == (void *)v14)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    goto LABEL_19;
  }
  swift_retain();
  unsigned int v12 = [v13 isEqual:v15];
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (!v12) {
    goto LABEL_10;
  }
LABEL_18:
  swift_bridgeObjectRelease();
LABEL_19:
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v17 = *v1;
  uint64_t v19 = *v1;
  uint64_t *v1 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_29064();
    uint64_t v17 = v19;
  }
  uint64_t v4 = *(void *)(*(void *)(v17 + 48) + 8 * v10);
  sub_299FC(v10);
  uint64_t *v1 = v19;
LABEL_22:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_29770()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_2C590();
  uint64_t v1 = swift_unknownObjectRetain();
  Swift::Int v2 = sub_28804(v1, v0);
  Swift::Int v22 = v2;
  sub_2C650();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    swift_retain();
    id v5 = [v4 hash];
    swift_unknownObjectRelease();
    sub_2C670(1u);
    sub_2C660((Swift::UInt)v5);
  }
  else
  {
    sub_2C670(0);
    swift_retain();
  }
  Swift::Int v6 = sub_2C680();
  uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v9 = ~v7;
    do
    {
      uint64_t v11 = (void *)swift_unknownObjectWeakLoadStrong();
      uint64_t v12 = swift_unknownObjectWeakLoadStrong();
      uint64_t v13 = v12;
      if (v11)
      {
        if (v12 && v11 == (void *)v12)
        {
          swift_release();
          swift_unknownObjectRelease_n();
          goto LABEL_15;
        }
        swift_retain();
        unsigned int v10 = [v11 isEqual:v13];
        swift_release();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if (v10) {
          goto LABEL_14;
        }
      }
      else
      {
        if (!v12)
        {
LABEL_14:
          swift_release();
LABEL_15:
          uint64_t v14 = *(void *)(*(void *)(v2 + 48) + 8 * v8);
          sub_299FC(v8);
          uint64_t v15 = (void *)swift_unknownObjectWeakLoadStrong();
          uint64_t v16 = swift_unknownObjectWeakLoadStrong();
          uint64_t v17 = v16;
          if (v15)
          {
            if (v16) {
              BOOL v18 = v15 == (void *)v16;
            }
            else {
              BOOL v18 = 0;
            }
            if (!v18)
            {
              unsigned __int8 v19 = [v15 isEqual:v16];
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              if ((v19 & 1) == 0)
              {
                __break(1u);
                goto LABEL_22;
              }
LABEL_25:
              Swift::Int *v21 = v22;
              return v14;
            }
          }
          else
          {
LABEL_22:
            if (!v17) {
              goto LABEL_25;
            }
            swift_unknownObjectRelease();
            __break(1u);
          }
          swift_unknownObjectRelease_n();
          goto LABEL_25;
        }
        swift_unknownObjectRelease();
      }
      unint64_t v8 = (v8 + 1) & v9;
    }
    while (((*(void *)(v2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_299FC(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_2C560();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_2C650();
        uint64_t Strong = swift_unknownObjectWeakLoadStrong();
        if (Strong)
        {
          uint64_t v11 = (void *)Strong;
          swift_retain();
          id v12 = [v11 hash];
          swift_unknownObjectRelease();
          sub_2C670(1u);
          sub_2C660((Swift::UInt)v12);
        }
        else
        {
          sub_2C670(0);
          swift_retain();
        }
        Swift::Int v13 = sub_2C680();
        swift_release();
        unint64_t v14 = v13 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v14 < v9) {
            goto LABEL_5;
          }
        }
        else if (v14 >= v9)
        {
          goto LABEL_14;
        }
        if (v2 >= (uint64_t)v14)
        {
LABEL_14:
          uint64_t v15 = *(void *)(v3 + 48);
          uint64_t v16 = (void *)(v15 + 8 * v2);
          uint64_t v17 = (void *)(v15 + 8 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v16 >= v17 + 1))
          {
            void *v16 = *v17;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v18 = *(void *)(v3 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_29C10(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_29C30(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_29C30(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    Swift::Int v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_2A368(&qword_50068);
  uint64_t v10 = *(void *)(sub_2C350() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  Swift::Int v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2C350() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  BOOL v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  id v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2C630();
  __break(1u);
  return result;
}

uint64_t _s21NotificationsSettings06RemoteA7ManagerC11addObserveryyAA0ca5StateF0_pFZ_0(uint64_t a1)
{
  if (qword_50160 != -1) {
    swift_once();
  }
  swift_beginAccess();
  int64_t v2 = (void *)qword_50480;
  uint64_t v3 = *(NSObject **)(qword_50480 + OBJC_IVAR___NCRemoteNotificationsManager_queue);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v2;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_2AD7C;
  *(void *)(v5 + 24) = v4;
  aBlock[4] = sub_2AD74;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24894;
  aBlock[3] = &unk_418F8;
  unint64_t v6 = _Block_copy(aBlock);
  id v7 = v2;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_2A038()
{
  return sub_2454C(*(void *)(v0 + 16), *(char **)(v0 + 24));
}

uint64_t sub_2A040()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2A050()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2A078(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2A088()
{
  return swift_release();
}

uint64_t _s21NotificationsSettings06RemoteA7ManagerC14removeObserveryyAA0ca5StateF0_pFZ_0(uint64_t a1)
{
  if (qword_50160 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_50480;
  uint64_t v3 = *(NSObject **)(qword_50480 + OBJC_IVAR___NCRemoteNotificationsManager_queue);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v2;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_2AD78;
  *(void *)(v5 + 24) = v4;
  aBlock[4] = sub_2AD74;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24894;
  aBlock[3] = &unk_41858;
  unint64_t v6 = _Block_copy(aBlock);
  id v7 = v2;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_2A258()
{
  return sub_248D4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2A260()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t _s21NotificationsSettings06RemoteA7ManagerC18featureIsAvailableSbvgZ_0()
{
  if (qword_50160 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_50480;
  uint64_t v1 = (uint64_t *)(qword_50480 + OBJC_IVAR___NCRemoteNotificationsManager_protectedFeatureIsAvailable);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v0;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  sub_24C54((unsigned char *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  uint64_t v4 = v6;

  swift_release();
  return v4;
}

uint64_t sub_2A368(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2A3B0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_2AD80;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25794;
  return sub_259A4();
}

uint64_t sub_2A484(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_2A4BC()
{
  unint64_t result = qword_4FF78;
  if (!qword_4FF78)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_4FF78);
  }
  return result;
}

uint64_t sub_2A4FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2A544(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2A4FC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2A594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2A368(&qword_4FFF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2A5FC(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *sub_2A644(unsigned char *result)
{
  int v2 = *(unsigned __int8 *)(v1 + 16);
  if (v2 != *result) {
    *uint64_t result = v2;
  }
  return result;
}

unint64_t sub_2A65C()
{
  unint64_t result = qword_50188[0];
  if (!qword_50188[0])
  {
    sub_2A4FC(&qword_50000);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_50188);
  }
  return result;
}

uint64_t sub_2A6B8()
{
  return swift_release();
}

uint64_t sub_2A6C0()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_2A700()
{
  uint64_t v2 = *(void *)(v0 + 32);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_2A794;
  return sub_276E4((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_2A794()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2A888(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2A368(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2A8E4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2A91C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2AD80;
  unsigned __int8 v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_50018 + dword_50018);
  return v6(a1, v4);
}

uint64_t type metadata accessor for RemoteNotificationsManager()
{
  return self;
}

uint64_t sub_2A9FC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for WeakObjcObserver()
{
  return sub_2AD44();
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_50050)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_50050);
    }
  }
}

uint64_t sub_2AAB0()
{
  return swift_getWitnessTable();
}

uint64_t sub_2AACC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2AB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_2AB7C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2ABE0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2A794;
  unsigned __int8 v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_50018 + dword_50018);
  return v6(a1, v4);
}

uint64_t sub_2AC9C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2ACB0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_2ACF4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2AD34()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2AD44()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2ADA4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_2ADB4()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_50318 = (uint64_t)result;
  return result;
}

uint64_t sub_2AE08(uint64_t a1)
{
  return sub_2C01C(a1, qword_50488);
}

uint64_t sub_2AE30()
{
  return sub_2C0E4(&qword_50320, (uint64_t)qword_50488);
}

uint64_t sub_2AE54@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50320, (uint64_t)qword_50488, a1);
}

uint64_t sub_2AE78(uint64_t a1)
{
  return sub_2C01C(a1, qword_504A0);
}

uint64_t sub_2AE9C()
{
  return sub_2C0E4(&qword_50328, (uint64_t)qword_504A0);
}

uint64_t sub_2AEC0@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50328, (uint64_t)qword_504A0, a1);
}

uint64_t sub_2AEE4(uint64_t a1)
{
  return sub_2C01C(a1, qword_504B8);
}

uint64_t sub_2AF08()
{
  return sub_2C0E4(&qword_50330, (uint64_t)qword_504B8);
}

uint64_t sub_2AF2C@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50330, (uint64_t)qword_504B8, a1);
}

uint64_t sub_2AF50(uint64_t a1)
{
  return sub_2C01C(a1, qword_504D0);
}

uint64_t sub_2AF74()
{
  return sub_2C0E4(&qword_50338, (uint64_t)qword_504D0);
}

uint64_t sub_2AF98@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50338, (uint64_t)qword_504D0, a1);
}

uint64_t sub_2AFBC(uint64_t a1)
{
  return sub_2C01C(a1, qword_504E8);
}

uint64_t sub_2AFE0()
{
  return sub_2C0E4(&qword_50340, (uint64_t)qword_504E8);
}

uint64_t sub_2B004@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50340, (uint64_t)qword_504E8, a1);
}

uint64_t sub_2B028(uint64_t a1)
{
  return sub_2C01C(a1, qword_50500);
}

uint64_t sub_2B04C()
{
  return sub_2C0E4(&qword_50348, (uint64_t)qword_50500);
}

uint64_t sub_2B070@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50348, (uint64_t)qword_50500, a1);
}

uint64_t sub_2B094(uint64_t a1)
{
  return sub_2C01C(a1, qword_50518);
}

uint64_t sub_2B0BC()
{
  return sub_2C0E4(&qword_50350, (uint64_t)qword_50518);
}

uint64_t sub_2B0E0@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50350, (uint64_t)qword_50518, a1);
}

uint64_t sub_2B104(uint64_t a1)
{
  return sub_2C01C(a1, qword_50530);
}

uint64_t sub_2B128()
{
  return sub_2C0E4(&qword_50358, (uint64_t)qword_50530);
}

uint64_t sub_2B14C@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50358, (uint64_t)qword_50530, a1);
}

uint64_t sub_2B170(uint64_t a1)
{
  return sub_2C01C(a1, qword_50548);
}

uint64_t sub_2B194()
{
  return sub_2C0E4(&qword_50360, (uint64_t)qword_50548);
}

uint64_t sub_2B1B8@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50360, (uint64_t)qword_50548, a1);
}

uint64_t sub_2B1DC(uint64_t a1)
{
  return sub_2C01C(a1, qword_50560);
}

uint64_t sub_2B200()
{
  return sub_2C0E4(&qword_50368, (uint64_t)qword_50560);
}

uint64_t sub_2B224@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50368, (uint64_t)qword_50560, a1);
}

uint64_t sub_2B248(uint64_t a1)
{
  return sub_2C01C(a1, qword_50578);
}

uint64_t sub_2B26C()
{
  return sub_2C0E4(&qword_50370, (uint64_t)qword_50578);
}

uint64_t sub_2B290@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50370, (uint64_t)qword_50578, a1);
}

uint64_t sub_2B2B4(uint64_t a1)
{
  return sub_2C01C(a1, qword_50590);
}

uint64_t sub_2B2D8()
{
  return sub_2C0E4(&qword_50378, (uint64_t)qword_50590);
}

uint64_t sub_2B2FC@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50378, (uint64_t)qword_50590, a1);
}

uint64_t sub_2B320(uint64_t a1)
{
  return sub_2C01C(a1, qword_505A8);
}

uint64_t sub_2B34C()
{
  return sub_2C0E4(&qword_50380, (uint64_t)qword_505A8);
}

uint64_t sub_2B370@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50380, (uint64_t)qword_505A8, a1);
}

uint64_t sub_2B394(uint64_t a1)
{
  return sub_2C01C(a1, qword_505C0);
}

uint64_t sub_2B3B8()
{
  return sub_2C0E4(&qword_50388, (uint64_t)qword_505C0);
}

uint64_t sub_2B3DC@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50388, (uint64_t)qword_505C0, a1);
}

uint64_t sub_2B400(uint64_t a1)
{
  return sub_2C01C(a1, qword_505D8);
}

uint64_t sub_2B424()
{
  return sub_2C0E4(&qword_50390, (uint64_t)qword_505D8);
}

uint64_t sub_2B448@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50390, (uint64_t)qword_505D8, a1);
}

uint64_t sub_2B46C(uint64_t a1)
{
  return sub_2C01C(a1, qword_505F0);
}

uint64_t sub_2B490()
{
  return sub_2C0E4(&qword_50398, (uint64_t)qword_505F0);
}

uint64_t sub_2B4B4@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50398, (uint64_t)qword_505F0, a1);
}

uint64_t sub_2B4D8(uint64_t a1)
{
  return sub_2C01C(a1, qword_50608);
}

uint64_t sub_2B4FC()
{
  return sub_2C0E4(&qword_503A0, (uint64_t)qword_50608);
}

uint64_t sub_2B520@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503A0, (uint64_t)qword_50608, a1);
}

uint64_t sub_2B544(uint64_t a1)
{
  return sub_2C01C(a1, qword_50620);
}

uint64_t sub_2B568()
{
  return sub_2C0E4(&qword_503A8, (uint64_t)qword_50620);
}

uint64_t sub_2B58C@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503A8, (uint64_t)qword_50620, a1);
}

uint64_t sub_2B5B0(uint64_t a1)
{
  return sub_2C01C(a1, qword_50638);
}

uint64_t sub_2B5D4()
{
  return sub_2C0E4(&qword_503B0, (uint64_t)qword_50638);
}

uint64_t sub_2B5F8@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503B0, (uint64_t)qword_50638, a1);
}

uint64_t sub_2B61C(uint64_t a1)
{
  return sub_2C01C(a1, qword_50650);
}

uint64_t sub_2B640()
{
  return sub_2C0E4(&qword_503B8, (uint64_t)qword_50650);
}

uint64_t sub_2B664@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503B8, (uint64_t)qword_50650, a1);
}

uint64_t sub_2B688(uint64_t a1)
{
  return sub_2C01C(a1, qword_50668);
}

uint64_t sub_2B6AC()
{
  return sub_2C0E4(&qword_503C0, (uint64_t)qword_50668);
}

uint64_t sub_2B6D0@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503C0, (uint64_t)qword_50668, a1);
}

uint64_t sub_2B6F4(uint64_t a1)
{
  return sub_2C01C(a1, qword_50680);
}

uint64_t sub_2B720()
{
  return sub_2C0E4(&qword_503C8, (uint64_t)qword_50680);
}

uint64_t sub_2B744@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503C8, (uint64_t)qword_50680, a1);
}

uint64_t sub_2B768(uint64_t a1)
{
  return sub_2C01C(a1, qword_50698);
}

uint64_t sub_2B78C()
{
  return sub_2C0E4(&qword_503D0, (uint64_t)qword_50698);
}

uint64_t sub_2B7B0@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503D0, (uint64_t)qword_50698, a1);
}

uint64_t sub_2B7D4(uint64_t a1)
{
  return sub_2C01C(a1, qword_506B0);
}

uint64_t sub_2B7F8()
{
  return sub_2C0E4(&qword_503D8, (uint64_t)qword_506B0);
}

uint64_t sub_2B81C@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503D8, (uint64_t)qword_506B0, a1);
}

uint64_t sub_2B840(uint64_t a1)
{
  return sub_2C01C(a1, qword_506C8);
}

uint64_t sub_2B864()
{
  return sub_2C0E4(&qword_503E0, (uint64_t)qword_506C8);
}

uint64_t sub_2B888@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503E0, (uint64_t)qword_506C8, a1);
}

uint64_t sub_2B8AC(uint64_t a1)
{
  return sub_2C01C(a1, qword_506E0);
}

uint64_t sub_2B8D0()
{
  return sub_2C0E4(&qword_503E8, (uint64_t)qword_506E0);
}

uint64_t sub_2B8F4@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503E8, (uint64_t)qword_506E0, a1);
}

uint64_t sub_2B918(uint64_t a1)
{
  return sub_2C01C(a1, qword_506F8);
}

uint64_t sub_2B93C()
{
  return sub_2C0E4(&qword_503F0, (uint64_t)qword_506F8);
}

uint64_t sub_2B960@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503F0, (uint64_t)qword_506F8, a1);
}

uint64_t sub_2B984(uint64_t a1)
{
  return sub_2C01C(a1, qword_50710);
}

uint64_t sub_2B9B0()
{
  return sub_2C0E4(&qword_503F8, (uint64_t)qword_50710);
}

uint64_t sub_2B9D4@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_503F8, (uint64_t)qword_50710, a1);
}

uint64_t sub_2B9F8(uint64_t a1)
{
  return sub_2C01C(a1, qword_50728);
}

uint64_t sub_2BA1C()
{
  return sub_2C0E4(&qword_50400, (uint64_t)qword_50728);
}

uint64_t sub_2BA40@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50400, (uint64_t)qword_50728, a1);
}

uint64_t sub_2BA64(uint64_t a1)
{
  return sub_2C01C(a1, qword_50740);
}

uint64_t sub_2BA88()
{
  return sub_2C0E4(&qword_50408, (uint64_t)qword_50740);
}

uint64_t sub_2BAAC@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50408, (uint64_t)qword_50740, a1);
}

uint64_t sub_2BAD0(uint64_t a1)
{
  return sub_2C01C(a1, qword_50758);
}

uint64_t sub_2BAF4()
{
  return sub_2C0E4(&qword_50410, (uint64_t)qword_50758);
}

uint64_t sub_2BB18@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50410, (uint64_t)qword_50758, a1);
}

uint64_t sub_2BB3C(uint64_t a1)
{
  return sub_2C01C(a1, qword_50770);
}

uint64_t sub_2BB60()
{
  return sub_2C0E4(&qword_50418, (uint64_t)qword_50770);
}

uint64_t sub_2BB84@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50418, (uint64_t)qword_50770, a1);
}

uint64_t sub_2BBA8(uint64_t a1)
{
  return sub_2C01C(a1, qword_50788);
}

uint64_t sub_2BBCC()
{
  return sub_2C0E4(&qword_50420, (uint64_t)qword_50788);
}

uint64_t sub_2BBF0@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50420, (uint64_t)qword_50788, a1);
}

uint64_t sub_2BC14(uint64_t a1)
{
  return sub_2C01C(a1, qword_507A0);
}

uint64_t sub_2BC40()
{
  return sub_2C0E4(&qword_50428, (uint64_t)qword_507A0);
}

uint64_t sub_2BC64@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50428, (uint64_t)qword_507A0, a1);
}

uint64_t sub_2BC88(uint64_t a1)
{
  return sub_2C01C(a1, qword_507B8);
}

uint64_t sub_2BCAC()
{
  return sub_2C0E4(&qword_50430, (uint64_t)qword_507B8);
}

uint64_t sub_2BCD0@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50430, (uint64_t)qword_507B8, a1);
}

uint64_t sub_2BCF4(uint64_t a1)
{
  return sub_2C01C(a1, qword_507D0);
}

uint64_t sub_2BD18()
{
  return sub_2C0E4(&qword_50438, (uint64_t)qword_507D0);
}

uint64_t sub_2BD3C@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50438, (uint64_t)qword_507D0, a1);
}

uint64_t sub_2BD60(uint64_t a1)
{
  return sub_2C01C(a1, qword_507E8);
}

uint64_t sub_2BD84()
{
  return sub_2C0E4(&qword_50440, (uint64_t)qword_507E8);
}

uint64_t sub_2BDA8@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50440, (uint64_t)qword_507E8, a1);
}

uint64_t sub_2BDCC(uint64_t a1)
{
  return sub_2C01C(a1, qword_50800);
}

uint64_t sub_2BDF0()
{
  return sub_2C0E4(&qword_50448, (uint64_t)qword_50800);
}

uint64_t sub_2BE14@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50448, (uint64_t)qword_50800, a1);
}

uint64_t sub_2BE38(uint64_t a1)
{
  return sub_2C01C(a1, qword_50818);
}

uint64_t sub_2BE5C()
{
  return sub_2C0E4(&qword_50450, (uint64_t)qword_50818);
}

uint64_t sub_2BE80@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50450, (uint64_t)qword_50818, a1);
}

uint64_t sub_2BEA4(uint64_t a1)
{
  return sub_2C01C(a1, qword_50830);
}

uint64_t sub_2BED0()
{
  return sub_2C0E4(&qword_50458, (uint64_t)qword_50830);
}

uint64_t sub_2BEF4@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50458, (uint64_t)qword_50830, a1);
}

uint64_t sub_2BF18(uint64_t a1)
{
  return sub_2C01C(a1, qword_50848);
}

uint64_t sub_2BF3C()
{
  return sub_2C0E4(&qword_50460, (uint64_t)qword_50848);
}

uint64_t sub_2BF60@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50460, (uint64_t)qword_50848, a1);
}

uint64_t sub_2BF84(uint64_t a1)
{
  return sub_2C01C(a1, qword_50860);
}

uint64_t sub_2BFA8()
{
  return sub_2C0E4(&qword_50468, (uint64_t)qword_50860);
}

uint64_t sub_2BFCC@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50468, (uint64_t)qword_50860, a1);
}

uint64_t sub_2BFF0(uint64_t a1)
{
  return sub_2C01C(a1, qword_50878);
}

uint64_t sub_2C01C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2C320();
  sub_2AB7C(v3, a2);
  sub_2A484(v3, (uint64_t)a2);
  if (qword_50310 != -1) {
    swift_once();
  }
  id v4 = (id)qword_50318;
  return sub_2C310();
}

uint64_t sub_2C0C0()
{
  return sub_2C0E4(&qword_50470, (uint64_t)qword_50878);
}

uint64_t sub_2C0E4(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2C320();

  return sub_2A484(v3, a2);
}

uint64_t sub_2C138@<X0>(uint64_t a1@<X8>)
{
  return sub_2C15C(&qword_50470, (uint64_t)qword_50878, a1);
}

uint64_t sub_2C15C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2C320();
  uint64_t v6 = sub_2A484(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_2C218(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1 >> 32;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "########### CT Error code: %ld", (uint8_t *)&v2, 0xCu);
}

void sub_2C294(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1 >> 32;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "### Error with CT Error code: %ld", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_2C310()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_2C320()
{
  return type metadata accessor for ImageResource();
}

uint64_t sub_2C330()
{
  return CompanionDevice.remoteScreenPairing.getter();
}

uint64_t sub_2C340()
{
  return type metadata accessor for CompanionDevice.PairingState();
}

uint64_t sub_2C350()
{
  return type metadata accessor for CompanionDevice();
}

uint64_t sub_2C360()
{
  return static CompanionDeviceManager.Options.remoteScreen.getter();
}

uint64_t sub_2C370()
{
  return type metadata accessor for CompanionDeviceManager.Options();
}

uint64_t sub_2C380()
{
  return dispatch thunk of CompanionDeviceManager.devices(with:)();
}

uint64_t sub_2C390()
{
  return CompanionDeviceManager.__allocating_init()();
}

uint64_t sub_2C3A0()
{
  return type metadata accessor for CompanionDeviceManager();
}

uint64_t sub_2C3B0()
{
  return Logger.logObject.getter();
}

uint64_t sub_2C3C0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_2C3D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_2C3E0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_2C3F0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_2C400()
{
  return ObjectIdentifier.hashValue.getter();
}

uint64_t sub_2C410()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

Swift::Int sub_2C420()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_2C430()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_2C450()
{
  return static MainActor.shared.getter();
}

uint64_t sub_2C460()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_2C470()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_2C480()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_2C490()
{
  return type metadata accessor for TaskPriority();
}

void sub_2C4A0()
{
}

uint64_t sub_2C4B0()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t sub_2C4C0()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_2C4D0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_2C4E0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_2C4F0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_2C500()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_2C510()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_2C520()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_2C530()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_2C540()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_2C550()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_2C560()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_2C570()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_2C580()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_2C590()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_2C5A0()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_2C5B0()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_2C5C0()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_2C5D0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_2C5E0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_2C5F0()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_2C600()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_2C610()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_2C620()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_2C630()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_2C640()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_2C650()
{
  return Hasher.init(_seed:)();
}

void sub_2C660(Swift::UInt a1)
{
}

void sub_2C670(Swift::UInt8 a1)
{
}

Swift::Int sub_2C680()
{
  return Hasher._finalize()();
}

uint64_t BSEqualStrings()
{
  return _BSEqualStrings();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
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

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return _CTFontCreateWithNameAndOptions(name, size, matrix, options);
}

uint64_t CTTelephonyCenterAddObserver()
{
  return _CTTelephonyCenterAddObserver();
}

uint64_t CTTelephonyCenterGetDefault()
{
  return _CTTelephonyCenterGetDefault();
}

uint64_t CTTelephonyCenterRemoveObserver()
{
  return _CTTelephonyCenterRemoveObserver();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MGIsDeviceOfType()
{
  return _MGIsDeviceOfType();
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

uint64_t NSStringFromTLAlertType()
{
  return _NSStringFromTLAlertType();
}

uint64_t PSApplicationSpecifierForBBSection()
{
  return _PSApplicationSpecifierForBBSection();
}

uint64_t PSBlankIconImage()
{
  return _PSBlankIconImage();
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return _PSBundlePathForPreferenceBundle();
}

uint64_t PSDisplayNameForBBSection()
{
  return _PSDisplayNameForBBSection();
}

uint64_t PSPassbookImage()
{
  return _PSPassbookImage();
}

uint64_t TLAlertTypeFromString()
{
  return _TLAlertTypeFromString();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIPointRoundToScale()
{
  return _UIPointRoundToScale();
}

uint64_t UIRectCenteredXInRect()
{
  return _UIRectCenteredXInRect();
}

uint64_t UIRectCenteredYInRect()
{
  return _UIRectCenteredYInRect();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

uint64_t UIRectRoundToScale()
{
  return _UIRectRoundToScale();
}

uint64_t UIRoundToScreenScale()
{
  return _UIRoundToScreenScale();
}

uint64_t UISizeRoundToScale()
{
  return _UISizeRoundToScale();
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

uint64_t _CTServerConnectionCopyCellBroadcastAlertTypesForAllSIMSlots()
{
  return __CTServerConnectionCopyCellBroadcastAlertTypesForAllSIMSlots();
}

uint64_t _CTServerConnectionCreate()
{
  return __CTServerConnectionCreate();
}

uint64_t _CTServerConnectionGetCellBroadcastSettingForAlertType()
{
  return __CTServerConnectionGetCellBroadcastSettingForAlertType();
}

uint64_t _CTServerConnectionSetCellBroadcastSettingForAlertType()
{
  return __CTServerConnectionSetCellBroadcastSettingForAlertType();
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return _getpid();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
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

uint64_t swift_task_isCancelled()
{
  return _swift_task_isCancelled();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__activeSectionInfos(void *a1, const char *a2, ...)
{
  return _[a1 _activeSectionInfos];
}

id objc_msgSend__addDefaultScheduledDeliveryTimes(void *a1, const char *a2, ...)
{
  return _[a1 _addDefaultScheduledDeliveryTimes];
}

id objc_msgSend__addNewScheduledTime(void *a1, const char *a2, ...)
{
  return _[a1 _addNewScheduledTime];
}

id objc_msgSend__addRegionalAlertGroupToSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addRegionalAlertGroupToSpecifiers:");
}

id objc_msgSend__alertDeliveryLocationImageForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alertDeliveryLocationImageForType:");
}

id objc_msgSend__alertDeliveryTypeSettingsSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alertDeliveryTypeSettingsSpecifierForSectionInfo:");
}

id objc_msgSend__alertSettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alertSettingSpecifierForSectionInfo:");
}

id objc_msgSend__alertSettingsGroupSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alertSettingsGroupSpecifierForSectionInfo:");
}

id objc_msgSend__allUnreadSpecifierWithSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allUnreadSpecifierWithSectionInfo:");
}

id objc_msgSend__allowsNotificationsSettingGroupSpecifiersForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowsNotificationsSettingGroupSpecifiersForSectionInfo:");
}

id objc_msgSend__allowsNotificationsSettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowsNotificationsSettingSpecifierForSectionInfo:");
}

id objc_msgSend__alphabeticallyOrderedSectionInfos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alphabeticallyOrderedSectionInfos:");
}

id objc_msgSend__alphabetizedSpecifiersFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alphabetizedSpecifiersFrom:");
}

id objc_msgSend__alwaysAllowedGroupSpecifiersForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alwaysAllowedGroupSpecifiersForSectionInfo:");
}

id objc_msgSend__animateUsingDefaultTimingWithOptions_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateUsingDefaultTimingWithOptions:animations:completion:");
}

id objc_msgSend__announceNewMessagesSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _announceNewMessagesSpecifier];
}

id objc_msgSend__announceOptionSpecifierNamed_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_announceOptionSpecifierNamed:identifier:");
}

id objc_msgSend__announceOptionsGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _announceOptionsGroupSpecifier];
}

id objc_msgSend__announceOptionsSectionSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _announceOptionsSectionSpecifiers];
}

id objc_msgSend__announceSettingsSpecifiersForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_announceSettingsSpecifiersForSectionInfo:");
}

id objc_msgSend__appListSpecifiersForGroupSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appListSpecifiersForGroupSpecifier:");
}

id objc_msgSend__appSelectionListSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _appSelectionListSpecifiers];
}

id objc_msgSend__appclipsSpecifierForAppClips_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appclipsSpecifierForAppClips:");
}

id objc_msgSend__areAlwaysDeliverImmediatelyNotificationsNotEnabledForScheduledDeliveryForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_areAlwaysDeliverImmediatelyNotificationsNotEnabledForScheduledDeliveryForSectionInfo:");
}

id objc_msgSend__availableWidthForCountBar(void *a1, const char *a2, ...)
{
  return _[a1 _availableWidthForCountBar];
}

id objc_msgSend__badgesSettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_badgesSettingSpecifierForSectionInfo:");
}

id objc_msgSend__bannerStyleSettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bannerStyleSettingSpecifierForSectionInfo:");
}

id objc_msgSend__bestVariantForFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bestVariantForFormat:");
}

id objc_msgSend__carPlaySettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_carPlaySettingSpecifierForSectionInfo:");
}

id objc_msgSend__configureCountBarDotViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureCountBarDotViewIfNecessary];
}

id objc_msgSend__configureCountBarViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureCountBarViewIfNecessary];
}

id objc_msgSend__configureCountLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureCountLabelIfNecessary];
}

id objc_msgSend__configureSelectionImageViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureSelectionImageViewIfNecessary];
}

id objc_msgSend__configureSelectionLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureSelectionLabelIfNecessary];
}

id objc_msgSend__configureSelectionViewsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureSelectionViewsIfNecessary];
}

id objc_msgSend__contentPreviewSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentPreviewSpecifierForSectionInfo:");
}

id objc_msgSend__createSettingsObserverIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _createSettingsObserverIfNeeded];
}

id objc_msgSend__criticalAlertSettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_criticalAlertSettingSpecifierForSectionInfo:");
}

id objc_msgSend__currentDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 _currentDescriptor];
}

id objc_msgSend__customSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_customSettings:");
}

id objc_msgSend__customSoundSettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_customSoundSettingSpecifierForSectionInfo:");
}

id objc_msgSend__digestTimeSpecifierAtIndex_forScheduleTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_digestTimeSpecifierAtIndex:forScheduleTime:");
}

id objc_msgSend__directMessagesSettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_directMessagesSettingSpecifierForSectionInfo:");
}

id objc_msgSend__effectiveSectionInfoForSectionInfo_passingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectiveSectionInfoForSectionInfo:passingTest:");
}

id objc_msgSend__effectiveSectionInfoForSectionInfo_setting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectiveSectionInfoForSectionInfo:setting:");
}

id objc_msgSend__effectiveSectionInfoForSectionInfo_setting_pushSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectiveSectionInfoForSectionInfo:setting:pushSetting:");
}

id objc_msgSend__filterSuppressedSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterSuppressedSections:");
}

id objc_msgSend__footerTextForSpecialSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_footerTextForSpecialSections:");
}

id objc_msgSend__frequencyOrderedSectionInfos_forRankedDigestSetupResponses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frequencyOrderedSectionInfos:forRankedDigestSetupResponses:");
}

id objc_msgSend__globalScheduledDeliverySetting(void *a1, const char *a2, ...)
{
  return _[a1 _globalScheduledDeliverySetting];
}

id objc_msgSend__globalScheduledDeliveryTimes(void *a1, const char *a2, ...)
{
  return _[a1 _globalScheduledDeliveryTimes];
}

id objc_msgSend__isDirectMessagesAnnounceSupportedForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDirectMessagesAnnounceSupportedForSectionInfo:");
}

id objc_msgSend__isTemplateViewForSizing(void *a1, const char *a2, ...)
{
  return _[a1 _isTemplateViewForSizing];
}

id objc_msgSend__isTimeSensitiveAnnounceSupportedForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTimeSensitiveAnnounceSupportedForSectionInfo:");
}

id objc_msgSend__layoutCountBarDotView(void *a1, const char *a2, ...)
{
  return _[a1 _layoutCountBarDotView];
}

id objc_msgSend__layoutCountBarView(void *a1, const char *a2, ...)
{
  return _[a1 _layoutCountBarView];
}

id objc_msgSend__layoutCountLabel(void *a1, const char *a2, ...)
{
  return _[a1 _layoutCountLabel];
}

id objc_msgSend__layoutSelectionImageView(void *a1, const char *a2, ...)
{
  return _[a1 _layoutSelectionImageView];
}

id objc_msgSend__layoutSelectionLabel(void *a1, const char *a2, ...)
{
  return _[a1 _layoutSelectionLabel];
}

id objc_msgSend__layoutSelectionViews(void *a1, const char *a2, ...)
{
  return _[a1 _layoutSelectionViews];
}

id objc_msgSend__loadGlobalPreviews(void *a1, const char *a2, ...)
{
  return _[a1 _loadGlobalPreviews];
}

id objc_msgSend__loadGlobalSettings(void *a1, const char *a2, ...)
{
  return _[a1 _loadGlobalSettings];
}

id objc_msgSend__loadSections(void *a1, const char *a2, ...)
{
  return _[a1 _loadSections];
}

id objc_msgSend__loadSortingOrderByNotificationsReceivedIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _loadSortingOrderByNotificationsReceivedIfNecessary];
}

id objc_msgSend__locationViewForGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locationViewForGestureRecognizer:");
}

id objc_msgSend__lockScreenAppearanceSettingsSpecifiersForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lockScreenAppearanceSettingsSpecifiersForSectionInfo:");
}

id objc_msgSend__newSelectionLabelIsEncapsulated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectionLabelIsEncapsulated:");
}

id objc_msgSend__notificationDeliverySettingGroupSpecifiersForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notificationDeliverySettingGroupSpecifiersForSectionInfo:");
}

id objc_msgSend__notificationGroupingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notificationGroupingSpecifierForSectionInfo:");
}

id objc_msgSend__notificationListDisplayStyleSettingForSelectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notificationListDisplayStyleSettingForSelectionType:");
}

id objc_msgSend__notifyObserversOfSettingsChangeWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyObserversOfSettingsChangeWithBlock:");
}

id objc_msgSend__numberOfNotificationsForSectionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberOfNotificationsForSectionIdentifier:");
}

id objc_msgSend__orderedGlobalScheduledDeliveryTimes(void *a1, const char *a2, ...)
{
  return _[a1 _orderedGlobalScheduledDeliveryTimes];
}

id objc_msgSend__parentViewForCountBar(void *a1, const char *a2, ...)
{
  return _[a1 _parentViewForCountBar];
}

id objc_msgSend__populateDigestTimeSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _populateDigestTimeSpecifiers];
}

id objc_msgSend__primaryUnreadSpecifierWithSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_primaryUnreadSpecifierWithSectionInfo:");
}

id objc_msgSend__reallyLoadSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reallyLoadSections:");
}

id objc_msgSend__reloadSections(void *a1, const char *a2, ...)
{
  return _[a1 _reloadSections];
}

id objc_msgSend__rememberPreviousSettingSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _rememberPreviousSettingSpecifier];
}

id objc_msgSend__remoteNotificationsSettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteNotificationsSettingSpecifierForSectionInfo:");
}

id objc_msgSend__removeScheduledTimeAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeScheduledTimeAtIndexPath:");
}

id objc_msgSend__replaceScheduleDigestTime_withNewDigestTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_replaceScheduleDigestTime:withNewDigestTime:");
}

id objc_msgSend__scaledImageForImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledImageForImage:");
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledValueForValue:");
}

id objc_msgSend__scheduleDeliveryTimesSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleDeliveryTimesSpecifiers];
}

id objc_msgSend__scheduleTimeLabelForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleTimeLabelForIndex:");
}

id objc_msgSend__scheduledDeliverySwitchSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _scheduledDeliverySwitchSpecifiers];
}

id objc_msgSend__sectionContentInset(void *a1, const char *a2, ...)
{
  return _[a1 _sectionContentInset];
}

id objc_msgSend__sectionForScheduleTimes(void *a1, const char *a2, ...)
{
  return _[a1 _sectionForScheduleTimes];
}

id objc_msgSend__selectionImageViewTintColorSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectionImageViewTintColorSelected:");
}

id objc_msgSend__selectionLabelLayoutRectForRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectionLabelLayoutRectForRect:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCornerRadius:");
}

id objc_msgSend__setFirstLineBaselineFrameOriginY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFirstLineBaselineFrameOriginY:");
}

id objc_msgSend__setGlobalScheduledDeliveryEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGlobalScheduledDeliveryEnabled:");
}

id objc_msgSend__setGlobalScheduledDeliveryTimes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGlobalScheduledDeliveryTimes:");
}

id objc_msgSend__setIsTemplateViewForSizing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIsTemplateViewForSizing:");
}

id objc_msgSend__setSpokenOptionSelectedSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSpokenOptionSelectedSpecifier:");
}

id objc_msgSend__setTextEncapsulation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTextEncapsulation:");
}

id objc_msgSend__setValue_notificationType_forSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setValue:notificationType:forSectionInfo:");
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__shouldShowSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowSection:");
}

id objc_msgSend__showNextSummarySwitchSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _showNextSummarySwitchSpecifiers];
}

id objc_msgSend__signalDelegateSettingsChanged(void *a1, const char *a2, ...)
{
  return _[a1 _signalDelegateSettingsChanged];
}

id objc_msgSend__silenceNewMessagesSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _silenceNewMessagesSpecifier];
}

id objc_msgSend__siriPreferencesDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _siriPreferencesDidChange];
}

id objc_msgSend__sortedSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortedSections:");
}

id objc_msgSend__soundSettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_soundSettingSpecifierForSectionInfo:");
}

id objc_msgSend__specifierForAddNewScheduledTime(void *a1, const char *a2, ...)
{
  return _[a1 _specifierForAddNewScheduledTime];
}

id objc_msgSend__specifiersForAnnounceDestinations(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForAnnounceDestinations];
}

id objc_msgSend__spokenNoOptionsGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _spokenNoOptionsGroupSpecifier];
}

id objc_msgSend__spokenNotificationsSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_spokenNotificationsSpecifierForSectionInfo:");
}

id objc_msgSend__spokenOptionsAllSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _spokenOptionsAllSpecifier];
}

id objc_msgSend__spokenOptionsGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _spokenOptionsGroupSpecifier];
}

id objc_msgSend__spokenOptionsTimeSensitiveSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _spokenOptionsTimeSensitiveSpecifier];
}

id objc_msgSend__summarizationSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_summarizationSpecifierForSectionInfo:");
}

id objc_msgSend__swapSelectionLabelsOnToggledSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_swapSelectionLabelsOnToggledSelected:");
}

id objc_msgSend__timeSensitiveSettingSpecifierForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeSensitiveSettingSpecifierForSectionInfo:");
}

id objc_msgSend__typeImageViewTintColorSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_typeImageViewTintColorSelected:");
}

id objc_msgSend__unreadBadgeGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _unreadBadgeGroupSpecifier];
}

id objc_msgSend__updateAllowedStateForSectionInfo_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAllowedStateForSectionInfo:animated:");
}

id objc_msgSend__updateAllowedStateForSectionInfo_animated_forSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAllowedStateForSectionInfo:animated:forSpecifiers:");
}

id objc_msgSend__updateAnnounceNotificationsInCarPlayTemporarilyDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnnounceNotificationsInCarPlayTemporarilyDisabled:");
}

id objc_msgSend__updateAnnounceOptionsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnnounceOptionsAnimated:");
}

id objc_msgSend__updateAnnounceOptionsGroupSpecifiersAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnnounceOptionsGroupSpecifiersAnimated:");
}

id objc_msgSend__updateAnnounceSwitchGroupSpecifierAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnnounceSwitchGroupSpecifierAnimated:");
}

id objc_msgSend__updateBadgeSettingsForSpecifier_enabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBadgeSettingsForSpecifier:enabled:");
}

id objc_msgSend__updateBannerStyleForSectionInfo_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBannerStyleForSectionInfo:animated:");
}

id objc_msgSend__updateBannerStyleForSectionInfo_animated_forSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBannerStyleForSectionInfo:animated:forSpecifiers:");
}

id objc_msgSend__updateCarPlayAnnounceEnablementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCarPlayAnnounceEnablementType:");
}

id objc_msgSend__updateOptionsGroupSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _updateOptionsGroupSpecifiers];
}

id objc_msgSend__updateSpecifiersWithSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSpecifiersWithSectionInfo:");
}

id objc_msgSend__updateStoredSectionsWithSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateStoredSectionsWithSectionInfo:");
}

id objc_msgSend__updatesForSpecifiers_withGlobalAnnouncesState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatesForSpecifiers:withGlobalAnnouncesState:animated:");
}

id objc_msgSend__updatesForSpecifiers_withGlobalScheduledDeliverySetting_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatesForSpecifiers:withGlobalScheduledDeliverySetting:animated:");
}

id objc_msgSend__updatesForSpecifiers_withGlobalSummarizationSetting_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatesForSpecifiers:withGlobalSummarizationSetting:animated:");
}

id objc_msgSend__usedRect(void *a1, const char *a2, ...)
{
  return _[a1 _usedRect];
}

id objc_msgSend__valueOfNotificationType_forSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_valueOfNotificationType:forSectionInfo:");
}

id objc_msgSend__widthForCountBarView(void *a1, const char *a2, ...)
{
  return _[a1 _widthForCountBarView];
}

id objc_msgSend_accessibilityContrast(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityContrast];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeSectionInfo(void *a1, const char *a2, ...)
{
  return _[a1 activeSectionInfo];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addMonitor_subjectMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMonitor:subjectMask:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSpecifiersFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSpecifiersFromArray:");
}

id objc_msgSend_addSpecifiersFromArray_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSpecifiersFromArray:animated:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertType(void *a1, const char *a2, ...)
{
  return _[a1 alertType];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allowsNotifications(void *a1, const char *a2, ...)
{
  return _[a1 allowsNotifications];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_announceCarPlayEnabled(void *a1, const char *a2, ...)
{
  return _[a1 announceCarPlayEnabled];
}

id objc_msgSend_announceNotificationsInCarPlayTemporarilyDisabled(void *a1, const char *a2, ...)
{
  return _[a1 announceNotificationsInCarPlayTemporarilyDisabled];
}

id objc_msgSend_announceNotificationsOnHearingAidsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 announceNotificationsOnHearingAidsEnabled];
}

id objc_msgSend_announceNotificationsOnHearingAidsSupported(void *a1, const char *a2, ...)
{
  return _[a1 announceNotificationsOnHearingAidsSupported];
}

id objc_msgSend_announceSetting(void *a1, const char *a2, ...)
{
  return _[a1 announceSetting];
}

id objc_msgSend_appDetailControllerWillDisappear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appDetailControllerWillDisappear:");
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return _[a1 appName];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return _[a1 appState];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applicationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWithBundleIdentifier:");
}

id objc_msgSend_appsSortedByNotificationsReceivedInPreviousNumDaysRaw_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appsSortedByNotificationsReceivedInPreviousNumDaysRaw:completionHandler:");
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

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assistantEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistantEnabled];
}

id objc_msgSend_authorizationExpirationDate(void *a1, const char *a2, ...)
{
  return _[a1 authorizationExpirationDate];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _[a1 authorizationStatus];
}

id objc_msgSend_bannerSetting(void *a1, const char *a2, ...)
{
  return _[a1 bannerSetting];
}

id objc_msgSend_bb_toneLibraryAlertTypeForSectionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bb_toneLibraryAlertTypeForSectionID:");
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

id objc_msgSend_bs_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_filter:");
}

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_firstObjectPassingTest:");
}

id objc_msgSend_bs_reverse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_reverse");
}

id objc_msgSend_bs_safeAddObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_safeAddObject:");
}

id objc_msgSend_bulletinGroupingSetting(void *a1, const char *a2, ...)
{
  return _[a1 bulletinGroupingSetting];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return _[a1 bundlePath];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_cachedAnnounceNotificationsInCarPlayTemporarilyDisabled(void *a1, const char *a2, ...)
{
  return _[a1 cachedAnnounceNotificationsInCarPlayTemporarilyDisabled];
}

id objc_msgSend_cachedCarPlayAnnounceEnablementType(void *a1, const char *a2, ...)
{
  return _[a1 cachedCarPlayAnnounceEnablementType];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _[a1 calendar];
}

id objc_msgSend_carPlayAnnounceEnablementType(void *a1, const char *a2, ...)
{
  return _[a1 carPlayAnnounceEnablementType];
}

id objc_msgSend_carPlaySetting(void *a1, const char *a2, ...)
{
  return _[a1 carPlaySetting];
}

id objc_msgSend_clearAnnounceNotificationsInCarPlayTemporarilyDisabled(void *a1, const char *a2, ...)
{
  return _[a1 clearAnnounceNotificationsInCarPlayTemporarilyDisabled];
}

id objc_msgSend_clearSpokenNotificationTemporarilyDisabledStatus(void *a1, const char *a2, ...)
{
  return _[a1 clearSpokenNotificationTemporarilyDisabledStatus];
}

id objc_msgSend_cmasAlertsValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cmasAlertsValue:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configurationWithTextStyle_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithTextStyle:scale:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentPreviewSetting(void *a1, const char *a2, ...)
{
  return _[a1 contentPreviewSetting];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
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

id objc_msgSend_criticalAlertSetting(void *a1, const char *a2, ...)
{
  return _[a1 criticalAlertSetting];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 currentSpecifiers];
}

id objc_msgSend_currentToneIdentifierForAlertType_topic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentToneIdentifierForAlertType:topic:");
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 currentTraitCollection];
}

id objc_msgSend_currentVibrationIdentifierForAlertType_topic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentVibrationIdentifierForAlertType:topic:");
}

id objc_msgSend_currentWithUseCaseIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentWithUseCaseIdentifiers:");
}

id objc_msgSend_customSettingsBundle(void *a1, const char *a2, ...)
{
  return _[a1 customSettingsBundle];
}

id objc_msgSend_customSettingsDetailControllerClass(void *a1, const char *a2, ...)
{
  return _[a1 customSettingsDetailControllerClass];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFormatFromTemplate_options_locale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFormatFromTemplate:options:locale:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_detailControllerClass(void *a1, const char *a2, ...)
{
  return _[a1 detailControllerClass];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 deviceClass];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAcceptEnteredPIN(void *a1, const char *a2, ...)
{
  return _[a1 didAcceptEnteredPIN];
}

id objc_msgSend_didCancelEnteringPIN(void *a1, const char *a2, ...)
{
  return _[a1 didCancelEnteringPIN];
}

id objc_msgSend_didChangeSettingForSpokenCarPlayNotificationsDetailController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeSettingForSpokenCarPlayNotificationsDetailController:");
}

id objc_msgSend_didChangeSettingForSpokenNotificationsAppDetailController_withSpecifierIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeSettingForSpokenNotificationsAppDetailController:withSpecifierIdentifier:");
}

id objc_msgSend_directMessagesSetting(void *a1, const char *a2, ...)
{
  return _[a1 directMessagesSetting];
}

id objc_msgSend_disableAssistantWhilePasscodeLocked(void *a1, const char *a2, ...)
{
  return _[a1 disableAssistantWhilePasscodeLocked];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_drawAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawAtPoint:");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_effectiveGlobalAnnounceCarPlaySetting(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGlobalAnnounceCarPlaySetting];
}

id objc_msgSend_effectiveGlobalAnnounceHeadphonesSetting(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGlobalAnnounceHeadphonesSetting];
}

id objc_msgSend_effectiveGlobalAnnounceSetting(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGlobalAnnounceSetting];
}

id objc_msgSend_effectiveGlobalContentPreviewsSetting(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGlobalContentPreviewsSetting];
}

id objc_msgSend_effectiveGlobalHighlightsSetting(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGlobalHighlightsSetting];
}

id objc_msgSend_effectiveGlobalNotificationListDisplayStyleSetting(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGlobalNotificationListDisplayStyleSetting];
}

id objc_msgSend_effectiveGlobalScheduledDeliverySetting(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGlobalScheduledDeliverySetting];
}

id objc_msgSend_effectiveGlobalScheduledDeliveryShowNextSummarySetting(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGlobalScheduledDeliveryShowNextSummarySetting];
}

id objc_msgSend_effectiveGlobalScheduledDeliveryTimes(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGlobalScheduledDeliveryTimes];
}

id objc_msgSend_effectiveGlobalSummarizationSetting(void *a1, const char *a2, ...)
{
  return _[a1 effectiveGlobalSummarizationSetting];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_emitNavigationEventForAppDetailController(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEventForAppDetailController];
}

id objc_msgSend_emitNavigationEventForRootController(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEventForRootController];
}

id objc_msgSend_emitNavigationEventForSpecifier_viewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitNavigationEventForSpecifier:viewController:");
}

id objc_msgSend_emptyCell(void *a1, const char *a2, ...)
{
  return _[a1 emptyCell];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_featureIsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 featureIsAvailable];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:");
}

id objc_msgSend_getAnnounceNotificationsInCarPlayTypeWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAnnounceNotificationsInCarPlayTypeWithCompletion:");
}

id objc_msgSend_globalAnnounceCarPlaySetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "globalAnnounceCarPlaySetting:");
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _[a1 grayColor];
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_hasLoadedSortOrderByNumberOfNotifications(void *a1, const char *a2, ...)
{
  return _[a1 hasLoadedSortOrderByNumberOfNotifications];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_highlighted(void *a1, const char *a2, ...)
{
  return _[a1 highlighted];
}

id objc_msgSend_homeButtonType(void *a1, const char *a2, ...)
{
  return _[a1 homeButtonType];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return _[a1 icon];
}

id objc_msgSend_iconData(void *a1, const char *a2, ...)
{
  return _[a1 iconData];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return _[a1 imageData];
}

id objc_msgSend_imageName(void *a1, const char *a2, ...)
{
  return _[a1 imageName];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_imagePath(void *a1, const char *a2, ...)
{
  return _[a1 imagePath];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:scale:orientation:");
}

id objc_msgSend_imageWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithContentsOfFile:");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_imageWithTintColor_renderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithTintColor:renderingMode:");
}

id objc_msgSend_impactOccurred(void *a1, const char *a2, ...)
{
  return _[a1 impactOccurred];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexOfSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifier:");
}

id objc_msgSend_indexOfSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifierWithID:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForSpecifier:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithCGImage_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCGImage:scale:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithImages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImages:");
}

id objc_msgSend_initWithKey_defaultValue_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:defaultValue:table:locale:bundleURL:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSize_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:scale:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_insertContiguousSpecifiers_afterSpecifierID_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertContiguousSpecifiers:afterSpecifierID:animated:");
}

id objc_msgSend_insertContiguousSpecifiers_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertContiguousSpecifiers:atIndex:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertSpecifier_afterSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:afterSpecifierWithID:");
}

id objc_msgSend_insertSpecifier_atEndOfGroup_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:atEndOfGroup:animated:");
}

id objc_msgSend_insertSpecifier_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:atIndex:");
}

id objc_msgSend_insertSpecifier_atIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:atIndex:animated:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isAnnounceEnabledForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAnnounceEnabledForSectionInfo:");
}

id objc_msgSend_isAppClip(void *a1, const char *a2, ...)
{
  return _[a1 isAppClip];
}

id objc_msgSend_isApplicationHiddenForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isApplicationHiddenForSectionInfo:");
}

id objc_msgSend_isAuthorizedTemporarily(void *a1, const char *a2, ...)
{
  return _[a1 isAuthorizedTemporarily];
}

id objc_msgSend_isBoolSettingLockedDownByRestrictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBoolSettingLockedDownByRestrictions:");
}

id objc_msgSend_isDeliveredQuietly(void *a1, const char *a2, ...)
{
  return _[a1 isDeliveredQuietly];
}

id objc_msgSend_isDirectMessagesAnnounceSupportedForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDirectMessagesAnnounceSupportedForSectionInfo:");
}

id objc_msgSend_isEffectiveGlobalScheduledDeliverySettingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEffectiveGlobalScheduledDeliverySettingEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSection:");
}

id objc_msgSend_isEqualToSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSpecifier:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isGlobalScheduledDeliveryEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isGlobalScheduledDeliveryEnabled];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return _[a1 isLocked];
}

id objc_msgSend_isNotificationsModificationAllowedForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotificationsModificationAllowedForBundleID:");
}

id objc_msgSend_isOrderedByNumberOfNotifications(void *a1, const char *a2, ...)
{
  return _[a1 isOrderedByNumberOfNotifications];
}

id objc_msgSend_isPopulatingDigestTimeSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 isPopulatingDigestTimeSpecifiers];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return _[a1 isRestricted];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isTimeSensitiveAnnounceSupportedForSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTimeSensitiveAnnounceSupportedForSectionInfo:");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 layoutDirection];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromNumber_numberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromNumber:numberStyle:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_lockScreenSetting(void *a1, const char *a2, ...)
{
  return _[a1 lockScreenSetting];
}

id objc_msgSend_mailTopicDetailControllerWillDisappear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mailTopicDetailControllerWillDisappear:");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mapTableWithWeakToWeakObjects(void *a1, const char *a2, ...)
{
  return _[a1 mapTableWithWeakToWeakObjects];
}

id objc_msgSend_maximumAverageNumberOfNotifications(void *a1, const char *a2, ...)
{
  return _[a1 maximumAverageNumberOfNotifications];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _[a1 minute];
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameForToneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameForToneIdentifier:");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationControllerWithOnboardingDelegate_deferButtonText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationControllerWithOnboardingDelegate:deferButtonText:");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_nc_effectiveAnnounceSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nc_effectiveAnnounceSetting");
}

id objc_msgSend_nc_settingsIconImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nc_settingsIconImage");
}

id objc_msgSend_notificationCenterSetting(void *a1, const char *a2, ...)
{
  return _[a1 notificationCenterSetting];
}

id objc_msgSend_notificationListDisplayStyleSelectionImageForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationListDisplayStyleSelectionImageForType:");
}

id objc_msgSend_notificationListDisplayStyleSelectionImageNameForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationListDisplayStyleSelectionImageNameForType:");
}

id objc_msgSend_notificationListDisplayStyleSelectionLabelTitleForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationListDisplayStyleSelectionLabelTitleForType:");
}

id objc_msgSend_notificationListDisplayStyleSelectionViewDidGetSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationListDisplayStyleSelectionViewDidGetSelected:");
}

id objc_msgSend_notificationListDisplayStyleSelectionViewOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationListDisplayStyleSelectionViewOfType:");
}

id objc_msgSend_numBasicNotifications(void *a1, const char *a2, ...)
{
  return _[a1 numBasicNotifications];
}

id objc_msgSend_numberOfDaysForNotificationCount(void *a1, const char *a2, ...)
{
  return _[a1 numberOfDaysForNotificationCount];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
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

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_orderedDigestTimeSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 orderedDigestTimeSpecifiers];
}

id objc_msgSend_orderedScheduledDeliveryTimes(void *a1, const char *a2, ...)
{
  return _[a1 orderedScheduledDeliveryTimes];
}

id objc_msgSend_parentSection(void *a1, const char *a2, ...)
{
  return _[a1 parentSection];
}

id objc_msgSend_pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_performGetter(void *a1, const char *a2, ...)
{
  return _[a1 performGetter];
}

id objc_msgSend_performSetterWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSetterWithValue:");
}

id objc_msgSend_performSpecifierUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSpecifierUpdates:");
}

id objc_msgSend_pointInside_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointInside:withEvent:");
}

id objc_msgSend_popToViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToViewController:animated:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFont(void *a1, const char *a2, ...)
{
  return _[a1 preferredFont];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredHeight(void *a1, const char *a2, ...)
{
  return _[a1 preferredHeight];
}

id objc_msgSend_preferredHeightInWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredHeightInWidth:");
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return _[a1 prepare];
}

id objc_msgSend_prepareImageForDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareImageForDescriptor:");
}

id objc_msgSend_presentAssistantEnableAlertForState_presentingViewController_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAssistantEnableAlertForState:presentingViewController:actionHandler:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_priorityNotificationsDetailController_didUpdateSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priorityNotificationsDetailController:didUpdateSetting:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_pushSettings(void *a1, const char *a2, ...)
{
  return _[a1 pushSettings];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rankedDigestSetupResponses(void *a1, const char *a2, ...)
{
  return _[a1 rankedDigestSetupResponses];
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

id objc_msgSend_remoteNotificationsSetting(void *a1, const char *a2, ...)
{
  return _[a1 remoteNotificationsSetting];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeContiguousSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContiguousSpecifiers:");
}

id objc_msgSend_removeContiguousSpecifiers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContiguousSpecifiers:animated:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifier:");
}

id objc_msgSend_removeSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifier:animated:");
}

id objc_msgSend_removeSpecifierAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifierAtIndex:");
}

id objc_msgSend_removeSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifierID:");
}

id objc_msgSend_removeSpecifierID_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifierID:animated:");
}

id objc_msgSend_removeSpecifiersInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifiersInRange:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scheduledDeliverySetting(void *a1, const char *a2, ...)
{
  return _[a1 scheduledDeliverySetting];
}

id objc_msgSend_scheduledDeliverySettingsControllerDidChangeGlobalScheduledDeliverySettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledDeliverySettingsControllerDidChangeGlobalScheduledDeliverySettings:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sectionID(void *a1, const char *a2, ...)
{
  return _[a1 sectionID];
}

id objc_msgSend_sectionInfoForSectionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionInfoForSectionID:");
}

id objc_msgSend_sectionInfoSettings(void *a1, const char *a2, ...)
{
  return _[a1 sectionInfoSettings];
}

id objc_msgSend_sectionsOrderedByInOutState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionsOrderedByInOutState:");
}

id objc_msgSend_selected(void *a1, const char *a2, ...)
{
  return _[a1 selected];
}

id objc_msgSend_selectionImageView(void *a1, const char *a2, ...)
{
  return _[a1 selectionImageView];
}

id objc_msgSend_selectionType(void *a1, const char *a2, ...)
{
  return _[a1 selectionType];
}

id objc_msgSend_selectionViews(void *a1, const char *a2, ...)
{
  return _[a1 selectionViews];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_setAccessibilityTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityTraits:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAdjustsImageSizeForAccessibilityContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsImageSizeForAccessibilityContentSizeCategory:");
}

id objc_msgSend_setAlertType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlertType:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setAllowsNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsNotifications:");
}

id objc_msgSend_setAllowsSelectionDuringEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSelectionDuringEditing:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimated:");
}

id objc_msgSend_setAnnounceNotificationsInCarPlayTemporarilyDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnounceNotificationsInCarPlayTemporarilyDisabled:");
}

id objc_msgSend_setAnnounceNotificationsInCarPlayType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnounceNotificationsInCarPlayType:");
}

id objc_msgSend_setAnnounceNotificationsOnBuiltInSpeakerEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnounceNotificationsOnBuiltInSpeakerEnabled:");
}

id objc_msgSend_setAnnounceNotificationsOnHearingAidsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnounceNotificationsOnHearingAidsEnabled:");
}

id objc_msgSend_setAnnounceSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnounceSetting:");
}

id objc_msgSend_setAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppearance:");
}

id objc_msgSend_setArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArray:");
}

id objc_msgSend_setAuthorizationStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthorizationStatus:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBannerSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerSetting:");
}

id objc_msgSend_setBulletinGroupingSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBulletinGroupingSetting:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setCachedAnnounceNotificationsInCarPlayTemporarilyDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedAnnounceNotificationsInCarPlayTemporarilyDisabled:");
}

id objc_msgSend_setCachedCarPlayAnnounceEnablementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedCarPlayAnnounceEnablementType:");
}

id objc_msgSend_setCancelPastAllowableMovement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelPastAllowableMovement:");
}

id objc_msgSend_setCarPlayAnnounceEnablementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarPlayAnnounceEnablementType:");
}

id objc_msgSend_setCarPlaySetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarPlaySetting:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setConfirmationAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationAction:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentPreviewSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentPreviewSetting:");
}

id objc_msgSend_setContrast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContrast:");
}

id objc_msgSend_setControllerLoadAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControllerLoadAction:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCriticalAlertSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCriticalAlertSetting:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDatePickerMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatePickerMode:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDirectMessagesSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectMessagesSetting:");
}

id objc_msgSend_setDisableAssistantWhilePasscodeLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableAssistantWhilePasscodeLocked:");
}

id objc_msgSend_setDrawBorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDrawBorder:");
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:animated:");
}

id objc_msgSend_setEffectiveGlobalAnnounceCarPlaySetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectiveGlobalAnnounceCarPlaySetting:");
}

id objc_msgSend_setEffectiveGlobalAnnounceHeadphonesSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectiveGlobalAnnounceHeadphonesSetting:");
}

id objc_msgSend_setEffectiveGlobalAnnounceSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectiveGlobalAnnounceSetting:");
}

id objc_msgSend_setEffectiveGlobalContentPreviewsSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectiveGlobalContentPreviewsSetting:");
}

id objc_msgSend_setEffectiveGlobalHighlightsSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectiveGlobalHighlightsSetting:");
}

id objc_msgSend_setEffectiveGlobalNotificationListDisplayStyleSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectiveGlobalNotificationListDisplayStyleSetting:");
}

id objc_msgSend_setEffectiveGlobalScheduledDeliverySetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectiveGlobalScheduledDeliverySetting:");
}

id objc_msgSend_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:");
}

id objc_msgSend_setEffectiveGlobalScheduledDeliveryTimes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectiveGlobalScheduledDeliveryTimes:");
}

id objc_msgSend_setEffectiveGlobalSummarizationSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffectiveGlobalSummarizationSetting:");
}

id objc_msgSend_setEmptyCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmptyCell:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGlobalScheduledDeliveryEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlobalScheduledDeliveryEnabled:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setLanguageDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguageDirection:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setLoadedSortOrderByNumberOfNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadedSortOrderByNumberOfNotifications:");
}

id objc_msgSend_setLocalizedDateFormatFromTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedDateFormatFromTemplate:");
}

id objc_msgSend_setLockScreenSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockScreenSetting:");
}

id objc_msgSend_setMaximumAverageNumberOfNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumAverageNumberOfNotifications:");
}

id objc_msgSend_setMinimumPressDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumPressDuration:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNotificationCenterSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCenterSetting:");
}

id objc_msgSend_setNotificationTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationTypes:");
}

id objc_msgSend_setNumberOfDaysForNotificationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfDaysForNotificationCount:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObserverFeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObserverFeed:");
}

id objc_msgSend_setOn_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOn:animated:");
}

id objc_msgSend_setOrderedByNumberOfNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrderedByNumberOfNotifications:");
}

id objc_msgSend_setOrderedDigestTimeSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrderedDigestTimeSpecifiers:");
}

id objc_msgSend_setPlatterSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlatterSize:");
}

id objc_msgSend_setPopulatingDigestTimeSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPopulatingDigestTimeSpecifiers:");
}

id objc_msgSend_setPreferredDatePickerStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredDatePickerStyle:");
}

id objc_msgSend_setPreferredSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredSymbolConfiguration:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setPushSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPushSettings:");
}

id objc_msgSend_setRankedDigestSetupResponses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRankedDigestSetupResponses:");
}

id objc_msgSend_setRemoteNotificationsSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteNotificationsSetting:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScale:");
}

id objc_msgSend_setScheduledDeliverySetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheduledDeliverySetting:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setSectionInfo_forSectionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionInfo:forSectionID:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setSelected_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:animated:");
}

id objc_msgSend_setSelectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionType:");
}

id objc_msgSend_setShape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShape:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiers:");
}

id objc_msgSend_setSpokenNotificationSkipTriggerlessReplyConfirmation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpokenNotificationSkipTriggerlessReplyConfirmation:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSummarizationSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSummarizationSetting:");
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

id objc_msgSend_setTimeSensitiveSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeSensitiveSetting:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUrlResourceDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrlResourceDictionary:");
}

id objc_msgSend_setUserConfiguredTimeSensitiveSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserConfiguredTimeSensitiveSetting:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValues_titles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:titles:");
}

id objc_msgSend_settingsGateway_didUpdateSectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsGateway:didUpdateSectionInfo:");
}

id objc_msgSend_settingsGatewayDidUpdateGlobalSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsGatewayDidUpdateGlobalSettings:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_sharedToneManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedToneManager];
}

id objc_msgSend_sharedVibrationManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedVibrationManager];
}

id objc_msgSend_showsCustomSettingsLink(void *a1, const char *a2, ...)
{
  return _[a1 showsCustomSettingsLink];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifierForSubsectionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForSubsectionInfo:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_specifiersForSubsectionInfos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersForSubsectionInfos:");
}

id objc_msgSend_spokenCarPlayNotificationSpecifierNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spokenCarPlayNotificationSpecifierNamed:");
}

id objc_msgSend_spokenNotificationSkipTriggerlessReplyConfirmation(void *a1, const char *a2, ...)
{
  return _[a1 spokenNotificationSkipTriggerlessReplyConfirmation];
}

id objc_msgSend_spokenNotificationsDetailListController_didChangeGlobalSpokenNotificationSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spokenNotificationsDetailListController:didChangeGlobalSpokenNotificationSetting:");
}

id objc_msgSend_spokenNotificationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spokenNotificationsEnabled:");
}

id objc_msgSend_spokenNotificationsSpecifierNamed_sectionInfo_showIcon_class_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spokenNotificationsSpecifierNamed:sectionInfo:showIcon:class:");
}

id objc_msgSend_startInParentVC_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startInParentVC:options:completion:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subjectMonitorRegistry(void *a1, const char *a2, ...)
{
  return _[a1 subjectMonitorRegistry];
}

id objc_msgSend_subsectionID(void *a1, const char *a2, ...)
{
  return _[a1 subsectionID];
}

id objc_msgSend_subsections(void *a1, const char *a2, ...)
{
  return _[a1 subsections];
}

id objc_msgSend_summarizationSetting(void *a1, const char *a2, ...)
{
  return _[a1 summarizationSetting];
}

id objc_msgSend_summarizePreviewsDetailController_didChangeGlobalSummarizePreviewsSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "summarizePreviewsDetailController:didChangeGlobalSummarizePreviewsSetting:");
}

id objc_msgSend_summarizePreviewsDetailController_shouldShowSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "summarizePreviewsDetailController:shouldShowSection:");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_suppressFromSettings(void *a1, const char *a2, ...)
{
  return _[a1 suppressFromSettings];
}

id objc_msgSend_suppressedSettings(void *a1, const char *a2, ...)
{
  return _[a1 suppressedSettings];
}

id objc_msgSend_syncFetchAllVehiclesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncFetchAllVehiclesWithCompletion:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemGray3Color(void *a1, const char *a2, ...)
{
  return _[a1 systemGray3Color];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return _[a1 systemYellowColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_tableView_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:cellForRowAtIndexPath:");
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 tertiaryLabelColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeSensitiveSetting(void *a1, const char *a2, ...)
{
  return _[a1 timeSensitiveSetting];
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

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateForUserInterfaceStyleChange(void *a1, const char *a2, ...)
{
  return _[a1 updateForUserInterfaceStyleChange];
}

id objc_msgSend_updatesWithSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesWithSpecifiers:");
}

id objc_msgSend_urlResourceDictionary(void *a1, const char *a2, ...)
{
  return _[a1 urlResourceDictionary];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}