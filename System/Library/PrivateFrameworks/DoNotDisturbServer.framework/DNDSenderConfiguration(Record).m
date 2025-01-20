@interface DNDSenderConfiguration(Record)
+ (id)configurationForRecord:()Record;
- (DNDSMutableSenderConfigurationRecord)makeRecord;
@end

@implementation DNDSenderConfiguration(Record)

+ (id)configurationForRecord:()Record
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F5F730]);
  v5 = [v3 allowedContactTypes];
  v6 = (void *)[v5 mutableCopy];
  [v4 setAllowedContactTypes:v6];

  v7 = [v3 deniedContactTypes];
  v8 = (void *)[v7 mutableCopy];
  [v4 setDeniedContactTypes:v8];

  v9 = [v3 allowedContactGroups];
  v10 = (void *)[v9 mutableCopy];
  [v4 setAllowedContactGroups:v10];

  v11 = [v3 deniedContactGroups];
  v12 = (void *)[v11 mutableCopy];
  [v4 setDeniedContactGroups:v12];

  v13 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v14 = [v3 allowedContacts];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [MEMORY[0x1E4F5F5C0] contactForRecord:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v16);
  }

  [v4 setAllowedContacts:v13];
  v20 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v21 = objc_msgSend(v3, "deniedContacts", 0);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [MEMORY[0x1E4F5F5C0] contactForRecord:*(void *)(*((void *)&v31 + 1) + 8 * j)];
        [v20 addObject:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v23);
  }

  [v4 setDeniedContacts:v20];
  v27 = (void *)MEMORY[0x1E4F5F5A8];
  v28 = [v3 phoneCallBypassSettings];
  v29 = [v27 settingsForRecord:v28];
  [v4 setPhoneCallBypassSettings:v29];

  return v4;
}

- (DNDSMutableSenderConfigurationRecord)makeRecord
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(DNDSMutableSenderConfigurationRecord);
  id v3 = [a1 allowedContactTypes];
  [(DNDSMutableSenderConfigurationRecord *)v2 setAllowedContactTypes:v3];

  id v4 = [a1 deniedContactTypes];
  [(DNDSMutableSenderConfigurationRecord *)v2 setDeniedContactTypes:v4];

  v5 = [a1 allowedContactGroups];
  [(DNDSMutableSenderConfigurationRecord *)v2 setAllowedContactGroups:v5];

  v6 = [a1 deniedContactGroups];
  [(DNDSMutableSenderConfigurationRecord *)v2 setDeniedContactGroups:v6];

  v7 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v8 = [a1 allowedContacts];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v28 + 1) + 8 * i) makeRecord];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  [(DNDSMutableSenderConfigurationRecord *)v2 setAllowedContacts:v7];
  v14 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v15 = objc_msgSend(a1, "deniedContacts", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v24 + 1) + 8 * j) makeRecord];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v17);
  }

  [(DNDSMutableSenderConfigurationRecord *)v2 setDeniedContacts:v14];
  v21 = [a1 phoneCallBypassSettings];
  uint64_t v22 = [v21 makeRecord];
  [(DNDSMutableSenderConfigurationRecord *)v2 setPhoneCallBypassSettings:v22];

  return v2;
}

@end