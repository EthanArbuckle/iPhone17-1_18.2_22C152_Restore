void sub_4F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4F68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained specifier];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [WeakRetained isEnabled]);
  [v3 setProperty:v4 forKey:PSValueKey];

  v5 = [WeakRetained specifier];
  [v5 setProperty:&__kCFBooleanFalse forKey:PSControlIsLoadingKey];

  v6 = FRNewsSettingsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Settings sports sync switch preparing...done", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_523C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v4 = FRNewsSettingsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Settings sports sync setting will attempt to opt-in with watchlist %{public}@", buf, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) isEnabled];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_5370;
    v7[3] = &unk_10560;
    id v8 = *(id *)(a1 + 32);
    [v3 updateSyncSettingWithIsEnabled:v6 completionHandler:v7];
  }
}

void sub_5370(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = FRNewsSettingsLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v9 = 138543362;
      id v10 = v4;
      v7 = "Settings sports sync failed to opt-in with watchlist, error=%{public}@";
LABEL_6:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v6)
  {
    id v8 = *(void **)(a1 + 32);
    int v9 = 138543362;
    id v10 = v8;
    v7 = "Settings sports sync successful opt-in with watchlist, %{public}@";
    goto LABEL_6;
  }
}

void sub_5694(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_56B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = FRNewsSettingsLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Settings sports sync switch will prepare with watchlist", buf, 2u);
    }

    [WeakRetained prepareUserDefaultsWithWatchlistService:v3 completion:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Settings sports sync switch will NOT prepare with watchlist", v7, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_5888(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5960;
  block[3] = &unk_105D8;
  id v9 = a3;
  id v10 = v5;
  id v11 = *(id *)(a1 + 32);
  id v6 = v5;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_5960(void *a1)
{
  if (a1[4])
  {
    uint64_t v2 = FRNewsSettingsLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = (void *)a1[4];
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Settings sports sync switch failed to get onboarding status from watchlist, error=%{public}@", buf, 0xCu);
    }
    id v4 = 0;
  }
  else
  {
    uint64_t v2 = +[FRNewsSportsSyncSetting userDefaultSyncSetting];
    uint64_t v5 = a1[5];
    v9[0] = v2;
    v9[1] = v5;
    id v6 = +[NSArray arrayWithObjects:v9 count:2];
    id v7 = FRNewsSettingsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Settings sports sync will determine most recent sync setting between %{public}@", buf, 0xCu);
    }

    id v4 = FRNewsSportsSyncSettingMostRecentSyncSetting(v6);
  }
  id v8 = FRNewsSettingsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Settings sports sync determined most recent sync setting %{public}@", buf, 0xCu);
  }

  if (v4 && [v4 source]) {
    +[FRNewsSportsSyncSetting updateUserDefaultsSyncSetting:v4];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

id sub_6970(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  id v11 = +[PSSpecifier preferenceSpecifierNamed:a2 target:v8 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:a3 edit:0];
  [v11 setObject:v10 forKeyedSubscript:PSKeyNameKey];

  [v11 setObject:v9 forKeyedSubscript:PSDefaultValueKey];
  uint64_t v12 = FCDefaultsSuiteName;
  [v11 setObject:FCDefaultsSuiteName forKeyedSubscript:PSDefaultsKey];
  [v11 setObject:v12 forKeyedSubscript:PSContainerBundleIDKey];

  return v11;
}

id sub_6A94(uint64_t a1)
{
  [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forSpecifier:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 reload];
}

id sub_6D48(uint64_t a1)
{
  [*(id *)(a1 + 32) setOptimizedStorageEnabled:*(void *)(a1 + 40) forSpecifier:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 reload];
}

id sub_706C(uint64_t a1)
{
  [*(id *)(a1 + 32) setPreferenceValue:*(void *)(a1 + 40) specifier:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 reload];
}

NSSet *FRAppDefaultsDomainiCloudDataDestructionStickyKeys()
{
  return +[NSSet setWithObjects:@"should_clear_cache_on_next_launch", 0];
}

uint64_t FRLogLevelDefault()
{
  if (os_variant_has_internal_content()) {
    return 6;
  }
  else {
    return 3;
  }
}

void sub_8768(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

id sub_878C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  id v11 = +[PSSpecifier preferenceSpecifierNamed:a2 target:v8 set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:a3 edit:0];
  [v11 setObject:v10 forKeyedSubscript:PSKeyNameKey];

  [v11 setObject:v9 forKeyedSubscript:PSDefaultValueKey];
  [v11 setObject:@"com.apple.news" forKeyedSubscript:PSDefaultsKey];
  [v11 setObject:NSSNewsAppBundleID forKeyedSubscript:PSContainerBundleIDKey];

  return v11;
}

void sub_88B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained sportsSyncManager];
  uint64_t v2 = [v1 specifier];
  [WeakRetained reloadSpecifier:v2 animated:1];
}

id sub_9374(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowStoriesFromFavorites:*(void *)(a1 + 40) specifier:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 reload];
}

CFStringRef NSStringFromNewsSportsSyncSettingSource(uint64_t a1)
{
  if (a1 == 1) {
    return @"watchlist";
  }
  else {
    return @"userDefaults";
  }
}

id FRNewsSportsSyncSettingMostRecentSyncSetting(void *a1)
{
  id v1 = a1;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v2)
  {
    id v4 = 0;
    goto LABEL_16;
  }
  id v3 = v2;
  id v4 = 0;
  uint64_t v5 = *(void *)v18;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(void *)v18 != v5) {
        objc_enumerationMutation(v1);
      }
      id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      uint64_t v8 = [v4 dateModified];
      if (!v8
        || (id v9 = (void *)v8,
            [v7 dateModified],
            id v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            v9,
            !v10))
      {
        v14 = [v7 dateModified];

        if (!v14) {
          continue;
        }
LABEL_11:
        id v15 = v7;

        id v4 = v15;
        continue;
      }
      id v11 = [v7 dateModified];
      uint64_t v12 = [v4 dateModified];
      unsigned __int8 v13 = objc_msgSend(v11, "fc_isLaterThan:", v12);

      if (v13) {
        goto LABEL_11;
      }
    }
    id v3 = [v1 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v3);
LABEL_16:

  return v4;
}

id FRNewsSettingsLog()
{
  if (qword_14A10 != -1) {
    dispatch_once(&qword_14A10, &stru_10948);
  }
  v0 = (void *)qword_14A18;

  return v0;
}

void sub_9D24(id a1)
{
  qword_14A18 = (uint64_t)os_log_create("com.apple.news.settings", "NewsSettings");

  _objc_release_x1();
}

uint64_t sub_9FB0(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  id v4 = (uint64_t (__cdecl *)())((char *)&dword_14A00 + dword_14A00);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *id v2 = v1;
  v2[1] = sub_A058;
  return v4();
}

uint64_t sub_A058(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *v2;
  swift_task_dealloc();
  id v7 = *(void (***)(void, void, void))(v5 + 16);
  if (v3)
  {
    uint64_t v8 = (void *)sub_C010();
    swift_errorRelease();
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);

    _Block_release(v7);
  }
  else
  {
    ((void (**)(void, void *, void))v7)[2](v7, a1, 0);
    _Block_release(v7);
  }
  id v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_A350(char a1, void *aBlock)
{
  *(void *)(v2 + 16) = _Block_copy(aBlock);
  uint64_t v6 = (uint64_t (*)(char))((char *)&dword_149D8 + dword_149D8);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  void *v4 = v2;
  v4[1] = sub_A404;
  return v6(a1);
}

uint64_t sub_A404(char a1)
{
  uint64_t v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v8 = *(void *)(v5 + 16);
  if (v3)
  {
    id v9 = (void *)sub_C010();
    swift_errorRelease();
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v6 + 16));
  id v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

id SportsSyncFavoritesService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SportsSyncFavoritesService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SportsSyncFavoritesService()
{
  return self;
}

uint64_t sub_A5D4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_A618()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_A658()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_BE4C;
  uint64_t v5 = (uint64_t (*)(char, void *))((char *)&dword_14998 + dword_14998);
  return v5(v2, v3);
}

uint64_t sub_A70C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_BE4C;
  return v6();
}

uint64_t sub_A7DC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  id v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_BE4C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_149A8 + dword_149A8);
  return v6(v2, v3, v4);
}

uint64_t sub_A89C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_BE4C;
  return v7();
}

uint64_t sub_A96C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_BE4C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_149B8 + dword_149B8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_AA38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_C100();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_C0F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_ABDC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_C0E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_ABDC(uint64_t a1)
{
  uint64_t v2 = sub_A5D4(&qword_14990);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_AC3C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_AD18;
  return v6(a1);
}

uint64_t sub_AD18()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_AE10()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_AE48(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_AF00;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_149C8 + dword_149C8);
  return v6(a1, v4);
}

uint64_t sub_AF00()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_AFF4()
{
  sub_A5D4(&qword_14A08);
  v0[2] = swift_task_alloc();
  uint64_t v1 = sub_C090();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  v0[5] = swift_task_alloc();
  uint64_t v2 = sub_C0D0();
  v0[6] = v2;
  v0[7] = *(void *)(v2 - 8);
  v0[8] = swift_task_alloc();
  uint64_t v3 = sub_C080();
  v0[9] = v3;
  v0[10] = *(void *)(v3 - 8);
  v0[11] = swift_task_alloc();
  return _swift_task_switch(sub_B198, 0, 0);
}

uint64_t sub_B198()
{
  sub_C0C0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  void *v1 = v0;
  v1[1] = sub_B23C;
  uint64_t v2 = *(void *)(v0 + 88);
  return SportsFavoriteService.userConsent()(v2);
}

uint64_t sub_B23C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 64);
  uint64_t v3 = *(void *)(*(void *)v1 + 56);
  uint64_t v4 = *(void *)(*(void *)v1 + 48);
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_B5BC;
  }
  else {
    uint64_t v5 = sub_B3AC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_B3AC()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  sub_C070();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 != enum case for SportsFavoriteService.UserConsent.Status.unknown(_:)
    && v4 != enum case for SportsFavoriteService.UserConsent.Status.declined(_:))
  {
    if (v4 == enum case for SportsFavoriteService.UserConsent.Status.accepted(_:))
    {
      uint64_t v6 = 1;
      goto LABEL_9;
    }
    (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  }
  uint64_t v6 = 0;
LABEL_9:
  uint64_t v7 = v0[2];
  sub_C060();
  uint64_t v8 = sub_C030();
  uint64_t v9 = *(void *)(v8 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
  {
    uint64_t v11 = v0[2];
    Class isa = sub_C020().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v13 = v0[10];
  uint64_t v12 = v0[11];
  uint64_t v14 = v0[9];
  id v15 = [objc_allocWithZone((Class)FRNewsSportsSyncSetting) initWithSource:1 enabled:v6 dateModified:isa];

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v16 = (uint64_t (*)(id))v0[1];
  return v16(v15);
}

uint64_t sub_B5BC()
{
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_B660(char a1)
{
  *(unsigned char *)(v1 + 128) = a1;
  uint64_t v2 = sub_C090();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = *(void *)(v2 - 8);
  *(void *)(v1 + 32) = swift_task_alloc();
  uint64_t v3 = sub_C050();
  *(void *)(v1 + 40) = v3;
  *(void *)(v1 + 48) = *(void *)(v3 - 8);
  *(void *)(v1 + 56) = swift_task_alloc();
  uint64_t v4 = sub_C0D0();
  *(void *)(v1 + 64) = v4;
  *(void *)(v1 + 72) = *(void *)(v4 - 8);
  *(void *)(v1 + 80) = swift_task_alloc();
  uint64_t v5 = sub_C080();
  *(void *)(v1 + 88) = v5;
  *(void *)(v1 + 96) = *(void *)(v5 - 8);
  *(void *)(v1 + 104) = swift_task_alloc();
  return _swift_task_switch(sub_B834, 0, 0);
}

uint64_t sub_B834()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 16);
  int v4 = *(unsigned __int8 *)(v0 + 128);
  sub_C0C0();
  uint64_t v5 = (unsigned int *)&enum case for SportsFavoriteService.UserConsent.Status.accepted(_:);
  if (!v4) {
    uint64_t v5 = (unsigned int *)&enum case for SportsFavoriteService.UserConsent.Status.declined(_:);
  }
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *v5, v3);
  sub_C040();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v6;
  void *v6 = v0;
  v6[1] = sub_B9DC;
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 56);
  return SportsFavoriteService.modifyUserConsent(_:)(v7, v8);
}

uint64_t sub_B9DC()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = *(void *)(*(void *)v1 + 72);
  uint64_t v5 = *(void *)(*(void *)v1 + 64);
  uint64_t v6 = *(void *)(*(void *)v1 + 56);
  uint64_t v7 = *(void *)(*(void *)v1 + 48);
  uint64_t v8 = *(void *)(*(void *)v1 + 40);
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0)
  {
    uint64_t v9 = sub_BC68;
  }
  else
  {
    (*(void (**)(void, void))(v2[12] + 8))(v2[13], v2[11]);
    uint64_t v9 = sub_BBD4;
  }
  return _swift_task_switch(v9, 0, 0);
}

uint64_t sub_BBD4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 128);
  return v1(v2);
}

uint64_t sub_BC68()
{
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_BD18()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_BD58()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_AF00;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_149E0 + dword_149E0);
  return v4(v2);
}

uint64_t sub_BE0C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_BE50()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Unsupported Platform"];
  int v1 = 136315906;
  uint64_t v2 = "-[FRNewsDownloadsSettingsController optimizeStorageDescription]";
  __int16 v3 = 2080;
  uint64_t v4 = "FRNewsDownloadsSettingsController.m";
  __int16 v5 = 1024;
  int v6 = 245;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void sub_BF30()
{
  id v0 = [objc_alloc((Class)NSString) initWithFormat:@"Unsupported Platform"];
  int v1 = 136315906;
  uint64_t v2 = "-[FRNewsSettingsController offlineModeSubscriberGroupDescription]";
  __int16 v3 = 2080;
  uint64_t v4 = "FRNewsSettingsController.m";
  __int16 v5 = 1024;
  int v6 = 470;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

uint64_t sub_C010()
{
  return _convertErrorToNSError(_:)();
}

NSDate sub_C020()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_C030()
{
  return type metadata accessor for Date();
}

uint64_t sub_C040()
{
  return SportsFavoriteService.UserConsent.Modification.init(status:)();
}

uint64_t sub_C050()
{
  return type metadata accessor for SportsFavoriteService.UserConsent.Modification();
}

uint64_t sub_C060()
{
  return SportsFavoriteService.UserConsent.State.lastModifiedDate.getter();
}

uint64_t sub_C070()
{
  return SportsFavoriteService.UserConsent.State.status.getter();
}

uint64_t sub_C080()
{
  return type metadata accessor for SportsFavoriteService.UserConsent.State();
}

uint64_t sub_C090()
{
  return type metadata accessor for SportsFavoriteService.UserConsent.Status();
}

uint64_t sub_C0C0()
{
  return static SportsFavoriteService.default.getter();
}

uint64_t sub_C0D0()
{
  return type metadata accessor for SportsFavoriteService();
}

uint64_t sub_C0E0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_C0F0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_C100()
{
  return type metadata accessor for TaskPriority();
}

uint64_t FCDynamicCast()
{
  return _FCDynamicCast();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

uint64_t NewsCoreUserDefaults()
{
  return _NewsCoreUserDefaults();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_appPolicy(void *a1, const char *a2, ...)
{
  return _[a1 appPolicy];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
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

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateModified(void *a1, const char *a2, ...)
{
  return _[a1 dateModified];
}

id objc_msgSend_fc_isLaterThan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_isLaterThan:");
}

id objc_msgSend_fetchSyncSettingWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSyncSettingWithCompletionHandler:");
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithSource_enabled_dateModified_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSource:enabled:dateModified:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isUserSignedInToiCloud(void *a1, const char *a2, ...)
{
  return _[a1 isUserSignedInToiCloud];
}

id objc_msgSend_isUserSignedIntoICloud(void *a1, const char *a2, ...)
{
  return _[a1 isUserSignedIntoICloud];
}

id objc_msgSend_isUserSignedIntoiTunes(void *a1, const char *a2, ...)
{
  return _[a1 isUserSignedIntoiTunes];
}

id objc_msgSend_killNewsApp(void *a1, const char *a2, ...)
{
  return _[a1 killNewsApp];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringResourceWithKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringResourceWithKey:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_offlineModeSubscriberGroupDescription(void *a1, const char *a2, ...)
{
  return _[a1 offlineModeSubscriberGroupDescription];
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_optimizeStorageDescription(void *a1, const char *a2, ...)
{
  return _[a1 optimizeStorageDescription];
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_pe_registerUndoActionName_associatedDeepLink_undoAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_registerUndoActionName:associatedDeepLink:undoAction:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_prepareUserDefaultsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareUserDefaultsWithCompletion:");
}

id objc_msgSend_prepareUserDefaultsWithWatchlistService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareUserDefaultsWithWatchlistService:completion:");
}

id objc_msgSend_prepareWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareWithCompletion:");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_presenterForPrivacySplashWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenterForPrivacySplashWithIdentifier:");
}

id objc_msgSend_presenterForPrivacyUnifiedAboutWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenterForPrivacyUnifiedAboutWithIdentifiers:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_reloadSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:animated:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_reloadiTunesAccount(void *a1, const char *a2, ...)
{
  return _[a1 reloadiTunesAccount];
}

id objc_msgSend_setAppPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppPolicy:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setCancelButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelButton:");
}

id objc_msgSend_setConfirmationAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationAction:");
}

id objc_msgSend_setConfirmationCancelAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationCancelAction:");
}

id objc_msgSend_setDetailControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailControllerClass:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOkButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOkButton:");
}

id objc_msgSend_setOptimizedStorageEnabled_forSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptimizedStorageEnabled:forSpecifier:");
}

id objc_msgSend_setPreferenceValue_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferenceValue:specifier:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setPrompt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrompt:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setShowStoriesFromFavorites_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowStoriesFromFavorites:specifier:");
}

id objc_msgSend_setSubtitleForAutomaticDownloadsSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitleForAutomaticDownloadsSpecifier:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forSpecifier:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedAccount(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccount];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_showConfirmationViewForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showConfirmationViewForSpecifier:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
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

id objc_msgSend_sportsFavoritesService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sportsFavoritesService:");
}

id objc_msgSend_sportsSyncManager(void *a1, const char *a2, ...)
{
  return _[a1 sportsSyncManager];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_updateSyncSettingWithIsEnabled_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSyncSettingWithIsEnabled:completionHandler:");
}

id objc_msgSend_updateUserDefaultsSyncSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUserDefaultsSyncSetting:");
}

id objc_msgSend_userDefaultSyncSetting(void *a1, const char *a2, ...)
{
  return _[a1 userDefaultSyncSetting];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}