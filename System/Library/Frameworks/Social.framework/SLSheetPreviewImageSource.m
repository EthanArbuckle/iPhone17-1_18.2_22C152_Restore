@interface SLSheetPreviewImageSource
- (ALAssetsLibrary)assetsLibrary;
- (void)_fetchPreviewImageForAssetURL:(id)a3 resultBlock:(id)a4;
- (void)_generatePreviewImageForAttachment:(id)a3 queueToBlockWhileDownsampling:(id)a4 resultBlock:(id)a5;
- (void)_generatePreviewImageForVideoFileURL:(id)a3 resultBlock:(id)a4;
- (void)cancelVideoPreviewGeneration;
- (void)previewImageForAttachment:(id)a3 queueToBlockWhileDownsampling:(id)a4 resultBlock:(id)a5;
@end

@implementation SLSheetPreviewImageSource

- (ALAssetsLibrary)assetsLibrary
{
  assetsLibrary = self->_assetsLibrary;
  if (!assetsLibrary)
  {
    v4 = (ALAssetsLibrary *)objc_alloc_init(MEMORY[0x1E4F18970]);
    v5 = self->_assetsLibrary;
    self->_assetsLibrary = v4;

    assetsLibrary = self->_assetsLibrary;
  }

  return assetsLibrary;
}

- (void)previewImageForAttachment:(id)a3 queueToBlockWhileDownsampling:(id)a4 resultBlock:(id)a5
{
  id v28 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, double))a5;
  v11 = [v28 previewImage];

  if (v11)
  {
    _SLLog(v5, 6, @"previewImageForAttachment: previewImage for attachment is not nil so returning");
    uint64_t v12 = [v28 previewImage];
LABEL_3:
    v13 = (void *)v12;
    v10[2](v10, v12, 0.0);

    goto LABEL_4;
  }
  if (![v28 type])
  {
    v18 = [v28 payload];

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E4F42A80];
      v20 = [v28 payload];
      v21 = [v19 imageWithData:v20];

      [v21 size];
      double v23 = v22;
      [v21 size];
      if (v23 * v24 >= 262144.0)
      {
        _SLLog(v5, 6, @"previewImageForAttachment: Generating preview from downsampled payload");
        [(SLSheetPreviewImageSource *)self _generatePreviewImageForAttachment:v28 queueToBlockWhileDownsampling:v9 resultBlock:v10];
      }
      else
      {
        _SLLog(v5, 6, @"previewImageForAttachment: Using payload as preview");
        v10[2](v10, (uint64_t)v21, 0.0);
      }
    }
    else
    {
      _SLLog(v5, 6, @"previewImageForAttachment: No payload. Guess we need to wait until it loads.");
      v10[2](v10, 0, 0.0);
    }
    goto LABEL_4;
  }
  if (!SLAttachmentPayloadIsAssetLibraryURL(v28))
  {
    if ((SLAttachmentPayloadIsVideoFileURL(v28) & 1) != 0
      || [v28 type] == 8
      && ([v28 payloadSourceFileURL],
          v25 = objc_claimAutoreleasedReturnValue(),
          int v26 = [v25 isFileURL],
          v25,
          v26))
    {
      _SLLog(v5, 6, @"previewImageForAttachment: creating preview for video file URL");
      if (SLAttachmentPayloadIsVideoFileURL(v28)) {
        [v28 payload];
      }
      else {
      v17 = [v28 payloadSourceFileURL];
      }
      [(SLSheetPreviewImageSource *)self _generatePreviewImageForVideoFileURL:v17 resultBlock:v10];
      goto LABEL_26;
    }
    uint64_t v27 = [v28 type];
    _SLLog(v5, 3, @"previewImageForAttachment: Cannot create preview for attachment of type %i,returning fallback preview");
LABEL_20:
    uint64_t v12 = +[SLSheetImagePreviewView fallbackPreviewImage];
    goto LABEL_3;
  }
  _SLLog(v5, 6, @"previewImageForAttachment: creating preview for asset URL");
  v14 = [v28 payload];
  v15 = [v14 scheme];
  int v16 = [v15 isEqualToString:@"assets-library"];

  if (!v16) {
    goto LABEL_20;
  }
  v17 = [v28 payload];
  [(SLSheetPreviewImageSource *)self _fetchPreviewImageForAssetURL:v17 resultBlock:v10];
LABEL_26:

LABEL_4:
}

- (void)_fetchPreviewImageForAssetURL:(id)a3 resultBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SLSheetPreviewImageSource *)self assetsLibrary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__SLSheetPreviewImageSource__fetchPreviewImageForAssetURL_resultBlock___block_invoke;
  v14[3] = &unk_1E6467568;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__SLSheetPreviewImageSource__fetchPreviewImageForAssetURL_resultBlock___block_invoke_2;
  v11[3] = &unk_1E6467590;
  id v12 = v6;
  id v13 = v15;
  id v9 = v15;
  id v10 = v6;
  [v8 assetForURL:v10 resultBlock:v14 failureBlock:v11];
}

void __71__SLSheetPreviewImageSource__fetchPreviewImageForAssetURL_resultBlock___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  _SLLog(v2, 6, @"Fetched asset for asset URL, fetching preview");
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:", objc_msgSend(v11, "aspectRatioThumbnail"));
  uint64_t v5 = *MEMORY[0x1E4F18958];
  id v6 = [v11 valueForProperty:*MEMORY[0x1E4F18958]];
  id v7 = (void *)*MEMORY[0x1E4F18960];

  if (v6 == v7)
  {
    double v10 = 0.0;
  }
  else
  {
    v8 = [v11 valueForProperty:v5];
    [v8 doubleValue];
    double v10 = v9;
  }
  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v10);
}

uint64_t __71__SLSheetPreviewImageSource__fetchPreviewImageForAssetURL_resultBlock___block_invoke_2(uint64_t a1)
{
  _SLLog(v1, 6, @"Failed to fetch asset URL %@ with error %{public}@");
  v3 = *(uint64_t (**)(__n128))(*(void *)(a1 + 40) + 16);
  v4.n128_u64[0] = 0;

  return v3(v4);
}

- (void)_generatePreviewImageForAttachment:(id)a3 queueToBlockWhileDownsampling:(id)a4 resultBlock:(id)a5
{
  id v8 = a3;
  double v9 = a4;
  double v10 = (void (**)(id, void, double))a5;
  _SLLog(v5, 6, @"SLComposeServiceViewController-_generatePreviewImageForAttachment:%@");
  if (objc_msgSend(v8, "type", v8)
    || ([v8 previewImage], id v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    _SLLog(v5, 3, @"_generatePreviewImageForAttachment called for non-image payload attachment");
    v10[2](v10, 0, 0.0);
  }
  else
  {
    _SLLog(v5, 6, @"Image attachment with nil preview - triggering thumbnail generation");
    id v12 = [v8 payload];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke;
    block[3] = &unk_1E6467460;
    id v15 = v12;
    int v16 = v10;
    id v13 = v12;
    dispatch_async(v9, block);
  }
}

void __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke_2;
  v6[3] = &unk_1E64675E0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_semaphore_t v7 = v2;
  id v8 = v4;
  uint64_t v5 = v2;
  +[SLImageDownsampling generateThumbnailFromImageData:v3 adjustSmallestSideToSize:200 resultsHandler:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke_3;
  block[3] = &unk_1E64675B8;
  id v6 = v3;
  id v8 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __106__SLSheetPreviewImageSource__generatePreviewImageForAttachment_queueToBlockWhileDownsampling_resultBlock___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithData:");
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  (*(void (**)(double))(*(void *)(a1 + 48) + 16))(0.0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_generatePreviewImageForVideoFileURL:(id)a3 resultBlock:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  _SLLog(v4, 7, @"SLSheetPreviewImageSource _generatePreviewImageForVideoFileURL: %@");
  id v9 = objc_alloc(MEMORY[0x1E4F166C8]);
  uint64_t v10 = *MEMORY[0x1E4F16148];
  v25[0] = *MEMORY[0x1E4F16158];
  v25[1] = v10;
  v26[0] = &unk_1F1E40D20;
  v26[1] = MEMORY[0x1E4F1CC28];
  id v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, v25, 2, v7);
  id v12 = (void *)[v9 initWithURL:v7 options:v11];

  _SLLog(v4, 7, @"SLSheetPreviewImageSource _generatePreviewImageForVideoFileURL: got asset %@");
  if (v12)
  {
    assetImageGenerator = self->_assetImageGenerator;
    if (!assetImageGenerator)
    {
      v14 = (AVAssetImageGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E4F16368]), "initWithAsset:", v12, v12);
      id v15 = self->_assetImageGenerator;
      self->_assetImageGenerator = v14;

      [(AVAssetImageGenerator *)self->_assetImageGenerator setAppliesPreferredTrackTransform:1];
      assetImageGenerator = self->_assetImageGenerator;
    }
    int v16 = (void *)MEMORY[0x1E4F29238];
    CMTimeMakeWithSeconds(&v23, 0.0, 1);
    v17 = [v16 valueWithCMTime:&v23];
    double v24 = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__SLSheetPreviewImageSource__generatePreviewImageForVideoFileURL_resultBlock___block_invoke;
    v19[3] = &unk_1E6467630;
    id v20 = v12;
    id v22 = v8;
    id v21 = v7;
    [(AVAssetImageGenerator *)assetImageGenerator generateCGImagesAsynchronouslyForTimes:v18 completionHandler:v19];
  }
  else
  {
    _SLLog(v4, 3, @"Could not create AVAsset from %@");
    (*((void (**)(id, void, double))v8 + 2))(v8, 0, 0.0);
  }
}

void __78__SLSheetPreviewImageSource__generatePreviewImageForVideoFileURL_resultBlock___block_invoke(id *a1, uint64_t a2, CGImage *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = NSNumber;
  id v11 = a6;
  id v12 = [v10 numberWithInteger:a5];
  _SLLog(v6, 7, @"SLSheetPreviewImageSource _generatePreviewImageForVideoFileURL: did generate image %@ result %@ error %{public}@");

  if (a3) {
    CGImageRetain(a3);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SLSheetPreviewImageSource__generatePreviewImageForVideoFileURL_resultBlock___block_invoke_2;
  block[3] = &unk_1E6467608;
  v17 = a3;
  id v14 = a1[4];
  id v16 = a1[6];
  id v15 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__SLSheetPreviewImageSource__generatePreviewImageForVideoFileURL_resultBlock___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    id v3 = *(void **)(a1 + 32);
    if (v3) {
      [v3 duration];
    }
    _SLLog(v1, 3, @"Video duration CMTime.flags kCMTimeFlags_Valid is not set");
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:", *(void *)(a1 + 56), v7);
    (*(void (**)(double))(*(void *)(a1 + 48) + 16))(0.0);
    CGImageRelease(*(CGImageRef *)(a1 + 56));
  }
  else
  {
    _SLLog(v1, 6, @"AVAssetImageGenerator failed for %@");
    uint64_t v4 = *(void (**)(__n128))(*(void *)(a1 + 48) + 16);
    v5.n128_u64[0] = 0;
    v4(v5);
  }
}

- (void)cancelVideoPreviewGeneration
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetImageGenerator, 0);

  objc_storeStrong((id *)&self->_assetsLibrary, 0);
}

@end