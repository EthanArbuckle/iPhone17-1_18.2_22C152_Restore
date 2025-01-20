int main(int argc, const char **argv, const char **envp)
{
  int v3;
  _DWORD v4[2];

  unsetenv("TMPDIR");
  unsetenv("HOME");
  unsetenv("CFFIXED_USER_HOME");
  if (!_set_user_dir_suffix() || !confstr(65537, 0, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v3 = *__error();
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)v4, 8u);
    }
    exit(1);
  }
  UpdateRunningInXPCService();
  sub_100003C08();
  IIOInitDebugFlags();
  xpc_main((xpc_connection_handler_t)sub_100003C30);
}

void sub_100003C08()
{
  if (qword_100008000 != -1) {
    dispatch_once(&qword_100008000, &stru_1000040E8);
  }
}

void sub_100003C30(_xpc_connection_s *a1)
{
  kdebug_trace();
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100003D00;
  handler[3] = &unk_100004108;
  handler[4] = a1;
  xpc_connection_set_event_handler(a1, handler);
  xpc_connection_resume(a1);
}

void sub_100003CD0(id a1)
{
  _CFPrefsSetDirectModeEnabled();

  __CFPrefsSetReadOnly(1);
}

void sub_100003D00(uint64_t a1, void *a2)
{
  v3 = *(_xpc_connection_s **)(a1 + 32);
  logEventType();
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = (void *)IIOProcessEvent();
    if (v4)
    {
      v5 = v4;
      xpc_connection_send_message(v3, v4);
      xpc_release(v5);
    }
  }
}

uint64_t IIOInitDebugFlags()
{
  return _IIOInitDebugFlags();
}

uint64_t IIOProcessEvent()
{
  return _IIOProcessEvent();
}

uint64_t UpdateRunningInXPCService()
{
  return _UpdateRunningInXPCService();
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return __CFPrefsSetDirectModeEnabled();
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

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t logEventType()
{
  return _logEventType();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

void xpc_release(xpc_object_t object)
{
}