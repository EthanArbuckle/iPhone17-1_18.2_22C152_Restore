@interface _DKSync3FeaturePolicy
- (NSDictionary)properties;
- (_DKSync3FeaturePolicy)init;
- (id)description;
- (id)initWithName:(void *)a3 properties:;
- (void)setProperties:(id)a3;
@end

@implementation _DKSync3FeaturePolicy

- (_DKSync3FeaturePolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)_DKSync3FeaturePolicy;
  result = [(_DKSync3FeaturePolicy *)&v3 init];
  if (result) {
    result->_isSyncDisabled = 1;
  }
  return result;
}

- (id)initWithName:(void *)a3 properties:
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)_DKSync3FeaturePolicy;
    v8 = (id *)objc_msgSendSuper2(&v27, sel_init);
    a1 = v8;
    if (v8)
    {
      *((unsigned char *)v8 + 8) = 1;
      if (v6)
      {
        if (v7)
        {
          v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
          objc_storeStrong(a1 + 4, a2);
          _DKSync3PolicyDuplicateNSStringPropertyValue(@"Feature", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"IsSyncDisabled", v7, v9);
          _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue(@"StreamNames", v7, v9);
          _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue(@"Sources", v7, v9);
          _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue(@"Destinations", v7, v9);
          _DKSync3PolicyDuplicateNSStringPropertyValue(@"Transport", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"PeriodicSyncCadenceInMinutes", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"OnlyMultiDevice", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"OnlySingleDevice", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"OldestEventToSyncInDays", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"RequiresCharging", v7, v9);
          _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue(@"RequiresCompanions", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"PushTriggersSync", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"AdditionsCountTowardTriggeredSyncBucket", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"DeletionsCountTowardTriggeredSyncBucket", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"AdditionTriggersImmediateSync", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"DeletionTriggersImmediateSync", v7, v9);
          v10 = [v9 objectForKeyedSubscript:@"IsSyncDisabled"];
          char v11 = [v10 BOOLValue];

          *((unsigned char *)a1 + 8) = v11;
          if ((v11 & 1) == 0)
          {
            v28[0] = @"Feature";
            v28[1] = @"StreamNames";
            v28[2] = @"Transport";
            v28[3] = @"OldestEventToSyncInDays";
            v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
            int DoesContainRequiredProperties = _DKSync3PolicyDoesContainRequiredProperties(v6, v9, v12);

            if (DoesContainRequiredProperties)
            {
              objc_storeStrong(a1 + 3, v9);
              objc_storeStrong(a1 + 5, (id)[v9 objectForKeyedSubscript:@"Feature"]);
              objc_storeStrong(a1 + 6, (id)[v9 objectForKeyedSubscript:@"StreamNames"]);
              objc_storeStrong(a1 + 7, (id)[v9 objectForKeyedSubscript:@"Sources"]);
              objc_storeStrong(a1 + 8, (id)[v9 objectForKeyedSubscript:@"Destinations"]);
              objc_storeStrong(a1 + 9, (id)[v9 objectForKeyedSubscript:@"Transport"]);
              v14 = [v9 objectForKeyedSubscript:@"PeriodicSyncCadenceInMinutes"];
              uint64_t v15 = [v14 unsignedIntegerValue];

              a1[10] = (id)v15;
              v16 = [v9 objectForKeyedSubscript:@"OldestEventToSyncInDays"];
              uint64_t v17 = [v16 unsignedIntegerValue];

              a1[11] = (id)v17;
              v18 = [v9 objectForKeyedSubscript:@"OnlyMultiDevice"];
              LOBYTE(v17) = [v18 BOOLValue];

              *((unsigned char *)a1 + 9) = v17;
              v19 = [v9 objectForKeyedSubscript:@"OnlySingleDevice"];
              LOBYTE(v17) = [v19 BOOLValue];

              *((unsigned char *)a1 + 10) = v17;
              v20 = [v9 objectForKeyedSubscript:@"RequiresCharging"];
              LOBYTE(v17) = [v20 BOOLValue];

              *((unsigned char *)a1 + 11) = v17;
              objc_storeStrong(a1 + 12, (id)[v9 objectForKeyedSubscript:@"RequiresCompanions"]);
              v21 = [v9 objectForKeyedSubscript:@"PushTriggersSync"];
              LOBYTE(v17) = [v21 BOOLValue];

              *((unsigned char *)a1 + 12) = v17;
              v22 = [v9 objectForKeyedSubscript:@"AdditionsCountTowardTriggeredSyncBucket"];
              LOBYTE(v17) = [v22 BOOLValue];

              *((unsigned char *)a1 + 13) = v17;
              v23 = [v9 objectForKeyedSubscript:@"DeletionsCountTowardTriggeredSyncBucket"];
              LOBYTE(v17) = [v23 BOOLValue];

              *((unsigned char *)a1 + 14) = v17;
              v24 = [v9 objectForKeyedSubscript:@"AdditionTriggersImmediateSync"];
              LOBYTE(v17) = [v24 BOOLValue];

              *((unsigned char *)a1 + 15) = v17;
              v25 = [v9 objectForKeyedSubscript:@"DeletionTriggersImmediateSync"];
              LOBYTE(v17) = [v25 BOOLValue];

              *((unsigned char *)a1 + 16) = v17;
            }
          }
        }
      }
    }
  }

  return a1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@ { \n", v5];

  if (self)
  {
    [v3 appendFormat:@"                                    name: %@\n", self->_name];
    if (self->_isSyncDisabled) {
      [v3 appendFormat:@"                          isSyncDisabled: %@\n", @"YES"];
    }
    feature = self->_feature;
  }
  else
  {
    [v3 appendFormat:@"                                    name: %@\n", 0];
    feature = 0;
  }
  [v3 appendFormat:@"                                 feature: %@\n", feature];
  if (self)
  {
    id v7 = _CDPrettyPrintCollection(self->_streamNames, 0, 0, 0);
    [v3 appendFormat:@"                             streamNames: %@\n", v7];

    sources = self->_sources;
  }
  else
  {
    v20 = _CDPrettyPrintCollection(0, 0, 0, 0);
    [v3 appendFormat:@"                             streamNames: %@\n", v20];

    sources = 0;
  }
  if ([(NSArray *)sources count])
  {
    if (self) {
      v9 = self->_sources;
    }
    else {
      v9 = 0;
    }
    v10 = _CDPrettyPrintCollection(v9, 0, 0, 0);
    [v3 appendFormat:@"                                 sources: %@\n", v10];
  }
  if (self) {
    destinations = self->_destinations;
  }
  else {
    destinations = 0;
  }
  if ([(NSArray *)destinations count])
  {
    if (self) {
      v12 = self->_destinations;
    }
    else {
      v12 = 0;
    }
    v13 = _CDPrettyPrintCollection(v12, 0, 0, 0);
    [v3 appendFormat:@"                            destinations: %@\n", v13];
  }
  if (self)
  {
    [v3 appendFormat:@"                               transport: %@\n", self->_transport];
    if (self->_oldestEventToSyncInDays)
    {
      v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      [v3 appendFormat:@"                 oldestEventToSyncInDays: %@\n", v14];
    }
    if (self->_onlyMultiDevice) {
      [v3 appendFormat:@"                         onlyMultiDevice: %@\n", @"YES"];
    }
    if (self->_onlySingleDevice) {
      [v3 appendFormat:@"                        onlySingleDevice: %@\n", @"YES"];
    }
    if (self->_requiresCharging) {
      uint64_t v15 = @"YES";
    }
    else {
      uint64_t v15 = @"NO";
    }
    [v3 appendFormat:@"                        requiresCharging: %@\n", v15];
    requiresCompanions = self->_requiresCompanions;
  }
  else
  {
    [v3 appendFormat:@"                               transport: %@\n", 0];
    [v3 appendFormat:@"                        requiresCharging: %@\n", @"NO"];
    requiresCompanions = 0;
  }
  uint64_t v17 = _CDPrettyPrintCollection(requiresCompanions, 0, 0, 0);
  [v3 appendFormat:@"                      requiresCompanions: %@\n", v17];

  if (self)
  {
    if (self->_pushTriggersSync) {
      v18 = @"YES";
    }
    else {
      v18 = @"NO";
    }
    [v3 appendFormat:@"                        pushTriggersSync: %@\n", v18];
    if (self->_additionsCountTowardTriggeredSyncBucket) {
      [v3 appendFormat:@" additionsCountTowardTriggeredSyncBucket: %@\n", @"YES"];
    }
    if (self->_deletionsCountTowardTriggeredSyncBucket) {
      [v3 appendFormat:@" deletionsCountTowardTriggeredSyncBucket: %@\n", @"YES"];
    }
    if (self->_additionTriggersImmediateSync) {
      [v3 appendFormat:@"           additionTriggersImmediateSync: %@\n", @"YES"];
    }
    if (self->_deletionTriggersImmediateSync) {
      [v3 appendFormat:@"           deletionTriggersImmediateSync: %@\n", @"YES"];
    }
  }
  else
  {
    [v3 appendFormat:@"                        pushTriggersSync: %@\n", @"NO"];
  }
  [v3 appendString:@"}\n"];
  return v3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiresCompanions, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_streamNames, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end