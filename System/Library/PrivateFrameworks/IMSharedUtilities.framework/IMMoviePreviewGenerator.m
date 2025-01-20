@interface IMMoviePreviewGenerator
+ (BOOL)isAutoloopAsset:(id)a3;
+ (BOOL)writesToDisk;
+ (CGImage)newImageWithPlayButtonOverlay:(CGImage *)a3 scale:(double)a4 transferGUID:(id)a5 error:(id *)a6;
+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6;
+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 skipPlayButton:(BOOL)a6 error:(id *)a7;
+ (id)UTITypes;
+ (id)_avAssetForURL:(id)a3;
+ (id)fetchUTITypes;
+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8;
@end

@implementation IMMoviePreviewGenerator

+ (id)UTITypes
{
  return &unk_1EF305A90;
}

+ (id)fetchUTITypes
{
  v2 = (void *)[MEMORY[0x1E4F166C8] audiovisualTypes];
  [v2 indexesOfObjectsPassingTest:&unk_1EF2BF140];

  return (id)MEMORY[0x1F4181798](v2, sel_objectsAtIndexes_);
}

+ (BOOL)isAutoloopAsset:(id)a3
{
  return MEMORY[0x1F4181798](IMAttachmentUtilities, sel_asset_containsMetadataKey_);
}

+ (CGImage)newImageWithPlayButtonOverlay:(CGImage *)a3 scale:(double)a4 transferGUID:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a6) {
    *a6 = 0;
  }
  v10 = (void *)MEMORY[0x1A6227910](@"CKMovieMediaObject", @"ChatKit");
  if (!v10 || (v11 = v10, ![v10 conformsToProtocol:&unk_1EF343990]))
  {
    int v15 = IMOSLoggingEnabled();
    if (a5)
    {
      if (v15)
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v21 = 138412546;
          uint64_t v22 = objc_opt_class();
          __int16 v23 = 2112;
          id v24 = a5;
          _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "%@ failed to weak link CKMovieMediaObjectClass for GUID: %@", (uint8_t *)&v21, 0x16u);
          if (!a6) {
            return 0;
          }
          goto LABEL_20;
        }
      }
    }
    else if (v15)
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412290;
        uint64_t v22 = objc_opt_class();
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "%@ failed to weak link CKMovieMediaObjectClass", (uint8_t *)&v21, 0xCu);
      }
    }
    if (!a6) {
      return 0;
    }
LABEL_20:
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMPreviewGenerationErrorDomain" code:10 userInfo:0];
LABEL_21:
    v19 = (void *)v18;
    result = 0;
    *a6 = v19;
    return result;
  }
  result = CGImageCreateCopy((CGImageRef)[v11 playButtonPreviewForCGImage:a3 scale:0 isFromMe:a4]);
  if (result) {
    return result;
  }
  int v13 = IMOSLoggingEnabled();
  if (a5)
  {
    if (v13)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412546;
        uint64_t v22 = objc_opt_class();
        __int16 v23 = 2112;
        id v24 = a5;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "%@ CKMovieMediaObject failed to create stamped preview for GUID: %@", (uint8_t *)&v21, 0x16u);
        if (!a6) {
          return 0;
        }
        goto LABEL_26;
      }
    }
  }
  else if (v13)
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      uint64_t v22 = objc_opt_class();
      _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "%@ CKMovieMediaObject failed to create stamped preview", (uint8_t *)&v21, 0xCu);
    }
  }
  if (a6)
  {
LABEL_26:
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:1 userInfo:0];
    goto LABEL_21;
  }
  return 0;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  long long v6 = *(_OWORD *)&a5->var1.height;
  v8[0] = *(_OWORD *)&a5->var0;
  v8[1] = v6;
  uint64_t v9 = *(void *)&a5->var3;
  return (CGImage *)[a1 newPreviewFromSourceURL:a3 senderContext:a4 withPreviewConstraints:v8 skipPlayButton:0 error:a6];
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 skipPlayButton:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a3;
      _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Generating preview for class %@ from sourceURL %@", buf, 0x16u);
    }
  }
  if (!a3)
  {
    if (IMOSLoggingEnabled())
    {
      v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v37, OS_LOG_TYPE_INFO, "IMMoviePreviewgenerator - sourceURL is nil", buf, 2u);
      }
    }
    if (a7)
    {
      id v24 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:5 userInfo:0];
      goto LABEL_25;
    }
    return 0;
  }
  int v13 = (void *)[a1 _avAssetForURL:a3];
  v14 = v13;
  if (!v13)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "IMMoviePreviewgenerator - Could not generate AVURLAsset", buf, 2u);
      }
    }
    if (a7)
    {
      id v24 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:3 userInfo:0];
LABEL_25:
      v36 = 0;
      *a7 = v24;
      return v36;
    }
    return 0;
  }
  int v15 = objc_msgSend((id)objc_msgSend(v13, "tracksWithMediaType:", *MEMORY[0x1E4F15C18]), "lastObject");
  v16 = v15;
  if (v15)
  {
    [v15 naturalSize];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [v16 preferredTransform];
    v43.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v43.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    v43.size.double width = v18;
    v43.size.double height = v20;
    CGRect v44 = CGRectApplyAffineTransform(v43, &v39);
    double width = v44.size.width;
    double height = v44.size.height;
  }
  else
  {
    double width = *MEMORY[0x1E4F1DB30];
    double height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  objc_msgSend(a1, "thumbnailFillSizeForWidth:imageSize:scale:", a5->var0, width, height, a5->var2);
  double v26 = v25;
  double v28 = v27;
  v29 = (void *)[MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v14];
  [v29 setAppliesPreferredTrackTransform:1];
  double v30 = fmax(v26 / width, v28 / height);
  double v31 = ceil(width * v30);
  double v32 = ceil(height * v30);
  objc_msgSend(v29, "setMaximumSize:", v31, v32);
  *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
  *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v33 = (const void *)[v29 copyCGImageAtTime:buf actualTime:0 error:0];
  long long v34 = *(_OWORD *)&a5->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a5->var0;
  *(_OWORD *)&buf[16] = v34;
  uint64_t v41 = *(void *)&a5->var3;
  v35 = (CGImage *)objc_msgSend(a1, "newCroppedAndRescaledImageFromImage:constraints:targetPxSize:", v33, buf, v31, v32);
  if (v33) {
    CFRelease(v33);
  }
  if (([a1 isAutoloopAsset:v14] | v8)) {
    return v35;
  }
  v36 = (CGImage *)[a1 newImageWithPlayButtonOverlay:v35 scale:0 transferGUID:a7 error:a5->var2];
  if (v35) {
    CFRelease(v35);
  }
  return v36;
}

+ (BOOL)writesToDisk
{
  return 1;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  v48[2] = *MEMORY[0x1E4F143B8];
  v14 = _os_activity_create(&dword_1A0772000, "com.apple.messages.AttachmentGeneratePreviewMovie", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);

  if (!a3 || !a7 || !a8)
  {
    if (IMOSLoggingEnabled())
    {
      double v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Invalid parameters", (uint8_t *)&buf, 2u);
      }
    }
LABEL_15:
    double v19 = 0;
    goto LABEL_23;
  }
  uint64_t v15 = [NSString stringGUID];
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Invoking BlastDoor for movie previews for GUID: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  double v17 = (void *)MEMORY[0x1E4F1CB10];
  v48[0] = [IMSafeTemporaryDirectory() path];
  v48[1] = @"VideoPreview";
  CGFloat v18 = objc_msgSend(v17, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v48, 2));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, 0);
  double v19 = objc_msgSend((id)objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v15, 0), "URLByAppendingPathExtension:", @"ktx");
  if (v19)
  {
    if ([a1 writesToDisk])
    {
      uint64_t v38 = 0;
      CGAffineTransform v39 = &v38;
      uint64_t v40 = 0x2020000000;
      char v41 = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v44 = 0x3010000000;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      v45 = &unk_1A0A86C2F;
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x3052000000;
      v35 = sub_1A07777AC;
      v36 = sub_1A07776B8;
      uint64_t v37 = 0;
      CGFloat v20 = dispatch_group_create();
      dispatch_group_enter(v20);
      double var0 = a6->var0;
      double var2 = a6->var2;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = sub_1A07AD3DC;
      v28[3] = &unk_1E5A10548;
      v28[4] = v15;
      v28[5] = a4;
      long long v23 = *(_OWORD *)&a6->var1.height;
      long long v29 = *(_OWORD *)&a6->var0;
      long long v30 = v23;
      uint64_t v31 = *(void *)&a6->var3;
      v28[10] = &buf;
      v28[11] = &v32;
      v28[6] = a1;
      v28[7] = v19;
      v28[8] = v20;
      v28[9] = &v38;
      +[IMAttachmentBlastdoor generateMoviePreview:senderContext:maxPxWidth:minThumbnailPxSize:scale:withCompletionBlock:](IMAttachmentBlastdoor, "generateMoviePreview:senderContext:maxPxWidth:minThumbnailPxSize:scale:withCompletionBlock:", a3, a4, v28, var0, a6->var1.width, a6->var1.height, var2);
      dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
      id v24 = (void *)v33[5];
      if (*((unsigned char *)v39 + 24))
      {
        if (!v24)
        {
          *a7 = *(CGSize *)(*((void *)&buf + 1) + 32);
LABEL_22:
          _Block_object_dispose(&v32, 8);
          _Block_object_dispose(&buf, 8);
          _Block_object_dispose(&v38, 8);
          goto LABEL_23;
        }
      }
      else if (!v24)
      {
        double v19 = 0;
        goto LABEL_22;
      }
      double v19 = 0;
      *a8 = v24;
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    double v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL for GUID: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  double v19 = 0;
  *a8 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:6 userInfo:0];
LABEL_23:
  os_activity_scope_leave(&state);
  return v19;
}

+ (id)_avAssetForURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a3 || ![a3 isFileURL]) {
    return 0;
  }
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)*MEMORY[0x1E4F16158];
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Asset string %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id v6 = IMAVURLAssetOptionsDefault();
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Options dictionary %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return (id)[objc_alloc(MEMORY[0x1E4F166C8]) initWithURL:a3 options:v6];
}

@end