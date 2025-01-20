@interface AEMutableAssetPackage
- (AEMutableAssetPackage)initWithAssetIdentifier:(id)a3;
- (id)_copyMetadataFromDisplayAsset:(id)a3;
- (void)addSidecarEntriesFromDictionary:(id)a3;
- (void)beginSupressingLivePhoto;
- (void)endSuppressingLivePhoto;
- (void)expressURLForType:(id)a3;
- (void)removeSidecarObjectForKey:(id)a3;
- (void)removeURLForType:(id)a3;
- (void)replaceURLForType:(id)a3 withURL:(id)a4;
- (void)setMediaOrigin:(int64_t)a3;
- (void)setSidecarObject:(id)a3 forKey:(id)a4;
- (void)storeMetadataFromPHAsset:(id)a3 imageURL:(id)a4 adjustmentURL:(id)a5;
- (void)storeMetadataFromReviewAsset:(id)a3;
- (void)storeURL:(id)a3 forType:(id)a4;
- (void)suppressURLForType:(id)a3;
@end

@implementation AEMutableAssetPackage

- (void)removeSidecarObjectForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [(AEAssetPackage *)self _packageContentQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__AEMutableAssetPackage_removeSidecarObjectForKey___block_invoke;
    v7[3] = &unk_26489BB68;
    v7[4] = self;
    id v8 = v4;
    dispatch_barrier_sync(v5, v7);
  }
  else
  {
    v6 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = 0;
      _os_log_impl(&dword_22B526000, v6, OS_LOG_TYPE_ERROR, "Attempting to remove a sidecar object for an invalid key %{public}@", buf, 0xCu);
    }
  }
}

void __51__AEMutableAssetPackage_removeSidecarObjectForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _contentQueueSidecar];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)addSidecarEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(AEAssetPackage *)self _packageContentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__AEMutableAssetPackage_addSidecarEntriesFromDictionary___block_invoke;
  v7[3] = &unk_26489BB68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __57__AEMutableAssetPackage_addSidecarEntriesFromDictionary___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _contentQueueSidecar];
  [v2 addEntriesFromDictionary:*(void *)(a1 + 40)];
}

- (void)setSidecarObject:(id)a3 forKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v9 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = v6;
      __int16 v16 = 2114;
      id v17 = 0;
      uint64_t v10 = "Attempting to store a sidecar object %{public}@ for an invalid key %{public}@";
LABEL_8:
      _os_log_impl(&dword_22B526000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v6)
  {
    v9 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = 0;
      __int16 v16 = 2114;
      id v17 = v7;
      uint64_t v10 = "Attempting to store an invalid sidecar object %{public}@ for key %{public}@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v8 = [(AEAssetPackage *)self _packageContentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__AEMutableAssetPackage_setSidecarObject_forKey___block_invoke;
  block[3] = &unk_26489BB18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  dispatch_barrier_sync(v8, block);

LABEL_10:
}

void __49__AEMutableAssetPackage_setSidecarObject_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _contentQueueSidecar];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)replaceURLForType:(id)a3 withURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AEAssetPackage *)self _packageContentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__AEMutableAssetPackage_replaceURLForType_withURL___block_invoke;
  block[3] = &unk_26489BB18;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_barrier_sync(v8, block);
}

void __51__AEMutableAssetPackage_replaceURLForType_withURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)removeURLForType:(id)a3
{
  id v4 = a3;
  v5 = [(AEAssetPackage *)self _packageContentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__AEMutableAssetPackage_removeURLForType___block_invoke;
  v7[3] = &unk_26489BB68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __42__AEMutableAssetPackage_removeURLForType___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 removeObject:*(void *)(a1 + 40)];
}

- (void)storeURL:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AEAssetPackage *)self _packageContentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AEMutableAssetPackage_storeURL_forType___block_invoke;
  block[3] = &unk_26489BB18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(v8, block);
}

void __42__AEMutableAssetPackage_storeURL_forType___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 removeObject:*(void *)(a1 + 48)];
}

- (AEMutableAssetPackage)initWithAssetIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AEMutableAssetPackage;
  return [(AEAssetPackage *)&v4 initWithAssetIdentifier:a3 durableURLs:0 sidecar:0];
}

- (void)expressURLForType:(id)a3
{
  id v4 = a3;
  v5 = [(AEAssetPackage *)self _packageContentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__AEMutableAssetPackage_AEURLSuppression__expressURLForType___block_invoke;
  v7[3] = &unk_26489BB68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __61__AEMutableAssetPackage_AEURLSuppression__expressURLForType___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 removeObject:*(void *)(a1 + 40)];
  }
}

- (void)suppressURLForType:(id)a3
{
  id v4 = a3;
  v5 = [(AEAssetPackage *)self _packageContentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__AEMutableAssetPackage_AEURLSuppression__suppressURLForType___block_invoke;
  v7[3] = &unk_26489BB68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __62__AEMutableAssetPackage_AEURLSuppression__suppressURLForType___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v4)
  {
    int v3 = objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
    [v3 addObject:*(void *)(a1 + 40)];
  }
}

- (void)storeMetadataFromPHAsset:(id)a3 imageURL:(id)a4 adjustmentURL:(id)a5
{
  id v27 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AEMutableAssetPackage *)self _copyMetadataFromDisplayAsset:v27];
  [v27 isMediaSubtype:1024];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v27, "mediaSubtypes"));
  [v10 setValue:v11 forKey:@"AEAssetPackageDisplayMediaSubtypes"];

  if (v8)
  {
    id v12 = [MEMORY[0x263F08850] defaultManager];
    id v13 = [v8 path];
    int v14 = [v12 fileExistsAtPath:v13];

    if (v14)
    {
      CFDataRef v15 = (const __CFData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v8 options:1 error:0];
      if ([(__CFData *)v15 length])
      {
        __int16 v16 = CGImageSourceCreateWithData(v15, 0);
        if (v16)
        {
          id v17 = v16;
          CFDictionaryRef v18 = CGImageSourceCopyProperties(v16, 0);
          [v10 setValue:v18 forKey:@"AEAssetPackageDisplayImageMetadata"];
          CFRelease(v17);
        }
      }
    }
  }
  int v19 = [v27 isHighFramerateVideo];
  if (v9 && v19)
  {
    v20 = (void *)[objc_alloc(MEMORY[0x263F5DFA8]) initWithURL:v9];
    if ([v20 isRecognizedFormat])
    {
      v21 = [v20 propertyListDictionary];
      [v10 setValue:v21 forKey:@"com.apple.video.slomo"];
    }
  }
  if ([v27 playbackStyle] == 5 && objc_msgSend(v27, "mediaType") == 1)
  {
    [v10 setValue:&unk_26DEBDDA8 forKey:@"AEAssetPackageDisplayMediaType"];
    v22 = [v10 objectForKey:@"AEAssetPackageDisplayMediaSubtypes"];

    if (v22)
    {
      v23 = [v10 objectForKey:@"AEAssetPackageDisplayMediaSubtypes"];
      uint64_t v24 = [v23 unsignedIntegerValue];

      v25 = NSNumber;
    }
    else
    {
      v25 = NSNumber;
      uint64_t v24 = [v27 mediaSubtypes];
    }
    v26 = [v25 numberWithUnsignedInteger:v24 & 0xFFFFFFFFFFFFFFF7];
    [v10 setValue:v26 forKey:@"AEAssetPackageDisplayMediaSubtypes"];
  }
  [(AEMutableAssetPackage *)self addSidecarEntriesFromDictionary:v10];
}

- (void)storeMetadataFromReviewAsset:(id)a3
{
  id v10 = a3;
  id v4 = [(AEMutableAssetPackage *)self _copyMetadataFromDisplayAsset:v10];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "mediaSubtypes"));
  [v4 setValue:v5 forKey:@"AEAssetPackageDisplayMediaSubtypes"];

  id v6 = [v10 providedImageMetadata];
  [v4 setValue:v6 forKey:@"AEAssetPackageDisplayImageMetadata"];

  id v7 = [v10 assetAdjustments];
  id v8 = [v7 propertyListDictionary];
  if (v8)
  {
    if (([v10 mediaSubtypes] & 0x20000) != 0) {
      id v9 = @"com.apple.video.slomo";
    }
    else {
      id v9 = @"com.apple.assetexplorer.editedadjustments";
    }
    [v4 setValue:v8 forKey:v9];
  }
  [(AEMutableAssetPackage *)self addSidecarEntriesFromDictionary:v4];
}

- (id)_copyMetadataFromDisplayAsset:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "mediaType"));
  [v4 setValue:v5 forKey:@"AEAssetPackageDisplayMediaType"];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "pixelWidth"));
  [v4 setValue:v6 forKey:@"AEAssetPackageDisplayPixelWidth"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "pixelHeight"));
  [v4 setValue:v7 forKey:@"AEAssetPackageDisplayPixelHeight"];

  id v8 = NSNumber;
  [v3 duration];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  [v4 setValue:v9 forKey:@"AEAssetPackageDisplayDuration"];

  id v10 = [v3 creationDate];
  [v4 setValue:v10 forKey:@"AEAssetPackageDisplayCreationDate"];

  uint64_t v11 = [v3 modificationDate];
  [v4 setValue:v11 forKey:@"AEAssetPackageDisplayModificationDate"];

  id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isPhotoIrisPlaceholder"));
  [v4 setValue:v12 forKey:@"AEAssetPackageDisplayIsLivePhotoPlaceholder"];

  id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "hasPhotoColorAdjustments"));
  [v4 setValue:v13 forKey:@"AEAssetPackageDisplayHasPhotoColorAdjustments"];

  int v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "playbackStyle"));
  [v4 setValue:v14 forKey:@"AEAssetPackageDisplayPlaybackStyle"];

  CFDataRef v15 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v3, "playbackVariation"));
  [v4 setValue:v15 forKey:@"AEAssetPackageDisplayPlaybackVariation"];

  memset(&v24, 0, sizeof(v24));
  if (v3)
  {
    [v3 photoIrisStillDisplayTime];
    __int16 v16 = (const __CFAllocator **)MEMORY[0x263EFFB08];
    if (v24.flags)
    {
      CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CMTime time = v24;
      CFDictionaryRef v18 = CMTimeCopyAsDictionary(&time, v17);
      [v4 setValue:v18 forKey:@"AEAssetPackageDisplayLivePhotoStillDisplayTime"];
    }
    memset(&time, 0, sizeof(time));
    [v3 photoIrisVideoDuration];
    if (time.flags)
    {
      CFAllocatorRef v19 = *v16;
      CMTime v22 = time;
      CFDictionaryRef v20 = CMTimeCopyAsDictionary(&v22, v19);
      [v4 setValue:v20 forKey:@"AEAssetPackageDisplayLivePhotoVideoDuration"];
    }
  }

  return v4;
}

- (void)endSuppressingLivePhoto
{
  id v3 = [(id)*MEMORY[0x263F1DBC8] identifier];
  [(AEMutableAssetPackage *)self expressURLForType:v3];
}

- (void)beginSupressingLivePhoto
{
  id v3 = (void *)*MEMORY[0x263F1DBC8];
  id v4 = [(id)*MEMORY[0x263F1DBC8] identifier];
  id v6 = [(AEAssetPackage *)self currentURLForType:v4];

  if (v6)
  {
    v5 = [v3 identifier];
    [(AEMutableAssetPackage *)self suppressURLForType:v5];
  }
}

- (void)setMediaOrigin:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(AEMutableAssetPackage *)self setSidecarObject:v4 forKey:@"AEAssetPackageMediaOrigin"];
}

@end