@interface DNDSBehaviorSettingsRecord
+ (id)_recordWithEncodedInfo:(id)a3 error:(id *)a4;
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSBehaviorSettingsRecord)init;
- (NSNumber)interruptionBehaviorSetting;
- (NSString)description;
- (id)_initWithInterruptionBehaviorSetting:(id)a3;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSBehaviorSettingsRecord

- (DNDSBehaviorSettingsRecord)init
{
  return (DNDSBehaviorSettingsRecord *)[(DNDSBehaviorSettingsRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  v4 = [a3 interruptionBehaviorSetting];
  id v5 = [(DNDSBehaviorSettingsRecord *)self _initWithInterruptionBehaviorSetting:v4];

  return v5;
}

- (id)_initWithInterruptionBehaviorSetting:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DNDSBehaviorSettingsRecord;
  id v5 = [(DNDSBehaviorSettingsRecord *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = &unk_1F2A5D808;
    }
    objc_storeStrong((id *)&v5->_interruptionBehaviorSetting, v8);
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(DNDSBehaviorSettingsRecord *)self interruptionBehaviorSetting];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSBehaviorSettingsRecord *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(DNDSBehaviorSettingsRecord *)self interruptionBehaviorSetting];
      v7 = [(DNDSBehaviorSettingsRecord *)v5 interruptionBehaviorSetting];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        v8 = [(DNDSBehaviorSettingsRecord *)self interruptionBehaviorSetting];
        if (v8)
        {
          v9 = [(DNDSBehaviorSettingsRecord *)v5 interruptionBehaviorSetting];
          if (v9)
          {
            objc_super v10 = [(DNDSBehaviorSettingsRecord *)self interruptionBehaviorSetting];
            v11 = [(DNDSBehaviorSettingsRecord *)v5 interruptionBehaviorSetting];
            char v12 = [v10 isEqual:v11];
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(DNDSBehaviorSettingsRecord *)self interruptionBehaviorSetting];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; interruptionBehaviorSetting: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableBehaviorSettingsRecord alloc];
  return [(DNDSBehaviorSettingsRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"interruptionBehaviorSetting", objc_opt_class());

  v7 = (void *)[objc_alloc((Class)a1) _initWithInterruptionBehaviorSetting:v6];
  return v7;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  id v5 = [(DNDSBehaviorSettingsRecord *)self interruptionBehaviorSetting];
  [v4 setObject:v5 forKey:@"interruptionBehaviorSetting"];

  return v4;
}

- (NSNumber)interruptionBehaviorSetting
{
  return self->_interruptionBehaviorSetting;
}

- (void).cxx_destruct
{
}

+ (id)_recordWithEncodedInfo:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init(DNDSMutableBehaviorSettingsRecord);
  uint64_t v6 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"effectiveWhileUnlocked", objc_opt_class());

  if ([v6 BOOLValue]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  v8 = [NSNumber numberWithUnsignedInteger:v7];
  [(DNDSMutableBehaviorSettingsRecord *)v5 setInterruptionBehaviorSetting:v8];

  return v5;
}

@end