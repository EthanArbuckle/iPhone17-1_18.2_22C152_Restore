@interface HDMedicalIDDataMigrator
+ (BOOL)migrateMedicalIDDataIfNeeded:(id)a3;
@end

@implementation HDMedicalIDDataMigrator

+ (BOOL)migrateMedicalIDDataIfNeeded:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3 || [v3 schemaVersion] > 3)
  {
    BOOL v24 = 0;
    goto LABEL_36;
  }
  switch([v4 schemaVersion])
  {
    case 0:
      id v5 = v4;
      self;
      [v5 setBloodType:0];

      goto LABEL_5;
    case 1:
LABEL_5:
      id v6 = v4;
      self;
      id v7 = [v6 emergencyContacts];
      if (![v7 count]) {
        goto LABEL_15;
      }
      CFErrorRef error = 0;
      ABAddressBookRef v8 = ABAddressBookCreateWithOptions(0, &error);
      if (!v8)
      {
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v33 = 2;
          __int16 v34 = 2114;
          CFErrorRef v35 = error;
          goto LABEL_38;
        }
LABEL_34:

        goto LABEL_35;
      }
      v9 = v8;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v7 = v7;
      uint64_t v10 = [v7 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "_migrateToSchemaVersion:withAddressBook:", 2, v9, (void)v27);
          }
          uint64_t v11 = [v7 countByEnumeratingWithState:&v27 objects:v36 count:16];
        }
        while (v11);
      }

      CFRelease(v9);
LABEL_15:

LABEL_16:
      id v6 = v4;
      self;
      id v7 = [v6 emergencyContacts];
      if ([v7 count])
      {
        CFErrorRef error = 0;
        ABAddressBookRef v14 = ABAddressBookCreateWithOptions(0, &error);
        if (v14)
        {
          v15 = v14;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v7 = v7;
          uint64_t v16 = [v7 countByEnumeratingWithState:&v27 objects:v36 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v28 != v18) {
                  objc_enumerationMutation(v7);
                }
                [*(id *)(*((void *)&v27 + 1) + 8 * j) _migrateToSchemaVersion:3 withAddressBook:v15];
              }
              uint64_t v17 = [v7 countByEnumeratingWithState:&v27 objects:v36 count:16];
            }
            while (v17);
          }

          CFRelease(v15);
          goto LABEL_26;
        }
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v33 = 3;
          __int16 v34 = 2114;
          CFErrorRef v35 = error;
LABEL_38:
          _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "Error creating address book in migrating emergency contacts to version %ld: %{public}@", buf, 0x16u);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
LABEL_26:

LABEL_27:
      id v20 = v4;
      self;
      v21 = [v20 birthdate];
      if (v21)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
        v23 = objc_msgSend(v22, "hk_dateOfBirthDateComponentsWithDate:", v21);

        [v20 setGregorianBirthday:v23];
      }

      [v20 setSchemaVersion:4];
LABEL_35:
      BOOL v24 = 1;
LABEL_36:

      return v24;
    case 2:
      goto LABEL_16;
    case 3:
      goto LABEL_27;
    default:
      goto LABEL_35;
  }
}

@end