@interface FEInternalPreferencesRevisionInit
@end

@implementation FEInternalPreferencesRevisionInit

void _FEInternalPreferencesRevisionInit_block_invoke()
{
  if (os_variant_has_internal_diagnostics())
  {
    _FEPreferencesOnce();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    v0 = [obj objectForKey:@"InternalPreferencesEnabled"];
    v1 = v0;
    if (v0 && ![v0 BOOLValue])
    {
      _FEInternalPreferencesRevisionVar = -1;
    }
    else
    {
      objc_storeStrong((id *)&_revisionDefaults, obj);
      _FEInternalPreferencesRevisionVar = 1;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)notificationHandler, @"com.apple.FocusEngine.InternalPreferences", 0, CFNotificationSuspensionBehaviorCoalesce);
    }
  }
}

@end