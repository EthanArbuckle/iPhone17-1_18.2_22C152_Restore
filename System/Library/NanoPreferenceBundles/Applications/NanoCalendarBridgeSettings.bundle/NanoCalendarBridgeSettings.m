id ncs_log_error()
{
  void *v0;
  uint64_t vars8;

  if (qword_154F8 != -1) {
    dispatch_once(&qword_154F8, &stru_10398);
  }
  v0 = (void *)qword_154F0;

  return v0;
}

void sub_4AA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "error");
  v2 = (void *)qword_154F0;
  qword_154F0 = (uint64_t)v1;

  v3 = qword_154F0;
  if (os_log_type_enabled((os_log_t)qword_154F0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> error [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_lifecycle()
{
  if (qword_15508 != -1) {
    dispatch_once(&qword_15508, &stru_103B8);
  }
  v0 = (void *)qword_15500;

  return v0;
}

void sub_4B7C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "lifecycle");
  v2 = (void *)qword_15500;
  qword_15500 = (uint64_t)v1;

  v3 = qword_15500;
  if (os_log_type_enabled((os_log_t)qword_15500, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> lifecycle [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_snapshot()
{
  if (qword_15518 != -1) {
    dispatch_once(&qword_15518, &stru_103D8);
  }
  v0 = (void *)qword_15510;

  return v0;
}

void sub_4C54(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "snapshot");
  v2 = (void *)qword_15510;
  qword_15510 = (uint64_t)v1;

  v3 = qword_15510;
  if (os_log_type_enabled((os_log_t)qword_15510, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> snapshot [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_snapshot_creation()
{
  if (qword_15528 != -1) {
    dispatch_once(&qword_15528, &stru_103F8);
  }
  v0 = (void *)qword_15520;

  return v0;
}

void sub_4D2C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "snapshot_creation");
  v2 = (void *)qword_15520;
  qword_15520 = (uint64_t)v1;

  v3 = qword_15520;
  if (os_log_type_enabled((os_log_t)qword_15520, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> snapshot_creation [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_snapshot_vending()
{
  if (qword_15538 != -1) {
    dispatch_once(&qword_15538, &stru_10418);
  }
  v0 = (void *)qword_15530;

  return v0;
}

void sub_4E04(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "snapshot_vending");
  v2 = (void *)qword_15530;
  qword_15530 = (uint64_t)v1;

  v3 = qword_15530;
  if (os_log_type_enabled((os_log_t)qword_15530, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> snapshot_vending [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_selected_calendars()
{
  if (qword_15548 != -1) {
    dispatch_once(&qword_15548, &stru_10438);
  }
  v0 = (void *)qword_15540;

  return v0;
}

void sub_4EDC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "selected_calendars");
  v2 = (void *)qword_15540;
  qword_15540 = (uint64_t)v1;

  v3 = qword_15540;
  if (os_log_type_enabled((os_log_t)qword_15540, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> selected_calendars [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_data_loading()
{
  if (qword_15558 != -1) {
    dispatch_once(&qword_15558, &stru_10458);
  }
  v0 = (void *)qword_15550;

  return v0;
}

void sub_4FB4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "data_loading");
  v2 = (void *)qword_15550;
  qword_15550 = (uint64_t)v1;

  v3 = qword_15550;
  if (os_log_type_enabled((os_log_t)qword_15550, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> data_loading [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_data_loading_verbose()
{
  if (qword_15568 != -1) {
    dispatch_once(&qword_15568, &stru_10478);
  }
  v0 = (void *)qword_15560;

  return v0;
}

void sub_508C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "data_loading_verbose");
  v2 = (void *)qword_15560;
  qword_15560 = (uint64_t)v1;

  v3 = qword_15560;
  if (os_log_type_enabled((os_log_t)qword_15560, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> data_loading_verbose [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_data_display()
{
  if (qword_15578 != -1) {
    dispatch_once(&qword_15578, &stru_10498);
  }
  v0 = (void *)qword_15570;

  return v0;
}

void sub_5164(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "data_display");
  v2 = (void *)qword_15570;
  qword_15570 = (uint64_t)v1;

  v3 = qword_15570;
  if (os_log_type_enabled((os_log_t)qword_15570, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> data_display [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_always_on_display()
{
  if (qword_15588 != -1) {
    dispatch_once(&qword_15588, &stru_104B8);
  }
  v0 = (void *)qword_15580;

  return v0;
}

void sub_523C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "always_on_display");
  v2 = (void *)qword_15580;
  qword_15580 = (uint64_t)v1;

  v3 = qword_15580;
  if (os_log_type_enabled((os_log_t)qword_15580, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> always_on_display [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_user_interaction()
{
  if (qword_15598 != -1) {
    dispatch_once(&qword_15598, &stru_104D8);
  }
  v0 = (void *)qword_15590;

  return v0;
}

void sub_5314(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "user_interaction");
  v2 = (void *)qword_15590;
  qword_15590 = (uint64_t)v1;

  v3 = qword_15590;
  if (os_log_type_enabled((os_log_t)qword_15590, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> user_interaction [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_user_data_change()
{
  if (qword_155A8 != -1) {
    dispatch_once(&qword_155A8, &stru_104F8);
  }
  v0 = (void *)qword_155A0;

  return v0;
}

void sub_53EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "user_data_change");
  v2 = (void *)qword_155A0;
  qword_155A0 = (uint64_t)v1;

  v3 = qword_155A0;
  if (os_log_type_enabled((os_log_t)qword_155A0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> user_data_change [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_icon_generation()
{
  if (qword_155B8 != -1) {
    dispatch_once(&qword_155B8, &stru_10518);
  }
  v0 = (void *)qword_155B0;

  return v0;
}

void sub_54C4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "icon_generation");
  v2 = (void *)qword_155B0;
  qword_155B0 = (uint64_t)v1;

  v3 = qword_155B0;
  if (os_log_type_enabled((os_log_t)qword_155B0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> icon_generation [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_metrics()
{
  if (qword_155C8 != -1) {
    dispatch_once(&qword_155C8, &stru_10538);
  }
  v0 = (void *)qword_155C0;

  return v0;
}

void sub_559C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "metrics");
  v2 = (void *)qword_155C0;
  qword_155C0 = (uint64_t)v1;

  v3 = qword_155C0;
  if (os_log_type_enabled((os_log_t)qword_155C0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> metrics [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_utility()
{
  if (qword_155D8 != -1) {
    dispatch_once(&qword_155D8, &stru_10558);
  }
  v0 = (void *)qword_155D0;

  return v0;
}

void sub_5674(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "utility");
  v2 = (void *)qword_155D0;
  qword_155D0 = (uint64_t)v1;

  v3 = qword_155D0;
  if (os_log_type_enabled((os_log_t)qword_155D0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> utility [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_settings()
{
  if (qword_155E8 != -1) {
    dispatch_once(&qword_155E8, &stru_10578);
  }
  v0 = (void *)qword_155E0;

  return v0;
}

void sub_574C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "settings");
  v2 = (void *)qword_155E0;
  qword_155E0 = (uint64_t)v1;

  v3 = qword_155E0;
  if (os_log_type_enabled((os_log_t)qword_155E0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> settings [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_status_bar()
{
  if (qword_155F8 != -1) {
    dispatch_once(&qword_155F8, &stru_10598);
  }
  v0 = (void *)qword_155F0;

  return v0;
}

void sub_5824(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "status_bar");
  v2 = (void *)qword_155F0;
  qword_155F0 = (uint64_t)v1;

  v3 = qword_155F0;
  if (os_log_type_enabled((os_log_t)qword_155F0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> status_bar [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_complication()
{
  if (qword_15608 != -1) {
    dispatch_once(&qword_15608, &stru_105B8);
  }
  v0 = (void *)qword_15600;

  return v0;
}

void sub_58FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "complication");
  v2 = (void *)qword_15600;
  qword_15600 = (uint64_t)v1;

  v3 = qword_15600;
  if (os_log_type_enabled((os_log_t)qword_15600, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> complication [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_event_creation()
{
  if (qword_15618 != -1) {
    dispatch_once(&qword_15618, &stru_105D8);
  }
  v0 = (void *)qword_15610;

  return v0;
}

void sub_59D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "event_creation");
  v2 = (void *)qword_15610;
  qword_15610 = (uint64_t)v1;

  v3 = qword_15610;
  if (os_log_type_enabled((os_log_t)qword_15610, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> event_creation [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_alerts_ttl()
{
  if (qword_15628 != -1) {
    dispatch_once(&qword_15628, &stru_105F8);
  }
  v0 = (void *)qword_15620;

  return v0;
}

void sub_5AAC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "alerts_ttl");
  v2 = (void *)qword_15620;
  qword_15620 = (uint64_t)v1;

  v3 = qword_15620;
  if (os_log_type_enabled((os_log_t)qword_15620, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> alerts_ttl [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_bulletin_ui()
{
  if (qword_15638 != -1) {
    dispatch_once(&qword_15638, &stru_10618);
  }
  v0 = (void *)qword_15630;

  return v0;
}

void sub_5B84(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "bulletin_ui");
  v2 = (void *)qword_15630;
  qword_15630 = (uint64_t)v1;

  v3 = qword_15630;
  if (os_log_type_enabled((os_log_t)qword_15630, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> bulletin_ui [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_reminders_snapshot()
{
  if (qword_15648 != -1) {
    dispatch_once(&qword_15648, &stru_10638);
  }
  v0 = (void *)qword_15640;

  return v0;
}

void sub_5C5C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "reminders_snapshot");
  v2 = (void *)qword_15640;
  qword_15640 = (uint64_t)v1;

  v3 = qword_15640;
  if (os_log_type_enabled((os_log_t)qword_15640, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> reminders_snapshot [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_reminders_demo()
{
  if (qword_15658 != -1) {
    dispatch_once(&qword_15658, &stru_10658);
  }
  v0 = (void *)qword_15650;

  return v0;
}

void sub_5D34(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "reminders_demo");
  v2 = (void *)qword_15650;
  qword_15650 = (uint64_t)v1;

  v3 = qword_15650;
  if (os_log_type_enabled((os_log_t)qword_15650, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> reminders_demo [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

id ncs_log_debugging()
{
  if (qword_15668 != -1) {
    dispatch_once(&qword_15668, &stru_10678);
  }
  v0 = (void *)qword_15660;

  return v0;
}

void sub_5E0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "debugging");
  v2 = (void *)qword_15660;
  qword_15660 = (uint64_t)v1;

  v3 = qword_15660;
  if (os_log_type_enabled((os_log_t)qword_15660, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> debugging [Nov 10 2024 06:29:21]", v4, 2u);
  }
}

uint64_t _actsLikeCustomerBuild()
{
  if (qword_15678 != -1) {
    dispatch_once(&qword_15678, &stru_10698);
  }
  return byte_15670;
}

void sub_5ED4(id a1)
{
  id v1 = +[NanoCalendarPreferences appDefaults];
  byte_15670 = [v1 BOOLForKey:@"ActsLikeCustomerBuild"];
}

uint64_t _isInternalBuild()
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    if (qword_15678 != -1) {
      dispatch_once(&qword_15678, &stru_10698);
    }
    return byte_15670 == 0;
  }
  return result;
}

uint64_t NCSLoggingConfidentionInformationAllowed()
{
  if (qword_15680 != -1) {
    dispatch_once(&qword_15680, &stru_106B8);
  }
  return byte_15688;
}

void sub_5FCC(id a1)
{
  byte_15688 = _isInternalBuild();
}

id NanoCalLogStringForDateAndTime(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_15698 != -1) {
      dispatch_once(&qword_15698, &stru_106D8);
    }
    v2 = [(id)qword_15690 stringFromDate:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_69CC(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  v2 = (void *)qword_15690;
  qword_15690 = (uint64_t)v1;

  v3 = (void *)qword_15690;

  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss EEE"];
}

void sub_6A8C(id a1)
{
  qword_156A0 = objc_alloc_init(NanoCalendarPreferences);

  _objc_release_x1();
}

void sub_79E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CUIKDateStrings overlayCalendarPickerDisplayNameForCalendarWithIdentifier:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
}

void sub_84C8(id a1)
{
  qword_156B0 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilecal"];

  _objc_release_x1();
}

void sub_8564(id a1)
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
  qword_156C0 = (uint64_t)v2;

  _objc_release_x1();
}

id sub_92B0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 subsectionID];
  id v4 = [v2 containsObject:v3];

  return v4;
}

id sub_AD20(uint64_t a1)
{
  v5[0] = @"mirroringCompanion";
  id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v5[1] = @"overlayCalendar";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

void sub_B488(uint64_t a1, void *a2, NSObject *a3)
{
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [a2 nanoPrivacyAwareDescriptionForCalendars];
  int v9 = 138412802;
  uint64_t v10 = a1;
  __int16 v11 = 2048;
  v12 = v7;
  __int16 v13 = 2112;
  v14 = v8;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "<%@: %p> selectedCalendars: %@", (uint8_t *)&v9, 0x20u);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BPSBackgroundColor()
{
  return _BPSBackgroundColor();
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

uint64_t BPSCellHightlightColor()
{
  return _BPSCellHightlightColor();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
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

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return _NRVersionIsGreaterThanOrEqual();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
{
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

id objc_msgSend__saveFilterAndNotify(void *a1, const char *a2, ...)
{
  return [a1 _saveFilterAndNotify];
}

id objc_msgSend__specifiersForOverlayCalendars(void *a1, const char *a2, ...)
{
  return [a1 _specifiersForOverlayCalendars];
}

id objc_msgSend__startObserving(void *a1, const char *a2, ...)
{
  return [a1 _startObserving];
}

id objc_msgSend__stopObserving(void *a1, const char *a2, ...)
{
  return [a1 _stopObserving];
}

id objc_msgSend__subsectionId(void *a1, const char *a2, ...)
{
  return [a1 _subsectionId];
}

id objc_msgSend__updateOverlayCalendarCache(void *a1, const char *a2, ...)
{
  return [a1 _updateOverlayCalendarCache];
}

id objc_msgSend__updateSelectedCalendars(void *a1, const char *a2, ...)
{
  return [a1 _updateSelectedCalendars];
}

id objc_msgSend_activeTimeZone(void *a1, const char *a2, ...)
{
  return [a1 activeTimeZone];
}

id objc_msgSend_allCalendars(void *a1, const char *a2, ...)
{
  return [a1 allCalendars];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowsContentModifications(void *a1, const char *a2, ...)
{
  return [a1 allowsContentModifications];
}

id objc_msgSend_appDefaults(void *a1, const char *a2, ...)
{
  return [a1 appDefaults];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_availability(void *a1, const char *a2, ...)
{
  return [a1 availability];
}

id objc_msgSend_bbSectionInfo(void *a1, const char *a2, ...)
{
  return [a1 bbSectionInfo];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_calendarIdentifier(void *a1, const char *a2, ...)
{
  return [a1 calendarIdentifier];
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

id objc_msgSend_customDeselectedCalendarHashes(void *a1, const char *a2, ...)
{
  return [a1 customDeselectedCalendarHashes];
}

id objc_msgSend_customDeselectedCalendarSyncIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 customDeselectedCalendarSyncIdentifiers];
}

id objc_msgSend_customOverlayCalendarID(void *a1, const char *a2, ...)
{
  return [a1 customOverlayCalendarID];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_deselectedCalendarSyncHashes(void *a1, const char *a2, ...)
{
  return [a1 deselectedCalendarSyncHashes];
}

id objc_msgSend_deselectedCalendarSyncIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 deselectedCalendarSyncIdentifiers];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_eventStore(void *a1, const char *a2, ...)
{
  return [a1 eventStore];
}

id objc_msgSend_externalURL(void *a1, const char *a2, ...)
{
  return [a1 externalURL];
}

id objc_msgSend_geoLocation(void *a1, const char *a2, ...)
{
  return [a1 geoLocation];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isAllDay(void *a1, const char *a2, ...)
{
  return [a1 isAllDay];
}

id objc_msgSend_isCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 isCurrentUser];
}

id objc_msgSend_isDetached(void *a1, const char *a2, ...)
{
  return [a1 isDetached];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nanoPrivacyAwareDescription(void *a1, const char *a2, ...)
{
  return [a1 nanoPrivacyAwareDescription];
}

id objc_msgSend_nanoPrivacyAwareDescriptionForCalendars(void *a1, const char *a2, ...)
{
  return [a1 nanoPrivacyAwareDescriptionForCalendars];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_occurrenceDate(void *a1, const char *a2, ...)
{
  return [a1 occurrenceDate];
}

id objc_msgSend_organizer(void *a1, const char *a2, ...)
{
  return [a1 organizer];
}

id objc_msgSend_overlayCalendarID(void *a1, const char *a2, ...)
{
  return [a1 overlayCalendarID];
}

id objc_msgSend_overlayCalendarLocaleDisplayNames(void *a1, const char *a2, ...)
{
  return [a1 overlayCalendarLocaleDisplayNames];
}

id objc_msgSend_overlayCalendarLocaleIDs(void *a1, const char *a2, ...)
{
  return [a1 overlayCalendarLocaleIDs];
}

id objc_msgSend_refreshDateWidgets(void *a1, const char *a2, ...)
{
  return [a1 refreshDateWidgets];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sectionInfo(void *a1, const char *a2, ...)
{
  return [a1 sectionInfo];
}

id objc_msgSend_selectedCalendars(void *a1, const char *a2, ...)
{
  return [a1 selectedCalendars];
}

id objc_msgSend_selectionSyncIdentifier(void *a1, const char *a2, ...)
{
  return [a1 selectionSyncIdentifier];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedToneManager(void *a1, const char *a2, ...)
{
  return [a1 sharedToneManager];
}

id objc_msgSend_sharedVibrationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedVibrationManager];
}

id objc_msgSend_showAlerts(void *a1, const char *a2, ...)
{
  return [a1 showAlerts];
}

id objc_msgSend_showsInNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 showsInNotificationCenter];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_structuredLocation(void *a1, const char *a2, ...)
{
  return [a1 structuredLocation];
}

id objc_msgSend_subsectionID(void *a1, const char *a2, ...)
{
  return [a1 subsectionID];
}

id objc_msgSend_subsections(void *a1, const char *a2, ...)
{
  return [a1 subsections];
}

id objc_msgSend_syncHash(void *a1, const char *a2, ...)
{
  return [a1 syncHash];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_toolbar(void *a1, const char *a2, ...)
{
  return [a1 toolbar];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unselectedCalendarIdentifiersForFocusMode(void *a1, const char *a2, ...)
{
  return [a1 unselectedCalendarIdentifiersForFocusMode];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_usingCustomCalendars(void *a1, const char *a2, ...)
{
  return [a1 usingCustomCalendars];
}

id objc_msgSend_usingCustomOverlayCalendar(void *a1, const char *a2, ...)
{
  return [a1 usingCustomOverlayCalendar];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_writeSectionState(void *a1, const char *a2, ...)
{
  return [a1 writeSectionState];
}