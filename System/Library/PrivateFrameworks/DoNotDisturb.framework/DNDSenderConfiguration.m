@interface DNDSenderConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDBypassSettings)phoneCallBypassSettings;
- (DNDSenderConfiguration)init;
- (DNDSenderConfiguration)initWithCoder:(id)a3;
- (NSSet)allowedContactGroups;
- (NSSet)allowedContactTypes;
- (NSSet)allowedContacts;
- (NSSet)deniedContactGroups;
- (NSSet)deniedContactTypes;
- (NSSet)deniedContacts;
- (id)_descriptionForRedacted:(BOOL)a3;
- (id)_evaluatedBypassSettings:(id)a3;
- (id)_initWithAllowedContactTypes:(id)a3 deniedContactTypes:(id)a4 allowedContactGroups:(id)a5 deniedContactGroups:(id)a6 allowedContacts:(id)a7 deniedContacts:(id)a8 phoneCallBypassSettings:(id)a9;
- (id)_redactedDescriptionsForContacts:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDSenderConfiguration

- (DNDSenderConfiguration)init
{
  return (DNDSenderConfiguration *)[(DNDSenderConfiguration *)self _initWithAllowedContactTypes:0 deniedContactTypes:0 allowedContactGroups:0 deniedContactGroups:0 allowedContacts:0 deniedContacts:0 phoneCallBypassSettings:0];
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
  v50.super_class = (Class)DNDSenderConfiguration;
  v22 = [(DNDSenderConfiguration *)&v50 init];
  if (v22)
  {
    v23 = (void *)[v15 mutableCopy];
    v24 = v23;
    if (v23) {
      v25 = v23;
    }
    else {
      v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    allowedContactTypes = v22->_allowedContactTypes;
    v22->_allowedContactTypes = v25;

    v27 = (void *)[v16 mutableCopy];
    v28 = v27;
    if (v27) {
      v29 = v27;
    }
    else {
      v29 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    deniedContactTypes = v22->_deniedContactTypes;
    v22->_deniedContactTypes = v29;

    v31 = (void *)[v17 mutableCopy];
    v32 = v31;
    if (v31) {
      v33 = v31;
    }
    else {
      v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    allowedContactGroups = v22->_allowedContactGroups;
    v22->_allowedContactGroups = v33;

    v35 = (void *)[v18 mutableCopy];
    v36 = v35;
    if (v35) {
      v37 = v35;
    }
    else {
      v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    deniedContactGroups = v22->_deniedContactGroups;
    v22->_deniedContactGroups = v37;

    v39 = (void *)[v19 mutableCopy];
    v40 = v39;
    if (v39) {
      v41 = v39;
    }
    else {
      v41 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    allowedContacts = v22->_allowedContacts;
    v22->_allowedContacts = v41;

    v43 = (void *)[v20 mutableCopy];
    v44 = v43;
    if (v43) {
      v45 = v43;
    }
    else {
      v45 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    deniedContacts = v22->_deniedContacts;
    v22->_deniedContacts = v45;

    uint64_t v47 = [v21 copy];
    phoneCallBypassSettings = v22->_phoneCallBypassSettings;
    v22->_phoneCallBypassSettings = (DNDBypassSettings *)v47;
  }
  return v22;
}

- (unint64_t)hash
{
  v3 = [(DNDSenderConfiguration *)self allowedContactTypes];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSenderConfiguration *)self deniedContactTypes];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSenderConfiguration *)self allowedContactGroups];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDSenderConfiguration *)self deniedContactGroups];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(DNDSenderConfiguration *)self allowedContacts];
  uint64_t v12 = [v11 hash];
  v13 = [(DNDSenderConfiguration *)self deniedContacts];
  uint64_t v14 = v12 ^ [v13 hash];
  id v15 = [(DNDSenderConfiguration *)self phoneCallBypassSettings];
  unint64_t v16 = v10 ^ v14 ^ [v15 hash];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSenderConfiguration *)a3;
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
      uint64_t v6 = [(DNDSenderConfiguration *)self allowedContactTypes];
      v7 = [(DNDSenderConfiguration *)v5 allowedContactTypes];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDSenderConfiguration *)self allowedContactTypes];
        if (!v8)
        {
          char v13 = 0;
          goto LABEL_86;
        }
        v9 = (void *)v8;
        uint64_t v10 = [(DNDSenderConfiguration *)v5 allowedContactTypes];
        if (!v10)
        {
          char v13 = 0;
LABEL_85:

          goto LABEL_86;
        }
        v11 = [(DNDSenderConfiguration *)self allowedContactTypes];
        uint64_t v12 = [(DNDSenderConfiguration *)v5 allowedContactTypes];
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
      uint64_t v14 = [(DNDSenderConfiguration *)self deniedContactTypes];
      id v15 = [(DNDSenderConfiguration *)v5 deniedContactTypes];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSenderConfiguration *)self deniedContactTypes];
        if (v16)
        {
          id v17 = (void *)v16;
          v89 = v14;
          uint64_t v18 = [(DNDSenderConfiguration *)v5 deniedContactTypes];
          if (v18)
          {
            id v19 = (void *)v18;
            uint64_t v14 = [(DNDSenderConfiguration *)self deniedContactTypes];
            id v20 = [(DNDSenderConfiguration *)v5 deniedContactTypes];
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
      id v21 = [(DNDSenderConfiguration *)self allowedContactGroups];
      v22 = [(DNDSenderConfiguration *)v5 allowedContactGroups];
      if (v21 == v22) {
        goto LABEL_25;
      }
      uint64_t v23 = [(DNDSenderConfiguration *)self allowedContactGroups];
      if (v23)
      {
        v82 = (void *)v23;
        uint64_t v24 = [(DNDSenderConfiguration *)v5 allowedContactGroups];
        if (v24)
        {
          v78 = (void *)v24;
          v25 = [(DNDSenderConfiguration *)self allowedContactGroups];
          uint64_t v14 = [(DNDSenderConfiguration *)v5 allowedContactGroups];
          if ([v25 isEqual:v14])
          {
            v74 = v25;
LABEL_25:
            v26 = [(DNDSenderConfiguration *)self deniedContactGroups];
            v84 = [(DNDSenderConfiguration *)v5 deniedContactGroups];
            if (v26 != v84)
            {
              uint64_t v27 = [(DNDSenderConfiguration *)self deniedContactGroups];
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
              uint64_t v28 = [(DNDSenderConfiguration *)v5 deniedContactGroups];
              if (v28)
              {
                v76 = v14;
                v77 = v21;
                v71 = (void *)v28;
                v29 = [(DNDSenderConfiguration *)self deniedContactGroups];
                id v21 = [(DNDSenderConfiguration *)v5 deniedContactGroups];
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
            uint64_t v30 = [(DNDSenderConfiguration *)self allowedContacts];
            uint64_t v31 = [(DNDSenderConfiguration *)v5 allowedContacts];
            v75 = (void *)v30;
            BOOL v32 = v30 == v31;
            v33 = (void *)v31;
            if (v32)
            {
              v72 = (void *)v31;
LABEL_45:
              uint64_t v39 = [(DNDSenderConfiguration *)self deniedContacts];
              v70 = [(DNDSenderConfiguration *)v5 deniedContacts];
              if ((void *)v39 == v70)
              {
                v64 = (void *)v39;
                v65 = v21;
                goto LABEL_55;
              }
              uint64_t v40 = [(DNDSenderConfiguration *)self deniedContacts];
              if (v40)
              {
                v63 = (void *)v40;
                v41 = [(DNDSenderConfiguration *)v5 deniedContacts];
                if (v41)
                {
                  v65 = v21;
                  id v61 = v41;
                  uint64_t v42 = [(DNDSenderConfiguration *)self deniedContacts];
                  uint64_t v43 = [(DNDSenderConfiguration *)v5 deniedContacts];
                  v60 = (void *)v42;
                  v44 = (void *)v42;
                  v45 = (void *)v43;
                  if ([v44 isEqual:v43])
                  {
                    v58 = v45;
                    v64 = (void *)v39;
LABEL_55:
                    v46 = [(DNDSenderConfiguration *)self phoneCallBypassSettings];
                    uint64_t v47 = [(DNDSenderConfiguration *)v5 phoneCallBypassSettings];
                    if (v46 == (void *)v47)
                    {

                      char v13 = 1;
                    }
                    else
                    {
                      v59 = (void *)v47;
                      uint64_t v48 = [(DNDSenderConfiguration *)self phoneCallBypassSettings];
                      if (v48)
                      {
                        v57 = (void *)v48;
                        v49 = [(DNDSenderConfiguration *)v5 phoneCallBypassSettings];
                        if (v49)
                        {
                          v56 = v49;
                          v55 = [(DNDSenderConfiguration *)self phoneCallBypassSettings];
                          objc_super v50 = [(DNDSenderConfiguration *)v5 phoneCallBypassSettings];
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
            uint64_t v34 = [(DNDSenderConfiguration *)self allowedContacts];
            if (v34)
            {
              v69 = (void *)v34;
              uint64_t v35 = [(DNDSenderConfiguration *)v5 allowedContacts];
              if (v35)
              {
                v72 = v33;
                v66 = (void *)v35;
                v36 = [(DNDSenderConfiguration *)self allowedContacts];
                v37 = [(DNDSenderConfiguration *)v5 allowedContacts];
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

- (id)description
{
  return [(DNDSenderConfiguration *)self _descriptionForRedacted:0];
}

- (id)redactedDescription
{
  return [(DNDSenderConfiguration *)self _descriptionForRedacted:1];
}

- (id)_descriptionForRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  allowedContactTypes = self->_allowedContactTypes;
  deniedContactTypes = self->_deniedContactTypes;
  allowedContactGroups = self->_allowedContactGroups;
  deniedContactGroups = self->_deniedContactGroups;
  allowedContacts = self->_allowedContacts;
  if (v3)
  {
    allowedContacts = [(DNDSenderConfiguration *)self _redactedDescriptionsForContacts:self->_allowedContacts];
    deniedContacts = [(DNDSenderConfiguration *)self _redactedDescriptionsForContacts:self->_deniedContacts];
  }
  else
  {
    deniedContacts = self->_deniedContacts;
  }
  objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; allowedContactTypes: %@; deniedContactTypes: %@; allowedContactGroups: %@; deniedContactGroups: %@; allowedContacts: %@; deniedContacts: %@; phoneCallBypassSettings: %@>",
    v6,
    self,
    allowedContactTypes,
    deniedContactTypes,
    allowedContactGroups,
    deniedContactGroups,
    allowedContacts,
    deniedContacts,
  char v13 = self->_phoneCallBypassSettings);
  if (v3)
  {
  }
  return v13;
}

- (id)_redactedDescriptionsForContacts:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "redactedDescription", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return [(DNDSenderConfiguration *)[DNDMutableSenderConfiguration alloc] _initWithAllowedContactTypes:self->_allowedContactTypes deniedContactTypes:self->_deniedContactTypes allowedContactGroups:self->_allowedContactGroups deniedContactGroups:self->_deniedContactGroups allowedContacts:self->_allowedContacts deniedContacts:self->_deniedContacts phoneCallBypassSettings:self->_phoneCallBypassSettings];
}

- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5
{
  id v23 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v23;
    v9 = [(DNDSenderConfiguration *)self allowedContacts];
    uint64_t v10 = [v8 allowedContacts];
    [v7 diffObject:v9 againstObject:v10 withDescription:@"allowedContacts"];

    v11 = [(DNDSenderConfiguration *)self deniedContacts];
    long long v12 = [v8 deniedContacts];
    [v7 diffObject:v11 againstObject:v12 withDescription:@"deniedContacts"];

    long long v13 = [(DNDSenderConfiguration *)self allowedContactTypes];
    long long v14 = [v8 allowedContactTypes];
    [v7 diffObject:v13 againstObject:v14 withDescription:@"allowedContactTypes"];

    long long v15 = [(DNDSenderConfiguration *)self deniedContactTypes];
    uint64_t v16 = [v8 deniedContactTypes];
    [v7 diffObject:v15 againstObject:v16 withDescription:@"deniedContactTypes"];

    uint64_t v17 = [(DNDSenderConfiguration *)self allowedContactGroups];
    uint64_t v18 = [v8 allowedContactGroups];
    [v7 diffObject:v17 againstObject:v18 withDescription:@"allowedContactGroups"];

    id v19 = [(DNDSenderConfiguration *)self deniedContactGroups];
    id v20 = [v8 deniedContactGroups];
    [v7 diffObject:v19 againstObject:v20 withDescription:@"deniedContactGroups"];

    id v21 = [(DNDSenderConfiguration *)self phoneCallBypassSettings];
    v22 = [v8 phoneCallBypassSettings];

    [v7 diffObject:v21 againstObject:v22 withDescription:@"phoneCallBypassSettings"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSenderConfiguration)initWithCoder:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  uint64_t v6 = [v3 setWithArray:v5];
  uint64_t v30 = [v4 decodeObjectOfClasses:v6 forKey:@"allowedContactTypes"];

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v9 = [v7 setWithArray:v8];
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"deniedContactTypes"];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  long long v13 = [v11 setWithArray:v12];
  long long v14 = [v4 decodeObjectOfClasses:v13 forKey:@"allowedContactGroups"];

  long long v15 = (void *)MEMORY[0x1E4F1CAD0];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  uint64_t v17 = [v15 setWithArray:v16];
  uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"deniedContactGroups"];

  id v19 = (void *)MEMORY[0x1E4F1CAD0];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  id v21 = [v19 setWithArray:v20];
  v22 = [v4 decodeObjectOfClasses:v21 forKey:@"allowedContacts"];

  id v23 = (void *)MEMORY[0x1E4F1CAD0];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v25 = [v23 setWithArray:v24];
  v26 = [v4 decodeObjectOfClasses:v25 forKey:@"deniedContacts"];

  uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneCallBypassSettings"];

  uint64_t v28 = [(DNDSenderConfiguration *)self _initWithAllowedContactTypes:v30 deniedContactTypes:v10 allowedContactGroups:v14 deniedContactGroups:v18 allowedContacts:v22 deniedContacts:v26 phoneCallBypassSettings:v27];
  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  allowedContactTypes = self->_allowedContactTypes;
  id v5 = a3;
  [v5 encodeObject:allowedContactTypes forKey:@"allowedContactTypes"];
  [v5 encodeObject:self->_deniedContactTypes forKey:@"deniedContactTypes"];
  [v5 encodeObject:self->_allowedContactGroups forKey:@"allowedContactGroups"];
  [v5 encodeObject:self->_deniedContactGroups forKey:@"deniedContactGroups"];
  [v5 encodeObject:self->_allowedContacts forKey:@"allowedContacts"];
  [v5 encodeObject:self->_deniedContacts forKey:@"deniedContacts"];
  [v5 encodeObject:self->_phoneCallBypassSettings forKey:@"phoneCallBypassSettings"];
}

- (DNDBypassSettings)phoneCallBypassSettings
{
  return (DNDBypassSettings *)[(DNDSenderConfiguration *)self _evaluatedBypassSettings:self->_phoneCallBypassSettings];
}

- (id)_evaluatedBypassSettings:(id)a3
{
  id v3 = a3;
  id v4 = (DNDMutableBypassSettings *)[v3 mutableCopy];
  if (!v4) {
    id v4 = objc_alloc_init(DNDMutableBypassSettings);
  }
  uint64_t v5 = DNDResolvedImmediateBypassEventSourceType([v3 immediateBypassEventSourceType]);
  if (v5 == 5)
  {
    uint64_t v6 = [v3 immediateBypassCNGroupIdentifier];

    if (v6) {
      uint64_t v5 = 5;
    }
    else {
      uint64_t v5 = DNDResolvedImmediateBypassEventSourceType(0);
    }
  }
  [(DNDMutableBypassSettings *)v4 setImmediateBypassEventSourceType:v5];

  return v4;
}

- (NSSet)allowedContactTypes
{
  return &self->_allowedContactTypes->super;
}

- (NSSet)deniedContactTypes
{
  return &self->_deniedContactTypes->super;
}

- (NSSet)allowedContactGroups
{
  return &self->_allowedContactGroups->super;
}

- (NSSet)deniedContactGroups
{
  return &self->_deniedContactGroups->super;
}

- (NSSet)allowedContacts
{
  return &self->_allowedContacts->super;
}

- (NSSet)deniedContacts
{
  return &self->_deniedContacts->super;
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