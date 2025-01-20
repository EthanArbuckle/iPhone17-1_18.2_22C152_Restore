@interface PHAssetResource
+ (NSArray)assetResourcesForAsset:(PHAsset *)asset;
+ (NSArray)assetResourcesForLivePhoto:(PHLivePhoto *)livePhoto;
+ (id)_assetResourcesFromPLResources:(id)a3 includeMetadata:(BOOL)a4 mediaMetadataVirtualResources:(id)a5 asset:(id)a6 photoLibrary:(id)a7 assetHasAdjustments:(BOOL)a8 includeDerivatives:(BOOL)a9 includeAdjustmentOverflowDataBlob:(BOOL)a10;
+ (id)_resourcesForManagedAsset:(id)a3 includeDerivatives:(BOOL)a4;
+ (id)assetResourceForAsset:(id)a3 qualityClass:(id)a4;
+ (id)assetResourcesForAsset:(id)a3 includeDerivatives:(BOOL)a4;
+ (id)assetResourcesForAsset:(id)a3 includeDerivatives:(BOOL)a4 includeMetadata:(BOOL)a5;
+ (id)assetResourcesForAsset:(id)a3 includeDerivatives:(BOOL)a4 includeMetadata:(BOOL)a5 includeAdjustmentOverflowDataBlob:(BOOL)a6;
+ (id)assetResourcesForAssets:(id)a3 includeDerivatives:(BOOL)a4 includeMetadata:(BOOL)a5 includeAdjustmentOverflowDataBlob:(BOOL)a6;
+ (id)computeSyncMediaAnalysisPayloadDataForResourceURL:(id)a3;
- (BOOL)isCurrent;
- (BOOL)isInCloud;
- (BOOL)isLocallyAvailable;
- (BOOL)isTrashed;
- (NSDate)trashedDate;
- (NSInteger)pixelHeight;
- (NSInteger)pixelWidth;
- (NSManagedObjectID)assetObjectID;
- (NSString)assetLocalIdentifier;
- (NSString)originalFilename;
- (NSString)uniformTypeIdentifier;
- (NSURL)privateFileURL;
- (PHAsset)asset;
- (PHAssetResource)initWithResource:(id)a3 asset:(id)a4 hasAdjustments:(BOOL)a5 photoLibrary:(id)a6;
- (PHAssetResource)initWithType:(int64_t)a3 livePhoto:(id)a4;
- (PHAssetResourceType)type;
- (PHPhotoLibrary)photoLibrary;
- (PLPhotoLibraryPathManagerIdentifier)libraryID;
- (PLResourceIdentity)backingResourceIdentity;
- (id)debugDescription;
- (id)description;
- (id)privateFileLoader;
- (int64_t)analysisType;
- (unint64_t)cplResourceType;
- (unint64_t)fileSize;
- (unsigned)dataStoreClassID;
- (unsigned)orientation;
- (void)setCplResourceType:(unint64_t)a3;
- (void)setLocallyAvailable:(BOOL)a3;
- (void)setOrientation:(unsigned int)a3;
- (void)setPrivateFileURL:(id)a3;
@end

@implementation PHAssetResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryID, 0);
  objc_storeStrong((id *)&self->_assetObjectID, 0);
  objc_storeStrong((id *)&self->_backingResourceIdentity, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong(&self->_privateFileLoader, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_trashedDate, 0);

  objc_storeStrong((id *)&self->_privateFileURL, 0);
}

- (PLPhotoLibraryPathManagerIdentifier)libraryID
{
  return self->_libraryID;
}

- (BOOL)isCurrent
{
  return self->_current;
}

- (void)setPrivateFileURL:(id)a3
{
}

- (NSURL)privateFileURL
{
  return self->_privateFileURL;
}

- (void)setLocallyAvailable:(BOOL)a3
{
  self->_locallyAvailable = a3;
}

- (BOOL)isLocallyAvailable
{
  return self->_locallyAvailable;
}

- (void)setCplResourceType:(unint64_t)a3
{
  self->_cplResourceType = a3;
}

- (unint64_t)cplResourceType
{
  return self->_cplResourceType;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (unsigned)dataStoreClassID
{
  return self->_dataStoreClassID;
}

- (NSManagedObjectID)assetObjectID
{
  return self->_assetObjectID;
}

- (PLResourceIdentity)backingResourceIdentity
{
  return self->_backingResourceIdentity;
}

- (NSInteger)pixelHeight
{
  return self->_pixelHeight;
}

- (NSInteger)pixelWidth
{
  return self->_pixelWidth;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (PHAssetResourceType)type
{
  return self->_type;
}

- (PHAsset)asset
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PHAssetResource *)self photoLibrary];
  v4 = [v3 librarySpecificFetchOptions];

  v5 = [(PHAssetResource *)self assetLocalIdentifier];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7 = +[PHAsset fetchAssetsWithLocalIdentifiers:v6 options:v4];

  v8 = [v7 firstObject];

  return (PHAsset *)v8;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F8A7A8] prettyMultiLineDescriptionBuilderWithObject:self indent:0];
  v4 = _PHAssetResourceTypeDescription(self->_type);
  [v3 appendName:@"type" object:v4];

  [v3 appendName:@"uti" object:self->_uniformTypeIdentifier];
  [v3 appendName:@"filename" object:self->_originalFilename];
  [v3 appendName:@"asset" object:self->_assetLocalIdentifier];
  [v3 appendName:@"locallyAvailable" BOOLValue:self->_locallyAvailable];
  [v3 appendName:@"fileURL" object:self->_privateFileURL];
  [v3 appendName:@"width" integerValue:self->_pixelWidth];
  [v3 appendName:@"height" integerValue:self->_pixelHeight];
  objc_msgSend(v3, "appendName:unsignedIntegerValue:", @"fileSize", -[PHAssetResource fileSize](self, "fileSize"));
  int64_t v5 = [(PHAssetResource *)self analysisType];
  if ((unint64_t)(v5 - 1) > 2) {
    v6 = @"small";
  }
  else {
    v6 = off_1E5843638[v5 - 1];
  }
  v7 = v6;
  [v3 appendName:@"analysisType" object:v7];

  v8 = [MEMORY[0x1E4F59940] shortDescriptionForResourceType:self->_cplResourceType];
  [v3 appendName:@"cplResourceType" object:v8];

  [v3 appendName:@"isCurrent" BOOLValue:self->_current];
  [v3 appendName:@"isInCloud" BOOLValue:self->_inCloud];
  v9 = [v3 build];

  return v9;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = _PHAssetResourceTypeDescription(self->_type);
  int64_t v5 = [v3 stringWithFormat:@"type: %@, uti: %@, size: {%lu,%lu}", v4, self->_uniformTypeIdentifier, self->_pixelWidth, self->_pixelHeight];

  if (self->_originalFilename) {
    [v5 appendFormat:@", filename: %@", self->_originalFilename];
  }
  [v5 appendFormat:@", asset: %@", self->_assetLocalIdentifier];
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"<%@ %p> - %@", v8, self, v5];

  return v9;
}

- (PHAssetResource)initWithType:(int64_t)a3 livePhoto:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PHAssetResource.m", 579, @"Invalid parameter not satisfying: %@", @"livePhoto" object file lineNumber description];
  }
  v36.receiver = self;
  v36.super_class = (Class)PHAssetResource;
  v8 = [(PHAssetResource *)&v36 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    uint64_t v10 = [v7 assetLocalIdentifier];
    assetLocalIdentifier = v9->_assetLocalIdentifier;
    v9->_assetLocalIdentifier = (NSString *)v10;

    if (a3 == 9)
    {
      v20 = [v7 videoFileLoader];
      uint64_t v21 = [v20 copy];
      id privateFileLoader = v9->_privateFileLoader;
      v9->_id privateFileLoader = (id)v21;

      uint64_t v23 = [v7 videoURL];
      privateFileURL = v9->_privateFileURL;
      v9->_privateFileURL = (NSURL *)v23;

      v25 = [MEMORY[0x1E4F28CB8] defaultManager];
      v26 = [(NSURL *)v9->_privateFileURL path];
      v9->_locallyAvailable = [v25 fileExistsAtPath:v26];

      uint64_t v19 = [v7 videoTypeIdentifier];
    }
    else
    {
      if (a3 != 1)
      {
        uniformTypeIdentifier = [MEMORY[0x1E4F28B00] currentHandler];
        [uniformTypeIdentifier handleFailureInMethod:a2 object:v9 file:@"PHAssetResource.m" lineNumber:599 description:@"Live photo asset resources only supports 'Photo' and 'PairedVideo'"];
LABEL_10:

        v28 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v9->_uniformTypeIdentifier];
        v29 = [v28 preferredFilenameExtension];

        if (!v29)
        {
          v29 = [(NSURL *)v9->_privateFileURL pathExtension];
          if (!v29)
          {
            v30 = @"MOV";
            if (a3 == 1) {
              v30 = @"JPG";
            }
            v29 = v30;
          }
        }
        v31 = [v7 originalFilename];
        uint64_t v32 = [v31 stringByAppendingPathExtension:v29];
        originalFilename = v9->_originalFilename;
        v9->_originalFilename = (NSString *)v32;

        goto LABEL_16;
      }
      v12 = [v7 imageFileLoader];
      uint64_t v13 = [v12 copy];
      id v14 = v9->_privateFileLoader;
      v9->_id privateFileLoader = (id)v13;

      uint64_t v15 = [v7 imageURL];
      v16 = v9->_privateFileURL;
      v9->_privateFileURL = (NSURL *)v15;

      v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      v18 = [(NSURL *)v9->_privateFileURL path];
      v9->_locallyAvailable = [v17 fileExistsAtPath:v18];

      uint64_t v19 = [v7 imageTypeIdentifier];
    }
    uniformTypeIdentifier = v9->_uniformTypeIdentifier;
    v9->_uniformTypeIdentifier = (NSString *)v19;
    goto LABEL_10;
  }
LABEL_16:

  return v9;
}

- (PHAssetResource)initWithResource:(id)a3 asset:(id)a4 hasAdjustments:(BOOL)a5 photoLibrary:(id)a6
{
  BOOL v7 = a5;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v83 = a6;
  if (!v11)
  {
    v79 = [MEMORY[0x1E4F28B00] currentHandler];
    [v79 handleFailureInMethod:a2, self, @"PHAssetResource.m", 529, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_128:
    v80 = [MEMORY[0x1E4F28B00] currentHandler];
    [v80 handleFailureInMethod:a2, self, @"PHAssetResource.m", 530, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_128;
  }
LABEL_3:
  id v13 = v11;
  id v14 = v12;
  uint64_t v15 = &unk_1EEB25530;
  switch([v13 resourceType])
  {
    case 0u:
      if (_PHAssetResourceIsTopClassResource(v13))
      {
        uint64_t v15 = &unk_1EEB25620;
        switch([v13 version])
        {
          case 0u:
            goto LABEL_87;
          case 1u:
            uint64_t v15 = &unk_1EEB25650;
            goto LABEL_87;
          case 2u:
            uint64_t v15 = &unk_1EEB25638;
            goto LABEL_87;
          case 3u:
            v16 = PLPhotoKitGetLog();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              goto LABEL_85;
            }
            *(_WORD *)buf = 0;
            v17 = "'current' version non-derivative image is invalid, likely resource data error";
            goto LABEL_82;
          default:
            goto LABEL_9;
        }
      }
      v35 = [v13 dataStore];
      int v36 = [(id)objc_opt_class() storeClassID];

      if (v36 == 1)
      {
        uint64_t v15 = &unk_1EEB25668;
        goto LABEL_87;
      }
      if (objc_msgSend(MEMORY[0x1E4F8AB28], "isMasterThumbRecipeID:", objc_msgSend(v13, "recipeID")))
      {
        uint64_t v15 = &unk_1EEB25680;
        goto LABEL_87;
      }
      if ([v13 recipeID] == 65749) {
        goto LABEL_86;
      }
      if (v36 == 3) {
        goto LABEL_45;
      }
      if (v36)
      {
        v16 = PLPhotoKitGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_85;
        }
        *(_DWORD *)buf = 138412290;
        id v86 = v13;
        v17 = "Derivative image resource not supported by PHAssetResource: %@";
LABEL_20:
        v20 = v16;
        os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
LABEL_27:
        uint32_t v30 = 12;
LABEL_84:
        _os_log_impl(&dword_19B043000, v20, v21, v17, buf, v30);
        goto LABEL_85;
      }
      if ([v13 isCPLResource]) {
        goto LABEL_45;
      }
      int v37 = [v13 recipeID];
      if (v7)
      {
        int v38 = 65941;
      }
      else
      {
        if (v37 == 65943)
        {
LABEL_132:
          uint64_t v15 = &unk_1EEB25698;
          goto LABEL_87;
        }
        int v37 = [v13 recipeID];
        int v38 = 65951;
      }
      if (v37 == v38) {
        goto LABEL_132;
      }
      v16 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v86 = v13;
        v17 = "Derivative image resource not supported by PHAssetResource: %@";
        goto LABEL_20;
      }
LABEL_85:

LABEL_86:
      uint64_t v15 = 0;
LABEL_87:

      id v39 = v15;
      if (v39)
      {
        v84.receiver = self;
        v84.super_class = (Class)PHAssetResource;
        v40 = [(PHAssetResource *)&v84 init];
        if (!v40) {
          goto LABEL_118;
        }
        id v41 = a6;
        BOOL v82 = v7;
        v42 = [v13 uniformTypeIdentifier];
        v43 = [v42 identifier];

        v44 = [v14 uuid];
        uint64_t v45 = +[PHObject localIdentifierWithUUID:v44];
        assetLocalIdentifier = v40->_assetLocalIdentifier;
        v40->_assetLocalIdentifier = (NSString *)v45;

        objc_storeStrong((id *)&v40->_uniformTypeIdentifier, v43);
        uint64_t v47 = [v39 integerValue];
        v40->_type = v47;
        id v48 = v14;
        self = v43;
        v49 = 0;
        switch(v47)
        {
          case 1:
          case 2:
          case 3:
          case 19:
            uint64_t v50 = [v48 originalFilename];
LABEL_91:
            v49 = (__CFString *)v50;
            break;
          case 4:
          case 9:
            v51 = [v48 originalFilename];
            v52 = [v51 stringByDeletingPathExtension];

            _PHAssetResourceOriginalFilenameFromBasePlusUTI(v52, self);
            v49 = (__CFString *)objc_claimAutoreleasedReturnValue();

            break;
          case 5:
            v49 = @"FullSizeRender.jpg";
            break;
          case 6:
          case 10:
            v49 = @"FullSizeRender.mov";
            break;
          case 7:
            v49 = @"Adjustments.plist";
            break;
          case 8:
            v49 = @"PenultimateFullSizeRender.jpg";
            break;
          case 11:
          case 12:
            v49 = @"PenultimateFullSizeRender.mov";
            break;
          case 13:
          case 14:
            v53 = [v48 originalFilename];
            v54 = [v53 stringByDeletingPathExtension];
            [v54 stringByAppendingString:@"S"];
            v55 = v81 = self;

            uint64_t v56 = _PHAssetResourceOriginalFilenameFromBasePlusAsset(v55, v48, 0);
            goto LABEL_104;
          case 15:
            v57 = [v48 originalFilename];
            v58 = [v57 stringByDeletingPathExtension];
            [v58 stringByAppendingString:@"S"];
            v55 = v81 = self;

            uint64_t v56 = _PHAssetResourceOriginalFilenameFromBasePlusUTI(v55, v81);
            goto LABEL_104;
          case 16:
            v59 = [v48 originalFilename];
            v60 = [v59 stringByDeletingPathExtension];
            [v60 stringByAppendingString:@"O"];
            v55 = v81 = self;

            uint64_t v56 = [v55 stringByAppendingPathExtension:*MEMORY[0x1E4F8D2E8]];
LABEL_104:
            v49 = (__CFString *)v56;

            self = v81;
            break;
          case 17:
          case 18:
            break;
          case 20:
            v49 = @"Alchemist.heic";
            break;
          default:
            switch(v47)
            {
              case 'k':
                uint64_t v50 = _PHAssetResourceOriginalFilenameFromBasePlusAsset(@"DeferredPreview", v48, 1);
                goto LABEL_91;
              case 'l':
                v49 = @"Adjustments.data";
                break;
              case 'm':
                v49 = @"WallpaperComputeResources.dat";
                break;
              case 'n':
                v49 = @"AdjustmentsSecondary.data";
                break;
              case 'p':
                v49 = @"ComputeSyncWrapper.dat";
                break;
              case 'r':
                v49 = @"GenerativePlaygroundFaceResources.dat";
                break;
              default:
                goto LABEL_105;
            }
            break;
        }
LABEL_105:

        originalFilename = v40->_originalFilename;
        v40->_originalFilename = &v49->isa;

        objc_storeStrong((id *)&v40->_photoLibrary, v41);
        if ((int)[v13 localAvailability] >= 1)
        {
          v40->_locallyAvailable = 1;
          v62 = [v13 dataStoreKey];
          uint64_t v63 = [v62 fileURLForAssetID:v48];
          privateFileURL = v40->_privateFileURL;
          v40->_privateFileURL = (NSURL *)v63;
        }
        v40->_pixelWidth = [v13 orientedWidth];
        v40->_pixelHeight = [v13 orientedHeight];
        v40->_fileSize = [v13 dataLength];
        uint64_t v65 = [v13 trashedDate];
        trashedDate = v40->_trashedDate;
        v40->_trashedDate = (NSDate *)v65;

        v40->_trashed = [v13 trashedState] != 0;
        uint64_t v67 = [objc_alloc(MEMORY[0x1E4F8AB38]) initWithResource:v13];
        backingResourceIdentity = v40->_backingResourceIdentity;
        v40->_backingResourceIdentity = (PLResourceIdentity *)v67;

        uint64_t v69 = [v48 objectID];
        assetObjectID = v40->_assetObjectID;
        v40->_assetObjectID = (NSManagedObjectID *)v69;

        v40->_cplResourceType = [v13 cplType];
        v40->_orientation = [v13 orientation];
        v71 = [v13 dataStore];
        v40->_dataStoreClassID = [(id)objc_opt_class() storeClassID];

        int v72 = [v13 version];
        if (v82) {
          int v73 = 2;
        }
        else {
          int v73 = 0;
        }
        BOOL v74 = v72 == 3 || v73 == v72;
        char v75 = v74;
        v40->_current = v75;
        uint64_t v76 = [v48 libraryID];
        libraryID = v40->_libraryID;
        v40->_libraryID = (PLPhotoLibraryPathManagerIdentifier *)v76;

        v40->_inCloud = [v13 isInCloud];
      }
      else
      {
        v40 = 0;
      }

LABEL_118:
      return v40;
    case 1u:
LABEL_9:
      if (_PHAssetResourceIsTopClassResource(v13))
      {
        uint64_t v15 = &unk_1EEB256B0;
        switch([v13 version])
        {
          case 0u:
            goto LABEL_87;
          case 1u:
            uint64_t v15 = &unk_1EEB256E0;
            goto LABEL_87;
          case 2u:
            uint64_t v15 = &unk_1EEB256C8;
            goto LABEL_87;
          case 3u:
            v16 = PLPhotoKitGetLog();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              goto LABEL_85;
            }
            *(_WORD *)buf = 0;
            v17 = "'current' version video is invalid, likely resource data error";
            goto LABEL_82;
          default:
            goto LABEL_12;
        }
      }
      v33 = [v13 dataStore];
      int v34 = [(id)objc_opt_class() storeClassID];

      if (v34 == 3)
      {
        v16 = PLPhotoKitGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          goto LABEL_85;
        }
        *(_WORD *)buf = 0;
        v17 = "Unexpected derivative video resource in syndication store";
        goto LABEL_82;
      }
      if (!v34 && ([v13 isCPLResource] & 1) != 0) {
        goto LABEL_45;
      }
      v16 = PLPhotoKitGetLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_85;
      }
      *(_WORD *)buf = 0;
      v17 = "Unsupported derivative video type";
      v20 = v16;
      os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
      goto LABEL_83;
    case 2u:
      uint64_t v15 = &unk_1EEB25548;
      goto LABEL_87;
    case 3u:
      if (![v13 isDerivative])
      {
        uint64_t v15 = &unk_1EEB25578;
        switch([v13 version])
        {
          case 0u:
            goto LABEL_87;
          case 1u:
            uint64_t v15 = &unk_1EEB255A8;
            goto LABEL_87;
          case 2u:
            uint64_t v15 = &unk_1EEB25590;
            goto LABEL_87;
          case 3u:
            v16 = PLPhotoKitGetLog();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              goto LABEL_85;
            }
            *(_WORD *)buf = 0;
            v17 = "'current' version video complement is invalid, likely resource data error";
            goto LABEL_82;
          default:
            goto LABEL_50;
        }
      }
      v18 = [v13 dataStore];
      int v19 = [(id)objc_opt_class() storeClassID];

      if (v19 != 3)
      {
        if (!v19 && ([v13 isCPLResource] & 1) != 0)
        {
LABEL_45:
          uint64_t v15 = &unk_1EEB25560;
          goto LABEL_87;
        }
        v16 = PLPhotoKitGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_85;
        }
        *(_DWORD *)buf = 138412290;
        id v86 = v13;
        v17 = "Derivative video complement resource not supported by PHAssetResource: %@";
        goto LABEL_20;
      }
      v16 = PLPhotoKitGetLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      *(_WORD *)buf = 0;
      v17 = "Unexpected derivative video complement resource in syndication store";
      goto LABEL_82;
    case 4u:
LABEL_12:
      uint64_t v15 = &unk_1EEB256F8;
      goto LABEL_87;
    case 5u:
      v22 = [v13 uniformTypeIdentifier];
      uint64_t v23 = [v22 identifier];
      v24 = [MEMORY[0x1E4F8CDF8] supplementalResourceAAEType];
      [v24 identifier];
      v26 = BOOL v25 = v7;
      v27 = self;
      id v28 = a6;
      int v29 = [v23 isEqualToString:v26];

      BOOL v7 = v25;
      BOOL v74 = v29 == 0;
      a6 = v28;
      self = v27;
      if (v74) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = &unk_1EEB254E8;
      }
      goto LABEL_87;
    case 6u:
LABEL_28:
      uint64_t v15 = &unk_1EEB25518;
      goto LABEL_87;
    case 7u:
      goto LABEL_87;
    case 8u:
      uint64_t v15 = &unk_1EEB254E8;
      switch([v13 version])
      {
        case 0u:
          goto LABEL_87;
        case 1u:
        case 3u:
          v16 = PLPhotoKitGetLog();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_85;
          }
          *(_DWORD *)buf = 138412290;
          id v86 = v13;
          v17 = "Adjustment resource with unsupported version: %@";
          v20 = v16;
          os_log_type_t v21 = OS_LOG_TYPE_ERROR;
          goto LABEL_27;
        case 2u:
          uint64_t v15 = &unk_1EEB25500;
          goto LABEL_87;
        default:
          goto LABEL_28;
      }
    case 9u:
      int v31 = [v13 version];
      if (!v31)
      {
        uint64_t v15 = &unk_1EEB25728;
        goto LABEL_87;
      }
      if (v31 == 2)
      {
        uint64_t v15 = &unk_1EEB25740;
        goto LABEL_87;
      }
      v16 = PLPhotoKitGetLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      *(_WORD *)buf = 0;
      v17 = "Media metadata only valid for original or adjusted versions";
      goto LABEL_82;
    case 0xAu:
LABEL_50:
      if ([v14 isVideo]) {
        uint64_t v15 = &unk_1EEB255C0;
      }
      else {
        uint64_t v15 = &unk_1EEB255D8;
      }
      goto LABEL_87;
    case 0xBu:
      uint64_t v15 = &unk_1EEB255F0;
      goto LABEL_87;
    case 0xCu:
    case 0x1Fu:
      v16 = PLPhotoKitGetLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      *(_WORD *)buf = 0;
      v17 = "Unsupported resource type";
      goto LABEL_82;
    case 0xDu:
      if ([v14 isVideo])
      {
        uint64_t v15 = &unk_1EEB25608;
        goto LABEL_87;
      }
      v16 = PLPhotoKitGetLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      *(_WORD *)buf = 0;
      v17 = "Unsupported metadata for image type";
LABEL_82:
      v20 = v16;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
LABEL_83:
      uint32_t v30 = 2;
      goto LABEL_84;
    case 0xEu:
      unsigned int v32 = [v13 recipeID] - 327687;
      if (v32 >= 7) {
        goto LABEL_86;
      }
      uint64_t v15 = (void *)qword_1E5844940[v32];
      goto LABEL_87;
    case 0xFu:
      if ([v13 recipeID] == 66137) {
        uint64_t v15 = &unk_1EEB25710;
      }
      else {
        uint64_t v15 = 0;
      }
      goto LABEL_87;
    default:
      v16 = PLPhotoKitGetLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      *(_WORD *)buf = 0;
      v17 = "Asset resource type unknown";
      goto LABEL_82;
  }
}

+ (NSArray)assetResourcesForLivePhoto:(PHLivePhoto *)livePhoto
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (livePhoto)
  {
    v3 = livePhoto;
    v4 = [[PHAssetResource alloc] initWithType:1 livePhoto:v3];
    int64_t v5 = [[PHAssetResource alloc] initWithType:9 livePhoto:v3];

    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      BOOL v7 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Unable to create live photo asset resources", v10, 2u);
      }

      v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v11[0] = v4;
      v11[1] = v5;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v8;
}

+ (NSArray)assetResourcesForAsset:(PHAsset *)asset
{
  return (NSArray *)[a1 assetResourcesForAsset:asset includeDerivatives:0];
}

+ (id)_resourcesForManagedAsset:(id)a3 includeDerivatives:(BOOL)a4
{
  int64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  BOOL v7 = [v5 array];
  v8 = (void *)MEMORY[0x1E4F1C978];
  v9 = [v6 modernResources];
  uint64_t v10 = [v9 allObjects];
  id v11 = [v8 arrayWithArray:v10];

  id v12 = [v6 nonPersistedResources];
  id v13 = [v6 virtualResourcesThatReplaceMissingPersistedResources:v11];

  [v7 addObjectsFromArray:v11];
  [v7 addObjectsFromArray:v12];
  [v7 addObjectsFromArray:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__PHAssetResource__resourcesForManagedAsset_includeDerivatives___block_invoke;
  v16[3] = &__block_descriptor_33_e22_B16__0___PLResource__8l;
  BOOL v17 = a4;
  id v14 = objc_msgSend(v7, "_pl_filter:", v16);

  return v14;
}

BOOL __64__PHAssetResource__resourcesForManagedAsset_includeDerivatives___block_invoke(uint64_t a1, void *a2)
{
  return ![a2 isDerivative] || *(unsigned char *)(a1 + 32) != 0;
}

+ (id)_assetResourcesFromPLResources:(id)a3 includeMetadata:(BOOL)a4 mediaMetadataVirtualResources:(id)a5 asset:(id)a6 photoLibrary:(id)a7 assetHasAdjustments:(BOOL)a8 includeDerivatives:(BOOL)a9 includeAdjustmentOverflowDataBlob:(BOOL)a10
{
  BOOL v48 = a8;
  BOOL v13 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v44 = a5;
  id v47 = a6;
  id v46 = a7;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v64 count:16];
  id v45 = v16;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v56;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v56 != v19) {
          objc_enumerationMutation(v16);
        }
        os_log_type_t v21 = *(void **)(*((void *)&v55 + 1) + 8 * v20);
        int IsTopClassResource = _PHAssetResourceIsTopClassResource(v21);
        if ((a9 || IsTopClassResource)
          && (v13
           || [v21 resourceType] != 9
           && [v21 resourceType] != 13)
          && (a10 || [v21 resourceType] != 6)
          && (![v21 isDerivative] || objc_msgSend(v21, "version") || !v48))
        {
          if ([v21 version] != 2 || v48)
          {
            BOOL v25 = [[PHAssetResource alloc] initWithResource:v21 asset:v47 hasAdjustments:v48 photoLibrary:v46];
            p_super = &v25->super;
            if (v25)
            {
              if ([(PHAssetResource *)v25 type] == PHAssetResourceTypePhoto
                || [p_super type] == 2
                || [p_super type] == 3)
              {
                [v15 insertObject:p_super atIndex:0];
              }
              else
              {
                [v15 addObject:p_super];
              }
            }
          }
          else
          {
            p_super = PLPhotoKitGetLog();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
            {
              v24 = [v47 uuid];
              *(_DWORD *)buf = 138412290;
              uint64_t v60 = (uint64_t)v24;
              _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_DEFAULT, "Asset %@ with no adjustments has adjusted resource, resource will be ignored", buf, 0xCu);

              id v16 = v45;
            }
          }
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v26 = [v16 countByEnumeratingWithState:&v55 objects:v64 count:16];
      uint64_t v18 = v26;
    }
    while (v26);
  }

  v27 = v44;
  if (v13)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v28 = v44;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v52 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [[PHAssetResource alloc] initWithResource:*(void *)(*((void *)&v51 + 1) + 8 * i) asset:v47 hasAdjustments:v48 photoLibrary:v46];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __188__PHAssetResource__assetResourcesFromPLResources_includeMetadata_mediaMetadataVirtualResources_asset_photoLibrary_assetHasAdjustments_includeDerivatives_includeAdjustmentOverflowDataBlob___block_invoke;
          v49[3] = &unk_1E5844818;
          int v34 = v33;
          uint64_t v50 = v34;
          uint64_t v35 = [v15 indexOfObjectPassingTest:v49];
          if (v34)
          {
            if (v35 != 0x7FFFFFFFFFFFFFFFLL) {
              [v15 removeObjectAtIndex:v35];
            }
            [v15 addObject:v34];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v63 count:16];
      }
      while (v30);
    }

    v27 = v44;
    id v16 = v45;
  }
  int v36 = [v15 indexesOfObjectsPassingTest:&__block_literal_global_18684];
  if ((unint64_t)[v36 count] >= 2)
  {
    int v37 = [v15 objectsAtIndexes:v36];
    [v15 removeObjectsAtIndexes:v36];
    id v38 = (id)[v37 sortedArrayUsingComparator:&__block_literal_global_29];
    id v39 = PLImageManagerGetLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = [v36 count];
      id v41 = [v47 uuid];
      *(_DWORD *)buf = 134218242;
      uint64_t v60 = v40;
      __int16 v61 = 2114;
      v62 = v41;
      _os_log_impl(&dword_19B043000, v39, OS_LOG_TYPE_ERROR, "%ld original photo image resources found for asset %{public}@, not fatal, picking best and continuing", buf, 0x16u);

      id v16 = v45;
    }

    v42 = [v37 lastObject];
    [v15 addObject:v42];
  }

  return v15;
}

BOOL __188__PHAssetResource__assetResourcesFromPLResources_includeMetadata_mediaMetadataVirtualResources_asset_photoLibrary_assetHasAdjustments_includeDerivatives_includeAdjustmentOverflowDataBlob___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 type];
  return v3 == [*(id *)(a1 + 32) type];
}

uint64_t __188__PHAssetResource__assetResourcesFromPLResources_includeMetadata_mediaMetadataVirtualResources_asset_photoLibrary_assetHasAdjustments_includeDerivatives_includeAdjustmentOverflowDataBlob___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 backingResourceIdentity];
  int v7 = [v6 recipeID];
  v8 = [v5 backingResourceIdentity];
  int v9 = [v8 recipeID];

  if (v7 == v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = [v4 backingResourceIdentity];
    int v12 = [v11 recipeID];

    if (v12)
    {
      BOOL v13 = [v5 backingResourceIdentity];
      int v14 = [v13 recipeID];

      if (v14)
      {
        id v15 = [v4 backingResourceIdentity];
        unsigned int v16 = [v15 recipeID];
        uint64_t v17 = [v5 backingResourceIdentity];
        unsigned int v18 = [v17 recipeID];

        if (v16 > v18) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = -1;
        }
      }
      else
      {
        uint64_t v10 = -1;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
  }

  return v10;
}

BOOL __188__PHAssetResource__assetResourcesFromPLResources_includeMetadata_mediaMetadataVirtualResources_asset_photoLibrary_assetHasAdjustments_includeDerivatives_includeAdjustmentOverflowDataBlob___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)isInCloud
{
  return self->_inCloud;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (int64_t)analysisType
{
  if (!self->_current) {
    return 3;
  }
  int64_t type = self->_type;
  if (type > 101)
  {
    switch(type)
    {
      case 'f':
        return 0;
      case 'g':
        if (self->_dataStoreClassID == 3) {
          return 1;
        }
        unint64_t v5 = self->_cplResourceType - 1;
        if (v5 < 5) {
          return qword_19B2CCAE8[v5];
        }
        break;
      case 'k':
        return 2;
    }
    return 3;
  }
  if (type != 1 && type != 5) {
    return 3;
  }
  if (self->_dataStoreClassID == 3) {
    return 3;
  }
  else {
    return 2;
  }
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (NSDate)trashedDate
{
  return self->_trashedDate;
}

- (id)privateFileLoader
{
  v2 = _Block_copy(self->_privateFileLoader);

  return v2;
}

+ (id)computeSyncMediaAnalysisPayloadDataForResourceURL:(id)a3
{
  return (id)[MEMORY[0x1E4F8A680] mediaAnalysisPayloadDataForWrapperURL:a3];
}

+ (id)assetResourcesForAssets:(id)a3 includeDerivatives:(BOOL)a4 includeMetadata:(BOOL)a5 includeAdjustmentOverflowDataBlob:(BOOL)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  memset(v32, 0, sizeof(v32));
  if ([v11 countByEnumeratingWithState:v32 objects:v33 count:16]
    && ([**((id **)&v32[0] + 1) photoLibrary], (int v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v13 = v12;
    int v14 = [v12 photoLibrary];
    id v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke;
    v22[3] = &unk_1E5844920;
    id v23 = v11;
    id v24 = v14;
    SEL v27 = a2;
    id v28 = a1;
    id v25 = v13;
    BOOL v29 = a4;
    BOOL v30 = a5;
    BOOL v31 = a6;
    id v16 = v15;
    id v26 = v16;
    id v17 = v14;
    id v18 = v13;
    [v17 performBlockAndWait:v22];
    uint64_t v19 = v26;
    id v20 = v16;
  }
  else
  {
    id v20 = (id)MEMORY[0x1E4F1CC08];
  }

  return v20;
}

void __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v32 + 1) + 8 * v7) uuid];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v5);
  }

  int v9 = [MEMORY[0x1E4F8A950] fetchRequest];
  [v9 setFetchBatchSize:100];
  v38[0] = @"additionalAttributes";
  v38[1] = @"additionalAttributes.mediaMetadata";
  v38[2] = @"master";
  v38[3] = @"master.mediaMetadata";
  v38[4] = @"modernResources";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:5];
  [v9 setRelationshipKeyPathsForPrefetching:v10];

  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", v2];
  [v9 setPredicate:v11];

  int v12 = [*(id *)(a1 + 40) managedObjectContext];
  BOOL v13 = qos_class_self() == QOS_CLASS_USER_INITIATED || qos_class_self() == QOS_CLASS_USER_INTERACTIVE;
  id v14 = objc_alloc(MEMORY[0x1E4F8A7E8]);
  uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
  id v16 = [*(id *)(a1 + 48) pathManager];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke_2;
  v30[3] = &unk_1E58448D0;
  id v31 = *(id *)(a1 + 48);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke_3;
  v23[3] = &unk_1E58448F8;
  id v17 = *(id *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 72);
  id v24 = v17;
  uint64_t v27 = v18;
  __int16 v28 = *(_WORD *)(a1 + 80);
  id v25 = *(id *)(a1 + 48);
  char v29 = *(unsigned char *)(a1 + 82);
  id v26 = *(id *)(a1 + 56);
  uint64_t v19 = (void *)[v14 initWithName:v15 fetchRequest:v9 context:v12 pathManager:v16 concurrent:v13 refreshAllAfterSave:0 generateContextBlock:v30 didFetchObjectIDsBlock:0 processResultBlock:v23];

  id v22 = 0;
  LOBYTE(v15) = [v19 processObjectsWithError:&v22];
  id v20 = v22;
  if ((v15 & 1) == 0)
  {
    os_log_type_t v21 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v20;
      _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Error while enumerating assets: %@", buf, 0xCu);
    }
  }
}

id __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F8AAA0]);
  [v2 setRequiredState:6];
  [v2 setRefreshesAfterSave:0];
  [v2 setAutomaticallyPinToFirstFetch:0];
  [v2 setLibraryRole:0];
  id v3 = (void *)MEMORY[0x1E4F8AA78];
  objc_msgSend(NSString, "stringWithFormat:", @"%s-worker", "+[PHAssetResource(Private) assetResourcesForAssets:includeDerivatives:includeMetadata:includeAdjustmentOverflowDataBlob:]_block_invoke_2");
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 UTF8String];
  uint64_t v6 = [*(id *)(a1 + 32) photoLibraryBundle];
  id v7 = (id)[v3 newPhotoLibraryWithName:v5 loadedFromBundle:v6 options:v2 error:0];

  v8 = [v7 managedObjectContext];

  return v8;
}

void __121__PHAssetResource_Private__assetResourcesForAssets_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      id v11 = [v10 uuid];
      int v12 = [v4 uuid];
      char v13 = [v11 isEqual:v12];

      if (v13) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v10;

    if (!v14) {
      goto LABEL_18;
    }
    uint64_t v15 = [*(id *)(a1 + 56) _resourcesForManagedAsset:v4 includeDerivatives:*(unsigned __int8 *)(a1 + 64)];
    id v16 = *(void **)(a1 + 56);
    int v17 = *(unsigned __int8 *)(a1 + 65);
    if (*(unsigned char *)(a1 + 65))
    {
      uint64_t v18 = [v4 mediaMetadataVirtualResources];
    }
    else
    {
      uint64_t v18 = 0;
    }
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = [v4 hasAdjustments];
    BYTE1(v22) = *(unsigned char *)(a1 + 66);
    LOBYTE(v22) = *(unsigned char *)(a1 + 64);
    os_log_type_t v21 = objc_msgSend(v16, "_assetResourcesFromPLResources:includeMetadata:mediaMetadataVirtualResources:asset:photoLibrary:assetHasAdjustments:includeDerivatives:includeAdjustmentOverflowDataBlob:", v15, v17 != 0, v18, v4, v19, v20, v22);
    if (v17) {

    }
    [*(id *)(a1 + 48) setObject:v21 forKeyedSubscript:v14];
  }
  else
  {
LABEL_9:
    id v14 = v5;
  }

LABEL_18:
}

+ (id)assetResourcesForAsset:(id)a3 includeDerivatives:(BOOL)a4 includeMetadata:(BOOL)a5 includeAdjustmentOverflowDataBlob:(BOOL)a6
{
  id v10 = a3;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  int v12 = [v10 photoLibrary];
  char v13 = [v12 photoLibrary];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __120__PHAssetResource_Private__assetResourcesForAsset_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke;
  v20[3] = &unk_1E58448A8;
  id v21 = v10;
  id v22 = v13;
  BOOL v25 = a5;
  id v24 = a1;
  BOOL v26 = a4;
  BOOL v27 = a6;
  id v14 = v11;
  id v23 = v14;
  id v15 = v13;
  id v16 = v10;
  [v15 performBlockAndWait:v20];
  int v17 = v23;
  id v18 = v14;

  return v18;
}

void __120__PHAssetResource_Private__assetResourcesForAsset_includeDerivatives_includeMetadata_includeAdjustmentOverflowDataBlob___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = [MEMORY[0x1E4F8A950] entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [*(id *)(a1 + 32) objectID];
  uint64_t v7 = [v5 predicateWithFormat:@"self == %@", v6];
  [v4 setPredicate:v7];

  uint64_t v8 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v9 = [v8 executeFetchRequest:v4 error:0];
  id v10 = [v9 firstObject];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 40) managedObjectContext];
    objc_msgSend(v11, "refreshObject:mergeChanges:", v10, objc_msgSend(v10, "hasChanges"));

    uint64_t v12 = [*(id *)(a1 + 32) isWalrusEnabled];
    char v13 = (void *)MEMORY[0x1E4F8A950];
    id v14 = [v10 objectID];
    id v15 = [*(id *)(a1 + 40) managedObjectContext];
    id v26 = 0;
    id v16 = [v13 fetchResourcesForAssetWithObjectID:v14 inContext:v15 versions:0 includeVirtualResources:1 allowDerivatives:1 excludeDynamicCPLResources:v12 additionalPredicate:0 relationshipKeyPathsForPrefetching:0 error:&v26];
    id v17 = v26;

    if (*(unsigned char *)(a1 + 64))
    {
      id v18 = [v10 mediaMetadataVirtualResources];
      BOOL v19 = *(unsigned char *)(a1 + 64) != 0;
    }
    else
    {
      BOOL v19 = 0;
      id v18 = 0;
    }
    uint64_t v20 = *(void **)(a1 + 56);
    id v21 = *(void **)(a1 + 32);
    id v22 = [v21 photoLibrary];
    uint64_t v23 = [v10 hasAdjustments];
    LOWORD(v25) = *(_WORD *)(a1 + 65);
    id v24 = objc_msgSend(v20, "_assetResourcesFromPLResources:includeMetadata:mediaMetadataVirtualResources:asset:photoLibrary:assetHasAdjustments:includeDerivatives:includeAdjustmentOverflowDataBlob:", v16, v19, v18, v21, v22, v23, v25);

    if (v24) {
      [*(id *)(a1 + 48) addObjectsFromArray:v24];
    }
  }
}

+ (id)assetResourcesForAsset:(id)a3 includeDerivatives:(BOOL)a4 includeMetadata:(BOOL)a5
{
  return (id)[a1 assetResourcesForAsset:a3 includeDerivatives:a4 includeMetadata:a5 includeAdjustmentOverflowDataBlob:0];
}

+ (id)assetResourcesForAsset:(id)a3 includeDerivatives:(BOOL)a4
{
  return (id)[a1 assetResourcesForAsset:a3 includeDerivatives:a4 includeMetadata:0];
}

+ (id)assetResourceForAsset:(id)a3 qualityClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__18764;
  uint64_t v25 = __Block_byref_object_dispose__18765;
  id v26 = 0;
  uint64_t v8 = [v6 photoLibrary];
  uint64_t v9 = [v8 photoLibrary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__PHAssetResource_Private__assetResourceForAsset_qualityClass___block_invoke;
  v15[3] = &unk_1E5844880;
  id v10 = v6;
  id v16 = v10;
  id v11 = v7;
  id v17 = v11;
  BOOL v19 = &v21;
  id v20 = a1;
  id v12 = v8;
  id v18 = v12;
  [v9 performBlockAndWait:v15];

  id v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __63__PHAssetResource_Private__assetResourceForAsset_qualityClass___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = [v2 photoLibrary];
  uint64_t v4 = [v3 managedObjectContext];

  id v5 = (void *)MEMORY[0x1E4F8A950];
  id v6 = [*(id *)(a1 + 32) objectID];
  id v7 = [v5 assetWithObjectID:v6 inManagedObjectContext:v4];

  uint64_t v8 = [*(id *)(a1 + 32) isWalrusEnabled];
  uint64_t v9 = (void *)MEMORY[0x1E4F8A950];
  uint64_t v28 = v7;
  id v10 = [v7 objectID];
  id v33 = 0;
  BOOL v27 = (void *)v4;
  id v11 = [v9 fetchResourcesForAssetWithObjectID:v10 inContext:v4 versions:0 includeVirtualResources:1 allowDerivatives:1 excludeDynamicCPLResources:v8 additionalPredicate:0 relationshipKeyPathsForPrefetching:0 error:&v33];
  id v26 = v33;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v18 = [v17 dataStore];
        if ([*(id *)(a1 + 40) isTable])
        {
          int v19 = [v17 recipeID];
          id v20 = [*(id *)(a1 + 40) backingImageFormat];
          [v20 formatID];
          int v21 = PLTableThumbnailRecipeIDFromFormatID();

          if (v19 == v21) {
            goto LABEL_15;
          }
        }
        else if ([*(id *)(a1 + 40) isThumbnail])
        {
          if (objc_msgSend(MEMORY[0x1E4F8AB28], "isMasterThumbRecipeID:", objc_msgSend(v17, "recipeID"))) {
            goto LABEL_15;
          }
        }
        else if (PLDataStoreHasClassID())
        {
          if ([v17 isCPLResource])
          {
            uint64_t v22 = [v17 cplType];
            if (v22 == [*(id *)(a1 + 40) backingCPLResourceType])
            {
LABEL_15:
              uint64_t v23 = objc_msgSend(objc_alloc(*(Class *)(a1 + 64)), "initWithResource:asset:hasAdjustments:photoLibrary:", v17, *(void *)(a1 + 32), objc_msgSend(v28, "hasAdjustments"), *(void *)(a1 + 48));
              uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
              uint64_t v25 = *(void **)(v24 + 40);
              *(void *)(v24 + 40) = v23;
            }
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v14);
  }
}

@end