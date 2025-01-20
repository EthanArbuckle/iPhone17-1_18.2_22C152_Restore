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
  id v12 = a3;
  if (!a4)
  {
    v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImagingUtilities.m", 213, @"Invalid parameter not satisfying: %@", @"imageDestination" object file lineNumber description];
  }
  v13 = +[AVAsset assetWithURL:v12];
  v14 = +[AVAssetImageGenerator assetImageGeneratorWithAsset:v13];
  objc_msgSend(v14, "setMaximumSize:", width, height);
  [v14 setAppliesPreferredTrackTransform:1];
  *(_OWORD *)buf = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  v15 = (CGImage *)+[PFMediaUtilities copyCGImageFromImageGenerator:v14 atTime:buf actualTime:0 error:a6];
  if (v15)
  {
    v16 = v15;
    CGImageDestinationAddImage(a4, v15, 0);
    BOOL v17 = CGImageDestinationFinalize(a4);
    if (!v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v19 = [v12 path];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v19;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to finalize image destination for still image extraction for %@", buf, 0xCu);
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
  id v14 = a3;
  v15 = (__CFString *)a6;
  if (!v15)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImagingUtilities.m", 192, @"Invalid parameter not satisfying: %@", @"outputFileType" object file lineNumber description];
  }
  v16 = +[NSMutableData data];
  CGImageDestinationRef v17 = CGImageDestinationCreateWithData(v16, v15, 1uLL, 0);
  if (v17)
  {
    CGImageDestinationRef v18 = v17;
    unsigned int v19 = objc_msgSend(a1, "_generatePosterFrameExportForVideoURL:imageDestinationToAddToAndFinalize:maximumSize:error:", v14, v17, a7, width, height);
    BOOL v20 = v19;
    if (a4 && v19) {
      *a4 = v16;
    }
    CFRelease(v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v22 = [v14 path];
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create image destination for still image extraction for %@", buf, 0xCu);
    }
    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)generatePosterFrameExportForVideoURL:(id)a3 destinationURL:(id)a4 maximumSize:(CGSize)a5 outputFileType:(id)a6 error:(id *)a7
{
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  CFURLRef v15 = (const __CFURL *)a4;
  v16 = (__CFString *)a6;
  if (!v16)
  {
    v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImagingUtilities.m", 174, @"Invalid parameter not satisfying: %@", @"outputFileType" object file lineNumber description];
  }
  CGImageDestinationRef v17 = CGImageDestinationCreateWithURL(v15, v16, 1uLL, 0);
  if (v17)
  {
    CGImageDestinationRef v18 = v17;
    unsigned __int8 v19 = objc_msgSend(a1, "_generatePosterFrameExportForVideoURL:imageDestinationToAddToAndFinalize:maximumSize:error:", v14, v17, a7, width, height);
    CFRelease(v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v21 = [v14 path];
      *(_DWORD *)buf = 138412290;
      v24 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create image destination for still image extraction for %@", buf, 0xCu);
    }
    unsigned __int8 v19 = 0;
  }

  return v19;
}

+ (id)primaryImagePropertiesForFileAtURL:(id)a3
{
  CFURLRef v3 = (const __CFURL *)a3;
  v12[0] = kCGImageSourceShouldCache;
  v12[1] = @"kCGImageSourceRawPropertiesHint";
  v13[0] = &__kCFBooleanFalse;
  v13[1] = @"ImportOnly";
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
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
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      CFURLRef v11 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create image source for %@, skipping", (uint8_t *)&v10, 0xCu);
    }
    CFDictionaryRef v8 = 0;
  }

  return v8;
}

+ (void)logMissingPropertiesInCMPhotoOutputData:(id)a3 comparedToProcessedSourceImagePropertiesByIndex:(id)a4
{
  CFDataRef v5 = (const __CFData *)a3;
  id v6 = a4;
  v7 = CGImageSourceCreateWithData(v5, 0);
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    CFDataRef v24 = v5;
    size_t Count = CGImageSourceGetCount(v7);
    CFDataRef v10 = (const __CFData *)[v6 count];
    if (v10 != (const __CFData *)Count && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      CFDataRef v35 = v10;
      __int16 v36 = 2048;
      id v37 = (id)Count;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected input (%tu) / output (%tu) image count mismatch", buf, 0x16u);
    }
    if ((unint64_t)v10 >= Count) {
      size_t v11 = Count;
    }
    else {
      size_t v11 = (size_t)v10;
    }
    id v27 = (id)v11;
    if (v11)
    {
      size_t v12 = 0;
      v25 = v8;
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
        id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v30;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v14);
              }
              unsigned __int8 v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              BOOL v20 = objc_msgSend(v14, "objectForKeyedSubscript:", v19, v24);
              v21 = [(__CFDictionary *)v13 objectForKeyedSubscript:v19];
              if (v21)
              {
              }
              else
              {
                v22 = +[NSNull null];
                unsigned __int8 v23 = [v20 isEqual:v22];

                if ((v23 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  CFDataRef v35 = (const __CFData *)v28;
                  __int16 v36 = 2114;
                  id v37 = v19;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Output image at index %tu is missing image property '%{public}@' present in input image", buf, 0x16u);
                }
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v16);
        }

        size_t v12 = v28 + 1;
        id v6 = v26;
        CFDictionaryRef v8 = v25;
      }
      while ((id)(v28 + 1) != v27);
    }
    CFRelease(v8);
    CFDataRef v5 = v24;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    CFDataRef v35 = v5;
    __int16 v36 = 2048;
    id v37 = [(__CFData *)v5 length];
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create an image source from Fig outputData %p of length %tu to inspect for missing metadata properties.", buf, 0x16u);
  }
}

+ (id)dataForSingleImageJPEGPassthroughConversionForImageSource:(CGImageSource *)a3 primaryImageProperties:(id)a4
{
  id v5 = a4;
  id v6 = +[NSMutableData data];
  v7 = [UTTypeJPEG identifier];
  CFDictionaryRef v8 = CGImageDestinationCreateWithData(v6, v7, 1uLL, 0);

  id v9 = [v5 mutableCopy];
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:kCGImageDestinationPreserveGainMap];
  size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
  CGImageDestinationAddImageFromSource(v8, a3, PrimaryImageIndex, (CFDictionaryRef)v9);
  LOBYTE(v5) = CGImageDestinationFinalize(v8);
  CFRelease(v8);
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      CFDictionaryRef v13 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to perform single image JPEG passthrough conversion for source %@", (uint8_t *)&v12, 0xCu);
    }

    id v6 = 0;
  }

  return v6;
}

+ (id)imageDataForPassthroughConversionForSourceURL:(id)a3 metadataPolicy:(id)a4 outResultImageSize:(CGSize *)a5
{
  CFURLRef v7 = (const __CFURL *)a3;
  id v8 = a4;
  CFStringRef v35 = kCGImageSourceShouldCache;
  __int16 v36 = &__kCFBooleanFalse;
  CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  CFDataRef v10 = CGImageSourceCreateWithURL(v7, v9);
  if (v10)
  {
    size_t v11 = v10;
    uint64_t v31 = kCGImageSourceAddHEIFContainerItemID;
    long long v32 = &__kCFBooleanTrue;
    CFDictionaryRef v26 = CGImageSourceCopyProperties(v10, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1]);
    int v12 = [a1 imagePropertiesByImageIndexInImageSource:v11 processedWithMetadataPolicy:v8];
    CFDictionaryRef v13 = [UTTypeJPEG identifier];
    id v30 = 0;
    id v29 = 0;
    unsigned __int8 v14 = [(__CFURL *)v7 getResourceValue:&v30 forKey:NSURLTypeIdentifierKey error:&v29];
    id v15 = v30;

    CFURLRef v16 = (const __CFURL *)v29;
    if ((v14 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFURLRef v34 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to get type identifier of image source URL: %@", buf, 0xCu);
    }
    uint64_t v17 = +[PFUniformTypeUtilities typeWithIdentifier:](PFUniformTypeUtilities, "typeWithIdentifier:", v15, v16);
    unsigned int v18 = [v17 conformsToType:UTTypeJPEG];

    if (v18)
    {
      unsigned __int8 v19 = [v12 objectAtIndexedSubscript:CGImageSourceGetPrimaryImageIndex(v11)];
      id v20 = [a1 dataForSingleImageJPEGPassthroughConversionForImageSource:v11 primaryImageProperties:v19];
    }
    else
    {
      CFDictionaryRef v27 = v26;
      id v21 = v12;
      size_t v28 = v21;
      int v22 = PFFigCopyImageFileWithPropertiesToData();
      id v20 = 0;
      if (v22)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          CFURLRef v23 = [(__CFURL *)v7 path];
          *(_DWORD *)buf = 138412290;
          CFURLRef v34 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to perform passthrough conversion for %@", buf, 0xCu);
        }
      }
      else
      {
        [a1 logMissingPropertiesInCMPhotoOutputData:v20 comparedToProcessedSourceImagePropertiesByIndex:v21];
      }

      unsigned __int8 v19 = v27;
    }

    CFRelease(v11);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFURLRef v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create image source from %@", buf, 0xCu);
    }
    id v20 = 0;
  }

  return v20;
}

+ (id)imagePropertiesByImageIndexInImageSource:(CGImageSource *)a3 processedWithMetadataPolicy:(id)a4
{
  id v5 = a4;
  size_t Count = CGImageSourceGetCount(a3);
  CFURLRef v7 = +[NSMutableArray array];
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
        size_t v11 = +[NSNull null];
        [v7 addObject:v11];
      }
    }
  }

  return v7;
}

@end