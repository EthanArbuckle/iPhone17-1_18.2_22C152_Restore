@interface LocalAttachmentCleanUpSupport
+ (void)cleanUpOrphanedFiles;
@end

@implementation LocalAttachmentCleanUpSupport

+ (void)cleanUpOrphanedFiles
{
  if (DMIsMigrationNeeded())
  {
    v2 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BBC88000, v2, OS_LOG_TYPE_DEFAULT, "Skipping attachment cleanup because migration is needed.", v5, 2u);
    }
  }
  else
  {
    uint64_t v3 = CalDatabaseCreateWithOptions();
    if (v3)
    {
      v4 = (const void *)v3;
      CalDatabaseCleanUpOrphanedLocalAttachments();
      CFRelease(v4);
    }
  }
}

@end