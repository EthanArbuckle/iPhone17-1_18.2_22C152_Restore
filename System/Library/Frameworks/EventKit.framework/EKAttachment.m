@interface EKAttachment
+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7;
+ (Class)frozenClass;
+ (id)_copyFileAtURLToTemporaryDirectory:(id)a3;
+ (id)createTempDestinationURLWithExtension:(id)a3;
+ (id)knownIdentityKeysForComparison;
+ (id)knownRelationshipWeakKeys;
+ (id)knownSingleValueKeysForComparison;
- (BOOL)_flagValueWithMask:(unsigned int)a3;
- (BOOL)autoArchived;
- (BOOL)copyLocalFileToNewSource;
- (BOOL)isBinary;
- (BOOL)save:(id *)a3;
- (BOOL)shouldSetQuarantineAttributesOnCopiedFile;
- (BOOL)validateWithOwner:(id)a3 error:(id *)a4;
- (EKAttachment)init;
- (EKAttachment)initWithFilepath:(id)a3;
- (EKAttachment)initWithUUID:(id)a3;
- (NSNumber)fileSize;
- (NSString)UUID;
- (NSString)contentType;
- (NSString)externalID;
- (NSString)externalModificationTag;
- (NSString)fileFormat;
- (NSString)fileName;
- (NSString)fileNameRaw;
- (NSString)localRelativePath;
- (NSURL)URL;
- (NSURL)URLForPendingFileCopy;
- (NSURL)localURL;
- (NSURL)localURLForArchivedData;
- (id)URLString;
- (id)XPropertiesData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)duplicateWithNewIdentity;
- (id)securityScopedLocalURLForArchivedDataWrapper;
- (id)securityScopedLocalURLWrapper;
- (id)securityScopedURLWrapperForPendingFileCopy;
- (int64_t)compareFileNames:(id)a3;
- (unsigned)flags;
- (void)_setFlagValue:(BOOL)a3 withMask:(unsigned int)a4;
- (void)assignIdentity:(id)a3;
- (void)assignNewIdentity;
- (void)invalidateLocalFilePropertiesForNewCopiedFile;
- (void)markCopiedFileAsDownloaded;
- (void)setAutoArchived:(BOOL)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setFileFormat:(id)a3;
- (void)setFileNameRaw:(id)a3;
- (void)setFileSize:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setIsBinary:(BOOL)a3;
- (void)setLocalRelativePath:(id)a3;
- (void)setSecurityScopedURLWrapperForPendingFileCopy:(id)a3;
- (void)setShouldSetQuarantineAttributesOnCopiedFile:(BOOL)a3;
- (void)setURL:(id)a3;
- (void)setURLForPendingFileCopy:(id)a3;
- (void)setURLString:(id)a3;
- (void)setUUID:(id)a3;
- (void)setXPropertiesData:(id)a3;
@end

@implementation EKAttachment

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_12 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_12, &__block_literal_global_73);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_12;

  return v2;
}

void __46__EKAttachment_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57150];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownIdentityKeysForComparison_keys_12;
  knownIdentityKeysForComparison_keys_12 = v0;
}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_11 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_11, &__block_literal_global_4_2);
  }
  v2 = (void *)knownSingleValueKeysForComparison_keys_11;

  return v2;
}

void __49__EKAttachment_knownSingleValueKeysForComparison__block_invoke()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56B38];
  v5[0] = *MEMORY[0x1E4F56AE8];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56B00];
  v5[2] = *MEMORY[0x1E4F56AF0];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56B18];
  v5[4] = *MEMORY[0x1E4F56B08];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  v4 = (void *)knownSingleValueKeysForComparison_keys_11;
  knownSingleValueKeysForComparison_keys_11 = v3;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_7 != -1) {
    dispatch_once(&knownRelationshipWeakKeys_onceToken_7, &__block_literal_global_6_0);
  }
  uint64_t v2 = (void *)knownRelationshipWeakKeys_keys_7;

  return v2;
}

void __41__EKAttachment_knownRelationshipWeakKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57160];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  uint64_t v1 = (void *)knownRelationshipWeakKeys_keys_7;
  knownRelationshipWeakKeys_keys_7 = v0;
}

- (EKAttachment)init
{
  uint64_t v3 = EKUUIDString();
  v4 = [(EKAttachment *)self initWithUUID:v3];

  return v4;
}

- (EKAttachment)initWithUUID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKAttachment;
  v5 = [(EKObject *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(EKAttachment *)v5 setUUID:v4];
    [(EKObject *)v6 updatePersistentValueForKeyIfNeeded:*MEMORY[0x1E4F57150]];
  }

  return v6;
}

- (EKAttachment)initWithFilepath:(id)a3
{
  id v4 = a3;
  v5 = [(EKAttachment *)self init];
  if (v5)
  {
    id v11 = 0;
    [v4 getResourceValue:&v11 forKey:*MEMORY[0x1E4F1C628] error:0];
    id v6 = v11;
    v7 = [v4 lastPathComponent];
    [(EKAttachment *)v5 setFileNameRaw:v7];
    uint64_t v8 = [v6 BOOLValue];

    [(EKAttachment *)v5 setAutoArchived:v8];
    v9 = (void *)[(id)objc_opt_class() _copyFileAtURLToTemporaryDirectory:v4];
    [(EKAttachment *)v5 setURLForPendingFileCopy:v9];
  }
  return v5;
}

- (id)duplicateWithNewIdentity
{
  uint64_t v3 = [(EKObject *)self duplicate];
  [(EKAttachment *)self assignNewIdentity];

  return v3;
}

- (void)assignNewIdentity
{
  EKUUIDString();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(EKAttachment *)self assignIdentity:v3];
}

- (void)assignIdentity:(id)a3
{
  [(EKAttachment *)self setUUID:a3];
  uint64_t v4 = *MEMORY[0x1E4F57150];

  [(EKObject *)self updatePersistentValueForKeyIfNeeded:v4];
}

- (BOOL)copyLocalFileToNewSource
{
  id v3 = [(EKAttachment *)self localURL];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 startAccessingSecurityScopedResource];
    id v5 = +[EKAttachment _copyFileAtURLToTemporaryDirectory:v4];
    [v4 stopAccessingSecurityScopedResource];
    BOOL v6 = v5 != 0;
    if (v5)
    {
      [(EKAttachment *)self invalidateLocalFilePropertiesForNewCopiedFile];
      [(EKAttachment *)self setURLForPendingFileCopy:v5];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)invalidateLocalFilePropertiesForNewCopiedFile
{
  [(EKAttachment *)self setLocalRelativePath:0];
  id v3 = [(EKObject *)self persistentObject];
  [v3 unloadPropertyForKey:*MEMORY[0x1E4F56B30]];
  [v3 unloadPropertyForKey:*MEMORY[0x1E4F56B28]];
  [v3 unloadPropertyForKey:*MEMORY[0x1E4F56B38]];
}

+ (id)createTempDestinationURLWithExtension:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CalTemporaryDirectory();
  id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v5 setPath:v4];
  [v5 setScheme:@"file"];
  BOOL v6 = [v5 URL];
  v7 = EKUUIDString();
  uint64_t v8 = [v6 URLByAppendingPathComponent:v7];

  v9 = [v8 URLByAppendingPathExtension:v3];

  return v9;
}

+ (id)_copyFileAtURLToTemporaryDirectory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 scheme];

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    BOOL v6 = [v3 path];
    uint64_t v7 = [v5 fileURLWithPath:v6];

    id v3 = (id)v7;
  }
  uint64_t v8 = [v3 pathExtension];
  v9 = +[EKAttachment createTempDestinationURLWithExtension:v8];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v17 = 0;
    char v11 = [v10 copyItemAtURL:v3 toURL:v9 error:&v17];
    id v12 = v17;
    if (v11)
    {
      id v13 = v9;
    }
    else
    {
      v15 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKAttachment _copyFileAtURLToTemporaryDirectory:](v15);
      }
      id v13 = 0;
    }
  }
  else
  {
    v14 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      +[EKAttachment _copyFileAtURLToTemporaryDirectory:](v14);
    }
    id v13 = 0;
  }

  return v13;
}

- (id)URLString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56AE8]];
}

- (void)setURLString:(id)a3
{
}

- (NSURL)URL
{
  uint64_t v2 = [(EKAttachment *)self URLString];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKAttachment *)self setURLString:v4];
}

- (NSString)externalModificationTag
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56AF8]];
}

- (void)setExternalModificationTag:(id)a3
{
}

- (NSString)fileNameRaw
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B08]];
}

- (NSString)fileName
{
  id v3 = [(EKAttachment *)self fileNameRaw];
  if (!v3)
  {
    id v4 = [(EKAttachment *)self URL];
    id v5 = v4;
    if (v4)
    {
      id v3 = [v4 lastPathComponent];
    }
    else
    {
      id v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (void)setFileNameRaw:(id)a3
{
}

- (NSString)fileFormat
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B00]];
}

- (void)setFileFormat:(id)a3
{
}

- (NSString)contentType
{
  id v3 = [(EKAttachment *)self localURL];
  uint64_t v4 = [v3 pathExtension];
  if (v4)
  {
    id v5 = (void *)v4;
    BOOL v6 = [(EKAttachment *)self localURL];
    uint64_t v7 = [v6 pathExtension];
    char v8 = [v7 isEqual:&stru_1EF932508];

    if ((v8 & 1) == 0)
    {
      v9 = [(EKAttachment *)self localURL];
LABEL_8:
      v16 = v9;
      id v17 = [v9 pathExtension];
      goto LABEL_11;
    }
  }
  else
  {
  }
  v10 = [(EKAttachment *)self URL];
  uint64_t v11 = [v10 pathExtension];
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = [(EKAttachment *)self URL];
    v14 = [v13 pathExtension];
    char v15 = [v14 isEqual:&stru_1EF932508];

    if ((v15 & 1) == 0)
    {
      v9 = [(EKAttachment *)self URL];
      goto LABEL_8;
    }
  }
  else
  {
  }
  v18 = [(EKAttachment *)self fileFormat];
  v19 = [v18 componentsSeparatedByString:@";"];
  v16 = [v19 firstObject];

  v20 = [v16 componentsSeparatedByString:@"/"];
  id v17 = [v20 lastObject];

LABEL_11:

  return (NSString *)v17;
}

- (unsigned)flags
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56D98]];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)setFlags:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56D98]];
}

- (BOOL)_flagValueWithMask:(unsigned int)a3
{
  return ([(EKAttachment *)self flags] & a3) != 0;
}

- (void)_setFlagValue:(BOOL)a3 withMask:(unsigned int)a4
{
  BOOL v5 = a3;
  unsigned int v7 = [(EKAttachment *)self flags];
  if (v5) {
    uint64_t v8 = v7 | a4;
  }
  else {
    uint64_t v8 = v7 & ~a4;
  }

  [(EKAttachment *)self setFlags:v8];
}

- (BOOL)isBinary
{
  return [(EKAttachment *)self _flagValueWithMask:1];
}

- (void)setIsBinary:(BOOL)a3
{
}

- (BOOL)autoArchived
{
  return [(EKAttachment *)self _flagValueWithMask:2];
}

- (void)setAutoArchived:(BOOL)a3
{
}

- (NSURL)localURL
{
  unsigned int v3 = [(EKAttachment *)self URLForPendingFileCopy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    BOOL v6 = [(EKAttachment *)self securityScopedLocalURLWrapper];
    id v5 = [v6 url];
  }

  return (NSURL *)v5;
}

- (id)securityScopedLocalURLWrapper
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B30]];
}

- (NSURL)localURLForArchivedData
{
  uint64_t v2 = [(EKAttachment *)self securityScopedLocalURLForArchivedDataWrapper];
  unsigned int v3 = [v2 url];

  return (NSURL *)v3;
}

- (id)securityScopedLocalURLForArchivedDataWrapper
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B28]];
}

- (NSString)localRelativePath
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B20]];
}

- (void)setLocalRelativePath:(id)a3
{
}

- (NSNumber)fileSize
{
  return (NSNumber *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B10]];
}

- (void)setFileSize:(id)a3
{
}

- (NSString)UUID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)XPropertiesData
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56AF0]];
}

- (void)setXPropertiesData:(id)a3
{
}

- (NSString)externalID
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57158]];
}

- (void)setExternalID:(id)a3
{
}

- (id)securityScopedURLWrapperForPendingFileCopy
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B38]];
}

- (void)setSecurityScopedURLWrapperForPendingFileCopy:(id)a3
{
}

- (NSURL)URLForPendingFileCopy
{
  uint64_t v2 = [(EKAttachment *)self securityScopedURLWrapperForPendingFileCopy];
  unsigned int v3 = [v2 url];

  return (NSURL *)v3;
}

- (void)setURLForPendingFileCopy:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F28FF8];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithURL:v5 readonly:1];
  }
  else
  {
    id v6 = 0;
  }
  [(EKAttachment *)self setSecurityScopedURLWrapperForPendingFileCopy:v6];
}

- (void)markCopiedFileAsDownloaded
{
}

- (BOOL)shouldSetQuarantineAttributesOnCopiedFile
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B40]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShouldSetQuarantineAttributesOnCopiedFile:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56B40]];
}

- (int64_t)compareFileNames:(id)a3
{
  id v4 = a3;
  id v5 = [(EKAttachment *)self fileName];
  id v6 = [v4 fileName];

  if (v6)
  {
    int64_t v7 = [v5 compare:v6];
  }
  else if (v5)
  {
    int64_t v7 = -1;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)EKAttachment;
  char v3 = [(EKAttachment *)&v14 description];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  id v6 = [(EKAttachment *)self URL];
  int64_t v7 = [(EKAttachment *)self localRelativePath];
  uint64_t v8 = [(EKAttachment *)self fileName];
  v9 = [(EKAttachment *)self fileFormat];
  v10 = [(EKAttachment *)self fileSize];
  uint64_t v11 = [(EKAttachment *)self UUID];
  objc_msgSend(v4, "stringWithFormat:", @"%@ <%p> {%@; URL:%@; localRelativePath:%@; filename:%@; fileFormat:%@; fileSize:%@; UUID: %@\n",
    v5,
    self,
    v3,
    v6,
    v7,
    v8,
    v9,
    v10,
  id v12 = v11);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E30901FFFFFFFFLL])
  {
    v14.receiver = self;
    v14.super_class = (Class)EKAttachment;
    return [(EKObject *)&v14 copyWithZone:a3];
  }
  else
  {
    uint64_t v5 = [+[EKAttachment allocWithZone:a3] init];
    if (v5)
    {
      id v6 = [(EKAttachment *)self URLString];
      [(EKAttachment *)v5 setURLString:v6];

      int64_t v7 = [(EKAttachment *)self fileNameRaw];
      [(EKAttachment *)v5 setFileNameRaw:v7];

      uint64_t v8 = [(EKAttachment *)self fileFormat];
      [(EKAttachment *)v5 setFileFormat:v8];

      [(EKAttachment *)v5 setIsBinary:[(EKAttachment *)self isBinary]];
      v9 = [(EKAttachment *)self localRelativePath];
      [(EKAttachment *)v5 setLocalRelativePath:v9];

      v10 = [(EKAttachment *)self fileSize];
      [(EKAttachment *)v5 setFileSize:v10];

      uint64_t v11 = [(EKAttachment *)self XPropertiesData];
      [(EKAttachment *)v5 setXPropertiesData:v11];

      id v12 = [(EKAttachment *)self externalID];
      [(EKAttachment *)v5 setExternalID:v12];
    }
  }
  return v5;
}

+ (BOOL)canonicalizedEqualityTestValue1:(id)a3 value2:(id)a4 key:(id)a5 object1:(id)a6 object2:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v14 isEqualToString:*MEMORY[0x1E4F56B38]])
  {
    id v17 = v12;
    id v18 = v13;
    v19 = [v17 url];
    if (v19 || ([v18 url], (uint64_t v31 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v20 = objc_msgSend(v17, "url", v31);
      [v18 url];
      v33 = v19;
      id v21 = v14;
      id v22 = v17;
      id v23 = v13;
      id v24 = v16;
      id v25 = v18;
      id v26 = v12;
      v28 = id v27 = v15;
      unsigned __int8 v29 = [v20 isEqual:v28];

      id v15 = v27;
      id v12 = v26;
      id v18 = v25;
      id v16 = v24;
      id v13 = v23;
      id v17 = v22;
      id v14 = v21;
      v19 = v33;

      if (v33)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v32 = 0;
      unsigned __int8 v29 = 1;
    }

    goto LABEL_9;
  }
  v34.receiver = a1;
  v34.super_class = (Class)&OBJC_METACLASS___EKAttachment;
  unsigned __int8 v29 = objc_msgSendSuper2(&v34, sel_canonicalizedEqualityTestValue1_value2_key_object1_object2_, v12, v13, v14, v15, v16);
LABEL_10:

  return v29;
}

- (BOOL)validateWithOwner:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)EKAttachment;
  BOOL v7 = -[EKObject validateWithOwner:error:](&v11, sel_validateWithOwner_error_);
  if (v7)
  {
    BOOL v8 = [(EKObject *)self isNew];
    LOBYTE(v7) = 1;
    if (!a3 && v8)
    {
      if (a4)
      {
        id v9 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:66];
        LOBYTE(v7) = 0;
        *a4 = v9;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
  }
  return v7;
}

- (BOOL)save:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  [(EKObject *)self insertPersistentObjectIfNeeded];
  [(EKObject *)self updatePersistentObject];
  return 1;
}

+ (void)_copyFileAtURLToTemporaryDirectory:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Unable to get a temporary location to copy the file to", v1, 2u);
}

+ (void)_copyFileAtURLToTemporaryDirectory:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Unable to copy item to temporary file", v1, 2u);
}

@end