@interface DNDSSettingsRecord
+ (id)backingStoreWithFileURL:(id)a3;
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
+ (id)recordWithEncodedInfo:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSBehaviorSettingsRecord)behaviorSettings;
- (DNDSBypassSettingsRecord)phoneCallBypassSettings;
- (DNDSConfigurationsRecord)configurations;
- (DNDSScheduleSettingsRecord)scheduleSettings;
- (DNDSSettingsRecord)init;
- (NSString)description;
- (id)_initWithBehaviorSettings:(id)a3 phoneCallBypassSettings:(id)a4 scheduleSettings:(id)a5 configurations:(id)a6;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSSettingsRecord

+ (id)backingStoreWithFileURL:(id)a3
{
  id v4 = a3;
  v5 = [[DNDSJSONBackingStore alloc] initWithRecordClass:a1 fileURL:v4 versionNumber:2];

  return v5;
}

+ (id)recordWithEncodedInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[DNDSBehaviorSettingsRecord _recordWithEncodedInfo:v5 error:a4];
  v7 = +[DNDSScheduleSettingsRecord _recordWithEncodedInfo:v5 error:a4];
  v8 = +[DNDSBypassSettingsRecord _recordWithEncodedInfo:v5 error:a4];

  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v8 == 0)
  {
    v11 = 0;
  }
  else
  {
    v11 = objc_alloc_init(DNDSMutableSettingsRecord);
    [(DNDSMutableSettingsRecord *)v11 setBehaviorSettings:v6];
    [(DNDSMutableSettingsRecord *)v11 setScheduleSettings:v7];
    [(DNDSMutableSettingsRecord *)v11 setPhoneCallBypassSettings:v8];
  }

  return v11;
}

- (DNDSSettingsRecord)init
{
  return (DNDSSettingsRecord *)[(DNDSSettingsRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 behaviorSettings];
  v6 = [v4 phoneCallBypassSettings];
  v7 = [v4 scheduleSettings];
  v8 = [v4 configurations];

  id v9 = [(DNDSSettingsRecord *)self _initWithBehaviorSettings:v5 phoneCallBypassSettings:v6 scheduleSettings:v7 configurations:v8];
  return v9;
}

- (id)_initWithBehaviorSettings:(id)a3 phoneCallBypassSettings:(id)a4 scheduleSettings:(id)a5 configurations:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)DNDSSettingsRecord;
  v14 = [(DNDSSettingsRecord *)&v32 init];
  if (v14)
  {
    v15 = (void *)[v10 copy];
    v16 = v15;
    if (v15) {
      v17 = v15;
    }
    else {
      v17 = objc_alloc_init(DNDSBehaviorSettingsRecord);
    }
    behaviorSettings = v14->_behaviorSettings;
    v14->_behaviorSettings = v17;

    v19 = (void *)[v11 copy];
    v20 = v19;
    if (v19) {
      v21 = v19;
    }
    else {
      v21 = objc_alloc_init(DNDSBypassSettingsRecord);
    }
    phoneCallBypassSettings = v14->_phoneCallBypassSettings;
    v14->_phoneCallBypassSettings = v21;

    v23 = (void *)[v12 copy];
    v24 = v23;
    if (v23) {
      v25 = v23;
    }
    else {
      v25 = objc_alloc_init(DNDSScheduleSettingsRecord);
    }
    scheduleSettings = v14->_scheduleSettings;
    v14->_scheduleSettings = v25;

    v27 = (void *)[v13 copy];
    v28 = v27;
    if (v27) {
      v29 = v27;
    }
    else {
      v29 = objc_alloc_init(DNDSConfigurationsRecord);
    }
    configurations = v14->_configurations;
    v14->_configurations = v29;
  }
  return v14;
}

- (unint64_t)hash
{
  v3 = [(DNDSSettingsRecord *)self behaviorSettings];
  uint64_t v4 = [v3 hash];
  id v5 = [(DNDSSettingsRecord *)self phoneCallBypassSettings];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSSettingsRecord *)self scheduleSettings];
  uint64_t v8 = [v7 hash];
  id v9 = [(DNDSSettingsRecord *)self configurations];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSSettingsRecord *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(DNDSSettingsRecord *)self behaviorSettings];
      v7 = [(DNDSSettingsRecord *)v5 behaviorSettings];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDSSettingsRecord *)self behaviorSettings];
        if (!v8)
        {
          char v13 = 0;
          goto LABEL_50;
        }
        id v9 = (void *)v8;
        unint64_t v10 = [(DNDSSettingsRecord *)v5 behaviorSettings];
        if (!v10)
        {
          char v13 = 0;
LABEL_49:

          goto LABEL_50;
        }
        id v11 = [(DNDSSettingsRecord *)self behaviorSettings];
        id v12 = [(DNDSSettingsRecord *)v5 behaviorSettings];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_48:

          goto LABEL_49;
        }
        v49 = v12;
        v50 = v11;
        v51 = v10;
        v52 = v9;
      }
      v14 = [(DNDSSettingsRecord *)self phoneCallBypassSettings];
      v15 = [(DNDSSettingsRecord *)v5 phoneCallBypassSettings];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSSettingsRecord *)self phoneCallBypassSettings];
        if (v16)
        {
          v17 = (void *)v16;
          uint64_t v18 = [(DNDSSettingsRecord *)v5 phoneCallBypassSettings];
          if (v18)
          {
            v19 = (void *)v18;
            v48 = v14;
            v20 = [(DNDSSettingsRecord *)self phoneCallBypassSettings];
            v21 = [(DNDSSettingsRecord *)v5 phoneCallBypassSettings];
            if (([v20 isEqual:v21] & 1) == 0)
            {

              goto LABEL_38;
            }
            v43 = v20;
            v44 = v19;
            v45 = v17;
            v14 = v21;
            goto LABEL_17;
          }
        }
        goto LABEL_38;
      }
      v48 = v14;
LABEL_17:
      v22 = [(DNDSSettingsRecord *)self scheduleSettings];
      v47 = [(DNDSSettingsRecord *)v5 scheduleSettings];
      if (v22 == v47)
      {
        v46 = v22;
        goto LABEL_25;
      }
      uint64_t v23 = [(DNDSSettingsRecord *)self scheduleSettings];
      if (v23)
      {
        v24 = (void *)v23;
        v25 = [(DNDSSettingsRecord *)v5 scheduleSettings];
        if (v25)
        {
          v40 = v14;
          v42 = v25;
          v26 = [(DNDSSettingsRecord *)self scheduleSettings];
          v27 = [(DNDSSettingsRecord *)v5 scheduleSettings];
          if ([v26 isEqual:v27])
          {
            v37 = v27;
            v38 = v26;
            v39 = v24;
            v46 = v22;
            v14 = v40;
LABEL_25:
            v28 = [(DNDSSettingsRecord *)self configurations];
            uint64_t v29 = [(DNDSSettingsRecord *)v5 configurations];
            if (v28 == (void *)v29)
            {

              char v13 = 1;
            }
            else
            {
              v30 = (void *)v29;
              uint64_t v31 = [(DNDSSettingsRecord *)self configurations];
              if (v31)
              {
                v41 = (void *)v31;
                objc_super v32 = [(DNDSSettingsRecord *)v5 configurations];
                if (v32)
                {
                  v36 = v32;
                  v35 = [(DNDSSettingsRecord *)self configurations];
                  v33 = [(DNDSSettingsRecord *)v5 configurations];
                  char v13 = [v35 isEqual:v33];

                  objc_super v32 = v36;
                }
                else
                {
                  char v13 = 0;
                }
              }
              else
              {

                char v13 = 0;
              }
            }
            if (v46 != v47)
            {
            }
            if (v48 != v15)
            {
            }
LABEL_47:
            unint64_t v10 = v51;
            id v9 = v52;
            id v11 = v50;
            id v12 = v49;
            if (v6 != v7) {
              goto LABEL_48;
            }
LABEL_50:

            goto LABEL_51;
          }

          v14 = v40;
          v25 = v42;
        }
      }
      if (v48 != v15)
      {
      }
LABEL_38:
      char v13 = 0;
      goto LABEL_47;
    }
    char v13 = 0;
  }
LABEL_51:

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(DNDSSettingsRecord *)self behaviorSettings];
  uint64_t v6 = [(DNDSSettingsRecord *)self phoneCallBypassSettings];
  v7 = [(DNDSSettingsRecord *)self scheduleSettings];
  uint64_t v8 = [(DNDSSettingsRecord *)self configurations];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; behaviorSettings: %@; phoneCallBypassSettings: %@; scheduleSettings: %@; configurations: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
  id v9 = v8);

  return (NSString *)v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableSettingsRecord alloc];
  return [(DNDSSettingsRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"behaviorSettings", objc_opt_class());
  id v9 = +[DNDSBehaviorSettingsRecord newWithDictionaryRepresentation:v8 context:v6];
  unint64_t v10 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"phoneCallBypassSettings", objc_opt_class());
  id v11 = +[DNDSBypassSettingsRecord newWithDictionaryRepresentation:v10 context:v6];
  id v12 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"scheduleSettings", objc_opt_class());
  id v13 = +[DNDSScheduleSettingsRecord newWithDictionaryRepresentation:v12 context:v6];
  v14 = objc_msgSend(v7, "bs_safeObjectForKey:ofType:", @"configurations", objc_opt_class());

  id v15 = +[DNDSConfigurationsRecord newWithDictionaryRepresentation:v14 context:v6];
  uint64_t v16 = (void *)[objc_alloc((Class)a1) _initWithBehaviorSettings:v9 phoneCallBypassSettings:v11 scheduleSettings:v13 configurations:v15];

  return v16;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  id v7 = [(DNDSSettingsRecord *)self behaviorSettings];
  uint64_t v8 = [v7 dictionaryRepresentationWithContext:v5];

  [v6 setObject:v8 forKey:@"behaviorSettings"];
  id v9 = [(DNDSSettingsRecord *)self phoneCallBypassSettings];
  unint64_t v10 = [v9 dictionaryRepresentationWithContext:v5];

  [v6 setObject:v10 forKey:@"phoneCallBypassSettings"];
  id v11 = [(DNDSSettingsRecord *)self scheduleSettings];
  id v12 = [v11 dictionaryRepresentationWithContext:v5];

  [v6 setObject:v12 forKey:@"scheduleSettings"];
  id v13 = [(DNDSSettingsRecord *)self configurations];
  v14 = [v13 dictionaryRepresentationWithContext:v5];

  [v6 setObject:v14 forKey:@"configurations"];
  return v6;
}

- (DNDSBehaviorSettingsRecord)behaviorSettings
{
  return self->_behaviorSettings;
}

- (DNDSBypassSettingsRecord)phoneCallBypassSettings
{
  return self->_phoneCallBypassSettings;
}

- (DNDSScheduleSettingsRecord)scheduleSettings
{
  return self->_scheduleSettings;
}

- (DNDSConfigurationsRecord)configurations
{
  return self->_configurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_scheduleSettings, 0);
  objc_storeStrong((id *)&self->_phoneCallBypassSettings, 0);
  objc_storeStrong((id *)&self->_behaviorSettings, 0);
}

@end