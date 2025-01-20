@interface AXMPhotoAssetData
+ (BOOL)supportsSecureCoding;
+ (id)_photoAuthorizationMessage:(int64_t)a3;
+ (id)phAssetFromLocalIdentifier:(id)a3 photoLibraryURL:(id)a4;
- (AXMPhotoAssetData)initWithCoder:(id)a3;
- (AXMPhotoAssetData)initWithImageAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 allowsNetworkAccess:(BOOL)a5 needsImageData:(BOOL)a6;
- (BOOL)allowNetworkAccess;
- (NSData)assetImageData;
- (NSDate)assetCreationDate;
- (NSString)assetLocalIdentifier;
- (NSString)assetUTI;
- (NSURL)assetURL;
- (NSURL)photoLibraryURL;
- (id)description;
- (unsigned)assetOrientation;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowNetworkAccess:(BOOL)a3;
- (void)setAssetCreationDate:(id)a3;
- (void)setAssetImageData:(id)a3;
- (void)setAssetLocalIdentifier:(id)a3;
- (void)setAssetOrientation:(unsigned int)a3;
- (void)setAssetURL:(id)a3;
- (void)setAssetUTI:(id)a3;
- (void)setPhotoLibraryURL:(id)a3;
- (void)updateAssetDetails;
@end

@implementation AXMPhotoAssetData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMPhotoAssetData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMPhotoAssetData;
  v5 = [(AXMPhotoAssetData *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMPhotoAssetDataCodingKeyAssetURL];
    [(AXMPhotoAssetData *)v5 setAssetURL:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMPhotoAssetDataCodingKeyCreationDate];
    [(AXMPhotoAssetData *)v5 setAssetCreationDate:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMPhotoAssetDataCodingKeyUTI];
    [(AXMPhotoAssetData *)v5 setAssetUTI:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMPhotoAssetDataCodingKeyLocalIdentifier];
    [(AXMPhotoAssetData *)v5 setAssetLocalIdentifier:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMPhotoAssetDataCodingKeyImageData];
    [(AXMPhotoAssetData *)v5 setAssetImageData:v10];

    -[AXMPhotoAssetData setAssetOrientation:](v5, "setAssetOrientation:", [v4 decodeInt32ForKey:AXMPhotoAssetDataCodingKeyOrientation]);
    -[AXMPhotoAssetData setAllowNetworkAccess:](v5, "setAllowNetworkAccess:", [v4 decodeBoolForKey:AXMPhotoAssetDataCodingKeyAllowNetworkAccess]);
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMPhotoAssetDataCodingKeyPhotoLibraryURL];
    [(AXMPhotoAssetData *)v5 setPhotoLibraryURL:v11];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXMPhotoAssetData *)self assetURL];
  [v4 encodeObject:v5 forKey:AXMPhotoAssetDataCodingKeyAssetURL];

  v6 = [(AXMPhotoAssetData *)self assetCreationDate];
  [v4 encodeObject:v6 forKey:AXMPhotoAssetDataCodingKeyCreationDate];

  v7 = [(AXMPhotoAssetData *)self assetUTI];
  [v4 encodeObject:v7 forKey:AXMPhotoAssetDataCodingKeyUTI];

  v8 = [(AXMPhotoAssetData *)self assetLocalIdentifier];
  [v4 encodeObject:v8 forKey:AXMPhotoAssetDataCodingKeyLocalIdentifier];

  v9 = [(AXMPhotoAssetData *)self assetImageData];
  [v4 encodeObject:v9 forKey:AXMPhotoAssetDataCodingKeyImageData];

  uint64_t v10 = [(AXMPhotoAssetData *)self assetOrientation];
  [v4 encodeInt32:v10 forKey:AXMPhotoAssetDataCodingKeyOrientation];
  BOOL v11 = [(AXMPhotoAssetData *)self allowNetworkAccess];
  [v4 encodeBool:v11 forKey:AXMPhotoAssetDataCodingKeyAllowNetworkAccess];
  id v12 = [(AXMPhotoAssetData *)self photoLibraryURL];
  [v4 encodeObject:v12 forKey:AXMPhotoAssetDataCodingKeyPhotoLibraryURL];
}

+ (id)_photoAuthorizationMessage:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return *(&off_1E61175E8 + a3);
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(AXMPhotoAssetData *)self assetURL];
  v6 = [(AXMPhotoAssetData *)self assetCreationDate];
  v7 = [(AXMPhotoAssetData *)self assetLocalIdentifier];
  v8 = [(AXMPhotoAssetData *)self assetImageData];
  v9 = [(AXMPhotoAssetData *)self assetUTI];
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p URL=%@ creationDate=%@ localIdentifier=%@ data=%@ UTI=%@ orientation=%u>", v4, self, v5, v6, v7, v8, v9, -[AXMPhotoAssetData assetOrientation](self, "assetOrientation")];

  return v10;
}

- (AXMPhotoAssetData)initWithImageAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 allowsNetworkAccess:(BOOL)a5 needsImageData:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AXMPhotoAssetData;
  id v12 = [(AXMPhotoAssetData *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    [(AXMPhotoAssetData *)v12 setAssetLocalIdentifier:v10];
    [(AXMPhotoAssetData *)v13 setAllowNetworkAccess:v7];
    [(AXMPhotoAssetData *)v13 setPhotoLibraryURL:v11];
    if (v6) {
      [(AXMPhotoAssetData *)v13 updateAssetDetails];
    }
  }

  return v13;
}

+ (id)phAssetFromLocalIdentifier:(id)a3 photoLibraryURL:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = (void *)[objc_alloc((Class)getPHPhotoLibraryClass()) initWithPhotoLibraryURL:v6];
  id v19 = 0;
  int v8 = [v7 openAndWaitWithUpgrade:0 error:&v19];
  id v9 = v19;
  id v10 = v9;
  if (v7 && !v9 && v8 == 1)
  {
    id v11 = [v7 librarySpecificFetchOptions];
    [v11 setIncludeGuestAssets:1];
    if ([getPHPhotoLibraryClass() authorizationStatus] == 3)
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2050000000;
      id v12 = (void *)getPHAssetClass_softClass;
      uint64_t v24 = getPHAssetClass_softClass;
      if (!getPHAssetClass_softClass)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __getPHAssetClass_block_invoke;
        v20[3] = &unk_1E6116AD8;
        v20[4] = &v21;
        __getPHAssetClass_block_invoke((uint64_t)v20);
        id v12 = (void *)v22[3];
      }
      id v13 = v12;
      _Block_object_dispose(&v21, 8);
      v25[0] = v5;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      objc_super v15 = [v13 fetchAssetsWithLocalIdentifiers:v14 options:v11];

      if ([v15 count])
      {
        v16 = [v15 firstObject];
LABEL_18:

        goto LABEL_19;
      }
      v17 = AXMediaLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[AXMPhotoAssetData phAssetFromLocalIdentifier:photoLibraryURL:]((uint64_t)v5, v17);
      }
    }
    else
    {
      objc_super v15 = AXMediaLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        +[AXMPhotoAssetData phAssetFromLocalIdentifier:photoLibraryURL:](v15);
      }
    }
    v16 = 0;
    goto LABEL_18;
  }
  id v11 = AXMediaLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    +[AXMPhotoAssetData phAssetFromLocalIdentifier:photoLibraryURL:]((uint64_t)v6, (uint64_t)v10, v11);
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (void)updateAssetDetails
{
  v3 = [(AXMPhotoAssetData *)self photoLibraryURL];

  if (v3)
  {
    uint64_t v4 = [(AXMPhotoAssetData *)self assetLocalIdentifier];
    id v5 = [(AXMPhotoAssetData *)self photoLibraryURL];
    id v6 = +[AXMPhotoAssetData phAssetFromLocalIdentifier:v4 photoLibraryURL:v5];

    BOOL v7 = [v6 creationDate];
    [(AXMPhotoAssetData *)self setAssetCreationDate:v7];

    int v8 = [v6 mainFileURL];
    [(AXMPhotoAssetData *)self setAssetURL:v8];

    getPHImageManagerClass();
    if (objc_opt_respondsToSelector())
    {
      id v9 = [getPHImageManagerClass() defaultManager];
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2050000000;
      id v10 = (void *)getPHImageRequestOptionsClass_softClass;
      uint64_t v18 = getPHImageRequestOptionsClass_softClass;
      if (!getPHImageRequestOptionsClass_softClass)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __getPHImageRequestOptionsClass_block_invoke;
        v14[3] = &unk_1E6116AD8;
        v14[4] = &v15;
        __getPHImageRequestOptionsClass_block_invoke((uint64_t)v14);
        id v10 = (void *)v16[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v15, 8);
      id v12 = objc_alloc_init(v11);
      [v12 setResizeMode:2];
      [v12 setDeliveryMode:1];
      [v12 setSynchronous:1];
      objc_msgSend(v12, "setNetworkAccessAllowed:", -[AXMPhotoAssetData allowNetworkAccess](self, "allowNetworkAccess"));
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __39__AXMPhotoAssetData_updateAssetDetails__block_invoke;
      v13[3] = &unk_1E61175B0;
      v13[4] = self;
      [v9 requestImageDataAndOrientationForAsset:v6 options:v12 resultHandler:v13];
    }
  }
}

void __39__AXMPhotoAssetData_updateAssetDetails__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) setAssetImageData:a2];
    [*(id *)(a1 + 32) setAssetUTI:v7];
    [*(id *)(a1 + 32) setAssetOrientation:a4];
  }
  else
  {
    int v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __39__AXMPhotoAssetData_updateAssetDetails__block_invoke_cold_1(v8);
    }
  }
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (void)setAssetLocalIdentifier:(id)a3
{
}

- (NSData)assetImageData
{
  return self->_assetImageData;
}

- (void)setAssetImageData:(id)a3
{
}

- (NSString)assetUTI
{
  return self->_assetUTI;
}

- (void)setAssetUTI:(id)a3
{
}

- (NSDate)assetCreationDate
{
  return self->_assetCreationDate;
}

- (void)setAssetCreationDate:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
}

- (unsigned)assetOrientation
{
  return self->_assetOrientation;
}

- (void)setAssetOrientation:(unsigned int)a3
{
  self->_assetOrientation = a3;
}

- (BOOL)allowNetworkAccess
{
  return self->_allowNetworkAccess;
}

- (void)setAllowNetworkAccess:(BOOL)a3
{
  self->_allowNetworkAccess = a3;
}

- (NSURL)photoLibraryURL
{
  return self->_photoLibraryURL;
}

- (void)setPhotoLibraryURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_assetCreationDate, 0);
  objc_storeStrong((id *)&self->_assetUTI, 0);
  objc_storeStrong((id *)&self->_assetImageData, 0);

  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
}

+ (void)phAssetFromLocalIdentifier:(os_log_t)log photoLibraryURL:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1B57D5000, log, OS_LOG_TYPE_FAULT, "AXMPhotoAssetData: Could not fetch Photo Library using the photo library URL : %@ error: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)phAssetFromLocalIdentifier:(uint64_t)a1 photoLibraryURL:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "AXMPhotoAssetData: PHAsset for localIdentifier not found : %@", (uint8_t *)&v2, 0xCu);
}

+ (void)phAssetFromLocalIdentifier:(NSObject *)a1 photoLibraryURL:.cold.3(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = +[AXMPhotoAssetData _photoAuthorizationMessage:](AXMPhotoAssetData, "_photoAuthorizationMessage:", (int)[getPHPhotoLibraryClass() authorizationStatus]);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1B57D5000, a1, OS_LOG_TYPE_FAULT, "AXMPhotoAssetData: PhotoLibrary Authorization Failure - Image resource load will not be available : %@", (uint8_t *)&v3, 0xCu);
}

void __39__AXMPhotoAssetData_updateAssetDetails__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B57D5000, log, OS_LOG_TYPE_FAULT, "AXMPhotoAssetData: Unable to load image data", v1, 2u);
}

@end