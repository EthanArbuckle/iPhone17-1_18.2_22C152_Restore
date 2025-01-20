@interface HDProfile
- (HDHealthRecordsProfileExtension)healthRecordsExtension;
- (NSString)formattedName;
@end

@implementation HDProfile

- (HDHealthRecordsProfileExtension)healthRecordsExtension
{
  v4 = [(HDProfile *)self profileExtensionWithIdentifier:HKHealthRecordsPluginIdentifier];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = +[NSAssertionHandler currentHandler];
      [v6 handleFailureInMethod:a2, self, @"HDProfile+HealthRecordsPlugin.m", 22, @"Unexpected class for health records profile extension: %@", objc_opt_class() object file lineNumber description];
    }
  }

  return (HDHealthRecordsProfileExtension *)v4;
}

- (NSString)formattedName
{
  id v13 = 0;
  id v14 = 0;
  id v12 = 0;
  unsigned __int8 v2 = [(HDProfile *)self fetchDisplayFirstName:&v14 lastName:&v13 error:&v12];
  id v3 = v14;
  id v4 = v13;
  id v5 = v12;
  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AC960((uint64_t)v5, v6);
    }
  }
  id v7 = objc_alloc_init((Class)NSPersonNameComponents);
  [v7 setFamilyName:v4];
  [v7 setGivenName:v3];
  v8 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v7 style:1 options:0];
  if ([v8 length]) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

@end