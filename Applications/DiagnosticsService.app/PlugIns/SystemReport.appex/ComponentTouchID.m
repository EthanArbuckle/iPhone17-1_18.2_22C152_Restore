@interface ComponentTouchID
- (BOOL)isPresent;
- (id)mesaModuleSerialNumber;
- (id)mesaSensorProvisioningState;
- (id)mesaSensorSerialNumber;
- (id)serialNumber;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentTouchID

- (BOOL)isPresent
{
  v3 = [(ComponentTouchID *)self serialNumber];
  if (findDeviceWithName("mesa") && isValidSerialNumber(v3))
  {
    BOOL valid = 1;
  }
  else
  {
    v5 = [(ComponentTouchID *)self mesaSensorSerialNumber];
    BOOL valid = isValidSerialNumber(v5);
  }
  return valid;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(ComponentTouchID *)self serialNumber];
  [v4 setObject:v5 forKeyedSubscript:@"serialNumber"];

  v6 = [(ComponentTouchID *)self mesaSensorProvisioningState];
  [v4 setObject:v6 forKeyedSubscript:@"mesaSensorProvisioningState"];

  v7 = [(ComponentTouchID *)self mesaSensorSerialNumber];
  [v4 setObject:v7 forKeyedSubscript:@"mesaSensorSerialNumber"];

  id v8 = [(ComponentTouchID *)self mesaModuleSerialNumber];
  [v4 setObject:v8 forKeyedSubscript:@"mesaModuleSerialNumber"];
}

- (id)serialNumber
{
  v2 = (void *)MGCopyAnswer();
  v3 = stringOrNull(v2);

  return v3;
}

- (id)mesaSensorProvisioningState
{
  unsigned int v7 = 0;
  if (sub_10000399C((int *)&v7))
  {
    v2 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Unable to get current mesa provisioning state", v6, 2u);
    }

    uint64_t v3 = 0;
    unsigned int v7 = 0;
  }
  else
  {
    uint64_t v3 = v7;
  }
  id v4 = +[NSNumber numberWithUnsignedInt:v3];

  return v4;
}

- (id)mesaSensorSerialNumber
{
  uint64_t v7 = 128;
  if (sub_100004050(v10, &v7))
  {
    v2 = 0;
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[NSData dataWithBytes:v10 length:v7];
    v2 = byteString(v3, 1);
    id v4 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Mesa sensor serial number: %@", buf, 0xCu);
    }
  }
  v5 = stringOrNull(v2);

  return v5;
}

- (id)mesaModuleSerialNumber
{
  uint64_t v7 = 128;
  if (sub_100003CC0(v10, &v7))
  {
    id v2 = 0;
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[NSData dataWithBytes:v10 length:v7];
    id v2 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
    id v4 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Mesa Module serial number: %@", buf, 0xCu);
    }
  }
  v5 = stringOrNull(v2);

  return v5;
}

@end