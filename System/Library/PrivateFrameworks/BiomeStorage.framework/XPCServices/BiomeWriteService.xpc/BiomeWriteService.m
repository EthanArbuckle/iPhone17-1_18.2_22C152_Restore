int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  char v11[1024];

  bzero(v11, 0x400uLL);
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100003C30();
    }
LABEL_11:

    exit(1);
  }
  if (!confstr(65537, v11, 0x400uLL))
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100003B30();
    }
    goto LABEL_11;
  }
  v4 = realpath_DARWIN_EXTSN(v11, 0);
  if (!v4)
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100003BB0();
    }
    goto LABEL_11;
  }
  free(v4);
  +[NSError _setFileNameLocalizationEnabled:0];
  v5 = objc_opt_new();
  v6 = (void *)qword_100008028;
  qword_100008028 = v5;

  v7 = +[BMXPCListener serviceListener];
  v8 = (void *)qword_100008020;
  qword_100008020 = v7;

  [(id)qword_100008020 setDelegate:qword_100008028];
  [(id)qword_100008020 activate];
  return 1;
}

void sub_100003B10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100003B30()
{
  __error();
  sub_100003B10((void *)&_mh_execute_header, v0, v1, "Failed to initialize temporary directory: %{darwin.errno}d", v2, v3, v4, v5, 0);
}

void sub_100003BB0()
{
  __error();
  sub_100003B10((void *)&_mh_execute_header, v0, v1, "Failed to resolve temporary directory: %{darwin.errno}d", v2, v3, v4, v5, 0);
}

void sub_100003C30()
{
  __error();
  sub_100003B10((void *)&_mh_execute_header, v0, v1, "Failed to set user dir suffix: %{darwin.errno}d", v2, v3, v4, v5, 0);
}

uint64_t __biome_log_for_category()
{
  return ___biome_log_for_category();
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}