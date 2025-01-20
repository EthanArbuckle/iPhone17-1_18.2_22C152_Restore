id NTALogForCategory(unint64_t a1)
{
  void *v2;
  uint64_t vars8;

  if (a1 >= 0xF) {
    sub_3DC4();
  }
  if (qword_8078 != -1) {
    dispatch_once(&qword_8078, &stru_4050);
  }
  v2 = (void *)qword_8000[a1];
  return v2;
}

void sub_3BE8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.nanotimeapps", "NanoTimeApps");
  v2 = (void *)qword_8000[0];
  qword_8000[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.nanotimeapps", "TimeAppServices");
  v4 = (void *)qword_8008;
  qword_8008 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.nanotimeapps", "TimeAppServicesSound");
  v6 = (void *)qword_8070;
  qword_8070 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.nanotimeapps", "NanoTimer");
  v8 = (void *)qword_8010;
  qword_8010 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.nanotimeapps", "NanoAlarm");
  v10 = (void *)qword_8018;
  qword_8018 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.nanotimeapps", "NanoStopwatch");
  v12 = (void *)qword_8020;
  qword_8020 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.nanotimeapps", "NanoWorldClock");
  v14 = (void *)qword_8028;
  qword_8028 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.nanotimeapps", "NanoClockAlertProvider");
  v16 = (void *)qword_8048;
  qword_8048 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.nanotimeapps", "NanoClockActivateProvider");
  v18 = (void *)qword_8050;
  qword_8050 = (uint64_t)v17;

  os_log_t v19 = os_log_create("com.apple.nanotimeapps", "NanoTimerSiri");
  v20 = (void *)qword_8058;
  qword_8058 = (uint64_t)v19;

  os_log_t v21 = os_log_create("com.apple.nanotimeapps", "Tool");
  v22 = (void *)qword_8060;
  qword_8060 = (uint64_t)v21;

  os_log_t v23 = os_log_create("com.apple.nanotimeapps", "SessionProvider");
  v24 = (void *)qword_8068;
  qword_8068 = (uint64_t)v23;

  os_log_t v25 = os_log_create("com.apple.nanotimeapps", "Complication");
  v26 = (void *)qword_8030;
  qword_8030 = (uint64_t)v25;

  os_log_t v27 = os_log_create("com.apple.nanotimeapps", "SunriseComplication");
  v28 = (void *)qword_8038;
  qword_8038 = (uint64_t)v27;

  qword_8040 = (uint64_t)os_log_create("com.apple.nanotimeapps", "WorldClockComplication");
  _objc_release_x1();
}

void sub_3DC4()
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}