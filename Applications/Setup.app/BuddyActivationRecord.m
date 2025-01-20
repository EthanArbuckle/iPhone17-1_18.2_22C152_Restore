@interface BuddyActivationRecord
+ (id)_currentActivationRecordDictionary;
- (BOOL)impliesDemod;
- (BOOL)impliesEarlyExit;
- (BuddyActivationRecord)init;
- (BuddyActivationRecord)initWithActivationRecordDictionary:(id)a3;
@end

@implementation BuddyActivationRecord

+ (id)_currentActivationRecordDictionary
{
  v7[2] = a1;
  v7[1] = (id)a2;
  v7[0] = 0;
  id location = 0;
  id v2 = (id)MAECopyActivationRecordWithError();
  objc_storeStrong(&location, 0);
  id v3 = v7[0];
  v7[0] = v2;

  id v4 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v4;
}

- (BuddyActivationRecord)init
{
  id v3 = +[BuddyActivationRecord _currentActivationRecordDictionary];
  id location = [(BuddyActivationRecord *)self initWithActivationRecordDictionary:v3];
  id v4 = (BuddyActivationRecord *)location;

  objc_storeStrong(&location, 0);
  return v4;
}

- (BuddyActivationRecord)initWithActivationRecordDictionary:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v12;
  id v12 = 0;
  v10.receiver = v3;
  v10.super_class = (Class)BuddyActivationRecord;
  id v4 = [(BuddyActivationRecord *)&v10 init];
  id v12 = v4;
  objc_storeStrong(&v12, v4);
  if (v4)
  {
    *((void *)v12 + 1) = 0;
    id v9 = [location[0] objectForKeyedSubscript:@"DeviceConfigurationFlags"];
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)v9);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: Device Configuration Flags = %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = [v9 integerValue];
      *((void *)v12 + 1) = v5;
    }
    objc_storeStrong(&v9, 0);
  }
  v6 = (BuddyActivationRecord *)v12;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v6;
}

- (BOOL)impliesDemod
{
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = 0;
  int v8 = 6;
  if ((self->_configurationFlags & 6) != 0)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = oslog;
      os_log_type_t v3 = v6;
      sub_10004B24C(v5);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Configuration flags specify demo mode", (uint8_t *)v5, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return 1;
  }
  return v9;
}

- (BOOL)impliesEarlyExit
{
  if (self->_configurationFlags & 4) != 0 && (self->_configurationFlags) {
    return 0;
  }
  else {
    return [(BuddyActivationRecord *)self impliesDemod];
  }
}

@end