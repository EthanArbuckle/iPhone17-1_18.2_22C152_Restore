id sub_3438()
{
  void *v0;
  uint64_t vars8;

  if (qword_8008 != -1) {
    dispatch_once(&qword_8008, &stru_4060);
  }
  v0 = (void *)qword_8010;
  return v0;
}

void sub_348C(id a1)
{
  qword_8010 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "_");
  _objc_release_x1();
}

id sub_34D0()
{
  if (qword_8018 != -1) {
    dispatch_once(&qword_8018, &stru_4080);
  }
  v0 = (void *)qword_8020;
  return v0;
}

void sub_3524(id a1)
{
  qword_8020 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "locations");
  _objc_release_x1();
}

id sub_3568()
{
  if (qword_8028 != -1) {
    dispatch_once(&qword_8028, &stru_40A0);
  }
  v0 = (void *)qword_8030;
  return v0;
}

void sub_35BC(id a1)
{
  qword_8030 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accessory");
  _objc_release_x1();
}

id sub_3600()
{
  if (qword_8038 != -1) {
    dispatch_once(&qword_8038, &stru_40C0);
  }
  v0 = (void *)qword_8040;
  return v0;
}

void sub_3654(id a1)
{
  qword_8040 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "traffic");
  _objc_release_x1();
}

id sub_3698()
{
  if (qword_8048 != -1) {
    dispatch_once(&qword_8048, &stru_40E0);
  }
  v0 = (void *)qword_8050;
  return v0;
}

void sub_36EC(id a1)
{
  qword_8050 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "encoder");
  _objc_release_x1();
}

id sub_3730()
{
  if (qword_8058 != -1) {
    dispatch_once(&qword_8058, &stru_4100);
  }
  v0 = (void *)qword_8060;
  return v0;
}

void sub_3784(id a1)
{
  qword_8060 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");
  _objc_release_x1();
}

id sub_37C8()
{
  if (qword_8068 != -1) {
    dispatch_once(&qword_8068, &stru_4120);
  }
  v0 = (void *)qword_8070;
  return v0;
}

void sub_381C(id a1)
{
  qword_8070 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions");
  _objc_release_x1();
}

id sub_3860()
{
  if (qword_8078 != -1) {
    dispatch_once(&qword_8078, &stru_4140);
  }
  v0 = (void *)qword_8080;
  return v0;
}

void sub_38B4(id a1)
{
  qword_8080 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");
  _objc_release_x1();
}

id sub_38F8()
{
  if (qword_8088 != -1) {
    dispatch_once(&qword_8088, &stru_4160);
  }
  v0 = (void *)qword_8090;
  return v0;
}

void sub_394C(id a1)
{
  qword_8090 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "secureLocations");
  _objc_release_x1();
}

id sub_3990()
{
  if (qword_8098 != -1) {
    dispatch_once(&qword_8098, &stru_4180);
  }
  v0 = (void *)qword_80A0;
  return v0;
}

void sub_39E4(id a1)
{
  qword_80A0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "healUCRT");
  _objc_release_x1();
}

id sub_3A28()
{
  if (qword_80A8 != -1) {
    dispatch_once(&qword_80A8, &stru_41A0);
  }
  v0 = (void *)qword_80B0;
  return v0;
}

void sub_3A7C(id a1)
{
  qword_80B0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "repairDevice");
  _objc_release_x1();
}

id sub_3AC0()
{
  if (qword_80B8 != -1) {
    dispatch_once(&qword_80B8, &stru_41C0);
  }
  v0 = (void *)qword_80C0;
  return v0;
}

void sub_3B14(id a1)
{
  qword_80C0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");
  _objc_release_x1();
}

id sub_3B58()
{
  if (qword_80C8 != -1) {
    dispatch_once(&qword_80C8, &stru_41E0);
  }
  v0 = (void *)qword_80D0;
  return v0;
}

void sub_3BAC(id a1)
{
  qword_80D0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");
  _objc_release_x1();
}

id sub_3BF0()
{
  if (qword_80D8 != -1) {
    dispatch_once(&qword_80D8, &stru_4200);
  }
  v0 = (void *)qword_80E0;
  return v0;
}

void sub_3C44(id a1)
{
  qword_80E0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");
  _objc_release_x1();
}

id sub_3C88()
{
  if (qword_80E8 != -1) {
    dispatch_once(&qword_80E8, &stru_4220);
  }
  v0 = (void *)qword_80F0;
  return v0;
}

void sub_3CDC(id a1)
{
  qword_80F0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");
  _objc_release_x1();
}

id sub_3D20()
{
  if (qword_80F8 != -1) {
    dispatch_once(&qword_80F8, &stru_4240);
  }
  v0 = (void *)qword_8100;
  return v0;
}

void sub_3D74(id a1)
{
  if (+[FMPreferencesUtil BOOLForKey:@"ShowAutomationLogs" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"])
  {
    qword_8100 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "automation");
    _objc_release_x1();
  }
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

id objc_msgSend_BOOLForKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:inDomain:");
}