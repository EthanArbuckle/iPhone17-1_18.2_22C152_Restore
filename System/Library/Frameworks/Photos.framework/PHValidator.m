@interface PHValidator
+ (BOOL)isSupportedAudioAtPath:(id)a3;
+ (BOOL)isSupportedImageAtPath:(id)a3;
+ (BOOL)isSupportedMovieAtPath:(id)a3;
+ (unsigned)mediaTypeForContentType:(id)a3;
+ (unsigned)mediaTypeForURL:(id)a3;
- (BOOL)_validateImageSource:(CGImageSource *)a3 error:(id *)a4;
- (BOOL)_validateLivePhotoResourceURLs:(id)a3 videoComplementMetadata:(id)a4 error:(id *)a5;
- (BOOL)_validateVideoURL:(id)a3 error:(id *)a4;
- (BOOL)getLivePhotoVideoMetadataFromURL:(id)a3 videoComplementMetadata:(id)a4 pairingIdentifier:(id *)a5 videoDuration:(id *)a6 imageDisplayTime:(id *)a7 error:(id *)a8;
- (BOOL)isValidImagePathExtension:(id)a3;
- (BOOL)isValidVideoPathExtension:(id)a3;
- (BOOL)validateData:(id)a3 withOptions:(unint64_t)a4 error:(id *)a5;
- (BOOL)validateURL:(id)a3 withOptions:(unint64_t)a4 error:(id *)a5;
- (BOOL)validateURLs:(id)a3 withOptions:(unint64_t)a4 error:(id *)a5;
- (BOOL)validateURLs:(id)a3 withOptions:(unint64_t)a4 videoComplementMetadata:(id)a5 error:(id *)a6;
- (void)getLivePhotoImageMetadataFromURL:(id)a3 pairingIdentifier:(id *)a4;
@end

@implementation PHValidator

+ (BOOL)isSupportedImageAtPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F8CDF8];
  v4 = [a3 pathExtension];
  v5 = [MEMORY[0x1E4F8CDF8] supportedImageTypes];
  LOBYTE(v3) = [v3 filenameExtension:v4 conformsToOneOfTypes:v5];

  return (char)v3;
}

+ (BOOL)isSupportedMovieAtPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F8CDF8];
  v4 = [a3 pathExtension];
  v5 = [MEMORY[0x1E4F8CDF8] supportedMovieTypes];
  LOBYTE(v3) = [v3 filenameExtension:v4 conformsToOneOfTypes:v5];

  return (char)v3;
}

+ (BOOL)isSupportedAudioAtPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F8CDF8];
  v4 = [a3 pathExtension];
  v5 = [MEMORY[0x1E4F8CDF8] supportedAudioTypes];
  LOBYTE(v3) = [v3 filenameExtension:v4 conformsToOneOfTypes:v5];

  return (char)v3;
}

+ (unsigned)mediaTypeForURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F8CDF8] typeForURL:v4 error:0];
    int v6 = [a1 mediaTypeForContentType:v5];
    if (v6 == 4)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F166C8]) initWithURL:v4 options:0];
      BOOL v11 = [v8 isPlayable] == 0;
      char v12 = 4;
      char v13 = 8;
    }
    else
    {
      unsigned __int8 v7 = v6;
      if (v6 != 16)
      {
LABEL_11:

        goto LABEL_12;
      }
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F166C8]) initWithURL:v4 options:0];
      v9 = [MEMORY[0x1E4F8CC38] mainVideoTrackForAsset:v8];
      int v10 = [v9 isDecodable];

      BOOL v11 = v10 == 0;
      char v12 = 16;
      char v13 = 32;
    }
    if (v11) {
      unsigned __int8 v7 = v12;
    }
    else {
      unsigned __int8 v7 = v13;
    }

    goto LABEL_11;
  }
  unsigned __int8 v7 = 0;
LABEL_12:

  return v7;
}

+ (unsigned)mediaTypeForContentType:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v4 = [MEMORY[0x1E4F8CDF8] supportedImageTypes];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v37 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([v3 conformsToType:*(void *)(*((void *)&v36 + 1) + 8 * i)])
          {
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            v18 = [MEMORY[0x1E4F8CDF8] imageTypesUnsupportedForImport];
            uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v42 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v33;
              while (2)
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v33 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  if ([v3 conformsToType:*(void *)(*((void *)&v32 + 1) + 8 * j)])
                  {
                    unsigned __int8 v17 = 1;
                    goto LABEL_38;
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v42 count:16];
                if (v20) {
                  continue;
                }
                break;
              }
            }
            unsigned __int8 v17 = 2;
LABEL_38:

            goto LABEL_41;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v36 objects:v43 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = [MEMORY[0x1E4F8CDF8] supportedMovieTypes];
    uint64_t v9 = [v4 countByEnumeratingWithState:&v28 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (uint64_t k = 0; k != v10; ++k)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v4);
          }
          if ([v3 conformsToType:*(void *)(*((void *)&v28 + 1) + 8 * k)])
          {
            unsigned __int8 v17 = 16;
            goto LABEL_41;
          }
        }
        uint64_t v10 = [v4 countByEnumeratingWithState:&v28 objects:v41 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = objc_msgSend(MEMORY[0x1E4F8CDF8], "supportedAudioTypes", 0);
    uint64_t v13 = [v4 countByEnumeratingWithState:&v24 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      while (2)
      {
        for (uint64_t m = 0; m != v14; ++m)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v4);
          }
          if ([v3 conformsToType:*(void *)(*((void *)&v24 + 1) + 8 * m)])
          {
            unsigned __int8 v17 = 4;
            goto LABEL_41;
          }
        }
        uint64_t v14 = [v4 countByEnumeratingWithState:&v24 objects:v40 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    unsigned __int8 v17 = 0;
LABEL_41:
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (BOOL)getLivePhotoVideoMetadataFromURL:(id)a3 videoComplementMetadata:(id)a4 pairingIdentifier:(id *)a5 videoDuration:(id *)a6 imageDisplayTime:(id *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unsigned __int8 v17 = [v13 path];
  uint64_t v15 = PFVideoComplementMetadataForVideoAtPath();
  id v16 = 0;

  if (a5)
  {
LABEL_3:
    *a5 = [v15 pairingIdentifier];
  }
LABEL_4:
  if (a6)
  {
    if (v15)
    {
      [v15 videoDuration];
    }
    else
    {
      long long v19 = 0uLL;
      int64_t v20 = 0;
    }
    *(_OWORD *)&a6->var0 = v19;
    a6->var3 = v20;
  }
  if (a7)
  {
    if (v15)
    {
      [v15 imageDisplayTime];
    }
    else
    {
      long long v19 = 0uLL;
      int64_t v20 = 0;
    }
    *(_OWORD *)&a7->var0 = v19;
    a7->var3 = v20;
  }
  if (a8) {
    *a8 = v16;
  }

  return v15 != 0;
}

- (void)getLivePhotoImageMetadataFromURL:(id)a3 pairingIdentifier:(id *)a4
{
  uint64_t v5 = [a3 path];
  PFReadPairingIdentifierFromImageAtPath();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (a4) {
    *a4 = v6;
  }
}

- (BOOL)_validateLivePhotoResourceURLs:(id)a3 videoComplementMetadata:(id)a4 error:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v37 = a4;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__43404;
  v58 = __Block_byref_object_dispose__43405;
  id v59 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PHValidator__validateLivePhotoResourceURLs_videoComplementMetadata_error___block_invoke;
  aBlock[3] = &unk_1E5847DE0;
  aBlock[4] = self;
  aBlock[5] = &v50;
  aBlock[6] = &v54;
  aBlock[7] = a2;
  uint64_t v9 = (void (**)(void *, uint64_t, __CFString *, void))_Block_copy(aBlock);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v62 count:16];
  if (!v11)
  {

    char v12 = 0;
    goto LABEL_21;
  }
  char v12 = 0;
  id v13 = 0;
  uint64_t v14 = *(void *)v46;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v46 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      unsigned __int8 v17 = [v16 pathExtension];
      if ([(PHValidator *)self isValidImagePathExtension:v17])
      {
        if (v13)
        {
          long long v19 = @"Multiple image resources";
LABEL_19:
          v9[2](v9, 3302, v19, 0);

          goto LABEL_20;
        }
        id v13 = v16;
      }
      else
      {
        if (![(PHValidator *)self isValidVideoPathExtension:v17]) {
          goto LABEL_13;
        }
        if (v12)
        {
          long long v19 = @"Multiple video resources";
          goto LABEL_19;
        }
        char v12 = v16;
      }
      id v18 = v16;
LABEL_13:
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v62 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_20:

  if (!v13)
  {
LABEL_21:
    v9[2](v9, 3303, @"Missing image resource", 0);
    id v13 = 0;
  }
  if (!v12) {
    v9[2](v9, 3303, @"Missing video resource", 0);
  }
  int64_t v20 = (void *)v55[5];
  if (!v20)
  {
    id v44 = 0;
    [(PHValidator *)self getLivePhotoImageMetadataFromURL:v13 pairingIdentifier:&v44];
    id v21 = v44;
    if (!v21) {
      v9[2](v9, 3302, @"Invalid image metadata", 0);
    }
    long long v42 = *MEMORY[0x1E4F1F9F8];
    uint64_t v43 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    long long v40 = v42;
    uint64_t v41 = v43;
    id v38 = 0;
    id v39 = 0;
    [(PHValidator *)self getLivePhotoVideoMetadataFromURL:v12 videoComplementMetadata:v37 pairingIdentifier:&v39 videoDuration:&v42 imageDisplayTime:&v40 error:&v38];
    id v22 = v39;
    id v23 = v38;
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = v24;
    if (!v22) {
      [v24 addObject:@"pairing identifier"];
    }
    if ((BYTE12(v42) & 0x1D) != 1) {
      [v25 addObject:@"video duration"];
    }
    if ((BYTE12(v40) & 0x1D) != 1)
    {
      long long v26 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v23;
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "PHValidator: non-fatal error, invalid or missing image display time, underlying error: %@", buf, 0xCu);
      }
    }
    if ([v25 count])
    {
      long long v27 = NSString;
      long long v28 = [v25 componentsJoinedByString:@", "];
      long long v29 = [v27 stringWithFormat:@"Invalid video metadata: %@", v28];
      ((void (**)(void *, uint64_t, __CFString *, id))v9)[2](v9, 3302, v29, v23);
    }
    if (!v55[5] && ([v21 isEqualToString:v22] & 1) == 0)
    {
      long long v30 = [NSString stringWithFormat:@"Invalid image/video pairing, image identifier (%@) does not match video identifier (%@)", v21, v22];
      v9[2](v9, 3302, v30, 0);
    }
    int64_t v20 = (void *)v55[5];
  }
  int v31 = *((unsigned __int8 *)v51 + 24);
  id v32 = v20;
  long long v33 = v32;
  if (!v31 && a5) {
    *a5 = v32;
  }

  BOOL v34 = *((unsigned char *)v51 + 24) != 0;
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  return v34;
}

void __76__PHValidator__validateLivePhotoResourceURLs_videoComplementMetadata_error___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a1[7], a1[4], @"PHValidator.m", 283, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  uint64_t v9 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v7;
    _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEFAULT, "invalid live photo resource: %{public}@", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28228]];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", a2, v10);
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (BOOL)_validateVideoURL:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  if (v5)
  {
    id v6 = (void *)MEMORY[0x19F389B10]();
    id v7 = (void *)MEMORY[0x1E4F8AA78];
    id v8 = [v5 path];
    int v9 = [v7 canSaveVideoToLibrary:v8];

    if (v9)
    {
      id v10 = [MEMORY[0x1E4F16330] assetWithURL:v5];
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      uint64_t v12 = (void *)MEMORY[0x1E4F16360];
      uint64_t v13 = *MEMORY[0x1E4F156F0];
      uint64_t v14 = *MEMORY[0x1E4F15AA8];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __39__PHValidator__validateVideoURL_error___block_invoke;
      v24[3] = &unk_1E5847DB8;
      long long v26 = &v27;
      uint64_t v15 = v11;
      long long v25 = v15;
      [v12 determineCompatibilityOfExportPreset:v13 withAsset:v10 outputFileType:v14 completionHandler:v24];
      dispatch_time_t v16 = dispatch_time(0, 20000000000);
      BOOL v17 = dispatch_semaphore_wait(v15, v16) != 0;
    }
    else
    {
      BOOL v17 = 0;
    }
    if (*((unsigned char *)v28 + 24))
    {
      id v18 = 0;
    }
    else
    {
      id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Incompatible video");
      long long v19 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = *((unsigned __int8 *)v28 + 24);
        *(_DWORD *)buf = 138413058;
        id v32 = v5;
        __int16 v33 = 1024;
        int v34 = v9;
        __int16 v35 = 1024;
        int v36 = v20;
        __int16 v37 = 1024;
        BOOL v38 = v17;
        _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Incompatible video %@ (compatible=%d, valid=%d, timeout=%d)", buf, 0x1Eu);
      }
    }
  }
  else
  {
    id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3303, @"Missing video URL");
  }
  int v21 = *((unsigned __int8 *)v28 + 24);
  if (a4 && !*((unsigned char *)v28 + 24))
  {
    *a4 = v18;
    int v21 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v22 = v21 != 0;

  _Block_object_dispose(&v27, 8);
  return v22;
}

intptr_t __39__PHValidator__validateVideoURL_error___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_validateImageSource:(CGImageSource *)a3 error:(id *)a4
{
  if (a3)
  {
    id v6 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:CGImageSourceGetType(a3)];
    if ([v6 conformsToType:*MEMORY[0x1E4F44400]])
    {
      if (CGImageSourceGetCount(a3))
      {
        id v7 = 0;
        BOOL v8 = 1;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Empty image source", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Invalidate image type (%@)", v6);
    id v7 = };
    BOOL v8 = 0;
LABEL_10:

    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3303, @"Missing image source");
  BOOL v8 = 0;
  if (!a4) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v8) {
    *a4 = v7;
  }
LABEL_13:

  return v8;
}

- (BOOL)isValidVideoPathExtension:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F8CDF8];
  id v4 = a3;
  id v5 = [v3 supportedMovieTypes];
  LOBYTE(v3) = [v3 filenameExtension:v4 conformsToOneOfTypes:v5];

  return (char)v3;
}

- (BOOL)isValidImagePathExtension:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F8CDF8];
  id v4 = a3;
  id v5 = [v3 supportedImageTypes];
  LOBYTE(v3) = [v3 filenameExtension:v4 conformsToOneOfTypes:v5];

  return (char)v3;
}

- (BOOL)validateData:(id)a3 withOptions:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  int v9 = [[_PHValidation alloc] initWithOptions:a4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__PHValidator_validateData_withOptions_error___block_invoke;
  v13[3] = &unk_1E5848EC0;
  id v14 = v8;
  uint64_t v15 = self;
  dispatch_time_t v16 = v9;
  uint64_t v10 = v9;
  id v11 = v8;
  [(_PHValidation *)v10 validateOption:16 usingBlock:v13];
  LOBYTE(a5) = [(_PHValidation *)v10 isValid:a5];

  return (char)a5;
}

void __46__PHValidator_validateData_withOptions_error___block_invoke(uint64_t a1)
{
  CGImageSourceRef v2 = CGImageSourceCreateWithData(*(CFDataRef *)(a1 + 32), 0);
  id v3 = *(void **)(a1 + 40);
  id v6 = 0;
  uint64_t v4 = [v3 _validateImageSource:v2 error:&v6];
  id v5 = v6;
  [*(id *)(a1 + 48) assert:v4 error:v5];
  if (v2) {
    CFRelease(v2);
  }
}

- (BOOL)validateURLs:(id)a3 withOptions:(unint64_t)a4 videoComplementMetadata:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  unint64_t v12 = a4 | 2;
  if ((a4 & 0x70) == 0) {
    unint64_t v12 = a4;
  }
  uint64_t v13 = [[_PHValidation alloc] initWithOptions:(v12 >> 1) & 1 | v12];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke;
  v58[3] = &unk_1E5848DF0;
  id v14 = v10;
  id v59 = v14;
  uint64_t v15 = v13;
  v60 = v15;
  [(_PHValidation *)v15 validateOption:1 usingBlock:v58];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_2;
  v55[3] = &unk_1E5848DF0;
  id v16 = v14;
  id v56 = v16;
  BOOL v17 = v15;
  v57 = v17;
  [(_PHValidation *)v17 validateOption:2 usingBlock:v55];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_3;
  v51[3] = &unk_1E5848EC0;
  id v18 = v16;
  id v52 = v18;
  long long v19 = v17;
  char v53 = v19;
  uint64_t v54 = self;
  [(_PHValidation *)v19 validateOption:4 usingBlock:v51];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_4;
  v47[3] = &unk_1E5848EC0;
  id v20 = v18;
  id v48 = v20;
  int v21 = v19;
  v49 = v21;
  uint64_t v50 = self;
  [(_PHValidation *)v21 validateOption:8 usingBlock:v47];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_5;
  v43[3] = &unk_1E5848EC0;
  id v22 = v20;
  id v44 = v22;
  long long v45 = self;
  id v23 = v21;
  long long v46 = v23;
  [(_PHValidation *)v23 validateOption:16 usingBlock:v43];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_6;
  v39[3] = &unk_1E5848EC0;
  id v24 = v22;
  id v40 = v24;
  uint64_t v41 = self;
  long long v25 = v23;
  long long v42 = v25;
  [(_PHValidation *)v25 validateOption:32 usingBlock:v39];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  __int16 v33 = __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_7;
  int v34 = &unk_1E5847D90;
  __int16 v35 = self;
  id v36 = v24;
  id v37 = v11;
  BOOL v38 = v25;
  long long v26 = v25;
  id v27 = v11;
  id v28 = v24;
  [(_PHValidation *)v26 validateOption:64 usingBlock:&v31];
  BOOL v29 = -[_PHValidation isValid:](v26, "isValid:", a6, v31, v32, v33, v34, v35);

  return v29;
}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) assert:objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "isFileURL"), 3302, @"not a file URL: %@", *(void *)(*((void *)&v7 + 1) + 8 * v6) code format];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * v5);
        char v11 = 0;
        long long v7 = [MEMORY[0x1E4F28CB8] defaultManager];
        long long v8 = [v6 path];
        uint64_t v9 = [v7 fileExistsAtPath:v8 isDirectory:&v11];

        [*(id *)(a1 + 40) assert:v9, 3303, @"file doesn't exist: %@", v6 code format];
        [*(id *)(a1 + 40) assert:v11 == 0, 3302, @"URL is directory: %@", v6 code format];
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v8 = *(void **)(a1 + 40);
        uint64_t v9 = *(void **)(a1 + 48);
        long long v10 = [v7 pathExtension];
        [v8 assert:objc_msgSend(v9, "isValidImagePathExtension:", v10), 3302, @"invalid image path extension: %@", v7 code format];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v8 = *(void **)(a1 + 40);
        uint64_t v9 = *(void **)(a1 + 48);
        long long v10 = [v7 pathExtension];
        [v8 assert:objc_msgSend(v9, "isValidVideoPathExtension:", v10), 3302, @"invalid video path extension: %@", v7 code format];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_5(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        CGImageSourceRef v7 = CGImageSourceCreateWithURL(*(CFURLRef *)(*((void *)&v12 + 1) + 8 * v6), 0);
        long long v8 = *(void **)(a1 + 40);
        id v11 = 0;
        uint64_t v9 = [v8 _validateImageSource:v7 error:&v11];
        id v10 = v11;
        [*(id *)(a1 + 48) assert:v9 error:v10];
        if (v7) {
          CFRelease(v7);
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_6(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        long long v8 = *(void **)(a1 + 40);
        id v11 = 0;
        uint64_t v9 = [v8 _validateVideoURL:v7 error:&v11];
        id v10 = v11;
        [*(id *)(a1 + 48) assert:v9 error:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

void __70__PHValidator_validateURLs_withOptions_videoComplementMetadata_error___block_invoke_7(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = 0;
  uint64_t v5 = [v2 _validateLivePhotoResourceURLs:v3 videoComplementMetadata:v4 error:&v7];
  id v6 = v7;
  [*(id *)(a1 + 56) assert:v5 error:v6];
}

- (BOOL)validateURLs:(id)a3 withOptions:(unint64_t)a4 error:(id *)a5
{
  return [(PHValidator *)self validateURLs:a3 withOptions:a4 videoComplementMetadata:0 error:a5];
}

- (BOOL)validateURL:(id)a3 withOptions:(unint64_t)a4 error:(id *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  long long v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  id v10 = [v8 arrayWithObjects:&v12 count:1];

  LOBYTE(a5) = -[PHValidator validateURLs:withOptions:videoComplementMetadata:error:](self, "validateURLs:withOptions:videoComplementMetadata:error:", v10, a4, 0, a5, v12, v13);
  return (char)a5;
}

@end