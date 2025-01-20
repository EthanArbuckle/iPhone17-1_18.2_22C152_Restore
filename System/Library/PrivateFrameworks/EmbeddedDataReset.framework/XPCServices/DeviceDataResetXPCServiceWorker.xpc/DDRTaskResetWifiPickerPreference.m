@interface DDRTaskResetWifiPickerPreference
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetWifiPickerPreference

- (void)run
{
  uint64_t v2 = WiFiManagerClientCreate();
  v3 = DDRLogForCategory(0);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Successful create the WiFiManager, proceed to reset network settings", buf, 2u);
    }

    WiFiManagerClientResetNetworkSettings();
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Does not have wifi manager, do nothing", v5, 2u);
    }
  }
}

- (double)estimatedTimeOfCompletion
{
  return 0.1;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetWifiPickerPreference";
}

@end