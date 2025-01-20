@interface _HKMedicalIDData(HKMedicalIDAddressBookBridge)
+ (id)contactKeysToLoadForMedicalID;
- (id)_contactKeysToFetch;
- (uint64_t)_autopopulateEmergencyContactsForSecondaryProfile;
- (uint64_t)_updateExistingEmergencyContacts;
- (uint64_t)_updateIdentifierByPhoneNumberForEmergencyContact:()HKMedicalIDAddressBookBridge contactStore:;
- (uint64_t)updateEmergencyContacts;
- (uint64_t)updateEmergencyContactsAutopopulateForSecondaryProfileIfEmpty:()HKMedicalIDAddressBookBridge;
- (void)_autopopulateEmergencyContactsForSecondaryProfile;
- (void)loadDataFromCNContact:()HKMedicalIDAddressBookBridge;
@end

@implementation _HKMedicalIDData(HKMedicalIDAddressBookBridge)

+ (id)contactKeysToLoadForMedicalID
{
  if (contactKeysToLoadForMedicalID_onceToken != -1) {
    dispatch_once(&contactKeysToLoadForMedicalID_onceToken, &__block_literal_global_31);
  }
  v0 = (void *)contactKeysToLoadForMedicalID_contactKeysToFetch;
  return v0;
}

- (void)loadDataFromCNContact:()HKMedicalIDAddressBookBridge
{
  id v11 = a3;
  v4 = [v11 thumbnailImageData];
  [a1 setPictureData:v4];

  v5 = [MEMORY[0x1E4F1B910] stringFromContact:v11 style:0];
  [a1 setName:v5];

  uint64_t v6 = [v11 birthday];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [v11 birthday];
    uint64_t v9 = [v8 year];

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = [v11 birthday];
      [a1 setGregorianBirthday:v10];
    }
  }
}

- (uint64_t)updateEmergencyContacts
{
  v2 = [a1 emergencyContacts];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return 0;
  }
  return [a1 _updateExistingEmergencyContacts];
}

- (uint64_t)updateEmergencyContactsAutopopulateForSecondaryProfileIfEmpty:()HKMedicalIDAddressBookBridge
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = [a1 emergencyContacts];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = a1;
      _os_log_impl(&dword_1E0B26000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating existing emergency contacts.", (uint8_t *)&v10, 0xCu);
    }
    return [a1 _updateExistingEmergencyContacts];
  }
  else if (a3)
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x1E4F29F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = a1;
      _os_log_impl(&dword_1E0B26000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Autopopulating emergency contacts.", (uint8_t *)&v10, 0xCu);
    }
    return [a1 _autopopulateEmergencyContactsForSecondaryProfile];
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_updateExistingEmergencyContacts
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = [a1 emergencyContacts];
    uint64_t v3 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      int v5 = 0;
      uint64_t v6 = *(void *)v49;
      id v34 = v2;
      v35 = a1;
      uint64_t v33 = *(void *)v49;
      do
      {
        uint64_t v7 = 0;
        uint64_t v37 = v4;
        do
        {
          if (*(void *)v49 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v48 + 1) + 8 * v7);
          v5 |= objc_msgSend(a1, "_updateIdentifierByPhoneNumberForEmergencyContact:contactStore:", v8, v2, v33, v34, v35);
          uint64_t v9 = [v8 nameContactIdentifier];
          if (v9)
          {
            int v10 = [a1 _contactKeysToFetch];
            id v47 = 0;
            uint64_t v11 = [v2 unifiedContactWithIdentifier:v9 keysToFetch:v10 error:&v47];
            id v42 = v47;

            uint64_t v12 = (void *)v11;
            if (v11)
            {
              v40 = v9;
              v41 = (void *)v11;
              v13 = [MEMORY[0x1E4F1B910] stringFromContact:v11 style:0];
              v14 = [v8 name];
              char v15 = [v13 isEqualToString:v14];

              if ((v15 & 1) == 0)
              {
                [v8 setName:v13];
                int v5 = 1;
              }
              uint64_t v12 = v41;
              v16 = [v41 phoneNumbers];
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              id v17 = v16;
              uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                v38 = v13;
                int v36 = v5;
                uint64_t v20 = *(void *)v44;
                while (2)
                {
                  for (uint64_t i = 0; i != v19; ++i)
                  {
                    if (*(void *)v44 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                    v23 = [v22 identifier];
                    v24 = [v8 phoneNumberContactIdentifier];
                    int v25 = [v23 isEqualToString:v24];

                    if (v25)
                    {
                      v26 = [v22 value];
                      v27 = (void *)MEMORY[0x1E4F1BA70];
                      v28 = [v8 phoneNumber];
                      v29 = [v27 phoneNumberWithStringValue:v28];

                      if (![v26 isLikePhoneNumber:v29])
                      {
                        v30 = [v26 formattedStringValue];
                        [v8 setPhoneNumber:v30];

                        int v5 = 1;
                        id v2 = v34;
                        a1 = v35;
                        uint64_t v6 = v33;
                        goto LABEL_23;
                      }
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
                  if (v19) {
                    continue;
                  }
                  break;
                }
                id v2 = v34;
                a1 = v35;
                uint64_t v6 = v33;
                int v5 = v36;
LABEL_23:
                uint64_t v12 = v41;
                v13 = v38;
              }

              uint64_t v4 = v37;
              uint64_t v9 = v40;
            }
          }
          ++v7;
        }
        while (v7 != v4);
        uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v4);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    v31 = *MEMORY[0x1E4F29F58];
    LOBYTE(v5) = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v55 = a1;
      _os_log_impl(&dword_1E0B26000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Contacts access not authorized, skipping update emergency contacts", buf, 0xCu);
      LOBYTE(v5) = 0;
    }
  }
  return v5 & 1;
}

- (uint64_t)_autopopulateEmergencyContactsForSecondaryProfile
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  uint64_t v3 = [a1 _contactKeysToFetch];
  id v37 = 0;
  uint64_t v4 = objc_msgSend(v2, "_ios_meContactWithKeysToFetch:error:", v3, &v37);
  id v5 = v37;

  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F2B8D0] emergencyContactUsingSimCardNumberWithContact:v4 property:0];
    uint64_t v7 = v6;
    if (v6)
    {
      v8 = [v6 phoneNumber];

      if (v8)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        int v10 = [v9 localizedStringForKey:@"relationship_guardian" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
        [v7 setRelationship:v10];

        uint64_t v11 = [a1 emergencyContacts];
        if (v11)
        {
          uint64_t v12 = v11;
          v13 = [v11 arrayByAddingObject:v7];
        }
        else
        {
          v38[0] = v7;
          v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
        }
        [a1 setEmergencyContacts:v13];

        uint64_t v21 = 1;
        goto LABEL_16;
      }
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E4F29F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR)) {
        [(_HKMedicalIDData(HKMedicalIDAddressBookBridge) *)(uint64_t)a1 _autopopulateEmergencyContactsForSecondaryProfile];
      }
    }
    else
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E4F29F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR)) {
        [(_HKMedicalIDData(HKMedicalIDAddressBookBridge) *)(uint64_t)a1 _autopopulateEmergencyContactsForSecondaryProfile];
      }
    }
    uint64_t v21 = 0;
LABEL_16:

    goto LABEL_17;
  }
  _HKInitializeLogging();
  v14 = *MEMORY[0x1E4F29F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_ERROR)) {
    [(_HKMedicalIDData(HKMedicalIDAddressBookBridge) *)(uint64_t)a1 _autopopulateEmergencyContactsForSecondaryProfile];
  }
  uint64_t v21 = 0;
LABEL_17:

  return v21;
}

- (uint64_t)_updateIdentifierByPhoneNumberForEmergencyContact:()HKMedicalIDAddressBookBridge contactStore:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1BA70];
  uint64_t v9 = [v6 phoneNumber];
  uint64_t v10 = [v8 phoneNumberWithStringValue:v9];

  uint64_t v56 = (void *)v10;
  uint64_t v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v10];
  uint64_t v12 = [a1 _contactKeysToFetch];
  id v71 = 0;
  v13 = [v7 unifiedContactsMatchingPredicate:v11 keysToFetch:v12 error:&v71];
  id v14 = v71;

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v51 = v14;
    v52 = v11;
    uint64_t v17 = *(void *)v68;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v68 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        uint64_t v20 = [MEMORY[0x1E4F1B910] stringFromContact:v19 style:0];
        uint64_t v21 = [v6 name];
        int v22 = [v20 isEqualToString:v21];

        if (v22)
        {
          uint64_t v24 = [v6 nameContactIdentifier];
          uint64_t v25 = [v19 identifier];
          int v26 = [v24 isEqualToString:v25];

          if ((v26 & 1) == 0)
          {
            uint64_t v27 = [v19 identifier];
            [v6 setNameContactIdentifier:v27];
          }
          unsigned int v50 = v26 ^ 1;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v53 = [v19 phoneNumbers];
          uint64_t v54 = [v53 countByEnumeratingWithState:&v63 objects:v72 count:16];
          if (v54)
          {
            id v49 = v7;
            uint64_t v55 = *(void *)v64;
            while (2)
            {
              for (uint64_t j = 0; j != v54; ++j)
              {
                if (*(void *)v64 != v55) {
                  objc_enumerationMutation(v53);
                }
                v29 = *(void **)(*((void *)&v63 + 1) + 8 * j);
                uint64_t v30 = objc_msgSend(v29, "value", v49);
                uint64_t v31 = [v30 unformattedInternationalStringValue];
                uint64_t v32 = [v6 phoneNumber];
                if ([v31 isEqualToString:v32]) {
                  goto LABEL_28;
                }
                uint64_t v33 = [v29 value];
                [v33 formattedInternationalStringValue];
                v35 = uint64_t v34 = v6;
                int v36 = [v34 phoneNumber];
                if ([v35 isEqualToString:v36]) {
                  goto LABEL_27;
                }
                v59 = v32;
                v60 = v31;
                v61 = v30;
                id v37 = [v29 value];
                v38 = [v37 formattedStringValue];
                v39 = v34;
                v40 = [v34 phoneNumber];
                if ([v38 isEqualToString:v40])
                {

                  uint64_t v34 = v39;
                  uint64_t v31 = v60;
                  uint64_t v30 = v61;
                  uint64_t v32 = v59;
LABEL_27:

                  id v6 = v34;
LABEL_28:

                  v41 = v29;
LABEL_29:
                  long long v43 = [v6 phoneNumberContactIdentifier];
                  long long v44 = v41;
                  long long v45 = [v41 identifier];
                  char v46 = [v43 isEqualToString:v45];

                  id v7 = v49;
                  uint64_t v23 = v50;
                  if ((v46 & 1) == 0)
                  {
                    id v47 = [v44 identifier];
                    [v6 setPhoneNumberContactIdentifier:v47];

                    uint64_t v23 = 1;
                  }
                  goto LABEL_31;
                }
                [v29 value];
                v57 = v33;
                id v42 = v41 = v29;
                char v58 = [v42 isLikePhoneNumber:v56];

                id v6 = v39;
                if (v58) {
                  goto LABEL_29;
                }
              }
              uint64_t v54 = [v53 countByEnumeratingWithState:&v63 objects:v72 count:16];
              if (v54) {
                continue;
              }
              break;
            }
            id v7 = v49;
          }
          uint64_t v23 = v50;
LABEL_31:

          goto LABEL_32;
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
      if (v16) {
        continue;
      }
      break;
    }
    uint64_t v23 = 0;
LABEL_32:
    id v14 = v51;
    uint64_t v11 = v52;
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (id)_contactKeysToFetch
{
  if (_contactKeysToFetch_onceToken != -1) {
    dispatch_once(&_contactKeysToFetch_onceToken, &__block_literal_global_297);
  }
  v0 = (void *)_contactKeysToFetch_contactKeys;
  return v0;
}

- (void)_autopopulateEmergencyContactsForSecondaryProfile
{
}

@end