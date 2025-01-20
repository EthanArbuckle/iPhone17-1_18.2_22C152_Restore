@interface _DKSync3TransportPolicy
- (NSDictionary)properties;
- (_DKSync3TransportPolicy)init;
- (id)description;
- (id)initWithName:(void *)a3 properties:;
- (void)setProperties:(id)a3;
@end

@implementation _DKSync3TransportPolicy

- (_DKSync3TransportPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)_DKSync3TransportPolicy;
  result = [(_DKSync3TransportPolicy *)&v3 init];
  if (result) {
    result->_isSyncDisabled = 1;
  }
  return result;
}

- (id)initWithName:(void *)a3 properties:
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v31.receiver = a1;
    v31.super_class = (Class)_DKSync3TransportPolicy;
    v8 = (id *)objc_msgSendSuper2(&v31, sel_init);
    a1 = v8;
    if (v8)
    {
      *((unsigned char *)v8 + 8) = 1;
      if (v6)
      {
        if (v7)
        {
          v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
          objc_storeStrong(a1 + 3, a2);
          _DKSync3PolicyDuplicateNSStringPropertyValue(@"Transport", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"IsSyncDisabled", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"MaximumSyncsPerDay", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"SyncBatchSizeInEvents", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"MaximumBatchesPerSync", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"MaximumSyncWindowInSeconds", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"MinimumTimeBetweenSyncsInSeconds", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"SingleDevicePeriodicSyncCadenceInDays", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"AdditionsBucketCountTriggeringSync", v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(@"DeletionsBucketCountTriggeringSync", v7, v9);
          v10 = [v9 objectForKeyedSubscript:@"IsSyncDisabled"];
          char v11 = [v10 BOOLValue];

          *((unsigned char *)a1 + 8) = v11;
          if ((v11 & 1) == 0)
          {
            v32[0] = @"Transport";
            v32[1] = @"SyncBatchSizeInEvents";
            v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
            int DoesContainRequiredProperties = _DKSync3PolicyDoesContainRequiredProperties(v6, v9, v12);

            if (DoesContainRequiredProperties)
            {
              objc_storeStrong(a1 + 2, v9);
              objc_storeStrong(a1 + 4, (id)[v9 objectForKeyedSubscript:@"Transport"]);
              v14 = [v9 objectForKeyedSubscript:@"MaximumSyncsPerDay"];
              uint64_t v15 = [v14 unsignedIntegerValue];

              a1[5] = (id)v15;
              v16 = [v9 objectForKeyedSubscript:@"SyncBatchSizeInEvents"];
              uint64_t v17 = [v16 unsignedIntegerValue];

              a1[6] = (id)v17;
              v18 = [v9 objectForKeyedSubscript:@"MaximumBatchesPerSync"];
              uint64_t v19 = [v18 unsignedIntegerValue];

              a1[7] = (id)v19;
              v20 = [v9 objectForKeyedSubscript:@"MaximumSyncWindowInSeconds"];
              uint64_t v21 = [v20 unsignedIntegerValue];

              a1[8] = (id)v21;
              v22 = [v9 objectForKeyedSubscript:@"MinimumTimeBetweenSyncsInSeconds"];
              uint64_t v23 = [v22 unsignedIntegerValue];

              a1[9] = (id)v23;
              v24 = [v9 objectForKeyedSubscript:@"SingleDevicePeriodicSyncCadenceInDays"];
              uint64_t v25 = [v24 unsignedIntegerValue];

              a1[10] = (id)v25;
              v26 = [v9 objectForKeyedSubscript:@"AdditionsBucketCountTriggeringSync"];
              uint64_t v27 = [v26 unsignedIntegerValue];

              a1[11] = (id)v27;
              v28 = [v9 objectForKeyedSubscript:@"DeletionsBucketCountTriggeringSync"];
              uint64_t v29 = [v28 unsignedIntegerValue];

              a1[12] = (id)v29;
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
    transport = self->_transport;
  }
  else
  {
    [v3 appendFormat:@"                                    name: %@\n", 0];
    transport = 0;
  }
  [v3 appendFormat:@"                               transport: %@\n", transport];
  if (self) {
    unint64_t maximumSyncsPerDay = self->_maximumSyncsPerDay;
  }
  else {
    unint64_t maximumSyncsPerDay = 0;
  }
  v8 = [NSNumber numberWithUnsignedInteger:maximumSyncsPerDay];
  [v3 appendFormat:@"                      maximumSyncsPerDay: %@\n", v8];

  if (self) {
    unint64_t syncBatchSizeInEvents = self->_syncBatchSizeInEvents;
  }
  else {
    unint64_t syncBatchSizeInEvents = 0;
  }
  v10 = [NSNumber numberWithUnsignedInteger:syncBatchSizeInEvents];
  [v3 appendFormat:@"                   syncBatchSizeInEvents: %@\n", v10];

  if (self) {
    unint64_t maximumBatchesPerSync = self->_maximumBatchesPerSync;
  }
  else {
    unint64_t maximumBatchesPerSync = 0;
  }
  v12 = [NSNumber numberWithUnsignedInteger:maximumBatchesPerSync];
  [v3 appendFormat:@"                   maximumBatchesPerSync: %@\n", v12];

  if (self) {
    unint64_t minimumSyncWindowInSeconds = self->_minimumSyncWindowInSeconds;
  }
  else {
    unint64_t minimumSyncWindowInSeconds = 0;
  }
  v14 = [NSNumber numberWithUnsignedInteger:minimumSyncWindowInSeconds];
  [v3 appendFormat:@"              minimumSyncWindowInSeconds: %@\n", v14];

  if (!self)
  {
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:0];
    [v3 appendFormat:@"        minimumTimeBetweenSyncsInSeconds: %@\n", v17];
    goto LABEL_18;
  }
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:self->_minimumTimeBetweenSyncsInSeconds];
  [v3 appendFormat:@"        minimumTimeBetweenSyncsInSeconds: %@\n", v15];

  if (self->_additionsBucketCountTriggeringSync)
  {
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 appendFormat:@"      additionsBucketCountTriggeringSync: %@\n", v16];
  }
  if (self->_deletionsBucketCountTriggeringSync)
  {
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 appendFormat:@"      deletionsBucketCountTriggeringSync: %@\n", v17];
LABEL_18:
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
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end