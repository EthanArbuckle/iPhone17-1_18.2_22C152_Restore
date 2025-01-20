int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id sub_100004C10()
{
  if (qword_10000C9F0 != -1) {
    dispatch_once(&qword_10000C9F0, &stru_100008148);
  }
  v0 = (void *)qword_10000C9E8;
  return v0;
}

void sub_100004C64(id a1)
{
  qword_10000C9E8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "general");
  _objc_release_x1();
}

id sub_100004CA8()
{
  if (qword_10000CA00 != -1) {
    dispatch_once(&qword_10000CA00, &stru_100008168);
  }
  v0 = (void *)qword_10000C9F8;
  return v0;
}

void sub_100004CFC(id a1)
{
  qword_10000C9F8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "xpc");
  _objc_release_x1();
}

id sub_100004D40()
{
  if (qword_10000CA10 != -1) {
    dispatch_once(&qword_10000CA10, &stru_100008188);
  }
  v0 = (void *)qword_10000CA08;
  return v0;
}

void sub_100004D94(id a1)
{
  qword_10000CA08 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "heuristic");
  _objc_release_x1();
}

id sub_100004DD8()
{
  if (qword_10000CA20 != -1) {
    dispatch_once(&qword_10000CA20, &stru_1000081A8);
  }
  v0 = (void *)qword_10000CA18;
  return v0;
}

void sub_100004E2C(id a1)
{
  qword_10000CA18 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notifications");
  _objc_release_x1();
}

id sub_100004E70()
{
  if (qword_10000CA30 != -1) {
    dispatch_once(&qword_10000CA30, &stru_1000081C8);
  }
  v0 = (void *)qword_10000CA28;
  return v0;
}

void sub_100004EC4(id a1)
{
  qword_10000CA28 = (uint64_t)os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  _objc_release_x1();
}

id sub_100004F08()
{
  if (qword_10000CA40 != -1) {
    dispatch_once(&qword_10000CA40, &stru_1000081E8);
  }
  v0 = (void *)qword_10000CA38;
  return v0;
}

void sub_100004F5C(id a1)
{
  qword_10000CA38 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  _objc_release_x1();
}

id sub_100004FA0()
{
  if (qword_10000CA50 != -1) {
    dispatch_once(&qword_10000CA50, &stru_100008208);
  }
  v0 = (void *)qword_10000CA48;
  return v0;
}

void sub_100004FF4(id a1)
{
  qword_10000CA48 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "feedback");
  _objc_release_x1();
}

id sub_100005038()
{
  if (qword_10000CA60 != -1) {
    dispatch_once(&qword_10000CA60, &stru_100008228);
  }
  v0 = (void *)qword_10000CA58;
  return v0;
}

void sub_10000508C(id a1)
{
  qword_10000CA58 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "modes");
  _objc_release_x1();
}

id sub_1000050D0()
{
  if (qword_10000CA70 != -1) {
    dispatch_once(&qword_10000CA70, &stru_100008248);
  }
  v0 = (void *)qword_10000CA68;
  return v0;
}

void sub_100005124(id a1)
{
  qword_10000CA68 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "hero");
  _objc_release_x1();
}

id sub_100005168()
{
  if (qword_10000CA80 != -1) {
    dispatch_once(&qword_10000CA80, &stru_100008268);
  }
  v0 = (void *)qword_10000CA78;
  return v0;
}

void sub_1000051BC(id a1)
{
  qword_10000CA78 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "deletions");
  _objc_release_x1();
}

id sub_100005200()
{
  if (qword_10000CA90 != -1) {
    dispatch_once(&qword_10000CA90, &stru_100008288);
  }
  v0 = (void *)qword_10000CA88;
  return v0;
}

void sub_100005254(id a1)
{
  qword_10000CA88 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "information");
  _objc_release_x1();
}

id sub_100005298()
{
  if (qword_10000CAA0 != -1) {
    dispatch_once(&qword_10000CAA0, &stru_1000082A8);
  }
  v0 = (void *)qword_10000CA98;
  return v0;
}

void sub_1000052EC(id a1)
{
  qword_10000CA98 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "timeline");
  _objc_release_x1();
}

id sub_100005330()
{
  if (qword_10000CAB0 != -1) {
    dispatch_once(&qword_10000CAB0, &stru_1000082C8);
  }
  v0 = (void *)qword_10000CAA8;
  return v0;
}

void sub_100005384(id a1)
{
  qword_10000CAA8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  _objc_release_x1();
}

id sub_1000053C8()
{
  if (qword_10000CAC0 != -1) {
    dispatch_once(&qword_10000CAC0, &stru_1000082E8);
  }
  v0 = (void *)qword_10000CAB8;
  return v0;
}

void sub_10000541C(id a1)
{
  qword_10000CAB8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  _objc_release_x1();
}

id sub_100005460()
{
  if (qword_10000CAD0 != -1) {
    dispatch_once(&qword_10000CAD0, &stru_100008308);
  }
  v0 = (void *)qword_10000CAC8;
  return v0;
}

void sub_1000054B4(id a1)
{
  qword_10000CAC8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "watch");
  _objc_release_x1();
}

id sub_1000054F8()
{
  if (qword_10000CAE0 != -1) {
    dispatch_once(&qword_10000CAE0, &stru_100008328);
  }
  v0 = (void *)qword_10000CAD8;
  return v0;
}

void sub_10000554C(id a1)
{
  qword_10000CAD8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "UI");
  _objc_release_x1();
}

id sub_100005590()
{
  if (qword_10000CAF0 != -1) {
    dispatch_once(&qword_10000CAF0, &stru_100008348);
  }
  v0 = (void *)qword_10000CAE8;
  return v0;
}

void sub_1000055E4(id a1)
{
  qword_10000CAE8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending");
  _objc_release_x1();
}

id sub_100005628()
{
  if (qword_10000CB00 != -1) {
    dispatch_once(&qword_10000CB00, &stru_100008368);
  }
  v0 = (void *)qword_10000CAF8;
  return v0;
}

void sub_10000567C(id a1)
{
  qword_10000CAF8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  _objc_release_x1();
}

id sub_1000056C0()
{
  if (qword_10000CB10 != -1) {
    dispatch_once(&qword_10000CB10, &stru_100008388);
  }
  v0 = (void *)qword_10000CB08;
  return v0;
}

void sub_100005714(id a1)
{
  qword_10000CB08 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  _objc_release_x1();
}

id sub_100005758()
{
  if (qword_10000CB20 != -1) {
    dispatch_once(&qword_10000CB20, &stru_1000083A8);
  }
  v0 = (void *)qword_10000CB18;
  return v0;
}

void sub_1000057AC(id a1)
{
  qword_10000CB18 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "homescreen");
  _objc_release_x1();
}

id sub_1000057F0()
{
  if (qword_10000CB30 != -1) {
    dispatch_once(&qword_10000CB30, &stru_1000083C8);
  }
  v0 = (void *)qword_10000CB28;
  return v0;
}

void sub_100005844(id a1)
{
  qword_10000CB28 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  _objc_release_x1();
}

id sub_100005888()
{
  if (qword_10000CB40 != -1) {
    dispatch_once(&qword_10000CB40, &stru_1000083E8);
  }
  v0 = (void *)qword_10000CB38;
  return v0;
}

void sub_1000058DC(id a1)
{
  qword_10000CB38 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  _objc_release_x1();
}

id sub_100005920()
{
  if (qword_10000CB50 != -1) {
    dispatch_once(&qword_10000CB50, &stru_100008408);
  }
  v0 = (void *)qword_10000CB48;
  return v0;
}

void sub_100005974(id a1)
{
  qword_10000CB48 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "anchor");
  _objc_release_x1();
}

id sub_1000059B8()
{
  if (qword_10000CB60 != -1) {
    dispatch_once(&qword_10000CB60, &stru_100008428);
  }
  v0 = (void *)qword_10000CB58;
  return v0;
}

void sub_100005A0C(id a1)
{
  qword_10000CB58 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  _objc_release_x1();
}

id sub_100005A50()
{
  if (qword_10000CB70 != -1) {
    dispatch_once(&qword_10000CB70, &stru_100008448);
  }
  v0 = (void *)qword_10000CB68;
  return v0;
}

void sub_100005AA4(id a1)
{
  qword_10000CB68 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  _objc_release_x1();
}

id sub_100005AE8()
{
  if (qword_10000CB80 != -1) {
    dispatch_once(&qword_10000CB80, &stru_100008468);
  }
  v0 = (void *)qword_10000CB78;
  return v0;
}

void sub_100005B3C(id a1)
{
  qword_10000CB78 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_library");
  _objc_release_x1();
}

id sub_100005B80()
{
  if (qword_10000CB90 != -1) {
    dispatch_once(&qword_10000CB90, &stru_100008488);
  }
  v0 = (void *)qword_10000CB88;
  return v0;
}

void sub_100005BD4(id a1)
{
  qword_10000CB88 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_install");
  _objc_release_x1();
}

id sub_100005C18()
{
  if (qword_10000CBA0 != -1) {
    dispatch_once(&qword_10000CBA0, &stru_1000084A8);
  }
  v0 = (void *)qword_10000CB98;
  return v0;
}

void sub_100005C6C(id a1)
{
  qword_10000CB98 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "backup");
  _objc_release_x1();
}

id sub_100005CB0()
{
  if (qword_10000CBB0 != -1) {
    dispatch_once(&qword_10000CBB0, &stru_1000084C8);
  }
  v0 = (void *)qword_10000CBA8;
  return v0;
}

void sub_100005D04(id a1)
{
  qword_10000CBA8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "metrics");
  _objc_release_x1();
}

id sub_100005D48()
{
  if (qword_10000CBC0 != -1) {
    dispatch_once(&qword_10000CBC0, &stru_1000084E8);
  }
  v0 = (void *)qword_10000CBB8;
  return v0;
}

void sub_100005D9C(id a1)
{
  qword_10000CBB8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  _objc_release_x1();
}

id sub_100005DE0()
{
  if (qword_10000CBD0 != -1) {
    dispatch_once(&qword_10000CBD0, &stru_100008508);
  }
  v0 = (void *)qword_10000CBC8;
  return v0;
}

void sub_100005E34(id a1)
{
  qword_10000CBC8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_management");
  _objc_release_x1();
}

id sub_100005E78()
{
  if (qword_10000CBE0 != -1) {
    dispatch_once(&qword_10000CBE0, &stru_100008528);
  }
  v0 = (void *)qword_10000CBD8;
  return v0;
}

void sub_100005ECC(id a1)
{
  qword_10000CBD8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  _objc_release_x1();
}

id sub_100005F10()
{
  if (qword_10000CBF0 != -1) {
    dispatch_once(&qword_10000CBF0, &stru_100008548);
  }
  v0 = (void *)qword_10000CBE8;
  return v0;
}

void sub_100005F64(id a1)
{
  qword_10000CBE8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  _objc_release_x1();
}

id sub_100005FA8()
{
  if (qword_10000CC00 != -1) {
    dispatch_once(&qword_10000CC00, &stru_100008568);
  }
  v0 = (void *)qword_10000CBF8;
  return v0;
}

void sub_100005FFC(id a1)
{
  qword_10000CBF8 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  _objc_release_x1();
}

id sub_100006040()
{
  if (qword_10000CC10 != -1) {
    dispatch_once(&qword_10000CC10, &stru_100008588);
  }
  v0 = (void *)qword_10000CC08;
  return v0;
}

void sub_100006094(id a1)
{
  qword_10000CC08 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  _objc_release_x1();
}

id sub_1000060D8()
{
  if (qword_10000CC20 != -1) {
    dispatch_once(&qword_10000CC20, &stru_1000085A8);
  }
  v0 = (void *)qword_10000CC18;
  return v0;
}

void sub_10000612C(id a1)
{
  qword_10000CC18 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  _objc_release_x1();
}

id sub_100006170()
{
  if (qword_10000CC30 != -1) {
    dispatch_once(&qword_10000CC30, &stru_1000085C8);
  }
  v0 = (void *)qword_10000CC28;
  return v0;
}

void sub_1000061C4(id a1)
{
  qword_10000CC28 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "time");
  _objc_release_x1();
}

id sub_100006208()
{
  if (qword_10000CC40 != -1) {
    dispatch_once(&qword_10000CC40, &stru_1000085E8);
  }
  v0 = (void *)qword_10000CC38;
  return v0;
}

void sub_10000625C(id a1)
{
  qword_10000CC38 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  _objc_release_x1();
}

id sub_1000062A0()
{
  if (qword_10000CC50 != -1) {
    dispatch_once(&qword_10000CC50, &stru_100008608);
  }
  v0 = (void *)qword_10000CC48;
  return v0;
}

void sub_1000062F4(id a1)
{
  qword_10000CC48 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  _objc_release_x1();
}

id sub_100006338()
{
  if (qword_10000CC60 != -1) {
    dispatch_once(&qword_10000CC60, &stru_100008628);
  }
  v0 = (void *)qword_10000CC58;
  return v0;
}

void sub_10000638C(id a1)
{
  qword_10000CC58 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  _objc_release_x1();
}

id sub_1000063D0()
{
  if (qword_10000CC70 != -1) {
    dispatch_once(&qword_10000CC70, &stru_100008648);
  }
  v0 = (void *)qword_10000CC68;
  return v0;
}

void sub_100006424(id a1)
{
  qword_10000CC68 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  _objc_release_x1();
}

void sub_100006C1C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100006C58(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_100006C78()
{
  sub_100006C04();
  sub_100006C1C((void *)&_mh_execute_header, v0, v1, "Generated title: %@ for intent: %@");
}

void sub_100006CE0()
{
  sub_100006C04();
  sub_100006C1C((void *)&_mh_execute_header, v0, v1, "Generated title without localization: %@ for intent: %@");
}

void sub_100006D48()
{
  sub_100006C04();
  sub_100006C1C((void *)&_mh_execute_header, v0, v1, "Generated subtitle: %@ for intent: %@");
}

void sub_100006DB0()
{
  sub_100006C3C();
  sub_100006C58((void *)&_mh_execute_header, v0, v1, "Generated eligible for widgets: %u for intent: %@");
}

void sub_100006E18()
{
  sub_100006C3C();
  sub_100006C58((void *)&_mh_execute_header, v0, v1, "Generated supportsBackgroundExecution: %u for intent: %@");
}

uint64_t INIntentCreate()
{
  return _INIntentCreate();
}

uint64_t INIntentWithTypedIntent()
{
  return _INIntentWithTypedIntent();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

id objc_msgSend__codableDescription(void *a1, const char *a2, ...)
{
  return [a1 _codableDescription];
}

id objc_msgSend__indexingHash(void *a1, const char *a2, ...)
{
  return [a1 _indexingHash];
}

id objc_msgSend__subtitle(void *a1, const char *a2, ...)
{
  return [a1 _subtitle];
}

id objc_msgSend__supportsBackgroundExecution(void *a1, const char *a2, ...)
{
  return [a1 _supportsBackgroundExecution];
}

id objc_msgSend__title(void *a1, const char *a2, ...)
{
  return [a1 _title];
}

id objc_msgSend_isEligibleForWidgets(void *a1, const char *a2, ...)
{
  return [a1 isEligibleForWidgets];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDate:");
}