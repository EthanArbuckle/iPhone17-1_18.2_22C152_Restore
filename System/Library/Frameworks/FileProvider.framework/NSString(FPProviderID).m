@interface NSString(FPProviderID)
- (uint64_t)fp_isValidProviderIdentifierWithError:()FPProviderID;
- (uint64_t)fp_usesDSCopyEngine;
@end

@implementation NSString(FPProviderID)

- (uint64_t)fp_usesDSCopyEngine
{
  if (([a1 isEqualToString:@"com.apple.FileProvider.LocalStorage"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) != 0)
  {
    return 1;
  }

  return [a1 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];
}

- (uint64_t)fp_isValidProviderIdentifierWithError:()FPProviderID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/:"];
  uint64_t v6 = [a1 rangeOfCharacterFromSet:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      __int16 v14 = 2112;
      v15 = @"/:";
      _os_log_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider identifier '%@' may not contain any of the characters '%@'", buf, 0x16u);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"Provider identifier '%@' may not contain any of the characters '%@'", a1, @"/:");
      goto LABEL_12;
    }
    return 0;
  }
  if (([a1 isEqualToString:@"."] & 1) != 0
    || [a1 isEqualToString:@".."])
  {
    v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = a1;
    }

    if (a3)
    {
LABEL_12:
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t result = 0;
      *a3 = v9;
      return result;
    }
    return 0;
  }
  return 1;
}

@end