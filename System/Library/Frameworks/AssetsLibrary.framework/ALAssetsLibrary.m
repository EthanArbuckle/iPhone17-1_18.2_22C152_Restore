@interface ALAssetsLibrary
+ (ALAuthorizationStatus)authorizationStatus;
+ (BOOL)_linkedBefore7;
+ (CGImage)_aspectRatioThumbnailForAssetURL:(id)a3;
+ (CGImage)_thumbnailForAssetURL:(id)a3;
+ (id)_albumsInLibrary:(id)a3;
+ (id)_exportSessionForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5;
+ (id)_exportSessionForVideoURL:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5;
+ (id)_filePathForVideoURL:(id)a3 outMetadata:(id *)a4;
+ (id)_library;
+ (id)_playerItemForVideoFilePath:(id)a3 metadata:(id)a4;
+ (id)_playerItemForVideoURL:(id)a3 fallbackFilePath:(id)a4;
+ (int64_t)_estimatedOutputFileLengthForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6;
+ (int64_t)_estimatedOutputFileLengthForVideoURL:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6;
+ (void)disableSharedPhotoStreamsSupport;
- (ALAssetsLibrary)init;
- (ALAssetsLibraryPrivate)internal;
- (BOOL)isValid;
- (BOOL)videoAtPathIsCompatibleWithSavedPhotosAlbum:(NSURL *)videoPathURL;
- (id)_copyGroupForURL:(id)a3;
- (id)publicErrorForPrivateDomain:(id)a3 withPrivateCode:(int64_t)a4;
- (id)publicErrorFromPrivateError:(id)a3;
- (void)_addGroupForAlbum:(id)a3 ofType:(unint64_t)a4 toArray:(id)a5;
- (void)_performBlock:(id)a3;
- (void)_performBlockAndWait:(id)a3;
- (void)_setBundlePropertiesOnPropertiesDictionary:(id)a3;
- (void)_writeImageToSavedPhotosAlbum:(CGImage *)a3 orientation:(int64_t)a4 imageData:(id)a5 metadata:(id)a6 internalProperties:(id)a7 completionBlock:(id)a8;
- (void)_writeVideoAtPathToSavedPhotosAlbum:(id)a3 internalProperties:(id)a4 completionBlock:(id)a5;
- (void)addAssetsGroupAlbumWithName:(NSString *)name resultBlock:(ALAssetsLibraryGroupResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock;
- (void)assetForURL:(NSURL *)assetURL resultBlock:(ALAssetsLibraryAssetForURLResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock;
- (void)checkPhotosAccessAllowedWithScope:(int64_t)a3 handler:(id)a4;
- (void)dealloc;
- (void)enumerateGroupsWithTypes:(ALAssetsGroupType)types usingBlock:(ALAssetsLibraryGroupsEnumerationResultsBlock)enumerationBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock;
- (void)groupForURL:(NSURL *)groupURL resultBlock:(ALAssetsLibraryGroupResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock;
- (void)registerAlbum:(id)a3 assetGroupPrivate:(id)a4;
- (void)setInternal:(id)a3;
- (void)writeImageDataToSavedPhotosAlbum:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock;
- (void)writeImageToSavedPhotosAlbum:(CGImageRef)imageRef metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock;
- (void)writeImageToSavedPhotosAlbum:(CGImageRef)imageRef orientation:(ALAssetOrientation)orientation completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock;
- (void)writeVideoAtPathToSavedPhotosAlbum:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock;
@end

@implementation ALAssetsLibrary

- (void)setInternal:(id)a3
{
}

- (ALAssetsLibraryPrivate)internal
{
  return (ALAssetsLibraryPrivate *)self->_internal;
}

- (void)addAssetsGroupAlbumWithName:(NSString *)name resultBlock:(ALAssetsLibraryGroupResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock
{
  objc_sync_enter(self);
  [(ALAssetsLibraryPrivate *)[(ALAssetsLibrary *)self internal] setIsValid:1];
  if (pthread_main_np()) {
    dispatch_queue_global_t global_queue = (dispatch_queue_global_t)MEMORY[0x263EF83A0];
  }
  else {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke;
  v10[3] = &unk_2642B5E88;
  v10[4] = global_queue;
  v10[5] = self;
  v10[7] = failureBlock;
  v10[8] = resultBlock;
  v10[6] = name;
  [(ALAssetsLibrary *)self checkPhotosAccessAllowedWithScope:4 handler:v10];
  objc_sync_exit(self);
}

void __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4 = PLPhotosAccessAllowed();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_2;
  block[3] = &unk_2642B5E60;
  char v12 = v4;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = a2;
  int8x16_t v8 = vextq_s8(v5, v5, 8uLL);
  long long v9 = v6;
  dispatch_async((dispatch_queue_t)v5.i64[0], block);
}

uint64_t __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 80))
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_3;
    v6[3] = &unk_2642B5E38;
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "internal", MEMORY[0x263EF8330], 3221225472, __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_3, &unk_2642B5E38, vextq_s8(*(int8x16_t *)(result + 32), *(int8x16_t *)(result + 32), 8uLL), vextq_s8(*(int8x16_t *)(result + 56), *(int8x16_t *)(result + 56), 8uLL)), "photoLibrary"), "assetsdClient"), "resourceClient"), "addGroupWithName:completionHandler:", *(void *)(result + 48), v6);
  }
  else if (*(void *)(result + 56))
  {
    uint64_t v2 = *(void *)(result + 72);
    v3 = *(void **)(result + 32);
    if (v2 == 3) {
      uint64_t v4 = -3300;
    }
    else {
      uint64_t v4 = -3311;
    }
    [v3 publicErrorForPrivateDomain:@"ALAssetsLibraryErrorDomain" withPrivateCode:v4];
    int8x16_t v5 = *(uint64_t (**)(void))(*(void *)(v1 + 56) + 16);
    return v5();
  }
  return result;
}

void __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_3(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_4;
  v6[3] = &unk_2642B5E10;
  char v8 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = a3;
  v6[5] = v5;
  v6[6] = a4;
  long long v7 = *(_OWORD *)(a1 + 48);
  dispatch_async(v4, v6);
}

uint64_t __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t result = *(void *)(a1 + 56);
    if (!result) {
      return result;
    }
    v3 = *(uint64_t (**)(void))(result + 16);
LABEL_4:
    return v3();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  if (!v5)
  {
    [v4 publicErrorFromPrivateError:*(void *)(a1 + 48)];
    uint64_t result = *(void *)(a1 + 64);
    if (!result) {
      return result;
    }
    v3 = *(uint64_t (**)(void))(result + 16);
    goto LABEL_4;
  }
  objc_msgSend(v4, "_copyGroupForURL:");
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }

  return MEMORY[0x270F9A758]();
}

- (void)groupForURL:(NSURL *)groupURL resultBlock:(ALAssetsLibraryGroupResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock
{
  objc_sync_enter(self);
  [(ALAssetsLibraryPrivate *)[(ALAssetsLibrary *)self internal] setIsValid:1];
  if (pthread_main_np()) {
    dispatch_queue_global_t global_queue = (dispatch_queue_global_t)MEMORY[0x263EF83A0];
  }
  else {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__ALAssetsLibrary_groupForURL_resultBlock_failureBlock___block_invoke;
  v10[3] = &unk_2642B5E88;
  v10[4] = global_queue;
  v10[5] = self;
  v10[6] = groupURL;
  v10[7] = failureBlock;
  v10[8] = resultBlock;
  [(ALAssetsLibrary *)self checkPhotosAccessAllowedWithScope:2 handler:v10];
  objc_sync_exit(self);
}

void __56__ALAssetsLibrary_groupForURL_resultBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4 = PLPhotosAccessAllowed();
  uint64_t v5 = *(NSObject **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__ALAssetsLibrary_groupForURL_resultBlock_failureBlock___block_invoke_2;
  v7[3] = &unk_2642B5DC0;
  char v11 = v4;
  uint64_t v10 = a2;
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 40);
  long long v9 = v6;
  dispatch_async(v5, v7);
}

uint64_t __56__ALAssetsLibrary_groupForURL_resultBlock_failureBlock___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 72))
  {
    [*(id *)(result + 32) _copyGroupForURL:*(void *)(result + 40)];
    uint64_t v2 = *(void *)(v1 + 56);
    if (v2) {
      (*(void (**)(void))(v2 + 16))();
    }
    return MEMORY[0x270F9A758]();
  }
  else if (*(void *)(result + 48))
  {
    uint64_t v3 = *(void *)(result + 64);
    char v4 = *(void **)(result + 32);
    if (v3 == 3) {
      uint64_t v5 = -3310;
    }
    else {
      uint64_t v5 = -3311;
    }
    [v4 publicErrorForPrivateDomain:@"ALAssetsLibraryErrorDomain" withPrivateCode:v5];
    long long v6 = *(uint64_t (**)(void))(*(void *)(v1 + 48) + 16);
    return v6();
  }
  return result;
}

- (id)_copyGroupForURL:(id)a3
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3052000000;
  long long v9 = __Block_byref_object_copy__140;
  uint64_t v10 = __Block_byref_object_dispose__141;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__ALAssetsLibrary__copyGroupForURL___block_invoke;
  v5[3] = &unk_2642B5DE8;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = &v6;
  [(ALAssetsLibrary *)self _performBlockAndWait:v5];
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__ALAssetsLibrary__copyGroupForURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "internal"), "photoLibrary"), "albumFromGroupURL:", *(void *)(a1 + 40));
  uint64_t result = [v2 kindValue];
  if (result != 1500)
  {
    if (!v2) {
      return result;
    }
LABEL_6:
    int v4 = [v2 kindValue];
    uint64_t v5 = 2;
    if (v4 > 1504)
    {
      if (v4 <= 1551)
      {
        if (v4 != 1505)
        {
          if (v4 != 1551)
          {
LABEL_23:
            uint64_t result = [[ALAssetsGroup alloc] initWithPhotoAlbum:v2 library:*(void *)(a1 + 32) type:v5];
            *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
            return result;
          }
LABEL_15:
          uint64_t v5 = 4;
          goto LABEL_23;
        }
LABEL_18:
        uint64_t v5 = 32;
        goto LABEL_23;
      }
      if (v4 != 1613)
      {
        if (v4 == 1552) {
          uint64_t v5 = 1;
        }
        goto LABEL_23;
      }
    }
    else
    {
      if (v4 <= 999)
      {
        if (v4 != 12)
        {
          if (v4 == 15) {
            uint64_t v5 = 8;
          }
          goto LABEL_23;
        }
        goto LABEL_15;
      }
      if (v4 != 1000)
      {
        if (v4 != 1500) {
          goto LABEL_23;
        }
        goto LABEL_18;
      }
    }
    uint64_t v5 = 16;
    goto LABEL_23;
  }
  uint64_t result = PLIsCloudPhotoLibraryEnabledForCurrentUser();
  if (v2 && (result & 1) == 0) {
    goto LABEL_6;
  }
  return result;
}

- (void)assetForURL:(NSURL *)assetURL resultBlock:(ALAssetsLibraryAssetForURLResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock
{
  objc_sync_enter(self);
  [(ALAssetsLibraryPrivate *)[(ALAssetsLibrary *)self internal] setIsValid:1];
  if (pthread_main_np()) {
    dispatch_queue_global_t global_queue = (dispatch_queue_global_t)MEMORY[0x263EF83A0];
  }
  else {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke;
  v10[3] = &unk_2642B5E88;
  v10[4] = global_queue;
  v10[5] = self;
  v10[6] = assetURL;
  v10[7] = failureBlock;
  v10[8] = resultBlock;
  [(ALAssetsLibrary *)self checkPhotosAccessAllowedWithScope:2 handler:v10];
  objc_sync_exit(self);
}

void __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4 = PLPhotosAccessAllowed();
  uint64_t v5 = *(NSObject **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke_2;
  v7[3] = &unk_2642B5DC0;
  char v11 = v4;
  uint64_t v10 = a2;
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 40);
  long long v9 = v6;
  dispatch_async(v5, v7);
}

void __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke_2(int8x16_t *a1)
{
  if (a1[4].i8[8])
  {
    uint64_t v11 = 0;
    char v12 = &v11;
    uint64_t v13 = 0x3052000000;
    v14 = __Block_byref_object_copy__140;
    v15 = __Block_byref_object_dispose__141;
    uint64_t v16 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke_101;
    v8[3] = &unk_2642B5DE8;
    uint64_t v10 = &v11;
    int8x16_t v2 = a1[2];
    int8x16_t v9 = vextq_s8(v2, v2, 8uLL);
    [(id)v2.i64[0] _performBlockAndWait:v8];
    uint64_t v3 = a1[3].i64[1];
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v12[5]);
    }

    _Block_object_dispose(&v11, 8);
  }
  else if (a1[3].i64[0])
  {
    uint64_t v4 = a1[4].i64[0];
    uint64_t v5 = (void *)a1[2].i64[0];
    if (v4 == 3) {
      uint64_t v6 = -3310;
    }
    else {
      uint64_t v6 = -3311;
    }
    [v5 publicErrorForPrivateDomain:@"ALAssetsLibraryErrorDomain" withPrivateCode:v6];
    long long v7 = *(void (**)(void))(a1[3].i64[0] + 16);
    v7();
  }
}

uint64_t __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke_101(void *a1, void *a2)
{
  uint64_t v3 = (void *)[a2 photoFromAssetURL:a1[4]];
  uint64_t result = PLIsCloudPhotoLibraryEnabledForCurrentUser();
  if (!result || (uint64_t result = [v3 isPhotoStreamPhoto], (result & 1) == 0))
  {
    if (v3)
    {
      uint64_t result = [v3 isDeleted];
      if ((result & 1) == 0)
      {
        uint64_t result = [v3 isInTrash];
        if ((result & 1) == 0)
        {
          uint64_t result = [v3 hasLegacyRequiredResourcesLocallyAvailable];
          if (result)
          {
            uint64_t result = [[ALAsset alloc] initWithManagedAsset:v3 library:a1[5]];
            *(void *)(*(void *)(a1[6] + 8) + 40) = result;
          }
        }
      }
    }
  }
  return result;
}

- (BOOL)videoAtPathIsCompatibleWithSavedPhotosAlbum:(NSURL *)videoPathURL
{
  uint64_t v3 = (void *)MEMORY[0x263F5D9A0];
  uint64_t v4 = [(NSURL *)videoPathURL path];

  return [v3 canSaveVideoToLibrary:v4];
}

- (void)writeVideoAtPathToSavedPhotosAlbum:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock
{
}

- (void)_writeVideoAtPathToSavedPhotosAlbum:(id)a3 internalProperties:(id)a4 completionBlock:(id)a5
{
  if (pthread_main_np()) {
    dispatch_queue_global_t global_queue = (dispatch_queue_global_t)MEMORY[0x263EF83A0];
  }
  else {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke;
  v10[3] = &unk_2642B5D98;
  v10[7] = a3;
  v10[8] = a5;
  v10[4] = global_queue;
  v10[5] = self;
  v10[6] = a4;
  [(ALAssetsLibrary *)self checkPhotosAccessAllowedWithScope:1 handler:v10];
}

void __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke(uint64_t a1)
{
  char v2 = PLPhotosAccessAllowed();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_2;
  v5[3] = &unk_2642B5D70;
  char v9 = v2;
  uint64_t v8 = *(void *)(a1 + 64);
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  int8x16_t v6 = vextq_s8(v3, v3, 8uLL);
  long long v7 = v4;
  dispatch_async((dispatch_queue_t)v3.i64[0], v5);
}

void __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_3;
    v4[3] = &unk_2642B5CF8;
    uint64_t v6 = *(void *)(a1 + 64);
    long long v5 = *(_OWORD *)(a1 + 32);
    char v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _setBundlePropertiesOnPropertiesDictionary:v2];
    [v2 setObject:&unk_26C7FE3F0 forKey:*MEMORY[0x263F5DB00]];
    [v2 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5DDE8]];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F5D8A8], "sharedAssetsSaver"), "saveVideoAtPath:properties:completionBlock:", objc_msgSend(*(id *)(a1 + 56), "path"), v2, v4);
  }
  else if (*(void *)(a1 + 64))
  {
    [*(id *)(a1 + 32) publicErrorForPrivateDomain:@"ALAssetsLibraryErrorDomain" withPrivateCode:-3311];
    int8x16_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
}

void __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "publicErrorFromPrivateError:");
  }
  else {
    uint64_t v5 = 0;
  }
  +[ALAssetRepresentationPrivate _clearFileDescriptorQueue];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    long long v7 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_4;
    block[3] = &unk_2642B5CD0;
    block[5] = v5;
    block[6] = v6;
    void block[4] = a2;
    dispatch_async(v7, block);
  }
}

uint64_t __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)writeImageDataToSavedPhotosAlbum:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
}

- (void)writeImageToSavedPhotosAlbum:(CGImageRef)imageRef metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
}

- (void)writeImageToSavedPhotosAlbum:(CGImageRef)imageRef orientation:(ALAssetOrientation)orientation completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
}

- (void)_writeImageToSavedPhotosAlbum:(CGImage *)a3 orientation:(int64_t)a4 imageData:(id)a5 metadata:(id)a6 internalProperties:(id)a7 completionBlock:(id)a8
{
  if (pthread_main_np()) {
    dispatch_queue_global_t global_queue = (dispatch_queue_global_t)MEMORY[0x263EF83A0];
  }
  else {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
  }
  CGImageRetain(a3);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke;
  v16[3] = &unk_2642B5D48;
  v16[4] = global_queue;
  v16[5] = self;
  v16[6] = a7;
  v16[7] = a6;
  v16[10] = a3;
  v16[11] = a4;
  v16[8] = a5;
  v16[9] = a8;
  [(ALAssetsLibrary *)self checkPhotosAccessAllowedWithScope:1 handler:v16];
}

void __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke(uint64_t a1)
{
  char v2 = PLPhotosAccessAllowed();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_2;
  block[3] = &unk_2642B5D20;
  char v12 = v2;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  int8x16_t v7 = vextq_s8(v3, v3, 8uLL);
  long long v8 = v4;
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 64);
  dispatch_async((dispatch_queue_t)v3.i64[0], block);
}

void __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96))
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_3;
    v5[3] = &unk_2642B5CF8;
    uint64_t v7 = *(void *)(a1 + 72);
    long long v6 = *(_OWORD *)(a1 + 32);
    char v2 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:*(void *)(a1 + 48)];
    int8x16_t v3 = v2;
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      [v2 setObject:v4 forKey:*MEMORY[0x263F5DC08]];
    }
    [*(id *)(a1 + 32) _setBundlePropertiesOnPropertiesDictionary:v3];
    [v3 setObject:&unk_26C7FE3F0 forKey:*MEMORY[0x263F5DB00]];
    [v3 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5DDE8]];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F5D8A8], "sharedAssetsSaver"), "saveImageRef:orientation:imageData:properties:completionBlock:", *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 64), v3, v5);
  }
  else if (*(void *)(a1 + 72))
  {
    [*(id *)(a1 + 32) publicErrorForPrivateDomain:@"ALAssetsLibraryErrorDomain" withPrivateCode:-3311];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  CGImageRelease(*(CGImageRef *)(a1 + 80));
}

void __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "publicErrorFromPrivateError:");
  }
  else {
    uint64_t v5 = 0;
  }
  +[ALAssetRepresentationPrivate _clearFileDescriptorQueue];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_4;
    block[3] = &unk_2642B5CD0;
    block[5] = v5;
    block[6] = v6;
    void block[4] = a2;
    dispatch_async(v7, block);
  }
}

uint64_t __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)enumerateGroupsWithTypes:(ALAssetsGroupType)types usingBlock:(ALAssetsLibraryGroupsEnumerationResultsBlock)enumerationBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock
{
  objc_sync_enter(self);
  [(ALAssetsLibraryPrivate *)[(ALAssetsLibrary *)self internal] setIsValid:1];
  if (pthread_main_np()) {
    dispatch_queue_global_t global_queue = (dispatch_queue_global_t)MEMORY[0x263EF83A0];
  }
  else {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke;
  v10[3] = &unk_2642B5CA8;
  v10[4] = global_queue;
  v10[5] = self;
  v10[6] = failureBlock;
  v10[7] = enumerationBlock;
  v10[8] = types;
  [(ALAssetsLibrary *)self checkPhotosAccessAllowedWithScope:2 handler:v10];
  objc_sync_exit(self);
}

void __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4 = PLPhotosAccessAllowed();
  uint64_t v5 = *(NSObject **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_2;
  v7[3] = &unk_2642B5C80;
  char v12 = v4;
  long long v8 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = a2;
  uint64_t v11 = v6;
  dispatch_async(v5, v7);
}

void __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 64);
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x2020000000;
      char v34 = 0;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_3;
      v30[3] = &unk_2642B5C08;
      v30[4] = v2;
      v30[5] = &v31;
      if (_CFExecutableLinkedOnOrAfter()) {
        int v4 = PLIsCloudPhotoLibraryEnabledForCurrentUser() ^ 1;
      }
      else {
        int v4 = 0;
      }
      int v9 = objc_msgSend(MEMORY[0x263F5D9A0], "_assetsLibrary_isSharedPhotoStreamsSupportEnabled");
      char v10 = v9;
      int v11 = v4 | v9;
      char v12 = 30;
      if (v4 | v9) {
        char v12 = 62;
      }
      if (v3 == -1) {
        char v13 = v12;
      }
      else {
        char v13 = v3;
      }
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (v13)
      {
        v15 = *(void **)(a1 + 32);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_4;
        v29[3] = &unk_2642B5C30;
        v29[4] = v15;
        v29[5] = v14;
        [v15 _performBlockAndWait:v29];
        [v14 enumerateObjectsUsingBlock:v30];
        [v14 removeAllObjects];
      }
      int v16 = *((unsigned __int8 *)v32 + 24);
      if (!*((unsigned char *)v32 + 24) && (v13 & 2) != 0)
      {
        v17 = *(void **)(a1 + 32);
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_5;
        v28[3] = &unk_2642B5C30;
        v28[4] = v17;
        v28[5] = v14;
        [v17 _performBlockAndWait:v28];
        [v14 enumerateObjectsUsingBlock:v30];
        [v14 removeAllObjects];
        int v16 = *((unsigned __int8 *)v32 + 24);
      }
      if (!v16 && (v13 & 4) != 0)
      {
        v18 = *(void **)(a1 + 32);
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_6;
        v27[3] = &unk_2642B5C30;
        v27[4] = v18;
        v27[5] = v14;
        [v18 _performBlockAndWait:v27];
        [v14 enumerateObjectsUsingBlock:v30];
        [v14 removeAllObjects];
        int v16 = *((unsigned __int8 *)v32 + 24);
      }
      if (!v16 && (v13 & 8) != 0)
      {
        v19 = *(void **)(a1 + 32);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_7;
        v26[3] = &unk_2642B5C30;
        v26[4] = v19;
        v26[5] = v14;
        [v19 _performBlockAndWait:v26];
        [v14 enumerateObjectsUsingBlock:v30];
        [v14 removeAllObjects];
        int v16 = *((unsigned __int8 *)v32 + 24);
      }
      if (!v16 && (v13 & 0x10) != 0)
      {
        v20 = *(void **)(a1 + 32);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_8;
        v25[3] = &unk_2642B5C30;
        v25[4] = v20;
        v25[5] = v14;
        [v20 _performBlockAndWait:v25];
        [v14 enumerateObjectsUsingBlock:v30];
        [v14 removeAllObjects];
      }
      if (v11 && !*((unsigned char *)v32 + 24) && (v13 & 0x20) != 0)
      {
        v21 = *(void **)(a1 + 32);
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_9;
        v22[3] = &unk_2642B5C58;
        char v23 = v4;
        v22[4] = v21;
        v22[5] = v14;
        char v24 = v10;
        [v21 _performBlockAndWait:v22];
        [v14 enumerateObjectsUsingBlock:v30];
        [v14 removeAllObjects];
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      _Block_object_dispose(&v31, 8);
    }
  }
  else if (*(void *)(a1 + 40))
  {
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void **)(a1 + 32);
    if (v5 == 3) {
      uint64_t v7 = -3310;
    }
    else {
      uint64_t v7 = -3311;
    }
    [v6 publicErrorForPrivateDomain:@"ALAssetsLibraryErrorDomain" withPrivateCode:v7];
    long long v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v5 = result;
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    if (*(unsigned char *)(*(void *)(*(void *)(v5 + 40) + 8) + 24)) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[(id)objc_opt_class() _albumsInLibrary:a2];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if ([v8 isLibrary]) {
          return [*(id *)(a1 + 32) _addGroupForAlbum:v8 ofType:1 toArray:*(void *)(a1 + 40)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (_CFExecutableLinkedOnOrAfter()) {
    int v4 = (void *)[a2 syncedAlbums];
  }
  else {
    int v4 = (void *)[(id)objc_opt_class() _albumsInLibrary:a2];
  }
  uint64_t v5 = v4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) _addGroupForAlbum:*(void *)(*((void *)&v20 + 1) + 8 * i) ofType:2 toArray:*(void *)(a1 + 40)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  uint64_t result = _CFExecutableLinkedOnOrAfter();
  if (!result)
  {
    uint64_t result = PLPhysicalDeviceIsIPad();
    if ((result & 1) == 0)
    {
      long long v11 = (void *)[(id)objc_opt_class() _albumsInLibrary:a2];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t result = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (result)
      {
        uint64_t v12 = result;
        uint64_t v13 = *(void *)v17;
        while (2)
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
            if ([v15 isLibrary]) {
              return [*(id *)(a1 + 32) _addGroupForAlbum:v15 ofType:1 toArray:*(void *)(a1 + 40)];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t result = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
          uint64_t v12 = result;
          if (result) {
            continue;
          }
          break;
        }
      }
    }
  }
  return result;
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v4 = (void *)[(id)objc_opt_class() _albumsInLibrary:a2];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) _addGroupForAlbum:*(void *)(*((void *)&v18 + 1) + 8 * v8++) ofType:4 toArray:*(void *)(a1 + 40)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F5D938], "importListInPhotoLibrary:", a2, 0), "albums"), "array");
  uint64_t result = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(a1 + 32) _addGroupForAlbum:*(void *)(*((void *)&v14 + 1) + 8 * v13++) ofType:4 toArray:*(void *)(a1 + 40)];
      }
      while (v11 != v13);
      uint64_t result = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      uint64_t v11 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = objc_msgSend(MEMORY[0x263F5D918], "albumsWithKind:inManagedObjectContext:", 15, objc_msgSend(a2, "managedObjectContext", 0));
  uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) _addGroupForAlbum:*(void *)(*((void *)&v8 + 1) + 8 * v7++) ofType:8 toArray:*(void *)(a1 + 40)];
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [MEMORY[0x263F5D918] userLibraryAlbumInLibrary:a2];
  uint64_t v5 = *(void *)(a1 + 40);

  return [v3 _addGroupForAlbum:v4 ofType:16 toArray:v5];
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_9(uint64_t result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(result + 48))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = (void *)[a2 photoStreamAlbums];
    uint64_t result = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v17;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(v3 + 32) _addGroupForAlbum:*(void *)(*((void *)&v16 + 1) + 8 * v7++) ofType:32 toArray:*(void *)(v3 + 40)];
        }
        while (v5 != v7);
        uint64_t result = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  if (*(unsigned char *)(v3 + 49))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v8 = objc_msgSend(MEMORY[0x263F5D8C8], "allCloudSharedAlbumsInLibrary:", a2, 0);
    uint64_t result = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (result)
    {
      uint64_t v9 = result;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(v3 + 32) _addGroupForAlbum:*(void *)(*((void *)&v12 + 1) + 8 * v11++) ofType:32 toArray:*(void *)(v3 + 40)];
        }
        while (v9 != v11);
        uint64_t result = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
        uint64_t v9 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_setBundlePropertiesOnPropertiesDictionary:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier");
  if (v4)
  {
    uint64_t v5 = v4;
    if ([v4 length]) {
      [a3 setObject:v5 forKey:*MEMORY[0x263F5DC30]];
    }
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedInfoDictionary"), "objectForKey:", *MEMORY[0x263EFFA90]);
  if (v6)
  {
    uint64_t v7 = v6;
    if ([v6 length])
    {
      uint64_t v8 = *MEMORY[0x263F5DC28];
      [a3 setObject:v7 forKey:v8];
    }
  }
}

- (void)checkPhotosAccessAllowedWithScope:(int64_t)a3 handler:(id)a4
{
  uint64_t v6 = (void *)[MEMORY[0x263F5DB78] sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ALAssetsLibrary_checkPhotosAccessAllowedWithScope_handler___block_invoke;
  v7[3] = &unk_2642B5BE0;
  void v7[4] = a4;
  v7[5] = a3;
  [v6 checkPhotosAccessAllowedWithScope:2 handler:v7];
}

uint64_t __61__ALAssetsLibrary_checkPhotosAccessAllowedWithScope_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 4 && (*(void *)(a1 + 40) & 2) != 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F5DB78], "sharedInstance"), "presentAsyncPromptForLimitedLibraryPickerIfNeeded");
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)_addGroupForAlbum:(id)a3 ofType:(unint64_t)a4 toArray:(id)a5
{
  if (a3 && ([a3 isInTrash] & 1) == 0)
  {
    uint64_t v9 = [[ALAssetsGroup alloc] initWithPhotoAlbum:a3 library:self type:a4];
    [a5 addObject:v9];
  }
}

- (id)publicErrorForPrivateDomain:(id)a3 withPrivateCode:(int64_t)a4
{
  return (id)[MEMORY[0x263F5D8A8] publicAssetsLibraryErrorFromPrivateDomain:a3 withPrivateCode:a4];
}

- (id)publicErrorFromPrivateError:(id)a3
{
  return (id)[MEMORY[0x263F5D8A8] publicAssetsLibraryErrorFromPrivateError:a3];
}

- (void)_performBlock:(id)a3
{
  uint64_t v4 = [(ALAssetsLibraryPrivate *)[(ALAssetsLibrary *)self internal] photoLibrary];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__ALAssetsLibrary__performBlock___block_invoke;
  v5[3] = &unk_2642B5F50;
  void v5[4] = v4;
  v5[5] = a3;
  [(PLPhotoLibrary *)v4 performBlock:v5];
}

uint64_t __33__ALAssetsLibrary__performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_performBlockAndWait:(id)a3
{
  uint64_t v4 = [(ALAssetsLibraryPrivate *)[(ALAssetsLibrary *)self internal] photoLibrary];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__ALAssetsLibrary__performBlockAndWait___block_invoke;
  v5[3] = &unk_2642B5F50;
  void v5[4] = v4;
  v5[5] = a3;
  [(PLPhotoLibrary *)v4 performBlockAndWait:v5];
}

uint64_t __40__ALAssetsLibrary__performBlockAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)registerAlbum:(id)a3 assetGroupPrivate:(id)a4
{
  uint64_t v6 = [(ALAssetsLibrary *)self internal];

  [(ALAssetsLibraryPrivate *)v6 registerAlbum:a3 assetGroupPrivate:a4];
}

- (BOOL)isValid
{
  uint64_t v2 = [(ALAssetsLibrary *)self internal];

  return [(ALAssetsLibraryPrivate *)v2 isValid];
}

- (void)dealloc
{
  [self->_internal setAssetsLibrary:0];

  self->_internal = 0;
  v3.receiver = self;
  v3.super_class = (Class)ALAssetsLibrary;
  [(ALAssetsLibrary *)&v3 dealloc];
}

- (ALAssetsLibrary)init
{
  v4.receiver = self;
  v4.super_class = (Class)ALAssetsLibrary;
  uint64_t v2 = [(ALAssetsLibrary *)&v4 init];
  if (v2) {
    v2->_internal = [[ALAssetsLibraryPrivate alloc] initWithAssetsLibrary:v2];
  }
  return v2;
}

+ (BOOL)_linkedBefore7
{
  if (_linkedBefore7_onceToken != -1) {
    dispatch_once(&_linkedBefore7_onceToken, &__block_literal_global_105);
  }
  return _linkedBefore7_linkedBefore7;
}

uint64_t __33__ALAssetsLibrary__linkedBefore7__block_invoke()
{
  uint64_t result = dyld_get_program_sdk_version();
  _linkedBefore7_linkedBefore7 = result < 0x70000;
  return result;
}

+ (void)disableSharedPhotoStreamsSupport
{
}

+ (ALAuthorizationStatus)authorizationStatus
{
  unint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F5DB78], "sharedInstance"), "photosAccessAllowedWithScope:", 7);
  if (v2 > 4) {
    return 0;
  }
  else {
    return qword_217A29438[v2];
  }
}

+ (id)_albumsInLibrary:(id)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F5D938], "albumListInPhotoLibrary:", a3), "albums");

  return (id)[v3 array];
}

+ (id)_library
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_sync_enter(a1);
  id Weak = objc_loadWeak(&_library__assetsLibraryPhotoLibrary);
  if (!Weak)
  {
    uint64_t v9 = 0;
    uint64_t v4 = [MEMORY[0x263F5DB70] systemLibraryURL];
    id v5 = objc_alloc_init(MEMORY[0x263F5D9B0]);
    [v5 setRequiredState:6];
    [v5 setAutomaticallyMergesContext:1];
    [v5 setAutomaticallyPinToFirstFetch:0];
    [v5 setLibraryInitiator:1];
    id v6 = (id)[MEMORY[0x263F5D9A0] newPhotoLibraryWithName:"+[ALAssetsLibrary _library]" loadedFromURL:v4 options:v5 error:&v9];
    if (!v6)
    {
      Log = PLMigrationGetLog();
      if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v11 = "+[ALAssetsLibrary _library]";
        __int16 v12 = 2112;
        uint64_t v13 = v4;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_217A1D000, Log, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
      }
    }

    objc_msgSend((id)objc_msgSend(v6, "managedObjectContext"), "setIsBackingALAssetsLibrary:", 1);
    id Weak = objc_storeWeak(&_library__assetsLibraryPhotoLibrary, v6);
  }
  objc_sync_exit(a1);
  return Weak;
}

+ (id)_playerItemForVideoFilePath:(id)a3 metadata:(id)a4
{
  return (id)[MEMORY[0x263F5D8A0] playerItemForVideoFilePath:a3 metadata:a4];
}

+ (id)_playerItemForVideoURL:(id)a3 fallbackFilePath:(id)a4
{
  id v6 = (void *)MEMORY[0x263F5D8A0];
  uint64_t v7 = [MEMORY[0x263F5D9A0] systemPhotoLibrary];

  return (id)[v6 playerItemForVideoURL:a3 fallbackFilePath:a4 library:v7];
}

+ (id)_exportSessionForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5
{
  return (id)[MEMORY[0x263F5D8A0] exportSessionForVideoFilePath:a3 metadata:a4 exportPreset:a5];
}

+ (id)_exportSessionForVideoURL:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x263F5D8A0];
  uint64_t v9 = [MEMORY[0x263F5D9A0] systemPhotoLibrary];

  return (id)[v8 exportSessionForVideoURL:a3 library:v9 fallbackFilePath:a4 exportPreset:a5];
}

+ (int64_t)_estimatedOutputFileLengthForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6
{
  return [MEMORY[0x263F5D8A0] estimatedOutputFileLengthForVideoFilePath:a3 metadata:a4 exportPreset:a5 exportProperties:a6];
}

+ (int64_t)_estimatedOutputFileLengthForVideoURL:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x263F5D8A0];
  uint64_t v11 = [MEMORY[0x263F5D9A0] systemPhotoLibrary];

  return [v10 estimatedOutputFileLengthForVideoURL:a3 library:v11 fallbackFilePath:a4 exportPreset:a5 exportProperties:a6];
}

+ (id)_filePathForVideoURL:(id)a3 outMetadata:(id *)a4
{
  id v6 = (void *)MEMORY[0x263F5D8A0];
  uint64_t v7 = [MEMORY[0x263F5D9A0] systemPhotoLibrary];

  return (id)[v6 filePathForVideoURL:a3 library:v7 outMetadata:a4];
}

+ (CGImage)_aspectRatioThumbnailForAssetURL:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F5D8A0];
  uint64_t v5 = [MEMORY[0x263F5D9A0] systemPhotoLibrary];

  return (CGImage *)[v4 aspectRatioThumbnailForAssetURL:a3 library:v5];
}

+ (CGImage)_thumbnailForAssetURL:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F5D8A0];
  uint64_t v5 = [MEMORY[0x263F5D9A0] systemPhotoLibrary];

  return (CGImage *)[v4 thumbnailForAssetURL:a3 library:v5];
}

@end