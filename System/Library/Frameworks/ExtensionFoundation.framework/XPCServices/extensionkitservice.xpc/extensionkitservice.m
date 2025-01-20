int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  id v4;
  void v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v3 = (void *)qword_100008008;
  v10 = qword_100008008;
  if (!qword_100008008)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100003C40;
    v6[3] = &unk_100004068;
    v6[4] = &v7;
    sub_100003C40((uint64_t)v6);
    v3 = (void *)v8[3];
  }
  v4 = v3;
  _Block_object_dispose(&v7, 8);
  [v4 runAsXPCService];
  return 0;
}

void sub_100003C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100003C40(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100008010)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100003D84;
    v3[4] = &unk_1000040A0;
    v3[5] = v3;
    long long v4 = off_100004088;
    uint64_t v5 = 0;
    qword_100008010 = _sl_dlopen();
    if (!qword_100008010)
    {
      abort_report_np();
LABEL_8:
      sub_100003DF8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("_EXService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100008008 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100003D84()
{
  uint64_t result = _sl_dlopen();
  qword_100008010 = result;
  return result;
}

void sub_100003DF8()
{
  v0 = (const void *)abort_report_np();
  _Block_object_dispose(v0, v1);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void free(void *a1)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_msgSend_runAsXPCService(void *a1, const char *a2, ...)
{
  return [a1 runAsXPCService];
}