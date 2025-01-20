void sub_3A60(id a1, BOOL a2)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = NBDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Finished showing audiobook store", v3, 2u);
  }
}

void sub_3EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3EE8(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3F78;
  block[3] = &unk_206C8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_3F78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_49E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

uint64_t sub_4A04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4A14(uint64_t a1)
{
}

void sub_4A1C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "nb_dsids");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 unionSet:v3];
}

id NBDefaultLog()
{
  if (qword_28020 != -1) {
    dispatch_once(&qword_28020, &stru_20758);
  }
  v0 = (void *)qword_28018;

  return v0;
}

void sub_4DBC(id a1)
{
  qword_28018 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks");

  _objc_release_x1();
}

id NBInternalSettingsLog()
{
  if (qword_28030 != -1) {
    dispatch_once(&qword_28030, &stru_20778);
  }
  v0 = (void *)qword_28028;

  return v0;
}

void sub_4E54(id a1)
{
  qword_28028 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks.InternalSettings");

  _objc_release_x1();
}

id NBComplicationLog()
{
  if (qword_28040 != -1) {
    dispatch_once(&qword_28040, &stru_20798);
  }
  v0 = (void *)qword_28038;

  return v0;
}

void sub_4EEC(id a1)
{
  qword_28038 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks.Complication");

  _objc_release_x1();
}

id NBCachingLog()
{
  if (qword_28050 != -1) {
    dispatch_once(&qword_28050, &stru_207B8);
  }
  v0 = (void *)qword_28048;

  return v0;
}

void sub_4F84(id a1)
{
  qword_28048 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks.Caching");

  _objc_release_x1();
}

id NBPlaybackLog()
{
  if (qword_28060 != -1) {
    dispatch_once(&qword_28060, &stru_207D8);
  }
  v0 = (void *)qword_28058;

  return v0;
}

void sub_501C(id a1)
{
  qword_28058 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks.Playback");

  _objc_release_x1();
}

id NBStreamingLog()
{
  if (qword_28070 != -1) {
    dispatch_once(&qword_28070, &stru_207F8);
  }
  v0 = (void *)qword_28068;

  return v0;
}

void sub_50B4(id a1)
{
  qword_28068 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks.HLSStreaming");

  _objc_release_x1();
}

id NBBDSSyncLog()
{
  if (qword_28080 != -1) {
    dispatch_once(&qword_28080, &stru_20818);
  }
  v0 = (void *)qword_28078;

  return v0;
}

void sub_514C(id a1)
{
  qword_28078 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks.BDSSync");

  _objc_release_x1();
}

id NBRecommendationsLog()
{
  if (qword_28090 != -1) {
    dispatch_once(&qword_28090, &stru_20838);
  }
  v0 = (void *)qword_28088;

  return v0;
}

void sub_51E4(id a1)
{
  qword_28088 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks.Recommendations");

  _objc_release_x1();
}

id NBTesting()
{
  if (qword_280A0 != -1) {
    dispatch_once(&qword_280A0, &stru_20858);
  }
  v0 = (void *)qword_28098;

  return v0;
}

void sub_527C(id a1)
{
  qword_28098 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks.Testing");

  _objc_release_x1();
}

id NBReachabilityLog()
{
  if (qword_280B0 != -1) {
    dispatch_once(&qword_280B0, &stru_20878);
  }
  v0 = (void *)qword_280A8;

  return v0;
}

void sub_5314(id a1)
{
  qword_280A8 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks.Reachability");

  _objc_release_x1();
}

id NBIntentsLog()
{
  if (qword_280C0 != -1) {
    dispatch_once(&qword_280C0, &stru_20898);
  }
  v0 = (void *)qword_280B8;

  return v0;
}

void sub_53AC(id a1)
{
  qword_280B8 = (uint64_t)os_log_create("com.apple.iBooks", "NanoBooks.Intents");

  _objc_release_x1();
}

uint64_t sub_5884(uint64_t a1)
{
  qword_280D0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_5A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_5A50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_5A60(uint64_t a1)
{
}

void sub_5A68(uint64_t a1)
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "iCloudDSID", (void)v18);

        if (v8)
        {
          v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v10 = [v7 iCloudDSID];
          [v9 addObject:v10];
        }
        uint64_t v11 = [v7 iTunesDSID];
        if (v11)
        {
          v12 = (void *)v11;
          v13 = [v7 iTunesDSID];
          v14 = [v7 iCloudDSID];
          unsigned __int8 v15 = [v13 isEqualToNumber:v14];

          if ((v15 & 1) == 0)
          {
            v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            v17 = [v7 iTunesDSID];
            [v16 addObject:v17];
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
}

void sub_5EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5F14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = objc_opt_new();
  if (v6)
  {
    v9 = NBDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_13214((uint64_t)v6, v9);
    }
    goto LABEL_4;
  }
  uint64_t v11 = [v5 familyMembers];
  id v12 = [v11 count];

  if (!v12)
  {
    v9 = NBDefaultLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)buf = 0;
    v22 = "You are not part of a Family Circle.";
LABEL_23:
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    goto LABEL_4;
  }
  if (![v5 isHeadOfHouseholdSharingPayment])
  {
    v9 = NBDefaultLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)buf = 0;
    v22 = "Head of household disabled sharing. Hiding family members.";
    goto LABEL_23;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v13 = [v5 familyMembers];
  id v14 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v18 isCurrentSignedInUser] & 1) == 0
          && [v18 isSharingPurchases])
        {
          long long v19 = [WeakRetained _profileImageForFamilyMember:v18];
          objc_msgSend(v18, "setNb_profileImage:", v19);

          [v8 addObject:v18];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v15);
  }

  v9 = NBDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = [v5 familyMembers];
    id v21 = [v20 count];
    *(_DWORD *)buf = 134217984;
    id v30 = v21;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Retrieved Family Circle containing %lu members", buf, 0xCu);
  }
LABEL_4:

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_623C;
  v23[3] = &unk_20918;
  v23[4] = WeakRetained;
  id v24 = v8;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);
}

id sub_623C(uint64_t a1)
{
  [*(id *)(a1 + 32) setFamilyMembers:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _notifyDidFetchFamilyCircle];
  id v2 = *(void **)(a1 + 32);

  return [v2 setRefreshing:&__kCFBooleanFalse];
}

void sub_6A04(id a1)
{
  qword_280E0 = objc_alloc_init(NBJaliscoArtworkCatalogDataSource);

  _objc_release_x1();
}

void sub_6F58(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (v7 || ![v6 length])
  {
    NBDefaultLog();
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR)) {
      sub_1328C(a1, (uint64_t)v7, &v8->super);
    }
    v9 = 0;
  }
  else
  {
    id v10 = +[UIImage imageWithData:v6];
    uint64_t v11 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) scaledFittingSize];
    id v12 = objc_msgSend(v11, "_cacheKeyForSize:withBaseKey:", *(void *)(a1 + 48));
    [*(id *)(a1 + 40) scaledFittingSize];
    objc_msgSend(v10, "nb_scaleImageToSize:");
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();

    v13 = [*(id *)(a1 + 32) imageDirectoryPath];
    id v14 = [v13 stringByAppendingPathComponent:v12];
    id v15 = +[NSURL fileURLWithPath:v14];

    uint64_t v16 = UIImagePNGRepresentation(v8);
    id v24 = 0;
    unsigned int v17 = [v16 writeToURL:v15 options:0 error:&v24];
    id v18 = v24;

    if (!v17 || v18)
    {
      long long v19 = NBDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_13308((uint64_t)v15, (uint64_t)v18, v19);
      }
    }
    [*(id *)(a1 + 40) scaledFittingSize];
    v9 = +[MPArtworkRepresentation representationWithSize:image:](MPArtworkRepresentation, "representationWithSize:image:", v8);
    long long v20 = [*(id *)(a1 + 40) cache];
    [v20 setObject:v9 forKey:v12];
  }
  id v21 = [*(id *)(a1 + 32) pendingTasks];
  [v21 removeObjectForKey:*(void *)(a1 + 48)];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v22 = objc_retainBlock(*(id *)(a1 + 56));
  v23 = v22;
  if (v22) {
    (*((void (**)(id, void *, id))v22 + 2))(v22, v9, v7);
  }
}

void sub_75E8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_76D4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  v8 = BUDynamicCast();

  if (v8)
  {
    v9 = +[MPMediaQuery nb_storeOnlyAudiobooksQuery];
    uint64_t v10 = MPMediaItemPropertyStoreID;
    uint64_t v11 = +[NSSet setWithObject:v8];
    id v12 = +[MPMediaContainmentPredicate predicateWithProperty:v10 values:v11];

    [v9 addFilterPredicate:v12];
    v13 = [v9 items];
    id v14 = [v13 firstObject];

    if (v14) {
      goto LABEL_4;
    }
    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = [v8 stringValue];
    unsigned int v17 = +[NSSet setWithObject:v16];
    id v18 = [v15 fetchItemsForStoreIDs:v17];

    id v14 = [v18 firstObject];

    if (v14)
    {
LABEL_4:
      id v19 = objc_retainBlock(*(id *)(a1 + 40));
      long long v20 = v19;
      if (v19) {
        (*((void (**)(id, NSObject *, uint64_t, uint64_t))v19 + 2))(v19, v14, a3, a4);
      }
    }
    else
    {
      id v14 = NBDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_13380((uint64_t)v8, v14);
      }
    }
  }
}

id sub_7C44(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 adamIDs];
  id v5 = [v3 _artworkCatalogsForAdamIDs:v4];

  [(id)objc_opt_class() _fillArtworkMutableArray:v5 toCount:a2];
  id v6 = [v5 copy];

  return v6;
}

void sub_7F5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 artworkCatalog];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 artworkCatalog];
    [v5 addObject:v6];
  }
  else
  {
    id v7 = NBRecommendationsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "The recommended audiobook %@ is missing its artwork catalog.", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_8814(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_888C;
  block[3] = &unk_20A28;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_888C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) searchDataSource];
  id v3 = [v2 items];
  [*(id *)(a1 + 32) setSearchResults:v3];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 reloadSpecifiers];
}

void sub_8FF4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id NBBundle()
{
  uint64_t v0 = objc_opt_class();

  return +[NSBundle bundleForClass:v0];
}

uint64_t NBIsRunningInStoreDemoMode()
{
  if (qword_280F8 != -1) {
    dispatch_once(&qword_280F8, &stru_20A48);
  }
  return byte_280F0;
}

void sub_9178(id a1)
{
  byte_280F0 = +[UIApplication isRunningInStoreDemoMode];
  if ((byte_280F0 & 1) == 0)
  {
    v1 = +[NSUserDefaults standardUserDefaults];
    unsigned int v2 = [v1 BOOLForKey:@"NBDebugStoreDemoMode"];

    if (v2)
    {
      id v3 = NBDefaultLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Overriding store demo mode to ON.", v4, 2u);
      }

      byte_280F0 = 1;
    }
  }
}

uint64_t NBIsRunningInPPTMode()
{
  if (qword_28108 != -1) {
    dispatch_once(&qword_28108, &stru_20A68);
  }
  return byte_28100;
}

void sub_9278(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_28100 = [v1 BOOLForKey:@"PPTDevice"];
}

BOOL NBModeIgnoresAccounts()
{
  if (qword_280F8 != -1) {
    dispatch_once(&qword_280F8, &stru_20A48);
  }
  if (byte_280F0) {
    return 1;
  }
  if (qword_28108 != -1) {
    dispatch_once(&qword_28108, &stru_20A68);
  }
  return byte_28100 != 0;
}

BOOL NBModeSupportsNetworking()
{
  if (qword_280F8 != -1) {
    dispatch_once(&qword_280F8, &stru_20A48);
  }
  return byte_280F0 == 0;
}

uint64_t NBDemoCountrySupportsAudiobooks()
{
  if (qword_28118 != -1) {
    dispatch_once(&qword_28118, &stru_20A88);
  }
  return byte_28110;
}

void sub_93E8(id a1)
{
  if (qword_280F8 != -1) {
    dispatch_once(&qword_280F8, &stru_20A48);
  }
  if (byte_280F0)
  {
    id v1 = +[NSUserDefaults standardUserDefaults];
    unsigned int v2 = [v1 stringForKey:@"NBCountryAllowListPath"];

    id v3 = @"/var/mobile/Media/Books/AudiobooksCountryAllowList.plist";
    if (v2) {
      id v3 = v2;
    }
    uint64_t v4 = v3;

    id v5 = NBDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Loading country allow list from %{public}@.", buf, 0xCu);
    }

    id v6 = +[NSURL fileURLWithPath:v4];
    id v13 = 0;
    id v7 = +[NSArray arrayWithContentsOfURL:v6 error:&v13];
    id v8 = v13;

    if (v7)
    {
      id v9 = +[NSLocale currentLocale];
      uint64_t v10 = [v9 objectForKey:NSLocaleCountryCode];

      byte_28110 = [v7 containsObject:v10];
      uint64_t v11 = NBDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v15 = v10;
        __int16 v16 = 1024;
        int v17 = byte_28110;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Current country is %{public}@. In allow list? %u", buf, 0x12u);
      }
    }
    else
    {
      id v12 = NBDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_13538(v12);
      }

      byte_28110 = 1;
    }
  }
  else
  {
    byte_28110 = 1;
  }
}

void sub_9C24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v11 = NBDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_13608((uint64_t)v7, v11);
    }
  }
  else
  {
    unsigned int v8 = [*(id *)(a1 + 32) isStoreAvailable];
    if (v8 != [v5 BOOLValue])
    {
      id v9 = NBDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1357C(v5, v9);
      }

      uint64_t v10 = +[NSUserDefaults standardUserDefaults];
      objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v5, "BOOLValue") ^ 1, @"NBAudiobookStoreDisabled");

      objc_msgSend(*(id *)(a1 + 32), "setStoreAvailable:", objc_msgSend(v5, "BOOLValue"));
      [*(id *)(a1 + 32) reloadSpecifiers];
    }
  }
}

void sub_A5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A600(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A690;
  block[3] = &unk_206C8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_A690(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRefreshingFamily:0];
  [WeakRetained _updateFooterIfNeeded];
  id v1 = +[NBAudiobookRecommendationManager sharedManager];
  [v1 updatePinningManager];

  [WeakRetained reloadSpecifiers];
}

void sub_B36C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = [v2 pinningManager];
  id v3 = [v5 pinnedAudiobooks];
  if ([v3 count]) {
    uint64_t v4 = [*(id *)(a1 + 32) hasStoreAccount] ^ 1;
  }
  else {
    uint64_t v4 = 1;
  }
  [v2 setEditingButtonHidden:v4 animated:0];
}

void sub_B868(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = BUDynamicCast();
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) _specifierWithItem:v4 showDownloadInfo:*(unsigned __int8 *)(a1 + 64) showWarningIfAboveQuota:*(unsigned __int8 *)(a1 + 65) downloadLimit:(unint64_t)*(double *)(a1 + 56)];
    id v6 = objc_msgSend(v4, "bk_storeID");
  }
  else
  {
    objc_opt_class();
    id v7 = BUDynamicCast();
    if (v7)
    {
      id v5 = [*(id *)(a1 + 32) _specifierWithJaliscoItem:v7 showDownloadInfo:*(unsigned __int8 *)(a1 + 64) showWarningIfAboveQuota:*(unsigned __int8 *)(a1 + 65) downloadLimit:(unint64_t)*(double *)(a1 + 56)];
      unsigned int v8 = [v7 storeID];
      id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "nb_uint64_t"));
    }
    else
    {
      id v6 = 0;
      id v5 = 0;
    }
  }
  [v5 setProperty:&__kCFBooleanTrue forKey:@"kNanoBooksCellIsEditable"];
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }
  if (v6)
  {
    [*(id *)(a1 + 48) addObject:v6];
  }
  else
  {
    id v9 = NBDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_136E8();
    }
  }
}

void sub_BAD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_BAFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = +[NSMutableArray array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = [WeakRetained _suggestionSpecifierWithRecommendation:*(void *)(*((void *)&v17 + 1) + 8 * (void)v9)];
          [v5 addObject:v10];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [WeakRetained setRecommendationSpecifiers:v5];
    objc_initWeak(&location, WeakRetained);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_BD88;
    v14[3] = &unk_206C8;
    objc_copyWeak(&v15, &location);
    uint64_t v11 = objc_retainBlock(v14);
    if (v11)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v11[2])(v11);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_BDC8;
        block[3] = &unk_20B00;
        id v13 = v11;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void sub_BD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_BD88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

uint64_t sub_BDC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_F0CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_FE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_FE6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _combineSearchResults];
    if (([v3 _isSearchCancelled] & 1) == 0)
    {
      id v4 = objc_retainBlock(*(id *)(a1 + 40));
      id v5 = v4;
      if (v4) {
        (*((void (**)(id))v4 + 2))(v4);
      }
    }
    id v6 = NBDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 1024;
      unsigned int v11 = [v3 _isSearchCancelled];
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Completed search for term '%@' (cancelled? %d)", (uint8_t *)&v8, 0x12u);
    }
  }
}

void sub_10A78(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    *a3 = 1;
  }
  else
  {
    id v5 = v9;
    if (!v9) {
      goto LABEL_6;
    }
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[4];
    int v8 = [v6 _representativeItemFromCollection:v9];
    [v7 addObject:v8];
  }
  id v5 = v9;
LABEL_6:
}

void sub_1106C(id a1)
{
  qword_28120 = objc_alloc_init(NBAudiobookRecommendationManager);

  _objc_release_x1();
}

void sub_113B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_113D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = NBRecommendationsLog();
  id WeakRetained = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_13C8C((uint64_t)v3, WeakRetained);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_13C48(WeakRetained);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained reloadRecommendationsIfNeeded:0];
  }
}

void sub_11604(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_116D8;
  v4[3] = &unk_20C90;
  objc_copyWeak(&v6, v2);
  id v5 = *(id *)(a1 + 32);
  [WeakRetained _reloadRecommendationsFromDefaultsWithCompletion:v4];

  objc_destroyWeak(&v6);
}

void sub_116C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_116D8(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2) {
    [WeakRetained _notifyAudiobookRecommendationsDidUpdateNotification];
  }
  id v4 = objc_retainBlock(*(id *)(a1 + 32));
  id v5 = v4;
  if (v4) {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

void sub_11804(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = NBRecommendationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_13D04(a1, (uint64_t)v3, v4);
    }
  }
}

void sub_11A04(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = dispatch_get_global_queue(21, 0);
  }
  id v4 = v3;
  if ([*(id *)(a1 + 40) hasFetchedInitialRecommendations])
  {
    id v5 = NBRecommendationsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Will return existing recommendations for request: %@", buf, 0xCu);
    }

    uint64_t v7 = [*(id *)(a1 + 40) recommendations];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_11C70;
    block[3] = &unk_20D08;
    id v17 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    id v18 = v7;
    id v19 = v8;
    id v9 = v7;
    dispatch_async(v4, block);
  }
  else
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    __int16 v10 = *(void **)(a1 + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_11D40;
    v11[3] = &unk_20D30;
    id v12 = *(id *)(a1 + 48);
    objc_copyWeak(&v15, (id *)buf);
    id v13 = v4;
    id v14 = *(id *)(a1 + 56);
    [v10 _reloadRecommendationsFromDefaultsWithCompletion:v11];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void sub_11C4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_11C70(uint64_t a1)
{
  uint64_t v2 = NBRecommendationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Calling completion handler with existing recommendations for request: %@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_retainBlock(*(id *)(a1 + 48));
  id v5 = v4;
  if (v4) {
    (*((void (**)(id, void))v4 + 2))(v4, *(void *)(a1 + 40));
  }
}

void sub_11D40(uint64_t a1)
{
  uint64_t v2 = NBRecommendationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Initial fetch complete for request: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setHasFetchedInitialRecommendations:1];
    int v6 = [v5 recommendations];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_11EAC;
    block[3] = &unk_20D08;
    uint64_t v7 = *(NSObject **)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 48);
    id v12 = v6;
    id v13 = v8;
    id v9 = v6;
    dispatch_async(v7, block);
  }
}

void sub_11EAC(uint64_t a1)
{
  uint64_t v2 = NBRecommendationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Calling completion handler with newly fetched recommendations for request: %@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = objc_retainBlock(*(id *)(a1 + 48));
  id v5 = v4;
  if (v4) {
    (*((void (**)(id, void))v4 + 2))(v4, *(void *)(a1 + 40));
  }
}

void sub_131D0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Selected unknown cell type or family member with no audiobook purchases.", v1, 2u);
}

void sub_13214(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Family Circle lookup request timed out with error. (%@)", (uint8_t *)&v2, 0xCu);
}

void sub_1328C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 48);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_75E8(&dword_0, a2, a3, "Failed to retrieve artwork image for %{public}@ (%{public}@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_13308(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_75E8(&dword_0, a2, a3, "Failed to save artwork file to %{public}@ (%{public}@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_13380(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to look up item in media library or jalisco with ID %@", (uint8_t *)&v2, 0xCu);
}

void sub_133F8(uint64_t a1, void *a2)
{
  [a2 row];
  sub_8FF4(&dword_0, v2, v3, "Invalid audiobook selected from search (%@) at index %lu.", v4, v5, v6, v7, 2u);
}

void sub_13488(void *a1, void *a2)
{
  uint64_t v3 = [a1 searchResults];
  [v3 count];
  [a2 row];
  sub_8FF4(&dword_0, v4, v5, "Attempted to select search audiobook outside of range %lu (%lu).", v6, v7, v8, v9, 0);
}

void sub_13538(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to load country allow list. Defaulting to allow.", v1, 2u);
}

void sub_1357C(void *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 BOOLValue];
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Found a new store availability status of %d.", (uint8_t *)v3, 8u);
}

void sub_13608(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Failed to check store status. %@", (uint8_t *)&v2, 0xCu);
}

void sub_13680()
{
  sub_F0E8();
  sub_F0CC(&dword_0, v0, v1, "Audiobook settings appeared.", v2, v3, v4, v5, v6);
}

void sub_136B4()
{
  sub_F0E8();
  sub_F0CC(&dword_0, v0, v1, "Audiobook settings disappeared.", v2, v3, v4, v5, v6);
}

void sub_136E8()
{
  sub_F0E8();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "No store identifier for media item. Dropping from list of pinned audiobooks.", v1, 2u);
}

void sub_13728()
{
  sub_F0E8();
  sub_F0CC(&dword_0, v0, v1, "[progress] Audiobook pinning selection changed.", v2, v3, v4, v5, v6);
}

void sub_1375C()
{
  sub_F0E8();
  sub_F0CC(&dword_0, v0, v1, "[progress] Sync info did update.", v2, v3, v4, v5, v6);
}

void sub_13790()
{
  sub_F0E8();
  sub_F0CC(&dword_0, v0, v1, "[progress] Ignoring media sync info update from a different syncInfoController.", v2, v3, v4, v5, v6);
}

void sub_137C4()
{
  sub_F0E8();
  sub_F0CC(&dword_0, v0, v1, "[progress] Sync state changed.", v2, v3, v4, v5, v6);
}

void sub_137F8()
{
  sub_F0E8();
  sub_F0CC(&dword_0, v0, v1, "[progress] Updating header and sync progress.", v2, v3, v4, v5, v6);
}

void sub_1382C()
{
  sub_F0E8();
  sub_F0CC(&dword_0, v0, v1, "[progress] Out of space.", v2, v3, v4, v5, v6);
}

void sub_13860(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 progressView];
  [v3 progress];
  int v5 = 134217984;
  double v6 = v4;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[progress] Showing progress of %.4f.", (uint8_t *)&v5, 0xCu);
}

void sub_13900()
{
  sub_F0E8();
  sub_F0CC(&dword_0, v0, v1, "[progress] Configuring header.", v2, v3, v4, v5, v6);
}

void sub_13934(void *a1, char a2, NSObject *a3)
{
  uint64_t v5 = [a1 syncInfoController];
  uint8_t v6 = [v5 syncInfo];
  unint64_t v7 = (unint64_t)[v6 status];
  if (v7 > 4) {
    CFStringRef v8 = @"unknown";
  }
  else {
    CFStringRef v8 = off_20BC0[v7];
  }
  int v9 = 138543618;
  CFStringRef v10 = v8;
  __int16 v11 = 2048;
  uint64_t v12 = a2 & 1;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "[progress] syncInfoStatus:%{public}@ hasPinnedAudiobooks:%lu.", (uint8_t *)&v9, 0x16u);
}

void sub_13A1C(void *a1, int a2, NSObject *a3)
{
  uint8_t v6 = [a1 syncManager];
  unint64_t v7 = [v6 audiobooksProgressInfo];
  CFStringRef v8 = (char *)[v7 syncState];
  CFStringRef v9 = @"Unknown";
  switch((unint64_t)v8)
  {
    case 0uLL:
      break;
    case 1uLL:
      CFStringRef v9 = @"Idle";
      break;
    case 2uLL:
      CFStringRef v9 = @"Pending";
      break;
    case 3uLL:
      CFStringRef v9 = @"Waiting";
      break;
    case 4uLL:
      CFStringRef v9 = @"Updating";
      break;
    default:
      if (v8 == (unsigned char *)&stru_20.nsects + 2)
      {
        CFStringRef v9 = @"MetadataSyncing";
      }
      else if (v8 == (unsigned char *)&stru_20.nsects + 3)
      {
        CFStringRef v9 = @"AssetSyncing";
      }
      else
      {
        CFStringRef v9 = @"unknown";
      }
      break;
  }
  CFStringRef v10 = [a1 syncManager];
  __int16 v11 = [v10 audiobooksProgressInfo];
  v12[0] = 67109634;
  v12[1] = a2;
  __int16 v13 = 2114;
  CFStringRef v14 = v9;
  __int16 v15 = 1024;
  int v16 = [v11 syncWaitingSubstate] & 1;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "[progress] isWaitingOnPower:%d syncState:%{public}@ subStatePower:%d", (uint8_t *)v12, 0x18u);
}

void sub_13BC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to find representative item for collection.", v1, 2u);
}

void sub_13C04(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "updating pinning manager", v1, 2u);
}

void sub_13C48(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "done updating recommendations", v1, 2u);
}

void sub_13C8C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error trying to request to update recommendations: %@", (uint8_t *)&v2, 0xCu);
}

void sub_13D04(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error updating bitrate for item with adamID %@: %@", (uint8_t *)&v4, 0x16u);
}

void sub_13D90(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 dsids];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  id v9 = [a2 row];
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Invalid family audiobook selected from account %@ at index %lu.", (uint8_t *)&v6, 0x16u);
}

void sub_13E48(void *a1, void *a2, NSObject *a3)
{
  int v6 = [a1 dsids];
  uint64_t v7 = [a1 audiobooks];
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 2048;
  id v11 = [v7 count];
  __int16 v12 = 2048;
  id v13 = [a2 row];
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Attempted to select family audiobook from account %@ outside of range %lu (%lu).", (uint8_t *)&v8, 0x20u);
}

uint64_t BPSApplyStyleToNavBarOptions()
{
  return _BPSApplyStyleToNavBarOptions();
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

uint64_t BUDynamicCast()
{
  return _BUDynamicCast();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
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

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
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

void UIRectFill(CGRect rect)
{
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
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

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__addAudiobookImage(void *a1, const char *a2, ...)
{
  return [a1 _addAudiobookImage];
}

id objc_msgSend__combineSearchResults(void *a1, const char *a2, ...)
{
  return [a1 _combineSearchResults];
}

id objc_msgSend__configureHeaderIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _configureHeaderIfNeeded];
}

id objc_msgSend__contentHeaderViewProgress(void *a1, const char *a2, ...)
{
  return [a1 _contentHeaderViewProgress];
}

id objc_msgSend__contentHeaderViewSubtitle(void *a1, const char *a2, ...)
{
  return [a1 _contentHeaderViewSubtitle];
}

id objc_msgSend__contentHeaderViewTitle(void *a1, const char *a2, ...)
{
  return [a1 _contentHeaderViewTitle];
}

id objc_msgSend__hasPinnedAudiobooks(void *a1, const char *a2, ...)
{
  return [a1 _hasPinnedAudiobooks];
}

id objc_msgSend__hasPurchasedAudiobooks(void *a1, const char *a2, ...)
{
  return [a1 _hasPurchasedAudiobooks];
}

id objc_msgSend__isSearchCancelled(void *a1, const char *a2, ...)
{
  return [a1 _isSearchCancelled];
}

id objc_msgSend__isSyncing(void *a1, const char *a2, ...)
{
  return [a1 _isSyncing];
}

id objc_msgSend__missingArtImage(void *a1, const char *a2, ...)
{
  return [a1 _missingArtImage];
}

id objc_msgSend__myLibraryStoreIDs(void *a1, const char *a2, ...)
{
  return [a1 _myLibraryStoreIDs];
}

id objc_msgSend__notifyAudiobookRecommendationsDidUpdateNotification(void *a1, const char *a2, ...)
{
  return [a1 _notifyAudiobookRecommendationsDidUpdateNotification];
}

id objc_msgSend__notifyDidFetchFamilyCircle(void *a1, const char *a2, ...)
{
  return [a1 _notifyDidFetchFamilyCircle];
}

id objc_msgSend__notifyProfileImagesDidChange(void *a1, const char *a2, ...)
{
  return [a1 _notifyProfileImagesDidChange];
}

id objc_msgSend__pinnedAudiobooks(void *a1, const char *a2, ...)
{
  return [a1 _pinnedAudiobooks];
}

id objc_msgSend__recommendationsGroup(void *a1, const char *a2, ...)
{
  return [a1 _recommendationsGroup];
}

id objc_msgSend__refreshFamilyOwnedAudiobooks(void *a1, const char *a2, ...)
{
  return [a1 _refreshFamilyOwnedAudiobooks];
}

id objc_msgSend__reloadContents(void *a1, const char *a2, ...)
{
  return [a1 _reloadContents];
}

id objc_msgSend__reloadData(void *a1, const char *a2, ...)
{
  return [a1 _reloadData];
}

id objc_msgSend__requestAudiobooks(void *a1, const char *a2, ...)
{
  return [a1 _requestAudiobooks];
}

id objc_msgSend__requestRecommendations(void *a1, const char *a2, ...)
{
  return [a1 _requestRecommendations];
}

id objc_msgSend__selfOrPresentedViewController(void *a1, const char *a2, ...)
{
  return [a1 _selfOrPresentedViewController];
}

id objc_msgSend__shouldShowProgress(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowProgress];
}

id objc_msgSend__updateFooterIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _updateFooterIfNeeded];
}

id objc_msgSend__updateHeaderAndSyncProgressIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _updateHeaderAndSyncProgressIfNeeded];
}

id objc_msgSend__updateHeaderSize(void *a1, const char *a2, ...)
{
  return [a1 _updateHeaderSize];
}

id objc_msgSend__updateProgressIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _updateProgressIfNeeded];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_activeStoreAccount(void *a1, const char *a2, ...)
{
  return [a1 activeStoreAccount];
}

id objc_msgSend_adamIDs(void *a1, const char *a2, ...)
{
  return [a1 adamIDs];
}

id objc_msgSend_addAudiobookBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 addAudiobookBackgroundColor];
}

id objc_msgSend_addAudiobookIconSize(void *a1, const char *a2, ...)
{
  return [a1 addAudiobookIconSize];
}

id objc_msgSend_addAudiobookSpecifier(void *a1, const char *a2, ...)
{
  return [a1 addAudiobookSpecifier];
}

id objc_msgSend_albumArtist(void *a1, const char *a2, ...)
{
  return [a1 albumArtist];
}

id objc_msgSend_albumTitle(void *a1, const char *a2, ...)
{
  return [a1 albumTitle];
}

id objc_msgSend_alertHeaderView(void *a1, const char *a2, ...)
{
  return [a1 alertHeaderView];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowsExplicitAudiobooks(void *a1, const char *a2, ...)
{
  return [a1 allowsExplicitAudiobooks];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return [a1 artist];
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return [a1 artworkCatalog];
}

id objc_msgSend_artworkSize(void *a1, const char *a2, ...)
{
  return [a1 artworkSize];
}

id objc_msgSend_artworkURLSession(void *a1, const char *a2, ...)
{
  return [a1 artworkURLSession];
}

id objc_msgSend_artworkURLString(void *a1, const char *a2, ...)
{
  return [a1 artworkURLString];
}

id objc_msgSend_audiobookArtworkPlaceholderImage(void *a1, const char *a2, ...)
{
  return [a1 audiobookArtworkPlaceholderImage];
}

id objc_msgSend_audiobookDownloadLimit(void *a1, const char *a2, ...)
{
  return [a1 audiobookDownloadLimit];
}

id objc_msgSend_audiobookSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 audiobookSpecifiers];
}

id objc_msgSend_audiobookStoreSpecifier(void *a1, const char *a2, ...)
{
  return [a1 audiobookStoreSpecifier];
}

id objc_msgSend_audiobooks(void *a1, const char *a2, ...)
{
  return [a1 audiobooks];
}

id objc_msgSend_audiobooksNonPreordersQuery(void *a1, const char *a2, ...)
{
  return [a1 audiobooksNonPreordersQuery];
}

id objc_msgSend_audiobooksProgressInfo(void *a1, const char *a2, ...)
{
  return [a1 audiobooksProgressInfo];
}

id objc_msgSend_beginObservingSyncInfo(void *a1, const char *a2, ...)
{
  return [a1 beginObservingSyncInfo];
}

id objc_msgSend_beginReceivingSyncProgressUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginReceivingSyncProgressUpdates];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return [a1 collections];
}

id objc_msgSend_containers(void *a1, const char *a2, ...)
{
  return [a1 containers];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_defaultBag(void *a1, const char *a2, ...)
{
  return [a1 defaultBag];
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

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_dsids(void *a1, const char *a2, ...)
{
  return [a1 dsids];
}

id objc_msgSend_editable(void *a1, const char *a2, ...)
{
  return [a1 editable];
}

id objc_msgSend_endObservingSyncInfo(void *a1, const char *a2, ...)
{
  return [a1 endObservingSyncInfo];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_estimatedSyncProgress(void *a1, const char *a2, ...)
{
  return [a1 estimatedSyncProgress];
}

id objc_msgSend_excludeStoreIDs(void *a1, const char *a2, ...)
{
  return [a1 excludeStoreIDs];
}

id objc_msgSend_familyDSIDs(void *a1, const char *a2, ...)
{
  return [a1 familyDSIDs];
}

id objc_msgSend_familyMembers(void *a1, const char *a2, ...)
{
  return [a1 familyMembers];
}

id objc_msgSend_filterPredicates(void *a1, const char *a2, ...)
{
  return [a1 filterPredicates];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_hasCloudAccount(void *a1, const char *a2, ...)
{
  return [a1 hasCloudAccount];
}

id objc_msgSend_hasFetchedInitialRecommendations(void *a1, const char *a2, ...)
{
  return [a1 hasFetchedInitialRecommendations];
}

id objc_msgSend_hasITunesAccount(void *a1, const char *a2, ...)
{
  return [a1 hasITunesAccount];
}

id objc_msgSend_hasStoreAccount(void *a1, const char *a2, ...)
{
  return [a1 hasStoreAccount];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_iCloudDSID(void *a1, const char *a2, ...)
{
  return [a1 iCloudDSID];
}

id objc_msgSend_iCloudUsername(void *a1, const char *a2, ...)
{
  return [a1 iCloudUsername];
}

id objc_msgSend_iTunesDSID(void *a1, const char *a2, ...)
{
  return [a1 iTunesDSID];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 imageDirectoryPath];
}

id objc_msgSend_includeFamily(void *a1, const char *a2, ...)
{
  return [a1 includeFamily];
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return [a1 instance];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCurrentSignedInUser(void *a1, const char *a2, ...)
{
  return [a1 isCurrentSignedInUser];
}

id objc_msgSend_isExplicitMaterialAllowed(void *a1, const char *a2, ...)
{
  return [a1 isExplicitMaterialAllowed];
}

id objc_msgSend_isHeadOfHouseholdSharingPayment(void *a1, const char *a2, ...)
{
  return [a1 isHeadOfHouseholdSharingPayment];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isOutOfSpace(void *a1, const char *a2, ...)
{
  return [a1 isOutOfSpace];
}

id objc_msgSend_isReadingNowEnabled(void *a1, const char *a2, ...)
{
  return [a1 isReadingNowEnabled];
}

id objc_msgSend_isRefreshingFamily(void *a1, const char *a2, ...)
{
  return [a1 isRefreshingFamily];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_isSharingPurchases(void *a1, const char *a2, ...)
{
  return [a1 isSharingPurchases];
}

id objc_msgSend_isStoreAvailable(void *a1, const char *a2, ...)
{
  return [a1 isStoreAvailable];
}

id objc_msgSend_isUserSignedInToiCloud(void *a1, const char *a2, ...)
{
  return [a1 isUserSignedInToiCloud];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_isWantToReadEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWantToReadEnabled];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_libraryGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 libraryGroupSpecifier];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_manuallyPinnedAudiobookIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 manuallyPinnedAudiobookIdentifiers];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_myFamilyMembers(void *a1, const char *a2, ...)
{
  return [a1 myFamilyMembers];
}

id objc_msgSend_myLibraryAudiobooks(void *a1, const char *a2, ...)
{
  return [a1 myLibraryAudiobooks];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return [a1 numberOfSections];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_pendingTasks(void *a1, const char *a2, ...)
{
  return [a1 pendingTasks];
}

id objc_msgSend_performFamilyInfoLookup(void *a1, const char *a2, ...)
{
  return [a1 performFamilyInfoLookup];
}

id objc_msgSend_pinnedAudiobooks(void *a1, const char *a2, ...)
{
  return [a1 pinnedAudiobooks];
}

id objc_msgSend_pinningManager(void *a1, const char *a2, ...)
{
  return [a1 pinningManager];
}

id objc_msgSend_placeholderTintColor(void *a1, const char *a2, ...)
{
  return [a1 placeholderTintColor];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_profilePictureStore(void *a1, const char *a2, ...)
{
  return [a1 profilePictureStore];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return [a1 progressView];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_readingNowAudiobooks(void *a1, const char *a2, ...)
{
  return [a1 readingNowAudiobooks];
}

id objc_msgSend_recommendationSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 recommendationSpecifiers];
}

id objc_msgSend_recommendations(void *a1, const char *a2, ...)
{
  return [a1 recommendations];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_renderHint(void *a1, const char *a2, ...)
{
  return [a1 renderHint];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scaledFittingSize(void *a1, const char *a2, ...)
{
  return [a1 scaledFittingSize];
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return [a1 searchBar];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return [a1 searchController];
}

id objc_msgSend_searchDataSource(void *a1, const char *a2, ...)
{
  return [a1 searchDataSource];
}

id objc_msgSend_searchField(void *a1, const char *a2, ...)
{
  return [a1 searchField];
}

id objc_msgSend_searchQuery(void *a1, const char *a2, ...)
{
  return [a1 searchQuery];
}

id objc_msgSend_searchResults(void *a1, const char *a2, ...)
{
  return [a1 searchResults];
}

id objc_msgSend_searchResultsController(void *a1, const char *a2, ...)
{
  return [a1 searchResultsController];
}

id objc_msgSend_searchString(void *a1, const char *a2, ...)
{
  return [a1 searchString];
}

id objc_msgSend_searchText(void *a1, const char *a2, ...)
{
  return [a1 searchText];
}

id objc_msgSend_secondarySystemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemGroupedBackgroundColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedDataSource(void *a1, const char *a2, ...)
{
  return [a1 sharedDataSource];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedProvider];
}

id objc_msgSend_signInSpecifier(void *a1, const char *a2, ...)
{
  return [a1 signInSpecifier];
}

id objc_msgSend_silhouetteMonogram(void *a1, const char *a2, ...)
{
  return [a1 silhouetteMonogram];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_storeID(void *a1, const char *a2, ...)
{
  return [a1 storeID];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_syncInfo(void *a1, const char *a2, ...)
{
  return [a1 syncInfo];
}

id objc_msgSend_syncInfoController(void *a1, const char *a2, ...)
{
  return [a1 syncInfoController];
}

id objc_msgSend_syncManager(void *a1, const char *a2, ...)
{
  return [a1 syncManager];
}

id objc_msgSend_syncState(void *a1, const char *a2, ...)
{
  return [a1 syncState];
}

id objc_msgSend_syncStatusDetailText(void *a1, const char *a2, ...)
{
  return [a1 syncStatusDetailText];
}

id objc_msgSend_syncWaitingSubstate(void *a1, const char *a2, ...)
{
  return [a1 syncWaitingSubstate];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return [a1 tableHeaderView];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updatePinningManager(void *a1, const char *a2, ...)
{
  return [a1 updatePinningManager];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_wantToReadAudiobooks(void *a1, const char *a2, ...)
{
  return [a1 wantToReadAudiobooks];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}