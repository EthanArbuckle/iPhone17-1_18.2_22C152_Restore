@interface ComponentWiFi
- (BOOL)isPresent;
- (id)serialNumber;
- (id)wifiAddress;
- (id)wifiDeviceCount;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentWiFi

- (BOOL)isPresent
{
  v2 = [(ComponentWiFi *)self wifiDeviceCount];
  BOOL v3 = (int)[v2 intValue] > 0;

  return v3;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(ComponentWiFi *)self wifiAddress];
  [v4 setObject:v5 forKeyedSubscript:@"wifiAddress"];

  id v6 = [(ComponentWiFi *)self serialNumber];
  [v4 setObject:v6 forKeyedSubscript:@"serialNumber"];
}

- (id)wifiDeviceCount
{
  id v2 = objc_alloc_init((Class)CWFInterface);
  BOOL v3 = v2;
  if (v2)
  {
    [v2 activate];
    id v4 = [v3 interfaceNames];
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "WiFiManagerClientCreate failed", v8, 2u);
    }

    v5 = &off_1000B7330;
  }

  return v5;
}

- (id)wifiAddress
{
  id v2 = (void *)MGCopyAnswer();
  BOOL v3 = stringOrNull(v2);

  return v3;
}

- (id)serialNumber
{
  id v2 = (void *)MGCopyAnswer();

  return v2;
}

@end