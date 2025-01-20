@interface HDMCDeviceInfo
+ (id)deviceInfoFromStorageGroup:(id)a3;
+ (id)localDeviceInfoWithSettingsManager:(id)a3;
- (BOOL)fertileWindowNotificationsEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)menstruationNotificationsEnabled;
- (BOOL)someNotificationsEnabled;
- (HDMCDeviceInfo)initWithDayStreamProcessorAlgorithmVersion:(int64_t)a3 menstruationNotificationsEnabled:(BOOL)a4 fertileWindowNotificationsEnabled:(BOOL)a5;
- (id)description;
- (int64_t)dayStreamProcessorAlgorithmVersion;
- (unint64_t)hash;
@end

@implementation HDMCDeviceInfo

+ (id)localDeviceInfoWithSettingsManager:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = [v4 dayStreamProcessorAlgorithmVersion];
  uint64_t v7 = [v4 menstruationNotificationsEnabled];
  uint64_t v8 = [v4 fertileWindowNotificationsEnabled];

  v9 = (void *)[v5 initWithDayStreamProcessorAlgorithmVersion:v6 menstruationNotificationsEnabled:v7 fertileWindowNotificationsEnabled:v8];
  return v9;
}

+ (id)deviceInfoFromStorageGroup:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v24 = a3;
  v3 = [v24 storageEntries];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    v25 = 0;
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  v25 = 0;
  uint64_t v8 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v3);
      }
      v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      v11 = [v10 key];
      int v12 = [v11 isEqualToString:@"DayStreamProcessorAlgorithmVersion"];

      if (v12)
      {
        uint64_t v13 = [v10 numberValue:0];
        v14 = v6;
        uint64_t v6 = (void *)v13;
      }
      else
      {
        v15 = [v10 key];
        int v16 = [v15 isEqualToString:@"MenstruationNotificationsEnabled"];

        if (v16)
        {
          uint64_t v17 = [v10 numberValue:0];
          v14 = v7;
          uint64_t v7 = (void *)v17;
        }
        else
        {
          v18 = [v10 key];
          int v19 = [v18 isEqualToString:@"FertileWindowNotificationsEnabled"];

          if (!v19) {
            continue;
          }
          uint64_t v20 = [v10 numberValue:0];
          v14 = v25;
          v25 = (void *)v20;
        }
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v5);
LABEL_17:

  v21 = 0;
  if (v6)
  {
    v22 = v25;
    if (v7 && v25) {
      v21 = -[HDMCDeviceInfo initWithDayStreamProcessorAlgorithmVersion:menstruationNotificationsEnabled:fertileWindowNotificationsEnabled:]([HDMCDeviceInfo alloc], "initWithDayStreamProcessorAlgorithmVersion:menstruationNotificationsEnabled:fertileWindowNotificationsEnabled:", [v6 integerValue], objc_msgSend(v7, "BOOLValue"), objc_msgSend(v25, "BOOLValue"));
    }
  }
  else
  {
    v22 = v25;
  }

  return v21;
}

- (HDMCDeviceInfo)initWithDayStreamProcessorAlgorithmVersion:(int64_t)a3 menstruationNotificationsEnabled:(BOOL)a4 fertileWindowNotificationsEnabled:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HDMCDeviceInfo;
  result = [(HDMCDeviceInfo *)&v9 init];
  if (result)
  {
    result->_dayStreamProcessorAlgorithmVersion = a3;
    result->_menstruationNotificationsEnabled = a4;
    result->_fertileWindowNotificationsEnabled = a5;
  }
  return result;
}

- (BOOL)someNotificationsEnabled
{
  return self->_menstruationNotificationsEnabled || self->_fertileWindowNotificationsEnabled;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDMCDeviceInfo *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = self->_dayStreamProcessorAlgorithmVersion == v5->_dayStreamProcessorAlgorithmVersion
        && self->_menstruationNotificationsEnabled == v5->_menstruationNotificationsEnabled
        && self->_fertileWindowNotificationsEnabled == v5->_fertileWindowNotificationsEnabled;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_dayStreamProcessorAlgorithmVersion ^ self->_menstruationNotificationsEnabled ^ self->_fertileWindowNotificationsEnabled;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [NSNumber numberWithInteger:self->_dayStreamProcessorAlgorithmVersion];
  BOOL v6 = [NSNumber numberWithBool:self->_menstruationNotificationsEnabled];
  uint64_t v7 = [NSNumber numberWithBool:self->_fertileWindowNotificationsEnabled];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ alg:%@ periodNotifications:%@ fertileWindowNotifications:%@", v4, v5, v6, v7];

  return v8;
}

- (int64_t)dayStreamProcessorAlgorithmVersion
{
  return self->_dayStreamProcessorAlgorithmVersion;
}

- (BOOL)menstruationNotificationsEnabled
{
  return self->_menstruationNotificationsEnabled;
}

- (BOOL)fertileWindowNotificationsEnabled
{
  return self->_fertileWindowNotificationsEnabled;
}

@end