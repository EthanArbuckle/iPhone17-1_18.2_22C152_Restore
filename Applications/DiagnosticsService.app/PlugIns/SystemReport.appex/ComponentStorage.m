@interface ComponentStorage
- (BOOL)isPresent;
- (id)checkDiskSpaceForURLResourceKey:(id)a3;
- (id)dataAvailable;
- (id)dataAvailableForImportantUsage;
- (id)dataCapacity;
- (id)serialNumber;
- (id)totalDiskCapacity;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentStorage

- (BOOL)isPresent
{
  return 1;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(ComponentStorage *)self dataCapacity];
  [v4 setObject:v5 forKeyedSubscript:@"nandCapacity"];

  v6 = [(ComponentStorage *)self dataAvailable];
  [v4 setObject:v6 forKeyedSubscript:@"nandAvailable"];

  v7 = [(ComponentStorage *)self dataAvailableForImportantUsage];
  [v4 setObject:v7 forKeyedSubscript:@"nandAvailableForImportantUsage"];

  v8 = [(ComponentStorage *)self totalDiskCapacity];
  [v4 setObject:v8 forKeyedSubscript:@"nandTotalDiskCapacity"];

  v9 = [(ComponentStorage *)self serialNumber];
  [v4 setObject:v9 forKeyedSubscript:@"serialNumber"];

  id v10 = CopyAppleCareNANDInfo();
  [v4 setObject:v10 forKeyedSubscript:@"nandInfo"];
}

- (id)dataCapacity
{
  memset(&v6, 0, 512);
  if (statfs("/", &v6))
  {
    v2 = 0;
  }
  else
  {
    v2 = +[NSNumber numberWithUnsignedLongLong:v6.f_blocks * v6.f_bsize];
  }
  v3 = [v2 stringValue];
  id v4 = stringOrNull(v3);

  return v4;
}

- (id)dataAvailable
{
  v2 = [(ComponentStorage *)self checkDiskSpaceForURLResourceKey:NSURLVolumeAvailableCapacityKey];
  v3 = numberOrNull(v2);

  return v3;
}

- (id)dataAvailableForImportantUsage
{
  v2 = [(ComponentStorage *)self checkDiskSpaceForURLResourceKey:NSURLVolumeAvailableCapacityForImportantUsageKey];
  v3 = numberOrNull(v2);

  return v3;
}

- (id)totalDiskCapacity
{
  v2 = [(ComponentStorage *)self checkDiskSpaceForURLResourceKey:NSURLVolumeTotalCapacityKey];
  v3 = numberOrNull(v2);

  return v3;
}

- (id)serialNumber
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [&off_1000B6EB0 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(&off_1000B6EB0);
        }
        uint64_t v6 = +[DAComponentUtil getIORegistryClass:*(void *)(*((void *)&v11 + 1) + 8 * i) property:@"Serial Number" optionalKey:0];
        if (v6)
        {
          v7 = (void *)v6;
          id v8 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
          goto LABEL_11;
        }
      }
      id v3 = [&off_1000B6EB0 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  v7 = 0;
  id v8 = 0;
LABEL_11:
  v9 = stringOrNull(v8);

  return v9;
}

- (id)checkDiskSpaceForURLResourceKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSURL fileURLWithPath:@"/private/var"];
  id v9 = 0;
  id v10 = 0;
  [v4 getResourceValue:&v10 forKey:v3 error:&v9];
  id v5 = v10;
  id v6 = v9;
  if (!v5)
  {
    v7 = DiagnosticsKitLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to check resource %@ in system report: %@", buf, 0x16u);
    }
  }

  return v5;
}

@end