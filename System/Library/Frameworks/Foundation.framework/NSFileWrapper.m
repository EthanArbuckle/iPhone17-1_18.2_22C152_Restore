@interface NSFileWrapper
+ (BOOL)_canSafelyMapFilesAtPath:(id)a3;
+ (BOOL)_finishWritingToURL:(id)a3 byMovingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6;
+ (BOOL)_finishWritingToURL:(id)a3 byTakingContentsFromItemAtURL:(id)a4 addingAttributes:(id)a5 usingTemporaryDirectoryAtURL:(id)a6 backupFileName:(id)a7 error:(id *)a8;
+ (BOOL)_forPath:(id)a3 getItemKind:(id *)a4 modificationDate:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)_newContentsAtURL:(id)a3 path:(id)a4 itemKind:(id)a5 oldChildrenByUniqueFileName:(id)a6 options:(unint64_t)a7 error:(id *)a8;
+ (id)_pathForURL:(id)a3 reading:(BOOL)a4 error:(id *)a5;
+ (id)_temporaryDirectoryURLForWritingToURL:(id)a3 error:(id *)a4;
+ (void)_removeTemporaryDirectoryAtURL:(id)a3;
+ (void)_writeAttributes:(id)a3 toURL:(id)a4;
+ (void)initialize;
- (BOOL)_forWritingToURL:(id)a3 returnContentsLazyReadingError:(id *)a4;
- (BOOL)_matchesItemKind:(id)a3 modificationDate:(id)a4;
- (BOOL)_readContentsFromURL:(id)a3 path:(id)a4 itemKind:(id)a5 options:(unint64_t)a6 error:(id *)a7;
- (BOOL)_writeContentsToURL:(id)a3 path:(id)a4 originalContentsURL:(id)a5 tryHardLinking:(BOOL)a6 didHardLinking:(BOOL *)a7 error:(id *)a8;
- (BOOL)isDirectory;
- (BOOL)isRegularFile;
- (BOOL)isSymbolicLink;
- (BOOL)matchesContentsOfURL:(NSURL *)url;
- (BOOL)readFromURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError *)outError;
- (BOOL)writeToURL:(NSURL *)url options:(NSFileWrapperWritingOptions)options originalContentsURL:(NSURL *)originalContentsURL error:(NSError *)outError;
- (NSData)regularFileContents;
- (NSData)serializedRepresentation;
- (NSDictionary)fileAttributes;
- (NSDictionary)fileWrappers;
- (NSFileWrapper)init;
- (NSFileWrapper)initDirectoryWithFileWrappers:(NSDictionary *)childrenByPreferredName;
- (NSFileWrapper)initRegularFileWithContents:(NSData *)contents;
- (NSFileWrapper)initSymbolicLinkWithDestinationURL:(NSURL *)url;
- (NSFileWrapper)initWithCoder:(NSCoder *)inCoder;
- (NSFileWrapper)initWithSerializedRepresentation:(NSData *)serializeRepresentation;
- (NSFileWrapper)initWithURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError *)outError;
- (NSString)addFileWrapper:(NSFileWrapper *)child;
- (NSString)addRegularFileWithContents:(NSData *)data preferredFilename:(NSString *)fileName;
- (NSString)filename;
- (NSString)keyForFileWrapper:(NSFileWrapper *)child;
- (NSString)preferredFilename;
- (NSURL)symbolicLinkDestinationURL;
- (id)_addChild:(id)a3 forUniqueFileName:(id)a4;
- (id)_attributesToWrite;
- (id)_fullDescription:(BOOL)a3;
- (id)_initWithImpl:(id)a3 preferredFileName:(id)a4 uniqueFileName:(id)a5 docInfo:(id)a6 iconData:(id)a7;
- (id)_newImpl;
- (id)_uniqueFileNameOfChild:(id)a3;
- (void)_addParent:(id)a3;
- (void)_initDirectoryContents;
- (void)_observePreferredFileNameOfChild:(id)a3;
- (void)_removeChild:(id)a3 forUniqueFileName:(id)a4;
- (void)_removeParent:(id)a3;
- (void)_resetFileModificationDate;
- (void)_updateDescendantFileNames;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeFileWrapper:(NSFileWrapper *)child;
- (void)setFileAttributes:(NSDictionary *)fileAttributes;
- (void)setFilename:(NSString *)filename;
- (void)setPreferredFilename:(NSString *)preferredFilename;
@end

@implementation NSFileWrapper

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = (void *)[self->_contents objectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v7++) _removeParent:self];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
      }
      while (v5);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)NSFileWrapper;
  [(NSFileWrapper *)&v8 dealloc];
}

- (void)_removeParent:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&NSFileWrapperLock);
  [(NSHashTable *)self->_parents removeObject:a3];

  os_unfair_lock_unlock((os_unfair_lock_t)&NSFileWrapperLock);
}

+ (id)_newContentsAtURL:(id)a3 path:(id)a4 itemKind:(id)a5 oldChildrenByUniqueFileName:(id)a6 options:(unint64_t)a7 error:(id *)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = +[NSFileManager defaultManager];
  if ([a5 isEqualToString:@"NSFileTypeDirectory"])
  {
    uint64_t v15 = [(NSFileManager *)v14 contentsOfDirectoryAtURL:a3 includingPropertiesForKeys:0 options:0 error:a8];
    if (v15)
    {
      v16 = (void *)v15;
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v51 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        v20 = 0;
        unint64_t v44 = a7 | 0x100;
        uint64_t v45 = *(void *)v53;
        id v40 = v17;
        v41 = a8;
        id v42 = a6;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v53 != v45) {
              objc_enumerationMutation(v16);
            }
            v22 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            v23 = objc_alloc_init(NSAutoreleasePool);
            v24 = (void *)[v22 lastPathComponent];
            if (!objc_msgSend((id)objc_msgSend(v24, "pathExtension"), "isEqualToString:", @"tiff")) {
              goto LABEL_51;
            }
            if (!v20)
            {
              v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v16, "count"));
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              uint64_t v25 = [v16 countByEnumeratingWithState:&v47 objects:v46 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v48;
                do
                {
                  for (uint64_t j = 0; j != v26; ++j)
                  {
                    if (*(void *)v48 != v27) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v29 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * j), "lastPathComponent", v40, v41);
                    if (v29) {
                      [v20 addObject:v29];
                    }
                  }
                  uint64_t v26 = [v16 countByEnumeratingWithState:&v47 objects:v46 count:16];
                }
                while (v26);
                id v17 = v40;
                a8 = v41;
              }
              a6 = v42;
            }
            if ((objc_msgSend(v20, "containsObject:", objc_msgSend(v24, "stringByDeletingPathExtension", v40, v41)) & 1) == 0)
            {
LABEL_51:
              if (v24 && (v30 = (void *)[a6 objectForKey:v24]) != 0)
              {
                if (![v30 readFromURL:v22 options:v44 error:a8]) {
                  goto LABEL_40;
                }
                [a6 removeObjectForKey:v24];
              }
              else
              {
                uint64_t v31 = [objc_alloc((Class)a1) initWithURL:v22 options:v44 error:a8];
                if (!v31)
                {
LABEL_40:
                  if (a8)
                  {
                    id v38 = *a8;
                    [(NSAutoreleasePool *)v23 drain];
                    id v39 = *a8;
                  }
                  else
                  {
                    [(NSAutoreleasePool *)v23 drain];
                  }

                  return 0;
                }
                v32 = (void *)v31;
                [v17 addObject:v31];
              }
            }
            [(NSAutoreleasePool *)v23 drain];
          }
          uint64_t v19 = [v16 countByEnumeratingWithState:&v52 objects:v51 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
      return v17;
    }
    return 0;
  }
  if ([a5 isEqualToString:@"NSFileTypeRegular"])
  {
    id v33 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    return (id)[v33 initWithContentsOfURL:a3 options:~(a7 >> 1) & 1 error:a8];
  }
  if (![a5 isEqualToString:@"NSFileTypeSymbolicLink"])
  {
    if (a8)
    {
      id v17 = 0;
      *a8 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(5, (uint64_t)a3, 1, 0, 0);
      return v17;
    }
    return 0;
  }
  uint64_t v35 = [(NSFileManager *)v14 destinationOfSymbolicLinkAtPath:a4 error:a8];
  if (!v35) {
    return 0;
  }
  uint64_t v36 = v35;
  id v37 = objc_alloc(MEMORY[0x1E4F1CB10]);

  return (id)[v37 initFileURLWithPath:v36];
}

- (BOOL)_readContentsFromURL:(id)a3 path:(id)a4 itemKind:(id)a5 options:(unint64_t)a6 error:(id *)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v13 = [a3 startAccessingSecurityScopedResource];
  if (!a4)
  {
    a4 = (id)[(id)objc_opt_class() _pathForURL:a3 reading:1 error:a7];
    if (!a4)
    {
      BOOL v27 = 0;
      if (!v13) {
        return v27;
      }
      goto LABEL_30;
    }
  }
  if ([(NSFileWrapper *)self isDirectory]) {
    uint64_t v14 = (void *)[self->_contents mutableCopy];
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = [(id)objc_opt_class() _newContentsAtURL:a3 path:a4 itemKind:a5 oldChildrenByUniqueFileName:v14 options:a6 error:a7];
  unint64_t v16 = a6 & 0x100 | v15;
  BOOL v17 = v16 == 0;
  if (v16)
  {
    uint64_t v18 = (void *)v15;
    int v29 = v13;
    if (a7 && !v15) {
      *a7 = 0;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v19 = [v14 countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v14);
          }
          -[NSFileWrapper _removeChild:forUniqueFileName:](self, "_removeChild:forUniqueFileName:", [v14 objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * i)], *(void *)(*((void *)&v36 + 1) + 8 * i));
        }
        uint64_t v20 = [v14 countByEnumeratingWithState:&v36 objects:v35 count:16];
      }
      while (v20);
    }
    if ([a5 isEqualToString:@"NSFileTypeDirectory"])
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v23 = [v18 countByEnumeratingWithState:&v31 objects:v30 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v32 != v25) {
              objc_enumerationMutation(v18);
            }
            [(NSFileWrapper *)self _addChild:*(void *)(*((void *)&v31 + 1) + 8 * j) forUniqueFileName:0];
          }
          uint64_t v24 = [v18 countByEnumeratingWithState:&v31 objects:v30 count:16];
        }
        while (v24);
      }

      int v13 = v29;
      if (v18 && !self->_contents) {
        [(NSFileWrapper *)self _initDirectoryContents];
      }
    }
    else
    {

      self->_contents = v18;
      int v13 = v29;
    }
  }
  BOOL v27 = !v17;

  if (v13) {
LABEL_30:
  }
    [a3 stopAccessingSecurityScopedResource];
  return v27;
}

- (NSDictionary)fileWrappers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(NSFileWrapper *)self isDirectory])
  {
    v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ *** this method is only for directory type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  if (!self->_contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      id v10 = 0;
      if (![(NSFileWrapper *)self _readContentsFromURL:contentsURL path:0 itemKind:@"NSFileTypeDirectory" options:2 * self->_contentsMustBeReadWithoutMapping error:&v10])
      {

        self->_contentsLazyReadingError = (NSError *)v10;
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSFileWrapperLogsLess") & 1) == 0&& (fileWrappers_alreadyWarned & 1) == 0)
        {
          fileWrappers_alreadyWarned = 1;
          uint64_t v6 = _NSOSLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            uint64_t v7 = _NSFullMethodName((objc_class *)self, a2);
            uint64_t v8 = [v10 localizedDescription];
            *(_DWORD *)buf = 138412546;
            long long v12 = v7;
            __int16 v13 = 2112;
            uint64_t v14 = v8;
            _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "%@ tried to read the file wrapper's contents lazily but an error occurred: %@", buf, 0x16u);
          }
        }
      }
    }
  }
  result = self->_cachedDirectoryChildrenAsDictionary;
  if (!result)
  {
    result = (NSDictionary *)[self->_contents copy];
    self->_cachedDirectoryChildrenAsDictionary = result;
  }
  return result;
}

- (NSFileWrapper)initWithURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError *)outError
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)NSFileWrapper;
  uint64_t v8 = [(NSFileWrapper *)&v20 init];
  if (v8)
  {
    v9 = v8;
    id v10 = (NSURL *)[(id)objc_opt_class() _pathForURL:url reading:1 error:outError];
    if (v10)
    {
      long long v11 = v10;
      if (([(NSURL *)v10 isEqualToString:@"/"] & 1) == 0)
      {
        if ((options & 0x202) == 0)
        {
          int v14 = [(id)objc_opt_class() _canSafelyMapFilesAtPath:v11];
          NSFileWrapperReadingOptions v15 = options | 2;
          if (v14) {
            NSFileWrapperReadingOptions v15 = options;
          }
          options = v15 | 0x200;
        }
        unint64_t v16 = +[NSFileManager defaultManager];
        uint64_t v17 = objc_msgSend(-[NSFileManager _attributesOfItemAtURL:filterResourceFork:error:](v16, "_attributesOfItemAtURL:filterResourceFork:error:", url, 0, outError), "copy");
        v9->_fileAttributes = (NSDictionary *)v17;
        if (!v17) {
          goto LABEL_24;
        }
        uint64_t v18 = (NSString *)[(NSString *)[(NSURL *)v11 lastPathComponent] copy];
        v9->_preferredFileName = v18;
        v9->_fileName = v18;
        if (options)
        {
          if ([(NSFileWrapper *)v9 _readContentsFromURL:url path:v11 itemKind:[(NSDictionary *)v9->_fileAttributes fileType] options:options error:outError])
          {
            return v9;
          }
          goto LABEL_24;
        }
        if (url)
        {
          if ([(NSFileManager *)v16 isReadableFileAtPath:v11] || (options & 0x100) != 0)
          {
            v9->_contentsURL = url;
            v9->_contentsMustBeReadWithoutMapping = (options & 2) != 0;
            return v9;
          }
          if (!outError) {
            goto LABEL_24;
          }
          uint64_t v12 = 13;
          __int16 v13 = url;
        }
        else
        {
          if (!outError) {
            goto LABEL_24;
          }
          uint64_t v12 = 2;
          __int16 v13 = 0;
        }
        goto LABEL_6;
      }
      if (outError)
      {
        uint64_t v12 = 27;
        __int16 v13 = v11;
LABEL_6:
        *outError = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v12, (uint64_t)v13, 1, 0, 0);
      }
    }
LABEL_24:

    return 0;
  }
  if (!outError) {
    return 0;
  }
  v9 = 0;
  *outError = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(12, (uint64_t)url, 1, 0, 0);
  return v9;
}

+ (id)_pathForURL:(id)a3 reading:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (![a3 isFileURL])
  {
    if (!a5) {
      return 0;
    }
    if (a3) {
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:@"NSURL"];
    }
    else {
      uint64_t v10 = 0;
    }
    if (v6) {
      uint64_t v11 = 262;
    }
    else {
      uint64_t v11 = 518;
    }
    goto LABEL_16;
  }
  id result = (id)[a3 path];
  if (a5 && !result)
  {
    if (v6) {
      uint64_t v9 = 260;
    }
    else {
      uint64_t v9 = 4;
    }
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:@"NSURL"];
    uint64_t v11 = v9;
LABEL_16:
    uint64_t v12 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:v11 userInfo:v10];
    id result = 0;
    *a5 = v12;
  }
  return result;
}

+ (BOOL)_canSafelyMapFilesAtPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int IsSafeForMapping = [a3 getFileSystemRepresentation:v11 maxLength:1024];
  if (IsSafeForMapping)
  {
    uint64_t v10 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 5;
    uint64_t v9 = 2147500032;
    int v4 = getattrlist(v11, &v8, &v7, 8uLL, 0);
    LOBYTE(IsSafeForMapping) = 0;
    if (!v4 && (WORD2(v7) & 0x1200) == 0x1000)
    {
      int IsSafeForMapping = _NSFileCompressionTypeIsSafeForMapping((uint64_t)v11);
      if (IsSafeForMapping)
      {
        uint64_t v7 = 0;
        uint64_t v9 = 0;
        uint64_t v10 = 0;
        uint64_t v8 = 0x4000000000000005;
        if (getattrlist(v11, &v8, &v7, 8uLL, 1u)) {
          BOOL v5 = 0;
        }
        else {
          BOOL v5 = HIDWORD(v7) == 1;
        }
        LOBYTE(IsSafeForMapping) = !v5;
      }
    }
  }
  return IsSafeForMapping;
}

- (id)_addChild:(id)a3 forUniqueFileName:(id)a4
{
  id v4 = a4;
  if (!a4)
  {
    id v4 = (id)[a3 preferredFilename];
    uint64_t v7 = [self->_contents objectForKey:v4];
    if (!v4 || v7)
    {
      uint64_t v8 = 1;
      do
      {
        uint64_t v9 = v8 + 1;
        uint64_t v10 = +[NSString stringWithFormat:@"%lu%@%@", v8, @"__#$!@%!#__", v4];
        uint64_t v11 = [self->_contents objectForKey:v10];
        if (v10) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 0;
        }
        uint64_t v8 = v9;
      }
      while (!v12);
      id v4 = v10;
    }
  }
  id contents = self->_contents;
  if (!contents)
  {
    [(NSFileWrapper *)self _initDirectoryContents];
    id contents = self->_contents;
  }
  [contents setObject:a3 forKey:v4];
  [a3 _addParent:self];
  return v4;
}

- (NSString)preferredFilename
{
  v2 = self->_preferredFileName;

  return v2;
}

- (void)_addParent:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&NSFileWrapperLock);
  parents = self->_parents;
  if (!parents)
  {
    parents = +[NSHashTable weakObjectsHashTable];
    self->_parents = parents;
  }
  [(NSHashTable *)parents addObject:a3];

  os_unfair_lock_unlock((os_unfair_lock_t)&NSFileWrapperLock);
}

- (NSData)regularFileContents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(NSFileWrapper *)self isRegularFile])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ *** this method is only for regular file type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  id contents = self->_contents;
  if (!contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      id v11 = 0;
      if (![(NSFileWrapper *)self _readContentsFromURL:contentsURL path:0 itemKind:@"NSFileTypeRegular" options:2 * self->_contentsMustBeReadWithoutMapping error:&v11])
      {

        self->_contentsLazyReadingError = (NSError *)v11;
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSFileWrapperLogsLess") & 1) == 0&& (regularFileContents_alreadyWarned & 1) == 0)
        {
          regularFileContents_alreadyWarned = 1;
          BOOL v6 = _NSOSLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            uint64_t v8 = _NSFullMethodName((objc_class *)self, a2);
            uint64_t v9 = [v11 localizedDescription];
            *(_DWORD *)buf = 138412546;
            __int16 v13 = v8;
            __int16 v14 = 2112;
            uint64_t v15 = v9;
            _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "%@ tried to read the file wrapper's contents lazily but an error occurred: %@", buf, 0x16u);
          }
        }
      }
      id contents = self->_contents;
    }
    else
    {
      id contents = 0;
    }
  }
  return (NSData *)contents;
}

- (BOOL)isRegularFile
{
  id v2 = [(NSDictionary *)[(NSFileWrapper *)self fileAttributes] fileType];

  return [v2 isEqualToString:@"NSFileTypeRegular"];
}

- (BOOL)isDirectory
{
  id v2 = [(NSDictionary *)[(NSFileWrapper *)self fileAttributes] fileType];

  return [v2 isEqualToString:@"NSFileTypeDirectory"];
}

- (NSDictionary)fileAttributes
{
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  if (_CFAppVersionCheckLessThan() || _CFAppVersionCheckLessThan())
  {
    id v4 = (NSDictionary *)[(NSDictionary *)self->_fileAttributes mutableCopy];
    id v5 = [(NSDictionary *)v4 objectForKey:@"NSFileHFSCreatorCode"];
    if (v5 && ![v5 unsignedIntValue]) {
      [(NSDictionary *)v4 removeObjectForKey:@"NSFileHFSCreatorCode"];
    }
    id v6 = [(NSDictionary *)v4 objectForKey:@"NSFileHFSTypeCode"];
    if (v6 && ![v6 unsignedIntValue]) {
      [(NSDictionary *)v4 removeObjectForKey:@"NSFileHFSTypeCode"];
    }
  }
  else
  {
    id v4 = self->_fileAttributes;
  }
  os_unfair_lock_unlock(p_propertyLock);

  return v4;
}

- (void)_initDirectoryContents
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1D530] + 16);
  *(_OWORD *)&v3.version = *MEMORY[0x1E4F1D530];
  *(_OWORD *)&v3.release = v2;
  v3.equal = (CFDictionaryEqualCallBack)NSFileWrapperChildNameIsEqual_CFDictionary;
  v3.hash = (CFDictionaryHashCallBack)NSFileWrapperChildNameHash_CFDictionary;
  self->_id contents = CFDictionaryCreateMutable(0, 0, &v3, MEMORY[0x1E4F1D540]);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:46];
  }
}

- (NSFileWrapper)init
{
  return [(NSFileWrapper *)self initRegularFileWithContents:0];
}

- (NSFileWrapper)initDirectoryWithFileWrappers:(NSDictionary *)childrenByPreferredName
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)NSFileWrapper;
  uint64_t v4 = [(NSFileWrapper *)&v12 init];
  if (v4)
  {
    v4->_fileAttributes = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"NSFileTypeDirectory", @"NSFileType", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 511), @"NSFilePosixPermissions", 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    NSUInteger v5 = [(NSDictionary *)childrenByPreferredName countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v5)
    {
      NSUInteger v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(childrenByPreferredName);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v10 = [(NSDictionary *)childrenByPreferredName objectForKey:v9];
          if (![v10 preferredFilename]) {
            [v10 setPreferredFilename:v9];
          }
          [(NSFileWrapper *)v4 _addChild:v10 forUniqueFileName:0];
        }
        NSUInteger v6 = [(NSDictionary *)childrenByPreferredName countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v6);
    }
    if (!v4->_contents) {
      [(NSFileWrapper *)v4 _initDirectoryContents];
    }
  }
  return v4;
}

- (NSFileWrapper)initRegularFileWithContents:(NSData *)contents
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSFileWrapper;
  uint64_t v4 = [(NSFileWrapper *)&v9 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    NSUInteger v6 = +[NSNumber numberWithInt:438];
    v4->_fileAttributes = (NSDictionary *)objc_msgSend(v5, "initWithObjectsAndKeys:", @"NSFileTypeRegular", @"NSFileType", v6, @"NSFilePosixPermissions", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), @"NSFileModificationDate", 0);
    if (contents) {
      id v7 = (id)[(NSData *)contents copy];
    }
    else {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    }
    v4->_id contents = v7;
  }
  return v4;
}

- (NSFileWrapper)initSymbolicLinkWithDestinationURL:(NSURL *)url
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFileWrapper;
  uint64_t v4 = [(NSFileWrapper *)&v6 init];
  if (v4)
  {
    v4->_fileAttributes = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"NSFileTypeSymbolicLink", @"NSFileType", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 438), @"NSFilePosixPermissions", 0);
    v4->_id contents = (id)[(NSURL *)url copy];
  }
  return v4;
}

- (NSFileWrapper)initWithSerializedRepresentation:(NSData *)serializeRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [[NSRTFD alloc] initWithDataRepresentation:serializeRepresentation];
  if (!v4)
  {
LABEL_15:

    return 0;
  }
  id v5 = v4;
  uint64_t v6 = [(NSRTFD *)v4 objectForKey:@"__@UTF8PreferredName@__"];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [NSString alloc];
    objc_super v9 = (NSString *)v7;
    uint64_t v10 = 4;
  }
  else
  {
    id v11 = [(NSRTFD *)v5 objectForKey:@"__@PreferredName@__"];
    if (!v11) {
      goto LABEL_8;
    }
    uint64_t v8 = [NSString alloc];
    objc_super v9 = v11;
    uint64_t v10 = 2;
  }
  id v11 = [(NSString *)v8 initWithData:v9 encoding:v10];
  if (v11)
  {
    [(NSRTFD *)v5 removeObjectForKey:@"__@UTF8PreferredName@__"];
    [(NSRTFD *)v5 removeObjectForKey:@"__@PreferredName@__"];
    if ((_validateFilename(v11) & 1) == 0)
    {
      objc_super v20 = _NSOSLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138477827;
        uint64_t v23 = v11;
        _os_log_error_impl(&dword_181795000, v20, OS_LOG_TYPE_ERROR, "-[NSFileWrapper initWithSerializedRepresentation:] encountered an invalid preferredFileName: %{private}@", (uint8_t *)&v22, 0xCu);
      }

      goto LABEL_15;
    }
  }
LABEL_8:
  if ([(NSRTFD *)v5 isPackage])
  {
    objc_super v12 = self;
    __int16 v13 = v5;
    long long v14 = v11;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v17 = [(NSRTFD *)v5 objectForKey:0x1ECA6E148];
    uint64_t v18 = [(NSRTFD *)v5 _getDocInfoForKey:0x1ECA6E148];
    uint64_t v16 = -[NSRTFD objectForKey:](v5, "objectForKey:", [@".." stringByAppendingPathExtension:@"tiff"]);
    objc_super v12 = self;
    __int16 v13 = (NSRTFD *)v17;
    long long v14 = v11;
    uint64_t v15 = v18;
  }
  uint64_t v19 = [(NSFileWrapper *)v12 _initWithImpl:v13 preferredFileName:v14 uniqueFileName:0 docInfo:v15 iconData:v16];

  return v19;
}

- (BOOL)isSymbolicLink
{
  id v2 = [(NSDictionary *)[(NSFileWrapper *)self fileAttributes] fileType];

  return [v2 isEqualToString:@"NSFileTypeSymbolicLink"];
}

- (void)_observePreferredFileNameOfChild:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)[(NSDictionary *)[(NSFileWrapper *)self fileWrappers] allKeysForObject:a3] count];
  if (v5)
  {
    NSUInteger v6 = v5;
    NSUInteger v7 = v5;
    do
    {
      [(NSFileWrapper *)self removeFileWrapper:a3];
      --v7;
    }
    while (v7);
    do
    {
      [(NSFileWrapper *)self addFileWrapper:a3];
      --v6;
    }
    while (v6);
  }
}

- (void)setPreferredFilename:(NSString *)preferredFilename
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)preferredFilename length])
  {
    objc_super v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ *** preferredFilename cannot be empty.", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  NSUInteger v6 = self->_preferredFileName;
  if (v6 != preferredFilename)
  {

    self->_preferredFileName = (NSString *)[(NSString *)preferredFilename copy];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    parents = self->_parents;
    uint64_t v8 = [(NSHashTable *)parents countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(parents);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) _observePreferredFileNameOfChild:self];
        }
        uint64_t v9 = [(NSHashTable *)parents countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v9);
    }
  }
}

- (void)setFilename:(NSString *)filename
{
  CFDictionaryKeyCallBacks v3 = self->_fileName;
  if (v3 != filename)
  {

    self->_fileName = (NSString *)[(NSString *)filename copy];
  }
}

- (NSString)filename
{
  id v2 = self->_fileName;

  return v2;
}

- (void)setFileAttributes:(NSDictionary *)fileAttributes
{
  if (![(NSDictionary *)fileAttributes objectForKey:@"NSFileType"]
    || ![(NSDictionary *)fileAttributes objectForKey:@"NSFilePosixPermissions"])
  {
    NSUInteger v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ *** file attributes cannot be nil and must contain at least NSFileType and NSFilePosixPermissions.", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  os_unfair_lock_lock_with_options();
  NSUInteger v6 = self->_fileAttributes;
  if (v6 != fileAttributes)
  {

    self->_fileAttributes = (NSDictionary *)[(NSDictionary *)fileAttributes copy];
    self->_attributesMustBeWrittenSoNoHardLinking = 1;
  }

  os_unfair_lock_unlock(&self->_propertyLock);
}

+ (BOOL)_forPath:(id)a3 getItemKind:(id *)a4 modificationDate:(id *)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(&v11.st_mtimespec, 0, 96);
  int v7 = lstat((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0), &v11);
  if (!v7)
  {
    if (a4)
    {
      if ((v11.st_mode & 0x1000) != 0 || (uint64_t v8 = (v11.st_mode >> 13) - 1, v8 > 5)) {
        uint64_t v9 = (id *)&NSFileTypeUnknown;
      }
      else {
        uint64_t v9 = (id *)off_1E51FBAF0[v8];
      }
      *a4 = *v9;
    }
    if (a5) {
      *a5 = (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v11.st_mtimespec.tv_sec];
    }
  }
  return v7 == 0;
}

- (BOOL)_matchesItemKind:(id)a3 modificationDate:(id)a4
{
  id v7 = [(NSDictionary *)[(NSFileWrapper *)self fileAttributes] fileModificationDate];
  BOOL result = 0;
  if (a4 && v7)
  {
    [a4 timeIntervalSinceReferenceDate];
    double v10 = v9;
    [v7 timeIntervalSinceReferenceDate];
    return vabdd_f64(v10, v11) < 1.0
        && ([a3 isEqualToString:@"NSFileTypeDirectory"]
         && [(NSFileWrapper *)self isDirectory]
         || [a3 isEqualToString:@"NSFileTypeRegular"]
         && [(NSFileWrapper *)self isRegularFile]
         || [a3 isEqualToString:@"NSFileTypeSymbolicLink"]
         && [(NSFileWrapper *)self isSymbolicLink]);
  }
  return result;
}

- (BOOL)matchesContentsOfURL:(NSURL *)url
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(id)objc_opt_class() _pathForURL:url reading:1 error:0];
  if (v4)
  {
    NSUInteger v5 = (void *)v4;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    LODWORD(v4) = [(id)objc_opt_class() _forPath:v4 getItemKind:&v17 modificationDate:&v16];
    if (v4)
    {
      LODWORD(v4) = [(NSFileWrapper *)self _matchesItemKind:v17 modificationDate:v16];
      if (v4)
      {
        if ([(NSFileWrapper *)self isDirectory]
          && (id contents = self->_contents,
              long long v19 = 0u,
              long long v20 = 0u,
              long long v21 = 0u,
              long long v22 = 0u,
              (uint64_t v7 = [contents countByEnumeratingWithState:&v19 objects:v18 count:16]) != 0))
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v20;
          while (2)
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(contents);
              }
              uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              uint64_t v12 = objc_alloc_init(NSAutoreleasePool);
              __int16 v13 = (void *)[contents objectForKey:v11];
              long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CB10]), "initFileURLWithPath:", objc_msgSend(v5, "stringByAppendingPathComponent:", v11));
              LODWORD(v13) = [v13 matchesContentsOfURL:v14];

              [(NSAutoreleasePool *)v12 drain];
              if (!v13)
              {
                LOBYTE(v4) = 0;
                return v4;
              }
            }
            uint64_t v8 = [contents countByEnumeratingWithState:&v19 objects:v18 count:16];
            LOBYTE(v4) = 1;
            if (v8) {
              continue;
            }
            break;
          }
        }
        else
        {
          LOBYTE(v4) = 1;
        }
      }
    }
  }
  return v4;
}

- (BOOL)readFromURL:(NSURL *)url options:(NSFileWrapperReadingOptions)options error:(NSError *)outError
{
  id v9 = (id)[(id)objc_opt_class() _pathForURL:url reading:1 error:outError];
  if (v9)
  {
    id v10 = v9;
    if ((options & 0x202) == 0)
    {
      int v11 = [(id)objc_opt_class() _canSafelyMapFilesAtPath:v9];
      NSFileWrapperReadingOptions v12 = options | 2;
      if (v11) {
        NSFileWrapperReadingOptions v12 = options;
      }
      options = v12 | 0x200;
    }
    __int16 v13 = +[NSFileManager defaultManager];
    id v9 = [(NSFileManager *)v13 _attributesOfItemAtURL:url filterResourceFork:0 error:outError];
    if (v9)
    {
      long long v14 = v9;
      id contents = self->_contents;
      if (contents)
      {
        if (!-[NSFileWrapper _matchesItemKind:modificationDate:](self, "_matchesItemKind:modificationDate:", [v9 fileType], objc_msgSend(v9, "fileModificationDate"))|| -[NSFileWrapper isDirectory](self, "isDirectory"))
        {
LABEL_13:
          LODWORD(v9) = -[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:](self, "_readContentsFromURL:path:itemKind:options:error:", url, v10, [v14 fileType], options, outError);
          if (!v9) {
            return (char)v9;
          }
LABEL_19:
          [(NSFileWrapper *)self setFileAttributes:v14];
          self->_attributesMustBeWrittenSoNoHardLinking = 0;

          self->_cachedDirectoryChildrenAsDictionary = 0;
          LOBYTE(v9) = 1;
          return (char)v9;
        }
        LOBYTE(contents) = self->_contents != 0;
      }
      if (contents & 1) == 0 && (options) {
        goto LABEL_13;
      }
      if (options) {
        goto LABEL_19;
      }
      if (url)
      {
        if ([(NSFileManager *)v13 isReadableFileAtPath:v10])
        {

          self->_contentsURL = url;
          self->_contentsMustBeReadWithoutMapping = (options & 2) != 0;
          goto LABEL_19;
        }
        if (outError)
        {
          uint64_t v16 = 13;
          uint64_t v17 = url;
          goto LABEL_25;
        }
      }
      else if (outError)
      {
        uint64_t v16 = 2;
        uint64_t v17 = 0;
LABEL_25:
        uint64_t v18 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v16, (uint64_t)v17, 1, 0, 0);
        LOBYTE(v9) = 0;
        *outError = v18;
        return (char)v9;
      }
      LOBYTE(v9) = 0;
    }
  }
  return (char)v9;
}

- (BOOL)_forWritingToURL:(id)a3 returnContentsLazyReadingError:(id *)a4
{
  if (a4)
  {
    contentsLazyReadingError = self->_contentsLazyReadingError;
    if (contentsLazyReadingError) {
      uint64_t v7 = contentsLazyReadingError;
    }
    else {
      uint64_t v7 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(9, (uint64_t)a3, 0, 0, 0);
    }
    *a4 = v7;
  }

  self->_contentsLazyReadingError = 0;
  return 0;
}

- (BOOL)_writeContentsToURL:(id)a3 path:(id)a4 originalContentsURL:(id)a5 tryHardLinking:(BOOL)a6 didHardLinking:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v14 = objc_opt_class();
  long long v15 = v14;
  if (a5)
  {
    uint64_t v16 = (void *)[v14 _pathForURL:a5 reading:1 error:0];
    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v16 = 0;
  if (a7) {
LABEL_3:
  }
    *a7 = 0;
LABEL_4:
  uint64_t v17 = +[NSFileManager defaultManager];
  if (![(NSFileWrapper *)self isDirectory])
  {
    if ([(NSFileWrapper *)self isRegularFile])
    {
      BOOL v37 = 0;
      if (v16 && v10)
      {
        if (!self->_attributesMustBeWrittenSoNoHardLinking
          && (uint64_t v55 = 0,
              uint64_t v56 = 0,
              [v15 _forPath:v16 getItemKind:&v56 modificationDate:&v55])
          && [(NSFileWrapper *)self _matchesItemKind:v56 modificationDate:v55])
        {
          int v38 = link((const char *)[v16 fileSystemRepresentation], (const char *)objc_msgSend(a4, "fileSystemRepresentation"));
          if (a7 && !v38)
          {
            BOOL result = 1;
            *a7 = 1;
            return result;
          }
          BOOL v37 = v38 == 0;
          if (!v38) {
            return 1;
          }
        }
        else
        {
          BOOL v37 = 0;
        }
      }

      self->_contentsLazyReadingError = 0;
      id v42 = [(NSFileWrapper *)self regularFileContents];
      if (v42) {
        return [(NSData *)v42 writeToURL:a3 options:0 error:a8];
      }
      else {
        [(NSFileWrapper *)self _forWritingToURL:a3 returnContentsLazyReadingError:a8];
      }
      return v37;
    }
    if ([(NSFileWrapper *)self isSymbolicLink])
    {

      self->_contentsLazyReadingError = 0;
      long long v39 = [(NSFileWrapper *)self symbolicLinkDestinationURL];
      if (v39)
      {
        uint64_t v40 = [(NSURL *)v39 relativePath];
        return [(NSFileManager *)v17 createSymbolicLinkAtPath:a4 withDestinationPath:v40 error:a8];
      }
      [(NSFileWrapper *)self _forWritingToURL:a3 returnContentsLazyReadingError:a8];
    }
    else if (a8)
    {
      v41 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(5, (uint64_t)a3, 1, 0, 0);
      BOOL result = 0;
      *a8 = v41;
      return result;
    }
    return 0;
  }
  long long v52 = v17;
  if (![(NSFileManager *)v17 createDirectoryAtPath:a4 withIntermediateDirectories:0 attributes:0 error:a8])
  {
LABEL_53:
    [(NSFileManager *)v52 removeItemAtPath:a4 error:0];
    return 0;
  }

  self->_contentsLazyReadingError = 0;
  uint64_t v18 = [(NSFileWrapper *)self fileWrappers];
  if (!v18)
  {
    [(NSFileWrapper *)self _forWritingToURL:a3 returnContentsLazyReadingError:a8];
    goto LABEL_53;
  }
  long long v19 = v18;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v53 = [(NSDictionary *)v18 countByEnumeratingWithState:&v58 objects:v57 count:16];
  if (!v53) {
    return 1;
  }
  uint64_t v20 = *(void *)v59;
  uint64_t v51 = *(void *)v59;
  while (2)
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v59 != v20) {
        objc_enumerationMutation(v19);
      }
      uint64_t v22 = *(void *)(*((void *)&v58 + 1) + 8 * v21);
      uint64_t v23 = objc_alloc_init(NSAutoreleasePool);
      id v24 = [(NSDictionary *)v19 objectForKey:v22];
      uint64_t v25 = [v24 isDirectory];
      uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CB10]), "initFileURLWithPath:isDirectory:", objc_msgSend(a4, "stringByAppendingPathComponent:", v22), v25);
      if (v16 && (uint64_t v27 = [v24 filename]) != 0)
      {
        uint64_t v28 = v27;
        int v29 = a8;
        id v30 = objc_alloc(MEMORY[0x1E4F1CB10]);
        uint64_t v31 = [v16 stringByAppendingPathComponent:v28];
        long long v32 = v30;
        a8 = v29;
        uint64_t v20 = v51;
        long long v33 = (void *)[v32 initFileURLWithPath:v31 isDirectory:v25];
      }
      else
      {
        long long v33 = 0;
      }
      int v34 = [v24 writeToURL:v26 options:256 originalContentsURL:v33 error:a8];

      if (a8 && (v34 & 1) == 0)
      {
        if (*a8)
        {
          v43 = (void *)[*a8 domain];
          uint64_t v44 = [*a8 code];
          if ([v43 isEqualToString:@"NSCocoaErrorDomain"] && v44 == 640)
          {
            uint64_t v45 = a8;
            v46 = [NSError alloc];
            uint64_t v47 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a4, @"NSFilePath", *v45, @"NSUnderlyingError", 0);
            long long v48 = v46;
            a8 = v45;
            *uint64_t v45 = [(NSError *)v48 initWithDomain:v43 code:640 userInfo:v47];
          }
          else
          {
            id v49 = *a8;
          }
        }
        [(NSAutoreleasePool *)v23 drain];
        id v50 = *a8;
        goto LABEL_53;
      }
      [(NSAutoreleasePool *)v23 drain];
      if (!v34) {
        goto LABEL_53;
      }
      ++v21;
    }
    while (v53 != v21);
    uint64_t v35 = [(NSDictionary *)v19 countByEnumeratingWithState:&v58 objects:v57 count:16];
    BOOL result = 1;
    uint64_t v53 = v35;
    if (v35) {
      continue;
    }
    return result;
  }
}

- (id)_attributesToWrite
{
  v13[5] = *MEMORY[0x1E4F143B8];
  CFDictionaryKeyCallBacks v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(NSFileWrapper *)self fileAttributes];
  if ((objc_msgSend(-[NSDictionary fileType](v4, "fileType"), "isEqualToString:", @"NSFileTypeSymbolicLink") & 1) == 0)
  {
    uint64_t v5 = [(NSDictionary *)v4 objectForKey:@"NSFileCreationDate"];
    if (v5) {
      [v3 setObject:v5 forKey:@"NSFileCreationDate"];
    }
    uint64_t v6 = [(NSDictionary *)v4 objectForKey:@"NSFileModificationDate"];
    if (v6) {
      [v3 setObject:v6 forKey:@"NSFileModificationDate"];
    }
    uint64_t v7 = [(NSDictionary *)v4 objectForKey:@"NSFileExtensionHidden"];
    if (v7) {
      [v3 setObject:v7 forKey:@"NSFileExtensionHidden"];
    }
    id v8 = [(NSDictionary *)v4 objectForKey:@"NSFilePosixPermissions"];
    if (v8) {
      objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v8, "unsignedLongValue") & ~+[NSPageData _umask](NSPageData, "_umask")), @"NSFilePosixPermissions");
    }
    uint64_t v9 = [(NSDictionary *)v4 objectForKey:@"NSFileExtendedAttributes"];
    if (v9) {
      [v3 setObject:v9 forKey:@"NSFileExtendedAttributes"];
    }
  }
  if (objc_msgSend(-[NSDictionary fileType](v4, "fileType"), "isEqualToString:", @"NSFileTypeRegular"))
  {
    id v10 = [(NSDictionary *)v4 objectForKey:@"NSFileHFSCreatorCode"];
    if ([v10 unsignedIntValue]) {
      [v3 setObject:v10 forKey:@"NSFileHFSCreatorCode"];
    }
    id v11 = [(NSDictionary *)v4 objectForKey:@"NSFileHFSTypeCode"];
    if ([v11 unsignedIntValue]) {
      [v3 setObject:v11 forKey:@"NSFileHFSTypeCode"];
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__NSFileWrapper__attributesToWrite__block_invoke;
  v13[3] = &unk_1E51FAC88;
  v13[4] = v3;
  [(NSDictionary *)v4 enumerateKeysAndObjectsUsingBlock:v13];
  return v3;
}

uint64_t __35__NSFileWrapper__attributesToWrite__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 hasPrefix:@"NSFile"];
  if ((result & 1) == 0)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 setObject:a3 forKey:a2];
  }
  return result;
}

- (void)_updateDescendantFileNames
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSFileWrapper *)self isDirectory])
  {
    CFDictionaryKeyCallBacks v3 = [(NSFileWrapper *)self fileWrappers];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          id v9 = [(NSDictionary *)v3 objectForKey:v8];
          [v9 setFilename:v8];
          [v9 _updateDescendantFileNames];
        }
        uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)writeToURL:(NSURL *)url options:(NSFileWrapperWritingOptions)options originalContentsURL:(NSURL *)originalContentsURL error:(NSError *)outError
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v11 = (void *)[(id)objc_opt_class() _pathForURL:url reading:0 error:outError];
  if (!v11) {
    return (char)v11;
  }
  long long v12 = v11;
  long long v13 = objc_opt_class();
  if (options)
  {
    BOOL v15 = [(NSURL *)originalContentsURL isEqual:url];
    long long v11 = (void *)[v13 _temporaryDirectoryURLForWritingToURL:url error:outError];
    if (!v11) {
      return (char)v11;
    }
    uint64_t v16 = v11;
    uint64_t v17 = objc_msgSend(v11, "URLByAppendingPathComponent:", -[NSURL lastPathComponent](url, "lastPathComponent"));
    char v22 = 0;
    if (!-[NSFileWrapper _writeContentsToURL:path:originalContentsURL:tryHardLinking:didHardLinking:error:](self, "_writeContentsToURL:path:originalContentsURL:tryHardLinking:didHardLinking:error:", v17, [v17 path], originalContentsURL, (options >> 8) & 1, &v22, outError))
    {
LABEL_22:
      [v13 _removeTemporaryDirectoryAtURL:v16];
      LOBYTE(v11) = 0;
      return (char)v11;
    }
    if (v22) {
      id v18 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
    }
    else {
      id v18 = [(NSFileWrapper *)self _attributesToWrite];
    }
    if (v15)
    {
      if (([v13 _finishWritingToURL:url byTakingContentsFromItemAtURL:v17 addingAttributes:v18 usingTemporaryDirectoryAtURL:v16 backupFileName:0 error:outError] & 1) == 0)
      {
LABEL_19:
        if (![+[NSFileManager defaultManager] removeItemAtURL:v17 error:&v21])
        {
          long long v19 = _NSOSLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v24 = v17;
            __int16 v25 = 2112;
            uint64_t v26 = v21;
            _os_log_error_impl(&dword_181795000, v19, OS_LOG_TYPE_ERROR, "NSFileWrapper could not delete the temporary item at %@. Here's the error:\n%@", buf, 0x16u);
          }
        }
        goto LABEL_22;
      }
    }
    else if (([v13 _finishWritingToURL:url byMovingItemAtURL:v17 addingAttributes:v18 error:outError] & 1) == 0)
    {
      goto LABEL_19;
    }
    [v13 _removeTemporaryDirectoryAtURL:v16];
    if (!originalContentsURL) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  buf[0] = 0;
  LODWORD(v11) = [(NSFileWrapper *)self _writeContentsToURL:url path:v12 originalContentsURL:originalContentsURL tryHardLinking:(options >> 8) & 1 didHardLinking:buf error:outError];
  if (!v11) {
    return (char)v11;
  }
  if (buf[0]) {
    id v14 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
  }
  else {
    id v14 = [(NSFileWrapper *)self _attributesToWrite];
  }
  [v13 _writeAttributes:v14 toURL:url];
  if (!originalContentsURL) {
    goto LABEL_13;
  }
LABEL_12:
  self->_attributesMustBeWrittenSoNoHardLinking = 0;
LABEL_13:
  if ((options & 2) != 0) {
    [(NSFileWrapper *)self _updateDescendantFileNames];
  }
  LOBYTE(v11) = 1;
  return (char)v11;
}

- (id)_initWithImpl:(id)a3 preferredFileName:(id)a4 uniqueFileName:(id)a5 docInfo:(id)a6 iconData:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)NSFileWrapper;
  long long v11 = [(NSFileWrapper *)&v41 init];
  if (!v11) {
    return v11;
  }
  if (a6)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    long long v13 = +[NSNumber numberWithUnsignedShort:*((unsigned __int16 *)a6 + 8)];
    __int16 v14 = *((_WORD *)a6 + 9);
    if ((v14 & 4) != 0)
    {
      uint64_t v16 = &NSFileTypeSymbolicLink;
    }
    else
    {
      BOOL v15 = (v14 & 1) == 0;
      uint64_t v16 = &NSFileTypeDirectory;
      if (v15) {
        uint64_t v16 = &NSFileTypeRegular;
      }
    }
    v11->_fileAttributes = (NSDictionary *)objc_msgSend(v12, "initWithObjectsAndKeys:", v13, @"NSFilePosixPermissions", *v16, @"NSFileType", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)*((uint64_t *)a6 + 1)), @"NSFileModificationDate", 0);
    if (a4) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v22 = [a5 rangeOfString:@"__#$!@%!#__"];
    if (v23) {
      id v21 = (id)[a5 substringFromIndex:v22 + v23];
    }
    else {
      id v21 = a5;
    }
    goto LABEL_17;
  }
  char isKindOfClass = objc_opt_isKindOfClass();
  id v18 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (isKindOfClass)
  {
    long long v19 = @"NSFileTypeDirectory";
    uint64_t v20 = 511;
  }
  else
  {
    long long v19 = @"NSFileTypeRegular";
    uint64_t v20 = 438;
  }
  v11->_fileAttributes = (NSDictionary *)objc_msgSend(v18, "initWithObjectsAndKeys:", v19, @"NSFileType", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v20), @"NSFilePosixPermissions", 0);
  if (!a4) {
    goto LABEL_14;
  }
LABEL_11:
  id v21 = a4;
LABEL_17:
  v11->_preferredFileName = (NSString *)[v21 copy];
  v11->_fileName = (NSString *)[a5 copy];
  id v24 = [(NSDictionary *)v11->_fileAttributes fileType];
  if (![v24 isEqualToString:@"NSFileTypeDirectory"])
  {
    if ([v24 isEqualToString:@"NSFileTypeRegular"])
    {
      v11->_id contents = (id)[a3 data];
    }
    else if ([v24 isEqualToString:@"NSFileTypeSymbolicLink"])
    {
      int v38 = [[NSString alloc] initWithData:a3 encoding:4];
      v11->_id contents = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v38];
    }
    return v11;
  }
  __int16 v25 = objc_msgSend((id)objc_msgSend(a3, "allKeys"), "mutableCopy");
  if (![v25 count])
  {
LABEL_31:

    if (!v11->_contents) {
      [(NSFileWrapper *)v11 _initDirectoryContents];
    }
    return v11;
  }
  while (1)
  {
    uint64_t v26 = (void *)[v25 objectAtIndex:0];
    if ([v26 isEqualToString:0x1ECA60AE8]) {
      goto LABEL_30;
    }
    if ((_validateFilename(v26) & 1) == 0) {
      break;
    }
    if (objc_msgSend((id)objc_msgSend(v26, "pathExtension"), "isEqualToString:", @"tiff")
      && (uint64_t v27 = [v26 stringByDeletingPathExtension],
          uint64_t v28 = [v25 indexOfObject:v27],
          v28 != 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v35 = v28;
      uint64_t v36 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithImpl:preferredFileName:uniqueFileName:docInfo:iconData:", objc_msgSend(a3, "objectForKey:", v27), 0, v27, objc_msgSend(a3, "_getDocInfoForKey:", v27), objc_msgSend(a3, "objectForKey:", v26));
      if (!v36) {
        goto LABEL_39;
      }
      BOOL v37 = (void *)v36;
      [(NSFileWrapper *)v11 _addChild:v36 forUniqueFileName:v27];

      [v25 removeObjectAtIndex:v35];
    }
    else
    {
      uint64_t v29 = [v26 stringByAppendingPathExtension:@"tiff"];
      uint64_t v30 = [v25 indexOfObject:v29];
      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v31 = 0;
      }
      else
      {
        uint64_t v32 = v30;
        uint64_t v31 = [a3 objectForKey:v29];
        [v25 removeObjectAtIndex:v32];
      }
      uint64_t v33 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithImpl:preferredFileName:uniqueFileName:docInfo:iconData:", objc_msgSend(a3, "objectForKey:", v26), 0, v26, objc_msgSend(a3, "_getDocInfoForKey:", v26), v31);
      if (!v33) {
        goto LABEL_39;
      }
      int v34 = (void *)v33;
      [(NSFileWrapper *)v11 _addChild:v33 forUniqueFileName:v26];
    }
LABEL_30:
    [v25 removeObjectAtIndex:0];
    if (![v25 count]) {
      goto LABEL_31;
    }
  }
  long long v39 = _NSOSLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138477827;
    v43 = v26;
    _os_log_error_impl(&dword_181795000, v39, OS_LOG_TYPE_ERROR, "-[NSFileWrapper initWithSerializedRepresentation:] encountered an invalid preferredFileName: %{private}@", buf, 0xCu);
  }
LABEL_39:

  return 0;
}

- (id)_newImpl
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(NSFileWrapper *)self isDirectory])
  {
    CFDictionaryKeyCallBacks v3 = objc_alloc_init(NSRTFD);
    uint64_t v4 = [(NSFileWrapper *)self fileWrappers];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v10 = [(NSDictionary *)v4 objectForKey:v9];
          long long v11 = (void *)[v10 _newImpl];
          id v12 = _NSDocInfoFromFileAttributes((NSDocInfo *)[v10 fileAttributes], 1);
          [(NSRTFD *)v3 setObject:v11 forKey:v9];
          if (v12) {
            objc_msgSend(-[NSRTFD getDirInfo:](v3, "getDirInfo:", 1), "setObject:forKey:", v12, v9);
          }
        }
        uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v20 objects:v19 count:16];
      }
      while (v6);
    }
    return v3;
  }
  if ([(NSFileWrapper *)self isRegularFile])
  {
    CFDictionaryKeyCallBacks v3 = [(NSFileWrapper *)self regularFileContents];
    if (v3)
    {
      long long v13 = [NSPageData alloc];
      return [(NSPageData *)v13 initWithDataNoCopy:v3];
    }
    return v3;
  }
  if (![(NSFileWrapper *)self isSymbolicLink]) {
    return 0;
  }
  BOOL v15 = [(NSFileWrapper *)self symbolicLinkDestinationURL];
  if (!v15) {
    return 0;
  }
  uint64_t v16 = v15;
  uint64_t v17 = [NSPageData alloc];
  uint64_t v18 = objc_msgSend(-[NSURL relativePath](v16, "relativePath"), "dataUsingEncoding:allowLossyConversion:", 4, 1);

  return [(NSPageData *)v17 initWithData:v18];
}

- (NSData)serializedRepresentation
{
  CFDictionaryKeyCallBacks v3 = [(NSFileWrapper *)self _newImpl];
  BOOL v4 = [(NSFileWrapper *)self isDirectory];
  uint64_t v5 = v3;
  if (!v4)
  {
    uint64_t v6 = [(NSFileWrapper *)self zone];
    uint64_t v7 = _NSDocInfoFromFileAttributes((NSDocInfo *)self->_fileAttributes, 0);
    uint64_t v5 = [+[NSRTFD allocWithZone:v6] init];
    [(NSRTFD *)v5 setObject:v3 forKey:0x1ECA6E148];
    if (v7)
    {
      *(&v7->mode + 1) |= 2u;
      objc_msgSend(-[NSRTFD getDirInfo:](v5, "getDirInfo:", 1), "setObject:forKey:", v7, 0x1ECA6E148);
    }
  }
  if (self->_preferredFileName)
  {
    uint64_t v8 = [+[NSData allocWithZone:[(NSFileWrapper *)self zone]] initWithData:[(NSString *)self->_preferredFileName dataUsingEncoding:2 allowLossyConversion:1]];
    [(NSRTFD *)v5 setObject:v8 forKey:@"__@PreferredName@__"];

    uint64_t v9 = [+[NSData allocWithZone:[(NSFileWrapper *)self zone]] initWithData:[(NSString *)self->_preferredFileName dataUsingEncoding:4 allowLossyConversion:1]];
    [(NSRTFD *)v5 setObject:v9 forKey:@"__@UTF8PreferredName@__"];
  }
  id v10 = [(NSRTFD *)v5 dataRepresentation];
  if (self->_preferredFileName)
  {
    [(NSRTFD *)v5 removeObjectForKey:@"__@PreferredName@__"];
    [(NSRTFD *)v5 removeObjectForKey:@"__@UTF8PreferredName@__"];
  }
  if (!v4) {

  }
  return v10;
}

- (void)_resetFileModificationDate
{
  CFDictionaryKeyCallBacks v3 = [(NSFileWrapper *)self fileAttributes];
  if ([(NSDictionary *)v3 objectForKey:@"NSFileModificationDate"])
  {
    id v4 = (id)[(NSDictionary *)v3 mutableCopy];
    [v4 removeObjectForKey:@"NSFileModificationDate"];
    [(NSFileWrapper *)self setFileAttributes:v4];
  }
}

- (NSString)addFileWrapper:(NSFileWrapper *)child
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(NSFileWrapper *)child preferredFilename];
  if (![(NSFileWrapper *)self isDirectory])
  {
    long long v13 = +[NSString stringWithFormat:@"%@ *** this method is only for directory type NSFileWrappers.", _NSFullMethodName((objc_class *)self, a2)];
    __int16 v14 = (void *)MEMORY[0x1E4F1CA00];
    BOOL v15 = (void *)MEMORY[0x1E4F1C3B8];
LABEL_16:
    objc_exception_throw((id)[v14 exceptionWithName:*v15 reason:v13 userInfo:0]);
  }
  if (!v6 || [(NSString *)v6 isEqualToString:&stru_1ECA5C228])
  {
    long long v13 = +[NSString stringWithFormat:@"%@ *** a document must have a preferredFilename before it can be added as the subdocument of another document.", _NSFullMethodName((objc_class *)self, a2)];
    __int16 v14 = (void *)MEMORY[0x1E4F1CA00];
    BOOL v15 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_16;
  }
  if (!self->_contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      id v16 = 0;
      if (!-[NSFileWrapper _readContentsFromURL:path:itemKind:options:error:](self, "_readContentsFromURL:path:itemKind:options:error:", contentsURL, 0, @"NSFileTypeDirectory", 2 * self->_contentsMustBeReadWithoutMapping, &v16)&& (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSFileWrapperLogsLess") & 1) == 0&& (addFileWrapper__alreadyWarned & 1) == 0)
      {
        addFileWrapper__alreadyWarned = 1;
        id v10 = _NSOSLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          long long v11 = _NSFullMethodName((objc_class *)self, a2);
          uint64_t v12 = [v16 localizedDescription];
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v11;
          __int16 v19 = 2112;
          uint64_t v20 = v12;
          _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "%@ tried to read the file wrapper's contents lazily but an error occurred: %@", buf, 0x16u);
        }
      }
    }
  }
  uint64_t v7 = [(NSFileWrapper *)self keyForFileWrapper:child];
  if (!v7)
  {
    uint64_t v7 = [(NSFileWrapper *)self _addChild:child forUniqueFileName:0];
    [(NSFileWrapper *)self _resetFileModificationDate];
  }

  self->_cachedDirectoryChildrenAsDictionary = 0;
  return v7;
}

- (NSString)addRegularFileWithContents:(NSData *)data preferredFilename:(NSString *)fileName
{
  if (![(NSFileWrapper *)self isDirectory])
  {
    long long v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ *** this method is only for directory type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  uint64_t result = (NSString *)[objc_alloc((Class)objc_opt_class()) initRegularFileWithContents:data];
  if (result)
  {
    uint64_t v9 = result;
    [(NSString *)result setPreferredFilename:fileName];
    id v10 = [(NSFileWrapper *)self addFileWrapper:v9];

    return v10;
  }
  return result;
}

- (id)_uniqueFileNameOfChild:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id contents = self->_contents;
  uint64_t v6 = [contents countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(contents);
    }
    id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
    if ((id)[self->_contents objectForKey:v10] == a3) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [contents countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_removeChild:(id)a3 forUniqueFileName:(id)a4
{
  [a3 _removeParent:self];
  id contents = self->_contents;

  [contents removeObjectForKey:a4];
}

- (void)removeFileWrapper:(NSFileWrapper *)child
{
  if (![(NSFileWrapper *)self isDirectory])
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ *** this method is only for directory type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  id v6 = [(NSFileWrapper *)self _uniqueFileNameOfChild:child];
  if (v6)
  {
    [(NSFileWrapper *)self _removeChild:child forUniqueFileName:v6];
    [(NSFileWrapper *)self _resetFileModificationDate];
  }

  self->_cachedDirectoryChildrenAsDictionary = 0;
}

- (NSString)keyForFileWrapper:(NSFileWrapper *)child
{
  if (![(NSFileWrapper *)self isDirectory])
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ *** this method is only for directory type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
  }

  return (NSString *)[(NSFileWrapper *)self _uniqueFileNameOfChild:child];
}

- (NSURL)symbolicLinkDestinationURL
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(NSFileWrapper *)self isSymbolicLink])
  {
    id v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ *** this method is only for symbolic link type NSFileWrappers", _NSFullMethodName((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  id contents = self->_contents;
  if (!contents)
  {
    contentsURL = self->_contentsURL;
    if (contentsURL)
    {
      id v11 = 0;
      if (![(NSFileWrapper *)self _readContentsFromURL:contentsURL path:0 itemKind:@"NSFileTypeSymbolicLink" options:2 * self->_contentsMustBeReadWithoutMapping error:&v11])
      {

        self->_contentsLazyReadingError = (NSError *)v11;
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSFileWrapperLogsLess") & 1) == 0&& (symbolicLinkDestinationURL_alreadyWarned & 1) == 0)
        {
          symbolicLinkDestinationURL_alreadyWarned = 1;
          id v6 = _NSOSLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            uint64_t v8 = _NSFullMethodName((objc_class *)self, a2);
            uint64_t v9 = [v11 localizedDescription];
            *(_DWORD *)buf = 138412546;
            long long v13 = v8;
            __int16 v14 = 2112;
            uint64_t v15 = v9;
            _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "%@ tried to read the file wrapper's contents lazily but an error occurred: %@", buf, 0x16u);
          }
        }
      }
      id contents = self->_contents;
    }
    else
    {
      id contents = 0;
    }
  }
  return (NSURL *)contents;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = [(NSFileWrapper *)self serializedRepresentation];
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:v4 forKey:@"NSFileWrapperData"];
  }
  else
  {
    [a3 encodeObject:v4];
  }
}

- (NSFileWrapper)initWithCoder:(NSCoder *)inCoder
{
  if ([(NSCoder *)inCoder allowsKeyedCoding]) {
    id v5 = [(NSCoder *)inCoder decodeObjectOfClass:objc_opt_class() forKey:@"NSFileWrapperData"];
  }
  else {
    id v5 = [(NSCoder *)inCoder decodeObject];
  }
  if (v5)
  {
    return [(NSFileWrapper *)self initWithSerializedRepresentation:v5];
  }
  else
  {

    return 0;
  }
}

+ (id)_temporaryDirectoryURLForWritingToURL:(id)a3 error:(id *)a4
{
  id v6 = +[NSFileManager defaultManager];

  return [(NSFileManager *)v6 URLForDirectory:99 inDomain:1 appropriateForURL:a3 create:1 error:a4];
}

+ (void)_writeAttributes:(id)a3 toURL:(id)a4
{
  v10[6] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__NSFileWrapper_NSInternalForAppKit___writeAttributes_toURL___block_invoke;
  v10[3] = &unk_1E51FBAD0;
  v10[4] = v6;
  v10[5] = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v8 = (void *)[v6 objectForKey:@"NSFileExtensionHidden"];
  if ([v6 count] != (v8 != 0) || objc_msgSend(v8, "BOOLValue"))
  {
    uint64_t v9 = [a4 path];
    if (v9) {
      [+[NSFileManager defaultManager] setAttributes:v6 ofItemAtPath:v9 error:0];
    }
  }
  [a4 setResourceValues:v7 error:0];
}

uint64_t __61__NSFileWrapper_NSInternalForAppKit___writeAttributes_toURL___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = _NSIsNSString();
  if (result)
  {
    int v7 = [a2 hasPrefix:@"NSFile"];
    uint64_t v8 = 40;
    if (v7) {
      uint64_t v8 = 32;
    }
    uint64_t v9 = *(void **)(a1 + v8);
    return [v9 setObject:a3 forKey:a2];
  }
  return result;
}

+ (BOOL)_finishWritingToURL:(id)a3 byMovingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6
{
  id v11 = +[NSFileManager defaultManager];
  uint64_t v12 = [a3 path];
  if (![(NSFileManager *)v11 fileExistsAtPath:v12]
    || (BOOL v13 = [(NSFileManager *)v11 removeItemAtPath:v12 error:a6]))
  {
    [a1 _writeAttributes:a5 toURL:a4];
    uint64_t v14 = [a4 path];
    LOBYTE(v13) = [(NSFileManager *)v11 moveItemAtPath:v14 toPath:v12 error:a6];
  }
  return v13;
}

+ (BOOL)_finishWritingToURL:(id)a3 byTakingContentsFromItemAtURL:(id)a4 addingAttributes:(id)a5 usingTemporaryDirectoryAtURL:(id)a6 backupFileName:(id)a7 error:(id *)a8
{
  BOOL v11 = [+[NSFileManager defaultManager] replaceItemAtURL:a3 withItemAtURL:a4 backupItemName:a7 options:2 * (a7 != 0) resultingItemURL:0 error:a8];
  if (v11) {
    [a1 _writeAttributes:a5 toURL:a3];
  }
  return v11;
}

+ (void)_removeTemporaryDirectoryAtURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 path];
  if (v4)
  {
    id v5 = v4;
    if (!rmdir((const char *)[v4 fileSystemRepresentation])) {
      return;
    }
    int v6 = *__error();
    int v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "AppKit called rmdir(\"%@\"), it didn't return 0, and errno was set to %i.", (uint8_t *)&v8, 0x12u);
    }
  }
  [+[NSFileManager defaultManager] removeItemAtURL:a3 error:0];
}

- (id)_fullDescription:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableString stringWithCapacity:50];
  _NSDescribeFileContentsInstance(v5, (id *)&self->super.isa, 0, 0, v3);
  return v5;
}

@end