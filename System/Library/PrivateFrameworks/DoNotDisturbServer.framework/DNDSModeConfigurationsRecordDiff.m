@interface DNDSModeConfigurationsRecordDiff
- (CKRecordZone)zone;
- (DNDSModeConfigurationsRecord)original;
- (DNDSModeConfigurationsRecord)updated;
- (DNDSModeConfigurationsRecordDiff)initWithOriginalModeConfigurations:(id)a3 updatedModeConfigurations:(id)a4 zone:(id)a5;
- (NSArray)modifiedIDs;
- (NSArray)removedIDs;
- (id)_modifiedConfigurations;
- (id)_recordIDsInModeConfigurations:(id)a3;
- (id)_removedConfigurations;
- (void)_generateDiff;
@end

@implementation DNDSModeConfigurationsRecordDiff

- (DNDSModeConfigurationsRecordDiff)initWithOriginalModeConfigurations:(id)a3 updatedModeConfigurations:(id)a4 zone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDSModeConfigurationsRecordDiff;
  v11 = [(DNDSModeConfigurationsRecordDiff *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    original = v11->_original;
    v11->_original = (DNDSModeConfigurationsRecord *)v12;

    uint64_t v14 = [v9 copy];
    updated = v11->_updated;
    v11->_updated = (DNDSModeConfigurationsRecord *)v14;

    uint64_t v16 = [v10 copy];
    zone = v11->_zone;
    v11->_zone = (CKRecordZone *)v16;

    [(DNDSModeConfigurationsRecordDiff *)v11 _generateDiff];
  }

  return v11;
}

- (void)_generateDiff
{
  id v8 = [(DNDSModeConfigurationsRecordDiff *)self _modifiedConfigurations];
  v3 = [(DNDSModeConfigurationsRecordDiff *)self _removedConfigurations];
  v4 = [(DNDSModeConfigurationsRecordDiff *)self _recordIDsInModeConfigurations:v8];
  modifiedIDs = self->_modifiedIDs;
  self->_modifiedIDs = v4;

  v6 = [(DNDSModeConfigurationsRecordDiff *)self _recordIDsInModeConfigurations:v3];
  removedIDs = self->_removedIDs;
  self->_removedIDs = v6;
}

- (id)_recordIDsInModeConfigurations:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        uint64_t v12 = [v10 mode];
        v13 = [v12 modeIdentifier];
        uint64_t v14 = [(CKRecordZone *)self->_zone zoneID];
        v15 = (void *)[v11 initWithRecordName:v13 zoneID:v14];

        [v5 addObject:v15];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)_modifiedConfigurations
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(DNDSModeConfigurationsRecord *)self->_updated modeConfigurations];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "mode", (void)v15);
        uint64_t v12 = [v11 modeIdentifier];

        v13 = [(DNDSModeConfigurationsRecord *)self->_original modeConfigurationForModeIdentifier:v12];
        if (([v10 isEqual:v13] & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_removedConfigurations
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(DNDSModeConfigurationsRecord *)self->_original modeConfigurations];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 mode];
        id v11 = [v10 modeIdentifier];

        uint64_t v12 = [(DNDSModeConfigurationsRecord *)self->_updated modeConfigurationForModeIdentifier:v11];
        if (!v12) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (DNDSModeConfigurationsRecord)original
{
  return self->_original;
}

- (DNDSModeConfigurationsRecord)updated
{
  return self->_updated;
}

- (NSArray)modifiedIDs
{
  return self->_modifiedIDs;
}

- (NSArray)removedIDs
{
  return self->_removedIDs;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_removedIDs, 0);
  objc_storeStrong((id *)&self->_modifiedIDs, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_original, 0);
}

@end