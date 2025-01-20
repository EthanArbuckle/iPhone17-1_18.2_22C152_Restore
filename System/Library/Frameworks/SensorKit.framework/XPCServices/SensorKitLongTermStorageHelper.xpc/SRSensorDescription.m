@interface SRSensorDescription
+ (id)sensorDescriptionForDeletionRecordFromDescription:(id)a3;
+ (id)sensorDescriptionForSensor:(id)a3;
+ (id)sensorDescriptionsForAuthorizationService:(id)a3;
+ (void)initialize;
- (BOOL)metadataEnabled;
- (BOOL)sensorConfigurationEnabled;
- (BOOL)supportsCurrentPlatform;
- (BOOL)supportsPlatform:(id)a3;
- (NSArray)filters;
- (NSArray)relatedSettingsCategories;
- (NSSet)eligibleDaemons;
- (NSString)authorizationService;
- (NSString)authorizationStoreCohort;
- (NSString)exportingSampleClass;
- (NSString)infoPlistAuthorizationCategory;
- (NSString)legacyName;
- (NSString)localizedAdditionalSampleDataNote;
- (NSString)name;
- (NSString)onDemandWriterService;
- (NSString)publicEntitlementValue;
- (NSString)sampleClass;
- (NSString)writerAuthorizationService;
- (NSString)writerBundleIdentifier;
- (SRSensorDescription)initWithDictionary:(id)a3;
- (double)roundingInterval;
- (id)description;
- (int64_t)authorizationVersion;
- (int64_t)datastoreBackend;
- (void)dealloc;
@end

@implementation SRSensorDescription

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_100016FF8 = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogDataStream");
  }
}

+ (id)sensorDescriptionForSensor:(id)a3
{
  uint64_t v4 = sub_1000064AC();

  return sub_100006048(v4, a3);
}

- (SRSensorDescription)initWithDictionary:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SRSensorDescription;
  uint64_t v4 = [(SRSensorDescription *)&v17 init];
  if (v4)
  {
    v5 = (NSString *)[a3 objectForKeyedSubscript:@"Name"];
    v4->_name = v5;
    if (!v5)
    {
      v6 = qword_100016FF8;
      if (os_log_type_enabled((os_log_t)qword_100016FF8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = a3;
        _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Data stream defined without a name: %{public}@", buf, 0xCu);
      }
    }
    v7 = (NSString *)[a3 objectForKeyedSubscript:@"AuthService"];
    v4->_authorizationService = v7;
    if (!v7)
    {
      v8 = qword_100016FF8;
      if (os_log_type_enabled((os_log_t)qword_100016FF8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = a3;
        _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Data stream defined without an authorization service: %{public}@", buf, 0xCu);
      }
    }
    v4->_writerBundleIdentifier = (NSString *)[a3 objectForKeyedSubscript:@"WriterBundleId"];
    id v9 = [a3 objectForKeyedSubscript:@"RelatedSettingsCategories"];
    v10 = &__NSArray0__struct;
    if (v9) {
      v10 = v9;
    }
    v4->_relatedSettingsCategories = (NSArray *)v10;
    v4->_publicEntitlementValue = (NSString *)[a3 objectForKeyedSubscript:@"PublicEntitlementValue"];
    v4->_sampleClass = (NSString *)[a3 objectForKeyedSubscript:@"SampleClass"];
    v4->_exportingSampleClass = (NSString *)[a3 objectForKeyedSubscript:@"ExportingSampleClass"];
    v4->_legacySampleClass = (NSString *)[a3 objectForKeyedSubscript:@"LegacySampleClass"];
    v4->_legacySampleClassLinkedBefore = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"LegacySampleClassLinkedBefore"), "unsignedIntValue");
    v11 = (NSString *)[a3 objectForKeyedSubscript:@"SRInfoPlistAuthCategory"];
    v4->_infoPlistAuthorizationCategory = v11;
    if (!v11)
    {
      v12 = qword_100016FF8;
      if (os_log_type_enabled((os_log_t)qword_100016FF8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = a3;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Data stream defined without an Info.plist authorization category: %{public}@", buf, 0xCu);
      }
    }
    v4->_authorizationVersion = (int64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"AuthorizationVersion"), "integerValue");
    v4->_onDemandWriterService = (NSString *)[a3 objectForKeyedSubscript:@"OnDemandWriterService"];
    v4->_supportedPlatforms = (NSDictionary *)[a3 objectForKeyedSubscript:@"SupportedPlatforms"];
    v4->_writerAuthorizationService = (NSString *)[a3 objectForKeyedSubscript:@"WriterAuthorizationService"];
    v4->_authorizationStoreCohort = (NSString *)[a3 objectForKeyedSubscript:@"AuthorizationStoreCohort"];
    v4->_legacyName = (NSString *)[a3 objectForKeyedSubscript:@"LegacyName"];
    v4->_filters = (NSArray *)[a3 objectForKeyedSubscript:@"Filters"];
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"RoundingIntervalSecs"), "doubleValue");
    v4->_roundingInterval = v13;
    id v14 = [a3 objectForKeyedSubscript:@"EligibleDaemons"];
    if (v14) {
      v4->_eligibleDaemons = (NSSet *)[objc_alloc((Class)NSSet) initWithArray:v14];
    }
    id v15 = [a3 objectForKeyedSubscript:@"Additions"];
    if (v15) {
      v4->_additions = (NSSet *)[objc_alloc((Class)NSSet) initWithArray:v15];
    }
    v4->_additionalSampleDataNoteKey = (NSString *)[a3 objectForKeyedSubscript:@"AdditionalDataNote"];
    v4->_datastoreBackend = (int64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"StorageBackend"), "integerValue");
  }
  return v4;
}

+ (id)sensorDescriptionForDeletionRecordFromDescription:(id)a3
{
  id v4 = objc_alloc((Class)NSMutableDictionary);
  v8[0] = @"Name";
  v9[0] = objc_msgSend(objc_msgSend(a3, "name"), "sr_sensorForDeletionRecordsFromSensor");
  v8[1] = @"AuthService";
  v9[1] = [a3 authorizationService];
  v9[2] = @"SRDeletionRecord";
  v8[2] = @"SampleClass";
  v8[3] = @"StorageBackend";
  v9[3] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 datastoreBackend]);
  v8[4] = @"SRInfoPlistAuthCategory";
  v9[4] = [a3 infoPlistAuthorizationCategory];
  id v5 = objc_msgSend(v4, "initWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 5));
  if ([a3 legacyName]) {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(objc_msgSend(a3, "legacyName"), "sr_sensorForDeletionRecordsFromSensor"), @"LegacyName");
  }
  v6 = [[SRSensorDescription alloc] initWithDictionary:v5];

  return v6;
}

- (NSString)localizedAdditionalSampleDataNote
{
  result = self->_localizedAdditionalSampleDataNote;
  if (!result)
  {
    id v4 = +[NSBundle bundleForClass:NSClassFromString(@"SRSensorReader")];
    if (v4)
    {
      result = [(NSBundle *)v4 localizedStringForKey:self->_additionalSampleDataNoteKey value:&stru_1000111E8 table:0];
      self->_localizedAdditionalSampleDataNote = result;
    }
    else
    {
      return self->_localizedAdditionalSampleDataNote;
    }
  }
  return result;
}

- (NSString)sampleClass
{
  if (!self->_legacySampleClassLinkedBefore) {
    return self->_sampleClass;
  }
  if (self->_legacySampleClass)
  {
    int v3 = dyld_program_sdk_at_least();
    uint64_t v4 = 168;
    if (v3) {
      uint64_t v4 = 72;
    }
    return *(NSString **)((char *)&self->super.isa + v4);
  }
  else
  {
    v6 = qword_100016FF8;
    if (os_log_type_enabled((os_log_t)qword_100016FF8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Found a linked before version but no legacy sample class", v7, 2u);
    }
    return 0;
  }
}

- (NSString)exportingSampleClass
{
  return self->_exportingSampleClass;
}

- (BOOL)metadataEnabled
{
  return [(NSSet *)self->_additions containsObject:@"Metadata"];
}

- (BOOL)sensorConfigurationEnabled
{
  return [(NSSet *)self->_additions containsObject:@"SensorConfiguration"];
}

- (BOOL)supportsPlatform:(id)a3
{
  if (!a3) {
    return 0;
  }
  supportedPlatforms = self->_supportedPlatforms;
  if (!supportedPlatforms) {
    return 1;
  }
  id v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](supportedPlatforms, "objectForKeyedSubscript:"), "objectForKeyedSubscript:", @"Enabled");

  return [v4 BOOLValue];
}

- (BOOL)supportsCurrentPlatform
{
  return [(SRSensorDescription *)self supportsPlatform:@"Phone"];
}

- (NSSet)eligibleDaemons
{
  result = self->_eligibleDaemons;
  if (!result) {
    return +[NSSet set];
  }
  return result;
}

- (void)dealloc
{
  self->_publicEntitlementValue = 0;
  self->_sampleClass = 0;

  self->_exportingSampleClass = 0;
  self->_localizedAdditionalSampleDataNote = 0;

  self->_onDemandWriterService = 0;
  self->_additionalSampleDataNoteKey = 0;

  v3.receiver = self;
  v3.super_class = (Class)SRSensorDescription;
  [(SRSensorDescription *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (%p): name: %@, authService: %@, writer: %@, relatedSettings: %@, publicEntitlement: %@, sampleClass: %@, exportingSampleClass: %@, additions: %@, onDemandWriterId: %@, writerAuthService: %@, supportedPlatforms: %@, auth store cohort: %@, legacyName: %@, filters: %@, legacySampleClass: %@, legacySampleClassLinkedBefore: %u, roundingInterval: %f, eligibleDaemons: %@, storageBackend: %ld", NSStringFromClass(v3), self, self->_name, self->_authorizationService, self->_writerBundleIdentifier, self->_relatedSettingsCategories, self->_publicEntitlementValue, self->_sampleClass, self->_exportingSampleClass, self->_additions, self->_onDemandWriterService, self->_writerAuthorizationService, self->_supportedPlatforms, self->_authorizationStoreCohort, self->_legacyName, self->_filters,
           self->_legacySampleClass,
           self->_legacySampleClassLinkedBefore,
           *(void *)&self->_roundingInterval,
           [(SRSensorDescription *)self eligibleDaemons],
           self->_datastoreBackend);
}

+ (id)sensorDescriptionsForAuthorizationService:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (void *)sub_1000064AC();
  v6 = sub_100006830(v5);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v11, "authorizationService", (void)v13), "isEqualToString:", a3)) {
          [v4 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4, (void)v13);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)authorizationService
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)writerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)relatedSettingsCategories
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)publicEntitlementValue
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)infoPlistAuthorizationCategory
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)writerAuthorizationService
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (int64_t)authorizationVersion
{
  return self->_authorizationVersion;
}

- (NSString)onDemandWriterService
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)authorizationStoreCohort
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)legacyName
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)filters
{
  return self->_filters;
}

- (double)roundingInterval
{
  return self->_roundingInterval;
}

- (int64_t)datastoreBackend
{
  return self->_datastoreBackend;
}

@end