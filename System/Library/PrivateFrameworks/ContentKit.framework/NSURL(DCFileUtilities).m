@interface NSURL(DCFileUtilities)
+ (id)wf_realLibraryDirectoryURL;
+ (id)wf_savedShortcutStatesURL;
+ (id)wf_shortcutsDirectoryURL;
+ (uint64_t)wf_realHomeDirectoryURL;
- (BOOL)wf_fileHasExtendedAttribute:()DCFileUtilities;
- (BOOL)wf_fileIsShortcutsOwned;
- (BOOL)wf_isContainedByDirectoryAtURL:()DCFileUtilities;
- (BOOL)wf_proposedFileIsContainedByDirectoryAtURL:()DCFileUtilities;
- (BOOL)wf_sandboxAllowsOperation:()DCFileUtilities;
- (BOOL)wf_sandboxAllowsOperation:()DCFileUtilities withAuditToken:;
- (__CFString)wf_relativePathFromURL:()DCFileUtilities;
- (id)wf_fileSize;
- (uint64_t)wf_fileExists;
- (uint64_t)wf_fileIsDirectory;
- (uint64_t)wf_fileIsOnSameVolumeAsURL:()DCFileUtilities;
- (uint64_t)wf_fileIsReadable;
- (uint64_t)wf_fileIsWritable;
- (uint64_t)wf_relationshipToDirectoryAtURL:()DCFileUtilities;
- (uint64_t)wf_sandboxAllowsReadingFile;
- (uint64_t)wf_sandboxAllowsReadingFileWithAuditToken:()DCFileUtilities;
- (uint64_t)wf_sandboxAllowsWritingFile;
- (uint64_t)wf_sandboxAllowsWritingFileWithAuditToken:()DCFileUtilities;
@end

@implementation NSURL(DCFileUtilities)

+ (id)wf_shortcutsDirectoryURL
{
  v1 = objc_msgSend(a1, "wf_realLibraryDirectoryURL");
  v2 = [v1 URLByAppendingPathComponent:@"Shortcuts" isDirectory:1];

  return v2;
}

+ (id)wf_realLibraryDirectoryURL
{
  v1 = objc_msgSend(a1, "wf_realHomeDirectoryURL");
  v2 = [v1 URLByAppendingPathComponent:@"Library" isDirectory:1];

  return v2;
}

+ (uint64_t)wf_realHomeDirectoryURL
{
  v0 = NSURL;
  uint64_t v1 = CPSharedResourcesDirectory();
  return [v0 fileURLWithPath:v1 isDirectory:1];
}

- (BOOL)wf_fileIsShortcutsOwned
{
  v2 = objc_msgSend(NSURL, "wf_shortcutsDirectoryURL");
  BOOL v3 = (objc_msgSend(a1, "wf_proposedFileIsContainedByDirectoryAtURL:", v2) & 1) != 0
    || +[WFTemporaryFileManager isTemporaryFile:a1];

  return v3;
}

- (uint64_t)wf_fileIsOnSameVolumeAsURL:()DCFileUtilities
{
  id v4 = a3;
  v5 = WFExistingFileFromURL(a1);
  v6 = WFExistingFileFromURL(v4);

  uint64_t v7 = 0;
  if (v5 && v6)
  {
    v19 = 0;
    uint64_t v8 = *MEMORY[0x263EFF860];
    id v18 = 0;
    [v5 getResourceValue:&v19 forKey:v8 error:&v18];
    v9 = v19;
    id v16 = 0;
    v17 = 0;
    id v10 = v18;
    id v11 = v9;
    [v6 getResourceValue:&v17 forKey:v8 error:&v16];
    v12 = v17;
    id v13 = v16;
    id v14 = v12;

    uint64_t v7 = [v11 isEqual:v14];
  }

  return v7;
}

- (BOOL)wf_proposedFileIsContainedByDirectoryAtURL:()DCFileUtilities
{
  id v4 = a3;
  v5 = WFExistingFileFromURL(a1);
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 URLByResolvingSymlinksInPath];
    uint64_t v8 = [v4 URLByResolvingSymlinksInPath];
    BOOL v9 = (unint64_t)objc_msgSend(v7, "wf_relationshipToDirectoryAtURL:", v8) < 2;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)wf_isContainedByDirectoryAtURL:()DCFileUtilities
{
  return objc_msgSend(a1, "wf_relationshipToDirectoryAtURL:") == 0;
}

- (__CFString)wf_relativePathFromURL:()DCFileUtilities
{
  id v4 = [a3 path];
  v5 = [a1 path];
  v6 = 0;
  if (v5 && v4)
  {
    if ([v4 isEqualToString:v5])
    {
      v6 = &stru_26C71CE08;
      goto LABEL_18;
    }
    if ([v4 hasPrefix:v5])
    {
      uint64_t v7 = [v5 length];
      uint64_t v8 = v4;
    }
    else
    {
      if (![v5 hasPrefix:v4])
      {
        v6 = 0;
        goto LABEL_18;
      }
      uint64_t v7 = [v4 length];
      uint64_t v8 = v5;
    }
    BOOL v9 = [v8 substringFromIndex:v7];
    if ([v9 length] && (objc_msgSend(v9, "isEqualToString:", @"/") & 1) == 0)
    {
      if ([v9 hasPrefix:@"/"])
      {
        id v10 = [v9 substringFromIndex:1];
      }
      else
      {
        id v10 = v9;
        BOOL v9 = v10;
      }
      v6 = v10;
    }
    else
    {
      v6 = &stru_26C71CE08;
    }
  }
LABEL_18:

  return v6;
}

- (uint64_t)wf_relationshipToDirectoryAtURL:()DCFileUtilities
{
  uint64_t v9 = 0;
  id v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  v6 = [v4 defaultManager];
  uint64_t v8 = 0;
  LODWORD(a1) = [v6 getRelationship:&v9 ofDirectoryAtURL:v5 toItemAtURL:a1 error:&v8];

  if (a1) {
    return v9;
  }
  else {
    return 2;
  }
}

- (id)wf_fileSize
{
  if ([a1 isFileURL])
  {
    v2 = [MEMORY[0x263F08850] defaultManager];
    BOOL v3 = [a1 path];
    id v4 = [v2 attributesOfItemAtPath:v3 error:0];
    id v5 = [v4 objectForKey:*MEMORY[0x263F080B8]];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)wf_fileHasExtendedAttribute:()DCFileUtilities
{
  id v4 = a3;
  if (!v4)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    id v11 = [NSString stringWithUTF8String:"-[NSURL(DCFileUtilities) wf_fileHasExtendedAttribute:]"];
    [v10 handleFailureInFunction:v11, @"NSURL+DCFileUtilities.m", 98, @"Invalid parameter not satisfying: %@", @"attributeName" file lineNumber description];
  }
  id v5 = [a1 path];
  v6 = (const char *)[v5 UTF8String];
  id v7 = v4;
  ssize_t v8 = getxattr(v6, (const char *)[v7 UTF8String], 0, 0, 0, 0);

  return v8 >= 0;
}

- (uint64_t)wf_sandboxAllowsWritingFileWithAuditToken:()DCFileUtilities
{
  long long v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  return objc_msgSend(a1, "wf_sandboxAllowsOperation:withAuditToken:", "file-write-data", v5);
}

- (uint64_t)wf_sandboxAllowsReadingFileWithAuditToken:()DCFileUtilities
{
  long long v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  return objc_msgSend(a1, "wf_sandboxAllowsOperation:withAuditToken:", "file-read-data", v5);
}

- (uint64_t)wf_sandboxAllowsWritingFile
{
  return objc_msgSend(a1, "wf_sandboxAllowsOperation:", "file-write-data");
}

- (uint64_t)wf_sandboxAllowsReadingFile
{
  return objc_msgSend(a1, "wf_sandboxAllowsOperation:", "file-read-data");
}

- (BOOL)wf_sandboxAllowsOperation:()DCFileUtilities withAuditToken:
{
  return sandbox_check_by_audit_token() == 0;
}

- (BOOL)wf_sandboxAllowsOperation:()DCFileUtilities
{
  if (!sandbox_check()) {
    return 1;
  }
  getpid();
  [a1 fileSystemRepresentation];
  return sandbox_check() == 0;
}

- (uint64_t)wf_fileIsDirectory
{
  char v6 = 0;
  v2 = [MEMORY[0x263F08850] defaultManager];
  long long v3 = [a1 path];
  unsigned int v4 = [v2 fileExistsAtPath:v3 isDirectory:&v6];

  if (v6) {
    return v4;
  }
  else {
    return 0;
  }
}

- (uint64_t)wf_fileIsWritable
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  long long v3 = [a1 path];
  uint64_t v4 = [v2 isWritableFileAtPath:v3];

  return v4;
}

- (uint64_t)wf_fileIsReadable
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  long long v3 = [a1 path];
  uint64_t v4 = [v2 isReadableFileAtPath:v3];

  return v4;
}

- (uint64_t)wf_fileExists
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  long long v3 = [a1 path];
  uint64_t v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

+ (id)wf_savedShortcutStatesURL
{
  v0 = +[WFTemporaryFileManager sharedAppGroupDirectoryURL];
  uint64_t v1 = [v0 URLByAppendingPathComponent:@"SavedShortcutStates" isDirectory:1];

  return v1;
}

@end