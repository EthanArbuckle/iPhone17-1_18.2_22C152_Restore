@interface ALAsset
+ (CGSize)largePreviewImageSizeForSize:(CGSize)a3;
- (ALAsset)initWithManagedAsset:(id)a3 library:(id)a4;
- (ALAsset)originalAsset;
- (ALAssetPrivate)internal;
- (ALAssetRepresentation)defaultRepresentation;
- (ALAssetRepresentation)representationForUTI:(NSString *)representationUTI;
- (BOOL)isDeletable;
- (BOOL)isEditable;
- (BOOL)isValid;
- (CGImageRef)aspectRatioThumbnail;
- (CGImageRef)thumbnail;
- (id)_newContentEditingOutputWithType:(int64_t)a3;
- (id)_typeAsString;
- (id)_uuid;
- (id)description;
- (id)valueForProperty:(NSString *)property;
- (void)dealloc;
- (void)requestDefaultRepresentation;
- (void)setImageData:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock;
- (void)setInternal:(id)a3;
- (void)setVideoAtPath:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock;
- (void)writeModifiedImageDataToSavedPhotosAlbum:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock;
- (void)writeModifiedVideoAtPathToSavedPhotosAlbum:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock;
@end

@implementation ALAsset

- (void)setInternal:(id)a3
{
}

- (ALAssetPrivate)internal
{
  return (ALAssetPrivate *)self->_internal;
}

- (void)requestDefaultRepresentation
{
  if ([(ALAsset *)self isValid])
  {
    v3 = [(ALAsset *)self internal];
    [(ALAssetPrivate *)v3 _performBlockAndWait:&__block_literal_global];
  }
}

uint64_t __39__ALAsset_requestDefaultRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = [a3 isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [a3 isCloudSharedAsset];
    if (result)
    {
      uint64_t result = [a3 cloudPlaceholderKind];
      if ((int)result <= 3)
      {
        v6 = objc_msgSend((id)objc_msgSend(a2, "assetsdClient"), "resourceClient");
        uint64_t v7 = [a3 objectID];
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __39__ALAsset_requestDefaultRepresentation__block_invoke_2;
        v8[3] = &unk_2642B58A8;
        v8[4] = a3;
        return [v6 downloadCloudSharedAsset:v7 withCloudPlaceholderKind:4 shouldPrioritize:0 shouldExtendTimer:0 completionHandler:v8];
      }
    }
  }
  return result;
}

void __39__ALAsset_requestDefaultRepresentation__block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  Log = PLBackendGetLog();
  v9 = Log;
  if (a2)
  {
    if (!os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    int v15 = 138412546;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = a3;
    v11 = "Downloaded derivative for cloud shared asset %@ to %@";
    v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(Log, OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = 138412546;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    uint64_t v18 = a4;
    v11 = "Failed downloading derivative for cloud shared asset %@ : %@";
    v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_217A1D000, v12, v13, v11, (uint8_t *)&v15, 0x16u);
}

- (void)setVideoAtPath:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  uint64_t v7 = (void *)[MEMORY[0x263F5DB78] sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__ALAsset_setVideoAtPath_completionBlock___block_invoke;
  v8[3] = &unk_2642B5860;
  v8[4] = self;
  void v8[5] = videoPathURL;
  v8[6] = completionBlock;
  v8[7] = v9;
  [v7 checkPhotosAccessAllowedWithScope:4 handler:v8];
  _Block_object_dispose(v9, 8);
}

uint64_t __42__ALAsset_setVideoAtPath_completionBlock___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t result = PLPhotosAccessAllowed();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && (uint64_t result = [*(id *)(a1 + 32) isEditable], result))
  {
    uint64_t result = [*(id *)(a1 + 32) _uuid];
    if (result)
    {
      v9[0] = [(id)getPHAssetClass() localIdentifierWithUUID:result];
      uint64_t result = objc_msgSend((id)objc_msgSend((id)getPHAssetClass(), "fetchAssetsWithLocalIdentifiers:options:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v9, 1), 0), "lastObject");
      if (result)
      {
        uint64_t v3 = result;
        v4 = (void *)[(id)getPHPhotoLibraryClass() sharedPhotoLibrary];
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __42__ALAsset_setVideoAtPath_completionBlock___block_invoke_2;
        v7[3] = &unk_2642B5810;
        v7[4] = v3;
        long long v8 = *(_OWORD *)(a1 + 32);
        v6[0] = MEMORY[0x263EF8330];
        v6[1] = 3221225472;
        v6[2] = __42__ALAsset_setVideoAtPath_completionBlock___block_invoke_3;
        v6[3] = &unk_2642B5838;
        v6[5] = *(void *)(a1 + 48);
        v6[4] = v8;
        return [v4 performChanges:v7 completionHandler:v6];
      }
      else if (*(void *)(a1 + 48))
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", @"ALAssetsLibraryErrorDomain", -3310);
        return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
  }
  else if (*(void *)(a1 + 48))
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", @"ALAssetsLibraryErrorDomain", -3300);
    v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v5();
  }
  return result;
}

void __42__ALAsset_setVideoAtPath_completionBlock___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[(id)getPHAssetChangeRequestClass() changeRequestForAsset:*(void *)(a1 + 32)];
  id v3 = (id)[*(id *)(a1 + 40) _newContentEditingOutputWithType:2];
  [v3 setRenderedContentURL:*(void *)(a1 + 48)];
  [v2 setContentEditingOutput:v3];
}

uint64_t __42__ALAsset_setVideoAtPath_completionBlock___block_invoke_3(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 40);
  if (v3)
  {
    uint64_t v4 = result;
    if (a2)
    {
      uint64_t v6 = [*(id *)(result + 32) valueForProperty:@"ALAssetPropertyAssetURL"];
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
      uint64_t v8 = v3;
      uint64_t v9 = a3;
    }
    else
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", @"ALAssetsLibraryErrorDomain", -3311);
      uint64_t v8 = *(void *)(v4 + 40);
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
      uint64_t v6 = 0;
    }
    return v7(v8, v6, v9);
  }
  return result;
}

- (void)setImageData:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  uint64_t v8 = objc_msgSend(MEMORY[0x263F5DB78], "sharedInstance", imageData, metadata);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __49__ALAsset_setImageData_metadata_completionBlock___block_invoke;
  void v9[3] = &unk_2642B5860;
  v9[4] = self;
  v9[5] = imageData;
  v9[6] = completionBlock;
  v9[7] = v10;
  [v8 checkPhotosAccessAllowedWithScope:4 handler:v9];
  _Block_object_dispose(v10, 8);
}

uint64_t __49__ALAsset_setImageData_metadata_completionBlock___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t result = PLPhotosAccessAllowed();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && (uint64_t result = [*(id *)(a1 + 32) isEditable], result))
  {
    uint64_t result = [*(id *)(a1 + 32) _uuid];
    if (result)
    {
      v9[0] = [(id)getPHAssetClass() localIdentifierWithUUID:result];
      uint64_t result = objc_msgSend((id)objc_msgSend((id)getPHAssetClass(), "fetchAssetsWithLocalIdentifiers:options:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v9, 1), 0), "lastObject");
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = (void *)[(id)getPHPhotoLibraryClass() sharedPhotoLibrary];
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __49__ALAsset_setImageData_metadata_completionBlock___block_invoke_2;
        v7[3] = &unk_2642B5810;
        v7[4] = v3;
        long long v8 = *(_OWORD *)(a1 + 32);
        v6[0] = MEMORY[0x263EF8330];
        v6[1] = 3221225472;
        v6[2] = __49__ALAsset_setImageData_metadata_completionBlock___block_invoke_3;
        v6[3] = &unk_2642B5838;
        v6[5] = *(void *)(a1 + 48);
        v6[4] = v8;
        return [v4 performChanges:v7 completionHandler:v6];
      }
      else if (*(void *)(a1 + 48))
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", @"ALAssetsLibraryErrorDomain", -3310);
        return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
  }
  else if (*(void *)(a1 + 48))
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", @"ALAssetsLibraryErrorDomain", -3300);
    v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v5();
  }
  return result;
}

void __49__ALAsset_setImageData_metadata_completionBlock___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[(id)getPHAssetChangeRequestClass() changeRequestForAsset:*(void *)(a1 + 32)];
  id v3 = (id)[*(id *)(a1 + 40) _newContentEditingOutputWithType:1];
  [v3 setRenderedJPEGData:*(void *)(a1 + 48)];
  [v2 setContentEditingOutput:v3];
}

uint64_t __49__ALAsset_setImageData_metadata_completionBlock___block_invoke_3(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 40);
  if (v3)
  {
    uint64_t v4 = result;
    if (a2)
    {
      uint64_t v6 = [*(id *)(result + 32) valueForProperty:@"ALAssetPropertyAssetURL"];
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
      uint64_t v8 = v3;
      uint64_t v9 = a3;
    }
    else
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", @"ALAssetsLibraryErrorDomain", -3311);
      uint64_t v8 = *(void *)(v4 + 40);
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
      uint64_t v6 = 0;
    }
    return v7(v8, v6, v9);
  }
  return result;
}

- (id)_newContentEditingOutputWithType:(int64_t)a3
{
  uint64_t v4 = [@"assets-library-unsupported-edit" dataUsingEncoding:4];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier");
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  uint64_t v6 = (objc_class *)getPHAdjustmentDataClass_softClass;
  uint64_t v22 = getPHAdjustmentDataClass_softClass;
  if (!getPHAdjustmentDataClass_softClass)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __getPHAdjustmentDataClass_block_invoke;
    int v15 = &unk_2642B58D0;
    uint64_t v16 = &v17;
    __getPHAdjustmentDataClass_block_invoke((uint64_t)&v12);
    uint64_t v6 = (objc_class *)v18[5];
  }
  _Block_object_dispose(&v17, 8);
  uint64_t v7 = (void *)[[v6 alloc] initWithFormatIdentifier:v5 formatVersion:@"0" data:v4];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  uint64_t v8 = (objc_class *)getPHContentEditingOutputClass_softClass;
  uint64_t v22 = getPHContentEditingOutputClass_softClass;
  if (!getPHContentEditingOutputClass_softClass)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __getPHContentEditingOutputClass_block_invoke;
    int v15 = &unk_2642B58D0;
    uint64_t v16 = &v17;
    __getPHContentEditingOutputClass_block_invoke((uint64_t)&v12);
    uint64_t v8 = (objc_class *)v18[5];
  }
  _Block_object_dispose(&v17, 8);
  id v9 = [v8 alloc];
  char v10 = objc_msgSend(v9, "initWithAdjustmentBaseVersion:mediaType:appropriateForURL:", 0, a3, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleURL"));
  [v10 setAdjustmentData:v7];

  return v10;
}

- (BOOL)isDeletable
{
  v2 = [(ALAsset *)self internal];

  return [(ALAssetPrivate *)v2 isDeletable];
}

- (BOOL)isEditable
{
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier");
  uint64_t v4 = v3;
  if (v3 && [v3 length])
  {
    uint64_t v5 = [(ALAsset *)self internal];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __21__ALAsset_isEditable__block_invoke;
    v8[3] = &unk_2642B57C0;
    v8[4] = v4;
    void v8[5] = &v9;
    [(ALAssetPrivate *)v5 _performBlockAndWait:v8];
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __21__ALAsset_isEditable__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [a3 importedByBundleIdentifier];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t result = [(id)result length];
      if (result)
      {
        uint64_t result = [*(id *)(a1 + 32) isEqualToString:v6];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
      }
    }
  }
  return result;
}

- (ALAsset)originalAsset
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy_;
  char v10 = __Block_byref_object_dispose_;
  uint64_t v11 = 0;
  v2 = [(ALAsset *)self internal];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __24__ALAsset_originalAsset__block_invoke;
  v5[3] = &unk_2642B57C0;
  v5[4] = v2;
  v5[5] = &v6;
  [(ALAssetPrivate *)v2 _performBlockAndWait:v5];
  uint64_t v3 = (ALAsset *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

ALAsset *__24__ALAsset_originalAsset__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = (ALAsset *)[a3 isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = (ALAsset *)[a3 originalAsset];
    if (result)
    {
      uint64_t result = -[ALAsset initWithManagedAsset:library:]([ALAsset alloc], "initWithManagedAsset:library:", result, [*(id *)(a1 + 32) library]);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    }
  }
  return result;
}

- (void)writeModifiedVideoAtPathToSavedPhotosAlbum:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock
{
  id v7 = [(ALAsset *)self _uuid];
  if (v7)
  {
    id v8 = v7;
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v9 setObject:v8 forKey:*MEMORY[0x263F5DD10]];
    [(ALAssetsLibrary *)[(ALAssetPrivate *)[(ALAsset *)self internal] library] _writeVideoAtPathToSavedPhotosAlbum:videoPathURL internalProperties:v9 completionBlock:completionBlock];
  }
}

- (void)writeModifiedImageDataToSavedPhotosAlbum:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
  id v9 = [(ALAsset *)self _uuid];
  if (v9)
  {
    id v10 = v9;
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v11 setObject:v10 forKey:*MEMORY[0x263F5DD10]];
    [(ALAssetsLibrary *)[(ALAssetPrivate *)[(ALAsset *)self internal] library] _writeImageToSavedPhotosAlbum:0 orientation:0 imageData:imageData metadata:metadata internalProperties:v11 completionBlock:completionBlock];
  }
}

- (CGImageRef)aspectRatioThumbnail
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000;
  id v11 = __Block_byref_object_copy_;
  char v12 = __Block_byref_object_dispose_;
  uint64_t v13 = 0;
  v2 = [(ALAsset *)self internal];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__ALAsset_aspectRatioThumbnail__block_invoke;
  v7[3] = &unk_2642B5ED8;
  v7[4] = &v8;
  [(ALAssetPrivate *)v2 _performBlockAndWait:v7];
  uint64_t v3 = (void *)v9[5];
  if (v3)
  {
    uint64_t v4 = (CGImage *)[v3 CGImage];
    id v5 = (id)v9[5];
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __31__ALAsset_aspectRatioThumbnail__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 isDeleted];
  if ((result & 1) == 0)
  {
    if (![a3 isCloudSharedAsset]
      || (uint64_t result = [a3 cloudPlaceholderKind], (int)result >= 3))
    {
      PLPushPhotoLibraryClient();
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = (id)objc_msgSend(a3, "imageWithFormat:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F5DB58], "defaultFormatChooser"), "masterThumbnailFormat"), "formatID"));
      return MEMORY[0x270F53768]();
    }
  }
  return result;
}

- (CGImageRef)thumbnail
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3052000000;
  id v11 = __Block_byref_object_copy_;
  char v12 = __Block_byref_object_dispose_;
  uint64_t v13 = 0;
  v2 = [(ALAsset *)self internal];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __20__ALAsset_thumbnail__block_invoke;
  v7[3] = &unk_2642B5ED8;
  v7[4] = &v8;
  [(ALAssetPrivate *)v2 _performBlockAndWait:v7];
  uint64_t v3 = (void *)v9[5];
  if (v3)
  {
    uint64_t v4 = (CGImage *)[v3 CGImage];
    id v5 = (id)v9[5];
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __20__ALAsset_thumbnail__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 isDeleted];
  if ((result & 1) == 0)
  {
    if (![a3 isCloudSharedAsset]
      || (uint64_t result = [a3 cloudPlaceholderKind], (int)result >= 3))
    {
      PLPushPhotoLibraryClient();
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = (id)objc_msgSend(a3, "imageWithFormat:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F5DB58], "defaultFormatChooser"), "indexSheetUnbakedFormat"), "formatID"));
      return MEMORY[0x270F53768]();
    }
  }
  return result;
}

- (ALAssetRepresentation)representationForUTI:(NSString *)representationUTI
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  char v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  uint64_t v14 = 0;
  if ([(ALAsset *)self isValid])
  {
    id v5 = [(ALAsset *)self internal];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __32__ALAsset_representationForUTI___block_invoke;
    v8[3] = &unk_2642B57E8;
    void v8[5] = v5;
    void v8[6] = &v9;
    v8[4] = representationUTI;
    [(ALAssetPrivate *)v5 _performBlockAndWait:v8];
  }
  uint64_t v6 = (ALAssetRepresentation *)(id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __32__ALAsset_representationForUTI___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t result = [a3 isDeleted];
  if ((result & 1) == 0)
  {
    if (![a3 isCloudSharedAsset]
      || (uint64_t result = [a3 cloudPlaceholderKind], (int)result >= 4))
    {
      if (objc_msgSend((id)objc_msgSend(a3, "uniformTypeIdentifier"), "isEqualToString:", *(void *)(a1 + 32)))
      {
        uint64_t v6 = (void *)[a3 fileExtension];
        id v7 = 0;
      }
      else
      {
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        uint64_t v8 = objc_msgSend(a3, "sortedSidecarFiles", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
              if (objc_msgSend((id)objc_msgSend(v7, "uniformTypeIdentifier"), "isEqualToString:", *(void *)(a1 + 32)))
              {
                uint64_t v6 = objc_msgSend((id)objc_msgSend(v7, "originalFilename"), "pathExtension");
                goto LABEL_17;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
            id v7 = 0;
            uint64_t v6 = 0;
            if (v10) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v7 = 0;
          uint64_t v6 = 0;
        }
      }
LABEL_17:
      uint64_t result = [v6 length];
      if (result)
      {
        uint64_t result = -[ALAssetRepresentation initWithManagedAsset:sidecar:extension:library:]([ALAssetRepresentation alloc], "initWithManagedAsset:sidecar:extension:library:", a3, v7, v6, [*(id *)(a1 + 40) library]);
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
      }
    }
  }
  return result;
}

- (ALAssetRepresentation)defaultRepresentation
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0;
  if ([(ALAsset *)self isValid])
  {
    uint64_t v3 = [(ALAsset *)self internal];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __32__ALAsset_defaultRepresentation__block_invoke;
    v6[3] = &unk_2642B57C0;
    v6[4] = v3;
    v6[5] = &v7;
    [(ALAssetPrivate *)v3 _performBlockAndWait:v6];
  }
  uint64_t v4 = (ALAssetRepresentation *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

ALAssetRepresentation *__32__ALAsset_defaultRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = (ALAssetRepresentation *)[a3 isDeleted];
  if ((result & 1) == 0)
  {
    if (![a3 isCloudSharedAsset]
      || (uint64_t result = (ALAssetRepresentation *)[a3 cloudPlaceholderKind], (int)result >= 4))
    {
      uint64_t result = -[ALAssetRepresentation initWithManagedAsset:sidecar:extension:library:]([ALAssetRepresentation alloc], "initWithManagedAsset:sidecar:extension:library:", a3, 0, [a3 fileExtension], objc_msgSend(*(id *)(a1 + 32), "library"));
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    }
  }
  return result;
}

- (id)valueForProperty:(NSString *)property
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy_;
  long long v13 = __Block_byref_object_dispose_;
  uint64_t v14 = 0;
  if ([(ALAsset *)self isValid])
  {
    id v5 = [(ALAsset *)self internal];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__ALAsset_valueForProperty___block_invoke;
    v8[3] = &unk_2642B57C0;
    v8[4] = property;
    void v8[5] = &v9;
    [(ALAssetPrivate *)v5 _performBlockAndWait:v8];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __28__ALAsset_valueForProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([a3 isDeleted])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetPropertyType"])
  {
    int v5 = [a3 kind];
    if (v5 == 1)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v7 = @"ALAssetTypeVideo";
    }
    else
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v5) {
        uint64_t v7 = @"ALAssetTypeUnknown";
      }
      else {
        uint64_t v7 = @"ALAssetTypePhoto";
      }
    }
    goto LABEL_39;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetPropertyLocation"])
  {
    uint64_t v8 = [a3 location];
LABEL_37:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v8;
    return *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetPropertyDuration"])
  {
    if ([a3 kind] == 1)
    {
      uint64_t v9 = NSNumber;
      [a3 duration];
      uint64_t v8 = objc_msgSend(v9, "numberWithDouble:");
      goto LABEL_37;
    }
LABEL_38:
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = @"ALErrorInvalidProperty";
LABEL_39:
    *(void *)(v6 + 40) = v7;
    return *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetPropertyOrientation"])
  {
    [a3 orientation];
    uint64_t v8 = [NSNumber numberWithInt:PLImageOrientationFromExifOrientation()];
    goto LABEL_37;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetPropertyDate"])
  {
    uint64_t v8 = [a3 dateCreated];
    goto LABEL_37;
  }
  if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetPropertyRepresentations"])
  {
    uint64_t v8 = [a3 allUniformTypeIdentifiers];
    goto LABEL_37;
  }
  if (![*(id *)(a1 + 32) isEqualToString:@"ALAssetPropertyURLs"])
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetPropertyAssetURL"])
    {
      uint64_t v8 = [a3 assetURL];
      goto LABEL_37;
    }
    if ([*(id *)(a1 + 32) isEqualToString:@"ALAssetPropertyEditorBundleID"])
    {
      uint64_t v8 = [a3 editorBundleID];
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  uint64_t v10 = (void *)[a3 sortedSidecarFiles];
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v12 = [a3 uniformTypeIdentifier];
  if (v12) {
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(a3, "assetURL"), v12);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v18 = [v17 uniformTypeIdentifier];
        if (v18) {
          objc_msgSend(v11, "setObject:forKey:", objc_msgSend(a3, "assetURLForSidecarFile:", v17), v18);
        }
      }
      uint64_t v14 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [NSDictionary dictionaryWithDictionary:v11];

  return *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
}

- (BOOL)isValid
{
  v2 = [(ALAsset *)self internal];

  return [(ALAssetPrivate *)v2 isValid];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ALAsset - Type:%@, URLs:%@", -[ALAsset _typeAsString](self, "_typeAsString"), -[ALAsset valueForProperty:](self, "valueForProperty:", @"ALAssetPropertyAssetURL"];
}

- (id)_uuid
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  uint64_t v11 = 0;
  v2 = [(ALAsset *)self internal];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __16__ALAsset__uuid__block_invoke;
  v5[3] = &unk_2642B5ED8;
  v5[4] = &v6;
  [(ALAssetPrivate *)v2 _performBlockAndWait:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __16__ALAsset__uuid__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "uuid"), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (id)_typeAsString
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  __int16 v10 = 3;
  v2 = [(ALAsset *)self internal];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __24__ALAsset__typeAsString__block_invoke;
  v6[3] = &unk_2642B5ED8;
  v6[4] = &v7;
  [(ALAssetPrivate *)v2 _performBlockAndWait:v6];
  id v3 = @"Unknown";
  if (*((_WORD *)v8 + 12) == 1) {
    id v3 = @"Video";
  }
  if (*((_WORD *)v8 + 12)) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"Photo";
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __24__ALAsset__typeAsString__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 isDeleted];
  if ((result & 1) == 0)
  {
    uint64_t result = [a3 kind];
    *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

- (void)dealloc
{
  [(ALAsset *)self setInternal:0];
  v3.receiver = self;
  v3.super_class = (Class)ALAsset;
  [(ALAsset *)&v3 dealloc];
}

- (ALAsset)initWithManagedAsset:(id)a3 library:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ALAsset;
  uint64_t v6 = [(ALAsset *)&v9 init];
  if (v6)
  {
    uint64_t v7 = [[ALAssetPrivate alloc] initWithManagedAsset:a3 library:a4];
    [(ALAsset *)v6 setInternal:v7];
  }
  return v6;
}

+ (CGSize)largePreviewImageSizeForSize:(CGSize)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F5DB58], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice");
  [v3 fullSizeMinShortSide];
  [v3 fullSizeDesiredLongSide];
  [v3 fullSizeMaxLongSide];

  JUMPOUT(0x21D4531B0);
}

@end