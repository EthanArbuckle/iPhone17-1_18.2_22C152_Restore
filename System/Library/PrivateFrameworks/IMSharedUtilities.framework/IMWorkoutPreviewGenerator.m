@interface IMWorkoutPreviewGenerator
+ (BOOL)_isAvailable;
+ (BOOL)generateWorkoutPreview:(id)a3 andWriteToURL:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 imagePxSize:(CGSize *)a7;
+ (BOOL)writesToDisk;
+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8;
@end

@implementation IMWorkoutPreviewGenerator

+ (BOOL)_isAvailable
{
  return 1;
}

+ (BOOL)writesToDisk
{
  return 1;
}

+ (BOOL)generateWorkoutPreview:(id)a3 andWriteToURL:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 imagePxSize:(CGSize *)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v35 = a4;
  *a7 = *(CGSize *)MEMORY[0x1E4F1DB30];
  MEMORY[0x1A6227910](@"BlastDoorWorkoutPreview", @"BlastDoor");
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;
  uint64_t v13 = [v12 activityType];
  uint64_t v14 = [v12 isIndoor];
  uint64_t v15 = [v12 configurationType];
  v16 = [v12 configurationName];
  uint64_t v17 = [v12 goalTypeIdentifier];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v18 = (void *)qword_1E94FF7C8;
  uint64_t v43 = qword_1E94FF7C8;
  if (!qword_1E94FF7C8)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1A08275EC;
    v38 = &unk_1E5A10130;
    v39 = &v40;
    sub_1A08275EC((uint64_t)buf);
    v18 = (void *)v41[3];
  }
  v19 = v18;
  _Block_object_dispose(&v40, 8);
  v20 = (void *)[[v19 alloc] initWithActivityType:v13 isIndoor:v14 configurationType:v15 configurationName:v16 goalTypeIdentifier:v17];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v21 = (void *)qword_1E94FF7D8;
  uint64_t v43 = qword_1E94FF7D8;
  if (!qword_1E94FF7D8)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1A08277B4;
    v38 = &unk_1E5A10130;
    v39 = &v40;
    sub_1A08277B4((uint64_t)buf);
    v21 = (void *)v41[3];
  }
  id v22 = v21;
  _Block_object_dispose(&v40, 8);
  CFDataRef v23 = [v22 uiImageRepresentationForBlastDoorDataSource:v20 scale:a6];
  CFDataRef v24 = v23;
  if (v23
    && (v25 = CGDataProviderCreateWithCFData(v23),
        v26 = CGImageCreateWithPNGDataProvider(v25, 0, 1, kCGRenderingIntentDefault),
        CGDataProviderRelease(v25),
        v26))
  {
    id v36 = 0;
    BOOL v27 = +[IMImageUtilities persistPreviewToDiskCache:v26 previewURL:v35 error:&v36];
    id v28 = v36;
    if (v27)
    {
      size_t Width = CGImageGetWidth(v26);
      size_t Height = CGImageGetHeight(v26);
      a7->width = (double)Width;
      a7->height = (double)Height;
    }
    else if (IMOSLoggingEnabled())
    {
      v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v28;
        _os_log_impl(&dword_1A0772000, v33, OS_LOG_TYPE_INFO, "IMWorkoutPreviewGenerator - Failed to write decorated image to URL %@: %@", buf, 0x16u);
      }
    }
    CGImageRelease(v26);

    char v32 = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v31, OS_LOG_TYPE_INFO, "IMWorkoutPreviewGenerator - Failed to get image from IMWorkoutPreviewUnpacker_SwiftImpl", buf, 2u);
      }
    }
    BOOL v27 = 0;
    char v32 = 1;
  }

  if (v32) {
    BOOL v27 = 0;
  }

  return v27;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13 && a7 && a8)
  {
    v33 = a7;
    v16 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v17 = NSTemporaryDirectory();
    v54[0] = v17;
    v54[1] = @"ImagePreview";
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    v19 = [v16 fileURLWithPathComponents:v18];

    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v20 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:0];

    v21 = [NSString stringGUID];
    id v22 = [v19 URLByAppendingPathComponent:v21 isDirectory:0];
    CFDataRef v23 = [v22 URLByAppendingPathExtension:@"ktx"];

    if (v23)
    {
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x2020000000;
      char v48 = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v50 = 0x3032000000;
      v51 = sub_1A077788C;
      v52 = sub_1A0777734;
      id v53 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = &v39;
      uint64_t v41 = 0x3032000000;
      uint64_t v42 = sub_1A077788C;
      uint64_t v43 = sub_1A0777734;
      id v44 = 0;
      CFDataRef v24 = dispatch_group_create();
      dispatch_group_enter(v24);
      double var0 = a6->var0;
      double var2 = a6->var2;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = sub_1A0827444;
      v34[3] = &unk_1E5A13240;
      id v36 = &v45;
      v37 = &v39;
      p_long long buf = &buf;
      BOOL v27 = v24;
      id v35 = v27;
      +[IMAttachmentBlastdoor generateWorkoutPreview:v13 senderContext:v14 maxPxWidth:v34 scale:var0 withCompletionBlock:var2];
      dispatch_group_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
      if (v40[5] && *((unsigned char *)v46 + 24) && !*(void *)(*((void *)&buf + 1) + 40))
      {
        [(id)objc_opt_class() generateWorkoutPreview:v40[5] andWriteToURL:v23 maxPxWidth:v33 scale:a6->var0 imagePxSize:a6->var2];
      }
      else
      {

        id v28 = *(void **)(*((void *)&buf + 1) + 40);
        CFDataRef v23 = 0;
        if (v28) {
          *a8 = v28;
        }
      }
      id v30 = v23;

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&buf, 8);

      _Block_object_dispose(&v45, 8);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v21;
          _os_log_impl(&dword_1A0772000, v31, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL %@", (uint8_t *)&buf, 0xCu);
        }
      }
      [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:12 userInfo:0];
      id v30 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "Invalid parameters", (uint8_t *)&buf, 2u);
      }
    }
    id v30 = 0;
  }

  return v30;
}

@end