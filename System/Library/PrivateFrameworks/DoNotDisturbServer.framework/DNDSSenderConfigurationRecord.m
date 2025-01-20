@interface DNDSSenderConfigurationRecord
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSBypassSettingsRecord)phoneCallBypassSettings;
- (DNDSSenderConfigurationRecord)init;
- (NSSet)allowedContactGroups;
- (NSSet)allowedContactTypes;
- (NSSet)allowedContacts;
- (NSSet)deniedContactGroups;
- (NSSet)deniedContactTypes;
- (NSSet)deniedContacts;
- (NSString)description;
- (id)_initWithAllowedContactTypes:(id)a3 deniedContactTypes:(id)a4 allowedContactGroups:(id)a5 deniedContactGroups:(id)a6 allowedContacts:(id)a7 deniedContacts:(id)a8 phoneCallBypassSettings:(id)a9;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSSenderConfigurationRecord

- (DNDSSenderConfigurationRecord)init
{
  return (DNDSSenderConfigurationRecord *)[(DNDSSenderConfigurationRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 allowedContactTypes];
  v6 = [v4 deniedContactTypes];
  v7 = [v4 allowedContactGroups];
  v8 = [v4 deniedContactGroups];
  v9 = [v4 allowedContacts];
  v10 = [v4 deniedContacts];
  v11 = [v4 phoneCallBypassSettings];

  id v12 = [(DNDSSenderConfigurationRecord *)self _initWithAllowedContactTypes:v5 deniedContactTypes:v6 allowedContactGroups:v7 deniedContactGroups:v8 allowedContacts:v9 deniedContacts:v10 phoneCallBypassSettings:v11];
  return v12;
}

- (id)_initWithAllowedContactTypes:(id)a3 deniedContactTypes:(id)a4 allowedContactGroups:(id)a5 deniedContactGroups:(id)a6 allowedContacts:(id)a7 deniedContacts:(id)a8 phoneCallBypassSettings:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v50.receiver = self;
  v50.super_class = (Class)DNDSSenderConfigurationRecord;
  v22 = [(DNDSSenderConfigurationRecord *)&v50 init];
  if (v22)
  {
    v23 = (void *)[v15 copy];
    v24 = v23;
    if (v23) {
      v25 = v23;
    }
    else {
      v25 = (NSSet *)objc_opt_new();
    }
    allowedContactTypes = v22->_allowedContactTypes;
    v22->_allowedContactTypes = v25;

    v27 = (void *)[v16 copy];
    v28 = v27;
    if (v27) {
      v29 = v27;
    }
    else {
      v29 = (NSSet *)objc_opt_new();
    }
    deniedContactTypes = v22->_deniedContactTypes;
    v22->_deniedContactTypes = v29;

    v31 = (void *)[v17 copy];
    v32 = v31;
    if (v31) {
      v33 = v31;
    }
    else {
      v33 = (NSSet *)objc_opt_new();
    }
    allowedContactGroups = v22->_allowedContactGroups;
    v22->_allowedContactGroups = v33;

    v35 = (void *)[v18 copy];
    v36 = v35;
    if (v35) {
      v37 = v35;
    }
    else {
      v37 = (NSSet *)objc_opt_new();
    }
    deniedContactGroups = v22->_deniedContactGroups;
    v22->_deniedContactGroups = v37;

    v39 = (void *)[v19 copy];
    v40 = v39;
    if (v39) {
      v41 = v39;
    }
    else {
      v41 = (NSSet *)objc_opt_new();
    }
    allowedContacts = v22->_allowedContacts;
    v22->_allowedContacts = v41;

    v43 = (void *)[v20 copy];
    v44 = v43;
    if (v43) {
      v45 = v43;
    }
    else {
      v45 = (NSSet *)objc_opt_new();
    }
    deniedContacts = v22->_deniedContacts;
    v22->_deniedContacts = v45;

    uint64_t v47 = [v21 copy];
    phoneCallBypassSettings = v22->_phoneCallBypassSettings;
    v22->_phoneCallBypassSettings = (DNDSBypassSettingsRecord *)v47;
  }
  return v22;
}

- (unint64_t)hash
{
  v3 = [(DNDSSenderConfigurationRecord *)self allowedContactTypes];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSSenderConfigurationRecord *)self deniedContactTypes];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSSenderConfigurationRecord *)self allowedContactGroups];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDSSenderConfigurationRecord *)self deniedContactGroups];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(DNDSSenderConfigurationRecord *)self allowedContacts];
  uint64_t v12 = [v11 hash];
  v13 = [(DNDSSenderConfigurationRecord *)self deniedContacts];
  uint64_t v14 = v10 ^ v12 ^ [v13 hash];
  unint64_t v15 = v14 ^ [(DNDSBypassSettingsRecord *)self->_phoneCallBypassSettings hash];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSSenderConfigurationRecord *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(DNDSSenderConfigurationRecord *)self allowedContactTypes];
      v7 = [(DNDSSenderConfigurationRecord *)v5 allowedContactTypes];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDSSenderConfigurationRecord *)self allowedContactTypes];
        if (!v8)
        {
          char v13 = 0;
          goto LABEL_86;
        }
        v9 = (void *)v8;
        uint64_t v10 = [(DNDSSenderConfigurationRecord *)v5 allowedContactTypes];
        if (!v10)
        {
          char v13 = 0;
LABEL_85:

          goto LABEL_86;
        }
        v11 = [(DNDSSenderConfigurationRecord *)self allowedContactTypes];
        uint64_t v12 = [(DNDSSenderConfigurationRecord *)v5 allowedContactTypes];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_84:

          goto LABEL_85;
        }
        v85 = v9;
        v86 = v12;
        v87 = v11;
        v88 = v10;
      }
      uint64_t v14 = [(DNDSSenderConfigurationRecord *)self deniedContactTypes];
      unint64_t v15 = [(DNDSSenderConfigurationRecord *)v5 deniedContactTypes];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSSenderConfigurationRecord *)self deniedContactTypes];
        if (v16)
        {
          id v17 = (void *)v16;
          v89 = v14;
          uint64_t v18 = [(DNDSSenderConfigurationRecord *)v5 deniedContactTypes];
          if (v18)
          {
            id v19 = (void *)v18;
            uint64_t v14 = [(DNDSSenderConfigurationRecord *)self deniedContactTypes];
            id v20 = [(DNDSSenderConfigurationRecord *)v5 deniedContactTypes];
            if ([v14 isEqual:v20])
            {
              v80 = v17;
              v81 = v20;
              v83 = v14;
              v79 = v19;
              goto LABEL_17;
            }
          }
        }
        else
        {
        }
LABEL_82:
        char v13 = 0;
        goto LABEL_83;
      }
      v89 = v14;
LABEL_17:
      id v21 = [(DNDSSenderConfigurationRecord *)self allowedContactGroups];
      v22 = [(DNDSSenderConfigurationRecord *)v5 allowedContactGroups];
      if (v21 == v22) {
        goto LABEL_25;
      }
      uint64_t v23 = [(DNDSSenderConfigurationRecord *)self allowedContactGroups];
      if (v23)
      {
        v82 = (void *)v23;
        uint64_t v24 = [(DNDSSenderConfigurationRecord *)v5 allowedContactGroups];
        if (v24)
        {
          v78 = (void *)v24;
          v25 = [(DNDSSenderConfigurationRecord *)self allowedContactGroups];
          uint64_t v14 = [(DNDSSenderConfigurationRecord *)v5 allowedContactGroups];
          if ([v25 isEqual:v14])
          {
            v74 = v25;
LABEL_25:
            v26 = [(DNDSSenderConfigurationRecord *)self deniedContactGroups];
            v84 = [(DNDSSenderConfigurationRecord *)v5 deniedContactGroups];
            if (v26 != v84)
            {
              uint64_t v27 = [(DNDSSenderConfigurationRecord *)self deniedContactGroups];
              if (!v27)
              {

                if (v21 == v22)
                {
                }
                else
                {
                }
                v38 = v89;
                v51 = v83;
                if (v89 == v15) {
                  goto LABEL_80;
                }
                goto LABEL_71;
              }
              v73 = (void *)v27;
              uint64_t v28 = [(DNDSSenderConfigurationRecord *)v5 deniedContactGroups];
              if (v28)
              {
                v76 = v14;
                v77 = v21;
                v71 = (void *)v28;
                v29 = [(DNDSSenderConfigurationRecord *)self deniedContactGroups];
                id v21 = [(DNDSSenderConfigurationRecord *)v5 deniedContactGroups];
                if ([v29 isEqual:v21])
                {
                  v67 = v21;
                  v68 = v29;
                  goto LABEL_33;
                }

                if (v77 == v22)
                {
                }
                else
                {
                }
              }
              else
              {

                if (v21 == v22)
                {
                }
                else
                {
                }
              }
              v38 = v89;
              if (v89 == v15)
              {
LABEL_80:

                goto LABEL_81;
              }
              goto LABEL_78;
            }
            v76 = v14;
            v77 = v21;
LABEL_33:
            uint64_t v30 = [(DNDSSenderConfigurationRecord *)self allowedContacts];
            uint64_t v31 = [(DNDSSenderConfigurationRecord *)v5 allowedContacts];
            v75 = (void *)v30;
            BOOL v32 = v30 == v31;
            v33 = (void *)v31;
            if (v32)
            {
              v72 = (void *)v31;
LABEL_45:
              uint64_t v39 = [(DNDSSenderConfigurationRecord *)self deniedContacts];
              v70 = [(DNDSSenderConfigurationRecord *)v5 deniedContacts];
              if ((void *)v39 == v70)
              {
                v64 = (void *)v39;
                v65 = v21;
                goto LABEL_55;
              }
              uint64_t v40 = [(DNDSSenderConfigurationRecord *)self deniedContacts];
              if (v40)
              {
                v63 = (void *)v40;
                v41 = [(DNDSSenderConfigurationRecord *)v5 deniedContacts];
                if (v41)
                {
                  v65 = v21;
                  id v61 = v41;
                  uint64_t v42 = [(DNDSSenderConfigurationRecord *)self deniedContacts];
                  uint64_t v43 = [(DNDSSenderConfigurationRecord *)v5 deniedContacts];
                  v60 = (void *)v42;
                  v44 = (void *)v42;
                  v45 = (void *)v43;
                  if ([v44 isEqual:v43])
                  {
                    v58 = v45;
                    v64 = (void *)v39;
LABEL_55:
                    v46 = [(DNDSSenderConfigurationRecord *)self phoneCallBypassSettings];
                    uint64_t v47 = [(DNDSSenderConfigurationRecord *)v5 phoneCallBypassSettings];
                    if (v46 == (void *)v47)
                    {

                      char v13 = 1;
                    }
                    else
                    {
                      v59 = (void *)v47;
                      uint64_t v48 = [(DNDSSenderConfigurationRecord *)self phoneCallBypassSettings];
                      if (v48)
                      {
                        v57 = (void *)v48;
                        v49 = [(DNDSSenderConfigurationRecord *)v5 phoneCallBypassSettings];
                        if (v49)
                        {
                          v56 = v49;
                          v55 = [(DNDSSenderConfigurationRecord *)self phoneCallBypassSettings];
                          objc_super v50 = [(DNDSSenderConfigurationRecord *)v5 phoneCallBypassSettings];
                          char v13 = [v55 isEqual:v50];

                          v49 = v56;
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
                    if (v64 != v70)
                    {
                    }
                    if (v75 != v72)
                    {
                    }
                    if (v26 != v84)
                    {
                    }
                    if (v77 != v22)
                    {
                    }
                    if (v89 != v15)
                    {
                    }
LABEL_83:
                    v11 = v87;
                    uint64_t v10 = v88;
                    v9 = v85;
                    uint64_t v12 = v86;
                    if (v6 != v7) {
                      goto LABEL_84;
                    }
LABEL_86:

                    goto LABEL_87;
                  }

                  v41 = v61;
                  id v21 = v65;
                }
                v52 = (void *)v39;
                v53 = v21;
              }
              else
              {
                v52 = (void *)v39;
                v53 = v21;
              }

              if (v75 != v72)
              {
              }
              if (v26 != v84)
              {
              }
              if (v77 != v22)
              {
              }
              v38 = v89;
              if (v89 == v15) {
                goto LABEL_80;
              }
              goto LABEL_78;
            }
            uint64_t v34 = [(DNDSSenderConfigurationRecord *)self allowedContacts];
            if (v34)
            {
              v69 = (void *)v34;
              uint64_t v35 = [(DNDSSenderConfigurationRecord *)v5 allowedContacts];
              if (v35)
              {
                v72 = v33;
                v66 = (void *)v35;
                v36 = [(DNDSSenderConfigurationRecord *)self allowedContacts];
                v37 = [(DNDSSenderConfigurationRecord *)v5 allowedContacts];
                if ([v36 isEqual:v37])
                {
                  v62 = v36;
                  id v21 = v37;
                  goto LABEL_45;
                }

                goto LABEL_65;
              }
            }
LABEL_65:

            if (v26 == v84)
            {
            }
            else
            {
            }
            v51 = v83;
            if (v77 != v22)
            {
            }
            v38 = v89;
            if (v89 == v15) {
              goto LABEL_80;
            }
LABEL_71:

LABEL_79:
            goto LABEL_80;
          }
        }
      }

      v38 = v89;
      if (v89 == v15)
      {

LABEL_81:
        goto LABEL_82;
      }
LABEL_78:

      goto LABEL_79;
    }
    char v13 = 0;
  }
LABEL_87:

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSSenderConfigurationRecord *)self allowedContactTypes];
  uint64_t v6 = [(DNDSSenderConfigurationRecord *)self deniedContactTypes];
  v7 = [(DNDSSenderConfigurationRecord *)self allowedContactGroups];
  uint64_t v8 = [(DNDSSenderConfigurationRecord *)self deniedContactGroups];
  v9 = [(DNDSSenderConfigurationRecord *)self allowedContacts];
  uint64_t v10 = [(DNDSSenderConfigurationRecord *)self deniedContacts];
  v11 = [(DNDSSenderConfigurationRecord *)self phoneCallBypassSettings];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; allowedContactTypes: %@; ; deniedContactTypes: %@; ; allowedContactGroups: %@; ; deniedContactGroups: %@; ; allowedContacts: %@; ; deniedContacts: %@; ; phoneCallBypassSettings: %@; >",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  uint64_t v12 = v11);

  return (NSString *)v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableSenderConfigurationRecord alloc];
  return [(DNDSSenderConfigurationRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_msgSend(v5, "bs_safeArrayForKey:", @"allowedContactTypes");
  uint64_t v43 = [v7 setWithArray:v8];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_msgSend(v5, "bs_safeArrayForKey:", @"deniedContactTypes");
  uint64_t v42 = [v9 setWithArray:v10];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_msgSend(v5, "bs_safeArrayForKey:", @"allowedContactGroups");
  uint64_t v39 = [v11 setWithArray:v12];

  char v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_msgSend(v5, "bs_safeArrayForKey:", @"deniedContactGroups");
  v38 = [v13 setWithArray:v14];

  unint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_msgSend(v5, "bs_safeArrayForKey:", @"allowedContacts");
  id v17 = [v15 setWithArray:v16];

  uint64_t v18 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v50;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v50 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = +[DNDSContactRecord newWithDictionaryRepresentation:*(void *)(*((void *)&v49 + 1) + 8 * v23) context:v6];
        [v18 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v21);
  }

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  v44 = v5;
  v26 = objc_msgSend(v5, "bs_safeArrayForKey:", @"silencedContacts");
  uint64_t v27 = [v25 setWithArray:v26];

  uint64_t v28 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v29 = v27;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v46;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = +[DNDSContactRecord newWithDictionaryRepresentation:*(void *)(*((void *)&v45 + 1) + 8 * v33) context:v6];
        [v28 addObject:v34];

        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v31);
  }

  uint64_t v35 = objc_msgSend(v44, "bs_safeDictionaryForKey:", @"phoneCallBypassSettings");
  id v36 = +[DNDSBypassSettingsRecord newWithDictionaryRepresentation:v35 context:v6];
  Class v41 = (Class)[objc_alloc((Class)a1) _initWithAllowedContactTypes:v43 deniedContactTypes:v42 allowedContactGroups:v39 deniedContactGroups:v38 allowedContacts:v18 deniedContacts:v28 phoneCallBypassSettings:v36];

  return v41;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 healingSource];
  id v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v9 = v8;

  uint64_t v10 = [(DNDSSenderConfigurationRecord *)self allowedContactTypes];
  v11 = [v10 allObjects];
  objc_msgSend(v9, "bs_setSafeObject:forKey:", v11, @"allowedContactTypes");

  uint64_t v12 = [(DNDSSenderConfigurationRecord *)self deniedContactTypes];
  char v13 = [v12 allObjects];
  objc_msgSend(v9, "bs_setSafeObject:forKey:", v13, @"deniedContactTypes");

  uint64_t v14 = [(DNDSSenderConfigurationRecord *)self allowedContactGroups];
  unint64_t v15 = [v14 allObjects];
  objc_msgSend(v9, "bs_setSafeObject:forKey:", v15, @"allowedContactGroups");

  uint64_t v16 = [(DNDSSenderConfigurationRecord *)self deniedContactGroups];
  id v17 = [v16 allObjects];
  objc_msgSend(v9, "bs_setSafeObject:forKey:", v17, @"deniedContactGroups");

  if ([v4 redactSensitiveData])
  {
    [v9 setObject:0 forKeyedSubscript:@"allowedContacts"];
    [v9 setObject:0 forKeyedSubscript:@"silencedContacts"];
  }
  else
  {
    uint64_t v18 = (void *)[v4 mutableCopy];
    id v19 = [v4 healingSource];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"allowedContacts"];
    [v18 setArrayHealingSource:v20];

    uint64_t v21 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v22 = [(DNDSSenderConfigurationRecord *)self allowedContacts];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v48 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = [*(id *)(*((void *)&v47 + 1) + 8 * i) dictionaryRepresentationWithContext:v18];
          [v21 addObject:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v24);
    }

    uint64_t v28 = [v21 allObjects];
    objc_msgSend(v9, "bs_setSafeObject:forKey:", v28, @"allowedContacts");

    id v42 = v4;
    id v29 = [v4 healingSource];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"silencedContacts"];
    [v18 setArrayHealingSource:v30];

    uint64_t v31 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v32 = [(DNDSSenderConfigurationRecord *)self deniedContacts];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v43 + 1) + 8 * j) dictionaryRepresentationWithContext:v18];
          [v31 addObject:v37];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v34);
    }

    v38 = [v31 allObjects];
    objc_msgSend(v9, "bs_setSafeObject:forKey:", v38, @"silencedContacts");

    id v4 = v42;
  }
  uint64_t v39 = [(DNDSSenderConfigurationRecord *)self phoneCallBypassSettings];

  if (v39)
  {
    uint64_t v40 = [(DNDSSenderConfigurationRecord *)self phoneCallBypassSettings];
    [v9 setDictionaryRepresentationOfRecord:v40 forKey:@"phoneCallBypassSettings" context:v4];
  }
  return v9;
}

- (NSSet)allowedContactTypes
{
  return self->_allowedContactTypes;
}

- (NSSet)deniedContactTypes
{
  return self->_deniedContactTypes;
}

- (NSSet)allowedContactGroups
{
  return self->_allowedContactGroups;
}

- (NSSet)deniedContactGroups
{
  return self->_deniedContactGroups;
}

- (NSSet)allowedContacts
{
  return self->_allowedContacts;
}

- (NSSet)deniedContacts
{
  return self->_deniedContacts;
}

- (DNDSBypassSettingsRecord)phoneCallBypassSettings
{
  return self->_phoneCallBypassSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneCallBypassSettings, 0);
  objc_storeStrong((id *)&self->_deniedContacts, 0);
  objc_storeStrong((id *)&self->_allowedContacts, 0);
  objc_storeStrong((id *)&self->_deniedContactGroups, 0);
  objc_storeStrong((id *)&self->_allowedContactGroups, 0);
  objc_storeStrong((id *)&self->_deniedContactTypes, 0);
  objc_storeStrong((id *)&self->_allowedContactTypes, 0);
}

@end