@interface AEFileAssetPackageGenerator
+ (id)calculateLivePhotoVideoPath:(id)a3;
+ (id)generateAssetFromFileURLs:(id)a3 previewImage:(id)a4 error:(id *)a5;
+ (id)videoComplementFromFileURL:(id)a3 metadata:(id)a4;
+ (int64_t)playbackStyleFromMetadata:(id)a3 isLivePhoto:(BOOL)a4;
+ (unint64_t)mediaSubtypeFromMetadata:(id)a3;
+ (void)generateMetadataFromFileURLs:(id)a3 fileURL:(id *)a4 videoComplementURL:(id *)a5 metadata:(id *)a6;
@end

@implementation AEFileAssetPackageGenerator

+ (id)calculateLivePhotoVideoPath:(id)a3
{
  v3 = [a3 path];
  v4 = [v3 stringByDeletingPathExtension];
  v5 = [v4 stringByAppendingPathExtension:@"MOV"];

  v6 = [MEMORY[0x263F08850] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if (v7) {
    goto LABEL_4;
  }
  v8 = [v5 stringByDeletingPathExtension];
  v9 = [v8 stringByAppendingPathExtension:@"mov"];

  v10 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v8) = [v10 fileExistsAtPath:v9];

  if (v8)
  {
    v5 = v9;
LABEL_4:
    id v11 = v5;
    v9 = v11;
    goto LABEL_6;
  }
  id v11 = 0;
LABEL_6:

  return v11;
}

+ (id)videoComplementFromFileURL:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [a4 livePhotoPairingIdentifier];
  if (v6)
  {
    char v7 = +[AEFileAssetPackageGenerator calculateLivePhotoVideoPath:v5];
    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x263F5DFB0]);
      v9 = [v5 path];
      long long v12 = *MEMORY[0x263F01090];
      uint64_t v13 = *(void *)(MEMORY[0x263F01090] + 16);
      v10 = (void *)[v8 initWithPathToVideo:v7 pathToImage:v9 imageDisplayTime:&v12 pairingIdentifier:0];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (int64_t)playbackStyleFromMetadata:(id)a3 isLivePhoto:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 isImage])
  {
    int v6 = [v5 isAnimatedImage];
    uint64_t v7 = 3;
    if (!v4) {
      uint64_t v7 = 1;
    }
    if (v6) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = v7;
    }
  }
  else if ([v5 isMovie])
  {
    if ([v5 isAutoloop]) {
      int64_t v8 = 5;
    }
    else {
      int64_t v8 = 4;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

+ (unint64_t)mediaSubtypeFromMetadata:(id)a3
{
  if ([a3 isSpatialMedia]) {
    return 1024;
  }
  else {
    return 0;
  }
}

+ (void)generateMetadataFromFileURLs:(id)a3 fileURL:(id *)a4 videoComplementURL:(id *)a5 metadata:(id *)a6
{
  id v16 = a3;
  id v9 = objc_alloc(MEMORY[0x263F5DF20]);
  v10 = [v16 firstObject];
  id v11 = (void *)[v9 initWithMediaURL:v10 options:13 timeZoneLookup:0 shouldCache:1];

  if ([v16 count] != 2
    || (id v12 = objc_alloc(MEMORY[0x263F5DF20]),
        [v16 lastObject],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v14 = (void *)[v12 initWithMediaURL:v13 options:13 timeZoneLookup:0 shouldCache:1],
        v13,
        !v14))
  {
    *a4 = [v16 firstObject];
    *a5 = 0;
    id v15 = v11;
    v14 = 0;
    goto LABEL_7;
  }
  if ([v11 isImage] && objc_msgSend(v14, "isMovie"))
  {
    *a4 = [v16 firstObject];
    *a5 = [v16 lastObject];
    id v15 = v11;
LABEL_7:
    *a6 = v15;
    goto LABEL_8;
  }
  if ([v11 isMovie] && objc_msgSend(v14, "isImage"))
  {
    *a4 = [v16 lastObject];
    *a5 = [v16 firstObject];
    id v15 = v14;
    v14 = v15;
    goto LABEL_7;
  }
LABEL_8:
}

+ (id)generateAssetFromFileURLs:(id)a3 previewImage:(id)a4 error:(id *)a5
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    if (a5)
    {
      id v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    goto LABEL_13;
  }
  if ((unint64_t)[v7 count] >= 3)
  {
    if (a5)
    {
      id v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = 1;
LABEL_7:
      [v9 errorWithDomain:@"AEFileAssetPackageGeneratorErrorDomain" code:v10 userInfo:0];
      id v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
LABEL_13:
    id v11 = 0;
    goto LABEL_48;
  }
  id v57 = 0;
  id v58 = 0;
  id v56 = 0;
  +[AEFileAssetPackageGenerator generateMetadataFromFileURLs:v7 fileURL:&v58 videoComplementURL:&v57 metadata:&v56];
  id v12 = (__CFString *)v58;
  id v13 = v57;
  id v14 = v56;
  id v15 = v14;
  if (v12 && v14)
  {
    id v16 = [MEMORY[0x263F08C38] UUID];
    uint64_t v17 = [v16 UUIDString];

    id v11 = [[AEMutableAssetPackage alloc] initWithAssetIdentifier:v17];
    id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    unsigned int v54 = [v15 isImage];
    if (v54)
    {
      v19 = [(id)*MEMORY[0x263F1DB18] identifier];
      [(AEMutableAssetPackage *)v11 storeURL:v12 forType:v19];

      if (!v13)
      {
        unsigned int v54 = 0;
LABEL_18:
        [v15 orientedPixelSize];
        double v23 = v22;
        double v25 = v24;
        [v8 size];
        CGFloat v28 = v26;
        CGFloat v29 = v27;
        v53 = (void *)v17;
        if (v8 && v23 == v26 && v25 == v27)
        {
          v30 = PLAssetExplorerGetLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B526000, v30, OS_LOG_TYPE_DEFAULT, "Using preview image from preview.", buf, 2u);
          }

          [(AEMutableAssetPackage *)v11 setSidecarObject:v8 forKey:@"com.apple.assetexplorer.asset-preview-image"];
        }
        else
        {
          int v31 = [v15 isImage];
          v32 = PLAssetExplorerGetLog();
          BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          if (v31)
          {
            if (v33)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22B526000, v32, OS_LOG_TYPE_DEFAULT, "Generating preview image.", buf, 2u);
            }

            id v34 = objc_alloc(MEMORY[0x263F827E8]);
            v35 = [(__CFString *)v12 path];
            v36 = (void *)[v34 initWithContentsOfFile:v35];

            [(AEMutableAssetPackage *)v11 setSidecarObject:v36 forKey:@"com.apple.assetexplorer.asset-preview-image"];
          }
          else
          {
            if (v33)
            {
              v37 = @"not nil";
              if (!v8) {
                v37 = @"nil";
              }
              v52 = v37;
              v69.width = v23;
              v69.height = v25;
              NSStringFromCGSize(v69);
              v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v70.width = v28;
              v70.height = v29;
              v39 = NSStringFromCGSize(v70);
              int v40 = [v15 isImage];
              v41 = @"NO";
              *(_DWORD *)buf = 138413058;
              v60 = v52;
              __int16 v61 = 2112;
              if (v40) {
                v41 = @"YES";
              }
              v62 = v38;
              __int16 v63 = 2112;
              v64 = v39;
              __int16 v65 = 2112;
              v66 = v41;
              _os_log_impl(&dword_22B526000, v32, OS_LOG_TYPE_DEFAULT, "Not generating preview. previewImage = %@, size = %@, previewImage.size = %@, isImage = %@", buf, 0x2Au);
            }
          }
        }
        v42 = [NSNumber numberWithDouble:v23];
        [v18 setValue:v42 forKey:@"AEAssetPackageDisplayPixelWidth"];

        v43 = [NSNumber numberWithDouble:v25];
        [v18 setValue:v43 forKey:@"AEAssetPackageDisplayPixelHeight"];

        v44 = [v15 creationDate];
        [v18 setValue:v44 forKey:@"AEAssetPackageDisplayCreationDate"];

        if ([v15 isImage]) {
          uint64_t v45 = 1;
        }
        else {
          uint64_t v45 = 2;
        }
        v46 = [NSNumber numberWithInteger:v45];
        [v18 setValue:v46 forKey:@"AEAssetPackageDisplayMediaType"];

        v47 = objc_msgSend(NSNumber, "numberWithInteger:", +[AEFileAssetPackageGenerator playbackStyleFromMetadata:isLivePhoto:](AEFileAssetPackageGenerator, "playbackStyleFromMetadata:isLivePhoto:", v15, v54));
        [v18 setValue:v47 forKey:@"AEAssetPackageDisplayPlaybackStyle"];

        v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[AEFileAssetPackageGenerator mediaSubtypeFromMetadata:](AEFileAssetPackageGenerator, "mediaSubtypeFromMetadata:", v15));
        [v18 setValue:v48 forKey:@"AEAssetPackageDisplayMediaSubtypes"];

        [(AEMutableAssetPackage *)v11 addSidecarEntriesFromDictionary:v18];
        v49 = PLAssetExplorerGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          if (v13)
          {
            v50 = [NSString stringWithFormat:@" and video complement url %@", v13];
          }
          else
          {
            v50 = &stru_26DEB7A80;
          }
          *(_DWORD *)buf = 138412546;
          v60 = v12;
          __int16 v61 = 2112;
          v62 = v50;
          _os_log_impl(&dword_22B526000, v49, OS_LOG_TYPE_DEFAULT, "Package generated from file url %@%@", buf, 0x16u);
          if (v13) {
        }
          }
        goto LABEL_47;
      }
      v20 = [(id)*MEMORY[0x263F1DBC8] identifier];
      [(AEMutableAssetPackage *)v11 storeURL:v13 forType:v20];
    }
    else
    {
      v21 = [(id)*MEMORY[0x263F1DBC8] identifier];
      [(AEMutableAssetPackage *)v11 storeURL:v12 forType:v21];

      [v15 duration];
      v20 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
      [v18 setValue:v20 forKey:@"AEAssetPackageDisplayDuration"];
    }

    goto LABEL_18;
  }
  if (a5)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"AEFileAssetPackageGeneratorErrorDomain" code:2 userInfo:0];
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_47:

LABEL_48:
  return v11;
}

@end