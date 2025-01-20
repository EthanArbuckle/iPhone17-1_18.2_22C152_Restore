@interface DNDSConfigurationRecord
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSConfigurationRecord)init;
- (NSNumber)allowIntelligentManagement;
- (NSNumber)applicationConfigurationType;
- (NSNumber)compatibilityVersion;
- (NSNumber)hideApplicationBadges;
- (NSNumber)minimumBreakthroughUrgency;
- (NSNumber)senderConfigurationType;
- (NSNumber)suppressionMode;
- (NSNumber)suppressionType;
- (NSString)description;
- (id)_initWithApplicationConfigurationType:(id)a3 senderConfigurationType:(id)a4 suppressionType:(id)a5 suppressionMode:(id)a6 minimumBreakthroughUrgency:(id)a7 hideApplicationBadges:(id)a8 allowIntelligentManagement:(id)a9 compatibilityVersion:(id)a10;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSConfigurationRecord

- (DNDSConfigurationRecord)init
{
  return (DNDSConfigurationRecord *)[(DNDSConfigurationRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 applicationConfigurationType];
  v6 = [v4 senderConfigurationType];
  v7 = [v4 suppressionType];
  v8 = [v4 suppressionMode];
  v9 = [v4 minimumBreakthroughUrgency];
  v10 = [v4 hideApplicationBadges];
  v11 = [v4 allowIntelligentManagement];
  v12 = [v4 compatibilityVersion];

  id v13 = [(DNDSConfigurationRecord *)self _initWithApplicationConfigurationType:v5 senderConfigurationType:v6 suppressionType:v7 suppressionMode:v8 minimumBreakthroughUrgency:v9 hideApplicationBadges:v10 allowIntelligentManagement:v11 compatibilityVersion:v12];
  return v13;
}

- (id)_initWithApplicationConfigurationType:(id)a3 senderConfigurationType:(id)a4 suppressionType:(id)a5 suppressionMode:(id)a6 minimumBreakthroughUrgency:(id)a7 hideApplicationBadges:(id)a8 allowIntelligentManagement:(id)a9 compatibilityVersion:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v55.receiver = self;
  v55.super_class = (Class)DNDSConfigurationRecord;
  v24 = [(DNDSConfigurationRecord *)&v55 init];
  if (v24)
  {
    id v54 = v16;
    v25 = (void *)[v16 copy];
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F5F5B8], "defaultConfigurationType"));
      v27 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    applicationConfigurationType = v24->_applicationConfigurationType;
    v24->_applicationConfigurationType = v27;

    v29 = (void *)[v17 copy];
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F5F5B8], "defaultConfigurationType"));
      v31 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    senderConfigurationType = v24->_senderConfigurationType;
    v24->_senderConfigurationType = v31;

    v33 = (void *)[v18 copy];
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F5F5B8], "defaultSuppressionType"));
      v35 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    suppressionType = v24->_suppressionType;
    v24->_suppressionType = v35;

    uint64_t v37 = [v19 copy];
    v38 = (void *)v37;
    if (v37) {
      v39 = (void *)v37;
    }
    else {
      v39 = &unk_1F2A5D958;
    }
    objc_storeStrong((id *)&v24->_suppressionMode, v39);

    v40 = (void *)[v20 copy];
    v41 = v40;
    if (v40)
    {
      v42 = v40;
    }
    else
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F5F5B8], "defaultMinimumBreakthroughUrgency"));
      v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    minimumBreakthroughUrgency = v24->_minimumBreakthroughUrgency;
    v24->_minimumBreakthroughUrgency = v42;

    uint64_t v44 = [v21 copy];
    v45 = (void *)v44;
    if (v44) {
      v46 = (void *)v44;
    }
    else {
      v46 = &unk_1F2A5D958;
    }
    objc_storeStrong((id *)&v24->_hideApplicationBadges, v46);

    uint64_t v47 = [v22 copy];
    v48 = (void *)v47;
    if (v47) {
      v49 = (void *)v47;
    }
    else {
      v49 = &unk_1F2A5D958;
    }
    objc_storeStrong((id *)&v24->_allowIntelligentManagement, v49);

    uint64_t v50 = [v23 copy];
    v51 = (void *)v50;
    if (v50) {
      v52 = (void *)v50;
    }
    else {
      v52 = &unk_1F2A5D970;
    }
    objc_storeStrong((id *)&v24->_compatibilityVersion, v52);

    id v16 = v54;
  }

  return v24;
}

- (unint64_t)hash
{
  v3 = [(DNDSConfigurationRecord *)self applicationConfigurationType];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSConfigurationRecord *)self senderConfigurationType];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSConfigurationRecord *)self minimumBreakthroughUrgency];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDSConfigurationRecord *)self suppressionType];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(DNDSConfigurationRecord *)self suppressionMode];
  uint64_t v12 = [v11 hash];
  id v13 = [(DNDSConfigurationRecord *)self hideApplicationBadges];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(DNDSConfigurationRecord *)self allowIntelligentManagement];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  id v17 = [(DNDSConfigurationRecord *)self compatibilityVersion];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSConfigurationRecord *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DNDSConfigurationRecord *)self applicationConfigurationType];
      v7 = [(DNDSConfigurationRecord *)v5 applicationConfigurationType];
      if (v6 != v7)
      {
        char v8 = 0;
LABEL_66:

        goto LABEL_67;
      }
      v9 = [(DNDSConfigurationRecord *)self senderConfigurationType];
      uint64_t v10 = [(DNDSConfigurationRecord *)v5 senderConfigurationType];
      if (v9 != v10)
      {
        char v8 = 0;
LABEL_65:

        goto LABEL_66;
      }
      v11 = [(DNDSConfigurationRecord *)self minimumBreakthroughUrgency];
      uint64_t v12 = [(DNDSConfigurationRecord *)v5 minimumBreakthroughUrgency];
      v82 = v11;
      if (v11 != v12)
      {
        uint64_t v13 = [(DNDSConfigurationRecord *)self minimumBreakthroughUrgency];
        if (!v13)
        {
          char v8 = 0;
          goto LABEL_64;
        }
        uint64_t v14 = (void *)v13;
        uint64_t v15 = [(DNDSConfigurationRecord *)v5 minimumBreakthroughUrgency];
        if (!v15)
        {
          char v8 = 0;
LABEL_63:

          goto LABEL_64;
        }
        v79 = (void *)v15;
        v11 = [(DNDSConfigurationRecord *)self minimumBreakthroughUrgency];
        v77 = [(DNDSConfigurationRecord *)v5 minimumBreakthroughUrgency];
        v78 = v11;
        if (!objc_msgSend(v11, "isEqual:"))
        {
          char v8 = 0;
LABEL_62:

          goto LABEL_63;
        }
        v76 = v14;
      }
      uint64_t v16 = [(DNDSConfigurationRecord *)self suppressionType];
      v80 = [(DNDSConfigurationRecord *)v5 suppressionType];
      v81 = (void *)v16;
      if ((void *)v16 != v80)
      {
        uint64_t v17 = [(DNDSConfigurationRecord *)self suppressionType];
        if (v17)
        {
          v74 = (void *)v17;
          uint64_t v18 = [(DNDSConfigurationRecord *)v5 suppressionType];
          if (v18)
          {
            v71 = (void *)v18;
            v11 = [(DNDSConfigurationRecord *)self suppressionType];
            id v19 = [(DNDSConfigurationRecord *)v5 suppressionType];
            if ([v11 isEqual:v19])
            {
              v67 = v19;
              goto LABEL_20;
            }
          }
        }

LABEL_60:
        char v8 = 0;
        goto LABEL_61;
      }
LABEL_20:
      id v20 = [(DNDSConfigurationRecord *)self suppressionMode];
      v75 = [(DNDSConfigurationRecord *)v5 suppressionMode];
      v72 = v11;
      v73 = v20;
      if (v20 == v75) {
        goto LABEL_27;
      }
      uint64_t v21 = [(DNDSConfigurationRecord *)self suppressionMode];
      if (v21)
      {
        v68 = (void *)v21;
        uint64_t v22 = [(DNDSConfigurationRecord *)v5 suppressionMode];
        if (v22)
        {
          v66 = (void *)v22;
          id v23 = [(DNDSConfigurationRecord *)self suppressionMode];
          v24 = [(DNDSConfigurationRecord *)v5 suppressionMode];
          if ([v23 isEqual:v24])
          {
            v63 = v24;
            v64 = v23;
LABEL_27:
            v25 = [(DNDSConfigurationRecord *)self hideApplicationBadges];
            [(DNDSConfigurationRecord *)v5 hideApplicationBadges];
            v70 = v69 = v25;
            if (v25 == v70) {
              goto LABEL_35;
            }
            uint64_t v26 = [(DNDSConfigurationRecord *)self hideApplicationBadges];
            if (v26)
            {
              v65 = (void *)v26;
              uint64_t v27 = [(DNDSConfigurationRecord *)v5 hideApplicationBadges];
              v28 = v73;
              if (!v27)
              {

                v46 = v75;
                goto LABEL_53;
              }
              v60 = (void *)v27;
              v29 = [(DNDSConfigurationRecord *)self hideApplicationBadges];
              v30 = [(DNDSConfigurationRecord *)v5 hideApplicationBadges];
              if ([v29 isEqual:v30])
              {
                v57 = v30;
                v58 = v29;
LABEL_35:
                v31 = [(DNDSConfigurationRecord *)self allowIntelligentManagement];
                uint64_t v32 = [(DNDSConfigurationRecord *)v5 allowIntelligentManagement];
                v33 = (void *)v32;
                if (v31 == (void *)v32)
                {
                  v61 = v31;
                  v62 = (void *)v32;
                  goto LABEL_46;
                }
                uint64_t v34 = [(DNDSConfigurationRecord *)self allowIntelligentManagement];
                if (v34)
                {
                  v59 = (void *)v34;
                  v61 = v31;
                  v62 = v33;
                  v35 = [(DNDSConfigurationRecord *)v5 allowIntelligentManagement];
                  v36 = v73;
                  if (v35)
                  {
                    id v56 = v35;
                    uint64_t v37 = [(DNDSConfigurationRecord *)self allowIntelligentManagement];
                    v38 = [(DNDSConfigurationRecord *)v5 allowIntelligentManagement];
                    if ([v37 isEqual:v38])
                    {
                      v53 = v38;
                      id v54 = v37;
LABEL_46:
                      v41 = [(DNDSConfigurationRecord *)self compatibilityVersion];
                      uint64_t v42 = [(DNDSConfigurationRecord *)v5 compatibilityVersion];
                      if (v41 == (void *)v42)
                      {

                        char v8 = 1;
                      }
                      else
                      {
                        objc_super v55 = (void *)v42;
                        uint64_t v43 = [(DNDSConfigurationRecord *)self compatibilityVersion];
                        if (v43)
                        {
                          v52 = (void *)v43;
                          uint64_t v44 = [(DNDSConfigurationRecord *)v5 compatibilityVersion];
                          if (v44)
                          {
                            v51 = v44;
                            uint64_t v50 = [(DNDSConfigurationRecord *)self compatibilityVersion];
                            v45 = [(DNDSConfigurationRecord *)v5 compatibilityVersion];
                            char v8 = objc_msgSend(v50, "isEqual:");

                            uint64_t v44 = v51;
                          }
                          else
                          {
                            char v8 = 0;
                          }
                        }
                        else
                        {

                          char v8 = 0;
                        }
                      }
                      if (v61 != v62)
                      {
                      }
                      if (v69 != v70)
                      {
                      }
                      if (v73 != v75)
                      {
                      }
                      if (v81 != v80)
                      {
                      }
LABEL_61:
                      uint64_t v14 = v76;
                      if (v82 != v12) {
                        goto LABEL_62;
                      }
LABEL_64:

                      goto LABEL_65;
                    }

                    v35 = v56;
                    v36 = v73;
                  }

                  v48 = v69;
                  v49 = v70;
                  if (v69 == v70) {
                    goto LABEL_74;
                  }
                }
                else
                {

                  v48 = v69;
                  v49 = v70;
                  v36 = v73;
                  if (v69 == v70) {
                    goto LABEL_74;
                  }
                }

LABEL_74:
                if (v36 != v75)
                {
                }
                v39 = v81;
                if (v81 != v80)
                {
                }
                goto LABEL_59;
              }
            }
            v46 = v75;
            v28 = v73;
LABEL_53:
            if (v28 == v46)
            {
            }
            else
            {
            }
            v40 = v80;
            v39 = v81;
            if (v81 == v80) {
              goto LABEL_58;
            }
            goto LABEL_57;
          }

LABEL_43:
          v40 = v80;
          v39 = v81;
          if (v81 == v80)
          {

LABEL_59:
            goto LABEL_60;
          }
LABEL_57:

LABEL_58:
          goto LABEL_59;
        }
      }
      goto LABEL_43;
    }
    char v8 = 0;
  }
LABEL_67:

  return v8;
}

- (NSString)description
{
  uint64_t v18 = NSString;
  uint64_t v17 = objc_opt_class();
  uint64_t v21 = [(DNDSConfigurationRecord *)self applicationConfigurationType];
  [v21 unsignedIntegerValue];
  uint64_t v15 = DNDStringFromConfigurationType();
  id v20 = [(DNDSConfigurationRecord *)self senderConfigurationType];
  [v20 unsignedIntegerValue];
  uint64_t v22 = DNDStringFromConfigurationType();
  id v19 = [(DNDSConfigurationRecord *)self suppressionType];
  [v19 unsignedIntegerValue];
  uint64_t v12 = DNDStringFromInterruptionSuppression();
  uint64_t v16 = [(DNDSConfigurationRecord *)self suppressionMode];
  [v16 unsignedIntegerValue];
  uint64_t v13 = DNDStringFromInterruptionSuppressionMode();
  uint64_t v14 = [(DNDSConfigurationRecord *)self minimumBreakthroughUrgency];
  [v14 unsignedIntegerValue];
  v3 = DNDStringFromBreakthroughUrgency();
  uint64_t v4 = [(DNDSConfigurationRecord *)self hideApplicationBadges];
  [v4 unsignedIntegerValue];
  v5 = DNDEnabledSettingToString();
  uint64_t v6 = [(DNDSConfigurationRecord *)self allowIntelligentManagement];
  [v6 unsignedIntegerValue];
  v7 = DNDEnabledSettingToString();
  char v8 = [(DNDSConfigurationRecord *)self compatibilityVersion];
  [v8 integerValue];
  v9 = DNDCompatibilityVersionToString();
  objc_msgSend(v18, "stringWithFormat:", @"<%@: %p; applicationConfigurationType: %@; senderConfigurationType: %@; suppressionType: %@; suppressionMode: %@; minimumBreakthroughUrgency: %@; hideApplicationBadges: %@; allowIntelligentManagement: %@; compatibilityVersion: %@>",
    v17,
    self,
    v15,
    v22,
    v12,
    v13,
    v3,
    v5,
    v7,
  uint64_t v10 = v9);

  return (NSString *)v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableConfigurationRecord alloc];
  return [(DNDSConfigurationRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"applicationConfigurationType", objc_opt_class());
  char v8 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"senderConfigurationType", objc_opt_class());
  v9 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"suppressionType", objc_opt_class());
  uint64_t v10 = objc_msgSend(v6, "bs_safeNumberForKey:", @"suppressionMode");
  v11 = [v7 currentRecord];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v13 = [v7 currentRecord];
    uint64_t v14 = [v13 suppressionMode];

    uint64_t v10 = (void *)v14;
  }
  uint64_t v15 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"minimumBreakthroughUrgency", objc_opt_class());
  uint64_t v16 = objc_msgSend(v6, "bs_safeNumberForKey:", @"hideApplicationBadges");
  uint64_t v17 = objc_msgSend(v6, "bs_safeNumberForKey:", @"allowIntelligentManagement");
  uint64_t v18 = objc_msgSend(v6, "bs_safeNumberForKey:", @"compatibilityVersion");
  id v19 = (void *)[objc_alloc((Class)a1) _initWithApplicationConfigurationType:v21 senderConfigurationType:v8 suppressionType:v9 suppressionMode:v10 minimumBreakthroughUrgency:v15 hideApplicationBadges:v16 allowIntelligentManagement:v17 compatibilityVersion:v18];

  return v19;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v4 = [a3 healingSource];
  id v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  char v8 = v7;

  v9 = [(DNDSConfigurationRecord *)self applicationConfigurationType];
  [v8 setObject:v9 forKey:@"applicationConfigurationType"];

  uint64_t v10 = [(DNDSConfigurationRecord *)self senderConfigurationType];
  [v8 setObject:v10 forKey:@"senderConfigurationType"];

  v11 = [(DNDSConfigurationRecord *)self suppressionType];
  [v8 setObject:v11 forKey:@"suppressionType"];

  uint64_t v12 = [(DNDSConfigurationRecord *)self suppressionMode];
  [v8 setObject:v12 forKey:@"suppressionMode"];

  uint64_t v13 = [(DNDSConfigurationRecord *)self minimumBreakthroughUrgency];
  [v8 setObject:v13 forKey:@"minimumBreakthroughUrgency"];

  uint64_t v14 = [(DNDSConfigurationRecord *)self hideApplicationBadges];
  [v8 setObject:v14 forKey:@"hideApplicationBadges"];

  uint64_t v15 = [(DNDSConfigurationRecord *)self allowIntelligentManagement];
  [v8 setObject:v15 forKey:@"allowIntelligentManagement"];

  uint64_t v16 = [(DNDSConfigurationRecord *)self compatibilityVersion];
  [v8 setObject:v16 forKey:@"compatibilityVersion"];

  return v8;
}

- (NSNumber)applicationConfigurationType
{
  return self->_applicationConfigurationType;
}

- (NSNumber)senderConfigurationType
{
  return self->_senderConfigurationType;
}

- (NSNumber)suppressionType
{
  return self->_suppressionType;
}

- (NSNumber)suppressionMode
{
  return self->_suppressionMode;
}

- (NSNumber)minimumBreakthroughUrgency
{
  return self->_minimumBreakthroughUrgency;
}

- (NSNumber)hideApplicationBadges
{
  return self->_hideApplicationBadges;
}

- (NSNumber)allowIntelligentManagement
{
  return self->_allowIntelligentManagement;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_allowIntelligentManagement, 0);
  objc_storeStrong((id *)&self->_hideApplicationBadges, 0);
  objc_storeStrong((id *)&self->_minimumBreakthroughUrgency, 0);
  objc_storeStrong((id *)&self->_suppressionMode, 0);
  objc_storeStrong((id *)&self->_suppressionType, 0);
  objc_storeStrong((id *)&self->_senderConfigurationType, 0);
  objc_storeStrong((id *)&self->_applicationConfigurationType, 0);
}

@end