@interface NSDictionary
- (id)cplRecordWithName:(id)a3 zonedID:(id)a4;
- (id)cpl_validObjectForKey:(id)a3 class:(id)a4;
@end

@implementation NSDictionary

- (id)cpl_validObjectForKey:(id)a3 class:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSDictionary *)self objectForKey:v6];
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v9 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412802;
        id v13 = v7;
        __int16 v14 = 2112;
        id v15 = (id)objc_opt_class();
        __int16 v16 = 2112;
        id v17 = v6;
        id v10 = v15;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Expected class: %@ but got class %@ for key: %@", (uint8_t *)&v12, 0x20u);
      }
    }

    v8 = 0;
  }

  return v8;
}

- (id)cplRecordWithName:(id)a3 zonedID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)CKRecordID) initWithRecordName:v7 zoneID:v6];

  v9 = [(NSDictionary *)self objectForKeyedSubscript:v8];

  return v9;
}

@end