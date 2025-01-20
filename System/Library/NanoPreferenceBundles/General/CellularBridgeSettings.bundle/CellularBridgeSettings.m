os_log_t define_nph_log(char *category)
{
  os_log_t v1;
  uint64_t vars8;

  v1 = os_log_create("com.apple.NanoPhone", category);

  return v1;
}

id nph_general_log()
{
  if (qword_22EF0 != -1) {
    dispatch_once(&qword_22EF0, &stru_1C578);
  }
  v0 = (void *)qword_22EE8;

  return v0;
}

void sub_58F0(id a1)
{
  qword_22EE8 = (uint64_t)os_log_create("com.apple.NanoPhone", "general");

  _objc_release_x1();
}

id nph_sos_general_log()
{
  if (qword_22F00 != -1) {
    dispatch_once(&qword_22F00, &stru_1C598);
  }
  v0 = (void *)qword_22EF8;

  return v0;
}

void sub_5988(id a1)
{
  qword_22EF8 = (uint64_t)os_log_create("com.apple.NanoPhone", "sos_general");

  _objc_release_x1();
}

id nph_sos_newton_log()
{
  if (qword_22F10 != -1) {
    dispatch_once(&qword_22F10, &stru_1C5B8);
  }
  v0 = (void *)qword_22F08;

  return v0;
}

void sub_5A20(id a1)
{
  qword_22F08 = (uint64_t)os_log_create("com.apple.NanoPhone", "sos_newton");

  _objc_release_x1();
}

void sub_5F74(id a1)
{
  byte_22F18 = MGGetBoolAnswer();
}

void sub_7990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_79B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_7A74;
    v4[3] = &unk_1C600;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    id v5 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

    objc_destroyWeak(&v6);
  }
}

void sub_7A74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained imageView];
  [v2 setImage:*(void *)(a1 + 32)];
}

id CTSUServerQueue()
{
  if (qword_22F30 != -1) {
    dispatch_once(&qword_22F30, &stru_1C648);
  }
  v0 = (void *)qword_22F28;

  return v0;
}

void sub_7D1C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.bridge.nanophone.ctserverqueue", 0);
  v2 = (void *)qword_22F28;
  qword_22F28 = (uint64_t)v1;

  if (!qword_22F28)
  {
    id v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "dispatch_queue_t CTSUServerQueue(void)_block_invoke";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s - unable to create sCTServerQueue", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t CTSUServerConnectionRef()
{
  if (qword_22F40 != -1) {
    dispatch_once(&qword_22F40, &stru_1C668);
  }
  return qword_22F38;
}

void sub_7E30(id a1)
{
  _CTServerConnectionAddIdentifierException();
  dispatch_queue_t v1 = CTSUServerQueue();
  qword_22F38 = _CTServerConnectionCreateOnTargetQueue();

  if (!qword_22F38)
  {
    v2 = nph_general_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      int v4 = "CTServerConnectionRef CTSUServerConnectionRef(void)_block_invoke";
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%s - unable to create sCTServerConnectionRef", (uint8_t *)&v3, 0xCu);
    }
  }
}

void sub_7F34(id a1, __CFString *a2, __CFDictionary *a3)
{
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "CTServerConnectionRef CTSUServerConnectionRef(void)_block_invoke_2";
    __int16 v8 = 2112;
    v9 = a2;
    __int16 v10 = 2112;
    v11 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s notification:%@ info:%@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_8294(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = nph_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_120B8();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    __int16 v8 = [v5 appDataUsageForPeriod:0];
    v9 = nph_general_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "App Data Usage Array: %@", buf, 0xCu);
    }

    __int16 v10 = *(void **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_8448;
    v11[3] = &unk_1C6F8;
    v11[4] = v10;
    id v12 = v5;
    id v13 = *(id *)(a1 + 40);
    [v10 _getappDataUsageArrayfromTempArray:v8 forSystemServices:0 withCompletion:v11];
  }
}

void sub_8448(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_84E8;
  v5[3] = &unk_1C6D0;
  id v6 = *(id *)(a1 + 48);
  [v3 _addTotalUsageItemsToDataUsageArray:a2 deviceDataUsage:v4 completion:v5];
}

void sub_84E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NPHCSAppCellularDataUsageItem userSelectedComparator];
  id v5 = [v3 sortedArrayUsingComparator:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_8858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_8888(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_8898(uint64_t a1)
{
}

void sub_88A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = nph_general_log();
  __int16 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_12138();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[NPHCSCellularDataUsageDataSource _getappDataUsageArrayfromTempArray:forSystemServices:withCompletion:]_block_invoke";
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s - Data usage policies: %@", buf, 0x16u);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    __int16 v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v15 = objc_msgSend(v13, "bundleId", (void)v19);
          v16 = [v14 objectForKeyedSubscript:v15];

          [v16 setDataUsagePolicy:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
  }

  uint64_t v17 = *(void *)(a1 + 32);
  v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) allValues];
  (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
}

void sub_9000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_905C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NPHCSAppCellularDataUsageItem userSelectedComparator];
  id v7 = [v3 sortedArrayUsingComparator:v4];

  [*(id *)(*(void *)(a1[5] + 8) + 40) setChildObjects:v7];
  [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:*(void *)(*(void *)(a1[5] + 8) + 40)];
  uint64_t v5 = a1[4];
  id v6 = [*(id *)(*(void *)(a1[6] + 8) + 40) copy];
  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

void sub_919C(id a1)
{
  id v1 = objc_alloc_init((Class)NSByteCountFormatter);
  v2 = (void *)qword_22F48;
  qword_22F48 = (uint64_t)v1;

  [(id)qword_22F48 setZeroPadsFractionDigits:1];
  [(id)qword_22F48 setAdaptive:0];
  id v3 = (void *)qword_22F48;

  _[v3 setCountStyle:3];
}

uint64_t NPHIsDebugBuild()
{
  return 0;
}

uint64_t NPHDeviceOSIsInternalInstall()
{
  if (qword_22F58 != -1) {
    dispatch_once(&qword_22F58, &stru_1C7B8);
  }
  return byte_22F60;
}

void sub_92C0(id a1)
{
  byte_22F60 = MGGetBoolAnswer();
}

uint64_t NPHDeviceHasBaseband()
{
  if (qword_22F68 != -1) {
    dispatch_once(&qword_22F68, &stru_1C7D8);
  }
  return byte_22F70;
}

void sub_932C(id a1)
{
  byte_22F70 = MGGetBoolAnswer();
}

uint64_t NPHIsWalkaboutEnabled()
{
  if (qword_22F78 != -1) {
    dispatch_once(&qword_22F78, &stru_1C7F8);
  }
  return byte_22F80;
}

void sub_9398(id a1)
{
  CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da");
  if (v1)
  {
    v2 = (void *)v1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v2 isEqualToString:@"walkabout"])
      {
        if (qword_22F58 != -1) {
          dispatch_once(&qword_22F58, &stru_1C7B8);
        }
        byte_22F80 = byte_22F60;
      }
    }
  }

  _objc_release_x1();
}

id NPHWiFiStringKey(void *a1)
{
  id v1 = a1;
  if (MGGetBoolAnswer()) {
    CFStringRef v2 = @"_WLAN";
  }
  else {
    CFStringRef v2 = @"_WIFI";
  }
  id v3 = [v1 stringByAppendingString:v2];

  return v3;
}

uint64_t NPHDeriveProgramName(char *a1)
{
  CFStringRef v2 = strrchr(a1, 47);
  if (v2) {
    id v3 = v2 + 1;
  }
  else {
    id v3 = a1;
  }
  qword_22F88 = +[NSString stringWithUTF8String:v3];

  return _objc_release_x1();
}

void NPHSetTmpDirPrefix()
{
  v0 = +[NSBundle mainBundle];
  id v1 = [v0 bundleIdentifier];
  [v1 cStringUsingEncoding:4];
  char v2 = _set_user_dir_suffix();

  if ((v2 & 1) == 0)
  {
    id v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_121B8(v3);
    }
  }
}

uint64_t NPHSharedUtilitiesLocaleHaptic()
{
  return 0xFFFFFFFFLL;
}

uint64_t NPHSharedUtilitiesLocaleHapticDucked()
{
  return 0xFFFFFFFFLL;
}

id NPHSharedUtilitiesAppendBuildVersion(void *a1)
{
  id v1 = a1;
  uint64_t v2 = MGCopyAnswer();
  id v3 = (void *)v2;
  uint64_t v4 = @"unknown";
  if (v2) {
    uint64_t v4 = (__CFString *)v2;
  }
  uint64_t v5 = v4;

  id v6 = +[NSString stringWithFormat:@"%@.%@.", v1, v5];

  return v6;
}

id NSStringFromTUCallDisconnectedReason(unsigned int a1)
{
  if (a1 < 0x1A && ((0x3EFFFFFu >> a1) & 1) != 0)
  {
    id v1 = *(&off_1C8A0 + (int)a1);
  }
  else
  {
    id v1 = +[NSString stringWithFormat:@"unhadled TUCallDisconnectedReason in %s", "NSString *NSStringFromTUCallDisconnectedReason(TUCallDisconnectedReason)"];
  }

  return v1;
}

void sub_97FC(id a1)
{
  id v1 = +[NRDevice activeDevice];
  byte_22F98 = [v1 hasHomeButton];
}

void sub_99A4(id a1)
{
  id v1 = +[NSBundle bundleWithIdentifier:@"com.apple.private.NanoPhoneUI"];
  v8[0] = @"CALL_SERVICE_FACETIME_AUDIO";
  uint64_t v2 = objc_msgSend(v1, "localizedStringForKey:value:table:");
  v9[0] = v2;
  v8[1] = @"CALL_SERVICE_FACETIME_VIDEO";
  id v3 = objc_msgSend(v1, "localizedStringForKey:value:table:");
  v9[1] = v3;
  v8[2] = @"CALL_SERVICE_FACETIME_AUDIO_UPPERCASE";
  uint64_t v4 = objc_msgSend(v1, "localizedStringForKey:value:table:");
  v9[2] = v4;
  v8[3] = @"CALL_SERVICE_FACETIME_VIDEO_UPPERCASE";
  uint64_t v5 = objc_msgSend(v1, "localizedStringForKey:value:table:");
  v9[3] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
  id v7 = (void *)qword_22FA0;
  qword_22FA0 = v6;
}

uint64_t sub_9DC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

double mach_time_elapsed_to_seconds(uint64_t a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return (double)(info.numer * a1 / info.denom) / 1000000000.0;
}

void nph_ensure_on_main_queue(void *a1)
{
  block = a1;
  if (+[NSThread isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_A15C(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  id v3 = (void *)qword_22FB8;
  qword_22FB8 = (uint64_t)v2;

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:"_NPHIdleTimeNotification:" name:@"NPHIdleNotification" object:0];
}

void sub_B2AC(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1225C((uint64_t)v2, v3);
    }
  }
}

int64_t sub_B310(id a1, NPHCSAppCellularDataUsageItem *a2, NPHCSAppCellularDataUsageItem *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  if ([(NPHCSAppCellularDataUsageItem *)v4 isTotalUsage])
  {
    int64_t v6 = -1;
  }
  else if ([(NPHCSAppCellularDataUsageItem *)v5 isTotalUsage])
  {
    int64_t v6 = 1;
  }
  else
  {
    id v7 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v8 = [v7 BOOLForKey:@"NPHCSBridgeCellularUsageShouldSortByNameKey"];

    if ((v8 & 1) != 0
      || (id v9 = [(NPHCSAppCellularDataUsageItem *)v4 bytesUsed],
          v9 == (id)[(NPHCSAppCellularDataUsageItem *)v5 bytesUsed]))
    {
      uint64_t v10 = [(NPHCSAppCellularDataUsageItem *)v4 displayName];
      uint64_t v11 = [(NPHCSAppCellularDataUsageItem *)v5 displayName];
      int64_t v6 = (int64_t)[v10 localizedStandardCompare:v11];
    }
    else
    {
      id v12 = [(NPHCSAppCellularDataUsageItem *)v4 bytesUsed];
      int64_t v6 = v12 < (id)[(NPHCSAppCellularDataUsageItem *)v5 bytesUsed];
    }
  }

  return v6;
}

void sub_C84C(uint64_t a1)
{
  id v2 = +[NSMutableArray array];
  id v3 = [*(id *)(a1 + 32) activeCellularPlans];
  id v4 = [v3 count];
  uint64_t v5 = [*(id *)(a1 + 32) inactiveCellularPlans];
  int64_t v6 = (char *)[v5 count];

  id v7 = +[NPHCellularBridgeUIManager sharedInstance];
  unsigned __int8 v8 = [v7 serviceSubscriptionsShouldShowAddNewRemotePlan];
  id v9 = [v8 count];

  v40[0] = @"activeCellularPlansSection";
  v39[0] = @"key";
  v39[1] = @"count";
  uint64_t v10 = [*(id *)(a1 + 32) activeCellularPlans];
  uint64_t v11 = (char *)[v10 count];
  if (&v6[(void)v4]) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 + 1;
  }
  uint64_t v14 = +[NSNumber numberWithUnsignedInteger:v13];
  v40[1] = v14;
  v39[2] = @"header";
  uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"ACTIVE_CELLULAR_PLANS_HEADER" value:&stru_1CDE0 table:0];
  v40[2] = v16;
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
  [v2 addObject:v17];

  v18 = [*(id *)(a1 + 32) inactiveCellularPlans];
  id v19 = [v18 count];

  if (v19)
  {
    v38[0] = @"inactiveCellularPlansSection";
    v37[0] = @"key";
    v37[1] = @"count";
    long long v20 = [*(id *)(a1 + 32) inactiveCellularPlans];
    long long v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 count]);
    v38[1] = v21;
    v37[2] = @"header";
    long long v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"DISABLED_CELLULAR_PLANS_HEADER" value:&stru_1CDE0 table:0];
    v38[2] = v23;
    v24 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
    [v2 addObject:v24];
  }
  if ([*(id *)(a1 + 32) _shouldShowCellularDataUsage])
  {
    v36[0] = @"appsDataUsageSection";
    v35[0] = @"key";
    v35[1] = @"count";
    v25 = [*(id *)(a1 + 32) appsDataUsageArray];
    __int16 v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v25 count]);
    v36[1] = v26;
    v35[2] = @"header";
    id v27 = +[NSBundle bundleForClass:objc_opt_class()];
    v28 = [v27 localizedStringForKey:@"CELLULAR_DATA_USAGE_GROUP_HEADER" value:&stru_1CDE0 table:0];
    v36[2] = v28;
    v29 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
    [v2 addObject:v29];

    v33[0] = @"key";
    v33[1] = @"count";
    v34[0] = @"resetDataUsageSection";
    v34[1] = &off_1DE00;
    v33[2] = @"header";
    v34[2] = &stru_1CDE0;
    v30 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
    [v2 addObject:v30];
  }
  id v31 = [v2 copy];
  [*(id *)(a1 + 32) setSections:v31];

  v32 = [*(id *)(a1 + 32) tableView];
  [v32 reloadData];
}

BOOL sub_CD58(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = [(NSError *)v2 domain];
  if ([v3 isEqualToString:CTCellularPlanErrorDomain]) {
    BOOL v4 = (segment_command_64 *)[(NSError *)v2 code] == &stru_20;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_CE94(uint64_t a1)
{
  id v2 = +[CTCellularPlanManager sharedManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_CF54;
  v4[3] = &unk_1CA90;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  [v2 didSelectRemotePlanItem:(id)v3.i64[0] completion:v4];

  [*(id *)(a1 + 40) _updateTableView];
}

void sub_CF54(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int64_t v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[NPHCSBridgeCellularSettingsViewController _switchToCellularPlanItem:]_block_invoke_2";
    __int16 v17 = 1024;
    int v18 = a2;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s wasSuccessful:%d error:%@", buf, 0x1Cu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_D0A8;
  v10[3] = &unk_1CA68;
  char v14 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  unsigned __int8 v8 = *(void **)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v8;
  id v9 = v5;
  nph_ensure_on_main_queue(v10);
}

id sub_D0A8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      int8x16_t v3 = *(void **)(a1 + 40);
      BOOL v4 = +[NPHCellularBridgeUIManager sharedInstance];
      id v5 = [v4 subscriptionContextForCellularPlanItem:*(void *)(a1 + 48)];
      int64_t v6 = +[NSError NPHCellularSanitizedError:v2 forSubscriptionContext:v5];
      [v3 presentError:v6];
    }
  }
  uint64_t v7 = *(void **)(a1 + 40);

  return [v7 _updateTableView];
}

void sub_D358(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_D3F4;
  v8[3] = &unk_1CAE0;
  char v11 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  nph_ensure_on_main_queue(v8);
}

void sub_D3F4(int8x16_t *a1)
{
  uint64_t v2 = nph_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = a1[3].u8[0];
    uint64_t v4 = a1[2].i64[0];
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = "-[NPHCSBridgeCellularSettingsViewController _userDidProvideResponse:forPlan:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%s - success:%d error:%@", buf, 0x1Cu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D538;
  block[3] = &unk_1CAB8;
  int8x16_t v6 = a1[2];
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_D538(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) setPromptingUserForConsent:0];
  if (*(void *)(a1 + 40))
  {
    int v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "presentError:");
  }
  return result;
}

id sub_D8D0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _userDidProvideResponse:0 forPlan:*(void *)(a1 + 40)];
}

id sub_D8E0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _userDidProvideResponse:1 forPlan:*(void *)(a1 + 40)];
}

BOOL sub_DEEC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  int v3 = [(NSError *)v2 domain];
  if ([v3 isEqualToString:NPHCellularErrorDomain]) {
    char v4 = (int *)[(NSError *)v2 code] != &dword_4;
  }
  else {
    char v4 = 1;
  }

  return v4;
}

id sub_E18C(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    int v3 = nph_general_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_12440(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    [*(id *)(a1 + 40) presentError:*(void *)(a1 + 32)];
  }
  uint64_t v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:kActiveCellularPlans];
  [*(id *)(a1 + 40) setActiveCellularPlans:v10];

  __int16 v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:kInactiveCellularPlans];
  [*(id *)(a1 + 40) setInactiveCellularPlans:v11];

  [*(id *)(a1 + 40) _promptUserForConsentIfNecessary];
  return [*(id *)(a1 + 40) _updateTableView];
}

id sub_E368(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setAppsDataUsageArray:a2];
  int v3 = *(void **)(a1 + 32);

  return [v3 _updateTableView];
}

void sub_E540(id a1)
{
  id v1 = nph_general_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    int v3 = "-[NPHCSBridgeCellularSettingsViewController _setUpPlan]_block_invoke";
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "%s Presented NPHCellularSetupViewController", (uint8_t *)&v2, 0xCu);
  }
}

void sub_E770(uint64_t a1, uint64_t a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_E7E0;
  v2[3] = &unk_1CBE8;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = a2;
  nph_ensure_on_main_queue(v2);
}

void sub_E7E0(uint64_t a1)
{
  int v2 = nph_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    int v4 = *(_DWORD *)(a1 + 44);
    *(_DWORD *)buf = 136315650;
    uint64_t v8 = "-[NPHCSBridgeCellularSettingsViewController _clearStats]_block_invoke_2";
    __int16 v9 = 1024;
    int v10 = v3;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%s: domain: %d, error: %d", buf, 0x18u);
  }

  if (*(_DWORD *)(a1 + 40))
  {
    uint64_t v5 = +[NSError errorWithDomain:NPHCellularDataUsageErrorDomain code:*(int *)(a1 + 44) userInfo:0];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_E938;
    v6[3] = &unk_1CAB8;
    v6[4] = *(void *)(a1 + 32);
    v6[5] = v5;
    nph_ensure_on_main_queue(v6);
  }
  else
  {
    [*(id *)(a1 + 32) _updateCellularDataUsageItems];
  }
}

id sub_E938(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentError:*(void *)(a1 + 40)];
}

void sub_EF1C(uint64_t a1)
{
  int v2 = nph_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "manage plan:%@", buf, 0xCu);
  }

  int v4 = +[NSNumber numberWithInteger:8, @"FlowTypeKey"];
  v16[0] = v4;
  v15[1] = @"CarrierNameKey";
  uint64_t v5 = [*(id *)(a1 + 32) plan];
  uint64_t v6 = [v5 carrierName];
  v16[1] = v6;
  v15[2] = @"Iccid";
  uint64_t v7 = [*(id *)(a1 + 32) plan];
  uint64_t v8 = [v7 iccid];
  v16[2] = v8;
  __int16 v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  uint64_t v10 = +[TSSIMSetupFlow flowWithOptions:v9];
  uint64_t v11 = *(void *)(a1 + 40);
  int v12 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = v10;

  __int16 v13 = [*(id *)(*(void *)(a1 + 40) + 32) firstViewController];
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "setDelegate:");
  id v14 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v13];
  [*(id *)(a1 + 40) presentViewController:v14 animated:1 completion:0];
}

id sub_F114(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _promptUserToConfirmPlanRemoval:*(void *)(a1 + 40) willRemoveMoreThanOnePlan:*(unsigned __int8 *)(a1 + 48)];
}

id sub_F4DC(uint64_t a1)
{
  int v2 = nph_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "didDeleteRemotePlanItem:%@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _removePlan:*(void *)(a1 + 32)];
}

id sub_F58C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTableView];
}

void sub_F744(uint64_t a1, char a2, void *a3)
{
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  __int16 v9 = sub_F808;
  uint64_t v10 = &unk_1CA68;
  char v14 = a2;
  id v11 = a3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v12 = v4;
  uint64_t v13 = v5;
  id v6 = v11;
  nph_ensure_on_main_queue(&v7);
  objc_msgSend(*(id *)(a1 + 40), "_removeTinkerDeviceAssertion", v7, v8, v9, v10);
}

void sub_F808(uint64_t a1)
{
  int v2 = nph_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    int v13 = 136315650;
    char v14 = "-[NPHCSBridgeCellularSettingsViewController _removePlan:]_block_invoke_2";
    __int16 v15 = 1024;
    int v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%s wasSuccessful:%d error:%@", (uint8_t *)&v13, 0x1Cu);
  }

  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      id v6 = +[NPHCellularBridgeUIManager sharedInstance];
      uint64_t v7 = [v6 subscriptionContextForCellularPlanItem:*(void *)(a1 + 40)];
      uint64_t v8 = +[NSError NPHCellularSanitizedError:v5 forSubscriptionContext:v7];

      __int16 v9 = nph_general_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_12548();
      }

      [*(id *)(a1 + 48) presentError:v8];
    }
    else
    {
      uint64_t v10 = nph_general_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_124C4(v10);
      }

      id v11 = *(void **)(a1 + 48);
      uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
      id v12 = [v8 localizedStringForKey:@"REMOVE_PLAN_UNSUCCESSFUL" value:&stru_1CDE0 table:0];
      [v11 presentErrorMessage:v12];
    }
  }
}

void sub_FBA8(id a1)
{
  id v1 = nph_general_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_125BC(v1);
  }
}

void sub_FBEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[NPHCSBridgeCellularSettingsViewController _getTinkerDeviceAssertion]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s setActivePairedDevice: error %@ assertion %@", (uint8_t *)&v9, 0x20u);
  }

  if (v6)
  {
    uint64_t v8 = [*(id *)(a1 + 32) tinkerDeviceAssertion];
    [v8 invalidate];

    [*(id *)(a1 + 32) setTinkerDeviceAssertion:v6];
  }
}

void sub_10364(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_10634()
{
  return sub_117A4(OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_titleLabel);
}

uint64_t sub_1069C(uint64_t a1)
{
  return sub_11798(a1, OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_titleLabel);
}

id sub_106DC()
{
  return sub_117A4(OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortControlsStackView);
}

uint64_t sub_10744(uint64_t a1)
{
  return sub_11798(a1, OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortControlsStackView);
}

id sub_10784()
{
  return sub_117A4(OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortingTypeLabel);
}

uint64_t sub_107EC(uint64_t a1)
{
  return sub_11798(a1, OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortingTypeLabel);
}

id sub_1082C()
{
  return sub_117A4(OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortToggle);
}

uint64_t sub_10894(uint64_t a1)
{
  return sub_11798(a1, OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortToggle);
}

id sub_108A0(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)UILabel);
  id v5 = v2;
  id v6 = [v4 init];
  *(void *)&v5[OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_titleLabel] = v6;
  id v7 = [objc_allocWithZone((Class)UIStackView) init];
  *(void *)&v5[OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortControlsStackView] = v7;
  id v8 = [objc_allocWithZone((Class)UILabel) init];
  *(void *)&v5[OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortingTypeLabel] = v8;
  id v9 = [objc_allocWithZone((Class)UIButton) init];
  *(void *)&v5[OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortToggle] = v9;

  if (a2)
  {
    NSString v10 = sub_12650();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for NPHCSCellularUsageHeaderView();
  id v11 = objc_msgSendSuper2(&v14, "initWithReuseIdentifier:", v10);

  id v12 = v11;
  sub_10A74();

  return v12;
}

void sub_10A08()
{
}

void sub_10A74()
{
  id v1 = v0;
  sub_11390();
  uint64_t v2 = OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_titleLabel;
  int v3 = *(void **)&v0[OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_titleLabel];
  v66 = self;
  id v4 = v3;
  id v5 = [v66 preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v4 setFont:v5];

  id v6 = *(void **)&v1[v2];
  id v7 = self;
  id v8 = v6;
  id v9 = [v7 systemGrayColor];
  [v8 setTextColor:v9];

  [*(id *)&v1[v2] setNumberOfLines:0];
  [*(id *)&v1[v2] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = sub_117C0();
  [v10 addSubview:*(void *)&v1[v2]];

  id v68 = self;
  sub_11714(&qword_22E00);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1B110;
  id v12 = [*(id *)&v1[v2] leadingAnchor];
  id v13 = sub_117C0();
  id v14 = [v13 layoutMarginsGuide];

  id v15 = [v14 leadingAnchor];
  id v16 = sub_117D8();

  *(void *)(v11 + 32) = v16;
  id v17 = [*(id *)&v1[v2] trailingAnchor];
  id v18 = sub_117C0();
  id v19 = [v18 layoutMarginsGuide];

  id v20 = [v19 trailingAnchor];
  id v21 = sub_117D8();

  *(void *)(v11 + 40) = v21;
  id v22 = [*(id *)&v1[v2] topAnchor];
  id v23 = sub_117C0();
  id v24 = [v23 layoutMarginsGuide];

  id v25 = [v24 topAnchor];
  id v26 = sub_117D8();

  *(void *)(v11 + 48) = v26;
  sub_12680();
  sub_11758();
  Class isa = sub_12670().super.isa;
  swift_bridgeObjectRelease();
  [v68 activateConstraints:isa];

  uint64_t v28 = OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortControlsStackView;
  [*(id *)&v1[OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortControlsStackView] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v29 = [v1 traitCollection];
  v30 = (NSString *)[v29 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v30);
  [*(id *)&v1[v28] setAxis:IsAccessibilityCategory];
  [*(id *)&v1[v28] setDistribution:0];
  [*(id *)&v1[v28] setSpacing:8.0];
  id v32 = sub_117C0();
  [v32 addSubview:*(void *)&v1[v28]];

  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1B120;
  id v34 = [*(id *)&v1[v28] topAnchor];
  id v35 = [*(id *)&v1[v2] bottomAnchor];
  id v36 = [v34 constraintEqualToAnchor:v35];

  *(void *)(v33 + 32) = v36;
  id v37 = [*(id *)&v1[v28] bottomAnchor];
  id v38 = sub_117C0();
  id v39 = [v38 layoutMarginsGuide];

  id v40 = [v39 bottomAnchor];
  double v41 = 0.0;
  if (IsAccessibilityCategory) {
    double v41 = -8.0;
  }
  id v42 = [v37 constraintEqualToAnchor:v40 constant:v41];

  *(void *)(v33 + 40) = v42;
  id v43 = [*(id *)&v1[v28] leadingAnchor];
  id v44 = [v1 layoutMarginsGuide];
  id v45 = [v44 leadingAnchor];

  id v46 = [v43 constraintEqualToAnchor:v45];
  *(void *)(v33 + 48) = v46;
  id v47 = [*(id *)&v1[v28] trailingAnchor];
  id v48 = [v1 layoutMarginsGuide];
  id v49 = [v48 trailingAnchor];

  id v50 = [v47 constraintEqualToAnchor:v49];
  *(void *)(v33 + 56) = v50;
  sub_12680();
  Class v51 = sub_12670().super.isa;
  swift_bridgeObjectRelease();
  [v68 activateConstraints:v51];

  uint64_t v52 = OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortingTypeLabel;
  id v53 = *(id *)&v1[OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortingTypeLabel];
  id v54 = objc_msgSend(v66, "preferredFontForTextStyle:");
  [v53 setFont:v54];

  [*(id *)&v1[v52] setNumberOfLines:0];
  uint64_t v55 = OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortToggle;
  id v56 = [*(id *)&v1[OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortToggle] titleLabel];
  if (v56)
  {
    v57 = v56;
    id v58 = [v66 preferredFontForTextStyle:UIFontTextStyleFootnote];
    [v57 setFont:v58];
  }
  id v59 = [*(id *)&v1[v55] titleLabel];
  [v59 setNumberOfLines:0];

  [*(id *)&v1[v55] setContentHorizontalAlignment:2];
  unsigned __int8 v60 = [v1 _shouldReverseLayoutDirection];
  if (!IsAccessibilityCategory)
  {
    if ((v60 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ((v60 & 1) == 0) {
LABEL_9:
  }
    [*(id *)&v1[v55] setContentHorizontalAlignment:1];
LABEL_10:
  [*(id *)&v1[v28] addArrangedSubview:*(void *)&v1[v52]];
  [*(id *)&v1[v28] addArrangedSubview:*(void *)&v1[v55]];
  uint64_t v61 = swift_allocObject();
  *(_OWORD *)(v61 + 16) = xmmword_1B130;
  id v62 = [*(id *)&v1[v52] widthAnchor];
  id v63 = [v62 constraintGreaterThanOrEqualToConstant:100.0];

  *(void *)(v61 + 32) = v63;
  id v64 = [*(id *)&v1[v55] widthAnchor];
  id v65 = [v64 constraintGreaterThanOrEqualToConstant:150.0];

  *(void *)(v61 + 40) = v65;
  sub_12680();
  Class v67 = sub_12670().super.isa;
  swift_bridgeObjectRelease();
  [v68 activateConstraints:v67];
}

void sub_11390()
{
  uint64_t v1 = v0;
  id v2 = [self standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"NPHCSBridgeCellularUsageShouldSortByNameKey"];

  uint64_t v4 = qword_22DB0;
  id v5 = *(id *)(v1 + OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_titleLabel);
  if (v4 != -1) {
    swift_once();
  }
  v17._countAndFlagsBits = sub_117AC();
  uint64_t v6 = sub_118C8(v17);
  sub_1163C(v6, v7, v5);

  id v8 = *(id *)(v1 + OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortingTypeLabel);
  if (v3)
  {
    v9._countAndFlagsBits = sub_117AC();
  }
  else
  {
    v9._countAndFlagsBits = 0xD000000000000021;
    v9._object = (void *)0x8000000000017760;
  }
  uint64_t v10 = sub_118C8(v9);
  sub_1163C(v10, v11, v8);

  id v15 = *(id *)(v1 + OBJC_IVAR____TtC22CellularBridgeSettings28NPHCSCellularUsageHeaderView_sortToggle);
  if (v3)
  {
    v12._countAndFlagsBits = 0xD000000000000021;
    v12._object = (void *)0x80000000000177C0;
  }
  else
  {
    v12._countAndFlagsBits = sub_117AC();
  }
  uint64_t v13 = sub_118C8(v12);
  sub_116A0(v13, v14, 0, v15);
}

id sub_11578()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NPHCSCellularUsageHeaderView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NPHCSCellularUsageHeaderView()
{
  return self;
}

void sub_1163C(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_12650();
  swift_bridgeObjectRelease();
  [a3 setText:v4];
}

void sub_116A0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v6 = sub_12650();
  swift_bridgeObjectRelease();
  [a4 setTitle:v6 forState:a3];
}

uint64_t sub_11714(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_11758()
{
  unint64_t result = qword_22E08;
  if (!qword_22E08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_22E08);
  }
  return result;
}

uint64_t sub_11798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return _objc_release_x1();
}

id sub_117A4@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(v1 + a1);
}

unint64_t sub_117AC()
{
  return 0xD000000000000020;
}

id sub_117C0()
{
  unsigned int v3 = *(const char **)(v1 + 1304);
  return [v0 v3];
}

id sub_117D8()
{
  NSString v4 = *(const char **)(v2 + 1336);
  return objc_msgSend(v0, v4, v1);
}

void *sub_117F4()
{
  type metadata accessor for Localization();
  swift_allocObject();
  unint64_t result = sub_11830();
  qword_22FC0 = (uint64_t)result;
  return result;
}

void *sub_11830()
{
  v0[3] = 0x617A696C61636F4CLL;
  v0[4] = 0xEB00000000656C62;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v0[2] = [self bundleForClass:ObjCClassFromMetadata];
  return v0;
}

uint64_t sub_118C8(Swift::String a1)
{
  v2.super.Class isa = *(Class *)(v1 + 16);
  v4._countAndFlagsBits = 0xE000000000000000;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  return sub_12640(a1, *(Swift::String_optional *)(v1 + 24), v2, v5, v4);
}

uint64_t sub_11904()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1192C()
{
  sub_11904();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for Localization()
{
  return self;
}

id sub_119B8()
{
  return *(id *)(v0 + OBJC_IVAR____TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView_textView);
}

uint64_t sub_11A24(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView_textView) = a1;
  return _objc_release_x1();
}

id sub_11A38(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)UITextView);
  Swift::String v5 = v2;
  id v6 = [v4 init];
  *(void *)&v5[OBJC_IVAR____TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView_textView] = v6;

  if (a2)
  {
    NSString v7 = sub_12650();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for NPHCSFooterHyperLinkView();
  id v8 = objc_msgSendSuper2(&v11, "initWithReuseIdentifier:", v7);

  id v9 = v8;
  sub_11BB0();

  return v9;
}

void sub_11B44()
{
}

void sub_11BB0()
{
  uint64_t v1 = OBJC_IVAR____TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView_textView;
  [*(id *)(v0 + OBJC_IVAR____TtC22CellularBridgeSettings24NPHCSFooterHyperLinkView_textView) setScrollEnabled:0];
  [*(id *)(v0 + v1) setDataDetectorTypes:3];
  NSBundle v2 = *(void **)(v0 + v1);
  uint64_t v3 = self;
  id v4 = v2;
  id v5 = [v3 _defaultTextColorForTableViewStyle:1 isSectionHeader:0];
  [v4 setTextColor:v5];

  id v6 = *(id *)(v0 + v1);
  id v7 = [v3 _defaultFontForTableViewStyle:1 isSectionHeader:0];
  [v6 setFont:v7];

  [*(id *)(v0 + v1) setEditable:0];
  [*(id *)(v0 + v1) setSelectable:1];
  [*(id *)(v0 + v1) setUserInteractionEnabled:1];
  [*(id *)(v0 + v1) setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = sub_120A0();
  [v8 addSubview:*(void *)(v0 + v1)];

  v30 = self;
  sub_11714(&qword_22E00);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1B120;
  id v10 = [*(id *)(v0 + v1) leadingAnchor];
  id v11 = sub_120A0();
  id v12 = [v11 layoutMarginsGuide];

  id v13 = [v12 leadingAnchor];
  id v14 = sub_12084();

  *(void *)(v9 + 32) = v14;
  id v15 = [*(id *)(v0 + v1) trailingAnchor];
  id v16 = sub_120A0();
  id v17 = [v16 layoutMarginsGuide];

  id v18 = [v17 trailingAnchor];
  id v19 = sub_12084();

  *(void *)(v9 + 40) = v19;
  id v20 = sub_120A0();
  id v21 = [v20 layoutMarginsGuide];

  id v22 = [v21 heightAnchor];
  id v23 = [*(id *)(v0 + v1) heightAnchor];
  id v24 = sub_12084();

  *(void *)(v9 + 48) = v24;
  id v25 = sub_120A0();
  id v26 = [v25 layoutMarginsGuide];

  id v27 = [v26 widthAnchor];
  id v28 = [*(id *)(v0 + v1) widthAnchor];
  id v29 = [v27 constraintEqualToAnchor:v28];

  *(void *)(v9 + 56) = v29;
  sub_12680();
  sub_11758();
  Class isa = sub_12670().super.isa;
  swift_bridgeObjectRelease();
  [v30 activateConstraints:isa];
}

id sub_1201C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NPHCSFooterHyperLinkView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NPHCSFooterHyperLinkView()
{
  return self;
}

id sub_12084()
{
  id v4 = *(const char **)(v2 + 1336);
  return objc_msgSend(v0, v4, v1);
}

id sub_120A0()
{
  uint64_t v3 = *(const char **)(v1 + 1304);
  return [v0 v3];
}

void sub_120B8()
{
  v1[0] = 136315394;
  sub_9260();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%s: Failed to get device data usage: %@", (uint8_t *)v1, 0x16u);
}

void sub_12138()
{
  v1[0] = 136315394;
  sub_9260();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%s - Failed to get data usage policies: %@", (uint8_t *)v1, 0x16u);
}

void sub_121B8(NSObject *a1)
{
  int v2 = *__error();
  int v3 = 136315394;
  id v4 = "void NPHSetTmpDirPrefix(void)";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_0, a1, OS_LOG_TYPE_ERROR, "%s: failed, errno: %d", (uint8_t *)&v3, 0x12u);
}

void sub_1225C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[NPHCSAppCellularDataUsageItem setUsagePoliciesForCellular:andWifi:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v2, 0x16u);
}

void sub_122E8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to get a non-null cell", v1, 2u);
}

void sub_1232C(void *a1, NSObject *a2)
{
  int v3 = 136315394;
  __int16 v4 = "-[NPHCSBridgeCellularSettingsViewController tableView:didSelectRowAtIndexPath:]";
  __int16 v5 = 2048;
  id v6 = [a1 row];
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s - plan selection index out of range:%ld", (uint8_t *)&v3, 0x16u);
}

void sub_123CC()
{
  sub_9260();
  sub_10364(&dword_0, v0, v1, "%s cannot select plan:%@", v2, v3, v4, v5, 2u);
}

void sub_12440(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_124C4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[NPHCSBridgeCellularSettingsViewController _removePlan:]_block_invoke";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s - Unable to Delete Error", (uint8_t *)&v1, 0xCu);
}

void sub_12548()
{
  sub_9260();
  sub_10364(&dword_0, v0, v1, "%s - error: %@", v2, v3, v4, v5, 2u);
}

void sub_125BC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[NPHCSBridgeCellularSettingsViewController _getTinkerDeviceAssertion]_block_invoke";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s background task expired unexpectedly", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_12640(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

NSString sub_12650()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_12660()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

NSArray sub_12670()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_12680()
{
  return specialized Array._endMutation()();
}

uint64_t sub_12690()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

uint64_t BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler()
{
  return _BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t PSBlankIconImage()
{
  return _PSBlankIconImage();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionAddIdentifierException()
{
  return __CTServerConnectionAddIdentifierException();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

uint64_t _CTServerConnectionEraseCellularDataUsageRecordsEx()
{
  return __CTServerConnectionEraseCellularDataUsageRecordsEx();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_once()
{
  return _swift_once();
}

id objc_msgSend_LTEMayImpactService(void *a1, const char *a2, ...)
{
  return _[a1 LTEMayImpactService];
}

id objc_msgSend_NPHCellularErrorWithCode_forSubscriptionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NPHCellularErrorWithCode:forSubscriptionContext:");
}

id objc_msgSend_NPHCellularSanitizedError_forSubscriptionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NPHCellularSanitizedError:forSubscriptionContext:");
}

id objc_msgSend_NPHRequestIdleTimeNotification(void *a1, const char *a2, ...)
{
  return _[a1 NPHRequestIdleTimeNotification];
}

id objc_msgSend__addTotalUsageItemsToDataUsageArray_deviceDataUsage_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addTotalUsageItemsToDataUsageArray:deviceDataUsage:completion:");
}

id objc_msgSend__checkForUpdatedCarrierBundle(void *a1, const char *a2, ...)
{
  return _[a1 _checkForUpdatedCarrierBundle];
}

id objc_msgSend__clearStats(void *a1, const char *a2, ...)
{
  return _[a1 _clearStats];
}

id objc_msgSend__currentDeviceCSN(void *a1, const char *a2, ...)
{
  return _[a1 _currentDeviceCSN];
}

id objc_msgSend__dataUsageStringForBytesUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataUsageStringForBytesUsed:");
}

id objc_msgSend__deleteWillPerformEUICCReset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteWillPerformEUICCReset:");
}

id objc_msgSend__displaySoftwareUpdateAlertIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _displaySoftwareUpdateAlertIfNeeded];
}

id objc_msgSend__errorsForFooterMessage(void *a1, const char *a2, ...)
{
  return _[a1 _errorsForFooterMessage];
}

id objc_msgSend__extendBackgroundAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _extendBackgroundAssertion];
}

id objc_msgSend__footerStringForErrors(void *a1, const char *a2, ...)
{
  return _[a1 _footerStringForErrors];
}

id objc_msgSend__getTinkerDeviceAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _getTinkerDeviceAssertion];
}

id objc_msgSend__getappDataUsageArrayfromTempArray_forSystemServices_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getappDataUsageArrayfromTempArray:forSystemServices:withCompletion:");
}

id objc_msgSend__isMusicApp(void *a1, const char *a2, ...)
{
  return _[a1 _isMusicApp];
}

id objc_msgSend__isStreamingAllowedForRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isStreamingAllowedForRow:");
}

id objc_msgSend__planStatusDescriptionForPlanPropertyStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_planStatusDescriptionForPlanPropertyStatus:");
}

id objc_msgSend__promptUserForConsent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_promptUserForConsent:");
}

id objc_msgSend__promptUserForConsentIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _promptUserForConsentIfNecessary];
}

id objc_msgSend__removePlan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePlan:");
}

id objc_msgSend__removeTinkerDeviceAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _removeTinkerDeviceAssertion];
}

id objc_msgSend__resetStatisticsCell(void *a1, const char *a2, ...)
{
  return _[a1 _resetStatisticsCell];
}

id objc_msgSend__setIcon(void *a1, const char *a2, ...)
{
  return _[a1 _setIcon];
}

id objc_msgSend__setUpCellularPlanCell(void *a1, const char *a2, ...)
{
  return _[a1 _setUpCellularPlanCell];
}

id objc_msgSend__shouldShowCellularDataUsage(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowCellularDataUsage];
}

id objc_msgSend__showManageOrDeleteForCellularPlanItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showManageOrDeleteForCellularPlanItem:");
}

id objc_msgSend__showStatusSpinnerForPlanStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showStatusSpinnerForPlanStatus:");
}

id objc_msgSend__sortCellularDataUsageItems(void *a1, const char *a2, ...)
{
  return _[a1 _sortCellularDataUsageItems];
}

id objc_msgSend__switchToCellularPlanItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchToCellularPlanItem:");
}

id objc_msgSend__updateCellularDataUsageItems(void *a1, const char *a2, ...)
{
  return _[a1 _updateCellularDataUsageItems];
}

id objc_msgSend__updateTableView(void *a1, const char *a2, ...)
{
  return _[a1 _updateTableView];
}

id objc_msgSend_accessorySwitch(void *a1, const char *a2, ...)
{
  return _[a1 accessorySwitch];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return _[a1 accessoryView];
}

id objc_msgSend_accountURL(void *a1, const char *a2, ...)
{
  return _[a1 accountURL];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activeCellularPlans(void *a1, const char *a2, ...)
{
  return _[a1 activeCellularPlans];
}

id objc_msgSend_activeDevice(void *a1, const char *a2, ...)
{
  return _[a1 activeDevice];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return _[a1 activeDeviceSelectorBlock];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forEvents:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_appDataUsageForPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appDataUsageForPeriod:");
}

id objc_msgSend_appDataUsageItem(void *a1, const char *a2, ...)
{
  return _[a1 appDataUsageItem];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appsDataUsageArray(void *a1, const char *a2, ...)
{
  return _[a1 appsDataUsageArray];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_beginBackgroundTaskWithName_expirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginBackgroundTaskWithName:expirationHandler:");
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

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bytesUsed(void *a1, const char *a2, ...)
{
  return _[a1 bytesUsed];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_carrierName(void *a1, const char *a2, ...)
{
  return _[a1 carrierName];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_cellForTableView_reuseIdentifier_appDataUsageItem_isCellularSetup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForTableView:reuseIdentifier:appDataUsageItem:isCellularSetup:");
}

id objc_msgSend_cellForTableView_reuseIdentifier_cellularPlanItem_hasMultipleActiveSIM_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForTableView:reuseIdentifier:cellularPlanItem:hasMultipleActiveSIM:");
}

id objc_msgSend_cellular(void *a1, const char *a2, ...)
{
  return _[a1 cellular];
}

id objc_msgSend_cellularHome(void *a1, const char *a2, ...)
{
  return _[a1 cellularHome];
}

id objc_msgSend_cellularPlanIsSetUp(void *a1, const char *a2, ...)
{
  return _[a1 cellularPlanIsSetUp];
}

id objc_msgSend_cellularPlans(void *a1, const char *a2, ...)
{
  return _[a1 cellularPlans];
}

id objc_msgSend_cellularPlansDictionary(void *a1, const char *a2, ...)
{
  return _[a1 cellularPlansDictionary];
}

id objc_msgSend_cellularPlansUpdated_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellularPlansUpdated:error:");
}

id objc_msgSend_cellularRoaming(void *a1, const char *a2, ...)
{
  return _[a1 cellularRoaming];
}

id objc_msgSend_cellularUseErrors(void *a1, const char *a2, ...)
{
  return _[a1 cellularUseErrors];
}

id objc_msgSend_childObjects(void *a1, const char *a2, ...)
{
  return _[a1 childObjects];
}

id objc_msgSend_chinaSKUWirelessDataOptionForCellularSetup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chinaSKUWirelessDataOptionForCellularSetup:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_consentRequiredRelevantCellularPlanItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consentRequiredRelevantCellularPlanItem:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_coreTelephonyClient(void *a1, const char *a2, ...)
{
  return _[a1 coreTelephonyClient];
}

id objc_msgSend_coreTelephonyQueue(void *a1, const char *a2, ...)
{
  return _[a1 coreTelephonyQueue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_dataUsageForLastPeriodsOnActivePairedDevice_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsageForLastPeriodsOnActivePairedDevice:completion:");
}

id objc_msgSend_dataUsagePolicy(void *a1, const char *a2, ...)
{
  return _[a1 dataUsagePolicy];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return _[a1 defaultQueue];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_dequeueReusableHeaderFooterViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableHeaderFooterViewWithIdentifier:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didDeleteRemotePlanItem_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDeleteRemotePlanItem:completion:");
}

id objc_msgSend_didSelectRemotePlanItem_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSelectRemotePlanItem:completion:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_displayNameForCellularPlan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForCellularPlan:");
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endBackgroundTask:");
}

id objc_msgSend_enqueueNotification_postingStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueNotification:postingStyle:");
}

id objc_msgSend_eraseAllRemotePlansWithCSN_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eraseAllRemotePlansWithCSN:completion:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObjectPassingTest:");
}

id objc_msgSend_firstViewController(void *a1, const char *a2, ...)
{
  return _[a1 firstViewController];
}

id objc_msgSend_flowWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flowWithOptions:");
}

id objc_msgSend_getAllDevicesWithArchivedAltAccountDevicesMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllDevicesWithArchivedAltAccountDevicesMatching:");
}

id objc_msgSend_getCachedIconForBundleID_iconVariant_outIconImage_updateBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCachedIconForBundleID:iconVariant:outIconImage:updateBlock:");
}

id objc_msgSend_getCellularDataUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCellularDataUsage:");
}

id objc_msgSend_getIconForBundleID_iconVariant_queue_block_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getIconForBundleID:iconVariant:queue:block:timeout:");
}

id objc_msgSend_getRemotePolicies_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRemotePolicies:completion:");
}

id objc_msgSend_greenTeaMusicAllowCellularForHighQualityStreaming(void *a1, const char *a2, ...)
{
  return _[a1 greenTeaMusicAllowCellularForHighQualityStreaming];
}

id objc_msgSend_greenTeaMusicAllowCellularForStreaming(void *a1, const char *a2, ...)
{
  return _[a1 greenTeaMusicAllowCellularForStreaming];
}

id objc_msgSend_hasHomeButton(void *a1, const char *a2, ...)
{
  return _[a1 hasHomeButton];
}

id objc_msgSend_hyphenatedDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 hyphenatedDisplayName];
}

id objc_msgSend_iccid(void *a1, const char *a2, ...)
{
  return _[a1 iccid];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_inactiveCellularPlans(void *a1, const char *a2, ...)
{
  return _[a1 inactiveCellularPlans];
}

id objc_msgSend_init_withCellularPolicy_wifiPolicy_isManaged_andIsRestricted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:withCellularPolicy:wifiPolicy:isManaged:andIsRestricted:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithCTAppDataUsageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCTAppDataUsageItem:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
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

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_appDataUsageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:reuseIdentifier:appDataUsageItem:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isActiveDeviceTinker(void *a1, const char *a2, ...)
{
  return _[a1 isActiveDeviceTinker];
}

id objc_msgSend_isActiveWatchChinaRegionCellular(void *a1, const char *a2, ...)
{
  return _[a1 isActiveWatchChinaRegionCellular];
}

id objc_msgSend_isCellularDataEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCellularDataEnabled];
}

id objc_msgSend_isCellularSetup(void *a1, const char *a2, ...)
{
  return _[a1 isCellularSetup];
}

id objc_msgSend_isDeleteNotAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isDeleteNotAllowed];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isForAnApp(void *a1, const char *a2, ...)
{
  return _[a1 isForAnApp];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return _[a1 isOn];
}

id objc_msgSend_isSelectable(void *a1, const char *a2, ...)
{
  return _[a1 isSelectable];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isTinker(void *a1, const char *a2, ...)
{
  return _[a1 isTinker];
}

id objc_msgSend_isTotalUsage(void *a1, const char *a2, ...)
{
  return _[a1 isTotalUsage];
}

id objc_msgSend_isWiFiDataEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isWiFiDataEnabled];
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

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 localizedUppercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_native(void *a1, const char *a2, ...)
{
  return _[a1 native];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_notificationWithName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationWithName:object:");
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

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsPassingTest:");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumber];
}

id objc_msgSend_plan(void *a1, const char *a2, ...)
{
  return _[a1 plan];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentCellularError_onViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentCellularError:onViewController:");
}

id objc_msgSend_presentError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentError:");
}

id objc_msgSend_presentErrorMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentErrorMessage:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_promptingUserForConsent(void *a1, const char *a2, ...)
{
  return _[a1 promptingUserForConsent];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_receivedRemotePlanInfo(void *a1, const char *a2, ...)
{
  return _[a1 receivedRemotePlanInfo];
}

id objc_msgSend_registerClass_forHeaderFooterViewReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forHeaderFooterViewReuseIdentifier:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _[a1 sections];
}

id objc_msgSend_selectItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectItemAtIndexPath:");
}

id objc_msgSend_selectedCellularPlan(void *a1, const char *a2, ...)
{
  return _[a1 selectedCellularPlan];
}

id objc_msgSend_serviceSubscriptionsShouldShowAddNewRemotePlan(void *a1, const char *a2, ...)
{
  return _[a1 serviceSubscriptionsShouldShowAddNewRemotePlan];
}

id objc_msgSend_setAccessorySwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessorySwitch:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setActiveCellularPlans_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveCellularPlans:");
}

id objc_msgSend_setActivePairedDevice_withActiveDeviceAssertionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivePairedDevice:withActiveDeviceAssertionHandler:");
}

id objc_msgSend_setAdaptive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdaptive:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAppDataUsageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppDataUsageItem:");
}

id objc_msgSend_setAppsDataUsageArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppsDataUsageArray:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setBytesUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBytesUsed:");
}

id objc_msgSend_setCellularPlansDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellularPlansDataSource:");
}

id objc_msgSend_setCellularPlansDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellularPlansDictionary:");
}

id objc_msgSend_setCellularSetup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellularSetup:");
}

id objc_msgSend_setChildObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChildObjects:");
}

id objc_msgSend_setCoreTelephonyClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoreTelephonyClient:");
}

id objc_msgSend_setDataUsagePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataUsagePolicy:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setGreenTeaMusicAllowCellularForHighQualityStreaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGreenTeaMusicAllowCellularForHighQualityStreaming:");
}

id objc_msgSend_setGreenTeaMusicAllowCellularForStreaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGreenTeaMusicAllowCellularForStreaming:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHyphenatedDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHyphenatedDisplayName:");
}

id objc_msgSend_setHyphenationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHyphenationFactor:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInactiveCellularPlans_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInactiveCellularPlans:");
}

id objc_msgSend_setIsTotalUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTotalUsage:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfTapsRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfTapsRequired:");
}

id objc_msgSend_setOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOn:");
}

id objc_msgSend_setPromptingUserForConsent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptingUserForConsent:");
}

id objc_msgSend_setReceivedRemotePlanInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedRemotePlanInfo:");
}

id objc_msgSend_setRemotePolicies_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemotePolicies:completion:");
}

id objc_msgSend_setSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSections:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTinkerCellularSetUpBackgroundTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTinkerCellularSetUpBackgroundTaskID:");
}

id objc_msgSend_setTinkerCellularSetUpTaskCompletionTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTinkerCellularSetUpTaskCompletionTimeout:");
}

id objc_msgSend_setTinkerDeviceAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTinkerDeviceAssertion:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTitles(void *a1, const char *a2, ...)
{
  return _[a1 setTitles];
}

id objc_msgSend_setUsageDisplayString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsageDisplayString:");
}

id objc_msgSend_setUsagePoliciesForCellular_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsagePoliciesForCellular:");
}

id objc_msgSend_setUsagePoliciesForCellular_andWifi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsagePoliciesForCellular:andWifi:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setZeroPadsFractionDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZeroPadsFractionDigits:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_shouldAllowUserToAddOrSetUpPlan(void *a1, const char *a2, ...)
{
  return _[a1 shouldAllowUserToAddOrSetUpPlan];
}

id objc_msgSend_shouldDisplay(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisplay];
}

id objc_msgSend_showViewController_sender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showViewController:sender:");
}

id objc_msgSend_sortToggle(void *a1, const char *a2, ...)
{
  return _[a1 sortToggle];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startRemoteProvisioning(void *a1, const char *a2, ...)
{
  return _[a1 startRemoteProvisioning];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subscriptionContextForCellularPlanItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionContextForCellularPlanItem:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemServiceDataUsageForPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemServiceDataUsageForPeriod:");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _[a1 textView];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_tinkerCellularSetUpBackgroundTaskID(void *a1, const char *a2, ...)
{
  return _[a1 tinkerCellularSetUpBackgroundTaskID];
}

id objc_msgSend_tinkerCellularSetUpTaskCompletionTimeout(void *a1, const char *a2, ...)
{
  return _[a1 tinkerCellularSetUpTaskCompletionTimeout];
}

id objc_msgSend_tinkerDeviceAssertion(void *a1, const char *a2, ...)
{
  return _[a1 tinkerDeviceAssertion];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_totalDataUsedForPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalDataUsedForPeriod:");
}

id objc_msgSend_totalSystemServiceDataUsedForPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalSystemServiceDataUsedForPeriod:");
}

id objc_msgSend_totalUninstalledAppDataUsedForPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalUninstalledAppDataUsedForPeriod:");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_updateCellularPlansWithFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCellularPlansWithFetch:");
}

id objc_msgSend_usageDisplayString(void *a1, const char *a2, ...)
{
  return _[a1 usageDisplayString];
}

id objc_msgSend_used(void *a1, const char *a2, ...)
{
  return _[a1 used];
}

id objc_msgSend_userConsentMessageForConsentType_relevantPlanItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userConsentMessageForConsentType:relevantPlanItem:");
}

id objc_msgSend_userDidProvideConsentResponse_forPlan_isRemote_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDidProvideConsentResponse:forPlan:isRemote:completion:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userSelectedComparator(void *a1, const char *a2, ...)
{
  return _[a1 userSelectedComparator];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_wifi(void *a1, const char *a2, ...)
{
  return _[a1 wifi];
}