@interface PAMediaConversionServiceImagingUtilities
+ (BOOL)_generatePosterFrameExportForVideoURL:(id)a3 imageDestinationToAddToAndFinalize:(CGImageDestination *)a4 maximumSize:(CGSize)a5 error:(id *)a6;
+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 destinationURL:(id)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7;
+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7;
+ (id)dataForSingleImageJPEGPassthroughConversionForImageSource:(CGImageSource *)a3 primaryImageProperties:(id)a4;
+ (id)imageDataForPassthroughConversionForSourceURL:(id)a3 metadataPolicy:(id)a4 outResultImageSize:(CGSize *)a5;
+ (id)imagePropertiesByImageIndexInImageSource:(CGImageSource *)a3 processedWithMetadataPolicy:(id)a4;
+ (id)primaryImagePropertiesForFileAtURL:(id)a3;
+ (void)logMissingPropertiesInCMPhotoOutputData:(id)a3 comparedToProcessedSourceImagePropertiesByIndex:(id)a4;
@end

@implementation PAMediaConversionServiceImagingUtilities

+ (BOOL)_generatePosterFrameExportForVideoURL:(id)a3 imageDestinationToAddToAndFinalize:(CGImageDestination *)a4 maximumSize:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (!a4)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImagingUtilities.m", 213, @"Invalid parameter not satisfying: %@", @"imageDestination" object file lineNumber description];
  }
  v13 = [MEMORY[0x1E4F16330] assetWithURL:v12];
  v14 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v13];
  objc_msgSend(v14, "setMaximumSize:", width, height);
  [v14 setAppliesPreferredTrackTransform:1];
  *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
  uint64_t v22 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v15 = (CGImage *)[MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v14 atTime:buf actualTime:0 error:a6];
  if (v15)
  {
    v16 = v15;
    CGImageDestinationAddImage(a4, v15, 0);
    BOOL v17 = CGImageDestinationFinalize(a4);
    if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = [v12 path];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v19;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to finalize image destination for still image extraction for %@", buf, 0xCu);
    }
    CFRelease(v16);
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v15 = (__CFString *)a6;
  if (!v15)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImagingUtilities.m", 192, @"Invalid parameter not satisfying: %@", @"outputFileType" object file lineNumber description];
  }
  v16 = [MEMORY[0x1E4F1CA58] data];
  CGImageDestinationRef v17 = CGImageDestinationCreateWithData(v16, v15, 1uLL, 0);
  if (v17)
  {
    CGImageDestinationRef v18 = v17;
    int v19 = objc_msgSend(a1, "_generatePosterFrameExportForVideoURL:imageDestinationToAddToAndFinalize:maximumSize:error:", v14, v17, a7, width, height);
    BOOL v20 = v19;
    if (a4 && v19) {
      *a4 = v16;
    }
    CFRelease(v18);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [v14 path];
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create image destination for still image extraction for %@", buf, 0xCu);
    }
    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 destinationURL:(id)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  CFURLRef v15 = (const __CFURL *)a4;
  v16 = (__CFString *)a6;
  if (!v16)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImagingUtilities.m", 174, @"Invalid parameter not satisfying: %@", @"outputFileType" object file lineNumber description];
  }
  CGImageDestinationRef v17 = CGImageDestinationCreateWithURL(v15, v16, 1uLL, 0);
  if (v17)
  {
    CGImageDestinationRef v18 = v17;
    char v19 = objc_msgSend(a1, "_generatePosterFrameExportForVideoURL:imageDestinationToAddToAndFinalize:maximumSize:error:", v14, v17, a7, width, height);
    CFRelease(v18);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v21 = [v14 path];
      *(_DWORD *)buf = 138412290;
      v24 = v21;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create image destination for still image extraction for %@", buf, 0xCu);
    }
    char v19 = 0;
  }

  return v19;
}

+ (id)primaryImagePropertiesForFileAtURL:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  CFURLRef v3 = (const __CFURL *)a3;
  v12[0] = *MEMORY[0x1E4F2FF08];
  v12[1] = @"kCGImageSourceRawPropertiesHint";
  v13[0] = MEMORY[0x1E4F1CC28];
  v13[1] = @"ImportOnly";
  CFDictionaryRef v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v5 = CGImageSourceCreateWithURL(v3, v4);
  if (v5)
  {
    v6 = v5;
    size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v5);
    CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(v6, PrimaryImageIndex, 0);
    CFRelease(v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      CFURLRef v11 = v3;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create image source for %@, skipping", (uint8_t *)&v10, 0xCu);
    }
    CFDictionaryRef v8 = 0;
  }

  return v8;
}

+ (void)logMissingPropertiesInCMPhotoOutputData:(id)a3 comparedToProcessedSourceImagePropertiesByIndex:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  CFDataRef v5 = (const __CFData *)a3;
  id v6 = a4;
  v7 = CGImageSourceCreateWithData(v5, 0);
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    CFDataRef v24 = v5;
    size_t Count = CGImageSourceGetCount(v7);
    unint64_t v10 = [v6 count];
    if (v10 != Count && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v35 = v10;
      __int16 v36 = 2048;
      uint64_t v37 = Count;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected input (%tu) / output (%tu) image count mismatch", buf, 0x16u);
    }
    if (v10 >= Count) {
      size_t v11 = Count;
    }
    else {
      size_t v11 = v10;
    }
    size_t v27 = v11;
    if (v11)
    {
      size_t v12 = 0;
      uint64_t v25 = v8;
      id v26 = v6;
      do
      {
        CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(v8, v12, 0);
        size_t v28 = v12;
        id v14 = [v6 objectAtIndexedSubscript:v12];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * i);
              BOOL v20 = objc_msgSend(v14, "objectForKeyedSubscript:", v19, v24);
              v21 = [(__CFDictionary *)v13 objectForKeyedSubscript:v19];
              if (v21)
              {
              }
              else
              {
                uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
                char v23 = [v20 isEqual:v22];

                if ((v23 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  unint64_t v35 = v28;
                  __int16 v36 = 2114;
                  uint64_t v37 = v19;
                  _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Output image at index %tu is missing image property '%{public}@' present in input image", buf, 0x16u);
                }
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v16);
        }

        size_t v12 = v28 + 1;
        id v6 = v26;
        CFDictionaryRef v8 = v25;
      }
      while (v28 + 1 != v27);
    }
    CFRelease(v8);
    CFDataRef v5 = v24;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v35 = (unint64_t)v5;
    __int16 v36 = 2048;
    uint64_t v37 = [(__CFData *)v5 length];
    _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create an image source from Fig outputData %p of length %tu to inspect for missing metadata properties.", buf, 0x16u);
  }
}

+ (id)dataForSingleImageJPEGPassthroughConversionForImageSource:(CGImageSource *)a3 primaryImageProperties:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFDataRef v5 = (void *)MEMORY[0x1E4F1CA58];
  id v6 = a4;
  v7 = [v5 data];
  CFDictionaryRef v8 = [(id)*MEMORY[0x1E4F44410] identifier];
  v9 = CGImageDestinationCreateWithData(v7, v8, 1uLL, 0);

  unint64_t v10 = (void *)[v6 mutableCopy];
  [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2F460]];
  size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
  CGImageDestinationAddImageFromSource(v9, a3, PrimaryImageIndex, (CFDictionaryRef)v10);
  LOBYTE(v6) = CGImageDestinationFinalize(v9);
  CFRelease(v9);
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = a3;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to perform single image JPEG passthrough conversion for source %@", (uint8_t *)&v13, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)imageDataForPassthroughConversionForSourceURL:(id)a3 metadataPolicy:(id)a4 outResultImageSize:(CGSize *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v7 = (const __CFURL *)a3;
  id v8 = a4;
  uint64_t v37 = *MEMORY[0x1E4F2FF08];
  v38[0] = MEMORY[0x1E4F1CC28];
  CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  unint64_t v10 = CGImageSourceCreateWithURL(v7, v9);
  if (v10)
  {
    size_t v11 = v10;
    uint64_t v33 = *MEMORY[0x1E4F2FDE8];
    uint64_t v34 = MEMORY[0x1E4F1CC38];
    CFDictionaryRef v28 = CGImageSourceCopyProperties(v10, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1]);
    size_t v12 = [a1 imagePropertiesByImageIndexInImageSource:v11 processedWithMetadataPolicy:v8];
    uint64_t v13 = *MEMORY[0x1E4F44410];
    id v14 = [(id)*MEMORY[0x1E4F44410] identifier];
    id v32 = 0;
    uint64_t v15 = *MEMORY[0x1E4F1C728];
    id v31 = 0;
    char v16 = [(__CFURL *)v7 getResourceValue:&v32 forKey:v15 error:&v31];
    id v17 = v32;

    CFURLRef v18 = (const __CFURL *)v31;
    if ((v16 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFURLRef v36 = v18;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get type identifier of image source URL: %@", buf, 0xCu);
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F8CDF8], "typeWithIdentifier:", v17, v18);
    int v20 = [v19 conformsToType:v13];

    if (v20)
    {
      v21 = [v12 objectAtIndexedSubscript:CGImageSourceGetPrimaryImageIndex(v11)];
      id v22 = [a1 dataForSingleImageJPEGPassthroughConversionForImageSource:v11 primaryImageProperties:v21];
    }
    else
    {
      CFDictionaryRef v29 = v28;
      id v23 = v12;
      long long v30 = v23;
      int v24 = PFFigCopyImageFileWithPropertiesToData();
      id v22 = 0;
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          CFURLRef v25 = [(__CFURL *)v7 path];
          *(_DWORD *)buf = 138412290;
          CFURLRef v36 = v25;
          _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to perform passthrough conversion for %@", buf, 0xCu);
        }
      }
      else
      {
        [a1 logMissingPropertiesInCMPhotoOutputData:v22 comparedToProcessedSourceImagePropertiesByIndex:v23];
      }

      v21 = v29;
    }

    CFRelease(v11);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFURLRef v36 = v7;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to create image source from %@", buf, 0xCu);
    }
    id v22 = 0;
  }

  return v22;
}

id __124__PAMediaConversionServiceImagingUtilities_imageDataForPassthroughConversionForSourceURL_metadataPolicy_outResultImageSize___block_invoke(uint64_t a1)
{
  v2 = 0;
  if (PFFigGetImageSourceImageIndexForContainerItemID())
  {
    v2 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
    CFURLRef v3 = [MEMORY[0x1E4F1CA98] null];
    int v4 = [v2 isEqual:v3];

    if (v4)
    {

      v2 = 0;
    }
  }
  return v2;
}

+ (id)imagePropertiesByImageIndexInImageSource:(CGImageSource *)a3 processedWithMetadataPolicy:(id)a4
{
  id v5 = a4;
  size_t Count = CGImageSourceGetCount(a3);
  CFURLRef v7 = [MEMORY[0x1E4F1CA48] array];
  if (Count)
  {
    for (size_t i = 0; i != Count; ++i)
    {
      CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(a3, i, 0);
      if (v5)
      {
        uint64_t v10 = [v5 processMetadata:v9];

        CFDictionaryRef v9 = (CFDictionaryRef)v10;
      }
      if (v9)
      {
        [v7 addObject:v9];
      }
      else
      {
        size_t v11 = [MEMORY[0x1E4F1CA98] null];
        [v7 addObject:v11];
      }
    }
  }

  return v7;
}

@end