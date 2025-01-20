@interface DNDSBypassSettingsRecord
+ (id)_recordWithEncodedInfo:(id)a3 error:(id *)a4;
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
+ (id)recordForLegacyPrivilegedSenderType:(unint64_t)a3 legacyAddressBookID:(int)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSBypassSettingsRecord)init;
- (NSNumber)immediateBypassEventSourceType;
- (NSNumber)repeatEventSourceBehaviorEnabledSetting;
- (NSString)description;
- (NSString)immediateBypassCNGroupIdentifier;
- (id)_initWithImmediateBypassEventSourceType:(id)a3 immediateBypassCNGroupIdentifier:(id)a4 repeatEventSourceBehaviorEnabledSetting:(id)a5;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)legacyPrivilegedSenderType;
@end

@implementation DNDSBypassSettingsRecord

- (DNDSBypassSettingsRecord)init
{
  return (DNDSBypassSettingsRecord *)[(DNDSBypassSettingsRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 immediateBypassEventSourceType];
  v6 = [v4 immediateBypassCNGroupIdentifier];
  v7 = [v4 repeatEventSourceBehaviorEnabledSetting];

  id v8 = [(DNDSBypassSettingsRecord *)self _initWithImmediateBypassEventSourceType:v5 immediateBypassCNGroupIdentifier:v6 repeatEventSourceBehaviorEnabledSetting:v7];
  return v8;
}

- (id)_initWithImmediateBypassEventSourceType:(id)a3 immediateBypassCNGroupIdentifier:(id)a4 repeatEventSourceBehaviorEnabledSetting:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DNDSBypassSettingsRecord;
  v11 = [(DNDSBypassSettingsRecord *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = &unk_1F2A5D820;
    }
    objc_storeStrong((id *)&v11->_immediateBypassEventSourceType, v14);

    uint64_t v15 = [v9 copy];
    immediateBypassCNGroupIdentifier = v11->_immediateBypassCNGroupIdentifier;
    v11->_immediateBypassCNGroupIdentifier = (NSString *)v15;

    uint64_t v17 = [v10 copy];
    v18 = (void *)v17;
    if (v17) {
      v19 = (void *)v17;
    }
    else {
      v19 = &unk_1F2A5D820;
    }
    objc_storeStrong((id *)&v11->_repeatEventSourceBehaviorEnabledSetting, v19);
  }
  return v11;
}

- (unint64_t)hash
{
  v3 = [(DNDSBypassSettingsRecord *)self immediateBypassEventSourceType];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSBypassSettingsRecord *)self immediateBypassCNGroupIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSBypassSettingsRecord *)self repeatEventSourceBehaviorEnabledSetting];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (DNDSBypassSettingsRecord *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      v7 = [(DNDSBypassSettingsRecord *)self immediateBypassEventSourceType];
      unint64_t v8 = [(DNDSBypassSettingsRecord *)v6 immediateBypassEventSourceType];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDSBypassSettingsRecord *)self immediateBypassEventSourceType];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_37;
        }
        id v10 = (void *)v9;
        v11 = [(DNDSBypassSettingsRecord *)v6 immediateBypassEventSourceType];
        if (!v11)
        {
          char v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v12 = [(DNDSBypassSettingsRecord *)self immediateBypassEventSourceType];
        v3 = [(DNDSBypassSettingsRecord *)v6 immediateBypassEventSourceType];
        if (![v12 isEqual:v3])
        {
          char v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
        v36 = v3;
        v37 = v12;
        v38 = v11;
        v39 = v10;
      }
      v14 = [(DNDSBypassSettingsRecord *)self immediateBypassCNGroupIdentifier];
      uint64_t v15 = [(DNDSBypassSettingsRecord *)v6 immediateBypassCNGroupIdentifier];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSBypassSettingsRecord *)self immediateBypassCNGroupIdentifier];
        if (v16)
        {
          uint64_t v17 = (void *)v16;
          v18 = [(DNDSBypassSettingsRecord *)v6 immediateBypassCNGroupIdentifier];
          if (v18)
          {
            v35 = v14;
            v19 = [(DNDSBypassSettingsRecord *)self immediateBypassCNGroupIdentifier];
            v3 = [(DNDSBypassSettingsRecord *)v6 immediateBypassCNGroupIdentifier];
            if ([v19 isEqual:v3])
            {
              v31 = v19;
              v32 = v18;
              v33 = v17;
LABEL_17:
              v20 = [(DNDSBypassSettingsRecord *)self repeatEventSourceBehaviorEnabledSetting];
              uint64_t v21 = [(DNDSBypassSettingsRecord *)v6 repeatEventSourceBehaviorEnabledSetting];
              if (v20 == (void *)v21)
              {

                char v13 = 1;
                v27 = v35;
              }
              else
              {
                v22 = (void *)v21;
                v34 = v3;
                uint64_t v23 = [(DNDSBypassSettingsRecord *)self repeatEventSourceBehaviorEnabledSetting];
                if (v23)
                {
                  v24 = (void *)v23;
                  v25 = [(DNDSBypassSettingsRecord *)v6 repeatEventSourceBehaviorEnabledSetting];
                  if (v25)
                  {
                    v30 = v25;
                    v29 = [(DNDSBypassSettingsRecord *)self repeatEventSourceBehaviorEnabledSetting];
                    v26 = [(DNDSBypassSettingsRecord *)v6 repeatEventSourceBehaviorEnabledSetting];
                    char v13 = [v29 isEqual:v26];

                    v25 = v30;
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
                v3 = v34;
                v27 = v35;
              }
              if (v27 != v15)
              {
              }
LABEL_34:
              v11 = v38;
              id v10 = v39;
              v3 = v36;
              uint64_t v12 = v37;
              if (v7 != v8) {
                goto LABEL_35;
              }
LABEL_37:

              goto LABEL_38;
            }

            v14 = v35;
          }
        }
        char v13 = 0;
        goto LABEL_34;
      }
      v35 = v14;
      goto LABEL_17;
    }
    char v13 = 0;
  }
LABEL_38:

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSBypassSettingsRecord *)self immediateBypassEventSourceType];
  uint64_t v6 = [(DNDSBypassSettingsRecord *)self immediateBypassCNGroupIdentifier];
  v7 = [(DNDSBypassSettingsRecord *)self repeatEventSourceBehaviorEnabledSetting];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; immediateBypassEventSourceType: %@; immediateBypassCNGroupIdentifier: '%@'; repeatEventSourceBehaviorEnabledSetting: %@>",
    v4,
    self,
    v5,
    v6,
  unint64_t v8 = v7);

  return (NSString *)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableBypassSettingsRecord alloc];
  return [(DNDSBypassSettingsRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"immediateBypassEventSourceType", objc_opt_class());
  v7 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"immediateBypassCNGroupIdentifier", objc_opt_class());
  unint64_t v8 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"repeatEventSourceBehaviorEnabledSetting", objc_opt_class());

  uint64_t v9 = (void *)[objc_alloc((Class)a1) _initWithImmediateBypassEventSourceType:v6 immediateBypassCNGroupIdentifier:v7 repeatEventSourceBehaviorEnabledSetting:v8];
  return v9;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v4 = [a3 healingSource];
  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  unint64_t v8 = v7;

  uint64_t v9 = [(DNDSBypassSettingsRecord *)self immediateBypassEventSourceType];
  [v8 setObject:v9 forKey:@"immediateBypassEventSourceType"];

  id v10 = [(DNDSBypassSettingsRecord *)self immediateBypassCNGroupIdentifier];
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v10, @"immediateBypassCNGroupIdentifier");

  v11 = [(DNDSBypassSettingsRecord *)self repeatEventSourceBehaviorEnabledSetting];
  [v8 setObject:v11 forKey:@"repeatEventSourceBehaviorEnabledSetting"];

  return v8;
}

- (NSNumber)immediateBypassEventSourceType
{
  return self->_immediateBypassEventSourceType;
}

- (NSString)immediateBypassCNGroupIdentifier
{
  return self->_immediateBypassCNGroupIdentifier;
}

- (NSNumber)repeatEventSourceBehaviorEnabledSetting
{
  return self->_repeatEventSourceBehaviorEnabledSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatEventSourceBehaviorEnabledSetting, 0);
  objc_storeStrong((id *)&self->_immediateBypassCNGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_immediateBypassEventSourceType, 0);
}

+ (id)_recordWithEncodedInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"privilegedSenderTypes", objc_opt_class());
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 unsignedIntegerValue];
    uint64_t v9 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"privilegedAddressBookGroupRecordID", objc_opt_class());
    id v10 = objc_msgSend(a1, "recordForLegacyPrivilegedSenderType:legacyAddressBookID:", v8, objc_msgSend(v9, "intValue"));
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)recordForLegacyPrivilegedSenderType:(unint64_t)a3 legacyAddressBookID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  char v5 = a3;
  uint64_t v6 = objc_alloc_init(DNDSMutableBypassSettingsRecord);
  if ((v5 & 0x10) != 0)
  {
    id v7 = 0;
    uint64_t v8 = 1;
  }
  else if (v5)
  {
    id v7 = 0;
    uint64_t v8 = 3;
  }
  else if ((v5 & 4) != 0)
  {
    id v7 = 0;
    uint64_t v8 = 4;
  }
  else if ((v5 & 2) != 0)
  {
    if (v4 == -1)
    {
      id v7 = 0;
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1BA00] predicateForiOSLegacyIdentifier:v4];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1B980]);
      [v10 requestAccessForEntityType:0 completionHandler:&__block_literal_global_26];
      v11 = [v10 groupsMatchingPredicate:v9 error:0];
      uint64_t v12 = [v11 firstObject];
      id v7 = [v12 identifier];

      uint64_t v13 = 5;
    }
    if (v7) {
      uint64_t v8 = v13;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    id v7 = 0;
    uint64_t v8 = 2;
  }
  if ((v5 & 8) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:v8];
  [(DNDSMutableBypassSettingsRecord *)v6 setImmediateBypassEventSourceType:v15];

  [(DNDSMutableBypassSettingsRecord *)v6 setImmediateBypassCNGroupIdentifier:v7];
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:v14];
  [(DNDSMutableBypassSettingsRecord *)v6 setRepeatEventSourceBehaviorEnabledSetting:v16];

  return v6;
}

- (unint64_t)legacyPrivilegedSenderType
{
  v3 = [(DNDSBypassSettingsRecord *)self immediateBypassEventSourceType];
  [v3 unsignedIntegerValue];
  uint64_t v4 = DNDResolvedImmediateBypassEventSourceType();

  if ((unint64_t)(v4 - 1) > 4) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = qword_1D3122118[v4 - 1];
  }
  uint64_t v6 = [(DNDSBypassSettingsRecord *)self repeatEventSourceBehaviorEnabledSetting];
  [v6 unsignedIntegerValue];
  uint64_t v7 = DNDResolvedRepeatEventSourceBehaviorEnabledSetting();

  if (v7 == 2) {
    return v5 | 8;
  }
  else {
    return v5;
  }
}

@end