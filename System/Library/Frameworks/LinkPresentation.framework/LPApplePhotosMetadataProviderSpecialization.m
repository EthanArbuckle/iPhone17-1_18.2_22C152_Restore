@interface LPApplePhotosMetadataProviderSpecialization
+ (id)specializedMetadataProviderForURLWithContext:(id)a3;
+ (unint64_t)specialization;
- (void)cancel;
- (void)completeWithMetadata:(id)a3;
- (void)dealloc;
- (void)didFetchAsset:(id)a3;
- (void)fail;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)start;
@end

@implementation LPApplePhotosMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 128;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 postRedirectURL];
  BOOL v5 = +[LPPresentationSpecializations isiCloudPhotoShareURL:v4];

  if (v5) {
    v6 = [(LPMetadataProviderSpecialization *)[LPApplePhotosMetadataProviderSpecialization alloc] initWithContext:v3];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  [(PHPhotoLibrary *)self->_photoLibrary px_unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)LPApplePhotosMetadataProviderSpecialization;
  [(LPApplePhotosMetadataProviderSpecialization *)&v3 dealloc];
}

- (void)start
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (TCCAccessPreflight())
  {
    [(LPApplePhotosMetadataProviderSpecialization *)self fail];
    return;
  }
  v16 = 0;
  if (!PhotosUICoreLibraryCore(char **)::frameworkLibrary)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = ___ZL23PhotosUICoreLibraryCorePPc_block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0l;
    v21 = &v16;
    long long v22 = xmmword_1E5B05F98;
    uint64_t v23 = 0;
    PhotosUICoreLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  if (!PhotosUICoreLibraryCore(char **)::frameworkLibrary)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"void *PhotosUICoreLibrary()"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"LPApplePhotosMetadataProviderSpecialization.mm", 29, @"%s", v16);

    __break(1u);
    goto LABEL_15;
  }
  objc_super v3 = v16;
  if (v16) {
LABEL_15:
  }
    free(v3);
  *(void *)&long long v22 = 0;
  *((void *)&v22 + 1) = &v22;
  uint64_t v23 = 0x2050000000;
  v4 = (void *)getPHPhotoLibraryClass(void)::softClass;
  uint64_t v24 = getPHPhotoLibraryClass(void)::softClass;
  if (!getPHPhotoLibraryClass(void)::softClass)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = ___ZL22getPHPhotoLibraryClassv_block_invoke;
    v20 = &unk_1E5B04EB8;
    v21 = (void **)&v22;
    ___ZL22getPHPhotoLibraryClassv_block_invoke((uint64_t)&v17);
    v4 = *(void **)(*((void *)&v22 + 1) + 24);
  }
  id v5 = v4;
  _Block_object_dispose(&v22, 8);
  v6 = [v5 sharedMomentSharePhotoLibrary];
  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = v6;

  [(PHPhotoLibrary *)self->_photoLibrary px_registerChangeObserver:self];
  v8 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  *(void *)&long long v22 = 0;
  *((void *)&v22 + 1) = &v22;
  uint64_t v23 = 0x2050000000;
  v9 = (void *)getPHMomentShareClass(void)::softClass;
  uint64_t v24 = getPHMomentShareClass(void)::softClass;
  if (!getPHMomentShareClass(void)::softClass)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = ___ZL21getPHMomentShareClassv_block_invoke;
    v20 = &unk_1E5B04EB8;
    v21 = (void **)&v22;
    ___ZL21getPHMomentShareClassv_block_invoke((uint64_t)&v17);
    v9 = *(void **)(*((void *)&v22 + 1) + 24);
  }
  id v10 = v9;
  _Block_object_dispose(&v22, 8);
  v11 = [(LPMetadataProviderSpecialization *)self context];
  v12 = [v11 postRedirectURL];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__LPApplePhotosMetadataProviderSpecialization_start__block_invoke;
  v15[3] = &unk_1E5B05F50;
  v15[4] = self;
  [v10 fetchMomentShareFromShareURL:v12 options:v8 completionHandler:v15];
}

void __52__LPApplePhotosMetadataProviderSpecialization_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(unsigned char **)(a1 + 32);
  if (!v7[24])
  {
    if (!v5 || v6)
    {
      [v7 fail];
    }
    else
    {
      v8 = objc_alloc_init(LPApplePhotosMomentMetadata);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 56);
      *(void *)(v9 + 56) = v8;

      v11 = [v5 localizedTitle];
      [*(id *)(*(void *)(a1 + 32) + 56) setTitle:v11];

      v12 = [v5 expiryDate];
      [*(id *)(*(void *)(a1 + 32) + 56) setExpirationDate:v12];

      v13 = [v5 startDate];
      [*(id *)(*(void *)(a1 + 32) + 56) setEarliestAssetDate:v13];

      v14 = [v5 endDate];
      [*(id *)(*(void *)(a1 + 32) + 56) setLatestAssetDate:v14];

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setPhotoCount:", objc_msgSend(v5, "photosCount"));
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setVideoCount:", objc_msgSend(v5, "videosCount"));
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setOtherItemCount:", objc_msgSend(v5, "assetCount") - (objc_msgSend(v5, "photosCount") + objc_msgSend(v5, "videosCount")));
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __52__LPApplePhotosMetadataProviderSpecialization_start__block_invoke_2;
      v15[3] = &unk_1E5B04E18;
      v15[4] = *(void *)(a1 + 32);
      id v16 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }
  }
}

void __52__LPApplePhotosMetadataProviderSpecialization_start__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v2 = (void *)getPHFetchOptionsClass(void)::softClass;
  uint64_t v20 = getPHFetchOptionsClass(void)::softClass;
  if (!getPHFetchOptionsClass(void)::softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = ___ZL22getPHFetchOptionsClassv_block_invoke;
    v16[3] = &unk_1E5B04EB8;
    v16[4] = &v17;
    ___ZL22getPHFetchOptionsClassv_block_invoke((uint64_t)v16);
    v2 = (void *)v18[3];
  }
  objc_super v3 = v2;
  _Block_object_dispose(&v17, 8);
  v4 = (void *)[[v3 alloc] init];
  [v4 setFetchLimit:1];
  [v4 setPhotoLibrary:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v5 = [getPHAssetClass() fetchKeyAssetsInAssetCollection:*(void *)(a1 + 40) options:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = [*(id *)(*(void *)(a1 + 32) + 40) firstObject];

  if (v8)
  {
    uint64_t v9 = *(id **)(a1 + 32);
    id v10 = [v9[5] firstObject];
    [v9 didFetchAsset:v10];
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v11 = [getPHAssetClass() fetchAssetsInAssetCollection:*(void *)(a1 + 40) options:v4];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v11;

  v14 = [*(id *)(*(void *)(a1 + 32) + 48) firstObject];

  if (v14)
  {
    v15 = *(id **)(a1 + 32);
    id v10 = [v15[6] firstObject];
    [v15 didFetchAsset:v10];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)cancel
{
  self->_cancelled = 1;
  if (self->_pendingImageRequest)
  {
    id v3 = [getPHImageManagerClass() defaultManager];
    [v3 cancelImageRequest:self->_pendingImageRequest];
  }
}

- (void)fail
{
  [(LPApplePhotosMetadataProviderSpecialization *)self cancel];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__LPApplePhotosMetadataProviderSpecialization_fail__block_invoke;
  block[3] = &unk_1E5B04DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__LPApplePhotosMetadataProviderSpecialization_fail__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 metadataProviderSpecializationDidFail:*(void *)(a1 + 32)];
}

- (void)completeWithMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LPMetadataProviderSpecialization *)self createMetadataWithSpecialization:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__LPApplePhotosMetadataProviderSpecialization_completeWithMetadata___block_invoke;
  v7[3] = &unk_1E5B04E18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __68__LPApplePhotosMetadataProviderSpecialization_completeWithMetadata___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 metadataProviderSpecialization:*(void *)(a1 + 32) didCompleteWithMetadata:*(void *)(a1 + 40)];
}

- (void)didFetchAsset:(id)a3
{
  id v4 = a3;
  keyAssetFetch = self->_keyAssetFetch;
  if (*(_OWORD *)&self->_keyAssetFetch != 0)
  {
    self->_keyAssetFetch = 0;

    anyAssetFetch = self->_anyAssetFetch;
    self->_anyAssetFetch = 0;

    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v7 = (void *)getPHImageRequestOptionsClass(void)::softClass;
    uint64_t v16 = getPHImageRequestOptionsClass(void)::softClass;
    if (!getPHImageRequestOptionsClass(void)::softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = ___ZL29getPHImageRequestOptionsClassv_block_invoke;
      v12[3] = &unk_1E5B04EB8;
      v12[4] = &v13;
      ___ZL29getPHImageRequestOptionsClassv_block_invoke((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v13, 8);
    uint64_t v9 = (void *)[[v8 alloc] init];
    [v9 setNetworkAccessAllowed:1];
    id v10 = [getPHImageManagerClass() defaultManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__LPApplePhotosMetadataProviderSpecialization_didFetchAsset___block_invoke;
    v11[3] = &unk_1E5B05F78;
    v11[4] = self;
    self->_pendingImageRequest = [v10 requestImageDataAndOrientationForAsset:v4 options:v9 resultHandler:v11];
  }
}

void __61__LPApplePhotosMetadataProviderSpecialization_didFetchAsset___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v11 + 24))
  {
    *(_DWORD *)(v11 + 28) = 0;
    if (v8)
    {
      uint64_t v12 = +[LPMIMETypeRegistry MIMETypeForUTI:v9];
      if (v12)
      {
        uint64_t v13 = [[LPImage alloc] initWithData:v8 MIMEType:v12];
        [*(id *)(*(void *)(a1 + 32) + 56) setKeyPhoto:v13];
      }
      else
      {
        v14 = LPLogChannelFetching();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          id v16 = v9;
          _os_log_impl(&dword_1A35DC000, v14, OS_LOG_TYPE_DEFAULT, "Failed to determine MIME type for image with type %@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
    [*(id *)(a1 + 32) completeWithMetadata:*(void *)(*(void *)(a1 + 32) + 56)];
  }
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (self->_keyAssetFetch)
  {
    uint64_t v5 = objc_msgSend(v4, "changeDetailsForFetchResult:");
    id v6 = v5;
    if (v5)
    {
      v7 = [v5 fetchResultAfterChanges];
      keyAssetFetch = self->_keyAssetFetch;
      self->_keyAssetFetch = v7;

      id v9 = [(PHFetchResult *)self->_keyAssetFetch firstObject];
      if (v9) {
        [(LPApplePhotosMetadataProviderSpecialization *)self didFetchAsset:v9];
      }
    }
    id v4 = v15;
  }
  if (self->_anyAssetFetch)
  {
    id v10 = objc_msgSend(v4, "changeDetailsForFetchResult:");
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 fetchResultAfterChanges];
      anyAssetFetch = self->_anyAssetFetch;
      self->_anyAssetFetch = v12;

      v14 = [(PHFetchResult *)self->_anyAssetFetch firstObject];
      if (v14) {
        [(LPApplePhotosMetadataProviderSpecialization *)self didFetchAsset:v14];
      }
    }
    id v4 = v15;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_anyAssetFetch, 0);
  objc_storeStrong((id *)&self->_keyAssetFetch, 0);

  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end