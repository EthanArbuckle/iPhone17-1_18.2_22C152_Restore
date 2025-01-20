@interface FPFileVersion
+ (BOOL)supportsSecureCoding;
+ (NSString)gsNamespace;
+ (id)etagForVersion:(id)a3 providerDomainID:(id)a4;
+ (id)parseEtag:(id)a3;
+ (id)parseInfoFromVersionURL:(id)a3 domainIdentifier:(id *)a4 fpItemIdentifier:(id *)a5 etag:(id *)a6;
+ (id)storagePrefixForOriginalURL:(id)a3;
+ (id)stripExtensionFromAddition:(id)a3;
+ (id)versionFaultName:(id)a3 identifier:(id)a4 ext:(id)a5;
- (BOOL)hasThumbnail;
- (FPFileVersion)initWithCoder:(id)a3;
- (FPFileVersion)initWithVersion:(id)a3 displayName:(id)a4 originalURL:(id)a5 physicalURL:(id)a6 identifier:(id)a7 modificationDate:(id)a8 lastEditorNameComponents:(id)a9 size:(id)a10;
- (FPItemID)fpItemIdentifier;
- (GSAdditionStoring)storage;
- (NSCopying)persistentIdentifier;
- (NSDate)modificationDate;
- (NSFileProviderItemVersion)version;
- (NSPersonNameComponents)lastEditorNameComponents;
- (NSString)displayName;
- (NSString)etag;
- (NSString)lastEditorDeviceName;
- (NSString)lastEditorFormattedName;
- (NSURL)originalURL;
- (NSURL)physicalURL;
- (NSURL)url;
- (id)description;
- (id)fetchGSURLForNamespace:(id)a3;
- (unint64_t)size;
- (void)checkThumbnailChanged;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)registerThumbnailNotification;
- (void)setHasThumbnail:(BOOL)a3;
- (void)setStorage:(id)a3;
@end

@implementation FPFileVersion

- (FPFileVersion)initWithVersion:(id)a3 displayName:(id)a4 originalURL:(id)a5 physicalURL:(id)a6 identifier:(id)a7 modificationDate:(id)a8 lastEditorNameComponents:(id)a9 size:(id)a10
{
  id v38 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v34 = a7;
  id v33 = a8;
  id v17 = a9;
  id v18 = a10;
  v40.receiver = self;
  v40.super_class = (Class)FPFileVersion;
  v19 = [(FPFileVersion *)&v40 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_version, a3);
    objc_storeStrong((id *)&v20->_displayName, a4);
    objc_storeStrong((id *)&v20->_originalURL, a5);
    objc_storeStrong((id *)&v20->_wrapper, a6);
    objc_storeStrong((id *)&v20->_fpItemIdentifier, a7);
    objc_storeStrong((id *)&v20->_modificationDate, a8);
    objc_storeStrong((id *)&v20->_lastEditorNameComponents, a9);
    v20->_size = [v18 unsignedIntValue];
    v21 = [MEMORY[0x1E4F63BE8] manager];
    originalURL = v20->_originalURL;
    id v39 = 0;
    uint64_t v23 = [v21 permanentStorageForItemAtURL:originalURL allocateIfNone:1 error:&v39];
    id v24 = v39;
    storage = v20->_storage;
    v20->_storage = (GSAdditionStoring *)v23;

    if (v20->_storage)
    {
      v26 = [(id)objc_opt_class() gsNamespace];
      uint64_t v27 = [(FPFileVersion *)v20 fetchGSURLForNamespace:v26];
      url = v20->_url;
      v20->_url = (NSURL *)v27;

      if (v20->_url)
      {
        v29 = [(FPFileVersion *)v20 physicalURL];

        if (v29)
        {
          [(FPFileVersion *)v20 physicalURL];
          _CFURLPromiseSetPhysicalURL();
        }
        [(FPFileVersion *)v20 registerThumbnailNotification];
        [(FPFileVersion *)v20 checkThumbnailChanged];

        goto LABEL_7;
      }
    }
    else
    {
      v31 = fp_current_or_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[FPFileVersion initWithVersion:displayName:originalURL:physicalURL:identifier:modificationDate:lastEditorNameComponents:size:]((uint64_t)&v20->_originalURL, v24);
      }
    }
    v30 = 0;
    goto LABEL_12;
  }
LABEL_7:
  v30 = v20;
LABEL_12:

  return v30;
}

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  int notifyToken = v2->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  objc_sync_exit(v2);

  v4.receiver = v2;
  v4.super_class = (Class)FPFileVersion;
  [(FPFileVersion *)&v4 dealloc];
}

- (void)checkThumbnailChanged
{
  v3 = [(FPSandboxingURLWrapper *)self->_wrapper url];
  int v4 = [v3 startAccessingSecurityScopedResource];

  v5 = [(FPSandboxingURLWrapper *)self->_wrapper url];
  uint64_t v6 = objc_msgSend(v5, "fp_hasThumbnailOnImmutableDocument");

  if (v4)
  {
    v7 = [(FPSandboxingURLWrapper *)self->_wrapper url];
    [v7 stopAccessingSecurityScopedResource];
  }
  v8 = self;
  objc_sync_enter(v8);
  if (v6)
  {
    int notifyToken = v8->_notifyToken;
    if (notifyToken != -1) {
      notify_cancel(notifyToken);
    }
  }
  objc_sync_exit(v8);

  [(FPFileVersion *)v8 setHasThumbnail:v6];
}

- (void)registerThumbnailNotification
{
  v3 = NSString;
  int v4 = [(NSURL *)self->_url path];
  v5 = [v3 stringWithFormat:@"com.apple.fileprovider.thumbnail-available.%@", v4];
  uint64_t v6 = objc_msgSend(v5, "fp_libnotifyPerUserNotificationName");

  if (registerThumbnailNotification_onceToken != -1) {
    dispatch_once(&registerThumbnailNotification_onceToken, &__block_literal_global_13);
  }
  id location = 0;
  objc_initWeak(&location, self);
  id v7 = v6;
  v8 = (const char *)[v7 UTF8String];
  v9 = registerThumbnailNotification_thumbnailQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __46__FPFileVersion_registerThumbnailNotification__block_invoke_2;
  handler[3] = &unk_1E5AF06A0;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(v8, &self->_notifyToken, v9, handler);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __46__FPFileVersion_registerThumbnailNotification__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.fileprovider.version.thumbnails", v2);
  v1 = (void *)registerThumbnailNotification_thumbnailQueue;
  registerThumbnailNotification_thumbnailQueue = (uint64_t)v0;
}

void __46__FPFileVersion_registerThumbnailNotification__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained checkThumbnailChanged];
}

- (NSString)lastEditorDeviceName
{
  return [(NSFileProviderItemVersion *)self->_version lastEditorDeviceName];
}

- (NSString)lastEditorFormattedName
{
  lastEditorNameComponents = self->_lastEditorNameComponents;
  if (lastEditorNameComponents)
  {
    v3 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:lastEditorNameComponents style:0 options:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (FPFileVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FPFileVersion;
  v5 = [(FPFileVersion *)&v32 init];
  if (!v5)
  {
LABEL_6:
    v28 = v5;
    goto LABEL_10;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  version = v5->_version;
  v5->_version = (NSFileProviderItemVersion *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filename"];
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  originalURL = v5->_originalURL;
  v5->_originalURL = (NSURL *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"physicalURL"];
  wrapper = v5->_wrapper;
  v5->_wrapper = (FPSandboxingURLWrapper *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpItemIdentifier"];
  fpItemIdentifier = v5->_fpItemIdentifier;
  v5->_fpItemIdentifier = (FPItemID *)v14;

  uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modificationDate"];
  modificationDate = v5->_modificationDate;
  v5->_modificationDate = (NSDate *)v16;

  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastEditorNameComponents"];
  lastEditorNameComponents = v5->_lastEditorNameComponents;
  v5->_lastEditorNameComponents = (NSPersonNameComponents *)v18;

  v5->_size = [v4 decodeInt64ForKey:@"size"];
  v20 = [MEMORY[0x1E4F63BE8] manager];
  v21 = v5->_originalURL;
  id v31 = 0;
  uint64_t v22 = [v20 permanentStorageForItemAtURL:v21 allocateIfNone:1 error:&v31];
  id v23 = v31;
  storage = v5->_storage;
  v5->_storage = (GSAdditionStoring *)v22;

  if (v5->_storage)
  {
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GSURL"];
    url = v5->_url;
    v5->_url = (NSURL *)v25;

    uint64_t v27 = [(FPFileVersion *)v5 physicalURL];

    if (v27)
    {
      [(FPFileVersion *)v5 physicalURL];
      _CFURLPromiseSetPhysicalURL();
      [(FPFileVersion *)v5 registerThumbnailNotification];
      [(FPFileVersion *)v5 checkThumbnailChanged];
    }

    goto LABEL_6;
  }
  v29 = fp_current_or_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[FPFileVersion initWithVersion:displayName:originalURL:physicalURL:identifier:modificationDate:lastEditorNameComponents:size:]((uint64_t)&v5->_originalURL, v23);
  }

  v28 = 0;
LABEL_10:

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  version = self->_version;
  id v5 = a3;
  [v5 encodeObject:version forKey:@"version"];
  [v5 encodeObject:self->_displayName forKey:@"filename"];
  [v5 encodeObject:self->_originalURL forKey:@"url"];
  [v5 encodeObject:self->_fpItemIdentifier forKey:@"fpItemIdentifier"];
  [v5 encodeObject:self->_modificationDate forKey:@"modificationDate"];
  [v5 encodeObject:self->_lastEditorNameComponents forKey:@"lastEditorNameComponents"];
  [v5 encodeInt64:self->_size forKey:@"size"];
  [v5 encodeObject:self->_wrapper forKey:@"physicalURL"];
  [v5 encodeObject:self->_url forKey:@"GSURL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)etagForVersion:(id)a3 providerDomainID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v6, "fp_toProviderID");
  if (([v7 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"] & 1) != 0
    || [v7 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"])
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2050000000;
    uint64_t v8 = (void *)getBRFieldContentSignatureClass_softClass;
    uint64_t v19 = getBRFieldContentSignatureClass_softClass;
    if (!getBRFieldContentSignatureClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getBRFieldContentSignatureClass_block_invoke;
      v15[3] = &unk_1E5AF1950;
      v15[4] = &v16;
      __getBRFieldContentSignatureClass_block_invoke((uint64_t)v15);
      uint64_t v8 = (void *)v17[3];
    }
    v9 = v8;
    _Block_object_dispose(&v16, 8);
    id v10 = [v9 alloc];
    id v11 = [v5 contentVersion];
    uint64_t v12 = (void *)[v10 initWithData:v11];

    v13 = [v12 etag];
  }
  else
  {
    v13 = [v5 etagHash];
  }

  return v13;
}

- (NSString)etag
{
  version = self->_version;
  v3 = [(FPItemID *)self->_fpItemIdentifier providerDomainID];
  id v4 = +[FPFileVersion etagForVersion:version providerDomainID:v3];

  return (NSString *)v4;
}

+ (id)versionFaultName:(id)a3 identifier:(id)a4 ext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v8 providerDomainID];
  id v11 = +[FPFileVersion etagForVersion:v9 providerDomainID:v10];

  uint64_t v12 = NSString;
  v13 = [v8 domainIdentifier];
  uint64_t v14 = [v8 identifier];

  v15 = [v12 stringWithFormat:@"%@_%@_%@.%@", v13, v14, v11, v7];

  return v15;
}

- (NSCopying)persistentIdentifier
{
  v3 = [MEMORY[0x1E4F63BE8] manager];
  id v4 = [(FPFileVersion *)self storage];
  id v5 = [(NSURL *)self->_url lastPathComponent];
  id v6 = [(id)objc_opt_class() gsNamespace];
  id v7 = [v3 persistentIdentifierInStorage:v4 forAdditionNamed:v5 inNameSpace:v6];

  return (NSCopying *)v7;
}

+ (id)storagePrefixForOriginalURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = open((const char *)[v3 fileSystemRepresentation], 0x200000);
  if ((v4 & 0x80000000) != 0)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[FPFileVersion storagePrefixForOriginalURL:](v3, v7);
    }
    id v6 = 0;
  }
  else
  {
    int v5 = v4;
    id v11 = 0;
    id v6 = [MEMORY[0x1E4F63BE0] storagePrefixForFileDescriptor:v4 error:&v11];
    id v7 = v11;
    close(v5);
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[FPFileVersion storagePrefixForOriginalURL:](v3, v7);
      }
    }
  }

  return v6;
}

- (id)fetchGSURLForNamespace:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(FPFileVersion *)self version];
  id v6 = [(FPFileVersion *)self fpItemIdentifier];
  id v7 = [(FPFileVersion *)self originalURL];
  id v8 = [v7 pathExtension];
  id v9 = +[FPFileVersion versionFaultName:v5 identifier:v6 ext:v8];

  id v10 = [(FPFileVersion *)self originalURL];
  id v11 = +[FPFileVersion storagePrefixForOriginalURL:v10];

  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
    v16[0] = v11;
    v16[1] = v4;
    v16[2] = v9;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    uint64_t v14 = [v12 fileURLWithPathComponents:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (NSURL)physicalURL
{
  return [(FPSandboxingURLWrapper *)self->_wrapper url];
}

- (id)description
{
  uint64_t v18 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v17 = objc_opt_class();
  displayName = self->_displayName;
  id v4 = [(NSFileProviderItemVersion *)self->_version lastEditorDeviceName];
  uint64_t v5 = [(FPFileVersion *)self lastEditorFormattedName];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"You";
  }
  unint64_t size = self->_size;
  modificationDate = self->_modificationDate;
  BOOL v10 = [(FPFileVersion *)self hasThumbnail];
  id v11 = [(FPFileVersion *)self etag];
  uint64_t v12 = [(NSURL *)self->_url path];
  v13 = [v18 stringWithFormat:@"<%@ name:'%@' device:'%@' owner:'%@' size:%llu mtime:%@ thumbnail:%d etag:%@ url:'%@'", v17, displayName, v4, v7, size, modificationDate, v10, v11, v12];

  uint64_t v14 = [(FPSandboxingURLWrapper *)self->_wrapper url];
  v15 = v14;
  if (v14 && self->_url != v14) {
    [v13 appendFormat:@" physical:'%@'", v14];
  }
  [v13 appendString:@">"];

  return v13;
}

+ (id)stripExtensionFromAddition:(id)a3
{
  id v3 = [a3 stringByDeletingPathExtension];
  if ([v3 hasSuffix:@"."])
  {
    uint64_t v4 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);

    id v3 = (void *)v4;
  }

  return v3;
}

+ (id)parseInfoFromVersionURL:(id)a3 domainIdentifier:(id *)a4 fpItemIdentifier:(id *)a5 etag:(id *)a6
{
  *a6 = 0;
  *a5 = 0;
  *a4 = 0;
  id v9 = [a3 pathComponents];
  uint64_t v10 = [v9 indexOfObject:@".DocumentRevisions-V100"];
  id v11 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = v10;
    uint64_t v13 = [v9 indexOfObject:@"PerUID"];
    uint64_t v14 = 3;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v14 = 4;
    }
    uint64_t v15 = v14 + v12;
    uint64_t v16 = v15 + 1;
    if ([v9 count] >= (unint64_t)(v15 + 1))
    {
      id v11 = [v9 objectAtIndexedSubscript:v15];
      if ([v9 count] >= (unint64_t)(v15 + 2)
        && ([(id)objc_opt_class() gsNamespace],
            uint64_t v17 = objc_claimAutoreleasedReturnValue(),
            char v18 = [v11 isEqualToString:v17],
            v17,
            (v18 & 1) != 0))
      {
        uint64_t v19 = [v9 objectAtIndexedSubscript:v16];
        v20 = +[FPFileVersion stripExtensionFromAddition:v19];

        uint64_t v21 = [v20 rangeOfString:@"_" options:4];
        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v22 = v21;
          uint64_t v23 = objc_msgSend(v20, "rangeOfString:options:range:", @"_", 4, 0, v21);
          if (v23 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v24 = v23;
            *a4 = [v20 substringToIndex:v23];
            uint64_t v25 = [v20 substringToIndex:v22];
            *a5 = [v25 substringFromIndex:v24 + 1];

            *a6 = [v20 substringFromIndex:v22 + 1];
          }
        }
        id v26 = v11;
      }
      else
      {
        id v27 = v11;
      }
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

+ (id)parseEtag:(id)a3
{
  id v3 = +[FPFileVersion stripExtensionFromAddition:a3];
  uint64_t v4 = [v3 componentsSeparatedByString:@"_"];

  if ((unint64_t)[v4 count] >= 3)
  {
    uint64_t v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v4, "count") - 1);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (NSString)gsNamespace
{
  return (NSString *)(id)*MEMORY[0x1E4F63BB8];
}

- (NSURL)url
{
  return self->_url;
}

- (NSFileProviderItemVersion)version
{
  return self->_version;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSPersonNameComponents)lastEditorNameComponents
{
  return self->_lastEditorNameComponents;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (FPItemID)fpItemIdentifier
{
  return self->_fpItemIdentifier;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (GSAdditionStoring)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_fpItemIdentifier, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_lastEditorNameComponents, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_wrapper, 0);
}

- (void)initWithVersion:(uint64_t)a1 displayName:(void *)a2 originalURL:physicalURL:identifier:modificationDate:lastEditorNameComponents:size:.cold.1(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] Failed to provide persistentIdentifier for URL %@. Error: %@", v5, v6, v7, v8, v9);
}

+ (void)storagePrefixForOriginalURL:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "fp_shortDescription");
  int v4 = *__error();
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed to open original file %@. error: (%{errno}d)", (uint8_t *)&v5, 0x12u);
}

+ (void)storagePrefixForOriginalURL:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a1, "fp_shortDescription");
  int v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v5, v6, "[ERROR] Failed to provide URL to the Genstore for this version. URL: %@ error: %@", v7, v8, v9, v10, v11);
}

@end