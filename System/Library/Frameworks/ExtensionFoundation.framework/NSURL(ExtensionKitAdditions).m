@interface NSURL(ExtensionKitAdditions)
- (id)_EX_containingApplicationBundleURL;
- (uint64_t)_EX_isApplication;
- (uint64_t)_EX_isContainedInDirectory:()ExtensionKitAdditions;
- (uint64_t)_EX_isDirectory;
- (void)_EX_isApplication;
- (void)_EX_isDirectory;
@end

@implementation NSURL(ExtensionKitAdditions)

- (uint64_t)_EX_isDirectory
{
  v1 = [a1 URLByResolvingSymlinksInPath];
  id v10 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C628];
  id v9 = 0;
  int v3 = [v1 getResourceValue:&v10 forKey:v2 error:&v9];
  id v4 = v10;
  id v5 = v9;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [v4 BOOLValue];
  }
  else
  {
    v7 = _EXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(ExtensionKitAdditions) _EX_isDirectory]();
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)_EX_isApplication
{
  id v9 = 0;
  uint64_t v1 = *MEMORY[0x1E4F1C618];
  id v8 = 0;
  int v2 = [a1 getResourceValue:&v9 forKey:v1 error:&v8];
  id v3 = v9;
  id v4 = v8;
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [v3 BOOLValue];
  }
  else
  {
    uint64_t v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(ExtensionKitAdditions) _EX_isApplication]();
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_EX_containingApplicationBundleURL
{
  uint64_t v1 = [a1 absoluteURL];
  id v2 = [v1 URLByDeletingLastPathComponent];

  id v3 = (void *)MEMORY[0x192FEB110]();
  id v4 = [v2 path];
  uint64_t v5 = (void *)[v4 length];

  if (v5)
  {
    while (!objc_msgSend(v2, "_EX_isApplication"))
    {
      uint64_t v6 = [v2 URLByDeletingLastPathComponent];

      v7 = [v6 path];
      uint64_t v5 = (void *)[v7 length];

      id v2 = v6;
      if (!v5)
      {
        id v2 = v6;
        goto LABEL_6;
      }
    }
    id v2 = v2;
    uint64_t v5 = v2;
  }
LABEL_6:

  return v5;
}

- (uint64_t)_EX_isContainedInDirectory:()ExtensionKitAdditions
{
  uint64_t v9 = 2;
  id v4 = (void *)MEMORY[0x1E4F28CB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultManager];
  unsigned int v7 = [v6 getRelationship:&v9 ofDirectoryAtURL:v5 toItemAtURL:a1 error:0];

  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

- (void)_EX_isDirectory
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "Failed to get NSURLIsDirectoryKey property for URL '%@' with error '%{public}@'");
}

- (void)_EX_isApplication
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "Failed to get NSURLIsApplicationKey property for URL '%@' with error '%{public}@'");
}

@end