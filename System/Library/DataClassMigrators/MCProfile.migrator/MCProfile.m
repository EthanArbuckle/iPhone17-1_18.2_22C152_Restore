void sub_2390(void *a1)
{
  id v1;
  _UNKNOWN **v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  NSFileProtectionType v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _UNKNOWN **v14;
  void *v15;
  void *v16;
  NSFileProtectionType v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  NSFileAttributeKey v29;
  NSFileProtectionType v30;
  NSFileAttributeKey v31;
  NSFileProtectionType v32;

  v1 = a1;
  v28 = 0;
  v2 = &MCCloudConfigurationDetailsFilePath_ptr;
  v3 = +[NSFileManager defaultManager];
  if ([v3 fileExistsAtPath:v1 isDirectory:&v28]) {
    v4 = v28 == 0;
  }
  else {
    v4 = 1;
  }
  if (!v4)
  {
    v5 = +[NSFileManager defaultManager];
    v27 = 0;
    v6 = [v5 attributesOfItemAtPath:v1 error:&v27];
    v7 = v27;

    if (!v7)
    {
      v8 = [v6 objectForKeyedSubscript:NSFileProtectionKey];

      if (v8 == NSFileProtectionNone) {
        goto LABEL_8;
      }
      v31 = NSFileProtectionKey;
      v32 = NSFileProtectionNone;
      v9 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v26 = 0;
      [v3 setAttributes:v9 ofItemAtPath:v1 error:&v26];
      v7 = v26;

      if (!v7)
      {
LABEL_8:
        v22 = v3;
        v23 = objc_msgSend(v3, "enumeratorAtPath:", v1, v6);
        v10 = [v23 nextObject];
        if (v10)
        {
          v11 = (void *)v10;
          v12 = 0;
          do
          {
            v13 = [v1 stringByAppendingPathComponent:v11];
            v14 = v2;
            v15 = [v2[37] defaultManager];
            v25 = v12;
            v16 = [v15 attributesOfItemAtPath:v13 error:&v25];
            v7 = v25;

            v17 = [v16 objectForKeyedSubscript:NSFileProtectionKey];

            if (v17 != NSFileProtectionNone)
            {
              v29 = NSFileProtectionKey;
              v30 = NSFileProtectionNone;
              v18 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
              v24 = v7;
              [v22 setAttributes:v18 ofItemAtPath:v13 error:&v24];
              v19 = v24;

              v7 = v19;
            }

            v20 = [v23 nextObject];

            v11 = (void *)v20;
            v12 = v7;
            v2 = v14;
          }
          while (v20);
        }
        else
        {
          v7 = 0;
        }

        v6 = v21;
        v3 = v22;
      }
    }
  }
}

void sub_264C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  _DMLogFunc();
  id v3 = +[MCProfileConnection sharedConnection];
  objc_msgSend(v3, "migrateWithContext:passcodeWasSetInBackup:completion:", *(unsigned int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "wasPasscodeSetInBackup"), 0);
}

void sub_2E3C(id a1, NSError *a2)
{
  if (!a2 && ((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0) {
    __break(0xC471u);
  }
  _DMLogFunc();
}

uint64_t MCCloudConfigurationDetailsFilePath()
{
  return _MCCloudConfigurationDetailsFilePath();
}

uint64_t MCLegacyCloudConfigurationDetailsFilePath()
{
  return _MCLegacyCloudConfigurationDetailsFilePath();
}

uint64_t MCLegacyPostSetupAutoInstallProfilePath()
{
  return _MCLegacyPostSetupAutoInstallProfilePath();
}

uint64_t MCPostSetupAutoInstallProfilePath()
{
  return _MCPostSetupAutoInstallProfilePath();
}

uint64_t MCSendCloudConfigurationDetailsChangedNotification()
{
  return _MCSendCloudConfigurationDetailsChangedNotification();
}

uint64_t MCSystemMetadataFilePath()
{
  return _MCSystemMetadataFilePath();
}

uint64_t MCSystemProfileStorageDirectory()
{
  return _MCSystemProfileStorageDirectory();
}

uint64_t MCSystemPublicInfoDirectory()
{
  return _MCSystemPublicInfoDirectory();
}

uint64_t MCUserMetadataFilePath()
{
  return _MCUserMetadataFilePath();
}

uint64_t _DMLogFunc()
{
  return __DMLogFunc();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_msgSend__allowGrandfatheredRestrictionsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _allowGrandfatheredRestrictionsIfNeeded];
}

id objc_msgSend__createSystemMetadataFileIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createSystemMetadataFileIfNeeded];
}

id objc_msgSend__handleUnsupervisedGrandfatheredRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _handleUnsupervisedGrandfatheredRestrictions];
}

id objc_msgSend__placeholderCloudConfig(void *a1, const char *a2, ...)
{
  return [a1 _placeholderCloudConfig];
}

id objc_msgSend__recomputeProfileRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _recomputeProfileRestrictions];
}

id objc_msgSend__stopAllowingGrandfatheredRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _stopAllowingGrandfatheredRestrictions];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didMigrateBackupFromDifferentDevice(void *a1, const char *a2, ...)
{
  return [a1 didMigrateBackupFromDifferentDevice];
}

id objc_msgSend_didRestoreFromBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromBackup];
}

id objc_msgSend_didUpgrade(void *a1, const char *a2, ...)
{
  return [a1 didUpgrade];
}

id objc_msgSend_effectiveGrandfatheredRestrictionPayloadKeysDictionary(void *a1, const char *a2, ...)
{
  return [a1 effectiveGrandfatheredRestrictionPayloadKeysDictionary];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedHacks(void *a1, const char *a2, ...)
{
  return [a1 sharedHacks];
}

id objc_msgSend_wasPasscodeSetInBackup(void *a1, const char *a2, ...)
{
  return [a1 wasPasscodeSetInBackup];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}