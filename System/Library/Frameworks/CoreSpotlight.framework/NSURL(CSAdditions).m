@interface NSURL(CSAdditions)
- (uint64_t)cs_addDocumentTracking;
- (uint64_t)cs_isInMobileDocuments;
- (void)cs_addDocumentTracking;
- (void)cs_isInMobileDocuments;
@end

@implementation NSURL(CSAdditions)

- (uint64_t)cs_isInMobileDocuments
{
  id v9 = 0;
  uint64_t v1 = *MEMORY[0x1E4F1C690];
  id v8 = 0;
  char v2 = [a1 getResourceValue:&v9 forKey:v1 error:&v8];
  id v3 = v9;
  id v4 = v8;
  if ((v2 & 1) == 0)
  {
    v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(NSURL(CSAdditions) *)(uint64_t)v4 cs_isInMobileDocuments];
    }
  }
  uint64_t v6 = [v3 BOOLValue];

  return v6;
}

- (uint64_t)cs_addDocumentTracking
{
  memset(&v10, 0, sizeof(v10));
  uint64_t v1 = (const char *)[a1 fileSystemRepresentation];
  getpid();
  if (!sandbox_check())
  {
    int v4 = open(v1, 256, v1);
    if (v4 < 0)
    {
      int v7 = *__error();
      if (v7 != 2)
      {
        id v8 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(NSURL(CSAdditions) *)(uint64_t)v1 cs_addDocumentTracking];
        }
      }
      return 0;
    }
    int v5 = v4;
    if (fstat(v4, &v10))
    {
      uint64_t v6 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[NSURL(CSAdditions) cs_addDocumentTracking]();
      }
    }
    else
    {
      if ((v10.st_flags & 0x40) != 0 || !fchflags(v5, v10.st_flags | 0x40))
      {
        uint64_t v3 = 1;
        goto LABEL_20;
      }
      uint64_t v6 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[NSURL(CSAdditions) cs_addDocumentTracking]();
      }
    }

    uint64_t v3 = 0;
LABEL_20:
    close(v5);
    return v3;
  }
  char v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    [(NSURL(CSAdditions) *)(uint64_t)v1 cs_addDocumentTracking];
  }

  return 0;
}

- (void)cs_isInMobileDocuments
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "Couldn't get value for NSURLIsUbiquitousItemKey, error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)cs_addDocumentTracking
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "sandbox_check for \"file-write-flags\" failed at \"%s\"", (uint8_t *)&v2, 0xCu);
}

@end