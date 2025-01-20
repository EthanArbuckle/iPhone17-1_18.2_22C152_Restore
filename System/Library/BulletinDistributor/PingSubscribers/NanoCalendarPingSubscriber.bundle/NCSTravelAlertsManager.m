@interface NCSTravelAlertsManager
+ (id)sharedManager;
- (BOOL)_ttlEnabledOnWatch;
- (BOOL)_ttlSupportedOnWatch;
- (BOOL)ttlRemoteForwardingEnabledForWatch;
@end

@implementation NCSTravelAlertsManager

+ (id)sharedManager
{
  if (qword_10DE0 != -1) {
    dispatch_once(&qword_10DE0, &stru_C710);
  }
  v2 = (void *)qword_10DD8;

  return v2;
}

- (BOOL)_ttlSupportedOnWatch
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = [v2 getActivePairedDevice];

  if (v3)
  {
    NRWatchOSVersionForRemoteDevice();
    char IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();
  }
  else
  {
    char IsGreaterThanOrEqual = 0;
  }

  return IsGreaterThanOrEqual;
}

- (BOOL)_ttlEnabledOnWatch
{
  unsigned int v2 = [(NCSTravelAlertsManager *)self _ttlSupportedOnWatch];
  v3 = +[NanoCalendarPreferences appDefaults];
  v4 = [v3 objectForKey:@"EnableTTLOnWatch"];
  v5 = ncs_log_alerts_ttl();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_8C88((uint64_t)v4, v5);
  }

  if (v4) {
    unsigned int v2 = [v4 BOOLValue];
  }
  v6 = ncs_log_alerts_ttl();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v2;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Asked _ttlEnabled; returning %d", (uint8_t *)v8, 8u);
  }

  return v2;
}

- (BOOL)ttlRemoteForwardingEnabledForWatch
{
  unsigned int v2 = ![(NCSTravelAlertsManager *)self _ttlEnabledOnWatch];
  v3 = ncs_log_alerts_ttl();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Asked ttlRemoteForwardingEnabledForWatch; returning %d",
      (uint8_t *)v5,
      8u);
  }

  return v2;
}

@end