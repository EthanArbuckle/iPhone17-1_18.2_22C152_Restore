@interface IDSPairedDeviceKeychainSchema
- (BOOL)isMigrationRequiredForKeychainDictionary:(id)a3;
- (id)_migrateFromSinglePairedDeviceToMultipleWithKeychainDictionary:(id)a3;
- (id)_propertyDictionariesFromPairedDevices:(id)a3;
- (id)keychainDictionaryWithPairedDevices:(id)a3;
- (id)migrateKeychainDictionary:(id)a3;
- (unint64_t)_migrationTypeForKeychainDictionary:(id)a3;
@end

@implementation IDSPairedDeviceKeychainSchema

- (id)keychainDictionaryWithPairedDevices:(id)a3
{
  v3 = [(IDSPairedDeviceKeychainSchema *)self _propertyDictionariesFromPairedDevices:a3];
  v6[0] = @"schema-version";
  v6[1] = @"paired-devices";
  v7[0] = &off_1009D10F8;
  v7[1] = v3;
  v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)_propertyDictionariesFromPairedDevices:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "persistedProperties", (void)v12);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isMigrationRequiredForKeychainDictionary:(id)a3
{
  return [(IDSPairedDeviceKeychainSchema *)self _migrationTypeForKeychainDictionary:a3] != 0;
}

- (unint64_t)_migrationTypeForKeychainDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"schema-version"];
  id v4 = [v3 unsignedIntegerValue];
  if (v4)
  {
    if (v4 != (id)9200)
    {
      id v5 = +[IMRGLog watchPairing];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_10071200C((uint64_t)v3, v5);
      }
    }
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = 1;
  }

  return v6;
}

- (id)migrateKeychainDictionary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(IDSPairedDeviceKeychainSchema *)self _migrationTypeForKeychainDictionary:v4];
  id v6 = v4;
  id v7 = v6;
  if (v5 == 1)
  {
    uint64_t v8 = [(IDSPairedDeviceKeychainSchema *)self _migrateFromSinglePairedDeviceToMultipleWithKeychainDictionary:v6];
  }
  else
  {
    uint64_t v8 = v6;
    if (!v5)
    {
      v9 = +[IMRGLog watchPairing];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_100712084(v9);
      }

      uint64_t v8 = v7;
    }
  }

  return v8;
}

- (id)_migrateFromSinglePairedDeviceToMultipleWithKeychainDictionary:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[IDSPairedDevice alloc] initWithProperties:v4];

  id v6 = [[IDSPairedDevice alloc] initWithPairedDevice:v5 isActive:1];
  v10 = v6;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  uint64_t v8 = [(IDSPairedDeviceKeychainSchema *)self keychainDictionaryWithPairedDevices:v7];

  return v8;
}

@end