@interface MFAttachment(Utilities)
+ (BOOL)_isPDF:()Utilities;
+ (id)attachmentElementHTMLStringWithAttributes:()Utilities;
+ (uint64_t)isBasicImageMimeType:()Utilities;
- (BOOL)isCameraRollCompatibleVideo;
- (NSObject)filenameStrippingZipIfNeededUseApplications:()Utilities;
- (__CFString)_imageScalingKeyForImageScale:()Utilities;
- (__CFString)className;
- (double)constrainedWidth;
- (double)imageDimensions;
- (double)imageDimensionsWithData:()Utilities;
- (double)markupSizeForImageScale:()Utilities;
- (id)_contentTypeIdentifierByStrippingZipIfNeeded:()Utilities;
- (id)contentType;
- (id)markupStringForCompositionWithPrependedBlankLine:()Utilities imageScale:useAttachmentElement:;
- (id)markupStringForDisplayWithData:()Utilities allowAttachmentElement:;
- (id)scaledImageToFit:()Utilities saveScaledImage:attachmentContextID:;
- (uint64_t)_imageScale;
- (uint64_t)_isContentTypeDisplayableByMobileMail;
- (uint64_t)contentTypeIdentifier;
- (uint64_t)imageScalingFlags;
- (uint64_t)isBasicImage;
- (uint64_t)isCalendarFile;
- (uint64_t)isContentCompressed;
- (uint64_t)isContentOpenable;
- (uint64_t)isDisplayableByWebKit;
- (uint64_t)isDisplayableImage;
- (uint64_t)isDisplayableInline;
- (uint64_t)isDisplayableInsidePlugin;
- (uint64_t)isMedia;
- (uint64_t)isPDFFile;
- (uint64_t)isRestrictedMIMEType;
- (uint64_t)needsColorspaceConversion;
- (uint64_t)scaledFileSize;
- (uint64_t)scaledFileSizeForScale:()Utilities;
- (void)_setImageScale:()Utilities;
- (void)compressContentsWithCompletion:()Utilities;
- (void)decompressContentsWithCompletion:()Utilities;
- (void)enqueueScaleAttachmentWithCompletionBlock:()Utilities;
- (void)setImageDimensions:()Utilities;
@end

@implementation MFAttachment(Utilities)

- (id)_contentTypeIdentifierByStrippingZipIfNeeded:()Utilities
{
  if (a3) {
    [a1 filenameStrippingZipIfNeededUseApplications:0];
  }
  else {
  v4 = [a1 fileName];
  }
  v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_defaultAllowedCharacterSet");
  v7 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v6];
  v8 = [v5 URLWithString:v7];

  v9 = [a1 inferredMimeType];
  if (!v9)
  {
    v9 = [a1 mimeType];
  }
  v10 = softLinkQLTypeCopyUTIForURLAndMimeType(v8, v9);

  return v10;
}

- (__CFString)className
{
  int v2 = [a1 isPass];
  if (([a1 isDisplayableImage] & 1) != 0 || v2)
  {
    int v4 = [a1 isSinglePagePDFFile];
    v5 = @"Apple-mail-imageattach";
    if (v4) {
      v5 = @"Apple-mail-pdf";
    }
    v3 = v5;
  }
  else
  {
    v3 = @"Apple-mail-fileattach";
  }

  return v3;
}

- (id)contentType
{
  v1 = (void *)MEMORY[0x1E4F442D8];
  int v2 = [a1 contentTypeIdentifier];
  v3 = [v1 typeWithIdentifier:v2];

  return v3;
}

- (uint64_t)contentTypeIdentifier
{
  return [a1 _contentTypeIdentifierByStrippingZipIfNeeded:0];
}

- (uint64_t)isRestrictedMIMEType
{
  int v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"application/atom+xml", @"application/xml", @"application/rss+xml", @"application/x-webarchive", @"application/x-javascript", 0);
  v3 = [a1 mimeType];
  if (v3)
  {
    int v4 = [a1 mimeType];
    uint64_t v5 = [v2 containsObject:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)isContentCompressed
{
  int v2 = [a1 mimeType];
  v3 = [v2 lowercaseString];
  char v4 = [v3 isEqualToString:@"application/zip"];

  if (v4) {
    return 1;
  }
  v6 = [a1 contentType];
  uint64_t v5 = [v6 conformsToType:*MEMORY[0x1E4F44558]];

  return v5;
}

- (void)compressContentsWithCompletion:()Utilities
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F77BC0]);
  v6 = [a1 fetchLocalData];
  v7 = [a1 fileName];
  v8 = (void *)[v5 initWithContents:v6 path:v7];

  v9 = [MEMORY[0x1E4F77BB8] archiveDirectory];
  [v9 setArchiveEntry:v8];
  v10 = [MEMORY[0x1E4F77BB0] archive];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__MFAttachment_Utilities__compressContentsWithCompletion___block_invoke;
  v13[3] = &unk_1E5F794D8;
  id v11 = v4;
  id v16 = v11;
  id v12 = v9;
  id v14 = v12;
  v15 = a1;
  [v10 compressContents:v12 completion:v13];
}

- (void)decompressContentsWithCompletion:()Utilities
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F77BB8] archiveDirectory];
  v6 = [a1 fetchLocalData];
  [v5 inputWithData:v6];

  v7 = [MEMORY[0x1E4F77BB0] archive];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__MFAttachment_Utilities__decompressContentsWithCompletion___block_invoke;
  v10[3] = &unk_1E5F79500;
  id v8 = v5;
  id v11 = v8;
  id v9 = v4;
  id v12 = a1;
  id v13 = v9;
  [v7 decompressContents:v8 completion:v10];
}

- (uint64_t)isMedia
{
  int v2 = [MEMORY[0x1E4F166C8] audiovisualMIMETypes];
  v3 = [a1 mimeType];

  if (v3)
  {
    id v4 = [a1 mimeType];
    uint64_t v5 = [v2 containsObject:v4];
  }
  else
  {
    v6 = [a1 fileName];
    v7 = [v6 pathExtension];
    id v4 = [v7 lowercaseString];

    id v8 = [MEMORY[0x1E4F290B0] sharedMappings];
    id v9 = [v8 MIMETypeForExtension:v4];

    uint64_t v5 = [v2 containsObject:v9];
  }

  return v5;
}

- (uint64_t)isPDFFile
{
  uint64_t v2 = objc_opt_class();
  v3 = [a1 mimeType];
  LOBYTE(v2) = [(id)v2 _isPDF:v3];

  if (v2) {
    return 1;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F73588]);
  v6 = [a1 fileName];
  v7 = [v6 pathExtension];
  [v5 setPathExtension:v7];

  id v8 = [a1 fileName];
  [v5 setFilename:v8];

  if (MFGetTypeInfo())
  {
    id v9 = [v5 mimeType];
    if (v9)
    {
      v10 = [v5 mimeType];
      BOOL v4 = [v10 caseInsensitiveCompare:@"application/pdf"] == 0;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)isCalendarFile
{
  v1 = [a1 mimeType];
  uint64_t v2 = [v1 isEqualToString:@"text/calendar"];

  return v2;
}

- (uint64_t)_isContentTypeDisplayableByMobileMail
{
  v19[7] = *MEMORY[0x1E4F143B8];
  v1 = [a1 _contentTypeIdentifierByStrippingZipIfNeeded:1];
  uint64_t v2 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v1];
  uint64_t v3 = *MEMORY[0x1E4F44450];
  v19[0] = *MEMORY[0x1E4F443F0];
  v19[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F44540];
  v19[2] = *MEMORY[0x1E4F44518];
  v19[3] = v4;
  v19[4] = *MEMORY[0x1E4F44458];
  id v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*MEMORY[0x1E4F77CC0]];
  v19[5] = v5;
  v6 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*MEMORY[0x1E4F77CC8]];
  v19[6] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:7];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(v2, "conformsToType:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14))
        {

          uint64_t IsPlainText = 1;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t IsPlainText = MFContentTypeIsPlainText((uint64_t)v1);
LABEL_11:

  return IsPlainText;
}

- (uint64_t)isContentOpenable
{
  uint64_t v2 = [a1 _contentTypeIdentifierByStrippingZipIfNeeded:0];
  if ((softLinkQLPreviewControllerSupportsContentType(v2) & 1) != 0
    || ([a1 _isContentTypeDisplayableByMobileMail] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [a1 isMedia];
  }

  return v3;
}

- (BOOL)isCameraRollCompatibleVideo
{
  v1 = [a1 path];
  BOOL IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v1);

  return IsCompatibleWithSavedPhotosAlbum;
}

- (double)imageDimensionsWithData:()Utilities
{
  CFDataRef v3 = a3;
  uint64_t v4 = CGImageSourceCreateWithData(v3, 0);
  id v5 = v4;
  double v6 = *MEMORY[0x1E4F1DB30];
  if (v4)
  {
    if (CGImageSourceGetCount(v4))
    {
      CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
      CFDictionaryRef v8 = v7;
      if (v7)
      {
        objc_msgSend((id)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E4F2FD00]), "floatValue");
        float v10 = v9;
        objc_msgSend((id)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E4F2FCE8]), "floatValue");
        float v12 = v11;
        if ((int)objc_msgSend((id)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E4F2FCA0]), "intValue") <= 4) {
          double v6 = v10;
        }
        else {
          double v6 = v12;
        }
        CFRelease(v8);
      }
    }
    CFRelease(v5);
  }

  return v6;
}

- (void)setImageDimensions:()Utilities
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setMetadataValue:forKey:");
}

- (double)imageDimensions
{
  id v2 = [a1 metadataValueForKey:@"_MFImageDimensionsKey"];
  CFDataRef v3 = v2;
  if (v2)
  {
    [v2 CGSizeValue];
    double v5 = v4;
  }
  else if ([a1 isDataAvailableLocally] {
         && [a1 isDisplayableImage])
  }
  {
    CFDictionaryRef v7 = [a1 fetchLocalData];
    [a1 imageDimensionsWithData:v7];
    double v5 = v8;
    float v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
    [a1 setMetadataValue:v9 forKey:@"_MFImageDimensionsKey"];
  }
  else
  {
    char v10 = [a1 isDisplayableImage];
    double v5 = *MEMORY[0x1E4F1DB30];
    if ((v10 & 1) == 0)
    {
      +[MFAttachmentImageGenerator defaultHeight];
      if (![a1 isPass]) {
        double v5 = 0.0;
      }
    }
  }

  return v5;
}

- (double)markupSizeForImageScale:()Utilities
{
  [a1 imageDimensions];
  double v7 = v5;
  if (v5 != *MEMORY[0x1E4F1DB30] || v6 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v9 = 1280.0;
    double v10 = 640.0;
    if (a3 != 2) {
      double v10 = v5;
    }
    if (a3 != 4) {
      double v9 = v10;
    }
    if (a3 == 1) {
      double v11 = 320.0;
    }
    else {
      double v11 = v9;
    }
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad", 320.0, v9)) {
      double v12 = 728.0;
    }
    else {
      [a1 constrainedWidth];
    }
    if (v11 <= v12) {
      double v12 = v11;
    }
    if (v12 < v7) {
      return (double)(int)v12;
    }
  }
  return v7;
}

- (double)constrainedWidth
{
  v0 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
  [v0 bounds];
  double v2 = v1;

  return v2;
}

- (uint64_t)imageScalingFlags
{
  if (![a1 isImageFile] || !objc_msgSend(a1, "isDataAvailableLocally")) {
    return 0;
  }
  CFDataRef v2 = [a1 fetchLocalData];
  CFDataRef v3 = v2;
  if (v2 && (double v4 = CGImageSourceCreateWithData(v2, 0), (v5 = v4) != 0))
  {
    if (CGImageSourceGetCount(v4) <= 1)
    {
      CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
      uint64_t v6 = (uint64_t)v7;
      if (v7)
      {
        objc_msgSend((id)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E4F2FD00]), "floatValue");
        float v9 = v8;
        objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v6, (const void *)*MEMORY[0x1E4F2FCE8]), "floatValue");
        float v11 = v10;
        CFRelease((CFTypeRef)v6);
        if ((unint64_t)[(__CFData *)v3 length] <= 0x60000)
        {
          uint64_t v6 = 0;
        }
        else
        {
          double v12 = v9;
          if (v9 >= v11) {
            double v13 = v9;
          }
          else {
            double v13 = v11;
          }
          if (v9 >= v11) {
            double v12 = v11;
          }
          if (v13 <= 1280.0 && v12 <= 960.0)
          {
            if (v13 <= 640.0 && v12 <= 480.0) {
              uint64_t v6 = v12 > 240.0 || v13 > 320.0;
            }
            else {
              uint64_t v6 = 3;
            }
          }
          else
          {
            uint64_t v6 = 7;
          }
        }
      }
      if ((CGImageSourceIsColorOptimizedForSharing() & 1) == 0) {
        [a1 setMetadataValue:MEMORY[0x1E4F1CC38] forKey:@"_MFImageNeedsColorspaceConversion"];
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)needsColorspaceConversion
{
  double v1 = [a1 metadataValueForKey:@"_MFImageNeedsColorspaceConversion"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_setImageScale:()Utilities
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setMetadataValue:forKey:");
}

- (__CFString)_imageScalingKeyForImageScale:()Utilities
{
  if (a3 > 4) {
    return @"kFullScaleKey";
  }
  else {
    return off_1E5F79548[a3];
  }
}

- (uint64_t)scaledFileSizeForScale:()Utilities
{
  double v5 = objc_msgSend(a1, "_imageScalingKeyForImageScale:");
  if (v5)
  {
    uint64_t v6 = [a1 metadataValueForKey:v5];

    if (!v6) {
      id v7 = (id)[a1 scaledImageToFit:a3 saveScaledImage:0 attachmentContextID:0];
    }
  }
  float v8 = [a1 metadataValueForKey:v5];
  uint64_t v9 = [v8 unsignedIntegerValue];

  return v9;
}

- (id)scaledImageToFit:()Utilities saveScaledImage:attachmentContextID:
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v61 = a5;
  float v8 = a1;
  uint64_t v9 = [v8 _imageScalingKeyForImageScale:a3];
  int v10 = [v8 needsColorspaceConversion];
  if (v9)
  {
    uint64_t v11 = [v8 metadataValueForKey:v9];
    if (v11)
    {
      v62 = (void *)v11;
      if (!a4)
      {
        v62 = (void *)v11;
LABEL_21:
        v24 = v8;
        goto LABEL_73;
      }
    }
    else
    {
      v62 = 0;
    }
  }
  else
  {
    v62 = 0;
  }
  if (![v8 isDisplayableImage]) {
    goto LABEL_21;
  }
  uint64_t v12 = [v8 imageScalingFlags];
  if (!a3 || (v12 & a3) == 0)
  {
    uint64_t v25 = [v8 decodedFileSize];
    if (v25)
    {
      if (!v9) {
        goto LABEL_28;
      }
    }
    else
    {
      v28 = [v8 fetchDataSynchronously:0];
      uint64_t v25 = [v28 length];

      if (!v9)
      {
LABEL_28:
        char v26 = 0;
        v27 = 0;
        goto LABEL_68;
      }
    }
    v29 = [NSNumber numberWithUnsignedInteger:v25];
    [v8 setMetadataValue:v29 forKey:v9];

    goto LABEL_28;
  }
  CFDataRef data = [v8 fetchDataSynchronously:0];
  if (data)
  {
    uint64_t v13 = [v8 contentTypeIdentifier];
    uint64_t v64 = *MEMORY[0x1E4F2FF78];
    v65[0] = v13;
    v58 = (__CFString *)v13;
    CFDictionaryRef v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
    long long v14 = CGImageSourceCreateWithData(data, v56);
    if (!v14)
    {
      char v26 = 0;
      v27 = 0;
      uint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
LABEL_66:

      goto LABEL_67;
    }
    v54 = [[MFHardwareJPEGScaler alloc] initWithImageData:data imageSource:v14];
    id v15 = objc_alloc_init(MEMORY[0x1E4F734A8]);
    v57 = v54;
    id info = v15;
    context = (void *)MEMORY[0x1B3E86D20]();
    CFStringRef v16 = v58;
    CFDictionaryRef v17 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
    CFDictionaryRef v19 = v17;
    switch(a3)
    {
      case 1:
        int v30 = 1134559232;
        break;
      case 2:
        int v30 = 1142947840;
        break;
      case 4:
        if (!v17)
        {
          v33 = 0;
          goto LABEL_59;
        }
        v51 = CFDictionaryGetValue(v17, (const void *)*MEMORY[0x1E4F2FD00]);
        v20 = CFDictionaryGetValue(v19, (const void *)*MEMORY[0x1E4F2FCE8]);
        id v21 = v51;
        id v22 = v21;
        if (objc_msgSend(v21, "compare:", v20, v51) == -1)
        {
          id v22 = v20;
        }
        [v22 floatValue];
        *(float *)&double v23 = *(float *)&v23 * 0.5;
        if (*(float *)&v23 < 1280.0) {
          *(float *)&double v23 = 1280.0;
        }
        uint64_t v55 = [NSNumber numberWithFloat:v23];

LABEL_35:
        v31 = CFDictionaryGetValue(v19, (const void *)*MEMORY[0x1E4F2FC20]);
        v32 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F15568]];
        CFRelease(v19);
        LODWORD(v19) = v32 != 0;

        CFStringRef v16 = v58;
LABEL_36:
        v33 = (void *)v55;
        if (v55)
        {
          if (((v10 | v19) & 1) != 0
            || ![(MFHardwareJPEGScaler *)v57 scaleImageToFitLargestDimension:v55 dataConsumer:info])
          {
            if (v10)
            {
              v35 = MFLogGeneral();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1AF945000, v35, OS_LOG_TYPE_INFO, "#Attachments doing color-conversion for wide-gamut image", buf, 2u);
              }

              CFStringRef v16 = v58;
            }
            int v52 = (int)v19;
            *(_OWORD *)buf = xmmword_1F0817240;
            v36 = CGDataConsumerCreate(info, (const CGDataConsumerCallbacks *)buf);
            if (v36)
            {
              CFDictionaryRef v37 = CGImageSourceCopyProperties(v14, 0);
              v38 = CGImageDestinationCreateWithDataConsumer(v36, v16, 1uLL, v37);
              if (v37) {
                CFRelease(v37);
              }
              if (v38)
              {
                v39 = [MEMORY[0x1E4F1CA60] dictionary];
                [v39 setObject:v55 forKey:*MEMORY[0x1E4F2F428]];
                if (v10) {
                  [v39 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F2F450]];
                }
                if (v52) {
                  [v39 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F2F460]];
                }
                CGImageDestinationAddImageFromSource(v38, v14, 0, (CFDictionaryRef)v39);
                BOOL v40 = CGImageDestinationFinalize(v38);
                CFRelease(v38);
              }
              else
              {
                BOOL v40 = 0;
              }
              CGDataConsumerRelease(v36);
            }
            else
            {
              BOOL v40 = 0;
            }
            BOOL v34 = v40;
          }
          else
          {
            BOOL v34 = 1;
          }
          v33 = (void *)v55;
          goto LABEL_60;
        }
LABEL_59:
        BOOL v34 = 0;
LABEL_60:

        CFRelease(v14);
        [info done];
        v41 = [info data];
        uint64_t v25 = [v41 length];

        if (v9)
        {
          v42 = [NSNumber numberWithUnsignedInteger:v25];
          [v8 setMetadataValue:v42 forKey:v9];
        }
        if ((v34 & a4) == 1)
        {
          v27 = [info data];
          v43 = [MEMORY[0x1E4F77B78] defaultManager];
          v44 = [info data];
          char v26 = [v43 updateAttachment:v8 withNewData:v44];

          [v8 _setImageScale:a3];
        }
        else
        {
          char v26 = 0;
          v27 = 0;
        }

        goto LABEL_66;
      default:
        uint64_t v55 = 0;
LABEL_34:
        if (!v19) {
          goto LABEL_36;
        }
        goto LABEL_35;
    }
    LODWORD(v18) = v30;
    uint64_t v55 = [NSNumber numberWithFloat:v18];
    goto LABEL_34;
  }
  char v26 = 0;
  v27 = 0;
  uint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
LABEL_67:

LABEL_68:
  if (!v61 || (v26 & 1) != 0)
  {
    v24 = v8;
  }
  else
  {
    v45 = *(void **)&v8[*MEMORY[0x1E4F77C78]];
    v46 = [v8 mimeType];
    v47 = [v8 fileName];
    v48 = [v8 contentID];
    v24 = [v45 attachmentForData:v27 mimeType:v46 fileName:v47 contentID:v48 context:v61];

    v49 = [NSNumber numberWithUnsignedInteger:v25];
    [v24 setMetadataValue:v49 forKey:v9];

    [v24 _setImageScale:a3];
  }

LABEL_73:

  return v24;
}

- (void)enqueueScaleAttachmentWithCompletionBlock:()Utilities
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  queue = [*(id *)&a1[*MEMORY[0x1E4F77C78]] imageScalingQueue];
  double v4 = dispatch_group_create();
  double v5 = [a1 url];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  char v7 = objc_msgSend(a1, "imageScalingFlags", v6);
  if (v7)
  {
    float v8 = &unk_1F0841350;
  }
  else if ((v7 & 2) != 0)
  {
    float v8 = &unk_1F0841368;
  }
  else
  {
    if ((v7 & 4) == 0) {
      goto LABEL_8;
    }
    float v8 = &unk_1F0841380;
  }
  [v6 addObject:v8];
LABEL_8:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [*(id *)(*((void *)&v24 + 1) + 8 * v11) unsignedIntegerValue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __69__MFAttachment_Utilities__enqueueScaleAttachmentWithCompletionBlock___block_invoke;
        block[3] = &unk_1E5F79060;
        block[4] = a1;
        id v22 = v5;
        uint64_t v23 = v12;
        dispatch_group_async(v4, queue, block);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__MFAttachment_Utilities__enqueueScaleAttachmentWithCompletionBlock___block_invoke_2;
  v18[3] = &unk_1E5F79528;
  v18[4] = a1;
  id v19 = v5;
  id v20 = v15;
  id v13 = v15;
  id v14 = v5;
  dispatch_group_notify(v4, MEMORY[0x1E4F14428], v18);
}

- (uint64_t)_imageScale
{
  double v1 = [a1 metadataValueForKey:@"_MFImageScaleSelected"];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (uint64_t)scaledFileSize
{
  char v2 = [a1 _imageScale];
  CFDataRef v3 = [a1 _imageScalingKeyForImageScale:0];
  if (v2)
  {
    uint64_t v4 = 1;
  }
  else if ((v2 & 2) != 0)
  {
    uint64_t v4 = 2;
  }
  else
  {
    if ((v2 & 4) == 0) {
      goto LABEL_8;
    }
    uint64_t v4 = 4;
  }
  uint64_t v5 = [a1 _imageScalingKeyForImageScale:v4];

  CFDataRef v3 = (void *)v5;
LABEL_8:
  if (v3)
  {
    uint64_t v6 = [a1 metadataValueForKey:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v6 integerValue];

  return v7;
}

+ (uint64_t)isBasicImageMimeType:()Utilities
{
  id v3 = a3;
  if (isBasicImageMimeType__onceToken != -1) {
    dispatch_once(&isBasicImageMimeType__onceToken, &__block_literal_global_3);
  }
  uint64_t v4 = [(id)isBasicImageMimeType__sBasicImageMIMETypes containsObject:v3];

  return v4;
}

+ (BOOL)_isPDF:()Utilities
{
  id v3 = a3;
  if (v3)
  {
    if ([@"application/pdf" caseInsensitiveCompare:v3]) {
      BOOL v4 = [@"image/pdf" caseInsensitiveCompare:v3] == 0;
    }
    else {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)isBasicImage
{
  char v2 = objc_opt_class();
  id v3 = [a1 mimeType];
  uint64_t v4 = [v2 isBasicImageMimeType:v3];

  return v4;
}

- (uint64_t)isDisplayableImage
{
  if ([a1 isBasicImage]) {
    return 1;
  }
  id v3 = [a1 mimeType];
  int v4 = [v3 hasPrefix:@"image"];

  if (v4)
  {
    if ([a1 isDisplayableByWebKit]) {
      return 1;
    }
  }
  else
  {
    uint64_t v2 = 1;
    if ([a1 _isSinglePagePDFFileFetchLocalData:1]) {
      return v2;
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F73588]);
  uint64_t v6 = [a1 fileName];
  uint64_t v7 = [v6 pathExtension];
  [v5 setPathExtension:v7];

  float v8 = [a1 fileName];
  [v5 setFilename:v8];

  if (MFGetTypeInfo())
  {
    uint64_t v9 = [v5 mimeType];
    if ([v9 hasPrefix:@"image"])
    {
      uint64_t v10 = +[MFWebKitMainThread sharedInstance];
      uint64_t v11 = [v5 mimeType];
      uint64_t v2 = [v10 dictValueForMimeType:v11] & 1;
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)isDisplayableByWebKit
{
  uint64_t v2 = [a1 mimeType];
  if (!v2) {
    goto LABEL_3;
  }
  id v3 = (void *)v2;
  int v4 = +[MFWebKitMainThread sharedInstance];
  id v5 = [a1 mimeType];
  char v6 = [v4 dictValueForMimeType:v5];

  if (v6) {
    return 1;
  }
LABEL_3:
  uint64_t v7 = [a1 fileName];
  float v8 = [v7 pathExtension];
  uint64_t v9 = [v8 lowercaseString];

  BOOL v10 = v9
     && [v9 length]
     && (([v9 isEqualToString:@"doc"] & 1) != 0
      || ([v9 isEqualToString:@"xls"] & 1) != 0
      || [v9 isEqualToString:@"pdf"]);

  return v10;
}

- (uint64_t)isDisplayableInsidePlugin
{
  return [a1 isDisplayableInline] ^ 1;
}

- (uint64_t)isDisplayableInline
{
  uint64_t v2 = [a1 metadataValueForKey:@"MFAttachmentDisplayabilityCheckedKey"];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    int v4 = [a1 metadataValueForKey:@"MFAttachmentIsDisplayableKey"];
    uint64_t v5 = [v4 BOOLValue];
LABEL_7:

    return v5;
  }
  if ([a1 isDisplayableImage]) {
    goto LABEL_5;
  }
  char v6 = [a1 mimeType];
  char v7 = [v6 hasSuffix:@"css"];

  if (v7) {
    goto LABEL_5;
  }
  if ([a1 isRestrictedMIMEType] & 1) != 0 || (objc_msgSend(a1, "isContentOpenable")) {
    goto LABEL_19;
  }
  uint64_t v9 = [a1 mimeType];
  if ([v9 hasPrefix:@"application"])
  {
    char v10 = [a1 isDisplayableByWebKit];

    if (v10) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F73588]);
  uint64_t v12 = [a1 fileName];
  id v13 = [v12 pathExtension];
  [v11 setPathExtension:v13];

  id v14 = [a1 fileName];
  [v11 setFilename:v14];

  if (!MFGetTypeInfo()
    || ([v11 mimeType], id v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
  {

    goto LABEL_19;
  }
  CFStringRef v16 = +[MFWebKitMainThread sharedInstance];
  CFDictionaryRef v17 = [v11 mimeType];
  char v18 = [v16 dictValueForMimeType:v17];

  if (v18)
  {
LABEL_5:
    uint64_t v5 = 1;
LABEL_6:
    [a1 setMetadataValue:MEMORY[0x1E4F1CC38] forKey:@"MFAttachmentDisplayabilityCheckedKey"];
    int v4 = [NSNumber numberWithBool:v5];
    [a1 setMetadataValue:v4 forKey:@"MFAttachmentIsDisplayableKey"];
    goto LABEL_7;
  }
LABEL_19:
  int v19 = [a1 isDataAvailableLocally];
  uint64_t v5 = 0;
  uint64_t result = 0;
  if (v19) {
    goto LABEL_6;
  }
  return result;
}

- (NSObject)filenameStrippingZipIfNeededUseApplications:()Utilities
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 fileName];
  uint64_t v5 = [v4 pathExtension];
  char v6 = [v5 lowercaseString];
  int v7 = [v6 isEqualToString:@"zip"];

  if (v7)
  {
    float v8 = [v4 stringByDeletingPathExtension];
    uint64_t v9 = [v8 pathExtension];
    if (([v9 isEqualToString:&stru_1F0817A00] & 1) == 0)
    {
      if (a3)
      {
        char v10 = [MEMORY[0x1E4F22430] documentProxyForName:v8 type:0 MIMEType:0];
        id v18 = 0;
        id v11 = [v10 applicationsAvailableForOpeningWithError:&v18];
        id v12 = v18;
        id v13 = v12;
        if (v11 || !v12)
        {
          if (![v11 count])
          {
LABEL_12:

            goto LABEL_13;
          }
          id v14 = v4;
          int v4 = v8;
        }
        else
        {
          id v14 = MFLogGeneral();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v15 = objc_msgSend(v13, "ef_publicDescription");
            [(MFAttachment(Utilities) *)(uint64_t)v8 filenameStrippingZipIfNeededUseApplications:(uint64_t)v19];
          }
        }

        goto LABEL_12;
      }
      CFStringRef v16 = v8;

      int v4 = v16;
    }
LABEL_13:
  }

  return v4;
}

- (id)markupStringForCompositionWithPrependedBlankLine:()Utilities imageScale:useAttachmentElement:
{
  uint64_t v9 = [a1 contentID];
  char v10 = [a1 contentID];
  id v11 = (void *)MFCreateURLForContentID();

  if (a5 && ([a1 isDisplayableImage] & 1) == 0)
  {
    uint64_t v27 = [a1 decodedFileSize];
    if (!v27) {
      uint64_t v27 = [a1 encodedFileSize];
    }
    v28 = [a1 fileName];
    objc_msgSend(v28, "ef_stringByEscapingForXML");
    id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v29 = NSString;
    int v19 = [a1 mimeType];
    long long v25 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v27);
    uint64_t v26 = [v29 stringWithFormat:@"<ATTACHMENT SRC=\"%@\" ID=\"%@\" TITLE=\"%@\" TYPE=\"%@\" SUBTITLE=\"%@\">", v11, v9, v18, v19, v25];
  }
  else
  {
    [a1 markupSizeForImageScale:a4];
    double v13 = v12;
    double v15 = v14;
    if (([a1 isDisplayableImage] & 1) != 0
      || (v13 == *MEMORY[0x1E4F1DB30] ? (BOOL v16 = v15 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) : (BOOL v16 = 0), v16))
    {
      id v18 = &stru_1F0817A00;
    }
    else
    {
      CFDictionaryRef v17 = [MEMORY[0x1E4F28E78] stringWithString:@" "];
      id v18 = v17;
      if (v13 > 0.00000011920929) {
        [(__CFString *)v17 appendFormat:@"WIDTH=\"%d\" %@=\"\", (int)v13, @"X-APPLE-ORIGINAL-WIDTH""];
      }
      if (v15 > 0.00000011920929) {
        [(__CFString *)v18 appendFormat:@"HEIGHT=\"%d\" %@=\"\", (int)v15, @"X-APPLE-ORIGINAL-HEIGHT""];
      }
    }
    int v19 = &stru_1F0817A00;
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"))
    {
      uint64_t v20 = [a1 mimeType];
      int v21 = [v20 isEqualToString:@"application/pdf"];

      id v22 = @" background-color: white;";
      if (!v21) {
        id v22 = &stru_1F0817A00;
      }
      uint64_t v23 = @" max-width: 100%";
      if (!v21) {
        uint64_t v23 = &stru_1F0817A00;
      }
      [NSString stringWithFormat:@" STYLE=\"padding:0px 1px 1px 0px;%@%@\"", v22, v23];
      int v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    long long v24 = NSString;
    long long v25 = [a1 className];
    uint64_t v26 = [v24 stringWithFormat:@"<IMG SRC=\"%@\" CLASS=\"%@\" ID=\"%@\"%@%@>", v11, v25, v9, v18, v19];
  }
  int v30 = (void *)v26;

  if (a3 && [v30 length])
  {
    uint64_t v31 = [@"<BR><BR>" stringByAppendingString:v30];

    int v30 = (void *)v31;
  }

  return v30;
}

- (id)markupStringForDisplayWithData:()Utilities allowAttachmentElement:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v7 = [a1 contentID];
  int v8 = [a1 isDataAvailableLocally];
  int v9 = [a1 isDisplayableInline];
  int v10 = [a1 hasCalendarMetadata];
  if (v9)
  {
    int v11 = a3 ? v8 : 0;
    if ((v11 | v10) == 1)
    {
      double v12 = &stru_1F0817A00;
      if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"))
      {
        double v13 = [a1 mimeType];
        int v14 = [v13 isEqualToString:@"application/pdf"];

        double v15 = @" background-color: white;";
        if (!v14) {
          double v15 = &stru_1F0817A00;
        }
        BOOL v16 = @" max-width: 100%";
        if (!v14) {
          BOOL v16 = &stru_1F0817A00;
        }
        objc_msgSend(NSString, "stringWithFormat:", @" STYLE=\"padding:1px 0px 1px 0px;%@%@\"",
          v15,
          v16);
        double v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      CFDictionaryRef v17 = (void *)MFCreateURLForContentID();
      id v18 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<img src=\"%@\" id=\"%@\"", v17, v7];
      if ([(__CFString *)v12 length]) {
        [v18 appendString:v12];
      }
      if ([&stru_1F0817A00 length]) {
        [v18 appendString:&stru_1F0817A00];
      }
      [v18 appendString:@">"];

      goto LABEL_38;
    }
  }
  if (!a4)
  {
    id v18 = 0;
    goto LABEL_38;
  }
  int v19 = [MEMORY[0x1E4F77B78] defaultManager];
  uint64_t v20 = [a1 url];
  int v21 = [v19 attachmentForURL:v20 error:0];

  id v22 = [a1 filenameStrippingZipIfNeededUseApplications:1];
  uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
  [v23 setObject:v7 forKeyedSubscript:@"id"];
  if (v22) {
    long long v24 = v22;
  }
  else {
    long long v24 = @"---";
  }
  [v23 setObject:v24 forKeyedSubscript:@"title"];
  long long v25 = [a1 attachmentContentTypeForFileName:v22];
  [v23 setObject:v25 forKeyedSubscript:@"type"];

  if (![v21 isDataAvailableLocally] || !objc_msgSend(a1, "isPass"))
  {
    uint64_t v26 = 0;
    goto LABEL_34;
  }
  id v40 = 0;
  uint64_t v26 = [v21 passWithError:&v40];
  id v27 = v40;
  if (v26)
  {
    v28 = [v26 localizedName];

    if (v28)
    {
      uint64_t v29 = [v26 localizedName];
      [v23 setObject:v29 forKeyedSubscript:@"title"];
    }
    int v30 = [v26 organizationName];

    if (!v30) {
      goto LABEL_33;
    }
    uint64_t v31 = [v26 organizationName];
    [v23 setObject:v31 forKeyedSubscript:@"subtitle"];
  }
  else
  {
    uint64_t v31 = MFLogGeneral();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v39 = [v27 localizedDescription];
      CFDictionaryRef v37 = [v27 userInfo];
      v38 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      *(_DWORD *)buf = 138412546;
      v42 = v39;
      __int16 v43 = 2112;
      v44 = v38;
      _os_log_error_impl(&dword_1AF945000, v31, OS_LOG_TYPE_ERROR, "#Attachments Error creating pass [%@] [%@]", buf, 0x16u);
    }
  }

LABEL_33:
LABEL_34:
  uint64_t v32 = [a1 decodedFileSize];
  if (v32 || (uint64_t v32 = [a1 encodedFileSize]) != 0)
  {
    v33 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v32);
    [v23 setObject:v33 forKeyedSubscript:@"subtitle"];
  }
  id v18 = [(id)objc_opt_class() attachmentElementHTMLStringWithAttributes:v23];

LABEL_38:
  BOOL v34 = MFLogGeneral();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = [a1 fileName];
    *(_DWORD *)buf = 138412546;
    v42 = v35;
    __int16 v43 = 2112;
    v44 = v18;
    _os_log_impl(&dword_1AF945000, v34, OS_LOG_TYPE_INFO, "#Attachments Attachment %@ translates to HTML:\"%@\"", buf, 0x16u);
  }

  return v18;
}

+ (id)attachmentElementHTMLStringWithAttributes:()Utilities
{
  v10[3] = *MEMORY[0x1E4F143B8];
  int v3 = (void *)[a3 mutableCopy];
  v10[0] = @"---";
  v9[0] = @"action";
  v9[1] = @"_mf_downloadingStatus";
  int v4 = MFLookupLocalizedString();
  v10[1] = v4;
  v9[2] = @"_mf_downloadableStatus";
  uint64_t v5 = MFLookupLocalizedString();
  v10[2] = v5;
  char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  [v3 addEntriesFromDictionary:v6];
  int v7 = [MEMORY[0x1E4F60D78] htmlSnippetWithTag:@"attachment" includeTrailingTag:1 attributes:v3];

  return v7;
}

- (void)filenameStrippingZipIfNeededUseApplications:()Utilities .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_0(&dword_1AF945000, "#Attachments Error retriving applications for %@: %{public}@", v4, v5);
}

@end