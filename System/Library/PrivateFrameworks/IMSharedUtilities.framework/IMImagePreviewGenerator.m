@interface IMImagePreviewGenerator
+ (BOOL)_getUncroppedSizeForImageAtURL:(id)a3 scale:(double)a4 withImageSizeInPx:(CGSize)a5 maximumSizeInPx:(CGSize)a6 minimumSizeInPx:(CGSize)a7 previewSize:(CGSize *)a8 senderContext:(id)a9;
+ (BOOL)writesToDisk;
+ (CGImage)_newBlastdoorPreviewForFileAtURL:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 isScreenshot:(BOOL *)a7 isMonoskiAsset:(BOOL *)a8 stickerEffect:(id *)a9 error:(id *)a10;
+ (CGImage)_newCroppedAndScaledImageWithImageSource:(CGImageSource *)a3 withPreviewConstraints:(IMPreviewConstraints *)a4;
+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6;
+ (CGImage)newThumbnailFillToSize:(CGSize)a3 imagePxSize:(CGSize)a4 imageSource:(CGImageSource *)a5 scale:(double)a6;
+ (id)UTITypes;
+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8;
@end

@implementation IMImagePreviewGenerator

+ (id)UTITypes
{
  return &unk_1EF305EB0;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFURLRef v10 = (const __CFURL *)a3;
  id v11 = a4;
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v20 = 138412546;
      *(void *)&v20[4] = a1;
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v10;
      _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Generating preview for class %@ from sourceURL %@", v20, 0x16u);
    }
  }
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "IMImagePreviewGenerator - sourceURL is nil", v20, 2u);
      }
    }
    if (a6)
    {
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:5 userInfo:0];
      goto LABEL_20;
    }
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  CGImageSourceRef v13 = CGImageSourceCreateWithURL(v10, 0);
  if (!v13)
  {
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v20 = 138412290;
        *(void *)&v20[4] = v10;
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "IMImagePreviewGenerator - Unable to generate image ref for %@", v20, 0xCu);
      }
    }
    if (a6)
    {
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:3 userInfo:0];
LABEL_20:
      v15 = 0;
      *a6 = v17;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  long long v14 = *(_OWORD *)&a5->var1.height;
  *(_OWORD *)v20 = *(_OWORD *)&a5->var0;
  *(_OWORD *)&v20[16] = v14;
  uint64_t v21 = *(void *)&a5->var3;
  v15 = (CGImage *)[a1 _newCroppedAndScaledImageWithImageSource:v13 withPreviewConstraints:v20];
  CFRelease(v13);
LABEL_22:

  return v15;
}

+ (CGImage)_newCroppedAndScaledImageWithImageSource:(CGImageSource *)a3 withPreviewConstraints:(IMPreviewConstraints *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  +[IMImageUtilities imageSourcePxSize:](IMImageUtilities, "imageSourcePxSize:");
  double v8 = v7;
  double v10 = v9;
  double var0 = a4->var0;
  double v12 = fmax(v8 / v9, 0.75);
  if (v12 > 1.77777778) {
    double v12 = 1.77777778;
  }
  double v13 = round(var0);
  double v14 = round(var0 / v12);
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      IMStringFromCGSize(v8, v10);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      double v17 = a4->var0;
      v18 = IMStringFromCGSize(v13, v14);
      *(_DWORD *)v23 = 138412802;
      *(void *)&v23[4] = v16;
      *(_WORD *)&v23[12] = 2048;
      *(double *)&v23[14] = v17;
      *(_WORD *)&v23[22] = 2112;
      *(void *)&v23[24] = v18;
      _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Generating thumbnail for image with px size %@ maxWidth: %f thumbnailSize %@", v23, 0x20u);
    }
  }
  v19 = (const void *)objc_msgSend(a1, "newThumbnailFillToSize:imagePxSize:imageSource:scale:", a3, v13, v14, v8, v10, a4->var2);
  long long v20 = *(_OWORD *)&a4->var1.height;
  *(_OWORD *)v23 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&v23[16] = v20;
  uint64_t v24 = *(void *)&a4->var3;
  uint64_t v21 = (CGImage *)objc_msgSend(a1, "newCroppedAndRescaledImageFromImage:constraints:targetPxSize:", v19, v23, v13, v14);
  if (v19) {
    CFRelease(v19);
  }
  return v21;
}

+ (CGImage)_newBlastdoorPreviewForFileAtURL:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 isScreenshot:(BOOL *)a7 isMonoskiAsset:(BOOL *)a8 stickerEffect:(id *)a9 error:(id *)a10
{
  long long v42 = (unint64_t)a8;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  v19 = +[IMAttachmentBlastdoor generateImagePreviewForFileURL:v15 senderContext:v16 maxPixelDimension:(char *)&v42 + 8 scale:v17 error:v18];
  id v20 = *((id *)&v42 + 1);
  if (v19
    && ([v19 utTypeString], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([v19 utTypeString],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        BOOL v23 = [v22 length] == 0,
        v22,
        v21,
        !v23))
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v25 = [v19 utTypeString];
    [v24 setValue:v25 forKey:@"uti_type"];

    v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "isFromMe"));
    [v24 setValue:v26 forKey:@"is_from_me"];
    v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "isTrustedSender"));
    [v24 setValue:v27 forKey:@"is_trusted_sender"];
    v28 = [v16 serviceName];
    [v24 setValue:v28 forKey:@"service"];

    v29 = +[IMMetricsCollector sharedInstance];
    [v29 trackEvent:@"com.apple.Messages.IMMetricsCollectorEventImagePreviewGenerationSuccess" withDictionary:v24];
  }
  else
  {
    id v24 = +[IMMetricsCollector sharedInstance];
    [v24 trackEvent:@"com.apple.Messages.IMMetricsCollectorEventImagePreviewGenerationFailure"];
  }

  v30 = +[IMDefaults sharedInstance];
  int v31 = [v30 getBoolFromDomain:@"com.apple.imtranscoding.IMTranscoderAgent" forKey:@"failBDPreviewGeneration" defaultValue:0];

  if (v31)
  {
    if (IMOSLoggingEnabled())
    {
      v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v44 = @"com.apple.imtranscoding.IMTranscoderAgent";
        __int16 v45 = 2112;
        v46 = @"failBDPreviewGeneration";
        __int16 v47 = 2112;
        v48 = v19;
        __int16 v49 = 2112;
        id v50 = v20;
        _os_log_impl(&dword_1A0772000, v32, OS_LOG_TYPE_INFO, "Forcing PreviewGeneration to fail due to default %@ %@. Actual result: image %@ error %@", buf, 0x2Au);
      }
    }
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMPreviewGenerationErrorDomain" code:14 userInfo:0];

    id v20 = (id)v33;
    goto LABEL_16;
  }
  if (!v19)
  {
LABEL_16:
    if (!v20) {
      id v20 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMPreviewGenerationErrorDomain" code:1 userInfo:0];
    }
    v19 = 0;
    char v36 = 0;
    v35 = 0;
    goto LABEL_19;
  }
  v34 = [v19 image];
  v35 = CGImageRetain((CGImageRef)[v34 cgImage]);

  if (+[IMImageUtilities isCroppingAvoidanceEnabled]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v36 = [v19 isScreenshot];
  }
  else
  {
    char v36 = 0;
  }
  *(unsigned char *)long long v42 = 0;
  if (objc_opt_respondsToSelector()) {
    *(unsigned char *)long long v42 = [v19 isMonoskiAsset];
  }
  v38 = +[IMFeatureFlags sharedFeatureFlags];
  char v39 = [v38 isClingEnabled];

  char v40 = v39 ^ 1;
  if (!a9) {
    char v40 = 1;
  }
  if (v40 & 1) == 0 && (objc_opt_respondsToSelector())
  {
    *a9 = [v19 stickerEffect];
  }
LABEL_19:
  if (a10 && !v35) {
    *a10 = v20;
  }
  if (a7) {
    *a7 = v36;
  }

  return v35;
}

+ (BOOL)_getUncroppedSizeForImageAtURL:(id)a3 scale:(double)a4 withImageSizeInPx:(CGSize)a5 maximumSizeInPx:(CGSize)a6 minimumSizeInPx:(CGSize)a7 previewSize:(CGSize *)a8 senderContext:(id)a9
{
  double height = a7.height;
  double width = a7.width;
  double v13 = a6.height;
  double v14 = a6.width;
  double v15 = a5.height;
  double v16 = a5.width;
  id v19 = a3;
  id v20 = a9;
  if (!+[IMImageUtilities shouldCropImageOfSize:maximumSizeInPx:minimumSizeInPx:](IMImageUtilities, "shouldCropImageOfSize:maximumSizeInPx:minimumSizeInPx:", v16, v15, v14, v13, width, height))
  {
    __int16 v31 = 0;
    id v30 = 0;
    uint64_t v22 = (CGImage *)[a1 _newBlastdoorPreviewForFileAtURL:v19 senderContext:v20 maxPxWidth:(char *)&v31 + 1 scale:&v31 isScreenshot:0 isMonoskiAsset:&v30 stickerEffect:v14 error:a4];
    id v23 = v30;
    if (v22)
    {
      +[IMImageUtilities uncroppedPreviewImageSizeFromImageSizeInPx:maximumSizeInPx:](IMImageUtilities, "uncroppedPreviewImageSizeFromImageSizeInPx:maximumSizeInPx:", v16, v15, v14, v13);
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      if (HIBYTE(v31)
        || +[IMImageUtilities imageIsSubjectLift:v22])
      {
        a8->double width = v25;
        a8->double height = v27;
        CGImageRelease(v22);
        BOOL v21 = 1;
LABEL_12:

        goto LABEL_13;
      }
      CGImageRelease(v22);
    }
    else
    {
      v28 = IMLogHandleForCategory("IMImagePreviewGenerator");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1A09F23B8((uint64_t)v23, v19, v28);
      }
    }
    BOOL v21 = 0;
    goto LABEL_12;
  }
  BOOL v21 = 0;
LABEL_13:

  return v21;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  v86[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v76 = a4;
  id v75 = a5;
  double v15 = _os_activity_create(&dword_1A0772000, "com.apple.messages.AttachmentGeneratePreviewImage", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  if (v14 && a7 && a8)
  {
    v74 = a8;
    if (IMOSLoggingEnabled())
    {
      double v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v14;
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Invoking Blastdoor for image at source URL: %@", buf, 0xCu);
      }
    }
    double v17 = (void *)MEMORY[0x1E4F1CB10];
    double v18 = IMSafeTemporaryDirectory();
    id v19 = [v18 path];
    v86[0] = v19;
    v86[1] = @"ImagePreview";
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
    BOOL v21 = [v17 fileURLWithPathComponents:v20];

    uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v22 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:0 error:0];

    id v23 = [NSString stringGUID];
    double v24 = [v21 URLByAppendingPathComponent:v23 isDirectory:0];
    id v25 = [v24 URLByAppendingPathExtension:@"ktx"];

    if (!v25)
    {
      if (IMOSLoggingEnabled())
      {
        v60 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v14;
          _os_log_impl(&dword_1A0772000, v60, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL for sourceURL: %@", buf, 0xCu);
        }
      }
      [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:6 userInfo:0];
      id v25 = 0;
      v59 = 0;
      id *v74 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_87;
    }
    if (![a1 writesToDisk])
    {
      v59 = 0;
LABEL_87:

      goto LABEL_88;
    }
    __int16 v81 = 0;
    double var0 = a6->var0;
    if (a6->var0 < *(double *)"") {
      double var0 = *(double *)"";
    }
    double var2 = a6->var2;
    id v79 = 0;
    id v80 = 0;
    uint64_t v28 = [a1 _newBlastdoorPreviewForFileAtURL:v14 senderContext:v76 maxPxWidth:(char *)&v81 + 1 scale:&v81 isScreenshot:&v80 isMonoskiAsset:&v79 stickerEffect:var0 error:var2];
    id v72 = v80;
    id v29 = v79;
    v71 = v29;
    if (!v28 || v29)
    {
      if (v29)
      {
        id v61 = v29;

        goto LABEL_85;
      }
      id v61 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMPreviewGenerationErrorDomain" code:1 userInfo:0];

      if (v61) {
        goto LABEL_85;
      }
LABEL_62:
      id v62 = 0;
      id v25 = 0;
LABEL_86:
      id v25 = v25;

      v59 = v25;
      goto LABEL_87;
    }
    image = (CGImage *)v28;
    +[IMImageUtilities imageRefPxSize:v28];
    double v31 = v30;
    double v33 = v32;
    double v34 = a6->var0;
    double v35 = fmax(v30 / v32, 0.75);
    if (v35 <= 1.77777778) {
      double v36 = v35;
    }
    else {
      double v36 = 1.77777778;
    }
    BOOL v37 = +[IMImageUtilities isCroppingAvoidanceEnabled];
    double v38 = v34 / v36;
    double v39 = round(v34);
    double v40 = round(v38);
    if (v37)
    {
      if (a6->var3)
      {
        double v39 = v31;
        double v40 = v33;
      }
      v41 = +[IMImageUtilities newUncroppedPreviewImageFromImage:isScreenshot:maximumSizeInPx:minimumSizeInPx:](IMImageUtilities, "newUncroppedPreviewImageFromImage:isScreenshot:maximumSizeInPx:minimumSizeInPx:", v28, HIBYTE(v81), v39, v40, a6->var1.width, a6->var1.height);
      if (v41) {
        goto LABEL_22;
      }
    }
    long long v42 = *(_OWORD *)&a6->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a6->var0;
    long long v84 = v42;
    uint64_t v85 = *(void *)&a6->var3;
    v41 = (CGImage *)objc_msgSend(a1, "newCroppedAndRescaledImageFromImage:constraints:targetPxSize:", v28, buf, v39, v40);
    if (v41)
    {
LABEL_22:
      id v78 = 0;
      v43 = v41;
      BOOL v44 = +[IMImageUtilities persistPreviewToDiskCache:v41 previewURL:v25 error:&v78];
      id v45 = v78;
      if (v44)
      {
        v73 = v45;
        +[IMImageUtilities imageRefPxSize:v43];
        double v31 = v46;
        double v33 = v47;
        v48 = [v25 URLByDeletingPathExtension];
        v68 = [v48 URLByAppendingPathExtension:@"plist"];

        v69 = [MEMORY[0x1E4F1CA60] dictionary];
        __int16 v49 = +[IMFeatureFlags sharedFeatureFlags];
        int v50 = [v49 isClingEnabled];

        if (v50 && [v72 length] && (objc_msgSend(v72, "isEqualToString:", @"none") & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v51 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v72;
              _os_log_impl(&dword_1A0772000, v51, OS_LOG_TYPE_INFO, "Sticker had effect: %@", buf, 0xCu);
            }
          }
          [v69 setObject:v72 forKeyedSubscript:@"stickerEffectType"];
        }
        if ((_BYTE)v81)
        {
          if (IMOSLoggingEnabled())
          {
            v52 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A0772000, v52, OS_LOG_TYPE_INFO, "Image was monoski.", buf, 2u);
            }
          }
          v53 = [NSNumber numberWithBool:v81];
          [v69 setObject:v53 forKeyedSubscript:@"IMIsMonoskiAssetKey"];
        }
        if (![v69 count]) {
          goto LABEL_78;
        }
        if (IMOSLoggingEnabled())
        {
          v54 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0772000, v54, OS_LOG_TYPE_INFO, "Writing preview metadata", buf, 2u);
          }
        }
        id v77 = 0;
        v55 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v69 format:200 options:0 error:&v77];
        id v56 = v77;
        if (v55)
        {
          if ([v55 writeToURL:v68 atomically:1])
          {
            if (IMOSLoggingEnabled())
            {
              v57 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v68;
                _os_log_impl(&dword_1A0772000, v57, OS_LOG_TYPE_INFO, "Wrote down preview metadata plist to %@", buf, 0xCu);
              }
LABEL_76:
            }
          }
          else if (IMOSLoggingEnabled())
          {
            v57 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v68;
              _os_log_impl(&dword_1A0772000, v57, OS_LOG_TYPE_INFO, "Couldn't write down preview metadata plist to %@", buf, 0xCu);
            }
            goto LABEL_76;
          }
        }
        else if (IMOSLoggingEnabled())
        {
          v57 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v56;
            _os_log_impl(&dword_1A0772000, v57, OS_LOG_TYPE_INFO, "Failed making preview metadata plist %@", buf, 0xCu);
          }
          goto LABEL_76;
        }

LABEL_78:
        uint64_t v63 = 0;
        int v65 = 1;
        goto LABEL_79;
      }
    }
    else
    {
      v43 = 0;
      id v45 = 0;
    }
    v73 = v45;
    uint64_t v63 = [v45 copy];
    if (IMOSLoggingEnabled())
    {
      v64 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v63;
        _os_log_impl(&dword_1A0772000, v64, OS_LOG_TYPE_INFO, "IMImagePreviewGenerator - Unable to generate image: error=%@", buf, 0xCu);
      }
    }
    int v65 = 0;
LABEL_79:
    CGImageRelease(v43);
    id v61 = (id)v63;
    CGImageRelease(image);

    if (v63) {
      int v66 = 0;
    }
    else {
      int v66 = v65;
    }
    if (v66 == 1)
    {
      id v62 = 0;
      a7->double width = v31;
      a7->double height = v33;
      goto LABEL_86;
    }

    if (v63)
    {
LABEL_85:
      id v62 = v61;
      id v25 = 0;
      id *v74 = v62;
      goto LABEL_86;
    }
    goto LABEL_62;
  }
  if (IMOSLoggingEnabled())
  {
    v58 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v58, OS_LOG_TYPE_INFO, "Invalid parameters", buf, 2u);
    }
  }
  v59 = 0;
LABEL_88:
  os_activity_scope_leave(&state);

  return v59;
}

+ (BOOL)writesToDisk
{
  return 1;
}

+ (CGImage)newThumbnailFillToSize:(CGSize)a3 imagePxSize:(CGSize)a4 imageSource:(CGImageSource *)a5 scale:(double)a6
{
  return +[IMImageUtilities newThumbnailForTargetSize:imageSize:imageSource:mode:scale:](IMImageUtilities, "newThumbnailForTargetSize:imageSize:imageSource:mode:scale:", a5, 1, a3.width, a3.height, a4.width, a4.height, a6);
}

@end