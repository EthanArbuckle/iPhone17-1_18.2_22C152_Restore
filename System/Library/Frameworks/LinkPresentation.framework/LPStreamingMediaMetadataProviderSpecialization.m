@interface LPStreamingMediaMetadataProviderSpecialization
+ (id)specializedMetadataProviderForResourceWithContext:(id)a3;
+ (unint64_t)specialization;
- (void)cancel;
- (void)done;
- (void)fail;
- (void)start;
@end

@implementation LPStreamingMediaMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 16;
}

+ (id)specializedMetadataProviderForResourceWithContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 MIMEType];
  BOOL v5 = +[LPMIMETypeRegistry isMediaType:v4];

  if (v5) {
    v6 = [(LPMetadataProviderSpecialization *)[LPStreamingMediaMetadataProviderSpecialization alloc] initWithContext:v3];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)start
{
  id v3 = objc_alloc_init(LPFetcherConfiguration);
  v4 = [(LPMetadataProviderSpecialization *)self context];
  BOOL v5 = [v4 webView];
  [(LPFetcherConfiguration *)v3 setWebViewForProcessSharing:v5];

  v6 = [(LPMetadataProviderSpecialization *)self context];
  -[LPFetcherConfiguration setFetchIsNotUserInitiated:](v3, "setFetchIsNotUserInitiated:", [v6 fetchIsNotUserInitiated]);

  v7 = objc_alloc_init(LPMediaAssetFetcher);
  fetcher = self->_fetcher;
  self->_fetcher = v7;

  v9 = [(LPMetadataProviderSpecialization *)self context];
  v10 = [v9 postRedirectURL];
  [(LPMediaAssetFetcher *)self->_fetcher setURL:v10];

  v11 = self->_fetcher;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke;
  v12[3] = &unk_1E5B04F30;
  v12[4] = self;
  [(LPMediaAssetFetcher *)v11 fetchWithConfiguration:v3 completionHandler:v12];
}

void __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(unsigned char **)(a1 + 32);
  if (!v4[24])
  {
    if (!v3)
    {
LABEL_5:
      [v4 fail];
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = *(unsigned char **)(a1 + 32);
      goto LABEL_5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [v3 audio];
      id v6 = v5;
      if (v5)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_2;
        block[3] = &unk_1E5B04E18;
        block[4] = *(void *)(a1 + 32);
        v7 = &v23;
        id v6 = v5;
        id v23 = v6;
        dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_11:

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      v8 = [v3 video];
      id v6 = v8;
      if (v8)
      {
        v9 = (void *)MEMORY[0x1E4F16368];
        v10 = [v8 _asset];
        uint64_t v11 = [v9 assetImageGeneratorWithAsset:v10];
        uint64_t v12 = *(void *)(a1 + 32);
        v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setMaximumSize:", 900.0, 900.0);
        v14 = *(void **)(*(void *)(a1 + 32) + 40);
        long long v20 = *MEMORY[0x1E4F1FA48];
        uint64_t v21 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        v15 = [MEMORY[0x1E4F29238] valueWithCMTime:&v20];
        v24[0] = v15;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_3;
        v18[3] = &unk_1E5B04F08;
        v18[4] = *(void *)(a1 + 32);
        id v17 = v6;
        id v19 = v17;
        [v14 generateCGImagesAsynchronouslyForTimes:v16 completionHandler:v18];

        v7 = &v19;
        id v6 = v17;
        goto LABEL_11;
      }
    }
    [*(id *)(a1 + 32) fail];
    goto LABEL_13;
  }
LABEL_14:
}

void __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_2(uint64_t a1)
{
  id v19 = objc_alloc_init(LPFileMetadata);
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 postRedirectURL];
  v4 = [v3 lastPathComponent];
  BOOL v5 = [v4 stringByDeletingPathExtension];
  [(LPFileMetadata *)v19 setName:v5];

  id v6 = [*(id *)(a1 + 32) context];
  v7 = [v6 MIMEType];
  v8 = +[LPMIMETypeRegistry UTIForMIMEType:v7];
  [(LPFileMetadata *)v19 setType:v8];

  uint64_t v9 = [*(id *)(a1 + 32) createMetadataWithSpecialization:v19];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v9;

  [*(id *)(*(void *)(a1 + 32) + 48) setAudio:*(void *)(a1 + 40)];
  uint64_t v12 = objc_alloc_init(LPAudioMetadata);
  [*(id *)(*(void *)(a1 + 32) + 48) setAudioMetadata:v12];

  v13 = [*(id *)(a1 + 32) context];
  v14 = [v13 postRedirectURL];
  v15 = [*(id *)(*(void *)(a1 + 32) + 48) audioMetadata];
  [v15 setURL:v14];

  v16 = [*(id *)(a1 + 32) context];
  id v17 = [v16 MIMEType];
  v18 = [*(id *)(*(void *)(a1 + 32) + 48) audioMetadata];
  [v18 setType:v17];

  [*(id *)(a1 + 32) done];
}

void __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_3(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a6;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    if (a3) {
      CFRetain(a3);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_4;
    block[3] = &unk_1E5B04EE0;
    uint64_t v9 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v11 = v9;
    uint64_t v12 = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __55__LPStreamingMediaMetadataProviderSpecialization_start__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) createMetadataWithSpecialization:0];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  [*(id *)(*(void *)(a1 + 32) + 48) setVideo:*(void *)(a1 + 40)];
  BOOL v5 = objc_alloc_init(LPVideoMetadata);
  [*(id *)(*(void *)(a1 + 32) + 48) setVideoMetadata:v5];

  id v6 = [*(id *)(a1 + 32) context];
  v7 = [v6 postRedirectURL];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 48) videoMetadata];
  [v8 setURL:v7];

  uint64_t v9 = [*(id *)(a1 + 32) context];
  uint64_t v10 = [v9 MIMEType];
  id v11 = [*(id *)(*(void *)(a1 + 32) + 48) videoMetadata];
  [v11 setType:v10];

  if (*(void *)(a1 + 48))
  {
    id v12 = [[LPImage alloc] _initWithCGImage:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 48) setImage:v12];

    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
  v13 = *(void **)(a1 + 32);

  return [v13 done];
}

- (void)cancel
{
  self->_cancelled = 1;
  [(LPMediaAssetFetcher *)self->_fetcher cancel];
  videoImageGenerator = self->_videoImageGenerator;

  [(AVAssetImageGenerator *)videoImageGenerator cancelAllCGImageGeneration];
}

- (void)fail
{
  uint64_t v3 = [(LPMetadataProviderSpecialization *)self delegate];
  [v3 metadataProviderSpecializationDidFail:self];

  [(LPStreamingMediaMetadataProviderSpecialization *)self cancel];
}

- (void)done
{
  id v3 = [(LPMetadataProviderSpecialization *)self delegate];
  [v3 metadataProviderSpecialization:self didCompleteWithMetadata:self->_metadata];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_videoImageGenerator, 0);

  objc_storeStrong((id *)&self->_fetcher, 0);
}

@end