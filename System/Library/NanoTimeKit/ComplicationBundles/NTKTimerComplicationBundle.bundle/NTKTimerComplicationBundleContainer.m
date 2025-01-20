@interface NTKTimerComplicationBundleContainer
+ (id)complicationBundleDataSources;
@end

@implementation NTKTimerComplicationBundleContainer

+ (id)complicationBundleDataSources
{
  v2 = +[CLKDevice currentDevice];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D19E94CA-E3A6-45FB-A534-710914B5AB77"];
  unsigned int v4 = [v2 supportsCapability:v3];

  v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v2 nrDeviceUUID];
    v7 = (void *)v6;
    CFStringRef v8 = @"does not support";
    if (v4) {
      CFStringRef v8 = @"supports";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v18 = (const __CFString *)v6;
    __int16 v19 = 2114;
    CFStringRef v20 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "CLKDevice: %@ %{public}@ multiple timers.", buf, 0x16u);
  }
  v9 = _NTKLoggingObjectForDomain();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Multiple timer complications is supported", buf, 2u);
    }

    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v11 = v16;
    uint64_t v12 = 2;
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v18 = @"No";
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Not loading multiple timer complication bundle. Supported: %{public}@.", buf, 0xCu);
    }

    uint64_t v15 = objc_opt_class();
    v11 = &v15;
    uint64_t v12 = 1;
  }
  v13 = +[NSArray arrayWithObjects:v11 count:v12];

  return v13;
}

@end