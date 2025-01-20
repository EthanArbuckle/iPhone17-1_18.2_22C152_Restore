@interface DTMemlimitAssertionFactory
- (id)_removeMemoryLimitsForPid:(int)a3;
- (id)assertionForPid:(int)a3;
@end

@implementation DTMemlimitAssertionFactory

- (id)assertionForPid:(int)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel__removeMemoryLimitsForPid_);
}

- (id)_removeMemoryLimitsForPid:(int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(void *)((char *)&v12 + 4) = 0xFFFFFFFF00000000;
  LODWORD(v12) = -1;
  HIDWORD(v12) = 0;
  int v4 = memorystatus_control();
  if (v4)
  {
    int v5 = v4;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v14 = a3;
      __int16 v15 = 1024;
      int v16 = v5;
      v6 = &_os_log_internal;
      v7 = "DTMemlimitAssertionFactory: failed to remove active and inactive memory limits for pid %d (result = %d)";
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_23087D000, v6, v8, v7, buf, 0xEu);
    }
  }
  else
  {
    v9 = [NSUserDefaults standardUserDefaults];
    int v10 = [v9 BOOLForKey:@"DTMemlimitAssertionFactoryLog"];

    if (v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v14 = a3;
      __int16 v15 = 1024;
      int v16 = 0;
      v6 = &_os_log_internal;
      v7 = "DTMemlimitAssertionFactory: removed active and inactive memory limits for pid %d (result = %d)";
      os_log_type_t v8 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
  }
  return 0;
}

@end