@interface WFFileRepresentation
+ (BOOL)coordinateFileOperation:(unint64_t)a3 shouldCoordinate:(BOOL)a4 fileURL:(id)a5 destinationURL:(id)a6 accessor:(id)a7;
+ (BOOL)fileIsInDisallowedDirectory:(id)a3;
+ (BOOL)isAllowedToRepresentFileURL:(id)a3;
+ (BOOL)sandboxAllowsRepresentingFileURL:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)disallowedDirectoryURLs;
+ (id)fileWithData:(id)a3 ofType:(id)a4 proposedFilename:(id)a5;
+ (id)fileWithData:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 originalURL:(id)a6;
+ (id)fileWithURL:(id)a3 options:(int64_t)a4;
+ (id)fileWithURL:(id)a3 options:(int64_t)a4 ofType:(id)a5;
+ (id)fileWithURL:(id)a3 options:(int64_t)a4 ofType:(id)a5 proposedFilename:(id)a6;
+ (id)fileWithURL:(id)a3 options:(int64_t)a4 ofType:(id)a5 proposedFilename:(id)a6 originalURL:(id)a7;
+ (id)proposedFilenameForFile:(id)a3 ofType:(id)a4;
+ (id)proposedFilenameForFile:(id)a3 ofType:(id)a4 unsanitizedName:(id *)a5;
+ (id)sanitizedFilename:(id)a3 withExtension:(id)a4;
+ (id)sanitizedFilename:(id)a3 withExtension:(id)a4 unsanitizedName:(id *)a5;
+ (id)typeOfData:(id)a3;
+ (id)typeOfFile:(id)a3;
+ (void)addDisallowedDirectory:(id)a3;
- (BOOL)atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:(id)a3 sourceURL:(id)a4 error:(id *)a5;
- (BOOL)deletesFileOnDeallocation;
- (BOOL)isEncodable;
- (BOOL)isTemporaryFile;
- (BOOL)securityScopedResource;
- (BOOL)writeToFileURL:(id)a3 copy:(BOOL)a4 overwrite:(BOOL)a5 error:(id *)a6;
- (BOOL)writeToFileURL:(id)a3 overwriting:(BOOL)a4 error:(id *)a5;
- (BOOL)writeToTemporaryFileURL:(id)a3 error:(id *)a4;
- (NSData)data;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)filename;
- (NSString)wfName;
- (NSURL)fileURL;
- (NSURL)originalURL;
- (WFFileRepresentation)initWithCoder:(id)a3;
- (WFFileRepresentation)initWithData:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 originalURL:(id)a6;
- (WFFileRepresentation)initWithFileURL:(id)a3 options:(int64_t)a4 ofType:(id)a5 proposedFilename:(id)a6 originalURL:(id)a7;
- (WFFileType)wfType;
- (WFItemProviderRequestMetadata)metadata;
- (id)copyWithName:(id)a3 addingExtensionIfNecessary:(BOOL)a4 zone:(_NSZone *)a5;
- (id)copyWithName:(id)a3 zone:(_NSZone *)a4;
- (id)description;
- (id)inputStream;
- (id)mappedData;
- (id)mappedDataWithError:(id *)a3;
- (id)typeForUserEnteredName:(id)a3 addingExtensionIfNecessary:(BOOL)a4;
- (id)updatedFilenameForUserEnteredName:(id)a3 addingExtensionIfNecessary:(BOOL)a4;
- (int64_t)fileSize;
- (int64_t)initialRepresentationType;
- (int64_t)representationType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFilename:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation WFFileRepresentation

+ (void)addDisallowedDirectory:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v4 = (void *)_disallowedDirectoryURLs;
    if (!_disallowedDirectoryURLs) {
      v4 = (void *)MEMORY[0x263EFFA68];
    }
    id v8 = v4;
    uint64_t v5 = [v8 arrayByAddingObject:a3];
    v6 = (void *)_disallowedDirectoryURLs;
    _disallowedDirectoryURLs = v5;
  }
  else
  {
    v7 = getWFFileRepresentationLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "+[WFFileRepresentation addDisallowedDirectory:]";
      _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_FAULT, "%s Adding disallowed directory failed because the URL is nil", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_wfName, 0);
  objc_storeStrong((id *)&self->_wfType, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

- (int64_t)initialRepresentationType
{
  return self->_initialRepresentationType;
}

- (void)setMetadata:(id)a3
{
}

- (WFItemProviderRequestMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)isTemporaryFile
{
  return self->_isTemporaryFile;
}

- (BOOL)securityScopedResource
{
  return self->_securityScopedResource;
}

- (BOOL)deletesFileOnDeallocation
{
  return self->_deletesFileOnDeallocation;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (WFFileType)wfType
{
  return self->_wfType;
}

- (void)setFilename:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (BOOL)isEncodable
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 encodeBool:self->_isTemporaryFile forKey:@"isTemporaryFile"];
  wfName = self->_wfName;
  if (wfName) {
    [v4 encodeObject:wfName forKey:@"wfName"];
  }
  wfType = self->_wfType;
  if (wfType) {
    [v4 encodeObject:wfType forKey:@"wfType"];
  }
  originalURL = self->_originalURL;
  if (originalURL) {
    [v4 encodeObject:originalURL forKey:@"originalURL"];
  }
  creationDate = self->_creationDate;
  if (creationDate) {
    [v4 encodeObject:creationDate forKey:@"creationDate"];
  }
  modificationDate = self->_modificationDate;
  if (modificationDate) {
    [v4 encodeObject:modificationDate forKey:@"modificationDate"];
  }
  v10 = [v4 wfFileCoder];
  uint64_t v11 = v10;
  if (v10)
  {
    v12 = [v10 sharedDirectory];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    BOOL v14 = [(NSURL *)self->_fileURL wf_isContainedByDirectoryAtURL:v12];
    if (v12 || (isKindOfClass)
      && ([v11 deletionResponsibility] == 1
       && [(WFFileRepresentation *)self deletesFileOnDeallocation]
       || ((self->_fileURL != 0) & (isKindOfClass | v14)) == 0))
    {
      uint64_t v18 = [(WFFileRepresentation *)self filename];
      v19 = [v11 sharedTemporaryDirectory];
      v20 = +[WFTemporaryFileManager proposedFileURLForFilename:v18 inDirectory:v19];

      id v28 = 0;
      LOBYTE(v18) = [(WFFileRepresentation *)self writeToFileURL:v20 copy:1 overwrite:0 error:&v28];
      id v21 = v28;
      if ((v18 & 1) == 0)
      {
        v22 = getWFFileRepresentationLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[WFFileRepresentation encodeWithCoder:]";
          __int16 v31 = 2112;
          id v32 = v21;
          _os_log_impl(&dword_216505000, v22, OS_LOG_TYPE_FAULT, "%s Couldn't write data to file when encoding WFFileRepresentation: %@", buf, 0x16u);
        }
      }
      v23 = (void *)MEMORY[0x263F08850];
      id v24 = v20;
      v25 = [v23 defaultManager];
      objc_msgSend(v25, "wf_removeExtendedAttributeName:ofItemAtURL:", @"INFileURLAssociatedAuditToken", v24);

      v26 = [MEMORY[0x263F08850] defaultManager];
      objc_msgSend(v26, "wf_removeExtendedAttributeName:ofItemAtURL:", @"INFileURLHasAssociatedAuditToken", v24);

      [v11 archiveFileAtURL:v24 fileShouldBeDeletedOnDeallocation:1 withCoder:v4];
    }
    else
    {
      v15 = [(WFFileRepresentation *)self fileURL];
      [v11 archiveFileAtURL:v15 fileShouldBeDeletedOnDeallocation:0 withCoder:v4];
    }
    filename = self->_filename;
    if (filename) {
      [v4 encodeObject:filename forKey:@"filename"];
    }
  }
  else
  {
    v16 = [(WFFileRepresentation *)self data];
    [v4 encodeObject:v16 forKey:@"data"];

    v17 = [(WFFileRepresentation *)self filename];
    [v4 encodeObject:v17 forKey:@"filename"];
  }
}

- (WFFileRepresentation)initWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wfType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filename"];
  __int16 v29 = 0;
  v7 = [v4 wfFileCoder];
  id v8 = [v7 decodeFileWithCoder:v4 fileShouldBeDeletedOnDeallocation:(char *)&v29 + 1 fileIsSecurityScoped:&v29];

  if ((_BYTE)v29)
  {
    uint64_t v9 = HIBYTE(v29) | 8;
  }
  else
  {
    if (!objc_msgSend(v8, "wf_fileIsReadable"))
    {
      uint64_t v11 = [(WFFileRepresentation *)self init];
      if (!v11) {
        goto LABEL_18;
      }
      if (v8)
      {
        id v28 = getWFFileRepresentationLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v31 = "-[WFFileRepresentation initWithCoder:]";
          __int16 v32 = 2112;
          uint64_t v33 = v8;
          _os_log_impl(&dword_216505000, v28, OS_LOG_TYPE_FAULT, "%s Unable to read file at fileURL while decoding file representation: %@", buf, 0x16u);
        }
      }
      goto LABEL_10;
    }
    uint64_t v10 = 5;
    if (HIBYTE(v29)) {
      uint64_t v10 = 1;
    }
    if ((_BYTE)v29) {
      uint64_t v9 = HIBYTE(v29) | 8;
    }
    else {
      uint64_t v9 = v10;
    }
  }
  uint64_t v11 = [(WFFileRepresentation *)self initWithFileURL:v8 options:v9 ofType:v5 proposedFilename:v6 originalURL:v8];
  if (!v11)
  {
    getWFFileRepresentationLogObject();
    uint64_t v11 = (WFFileRepresentation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v31 = "-[WFFileRepresentation initWithCoder:]";
      __int16 v32 = 2114;
      uint64_t v33 = v8;
      _os_log_impl(&dword_216505000, &v11->super.super, OS_LOG_TYPE_ERROR, "%s Unable to decode file representation for fileURL: %{public}@", buf, 0x16u);
    }
    goto LABEL_17;
  }
LABEL_10:
  uint64_t v12 = [v6 copy];
  filename = v11->_filename;
  v11->_filename = (NSString *)v12;

  objc_storeStrong((id *)&v11->_wfType, v5);
  BOOL v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wfName"];
  uint64_t v15 = [v14 copy];
  wfName = v11->_wfName;
  v11->_wfName = (NSString *)v15;

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  uint64_t v18 = [v17 copy];
  data = v11->_data;
  v11->_data = (NSData *)v18;

  uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalURL"];
  originalURL = v11->_originalURL;
  v11->_originalURL = (NSURL *)v20;

  uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  creationDate = v11->_creationDate;
  v11->_creationDate = (NSDate *)v22;

  uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modificationDate"];
  modificationDate = v11->_modificationDate;
  v11->_modificationDate = (NSDate *)v24;

  v11->_isTemporaryFile = [v4 decodeBoolForKey:@"isTemporaryFile"];
  if (!v11->_data && !v11->_fileURL)
  {
    v26 = getWFFileRepresentationLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v31 = "-[WFFileRepresentation initWithCoder:]";
      _os_log_impl(&dword_216505000, v26, OS_LOG_TYPE_FAULT, "%s Failing to decode file representation because both _data and _fileURL are nil", buf, 0xCu);
    }

LABEL_17:
    uint64_t v11 = 0;
  }
LABEL_18:

  return v11;
}

- (id)copyWithName:(id)a3 addingExtensionIfNecessary:(BOOL)a4 zone:(_NSZone *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [(WFFileRepresentation *)self typeForUserEnteredName:v8 addingExtensionIfNecessary:v6];
  int64_t v10 = [(WFFileRepresentation *)self representationType];
  uint64_t v11 = (void *)[(id)objc_opt_class() allocWithZone:a5];
  if (v10 == 1)
  {
    uint64_t v12 = [(WFFileRepresentation *)self fileURL];
    if (v8)
    {
      uint64_t v13 = [v11 initWithFileURL:v12 options:5 ofType:v9 proposedFilename:v8 originalURL:self->_originalURL];
LABEL_6:
      BOOL v14 = (id *)v13;
      goto LABEL_10;
    }
    uint64_t v15 = [(WFFileRepresentation *)self wfName];
    uint64_t v16 = [v11 initWithFileURL:v12 options:5 ofType:v9 proposedFilename:v15 originalURL:self->_originalURL];
  }
  else
  {
    uint64_t v12 = [(WFFileRepresentation *)self data];
    if (v8)
    {
      uint64_t v13 = [v11 initWithData:v12 ofType:v9 proposedFilename:v8 originalURL:self->_originalURL];
      goto LABEL_6;
    }
    uint64_t v15 = [(WFFileRepresentation *)self wfName];
    uint64_t v16 = [v11 initWithData:v12 ofType:v9 proposedFilename:v15 originalURL:self->_originalURL];
  }
  BOOL v14 = (id *)v16;

LABEL_10:
  if (v14)
  {
    objc_storeStrong(v14 + 7, self->_creationDate);
    objc_storeStrong(v14 + 8, self->_modificationDate);
    v17 = v14;
  }

  return v14;
}

- (id)copyWithName:(id)a3 zone:(_NSZone *)a4
{
  return [(WFFileRepresentation *)self copyWithName:a3 addingExtensionIfNecessary:1 zone:a4];
}

- (NSString)wfName
{
  wfName = self->_wfName;
  if (wfName)
  {
    v3 = wfName;
  }
  else
  {
    id v4 = [(WFFileRepresentation *)self filename];
    v3 = [v4 stringByDeletingPathExtension];
  }
  return v3;
}

- (id)updatedFilenameForUserEnteredName:(id)a3 addingExtensionIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(WFFileRepresentation *)self typeForUserEnteredName:v6 addingExtensionIfNecessary:v4];
  id v8 = +[WFFileRepresentation proposedFilenameForFile:v6 ofType:v7];

  return v8;
}

- (id)typeForUserEnteredName:(id)a3 addingExtensionIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [MEMORY[0x263F852B8] typeFromFilename:a3];
  if (([v6 isDeclared] & 1) == 0)
  {
    if (v4) {
      [(WFFileRepresentation *)self wfType];
    }
    else {
    uint64_t v7 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DA48]];
    }

    id v6 = (void *)v7;
  }
  return v6;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)WFFileRepresentation;
  v3 = [(WFFileRepresentation *)&v7 description];
  BOOL v4 = [(WFFileRepresentation *)self filename];
  uint64_t v5 = [v3 stringByAppendingFormat:@": %@", v4];

  return v5;
}

- (id)mappedDataWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  data = self->_data;
  if (data)
  {
    BOOL v4 = data;
  }
  else
  {
    fileURL = self->_fileURL;
    if (fileURL)
    {
      BOOL v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:fileURL options:8 error:a3];
    }
    else
    {
      id v8 = getWFFileRepresentationLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v10 = 136315394;
        uint64_t v11 = "-[WFFileRepresentation mappedDataWithError:]";
        __int16 v12 = 2112;
        uint64_t v13 = self;
        _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_FAULT, "%s Both _data and _fileURL are nil in fileRepresentation: %@", (uint8_t *)&v10, 0x16u);
      }

      BOOL v4 = 0;
    }
  }
  return v4;
}

- (id)mappedData
{
  return [(WFFileRepresentation *)self mappedDataWithError:0];
}

- (id)inputStream
{
  int64_t v3 = [(WFFileRepresentation *)self representationType];
  id v4 = objc_alloc(MEMORY[0x263EFF950]);
  if (v3 == 1)
  {
    uint64_t v5 = [(WFFileRepresentation *)self fileURL];
    id v6 = (void *)[v4 initWithURL:v5];

    objc_setAssociatedObject(v6, sel_inputStream, self, (void *)1);
  }
  else
  {
    objc_super v7 = [(WFFileRepresentation *)self data];
    id v6 = (void *)[v4 initWithData:v7];
  }
  return v6;
}

- (int64_t)fileSize
{
  data = self->_data;
  if (data)
  {
    return [(NSData *)data length];
  }
  else if (self->_fileURL)
  {
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [(NSURL *)self->_fileURL path];
    objc_super v7 = [v5 attributesOfItemAtPath:v6 error:0];
    int64_t v8 = [v7 fileSize];

    return v8;
  }
  else
  {
    return 0;
  }
}

- (int64_t)representationType
{
  return self->_data == 0;
}

- (BOOL)atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:(id)a3 sourceURL:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v7, "wf_fileIsOnSameVolumeAsURL:", v8))
  {
    uint64_t v9 = getWFFilesLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v34 = "-[WFFileRepresentation atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:sourceURL:error:]";
      __int16 v35 = 2112;
      id v36 = v7;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl(&dword_216505000, v9, OS_LOG_TYPE_DEFAULT, "%s Files are on the same volume not attempting replace across volumes (%@) - (%@)", buf, 0x20u);
    }
    char v10 = 0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    id v32 = 0;
    uint64_t v11 = [v9 URLForDirectory:99 inDomain:1 appropriateForURL:v7 create:1 error:&v32];
    id v12 = v32;
    [MEMORY[0x263F08C38] UUID];
    uint64_t v14 = v13 = a5;
    uint64_t v15 = [v14 UUIDString];
    uint64_t v16 = [v11 URLByAppendingPathComponent:v15];

    id v17 = v11;
    id v31 = v12;
    id v27 = v8;
    char v18 = [v9 copyItemAtURL:v8 toURL:v16 error:&v31];
    id v19 = v31;

    id v30 = v19;
    id v28 = (void *)v16;
    char v20 = [v9 replaceItemAtURL:v7 withItemAtURL:v16 backupItemName:0 options:0 resultingItemURL:0 error:&v30];
    id v21 = v30;

    if (v11) {
      char v10 = v20 & v18;
    }
    else {
      char v10 = 0;
    }
    if (v13 && v21) {
      *uint64_t v13 = v21;
    }
    if (v11)
    {
      id v29 = 0;
      char v22 = [v9 removeItemAtURL:v17 error:&v29];
      id v23 = v29;
      if ((v22 & 1) == 0)
      {
        uint64_t v24 = getWFFilesLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v34 = "-[WFFileRepresentation atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:sourceURL:error:]";
          __int16 v35 = 2114;
          id v36 = v23;
          _os_log_impl(&dword_216505000, v24, OS_LOG_TYPE_ERROR, "%s Failed to cleanup staging directory during atomic replace: %{public}@", buf, 0x16u);
        }
      }
    }
    if ((v10 & 1) == 0)
    {
      v25 = getWFFilesLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v34 = "-[WFFileRepresentation atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:sourceURL:error:]";
        __int16 v35 = 2114;
        id v36 = v21;
        _os_log_impl(&dword_216505000, v25, OS_LOG_TYPE_ERROR, "%s Failed to replace across volumes: %{public}@", buf, 0x16u);
      }
    }
    id v8 = v27;
  }

  return v10;
}

- (BOOL)writeToFileURL:(id)a3 overwriting:(BOOL)a4 error:(id *)a5
{
  return [(WFFileRepresentation *)self writeToFileURL:a3 copy:1 overwrite:a4 error:a5];
}

- (BOOL)writeToFileURL:(id)a3 copy:(BOOL)a4 overwrite:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (![(id)objc_opt_class() fileIsInDisallowedDirectory:v10])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v40 = __Block_byref_object_copy__8840;
    v41 = __Block_byref_object_dispose__8841;
    id v42 = 0;
    uint64_t v13 = objc_msgSend(v10, "wf_fileIsShortcutsOwned") ^ 1;
    if (self->_fileURL)
    {
      uint64_t v14 = [MEMORY[0x263F08850] defaultManager];
      if (v7)
      {
        uint64_t v15 = self->_fileURL;
        if (v8)
        {
          uint64_t v16 = [MEMORY[0x263F08C38] UUID];
          id v17 = [v16 UUIDString];
          char v18 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v17];

          if (([v14 copyItemAtURL:self->_fileURL toURL:v18 error:a6] & 1) == 0)
          {

            char v12 = 0;
LABEL_19:
            _Block_object_dispose(buf, 8);

            goto LABEL_20;
          }
          uint64_t v15 = v18;
        }
        id v19 = objc_opt_class();
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke;
        v34[3] = &unk_264287620;
        id v35 = v14;
        char v20 = v15;
        __int16 v37 = self;
        id v38 = buf;
        id v36 = v20;
        char v12 = [v19 coordinateFileOperation:1 shouldCoordinate:v13 fileURL:v10 destinationURL:0 accessor:v34];
      }
      else
      {
        char v22 = objc_opt_class();
        fileURL = self->_fileURL;
        if (v8)
        {
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_70;
          v31[3] = &unk_2642875F8;
          id v32 = v14;
          uint64_t v33 = buf;
          char v12 = [v22 coordinateFileOperation:3 shouldCoordinate:v13 fileURL:fileURL destinationURL:v10 accessor:v31];
          char v20 = v32;
        }
        else
        {
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_71;
          v28[3] = &unk_2642875F8;
          id v29 = v14;
          id v30 = buf;
          char v12 = [v22 coordinateFileOperation:4 shouldCoordinate:v13 fileURL:fileURL destinationURL:v10 accessor:v28];
          char v20 = v29;
        }
      }
    }
    else
    {
      id v21 = objc_opt_class();
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_72;
      v26[3] = &unk_264287648;
      BOOL v27 = v7;
      v26[4] = self;
      v26[5] = buf;
      char v12 = [v21 coordinateFileOperation:1 shouldCoordinate:v13 fileURL:v10 destinationURL:0 accessor:v26];
    }
    if (a6)
    {
      uint64_t v24 = *(void **)(*(void *)&buf[8] + 40);
      if (v24) {
        *a6 = v24;
      }
    }
    goto LABEL_19;
  }
  uint64_t v11 = getWFFileRepresentationLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[WFFileRepresentation writeToFileURL:copy:overwrite:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_ERROR, "%s Cannot save file URL to disallowed directory: %@", buf, 0x16u);
  }

  char v12 = 0;
LABEL_20:

  return v12;
}

uint64_t __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v15 = getWFFilesLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v24 = "-[WFFileRepresentation writeToFileURL:copy:overwrite:error:]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = 0;
      __int16 v27 = 2114;
      id v28 = v7;
      _os_log_impl(&dword_216505000, v15, OS_LOG_TYPE_ERROR, "%s Failed to coordinate write to %@: %{public}@", buf, 0x20u);
    }
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  id v10 = (void *)a1[4];
  uint64_t v11 = a1[5];
  uint64_t v12 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v12 + 40);
  char v13 = [v10 replaceItemAtURL:v8 withItemAtURL:v11 backupItemName:0 options:0 resultingItemURL:0 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  if ((v13 & 1) == 0)
  {
    uint64_t v16 = (void *)a1[6];
    uint64_t v17 = v16[4];
    uint64_t v18 = *(void *)(a1[7] + 8);
    id v21 = *(id *)(v18 + 40);
    uint64_t v14 = [v16 atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:v8 sourceURL:v17 error:&v21];
    id v19 = v21;
    uint64_t v15 = *(NSObject **)(v18 + 40);
    *(void *)(v18 + 40) = v19;
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v14 = 1;
LABEL_9:

  return v14;
}

uint64_t __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_70(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v17 = *(id *)(v12 + 40);
    uint64_t v13 = [v11 copyItemAtURL:v8 toURL:v10 error:&v17];
    id v14 = v17;
    uint64_t v15 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v14;
  }
  else
  {
    uint64_t v15 = getWFFilesLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v19 = "-[WFFileRepresentation writeToFileURL:copy:overwrite:error:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_216505000, v15, OS_LOG_TYPE_ERROR, "%s Failed to coordinate copy from %@ to %@: %{public}@", buf, 0x2Au);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_71(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v17 = *(id *)(v12 + 40);
    uint64_t v13 = [v11 moveItemAtURL:v8 toURL:v10 error:&v17];
    id v14 = v17;
    uint64_t v15 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v14;
  }
  else
  {
    uint64_t v15 = getWFFilesLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v19 = "-[WFFileRepresentation writeToFileURL:copy:overwrite:error:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_216505000, v15, OS_LOG_TYPE_ERROR, "%s Failed to coordinate move from %@ to %@: %{public}@", buf, 0x2Au);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_72(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  BOOL v4 = *(unsigned char *)(a1 + 48) == 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v3 writeToURL:a3 options:2 * v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  return v6;
}

- (BOOL)writeToTemporaryFileURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    BOOL v8 = [(WFFileRepresentation *)self writeToFileURL:v7 copy:[(WFFileRepresentation *)self deletesFileOnDeallocation] ^ 1 overwrite:0 error:a4];
    BOOL v9 = 0;
    if (v8)
    {
      BOOL v9 = 1;
      self->_deletesFileOnDeallocation = 1;
      self->_isTemporaryFile = 1;
      objc_storeStrong((id *)&self->_fileURL, a3);
      INFileURLSetMarkedForDeletionOnDeallocation();
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSURL)fileURL
{
  fileURL = self->_fileURL;
  if (!fileURL)
  {
    if (self->_data)
    {
      BOOL v4 = [(WFFileRepresentation *)self filename];
      uint64_t v5 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v4];

      [(WFFileRepresentation *)self writeToTemporaryFileURL:v5 error:0];
      fileURL = self->_fileURL;
    }
    else
    {
      fileURL = 0;
    }
  }
  return fileURL;
}

- (NSData)data
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  data = self->_data;
  if (!data)
  {
    if (self->_fileURL)
    {
      id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
      fileURL = self->_fileURL;
      id v11 = 0;
      uint64_t v6 = (NSData *)[v4 initWithContentsOfURL:fileURL options:0 error:&v11];
      id v7 = v11;
      BOOL v8 = self->_data;
      self->_data = v6;

      if (!self->_data)
      {
        BOOL v9 = getWFFileRepresentationLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v13 = "-[WFFileRepresentation data]";
          __int16 v14 = 2112;
          id v15 = v7;
          _os_log_impl(&dword_216505000, v9, OS_LOG_TYPE_ERROR, "%s Failed to read file: %{error}@", buf, 0x16u);
        }
      }
      data = self->_data;
    }
    else
    {
      data = 0;
    }
  }
  return data;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_fileURL)
  {
    if (self->_deletesFileOnDeallocation)
    {
      if (!INFileURLHasAssociatedAuditToken()) {
        goto LABEL_8;
      }
      int64_t v3 = [MEMORY[0x263F08AB0] processInfo];
      id v4 = v3;
      if (v3) {
        objc_msgSend(v3, "if_auditToken");
      }
      else {
        memset(&v11[1], 0, 32);
      }
      int v5 = INFileURLAuditTokenEquals();

      if (v5)
      {
LABEL_8:
        uint64_t v6 = getWFFileRepresentationLogObject();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = [(NSURL *)self->_fileURL absoluteString];
          *(_DWORD *)buf = 136315394;
          uint64_t v13 = "-[WFFileRepresentation dealloc]";
          __int16 v14 = 2112;
          id v15 = v7;
          _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_DEFAULT, "%s Deleting file on deallocation: %@", buf, 0x16u);
        }
        BOOL v8 = [MEMORY[0x263F08850] defaultManager];
        [v8 removeItemAtURL:self->_fileURL error:0];
      }
    }
    if (self->_securityScopedResource)
    {
      BOOL v9 = getWFFileRepresentationLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        fileURL = self->_fileURL;
        *(_DWORD *)buf = 136315394;
        uint64_t v13 = "-[WFFileRepresentation dealloc]";
        __int16 v14 = 2112;
        id v15 = fileURL;
        _os_log_impl(&dword_216505000, v9, OS_LOG_TYPE_DEFAULT, "%s Revoking access to security scoped URL: %@", buf, 0x16u);
      }

      [(NSURL *)self->_fileURL stopAccessingSecurityScopedResource];
    }
  }
  v11[0].receiver = self;
  v11[0].super_class = (Class)WFFileRepresentation;
  [(objc_super *)v11 dealloc];
}

- (WFFileRepresentation)initWithFileURL:(id)a3 options:(int64_t)a4 ofType:(id)a5 proposedFilename:(id)a6 originalURL:(id)a7
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 isFileURL])
  {
    if ((a4 & 8) != 0)
    {
      if ([v13 startAccessingSecurityScopedResource])
      {
        int v17 = 1;
        goto LABEL_10;
      }
      uint64_t v18 = getWFFileRepresentationLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]";
        _os_log_impl(&dword_216505000, v18, OS_LOG_TYPE_ERROR, "%s Failed to start accessing a security scoped resource.", buf, 0xCu);
      }
    }
    int v17 = 0;
LABEL_10:
    if ([(id)objc_opt_class() fileIsInDisallowedDirectory:v13])
    {
      id v19 = getWFFileRepresentationLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_216505000, v19, OS_LOG_TYPE_ERROR, "%s Cannot represent file URL, returning nil: %@", buf, 0x16u);
      }

      if (v17) {
        [v13 stopAccessingSecurityScopedResource];
      }
      goto LABEL_36;
    }
    if ((v17 & 1) == 0 && ([(id)objc_opt_class() sandboxAllowsRepresentingFileURL:v13] & 1) == 0)
    {
      __int16 v24 = getWFFileRepresentationLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_216505000, v24, OS_LOG_TYPE_ERROR, "%s Cannot represent file URL, returning nil: %@", buf, 0x16u);
      }

      goto LABEL_36;
    }
    v51 = v13;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v72 = __Block_byref_object_copy__8840;
    v73 = __Block_byref_object_dispose__8841;
    id v74 = 0;
    if (v14)
    {
      id obj = v14;
    }
    else
    {
      id obj = [(id)objc_opt_class() typeOfFile:v51];
    }
    __int16 v20 = objc_opt_class();
    id v21 = v15;
    if (!v15)
    {
      id v21 = [v51 lastPathComponent];
    }
    id v62 = 0;
    v49 = [v20 proposedFilenameForFile:v21 ofType:obj unsanitizedName:&v62];
    id v48 = v62;
    if (!v15) {

    }
    if ((a4 & 5) != 5 && (a4 & 3) != 3)
    {
      objc_storeStrong((id *)(*(void *)&buf[8] + 40), a3);
      __int16 v22 = v51;
      goto LABEL_27;
    }
    int v45 = [v51 wf_fileIsDirectory];
    if (v45) {
      +[WFTemporaryFileManager createTemporaryDirectoryWithFilename:v49];
    }
    else {
    uint64_t v23 = +[WFTemporaryFileManager createTemporaryFileWithFilename:v49];
    }
    __int16 v27 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v23;

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      if ((a4 & 5) != 5)
      {
        v47 = objc_opt_class();
        uint64_t v33 = *(void *)(*(void *)&buf[8] + 40);
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __84__WFFileRepresentation_initWithFileURL_options_ofType_proposedFilename_originalURL___block_invoke_65;
        v55[3] = &unk_2642875F8;
        uint64_t v34 = v51;
        v56 = v34;
        v57 = buf;
        if (([v47 coordinateFileOperation:4 shouldCoordinate:((unint64_t)a4 >> 4) & 1 fileURL:v34 destinationURL:v33 accessor:v55] & 1) == 0)
        {
          id v25 = 0;
          id v32 = v56;
          v51 = v34;
          goto LABEL_60;
        }
        __int16 v22 = *(id *)(*(void *)&buf[8] + 40);

LABEL_27:
        v54.receiver = self;
        v54.super_class = (Class)WFFileRepresentation;
        self = [(WFFileRepresentation *)&v54 init];
        if (!self)
        {
          id v25 = 0;
LABEL_61:

          _Block_object_dispose(buf, 8);
          goto LABEL_37;
        }
        if ((a4 & 8) != 0)
        {
          if (*(NSObject **)(*(void *)&buf[8] + 40) == v51) {
            self->_securityScopedResource = 1;
          }
          else {
            [v51 stopAccessingSecurityScopedResource];
          }
        }
        self->_deletesFileOnDeallocation = a4 & 1;
        self->_isTemporaryFile = a4 & 1;
        objc_storeStrong((id *)&self->_fileURL, *(id *)(*(void *)&buf[8] + 40));
        id v35 = (NSString *)[v49 copy];
        filename = self->_filename;
        self->_filename = v35;

        __int16 v37 = (NSString *)[v48 copy];
        wfName = self->_wfName;
        self->_wfName = v37;

        objc_storeStrong((id *)&self->_wfType, obj);
        id v53 = 0;
        [v22 getResourceValue:&v53 forKey:*MEMORY[0x263EFF610] error:0];
        id v32 = v53;
        uint64_t v39 = v32;
        if (!v32)
        {
          uint64_t v39 = [MEMORY[0x263EFF910] date];
        }
        objc_storeStrong((id *)&self->_creationDate, v39);
        if (!v32) {

        }
        id v52 = 0;
        [v22 getResourceValue:&v52 forKey:*MEMORY[0x263EFF5F8] error:0];
        v40 = (NSDate *)v52;
        modificationDate = self->_modificationDate;
        self->_modificationDate = v40;
        id v42 = v40;

        objc_storeStrong((id *)&self->_originalURL, a7);
        self->_initialRepresentationType = 1;
        self = self;
        v51 = v22;
        id v25 = self;
LABEL_60:

        __int16 v22 = v51;
        goto LABEL_61;
      }
      id v28 = [MEMORY[0x263F08C38] UUID];
      uint64_t v29 = [v28 UUIDString];
      id v30 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v29];

      if (v30)
      {
        v46 = objc_opt_class();
        unint64_t v44 = ((unint64_t)a4 >> 4) & 1;
        uint64_t v31 = *(void *)(*(void *)&buf[8] + 40);
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __84__WFFileRepresentation_initWithFileURL_options_ofType_proposedFilename_originalURL___block_invoke;
        v58[3] = &unk_2642875D0;
        __int16 v22 = v51;
        v59 = v22;
        v61 = buf;
        id v32 = v30;
        v60 = v32;
        LOBYTE(v31) = [v46 coordinateFileOperation:3 shouldCoordinate:v44 fileURL:v22 destinationURL:v31 accessor:v58];

        if ((v31 & 1) == 0)
        {
          id v25 = 0;
          v51 = v22;
          goto LABEL_60;
        }

        goto LABEL_27;
      }
      uint64_t v43 = getWFFileRepresentationLogObject();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v63 = 136315906;
        v64 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]";
        __int16 v65 = 2050;
        int64_t v66 = a4;
        __int16 v67 = 1026;
        int v68 = v45;
        __int16 v69 = 2112;
        v70 = v49;
        _os_log_impl(&dword_216505000, v43, OS_LOG_TYPE_ERROR, "%s Failed to create temporary file URL, adoptionBehavior = %{public}ld, isDirectory = %{public}d, filename = %@", v63, 0x26u);
      }

      id v32 = 0;
    }
    else
    {
      id v32 = getWFFileRepresentationLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v63 = 136315906;
        v64 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]";
        __int16 v65 = 2050;
        int64_t v66 = a4;
        __int16 v67 = 1026;
        int v68 = v45;
        __int16 v69 = 2112;
        v70 = v49;
        _os_log_impl(&dword_216505000, v32, OS_LOG_TYPE_ERROR, "%s Failed to create new file URL, adoptionBehavior = %{public}ld, isDirectory = %{public}d, filename = %@", v63, 0x26u);
      }
    }
    id v25 = 0;
    goto LABEL_60;
  }
LABEL_36:
  id v25 = 0;
LABEL_37:

  return v25;
}

uint64_t __84__WFFileRepresentation_initWithFileURL_options_ofType_proposedFilename_originalURL___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8 && v9)
  {
    id v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v12 = a1[5];
    id v30 = 0;
    char v13 = [v11 copyItemAtURL:v8 toURL:v12 error:&v30];
    id v14 = v30;

    if ((v13 & 1) == 0)
    {
      __int16 v22 = getWFFileRepresentationLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = a1[5];
        *(_DWORD *)buf = 136315906;
        id v32 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]_block_invoke";
        __int16 v33 = 2112;
        id v34 = v8;
        __int16 v35 = 2112;
        uint64_t v36 = v26;
        __int16 v37 = 2114;
        id v38 = v14;
        _os_log_impl(&dword_216505000, v22, OS_LOG_TYPE_ERROR, "%s Failed to copy file from %@ to %@: %{public}@", buf, 0x2Au);
      }
      goto LABEL_13;
    }
    id v15 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v16 = a1[5];
    uint64_t v17 = *(void *)(a1[6] + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    id v28 = v14;
    id obj = v18;
    uint64_t v19 = 1;
    char v20 = [v15 replaceItemAtURL:v10 withItemAtURL:v16 backupItemName:0 options:1 resultingItemURL:&obj error:&v28];
    objc_storeStrong((id *)(v17 + 40), obj);
    id v21 = v28;

    if ((v20 & 1) == 0)
    {
      __int16 v22 = getWFFileRepresentationLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = a1[5];
        *(_DWORD *)buf = 136315906;
        id v32 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]_block_invoke";
        __int16 v33 = 2112;
        id v34 = v10;
        __int16 v35 = 2112;
        uint64_t v36 = v23;
        __int16 v37 = 2114;
        id v38 = v21;
        _os_log_impl(&dword_216505000, v22, OS_LOG_TYPE_ERROR, "%s Failed to replace file at %@ with %@: %{public}@", buf, 0x2Au);
      }
      id v14 = v21;
LABEL_13:

      uint64_t v19 = 0;
      id v21 = v14;
    }
  }
  else
  {
    id v21 = getWFFileRepresentationLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = (void *)a1[4];
      uint64_t v25 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 136315906;
      id v32 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]_block_invoke";
      __int16 v33 = 2112;
      id v34 = v24;
      __int16 v35 = 2112;
      uint64_t v36 = v25;
      __int16 v37 = 2114;
      id v38 = v7;
      _os_log_impl(&dword_216505000, v21, OS_LOG_TYPE_ERROR, "%s Failed to coordinate file copy from %@ to %@: %{public}@", buf, 0x2Au);
    }
    uint64_t v19 = 0;
  }

  return v19;
}

uint64_t __84__WFFileRepresentation_initWithFileURL_options_ofType_proposedFilename_originalURL___block_invoke_65(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8 || !v9)
  {
    uint64_t v16 = getWFFileRepresentationLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void **)(a1 + 32);
      uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315906;
      __int16 v24 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      id v28 = v19;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_216505000, v16, OS_LOG_TYPE_ERROR, "%s Failed to coordinate file move from %@ to %@: %{public}@", buf, 0x2Au);
    }
    goto LABEL_9;
  }
  id v11 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  char v13 = *(void **)(v12 + 40);
  id v21 = 0;
  id obj = v13;
  uint64_t v14 = 1;
  char v15 = [v11 replaceItemAtURL:v10 withItemAtURL:v8 backupItemName:0 options:1 resultingItemURL:&obj error:&v21];
  objc_storeStrong((id *)(v12 + 40), obj);
  uint64_t v16 = v21;

  if ((v15 & 1) == 0)
  {
    uint64_t v17 = getWFFileRepresentationLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v24 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2114;
      id v30 = v16;
      _os_log_impl(&dword_216505000, v17, OS_LOG_TYPE_ERROR, "%s Failed to replace file at %@ with %@: %{public}@", buf, 0x2Au);
    }

LABEL_9:
    uint64_t v14 = 0;
  }

  return v14;
}

- (WFFileRepresentation)initWithData:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 originalURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"WFFileRepresentation.m", 146, @"Invalid parameter not satisfying: %@", @"[data isKindOfClass:[NSData class]]" object file lineNumber description];
  }
  char v15 = [(WFFileRepresentation *)self init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    data = v15->_data;
    v15->_data = (NSData *)v16;

    uint64_t v18 = [MEMORY[0x263EFF910] date];
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v18;

    objc_storeStrong((id *)&v15->_originalURL, a6);
    v15->_isTemporaryFile = 1;
    v15->_initialRepresentationType = 0;
    if (v12)
    {
      char v20 = (WFFileType *)v12;
      wfType = v15->_wfType;
      v15->_wfType = v20;
    }
    else
    {
      wfType = [MEMORY[0x263F852B8] typeFromFilename:v13];
      if ([wfType isDeclared])
      {
        __int16 v22 = wfType;
      }
      else
      {
        __int16 v22 = [(id)objc_opt_class() typeOfData:v15->_data];
      }
      uint64_t v23 = v15->_wfType;
      v15->_wfType = v22;
    }
    __int16 v24 = objc_opt_class();
    __int16 v25 = v15->_wfType;
    id v34 = 0;
    uint64_t v26 = [v24 proposedFilenameForFile:v13 ofType:v25 unsanitizedName:&v34];
    id v27 = v34;
    filename = v15->_filename;
    v15->_filename = (NSString *)v26;

    uint64_t v29 = [v27 copy];
    wfName = v15->_wfName;
    v15->_wfName = (NSString *)v29;

    uint64_t v31 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)coordinateFileOperation:(unint64_t)a3 shouldCoordinate:(BOOL)a4 fileURL:(id)a5 destinationURL:(id)a6 accessor:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  char v15 = (uint64_t (**)(id, void, id, id))a7;
  if (!v15)
  {
    id v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"WFFileRepresentation.m", 603, @"Invalid parameter not satisfying: %@", @"accessor" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_16:
    char v17 = v15[2](v15, 0, v13, v14);
    goto LABEL_17;
  }
  if (!a4) {
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08830]) initWithFilePresenter:0];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v17 = 1;
  char v42 = 1;
  switch(a3)
  {
    case 0uLL:
      __int16 v22 = v37;
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke;
      v37[3] = &unk_264287670;
      v37[6] = &v39;
      uint64_t v38 = 0;
      uint64_t v23 = v15;
      v37[4] = 0;
      v37[5] = v23;
      uint64_t v19 = (id *)&v38;
      [v16 coordinateReadingItemAtURL:v13 options:2 error:&v38 byAccessor:v37];
      goto LABEL_11;
    case 1uLL:
    case 2uLL:
      if (a3 == 2) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = 8;
      }
      uint64_t v36 = 0;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_2;
      v33[3] = &unk_264287670;
      v35[1] = &v39;
      uint64_t v34 = 0;
      v35[0] = v15;
      uint64_t v19 = (id *)&v36;
      [v16 coordinateWritingItemAtURL:v13 options:v18 error:&v36 byAccessor:v33];
      char v20 = (id *)v35;
      id v21 = (id *)&v34;
      goto LABEL_12;
    case 3uLL:
      __int16 v22 = v31;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_3;
      v31[3] = &unk_264287698;
      v31[6] = &v39;
      uint64_t v32 = 0;
      __int16 v24 = v15;
      void v31[4] = 0;
      v31[5] = v24;
      uint64_t v19 = (id *)&v32;
      [v16 coordinateReadingItemAtURL:v13 options:2 writingItemAtURL:v14 options:8 error:&v32 byAccessor:v31];
      goto LABEL_11;
    case 4uLL:
      __int16 v22 = v29;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_4;
      v29[3] = &unk_264287698;
      v29[6] = &v39;
      uint64_t v30 = 0;
      __int16 v25 = v15;
      v29[4] = 0;
      v29[5] = v25;
      uint64_t v19 = (id *)&v30;
      [v16 coordinateWritingItemAtURL:v13 options:2 writingItemAtURL:v14 options:8 error:&v30 byAccessor:v29];
LABEL_11:
      char v20 = (id *)(v22 + 5);
      id v21 = (id *)(v22 + 4);
LABEL_12:
      id v26 = *v19;

      char v17 = *((unsigned char *)v40 + 24) != 0;
      break;
    default:
      id v26 = 0;
      break;
  }
  _Block_object_dispose(&v39, 8);

LABEL_17:
  return v17;
}

uint64_t __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_3(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_4(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

+ (id)proposedFilenameForFile:(id)a3 ofType:(id)a4 unsanitizedName:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 pathExtension];
  id v10 = [v8 fileExtension];
  id v11 = [MEMORY[0x263F852B8] typeFromFileExtension:v9];
  if (([v11 isDeclared] & 1) != 0 || objc_msgSend(v9, "isEqualToString:", v10))
  {
    int v12 = [v7 hasSuffix:@".rtfd.zip"];
    id v13 = [v7 stringByDeletingPathExtension];
    id v14 = v13;
    if (v12)
    {
      uint64_t v15 = [v13 stringByDeletingPathExtension];

      id v7 = v14;
      id v14 = (void *)v15;
    }

    id v7 = v14;
  }
  id v16 = v7;
  if ([v11 isEqualToType:v8]) {
    goto LABEL_7;
  }
  uint64_t v18 = [v8 fileExtension];
  if ([v18 length])
  {

    char v17 = v10;
  }
  else
  {
    int v19 = [v11 conformsToType:v8];

    char v17 = v10;
    if (v19) {
LABEL_7:
    }
      char v17 = v9;
  }
  id v20 = v17;
  if ([v16 length])
  {
    id v21 = [a1 sanitizedFilename:v16 withExtension:v20 unsanitizedName:a5];
    goto LABEL_22;
  }
  uint64_t v22 = *MEMORY[0x263F1DB18];
  if ([v8 conformsToUTType:*MEMORY[0x263F1DB18]])
  {
    uint64_t v31 = a5;
    uint64_t v23 = [MEMORY[0x263F852B8] typeWithUTType:v22];
    __int16 v24 = [v23 typeDescription];
    __int16 v25 = [MEMORY[0x263EFF960] currentLocale];
    id v26 = [v24 capitalizedStringWithLocale:v25];
  }
  else
  {
    id v27 = [v8 typeDescription];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = v28;
LABEL_20:
      id v26 = v28;

      goto LABEL_21;
    }
    uint64_t v31 = a5;
    __int16 v24 = [v8 typesConformedTo];
    __int16 v25 = [v24 firstObject];
    id v26 = [v25 typeDescription];
    uint64_t v23 = 0;
  }

  a5 = v31;
  if (!v26)
  {
    uint64_t v29 = [MEMORY[0x263F08C38] UUID];
    id v28 = [v29 UUIDString];
    goto LABEL_20;
  }
LABEL_21:
  id v21 = [a1 sanitizedFilename:v26 withExtension:v20 unsanitizedName:a5];

LABEL_22:
  return v21;
}

+ (id)proposedFilenameForFile:(id)a3 ofType:(id)a4
{
  return (id)[a1 proposedFilenameForFile:a3 ofType:a4 unsanitizedName:0];
}

+ (id)sanitizedFilename:(id)a3 withExtension:(id)a4 unsanitizedName:(id *)a5
{
  id v7 = a4;
  if (a5) {
    *a5 = a3;
  }
  id v8 = [a3 stringByReplacingOccurrencesOfString:@"/" withString:@":"];
  if ([v7 length])
  {
    id v9 = [v8 stringByAppendingPathExtension:v7];
  }
  else
  {
    id v9 = v8;
  }
  id v10 = v9;
  id v11 = objc_msgSend(v9, "wf_filenameTruncatedToMaximumLength");

  return v11;
}

+ (id)sanitizedFilename:(id)a3 withExtension:(id)a4
{
  return (id)[a1 sanitizedFilename:a3 withExtension:a4 unsanitizedName:0];
}

+ (id)typeOfFile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 wfFileType];
  int v5 = v4;
  if (!v4 || [v4 isEqualToUTType:*MEMORY[0x263F1DA48]])
  {
    WFFaultIfLoadingMagicKitInDaemon();
    uint64_t v6 = (void *)MEMORY[0x263F852B8];
    id v7 = +[GEMagicKit magicForFileAtURL:v3];
    id v8 = [v7 uniformType];
    uint64_t v9 = [v6 typeWithString:v8];

    int v5 = (void *)v9;
    if (!v9)
    {
      int v5 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
    }
  }

  return v5;
}

+ (id)typeOfData:(id)a3
{
  id v3 = a3;
  WFFaultIfLoadingMagicKitInDaemon();
  id v4 = (void *)MEMORY[0x263F852B8];
  int v5 = +[GEMagicKit magicForData:v3];

  uint64_t v6 = [v5 uniformType];
  id v7 = [v4 typeWithString:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
  }
  uint64_t v9 = v8;

  return v9;
}

+ (BOOL)isAllowedToRepresentFileURL:(id)a3
{
  id v4 = a3;
  if ([a1 sandboxAllowsRepresentingFileURL:v4]) {
    int v5 = [a1 fileIsInDisallowedDirectory:v4] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)fileIsInDisallowedDirectory:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [a3 URLByResolvingSymlinksInPath];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = objc_msgSend(a1, "disallowedDirectoryURLs", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v4, "wf_proposedFileIsContainedByDirectoryAtURL:", *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)sandboxAllowsRepresentingFileURL:(id)a3
{
  return objc_msgSend(a3, "wf_sandboxAllowsReadingFile");
}

+ (id)disallowedDirectoryURLs
{
  return (id)_disallowedDirectoryURLs;
}

+ (id)fileWithURL:(id)a3 options:(int64_t)a4 ofType:(id)a5 proposedFilename:(id)a6 originalURL:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = (void *)[objc_alloc((Class)a1) initWithFileURL:v15 options:a4 ofType:v14 proposedFilename:v13 originalURL:v12];

  return v16;
}

+ (id)fileWithURL:(id)a3 options:(int64_t)a4 ofType:(id)a5 proposedFilename:(id)a6
{
  return (id)[a1 fileWithURL:a3 options:a4 ofType:a5 proposedFilename:a6 originalURL:a3];
}

+ (id)fileWithURL:(id)a3 options:(int64_t)a4 ofType:(id)a5
{
  return (id)[a1 fileWithURL:a3 options:a4 ofType:a5 proposedFilename:0];
}

+ (id)fileWithURL:(id)a3 options:(int64_t)a4
{
  return (id)[a1 fileWithURL:a3 options:a4 ofType:0];
}

+ (id)fileWithData:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 originalURL:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithData:v13 ofType:v12 proposedFilename:v11 originalURL:v10];

  return v14;
}

+ (id)fileWithData:(id)a3 ofType:(id)a4 proposedFilename:(id)a5
{
  return (id)[a1 fileWithData:a3 ofType:a4 proposedFilename:a5 originalURL:0];
}

@end