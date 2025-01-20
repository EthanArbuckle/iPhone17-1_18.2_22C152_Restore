@interface AddressBookDataMigrator
- (AddressBookDataMigrator)init;
- (BOOL)migrateMainDatabase:(id)a3 index:(unint64_t)a4;
- (BOOL)performMigration;
- (__CFArray)changedImagePersonIdentifiers;
- (double)imageDbTime;
- (double)mainDbTime;
- (float)estimatedDuration;
- (id)dataClassName;
- (id)getDatabasePaths;
- (void)dealloc;
- (void)migrateContactMetadataDatabase;
- (void)migrateImagesDatabase:(id)a3 index:(unint64_t)a4;
- (void)migrateUserDefaultsToNSPersonNameComponentsFormatter;
- (void)resetContactProviderFeature;
- (void)setChangedImagePersonIdentifiers:(__CFArray *)a3;
- (void)setImageDbTime:(double)a3;
- (void)setMainDbTime:(double)a3;
@end

@implementation AddressBookDataMigrator

- (AddressBookDataMigrator)init
{
  v5.receiver = self;
  v5.super_class = (Class)AddressBookDataMigrator;
  v2 = [(AddressBookDataMigrator *)&v5 init];
  if (v2)
  {
    v2->_changedImagePersonIdentifiers = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  changedImagePersonIdentifiers = self->_changedImagePersonIdentifiers;
  if (changedImagePersonIdentifiers) {
    CFRelease(changedImagePersonIdentifiers);
  }
  v4.receiver = self;
  v4.super_class = (Class)AddressBookDataMigrator;
  [(AddressBookDataMigrator *)&v4 dealloc];
}

- (id)dataClassName
{
  return @"contacts";
}

- (BOOL)performMigration
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v3 = [(AddressBookDataMigrator *)self getDatabasePaths];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_185C;
  v10[3] = &unk_4240;
  v10[4] = self;
  v10[5] = &v11;
  [v3 enumerateObjectsUsingBlock:v10];
  [(AddressBookDataMigrator *)self migrateUserDefaultsToNSPersonNameComponentsFormatter];
  [(AddressBookDataMigrator *)self migrateContactMetadataDatabase];
  [(AddressBookDataMigrator *)self resetContactProviderFeature];
  if (*((unsigned char *)v12 + 24))
  {
    objc_super v4 = ABOSLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [(AddressBookDataMigrator *)self mainDbTime];
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AB Migration - main dbs migration took %fs", buf, 0xCu);
    }

    v6 = ABOSLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [(AddressBookDataMigrator *)self imageDbTime];
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AB Migration - image dbs migration took %fs", buf, 0xCu);
    }

    BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (id)getDatabasePaths
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)ABCAddressBookCopyDBDirectory();
  if (v3)
  {
    [v2 addObject:v3];
    objc_super v4 = (void *)ABCAddressBookCopyDelegateDBDirectories();
    if (v4) {
      [v2 addObjectsFromArray:v4];
    }
  }
  id v5 = [v2 copy];

  return v5;
}

- (void)migrateImagesDatabase:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    uint64_t v7 = ABOSLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "AB Migration - migrating delegate images database", v13, 2u);
    }
  }
  uint64_t v8 = ABCImageStoreCopyDatabasePathForDatabaseDirectory();
  if (v8)
  {
    v9 = (const void *)v8;
    double Current = CFAbsoluteTimeGetCurrent();
    CFArrayRemoveAllValues([(AddressBookDataMigrator *)self changedImagePersonIdentifiers]);
    [(AddressBookDataMigrator *)self changedImagePersonIdentifiers];
    if (ABCImageStoreCreateWithPathAndForceInProcessMigration())
    {
      ABCImageStoreGetCountOfImagesWithFormat();
      CPRecordStoreDestroy();
    }
    CFRelease(v9);
    CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent() - Current;
    [(AddressBookDataMigrator *)self imageDbTime];
    [(AddressBookDataMigrator *)self setImageDbTime:v12 + v11];
  }
}

- (BOOL)migrateMainDatabase:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    uint64_t v7 = ABOSLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "AB Migration - migrating delegate main database", buf, 2u);
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  v9 = (const void *)ABCCreateAddressBookWithDatabaseDirectoryAndForceInProcessMigrationInProcessLinkingAndResetSortKeys();
  v10 = v9;
  if (v9)
  {
    ABAddressBookGetGroupCount(v9);
    [(AddressBookDataMigrator *)self changedImagePersonIdentifiers];
    ABChangeHistoryInsertPersonImageChangeRecordForRecordsWithIdentifiers();
    ABCIsSortDataValid();
    CFRelease(v10);
    CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent() - Current;
    [(AddressBookDataMigrator *)self mainDbTime];
    [(AddressBookDataMigrator *)self setMainDbTime:v12 + v11];
  }

  return v10 != 0;
}

- (void)migrateUserDefaultsToNSPersonNameComponentsFormatter
{
  *(void *)keyExistsAndHasValidFormat = 0;
  v25 = keyExistsAndHasValidFormat;
  uint64_t v26 = 0x2050000000;
  id v2 = (void *)qword_8288;
  uint64_t v27 = qword_8288;
  if (!qword_8288)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_2670;
    v23[3] = &unk_4268;
    v23[4] = keyExistsAndHasValidFormat;
    sub_2670((uint64_t)v23);
    id v2 = (void *)*((void *)v25 + 3);
  }
  id v3 = v2;
  _Block_object_dispose(keyExistsAndHasValidFormat, 8);
  CFStringRef v4 = (const __CFString *)ABPeoplePickerPrefs();
  CFNumberRef v5 = (const __CFNumber *)CFPreferencesCopyAppValue(@"personNameOrdering", v4);
  BOOL v6 = v5 != 0;
  if (v5)
  {
    CFNumberRef v7 = v5;
    LODWORD(v23[0]) = 0;
    CFNumberGetValue(v5, kCFNumberIntType, v23);
    if (LODWORD(v23[0])) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    [v3 setDefaultDisplayNameOrder:v8];
    CFStringRef v9 = (const __CFString *)ABPeoplePickerPrefs();
    CFPreferencesSetAppValue(@"personNameOrdering", 0, v9);
    CFRelease(v7);
  }
  CFStringRef v10 = (const __CFString *)ABPeoplePickerPrefs();
  CFNumberRef v11 = (const __CFNumber *)CFPreferencesCopyAppValue(@"personShortNameFormat", v10);
  if (v11)
  {
    CFNumberRef v12 = v11;
    LODWORD(v23[0]) = 0;
    CFNumberGetValue(v11, kCFNumberIntType, v23);
    if (LODWORD(v23[0]) <= 3) {
      [v3 setShortNameFormat:LODWORD(v23[0]) + 1];
    }
    CFStringRef v13 = (const __CFString *)ABPeoplePickerPrefs();
    CFPreferencesSetAppValue(@"personShortNameFormat", 0, v13);
    CFRelease(v12);
    BOOL v6 = 1;
  }
  keyExistsAndHasValidFormat[0] = 0;
  CFStringRef v14 = (const __CFString *)ABPeoplePickerPrefs();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"personShortNameFormatEnabled", v14, keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat[0])
  {
    [v3 setShortNameIsEnabled:AppBooleanValue != 0];
    CFStringRef v16 = (const __CFString *)ABPeoplePickerPrefs();
    CFPreferencesSetAppValue(@"personShortNameFormatEnabled", 0, v16);
    BOOL v6 = 1;
  }
  CFStringRef v17 = (const __CFString *)ABPeoplePickerPrefs();
  int v18 = CFPreferencesGetAppBooleanValue(@"personShortNamePreferNicknames", v17, keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat[0])
  {
    [v3 setPreferNicknamesDefault:v18 != 0];
    CFStringRef v19 = (const __CFString *)ABPeoplePickerPrefs();
    CFPreferencesSetAppValue(@"personShortNamePreferNicknames", 0, v19);
    CFStringRef v20 = (const __CFString *)ABPeoplePickerPrefs();
    CFPreferencesAppSynchronize(v20);
  }
  else
  {
    CFStringRef v21 = (const __CFString *)ABPeoplePickerPrefs();
    CFPreferencesAppSynchronize(v21);
    if (!v6) {
      return;
    }
  }
  v22 = ABOSLogGeneral();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23[0]) = 0;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "AB Migration - user defaults was migrated", (uint8_t *)v23, 2u);
  }
}

- (void)migrateContactMetadataDatabase
{
  uint64_t v11 = 0;
  CFNumberRef v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v2 = (void *)qword_8298;
  uint64_t v14 = qword_8298;
  if (!qword_8298)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    CFStringRef v16 = sub_2810;
    CFStringRef v17 = &unk_4268;
    int v18 = &v11;
    sub_2810((uint64_t)&buf);
    id v2 = (void *)v12[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v11, 8);
  double Current = CFAbsoluteTimeGetCurrent();
  id v10 = 0;
  unsigned int v5 = [v3 performLightweightMigrationIfNeededError:&v10];
  id v6 = v10;
  CFNumberRef v7 = ABOSLogGeneral();
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime v9 = CFAbsoluteTimeGetCurrent();
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v9 - Current;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "AB Migration - Contact metadata db was migrated, took %fs", (uint8_t *)&buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_29B0(v6, v8);
  }
}

- (void)resetContactProviderFeature
{
  ABAddressBookRef v2 = ABAddressBookCreate();
  if (ABAddressBookGetIntegerProperty() == 1)
  {
    id v3 = ABOSLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "AB Migration - Contact Provider will reset", buf, 2u);
    }

    double Current = CFAbsoluteTimeGetCurrent();
    CFErrorRef error = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    CFArrayRef v5 = ABAddressBookCopyArrayOfAllSources(v2);
    id v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      char v9 = 1;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(const void **)(*((void *)&v16 + 1) + 8 * i);
          if (ABRecordGetIntValue() == 7)
          {
            ABAddressBookRemoveRecord(v2, v11, &error);
            if (error)
            {
              CFNumberRef v12 = ABOSLogGeneral();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                double v22 = *(double *)&error;
                _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "AB Migration - Contact Provider container was not deleted, %@", buf, 0xCu);
              }

              char v9 = 0;
              CFErrorRef error = 0;
            }
          }
        }
        id v7 = [(__CFArray *)v5 countByEnumeratingWithState:&v16 objects:v23 count:16];
      }
      while (v7);
    }
    else
    {
      char v9 = 1;
    }

    if (ABAddressBookHasUnsavedChanges(v2) && (ABAddressBookSave(v2, &error), error))
    {
      uint64_t v13 = ABOSLogGeneral();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_2A4C((uint64_t *)&error, v13);
      }
    }
    else if (v9)
    {
      uint64_t v14 = ABOSLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)long long buf = 134217984;
        double v22 = v15 - Current;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "AB Migration - Contact Provider did reset, took %fs", buf, 0xCu);
      }

      ABAddressBookSetIntegerProperty();
    }
    if (v2) {
      CFRelease(v2);
    }
  }
  else if (v2)
  {
    CFRelease(v2);
  }
}

- (float)estimatedDuration
{
  uint64_t v2 = ABCAddressBookCopyDBPath();
  if (v2)
  {
    id v3 = (const void *)v2;
    int SchemaVersionAtPath = CPSqliteUtilitiesGetSchemaVersionAtPath();
    int IntegerQueryResultAtPath = CPSqliteUtilitiesGetIntegerQueryResultAtPath();
    if (SchemaVersionAtPath == 102)
    {
      int v6 = 0;
      float v7 = (float)IntegerQueryResultAtPath;
      double v8 = 0.0;
    }
    else
    {
      int v6 = sub_25A0();
      float v7 = (float)v6 / 1536.0;
      double v8 = v7 * 0.0022 + (float)v6 * 0.0000458984375;
    }
    float v9 = v8 + 0.0;
    id v10 = ABOSLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67110144;
      int v19 = SchemaVersionAtPath;
      __int16 v20 = 1024;
      int v21 = v6;
      __int16 v22 = 2048;
      double v23 = v8;
      __int16 v24 = 2048;
      double v25 = v7 * 0.0022;
      __int16 v26 = 2048;
      double v27 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "AB Migration estimate - Regular DB (v%i) Size: %i - estimated duration: %f (%f) (total: %f)", (uint8_t *)&v18, 0x2Cu);
    }

    CFRelease(v3);
  }
  else
  {
    float v9 = 0.0;
  }
  uint64_t v11 = ABCImageStoreCopyPath();
  if (v11)
  {
    CFNumberRef v12 = (const void *)v11;
    int v13 = CPSqliteUtilitiesGetSchemaVersionAtPath();
    if (v13 == 8)
    {
      int v14 = 0;
      double v15 = 0.0;
    }
    else
    {
      int v14 = sub_25A0();
      double v15 = (float)v14 * 0.0000303441828;
    }
    float v9 = v15 + v9;
    long long v16 = ABOSLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109888;
      int v19 = v13;
      __int16 v20 = 1024;
      int v21 = v14;
      __int16 v22 = 2048;
      double v23 = v15;
      __int16 v24 = 2048;
      double v25 = v9;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "AB Migration estimate - Images DB (v%i) Size: %i - duration: %f (total: %f)", (uint8_t *)&v18, 0x22u);
    }

    CFRelease(v12);
  }
  return v9;
}

- (double)mainDbTime
{
  return self->_mainDbTime;
}

- (void)setMainDbTime:(double)a3
{
  self->_mainDbTime = a3;
}

- (double)imageDbTime
{
  return self->_imageDbTime;
}

- (void)setImageDbTime:(double)a3
{
  self->_imageDbTime = a3;
}

- (__CFArray)changedImagePersonIdentifiers
{
  return self->_changedImagePersonIdentifiers;
}

- (void)setChangedImagePersonIdentifiers:(__CFArray *)a3
{
  self->_changedImagePersonIdentifiers = a3;
}

@end