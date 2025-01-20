@interface NSString(FSPathAdditions)
- (BOOL)fpfs_isAppleDoubleFile;
- (id)fpfs_extractFSEventsBarrierUUID;
- (id)fpfs_extractFSEventsNotifyUUID;
- (id)fpfs_filenameExtension;
- (uint64_t)fpfs_isSafeSaveTempFile:()FSPathAdditions;
@end

@implementation NSString(FSPathAdditions)

- (id)fpfs_extractFSEventsBarrierUUID
{
  v1 = [a1 lastPathComponent];
  if ([v1 hasPrefix:@".rendez-vous."])
  {
    if (fpfs_extractFSEventsBarrierUUID_once[0] != -1) {
      dispatch_once(fpfs_extractFSEventsBarrierUUID_once, &__block_literal_global);
    }
    v2 = objc_msgSend((id)fpfs_extractFSEventsBarrierUUID_regexp, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
    if (v2)
    {
      id v3 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v4 = [v2 rangeAtIndex:1];
      v6 = objc_msgSend(v1, "substringWithRange:", v4, v5);
      v7 = (void *)[v3 initWithUUIDString:v6];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fpfs_extractFSEventsNotifyUUID
{
  v1 = [a1 lastPathComponent];
  if ([v1 hasPrefix:@".notify."])
  {
    if (fpfs_extractFSEventsNotifyUUID_once != -1) {
      dispatch_once(&fpfs_extractFSEventsNotifyUUID_once, &__block_literal_global_10);
    }
    v2 = objc_msgSend((id)fpfs_extractFSEventsNotifyUUID_regexp, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
    if (v2)
    {
      id v3 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v4 = [v2 rangeAtIndex:1];
      v6 = objc_msgSend(v1, "substringWithRange:", v4, v5);
      v7 = (void *)[v3 initWithUUIDString:v6];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)fpfs_filenameExtension
{
  [a1 fileSystemRepresentation];
  v1 = (void *)fpfs_extension_in_filename();
  if (v1)
  {
    v1 = objc_msgSend(NSString, "fp_pathWithFileSystemRepresentation:", v1);
  }

  return v1;
}

- (uint64_t)fpfs_isSafeSaveTempFile:()FSPathAdditions
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (![a1 length]) {
    return 0;
  }
  bzero(v6, 0x400uLL);
  v2 = (const char *)[a1 fileSystemRepresentation];
  if ((unint64_t)__strlcpy_chk() <= 0x3FF) {
    return fpfs_path_is_safe_save_temp_file();
  }
  uint64_t v4 = strdup(v2);
  uint64_t is_safe_save_temp_file = fpfs_path_is_safe_save_temp_file();
  free(v4);
  return is_safe_save_temp_file;
}

- (BOOL)fpfs_isAppleDoubleFile
{
  v1 = (unsigned char *)[a1 fileSystemRepresentation];
  return *v1 == 46 && v1[1] == 95;
}

@end