@interface NSString
- (BOOL)fpfs_isAppleDoubleFile;
- (BOOL)fpfs_isSafeSaveTempFile:(BOOL)a3;
- (id)fpfs_extractFSEventsBarrierUUID;
- (id)fpfs_extractFSEventsNotifyUUID;
- (id)fpfs_filenameExtension;
- (id)getUnicodeNormalization;
@end

@implementation NSString

- (id)fpfs_extractFSEventsBarrierUUID
{
  v2 = [(NSString *)self lastPathComponent];
  if ([v2 hasPrefix:@".rendez-vous."])
  {
    if (qword_100AE2AA8 != -1) {
      dispatch_once(&qword_100AE2AA8, &stru_100A69950);
    }
    v3 = objc_msgSend((id)qword_100AE2AA0, "firstMatchInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length"));
    if (v3)
    {
      id v4 = objc_alloc((Class)NSUUID);
      id v5 = [v3 rangeAtIndex:1];
      v7 = objc_msgSend(v2, "substringWithRange:", v5, v6);
      id v8 = [v4 initWithUUIDString:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)fpfs_extractFSEventsNotifyUUID
{
  v2 = [(NSString *)self lastPathComponent];
  if ([v2 hasPrefix:@".notify."])
  {
    if (qword_100AE2AB8 != -1) {
      dispatch_once(&qword_100AE2AB8, &stru_100A69970);
    }
    v3 = objc_msgSend((id)qword_100AE2AB0, "firstMatchInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length"));
    if (v3)
    {
      id v4 = objc_alloc((Class)NSUUID);
      id v5 = [v3 rangeAtIndex:1];
      v7 = objc_msgSend(v2, "substringWithRange:", v5, v6);
      id v8 = [v4 initWithUUIDString:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)fpfs_filenameExtension
{
  [(NSString *)self fileSystemRepresentation];
  v2 = (void *)fpfs_extension_in_filename();
  if (v2)
  {
    v2 = +[NSString fp_pathWithFileSystemRepresentation:v2];
  }

  return v2;
}

- (BOOL)fpfs_isSafeSaveTempFile:(BOOL)a3
{
  if (![(NSString *)self length]) {
    return 0;
  }
  bzero(v8, 0x400uLL);
  id v4 = [(NSString *)self fileSystemRepresentation];
  if ((unint64_t)__strlcpy_chk() <= 0x3FF) {
    return fpfs_path_is_safe_save_temp_file();
  }
  uint64_t v6 = strdup(v4);
  char is_safe_save_temp_file = fpfs_path_is_safe_save_temp_file();
  free(v6);
  return is_safe_save_temp_file;
}

- (BOOL)fpfs_isAppleDoubleFile
{
  v2 = [(NSString *)self fileSystemRepresentation];
  return *v2 == 46 && v2[1] == 95;
}

- (id)getUnicodeNormalization
{
  v2 = self;
  v3 = [(NSString *)v2 UTF8String];
  id v4 = [(NSString *)v2 decomposedStringWithCanonicalMapping];
  int v5 = strcmp(v3, (const char *)[v4 UTF8String]);

  if (!v5) {
    return @"D";
  }
  id v6 = [(NSString *)v2 precomposedStringWithCanonicalMapping];
  int v7 = strcmp(v3, (const char *)[v6 UTF8String]);

  if (!v7) {
    return @"C";
  }
  id v8 = [(NSString *)v2 decomposedStringWithCompatibilityMapping];
  int v9 = strcmp(v3, (const char *)[v8 UTF8String]);

  if (!v9) {
    return @"KD";
  }
  id v10 = [(NSString *)v2 precomposedStringWithCompatibilityMapping];
  int v11 = strcmp(v3, (const char *)[v10 UTF8String]);

  if (v11) {
    return @"(undefined)";
  }
  else {
    return @"KC";
  }
}

@end