void sub_410C(id a1)
{
  uint64_t vars8;

  qword_281B8 = objc_alloc_init(NanoCalendarPreferences);

  _objc_release_x1();
}

void sub_5060(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CUIKDateStrings overlayCalendarPickerDisplayNameForCalendarWithIdentifier:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
}

void sub_5B48(id a1)
{
  qword_281C8 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilecal"];

  _objc_release_x1();
}

void sub_5BE4(id a1)
{
  MainBundle = CFBundleGetMainBundle();
  if ([(__CFString *)(id)CFBundleGetIdentifier(MainBundle) isEqualToString:@"com.apple.NanoCalendar"])
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
  }
  else
  {
    id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.NanoCalendar"];
  }
  qword_281D8 = (uint64_t)v2;

  _objc_release_x1();
}

id OverlayCalendarLocaleID()
{
  v0 = +[NanoCalendarPreferences sharedPreferences];
  v1 = [v0 overlayCalendarID];

  id v2 = +[IntlUtility localeForCalendarID:v1];
  id v3 = [v2 localeIdentifier];

  return v3;
}

id ncs_log_error()
{
  if (qword_281F0 != -1) {
    dispatch_once(&qword_281F0, &stru_20778);
  }
  v0 = (void *)qword_281E8;

  return v0;
}

void sub_6E18(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "error");
  id v2 = (void *)qword_281E8;
  qword_281E8 = (uint64_t)v1;

  id v3 = qword_281E8;
  if (os_log_type_enabled((os_log_t)qword_281E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> error [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_lifecycle()
{
  if (qword_28200 != -1) {
    dispatch_once(&qword_28200, &stru_20798);
  }
  v0 = (void *)qword_281F8;

  return v0;
}

void sub_6EF0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "lifecycle");
  id v2 = (void *)qword_281F8;
  qword_281F8 = (uint64_t)v1;

  id v3 = qword_281F8;
  if (os_log_type_enabled((os_log_t)qword_281F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> lifecycle [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_snapshot()
{
  if (qword_28210 != -1) {
    dispatch_once(&qword_28210, &stru_207B8);
  }
  v0 = (void *)qword_28208;

  return v0;
}

void sub_6FC8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "snapshot");
  id v2 = (void *)qword_28208;
  qword_28208 = (uint64_t)v1;

  id v3 = qword_28208;
  if (os_log_type_enabled((os_log_t)qword_28208, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> snapshot [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_snapshot_creation()
{
  if (qword_28220 != -1) {
    dispatch_once(&qword_28220, &stru_207D8);
  }
  v0 = (void *)qword_28218;

  return v0;
}

void sub_70A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "snapshot_creation");
  id v2 = (void *)qword_28218;
  qword_28218 = (uint64_t)v1;

  id v3 = qword_28218;
  if (os_log_type_enabled((os_log_t)qword_28218, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> snapshot_creation [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_snapshot_vending()
{
  if (qword_28230 != -1) {
    dispatch_once(&qword_28230, &stru_207F8);
  }
  v0 = (void *)qword_28228;

  return v0;
}

void sub_7178(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "snapshot_vending");
  id v2 = (void *)qword_28228;
  qword_28228 = (uint64_t)v1;

  id v3 = qword_28228;
  if (os_log_type_enabled((os_log_t)qword_28228, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> snapshot_vending [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_selected_calendars()
{
  if (qword_28240 != -1) {
    dispatch_once(&qword_28240, &stru_20818);
  }
  v0 = (void *)qword_28238;

  return v0;
}

void sub_7250(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "selected_calendars");
  id v2 = (void *)qword_28238;
  qword_28238 = (uint64_t)v1;

  id v3 = qword_28238;
  if (os_log_type_enabled((os_log_t)qword_28238, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> selected_calendars [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_data_loading()
{
  if (qword_28250 != -1) {
    dispatch_once(&qword_28250, &stru_20838);
  }
  v0 = (void *)qword_28248;

  return v0;
}

void sub_7328(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "data_loading");
  id v2 = (void *)qword_28248;
  qword_28248 = (uint64_t)v1;

  id v3 = qword_28248;
  if (os_log_type_enabled((os_log_t)qword_28248, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> data_loading [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_data_loading_verbose()
{
  if (qword_28260 != -1) {
    dispatch_once(&qword_28260, &stru_20858);
  }
  v0 = (void *)qword_28258;

  return v0;
}

void sub_7400(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "data_loading_verbose");
  id v2 = (void *)qword_28258;
  qword_28258 = (uint64_t)v1;

  id v3 = qword_28258;
  if (os_log_type_enabled((os_log_t)qword_28258, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> data_loading_verbose [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_data_display()
{
  if (qword_28270 != -1) {
    dispatch_once(&qword_28270, &stru_20878);
  }
  v0 = (void *)qword_28268;

  return v0;
}

void sub_74D8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "data_display");
  id v2 = (void *)qword_28268;
  qword_28268 = (uint64_t)v1;

  id v3 = qword_28268;
  if (os_log_type_enabled((os_log_t)qword_28268, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> data_display [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_always_on_display()
{
  if (qword_28280 != -1) {
    dispatch_once(&qword_28280, &stru_20898);
  }
  v0 = (void *)qword_28278;

  return v0;
}

void sub_75B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "always_on_display");
  id v2 = (void *)qword_28278;
  qword_28278 = (uint64_t)v1;

  id v3 = qword_28278;
  if (os_log_type_enabled((os_log_t)qword_28278, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> always_on_display [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_user_interaction()
{
  if (qword_28290 != -1) {
    dispatch_once(&qword_28290, &stru_208B8);
  }
  v0 = (void *)qword_28288;

  return v0;
}

void sub_7688(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "user_interaction");
  id v2 = (void *)qword_28288;
  qword_28288 = (uint64_t)v1;

  id v3 = qword_28288;
  if (os_log_type_enabled((os_log_t)qword_28288, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> user_interaction [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_user_data_change()
{
  if (qword_282A0 != -1) {
    dispatch_once(&qword_282A0, &stru_208D8);
  }
  v0 = (void *)qword_28298;

  return v0;
}

void sub_7760(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "user_data_change");
  id v2 = (void *)qword_28298;
  qword_28298 = (uint64_t)v1;

  id v3 = qword_28298;
  if (os_log_type_enabled((os_log_t)qword_28298, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> user_data_change [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_icon_generation()
{
  if (qword_282B0 != -1) {
    dispatch_once(&qword_282B0, &stru_208F8);
  }
  v0 = (void *)qword_282A8;

  return v0;
}

void sub_7838(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "icon_generation");
  id v2 = (void *)qword_282A8;
  qword_282A8 = (uint64_t)v1;

  id v3 = qword_282A8;
  if (os_log_type_enabled((os_log_t)qword_282A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> icon_generation [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_metrics()
{
  if (qword_282C0 != -1) {
    dispatch_once(&qword_282C0, &stru_20918);
  }
  v0 = (void *)qword_282B8;

  return v0;
}

void sub_7910(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "metrics");
  id v2 = (void *)qword_282B8;
  qword_282B8 = (uint64_t)v1;

  id v3 = qword_282B8;
  if (os_log_type_enabled((os_log_t)qword_282B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> metrics [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_utility()
{
  if (qword_282D0 != -1) {
    dispatch_once(&qword_282D0, &stru_20938);
  }
  v0 = (void *)qword_282C8;

  return v0;
}

void sub_79E8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "utility");
  id v2 = (void *)qword_282C8;
  qword_282C8 = (uint64_t)v1;

  id v3 = qword_282C8;
  if (os_log_type_enabled((os_log_t)qword_282C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> utility [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_settings()
{
  if (qword_282E0 != -1) {
    dispatch_once(&qword_282E0, &stru_20958);
  }
  v0 = (void *)qword_282D8;

  return v0;
}

void sub_7AC0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "settings");
  id v2 = (void *)qword_282D8;
  qword_282D8 = (uint64_t)v1;

  id v3 = qword_282D8;
  if (os_log_type_enabled((os_log_t)qword_282D8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> settings [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_status_bar()
{
  if (qword_282F0 != -1) {
    dispatch_once(&qword_282F0, &stru_20978);
  }
  v0 = (void *)qword_282E8;

  return v0;
}

void sub_7B98(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "status_bar");
  id v2 = (void *)qword_282E8;
  qword_282E8 = (uint64_t)v1;

  id v3 = qword_282E8;
  if (os_log_type_enabled((os_log_t)qword_282E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> status_bar [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_complication()
{
  if (qword_28300 != -1) {
    dispatch_once(&qword_28300, &stru_20998);
  }
  v0 = (void *)qword_282F8;

  return v0;
}

void sub_7C70(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "complication");
  id v2 = (void *)qword_282F8;
  qword_282F8 = (uint64_t)v1;

  id v3 = qword_282F8;
  if (os_log_type_enabled((os_log_t)qword_282F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> complication [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_event_creation()
{
  if (qword_28310 != -1) {
    dispatch_once(&qword_28310, &stru_209B8);
  }
  v0 = (void *)qword_28308;

  return v0;
}

void sub_7D48(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "event_creation");
  id v2 = (void *)qword_28308;
  qword_28308 = (uint64_t)v1;

  id v3 = qword_28308;
  if (os_log_type_enabled((os_log_t)qword_28308, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> event_creation [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_alerts_ttl()
{
  if (qword_28320 != -1) {
    dispatch_once(&qword_28320, &stru_209D8);
  }
  v0 = (void *)qword_28318;

  return v0;
}

void sub_7E20(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "alerts_ttl");
  id v2 = (void *)qword_28318;
  qword_28318 = (uint64_t)v1;

  id v3 = qword_28318;
  if (os_log_type_enabled((os_log_t)qword_28318, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> alerts_ttl [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_bulletin_ui()
{
  if (qword_28330 != -1) {
    dispatch_once(&qword_28330, &stru_209F8);
  }
  v0 = (void *)qword_28328;

  return v0;
}

void sub_7EF8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "bulletin_ui");
  id v2 = (void *)qword_28328;
  qword_28328 = (uint64_t)v1;

  id v3 = qword_28328;
  if (os_log_type_enabled((os_log_t)qword_28328, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> bulletin_ui [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_reminders_snapshot()
{
  if (qword_28340 != -1) {
    dispatch_once(&qword_28340, &stru_20A18);
  }
  v0 = (void *)qword_28338;

  return v0;
}

void sub_7FD0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "reminders_snapshot");
  id v2 = (void *)qword_28338;
  qword_28338 = (uint64_t)v1;

  id v3 = qword_28338;
  if (os_log_type_enabled((os_log_t)qword_28338, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> reminders_snapshot [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_reminders_demo()
{
  if (qword_28350 != -1) {
    dispatch_once(&qword_28350, &stru_20A38);
  }
  v0 = (void *)qword_28348;

  return v0;
}

void sub_80A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "reminders_demo");
  id v2 = (void *)qword_28348;
  qword_28348 = (uint64_t)v1;

  id v3 = qword_28348;
  if (os_log_type_enabled((os_log_t)qword_28348, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> reminders_demo [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

id ncs_log_debugging()
{
  if (qword_28360 != -1) {
    dispatch_once(&qword_28360, &stru_20A58);
  }
  v0 = (void *)qword_28358;

  return v0;
}

void sub_8180(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "debugging");
  id v2 = (void *)qword_28358;
  qword_28358 = (uint64_t)v1;

  id v3 = qword_28358;
  if (os_log_type_enabled((os_log_t)qword_28358, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> debugging [Nov 10 2024 06:29:01]", v4, 2u);
  }
}

uint64_t _actsLikeCustomerBuild()
{
  if (qword_28370 != -1) {
    dispatch_once(&qword_28370, &stru_20A78);
  }
  return byte_28368;
}

void sub_8248(id a1)
{
  id v1 = +[NanoCalendarPreferences appDefaults];
  byte_28368 = [v1 BOOLForKey:@"ActsLikeCustomerBuild"];
}

uint64_t _isInternalBuild()
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    if (qword_28370 != -1) {
      dispatch_once(&qword_28370, &stru_20A78);
    }
    return byte_28368 == 0;
  }
  return result;
}

uint64_t NCSLoggingConfidentionInformationAllowed()
{
  if (qword_28378 != -1) {
    dispatch_once(&qword_28378, &stru_20A98);
  }
  return byte_28380;
}

void sub_8340(id a1)
{
  byte_28380 = _isInternalBuild();
}

id NanoCalLogStringForDateAndTime(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_28390 != -1) {
      dispatch_once(&qword_28390, &stru_20AB8);
    }
    id v2 = [(id)qword_28388 stringFromDate:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_8D40(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_28388;
  qword_28388 = (uint64_t)v1;

  id v3 = (void *)qword_28388;

  _[v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss EEE"];
}

void sub_90E4(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v5 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_28408);
  id WeakRetained = objc_loadWeakRetained(&qword_28410);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    id v8 = objc_loadWeakRetained(&qword_28410);
    if (v8 == v5)
    {
      id v9 = [v5 version];
      uint64_t v10 = qword_28418;

      if (v9 == (id)v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v11 = objc_storeWeak(&qword_28410, v5);
  qword_28418 = (uint64_t)[v5 version];

  sub_9E08(v12, v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_28408);
  *(void *)(a3 + 48) = 0;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  if (a2 == 12)
  {
    v14 = &xmmword_283D0;
  }
  else
  {
    if (a2 != 10)
    {
      v13 = ncs_log_complication();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_14B84(a2, v13);
      }
    }
    v14 = &xmmword_28398;
  }
  long long v15 = v14[1];
  *(_OWORD *)a3 = *v14;
  *(_OWORD *)(a3 + 16) = v15;
  *(_OWORD *)(a3 + 32) = v14[2];
  *(void *)(a3 + 48) = *((void *)v14 + 6);
}

void sub_9498(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id sub_94C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && (uint64_t v3 = (void *)*((void *)WeakRetained + 6)) != 0)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[CLKDate complicationDate];
  }
  id v5 = v4;

  return v5;
}

void sub_9538(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

id sub_9880(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _updateDate];
}

void sub_9E08(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v10 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v10 scaledValue:10.0];
  *(void *)&xmmword_28398 = v3;
  *((UIFontWeight *)&xmmword_28398 + 1) = UIFontWeightMedium;
  [v10 scaledValue:14.0];
  *(void *)&xmmword_283B8 = v4;
  [v10 scaledValue:21.0];
  qword_283A8 = v5;
  unk_283B0 = *(void *)&UIFontWeightMedium;
  [v10 scaledValue:18.0];
  *((void *)&xmmword_283B8 + 1) = v6;
  [v10 scaledValue:50.0];
  qword_283C8 = v7;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v9 = v8;

  xmmword_283D0 = xmmword_28398;
  *(_OWORD *)&qword_283E0 = *(_OWORD *)&qword_283A8;
  *(double *)&xmmword_283D0 = v9 * *(double *)&xmmword_28398;
  *(double *)&qword_283E0 = v9 * *(double *)&qword_283A8;
  xmmword_283F0 = (__int128)vmulq_n_f64((float64x2_t)xmmword_283B8, v9);
  *(double *)&qword_28400 = v9 * *(double *)&qword_283C8;
}

id sub_9FD4(uint64_t a1)
{
  v5[0] = @"mirroringCompanion";
  id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v5[1] = @"overlayCalendar";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

NSAttributedString *__cdecl sub_AB34(id a1, NSString *a2, unint64_t a3, CLKTextProviderStyle *a4)
{
  uint64_t v6 = a2;
  id v7 = 0;
  if (v6 && !a3)
  {
    double v8 = a4;
    if ([(CLKTextProviderStyle *)v8 uppercase])
    {
      double v9 = +[NSLocale currentLocale];
      uint64_t v10 = [(NSString *)v6 uppercaseStringWithLocale:v9];

      uint64_t v6 = (NSString *)v10;
    }
    id v11 = [(CLKTextProviderStyle *)v8 font];
    uint64_t v12 = [v11 fontDescriptor];
    v13 = [v12 fontDescriptorWithSymbolicTraits:1];
    v14 = [(CLKTextProviderStyle *)v8 font];

    [v14 pointSize];
    long long v15 = +[CLKFont fontWithDescriptor:size:](CLKFont, "fontWithDescriptor:size:", v13);

    NSAttributedStringKey v18 = NSFontAttributeName;
    v19 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v7 = [objc_alloc((Class)NSAttributedString) initWithString:v6 attributes:v16];
  }

  return (NSAttributedString *)v7;
}

id sub_ACDC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = a4;
    id v8 = a2;
    double v9 = [v7 font];
    uint64_t v10 = [v7 smallCapsBaseFont];

    id v11 = +[NSTimeZone calendarTimeZone];
    uint64_t v4 = +[NCALTimelineEntryModel _swapPlaceholderString:@"<ATTRIB_TIME_PLACEHOLD>" withTimeStringForDate:v6 inString:v8 usingBaseFont:v9 smallCapsBaseFont:v10 timeZone:v11 options:2];
  }

  return v4;
}

NSAttributedString *__cdecl sub_B28C(id a1, NSString *a2, unint64_t a3, CLKTextProviderStyle *a4)
{
  uint64_t v6 = a2;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  if (v6 && !a3)
  {
    if ([(CLKTextProviderStyle *)v7 uppercase])
    {
      uint64_t v10 = +[NSLocale currentLocale];
      uint64_t v11 = [(NSString *)v6 uppercaseStringWithLocale:v10];

      uint64_t v6 = (NSString *)v11;
    }
    uint64_t v12 = [(CLKTextProviderStyle *)v8 font];
    [v12 pointSize];
    v13 = +[CLKFont systemFontOfSize:weight:design:](CLKFont, "systemFontOfSize:weight:design:", CLKRoundedFontDesignName);

    NSAttributedStringKey v16 = NSFontAttributeName;
    v17 = v13;
    v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v9 = [objc_alloc((Class)NSAttributedString) initWithString:v6 attributes:v14];
  }

  return (NSAttributedString *)v9;
}

void sub_B6B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = 40;
  if (!a2) {
    uint64_t v7 = 48;
  }
  uint64_t v8 = *(void *)(a1 + v7);
  NSAttributedStringKey v11 = NSFontAttributeName;
  uint64_t v12 = v8;
  id v9 = a2;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  objc_msgSend(v6, "setAttributes:range:", v10, a3, a4);
}

void sub_BD48()
{
  v0 = NCALComplicationImageNamed(@"analogNextEventCalendar");
  id v1 = NCALComplicationImageNamed(@"analogNextEventCalendarBackground");
  id v2 = NCALComplicationImageNamed(@"analogNextEventCalendarForeground");
  uint64_t v3 = +[CLKImageProvider imageProviderWithOnePieceImage:v0 twoPieceImageBackground:v1 twoPieceImageForeground:v2];
  uint64_t v4 = (void *)qword_28420;
  qword_28420 = v3;

  uint64_t v5 = (void *)qword_28420;
  id v6 = +[UIColor systemRedColor];
  [v5 setTintColor:v6];
}

id sub_C334(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = a4;
    id v8 = a2;
    id v9 = [v7 font];
    uint64_t v10 = [v7 smallCapsBaseFont];

    NSAttributedStringKey v11 = +[NSTimeZone calendarTimeZone];
    uint64_t v4 = +[NCALTimelineEntryModel _swapPlaceholderString:@"<ATTRIB_TIME_PLACEHOLD>" withTimeStringForDate:v6 inString:v8 usingBaseFont:v9 smallCapsBaseFont:v10 timeZone:v11 options:6];
  }

  return v4;
}

id sub_CEE0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = a4;
    id v8 = a2;
    id v9 = [v7 font];
    uint64_t v10 = [v7 smallCapsBaseFont];

    NSAttributedStringKey v11 = +[NSTimeZone calendarTimeZone];
    uint64_t v4 = +[NCALTimelineEntryModel _swapPlaceholderString:@"<ATTRIB_TIME_PLACEHOLD>" withTimeStringForDate:v6 inString:v8 usingBaseFont:v9 smallCapsBaseFont:v10 timeZone:v11 options:2];
  }

  return v4;
}

void sub_D568()
{
  v0 = NCALComplicationImageNamed(@"SignatureCornerCalendarNextEvent_Mono");
  id v4 = +[CLKImageProvider imageProviderWithOnePieceImage:v0];

  id v1 = NCALComplicationImageNamed(@"SignatureCornerCalendarNextEvent");
  uint64_t v2 = +[CLKFullColorImageProvider providerWithFullColorImage:v1 tintedImageProvider:v4 applyScalingAndCircularMasking:0];
  uint64_t v3 = (void *)qword_28440;
  qword_28440 = v2;
}

void sub_DDA8(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)qword_28460;
  qword_28460 = v2;

  id v4 = (void *)qword_28460;
  uint64_t v5 = NCALComplicationLocalizedString(@"NEXTEVENT_NEXT_EVENT_TITLE_LARGE_MODULAR");
  uint64_t v6 = +[CLKSimpleTextProvider textProviderWithText:v5];
  [v4 setModularLargeHeader:v6];

  id v7 = (void *)qword_28460;
  id v8 = NCALComplicationLocalizedString(@"COMPLICATION_LOCKED_PLACEHOLDER_LARGE_MODULAR");
  id v9 = +[CLKSimpleTextProvider textProviderWithText:v8];
  [v7 setModularLargeFirst:v9];

  uint64_t v10 = (void *)qword_28460;
  NSAttributedStringKey v11 = NCALComplicationLocalizedString(@"COMPLICATION_LOCKED_PLACEHOLDER_LONG_UTILITY");
  uint64_t v12 = +[CLKSimpleTextProvider textProviderWithText:v11];
  [v10 setUtilityLarge:v12];

  v13 = (void *)qword_28460;
  v14 = NCALComplicationLocalizedString(@"UNKNOWN_TIME");
  long long v15 = +[CLKSimpleTextProvider textProviderWithText:v14];
  [v13 setUtilitySmall:v15];

  NSAttributedStringKey v16 = (void *)qword_28460;
  v17 = [*(id *)(a1 + 32) _modularSmallCalendarImageWithConflicts:0];
  [v16 setModularSmallTop:v17];

  NSAttributedStringKey v18 = (void *)qword_28460;
  v19 = NCALComplicationLocalizedString(@"UNKNOWN_TIME");
  v20 = +[CLKSimpleTextProvider textProviderWithText:v19];
  [v18 setModularSmallBottom:v20];

  v21 = (void *)qword_28460;
  v22 = NCALComplicationImageNamed(@"colorAnalogCalendarNoContent");
  v23 = +[CLKImageProvider imageProviderWithOnePieceImage:v22];
  [v21 setCircularSmallImage:v23];

  v24 = (void *)qword_28460;
  v25 = NCALComplicationImageNamed(@"victoryCalendarNone");
  v26 = +[CLKImageProvider imageProviderWithOnePieceImage:v25];
  [v24 setCircularMediumImage:v26];

  v27 = (void *)qword_28460;
  v28 = [*(id *)(a1 + 32) _utilityCalendarImageProvider];
  [v27 setUtilityImageProvider:v28];

  v29 = (void *)qword_28460;
  v30 = [*(id *)(a1 + 32) _extraLargeCalendarImageProviderWithConflicts:0];
  [v29 setExtraLargeTop:v30];

  v31 = (void *)qword_28460;
  v32 = NCALComplicationLocalizedString(@"UNKNOWN_TIME");
  v33 = +[CLKSimpleTextProvider textProviderWithText:v32];
  [v31 setGraphicStackTimeText:v33];

  v34 = (void *)qword_28460;
  v35 = [*(id *)(a1 + 32) _graphicExtraLargeImageProviderWithConflicts:0];
  [v34 setGraphicExtraLargeTop:v35];

  NCALComplicationLocalizedString(@"CALENDAR_BEZEL_COMPLICATION_LOCKED_TEXT");
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  v36 = NCALComplicationLocalizedString(@"CALENDAR_BEZEL_COMPLICATION_LOCKED_TEXT_SHORT");
  v37 = (void *)qword_28460;
  v38 = +[CLKSimpleTextProvider textProviderWithText:v42 shortText:v36];
  [v37 setSignatureBezel:v38];

  v39 = (void *)qword_28460;
  v40 = NCALComplicationLocalizedString(@"NEXTEVENT_LOCKED_SIGNATURE_CORNER");
  v41 = +[CLKSimpleTextProvider textProviderWithText:v40];
  [v39 setSignatureCornerTextProvider:v41];
}

void sub_E3C4(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)qword_28480;
  qword_28480 = v2;

  id v4 = (void *)qword_28480;
  uint64_t v5 = NCALComplicationLocalizedString(@"NEXTEVENT_NEXT_EVENT_TITLE_LARGE_MODULAR");
  uint64_t v6 = +[CLKSimpleTextProvider textProviderWithText:v5];
  [v4 setModularLargeHeader:v6];

  id v7 = (void *)qword_28480;
  id v8 = NCALComplicationLocalizedString(@"NEXTEVENT_FETCHING_LARGE_MODULAR");
  id v9 = +[CLKSimpleTextProvider textProviderWithText:v8];
  [v7 setModularLargeFirst:v9];

  uint64_t v10 = (void *)qword_28480;
  NSAttributedStringKey v11 = NCALComplicationLocalizedString(@"NEXTEVENT_FETCHING_LONG_UTILITY");
  uint64_t v12 = +[CLKSimpleTextProvider textProviderWithText:v11];
  [v10 setUtilityLarge:v12];

  v13 = (void *)qword_28480;
  v14 = NCALComplicationLocalizedString(@"UNKNOWN_TIME");
  long long v15 = +[CLKSimpleTextProvider textProviderWithText:v14];
  [v13 setUtilitySmall:v15];

  NSAttributedStringKey v16 = (void *)qword_28480;
  v17 = [*(id *)(a1 + 32) _modularSmallCalendarImageWithConflicts:0];
  [v16 setModularSmallTop:v17];

  NSAttributedStringKey v18 = (void *)qword_28480;
  v19 = NCALComplicationLocalizedString(@"UNKNOWN_TIME");
  v20 = +[CLKSimpleTextProvider textProviderWithText:v19];
  [v18 setModularSmallBottom:v20];

  v21 = (void *)qword_28480;
  v22 = NCALComplicationImageNamed(@"colorAnalogCalendarNoContent");
  v23 = +[CLKImageProvider imageProviderWithOnePieceImage:v22];
  [v21 setCircularSmallImage:v23];

  v24 = (void *)qword_28480;
  v25 = NCALComplicationImageNamed(@"victoryCalendarNone");
  v26 = +[CLKImageProvider imageProviderWithOnePieceImage:v25];
  [v24 setCircularMediumImage:v26];

  v27 = (void *)qword_28480;
  v28 = [*(id *)(a1 + 32) _utilityCalendarImageProvider];
  [v27 setUtilityImageProvider:v28];

  v29 = (void *)qword_28480;
  v30 = [*(id *)(a1 + 32) _extraLargeCalendarImageProviderWithConflicts:0];
  [v29 setExtraLargeTop:v30];

  v31 = (void *)qword_28480;
  v32 = NCALComplicationLocalizedString(@"UNKNOWN_TIME");
  v33 = +[CLKSimpleTextProvider textProviderWithText:v32];
  [v31 setGraphicStackTimeText:v33];

  v34 = (void *)qword_28480;
  v35 = [*(id *)(a1 + 32) _graphicExtraLargeImageProviderWithConflicts:0];
  [v34 setGraphicExtraLargeTop:v35];

  v36 = (void *)qword_28480;
  v37 = NCALComplicationLocalizedString(@"CALENDAR_BEZEL_COMPLICATION_LOADING_TEXT");
  v38 = +[CLKSimpleTextProvider textProviderWithText:v37];
  [v36 setSignatureBezel:v38];

  v39 = (void *)qword_28480;
  NCALComplicationLocalizedString(@"NEXTEVENT_LOADING_SIGNATURE_CORNER");
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  v40 = +[CLKSimpleTextProvider textProviderWithText:v41];
  [v39 setSignatureCornerTextProvider:v40];
}

void sub_114AC(uint64_t a1, void *a2)
{
  id v2 = a2;
  int IsTallScript = NTKLanguageIsTallScript();
  id v14 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];

  [v14 scaledValue:15.5];
  uint64_t v5 = v4;
  [v14 scaledValue:16.0];
  if (IsTallScript) {
    uint64_t v6 = v5;
  }
  qword_284A0 = v6;
  [v14 scaledValue:19.5];
  qword_284A8 = v7;
  [v14 scaledValue:3 withOverride:5.5 forSizeClass:5.5];
  qword_284B0 = v8;
  [v14 scaledValue:3 withOverride:-1.5 forSizeClass:-1.0];
  qword_284B8 = v9;
  [v14 scaledValue:4.0];
  qword_284C0 = v10;
  [v14 scaledValue:2.0];
  qword_284C8 = v11;
  [v14 scaledValue:1.0];
  qword_284D0 = v12;
  [v14 scaledValue:3 withOverride:6.0 forSizeClass:6.5];
  qword_284D8 = v13;
  qword_284E0 = v13;
}

id NCALComplicationLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = sub_11758();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_20EE0 table:@"Localizable"];

  return v3;
}

id NCALComplicationLocalizedFormat(void *a1)
{
  id v1 = a1;
  id v2 = sub_11758();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_20EE0 table:@"Formats"];

  return v3;
}

id NCALComplicationImageNamed(void *a1)
{
  id v1 = a1;
  id v2 = sub_11758();
  uint64_t v3 = +[UIImage imageNamed:v1 inBundle:v2 compatibleWithTraitCollection:0];

  return v3;
}

id sub_11758()
{
  if (qword_28508 != -1) {
    dispatch_once(&qword_28508, &stru_20C48);
  }
  v0 = (void *)qword_28500;

  return v0;
}

void sub_117AC(id a1)
{
  qword_28500 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_12270(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_28588);
  id WeakRetained = objc_loadWeakRetained(&qword_28590);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_28590);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_28598;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_28590, obj);
  qword_28598 = (uint64_t)[obj version];

  sub_136A8(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_28588);
  long long v10 = *(_OWORD *)&qword_28570;
  *(_OWORD *)(a2 + 64) = xmmword_28560;
  *(_OWORD *)(a2 + 80) = v10;
  *(void *)(a2 + 96) = qword_28580;
  long long v11 = *(_OWORD *)&qword_28530;
  *(_OWORD *)a2 = xmmword_28520;
  *(_OWORD *)(a2 + 16) = v11;
  long long v12 = xmmword_28550;
  *(_OWORD *)(a2 + 32) = xmmword_28540;
  *(_OWORD *)(a2 + 48) = v12;
}

void sub_125F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_12620(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

id sub_12660(uint64_t a1)
{
  id v2 = +[CLKDate complicationDate];
  uint64_t v3 = NTKAddDaysToDate();

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 8);
    if (!v6) {
      id v6 = v3;
    }
    id v7 = v6;

    uint64_t v3 = v7;
  }

  return v3;
}

void sub_12868(id a1)
{
  v8[0] = @"transform";
  id v1 = +[NSNull null];
  v9[0] = v1;
  v8[1] = @"position";
  id v2 = +[NSNull null];
  v9[1] = v2;
  v8[2] = @"fillColor";
  uint64_t v3 = +[NSNull null];
  v9[2] = v3;
  v8[3] = @"filters";
  uint64_t v4 = +[NSNull null];
  v9[3] = v4;
  v8[4] = @"opacity";
  id v5 = +[NSNull null];
  v9[4] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  id v7 = (void *)qword_28510;
  qword_28510 = v6;
}

void sub_12DBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  unint64_t v5 = *(void *)(a1 + 40);
  id v11 = v3;
  if (v5 - 2 < 2)
  {
    BOOL v7 = v4 == v3;
    uint64_t v10 = 88;
    if (v7) {
      uint64_t v10 = 72;
    }
    double v9 = *(double *)(a1 + v10) + *(double *)(a1 + 112) * 0.5;
    uint64_t v6 = 1;
  }
  else
  {
    if (v5 > 1) {
      goto LABEL_10;
    }
    uint64_t v6 = 0;
    BOOL v7 = v4 == v3;
    uint64_t v8 = 80;
    if (v7) {
      uint64_t v8 = 64;
    }
    double v9 = *(double *)(a1 + v8);
  }
  [v3 setCircleRadius:v9];
  [v11 setInterior:v6];
LABEL_10:
}

id sub_12FB4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _updateDate];
}

void sub_136A8(uint64_t a1, uint64_t a2)
{
  id v11 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v11 scaledValue:3 withOverride:13.0 forSizeClass:15.0];
  *(void *)&xmmword_28520 = v2;
  [v11 scaledValue:9.0];
  *((void *)&xmmword_28520 + 1) = v3;
  [v11 setRoundingBehavior:2];
  [v11 scaledValue:3 withOverride:96.0 forSizeClass:109.5];
  qword_28530 = v4;
  [v11 scaledValue:3 withOverride:102.5 forSizeClass:117.0];
  qword_28538 = v5;
  [v11 scaledValue:3 withOverride:85.0 forSizeClass:97.0];
  *(void *)&xmmword_28540 = v6;
  [v11 scaledValue:3 withOverride:89.5 forSizeClass:102.0];
  *((void *)&xmmword_28540 + 1) = v7;
  [v11 setRoundingBehavior:1];
  xmmword_28550 = xmmword_19720;
  [v11 scaledValue:3 withOverride:1.5 forSizeClass:2.0];
  *(void *)&xmmword_28560 = v8;
  [v11 scaledValue:3 withOverride:2.5 forSizeClass:2.0];
  *((void *)&xmmword_28560 + 1) = v9;
  [v11 scaledValue:3 withOverride:3.0 forSizeClass:4.0];
  qword_28570 = v10;
  *(_OWORD *)algn_28578 = xmmword_19730;
}

id NextEventIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id NextEventIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NextEventIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for NextEventIntent()
{
  return self;
}

id NextEventIntent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NextEventIntent();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_140C4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_140D4()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_285A8 = (uint64_t)result;
  return result;
}

uint64_t sub_14128(uint64_t a1)
{
  return sub_1484C(a1, qword_28638);
}

uint64_t sub_1414C()
{
  return sub_14914(&qword_285B0, (uint64_t)qword_28638);
}

uint64_t sub_14170(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_141A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_285B0, (uint64_t)qword_28638, a1);
}

uint64_t sub_141CC(uint64_t a1)
{
  return sub_1484C(a1, qword_28650);
}

uint64_t sub_141F0()
{
  return sub_14914(&qword_285B8, (uint64_t)qword_28650);
}

uint64_t sub_14214@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_285B8, (uint64_t)qword_28650, a1);
}

uint64_t sub_14238(uint64_t a1)
{
  return sub_1484C(a1, qword_28668);
}

uint64_t sub_1425C()
{
  return sub_14914(&qword_285C0, (uint64_t)qword_28668);
}

uint64_t sub_14280@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_285C0, (uint64_t)qword_28668, a1);
}

uint64_t sub_142A4(uint64_t a1)
{
  return sub_1484C(a1, qword_28680);
}

uint64_t sub_142C8()
{
  return sub_14914(&qword_285C8, (uint64_t)qword_28680);
}

uint64_t sub_142EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_285C8, (uint64_t)qword_28680, a1);
}

uint64_t sub_14310(uint64_t a1)
{
  return sub_1484C(a1, qword_28698);
}

uint64_t sub_14334()
{
  return sub_14914(&qword_285D0, (uint64_t)qword_28698);
}

uint64_t sub_14358@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_285D0, (uint64_t)qword_28698, a1);
}

uint64_t sub_1437C(uint64_t a1)
{
  return sub_1484C(a1, qword_286B0);
}

uint64_t sub_143A0()
{
  return sub_14914(&qword_285D8, (uint64_t)qword_286B0);
}

uint64_t sub_143C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_285D8, (uint64_t)qword_286B0, a1);
}

uint64_t sub_143E8(uint64_t a1)
{
  return sub_1484C(a1, qword_286C8);
}

uint64_t sub_1440C()
{
  return sub_14914(&qword_285E0, (uint64_t)qword_286C8);
}

uint64_t sub_14430@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_285E0, (uint64_t)qword_286C8, a1);
}

uint64_t sub_14454(uint64_t a1)
{
  return sub_1484C(a1, qword_286E0);
}

uint64_t sub_14478()
{
  return sub_14914(&qword_285E8, (uint64_t)qword_286E0);
}

uint64_t sub_1449C@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_285E8, (uint64_t)qword_286E0, a1);
}

uint64_t sub_144C0(uint64_t a1)
{
  return sub_1484C(a1, qword_286F8);
}

uint64_t sub_144E4()
{
  return sub_14914(&qword_285F0, (uint64_t)qword_286F8);
}

uint64_t sub_14508@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_285F0, (uint64_t)qword_286F8, a1);
}

uint64_t sub_1452C(uint64_t a1)
{
  return sub_1484C(a1, qword_28710);
}

uint64_t sub_14550()
{
  return sub_14914(&qword_285F8, (uint64_t)qword_28710);
}

uint64_t sub_14574@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_285F8, (uint64_t)qword_28710, a1);
}

uint64_t sub_14598(uint64_t a1)
{
  return sub_1484C(a1, qword_28728);
}

uint64_t sub_145BC()
{
  return sub_14914(&qword_28600, (uint64_t)qword_28728);
}

uint64_t sub_145E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_28600, (uint64_t)qword_28728, a1);
}

uint64_t sub_14604(uint64_t a1)
{
  return sub_1484C(a1, qword_28740);
}

uint64_t sub_14630()
{
  return sub_14914(&qword_28608, (uint64_t)qword_28740);
}

uint64_t sub_14654@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_28608, (uint64_t)qword_28740, a1);
}

uint64_t sub_14678(uint64_t a1)
{
  return sub_1484C(a1, qword_28758);
}

uint64_t sub_1469C()
{
  return sub_14914(&qword_28610, (uint64_t)qword_28758);
}

uint64_t sub_146C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_28610, (uint64_t)qword_28758, a1);
}

uint64_t sub_146E4(uint64_t a1)
{
  return sub_1484C(a1, qword_28770);
}

uint64_t sub_14708()
{
  return sub_14914(&qword_28618, (uint64_t)qword_28770);
}

uint64_t sub_1472C@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_28618, (uint64_t)qword_28770, a1);
}

uint64_t sub_14750(uint64_t a1)
{
  return sub_1484C(a1, qword_28788);
}

uint64_t sub_14774()
{
  return sub_14914(&qword_28620, (uint64_t)qword_28788);
}

uint64_t sub_14798@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_28620, (uint64_t)qword_28788, a1);
}

uint64_t sub_147BC(uint64_t a1)
{
  return sub_1484C(a1, qword_287A0);
}

uint64_t sub_147E0()
{
  return sub_14914(&qword_28628, (uint64_t)qword_287A0);
}

uint64_t sub_14804@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_28628, (uint64_t)qword_287A0, a1);
}

uint64_t sub_14828(uint64_t a1)
{
  return sub_1484C(a1, qword_287B8);
}

uint64_t sub_1484C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_14C30();
  sub_14A48(v3, a2);
  sub_14170(v3, (uint64_t)a2);
  if (qword_285A0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_285A8;
  return sub_14C20();
}

uint64_t sub_148F0()
{
  return sub_14914(&qword_28630, (uint64_t)qword_287B8);
}

uint64_t sub_14914(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_14C30();

  return sub_14170(v3, a2);
}

uint64_t sub_14968@<X0>(uint64_t a1@<X8>)
{
  return sub_1498C(&qword_28630, (uint64_t)qword_287B8, a1);
}

uint64_t sub_1498C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_14C30();
  uint64_t v6 = sub_14170(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t *sub_14A48(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_14AAC(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [a2 nanoPrivacyAwareDescriptionForCalendars];
  int v9 = 138412802;
  uint64_t v10 = a1;
  __int16 v11 = 2048;
  long long v12 = v7;
  __int16 v13 = 2112;
  id v14 = v8;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "<%@: %p> selectedCalendars: %@", (uint8_t *)&v9, 0x20u);
}

void sub_14B84(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "const LayoutConstants _LayoutConstants(CLKDevice *__strong, CLKComplicationFamily)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unhandled complication family in %s constants: %ld", (uint8_t *)&v2, 0x16u);
}

uint64_t _s34NanoCalendarComplicationsCompanion15NextEventIntentC6intentyXlvgZ_0()
{
  return static NextEventTimelineEntryProvider.defaultConfiguration.getter();
}

uint64_t sub_14C20()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_14C30()
{
  return type metadata accessor for ImageResource();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return _CFBundleGetMainBundle();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  return _CLKComplicationGraphicExtraLargeCircularScalingFactor();
}

uint64_t CLKDegreesToRadians()
{
  return _CLKDegreesToRadians();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKRectCenteredXInRectForDevice()
{
  return _CLKRectCenteredXInRectForDevice();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKAddDaysToDate()
{
  return _NTKAddDaysToDate();
}

uint64_t NTKColorWithRGBA()
{
  return _NTKColorWithRGBA();
}

uint64_t NTKEqualObjects()
{
  return _NTKEqualObjects();
}

uint64_t NTKHourOfDateIsSingular()
{
  return _NTKHourOfDateIsSingular();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKLanguageIsTallScript()
{
  return _NTKLanguageIsTallScript();
}

uint64_t NTKLayoutIsRTL()
{
  return _NTKLayoutIsRTL();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t NTKStartOfDayForDate()
{
  return _NTKStartOfDayForDate();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CLKFontWithAlternativePunctuation(void *a1, const char *a2, ...)
{
  return _[a1 CLKFontWithAlternativePunctuation];
}

id objc_msgSend_CLKFontWithLocalizedSmallCaps(void *a1, const char *a2, ...)
{
  return _[a1 CLKFontWithLocalizedSmallCaps];
}

id objc_msgSend_NTKTimeWithDate_andDesignatorAttributes_timeZone_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NTKTimeWithDate:andDesignatorAttributes:timeZone:options:");
}

id objc_msgSend__calendarsThatAreVisible_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calendarsThatAreVisible:source:");
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return _[a1 _commonInit];
}

id objc_msgSend__createAndAddColoringLabelWithFontSize_dayOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createAndAddColoringLabelWithFontSize:dayOffset:");
}

id objc_msgSend__createAndAddLabelPlatterWithAngularWidth_color_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createAndAddLabelPlatterWithAngularWidth:color:");
}

id objc_msgSend__currentTimelineEntry(void *a1, const char *a2, ...)
{
  return _[a1 _currentTimelineEntry];
}

id objc_msgSend__currrentTimelineEntry(void *a1, const char *a2, ...)
{
  return _[a1 _currrentTimelineEntry];
}

id objc_msgSend__debugCLKSideBySideFamilies(void *a1, const char *a2, ...)
{
  return _[a1 _debugCLKSideBySideFamilies];
}

id objc_msgSend__entryForTemplateDescription_family_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_entryForTemplateDescription:family:");
}

id objc_msgSend__enumerateLabelsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateLabelsWithBlock:");
}

id objc_msgSend__extraLargeCalendarImageProviderWithConflicts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extraLargeCalendarImageProviderWithConflicts:");
}

id objc_msgSend__graphicCircularImageProviderWithConflicts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_graphicCircularImageProviderWithConflicts:");
}

id objc_msgSend__graphicExtraLargeImageProviderWithConflicts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_graphicExtraLargeImageProviderWithConflicts:");
}

id objc_msgSend__graphicRectangularDateBodyTextWithDate_displayLunarDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_graphicRectangularDateBodyTextWithDate:displayLunarDate:");
}

id objc_msgSend__graphicRectangularDateHeaderTextWithDate_useLunarDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_graphicRectangularDateHeaderTextWithDate:useLunarDate:");
}

id objc_msgSend__graphicStackTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_graphicStackTextProvider:");
}

id objc_msgSend__hasMigratedForFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasMigratedForFamily:");
}

id objc_msgSend__isLunarDateComplication(void *a1, const char *a2, ...)
{
  return _[a1 _isLunarDateComplication];
}

id objc_msgSend__lastLineBaseline(void *a1, const char *a2, ...)
{
  return _[a1 _lastLineBaseline];
}

id objc_msgSend__layoutCurvedLabel_centerAngleInDegree_editingRotationInDegree_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutCurvedLabel:centerAngleInDegree:editingRotationInDegree:");
}

id objc_msgSend__modularSmallCalendarImageWithConflicts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modularSmallCalendarImageWithConflicts:");
}

id objc_msgSend__newBezelTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newBezelTemplate];
}

id objc_msgSend__newCircularTemplateMedium_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newCircularTemplateMedium:");
}

id objc_msgSend__newExtraLargeLunarTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newExtraLargeLunarTemplate];
}

id objc_msgSend__newExtraLargeTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newExtraLargeTemplate];
}

id objc_msgSend__newGraphicRectangularTemplateDisplayingLunarDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newGraphicRectangularTemplateDisplayingLunarDate:");
}

id objc_msgSend__newLabelSubviewWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newLabelSubviewWithFont:");
}

id objc_msgSend__newLargeUtilitarianTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newLargeUtilitarianTemplate];
}

id objc_msgSend__newModularLargeLunarTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newModularLargeLunarTemplate];
}

id objc_msgSend__newModularLargeTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newModularLargeTemplate];
}

id objc_msgSend__newModularSmallLunarTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newModularSmallLunarTemplate];
}

id objc_msgSend__newModularSmallTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newModularSmallTemplate];
}

id objc_msgSend__newSignatureCircularTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newSignatureCircularTemplate];
}

id objc_msgSend__newSignatureCornerTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newSignatureCornerTemplate];
}

id objc_msgSend__newSignatureExtraLargeCircularTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newSignatureExtraLargeCircularTemplate];
}

id objc_msgSend__newSimpleTextTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newSimpleTextTemplate];
}

id objc_msgSend__newSmallFlatUtilitarianTemplate(void *a1, const char *a2, ...)
{
  return _[a1 _newSmallFlatUtilitarianTemplate];
}

id objc_msgSend__reportOverlayCalendarID_mirroringCompanion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportOverlayCalendarID:mirroringCompanion:");
}

id objc_msgSend__selectedCalendarsFromAllCalendars_deselectedCalendarIdentifier_deselectedCalendarSyncIdentifiers_deselectedCalendarSyncHashes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectedCalendarsFromAllCalendars:deselectedCalendarIdentifier:deselectedCalendarSyncIdentifiers:deselectedCalendarSyncHashes:");
}

id objc_msgSend__signatureCornerImageProvider(void *a1, const char *a2, ...)
{
  return _[a1 _signatureCornerImageProvider];
}

id objc_msgSend__simpleTextShortDateProvider(void *a1, const char *a2, ...)
{
  return _[a1 _simpleTextShortDateProvider];
}

id objc_msgSend__startObserving(void *a1, const char *a2, ...)
{
  return _[a1 _startObserving];
}

id objc_msgSend__stopObserving(void *a1, const char *a2, ...)
{
  return _[a1 _stopObserving];
}

id objc_msgSend__swapPlaceholderString_withTimeStringForDate_inString_usingBaseFont_smallCapsBaseFont_timeZone_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_swapPlaceholderString:withTimeStringForDate:inString:usingBaseFont:smallCapsBaseFont:timeZone:options:");
}

id objc_msgSend__updateDate(void *a1, const char *a2, ...)
{
  return _[a1 _updateDate];
}

id objc_msgSend__updateFilters(void *a1, const char *a2, ...)
{
  return _[a1 _updateFilters];
}

id objc_msgSend__updateFiltersWithFraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFiltersWithFraction:");
}

id objc_msgSend__updateOverlayCalendarCache(void *a1, const char *a2, ...)
{
  return _[a1 _updateOverlayCalendarCache];
}

id objc_msgSend__updateViews_withFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateViews:withFilters:");
}

id objc_msgSend__utilityCalendarImageProvider(void *a1, const char *a2, ...)
{
  return _[a1 _utilityCalendarImageProvider];
}

id objc_msgSend__wrappedPrimaryEventLocation(void *a1, const char *a2, ...)
{
  return _[a1 _wrappedPrimaryEventLocation];
}

id objc_msgSend__wrappedPrimaryEventOrganizerName(void *a1, const char *a2, ...)
{
  return _[a1 _wrappedPrimaryEventOrganizerName];
}

id objc_msgSend__wrappedPrimaryEventTitle(void *a1, const char *a2, ...)
{
  return _[a1 _wrappedPrimaryEventTitle];
}

id objc_msgSend__wrappedSecondaryEventTitle(void *a1, const char *a2, ...)
{
  return _[a1 _wrappedSecondaryEventTitle];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 activeTimeZone];
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_allCalendars(void *a1, const char *a2, ...)
{
  return _[a1 allCalendars];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allowsContentModifications(void *a1, const char *a2, ...)
{
  return _[a1 allowsContentModifications];
}

id objc_msgSend_appDefaults(void *a1, const char *a2, ...)
{
  return _[a1 appDefaults];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayForKey:");
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

id objc_msgSend_availability(void *a1, const char *a2, ...)
{
  return _[a1 availability];
}

id objc_msgSend_beginEditing(void *a1, const char *a2, ...)
{
  return _[a1 beginEditing];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_body2Label(void *a1, const char *a2, ...)
{
  return _[a1 body2Label];
}

id objc_msgSend_bodyLabel(void *a1, const char *a2, ...)
{
  return _[a1 bodyLabel];
}

id objc_msgSend_bodyTextProviderWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bodyTextProviderWithDate:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
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

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _[a1 calendar];
}

id objc_msgSend_calendarIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 calendarIdentifier];
}

id objc_msgSend_calendarTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 calendarTimeZone];
}

id objc_msgSend_calendarsForEntityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendarsForEntityType:");
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _[a1 capHeight];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_circular_isMedium_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "circular:isMedium:");
}

id objc_msgSend_circularMediumImage(void *a1, const char *a2, ...)
{
  return _[a1 circularMediumImage];
}

id objc_msgSend_circularSmallImage(void *a1, const char *a2, ...)
{
  return _[a1 circularSmallImage];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_complicationDate(void *a1, const char *a2, ...)
{
  return _[a1 complicationDate];
}

id objc_msgSend_complicationTemplate(void *a1, const char *a2, ...)
{
  return _[a1 complicationTemplate];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
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

id objc_msgSend_contentForLargeModular_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentForLargeModular:");
}

id objc_msgSend_contentForSignatureRectangular_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentForSignatureRectangular:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_cornerComplicationPosition(void *a1, const char *a2, ...)
{
  return _[a1 cornerComplicationPosition];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_customDeselectedCalendarHashes(void *a1, const char *a2, ...)
{
  return _[a1 customDeselectedCalendarHashes];
}

id objc_msgSend_customDeselectedCalendarSyncIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 customDeselectedCalendarSyncIdentifiers];
}

id objc_msgSend_customOverlayCalendarID(void *a1, const char *a2, ...)
{
  return _[a1 customOverlayCalendarID];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deselectedCalendarSyncHashes(void *a1, const char *a2, ...)
{
  return _[a1 deselectedCalendarSyncHashes];
}

id objc_msgSend_deselectedCalendarSyncIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 deselectedCalendarSyncIdentifiers];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayAsConflicting(void *a1, const char *a2, ...)
{
  return _[a1 displayAsConflicting];
}

id objc_msgSend_displayAsFirstInDay(void *a1, const char *a2, ...)
{
  return _[a1 displayAsFirstInDay];
}

id objc_msgSend_displayAsTomorrow(void *a1, const char *a2, ...)
{
  return _[a1 displayAsTomorrow];
}

id objc_msgSend_displayEntryDateInGraphicCircularView(void *a1, const char *a2, ...)
{
  return _[a1 displayEntryDateInGraphicCircularView];
}

id objc_msgSend_displayLunarDate(void *a1, const char *a2, ...)
{
  return _[a1 displayLunarDate];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endEditing(void *a1, const char *a2, ...)
{
  return _[a1 endEditing];
}

id objc_msgSend_entryDate(void *a1, const char *a2, ...)
{
  return _[a1 entryDate];
}

id objc_msgSend_entryForComplicationFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryForComplicationFamily:");
}

id objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_eventColors(void *a1, const char *a2, ...)
{
  return _[a1 eventColors];
}

id objc_msgSend_eventCount(void *a1, const char *a2, ...)
{
  return _[a1 eventCount];
}

id objc_msgSend_eventEndDate(void *a1, const char *a2, ...)
{
  return _[a1 eventEndDate];
}

id objc_msgSend_eventStartDate(void *a1, const char *a2, ...)
{
  return _[a1 eventStartDate];
}

id objc_msgSend_eventStartDateTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventStartDateTextProvider:");
}

id objc_msgSend_externalURL(void *a1, const char *a2, ...)
{
  return _[a1 externalURL];
}

id objc_msgSend_extraLarge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extraLarge:");
}

id objc_msgSend_extraLargeTop(void *a1, const char *a2, ...)
{
  return _[a1 extraLargeTop];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return _[a1 family];
}

id objc_msgSend_filterProvider(void *a1, const char *a2, ...)
{
  return _[a1 filterProvider];
}

id objc_msgSend_filtersForView_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filtersForView:style:");
}

id objc_msgSend_filtersForView_style_fraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filtersForView:style:fraction:");
}

id objc_msgSend_finalize(void *a1, const char *a2, ...)
{
  return _[a1 finalize];
}

id objc_msgSend_finalizedTextProviderWithStartDate_endDate_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizedTextProviderWithStartDate:endDate:timeZone:");
}

id objc_msgSend_finalizedTextProviderWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizedTextProviderWithText:");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 firstBaselineAnchor];
}

id objc_msgSend_firstEventColor(void *a1, const char *a2, ...)
{
  return _[a1 firstEventColor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fullColorImageProviderWithImageViewClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fullColorImageProviderWithImageViewClass:");
}

id objc_msgSend_geoLocation(void *a1, const char *a2, ...)
{
  return _[a1 geoLocation];
}

id objc_msgSend_graphicCircular_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "graphicCircular:");
}

id objc_msgSend_graphicExtraLarge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "graphicExtraLarge:");
}

id objc_msgSend_graphicExtraLargeTop(void *a1, const char *a2, ...)
{
  return _[a1 graphicExtraLargeTop];
}

id objc_msgSend_graphicStackTimeText(void *a1, const char *a2, ...)
{
  return _[a1 graphicStackTimeText];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _[a1 grayColor];
}

id objc_msgSend_hasConflicts(void *a1, const char *a2, ...)
{
  return _[a1 hasConflicts];
}

id objc_msgSend_headerLabel(void *a1, const char *a2, ...)
{
  return _[a1 headerLabel];
}

id objc_msgSend_headerTextProviderWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerTextProviderWithDate:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_imageProviderWithOnePieceImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageProviderWithOnePieceImage:");
}

id objc_msgSend_imageProviderWithOnePieceImage_twoPieceImageBackground_twoPieceImageForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:");
}

id objc_msgSend_imageWithTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithTintColor:");
}

id objc_msgSend_initForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForDevice:");
}

id objc_msgSend_initWithAngularWidth_innerRadius_outerRadius_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAngularWidth:innerRadius:outerRadius:cornerRadius:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:");
}

id objc_msgSend_initWithExtensionBundleIdentifier_containerBundleIdentifier_kind_intent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:intent:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:options:");
}

id objc_msgSend_initWithName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:object:userInfo:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_innerComponentRotationInDegree(void *a1, const char *a2, ...)
{
  return _[a1 innerComponentRotationInDegree];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return _[a1 intent];
}

id objc_msgSend_invalidateEntries(void *a1, const char *a2, ...)
{
  return _[a1 invalidateEntries];
}

id objc_msgSend_isAllDay(void *a1, const char *a2, ...)
{
  return _[a1 isAllDay];
}

id objc_msgSend_isCurrentUser(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentUser];
}

id objc_msgSend_isDetached(void *a1, const char *a2, ...)
{
  return _[a1 isDetached];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_largeModular_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "largeModular:");
}

id objc_msgSend_largeUtility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "largeUtility:");
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localeForCalendarID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeForCalendarID:");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_lockedEntryForFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockedEntryForFamily:");
}

id objc_msgSend_lunar(void *a1, const char *a2, ...)
{
  return _[a1 lunar];
}

id objc_msgSend_lunarCalendarsForLocaleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lunarCalendarsForLocaleID:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_metricsWithDevice_identitySizeClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsWithDevice:identitySizeClass:");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _[a1 minute];
}

id objc_msgSend_modularLargeFirst(void *a1, const char *a2, ...)
{
  return _[a1 modularLargeFirst];
}

id objc_msgSend_modularLargeHeader(void *a1, const char *a2, ...)
{
  return _[a1 modularLargeHeader];
}

id objc_msgSend_modularSmallBottom(void *a1, const char *a2, ...)
{
  return _[a1 modularSmallBottom];
}

id objc_msgSend_modularSmallTop(void *a1, const char *a2, ...)
{
  return _[a1 modularSmallTop];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nanoPrivacyAwareDescription(void *a1, const char *a2, ...)
{
  return _[a1 nanoPrivacyAwareDescription];
}

id objc_msgSend_nanoPrivacyAwareDescriptionForCalendars(void *a1, const char *a2, ...)
{
  return _[a1 nanoPrivacyAwareDescriptionForCalendars];
}

id objc_msgSend_nextDateAfterDate_matchingComponents_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextDateAfterDate:matchingComponents:options:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
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

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return _[a1 objectID];
}

id objc_msgSend_occurrenceDate(void *a1, const char *a2, ...)
{
  return _[a1 occurrenceDate];
}

id objc_msgSend_organizer(void *a1, const char *a2, ...)
{
  return _[a1 organizer];
}

id objc_msgSend_otherEventColors(void *a1, const char *a2, ...)
{
  return _[a1 otherEventColors];
}

id objc_msgSend_outerComponentRotationInDegree(void *a1, const char *a2, ...)
{
  return _[a1 outerComponentRotationInDegree];
}

id objc_msgSend_overlappingDates(void *a1, const char *a2, ...)
{
  return _[a1 overlappingDates];
}

id objc_msgSend_overlappingEventCount(void *a1, const char *a2, ...)
{
  return _[a1 overlappingEventCount];
}

id objc_msgSend_overlayCalendarForCalendarIdentifier_timezone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlayCalendarForCalendarIdentifier:timezone:");
}

id objc_msgSend_overlayCalendarID(void *a1, const char *a2, ...)
{
  return _[a1 overlayCalendarID];
}

id objc_msgSend_overlayCalendarLocaleIDs(void *a1, const char *a2, ...)
{
  return _[a1 overlayCalendarLocaleIDs];
}

id objc_msgSend_overlayCalendarPickerDisplayNameForCalendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlayCalendarPickerDisplayNameForCalendarWithIdentifier:");
}

id objc_msgSend_overrideDate(void *a1, const char *a2, ...)
{
  return _[a1 overrideDate];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_postNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotification:");
}

id objc_msgSend_preferredLocalizations(void *a1, const char *a2, ...)
{
  return _[a1 preferredLocalizations];
}

id objc_msgSend_primaryEventLocation(void *a1, const char *a2, ...)
{
  return _[a1 primaryEventLocation];
}

id objc_msgSend_primaryEventOrganizerName(void *a1, const char *a2, ...)
{
  return _[a1 primaryEventOrganizerName];
}

id objc_msgSend_primaryEventTitle(void *a1, const char *a2, ...)
{
  return _[a1 primaryEventTitle];
}

id objc_msgSend_providerWithFullColorImage_tintedImageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerWithFullColorImage:tintedImageProvider:");
}

id objc_msgSend_providerWithFullColorImage_tintedImageProvider_applyScalingAndCircularMasking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerWithFullColorImage:tintedImageProvider:applyScalingAndCircularMasking:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_refreshDateWidgets(void *a1, const char *a2, ...)
{
  return _[a1 refreshDateWidgets];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_replaceCharactersInRange_withAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCharactersInRange:withAttributedString:");
}

id objc_msgSend_reportOverlayCalendarSet_mirroringCompanion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportOverlayCalendarSet:mirroringCompanion:");
}

id objc_msgSend_scaledValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValue:");
}

id objc_msgSend_scaledValue_withOverride_forSizeClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValue:withOverride:forSizeClass:");
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return _[a1 screenBounds];
}

id objc_msgSend_secondaryEventTitle(void *a1, const char *a2, ...)
{
  return _[a1 secondaryEventTitle];
}

id objc_msgSend_selectionSyncIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 selectionSyncIdentifier];
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAllowsNarrowUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsNarrowUnits:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlternateCalendarLocaleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlternateCalendarLocaleID:");
}

id objc_msgSend_setAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:range:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBody1ImageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody1ImageProvider:");
}

id objc_msgSend_setCircleRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCircleRadius:");
}

id objc_msgSend_setCircularMediumImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCircularMediumImage:");
}

id objc_msgSend_setCircularSmallImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCircularSmallImage:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setComplicationTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComplicationTemplate:");
}

id objc_msgSend_setCompositingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositingFilter:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDisallowBothMinutesAndDesignator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisallowBothMinutesAndDesignator:");
}

id objc_msgSend_setEntryDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntryDate:");
}

id objc_msgSend_setEventColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventColors:");
}

id objc_msgSend_setEventCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventCount:");
}

id objc_msgSend_setEventEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventEndDate:");
}

id objc_msgSend_setEventStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventStartDate:");
}

id objc_msgSend_setEventsInDayCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventsInDayCount:");
}

id objc_msgSend_setExtraLargeTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtraLargeTop:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilters:");
}

id objc_msgSend_setFirstEventColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstEventColor:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGraphicExtraLargeTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGraphicExtraLargeTop:");
}

id objc_msgSend_setGraphicStackTimeText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGraphicStackTimeText:");
}

id objc_msgSend_setHasConflicts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasConflicts:");
}

id objc_msgSend_setHeaderImageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderImageProvider:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHighlightMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightMode:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setInterior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterior:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLunar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLunar:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMaxWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxWidth:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setModularLargeFirst_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModularLargeFirst:");
}

id objc_msgSend_setModularLargeHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModularLargeHeader:");
}

id objc_msgSend_setModularSmallBottom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModularSmallBottom:");
}

id objc_msgSend_setModularSmallTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModularSmallTop:");
}

id objc_msgSend_setNeedsDisplayOnBoundsChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsDisplayOnBoundsChange:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsResizeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsResizeHandler:");
}

id objc_msgSend_setNowProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNowProvider:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOtherEventColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherEventColors:");
}

id objc_msgSend_setOverlappingEventCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverlappingEventCount:");
}

id objc_msgSend_setOverlayCalendarID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverlayCalendarID:");
}

id objc_msgSend_setOverrideDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideDate:");
}

id objc_msgSend_setPillColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPillColors:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setPrefersDesignatorToMinutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefersDesignatorToMinutes:");
}

id objc_msgSend_setPrimaryEventLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryEventLocation:");
}

id objc_msgSend_setPrimaryEventTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryEventTitle:");
}

id objc_msgSend_setRoundingBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoundingBehavior:");
}

id objc_msgSend_setShortUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortUnits:");
}

id objc_msgSend_setSignatureBezel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignatureBezel:");
}

id objc_msgSend_setSignatureCornerTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignatureCornerTextProvider:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextProvider:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUppercase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUppercase:");
}

id objc_msgSend_setUseNoColumnPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseNoColumnPadding:");
}

id objc_msgSend_setUsesLegibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesLegibility:");
}

id objc_msgSend_setUtilityImageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUtilityImageProvider:");
}

id objc_msgSend_setUtilityLarge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUtilityLarge:");
}

id objc_msgSend_setUtilitySmall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUtilitySmall:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedRenderingContext];
}

id objc_msgSend_signatureBezel(void *a1, const char *a2, ...)
{
  return _[a1 signatureBezel];
}

id objc_msgSend_signatureBezel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureBezel:");
}

id objc_msgSend_signatureCircular_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureCircular:");
}

id objc_msgSend_signatureCorner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureCorner:");
}

id objc_msgSend_signatureCornerTextProvider(void *a1, const char *a2, ...)
{
  return _[a1 signatureCornerTextProvider];
}

id objc_msgSend_signatureRectangular_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureRectangular:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_smallCapsBaseFont(void *a1, const char *a2, ...)
{
  return _[a1 smallCapsBaseFont];
}

id objc_msgSend_smallModular_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smallModular:");
}

id objc_msgSend_smallUtility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smallUtility:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForDate_withStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForDate:withStyle:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_structuredLocation(void *a1, const char *a2, ...)
{
  return _[a1 structuredLocation];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_syncHash(void *a1, const char *a2, ...)
{
  return _[a1 syncHash];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronizeNanoDomain_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeNanoDomain:keys:");
}

id objc_msgSend_systemFontOfSize_weight_design_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:weight:design:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_templateForComplicationFamily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateForComplicationFamily:");
}

id objc_msgSend_templateWithCircularTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithCircularTemplate:");
}

id objc_msgSend_templateWithCircularTemplate_textProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithCircularTemplate:textProvider:");
}

id objc_msgSend_templateWithHeaderTextProvider_body1TextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithHeaderTextProvider:body1TextProvider:");
}

id objc_msgSend_templateWithHeaderTextProvider_body1TextProvider_body2TextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithHeaderTextProvider:body1TextProvider:body2TextProvider:");
}

id objc_msgSend_templateWithHeaderTextProvider_bodyTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithHeaderTextProvider:bodyTextProvider:");
}

id objc_msgSend_templateWithHeaderTextProvider_row1Column1TextProvider_row1Column2TextProvider_row2Column1TextProvider_row2Column2TextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithHeaderTextProvider:row1Column1TextProvider:row1Column2TextProvider:row2Column1TextProvider:row2Column2TextProvider:");
}

id objc_msgSend_templateWithImageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithImageProvider:");
}

id objc_msgSend_templateWithInnerTextProvider_outerTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithInnerTextProvider:outerTextProvider:");
}

id objc_msgSend_templateWithLine1ImageProvider_line2TextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithLine1ImageProvider:line2TextProvider:");
}

id objc_msgSend_templateWithLine1TextProvider_line2TextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithLine1TextProvider:line2TextProvider:");
}

id objc_msgSend_templateWithMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithMetadata:");
}

id objc_msgSend_templateWithTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithTextProvider:");
}

id objc_msgSend_templateWithTextProvider_imageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithTextProvider:imageProvider:");
}

id objc_msgSend_templateWithWeekdayTextProvider_dayTextProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateWithWeekdayTextProvider:dayTextProvider:");
}

id objc_msgSend_textProvider(void *a1, const char *a2, ...)
{
  return _[a1 textProvider];
}

id objc_msgSend_textProviderWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithDate:");
}

id objc_msgSend_textProviderWithDate_timeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithDate:timeZone:");
}

id objc_msgSend_textProviderWithDate_units_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithDate:units:");
}

id objc_msgSend_textProviderWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithFormat:");
}

id objc_msgSend_textProviderWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithText:");
}

id objc_msgSend_textProviderWithText_overrideBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithText:overrideBlock:");
}

id objc_msgSend_textProviderWithText_shortText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProviderWithText:shortText:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unselectedCalendarIdentifiersForFocusMode(void *a1, const char *a2, ...)
{
  return _[a1 unselectedCalendarIdentifiersForFocusMode];
}

id objc_msgSend_updateLayout(void *a1, const char *a2, ...)
{
  return _[a1 updateLayout];
}

id objc_msgSend_updateMonochromeFiltersWithAccentFilters_desaturatedFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMonochromeFiltersWithAccentFilters:desaturatedFilters:");
}

id objc_msgSend_updateMonochromeFiltersWithAccentFilters_noAccentFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMonochromeFiltersWithAccentFilters:noAccentFilters:");
}

id objc_msgSend_uppercase(void *a1, const char *a2, ...)
{
  return _[a1 uppercase];
}

id objc_msgSend_uppercaseStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseStringWithLocale:");
}

id objc_msgSend_utilityImageProvider(void *a1, const char *a2, ...)
{
  return _[a1 utilityImageProvider];
}

id objc_msgSend_utilityLarge(void *a1, const char *a2, ...)
{
  return _[a1 utilityLarge];
}

id objc_msgSend_utilitySmall(void *a1, const char *a2, ...)
{
  return _[a1 utilitySmall];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_verticalPill(void *a1, const char *a2, ...)
{
  return _[a1 verticalPill];
}

id objc_msgSend_verticalPill2(void *a1, const char *a2, ...)
{
  return _[a1 verticalPill2];
}

id objc_msgSend_viewSizeForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewSizeForDevice:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_wrappedUserStringFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrappedUserStringFrom:");
}