@interface _HKEmergencyContact(HDMedicalIDDataMigrator)
- (void)_migrateToSchemaVersion:()HDMedicalIDDataMigrator withAddressBook:;
@end

@implementation _HKEmergencyContact(HDMedicalIDDataMigrator)

- (void)_migrateToSchemaVersion:()HDMedicalIDDataMigrator withAddressBook:
{
  v5 = a1;
  v54[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    if (!a1) {
      return;
    }
    v21 = [a1 nameRecordID];
    PersonWithRecordID = (void *)ABAddressBookGetPersonWithRecordID(a4, [v21 intValue]);

    if (PersonWithRecordID)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1B980]);
      v24 = [v5 nameRecordID];
      v25 = [v24 stringValue];
      v54[0] = *MEMORY[0x1E4F1AEE0];
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
      PersonWithRecordID = [v23 unifiedContactWithIdentifier:v25 keysToFetch:v26 error:0];
    }
    v27 = [PersonWithRecordID identifier];
    [v5 setNameContactIdentifier:v27];

    v28 = [PersonWithRecordID linkedContacts];
    v29 = [PersonWithRecordID phoneNumbers];
    v48 = v28;
    if ([v28 count])
    {
      v30 = [MEMORY[0x1E4F1B8F8] unifyContacts:v28];
      uint64_t v31 = [v30 phoneNumbers];

      v29 = (void *)v31;
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v32 = v29;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (!v33) {
      goto LABEL_34;
    }
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v50;
    while (1)
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v50 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        int v38 = [v37 iOSLegacyIdentifier];
        v39 = v5;
        v40 = [v5 phoneNumberPropertyID];
        int v41 = [v40 intValue];

        if (v38 == v41)
        {
          v42 = [v37 identifier];
          [v39 setPhoneNumberContactIdentifier:v42];

LABEL_34:
          return;
        }
        v5 = v39;
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (!v34) {
        goto LABEL_34;
      }
    }
  }
  if (a3 != 2 || !a1) {
    return;
  }
  v43 = [a1 name];
  CFArrayRef v6 = ABAddressBookCopyPeopleWithName(a4, v43);
  CFIndex Count = CFArrayGetCount(v6);
  if (Count <= 0)
  {
    CFRelease(v6);
    goto LABEL_37;
  }
  v44 = v5;
  CFIndex v7 = 0;
  ABPropertyID property = *MEMORY[0x1E4F18150];
  uint64_t v8 = 0xFFFFFFFFLL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
    int v45 = MEMORY[0x1C1879AE0]();
    CFTypeRef v10 = ABRecordCopyValue(ValueAtIndex, property);
    CFIndex v11 = ABMultiValueGetCount(v10);
    if (v11 > 0) {
      break;
    }
    CFRelease(v10);
LABEL_16:
    if (++v7 == Count) {
      goto LABEL_17;
    }
  }
  CFIndex v12 = v11;
  CFArrayRef v13 = v6;
  v14 = [v44 phoneNumber];
  char v15 = 0;
  uint64_t v16 = 1;
  do
  {
    CFTypeRef v17 = ABMultiValueCopyValueAtIndex(v10, v16 - 1);
    unsigned int IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v10, v16 - 1);
    if ([v14 isEqualToString:v17])
    {
      char v15 = 1;
      uint64_t v8 = IdentifierAtIndex;
    }
    else
    {
      uint64_t v8 = v8;
    }
    CFRelease(v17);
    if (v16 >= v12) {
      break;
    }
    ++v16;
  }
  while ((v15 & 1) == 0);

  CFRelease(v10);
  CFArrayRef v6 = v13;
  if ((v15 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_17:
  CFRelease(v6);
  if (v45 != -1)
  {
    v19 = objc_msgSend(NSNumber, "numberWithInt:");
    [v44 setNameRecordID:v19];

    v20 = [NSNumber numberWithInt:v8];
    [v44 setPhoneNumberPropertyID:v20];
  }
LABEL_37:
}

@end