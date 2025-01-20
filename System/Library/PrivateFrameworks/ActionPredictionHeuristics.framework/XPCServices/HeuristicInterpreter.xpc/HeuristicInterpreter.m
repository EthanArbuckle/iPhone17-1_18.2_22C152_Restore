id sub_100002D8C()
{
  void *v0;
  uint64_t vars8;

  if (qword_10002E0D0 != -1) {
    dispatch_once(&qword_10002E0D0, &stru_100024598);
  }
  v0 = (void *)qword_10002E0C8;

  return v0;
}

void sub_100002DE0(id a1)
{
  qword_10002E0C8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "general");

  _objc_release_x1();
}

id sub_100002E24()
{
  if (qword_10002E0E0 != -1) {
    dispatch_once(&qword_10002E0E0, &stru_1000245B8);
  }
  v0 = (void *)qword_10002E0D8;

  return v0;
}

void sub_100002E78(id a1)
{
  qword_10002E0D8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "xpc");

  _objc_release_x1();
}

id sub_100002EBC()
{
  if (qword_10002E0F0 != -1) {
    dispatch_once(&qword_10002E0F0, &stru_1000245D8);
  }
  v0 = (void *)qword_10002E0E8;

  return v0;
}

void sub_100002F10(id a1)
{
  qword_10002E0E8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "heuristic");

  _objc_release_x1();
}

id sub_100002F54()
{
  if (qword_10002E100 != -1) {
    dispatch_once(&qword_10002E100, &stru_1000245F8);
  }
  v0 = (void *)qword_10002E0F8;

  return v0;
}

void sub_100002FA8(id a1)
{
  qword_10002E0F8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notifications");

  _objc_release_x1();
}

id sub_100002FEC()
{
  if (qword_10002E110 != -1) {
    dispatch_once(&qword_10002E110, &stru_100024618);
  }
  v0 = (void *)qword_10002E108;

  return v0;
}

void sub_100003040(id a1)
{
  qword_10002E108 = (uint64_t)os_log_create("com.apple.duetexpertd.mm", "GENERAL");

  _objc_release_x1();
}

id sub_100003084()
{
  if (qword_10002E120 != -1) {
    dispatch_once(&qword_10002E120, &stru_100024638);
  }
  v0 = (void *)qword_10002E118;

  return v0;
}

void sub_1000030D8(id a1)
{
  qword_10002E118 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "dailyroutines");

  _objc_release_x1();
}

id sub_10000311C()
{
  if (qword_10002E130 != -1) {
    dispatch_once(&qword_10002E130, &stru_100024658);
  }
  v0 = (void *)qword_10002E128;

  return v0;
}

void sub_100003170(id a1)
{
  qword_10002E128 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "feedback");

  _objc_release_x1();
}

id sub_1000031B4()
{
  if (qword_10002E140 != -1) {
    dispatch_once(&qword_10002E140, &stru_100024678);
  }
  v0 = (void *)qword_10002E138;

  return v0;
}

void sub_100003208(id a1)
{
  qword_10002E138 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "modes");

  _objc_release_x1();
}

id sub_10000324C()
{
  if (qword_10002E150 != -1) {
    dispatch_once(&qword_10002E150, &stru_100024698);
  }
  v0 = (void *)qword_10002E148;

  return v0;
}

void sub_1000032A0(id a1)
{
  qword_10002E148 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "hero");

  _objc_release_x1();
}

id sub_1000032E4()
{
  if (qword_10002E160 != -1) {
    dispatch_once(&qword_10002E160, &stru_1000246B8);
  }
  v0 = (void *)qword_10002E158;

  return v0;
}

void sub_100003338(id a1)
{
  qword_10002E158 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "deletions");

  _objc_release_x1();
}

id sub_10000337C()
{
  if (qword_10002E170 != -1) {
    dispatch_once(&qword_10002E170, &stru_1000246D8);
  }
  v0 = (void *)qword_10002E168;

  return v0;
}

void sub_1000033D0(id a1)
{
  qword_10002E168 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "information");

  _objc_release_x1();
}

id sub_100003414()
{
  if (qword_10002E180 != -1) {
    dispatch_once(&qword_10002E180, &stru_1000246F8);
  }
  v0 = (void *)qword_10002E178;

  return v0;
}

void sub_100003468(id a1)
{
  qword_10002E178 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "timeline");

  _objc_release_x1();
}

id sub_1000034AC()
{
  if (qword_10002E190 != -1) {
    dispatch_once(&qword_10002E190, &stru_100024718);
  }
  v0 = (void *)qword_10002E188;

  return v0;
}

void sub_100003500(id a1)
{
  qword_10002E188 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");

  _objc_release_x1();
}

id sub_100003544()
{
  if (qword_10002E1A0 != -1) {
    dispatch_once(&qword_10002E1A0, &stru_100024738);
  }
  v0 = (void *)qword_10002E198;

  return v0;
}

void sub_100003598(id a1)
{
  qword_10002E198 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevance_model");

  _objc_release_x1();
}

id sub_1000035DC()
{
  if (qword_10002E1B0 != -1) {
    dispatch_once(&qword_10002E1B0, &stru_100024758);
  }
  v0 = (void *)qword_10002E1A8;

  return v0;
}

void sub_100003630(id a1)
{
  qword_10002E1A8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "watch");

  _objc_release_x1();
}

id sub_100003674()
{
  if (qword_10002E1C0 != -1) {
    dispatch_once(&qword_10002E1C0, &stru_100024778);
  }
  v0 = (void *)qword_10002E1B8;

  return v0;
}

void sub_1000036C8(id a1)
{
  qword_10002E1B8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "UI");

  _objc_release_x1();
}

id sub_10000370C()
{
  if (qword_10002E1D0 != -1) {
    dispatch_once(&qword_10002E1D0, &stru_100024798);
  }
  v0 = (void *)qword_10002E1C8;

  return v0;
}

void sub_100003760(id a1)
{
  qword_10002E1C8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending");

  _objc_release_x1();
}

id sub_1000037A4()
{
  if (qword_10002E1E0 != -1) {
    dispatch_once(&qword_10002E1E0, &stru_1000247B8);
  }
  v0 = (void *)qword_10002E1D8;

  return v0;
}

void sub_1000037F8(id a1)
{
  qword_10002E1D8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");

  _objc_release_x1();
}

id sub_10000383C()
{
  if (qword_10002E1F0 != -1) {
    dispatch_once(&qword_10002E1F0, &stru_1000247D8);
  }
  v0 = (void *)qword_10002E1E8;

  return v0;
}

void sub_100003890(id a1)
{
  qword_10002E1E8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");

  _objc_release_x1();
}

id sub_1000038D4()
{
  if (qword_10002E200 != -1) {
    dispatch_once(&qword_10002E200, &stru_1000247F8);
  }
  v0 = (void *)qword_10002E1F8;

  return v0;
}

void sub_100003928(id a1)
{
  qword_10002E1F8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "homescreen");

  _objc_release_x1();
}

id sub_10000396C()
{
  if (qword_10002E210 != -1) {
    dispatch_once(&qword_10002E210, &stru_100024818);
  }
  v0 = (void *)qword_10002E208;

  return v0;
}

void sub_1000039C0(id a1)
{
  qword_10002E208 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "sleepschedule");

  _objc_release_x1();
}

id sub_100003A04()
{
  if (qword_10002E220 != -1) {
    dispatch_once(&qword_10002E220, &stru_100024838);
  }
  v0 = (void *)qword_10002E218;

  return v0;
}

void sub_100003A58(id a1)
{
  qword_10002E218 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "lockscreen");

  _objc_release_x1();
}

id sub_100003A9C()
{
  if (qword_10002E230 != -1) {
    dispatch_once(&qword_10002E230, &stru_100024858);
  }
  v0 = (void *)qword_10002E228;

  return v0;
}

void sub_100003AF0(id a1)
{
  qword_10002E228 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "anchor");

  _objc_release_x1();
}

id sub_100003B34()
{
  if (qword_10002E240 != -1) {
    dispatch_once(&qword_10002E240, &stru_100024878);
  }
  v0 = (void *)qword_10002E238;

  return v0;
}

void sub_100003B88(id a1)
{
  qword_10002E238 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_prediction");

  _objc_release_x1();
}

id sub_100003BCC()
{
  if (qword_10002E250 != -1) {
    dispatch_once(&qword_10002E250, &stru_100024898);
  }
  v0 = (void *)qword_10002E248;

  return v0;
}

void sub_100003C20(id a1)
{
  qword_10002E248 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "action_prediction");

  _objc_release_x1();
}

id sub_100003C64()
{
  if (qword_10002E260 != -1) {
    dispatch_once(&qword_10002E260, &stru_1000248B8);
  }
  v0 = (void *)qword_10002E258;

  return v0;
}

void sub_100003CB8(id a1)
{
  qword_10002E258 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_library");

  _objc_release_x1();
}

id sub_100003CFC()
{
  if (qword_10002E270 != -1) {
    dispatch_once(&qword_10002E270, &stru_1000248D8);
  }
  v0 = (void *)qword_10002E268;

  return v0;
}

void sub_100003D50(id a1)
{
  qword_10002E268 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_install");

  _objc_release_x1();
}

id sub_100003D94()
{
  if (qword_10002E280 != -1) {
    dispatch_once(&qword_10002E280, &stru_1000248F8);
  }
  v0 = (void *)qword_10002E278;

  return v0;
}

void sub_100003DE8(id a1)
{
  qword_10002E278 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "backup");

  _objc_release_x1();
}

id sub_100003E2C()
{
  if (qword_10002E290 != -1) {
    dispatch_once(&qword_10002E290, &stru_100024918);
  }
  v0 = (void *)qword_10002E288;

  return v0;
}

void sub_100003E80(id a1)
{
  qword_10002E288 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "metrics");

  _objc_release_x1();
}

id sub_100003EC4()
{
  if (qword_10002E2A0 != -1) {
    dispatch_once(&qword_10002E2A0, &stru_100024938);
  }
  v0 = (void *)qword_10002E298;

  return v0;
}

void sub_100003F18(id a1)
{
  qword_10002E298 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "trial_assets");

  _objc_release_x1();
}

id sub_100003F5C()
{
  if (qword_10002E2B0 != -1) {
    dispatch_once(&qword_10002E2B0, &stru_100024958);
  }
  v0 = (void *)qword_10002E2A8;

  return v0;
}

void sub_100003FB0(id a1)
{
  qword_10002E2A8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_management");

  _objc_release_x1();
}

id sub_100003FF4()
{
  if (qword_10002E2C0 != -1) {
    dispatch_once(&qword_10002E2C0, &stru_100024978);
  }
  v0 = (void *)qword_10002E2B8;

  return v0;
}

void sub_100004048(id a1)
{
  qword_10002E2B8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextual_actions");

  _objc_release_x1();
}

id sub_10000408C()
{
  if (qword_10002E2D0 != -1) {
    dispatch_once(&qword_10002E2D0, &stru_100024998);
  }
  v0 = (void *)qword_10002E2C8;

  return v0;
}

void sub_1000040E0(id a1)
{
  qword_10002E2C8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "intents_helper");

  _objc_release_x1();
}

id sub_100004124()
{
  if (qword_10002E2E0 != -1) {
    dispatch_once(&qword_10002E2E0, &stru_1000249B8);
  }
  v0 = (void *)qword_10002E2D8;

  return v0;
}

void sub_100004178(id a1)
{
  qword_10002E2D8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "context_heuristic");

  _objc_release_x1();
}

id sub_1000041BC()
{
  if (qword_10002E2F0 != -1) {
    dispatch_once(&qword_10002E2F0, &stru_1000249D8);
  }
  v0 = (void *)qword_10002E2E8;

  return v0;
}

void sub_100004210(id a1)
{
  qword_10002E2E8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "zkw_hide");

  _objc_release_x1();
}

id sub_100004254()
{
  if (qword_10002E300 != -1) {
    dispatch_once(&qword_10002E300, &stru_1000249F8);
  }
  v0 = (void *)qword_10002E2F8;

  return v0;
}

void sub_1000042A8(id a1)
{
  qword_10002E2F8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");

  _objc_release_x1();
}

id sub_1000042EC()
{
  if (qword_10002E310 != -1) {
    dispatch_once(&qword_10002E310, &stru_100024A18);
  }
  v0 = (void *)qword_10002E308;

  return v0;
}

void sub_100004340(id a1)
{
  qword_10002E308 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "time");

  _objc_release_x1();
}

id sub_100004384()
{
  if (qword_10002E320 != -1) {
    dispatch_once(&qword_10002E320, &stru_100024A38);
  }
  v0 = (void *)qword_10002E318;

  return v0;
}

void sub_1000043D8(id a1)
{
  qword_10002E318 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextualengine");

  _objc_release_x1();
}

id sub_10000441C()
{
  if (qword_10002E330 != -1) {
    dispatch_once(&qword_10002E330, &stru_100024A58);
  }
  v0 = (void *)qword_10002E328;

  return v0;
}

void sub_100004470(id a1)
{
  qword_10002E328 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "usage_insights");

  _objc_release_x1();
}

id sub_1000044B4()
{
  if (qword_10002E340 != -1) {
    dispatch_once(&qword_10002E340, &stru_100024A78);
  }
  v0 = (void *)qword_10002E338;

  return v0;
}

void sub_100004508(id a1)
{
  qword_10002E338 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_categorization");

  _objc_release_x1();
}

id sub_10000454C()
{
  if (qword_10002E350 != -1) {
    dispatch_once(&qword_10002E350, &stru_100024A98);
  }
  v0 = (void *)qword_10002E348;

  return v0;
}

void sub_1000045A0(id a1)
{
  qword_10002E348 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "settings_actions");

  _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
  id v4 = +[ATXAssets2 asset];
  int out_token = 0;
  notify_register_dispatch("AppleLanguagePreferencesChangedNotification", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_100024AD8);
  v5 = objc_opt_new();
  v6 = +[NSXPCListener serviceListener];
  [v6 setDelegate:v5];
  [v6 resume];

  return 0;
}

void sub_1000047A8(id a1, int a2)
{
  v2 = sub_100002EBC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Exiting HeuristicInterpreter due to language change", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

id sub_100004B6C()
{
  if (qword_10002E360 != -1) {
    dispatch_once(&qword_10002E360, &stru_100024B48);
  }
  v0 = (void *)qword_10002E358;

  return v0;
}

void sub_100004BC0(void *a1)
{
  v2 = sub_100002E24();
  os_signpost_id_t spid = os_signpost_id_generate(v2);

  v3 = sub_100002E24();
  id v4 = v3;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, spid, "actionsAndExpirersForHeuristicsExcept", " enableTelemetry=YES ", buf, 2u);
  }

  v7 = sub_100002EBC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Calculating actions and expirers at %@, blacklist = %@, path = %@", buf, 0x20u);
  }

  v11 = [[ATXHeuristicDataSourcesClient alloc] initWithListenerEndpoint:a1[7]];
  v12 = +[NSBundle bundleWithPath:a1[6]];
  v13 = [[ATXHeuristicJSEnv alloc] initWithHeuristicBundle:v12 dataProvider:v11];
  [(ATXHeuristicJSEnv *)v13 setNow:a1[4]];
  v14 = [(ATXHeuristicJSEnv *)v13 actionsAndExpirersForHeuristicsExcept:a1[5]];
  v15 = [v14 allKeys];
  id v16 = [v15 count];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v25 = 1;
  v17 = sub_100002EBC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v22 = 134217984;
    id v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Newly created actions and expirers: %lu", v22, 0xCu);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100004F48;
  v21[3] = &unk_100024B00;
  v21[4] = buf;
  v21[5] = v16;
  [v14 enumerateKeysAndObjectsUsingBlock:v21];
  (*(void (**)(void))(a1[8] + 16))();
  _Block_object_dispose(buf, 8);

  CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
  v18 = sub_100002E24();
  v19 = v18;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, spid, "actionsAndExpirersForHeuristicsExcept", " enableTelemetry=YES ", buf, 2u);
  }
}

void sub_100004F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004F48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = sub_100002EBC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v10 = [v6 actionMakers];
    id v11 = [v10 count];
    if (v11)
    {
      v12 = [v6 actionMakers];
    }
    else
    {
      v12 = @"None";
    }
    v13 = [v6 expirers];
    int v14 = 134219010;
    uint64_t v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%lu of %lu] Heuristic: %@, Actions: %@, Expirers: %@", (uint8_t *)&v14, 0x34u);

    if (v11) {
  }
    }

  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void sub_100005204(void *a1)
{
  v2 = sub_100002E24();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = sub_100002E24();
  id v5 = v4;
  unint64_t v32 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "resultsForInformationHeuristics", " enableTelemetry=YES ", buf, 2u);
  }
  os_signpost_id_t spid = v3;

  id v6 = sub_100002EBC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)a1[4];
    uint64_t v8 = (void *)a1[5];
    uint64_t v9 = (void *)a1[6];
    *(_DWORD *)buf = 138412802;
    v38 = v7;
    __int16 v39 = 2112;
    v40 = v8;
    __int16 v41 = 2112;
    v42 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "InfoHeuristic: Calculating info heuristics results at %@, heuristicsNames = %@, path = %@", buf, 0x20u);
  }

  uint64_t v10 = [[ATXHeuristicDataSourcesClient alloc] initWithListenerEndpoint:a1[7]];
  v27 = +[NSBundle bundleWithPath:a1[6]];
  v28 = v10;
  id v11 = [[ATXHeuristicJSEnv alloc] initWithHeuristicBundle:v27 dataProvider:v10];
  [(ATXHeuristicJSEnv *)v11 setNow:a1[4]];
  v31 = a1;
  v26 = v11;
  v12 = [(ATXHeuristicJSEnv *)v11 resultsForInformationHeuristics:a1[5]];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        __int16 v18 = sub_100002EBC();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = objc_msgSend(v17, "heuristicName", spid);
          __int16 v20 = [v17 suggestions];
          v21 = [v17 refreshTriggers];
          unsigned int v22 = [v17 hasFailed];
          *(_DWORD *)buf = 138413058;
          v38 = v19;
          __int16 v39 = 2112;
          v40 = v20;
          __int16 v41 = 2112;
          v42 = v21;
          __int16 v43 = 1024;
          unsigned int v44 = v22;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "InfoHeuristic:\n  Result for heuristic %@: \n  Suggestions: %@\n  RefreshTriggers: %@\n Has Failed: %d", buf, 0x26u);
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v14);
  }
  (*(void (**)(void))(v31[8] + 16))();

  CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
  id v23 = sub_100002E24();
  v24 = v23;
  if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, spid, "resultsForInformationHeuristics", " enableTelemetry=YES ", buf, 2u);
  }
}

void sub_1000055D4(id a1)
{
  os_signpost_id_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("atx-xpc-bg", v3);
  v2 = (void *)qword_10002E358;
  qword_10002E358 = (uint64_t)v1;
}

void sub_1000059B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000059D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000059E4(uint64_t a1)
{
}

void sub_1000059EC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005A4C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005BF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005C98;
  v9[3] = &unk_100024B98;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v8 = v5;
  [a2 getEventsWithProminentFeature:v7 callback:v9];
}

void sub_100005C98(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005E8C(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005F3C;
  v10[3] = &unk_100024B98;
  uint64_t v8 = a1[6];
  id v11 = v5;
  uint64_t v12 = v8;
  id v9 = v5;
  [a2 calendarEventsFromStartDate:v6 toEndDate:v7 callback:v10];
}

void sub_100005F3C(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000060C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000060DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006178;
  v8[3] = &unk_100024B98;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  [a2 visibleCalendarsWithCallback:v8];
}

void sub_100006178(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000062C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006388(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000647C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000655C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006620(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006754(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006848(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000690C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000069D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006AD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006B98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006C78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006D6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006E4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100006F2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000700C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000070EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000071CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000072C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007384(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007448(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000753C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007600(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000076D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007798(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007878(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000793C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007A00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007AE0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007BD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007C98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007D60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007E24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007E48(os_log_t log)
{
  *(_WORD *)dispatch_queue_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempt to query remote object proxy timed out.", v1, 2u);
}

void sub_10000A140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id *location, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24,id *a25,id *a26,id *a27,id *a28,id *a29,id *a30,id *a31,id *a32,id *a33,id *a34,id *a35,id *a36,id *a37,id *a38,id *a39,id *a40,id *a41,id *a42,id *a43,id *a44,id *a45,id *a46,id *a47,id *a48,id *a49,id *a50,id *a51,id *a52,id *a53,id *a54,id *a55,id *a56)
{
  objc_destroyWeak(v56);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a16);
  objc_destroyWeak(a17);
  objc_destroyWeak(a18);
  objc_destroyWeak(a19);
  objc_destroyWeak(a20);
  objc_destroyWeak(a21);
  objc_destroyWeak(a22);
  objc_destroyWeak(a23);
  objc_destroyWeak(a24);
  objc_destroyWeak(a25);
  objc_destroyWeak(a26);
  objc_destroyWeak(a27);
  objc_destroyWeak(a28);
  objc_destroyWeak(a29);
  objc_destroyWeak(a30);
  objc_destroyWeak(a31);
  objc_destroyWeak(a32);
  objc_destroyWeak(a33);
  objc_destroyWeak(a34);
  objc_destroyWeak(a35);
  objc_destroyWeak(a36);
  objc_destroyWeak(a37);
  objc_destroyWeak(a38);
  objc_destroyWeak(a39);
  objc_destroyWeak(a40);
  objc_destroyWeak(a41);
  objc_destroyWeak(a44);
  objc_destroyWeak(a45);
  objc_destroyWeak(a46);
  objc_destroyWeak(a47);
  objc_destroyWeak(a48);
  objc_destroyWeak(a49);
  _Block_object_dispose(&STACK[0x828], 8);
  objc_destroyWeak(a50);
  objc_destroyWeak(a51);
  objc_destroyWeak(a52);
  objc_destroyWeak(a53);
  objc_destroyWeak(a56);
  objc_destroyWeak(a54);
  objc_destroyWeak(a55);
  objc_destroyWeak(a42);
  objc_destroyWeak(a43);
  objc_destroyWeak((id *)(v57 - 112));
  _Unwind_Resume(a1);
}

void sub_10000A4E0(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _expireCacheAfterTime:a2];
}

void sub_10000A530(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _expireCacheAtTime:a2];
}

void sub_10000A580(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10000A5F0(v3, @"expireAfterLocalNotification", @"notificationName");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _expireCacheAfterLocalNotification:v3];
}

void sub_10000A5F0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5
    || (sub_100017B90(),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 containsObject:v5],
        v8,
        v9))
  {
    uint64_t v10 = sub_100002EBC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100017CCC();
    }
  }
}

void sub_10000A69C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10000A5F0(v3, @"expireAfterDarwinNotification", @"notificationName");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _expireCacheAfterDarwinNotification:v3];
}

void sub_10000A70C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _recordErrorForCurrentHeuristic];
}

NSString *__cdecl sub_10000A74C(id a1, NSString *a2)
{
  v2 = a2;
  sub_10000A5F0(v2, @"appNameFromBundleID", @"bundleID");
  id v3 = [(NSString *)v2 atx_appNameFromBundleID];

  return (NSString *)v3;
}

NSArray *__cdecl sub_10000A7AC(id a1, NSString *a2)
{
  v2 = a2;
  sub_10000A5F0(v2, @"dataDetectors", @"text");
  id v3 = [(NSString *)v2 atx_dataDetectors];

  return (NSArray *)v3;
}

NSString *__cdecl sub_10000A80C(id a1, MTAlarm *a2)
{
  v2 = [(MTAlarm *)a2 nextFireDate];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSDateFormatter);
    [v3 setDateStyle:0];
    [v3 setTimeStyle:1];
    id v4 = [v3 stringFromDate:v2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

id sub_10000A8A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10000A5F0(v3, @"localizedFormat", @"key");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained _localizedFormatStringForKey:v3];

  return v5;
}

id sub_10000A91C(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _dateFromTimeIntervalOrDate:v3];

  if (v5)
  {
    id v6 = +[NSDateFormatter localizedStringFromDate:v5 dateStyle:0 timeStyle:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id sub_10000A9B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSLocale atx_usesTwelveHourClock];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained _isEventAtOneWithTimeIntervelOrDate:v3 usesTwelveHourClock:v4];

  return v6;
}

id sub_10000AA20(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _dateFromTimeIntervalOrDate:v3];

  if (v5)
  {
    id v6 = +[NSDateFormatter localizedStringFromDate:v5 dateStyle:1 timeStyle:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t sub_10000AAB8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000AAC8(uint64_t a1)
{
}

id sub_10000AAD0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained _bestAppSuggestionFromDataSource];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v6)
  {
    v25[0] = @"activityType";
    uint64_t v7 = [v6 activityType];
    uint64_t v8 = v7;
    if (!v7)
    {
      uint64_t v7 = +[NSNull null];
    }
    id v23 = (void *)v7;
    v26[0] = v7;
    v25[1] = @"userActivityTypeIdentifier";
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) userActivityTypeIdentifier];
    uint64_t v10 = (void *)v9;
    if (!v9)
    {
      uint64_t v9 = +[NSNull null];
    }
    unsigned int v22 = (void *)v9;
    v26[1] = v9;
    v25[2] = @"bundleIdentifier";
    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) bundleIdentifier];
    uint64_t v12 = (void *)v11;
    if (!v11)
    {
      uint64_t v11 = +[NSNull null];
    }
    v21 = (void *)v11;
    v26[2] = v11;
    v25[3] = @"originatingDeviceName";
    id v13 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) originatingDeviceName];
    id v14 = v13;
    if (!v13)
    {
      id v14 = +[NSNull null];
    }
    v26[3] = v14;
    v25[4] = @"options";
    uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) options];
    __int16 v16 = v15;
    if (!v15)
    {
      __int16 v16 = +[NSNull null];
    }
    v26[4] = v16;
    v25[5] = @"uniqueIdentifier";
    uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) uniqueIdentifier];
    __int16 v18 = v17;
    if (!v17)
    {
      __int16 v18 = +[NSNull null];
    }
    v26[5] = v18;
    id v19 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:6];
    if (!v17) {

    }
    if (!v15) {
    if (!v13)
    }

    if (!v12) {
    if (!v10)
    }

    if (!v8) {
  }
    }
  else
  {
    uint64_t v8 = sub_100002EBC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getBestAppSuggestionDictionary: no bestApp suggestion (nil)", buf, 2u);
    }
    id v19 = 0;
  }

  return v19;
}

id sub_10000ADD0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    sub_10000A5F0(v11, @"makeBestAppAction", @"bundleID");
    sub_10000A5F0(v12, @"makeBestAppAction", @"activityType");
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v15 = sub_10000AF10(v9);
    __int16 v16 = sub_10000AF10(v10);
    uint64_t v17 = +[ATXAction atx_userActivityActionWithBestAppSuggestion:v14 title:v15 subtitle:v16 bundleID:v11 activityType:v12 heuristicName:WeakRetained[9]];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

id sub_10000AF10(void *a1)
{
  id v1 = a1;
  if (v1
    && (sub_100017B90(),
        v2 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v3 = [v2 containsObject:v1],
        v2,
        (v3 & 1) != 0))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = v1;
  }

  return v4;
}

NSString *__cdecl sub_10000AF88(id a1, NSString *a2)
{
  v2 = a2;
  sub_10000A5F0(v2, @"extractHostFromURL", @"string");
  id v3 = [objc_alloc((Class)NSURL) initWithString:v2];

  id v4 = [v3 host];

  return (NSString *)v4;
}

uint64_t sub_10000B004(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_opt_new();

  return _objc_release_x1();
}

BOOL sub_10000B050(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.DuetExpertCenter.AppPredictionExpert"];
  unsigned __int8 v2 = [v1 BOOLForKey:@"EnableHandoffSuggestionNotifications"];
  id v3 = sub_100002EBC();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      __int16 v8 = 0;
      id v5 = "EnableHandoffSuggestionNotifications: enabled";
      id v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    id v5 = "EnableHandoffSuggestionNotifications: disabled";
    id v6 = buf;
    goto LABEL_6;
  }

  return v2;
}

id sub_10000B118(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v2 = [WeakRetained _nlEventsFromDataSource];

  return v2;
}

id sub_10000B164(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  sub_10000A5F0(v9, @"getContacts", @"type");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = sub_10000AF10(v8);

  id v12 = [WeakRetained _contactsDataSourceWithType:v9 value:v11 identifiers:v7];

  return v12;
}

id sub_10000B22C(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained _enabledAlarmsFromTS:a2 toTS:a3];

  return v6;
}

id sub_10000B290(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v2 = [WeakRetained _currentLocationFromDataSource];

  return v2;
}

id sub_10000B2DC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = [WeakRetained _unreadMessagesWithLimit:a2];

  return v4;
}

id sub_10000B330(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v2 = [WeakRetained _batteryInformationFromDataSource];

  return v2;
}

BOOL sub_10000B37C(id a1, MTAlarm *a2, double a3, double a4)
{
  id v6 = a2;
  id v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  id v8 = [(MTAlarm *)v6 nextFireDateAfterDate:v7];

  if (v8)
  {
    [v8 timeIntervalSinceReferenceDate];
    BOOL v10 = v9 < a4;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

id sub_10000B414(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10000A5F0(v3, @"getCityNameFromAirportCode", @"code");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained _cityNameFromAirportCode:v3];

  return v5;
}

id sub_10000B490(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _latestFlightStatus:v3];

  return v5;
}

id sub_10000B4F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v2 = [WeakRetained _usualAlarmTimeOfDayDataSource];

  return v2;
}

double sub_10000B544(id a1, double a2, int64_t a3, int64_t a4)
{
  id v7 = +[NSCalendar currentCalendar];
  id v8 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a2];
  objc_msgSend(v7, "atx_timestampWithHour:minute:atDayOfTimestamp:", a3, a4, v8);
  double v10 = v9;

  return v10;
}

double sub_10000B5CC(id a1, double a2, int64_t a3)
{
  id v4 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a2];
  id v5 = +[NSCalendar currentCalendar];
  id v6 = [v5 dateByAddingUnit:16 value:a3 toDate:v4 options:0];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  return v8;
}

NSString *__cdecl sub_10000B660(id a1, NSString *a2)
{
  unsigned __int8 v2 = a2;
  sub_10000A5F0(v2, @"phoneNumberFromTelUrl", @"telUrlString");
  id v3 = [(NSString *)v2 atx_phoneNumberFromTelURLString];

  return (NSString *)v3;
}

BOOL sub_10000B6C0(id a1)
{
  return 0;
}

BOOL sub_10000B6C8(id a1)
{
  return +[_PASDeviceInfo isiPad];
}

BOOL sub_10000B6D4(id a1, NSString *a2)
{
  unsigned __int8 v2 = a2;
  sub_10000A5F0(v2, @"isAppInstalled", @"bundleID");
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned __int8 v4 = [v3 applicationIsInstalled:v2];

  return v4;
}

NSString *__cdecl sub_10000B740(id a1, double a2, double a3)
{
  id v4 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a2];
  id v5 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a3];
  id v6 = objc_opt_new();
  [v6 setDateStyle:0];
  [v6 setTimeStyle:1];
  double v7 = [v6 stringFromDate:v4 toDate:v5];

  return (NSString *)v7;
}

ATXActionCriteria *__cdecl sub_10000B7FC(id a1, NSDictionary *a2)
{
  return (ATXActionCriteria *)+[ATXActionCriteria atx_criteriaWithDictionary:a2];
}

id sub_10000B80C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v11, @"makeDNDForEventAction", @"title");
    sub_10000A5F0(v12, @"makeDNDForEventAction", @"subtitle");
    sub_10000A5F0(v14, @"makeDNDForEventAction", @"eventTitle");
    sub_10000A5F0(v13, @"makeDNDForEventAction", @"eventUniqueID");
    uint64_t v17 = sub_10000AF10(v15);
    __int16 v18 = +[ATXAction atx_doNotDisturbForEventActionWithTitle:v11 subtitle:v12 eventTitle:v14 eventIdentifier:v17 eventUniqueID:v13 heuristicName:WeakRetained[9]];
  }
  else
  {
    __int16 v18 = 0;
  }

  return v18;
}

id sub_10000B95C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v19, @"makeSendMsgIntentAction", @"recipientHandle");
    sub_10000AF10(v16);
    long long v35 = v39 = v16;
    sub_10000AF10(v17);
    uint64_t v25 = v41 = v21;
    sub_10000AF10(v18);
    v26 = v40 = v22;
    sub_10000AF10(v20);
    v27 = id v38 = v18;
    sub_10000AF10(v41);
    id v36 = v17;
    v28 = id v37 = v20;
    sub_10000AF10(v23);
    v30 = id v29 = v23;
    sub_10000AF10(v40);
    unint64_t v32 = v31 = v19;
    long long v33 = +[ATXAction atx_sendMessageActionWithTitle:v35 subtitle:v25 recipientName:v26 recipientHandle:v31 text:v27 contactIdentifier:v28 conversationIdentifier:v30 eventIdentifier:v32 heuristicName:WeakRetained[9]];

    id v19 = v31;
    id v23 = v29;

    id v17 = v36;
    id v20 = v37;

    id v18 = v38;
    id v22 = v40;

    id v21 = v41;
    id v16 = v39;
  }
  else
  {
    long long v33 = 0;
  }

  return v33;
}

id sub_10000BB74(uint64_t a1, void *a2, void *a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v12, @"makeSetAlarmIntent", @"title");
    sub_10000A5F0(v13, @"makeSetAlarmIntent", @"subtitle");
    sub_10000A5F0(v11, @"makeSetAlarmIntent", @"eventTitle");
    id v16 = sub_10000AF10(v14);
    id v17 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a6];
    id v18 = +[ATXAction atx_setAlarmActionWithTitle:v12 subtitle:v13 eventIdentifier:v16 eventTitle:v11 alarmDate:v17 heuristicName:WeakRetained[9]];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

id sub_10000BCC8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v11, @"makeUpdateAlarmIntent", @"title");
    sub_10000A5F0(v12, @"makeUpdateAlarmIntent", @"subtitle");
    sub_10000A5F0(v9, @"makeUpdateAlarmIntent", @"alarmID");
    sub_10000A5F0(v10, @"makeUpdateAlarmIntent", @"alarmTitle");
    id v14 = +[ATXAction atx_updateAlarmActionWithTitle:v11 subtitle:v12 alarmID:v9 alarmTitle:v10 heuristicName:WeakRetained[9]];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

ATXAction *__cdecl sub_10000BDE4(id a1, NSString *a2, NSString *a3)
{
  id v4 = a3;
  id v5 = a2;
  sub_10000A5F0(v5, @"makeEnableAirplaneModeAction", @"title");
  sub_10000A5F0(v4, @"makeEnableAirplaneModeAction", @"subtitle");
  id v6 = +[ATXAction atx_setAirplaneModeActionWithTitle:v5 subtitle:v4];

  return (ATXAction *)v6;
}

id sub_10000BE80(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v36 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v18, @"makeStartCallIntentAction", @"recipientHandle");
    id v31 = sub_10000AF10(v36);
    v24 = sub_10000AF10(v16);
    sub_10000AF10(v17);
    uint64_t v25 = v35 = v17;
    sub_10000AF10(v19);
    v26 = id v34 = v19;
    sub_10000AF10(v20);
    id v32 = v16;
    v27 = id v33 = v20;
    v28 = sub_10000AF10(v21);
    id v29 = +[ATXAction atx_startCallActionWithTitle:v31 subtitle:v24 recipientName:v25 recipientHandle:v18 callService:v26 contactIdentifier:v27 eventIdentifier:v28 heuristicName:WeakRetained[9] mediaType:v22];

    id v16 = v32;
    id v20 = v33;

    id v19 = v34;
    id v17 = v35;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

id sub_10000C068(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v18, @"makeStartAudioCallIntentAction", @"recipientHandle");
    sub_10000AF10(v15);
    id v23 = v35 = v15;
    sub_10000AF10(v16);
    v24 = id v36 = v21;
    sub_10000AF10(v17);
    uint64_t v25 = v34 = v16;
    sub_10000AF10(v19);
    v26 = id v33 = v17;
    sub_10000AF10(v20);
    v27 = id v32 = v19;
    sub_10000AF10(v36);
    id v29 = v28 = v20;
    v30 = +[ATXAction atx_startAudioCallActionWithTitle:v23 subtitle:v24 recipientName:v25 recipientHandle:v18 callService:v26 contactIdentifier:v27 eventIdentifier:v29 heuristicName:WeakRetained[9]];

    id v20 = v28;
    id v19 = v32;

    id v17 = v33;
    id v16 = v34;

    id v21 = v36;
    id v15 = v35;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

id sub_10000C244(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v18, @"makeStartVideoCallIntentAction", @"recipientHandle");
    sub_10000AF10(v15);
    id v23 = v35 = v15;
    sub_10000AF10(v16);
    v24 = id v36 = v21;
    sub_10000AF10(v17);
    uint64_t v25 = v34 = v16;
    sub_10000AF10(v19);
    v26 = id v33 = v17;
    sub_10000AF10(v20);
    v27 = id v32 = v19;
    sub_10000AF10(v36);
    id v29 = v28 = v20;
    v30 = +[ATXAction atx_startVideoCallActionWithTitle:v23 subtitle:v24 recipientName:v25 recipientHandle:v18 callService:v26 contactIdentifier:v27 eventIdentifier:v29 heuristicName:WeakRetained[9]];

    id v20 = v28;
    id v19 = v32;

    id v17 = v33;
    id v16 = v34;

    id v21 = v36;
    id v15 = v35;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

ATXHeuristicCreateCalendarEventActionMaker *__cdecl sub_10000C420(id a1, NSString *a2, NSString *a3, ATXHeuristicObjectHandle *a4, NSString *a5)
{
  double v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  sub_10000A5F0(v11, @"makeCreateCalendarEventAction", @"title");
  sub_10000A5F0(v10, @"makeCreateCalendarEventAction", @"subtitle");
  sub_10000A5F0(v8, @"makeCreateCalendarEventAction", @"suggestionsInfoUniqueKey");
  id v12 = [objc_alloc((Class)ATXHeuristicCreateCalendarEventActionMaker) initWithTitle:v11 subtitle:v10 event:v9 suggestionsInfoUniqueKey:v8];

  return (ATXHeuristicCreateCalendarEventActionMaker *)v12;
}

id sub_10000C500(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v5, @"makeDNDForCurrentLocationAction", @"title");
    sub_10000A5F0(v6, @"makeDNDForCurrentLocationAction", @"subtitle");
    double v8 = +[ATXAction atx_doNotDisturbForCurrentLocationActionWithTitle:v5 subtitle:v6 heuristicName:WeakRetained[9]];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

id sub_10000C5C4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v11, @"makeCheckInForEventAction", @"teamId");
    sub_10000A5F0(v12, @"makeCheckInForEventAction", @"userActivityString");
    sub_10000A5F0(v13, @"makeCheckInForEventAction", @"subtitle");
    id v17 = sub_100002EBC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v22 = 138413314;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "makeCheckInForEventAction called with teamId='%@', userActivityString='%@', subtitle='%@', overrideBundleId='%@', suggestedEventUniqueKey='%@'", (uint8_t *)&v22, 0x34u);
    }

    id v18 = sub_10000AF10(v14);
    id v19 = sub_10000AF10(v15);
    id v20 = +[ATXAction atx_showCheckInActionWithTeamId:v11 userActivityString:v12 subtitle:v13 overrideBundleId:v18 suggestedEventUniqueKey:v19 heuristicName:WeakRetained[9]];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

void sub_10000C7C4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7, void *a8, double a9, double a10)
{
  id v19 = a2;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a7;
  id v24 = a8;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v19, @"addInfoSuggestion", @"bundleId");
    sub_10000A5F0(v20, @"addInfoSuggestion", @"widgetId");
    sub_10000A5F0(v21, @"addInfoSuggestion", @"widgetKind");
    sub_10000A5F0(v22, @"addInfoSuggestion", @"criterion");
    id v34 = v23;
    id v35 = objc_alloc((Class)ATXInfoSuggestion);
    __int16 v26 = sub_10000AF10(v23);
    uint64_t v27 = a6;
    id v28 = v19;
    id v29 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a9];
    __int16 v30 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a10];
    id v31 = v35;
    id v36 = v28;
    id v32 = [v31 initWithAppBundleIdentifier:v28 widgetBundleIdentifier:v20 widgetKind:v21 criterion:v22 applicableLayouts:v27 suggestionIdentifier:v26 startDate:v29 endDate:v30 intentDescription:v24 metadata:0 relevanceScore:0];

    [WeakRetained[11] addObject:v32];
    id v33 = sub_100002EBC();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v32;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "InfoHeuristic: addInfoSuggestion %@", buf, 0xCu);
    }

    id v23 = v34;
    id v19 = v36;
  }
}

void sub_10000CA1C(uint64_t a1, double a2)
{
  id v4 = sub_100002EBC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InfoHeuristic: scheduleRefreshAfterTimeInterval %f", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshAfterTimeInterval:a2];
}

void sub_10000CAE4(uint64_t a1, double a2)
{
  id v4 = sub_100002EBC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InfoHeuristic: scheduleRefreshAtTimestamp %f", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshAtTimestamp:a2];
}

void sub_10000CBAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10000A5F0(v3, @"scheduleRefreshAfterLocalNotification", @"notificationName");
  id v4 = sub_100002EBC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "InfoHeuristic: scheduleRefreshAfterLocalNotification %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshAfterLocalNotification:v3];
}

void sub_10000CC90(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  sub_10000A5F0(v5, @"scheduleRefreshAfterDarwinNotification", @"notificationName");
  int v6 = sub_100002EBC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "InfoHeuristic: scheduleRefreshAfterDarwinNotification %@; coalescing interval: %f",
      (uint8_t *)&v8,
      0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshAfterDarwinNotification:v5 coalescingInterval:a3];
}

void sub_10000CD90(uint64_t a1)
{
  unsigned __int8 v2 = sub_100002EBC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "InfoHeuristic: scheduleRefreshAfterUserWakeUp", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshAfterUserWakeUp];
}

void sub_10000CE10(uint64_t a1)
{
  unsigned __int8 v2 = sub_100002EBC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ScheduleRefreshOnAirplaneModeToggle", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshOnAirplaneModeToggle];
}

void sub_10000CE90(uint64_t a1)
{
  unsigned __int8 v2 = sub_100002EBC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "InfoHeuristic: scheduleRefreshWithUserFocusComputedModeStream", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshWithUserFocusComputedModeStream];
}

void sub_10000CF10(uint64_t a1)
{
  unsigned __int8 v2 = sub_100002EBC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "InfoHeuristic: scheduleRefreshWithInferredModeStream", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshWithInferredModeStream];
}

id sub_10000CF90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v2 = [WeakRetained _makeIntentDescriptionWithCustomTypeName:@"com.apple.CalendarWidget.IntentsExtension.EKUICalendarsIntent" parameters:&off_100028138];

  return v2;
}

id sub_10000CFEC(uint64_t a1)
{
  CFStringRef v6 = @"location";
  id v7 = &off_100028160;
  unsigned __int8 v2 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained _makeIntentDescriptionWithCustomTypeName:@"com.apple.weather.WeatherIntents.WeatherIntent" parameters:v2];

  return v4;
}

id sub_10000D0BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  sub_10000A5F0(v9, @"makeTravelWeatherIntent", @"reason");
  sub_10000A5F0(v8, @"makeTravelWeatherIntent", @"locality");
  __int16 v10 = objc_opt_new();
  double v11 = [v10 encodeObject:v7];
  if (v11)
  {
    if (v9)
    {
      if (v8)
      {
        v26[0] = @"identifier";
        id v12 = [v7 location];
        [v12 coordinate];
        uint64_t v14 = v13;
        id v15 = [v7 location];
        [v15 coordinate];
        +[NSString stringWithFormat:@"%f,%f", v14, v16];
        v17 = uint64_t v23 = a1;
        v27[0] = v17;
        v27[1] = v8;
        v26[1] = @"displayString";
        v26[2] = @"geolocation";
        v27[2] = v11;
        id v18 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

        v24[0] = @"location";
        v24[1] = @"reason";
        v25[0] = v18;
        v25[1] = v9;
        v24[2] = @"day";
        v25[2] = &__kCFBooleanTrue;
        id v19 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
        id WeakRetained = objc_loadWeakRetained((id *)(v23 + 32));
        id v21 = [WeakRetained _makeIntentDescriptionWithCustomTypeName:@"com.apple.weather.WeatherIntents.WeatherIntent" parameters:v19];

        goto LABEL_12;
      }
      id v18 = sub_100002EBC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100017DB0();
      }
    }
    else
    {
      id v18 = sub_100002EBC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100017D7C();
      }
    }
  }
  else
  {
    id v18 = sub_100002EBC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100017D48();
    }
  }
  id v21 = 0;
LABEL_12:

  return v21;
}

id sub_10000D374(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sub_10000A5F0(v14, @"makeNSUA", @"activityType");
    sub_10000A5F0(v13, @"makeNSUA", @"bundleID");
    id v20 = sub_10000AF10(v15);
    id v21 = sub_10000AF10(v16);
    sub_10000AF10(v18);
    id v26 = v16;
    uint64_t v23 = v22 = v15;
    id v24 = +[ATXAction atx_userActivityActionWithTitle:v20 subtitle:v21 bundleID:v13 activityType:v14 urlString:v23 userInfo:v17 heuristicName:WeakRetained[9]];

    id v15 = v22;
    id v16 = v26;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

int sub_10000D4FC(id a1)
{
  id v1 = (void *)CFPreferencesCopyAppValue(@"RandomTimeOffset", @"com.apple.proactive.HeuristicInterpreter");
  if (v1)
  {
    uint64_t v2 = sub_100002EBC();
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_DEBUG)) {
      sub_100017E5C((uint64_t)v1, v2);
    }

    LODWORD(v2) = [v1 intValue];
  }
  else
  {
    uint64_t v2 = arc4random_uniform(0x258u);
    CFPreferencesSetAppValue(@"RandomTimeOffset", +[NSNumber numberWithInt:v2], @"com.apple.proactive.HeuristicInterpreter");
    CFPreferencesAppSynchronize(@"com.apple.proactive.HeuristicInterpreter");
    id v3 = sub_100002EBC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100017DE4(v2, v3);
    }
  }
  return v2;
}

void sub_10000D5EC(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _addAction:v6 withCriteria:v5];
}

id sub_10000D664(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[15] timeIntervalSinceReferenceDate];
    id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_10000D6D0(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _dateFromTimeIntervalOrDate:v3];

  return v5;
}

NSNumber *__cdecl sub_10000D738(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (_UNKNOWN **)v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 timeIntervalSinceReferenceDate];
    +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v5 = sub_100002EBC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_100017ED4((uint64_t)v2, v5);
  }

  id v4 = &off_100028060;
LABEL_9:

  return (NSNumber *)v4;
}

BOOL sub_10000D808(id a1, double a2)
{
  id v2 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a2];
  id v3 = +[NSCalendar currentCalendar];
  unsigned __int8 v4 = [v3 isDateInToday:v2];

  return v4;
}

double sub_10000D86C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = +[NSCalendar currentCalendar];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained now];
  if (v6)
  {
    id v7 = [v4 startOfDayForDate:v6];
  }
  else
  {
    id v8 = objc_opt_new();
    id v7 = [v4 startOfDayForDate:v8];
  }
  if (a2)
  {
    id v9 = [v4 dateByAddingUnit:16 value:a2 toDate:v7 options:0];
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;
  }
  else
  {
    [v7 timeIntervalSinceReferenceDate];
    double v11 = v12;
  }

  return v11;
}

void sub_10000D96C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    id v6 = (void *)*((void *)WeakRetained + 9);
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = sub_100002EBC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ (JS): %@", (uint8_t *)&v9, 0x16u);
  }
}

void sub_10000DA5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained) {
    int v9 = (void *)*((void *)WeakRetained + 9);
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;
  __int16 v11 = sub_100002EBC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412803;
    id v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2113;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ (JS): %@ %{private}@", (uint8_t *)&v12, 0x20u);
  }
}

void sub_10000DB70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained) {
    int v9 = (void *)*((void *)WeakRetained + 9);
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;
  __int16 v11 = sub_100002EBC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412803;
    id v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2117;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ (JS): %@ %{sensitive}@", (uint8_t *)&v12, 0x20u);
  }
}

NSString *__cdecl sub_10000DC84(id a1, NSString *a2)
{
  id v2 = a2;
  sub_10000A5F0(v2, @"localizedAppName", @"bundleId");
  id v3 = +[ATXApplicationRecord localizedNameForBundle:v2];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[ATXApplicationRecord localizedShortnameForBundle:v2];
  }
  id v6 = v5;

  id v7 = sub_100002EBC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    int v12 = v2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Localized app name: %@ for bundleId: %@", (uint8_t *)&v9, 0x16u);
  }

  return (NSString *)v6;
}

void sub_10000DDA8(id a1, JSContext *a2, JSValue *a3)
{
  id v3 = a3;
  unsigned __int8 v4 = sub_100002EBC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_100017F7C(v3, v4);
  }
}

id sub_10000DDFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained _mgQueryCaller:*(unsigned int *)(a1 + 40)];

  return v3;
}

void sub_10000E0B4(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectByEvaluatingJavaScript:@"ALL_HEURISTICS"];
  unsigned __int8 v4 = (void *)qword_10002E368;
  qword_10002E368 = v3;
}

void sub_10000E320(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) generateAllHeuristicNames];
  unsigned __int8 v4 = (void *)qword_10002E378;
  qword_10002E378 = v3;
}

void sub_10000E95C(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = +[NSString stringWithFormat:@"new %@().update()", *(void *)(a1 + 40)];
  id v2 = [v1 evaluateScript:v3];
}

void sub_10000EC00(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = +[NSString stringWithFormat:@"new %@().refresh()", *(void *)(a1 + 40)];
  id v2 = [v1 evaluateScript:v3];
}

void sub_1000107C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a16);
  objc_destroyWeak(a17);
  objc_destroyWeak(a18);
  objc_destroyWeak(a19);
  objc_destroyWeak(a20);
  objc_destroyWeak(a21);
  objc_destroyWeak(a22);
  objc_destroyWeak(a23);
  objc_destroyWeak(a24);
  objc_destroyWeak((id *)(v32 - 112));
  _Unwind_Resume(a1);
}

void sub_1000108BC()
{
}

void sub_1000108C4()
{
}

void sub_1000108CC()
{
}

void sub_1000108D4()
{
}

void sub_1000108DC()
{
}

void sub_1000108E8()
{
}

void sub_1000108F4()
{
}

void sub_1000108FC()
{
}

void sub_100010904()
{
}

void sub_10001090C()
{
}

void sub_100010918()
{
}

void sub_100010924()
{
}

void sub_10001092C()
{
}

void sub_100010934()
{
}

void sub_10001093C()
{
}

void sub_100010944()
{
}

void sub_10001094C()
{
}

void sub_100010958()
{
}

void sub_100010964()
{
}

id sub_10001096C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _clipboardContentsFromDataSource];

  return v2;
}

id sub_1000109B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _isFocusModeActiveFromDataSource];

  return v2;
}

id sub_1000109F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _visibleCalendarsFromDataSource];

  return v2;
}

id sub_100010A40(uint64_t a1, double a2, double a3)
{
  id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained _calendarEventsFromDataSourceBetweenStartDate:v5 endDate:v6];

  return v8;
}

id sub_100010ADC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10000A5F0(v3, @"getEventPasses", @"style");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained _eventPassesFromDataSourceWithStyle:v3];

  return v5;
}

id sub_100010B58(uint64_t a1, void *a2, void *a3, uint64_t a4, double a5, double a6, double a7)
{
  id v13 = a3;
  id v14 = a2;
  id v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a7];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v17 = sub_10000AF10(v14);

  id v18 = [WeakRetained _travelTimeForEventWithID:v17 latitude:v15 longitude:v13 expectedArrivalDate:a4 transportType:a5 localOnlyAfterFirstUpdate:a6];

  return v18;
}

id sub_100010C44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _vipsFromDataSource];

  return v2;
}

id sub_100010C90(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = sub_10000AF10(v3);

  id v6 = [WeakRetained _extraordinaryEventsFromDataSourceWithProminentFeature:v5];

  return v6;
}

id sub_100010D10(uint64_t a1, double a2, double a3)
{
  id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained _holidayEventsFromDataSourceBetweenStartDate:v5 endDate:v6];

  return v8;
}

double sub_100010DAC(id a1, NSDictionary *a2, NSDictionary *a3)
{
  unsigned __int8 v4 = a2;
  id v5 = a3;
  double v6 = -1.0;
  if (v4)
  {
    uint64_t v7 = [(NSDictionary *)v4 objectForKeyedSubscript:@"lat"];
    if (v7)
    {
      id v8 = (void *)v7;
      int v9 = [(NSDictionary *)v4 objectForKeyedSubscript:@"lon"];

      if (v5)
      {
        if (v9)
        {
          uint64_t v10 = [(NSDictionary *)v5 objectForKeyedSubscript:@"lat"];
          if (v10)
          {
            __int16 v11 = (void *)v10;
            int v12 = [(NSDictionary *)v5 objectForKeyedSubscript:@"lon"];

            if (v12)
            {
              id v13 = objc_alloc((Class)CLLocation);
              id v14 = [(NSDictionary *)v4 objectForKeyedSubscript:@"lat"];
              [v14 doubleValue];
              double v16 = v15;
              id v17 = [(NSDictionary *)v4 objectForKeyedSubscript:@"lon"];
              [v17 doubleValue];
              id v19 = [v13 initWithLatitude:v16 longitude:v18];

              id v20 = objc_alloc((Class)CLLocation);
              id v21 = [(NSDictionary *)v5 objectForKeyedSubscript:@"lat"];
              [v21 doubleValue];
              double v23 = v22;
              id v24 = [(NSDictionary *)v5 objectForKeyedSubscript:@"lon"];
              [v24 doubleValue];
              id v26 = [v20 initWithLatitude:v23 longitude:v25];

              [v19 distanceFromLocation:v26];
              double v6 = v27;
            }
          }
        }
      }
    }
  }

  return v6;
}

id sub_100010F78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  sub_10000A5F0(v5, @"getBestContactHandle", @"serviceString");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained _bestContactHandleFromDataSourceWithContact:v6 serviceString:v5];

  return v8;
}

id sub_10001100C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _allHandlesFromDataSourceWithContact:v3];

  return v5;
}

id sub_100011074(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _favoriteContactsFromDataSourceWithExistingContacts:v3];

  return v5;
}

id sub_1000110DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _birthdayEventsFromDataSource];

  return v2;
}

id sub_100011128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = [WeakRetained _callHistoryFromDataSourceWithMaxAge:a2 showIncomingCalls:a3 showOutgoingCalls:a4 showMissedCallsOnly:a5];

  return v10;
}

ATXHeuristicRequestRideForEventActionMaker *__cdecl sub_1000111A4(id a1, NSString *a2, NSString *a3, NSDictionary *a4, ATXHeuristicObjectHandle *a5, NSString *a6)
{
  uint64_t v10 = a3;
  __int16 v11 = a4;
  int v12 = a6;
  id v13 = a5;
  id v14 = a2;
  sub_10000A5F0(v14, @"makeRequestRideActionForEvent", @"title");
  sub_10000A5F0(v10, @"makeRequestRideActionForEvent", @"subtitle");
  if (!v11) {
    goto LABEL_5;
  }
  id v15 = [(NSDictionary *)v11 objectForKeyedSubscript:@"lat"];
  if (!v15) {
    goto LABEL_6;
  }
  double v16 = [(NSDictionary *)v11 objectForKeyedSubscript:@"lon"];

  if (v16)
  {
    id v17 = objc_alloc((Class)CLLocation);
    double v18 = [(NSDictionary *)v11 objectForKeyedSubscript:@"lat"];
    [v18 doubleValue];
    double v20 = v19;
    id v21 = [(NSDictionary *)v11 objectForKeyedSubscript:@"lon"];
    [v21 doubleValue];
    id v15 = [v17 initWithLatitude:v20 longitude:v22];
  }
  else
  {
LABEL_5:
    id v15 = 0;
  }
LABEL_6:
  id v23 = [objc_alloc((Class)ATXHeuristicRequestRideForEventActionMaker) initWithTitle:v14 subtitle:v10 pickupLocation:v15 dropoffEvent:v13 preferredAppBundleID:v12];

  return (ATXHeuristicRequestRideForEventActionMaker *)v23;
}

id sub_10001134C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  sub_10000A5F0(v6, @"getUserAppPreference", @"intentName");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained _userAppPreferenceFromDataSourceWithIntentName:v6 parameterCombination:v5];

  return v8;
}

id sub_1000113E0(uint64_t a1, void *a2, void *a3)
{
  unsigned __int8 v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _dateFromTimeIntervalOrDate:v5];

  id v9 = objc_loadWeakRetained(v4);
  uint64_t v10 = [v9 _duetInteractionCountFromDataSourceWithHandles:v6 date:v8];

  return v10;
}

id sub_100011488(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _peopleSuggestionsFromDataSource];

  return v2;
}

uint64_t sub_1000114D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained _bestTimeToInteractFromDataSourceWithContact:v3];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = -1;
    double v11 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = (int)objc_msgSend(v13, "intValue", (void)v19);
        id v15 = [v6 objectForKeyedSubscript:v13];
        [v15 doubleValue];
        double v17 = v16;

        if (v11 >= v17)
        {
          if (v11 == v17 && v10 <= v14) {
            uint64_t v10 = v14;
          }
        }
        else
        {
          double v11 = v17;
          uint64_t v10 = v14;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

id sub_100011664(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _timeIntervalSinceUserWakeup];

  return v2;
}

id sub_1000116B0(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _fetchWidgetMetadataForAppBundleIds:v3];

  return v5;
}

id sub_100011718(uint64_t a1, double a2, double a3)
{
  id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = [WeakRetained _getLocationForMostRelevantTripInRangeFrom:v5 to:v6];

  return v8;
}

id sub_1000117B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _modeCorrelatedAppsInCurrentMode];

  return v2;
}

id sub_100011800(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _predictedBedTime];

  return v2;
}

id sub_10001184C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _scheduledBedTime];

  return v2;
}

void sub_100011AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100011AE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100011D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100011D7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100012040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100012074(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1000122A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000122DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100012720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100012770(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1000129A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000129D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100012C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100012C40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100012E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100012EA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10001313C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100013170(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100013414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100013448(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10001367C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000136B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100013A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100013A54(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1[4] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v23 = v9;

  uint64_t v15 = *(void *)(a1[5] + 8);
  double v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v10;
  id v17 = v10;

  uint64_t v18 = *(void *)(a1[6] + 8);
  long long v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v11;
  id v20 = v11;

  uint64_t v21 = *(void *)(a1[7] + 8);
  long long v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v12;
}

void sub_100013CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100013CE8(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void sub_100013EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100013EE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10001414C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100014180(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100014430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100014464(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100014698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000146CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100014900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100014934(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100014BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100014BE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100014E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100014E48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100015098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000150CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10001534C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100015380(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1000156E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_100015718(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10001597C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000159B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100015BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100015C18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100015E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100015E80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100016100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100016134(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100016368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001639C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1000165EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100016620(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100016884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000168B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_100016AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100016B20(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && v8)
  {
    id v10 = objc_alloc((Class)NSUserDefaults);
    id v11 = [v10 initWithSuiteName:_ATXDomain];
    v18[0] = @"apps";
    v18[1] = @"modeStartDate";
    v19[0] = v7;
    v19[1] = v8;
    v18[2] = @"relevanceDelayDisabled";
    uint64_t v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 BOOLForKey:@"ATXModeRelevanceDelayDisabled"]);
    v19[2] = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v9;
}

void sub_100016E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100016E6C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1000170BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000170F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_1000172B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id sub_1000172D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (ATXDetailedActionLoggingEnabled())
    {
      id v3 = sub_100002EBC();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138739971;
        uint64_t v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clipboard contents: %{sensitive}@", buf, 0xCu);
      }
    }
    id v5 = *(void **)(a1 + 40);
    v13[0] = *(void *)(a1 + 32);
    CFStringRef v10 = @"content";
    CFStringRef v11 = @"creationTimestamp";
    if (!v5) {
      id v5 = (void *)WeakRetained[15];
    }
    objc_msgSend(v5, "timeIntervalSinceReferenceDate", v10, v11);
    id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    CFStringRef v12 = @"originatorBundleID";
    uint64_t v7 = *(void *)(a1 + 48);
    v13[1] = v6;
    v13[2] = v7;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v13 forKeys:&v10 count:3];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

_UNKNOWN **sub_1000174C8(uint64_t a1, double a2, double a3)
{
  double v5 = *(double *)(a1 + 32);
  id v6 = sub_100002EBC();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 > a2 || v5 + 86400.0 < a3)
  {
    if (v7)
    {
      *(_WORD *)CFStringRef v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "getHolidayEvents (mocked): Not asking about a holiday today", v11, 2u);
    }
    uint64_t v9 = (_UNKNOWN **)&__NSArray0__struct;
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "getHolidayEvents (mocked): Asking about a holiday Today", buf, 2u);
    }
    uint64_t v9 = &off_100028200;
  }

  return v9;
}

_UNKNOWN **sub_10001763C(uint64_t a1, double a2, double a3)
{
  double v5 = *(double *)(a1 + 32);
  double v6 = v5 + 86400.0;
  double v7 = v5 + 172800.0;
  uint64_t v8 = sub_100002EBC();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6 > a2 || v7 < a3)
  {
    if (v9)
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getHolidayEvents (mocked): Not asking about a holiday tomorrow", v13, 2u);
    }
    CFStringRef v11 = (_UNKNOWN **)&__NSArray0__struct;
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getHolidayEvents (mocked): Asking about a holiday for tomorrow", buf, 2u);
    }
    CFStringRef v11 = &off_100028218;
  }

  return v11;
}

id sub_1000177E8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100017898(uint64_t a1)
{
  v6[0] = @"generationDate";
  uint64_t v2 = objc_opt_new();
  v6[1] = @"estimatedTravelTime";
  v7[0] = v2;
  id v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v7[1] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void sub_100017A40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id sub_100017A5C(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained _isEventAtOneWithTimeIntervelOrDate:v4 usesTwelveHourClock:*(unsigned __int8 *)(a1 + 40)];

  return v6;
}

id sub_100017B90()
{
  id v1 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"null", @"(null)", @"undefined", @"(undefined)", 0);

  return v1;
}

uint64_t sub_100017C14(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2112;
  *(void *)(a4 + 14) = v4;
  return result;
}

void sub_100017C40(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void sub_100017C5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100017C98()
{
  sub_100017C78();
  sub_100017C5C((void *)&_mh_execute_header, v0, v1, "Heuristic Bundle doesn't exist!", v2, v3, v4, v5, v6);
}

void sub_100017CCC()
{
  sub_100017C84();
  uint64_t v3 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "%@: encountered null value for: %@", v2, 0x16u);
}

void sub_100017D48()
{
  sub_100017C78();
  sub_100017C5C((void *)&_mh_execute_header, v0, v1, "makeTravelWeatherIntent: the placemark could not be encoded to JSON", v2, v3, v4, v5, v6);
}

void sub_100017D7C()
{
  sub_100017C78();
  sub_100017C5C((void *)&_mh_execute_header, v0, v1, "makeTravelWeatherIntent: the reason string is missing", v2, v3, v4, v5, v6);
}

void sub_100017DB0()
{
  sub_100017C78();
  sub_100017C5C((void *)&_mh_execute_header, v0, v1, "makeTravelWeatherIntent: the locality string is missing", v2, v3, v4, v5, v6);
}

void sub_100017DE4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Created new random time offset: %d", (uint8_t *)v2, 8u);
}

void sub_100017E5C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Using existing random time offset: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100017ED4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  sub_100017C84();
  uint64_t v7 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Expected timestamp or date, got %@: %@", v6, 0x16u);
}

void sub_100017F7C(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 objectForKeyedSubscript:@"line"];
  uint64_t v5 = [v4 toString];
  uint8_t v6 = [a1 toString];
  uint64_t v7 = [a1 objectForKeyedSubscript:@"stack"];
  uint64_t v8 = [v7 toString];
  int v9 = 138412802;
  CFStringRef v10 = v5;
  __int16 v11 = 2112;
  CFStringRef v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "JS exception, line %@: %@\n%@", (uint8_t *)&v9, 0x20u);
}

void sub_100018094()
{
  sub_100017C2C();
  sub_100017C14(v0, 4.8752e-34, v1, v2);
  sub_100017C40((void *)&_mh_execute_header, "Error querying data source %{public}s: %@", v3, v4);
}

void sub_1000180CC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid pass style: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100018144()
{
  sub_100017C78();
  sub_100017C5C((void *)&_mh_execute_header, v0, v1, "Contact is missing", v2, v3, v4, v5, v6);
}

void sub_100018178()
{
  sub_100017C78();
  sub_100017C5C((void *)&_mh_execute_header, v0, v1, "Contact or service from is invalid", v2, v3, v4, v5, v6);
}

void sub_1000181AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Service (%@) not found in service dictionary", (uint8_t *)&v2, 0xCu);
}

void sub_100018224()
{
  sub_100017C78();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "BestTimeToInteractFromDataSource Error: Contact is invalid", v1, 2u);
}

id sub_10001841C(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
LABEL_5:
    uint64_t v4 = v2;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc((Class)NSDate);
    [v1 doubleValue];
    id v2 = objc_msgSend(v3, "initWithTimeIntervalSinceReferenceDate:");
    goto LABEL_5;
  }
  uint64_t v4 = 0;
LABEL_7:

  return v4;
}

id sub_100018898(const __CFArray *a1, const __CFString *a2, CFTypeRef *a3)
{
  CFIndex Count = CFArrayGetCount(a1);
  uint64_t v4 = sub_100002EBC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100019434(Count, v4);
  }

  id v40 = [objc_alloc((Class)NSMutableArray) initWithCapacity:Count];
  if (Count >= 1)
  {
    CFIndex v6 = 0;
    uint64_t v41 = DDBinderTrackingNumberKey;
    uint64_t v7 = &ATXDetailedActionLoggingEnabled_ptr;
    *(void *)&long long v5 = 138412546;
    long long v39 = v5;
    CFIndex v42 = Count;
    while (1)
    {
      CFArrayGetValueAtIndex(a1, v6);
      CFIndex Range = DDResultGetRange();
      CFIndex v10 = v9;
      v52.location = Range;
      v52.length = v9;
      __int16 v11 = (__CFString *)CFStringCreateWithSubstring(0, a2, v52);
      DDResultGetType();
      CFStringRef v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      __int16 v13 = sub_100002EBC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Found data detector type: %{public}@", buf, 0xCu);
      }

      if (![@"HttpURL" isEqualToString:v12])
      {
        unsigned int v19 = [@"Value" isEqualToString:v12];
        if (a3 && v19 && !*a3) {
          *a3 = CFRetain(v11);
        }
LABEL_20:
        uint64_t SubResults = DDResultGetSubResults();
        double v25 = objc_opt_new();
        id v26 = +[NSNumber numberWithLong:Range];
        [v25 setObject:v26 forKeyedSubscript:@"location"];

        double v27 = +[NSNumber numberWithLong:v10];
        [v25 setObject:v27 forKeyedSubscript:@"length"];

        [v25 setObject:v11 forKeyedSubscript:@"text"];
        id v46 = 0;
        if (SubResults)
        {
          if (a3)
          {
            if (*a3) {
              id v28 = &v46;
            }
            else {
              id v28 = (id *)a3;
            }
          }
          else
          {
            id v28 = &v46;
          }
          uint64_t v29 = sub_100018898(SubResults, a2, v28);
          [v25 setObject:v29 forKeyedSubscript:@"subresults"];
        }
        else
        {
          [v25 setObject:&__NSArray0__struct forKeyedSubscript:@"subresults"];
        }
        id v30 = v46;
        uint64_t v7 = &ATXDetailedActionLoggingEnabled_ptr;
        if (v46 || (Value = (void *)DDResultGetValue(), (v46 = Value) != 0) && (CFRetain(Value), (id v30 = v46) != 0))
        {
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, @"value", v39);
        }
        if (objc_msgSend(@"PhoneNumber", "isEqualToString:", v12, v39))
        {
          if (objc_msgSend(v46, "atx_isCreditCardNumber"))
          {

            CFStringRef v12 = @"_CreditCard";
          }
          if (objc_msgSend(v46, "atx_isSSN"))
          {

            CFStringRef v12 = @"_SSN";
          }
        }
        if ([(__CFString *)v12 isEqualToString:v41])
        {
          id v31 = DDResultGetSubResults();
          if ([v31 count] == (id)1)
          {
            [v31 firstObject];
            uint64_t v32 = DDResultGetType();
            DDResultGetMatchedString();
            id v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
            id v34 = +[NSCharacterSet URLQueryAllowedCharacterSet];
            id v35 = [(__CFString *)v33 stringByAddingPercentEncodingWithAllowedCharacters:v34];

            id v36 = sub_100002EBC();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v39;
              v48 = v33;
              __int16 v49 = 2112;
              v50 = v32;
              _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Found tracking number: %@ company: %@", buf, 0x16u);
            }

            [v25 setObject:v32 forKeyedSubscript:@"companyName"];
            [v25 setObject:v33 forKeyedSubscript:@"trackingNumber"];
            [v25 setObject:v35 forKeyedSubscript:@"urlEncodedTrackingNumber"];

            uint64_t v7 = &ATXDetailedActionLoggingEnabled_ptr;
          }
        }
        [v25 setObject:v12 forKeyedSubscript:@"type"];

        goto LABEL_42;
      }
      uint64_t v14 = DDResultGetValue();
      uint64_t v15 = v14 ? (__CFString *)v14 : v11;
      uint64_t v16 = v15;
      uint64_t v17 = [v7[157] URLWithString:v16];
      if (v17) {
        break;
      }
      id v20 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v16, &stru_100025C48);

      uint64_t v21 = +[NSCharacterSet URLQueryAllowedCharacterSet];
      id v22 = [v21 mutableCopy];

      uint64_t v7 = &ATXDetailedActionLoggingEnabled_ptr;
      [v22 addCharactersInString:@"#"];
      uint64_t v16 = [(__CFString *)v20 stringByAddingPercentEncodingWithAllowedCharacters:v22];

      uint64_t v18 = +[NSURL URLWithString:v16];

      if (v18) {
        goto LABEL_18;
      }
      id v23 = 0;
LABEL_19:

      __int16 v11 = v23;
      if (v23) {
        goto LABEL_20;
      }
      double v25 = 0;
LABEL_42:

      if (v25) {
        [v40 addObject:v25];
      }

      if (v42 == ++v6) {
        goto LABEL_51;
      }
    }
    uint64_t v18 = (void *)v17;
LABEL_18:
    uint64_t v16 = v16;

    id v23 = v16;
    goto LABEL_19;
  }
LABEL_51:

  return v40;
}

void sub_1000192B8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error making scanner: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100019334(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "ScanString returned no results", v1, 2u);
}

void sub_100019378(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "No detector results to copy", v1, 2u);
}

void sub_1000193BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Running data detectors on: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100019434(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Number of results: %ld", (uint8_t *)&v2, 0xCu);
}

id ATXActionsFromEnvResult(void *a1)
{
  id v1 = a1;
  int v2 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = v1;
  uint64_t v3 = [v1 allValues];
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        CFIndex v9 = [v8 actionMakers];
        id v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v18;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)j) action];
              if (v14) {
                [v2 addObject:v14];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v11);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  [v2 sortUsingComparator:&stru_100025B88];

  return v2;
}

int64_t sub_100019698(id a1, ATXAction *a2, ATXAction *a3)
{
  id v4 = a3;
  id v5 = [(ATXAction *)a2 heuristic];
  uint64_t v6 = [(ATXAction *)v4 heuristic];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

double ATXMemoryUsageInMBOfCurrentProcess()
{
  kern_return_t v0;
  double result;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v4;
  long long v5;
  long long v6;
  long long v7;
  long long v8;
  long long v9;
  long long v10;
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  int v26;

  id v26 = 0;
  long long v24 = 0u;
  double v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v16 = 0u;
  long long v17 = 0u;
  uint64_t v14 = 0u;
  uint64_t v15 = 0u;
  uint64_t v12 = 0u;
  __int16 v13 = 0u;
  id v11 = 0u;
  CFIndex v9 = 0u;
  id v10 = 0u;
  id v7 = 0u;
  uint64_t v8 = 0u;
  id v5 = 0u;
  uint64_t v6 = 0u;
  *(_OWORD *)task_info_out = 0u;
  id v4 = 0u;
  task_info_outCnt = 93;
  os_log_t v0 = task_info(mach_task_self_, 0x16u, task_info_out, &task_info_outCnt);
  result = (double)(unint64_t)v12 * 0.0009765625 * 0.0009765625;
  if (v0) {
    return -1.0;
  }
  return result;
}

uint64_t ATXDetailedActionLoggingEnabled()
{
  return _ATXDetailedActionLoggingEnabled();
}

uint64_t ATXHeuristicDataSourcesInterface()
{
  return _ATXHeuristicDataSourcesInterface();
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

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return _CFURLCreateStringByReplacingPercentEscapes(allocator, originalString, charactersToLeaveEscaped);
}

uint64_t DDResultGetMatchedString()
{
  return _DDResultGetMatchedString();
}

uint64_t DDResultGetRange()
{
  return _DDResultGetRange();
}

uint64_t DDResultGetSubResults()
{
  return _DDResultGetSubResults();
}

uint64_t DDResultGetType()
{
  return _DDResultGetType();
}

uint64_t DDResultGetValue()
{
  return _DDResultGetValue();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return _DDScannerCopyResultsWithOptions();
}

uint64_t DDScannerCreate()
{
  return _DDScannerCreate();
}

uint64_t DDScannerScanString()
{
  return _DDScannerScanString();
}

void JSGarbageCollect(JSContextRef ctx)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
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

void objc_storeStrong(id *location, id obj)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_JSGlobalContextRef(void *a1, const char *a2, ...)
{
  return [a1 JSGlobalContextRef];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__allHeuristicClassNames(void *a1, const char *a2, ...)
{
  return [a1 _allHeuristicClassNames];
}

id objc_msgSend__allHeuristicNames(void *a1, const char *a2, ...)
{
  return [a1 _allHeuristicNames];
}

id objc_msgSend__batteryInformationFromDataSource(void *a1, const char *a2, ...)
{
  return [a1 _batteryInformationFromDataSource];
}

id objc_msgSend__bestAppSuggestionFromDataSource(void *a1, const char *a2, ...)
{
  return [a1 _bestAppSuggestionFromDataSource];
}

id objc_msgSend__birthdayEventsFromDataSource(void *a1, const char *a2, ...)
{
  return [a1 _birthdayEventsFromDataSource];
}

id objc_msgSend__clipboardContentsFromDataSource(void *a1, const char *a2, ...)
{
  return [a1 _clipboardContentsFromDataSource];
}

id objc_msgSend__currentLocationFromDataSource(void *a1, const char *a2, ...)
{
  return [a1 _currentLocationFromDataSource];
}

id objc_msgSend__injectScript(void *a1, const char *a2, ...)
{
  return [a1 _injectScript];
}

id objc_msgSend__isFocusModeActiveFromDataSource(void *a1, const char *a2, ...)
{
  return [a1 _isFocusModeActiveFromDataSource];
}

id objc_msgSend__modeCorrelatedAppsInCurrentMode(void *a1, const char *a2, ...)
{
  return [a1 _modeCorrelatedAppsInCurrentMode];
}

id objc_msgSend__nlEventsFromDataSource(void *a1, const char *a2, ...)
{
  return [a1 _nlEventsFromDataSource];
}

id objc_msgSend__peopleSuggestionsFromDataSource(void *a1, const char *a2, ...)
{
  return [a1 _peopleSuggestionsFromDataSource];
}

id objc_msgSend__predictedBedTime(void *a1, const char *a2, ...)
{
  return [a1 _predictedBedTime];
}

id objc_msgSend__recordErrorForCurrentHeuristic(void *a1, const char *a2, ...)
{
  return [a1 _recordErrorForCurrentHeuristic];
}

id objc_msgSend__refreshAfterUserWakeUp(void *a1, const char *a2, ...)
{
  return [a1 _refreshAfterUserWakeUp];
}

id objc_msgSend__refreshOnAirplaneModeToggle(void *a1, const char *a2, ...)
{
  return [a1 _refreshOnAirplaneModeToggle];
}

id objc_msgSend__refreshWithInferredModeStream(void *a1, const char *a2, ...)
{
  return [a1 _refreshWithInferredModeStream];
}

id objc_msgSend__refreshWithUserFocusComputedModeStream(void *a1, const char *a2, ...)
{
  return [a1 _refreshWithUserFocusComputedModeStream];
}

id objc_msgSend__registerDataSources(void *a1, const char *a2, ...)
{
  return [a1 _registerDataSources];
}

id objc_msgSend__scheduledBedTime(void *a1, const char *a2, ...)
{
  return [a1 _scheduledBedTime];
}

id objc_msgSend__setUpInterpreter(void *a1, const char *a2, ...)
{
  return [a1 _setUpInterpreter];
}

id objc_msgSend__timeIntervalSinceUserWakeup(void *a1, const char *a2, ...)
{
  return [a1 _timeIntervalSinceUserWakeup];
}

id objc_msgSend__usualAlarmTimeOfDayDataSource(void *a1, const char *a2, ...)
{
  return [a1 _usualAlarmTimeOfDayDataSource];
}

id objc_msgSend__vipsFromDataSource(void *a1, const char *a2, ...)
{
  return [a1 _vipsFromDataSource];
}

id objc_msgSend__visibleCalendarsFromDataSource(void *a1, const char *a2, ...)
{
  return [a1 _visibleCalendarsFromDataSource];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actionMakers(void *a1, const char *a2, ...)
{
  return [a1 actionMakers];
}

id objc_msgSend_actionTypeName(void *a1, const char *a2, ...)
{
  return [a1 actionTypeName];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultHeuristicBundlePath(void *a1, const char *a2, ...)
{
  return [a1 defaultHeuristicBundlePath];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_expirers(void *a1, const char *a2, ...)
{
  return [a1 expirers];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_generateAllHeuristicNames(void *a1, const char *a2, ...)
{
  return [a1 generateAllHeuristicNames];
}

id objc_msgSend_hasFailed(void *a1, const char *a2, ...)
{
  return [a1 hasFailed];
}

id objc_msgSend_heuristic(void *a1, const char *a2, ...)
{
  return [a1 heuristic];
}

id objc_msgSend_heuristicName(void *a1, const char *a2, ...)
{
  return [a1 heuristicName];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_keyPathForAirplaneModeStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForAirplaneModeStatus];
}

id objc_msgSend_keyPathForFirstWakeupStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForFirstWakeupStatus];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listenerEndpoint(void *a1, const char *a2, ...)
{
  return [a1 listenerEndpoint];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextFireDate(void *a1, const char *a2, ...)
{
  return [a1 nextFireDate];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_originatingDeviceName(void *a1, const char *a2, ...)
{
  return [a1 originatingDeviceName];
}

id objc_msgSend_refreshTriggers(void *a1, const char *a2, ...)
{
  return [a1 refreshTriggers];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return [a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_suggestions(void *a1, const char *a2, ...)
{
  return [a1 suggestions];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_toBool(void *a1, const char *a2, ...)
{
  return [a1 toBool];
}

id objc_msgSend_toDouble(void *a1, const char *a2, ...)
{
  return [a1 toDouble];
}

id objc_msgSend_toInt32(void *a1, const char *a2, ...)
{
  return [a1 toInt32];
}

id objc_msgSend_toObject(void *a1, const char *a2, ...)
{
  return [a1 toObject];
}

id objc_msgSend_toString(void *a1, const char *a2, ...)
{
  return [a1 toString];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_userActivityTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 userActivityTypeIdentifier];
}

id objc_msgSend_waitForSemaphore_timeoutSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForSemaphore:timeoutSeconds:");
}