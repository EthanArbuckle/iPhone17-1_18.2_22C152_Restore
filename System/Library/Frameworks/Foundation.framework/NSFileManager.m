@interface NSFileManager
+ (NSFileManager)defaultManager;
- (BOOL)_handleFaultedOutCloudDocFromSource:(id)a3 toDestination:(id)a4 handled:(BOOL *)a5 error:(id *)a6;
- (BOOL)_processCanAccessUbiquityIdentityToken;
- (BOOL)_processHasUbiquityContainerEntitlement;
- (BOOL)_processUsesCloudServices;
- (BOOL)_web_changeFileAttributes_nowarn:(id)a3 atPath:(id)a4;
- (BOOL)_web_changeFinderAttributes:(id)a3 forFileAtPath:(id)a4;
- (BOOL)_web_createDirectoryAtPathWithIntermediateDirectories:(id)a3 attributes:(id)a4;
- (BOOL)_web_createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5;
- (BOOL)_web_createFileAtPathWithIntermediateDirectories:(id)a3 contents:(id)a4 attributes:(id)a5 directoryAttributes:(id)a6;
- (BOOL)_web_createIntermediateDirectoriesForPath_nowarn:(id)a3 attributes:(id)a4;
- (BOOL)_web_fileExistsAtPath_nowarn:(id)a3 isDirectory:(BOOL *)a4 traverseLink:(BOOL)a5;
- (BOOL)_web_removeFileOnlyAtPath:(id)a3;
- (BOOL)changeCurrentDirectoryPath:(NSString *)path;
- (BOOL)changeFileAttributes:(NSDictionary *)attributes atPath:(NSString *)path;
- (BOOL)contentsEqualAtPath:(NSString *)path1 andPath:(NSString *)path2;
- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error;
- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)copyItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error;
- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)createDirectoryAtPath:(NSString *)path attributes:(NSDictionary *)attributes;
- (BOOL)createDirectoryAtPath:(NSString *)path withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError *)error;
- (BOOL)createDirectoryAtURL:(NSURL *)url withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError *)error;
- (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data attributes:(NSDictionary *)attr;
- (BOOL)createSymbolicLinkAtPath:(NSString *)path pathContent:(NSString *)otherpath;
- (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)destPath error:(NSError *)error;
- (BOOL)createSymbolicLinkAtURL:(NSURL *)url withDestinationURL:(NSURL *)destURL error:(NSError *)error;
- (BOOL)directoryCanBeCreatedAtPath:(id)a3;
- (BOOL)evictUbiquitousItemAtURL:(NSURL *)url error:(NSError *)error;
- (BOOL)fileExistsAtPath:(NSString *)path;
- (BOOL)fileExistsAtPath:(NSString *)path isDirectory:(BOOL *)isDirectory;
- (BOOL)getFileSystemRepresentation:(char *)a3 maxLength:(unint64_t)a4 withPath:(id)a5;
- (BOOL)getRelationship:(NSURLRelationship *)outRelationship ofDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domainMask toItemAtURL:(NSURL *)url error:(NSError *)error;
- (BOOL)getRelationship:(NSURLRelationship *)outRelationship ofDirectoryAtURL:(NSURL *)directoryURL toItemAtURL:(NSURL *)otherURL error:(NSError *)error;
- (BOOL)isDeletableFileAtPath:(NSString *)path;
- (BOOL)isExecutableFileAtPath:(NSString *)path;
- (BOOL)isReadableFileAtPath:(NSString *)path;
- (BOOL)isUbiquitousItemAtURL:(NSURL *)url;
- (BOOL)isWritableFileAtPath:(NSString *)path;
- (BOOL)linkItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error;
- (BOOL)linkItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error;
- (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error;
- (BOOL)moveItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error;
- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)removeFileAtPath:(NSString *)path handler:(id)handler;
- (BOOL)removeItemAtPath:(NSString *)path error:(NSError *)error;
- (BOOL)removeItemAtURL:(NSURL *)URL error:(NSError *)error;
- (BOOL)replaceItemAtURL:(NSURL *)originalItemURL withItemAtURL:(NSURL *)newItemURL backupItemName:(NSString *)backupItemName options:(NSFileManagerItemReplacementOptions)options resultingItemURL:(NSURL *)resultingURL error:(NSError *)error;
- (BOOL)setAttributes:(NSDictionary *)attributes ofItemAtPath:(NSString *)path error:(NSError *)error;
- (BOOL)setUbiquitous:(BOOL)flag itemAtURL:(NSURL *)url destinationURL:(NSURL *)destinationURL error:(NSError *)error;
- (BOOL)startDownloadingUbiquitousItemAtURL:(NSURL *)url error:(NSError *)error;
- (BOOL)trashItemAtURL:(NSURL *)url resultingItemURL:(NSURL *)outResultingURL error:(NSError *)error;
- (NSArray)URLsForDirectory:(NSSearchPathDirectory)directory inDomains:(NSSearchPathDomainMask)domainMask;
- (NSArray)componentsToDisplayForPath:(NSString *)path;
- (NSArray)contentsOfDirectoryAtPath:(NSString *)path error:(NSError *)error;
- (NSArray)contentsOfDirectoryAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray *)keys options:(NSDirectoryEnumerationOptions)mask error:(NSError *)error;
- (NSArray)directoryContentsAtPath:(NSString *)path;
- (NSArray)mountedVolumeURLsIncludingResourceValuesForKeys:(NSArray *)propertyKeys options:(NSVolumeEnumerationOptions)options;
- (NSArray)subpathsAtPath:(NSString *)path;
- (NSArray)subpathsOfDirectoryAtPath:(NSString *)path error:(NSError *)error;
- (NSData)contentsAtPath:(NSString *)path;
- (NSDictionary)attributesOfFileSystemForPath:(NSString *)path error:(NSError *)error;
- (NSDictionary)attributesOfItemAtPath:(NSString *)path error:(NSError *)error;
- (NSDictionary)fileAttributesAtPath:(NSString *)path traverseLink:(BOOL)yorn;
- (NSDictionary)fileSystemAttributesAtPath:(NSString *)path;
- (NSDirectoryEnumerator)enumeratorAtPath:(NSString *)path;
- (NSDirectoryEnumerator)enumeratorAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray *)keys options:(NSDirectoryEnumerationOptions)mask errorHandler:(void *)handler;
- (NSFileManager)init;
- (NSFileManager)retain;
- (NSString)currentDirectoryPath;
- (NSString)destinationOfSymbolicLinkAtPath:(NSString *)path error:(NSError *)error;
- (NSString)displayNameAtPath:(NSString *)path;
- (NSString)pathContentOfSymbolicLinkAtPath:(NSString *)path;
- (NSString)stringWithFileSystemRepresentation:(const char *)str length:(NSUInteger)len;
- (NSURL)URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain appropriateForURL:(NSURL *)url create:(BOOL)shouldCreate error:(NSError *)error;
- (NSURL)URLForPublishingUbiquitousItemAtURL:(NSURL *)url expirationDate:(NSDate *)outDate error:(NSError *)error;
- (NSURL)URLForUbiquityContainerIdentifier:(NSString *)containerIdentifier;
- (NSURL)containerURLForSecurityApplicationGroupIdentifier:(NSString *)groupIdentifier;
- (NSURL)temporaryDirectory;
- (const)fileSystemRepresentationWithPath:(NSString *)path;
- (id)_URLForReplacingItemAtURL:(id)a3 error:(id *)a4;
- (id)_URLForTrashingItemAtURL:(id)a3 create:(BOOL)a4 error:(id *)a5;
- (id)_attributesOfItemAtPath:(id)a3 filterResourceFork:(BOOL)a4 error:(id *)a5;
- (id)_attributesOfItemAtURL:(id)a3 filterResourceFork:(BOOL)a4 error:(id *)a5;
- (id)_displayPathForPath:(id)a3;
- (id)_safeDelegate;
- (id)_web_carbonPathForPath_nowarn:(id)a3;
- (id)_web_pathWithUniqueFilenameForPath:(id)a3;
- (id)_web_startupVolumeName_nowarn;
- (id)_web_visibleItemsInDirectoryAtPath:(id)a3;
- (id)delegate;
- (id)directoryContentsAtPath:(id)a3 matchingExtension:(id)a4 options:(int64_t)a5 keepExtension:(BOOL)a6;
- (id)directoryContentsAtPath:(id)a3 matchingExtension:(id)a4 options:(int64_t)a5 keepExtension:(BOOL)a6 error:(id *)a7;
- (id)ubiquityIdentityToken;
- (void)_performRemoveFileAtPath:(id)a3;
- (void)_web_backgroundRemoveFileAtPath:(id)a3;
- (void)_web_backgroundRemoveLeftoverFiles:(id)a3;
- (void)dealloc;
- (void)getFileProviderMessageInterfacesForItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)getFileProviderServicesForItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler;
- (void)release;
- (void)setDelegate:(id)delegate;
- (void)synchronouslyGetFileProviderServiceWithName:(id)a3 forItemAtURL:(id)a4 completionHandler:(id)a5;
- (void)synchronouslyGetFileProviderServicesForItemAtURL:(id)a3 completionHandler:(id)a4;
@end

@implementation NSFileManager

+ (NSFileManager)defaultManager
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__NSFileManager_defaultManager__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = a1;
  if (qword_1EB1ECE38 != -1) {
    dispatch_once(&qword_1EB1ECE38, v3);
  }
  return (NSFileManager *)qword_1EB1ECE40;
}

- (BOOL)getFileSystemRepresentation:(char *)a3 maxLength:(unint64_t)a4 withPath:(id)a5
{
  return _NSGetFileSystemRepresentation(a3, a4, a5);
}

- (const)fileSystemRepresentationWithPath:(NSString *)path
{
  return (const char *)_NSFileSystemRepresentationWithPath((__CFString *)path);
}

- (NSString)displayNameAtPath:(NSString *)path
{
  if (path)
  {
    swiftBridge = self->swiftBridge;
    return (NSString *)-[_NSFileManagerBridge displayNameAtPath:](swiftBridge, "displayNameAtPath:");
  }
  else
  {
    v5 = objc_msgSend((id)objc_msgSend(0, "lastPathComponent"), "componentsSeparatedByString:", @":");
    return (NSString *)[v5 componentsJoinedByString:@"/"];
  }
}

- (NSDirectoryEnumerator)enumeratorAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray *)keys options:(NSDirectoryEnumerationOptions)mask errorHandler:(void *)handler
{
  if (!url)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  v6 = [[NSURLDirectoryEnumerator alloc] initWithURL:url includingPropertiesForKeys:keys options:mask errorHandler:handler];

  return (NSDirectoryEnumerator *)v6;
}

- (BOOL)fileExistsAtPath:(NSString *)path isDirectory:(BOOL *)isDirectory
{
  return path
      && [(_NSFileManagerBridge *)self->swiftBridge fileExistsAtPath:path isDirectory:isDirectory];
}

- (BOOL)createDirectoryAtURL:(NSURL *)url withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError *)error
{
  if (!url)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  swiftBridge = self->swiftBridge;

  return -[_NSFileManagerBridge createDirectoryAt:withIntermediateDirectories:attributes:error:](swiftBridge, "createDirectoryAt:withIntermediateDirectories:attributes:error:");
}

- (NSURL)containerURLForSecurityApplicationGroupIdentifier:(NSString *)groupIdentifier
{
  [(NSString *)groupIdentifier UTF8String];
  result = (NSURL *)container_create_or_lookup_app_group_path_by_app_group_identifier();
  if (result)
  {
    v4 = result;
    v5 = (NSURL *)[MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:result isDirectory:1 relativeToURL:0];
    free(v4);
    return v5;
  }
  return result;
}

- (id)_URLForReplacingItemAtURL:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__3;
  v51 = __Block_byref_object_dispose__3;
  uint64_t v52 = 0;
  if (![a3 fileSystemRepresentation]
    || !_dirhelper_relative()
    && (!objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "fileSystemRepresentation")
     || !_dirhelper_relative())
    || (v6 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:__s isDirectory:1 relativeToURL:0], (v7 = v6) != 0)&& ((*(void *)__s = 0, v46 = 0, uint64_t v8 = *MEMORY[0x1E4F1C820], v9 = objc_msgSend(v6, "getResourceValue:forKey:error:", __s, *MEMORY[0x1E4F1C820], 0), (objc_msgSend(a3, "getResourceValue:forKey:error:", &v46, v8, 0) & 1) == 0)? (v10 = objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "getResourceValue:forKey:error:", &v46, v8, 0)): (v10 = 1), (v9 & v10) != 1 || (objc_msgSend(*(id *)__s, "isEqual:", v46) & 1) == 0))
  {
    v7 = 0;
  }
  getpid();
  int v11 = sandbox_check();
  if (!v7 && v11)
  {
    v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "path"), "fileSystemRepresentation");
    v13 = (char *)_amkrtemp();
    if (v13
      || (int v17 = _NSOpenFileDescriptor(v12, 512, 448), (v17 & 0x80000000) == 0)
      && (close(v17), (v13 = (char *)_amkrtemp()) != 0))
    {
      if (mkdir(v13, 0x1C0u))
      {
        if (a4)
        {
          uint64_t v14 = *__error();
          v15 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo((int)v14, (uint64_t)a3, 0, 0, 0);
          *a4 = v15;
          if (![(NSError *)v15 localizedFailureReason]) {
            NSLog((NSString *)@"Foundation called mkdir(\"%s\"), it didn't return 0, and errno was set to %i.", v13, v14);
          }
        }
      }
      else
      {
        uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13), 1);
        v48[5] = v34;
      }
      free(v13);
      goto LABEL_64;
    }
    goto LABEL_24;
  }
  if (!v7)
  {
LABEL_24:
    v7 = (void *)[a3 URLByDeletingLastPathComponent];
    BOOL v16 = [(id)_NSFoundationBundle() localizedStringForKey:@"(A Document Being Saved By %@)" value:&stru_1ECA5C228 table:@"Document"] != 0;
    goto LABEL_25;
  }
  BOOL v16 = 0;
LABEL_25:
  id v46 = 0;
  if ([v7 getResourceValue:&v46 forKey:*MEMORY[0x1E4F1C858] error:0]) {
    char v18 = [v46 BOOLValue];
  }
  else {
    char v18 = 0;
  }
  MainBundle = CFBundleGetMainBundle();
  ValueForInfoDictionaryKey = (NSString *)CFBundleGetValueForInfoDictionaryKey(MainBundle, @"CFBundleName");
  if (!ValueForInfoDictionaryKey) {
    ValueForInfoDictionaryKey = [+[NSProcessInfo processInfo] processName];
  }
  v21 = [(NSString *)ValueForInfoDictionaryKey stringByReplacingOccurrencesOfString:@"/" withString:@":"];
  v22 = v21;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v41 = __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke;
  v42 = &unk_1E51F7CF0;
  char v45 = v18;
  v43 = &v47;
  v44 = a4;
  if (!v16)
  {
    if ([(NSString *)v21 length] >= 0x41) {
      v22 = [(NSString *)v22 substringToIndex:64];
    }
    v30 = (void *)[v7 URLByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NSIRD_%@_", v22), 0 isDirectory];
    bzero(__s, 0x402uLL);
    [v30 getFileSystemRepresentation:__s maxLength:1018];
    if (v48[5]) {
      goto LABEL_64;
    }
    v31 = &__s[strlen(__s)];
    while (1)
    {
      strcpy(v31, "XXXXXX");
      if (!mktemp(__s)) {
        break;
      }
      uint64_t v32 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:__s isDirectory:1 relativeToURL:0];
      int v33 = v41((uint64_t)v40, v32);
      if (v33)
      {
        if (v33 != 17)
        {
          if (!a4) {
            goto LABEL_64;
          }
          v38 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v33, (uint64_t)a3, 0, 0, 0);
          goto LABEL_73;
        }
        if (v48[5]) {
          goto LABEL_64;
        }
      }
      else
      {
        v48[5] = v32;
        if (v32) {
          goto LABEL_64;
        }
      }
    }
    if (!a4) {
      goto LABEL_64;
    }
    v37 = __error();
    v38 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v37, (uint64_t)a3, 0, 0, 0);
LABEL_73:
    *a4 = v38;
    goto LABEL_64;
  }
  if (v48[5]) {
    goto LABEL_64;
  }
  int v23 = 1;
  char v24 = 1;
  while (1)
  {
    if (v24)
    {
      if (v23 < 2) {
        v25 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"(A Document Being Saved By %@)" value:&stru_1ECA5C228 table:@"Document"], v22);
      }
      else {
        v25 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"(A Document Being Saved By %@ %ld)" value:&stru_1ECA5C228 table:@"Document"], v22, v23);
      }
    }
    else if (v23 < 2)
    {
      v25 = -[NSString initWithString:]([NSString alloc], "initWithString:", [(id)_NSFoundationBundle() localizedStringForKey:@"(A Document Being Saved)" value:&stru_1ECA5C228 table:@"Document"]);
    }
    else
    {
      v25 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"(A Document Being Saved %ld)" value:&stru_1ECA5C228 table:@"Document"], v23);
    }
    v26 = v25;
    v27 = (void *)[v7 URLByAppendingPathComponent:v25 isDirectory:1];

    uint64_t v28 = v41((uint64_t)v40, (uint64_t)v27);
    uint64_t v29 = v28;
    if ((int)v28 <= 62)
    {
      if (v28)
      {
        if (v28 != 17) {
          goto LABEL_68;
        }
        if (v23 >= 1000)
        {
          if (a4)
          {
            v53 = @"NSDebugDescription";
            v54 = +[NSString stringWithFormat:@"Too many temporary directories for %@ in %@", v22, v7];
            *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 512, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1]);
          }
          goto LABEL_64;
        }
        ++v23;
      }
      else
      {
        v48[5] = (uint64_t)v27;
      }
      goto LABEL_49;
    }
    if (v28 != 63) {
      break;
    }
    if ((v24 & 1) == 0) {
      goto LABEL_68;
    }
    char v24 = 0;
    int v23 = 1;
LABEL_49:
    if (v48[5]) {
      goto LABEL_64;
    }
  }
  if (v28 == 1000000) {
    goto LABEL_64;
  }
LABEL_68:
  if (a4)
  {
    v39 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo((int)v28, (uint64_t)a3, 0, 0, 0);
    *a4 = v39;
    if (![(NSError *)v39 localizedFailureReason]) {
      NSLog((NSString *)@"Foundation called mkdir(\"%@\"), it didn't return 0, and errno was set to %i.", [v27 path], v29);
    }
  }
LABEL_64:
  v35 = (void *)v48[5];
  _Block_object_dispose(&v47, 8);
  return v35;
}

uint64_t __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 1000000;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  int v9 = __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_2;
  int v10 = &unk_1E51F7CC8;
  uint64_t v11 = a2;
  v12 = &v13;
  if (qword_1EB1ECE30 != -1) {
    dispatch_once(&qword_1EB1ECE30, &__block_literal_global_280);
  }
  if (*(unsigned char *)(a1 + 48) || !_MergedGlobals_25_0)
  {
    ((void (*)(void *, uint64_t))v9)(v8, a2);
  }
  else
  {
    v4 = objc_alloc_init(NSFileCoordinator);
    [(NSFileCoordinator *)v4 coordinateWritingItemAtURL:a2 options:0 error:*(void *)(a1 + 40) byAccessor:v8];
  }
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v6 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v6;
}

int *__49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_2(uint64_t a1)
{
  result = (int *)mkdir((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], 0x1C0u);
  if (result)
  {
    result = __error();
    int v3 = *result;
  }
  else
  {
    int v3 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (NSDictionary)attributesOfItemAtPath:(NSString *)path error:(NSError *)error
{
  return (NSDictionary *)[(_NSFileManagerBridge *)self->swiftBridge attributesOfItemAtPath:path error:error];
}

- (NSArray)URLsForDirectory:(NSSearchPathDirectory)directory inDomains:(NSSearchPathDomainMask)domainMask
{
  return (NSArray *)[(_NSFileManagerBridge *)self->swiftBridge urlsFor:directory in:domainMask];
}

- (NSData)contentsAtPath:(NSString *)path
{
  int v3 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:path];

  return (NSData *)v3;
}

- (BOOL)_web_createDirectoryAtPathWithIntermediateDirectories:(id)a3 attributes:(id)a4
{
  return [(NSFileManager *)self createDirectoryAtPath:a3 withIntermediateDirectories:1 attributes:a4 error:0];
}

- (BOOL)removeItemAtURL:(NSURL *)URL error:(NSError *)error
{
  return !URL || [(_NSFileManagerBridge *)self->swiftBridge removeItemAt:URL error:error];
}

- (BOOL)isWritableFileAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge isWritableFileAtPath:](self->swiftBridge, "isWritableFileAtPath:");
}

- (NSString)stringWithFileSystemRepresentation:(const char *)str length:(NSUInteger)len
{
  return (NSString *)_NSFileSystemRepresentationString((uint64_t)str, len);
}

- (void)release
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if ((NSFileManager *)qword_1EB1ECE40 != self)
  {
    v2.receiver = self;
    v2.super_class = (Class)NSFileManager;
    [(NSFileManager *)&v2 release];
  }
}

- (BOOL)createDirectoryAtPath:(NSString *)path withIntermediateDirectories:(BOOL)createIntermediates attributes:(NSDictionary *)attributes error:(NSError *)error
{
  return [(_NSFileManagerBridge *)self->swiftBridge createDirectoryAtPath:path withIntermediateDirectories:createIntermediates attributes:attributes error:error];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ((NSFileManager *)qword_1EB1ECE40 == self)
  {
    qword_1E8EDF350 = (uint64_t)"You cannot deallocate the default file manager singleton";
    __break(1u);
  }

  v3.receiver = self;
  v3.super_class = (Class)NSFileManager;
  [(NSFileManager *)&v3 dealloc];
}

- (NSArray)contentsOfDirectoryAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray *)keys options:(NSDirectoryEnumerationOptions)mask error:(NSError *)error
{
  v41[129] = *(id *)MEMORY[0x1E4F143B8];
  if (!url)
  {
    uint64_t v32 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v32);
  }
  uint64_t v11 = (NSArray *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  if (!keys && !mask) {
    keys = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1D6B8]];
  }
  NSDirectoryEnumerationOptions v12 = mask & 4;
  uint64_t v13 = MEMORY[0x185305BB0](*MEMORY[0x1E4F1CFB0], url, mask & 0x80000000 | (v12 >> 1) & 0xFFFFFFFFFFFFFFBFLL | (((mask >> 4) & 1) << 6), keys);
  if (v13)
  {
    uint64_t v14 = (const void *)v13;
    v41[0] = 0;
    *(void *)&v40.st_dev = 0;
    do
    {
      while (1)
      {
        uint64_t v15 = MEMORY[0x185305BD0](v14, &v40, v41);
        if (v15 != 1) {
          break;
        }
        [(NSArray *)v11 addObject:*(void *)&v40.st_dev];
      }
    }
    while (v15 != 2);
    id v16 = v41[0];
    if (v41[0])
    {
      if (error)
      {
        *error = (NSError *)v41[0];
        id v17 = v16;
      }
      else
      {
        CFRelease(v41[0]);
      }
      uint64_t v11 = 0;
    }
    CFRelease(v14);
    return v11;
  }
  uint64_t v34 = 0;
  id v18 = [(NSURL *)url path];
  if (!v18)
  {
    v31 = _NSErrorWithFilePath(4, (uint64_t)url);
    if (!v31) {
      return v11;
    }
    goto LABEL_44;
  }
  v19 = v18;
  int v33 = error;
  v20 = [(NSFileManager *)self contentsOfDirectoryAtPath:v18 error:&v34];
  memset(&v40, 0, sizeof(v40));
  if ([(NSFileManager *)self getFileSystemRepresentation:v41 maxLength:1024 withPath:v19])
  {
    int v21 = lstat((const char *)v41, &v40);
    if (v20)
    {
      if (!v21)
      {
        if ((v40.st_mode & 0xF000) == 0x4000)
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v36 objects:v35 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v37 != v24) {
                  objc_enumerationMutation(v20);
                }
                v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                uint64_t v27 = [v19 stringByAppendingPathComponent:v26];
                if ([(NSFileManager *)self getFileSystemRepresentation:v41 maxLength:1024 withPath:v27]&& !lstat((const char *)v41, &v40))
                {
                  int v28 = [v26 characterAtIndex:0];
                  if (!v12 || (v28 != 46 ? (BOOL v29 = (v40.st_flags & 0x8000) == 0) : (BOOL v29 = 0), v29)) {
                    -[NSArray addObject:](v11, "addObject:", [MEMORY[0x1E4F1CB10] fileURLWithPath:v27 isDirectory:(v40.st_mode & 0xF000) == 0x4000]);
                  }
                }
              }
              uint64_t v23 = [(NSArray *)v20 countByEnumeratingWithState:&v36 objects:v35 count:16];
            }
            while (v23);
          }
        }
        else
        {
          uint64_t v34 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(20, (uint64_t)url, 1, 0, 0);
        }
      }
    }
  }
  error = v33;
  v31 = v34;
  if (v34)
  {
LABEL_44:
    uint64_t v11 = 0;
    if (error) {
      *error = v31;
    }
  }
  return v11;
}

- (BOOL)isReadableFileAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge isReadableFileAtPath:](self->swiftBridge, "isReadableFileAtPath:");
}

- (id)_attributesOfItemAtURL:(id)a3 filterResourceFork:(BOOL)a4 error:(id *)a5
{
  return +[NSFileAttributes _attributesAtURL:a3 partialReturn:1 filterResourceFork:a4 error:a5];
}

- (NSArray)subpathsAtPath:(NSString *)path
{
  objc_super v3 = [(NSFileManager *)self enumeratorAtPath:path];

  return (NSArray *)[(NSDirectoryEnumerator *)v3 allObjects];
}

- (NSDirectoryEnumerator)enumeratorAtPath:(NSString *)path
{
  result = +[NSFileAttributes attributesAtPath:path traverseLink:1];
  if (result)
  {
    id v5 = +[NSAllDescendantPathsEnumerator newWithPath:path prepend:0 attributes:result cross:1 depth:1];
    return (NSDirectoryEnumerator *)v5;
  }
  return result;
}

uint64_t __31__NSFileManager_defaultManager__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_allocWithZone(*(Class *)(a1 + 32)) init];
  qword_1EB1ECE40 = result;
  return result;
}

- (NSFileManager)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSFileManager;
  objc_super v2 = [(NSFileManager *)&v4 init];
  if (v2) {
    v2->swiftBridge = [[_NSFileManagerBridge alloc] initWithFileManager:v2];
  }
  return v2;
}

- (NSString)destinationOfSymbolicLinkAtPath:(NSString *)path error:(NSError *)error
{
  return (NSString *)[(_NSFileManagerBridge *)self->swiftBridge destinationOfSymbolicLinkAtPath:path error:error];
}

- (NSArray)contentsOfDirectoryAtPath:(NSString *)path error:(NSError *)error
{
  if (path)
  {
    swiftBridge = self->swiftBridge;
    return (NSArray *)-[_NSFileManagerBridge contentsOfDirectoryAtPath:error:](swiftBridge, "contentsOfDirectoryAtPath:error:");
  }
  else
  {
    if (error) {
      *error = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(14, 0, 1, @"Folder", 0);
    }
    return 0;
  }
}

- (NSFileManager)retain
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if ((NSFileManager *)qword_1EB1ECE40 != self)
  {
    v2.receiver = self;
    v2.super_class = (Class)NSFileManager;
    return [(NSFileManager *)&v2 retain];
  }
  return self;
}

- (BOOL)fileExistsAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge fileExistsAtPath:](self->swiftBridge, "fileExistsAtPath:");
}

- (id)_safeDelegate
{
  if (dyld_program_sdk_at_least()
    && ((uint64_t v3 = (__objc2_class *)objc_opt_class(), v3 == NSFileManager)
     || (InstanceMethod = class_getInstanceMethod((Class)v3, sel_delegate),
         InstanceMethod == class_getInstanceMethod((Class)NSFileManager, sel_delegate))))
  {
    weakDelegateValue = self->_weakDelegateValue;
    return [(NSValue *)weakDelegateValue weakObjectValue];
  }
  else
  {
    return [(NSFileManager *)self delegate];
  }
}

- (NSDictionary)attributesOfFileSystemForPath:(NSString *)path error:(NSError *)error
{
  return (NSDictionary *)[(_NSFileManagerBridge *)self->swiftBridge attributesOfFileSystemForPath:path error:error];
}

- (BOOL)removeItemAtPath:(NSString *)path error:(NSError *)error
{
  return !path
      || [(_NSFileManagerBridge *)self->swiftBridge removeItemAtPath:path error:error];
}

- (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error
{
  if (!srcPath && _CFExecutableLinkedOnOrAfter())
  {
    NSDirectoryEnumerationOptions v12 = +[NSString stringWithFormat:@"%@: source path is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_9:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  if (!dstPath)
  {
    NSDirectoryEnumerationOptions v12 = +[NSString stringWithFormat:@"%@: destination path is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_9;
  }
  swiftBridge = self->swiftBridge;

  return [(_NSFileManagerBridge *)swiftBridge moveItemAtPath:srcPath toPath:dstPath options:0 error:error];
}

- (NSURL)temporaryDirectory
{
  return [(_NSFileManagerBridge *)self->swiftBridge temporaryDirectory];
}

- (BOOL)createSymbolicLinkAtPath:(NSString *)path withDestinationPath:(NSString *)destPath error:(NSError *)error
{
  return [(_NSFileManagerBridge *)self->swiftBridge createSymbolicLinkAtPath:path withDestinationPath:destPath error:error];
}

- (NSURL)URLForDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domain appropriateForURL:(NSURL *)url create:(BOOL)shouldCreate error:(NSError *)error
{
  return (NSURL *)[(_NSFileManagerBridge *)self->swiftBridge urlFor:directory in:domain appropriateFor:url create:shouldCreate error:error];
}

- (BOOL)moveItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error
{
  return [(NSFileManager *)self moveItemAtURL:srcURL toURL:dstURL options:0 error:error];
}

- (BOOL)copyItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error
{
  return [(NSFileManager *)self copyItemAtURL:srcURL toURL:dstURL options:0 error:error];
}

- (BOOL)changeCurrentDirectoryPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge changeCurrentDirectoryPath:](self->swiftBridge, "changeCurrentDirectoryPath:");
}

void __56__NSFileManager__processHasUbiquityContainerEntitlement__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _processUsesCloudServices]) {
    goto LABEL_2;
  }
  *(_OWORD *)task_info_out = 0u;
  long long v7 = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt);
  objc_super v2 = (void *)xpc_copy_entitlement_for_token();
  if (v2)
  {
    uint64_t v3 = v2;
    if (object_getClass(v2) != (Class)MEMORY[0x1E4F14568] || !xpc_array_get_count(v3))
    {
      xpc_release(v3);
      return;
    }
    string = xpc_array_get_string(v3, 0);
    xpc_release(v3);
    if (string)
    {
LABEL_2:
      if (qword_1EB1ECEC8 != -1) {
        dispatch_once(&qword_1EB1ECEC8, &__block_literal_global_652);
      }
      if (off_1EB1ECE88) {
        char v1 = off_1EB1ECE88();
      }
      else {
        char v1 = 0;
      }
      byte_1EB1ECE19 = v1;
    }
  }
}

- (BOOL)_processUsesCloudServices
{
  if (qword_1EB1ECE90 != -1) {
    dispatch_once(&qword_1EB1ECE90, &__block_literal_global_367);
  }
  return byte_1EB1ECE1A;
}

- (BOOL)_processHasUbiquityContainerEntitlement
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__NSFileManager__processHasUbiquityContainerEntitlement__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = self;
  if (qword_1EB1ECE80 != -1) {
    dispatch_once(&qword_1EB1ECE80, v3);
  }
  return byte_1EB1ECE19;
}

- (BOOL)_processCanAccessUbiquityIdentityToken
{
  if (_processCanAccessUbiquityIdentityToken_once != -1) {
    dispatch_once(&_processCanAccessUbiquityIdentityToken_once, &__block_literal_global_371);
  }
  return _processCanAccessUbiquityIdentityToken_result;
}

- (BOOL)_handleFaultedOutCloudDocFromSource:(id)a3 toDestination:(id)a4 handled:(BOOL *)a5 error:(id *)a6
{
  v17[4] = *MEMORY[0x1E4F143B8];
  if (a5) {
    *a5 = 0;
  }
  id v10 = (id)_CFURLPromiseCopyPhysicalURL();
  uint64_t v11 = v10;
  if (!v10 || v10 == a3)
  {
    if (!v10) {
      return 1;
    }
LABEL_13:
    CFRelease(v11);
    return 1;
  }
  if ([a3 checkResourceIsReachableAndReturnError:0]) {
    goto LABEL_13;
  }
  if (qword_1EB1ECE28 != -1) {
    dispatch_once(&qword_1EB1ECE28, &__block_literal_global_10);
  }
  +[NSFileManager defaultManager];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_13;
  }
  id v15 = 0;
  if ([+[NSFileManager defaultManager] br_movePromisedItemAtURL:a3 toURL:a4 error:&v15])
  {
    if (a5) {
      *a5 = 1;
    }
    goto LABEL_13;
  }
  if ([v15 code] == 4)
  {
    if (objc_msgSend((id)objc_msgSend(v15, "domain"), "isEqualToString:", @"NSCocoaErrorDomain")) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = 512;
    }
  }
  else
  {
    uint64_t v13 = 512;
  }
  v16[0] = @"NSFilePath";
  v17[0] = [a3 path];
  v16[1] = @"NSDestinationFilePath";
  v17[1] = [a4 path];
  v17[2] = @"Move";
  v16[2] = @"NSUserStringVariant";
  v16[3] = @"NSUnderlyingError";
  v17[3] = v15;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  if (a6) {
    *a6 = [[NSError alloc] initWithDomain:@"NSCocoaErrorDomain" code:v13 userInfo:v14];
  }
  CFRelease(v11);
  return 0;
}

- (NSString)currentDirectoryPath
{
  return [(_NSFileManagerBridge *)self->swiftBridge currentDirectoryPath];
}

- (BOOL)setAttributes:(NSDictionary *)attributes ofItemAtPath:(NSString *)path error:(NSError *)error
{
  return [(_NSFileManagerBridge *)self->swiftBridge setAttributes:attributes ofItemAtPath:path error:error];
}

uint64_t __49__NSFileManager__URLForReplacingItemAtURL_error___block_invoke_3()
{
  getpid();
  uint64_t result = sandbox_check();
  _MergedGlobals_25_0 = result == 0;
  return result;
}

- (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data attributes:(NSDictionary *)attr
{
  if (path)
  {
    if (_NSIsNSString())
    {
      BOOL v9 = [(NSData *)data writeToFile:path atomically:1];
      if (attr && v9)
      {
        [(NSFileManager *)self setAttributes:attr ofItemAtPath:path error:0];
        LOBYTE(v9) = 1;
      }
    }
    else
    {
      swiftBridge = self->swiftBridge;
      LOBYTE(v9) = [(_NSFileManagerBridge *)swiftBridge createFileAtPath:path contents:data attributes:attr];
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (id)ubiquityIdentityToken
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ECEC8 != -1) {
    dispatch_once(&qword_1EB1ECEC8, &__block_literal_global_652);
  }
  v4[0] = 0;
  if (off_1EB1ECE98)
  {
    off_1EB1ECE98(v4, 0);
    objc_super v2 = (void *)v4[0];
  }
  else
  {
    objc_super v2 = 0;
  }
  return v2;
}

uint64_t __55__NSFileManager__processCanAccessUbiquityIdentityToken__block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  _processCanAccessUbiquityIdentityToken_uint64_t result = result == 0;
  return result;
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  if (!a3)
  {
    int v9 = _CFExecutableLinkedOnOrAfter();
    if (!v9) {
      return v9;
    }
    id v10 = +[NSString stringWithFormat:@"%@: source URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_10:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v10 userInfo:0]);
  }
  if (!a4)
  {
    id v10 = +[NSString stringWithFormat:@"%@: destination URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_10;
  }
  swiftBridge = self->swiftBridge;

  LOBYTE(v9) = -[_NSFileManagerBridge moveItemAt:to:options:error:](swiftBridge, "moveItemAt:to:options:error:");
  return v9;
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  if (!a3)
  {
    int v9 = _CFExecutableLinkedOnOrAfter();
    if (!v9) {
      return v9;
    }
    id v10 = +[NSString stringWithFormat:@"%@: source URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_10:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v10 userInfo:0]);
  }
  if (!a4)
  {
    id v10 = +[NSString stringWithFormat:@"%@: destination URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_10;
  }
  swiftBridge = self->swiftBridge;

  LOBYTE(v9) = -[_NSFileManagerBridge copyItemAt:to:options:error:](swiftBridge, "copyItemAt:to:options:error:");
  return v9;
}

- (NSArray)subpathsOfDirectoryAtPath:(NSString *)path error:(NSError *)error
{
  if (!path && _CFExecutableLinkedOnOrAfter())
  {
    id v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: path is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  swiftBridge = self->swiftBridge;

  return (NSArray *)[(_NSFileManagerBridge *)swiftBridge subpathsOfDirectoryAtPath:path error:error];
}

void __51__NSFileManager_URLForUbiquityContainerIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [a2 copy];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v5 = *(NSObject **)(a1 + 32);

  dispatch_release(v5);
}

void __42__NSFileManager__processUsesCloudServices__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)task_info_out = 0u;
  long long v6 = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt);
  v0 = (void *)xpc_copy_entitlement_for_token();
  if (v0)
  {
    char v1 = v0;
    if (object_getClass(v0) == (Class)MEMORY[0x1E4F14568] && xpc_array_get_count(v1) && xpc_array_get_string(v1, 0)) {
      byte_1EB1ECE1A = 1;
    }
    xpc_release(v1);
  }
  if (!byte_1EB1ECE1A)
  {
    objc_super v2 = (void *)xpc_copy_entitlement_for_token();
    if (v2)
    {
      uint64_t v3 = v2;
      byte_1EB1ECE1A = object_getClass(v2) == (Class)MEMORY[0x1E4F145F0];
      xpc_release(v3);
    }
  }
}

- (NSURL)URLForUbiquityContainerIdentifier:(NSString *)containerIdentifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ECEC8 != -1) {
    dispatch_once(&qword_1EB1ECEC8, &__block_literal_global_652);
  }
  if (!off_1EB1ECE70) {
    return 0;
  }
  qos_class_t v4 = qos_class_main();
  uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, v4, 0);
  long long v6 = dispatch_queue_create("com.apple.NSFileManager.URLForUbiquityContainerIdentifier:", v5);
  uint64_t v7 = dispatch_semaphore_create(0);
  uint64_t v11 = 0;
  NSDirectoryEnumerationOptions v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__3;
  id v15 = __Block_byref_object_dispose__3;
  uint64_t v16 = 0;
  dispatch_retain(v7);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__NSFileManager_URLForUbiquityContainerIdentifier___block_invoke;
  v10[3] = &unk_1E51F7D90;
  v10[4] = v7;
  v10[5] = &v11;
  off_1EB1ECE70(containerIdentifier, v6, v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v6);
  dispatch_release(v7);
  uint64_t v8 = (NSURL *)(id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (NSArray)mountedVolumeURLsIncludingResourceValuesForKeys:(NSArray *)propertyKeys options:(NSVolumeEnumerationOptions)options
{
  return 0;
}

- (id)_URLForTrashingItemAtURL:(id)a3 create:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (qword_1EB1ECEC0 != -1) {
    dispatch_once(&qword_1EB1ECEC0, &__block_literal_global_640);
  }
  uint64_t v9 = [(NSFileManager *)self fp_trashURLForItemAtURL:a3 error:0];
  id v10 = (void *)v9;
  if (!a5 || v9)
  {
    if (v9
      && v6
      && ![(NSFileManager *)self createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:a5])
    {
      return 0;
    }
  }
  else
  {
    *a5 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3328 userInfo:0];
  }
  return v10;
}

- (BOOL)getRelationship:(NSURLRelationship *)outRelationship ofDirectoryAtURL:(NSURL *)directoryURL toItemAtURL:(NSURL *)otherURL error:(NSError *)error
{
  return directoryURL
      && otherURL
      && -[_NSFileManagerBridge getRelationship:ofDirectoryAt:toItemAt:error:](self->swiftBridge, "getRelationship:ofDirectoryAt:toItemAt:error:", outRelationship);
}

- (BOOL)getRelationship:(NSURLRelationship *)outRelationship ofDirectory:(NSSearchPathDirectory)directory inDomain:(NSSearchPathDomainMask)domainMask toItemAtURL:(NSURL *)url error:(NSError *)error
{
  return [(_NSFileManagerBridge *)self->swiftBridge getRelationship:outRelationship of:directory in:domainMask toItemAt:url error:error];
}

- (id)_displayPathForPath:(id)a3
{
  qos_class_t v4 = +[NSMutableString stringWithCapacity:512];
  uint64_t v5 = (void *)[a3 stringByStandardizingPath];
  if (([v5 isEqualToString:&stru_1ECA5C228] & 1) == 0)
  {
    do
    {
      if ([v5 isEqualToString:@"/"]) {
        break;
      }
      [(NSMutableString *)v4 insertString:[+[NSFileManager defaultManager] displayNameAtPath:v5] atIndex:0];
      uint64_t v5 = (void *)[v5 stringByDeletingLastPathComponent];
      if (([v5 isEqualToString:&stru_1ECA5C228] & 1) == 0) {
        [(NSMutableString *)v4 insertString:@"/" atIndex:0];
      }
    }
    while (![v5 isEqualToString:&stru_1ECA5C228]);
  }
  if ([(NSString *)v4 isAbsolutePath])
  {
    if ([(NSString *)v4 hasPrefix:@"/Volumes"])
    {
      -[NSMutableString deleteCharactersInRange:](v4, "deleteCharactersInRange:", 0, 8);
    }
    else if (![(NSString *)v4 hasPrefix:@"/Network"])
    {
      [(NSMutableString *)v4 insertString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/%@", [+[NSFileManager defaultManager] displayNameAtPath:@"/"]) atIndex:0];
    }
  }
  return v4;
}

- (BOOL)directoryCanBeCreatedAtPath:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  qos_class_t v4 = (const char *)[a3 fileSystemRepresentation];
  if ((objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "getFileSystemRepresentation:maxLength:", v6, 1024) & 1) == 0|| access(v6, 3))
  {
    return 0;
  }
  if (!mkdir(v4, 0x1FFu))
  {
    rmdir(v4);
    return 1;
  }
  return *__error() == 17;
}

- (NSDictionary)fileAttributesAtPath:(NSString *)path traverseLink:(BOOL)yorn
{
  return (NSDictionary *)+[NSFileAttributes attributesAtPath:path traverseLink:yorn];
}

- (BOOL)changeFileAttributes:(NSDictionary *)attributes atPath:(NSString *)path
{
  return [(NSFileManager *)self setAttributes:attributes ofItemAtPath:path error:0];
}

- (BOOL)isExecutableFileAtPath:(NSString *)path
{
  return path && -[_NSFileManagerBridge isExecutableFileAtPath:](self->swiftBridge, "isExecutableFileAtPath:");
}

- (BOOL)isDeletableFileAtPath:(NSString *)path
{
  if (!path) {
    path = [(NSFileManager *)self currentDirectoryPath];
  }
  swiftBridge = self->swiftBridge;

  return [(_NSFileManagerBridge *)swiftBridge isDeletableFileAtPath:path];
}

- (BOOL)removeFileAtPath:(NSString *)path handler:(id)handler
{
  return [(NSFileManager *)self removeItemAtPath:path error:0];
}

- (id)directoryContentsAtPath:(id)a3 matchingExtension:(id)a4 options:(int64_t)a5 keepExtension:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    strcpy(__s, ".");
    if (![(NSFileManager *)self getFileSystemRepresentation:&__s[1] maxLength:1023 withPath:a4])return 0; {
    uint64_t v11 = (const char *)[a3 fileSystemRepresentation];
    }
    NSDirectoryEnumerationOptions v12 = __s;
    size_t v13 = strlen(__s);
  }
  else
  {
    uint64_t v11 = (const char *)[a3 fileSystemRepresentation];
    NSDirectoryEnumerationOptions v12 = 0;
    size_t v13 = 0;
  }
  memset(&v42, 0, 512);
  stat v40 = 0;
  if (!v11)
  {
    if (a7)
    {
      v35 = __error();
      long long v36 = 0;
      int v37 = *v35;
LABEL_37:
      uint64_t v16 = 0;
      *a7 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v37, (uint64_t)v36, 1, @"Folder", 0);
      return v16;
    }
    return 0;
  }
  uint64_t v14 = opendir(v11);
  if (!v14)
  {
    if (a7)
    {
      int v37 = *__error();
      long long v36 = +[NSString stringWithUTF8String:v11];
      goto LABEL_37;
    }
    return 0;
  }
  id v15 = v14;
  uint64_t v16 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = (void *)[objc_allocWithZone((Class)NSCheapMutableString) init];
  if (v13) {
    int v18 = v8;
  }
  else {
    int v18 = 1;
  }
  if (v18) {
    size_t v19 = 0;
  }
  else {
    size_t v19 = v13;
  }
  if (!readdir_r(v15, &v42, &v40) && v40)
  {
    d_name = v42.d_name;
    long long v39 = v16;
    do
    {
      if (v42.d_ino)
      {
        int d_namlen = v42.d_namlen;
        if (v42.d_name[0] != 46 || v42.d_namlen != 1 && (v42.d_namlen != 2 || v42.d_name[1] != 46))
        {
          if ((int)v13 < 1) {
            goto LABEL_28;
          }
          if (v42.d_namlen > v13)
          {
            if (a5)
            {
              CFStringRef v22 = CFStringCreateWithFileSystemRepresentation(0, d_name);
              CFStringRef v23 = CFStringCreateWithFileSystemRepresentation(0, v12);
              uint64_t v24 = d_name;
              size_t v25 = v19;
              int64_t v26 = a5;
              uint64_t v27 = v12;
              int v28 = v17;
              CFStringRef v29 = v23;
              CFIndex Length = CFStringGetLength(v22);
              v44.length = CFStringGetLength(v29);
              v44.location = Length - v44.length;
              CFComparisonResult v31 = CFStringCompareWithOptions(v22, v29, v44, 0x21uLL);
              CFStringRef v32 = v29;
              uint64_t v17 = v28;
              NSDirectoryEnumerationOptions v12 = v27;
              a5 = v26;
              size_t v19 = v25;
              d_name = v24;
              uint64_t v16 = v39;
              CFRelease(v32);
              CFRelease(v22);
              if (v31)
              {
                int d_namlen = v42.d_namlen;
LABEL_28:
                uint64_t v33 = [objc_allocWithZone((Class)NSString) initWithBytes:d_name length:d_namlen - (int)v19 encoding:4];
                if (v33)
                {
                  uint64_t v34 = (void *)v33;
                  [v16 addObject:v33];
                }
              }
            }
            else if (!strcmp(&v42.d_name[v42.d_namlen - v13], v12))
            {
              goto LABEL_28;
            }
          }
        }
      }
    }
    while (!readdir_r(v15, &v42, &v40) && v40);
  }

  closedir(v15);
  return v16;
}

- (id)directoryContentsAtPath:(id)a3 matchingExtension:(id)a4 options:(int64_t)a5 keepExtension:(BOOL)a6
{
  return [(NSFileManager *)self directoryContentsAtPath:a3 matchingExtension:a4 options:a5 keepExtension:a6 error:0];
}

- (NSArray)directoryContentsAtPath:(NSString *)path
{
  return (NSArray *)[(NSFileManager *)self directoryContentsAtPath:path matchingExtension:0 options:0 keepExtension:1];
}

- (BOOL)createDirectoryAtPath:(NSString *)path attributes:(NSDictionary *)attributes
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)path getFileSystemRepresentation:v9 maxLength:1024]) {
    return 0;
  }
  int v7 = mkdir(v9, 0x1FFu);
  BOOL result = v7 == 0;
  if (attributes)
  {
    if (!v7)
    {
      [(NSFileManager *)self changeFileAttributes:attributes atPath:path];
      return 1;
    }
  }
  return result;
}

- (NSString)pathContentOfSymbolicLinkAtPath:(NSString *)path
{
  return [(NSFileManager *)self destinationOfSymbolicLinkAtPath:path error:0];
}

- (BOOL)createSymbolicLinkAtPath:(NSString *)path pathContent:(NSString *)otherpath
{
  return [(NSFileManager *)self createSymbolicLinkAtPath:path withDestinationPath:otherpath error:0];
}

- (BOOL)contentsEqualAtPath:(NSString *)path1 andPath:(NSString *)path2
{
  return [(_NSFileManagerBridge *)self->swiftBridge contentsEqualAtPath:path1 andPath:path2];
}

- (NSDictionary)fileSystemAttributesAtPath:(NSString *)path
{
  return [(NSFileManager *)self attributesOfFileSystemForPath:path error:0];
}

- (NSArray)componentsToDisplayForPath:(NSString *)path
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!path) {
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", -[NSString stringByResolvingSymlinksInPath](path, "stringByResolvingSymlinksInPath")), "fileReferenceURL"))return 0; {
  uint64_t v3 = _CFURLCreateDisplayPathComponentsArray();
  }
  if (!v3) {
    return 0;
  }
  qos_class_t v4 = (void *)v3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = *MEMORY[0x1E4F1C6C8];
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v15 = 0;
        if ([v11 getResourceValue:&v15 forKey:v9 error:0]) {
          BOOL v12 = v15 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {

          goto LABEL_19;
        }
        objc_msgSend(v5, "insertObject:atIndex:");
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  if (v5)
  {
    size_t v13 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:v5];
  }
  else
  {
LABEL_19:
    size_t v13 = 0;
  }
  CFRelease(v4);
  return v13;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (NSFileManagerDelegate *)delegate;

  if (delegate) {
    id v5 = +[NSValue valueWithWeakObject:delegate];
  }
  else {
    id v5 = 0;
  }
  self->_weakDelegateValue = v5;
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  if (!a3)
  {
    int v9 = _CFExecutableLinkedOnOrAfter();
    if (!v9) {
      return v9;
    }
    uint64_t v10 = +[NSString stringWithFormat:@"%@: source path is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_10:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v10 userInfo:0]);
  }
  if (!a4)
  {
    uint64_t v10 = +[NSString stringWithFormat:@"%@: destination path is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_10;
  }
  swiftBridge = self->swiftBridge;

  LOBYTE(v9) = -[_NSFileManagerBridge copyItemAtPath:toPath:options:error:](swiftBridge, "copyItemAtPath:toPath:options:error:");
  return v9;
}

- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error
{
  return [(NSFileManager *)self copyItemAtPath:srcPath toPath:dstPath options:0 error:error];
}

- (BOOL)linkItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError *)error
{
  if (!srcPath && _CFExecutableLinkedOnOrAfter())
  {
    BOOL v12 = +[NSString stringWithFormat:@"%@: source path is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_9:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  if (!dstPath)
  {
    BOOL v12 = +[NSString stringWithFormat:@"%@: destination path is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_9;
  }
  swiftBridge = self->swiftBridge;

  return [(_NSFileManagerBridge *)swiftBridge linkItemAtPath:srcPath toPath:dstPath error:error];
}

- (BOOL)linkItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL error:(NSError *)error
{
  if (!srcURL && _CFExecutableLinkedOnOrAfter())
  {
    BOOL v12 = +[NSString stringWithFormat:@"%@: source URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_9:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v12 userInfo:0]);
  }
  if (!dstURL)
  {
    BOOL v12 = +[NSString stringWithFormat:@"%@: destination URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_9;
  }
  swiftBridge = self->swiftBridge;

  return [(_NSFileManagerBridge *)swiftBridge linkItemAt:srcURL to:dstURL error:error];
}

- (BOOL)trashItemAtURL:(NSURL *)url resultingItemURL:(NSURL *)outResultingURL error:(NSError *)error
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  if (!url)
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: source URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  if ([(NSURL *)url isFileURL])
  {
    if (qword_1EB1ECEC0 != -1) {
      dispatch_once(&qword_1EB1ECEC0, &__block_literal_global_640);
    }
    v17[0] = 0;
    char v9 = [(NSFileManager *)self fp_trashItemAtURL:url resultingItemURL:outResultingURL error:v17];
    BOOL v10 = v9;
    if (error && (v9 & 1) == 0)
    {
      id v11 = v17[0];
      if (objc_msgSend((id)objc_msgSend(v17[0], "domain"), "isEqualToString:", @"NSCocoaErrorDomain"))
      {
        BOOL v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v11, "userInfo"));
        uint64_t v13 = [v11 code];
      }
      else
      {
        BOOL v12 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:v11 forKey:@"NSUnderlyingError"];
        uint64_t v13 = 512;
      }
      [v12 setObject:url forKey:@"NSURL"];
      [v12 setObject:@"Trash" forKey:@"NSUserStringVariant"];
      uint64_t v14 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:v13 userInfo:v12];
      goto LABEL_14;
    }
  }
  else
  {
    if (error)
    {
      uint64_t v14 = _NSErrorWithFilePath(262, (uint64_t)url);
      BOOL v10 = 0;
LABEL_14:
      *error = v14;
      return v10;
    }
    return 0;
  }
  return v10;
}

- (id)_attributesOfItemAtPath:(id)a3 filterResourceFork:(BOOL)a4 error:(id *)a5
{
  return +[NSFileAttributes _attributesAtPath:a3 partialReturn:1 filterResourceFork:a4 error:a5];
}

- (BOOL)createSymbolicLinkAtURL:(NSURL *)url withDestinationURL:(NSURL *)destURL error:(NSError *)error
{
  if (!url)
  {
    uint64_t v7 = +[NSString stringWithFormat:@"%@: URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_8;
  }
  if (!destURL)
  {
    uint64_t v7 = +[NSString stringWithFormat:@"%@: destURL is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_8:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v7 userInfo:0]);
  }
  swiftBridge = self->swiftBridge;

  return -[_NSFileManagerBridge createSymbolicLinkAt:withDestinationURL:error:](swiftBridge, "createSymbolicLinkAt:withDestinationURL:error:");
}

- (BOOL)replaceItemAtURL:(NSURL *)originalItemURL withItemAtURL:(NSURL *)newItemURL backupItemName:(NSString *)backupItemName options:(NSFileManagerItemReplacementOptions)options resultingItemURL:(NSURL *)resultingURL error:(NSError *)error
{
  v15[1] = *(id *)MEMORY[0x1E4F143B8];
  if (!originalItemURL)
  {
    uint64_t v13 = +[NSString stringWithFormat:@"%@: original item URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_12;
  }
  if (!newItemURL)
  {
    uint64_t v13 = +[NSString stringWithFormat:@"%@: new item URL is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_12:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0]);
  }
  id v14 = 0;
  v15[0] = 0;
  int v10 = MEMORY[0x185306A00](0, originalItemURL, newItemURL, 0, backupItemName, (8 * (int)options) & 0x10 | (2 * (options & 1)), v15, &v14);
  if (!v10)
  {
    id v11 = v14;
    if (error)
    {
      *error = (NSError *)v14;
      return v10 != 0;
    }
LABEL_8:
    CFRelease(v11);
    return v10 != 0;
  }
  id v11 = v15[0];
  if (!resultingURL) {
    goto LABEL_8;
  }
  *resultingURL = (NSURL *)v15[0];
  return v10 != 0;
}

- (BOOL)startDownloadingUbiquitousItemAtURL:(NSURL *)url error:(NSError *)error
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ECEC0 != -1) {
    dispatch_once(&qword_1EB1ECEC0, &__block_literal_global_640);
  }
  if (off_1EB1ECE48)
  {
    long long v18 = 0;
    char v6 = off_1EB1ECE48(url, &v18);
    BOOL v7 = v6;
    if (error) {
      char v8 = v6;
    }
    else {
      char v8 = 1;
    }
    if ((v8 & 1) == 0)
    {
      char v9 = _cocoaDomainErrorForLibrarianError((uint64_t)url, v18, 0);
LABEL_19:
      *error = v9;
    }
  }
  else
  {
    if (qword_1EB1ECEC8 != -1) {
      dispatch_once(&qword_1EB1ECEC8, &__block_literal_global_652);
    }
    if (!off_1EB1ECE50)
    {
      if (!error) {
        return 0;
      }
      char v9 = _librarianMissingError(0);
      BOOL v7 = 0;
      goto LABEL_19;
    }
    qos_class_t v10 = qos_class_main();
    id v11 = dispatch_queue_attr_make_with_qos_class(0, v10, 0);
    BOOL v12 = dispatch_queue_create("com.apple.NSFileManager.startDownloadingUbiquitousItemAtURL:error:", v11);
    uint64_t v13 = dispatch_semaphore_create(0);
    long long v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3052000000;
    uint64_t v21 = __Block_byref_object_copy__3;
    CFStringRef v22 = __Block_byref_object_dispose__3;
    uint64_t v23 = 0;
    dispatch_retain(v13);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    id v17[2] = __59__NSFileManager_startDownloadingUbiquitousItemAtURL_error___block_invoke;
    v17[3] = &unk_1E51F7D18;
    v17[4] = v13;
    void v17[5] = &v18;
    off_1EB1ECE50(url, v12, v17);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v12);
    dispatch_release(v13);
    id v14 = v19[5];
    BOOL v7 = v14 == 0;
    if (v14)
    {
      if (error)
      {
        *error = _cocoaDomainErrorForLibrarianError((uint64_t)url, v14, 0);
        id v14 = v19[5];
      }
      id v15 = v14;
    }
    _Block_object_dispose(&v18, 8);
  }
  return v7;
}

void __59__NSFileManager_startDownloadingUbiquitousItemAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v3 = *(NSObject **)(a1 + 32);

  dispatch_release(v3);
}

- (BOOL)setUbiquitous:(BOOL)flag itemAtURL:(NSURL *)url destinationURL:(NSURL *)destinationURL error:(NSError *)error
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ECEC8 != -1) {
    dispatch_once(&qword_1EB1ECEC8, &__block_literal_global_652);
  }
  if (off_1EB1ECE58)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    long long v19 = __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke;
    uint64_t v20 = &unk_1E51F7D40;
    BOOL v22 = flag;
    uint64_t v21 = url;
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    if (+[NSFileCoordinator _currentFileCoordinator])
    {
      BOOL v10 = v19((uint64_t)v18, (uint64_t)url, (uint64_t)destinationURL, error);
      *((unsigned char *)v15 + 24) = v10;
    }
    else
    {
      id v11 = [[NSFileCoordinator alloc] initWithFilePresenter:0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke_3;
      v13[3] = &unk_1E51F7D68;
      v13[6] = &v14;
      v13[7] = error;
      v13[4] = v11;
      v13[5] = v18;
      [(NSFileCoordinator *)v11 coordinateWritingItemAtURL:url options:2 writingItemAtURL:destinationURL options:0 error:error byAccessor:v13];

      BOOL v10 = *((unsigned char *)v15 + 24) != 0;
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v10 = 0;
    if (error) {
      *error = _librarianMissingError(0);
    }
  }
  return v10;
}

BOOL __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, NSError **a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy__3;
  BOOL v22 = __Block_byref_object_dispose__3;
  uint64_t v23 = 0;
  qos_class_t v8 = qos_class_main();
  char v9 = dispatch_queue_attr_make_with_qos_class(0, v8, 0);
  BOOL v10 = dispatch_queue_create("com.apple.NSFileManager.setUbiquitous:itemAtURL:destinationURL:error:", v9);
  id v11 = dispatch_semaphore_create(0);
  dispatch_retain(v11);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v17[2] = __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke_2;
  v17[3] = &unk_1E51F7D18;
  v17[4] = v11;
  void v17[5] = &v18;
  off_1EB1ECE58(a2, v12, a3, v10, v17);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v10);
  dispatch_release(v11);
  uint64_t v13 = (void *)v19[5];
  if (a4 && v13)
  {
    *a4 = _cocoaDomainErrorForLibrarianError(*(void *)(a1 + 32), v13, 0);
    uint64_t v13 = (void *)v19[5];
  }
  id v14 = v13;
  BOOL v15 = v19[5] == 0;
  _Block_object_dispose(&v18, 8);
  return v15;
}

void __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v3 = *(NSObject **)(a1 + 32);

  dispatch_release(v3);
}

uint64_t __62__NSFileManager_setUbiquitous_itemAtURL_destinationURL_error___block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[5] + 16))();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    BOOL v7 = (void *)a1[4];
    return [v7 itemAtURL:a2 didMoveToURL:a3];
  }
  return result;
}

- (BOOL)isUbiquitousItemAtURL:(NSURL *)url
{
  BOOLean[1] = *(CFBooleanRef *)MEMORY[0x1E4F143B8];
  if (!url) {
    return 0;
  }
  BOOLean[0] = 0;
  if (!CFURLCopyResourcePropertyForKey((CFURLRef)url, (CFStringRef)*MEMORY[0x1E4F1D6D8], BOOLean, 0)
    || BOOLean[0] == 0)
  {
    return 0;
  }
  BOOL v4 = CFBooleanGetValue(BOOLean[0]) != 0;
  CFRelease(BOOLean[0]);
  return v4;
}

- (BOOL)evictUbiquitousItemAtURL:(NSURL *)url error:(NSError *)error
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ECEC0 != -1) {
    dispatch_once(&qword_1EB1ECEC0, &__block_literal_global_640);
  }
  if (off_1EB1ECE60)
  {
    uint64_t v20 = 0;
    char v6 = off_1EB1ECE60(url, &v20);
    BOOL v7 = v6;
    if (error) {
      char v8 = v6;
    }
    else {
      char v8 = 1;
    }
    if ((v8 & 1) == 0)
    {
      char v9 = v20;
      BOOL v10 = [(NSError *)v20 domain];
      if (![(NSString *)v10 isEqual:@"NSCocoaErrorDomain"])
      {
        if ([(NSString *)v10 isEqual:@"NSPOSIXErrorDomain"] && [(NSError *)v9 code] == 45)
        {
          v27[0] = @"NSUnderlyingError";
          uint64_t v21 = v9;
          id v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 3328, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:v27 count:1]);
        }
        else
        {
          v27[0] = @"NSUnderlyingError";
          uint64_t v21 = v9;
          id v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 512, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:v27 count:1]);
        }
        char v9 = v11;
      }
      *error = v9;
    }
  }
  else
  {
    if (qword_1EB1ECEC8 != -1) {
      dispatch_once(&qword_1EB1ECEC8, &__block_literal_global_652);
    }
    if (off_1EB1ECE68)
    {
      qos_class_t v12 = qos_class_main();
      uint64_t v13 = dispatch_queue_attr_make_with_qos_class(0, v12, 0);
      id v14 = dispatch_queue_create("com.apple.NSFileManager.evictUbiquitousItemAtURL:error:", v13);
      BOOL v15 = dispatch_semaphore_create(0);
      uint64_t v21 = 0;
      BOOL v22 = &v21;
      uint64_t v23 = 0x3052000000;
      uint64_t v24 = __Block_byref_object_copy__3;
      size_t v25 = __Block_byref_object_dispose__3;
      uint64_t v26 = 0;
      dispatch_retain(v15);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __48__NSFileManager_evictUbiquitousItemAtURL_error___block_invoke;
      v19[3] = &unk_1E51F7D18;
      v19[4] = v15;
      v19[5] = &v21;
      off_1EB1ECE68(url, v14, v19);
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v14);
      dispatch_release(v15);
      uint64_t v16 = v22[5];
      BOOL v7 = v16 == 0;
      if (v16)
      {
        if (error)
        {
          *error = _cocoaDomainErrorForLibrarianError((uint64_t)url, v16, 0);
          uint64_t v16 = v22[5];
        }
        char v17 = v16;
      }
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      BOOL v7 = 0;
      if (error) {
        *error = _librarianMissingError(0);
      }
    }
  }
  return v7;
}

void __48__NSFileManager_evictUbiquitousItemAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v3 = *(NSObject **)(a1 + 32);

  dispatch_release(v3);
}

- (NSURL)URLForPublishingUbiquitousItemAtURL:(NSURL *)url expirationDate:(NSDate *)outDate error:(NSError *)error
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ECEC8 != -1) {
    dispatch_once(&qword_1EB1ECEC8, &__block_literal_global_652);
  }
  if (off_1EB1ECE78)
  {
    qos_class_t v8 = qos_class_main();
    char v9 = dispatch_queue_attr_make_with_qos_class(0, v8, 0);
    BOOL v10 = dispatch_queue_create("com.apple.NSFileManager.URLForPublishingUbiquitousItemAtURL:expirationDate:error:", v9);
    id v11 = dispatch_semaphore_create(0);
    uint64_t v30 = 0;
    CFComparisonResult v31 = &v30;
    uint64_t v32 = 0x3052000000;
    uint64_t v33 = __Block_byref_object_copy__3;
    uint64_t v34 = __Block_byref_object_dispose__3;
    uint64_t v35 = 0;
    uint64_t v24 = 0;
    size_t v25 = &v24;
    uint64_t v26 = 0x3052000000;
    uint64_t v27 = __Block_byref_object_copy__3;
    int v28 = __Block_byref_object_dispose__3;
    uint64_t v29 = 0;
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3052000000;
    uint64_t v21 = __Block_byref_object_copy__3;
    BOOL v22 = __Block_byref_object_dispose__3;
    uint64_t v23 = 0;
    dispatch_retain(v11);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    id v17[2] = __74__NSFileManager_URLForPublishingUbiquitousItemAtURL_expirationDate_error___block_invoke;
    v17[3] = &unk_1E51F7DB8;
    void v17[6] = &v24;
    v17[7] = &v18;
    v17[4] = v11;
    void v17[5] = &v30;
    off_1EB1ECE78(url, v10, v17);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v10);
    dispatch_release(v11);
    id v12 = (id)v25[5];
    id v13 = (id)v19[5];
    id v14 = (void *)v19[5];
    if (v14)
    {
      if (error) {
        *error = _cocoaDomainErrorForLibrarianError((uint64_t)url, v14, 1);
      }
    }
    else if (outDate)
    {
      *outDate = (NSDate *)v25[5];
    }
    BOOL v15 = (NSURL *)(id)v31[5];
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    BOOL v15 = 0;
    if (error) {
      *error = _librarianMissingError(1);
    }
  }
  return v15;
}

void __74__NSFileManager_URLForPublishingUbiquitousItemAtURL_expirationDate_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (a4)
  {
    uint64_t v5 = [a4 copy];
    uint64_t v6 = *(void *)(a1 + 56);
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
    uint64_t v5 = [a3 copy];
    uint64_t v6 = *(void *)(a1 + 48);
  }
  *(void *)(*(void *)(v6 + 8) + 40) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  qos_class_t v8 = *(NSObject **)(a1 + 32);

  dispatch_release(v8);
}

- (void)getFileProviderMessageInterfacesForItemAtURL:(id)a3 completionHandler:(id)a4
{
  v9[5] = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    qos_class_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: completionHandler is NULL", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (qword_1EB1ECEC0 != -1) {
    dispatch_once(&qword_1EB1ECEC0, &__block_literal_global_640);
  }
  if (off_1EB1ECEA0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__NSFileManager_getFileProviderMessageInterfacesForItemAtURL_completionHandler___block_invoke;
    v9[3] = &unk_1E51F7E18;
    v9[4] = a4;
    off_1EB1ECEA0(a3, v9);
  }
  else
  {
    uint64_t v6 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3328 userInfo:0];
    BOOL v7 = (void (*)(id, void, NSError *))*((void *)a4 + 2);
    v7(a4, 0, v6);
  }
}

void __80__NSFileManager_getFileProviderMessageInterfacesForItemAtURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[7] = *MEMORY[0x1E4F143B8];
  qos_class_t v6 = qos_class_self();
  global_queue = dispatch_get_global_queue(v6, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__NSFileManager_getFileProviderMessageInterfacesForItemAtURL_completionHandler___block_invoke_2;
  v9[3] = &unk_1E51F7DF0;
  uint64_t v8 = *(void *)(a1 + 32);
  v9[5] = a3;
  void v9[6] = v8;
  v9[4] = a2;
  dispatch_async(global_queue, v9);
}

uint64_t __80__NSFileManager_getFileProviderMessageInterfacesForItemAtURL_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getFileProviderServicesForItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  v9[5] = *MEMORY[0x1E4F143B8];
  if (!completionHandler)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: completionHandler is NULL", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (qword_1EB1ECEC0 != -1) {
    dispatch_once(&qword_1EB1ECEC0, &__block_literal_global_640);
  }
  if (off_1EB1ECEA8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__NSFileManager_getFileProviderServicesForItemAtURL_completionHandler___block_invoke;
    v9[3] = &unk_1E51F7E68;
    v9[4] = completionHandler;
    off_1EB1ECEA8(url, 0, v9);
  }
  else
  {
    qos_class_t v6 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3328 userInfo:0];
    BOOL v7 = (void (*)(void *, void, NSError *))*((void *)completionHandler + 2);
    v7(completionHandler, 0, v6);
  }
}

void __71__NSFileManager_getFileProviderServicesForItemAtURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[9] = *MEMORY[0x1E4F143B8];
  qos_class_t v10 = qos_class_self();
  global_queue = dispatch_get_global_queue(v10, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__NSFileManager_getFileProviderServicesForItemAtURL_completionHandler___block_invoke_2;
  v13[3] = &unk_1E51F7E40;
  uint64_t v12 = *(void *)(a1 + 32);
  v13[4] = a5;
  v13[5] = a3;
  v13[6] = a2;
  v13[7] = v12;
  void v13[8] = a4;
  dispatch_async(global_queue, v13);
}

void __71__NSFileManager_getFileProviderServicesForItemAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    objc_super v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = dispatch_group_create();
    BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v11 = [[NSFileProviderService alloc] initWithName:v10 endpointCreatingProxy:*(void *)(a1 + 48) requestFinishedGroup:v3];
          [v4 setObject:v11 forKey:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v7);
    }
    uint64_t v12 = (void *)[v4 copy];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    global_queue = dispatch_get_global_queue(17, 2uLL);
    dispatch_group_notify(v3, global_queue, *(dispatch_block_t *)(a1 + 64));
    dispatch_release(v3);
  }
}

- (void)synchronouslyGetFileProviderServicesForItemAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    uint64_t v20 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: completionHandler is NULL", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v20);
  }
  if (qword_1EB1ECEC0 != -1) {
    dispatch_once(&qword_1EB1ECEC0, &__block_literal_global_640);
  }
  if (off_1EB1ECEA8)
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3052000000;
    uint64_t v43 = __Block_byref_object_copy__3;
    CFRange v44 = __Block_byref_object_dispose__3;
    uint64_t v45 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3052000000;
    int v37 = __Block_byref_object_copy__3;
    long long v38 = __Block_byref_object_dispose__3;
    uint64_t v39 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3052000000;
    CFComparisonResult v31 = __Block_byref_object_copy__380;
    uint64_t v32 = __Block_byref_object_dispose__381;
    uint64_t v33 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3052000000;
    size_t v25 = __Block_byref_object_copy__3;
    uint64_t v26 = __Block_byref_object_dispose__3;
    uint64_t v27 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__NSFileManager_synchronouslyGetFileProviderServicesForItemAtURL_completionHandler___block_invoke;
    v21[3] = &unk_1E51F7E90;
    v21[4] = &v22;
    v21[5] = &v40;
    v21[6] = &v34;
    v21[7] = &v28;
    off_1EB1ECEA8(a3, 1, v21);
    if (v23[5])
    {
      (*((void (**)(id, void))a4 + 2))(a4, 0);
    }
    else
    {
      uint64_t v8 = dispatch_group_create();
      id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v10 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend((id)v35[5], "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v11 = (void *)v35[5];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v46 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v48 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            long long v16 = [NSFileProviderService alloc];
            long long v17 = [(NSFileProviderService *)v16 initWithName:v15 endpointCreatingProxy:v41[5] requestFinishedGroup:v8];
            [v10 setObject:v17 forKey:v15];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v46 count:16];
        }
        while (v12);
      }
      long long v18 = (void *)[v10 copy];
      (*((void (**)(id, void *, void))a4 + 2))(a4, v18, 0);

      global_queue = dispatch_get_global_queue(17, 2uLL);
      dispatch_group_notify(v8, global_queue, (dispatch_block_t)v29[5]);
      dispatch_release(v8);
    }
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    uint64_t v6 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3328 userInfo:0];
    uint64_t v7 = (void (*)(id, void, NSError *))*((void *)a4 + 2);
    v7(a4, 0, v6);
  }
}

id __84__NSFileManager_synchronouslyGetFileProviderServicesForItemAtURL_completionHandler___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  if (a5)
  {
    id result = a5;
    uint64_t v7 = a1[4];
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
    *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
    id result = (id)[a4 copy];
    uint64_t v7 = a1[7];
  }
  *(void *)(*(void *)(v7 + 8) + 40) = result;
  return result;
}

- (void)synchronouslyGetFileProviderServiceWithName:(id)a3 forItemAtURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    id v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: completionHandler is NULL", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  if (qword_1EB1ECEC0 != -1) {
    dispatch_once(&qword_1EB1ECEC0, &__block_literal_global_640);
  }
  if (off_1EB1ECEB0)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3052000000;
    CFComparisonResult v31 = __Block_byref_object_copy__3;
    uint64_t v32 = __Block_byref_object_dispose__3;
    uint64_t v33 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3052000000;
    size_t v25 = __Block_byref_object_copy__380;
    uint64_t v26 = __Block_byref_object_dispose__381;
    uint64_t v27 = 0;
    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x3052000000;
    uint64_t v19 = __Block_byref_object_copy__3;
    uint64_t v20 = __Block_byref_object_dispose__3;
    uint64_t v21 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __92__NSFileManager_synchronouslyGetFileProviderServiceWithName_forItemAtURL_completionHandler___block_invoke;
    v15[3] = &unk_1E51F7EB8;
    v15[4] = &v16;
    v15[5] = &v28;
    v15[6] = &v22;
    off_1EB1ECEB0(a4, a3, 1, v15);
    if (v17[5])
    {
      (*((void (**)(id, void))a5 + 2))(a5, 0);
    }
    else
    {
      uint64_t v10 = dispatch_group_create();
      id v11 = [NSFileProviderService alloc];
      uint64_t v12 = [(NSFileProviderService *)v11 initWithName:a3 endpointCreatingProxy:v29[5] requestFinishedGroup:v10];
      (*((void (**)(id, NSFileProviderService *, void))a5 + 2))(a5, v12, 0);

      global_queue = dispatch_get_global_queue(17, 2uLL);
      dispatch_group_notify(v10, global_queue, (dispatch_block_t)v23[5]);
      dispatch_release(v10);
    }
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    uint64_t v8 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3328 userInfo:0];
    id v9 = (void (*)(id, void, NSError *))*((void *)a5 + 2);
    v9(a5, 0, v8);
  }
}

id __92__NSFileManager_synchronouslyGetFileProviderServiceWithName_forItemAtURL_completionHandler___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  if (a4)
  {
    id result = a4;
    uint64_t v6 = a1[4];
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
    id result = (id)[a3 copy];
    uint64_t v6 = a1[6];
  }
  *(void *)(*(void *)(v6 + 8) + 40) = result;
  return result;
}

- (BOOL)_web_createFileAtPathWithIntermediateDirectories:(id)a3 contents:(id)a4 attributes:(id)a5 directoryAttributes:(id)a6
{
  if (-[NSFileManager createFileAtPath:contents:attributes:](self, "createFileAtPath:contents:attributes:"))
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    BOOL v11 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](self, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", [a3 stringByDeletingLastPathComponent], 1, a6, 0);
    if (v11)
    {
      LOBYTE(v11) = [(NSFileManager *)self createFileAtPath:a3 contents:a4 attributes:a5];
    }
  }
  return v11;
}

- (BOOL)_web_changeFinderAttributes:(id)a3 forFileAtPath:(id)a4
{
  return 0;
}

- (BOOL)_web_createFileAtPath:(id)a3 contents:(id)a4 attributes:(id)a5
{
  BOOL v8 = -[NSFileManager createFileAtPath:contents:attributes:](self, "createFileAtPath:contents:attributes:", a3, a4);
  if (v8) {
    [(NSFileManager *)self _web_changeFinderAttributes:a5 forFileAtPath:a3];
  }
  return v8;
}

- (void)_performRemoveFileAtPath:(id)a3
{
  _CFAutoreleasePoolPush();
  [+[NSFileManager defaultManager] removeItemAtPath:a3 error:0];

  _CFAutoreleasePoolPop();
}

- (void)_web_backgroundRemoveFileAtPath:(id)a3
{
  v11[1] = *(NSString **)MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  v11[0] = 0;
  int v9 = 0;
  if (_NSCreateTemporaryFile(a3, v11, &v9, &v10, 0))
  {
    uint64_t v5 = (std::__fs::filesystem::path *)strdup([(NSString *)v11[0] fileSystemRepresentation]);
    uint64_t v6 = (const std::__fs::filesystem::path *)[a3 fileSystemRepresentation];
    close(v9);
    rename(v6, v5, v7);
    if (!v8)
    {
      v11[0] = [+[NSFileManager defaultManager] stringWithFileSystemRepresentation:v5 length:strlen((const char *)v5)];
      +[NSThread detachNewThreadSelector:sel__performRemoveFileAtPath_ toTarget:self withObject:v11[0]];
    }
    free(v5);
    _NSCleanupTemporaryDirectory(v10);
  }
}

- (BOOL)_web_removeFileOnlyAtPath:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = unlink((const char *)[a3 fileSystemRepresentation]);
  memset(&v7.f_mntonname[392], 0, 32);
  if (!statfs((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0),
          &v7)
    && (v7.f_flags & 0x8000) == 0)
  {
    uint64_t v5 = (void *)[a3 lastPathComponent];
    if ([v5 length])
    {
      if (([v5 isEqualToString:@"/"] & 1) == 0) {
        v4 |= unlink((const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingString:", objc_msgSend(@"._", "stringByAppendingString:", v5)), "fileSystemRepresentation"));
      }
    }
  }
  return v4 == 0;
}

- (void)_web_backgroundRemoveLeftoverFiles:(id)a3
{
  uint64_t v5 = +[NSFileManager defaultManager];
  uint64_t v6 = [a3 stringByDeletingLastPathComponent];
  statfs v7 = +[NSString stringWithFormat:@"%@/.tmp%ld", v6, 0];
  if ([(NSFileManager *)v5 fileExistsAtPath:v7])
  {
    uint64_t v8 = 1;
    do
    {
      +[NSThread detachNewThreadSelector:sel__performRemoveFileAtPath_ toTarget:self withObject:v7];
      statfs v7 = +[NSString stringWithFormat:@"%@/.tmp%ld", v6, v8++];
    }
    while ([(NSFileManager *)v5 fileExistsAtPath:v7]);
  }
}

- (id)_web_visibleItemsInDirectoryAtPath:(id)a3
{
  return [(NSFileManager *)self contentsOfDirectoryAtPath:a3 error:0];
}

- (id)_web_pathWithUniqueFilenameForPath:(id)a3
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "_web_filenameByFixingIllegalCharacters"));
  int v4 = +[NSFileManager defaultManager];
  if (![(NSFileManager *)v4 fileExistsAtPath:v3]) {
    return v3;
  }
  uint64_t v5 = (void *)[v3 lastPathComponent];
  uint64_t v6 = [v5 rangeOfString:@"."];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    statfs v7 = 0;
  }
  else
  {
    uint64_t v9 = v6;
    statfs v7 = (void *)[v5 substringFromIndex:v6 + 1];
    uint64_t v3 = objc_msgSend((id)objc_msgSend(v3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend(v5, "substringToIndex:", v9));
  }
  uint64_t v10 = 1;
  do
  {
    uint64_t v8 = +[NSString stringWithFormat:@"%@-%ld", v3, v10];
    if ([v7 length]) {
      uint64_t v8 = [(NSString *)v8 stringByAppendingPathExtension:v7];
    }
    ++v10;
  }
  while ([(NSFileManager *)v4 fileExistsAtPath:v8]);
  return v8;
}

- (BOOL)_web_fileExistsAtPath_nowarn:(id)a3 isDirectory:(BOOL *)a4 traverseLink:(BOOL)a5
{
  if (a5)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v8 = [+[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:a3 error:0];
    uint64_t v9 = (uint64_t)v8;
    if (v8 && ![(NSString *)v8 isAbsolutePath]) {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", v9);
    }
    if (v9) {
      id v10 = (id)v9;
    }
    else {
      id v10 = a3;
    }
    BOOL v11 = [(NSFileManager *)self attributesOfItemAtPath:v10 error:0];
    if (v11)
    {
      int v12 = objc_msgSend(-[NSDictionary objectForKey:](v11, "objectForKey:", @"NSFileType"), "isEqualToString:", @"NSFileTypeDirectory");
      LOBYTE(v11) = 1;
      if (a4)
      {
        if (v12) {
          *a4 = 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(v11) = -[NSFileManager fileExistsAtPath:isDirectory:](self, "fileExistsAtPath:isDirectory:");
  }
  return (char)v11;
}

- (id)_web_carbonPathForPath_nowarn:(id)a3
{
  return 0;
}

- (id)_web_startupVolumeName_nowarn
{
  id v2 = [(NSFileManager *)self _web_carbonPathForPath_nowarn:@"/"];
  uint64_t v3 = [v2 length] - 1;

  return (id)[v2 substringToIndex:v3];
}

- (BOOL)_web_createIntermediateDirectoriesForPath_nowarn:(id)a3 attributes:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 && [a3 length] && objc_msgSend(a3, "isAbsolutePath"))
  {
    char v15 = 0;
    if (-[NSFileManager _web_fileExistsAtPath_nowarn:isDirectory:traverseLink:](self, "_web_fileExistsAtPath_nowarn:isDirectory:traverseLink:", [a3 stringByDeletingLastPathComponent], &v15, 1))
    {
      return v15 != 0;
    }
    else
    {
      id v8 = a3;
      while (([v8 isEqualToString:@"/"] & 1) == 0)
      {
        id v8 = (id)[v8 stringByDeletingLastPathComponent];
        if ([(NSFileManager *)self _web_fileExistsAtPath_nowarn:v8 isDirectory:&v15 traverseLink:1])
        {
          if (!v15) {
            return 0;
          }
          break;
        }
      }
      uint64_t v9 = -[NSMutableString initWithCapacity:]([NSMutableString alloc], "initWithCapacity:", [a3 length]);
      id v10 = (void *)[a3 componentsSeparatedByString:@"/"];
      uint64_t v11 = [v10 count];
      unint64_t v12 = 0;
      unint64_t v13 = v11 - 1;
      if (v11 != 1)
      {
        while (![(NSString *)v9 isEqualToString:v8])
        {
          if (v12) {
            [(NSMutableString *)v9 appendString:@"/"];
          }
          -[NSMutableString appendString:](v9, "appendString:", [v10 objectAtIndex:v12++]);
          if (v13 == v12) {
            goto LABEL_29;
          }
        }
      }
      if (v12 >= v13)
      {
LABEL_29:
        BOOL v7 = 1;
      }
      else
      {
        BOOL v7 = 0;
        do
        {
          while (!objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v12), "length"))
            ;
          if (v12) {
            [(NSMutableString *)v9 appendString:@"/"];
          }
          -[NSMutableString appendString:](v9, "appendString:", [v10 objectAtIndex:v12]);
          if ([(NSFileManager *)self _web_fileExistsAtPath_nowarn:v9 isDirectory:&v15 traverseLink:1])
          {
            if (!v15) {
              break;
            }
          }
          else if (![(NSFileManager *)self createDirectoryAtPath:v9 withIntermediateDirectories:0 attributes:a4 error:0])
          {
            break;
          }
          BOOL v7 = ++v12 >= v13;
        }
        while (v12 != v13);
      }
    }
  }
  else
  {
    return 0;
  }
  return v7;
}

- (BOOL)_web_changeFileAttributes_nowarn:(id)a3 atPath:(id)a4
{
  BOOL v7 = [(NSFileManager *)self setAttributes:a3 ofItemAtPath:a4 error:0];
  return [(NSFileManager *)self _web_changeFinderAttributes:a3 forFileAtPath:a4]&& v7;
}

@end