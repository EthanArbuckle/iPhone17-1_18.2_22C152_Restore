@interface DTMemlimitAssertionFactory
- (id)_removeMemoryLimitsForPid:(int)a3;
- (id)assertionForPid:(int)a3;
@end

@implementation DTMemlimitAssertionFactory

- (id)assertionForPid:(int)a3
{
  return [(DTMemlimitAssertionFactory *)self _removeMemoryLimitsForPid:*(void *)&a3];
}

- (id)_removeMemoryLimitsForPid:(int)a3
{
  *(void *)((char *)&v11 + 4) = 0xFFFFFFFF00000000;
  LODWORD(v11) = -1;
  HIDWORD(v11) = 0;
  int v4 = memorystatus_control();
  if (v4)
  {
    int v5 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v13 = a3;
      __int16 v14 = 1024;
      int v15 = v5;
      v6 = "DTMemlimitAssertionFactory: failed to remove active and inactive memory limits for pid %d (result = %d)";
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v7, v6, buf, 0xEu);
    }
  }
  else
  {
    v8 = +[NSUserDefaults standardUserDefaults];
    unsigned int v9 = [v8 BOOLForKey:@"DTMemlimitAssertionFactoryLog"];

    if (v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      int v13 = a3;
      __int16 v14 = 1024;
      int v15 = 0;
      v6 = "DTMemlimitAssertionFactory: removed active and inactive memory limits for pid %d (result = %d)";
      os_log_type_t v7 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
  }
  return 0;
}

@end