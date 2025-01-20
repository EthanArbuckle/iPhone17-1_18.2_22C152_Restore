@interface PHExternalAssetResource
+ (id)assetResourceForDuplicatingAssetResource:(id)a3 asData:(BOOL)a4 error:(id *)a5;
+ (id)assetResourceForDuplicatingAssetResource:(id)a3 newResourceType:(int64_t)a4 asData:(BOOL)a5 error:(id *)a6;
+ (unint64_t)probableCPLResourceTypeFromAssetResourceType:(int64_t)a3;
- (BOOL)duplicateAllowsReadAccess;
- (BOOL)isLibraryAssetResource;
- (NSData)data;
- (NSString)originalFilename;
- (NSString)uniformTypeIdentifier;
- (NSURL)fileURL;
- (PHAssetResourceCreationOptions)creationOptions;
- (PHExternalAssetResource)init;
- (PHExternalAssetResource)initWithPropertyListRepresentation:(id)a3;
- (PHExternalAssetResource)initWithResourceType:(int64_t)a3;
- (id)_issueSandboxExtension;
- (id)description;
- (id)propertyListRepresentation;
- (int64_t)pixelHeight;
- (int64_t)pixelWidth;
- (int64_t)type;
- (unint64_t)cplResourceType;
- (void)_consumeSandboxExtension:(id)a3;
- (void)_releaseSandboxExtension;
- (void)_setDuplicateAllowsReadAccess:(BOOL)a3;
- (void)dealloc;
- (void)setCreationOptions:(id)a3;
- (void)setData:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setPixelHeight:(int64_t)a3;
- (void)setPixelWidth:(int64_t)a3;
@end

@implementation PHExternalAssetResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_creationOptions, 0);
}

- (void)setPixelHeight:(int64_t)a3
{
  self->_pixelHeight = a3;
}

- (int64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (void)setPixelWidth:(int64_t)a3
{
  self->_pixelWidth = a3;
}

- (int64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)isLibraryAssetResource
{
  return self->_isLibraryAssetResource;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)cplResourceType
{
  return self->_cplResourceType;
}

- (void)setCreationOptions:(id)a3
{
}

- (PHAssetResourceCreationOptions)creationOptions
{
  return self->_creationOptions;
}

- (int64_t)type
{
  return self->_resourceType;
}

- (NSString)uniformTypeIdentifier
{
  return [(PHAssetResourceCreationOptions *)self->_creationOptions uniformTypeIdentifier];
}

- (NSString)originalFilename
{
  return [(PHAssetResourceCreationOptions *)self->_creationOptions originalFilename];
}

- (void)_setDuplicateAllowsReadAccess:(BOOL)a3
{
  self->_duplicateAllowsReadAccess = a3;
}

- (BOOL)duplicateAllowsReadAccess
{
  return self->_duplicateAllowsReadAccess;
}

- (id)propertyListRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PHExternalAssetResource *)self fileURL];
  v5 = [v4 path];
  [v3 setObject:v5 forKeyedSubscript:@"fileURL"];

  v6 = [(PHExternalAssetResource *)self _issueSandboxExtension];
  [v3 setObject:v6 forKeyedSubscript:@"sandboxExtensionToken"];

  [v3 setObject:self->_data forKeyedSubscript:@"data"];
  v7 = [NSNumber numberWithInteger:self->_resourceType];
  [v3 setObject:v7 forKeyedSubscript:@"type"];

  v8 = [(PHAssetResourceCreationOptions *)self->_creationOptions propertyListRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"creationOptions"];

  return v3;
}

- (void)_releaseSandboxExtension
{
  if ((self->_sandboxExtensionHandle & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
    self->_sandboxExtensionHandle = -1;
  }
}

- (void)_consumeSandboxExtension:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    if (self->_sandboxExtensionHandle != -1)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PHExternalAssetResource.m", 167, @"Invalid parameter not satisfying: %@", @"_sandboxExtensionHandle == -1" object file lineNumber description];
    }
    if (![v5 UTF8String])
    {
      v7 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Unable to get UTF8String from sandbox extension token";
        v9 = buf;
        goto LABEL_10;
      }
LABEL_11:

      goto LABEL_12;
    }
    int64_t v6 = sandbox_extension_consume();
    self->_sandboxExtensionHandle = v6;
    if (v6 == -1)
    {
      v7 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        __int16 v12 = 0;
        v8 = "Unable to consume sandbox extension";
        v9 = (uint8_t *)&v12;
LABEL_10:
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_FAULT, v8, v9, 2u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (id)_issueSandboxExtension
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(NSURL *)self->_fileURL path];
  if (![v2 length])
  {
LABEL_9:
    id v3 = 0;
    goto LABEL_10;
  }
  id v3 = PLGetSandboxExtensionTokenIfPossible();
  if (!v3)
  {
    v4 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [MEMORY[0x1E4F8B908] redactedDescriptionForPath:v2];
      int v9 = 138412546;
      v10 = v2;
      __int16 v11 = 2114;
      __int16 v12 = v5;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_INFO, "PHExternalAssetResource: fallback to readonly sandbox extension for %@ (%{public}@)", (uint8_t *)&v9, 0x16u);
    }
    id v3 = PLGetSandboxExtensionToken();
    if (!v3)
    {
      int64_t v6 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = [MEMORY[0x1E4F8B908] redactedDescriptionForPath:v2];
        int v9 = 138412546;
        v10 = v2;
        __int16 v11 = 2114;
        __int16 v12 = v7;
        _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "PHExternalAssetResource: Unable to issue sandbox extension for %@ (%{public}@)", (uint8_t *)&v9, 0x16u);
      }
      goto LABEL_9;
    }
  }
LABEL_10:

  return v3;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [(PHExternalAssetResource *)self originalFilename];
  v7 = [(PHExternalAssetResource *)self uniformTypeIdentifier];
  v8 = [v3 stringWithFormat:@"<%@: %p> filename: %@ uti: %@", v5, self, v6, v7];

  return v8;
}

- (void)dealloc
{
  [(PHExternalAssetResource *)self _releaseSandboxExtension];
  v3.receiver = self;
  v3.super_class = (Class)PHExternalAssetResource;
  [(PHExternalAssetResource *)&v3 dealloc];
}

- (PHExternalAssetResource)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PHExternalAssetResource.m" lineNumber:136 description:@"Calling init on PHExternalAssetResource without additional arguments is invalid"];

  return [(PHExternalAssetResource *)self initWithResourceType:1];
}

- (PHExternalAssetResource)initWithPropertyListRepresentation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"type"];
  uint64_t v6 = [v5 integerValue];

  v7 = [(PHExternalAssetResource *)self initWithResourceType:v6];
  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"fileURL"];
    if (v8)
    {
      int v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
    }
    else
    {
      int v9 = 0;
    }
    v10 = [v4 objectForKeyedSubscript:@"sandboxExtensionToken"];
    [(PHExternalAssetResource *)v7 _consumeSandboxExtension:v10];

    __int16 v11 = [v4 objectForKeyedSubscript:@"data"];
    __int16 v12 = [v4 objectForKeyedSubscript:@"creationOptions"];
    uint64_t v13 = [[PHAssetResourceCreationOptions alloc] initWithPropertyListRepresentation:v12];
    [(PHExternalAssetResource *)v7 setFileURL:v9];
    [(PHExternalAssetResource *)v7 setData:v11];
    [(PHExternalAssetResource *)v7 setCreationOptions:v13];
    if (v7->_sandboxExtensionHandle == -1 && !v7->_data)
    {
      v14 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = @"non-null";
        if (!v8) {
          v15 = @"null";
        }
        int v17 = 138543618;
        v18 = v15;
        __int16 v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "No sandbox extension and no data for %{public}@ filePath %@", (uint8_t *)&v17, 0x16u);
      }
    }
  }

  return v7;
}

- (PHExternalAssetResource)initWithResourceType:(int64_t)a3
{
  if (!a3)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PHExternalAssetResource.m", 102, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)PHExternalAssetResource;
  id v5 = [(PHExternalAssetResource *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_sandboxExtensionHandle = -1;
    v5->_resourceType = a3;
    v5->_cplResourceType = +[PHExternalAssetResource probableCPLResourceTypeFromAssetResourceType:a3];
  }
  return v6;
}

+ (id)assetResourceForDuplicatingAssetResource:(id)a3 newResourceType:(int64_t)a4 asData:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:a1 file:@"PHExternalAssetResource.m" lineNumber:204 description:@"External resources invalid for duplication"];
  }
  __int16 v12 = (void *)[objc_alloc((Class)a1) initWithResourceType:a4];
  uint64_t v13 = [v11 privateFileURL];
  v14 = v13;
  if (!v7)
  {
    int v17 = [v13 path];
    if (v17
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v18 fileExistsAtPath:v17 isDirectory:0],
          v18,
          v19))
    {
      [v12 setFileURL:v14];
    }
    else
    {

      if (a6)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3303, @"Missing required asset resource file '%@'", v17);
        __int16 v12 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __int16 v12 = 0;
      }
    }

    if (!v12) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  id v28 = 0;
  v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v13 options:1 error:&v28];
  id v16 = v28;
  if (v15)
  {
    [v12 setData:v15];
  }
  else
  {

    if (a6)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = [v14 path];
      v22 = [v16 description];
      objc_msgSend(v20, "ph_errorWithCode:localizedDescription:", 3302, @"Failed to read asset resource file '%@' %@", v21, v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    __int16 v12 = 0;
  }

  if (v12)
  {
LABEL_18:
    [v12 _setDuplicateAllowsReadAccess:1];
    uint64_t v23 = [v11 originalFilename];
    uint64_t v24 = [v11 uniformTypeIdentifier];
    if (v23 | v24)
    {
      v25 = objc_alloc_init(PHAssetResourceCreationOptions);
      [(PHAssetResourceCreationOptions *)v25 setOriginalFilename:v23];
      [(PHAssetResourceCreationOptions *)v25 setUniformTypeIdentifier:v24];
      [v12 setCreationOptions:v25];
    }
  }
LABEL_21:

  return v12;
}

+ (id)assetResourceForDuplicatingAssetResource:(id)a3 asData:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = objc_msgSend(a1, "assetResourceForDuplicatingAssetResource:newResourceType:asData:error:", v8, objc_msgSend(v8, "type"), v6, a5);

  return v9;
}

+ (unint64_t)probableCPLResourceTypeFromAssetResourceType:(int64_t)a3
{
  unint64_t result = 0;
  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 19:
      unint64_t result = 1;
      break;
    case 4:
      unint64_t result = 17;
      break;
    case 5:
      unint64_t result = 2;
      break;
    case 6:
      unint64_t result = 16;
      break;
    case 7:
    case 17:
    case 18:
      return result;
    case 8:
      unint64_t result = 15;
      break;
    case 9:
      unint64_t result = 18;
      break;
    case 10:
      unint64_t result = 19;
      break;
    case 11:
      unint64_t result = 20;
      break;
    case 12:
      unint64_t result = 25;
      break;
    case 13:
    case 14:
      unint64_t result = 23;
      break;
    case 15:
      unint64_t result = 24;
      break;
    case 16:
      unint64_t result = 22;
      break;
    default:
      unint64_t v4 = 14;
      if (a3 != 110) {
        unint64_t v4 = 0;
      }
      if (a3 == 108) {
        unint64_t result = 13;
      }
      else {
        unint64_t result = v4;
      }
      break;
  }
  return result;
}

@end