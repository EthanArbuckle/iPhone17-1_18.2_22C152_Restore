void sub_3BF8(uint64_t a1)
{
  uint32_t numer;
  uint32_t denom;
  uint64_t v4;
  uint64_t v5;
  int v6;
  mach_timebase_info info;
  uint8_t buf[4];
  double v9;
  __int16 v10;
  int v11;

  info = 0;
  mach_timebase_info(&info);
  numer = info.numer;
  denom = info.denom;
  v4 = mach_absolute_time();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = _MGWriteCacheOnHelper();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = mach_absolute_time();
    v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    *(_DWORD *)buf = 134218240;
    v9 = (double)(numer / denom) * (double)(v5 - v4);
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Migrator rebuilt MGCache in %lf seconds. Success %d", buf, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MGCacheValid()
{
  return __MGCacheValid();
}

uint64_t _MGWriteCacheOnHelper()
{
  return __MGWriteCacheOnHelper();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}