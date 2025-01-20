@interface NSFileVersion
+ (BOOL)_isTemporaryStorageRequiredForGSError:(id)a3 andURL:(id)a4;
+ (BOOL)_permanentVersionStorageSupportedForURL:(id)a3 temporaryStorageIdentifier:(id *)a4 error:(id *)a5;
+ (BOOL)_removeOtherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4 error:(id *)a5;
+ (BOOL)removeOtherVersionsOfItemAtURL:(NSURL *)url error:(NSError *)outError;
+ (BOOL)unresolvedConflictsExistForItemAtURL:(id)a3;
+ (NSArray)otherVersionsOfItemAtURL:(NSURL *)url;
+ (NSArray)unresolvedConflictVersionsOfItemAtURL:(NSURL *)url;
+ (NSFileVersion)addVersionOfItemAtURL:(NSURL *)url withContentsOfURL:(NSURL *)contentsURL options:(NSFileVersionAddingOptions)options error:(NSError *)outError;
+ (NSFileVersion)currentVersionOfItemAtURL:(NSURL *)url;
+ (NSFileVersion)versionOfItemAtURL:(NSURL *)url forPersistentIdentifier:(id)persistentIdentifier;
+ (NSURL)temporaryDirectoryURLForNewVersionOfItemAtURL:(NSURL *)url;
+ (id)_addVersionOfItemAtURL:(id)a3 withContentsOfURL:(id)a4 options:(unint64_t)a5 temporaryStorageIdentifier:(id *)a6 error:(id *)a7;
+ (id)_addVersionOfItemAtURL:(id)a3 withContentsOfURL:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 temporaryStorageIdentifier:(id *)a7 error:(id *)a8;
+ (id)_autosaveDirectoryURLCreateIfNecessary:(BOOL)a3;
+ (id)_existingLibraryForURL:(id)a3 temporaryStorageIdentifier:(id)a4;
+ (id)_libraryForURL:(id)a3 temporaryStorageIdentifier:(id *)a4;
+ (id)_makePermanentStorageLibraryForURL:(id)a3 temporaryStorageRequired:(BOOL *)a4 error:(id *)a5;
+ (id)_makeTemporaryStorageIdentifier;
+ (id)_otherNonpurgeableVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4;
+ (id)_otherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4;
+ (id)_otherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4 withoutOptions:(unint64_t)a5;
+ (id)_supportedGenerationalStorageClientIDs;
+ (id)_temporaryDirectoryURLForNewVersionOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4;
+ (id)_temporaryStorageLocationForIdentifier:(id)a3;
+ (id)_versionOfItemAtURL:(id)a3 forClientID:(id)a4 name:(id)a5 temporaryStorageIdentifier:(id)a6 evenIfDeleted:(BOOL)a7;
+ (id)_versionOfItemAtURL:(id)a3 forPersistentIdentifier:(id)a4 temporaryStorageIdentifier:(id)a5;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (void)_addConflictObserverForItemAtURL:(id)a3 statusChangedHandler:(id)a4;
+ (void)_markConflicts:(id)a3 asHandledForItemAtURL:(id)a4;
+ (void)_removeTemporaryDirectoryAtURL:(id)a3;
+ (void)getNonlocalVersionsOfItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler;
+ (void)getNonlocalVersionsOfItemAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
+ (void)getNonlocalVersionsOfItemFromBRAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
+ (void)getNonlocalVersionsOfItemFromFPAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (BOOL)_isBackup;
- (BOOL)_preserveConflictVersionLocally;
- (BOOL)_setDocumentInfo:(id)a3;
- (BOOL)hasLocalContents;
- (BOOL)hasThumbnail;
- (BOOL)isConflict;
- (BOOL)isDiscardable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResolved;
- (BOOL)isUbiquitous;
- (BOOL)removeAndReturnError:(NSError *)outError;
- (NSDate)modificationDate;
- (NSFileVersion)init;
- (NSPersonNameComponents)originatorNameComponents;
- (NSString)etag;
- (NSString)localizedName;
- (NSString)localizedNameOfSavingComputer;
- (NSString)originalPOSIXName;
- (NSString)originatorName;
- (NSURL)URL;
- (NSURL)replaceItemAtURL:(NSURL *)url options:(NSFileVersionReplacingOptions)options error:(NSError *)error;
- (id)_documentInfo;
- (id)_initWithAddition:(id)a3;
- (id)_initWithFileURL:(id)a3 fileVersion:(id)a4;
- (id)_initWithFileURL:(id)a3 library:(id)a4 clientID:(id)a5 name:(id)a6 contentsURL:(id)a7 isBackup:(BOOL)a8 revision:(id)a9;
- (id)_initWithFileURL:(id)a3 nonLocalVersion:(id)a4;
- (id)description;
- (id)persistentIdentifier;
- (id)restoreOverItemAtURL:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (unint64_t)size;
- (void)_overrideModificationDateWithDate:(id)a3;
- (void)dealloc;
- (void)setDiscardable:(BOOL)discardable;
- (void)setResolved:(BOOL)resolved;
@end

@implementation NSFileVersion

+ (id)_otherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  return (id)[a1 _otherVersionsOfItemAtURL:a3 temporaryStorageIdentifier:a4 withoutOptions:0];
}

+ (NSArray)otherVersionsOfItemAtURL:(NSURL *)url
{
  return (NSArray *)[a1 _otherVersionsOfItemAtURL:url temporaryStorageIdentifier:0];
}

+ (id)_otherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4 withoutOptions:(unint64_t)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v23 = (void *)[a1 _existingLibraryForURL:a3 temporaryStorageIdentifier:a4];
  if (!v23) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v7 = [&unk_1ECAB8270 countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v36;
    *(void *)&long long v8 = 138412546;
    long long v21 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(&unk_1ECAB8270);
        }
        v12 = objc_msgSend(v23, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", *(void *)(*((void *)&v35 + 1) + 8 * v11), 0, a5, 0, v21);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v29 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = (void *)[objc_alloc((Class)a1) _initWithAddition:*(void *)(*((void *)&v30 + 1) + 8 * i)];
              [v6 addObject:v17];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v29 count:16];
          }
          while (v14);
        }
        if ([v12 error])
        {
          v18 = _NSOSLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = [v12 error];
            *(_DWORD *)buf = v21;
            id v26 = a3;
            __int16 v27 = 2112;
            uint64_t v28 = v19;
            _os_log_error_impl(&dword_181795000, v18, OS_LOG_TYPE_ERROR, "Enumeration of versions for %@ failed. Here's the error:\n%@", buf, 0x16u);
          }
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [&unk_1ECAB8270 countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v9);
  }
  return v6;
}

+ (id)_existingLibraryForURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  if (a4)
  {
    v5 = (void *)[a1 _temporaryStorageLocationForIdentifier:a4];
    if ([v5 checkResourceIsReachableAndReturnError:0])
    {
      id v6 = (void *)gsDefaultStorageManager();
      return (id)[v6 temporaryStorageForItemAtURL:a3 locatedAtURL:v5 error:0];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    long long v8 = (void *)gsDefaultStorageManager();
    return (id)[v8 permanentStorageForItemAtURL:a3 allocateIfNone:0 error:0];
  }
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"hasThumbnail"])
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    return (id)[v5 setWithObject:@"_nonLocalVersion.hasThumbnail"];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NSFileVersion;
    return objc_msgSendSuper2(&v7, sel_keyPathsForValuesAffectingValueForKey_, a3);
  }
}

- (NSFileVersion)init
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-[NSFileVersion init]: You have to use one of the factory methods to instantiate NSFileVersion." userInfo:0]);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileVersion;
  [(NSFileVersion *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(NSFileVersion *)self persistentIdentifier];
  uint64_t v6 = [a3 persistentIdentifier];

  return [v5 isEqual:v6];
}

- (unint64_t)hash
{
  id v2 = [(NSFileVersion *)self persistentIdentifier];

  return [v2 hash];
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_nonLocalVersion)
  {
    v8.receiver = self;
    v8.super_class = (Class)NSFileVersion;
    return +[NSString stringWithFormat:@"%@ type:NonLocal forURL:'%@', %@", [(NSFileVersion *)&v8 description], [(NSURL *)self->_fileURL path], self->_nonLocalVersion, v5, v6];
  }
  else
  {
    if (self->_isBackup)
    {
      uint64_t v4 = @"Backup";
    }
    else if (self->_deadVersionIdentifier)
    {
      uint64_t v4 = @"Dead";
    }
    else if ([(NSFileVersion *)self isConflict])
    {
      uint64_t v4 = @"Conflict";
    }
    else
    {
      uint64_t v4 = @"Local";
    }
    v7.receiver = self;
    v7.super_class = (Class)NSFileVersion;
    return +[NSString stringWithFormat:@"%@ type:%@ forURL:'%@' contentsURL:'%@' name:'%@'", [(NSFileVersion *)&v7 description], v4, [(NSURL *)self->_fileURL path], [(NSURL *)self->_contentsURL path], self->_localizedName];
  }
}

+ (NSFileVersion)currentVersionOfItemAtURL:(NSURL *)url
{
  if (![(NSURL *)url checkResourceIsReachableAndReturnError:0]) {
    return 0;
  }
  uint64_t v5 = (void *)[objc_alloc((Class)a1) _initWithFileURL:url library:0 clientID:0 name:0 contentsURL:url isBackup:0 revision:0];

  return (NSFileVersion *)v5;
}

+ (void)getNonlocalVersionsOfItemAtURL:(NSURL *)url completionHandler:(void *)completionHandler
{
}

+ (NSFileVersion)versionOfItemAtURL:(NSURL *)url forPersistentIdentifier:(id)persistentIdentifier
{
  return (NSFileVersion *)[a1 _versionOfItemAtURL:url forPersistentIdentifier:persistentIdentifier temporaryStorageIdentifier:0];
}

+ (NSFileVersion)addVersionOfItemAtURL:(NSURL *)url withContentsOfURL:(NSURL *)contentsURL options:(NSFileVersionAddingOptions)options error:(NSError *)outError
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NSFileVersion;
  objc_msgSendSuper2(&v7, sel_doesNotRecognizeSelector_, a2, contentsURL, options, outError);
  return 0;
}

+ (NSURL)temporaryDirectoryURLForNewVersionOfItemAtURL:(NSURL *)url
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSFileVersion;
  objc_msgSendSuper2(&v4, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

+ (NSArray)unresolvedConflictVersionsOfItemAtURL:(NSURL *)url
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = 0;
  uint64_t v5 = *MEMORY[0x1E4F1C768];
  [(NSURL *)url removeCachedResourceValueForKey:*MEMORY[0x1E4F1C768]];
  BOOL v6 = [(NSURL *)url getResourceValue:&v17 forKey:v5 error:0];
  objc_super v7 = 0;
  if (v6)
  {
    if ([v17 BOOLValue])
    {
      uint64_t v8 = (void *)[(id)gsDefaultStorageManager() permanentStorageForItemAtURL:url allocateIfNone:0 error:0];
      uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", @"com.apple.ubiquity", 0, 0, 0), "allObjects");
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v8, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", @"com.apple.FileProvider.conflict", 0, 0, 0), "allObjects");
      if (v9) {
        uint64_t v10 = (void *)[v9 arrayByAddingObjectsFromArray:v10];
      }
      if (v10)
      {
        objc_super v7 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v18 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = (void *)[objc_alloc((Class)a1) _initWithAddition:*(void *)(*((void *)&v19 + 1) + 8 * i)];
              [(NSArray *)v7 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v18 count:16];
          }
          while (v12);
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v7;
}

- (NSURL)URL
{
  BOOL v3 = [(NSURL *)self->_contentsURL isFileReferenceURL];
  contentsURL = self->_contentsURL;
  if (v3)
  {
    return [(NSURL *)contentsURL filePathURL];
  }
  else
  {
    BOOL v6 = contentsURL;
    return v6;
  }
}

- (NSString)originalPOSIXName
{
  if (self->_addition) {
    return (NSString *)[(GSAddition *)self->_addition originalPOSIXName];
  }
  if (self->_nonLocalVersion || self->_isBackup || self->_deadVersionIdentifier) {
    return 0;
  }
  return [(NSURL *)self->_contentsURL lastPathComponent];
}

- (NSString)localizedName
{
  v4[1] = *MEMORY[0x1E4F143B8];
  result = self->_localizedName;
  v4[0] = result;
  if (!result)
  {
    [(NSURL *)self->_contentsURL getResourceValue:v4 forKey:*MEMORY[0x1E4F1C6C8] error:0];
    return (NSString *)v4[0];
  }
  return result;
}

- (NSString)localizedNameOfSavingComputer
{
  id nonLocalVersion = self->_nonLocalVersion;
  if (nonLocalVersion)
  {
    return (NSString *)[nonLocalVersion lastEditorDeviceName];
  }
  else if ([(NSFileVersion *)self isConflict] {
         || [+[NSFileManager defaultManager] isUbiquitousItemAtURL:self->_contentsURL])
  }
  {
    if (qword_1EB1EDE50 != -1) {
      dispatch_once(&qword_1EB1EDE50, &__block_literal_global_263);
    }
    result = (NSString *)[(GSAddition *)self->_addition fp_lastEditorDeviceName];
    if (!result)
    {
      contentsURL = self->_contentsURL;
      return (NSString *)[(NSURL *)contentsURL fp_lastEditorDeviceName];
    }
  }
  else
  {
    return 0;
  }
  return result;
}

- (NSString)originatorName
{
  return (NSString *)[self->_nonLocalVersion lastEditorFormattedName];
}

- (NSPersonNameComponents)originatorNameComponents
{
  id nonLocalVersion = self->_nonLocalVersion;
  if (nonLocalVersion)
  {
    return (NSPersonNameComponents *)[nonLocalVersion lastEditorNameComponents];
  }
  else if ([(NSFileVersion *)self isConflict] {
         || [+[NSFileManager defaultManager] isUbiquitousItemAtURL:self->_contentsURL])
  }
  {
    if (qword_1EB1EDE50 != -1) {
      dispatch_once(&qword_1EB1EDE50, &__block_literal_global_263);
    }
    result = (NSPersonNameComponents *)[(GSAddition *)self->_addition fp_lastEditorNameComponents];
    if (!result)
    {
      contentsURL = self->_contentsURL;
      return (NSPersonNameComponents *)[(NSURL *)contentsURL fp_lastEditorNameComponents];
    }
  }
  else
  {
    return 0;
  }
  return result;
}

- (NSDate)modificationDate
{
  v4[1] = *MEMORY[0x1E4F143B8];
  result = self->_modificationDate;
  v4[0] = result;
  if (!result)
  {
    [(NSURL *)self->_contentsURL getResourceValue:v4 forKey:*MEMORY[0x1E4F1C530] error:0];
    return (NSDate *)v4[0];
  }
  return result;
}

- (unint64_t)size
{
  id nonLocalVersion = self->_nonLocalVersion;
  if (nonLocalVersion)
  {
    return [nonLocalVersion size];
  }
  else if (self->_addition && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = (void *)[(GSAddition *)self->_addition performSelector:sel_size];
    return [v5 unsignedLongLongValue];
  }
  else
  {
    return 0;
  }
}

- (id)persistentIdentifier
{
  if (self->_addition)
  {
    addition = self->_addition;
LABEL_3:
    return (id)[addition persistentIdentifier];
  }
  if (self->_deadVersionIdentifier) {
    return self->_deadVersionIdentifier;
  }
  if (self->_isBackup)
  {
    id v4 = [(NSURL *)self->_contentsURL path];
    return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v4, @"path", 0);
  }
  addition = self->_nonLocalVersion;
  if (addition) {
    goto LABEL_3;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];

  return (id)[v5 dictionary];
}

- (BOOL)isConflict
{
  if (objc_msgSend((id)-[GSAddition nameSpace](self->_addition, "nameSpace"), "isEqualToString:", @"com.apple.ubiquity") & 1) != 0|| (objc_msgSend((id)-[GSAddition nameSpace](self->_addition, "nameSpace"), "isEqualToString:", @"com.apple.FileProvider.conflict"))
  {
    return 1;
  }
  addition = self->_addition;

  return [(GSAddition *)addition isSavedConflict];
}

- (BOOL)isUbiquitous
{
  return self->_nonLocalVersion != 0;
}

- (BOOL)hasLocalContents
{
  return self->_nonLocalVersion == 0;
}

- (BOOL)hasThumbnail
{
  return [self->_nonLocalVersion hasThumbnail];
}

- (NSString)etag
{
  return (NSString *)[self->_nonLocalVersion etag];
}

- (void)setResolved:(BOOL)resolved
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!resolved) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"-[NSFileVersion setResolved:]: You can't make a conflict version unresolved once it's been resolved." userInfo:0]);
  }
  if ((objc_msgSend((id)-[GSAddition nameSpace](self->_addition, "nameSpace"), "isEqualToString:", @"com.apple.ubiquity") & 1) != 0|| objc_msgSend((id)-[GSAddition nameSpace](self->_addition, "nameSpace"), "isEqualToString:", @"com.apple.FileProvider.conflict"))
  {
    if (qword_1EB1EDE50 != -1) {
      dispatch_once(&qword_1EB1EDE50, &__block_literal_global_263);
    }
    uint64_t v5 = 0;
    if (([(GSAddition *)self->_addition fp_markResolvedWithError:&v5] & 1) == 0)
    {
      id v4 = _NSOSLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v7 = v5;
        _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "-[NSFileVersion setResolved:] tried but failed. The error is:\n%@", buf, 0xCu);
      }
    }
  }
}

- (BOOL)isResolved
{
  return [(GSAddition *)self->_addition isSavedConflict];
}

- (NSURL)replaceItemAtURL:(NSURL *)url options:(NSFileVersionReplacingOptions)options error:(NSError *)error
{
  uint64_t v7 = url;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  addition = self->_addition;
  if (addition)
  {
    uint64_t v10 = (NSURL *)[(GSAddition *)addition replaceItemAtURL:url error:error];
    if (v10)
    {
      if (replaceItemAtURL_options_error__onceToken != -1) {
        dispatch_once(&replaceItemAtURL_options_error__onceToken, &__block_literal_global_81);
      }
      Class v11 = objc_lookUpClass("QLThumbnailAddition");
      if (v11) {
        [(objc_class *)v11 associateThumbnailsForDocumentAtURL:[(NSFileVersion *)self URL] withDocumentAtURL:v10 error:&v21];
      }
      if ((options & 1) != 0 && ![(NSFileVersion *)self removeAndReturnError:0])
      {
        uint64_t v12 = _NSOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21) = 0;
          _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "-[NSFileVersion replaceItemAtURL:options:error:] failed to remove the version that it replaced a file with.", (uint8_t *)&v21, 2u);
        }
      }
      goto LABEL_19;
    }
    return v10;
  }
  if (!self->_nonLocalVersion)
  {
    if (self->_isBackup)
    {
      if ((options & 1) == 0)
      {
        uint64_t v14 = [[NSFileWrapper alloc] initWithURL:self->_contentsURL options:0 error:error];
        uint64_t v10 = (NSURL *)v14;
        if (!v14) {
          return v10;
        }
        BOOL v15 = [(NSFileWrapper *)v14 writeToURL:v7 options:1 originalContentsURL:0 error:error];

        uint64_t v10 = 0;
        if (!v15) {
          return v10;
        }
        goto LABEL_18;
      }
      v18 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v19 = *MEMORY[0x1E4F1C3A8];
      long long v20 = @"-[NSFileVersion replaceItemAtURL:options:error:]: NSFileVersionReplacingByMoving with this kind of version isn't supported.";
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v19 = *MEMORY[0x1E4F1C3A8];
      long long v20 = @"-[NSFileVersion replaceItemAtURL:options:error:]: You can't use it with current versions.";
    }
    objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v20 userInfo:0]);
  }
  uint64_t v13 = objc_msgSend((id)objc_opt_class(), "versionOfItemAtURL:forPersistentIdentifier:", self->_fileURL, objc_msgSend(self->_nonLocalVersion, "persistentIdentifier"));
  if (!v13)
  {
    id v17 = _NSOSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_181795000, v17, OS_LOG_TYPE_ERROR, "-[NSFileVersion replaceItemAtURL:optionsError:] for a non-local NSFileVersion failed. Did you forget a coordinated read?", (uint8_t *)&v21, 2u);
      if (error) {
        goto LABEL_23;
      }
    }
    else if (error)
    {
LABEL_23:
      uint64_t v10 = 0;
      *error = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:4 userInfo:0];
      return v10;
    }
    return 0;
  }
  uint64_t v7 = (NSURL *)[v13 replaceItemAtURL:v7 options:options error:error];
LABEL_18:
  uint64_t v10 = v7;
  if (v7) {
LABEL_19:
  }
    CFURLClearResourcePropertyCache((CFURLRef)v10);
  return v10;
}

void *__48__NSFileVersion_replaceItemAtURL_options_error___block_invoke()
{
  return dlopen("/System/Library/PrivateFrameworks/QuickLookThumbnailing.framework/QuickLookThumbnailing", 256);
}

- (BOOL)removeAndReturnError:(NSError *)outError
{
  v23[1] = *MEMORY[0x1E4F143B8];
  addition = self->_addition;
  if (!addition)
  {
    if (self->_isBackup)
    {
      Class v11 = _NSOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v12 = "-[NSFileVersion removeAndReturnError:]: You can't use it with a backup version.";
        goto LABEL_23;
      }
LABEL_20:
      if (!outError) {
        return 0;
      }
LABEL_21:
      BOOL v10 = 0;
      *outError = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:512 userInfo:0];
      return v10;
    }
    id nonLocalVersion = self->_nonLocalVersion;
    Class v11 = _NSOSLog();
    BOOL v14 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (nonLocalVersion)
    {
      if (!v14) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      uint64_t v12 = "-[NSFileVersion removeAndReturnError:]: You can't use it with a non-local version.";
    }
    else
    {
      if (!v14) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      uint64_t v12 = "-[NSFileVersion removeAndReturnError:]: You can't use it with a current version.";
    }
LABEL_23:
    _os_log_error_impl(&dword_181795000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    if (!outError) {
      return 0;
    }
    goto LABEL_21;
  }
  if ((objc_msgSend((id)-[GSAddition nameSpace](addition, "nameSpace"), "isEqualToString:", @"com.apple.ubiquity") & 1) != 0|| objc_msgSend((id)-[GSAddition nameSpace](self->_addition, "nameSpace"), "isEqualToString:", @"com.apple.FileProvider.conflict"))
  {
    if (qword_1EB1EDE50 != -1) {
      dispatch_once(&qword_1EB1EDE50, &__block_literal_global_263);
    }
    if (![(GSAddition *)self->_addition fp_markResolvedWithError:outError]) {
      return 0;
    }
  }
  *(void *)buf = 0;
  v18 = buf;
  uint64_t v19 = 0x3052000000;
  long long v20 = __Block_byref_object_copy__30;
  uint64_t v21 = __Block_byref_object_dispose__30;
  uint64_t v22 = 0;
  BOOL v6 = dispatch_semaphore_create(0);
  uint64_t v7 = (void *)[(GSAddition *)self->_addition storage];
  v23[0] = self->_addition;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __38__NSFileVersion_removeAndReturnError___block_invoke;
  v16[3] = &unk_1E51FE298;
  v16[4] = v6;
  v16[5] = buf;
  [v7 removeAdditions:v8 completionHandler:v16];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v6);
  uint64_t v9 = (void *)*((void *)v18 + 5);
  BOOL v10 = v9 == 0;
  if (v9)
  {
    if (outError) {
      *outError = (NSError *)v9;
    }
    else {
  }
    }
  else
  {
    +[NSFileCoordinator __itemAtURL:self->_fileURL didLoseVersionWithClientID:[(GSAddition *)self->_addition nameSpace] name:[(GSAddition *)self->_addition name] purposeID:0];
  }
  _Block_object_dispose(buf, 8);
  return v10;
}

intptr_t __38__NSFileVersion_removeAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (!a3) {
    a3 = objc_msgSend((id)objc_msgSend(a2, "objectEnumerator"), "nextObject");
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a3;
  id v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

+ (BOOL)removeOtherVersionsOfItemAtURL:(NSURL *)url error:(NSError *)outError
{
  return [a1 _removeOtherVersionsOfItemAtURL:url temporaryStorageIdentifier:0 error:outError];
}

- (BOOL)isDiscardable
{
  return self->_discardable;
}

- (void)setDiscardable:(BOOL)discardable
{
  self->_discardable = discardable;
}

- (id)_initWithFileURL:(id)a3 library:(id)a4 clientID:(id)a5 name:(id)a6 contentsURL:(id)a7 isBackup:(BOOL)a8 revision:(id)a9
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)NSFileVersion;
  BOOL v15 = [(NSFileVersion *)&v20 init];
  if (v15)
  {
    v15->_fileURL = (NSURL *)[a3 copy];
    v15->_contentsURL = (NSURL *)[a7 copy];
    v15->_isBackup = a8;
    v15->_name = (NSString *)[a6 copy];
    if (a4)
    {
      v16 = (void *)[(id)gsDefaultStorageManager() persistentIdentifierInStorage:a4 forAdditionNamed:a6 inNameSpace:a5];
      v15->_deadVersionIdentifier = v16;
      id v17 = v16;
    }
    if (v15->_isBackup)
    {
      id v19 = 0;
      if ([(NSURL *)v15->_contentsURL getResourceValue:&v19 forKey:*MEMORY[0x1E4F1C6C8] error:0])
      {
        v15->_localizedName = (NSString *)[v19 copy];
      }
      if (v15->_isBackup)
      {
        id v19 = 0;
        if ([(NSURL *)v15->_contentsURL getResourceValue:&v19 forKey:*MEMORY[0x1E4F1C530] error:0])
        {
          v15->_modificationDate = (NSDate *)[v19 copy];
        }
      }
    }
  }
  return v15;
}

- (id)_initWithAddition:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSFileVersion;
  id v4 = [(NSFileVersion *)&v10 init];
  if (v4)
  {
    uint64_t v5 = (GSAddition *)a3;
    v4->_addition = v5;
    v4->_fileURL = (NSURL *)objc_msgSend((id)objc_msgSend((id)-[GSAddition storage](v5, "storage"), "documentURL"), "copy");
    v4->_contentsURL = (NSURL *)(id)[(GSAddition *)v4->_addition url];
    v4->_isBackup = 0;
    BOOL v6 = (NSString *)(id)[(GSAddition *)v4->_addition displayName];
    v4->_localizedName = v6;
    if (!v6)
    {
      id v9 = 0;
      if ([(NSURL *)v4->_fileURL getResourceValue:&v9 forKey:*MEMORY[0x1E4F1C6C8] error:0])
      {
        v4->_localizedName = (NSString *)[v9 copy];
      }
    }
    uint64_t v7 = (NSDate *)(id)objc_msgSend(-[NSFileVersion _documentInfo](v4, "_documentInfo"), "objectForKey:", @"modificationDate");
    v4->_modificationDate = v7;
    if (!v7)
    {
      id v9 = 0;
      if ([(NSURL *)v4->_contentsURL getResourceValue:&v9 forKey:*MEMORY[0x1E4F1C530] error:0])
      {
        v4->_modificationDate = (NSDate *)[v9 copy];
      }
    }
  }
  return v4;
}

- (id)_initWithFileURL:(id)a3 nonLocalVersion:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSFileVersion;
  BOOL v6 = [(NSFileVersion *)&v8 init];
  if (v6)
  {
    v6->_id nonLocalVersion = a4;
    v6->_fileURL = (NSURL *)[a3 copy];
    v6->_contentsURL = (NSURL *)objc_msgSend((id)objc_msgSend(a4, "url"), "copy");
    v6->_localizedName = (NSString *)objc_msgSend((id)objc_msgSend(a4, "displayName"), "copy");
    v6->_modificationDate = (NSDate *)objc_msgSend((id)objc_msgSend(a4, "modificationDate"), "copy");
    v6->_isBackup = 0;
  }
  return v6;
}

- (id)_initWithFileURL:(id)a3 fileVersion:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSFileVersion;
  BOOL v6 = [(NSFileVersion *)&v8 init];
  if (v6)
  {
    v6->_id nonLocalVersion = a4;
    v6->_fileURL = (NSURL *)[a3 copy];
    v6->_contentsURL = (NSURL *)objc_msgSend((id)objc_msgSend(a4, "url"), "copy");
    v6->_localizedName = (NSString *)objc_msgSend((id)objc_msgSend(a4, "displayName"), "copy");
    v6->_modificationDate = (NSDate *)objc_msgSend((id)objc_msgSend(a4, "modificationDate"), "copy");
    v6->_isBackup = 0;
  }
  return v6;
}

+ (void)getNonlocalVersionsOfItemFromBRAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  char v6 = a4;
  v15[6] = *MEMORY[0x1E4F143B8];
  if (qword_1EB1EDE58 != -1) {
    dispatch_once(&qword_1EB1EDE58, &__block_literal_global_277);
  }
  objc_super v8 = objc_lookUpClass("BRListNonLocalVersionsOperation");
  if (v8)
  {
    uint64_t v9 = (void *)[[v8 alloc] initWithDocumentURL:a3];
    objc_super v10 = v9;
    if (v6) {
      [v9 setIncludeCachedVersions:1];
    }
    uint64_t v11 = objc_alloc_init(NSOperationQueue);
    [(NSOperationQueue *)v11 setName:@"NSFileVersion Non-Local Version Fetching Queue"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromBRAtURL_options_completionHandler___block_invoke;
    v15[3] = &unk_1E51FE2C0;
    v15[4] = a3;
    v15[5] = a5;
    [v10 setFetchingVersionsDoneBlock:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromBRAtURL_options_completionHandler___block_invoke_157;
    v14[3] = &unk_1E51F71D0;
    v14[4] = v11;
    [v10 setCompletionBlock:v14];
    [(NSOperationQueue *)v11 addOperation:v10];
  }
  else
  {
    uint64_t v12 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3328 userInfo:0];
    uint64_t v13 = (void (*)(id, void, NSError *))*((void *)a5 + 2);
    v13(a5, 0, v12);
  }
}

uint64_t __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromBRAtURL_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  if (a3)
  {
    uint64_t v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = a3;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "Fetch error occurred: %@", buf, 0xCu);
    }
    objc_super v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v9 = (void *)v6;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(a2);
          }
          id v14 = [[NSFileVersion alloc] _initWithFileURL:*(void *)(a1 + 32) nonLocalVersion:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (v14)
          {
            BOOL v15 = v14;
            [v9 addObject:v14];
          }
        }
        uint64_t v11 = [a2 countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v11);
    }
    objc_super v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v8();
}

void __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromBRAtURL_options_completionHandler___block_invoke_157(uint64_t a1)
{
}

+ (void)getNonlocalVersionsOfItemFromFPAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  char v6 = a4;
  v15[6] = *MEMORY[0x1E4F143B8];
  if (qword_1EB1EDE50 != -1) {
    dispatch_once(&qword_1EB1EDE50, &__block_literal_global_263);
  }
  if (qword_1EB1EDE48 && (objc_super v8 = objc_lookUpClass("FPListRemoteVersionsOperation")) != 0)
  {
    uint64_t v9 = (void *)[[v8 alloc] initWithDocumentURL:a3];
    uint64_t v10 = v9;
    if (v6) {
      [v9 setIncludeCachedVersions:1];
    }
    uint64_t v11 = objc_alloc_init(NSOperationQueue);
    [(NSOperationQueue *)v11 setName:@"NSFileVersion Non-Local Version Fetching Queue"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromFPAtURL_options_completionHandler___block_invoke;
    v15[3] = &unk_1E51FE2C0;
    v15[4] = a3;
    v15[5] = a5;
    [v10 setFinishedBlock:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromFPAtURL_options_completionHandler___block_invoke_159;
    v14[3] = &unk_1E51F71D0;
    v14[4] = v11;
    [v10 setCompletionBlock:v14];
    [(NSOperationQueue *)v11 addOperation:v10];
  }
  else
  {
    uint64_t v12 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3328 userInfo:0];
    uint64_t v13 = (void (*)(id, void, NSError *))*((void *)a5 + 2);
    v13(a5, 0, v12);
  }
}

uint64_t __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromFPAtURL_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  if (a3)
  {
    uint64_t v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = a3;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "Fetch error occurred: %@", buf, 0xCu);
    }
    objc_super v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v9 = (void *)v6;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(a2);
          }
          id v14 = [[NSFileVersion alloc] _initWithFileURL:*(void *)(a1 + 32) fileVersion:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (v14)
          {
            BOOL v15 = v14;
            [v9 addObject:v14];
          }
        }
        uint64_t v11 = [a2 countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v11);
    }
    objc_super v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v8();
}

void __91__NSFileVersion_NSPrivate__getNonlocalVersionsOfItemFromFPAtURL_options_completionHandler___block_invoke_159(uint64_t a1)
{
}

+ (void)getNonlocalVersionsOfItemAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
}

+ (id)_autosaveDirectoryURLCreateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  id v4 = [+[NSFileManager defaultManager] URLForDirectory:11 inDomain:1 appropriateForURL:0 create:a3 error:&v8];
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !v3;
  }
  if (!v5)
  {
    uint64_t v6 = _NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v8;
      _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "NSFileVersions's invocation of -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:] returned nil for NSAutosavedInformationDirectory. Here's the error:\n%@", buf, 0xCu);
    }
  }
  return v4;
}

+ (id)_temporaryStorageLocationForIdentifier:(id)a3
{
  id v4 = (void *)[(id)objc_opt_class() _autosaveDirectoryURLCreateIfNecessary:1];
  uint64_t v5 = [a3 stringByAppendingPathExtension:@"genstore.noindex"];

  return (id)[v4 URLByAppendingPathComponent:v5];
}

+ (id)_supportedGenerationalStorageClientIDs
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.documentVersions", @"com.apple.ubiquity", @"com.apple.FileProvider.conflict", 0);
}

+ (BOOL)_isTemporaryStorageRequiredForGSError:(id)a3 andURL:(id)a4
{
  if (!a3) {
    return 1;
  }
  uint64_t v6 = (void *)[a3 domain];
  if (![v6 isEqualToString:_MergedGlobals_150]
    || [a3 code] == 5
    || [a3 code] != 2)
  {
    return 1;
  }

  return [a4 checkResourceIsReachableAndReturnError:0];
}

+ (id)_makePermanentStorageLibraryForURL:(id)a3 temporaryStorageRequired:(BOOL *)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  uint64_t v9 = [(id)gsDefaultStorageManager() permanentStorageForItemAtURL:a3 allocateIfNone:1 error:v12];
  uint64_t v10 = (void *)v9;
  if (a4)
  {
    if (!v9)
    {
      *a4 = [a1 _isTemporaryStorageRequiredForGSError:v12[0] andURL:a3];
      if (a5) {
        *a5 = (id)v12[0];
      }
    }
  }
  return v10;
}

+ (id)_makeTemporaryStorageIdentifier
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  CFStringRef v3 = (id)CFUUIDCreateString(0, v2);
  CFRelease(v2);
  return (id)v3;
}

+ (BOOL)_permanentVersionStorageSupportedForURL:(id)a3 temporaryStorageIdentifier:(id *)a4 error:(id *)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = 0;
  char v9 = [(id)gsDefaultStorageManager() isPermanentStorageSupportedAtURL:a3 error:v11];
  if ((v9 & 1) == 0)
  {
    if (a4 && [a1 _isTemporaryStorageRequiredForGSError:v11[0] andURL:a3]) {
      *a4 = (id)[a1 _makeTemporaryStorageIdentifier];
    }
    if (a5) {
      *a5 = (id)v11[0];
    }
  }
  return v9;
}

+ (id)_libraryForURL:(id)a3 temporaryStorageIdentifier:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v13 = 0;
  uint64_t v12 = 0;
  if (a4 && [*a4 isEqualToString:@"com.apple.NSFileVersionTestTempID"])
  {
    BOOL v7 = 1;
    char v13 = 1;
  }
  else
  {
    id result = (id)objc_msgSend(a1, "_makePermanentStorageLibraryForURL:temporaryStorageRequired:error:", a3, &v13, 0, v12);
    if (result) {
      return result;
    }
    BOOL v7 = v13 != 0;
  }
  id result = 0;
  if (a4 && v7)
  {
    id v9 = *a4;
    if (!*a4) {
      id v9 = (id)[a1 _makeTemporaryStorageIdentifier];
    }
    id result = (id)objc_msgSend(a1, "_temporaryStorageLocationForIdentifier:", v9, v12);
    if (result)
    {
      id v10 = result;
      -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", [result path], 0, 0, 0);
      id result = (id)[(id)gsDefaultStorageManager() temporaryStorageForItemAtURL:a3 locatedAtURL:v10 error:&v12];
      if (result)
      {
        *a4 = v9;
      }
      else
      {
        uint64_t v11 = _NSOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v15 = v10;
          __int16 v16 = 2112;
          uint64_t v17 = v12;
          _os_log_error_impl(&dword_181795000, v11, OS_LOG_TYPE_ERROR, "NSDocument could not create temporary version storage at %@. Here's the error:\n%@", buf, 0x16u);
        }
        return 0;
      }
    }
  }
  return result;
}

+ (id)_otherNonpurgeableVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  return (id)[a1 _otherVersionsOfItemAtURL:a3 temporaryStorageIdentifier:a4 withoutOptions:8];
}

+ (id)_versionOfItemAtURL:(id)a3 forPersistentIdentifier:(id)a4 temporaryStorageIdentifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v9 = [(id)gsDefaultStorageManager() additionForItemAtURL:a3 forPersistentIdentifier:a4 error:&v21];
  if (v9)
  {
    id v10 = (void *)[objc_alloc((Class)a1) _initWithAddition:v9];
    return v10;
  }
  if (v21)
  {
    char v13 = _NSOSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = a4;
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      _os_log_error_impl(&dword_181795000, v13, OS_LOG_TYPE_ERROR, "Failed to get a GSAddition with persistent identifier: %@. Here's the error: %@", buf, 0x16u);
    }
    return 0;
  }
  uint64_t v15 = [a4 objectForKey:@"clientID"];
  uint64_t v16 = [a4 objectForKey:@"name"];
  uint64_t v17 = [a4 objectForKey:@"path"];
  if (v15)
  {
    if (v16)
    {
      uint64_t v18 = [a1 _existingLibraryForURL:a3 temporaryStorageIdentifier:a5];
      if (v18)
      {
        uint64_t v19 = [(id)gsDefaultStorageManager() persistentIdentifierInStorage:v18 forAdditionNamed:v16 inNameSpace:v15];
        if (v19) {
          return (id)[a1 _versionOfItemAtURL:a3 forPersistentIdentifier:v19 temporaryStorageIdentifier:v19];
        }
      }
    }
    return 0;
  }
  if (!v17)
  {
    id v12 = 0;
    if (![a3 checkResourceIsReachableAndReturnError:0]) {
      return v12;
    }
    id v10 = (void *)[objc_alloc((Class)a1) _initWithFileURL:a3 library:0 clientID:0 name:0 contentsURL:a3 isBackup:0 revision:0];
    return v10;
  }
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v17];
  id v12 = 0;
  if ([v20 checkResourceIsReachableAndReturnError:0]) {
    id v12 = (id)[objc_alloc((Class)a1) _initWithFileURL:a3 library:0 clientID:0 name:0 contentsURL:v20 isBackup:1 revision:0];
  }

  return v12;
}

+ (id)_addVersionOfItemAtURL:(id)a3 withContentsOfURL:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 temporaryStorageIdentifier:(id *)a7 error:(id *)a8
{
  char v10 = a5;
  v53[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = [a1 _libraryForURL:a3 temporaryStorageIdentifier:a7];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = (void *)[a4 path];
    uint64_t v17 = (void *)[v16 pathExtension];
    if ([v17 hasPrefix:@"sb-"]) {
      uint64_t v17 = objc_msgSend((id)objc_msgSend(v16, "stringByDeletingPathExtension"), "pathExtension");
    }
    uint64_t v18 = [+[NSUUID UUID] UUIDString];
    if ([v17 length]) {
      uint64_t v18 = [(NSString *)v18 stringByAppendingPathExtension:v17];
    }
    uint64_t v19 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [v19 setObject:@"com.apple.documentVersions" forKey:qword_1EB1EDE28];
    [v19 setObject:v18 forKey:qword_1EB1EDE30];
    if (a6)
    {
      v52 = @"NSDocumentInfo";
      v53[0] = a6;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
      [v19 setObject:v20 forKey:qword_1EB1EDE38];
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x3052000000;
    v49 = __Block_byref_object_copy__30;
    v50 = __Block_byref_object_dispose__30;
    uint64_t v51 = 0;
    uint64_t v35 = 0;
    long long v36 = &v35;
    uint64_t v37 = 0x3052000000;
    long long v38 = __Block_byref_object_copy__30;
    uint64_t v39 = __Block_byref_object_dispose__30;
    uint64_t v40 = 0;
    uint64_t v21 = [v15 prepareAdditionCreationWithItemAtURL:a4 byMoving:v10 & 1 creationInfo:v19 error:&v51];
    if (v21)
    {
      uint64_t v22 = dispatch_semaphore_create(0);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __119__NSFileVersion_NSPrivate___addVersionOfItemAtURL_withContentsOfURL_options_userInfo_temporaryStorageIdentifier_error___block_invoke;
      v34[3] = &unk_1E51FE2E8;
      v34[4] = a3;
      v34[5] = a1;
      v34[9] = &v35;
      v34[10] = &buf;
      v34[6] = v15;
      v34[7] = v21;
      v34[8] = v22;
      [v15 createAdditionStagedAtURL:v21 creationInfo:v19 completionHandler:v34];
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v22);
      id v23 = (void *)v36[5];
      if (v23)
      {
        id v24 = v23;
LABEL_24:
        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&buf, 8);
        return v24;
      }
      v29 = _NSOSLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v41 = 138412802;
        id v42 = a3;
        __int16 v43 = 2112;
        id v44 = a4;
        __int16 v45 = 2112;
        uint64_t v46 = v33;
        _os_log_error_impl(&dword_181795000, v29, OS_LOG_TYPE_ERROR, "NSFileVersion tried to tried to add a new generation and failed. Versioned file URL: %@, contents URL: %@, error: %@", v41, 0x20u);
      }
      long long v30 = *(void **)(*((void *)&buf + 1) + 40);
      if (a8)
      {
        id v28 = v30;
        goto LABEL_21;
      }

LABEL_23:
      id v24 = 0;
      goto LABEL_24;
    }
    __int16 v27 = _NSOSLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v41 = 138412802;
      id v42 = a3;
      __int16 v43 = 2112;
      id v44 = a4;
      __int16 v45 = 2112;
      uint64_t v46 = v32;
      _os_log_error_impl(&dword_181795000, v27, OS_LOG_TYPE_ERROR, "NSFileVersion tried to tried to add a new generation and failed. Versioned file URL: %@, contents URL: %@, error: %@", v41, 0x20u);
      if (!a8) {
        goto LABEL_23;
      }
    }
    else if (!a8)
    {
      goto LABEL_23;
    }
    id v28 = *(id *)(*((void *)&buf + 1) + 40);
LABEL_21:
    id v24 = 0;
    *a8 = v28;
    goto LABEL_24;
  }
  uint64_t v25 = _NSOSLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_error_impl(&dword_181795000, v25, OS_LOG_TYPE_ERROR, "NSFileVersion couldn't find the library for a file. URL: %@", (uint8_t *)&buf, 0xCu);
    if (a8) {
      goto LABEL_13;
    }
    return 0;
  }
  if (!a8) {
    return 0;
  }
LABEL_13:
  uint64_t v26 = _NSErrorWithFilePath(512, (uint64_t)a3);
  id v24 = 0;
  *a8 = v26;
  return v24;
}

intptr_t __119__NSFileVersion_NSPrivate___addVersionOfItemAtURL_withContentsOfURL_options_userInfo_temporaryStorageIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    +[NSFileCoordinator __itemAtURL:didGainVersionWithClientID:name:purposeID:](NSFileCoordinator, "__itemAtURL:didGainVersionWithClientID:name:purposeID:", *(void *)(a1 + 32), [a2 nameSpace], objc_msgSend(a2, "name"), 0);
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [objc_alloc(*(Class *)(a1 + 40)) _initWithAddition:a2];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = a3;
    [*(id *)(a1 + 48) cleanupStagingURL:*(void *)(a1 + 56)];
  }
  uint64_t v5 = *(NSObject **)(a1 + 64);

  return dispatch_semaphore_signal(v5);
}

+ (id)_addVersionOfItemAtURL:(id)a3 withContentsOfURL:(id)a4 options:(unint64_t)a5 temporaryStorageIdentifier:(id *)a6 error:(id *)a7
{
  return (id)[a1 _addVersionOfItemAtURL:a3 withContentsOfURL:a4 options:a5 userInfo:0 temporaryStorageIdentifier:a6 error:a7];
}

+ (id)_temporaryDirectoryURLForNewVersionOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a4) {
    a3 = (id)[a1 _temporaryStorageLocationForIdentifier:a4];
  }
  if (a3)
  {
    uint64_t v7 = 0;
    a3 = [+[NSFileManager defaultManager] URLForDirectory:99 inDomain:1 appropriateForURL:a3 create:1 error:&v7];
    if (!a3)
    {
      uint64_t v5 = _NSOSLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v9 = v7;
        _os_log_error_impl(&dword_181795000, v5, OS_LOG_TYPE_ERROR, "NSFileVersion invoked -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:] and that failed. Here's the error:\n%@", buf, 0xCu);
      }
    }
  }
  return a3;
}

+ (BOOL)_removeOtherVersionsOfItemAtURL:(id)a3 temporaryStorageIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 _existingLibraryForURL:a3 temporaryStorageIdentifier:a4];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v44 = 0;
    __int16 v45 = &v44;
    uint64_t v46 = 0x3052000000;
    v47 = __Block_byref_object_copy__30;
    uint64_t v48 = __Block_byref_object_dispose__30;
    uint64_t v49 = 0;
    if (qword_1EB1EDE50 != -1) {
      dispatch_once(&qword_1EB1EDE50, &__block_literal_global_263);
    }
    uint64_t v8 = (void *)[v7 enumeratorForAdditionsInNameSpace:@"com.apple.ubiquity" withOptions:0 withoutOptions:0 ordering:0];
    id v42 = v7;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v67 objects:v66 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v68 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          if ((objc_msgSend(v12, "fp_markResolvedWithError:", v45 + 5) & 1) == 0)
          {
            char v13 = _NSOSLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              uint64_t v14 = [v12 name];
              uint64_t v15 = v45[5];
              *(_DWORD *)long long buf = 138412802;
              id v61 = a3;
              __int16 v62 = 2112;
              uint64_t v63 = v14;
              __int16 v64 = 2112;
              uint64_t v65 = v15;
              _os_log_error_impl(&dword_181795000, v13, OS_LOG_TYPE_ERROR, "marking version %@ for %@ as resolved failed. The error is:\n%@", buf, 0x20u);
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v67 objects:v66 count:16];
      }
      while (v9);
    }
    if ([v8 error])
    {
      uint64_t v16 = _NSOSLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = [v8 error];
        *(_DWORD *)long long buf = 138412546;
        id v61 = a3;
        __int16 v62 = 2112;
        uint64_t v63 = v37;
        _os_log_error_impl(&dword_181795000, v16, OS_LOG_TYPE_ERROR, "Enumeration of versions for %@ failed. Here's the error:\n%@", buf, 0x16u);
      }
    }
    uint64_t v17 = (void *)[v42 enumeratorForAdditionsInNameSpace:@"com.apple.FileProvider.conflict" withOptions:0 withoutOptions:0 ordering:0];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v55 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          if ((objc_msgSend(v21, "fp_markResolvedWithError:", v45 + 5) & 1) == 0)
          {
            uint64_t v22 = _NSOSLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = [v21 name];
              uint64_t v24 = v45[5];
              *(_DWORD *)long long buf = 138412802;
              id v61 = a3;
              __int16 v62 = 2112;
              uint64_t v63 = v23;
              __int16 v64 = 2112;
              uint64_t v65 = v24;
              _os_log_error_impl(&dword_181795000, v22, OS_LOG_TYPE_ERROR, "marking version %@ for %@ as resolved failed. The error is:\n%@", buf, 0x20u);
            }
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v55 count:16];
      }
      while (v18);
    }
    if ([v17 error])
    {
      uint64_t v25 = _NSOSLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = [v17 error];
        *(_DWORD *)long long buf = 138412546;
        id v61 = a3;
        __int16 v62 = 2112;
        uint64_t v63 = v38;
        _os_log_error_impl(&dword_181795000, v25, OS_LOG_TYPE_ERROR, "Enumeration of versions for %@ failed. Here's the error:\n%@", buf, 0x16u);
      }
    }
    uint64_t v26 = (void *)[v42 enumeratorForAdditionsInNameSpace:@"com.apple.documentVersions" withOptions:0 withoutOptions:0 ordering:0];
    __int16 v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend(v26, "allObjects"));
    if ([v26 error])
    {
      id v28 = _NSOSLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = [v26 error];
        *(_DWORD *)long long buf = 138412546;
        id v61 = a3;
        __int16 v62 = 2112;
        uint64_t v63 = v39;
        _os_log_error_impl(&dword_181795000, v28, OS_LOG_TYPE_ERROR, "Enumeration of versions for %@ failed. Here's the error:\n%@", buf, 0x16u);
      }
    }
    objc_lookUpClass("GSTemporaryStorage");
    if (objc_opt_isKindOfClass())
    {
      if ([(id)gsDefaultStorageManager() removeTemporaryStorage:v42 error:v45 + 5])
      {
LABEL_35:
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v50 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v52;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v52 != v30) {
                objc_enumerationMutation(v27);
              }
              +[NSFileCoordinator __itemAtURL:didLoseVersionWithClientID:name:purposeID:](NSFileCoordinator, "__itemAtURL:didLoseVersionWithClientID:name:purposeID:", a3, [*(id *)(*((void *)&v51 + 1) + 8 * k) nameSpace], objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * k), "name"), 0);
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v50 count:16];
          }
          while (v29);
        }
        BOOL v32 = 1;
LABEL_49:
        _Block_object_dispose(&v44, 8);
        return v32;
      }
    }
    else
    {
      uint64_t v33 = dispatch_semaphore_create(0);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __93__NSFileVersion_NSPrivate___removeOtherVersionsOfItemAtURL_temporaryStorageIdentifier_error___block_invoke;
      v43[3] = &unk_1E51FE310;
      v43[4] = v33;
      v43[5] = &v44;
      [v42 removeAllAdditionsForNamespaces:&unk_1ECAB8288 completionHandler:v43];
      dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v33);
      id v34 = (id)v45[5];
      if (!v45[5]) {
        goto LABEL_35;
      }
    }
    uint64_t v35 = _NSOSLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = v45[5];
      *(_DWORD *)long long buf = 138412546;
      id v61 = a3;
      __int16 v62 = 2112;
      uint64_t v63 = v40;
      _os_log_error_impl(&dword_181795000, v35, OS_LOG_TYPE_ERROR, "NSFileVersion tried to tried to delete temporary version storage and failed. Versioned file URL: %@, error: %@", buf, 0x16u);
    }
    BOOL v32 = 0;
    if (a5) {
      *a5 = (id)v45[5];
    }
    goto LABEL_49;
  }
  return 1;
}

id __93__NSFileVersion_NSPrivate___removeOtherVersionsOfItemAtURL_temporaryStorageIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)_versionOfItemAtURL:(id)a3 forClientID:(id)a4 name:(id)a5 temporaryStorageIdentifier:(id)a6 evenIfDeleted:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = (void *)[a1 _existingLibraryForURL:a3 temporaryStorageIdentifier:a6];
  uint64_t v13 = [v12 additionWithName:a5 inNameSpace:a4 error:0];
  if (v13)
  {
    uint64_t v14 = (void *)[objc_alloc((Class)a1) _initWithAddition:v13];
  }
  else if (v7)
  {
    uint64_t v14 = (void *)[objc_alloc((Class)a1) _initWithFileURL:a3 library:v12 clientID:a4 name:a5 contentsURL:0 isBackup:0 revision:0];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (void)_removeTemporaryDirectoryAtURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 path];
  if (v4)
  {
    uint64_t v5 = v4;
    if (!rmdir((const char *)[v4 fileSystemRepresentation])) {
      return;
    }
    int v6 = *__error();
    BOOL v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "NSDocument called rmdir(\"%@\"), it didn't return 0, and errno was set to %{errno}d.", (uint8_t *)&v8, 0x12u);
    }
  }
  [+[NSFileManager defaultManager] removeItemAtURL:a3 error:0];
}

- (id)_documentInfo
{
  id result = (id)objc_msgSend((id)-[GSAddition userInfo](self->_addition, "userInfo"), "objectForKey:", @"NSDocumentInfo");
  if (!result) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  return result;
}

- (BOOL)_setDocumentInfo:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  addition = self->_addition;
  uint64_t v5 = @"NSDocumentInfo";
  v6[0] = a3;
  return -[GSAddition mergeUserInfo:error:](addition, "mergeUserInfo:error:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1], 0);
}

- (void)_overrideModificationDateWithDate:(id)a3
{
  if (self->_modificationDate != a3)
  {
    if (self->_addition)
    {
      id v5 = [(NSFileVersion *)self _documentInfo];
      if (v5)
      {
        id v6 = (id)[v5 mutableCopy];
        [v6 setObject:a3 forKey:@"modificationDate"];
        if ([(NSFileVersion *)self _setDocumentInfo:v6])
        {

          self->_modificationDate = (NSDate *)[a3 copy];
        }
      }
    }
  }
}

- (BOOL)_isBackup
{
  return self->_isBackup;
}

- (BOOL)_preserveConflictVersionLocally
{
  if (![(NSFileVersion *)self isConflict]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-[NSFileVersion _preserveConflictVersionLocally]: You can only use it with conflict versions." userInfo:0]);
  }
  [(NSFileVersion *)self setResolved:1];
  return 1;
}

- (id)restoreOverItemAtURL:(id)a3 error:(id *)a4
{
  return [(NSFileVersion *)self replaceItemAtURL:a3 options:0 error:a4];
}

+ (BOOL)unresolvedConflictsExistForItemAtURL:(id)a3
{
  v5[1] = *(id *)MEMORY[0x1E4F143B8];
  v5[0] = 0;
  int v3 = [a3 getResourceValue:v5 forKey:*MEMORY[0x1E4F1C768] error:0];
  if (v3) {
    LOBYTE(v3) = [v5[0] BOOLValue];
  }
  return v3;
}

+ (void)_markConflicts:(id)a3 asHandledForItemAtURL:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: URL parameter may not be nil", NSStringFromSelector(a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8++) setResolved:1];
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

+ (void)_addConflictObserverForItemAtURL:(id)a3 statusChangedHandler:(id)a4
{
  return 0;
}

@end