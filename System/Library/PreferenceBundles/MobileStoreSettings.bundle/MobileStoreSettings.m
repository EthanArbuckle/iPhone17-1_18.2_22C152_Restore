uint64_t static MarketplaceKitWrapper.setShouldShowInstallConfirmations(for:shouldShow:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  uint64_t v9;

  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_5AAC;
  return static AppDistributor.setShouldShowInstallConfirmations(for:shouldShow:)(a1, a2, a3);
}

uint64_t sub_4250(int a1, uint64_t a2, void *aBlock)
{
  v3[2] = _Block_copy(aBlock);
  uint64_t v5 = sub_DB90();
  uint64_t v7 = v6;
  v3[3] = v6;
  v8 = (void *)swift_task_alloc();
  v3[4] = v8;
  void *v8 = v3;
  v8[1] = sub_431C;
  return static AppDistributor.setShouldShowInstallConfirmations(for:shouldShow:)(v5, v7, a2);
}

uint64_t sub_431C()
{
  v1 = *(void (***)(void))(*v0 + 16);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  v1[2](v1);
  _Block_release(v1);
  v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t static MarketplaceKitWrapper.shouldShowInstallConfirmations(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_5AA8;
  return static AppDistributor.shouldShowInstallConfirmations(for:)(a1, a2);
}

uint64_t sub_4670(int a1, void *aBlock)
{
  v2[2] = _Block_copy(aBlock);
  uint64_t v3 = sub_DB90();
  uint64_t v5 = v4;
  v2[3] = v4;
  uint64_t v6 = (void *)swift_task_alloc();
  v2[4] = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_472C;
  return static AppDistributor.shouldShowInstallConfirmations(for:)(v3, v5);
}

uint64_t sub_472C(char a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  v3[2](v3, a1 & 1);
  _Block_release(v3);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t static MarketplaceKitWrapper.shouldShowAppInstallationSettings()()
{
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_4908;
  return static AppDistributor.shouldShowAppInstallationSettings()();
}

uint64_t sub_4908(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_4B64(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_4BFC;
  return static AppDistributor.shouldShowAppInstallationSettings()();
}

uint64_t sub_4BFC(char a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  v3[2](v3, a1 & 1);
  _Block_release(v3);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

id MarketplaceKitWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id MarketplaceKitWrapper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MarketplaceKitWrapper();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for MarketplaceKitWrapper()
{
  return self;
}

id MarketplaceKitWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MarketplaceKitWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_4E50(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_4E94()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_4ECC()
{
  objc_super v2 = *(const void **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_4F78;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_19DA8 + dword_19DA8);
  return v4(v2);
}

uint64_t sub_4F78()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_506C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_5AAC;
  return v6();
}

uint64_t sub_513C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_5AAC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_19DB8 + dword_19DB8);
  return v6(v2, v3, v4);
}

uint64_t sub_51FC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_5AAC;
  return v7();
}

uint64_t sub_52CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_5AAC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_19DC8 + dword_19DC8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_5398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_DBC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_DBB0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_553C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_DBA0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_553C(uint64_t a1)
{
  uint64_t v2 = sub_4E50(&qword_19DA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_559C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_5678;
  return v6(a1);
}

uint64_t sub_5678()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_5770()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_57A8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_4F78;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_19DD8 + dword_19DD8);
  return v6(a1, v4);
}

uint64_t sub_5860()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_58A0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_5AAC;
  uint64_t v5 = (uint64_t (*)(int, void *))((char *)&dword_19DE8 + dword_19DE8);
  return v5(v2, v3);
}

uint64_t sub_595C()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_599C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_5AAC;
  uint64_t v6 = (uint64_t (*)(int, uint64_t, void *))((char *)&dword_19E08 + dword_19E08);
  return v6(v2, v3, v4);
}

uint64_t sub_5A68()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_697C(id *a1)
{
  if (!a1[23])
  {
    id v2 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:7];
    id v3 = a1[23];
    a1[23] = v2;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = +[LSApplicationRecord enumeratorWithOptions:0];
    id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (+[ASDUpdatesService isAutomaticUpdateAuthorizationRequiredWhenEnabledForAppWithRecord:v9])
          {
            uint64_t v10 = [v9 bundleIdentifier];
            uint64_t v11 = [v9 localizedName];
            v12 = (void *)v11;
            if (v10) {
              BOOL v13 = v11 == 0;
            }
            else {
              BOOL v13 = 1;
            }
            if (!v13) {
              [a1[23] setObject:v11 forKeyedSubscript:v10];
            }
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  id v14 = [a1 specifiers];
  objc_msgSend(a1, "setSpecifiers:");
}

char *sub_6BA8(char *result, int a2)
{
  if (result)
  {
    id v3 = result;
    uint64_t v4 = *(void **)&result[OBJC_IVAR___PSListController__specifiers];
    *(void *)&result[OBJC_IVAR___PSListController__specifiers] = 0;

    if (a2)
    {
      id v5 = (void *)*((void *)v3 + 25);
      *((void *)v3 + 25) = 0;
    }
    sub_697C((id *)v3);
    uint64_t result = (char *)[*((id *)v3 + 23) count];
    if (result)
    {
      return (char *)_[v3 reloadSpecifiers];
    }
  }
  return result;
}

void sub_6E94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 184))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_6F44;
    v4[3] = &unk_148E0;
    v4[4] = v1;
    id v3 = *(void **)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    [v3 enumerateObjectsUsingBlock:v4];
    sub_6BA8(*(char **)(a1 + 32), 1);
  }
}

void sub_6F44(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  [*(id *)(*(void *)(a1 + 32) + 184) setObject:v7 forKeyedSubscript:v6];
}

char *sub_7178(uint64_t a1)
{
  uint64_t result = (char *)[*(id *)(*(void *)(a1 + 32) + 184) count];
  if (result)
  {
    uint64_t v10 = (char *)[*(id *)(*(void *)(a1 + 32) + 184) count];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = *(id *)(a1 + 40);
    id v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          [*(id *)(*(void *)(a1 + 32) + 184) setObject:0 forKeyedSubscript:v7];
          uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 200);
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_7360;
          v12[3] = &unk_14930;
          v12[4] = v7;
          id v9 = [v8 indexOfObjectPassingTest:v12];
          if (v9 != (id)0x7FFFFFFFFFFFFFFFLL) {
            [*(id *)(*(void *)(a1 + 32) + 200) removeObjectAtIndex:v9];
          }
        }
        id v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }

    uint64_t result = (char *)[*(id *)(*(void *)(a1 + 32) + 184) count];
    if (v10 != result) {
      return sub_6BA8(*(char **)(a1 + 32), 0);
    }
  }
  return result;
}

id sub_7360(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_777C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = (char *)objc_alloc_init((Class)PSSpecifier);
  *(void *)&v7[OBJC_IVAR___PSSpecifier_cellType] = 6;
  [v7 setIdentifier:v6];
  [v7 setName:v5];

  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:PSLazyIconLoading];
  [v7 setObject:v6 forKeyedSubscript:PSLazyIconAppID];

  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:PSLazyIconDontUnload];
  [v7 setTarget:*(void *)(a1 + 32)];
  *(void *)&v7[OBJC_IVAR___PSSpecifier_getter] = "_automaticUpdatesEnabledForAppSpecifier:";
  *(void *)&v7[OBJC_IVAR___PSSpecifier_setter] = "_setAutomaticUpdatesEnabled:forAppSpecifier:";
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "addObject:");
}

int64_t sub_78BC(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  id v4 = a3;
  id v5 = [(PSSpecifier *)a2 name];
  id v6 = [(PSSpecifier *)v4 name];

  id v7 = [v5 localizedStandardCompare:v6];
  return (int64_t)v7;
}

void sub_7A14(uint64_t a1, int a2)
{
  if (a1)
  {
    id v3 = (id)objc_opt_new();
    [v3 hideApplicationBadgeForPendingUpdates];
    if (a2) {
      [v3 reloadFromServerInBackgroundWithCompletionBlock:&stru_14A00];
    }
  }
}

char *sub_7CE0(uint64_t a1)
{
  id v2 = +[NSProcessInfo processInfo];
  *(unsigned char *)(*(void *)(a1 + 32) + 209) = [v2 isLowPowerModeEnabled];

  id v3 = *(char **)(a1 + 32);

  return sub_6BA8(v3, 0);
}

void sub_9124(uint64_t a1)
{
  --*(_DWORD *)(*(void *)(a1 + 32) + 192);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(int *)(v1 + 192) <= 0)
  {
    ++*(_DWORD *)(v1 + 188);
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) BOOLValue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_925C;
    v5[3] = &unk_14A50;
    objc_copyWeak(&v7, &location);
    id v6 = *(id *)(a1 + 40);
    [v3 _setAutomaticDownloadsEnabled:v4 forKind:@"software" withCompletion:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void sub_9238(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_925C(uint64_t a1, uint64_t a2)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = *((_DWORD *)WeakRetained + 47) - 1;
    *((_DWORD *)WeakRetained + 47) = v6;
    if (a2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_93B4;
      block[3] = &unk_14A28;
      block[4] = WeakRetained;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else if (!v6 && !*((_DWORD *)WeakRetained + 48))
    {
      int v7 = WeakRetained[184];
      if (v7 != [*(id *)(a1 + 32) BOOLValue])
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_93BC;
        v8[3] = &unk_14958;
        v8[4] = v5;
        id v9 = *(id *)(a1 + 32);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
      }
    }
  }
}

id sub_93B4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_93BC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 184) = [*(id *)(a1 + 40) BOOLValue];
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 reloadSpecifiers];
}

intptr_t sub_9970(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 232) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_A3FC(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadUserSpecificURLBag];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _reloadUI];
}

id sub_A4B0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _reloadForLowPowerModeChange];
}

id sub_A52C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadMarketplaceVariables];
}

id sub_A5A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadUI];
}

id sub_A6F0(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadAutomaticDownloadConfigurations];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _reloadUI];
}

void sub_A920(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_A938(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_AA10;
  v2[3] = &unk_14B68;
  objc_copyWeak(&v3, &location);
  v2[4] = *(void *)(a1 + 40);
  +[MarketplaceKitWrapper shouldShowAppInstallationSettingsWithCompletionHandler:v2];
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void sub_A9F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_AA10(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_AAB8;
    block[3] = &unk_14B40;
    char v8 = a2;
    uint64_t v6 = *(void *)(a1 + 32);
    block[4] = WeakRetained;
    void block[5] = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void *sub_AAB8(void *result)
{
  int v1 = *((unsigned __int8 *)result + 48);
  if (v1 != *(unsigned __int8 *)(*(void *)(result[5] + 8) + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(result[4] + 264) = v1;
    id v3 = (CFPropertyListRef *)&kCFBooleanTrue;
    if (!*((unsigned char *)result + 48)) {
      id v3 = (CFPropertyListRef *)&kCFBooleanFalse;
    }
    CFPreferencesSetAppValue(@"HasMultipleMarketplaces", *v3, @"com.apple.appstored");
    CFPreferencesAppSynchronize(@"com.apple.appstored");
    id v4 = (void *)v2[4];
    return [v4 _reloadUI];
  }
  return result;
}

void sub_AB60(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_AC40;
  v2[3] = &unk_14B68;
  objc_copyWeak(&v3, &location);
  v2[4] = *(void *)(a1 + 40);
  +[MarketplaceKitWrapper shouldShowInstallConfirmationsFor:@"com.apple.AppStore" completionHandler:v2];
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void sub_AC24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_AC40(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained && *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != a2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_ACF8;
    v6[3] = &unk_14BB8;
    v6[4] = WeakRetained;
    char v7 = a2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

uint64_t sub_ACF8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 282) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) _reloadUI];
  uint64_t v2 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!*(unsigned char *)(a1 + 40)) {
    uint64_t v2 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"ShowInstallConfirmations", *v2, @"com.apple.appstored");

  return CFPreferencesAppSynchronize(@"com.apple.appstored");
}

void sub_AE70(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_AF34;
  v3[3] = &unk_14BE0;
  objc_copyWeak(&v4, &location);
  [v2 _getAutomaticSoftwareDownloadValueWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void sub_AF18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_AF34(uint64_t a1, int a2)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && WeakRetained[184] != a2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_AFE0;
    v5[3] = &unk_14BB8;
    void v5[4] = WeakRetained;
    char v6 = a2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

id sub_AFE0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 184) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _reloadUI];
}

void sub_D584(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_D648;
  v3[3] = &unk_14BE0;
  objc_copyWeak(&v4, &location);
  [v2 _getAutomaticSoftwareDownloadValueWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void sub_D62C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_D648(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_D6E0;
    v5[3] = &unk_14BB8;
    void v5[4] = WeakRetained;
    char v6 = a2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

unsigned __int8 *sub_D6E0(unsigned __int8 *result)
{
  uint64_t v1 = *((void *)result + 4);
  if (!*(_DWORD *)(v1 + 188) && !*(_DWORD *)(v1 + 192))
  {
    int v2 = result[40];
    if (*(unsigned __int8 *)(v1 + 184) != v2)
    {
      *(unsigned char *)(v1 + 184) = v2;
      return (unsigned __int8 *)[*((id *)result + 4) _reloadUI];
    }
  }
  return result;
}

uint64_t _s19MobileStoreSettings21MarketplaceKitWrapperC53AppDistributorsOrTrustedDevelopersChangedNotificationSo18NSNotificationNameavgZ_0()
{
  return static AppDistributor.AppDistributorsOrTrustedDevelopersChangedNotification.getter();
}

uint64_t sub_DB90()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_DBA0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_DBB0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_DBC0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t ASDLogHandleForCategory()
{
  return _ASDLogHandleForCategory();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
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

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t SSFileLog()
{
  return _SSFileLog();
}

uint64_t SSVStoreFrontIdentifierForAccount()
{
  return _SSVStoreFrontIdentifierForAccount();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return _UIAccessibilityIsVideoAutoplayEnabled();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
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

id objc_msgSend_AppDistributorsOrTrustedDevelopersChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 AppDistributorsOrTrustedDevelopersChangedNotification];
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _[a1 OSLogObject];
}

id objc_msgSend_URLBagForContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLBagForContext:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__autoPlayVideoSetting(void *a1, const char *a2, ...)
{
  return _[a1 _autoPlayVideoSetting];
}

id objc_msgSend__automaticDownloadConfigurations(void *a1, const char *a2, ...)
{
  return _[a1 _automaticDownloadConfigurations];
}

id objc_msgSend__bagContext(void *a1, const char *a2, ...)
{
  return _[a1 _bagContext];
}

id objc_msgSend__cellularSettings(void *a1, const char *a2, ...)
{
  return _[a1 _cellularSettings];
}

id objc_msgSend__copyAutomaticDownloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _copyAutomaticDownloadSpecifiers];
}

id objc_msgSend__copyCopyCellularDownloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _copyCopyCellularDownloadSpecifiers];
}

id objc_msgSend__copyPrivacyGroupSpecifiersSignedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyPrivacyGroupSpecifiersSignedIn:");
}

id objc_msgSend__copySignedInSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _copySignedInSpecifiers];
}

id objc_msgSend__copySignedOutSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _copySignedOutSpecifiers];
}

id objc_msgSend__copySystemPolicySpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _copySystemPolicySpecifiers];
}

id objc_msgSend__fetchInitialAutomaticSoftwareDownloadValue(void *a1, const char *a2, ...)
{
  return _[a1 _fetchInitialAutomaticSoftwareDownloadValue];
}

id objc_msgSend__formattedNetworkLimit(void *a1, const char *a2, ...)
{
  return _[a1 _formattedNetworkLimit];
}

id objc_msgSend__getAutomaticSoftwareDownloadValueWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAutomaticSoftwareDownloadValueWithCompletion:");
}

id objc_msgSend__isSignedIn(void *a1, const char *a2, ...)
{
  return _[a1 _isSignedIn];
}

id objc_msgSend__loadUserSpecificURLBag(void *a1, const char *a2, ...)
{
  return _[a1 _loadUserSpecificURLBag];
}

id objc_msgSend__newAppStoreVideoGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _newAppStoreVideoGroupSpecifier];
}

id objc_msgSend__newAppStoreVideoSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _newAppStoreVideoSpecifier];
}

id objc_msgSend__newAutomaticDownloadSpecifierWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newAutomaticDownloadSpecifierWithConfiguration:");
}

id objc_msgSend__newAutomaticUpdatesSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _newAutomaticUpdatesSpecifier];
}

id objc_msgSend__newBackgroundAssetDownloadsSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _newBackgroundAssetDownloadsSpecifier];
}

id objc_msgSend__newCellularDataGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _newCellularDataGroupSpecifier];
}

id objc_msgSend__newCellularDataSwitchSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _newCellularDataSwitchSpecifier];
}

id objc_msgSend__newInAppReviewGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _newInAppReviewGroupSpecifier];
}

id objc_msgSend__newInAppReviewSwitchSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _newInAppReviewSwitchSpecifier];
}

id objc_msgSend__newLinkSpecifierWithName_detailControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newLinkSpecifierWithName:detailControllerClass:");
}

id objc_msgSend__newOffloadUnusedAppsGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _newOffloadUnusedAppsGroupSpecifier];
}

id objc_msgSend__newOffloadUnusedAppsSwitchSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _newOffloadUnusedAppsSwitchSpecifier];
}

id objc_msgSend__newSwitchSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSwitchSpecifierWithName:");
}

id objc_msgSend__reloadAutomaticDownloadConfigurations(void *a1, const char *a2, ...)
{
  return _[a1 _reloadAutomaticDownloadConfigurations];
}

id objc_msgSend__reloadMarketplaceVariables(void *a1, const char *a2, ...)
{
  return _[a1 _reloadMarketplaceVariables];
}

id objc_msgSend__reloadUI(void *a1, const char *a2, ...)
{
  return _[a1 _reloadUI];
}

id objc_msgSend__setAutomaticDownloadsEnabled_forKind_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAutomaticDownloadsEnabled:forKind:withCompletion:");
}

id objc_msgSend__setCellularPolicyEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCellularPolicyEnabled:");
}

id objc_msgSend__settingsBag(void *a1, const char *a2, ...)
{
  return _[a1 _settingsBag];
}

id objc_msgSend__shouldShowCellularDataSwitch(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowCellularDataSwitch];
}

id objc_msgSend__shouldShowSpecifierForAutomaticDownloadKinds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowSpecifierForAutomaticDownloadKinds:");
}

id objc_msgSend__showAccountSheetWithViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAccountSheetWithViewController:animated:");
}

id objc_msgSend__showInstallConfirmationsGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _showInstallConfirmationsGroupSpecifier];
}

id objc_msgSend__showInstallConfirmationsSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _showInstallConfirmationsSpecifier];
}

id objc_msgSend__updateCellularPolicy(void *a1, const char *a2, ...)
{
  return _[a1 _updateCellularPolicy];
}

id objc_msgSend__updateSpecifierValues(void *a1, const char *a2, ...)
{
  return _[a1 _updateSpecifierValues];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeAccount];
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

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_accountFlagValueForAccountFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_accountFlagValueForAccountFlag:");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_autoPlayVideoSetting(void *a1, const char *a2, ...)
{
  return _[a1 autoPlayVideoSetting];
}

id objc_msgSend_automaticDownloadKinds(void *a1, const char *a2, ...)
{
  return _[a1 automaticDownloadKinds];
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForProfile:profileVersion:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_cellular(void *a1, const char *a2, ...)
{
  return _[a1 cellular];
}

id objc_msgSend_cellularDataPrompt(void *a1, const char *a2, ...)
{
  return _[a1 cellularDataPrompt];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return _[a1 clientInterface];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contextWithBagType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithBagType:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_correspondingApplicationRecord(void *a1, const char *a2, ...)
{
  return _[a1 correspondingApplicationRecord];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_enabledMediaKinds(void *a1, const char *a2, ...)
{
  return _[a1 enabledMediaKinds];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_getCellularNetworkingAllowedWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCellularNetworkingAllowedWithBlock:");
}

id objc_msgSend_getCurrentDataSubscriptionContextSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCurrentDataSubscriptionContextSync:");
}

id objc_msgSend_getLocalPolicies_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocalPolicies:error:");
}

id objc_msgSend_gradientWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gradientWithColor:");
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

id objc_msgSend_hideApplicationBadgeForPendingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 hideApplicationBadgeForPendingUpdates];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identityForSubscription_usingClient_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForSubscription:usingClient:error:");
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForIndexPath:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return _[a1 indexPathForSelectedRow];
}

id objc_msgSend_initWithAccount_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:bag:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBagContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBagContext:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithEnabledMediaKinds_account_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnabledMediaKinds:account:bag:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithName_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:target:set:get:detail:cell:edit:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isAppInstallationAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isAppInstallationAllowed];
}

id objc_msgSend_isAutoPlayVideoProhibited(void *a1, const char *a2, ...)
{
  return _[a1 isAutoPlayVideoProhibited];
}

id objc_msgSend_isAutomaticAppDownloadsAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticAppDownloadsAllowed];
}

id objc_msgSend_isAutomaticUpdateAuthorizationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticUpdateAuthorizationEnabled];
}

id objc_msgSend_isAutomaticUpdateAuthorizationRequiredWhenEnabledForAppWithRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAutomaticUpdateAuthorizationRequiredWhenEnabledForAppWithRecord:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowPowerModeEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_networkConstraintsForDownloadKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkConstraintsForDownloadKind:");
}

id objc_msgSend_networkType(void *a1, const char *a2, ...)
{
  return _[a1 networkType];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
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

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return _[a1 perform];
}

id objc_msgSend_policies(void *a1, const char *a2, ...)
{
  return _[a1 policies];
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presenterForPrivacyUnifiedAboutWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenterForPrivacyUnifiedAboutWithIdentifiers:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return _[a1 reload];
}

id objc_msgSend_reloadFromServerInBackgroundWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadFromServerInBackgroundWithCompletionBlock:");
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

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePropertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePropertyForKey:");
}

id objc_msgSend_resultWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithError:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setCellType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellType:");
}

id objc_msgSend_setCellularDataPrompt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellularDataPrompt:");
}

id objc_msgSend_setCellularNetworkingAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellularNetworkingAllowed:");
}

id objc_msgSend_setClientInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientInterface:");
}

id objc_msgSend_setDefaultBackgroundGradient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultBackgroundGradient:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
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

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettings:");
}

id objc_msgSend_setSharedClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedClient:");
}

id objc_msgSend_setSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiers:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setURLRequestProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURLRequestProperties:");
}

id objc_msgSend_setUserIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserIdentifier:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setViewControllerFactory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllerFactory:");
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllers:animated:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_settingsForIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForIdentity:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return _[a1 sharedCache];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return _[a1 sharedClient];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfig];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedStoreServicesConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedStoreServicesConfig];
}

id objc_msgSend_shouldLog(void *a1, const char *a2, ...)
{
  return _[a1 shouldLog];
}

id objc_msgSend_shouldLogToDisk(void *a1, const char *a2, ...)
{
  return _[a1 shouldLogToDisk];
}

id objc_msgSend_shouldShowAppInstallationSettingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowAppInstallationSettingsWithCompletionHandler:");
}

id objc_msgSend_shouldShowCellularAutomaticDownloadsSwitch(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowCellularAutomaticDownloadsSwitch];
}

id objc_msgSend_shouldShowInstallConfirmationsFor_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowInstallConfirmationsFor:completionHandler:");
}

id objc_msgSend_showNetworkPromptsIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showNetworkPromptsIfNecessary:");
}

id objc_msgSend_sizeLimitForNetworkType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeLimitForNetworkType:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_specifierAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndex:");
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

id objc_msgSend_startWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithCompletionHandler:");
}

id objc_msgSend_storeFrontDefaultAutoPlayVideoSetting(void *a1, const char *a2, ...)
{
  return _[a1 storeFrontDefaultAutoPlayVideoSetting];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromByteCount:countStyle:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_supportsDeviceCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsDeviceCapability:");
}

id objc_msgSend_synchronizeAutomaticDownloadKinds(void *a1, const char *a2, ...)
{
  return _[a1 synchronizeAutomaticDownloadKinds];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemPolicy(void *a1, const char *a2, ...)
{
  return _[a1 systemPolicy];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_updateAutoPlayVideoDefaultSettingsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 updateAutoPlayVideoDefaultSettingsIfNecessary];
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return _[a1 userAgent];
}

id objc_msgSend_userIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 userIdentifier];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}