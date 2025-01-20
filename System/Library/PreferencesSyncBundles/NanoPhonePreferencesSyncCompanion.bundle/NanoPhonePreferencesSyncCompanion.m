os_log_t define_nph_log(char *category)
{
  os_log_t v1;
  uint64_t vars8;

  v1 = os_log_create("com.apple.NanoPhone", category);
  return v1;
}

id nph_general_log()
{
  if (qword_8008 != -1) {
    dispatch_once(&qword_8008, &stru_4048);
  }
  v0 = (void *)qword_8000;
  return v0;
}

void sub_3DA8(id a1)
{
  qword_8000 = (uint64_t)os_log_create("com.apple.NanoPhone", "general");
  _objc_release_x1();
}

id nph_sos_general_log()
{
  if (qword_8018 != -1) {
    dispatch_once(&qword_8018, &stru_4068);
  }
  v0 = (void *)qword_8010;
  return v0;
}

void sub_3E40(id a1)
{
  qword_8010 = (uint64_t)os_log_create("com.apple.NanoPhone", "sos_general");
  _objc_release_x1();
}

id nph_sos_newton_log()
{
  if (qword_8028 != -1) {
    dispatch_once(&qword_8028, &stru_4088);
  }
  v0 = (void *)qword_8020;
  return v0;
}

void sub_3ED8(id a1)
{
  qword_8020 = (uint64_t)os_log_create("com.apple.NanoPhone", "sos_newton");
  _objc_release_x1();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}