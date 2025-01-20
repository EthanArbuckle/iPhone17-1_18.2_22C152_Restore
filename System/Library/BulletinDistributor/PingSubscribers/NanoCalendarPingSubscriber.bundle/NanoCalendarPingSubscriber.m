void sub_4700(id a1)
{
  uint64_t vars8;

  qword_10BF8 = objc_alloc_init(NanoCalendarPreferences);

  _objc_release_x1();
}

void sub_5654(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CUIKDateStrings overlayCalendarPickerDisplayNameForCalendarWithIdentifier:v3];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
}

void sub_613C(id a1)
{
  qword_10C08 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mobilecal"];

  _objc_release_x1();
}

void sub_61D8(id a1)
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
  qword_10C18 = (uint64_t)v2;

  _objc_release_x1();
}

void sub_6488(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = ncs_log_alerts_ttl();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_retainBlock(v6);
    int v15 = 134218242;
    *(void *)v16 = v8;
    *(_WORD *)&v16[8] = 2112;
    *(void *)v17 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "pingSubscriber received forwardHandler: %p notification: %@", (uint8_t *)&v15, 0x16u);
  }
  if (v6)
  {
    v9 = +[NCSTravelAlertsManager sharedManager];
    unsigned int v10 = [v9 ttlRemoteForwardingEnabledForWatch];

    unsigned int v11 = [*(id *)(a1 + 32) _notificationIsTTL:v5];
    uint64_t v12 = v10 | v11 ^ 1;
    v13 = ncs_log_alerts_ttl();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [*(id *)(a1 + 32) _descriptionForForwardType:v12];
      int v15 = 67109634;
      *(_DWORD *)v16 = v10;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = v11;
      *(_WORD *)v17 = 2114;
      *(void *)&v17[2] = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "pingSubscriber forwardHandler() - remoteTTLForwardingEnabled: %d, bulletinIsTTL: %d -> action: %{public}@", (uint8_t *)&v15, 0x18u);
    }
    (*((void (**)(id, uint64_t))v6 + 2))(v6, v12);
  }
}

id ncs_log_error()
{
  if (qword_10C30 != -1) {
    dispatch_once(&qword_10C30, &stru_C388);
  }
  v0 = (void *)qword_10C28;

  return v0;
}

void sub_6810(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "error");
  id v2 = (void *)qword_10C28;
  qword_10C28 = (uint64_t)v1;

  id v3 = qword_10C28;
  if (os_log_type_enabled((os_log_t)qword_10C28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> error [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_lifecycle()
{
  if (qword_10C40 != -1) {
    dispatch_once(&qword_10C40, &stru_C3A8);
  }
  v0 = (void *)qword_10C38;

  return v0;
}

void sub_68E8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "lifecycle");
  id v2 = (void *)qword_10C38;
  qword_10C38 = (uint64_t)v1;

  id v3 = qword_10C38;
  if (os_log_type_enabled((os_log_t)qword_10C38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> lifecycle [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_snapshot()
{
  if (qword_10C50 != -1) {
    dispatch_once(&qword_10C50, &stru_C3C8);
  }
  v0 = (void *)qword_10C48;

  return v0;
}

void sub_69C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "snapshot");
  id v2 = (void *)qword_10C48;
  qword_10C48 = (uint64_t)v1;

  id v3 = qword_10C48;
  if (os_log_type_enabled((os_log_t)qword_10C48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> snapshot [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_snapshot_creation()
{
  if (qword_10C60 != -1) {
    dispatch_once(&qword_10C60, &stru_C3E8);
  }
  v0 = (void *)qword_10C58;

  return v0;
}

void sub_6A98(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "snapshot_creation");
  id v2 = (void *)qword_10C58;
  qword_10C58 = (uint64_t)v1;

  id v3 = qword_10C58;
  if (os_log_type_enabled((os_log_t)qword_10C58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> snapshot_creation [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_snapshot_vending()
{
  if (qword_10C70 != -1) {
    dispatch_once(&qword_10C70, &stru_C408);
  }
  v0 = (void *)qword_10C68;

  return v0;
}

void sub_6B70(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "snapshot_vending");
  id v2 = (void *)qword_10C68;
  qword_10C68 = (uint64_t)v1;

  id v3 = qword_10C68;
  if (os_log_type_enabled((os_log_t)qword_10C68, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> snapshot_vending [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_selected_calendars()
{
  if (qword_10C80 != -1) {
    dispatch_once(&qword_10C80, &stru_C428);
  }
  v0 = (void *)qword_10C78;

  return v0;
}

void sub_6C48(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "selected_calendars");
  id v2 = (void *)qword_10C78;
  qword_10C78 = (uint64_t)v1;

  id v3 = qword_10C78;
  if (os_log_type_enabled((os_log_t)qword_10C78, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> selected_calendars [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_data_loading()
{
  if (qword_10C90 != -1) {
    dispatch_once(&qword_10C90, &stru_C448);
  }
  v0 = (void *)qword_10C88;

  return v0;
}

void sub_6D20(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "data_loading");
  id v2 = (void *)qword_10C88;
  qword_10C88 = (uint64_t)v1;

  id v3 = qword_10C88;
  if (os_log_type_enabled((os_log_t)qword_10C88, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> data_loading [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_data_loading_verbose()
{
  if (qword_10CA0 != -1) {
    dispatch_once(&qword_10CA0, &stru_C468);
  }
  v0 = (void *)qword_10C98;

  return v0;
}

void sub_6DF8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "data_loading_verbose");
  id v2 = (void *)qword_10C98;
  qword_10C98 = (uint64_t)v1;

  id v3 = qword_10C98;
  if (os_log_type_enabled((os_log_t)qword_10C98, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> data_loading_verbose [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_data_display()
{
  if (qword_10CB0 != -1) {
    dispatch_once(&qword_10CB0, &stru_C488);
  }
  v0 = (void *)qword_10CA8;

  return v0;
}

void sub_6ED0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "data_display");
  id v2 = (void *)qword_10CA8;
  qword_10CA8 = (uint64_t)v1;

  id v3 = qword_10CA8;
  if (os_log_type_enabled((os_log_t)qword_10CA8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> data_display [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_always_on_display()
{
  if (qword_10CC0 != -1) {
    dispatch_once(&qword_10CC0, &stru_C4A8);
  }
  v0 = (void *)qword_10CB8;

  return v0;
}

void sub_6FA8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "always_on_display");
  id v2 = (void *)qword_10CB8;
  qword_10CB8 = (uint64_t)v1;

  id v3 = qword_10CB8;
  if (os_log_type_enabled((os_log_t)qword_10CB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> always_on_display [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_user_interaction()
{
  if (qword_10CD0 != -1) {
    dispatch_once(&qword_10CD0, &stru_C4C8);
  }
  v0 = (void *)qword_10CC8;

  return v0;
}

void sub_7080(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "user_interaction");
  id v2 = (void *)qword_10CC8;
  qword_10CC8 = (uint64_t)v1;

  id v3 = qword_10CC8;
  if (os_log_type_enabled((os_log_t)qword_10CC8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> user_interaction [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_user_data_change()
{
  if (qword_10CE0 != -1) {
    dispatch_once(&qword_10CE0, &stru_C4E8);
  }
  v0 = (void *)qword_10CD8;

  return v0;
}

void sub_7158(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "user_data_change");
  id v2 = (void *)qword_10CD8;
  qword_10CD8 = (uint64_t)v1;

  id v3 = qword_10CD8;
  if (os_log_type_enabled((os_log_t)qword_10CD8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> user_data_change [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_icon_generation()
{
  if (qword_10CF0 != -1) {
    dispatch_once(&qword_10CF0, &stru_C508);
  }
  v0 = (void *)qword_10CE8;

  return v0;
}

void sub_7230(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "icon_generation");
  id v2 = (void *)qword_10CE8;
  qword_10CE8 = (uint64_t)v1;

  id v3 = qword_10CE8;
  if (os_log_type_enabled((os_log_t)qword_10CE8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> icon_generation [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_metrics()
{
  if (qword_10D00 != -1) {
    dispatch_once(&qword_10D00, &stru_C528);
  }
  v0 = (void *)qword_10CF8;

  return v0;
}

void sub_7308(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "metrics");
  id v2 = (void *)qword_10CF8;
  qword_10CF8 = (uint64_t)v1;

  id v3 = qword_10CF8;
  if (os_log_type_enabled((os_log_t)qword_10CF8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> metrics [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_utility()
{
  if (qword_10D10 != -1) {
    dispatch_once(&qword_10D10, &stru_C548);
  }
  v0 = (void *)qword_10D08;

  return v0;
}

void sub_73E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "utility");
  id v2 = (void *)qword_10D08;
  qword_10D08 = (uint64_t)v1;

  id v3 = qword_10D08;
  if (os_log_type_enabled((os_log_t)qword_10D08, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> utility [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_settings()
{
  if (qword_10D20 != -1) {
    dispatch_once(&qword_10D20, &stru_C568);
  }
  v0 = (void *)qword_10D18;

  return v0;
}

void sub_74B8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "settings");
  id v2 = (void *)qword_10D18;
  qword_10D18 = (uint64_t)v1;

  id v3 = qword_10D18;
  if (os_log_type_enabled((os_log_t)qword_10D18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> settings [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_status_bar()
{
  if (qword_10D30 != -1) {
    dispatch_once(&qword_10D30, &stru_C588);
  }
  v0 = (void *)qword_10D28;

  return v0;
}

void sub_7590(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "status_bar");
  id v2 = (void *)qword_10D28;
  qword_10D28 = (uint64_t)v1;

  id v3 = qword_10D28;
  if (os_log_type_enabled((os_log_t)qword_10D28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> status_bar [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_complication()
{
  if (qword_10D40 != -1) {
    dispatch_once(&qword_10D40, &stru_C5A8);
  }
  v0 = (void *)qword_10D38;

  return v0;
}

void sub_7668(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "complication");
  id v2 = (void *)qword_10D38;
  qword_10D38 = (uint64_t)v1;

  id v3 = qword_10D38;
  if (os_log_type_enabled((os_log_t)qword_10D38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> complication [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_event_creation()
{
  if (qword_10D50 != -1) {
    dispatch_once(&qword_10D50, &stru_C5C8);
  }
  v0 = (void *)qword_10D48;

  return v0;
}

void sub_7740(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "event_creation");
  id v2 = (void *)qword_10D48;
  qword_10D48 = (uint64_t)v1;

  id v3 = qword_10D48;
  if (os_log_type_enabled((os_log_t)qword_10D48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> event_creation [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_alerts_ttl()
{
  if (qword_10D60 != -1) {
    dispatch_once(&qword_10D60, &stru_C5E8);
  }
  v0 = (void *)qword_10D58;

  return v0;
}

void sub_7818(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "alerts_ttl");
  id v2 = (void *)qword_10D58;
  qword_10D58 = (uint64_t)v1;

  id v3 = qword_10D58;
  if (os_log_type_enabled((os_log_t)qword_10D58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> alerts_ttl [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_bulletin_ui()
{
  if (qword_10D70 != -1) {
    dispatch_once(&qword_10D70, &stru_C608);
  }
  v0 = (void *)qword_10D68;

  return v0;
}

void sub_78F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "bulletin_ui");
  id v2 = (void *)qword_10D68;
  qword_10D68 = (uint64_t)v1;

  id v3 = qword_10D68;
  if (os_log_type_enabled((os_log_t)qword_10D68, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> bulletin_ui [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_reminders_snapshot()
{
  if (qword_10D80 != -1) {
    dispatch_once(&qword_10D80, &stru_C628);
  }
  v0 = (void *)qword_10D78;

  return v0;
}

void sub_79C8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "reminders_snapshot");
  id v2 = (void *)qword_10D78;
  qword_10D78 = (uint64_t)v1;

  id v3 = qword_10D78;
  if (os_log_type_enabled((os_log_t)qword_10D78, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> reminders_snapshot [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_reminders_demo()
{
  if (qword_10D90 != -1) {
    dispatch_once(&qword_10D90, &stru_C648);
  }
  v0 = (void *)qword_10D88;

  return v0;
}

void sub_7AA0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "reminders_demo");
  id v2 = (void *)qword_10D88;
  qword_10D88 = (uint64_t)v1;

  id v3 = qword_10D88;
  if (os_log_type_enabled((os_log_t)qword_10D88, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> reminders_demo [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

id ncs_log_debugging()
{
  if (qword_10DA0 != -1) {
    dispatch_once(&qword_10DA0, &stru_C668);
  }
  v0 = (void *)qword_10D98;

  return v0;
}

void sub_7B78(id a1)
{
  os_log_t v1 = os_log_create("com.apple.NanoCalendar", "debugging");
  id v2 = (void *)qword_10D98;
  qword_10D98 = (uint64_t)v1;

  id v3 = qword_10D98;
  if (os_log_type_enabled((os_log_t)qword_10D98, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "==> debugging [Nov 10 2024 06:30:12]", v4, 2u);
  }
}

uint64_t _actsLikeCustomerBuild()
{
  if (qword_10DB0 != -1) {
    dispatch_once(&qword_10DB0, &stru_C688);
  }
  return byte_10DA8;
}

void sub_7C40(id a1)
{
  id v1 = +[NanoCalendarPreferences appDefaults];
  byte_10DA8 = [v1 BOOLForKey:@"ActsLikeCustomerBuild"];
}

uint64_t _isInternalBuild()
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    if (qword_10DB0 != -1) {
      dispatch_once(&qword_10DB0, &stru_C688);
    }
    return byte_10DA8 == 0;
  }
  return result;
}

uint64_t NCSLoggingConfidentionInformationAllowed()
{
  if (qword_10DB8 != -1) {
    dispatch_once(&qword_10DB8, &stru_C6A8);
  }
  return byte_10DC0;
}

void sub_7D38(id a1)
{
  byte_10DC0 = _isInternalBuild();
}

id NanoCalLogStringForDateAndTime(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_10DD0 != -1) {
      dispatch_once(&qword_10DD0, &stru_C6C8);
    }
    id v2 = [(id)qword_10DC8 stringFromDate:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_8738(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_10DC8;
  qword_10DC8 = (uint64_t)v1;

  id v3 = (void *)qword_10DC8;

  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss EEE"];
}

id sub_8828(uint64_t a1)
{
  v5[0] = @"mirroringCompanion";
  id v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v5[1] = @"overlayCalendar";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

void sub_8940(id a1)
{
  qword_10DD8 = objc_alloc_init(NCSTravelAlertsManager);

  _objc_release_x1();
}

void sub_8BB0(uint64_t a1, void *a2, NSObject *a3)
{
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  id v8 = [a2 nanoPrivacyAwareDescriptionForCalendars];
  int v9 = 138412802;
  uint64_t v10 = a1;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  v14 = v8;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "<%@: %p> selectedCalendars: %@", (uint8_t *)&v9, 0x20u);
}

void sub_8C88(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "_ttlEnabled enabledNumber: %{public}@", (uint8_t *)&v2, 0xCu);
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

id objc_msgSend__startObserving(void *a1, const char *a2, ...)
{
  return [a1 _startObserving];
}

id objc_msgSend__stopObserving(void *a1, const char *a2, ...)
{
  return [a1 _stopObserving];
}

id objc_msgSend__ttlEnabledOnWatch(void *a1, const char *a2, ...)
{
  return [a1 _ttlEnabledOnWatch];
}

id objc_msgSend__ttlSupportedOnWatch(void *a1, const char *a2, ...)
{
  return [a1 _ttlSupportedOnWatch];
}

id objc_msgSend__updateOverlayCalendarCache(void *a1, const char *a2, ...)
{
  return [a1 _updateOverlayCalendarCache];
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

id objc_msgSend_availability(void *a1, const char *a2, ...)
{
  return [a1 availability];
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

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
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

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
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

id objc_msgSend_overlayCalendarLocaleIDs(void *a1, const char *a2, ...)
{
  return [a1 overlayCalendarLocaleIDs];
}

id objc_msgSend_refreshDateWidgets(void *a1, const char *a2, ...)
{
  return [a1 refreshDateWidgets];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
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

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
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

id objc_msgSend_ttlRemoteForwardingEnabledForWatch(void *a1, const char *a2, ...)
{
  return [a1 ttlRemoteForwardingEnabledForWatch];
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