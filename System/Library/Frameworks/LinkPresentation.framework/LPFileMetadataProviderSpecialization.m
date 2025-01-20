@interface LPFileMetadataProviderSpecialization
+ (id)_thumbnailQueue;
+ (id)specializedMetadataProviderForResourceWithContext:(id)a3;
+ (id)specializedMetadataProviderForURLWithContext:(id)a3;
+ (unint64_t)specialization;
- (BOOL)shouldUseQuickLookForFileType;
- (void)cancel;
- (void)cleanUpTemporaryFile;
- (void)complete;
- (void)fetchIconAndThumbnailFromQuickLookForURL:(id)a3;
- (void)fetchMetadataForReachableFile:(id)a3;
- (void)fetchMetadataFromURL:(id)a3;
- (void)generateFallbackMetadataForUnreachableFile:(id)a3;
- (void)metadataProviderSpecialization:(id)a3 didCompleteWithMetadata:(id)a4;
- (void)metadataProviderSpecializationDidFail:(id)a3;
- (void)requestQuickLookThumbnailForURL:(id)a3 size:(CGSize)a4 badgeType:(unint64_t)a5 image:(id *)a6;
- (void)start;
- (void)updatePreliminaryMetadata;
@end

@implementation LPFileMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 2;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3 = a3;
  if (([v3 fetchIsNotUserInitiated] & 1) != 0
    || ([v3 postRedirectURL],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isFileURL],
        v4,
        (v5 & 1) == 0))
  {
    v6 = 0;
  }
  else
  {
    v6 = [(LPMetadataProviderSpecialization *)[LPFileMetadataProviderSpecialization alloc] initWithContext:v3];
  }

  return v6;
}

+ (id)specializedMetadataProviderForResourceWithContext:(id)a3
{
  id v3 = a3;
  if (([v3 fetchIsNotUserInitiated] & 1) != 0
    || ![v3 hasLoadedResource]
    || ([v3 MIMEType],
        v4 = objc_claimAutoreleasedReturnValue(),
        BOOL v5 = +[LPMIMETypeRegistry isWebPageType:v4],
        v4,
        v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = [(LPMetadataProviderSpecialization *)[LPFileMetadataProviderSpecialization alloc] initWithContext:v3];
  }

  return v6;
}

+ (id)_thumbnailQueue
{
  if (+[LPFileMetadataProviderSpecialization _thumbnailQueue]::onceToken != -1) {
    dispatch_once(&+[LPFileMetadataProviderSpecialization _thumbnailQueue]::onceToken, &__block_literal_global_26);
  }
  v2 = (void *)+[LPFileMetadataProviderSpecialization _thumbnailQueue]::queue;

  return v2;
}

void __55__LPFileMetadataProviderSpecialization__thumbnailQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.LinkPresentation.FileThumbnailQueue", v2);
  v1 = (void *)+[LPFileMetadataProviderSpecialization _thumbnailQueue]::queue;
  +[LPFileMetadataProviderSpecialization _thumbnailQueue]::queue = (uint64_t)v0;
}

- (void)start
{
  id v3 = [(LPMetadataProviderSpecialization *)self context];
  int v4 = [v3 fetchIsNotUserInitiated];

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__LPFileMetadataProviderSpecialization_start__block_invoke;
    block[3] = &unk_1E5B04DF0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    BOOL v5 = [(LPMetadataProviderSpecialization *)self context];
    int v6 = [v5 hasLoadedResource];

    v7 = [(LPMetadataProviderSpecialization *)self context];
    id v10 = v7;
    if (v6)
    {
      v8 = [v7 webView];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__LPFileMetadataProviderSpecialization_start__block_invoke_2;
      v11[3] = &unk_1E5B06CB8;
      v11[4] = self;
      [v8 _getMainResourceDataWithCompletionHandler:v11];
    }
    else
    {
      v9 = [v7 postRedirectURL];
      [(LPFileMetadataProviderSpecialization *)self fetchMetadataFromURL:v9];
    }
  }
}

void __45__LPFileMetadataProviderSpecialization_start__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 metadataProviderSpecializationDidFail:*(void *)(a1 + 32)];
}

void __45__LPFileMetadataProviderSpecialization_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v28 = a2;
  id v3 = [*(id *)(a1 + 32) context];
  uint64_t v4 = [v3 MIMEType];
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v4;

  v7 = +[LPMIMETypeRegistry fileExtensionForMIMEType:*(void *)(*(void *)(a1 + 32) + 64)];
  if (![v7 length])
  {
    v8 = [*(id *)(a1 + 32) context];
    v9 = [v8 postRedirectURL];
    uint64_t v10 = [v9 pathExtension];

    v7 = (void *)v10;
  }
  v11 = (void *)MEMORY[0x1E4F1CB10];
  v12 = NSTemporaryDirectory();
  v13 = [MEMORY[0x1E4F29128] UUID];
  v14 = [v13 UUIDString];
  v15 = [v12 stringByAppendingPathComponent:v14];
  uint64_t v16 = [v11 fileURLWithPath:v15];
  uint64_t v17 = *(void *)(a1 + 32);
  v18 = *(void **)(v17 + 32);
  *(void *)(v17 + 32) = v16;

  if ([v7 length])
  {
    uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 32) URLByAppendingPathExtension:v7];
    uint64_t v20 = *(void *)(a1 + 32);
    v21 = *(void **)(v20 + 32);
    *(void *)(v20 + 32) = v19;
  }
  v22 = [*(id *)(a1 + 32) context];
  v23 = [v22 webView];
  int v24 = [v23 _isDisplayingStandaloneImageDocument];

  if (v24)
  {
    v25 = [[LPImage alloc] initWithData:v28 MIMEType:*(void *)(*(void *)(a1 + 32) + 64)];
    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
  [v28 writeToURL:*(void *)(*(void *)(a1 + 32) + 32) atomically:0];
  [*(id *)(a1 + 32) fetchMetadataFromURL:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (void)requestQuickLookThumbnailForURL:(id)a3 size:(CGSize)a4 badgeType:(unint64_t)a5 image:(id *)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F3A6C0]), "initWithFileAtURL:size:scale:representationTypes:", v11, 4, width, height, 3.0);
  [v12 setBadgeType:a5];
  dispatch_group_enter((dispatch_group_t)self->_fetchGroup);
  v13 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__LPFileMetadataProviderSpecialization_requestQuickLookThumbnailForURL_size_badgeType_image___block_invoke;
  v14[3] = &unk_1E5B06CE0;
  v14[4] = self;
  v14[5] = a6;
  [v13 generateBestRepresentationForRequest:v12 completionHandler:v14];
}

void __93__LPFileMetadataProviderSpecialization_requestQuickLookThumbnailForURL_size_badgeType_image___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 CGImage])
  {
    v7 = LPLogChannelFetching();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __93__LPFileMetadataProviderSpecialization_requestQuickLookThumbnailForURL_size_badgeType_image___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    v8 = LPLogChannelFetching();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A35DC000, v8, OS_LOG_TYPE_DEFAULT, "LPFileMetadataProviderSpecialization retrieved a thumbnail from QuickLookThumbnailing", v12, 2u);
    }
    id v9 = -[LPImage _initWithCGImage:]([LPImage alloc], "_initWithCGImage:", [v5 CGImage]);
    uint64_t v10 = *(void ***)(a1 + 40);
    id v11 = *v10;
    *uint64_t v10 = v9;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 96));
}

- (void)fetchIconAndThumbnailFromQuickLookForURL:(id)a3
{
  id v8 = a3;
  if (!self->_originalImage)
  {
    UTI = self->_UTI;
    id v5 = self->_MIMEType;
    id v6 = UTI;
    if (+[LPMIMETypeRegistry isARAssetType:v5]) {
      double v7 = 225.0;
    }
    else {
      double v7 = [(NSString *)v6 _lp_isEqualIgnoringCase:@"com.apple.watchface"]
    }
         ? 300.0
         : 600.0;

    -[LPFileMetadataProviderSpecialization requestQuickLookThumbnailForURL:size:badgeType:image:](self, "requestQuickLookThumbnailForURL:size:badgeType:image:", v8, 0, &self->_quickLookThumbnail, 300.0, v7);
    if (+[LPMIMETypeRegistry isARAssetType:self->_MIMEType]) {
      -[LPFileMetadataProviderSpecialization requestQuickLookThumbnailForURL:size:badgeType:image:](self, "requestQuickLookThumbnailForURL:size:badgeType:image:", v8, 1, &self->_smallQuickLookThumbnail, 75.0, 75.0);
    }
  }
}

- (void)fetchMetadataFromURL:(id)a3
{
  id v4 = a3;
  id v5 = [(LPMetadataProviderSpecialization *)self createMetadataWithSpecialization:0];
  metadata = self->_metadata;
  self->_metadata = v5;

  double v7 = objc_alloc_init(LPFileMetadata);
  fileMetadata = self->_fileMetadata;
  self->_fileMetadata = v7;

  if (self->_originalImage) {
    -[LPFileMetadata setThumbnail:](self->_fileMetadata, "setThumbnail:");
  }
  id v9 = (OS_dispatch_group *)dispatch_group_create();
  fetchGroup = self->_fetchGroup;
  self->_fetchGroup = v9;

  id v11 = self->_fetchGroup;
  v12 = +[LPFileMetadataProviderSpecialization _thumbnailQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__LPFileMetadataProviderSpecialization_fetchMetadataFromURL___block_invoke;
  block[3] = &unk_1E5B04E18;
  id v17 = v4;
  v18 = self;
  id v13 = v4;
  dispatch_group_async(v11, v12, block);

  v14 = self->_fetchGroup;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__LPFileMetadataProviderSpecialization_fetchMetadataFromURL___block_invoke_2;
  v15[3] = &unk_1E5B04DF0;
  v15[4] = self;
  dispatch_group_notify(v14, MEMORY[0x1E4F14428], v15);
}

void __61__LPFileMetadataProviderSpecialization_fetchMetadataFromURL___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) URLByResolvingSymlinksInPath];
  int v2 = [v4 checkPromisedItemIsReachableAndReturnError:0];
  id v3 = *(void **)(a1 + 40);
  if (v2) {
    [v3 fetchMetadataForReachableFile:v4];
  }
  else {
    [v3 generateFallbackMetadataForUnreachableFile:v4];
  }
}

uint64_t __61__LPFileMetadataProviderSpecialization_fetchMetadataFromURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48))
  {
    objc_msgSend(*(id *)(v2 + 88), "setThumbnail:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(void *)(v2 + 56))
  {
    objc_msgSend(*(id *)(v2 + 88), "setSmallThumbnail:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 80) setSpecialization:*(void *)(v2 + 88)];
  id v3 = *(void **)(a1 + 32);

  return [v3 complete];
}

- (BOOL)shouldUseQuickLookForFileType
{
  return !+[LPMIMETypeRegistry isAudioType:self->_MIMEType];
}

- (void)fetchMetadataForReachableFile:(id)a3
{
  v99[3] = *MEMORY[0x1E4F143B8];
  location = (id *)&self->_UTI;
  id v86 = a3;
  if (!*location)
  {
    if (!self->_MIMEType
      || (+[LPMIMETypeRegistry UTIForMIMEType:](LPMIMETypeRegistry, "UTIForMIMEType:"),
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          id v12 = *location,
          id *location = (id)v11,
          v12,
          !*location))
    {
      id v96 = 0;
      [v86 getPromisedItemResourceValue:&v96 forKey:*MEMORY[0x1E4F1C728] error:0];
      id v13 = v96;
      id v14 = v96;
      objc_storeStrong(location, v13);
      MIMEType = self->_MIMEType;
      if (MIMEType)
      {
        uint64_t v16 = MIMEType;
      }
      else
      {
        uint64_t v16 = +[LPMIMETypeRegistry MIMETypeForUTI:v14];
      }
      v46 = self->_MIMEType;
      self->_MIMEType = v16;

      if (!*location)
      {
        v47 = [v86 pathExtension];
        uint64_t v48 = +[LPMIMETypeRegistry UTIForFileExtension:v47];
        id v49 = *location;
        id *location = (id)v48;

        v50 = self->_MIMEType;
        if (v50)
        {
          v51 = v50;
        }
        else
        {
          v51 = +[LPMIMETypeRegistry MIMETypeForUTI:*location];
        }
        v80 = self->_MIMEType;
        self->_MIMEType = v51;
      }
    }
  }
  id v4 = [(LPMetadataProviderSpecialization *)self context];
  if ([v4 shouldFetchSubresources])
  {
    BOOL v5 = [(LPFileMetadataProviderSpecialization *)self shouldUseQuickLookForFileType];

    if (v5) {
      [(LPFileMetadataProviderSpecialization *)self fetchIconAndThumbnailFromQuickLookForURL:v86];
    }
  }
  else
  {
  }
  id v6 = *location;
  double v7 = [(id)*MEMORY[0x1E4F443C8] identifier];
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F42980] interactionControllerWithURL:v86];
    uint64_t v10 = [(LPFileMetadata *)self->_fileMetadata icon];
    if (v10)
    {

LABEL_16:
      goto LABEL_17;
    }
    id v17 = [(LPMetadataProviderSpecialization *)self context];
    int v18 = [v17 shouldFetchSubresources];

    if (!v18) {
      goto LABEL_16;
    }
    uint64_t v19 = [(LPImageProperties *)v9 icons];
    uint64_t v20 = [v19 lastObject];
    v21 = CGImageRetain((CGImageRef)objc_msgSend(v20, "_lp_CGImage"));

    if (v21)
    {
      id v9 = objc_alloc_init(LPImageProperties);
      [(LPImageProperties *)v9 setType:5];
      id v22 = [[LPImage alloc] _initWithCGImage:v21 properties:v9];
      [(LPFileMetadata *)self->_fileMetadata setIcon:v22];

      CGImageRelease(v21);
      goto LABEL_16;
    }
  }
LABEL_17:
  uint64_t v23 = *MEMORY[0x1E4F1C5F8];
  uint64_t v24 = *MEMORY[0x1E4F1C540];
  v99[0] = *MEMORY[0x1E4F1C5F8];
  v99[1] = v24;
  uint64_t v82 = *MEMORY[0x1E4F1C628];
  v99[2] = *MEMORY[0x1E4F1C628];
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:3];
  id v95 = 0;
  v87 = [v86 promisedItemResourceValuesForKeys:v25 error:&v95];
  id v83 = v95;

  if (!v87)
  {
    uint64_t v26 = LPLogChannelFetching();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[LPFileMetadataProviderSpecialization fetchMetadataForReachableFile:]((uint64_t)v83, v26);
    }
  }
  v27 = [(LPMetadataProviderSpecialization *)self context];
  id v28 = [v27 postRedirectURL];
  int v29 = [v28 isFileURL];

  if (!v29)
  {
    v35 = [(LPMetadataProviderSpecialization *)self context];
    v38 = [v35 postRedirectURL];
    v39 = [v38 path];
    v40 = [v39 lastPathComponent];
    v41 = [v40 stringByDeletingPathExtension];
    [(LPFileMetadata *)self->_fileMetadata setName:v41];
LABEL_26:

    goto LABEL_37;
  }
  v30 = [(LPMetadataProviderSpecialization *)self context];
  v31 = [v30 postRedirectURL];
  uint64_t v33 = *MEMORY[0x1E4F1C608];
  v98[0] = *MEMORY[0x1E4F1C6C8];
  uint64_t v32 = v98[0];
  v98[1] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
  v35 = [v31 promisedItemResourceValuesForKeys:v34 error:0];

  uint64_t v36 = [v35 objectForKey:v32];
  v37 = (void *)v36;
  if (!v36)
  {
    v39 = [MEMORY[0x1E4F28CB8] defaultManager];
    v40 = [(LPMetadataProviderSpecialization *)self context];
    v41 = [v40 postRedirectURL];
    v42 = [v41 path];
    v43 = [v39 displayNameAtPath:v42];
    [(LPFileMetadata *)self->_fileMetadata setName:v43];

    v38 = 0;
    goto LABEL_26;
  }
  if (v8)
  {
    v38 = (void *)v36;
  }
  else
  {
    v44 = [v35 objectForKey:v33];
    v45 = v44;
    if (v44 && ([v44 BOOLValue] & 1) == 0)
    {
      v38 = [v37 stringByDeletingPathExtension];
    }
    else
    {
      v38 = v37;
    }
  }
  [(LPFileMetadata *)self->_fileMetadata setName:v38];
LABEL_37:

  [(LPFileMetadata *)self->_fileMetadata setType:*location];
  v52 = [v87 objectForKeyedSubscript:v24];
  [(LPFileMetadata *)self->_fileMetadata setCreationDate:v52];

  v53 = [v87 objectForKeyedSubscript:v23];
  -[LPFileMetadata setSize:](self->_fileMetadata, "setSize:", [v53 unsignedLongLongValue]);

  if (![(LPFileMetadata *)self->_fileMetadata size])
  {
    v54 = [v87 objectForKeyedSubscript:v82];
    int v55 = [v54 BOOLValue];

    if (v55)
    {
      v56 = [MEMORY[0x1E4F28CB8] defaultManager];
      v57 = [MEMORY[0x1E4F1C978] arrayWithObject:v23];
      v58 = [v56 enumeratorAtURL:v86 includingPropertiesForKeys:v57 options:0 errorHandler:0];

      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v59 = v58;
      uint64_t v60 = 0;
      uint64_t v61 = [v59 countByEnumeratingWithState:&v91 objects:v97 count:16];
      if (v61)
      {
        uint64_t v62 = *(void *)v92;
        do
        {
          uint64_t v63 = 0;
          do
          {
            if (*(void *)v92 != v62) {
              objc_enumerationMutation(v59);
            }
            v64 = *(void **)(*((void *)&v91 + 1) + 8 * v63);
            id v90 = 0;
            int v65 = [v64 getResourceValue:&v90 forKey:v23 error:0];
            id v66 = v90;
            v67 = v66;
            if (v65) {
              v60 += [v66 integerValue];
            }

            ++v63;
          }
          while (v61 != v63);
          uint64_t v61 = [v59 countByEnumeratingWithState:&v91 objects:v97 count:16];
        }
        while (v61);
      }

      [(LPFileMetadata *)self->_fileMetadata setSize:v60];
    }
  }
  [(LPLinkMetadata *)self->_metadata setSpecialization:self->_fileMetadata];
  [(LPFileMetadataProviderSpecialization *)self updatePreliminaryMetadata];
  if (+[LPMIMETypeRegistry isMediaType:self->_MIMEType])
  {
    v68 = [LPMetadataProviderSpecializationContext alloc];
    locationa = [(LPLinkMetadata *)self->_metadata originalURL];
    v69 = self->_MIMEType;
    v70 = [(LPMetadataProviderSpecialization *)self context];
    v71 = [v70 webView];
    v72 = [(LPMetadataProviderSpecialization *)self context];
    uint64_t v73 = [v72 shouldFetchSubresources];
    v74 = [(LPMetadataProviderSpecialization *)self context];
    uint64_t v75 = [v74 allowedSpecializations];
    v76 = [(LPMetadataProviderSpecialization *)self context];
    LOBYTE(v81) = [v76 fetchIsNotUserInitiated];
    v77 = [(LPMetadataProviderSpecializationContext *)v68 initWithOriginalURL:locationa postRedirectURL:v86 MIMEType:v69 webView:v71 hasLoadedResource:1 shouldFetchSubresources:v73 allowedSpecializations:v75 fetchIsNotUserInitiated:v81];

    v78 = +[LPStreamingMediaMetadataProviderSpecialization specializedMetadataProviderForResourceWithContext:v77];
    [v78 setDelegate:self];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__LPFileMetadataProviderSpecialization_fetchMetadataForReachableFile___block_invoke;
    block[3] = &unk_1E5B04DF0;
    id v89 = v78;
    id v79 = v78;
    dispatch_async(MEMORY[0x1E4F14428], block);
    dispatch_group_enter((dispatch_group_t)self->_fetchGroup);
  }
}

uint64_t __70__LPFileMetadataProviderSpecialization_fetchMetadataForReachableFile___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (void)generateFallbackMetadataForUnreachableFile:(id)a3
{
  id v19 = a3;
  id v4 = [v19 pathExtension];
  BOOL v5 = +[LPMIMETypeRegistry UTIForFileExtension:v4];
  UTI = self->_UTI;
  self->_UTI = v5;

  [(LPFileMetadata *)self->_fileMetadata setType:self->_UTI];
  double v7 = [(LPMetadataProviderSpecialization *)self context];
  char v8 = [v7 postRedirectURL];
  id v9 = [v8 path];
  uint64_t v10 = [v9 lastPathComponent];
  uint64_t v11 = [v10 stringByDeletingPathExtension];
  [(LPFileMetadata *)self->_fileMetadata setName:v11];

  id v12 = [(LPMetadataProviderSpecialization *)self context];
  LODWORD(v8) = [v12 shouldFetchSubresources];

  if (v8)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F42980]);
    [v13 setUTI:self->_UTI];
    id v14 = [v13 icons];
    v15 = [v14 lastObject];
    uint64_t v16 = CGImageRetain((CGImageRef)objc_msgSend(v15, "_lp_CGImage"));

    if (v16)
    {
      id v17 = objc_alloc_init(LPImageProperties);
      [(LPImageProperties *)v17 setType:5];
      id v18 = [[LPImage alloc] _initWithCGImage:v16 properties:v17];
      [(LPFileMetadata *)self->_fileMetadata setIcon:v18];

      CGImageRelease(v16);
    }
  }
}

- (void)cleanUpTemporaryFile
{
  if (self->_temporaryFileURL)
  {
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v3 removeItemAtURL:self->_temporaryFileURL error:0];
  }
}

- (void)cancel
{
  self->_cancelled = 1;
  [(LPFileMetadataProviderSpecialization *)self cleanUpTemporaryFile];
}

- (void)updatePreliminaryMetadata
{
  id v3 = (void *)[(LPLinkMetadata *)self->_metadata copy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__LPFileMetadataProviderSpecialization_updatePreliminaryMetadata__block_invoke;
  v5[3] = &unk_1E5B04E18;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __65__LPFileMetadataProviderSpecialization_updatePreliminaryMetadata__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 metadataProviderSpecialization:*(void *)(a1 + 32) didFetchPreliminaryMetadata:*(void *)(a1 + 40)];
}

- (void)complete
{
  [(LPFileMetadataProviderSpecialization *)self cleanUpTemporaryFile];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__LPFileMetadataProviderSpecialization_complete__block_invoke;
  block[3] = &unk_1E5B04DF0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__LPFileMetadataProviderSpecialization_complete__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 metadataProviderSpecialization:*(void *)(a1 + 32) didCompleteWithMetadata:*(void *)(*(void *)(a1 + 32) + 80)];
}

- (void)metadataProviderSpecialization:(id)a3 didCompleteWithMetadata:(id)a4
{
  id v9 = a4;
  BOOL v5 = [v9 video];
  [(LPLinkMetadata *)self->_metadata setVideo:v5];

  id v6 = [v9 videoMetadata];
  [(LPLinkMetadata *)self->_metadata setVideoMetadata:v6];

  double v7 = [v9 audio];
  [(LPLinkMetadata *)self->_metadata setAudio:v7];

  char v8 = [v9 audioMetadata];
  [(LPLinkMetadata *)self->_metadata setAudioMetadata:v8];

  dispatch_group_leave((dispatch_group_t)self->_fetchGroup);
}

- (void)metadataProviderSpecializationDidFail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchGroup, 0);
  objc_storeStrong((id *)&self->_fileMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_UTI, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_smallQuickLookThumbnail, 0);
  objc_storeStrong((id *)&self->_quickLookThumbnail, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);

  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

void __93__LPFileMetadataProviderSpecialization_requestQuickLookThumbnailForURL_size_badgeType_image___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "LPFileMetadataProviderSpecialization failed to retrieve a thumbnail from QuickLookThumbnailing (%@)", (uint8_t *)&v2, 0xCu);
}

- (void)fetchMetadataForReachableFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve size and creation date of file: %@", (uint8_t *)&v2, 0xCu);
}

@end