@interface DNDModeConfiguration(Record)
+ (id)modeConfigurationForRecord:()Record;
- (DNDSMutableModeConfigurationRecord)makeRecord;
@end

@implementation DNDModeConfiguration(Record)

+ (id)modeConfigurationForRecord:()Record
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F5F710];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    v6 = (void *)MEMORY[0x1E4F5F5B8];
    v7 = [v4 configuration];
    v8 = [v4 secureConfiguration];
    v9 = [v6 configurationForRecord:v7 secureRecord:v8];
    [v5 setConfiguration:v9];

    v10 = (void *)MEMORY[0x1E4F5F5F8];
    v11 = [v4 mode];
    v12 = [v10 modeForRecord:v11];
    [v5 setMode:v12];

    v13 = [v4 triggers];
    v14 = [v13 triggers];
    [v5 setTriggers:v14];

    objc_msgSend(v5, "setImpactsAvailability:", objc_msgSend(v4, "impactsAvailability"));
    uint64_t v15 = [v4 dimsLockScreen];
    v16 = [v5 mode];
    uint64_t v17 = [v16 semanticType];

    if (v17 == 1) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = v15;
    }
    [v5 setDimsLockScreen:v18];
    v19 = [v4 created];
    [v5 setCreated:v19];

    v20 = [v4 lastModified];
    [v5 setLastModified:v20];

    objc_msgSend(v5, "setCompatibilityVersion:", objc_msgSend(v4, "compatibilityVersion"));
    objc_msgSend(v5, "setAutomaticallyGenerated:", objc_msgSend(v4, "isAutomaticallyGenerated"));
    [v4 lastModifiedByVersion];
    [v5 setLastModifiedByVersion:v23];
    v21 = [v4 lastModifiedByDeviceID];

    [v5 setLastModifiedByDeviceID:v21];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (DNDSMutableModeConfigurationRecord)makeRecord
{
  v2 = objc_alloc_init(DNDSMutableModeConfigurationRecord);
  v3 = [a1 mode];
  id v4 = [v3 makeRecord];
  [(DNDSMutableModeConfigurationRecord *)v2 setMode:v4];

  id v5 = [a1 configuration];
  v6 = [v5 makeRecord];
  [(DNDSMutableModeConfigurationRecord *)v2 setConfiguration:v6];

  v7 = [a1 configuration];
  v8 = [v7 makeSecureRecord];
  [(DNDSMutableModeConfigurationRecord *)v2 setSecureConfiguration:v8];

  v9 = [DNDSModeConfigurationTriggersRecord alloc];
  v10 = [a1 triggers];
  v11 = [(DNDSModeConfigurationTriggersRecord *)v9 initWithTriggers:v10];
  [(DNDSMutableModeConfigurationRecord *)v2 setTriggers:v11];

  -[DNDSMutableModeConfigurationRecord setImpactsAvailability:](v2, "setImpactsAvailability:", [a1 impactsAvailability]);
  uint64_t v12 = [a1 dimsLockScreen];
  v13 = [a1 mode];
  uint64_t v14 = [v13 semanticType];

  if (v14 == 1) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = v12;
  }
  [(DNDSMutableModeConfigurationRecord *)v2 setDimsLockScreen:v15];
  v16 = [a1 created];
  [(DNDSMutableModeConfigurationRecord *)v2 setCreated:v16];

  uint64_t v17 = [a1 lastModified];
  [(DNDSMutableModeConfigurationRecord *)v2 setLastModified:v17];

  [a1 lastModifiedByVersion];
  [(DNDSMutableModeConfigurationRecord *)v2 setLastModifiedByVersion:v20];
  uint64_t v18 = [a1 lastModifiedByDeviceID];
  [(DNDSMutableModeConfigurationRecord *)v2 setLastModifiedByDeviceID:v18];

  -[DNDSMutableModeConfigurationRecord setHasSecureData:](v2, "setHasSecureData:", [a1 hasSecureData]);
  -[DNDSMutableModeConfigurationRecord setCompatibilityVersion:](v2, "setCompatibilityVersion:", [a1 compatibilityVersion]);
  -[DNDSMutableModeConfigurationRecord setEphemeralResolvedCompatibilityVersion:](v2, "setEphemeralResolvedCompatibilityVersion:", [a1 resolvedCompatibilityVersion]);
  -[DNDSMutableModeConfigurationRecord setAutomaticallyGenerated:](v2, "setAutomaticallyGenerated:", [a1 isAutomaticallyGenerated]);
  return v2;
}

@end