@interface IMWatchfacePreviewGenerator
+ (BOOL)_isAvailable;
+ (BOOL)decorateWatchfacePreview:(id)a3 andWriteToURL:(id)a4 imagePxSize:(CGSize *)a5;
+ (BOOL)writesToDisk;
+ (Class)greenfieldUtilitiesClass;
+ (id)UTITypes;
+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8;
@end

@implementation IMWatchfacePreviewGenerator

+ (BOOL)_isAvailable
{
  return 1;
}

+ (id)UTITypes
{
  if ([a1 _isAvailable]) {
    return &unk_1EF305AA8;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

+ (BOOL)writesToDisk
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = [a1 _isAvailable];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = @"NO";
      if (v2) {
        v4 = @"YES";
      }
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Blastdoor support available for watchfacePreviews: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v2;
}

+ (Class)greenfieldUtilitiesClass
{
  if (qword_1E94FF468 != -1) {
    dispatch_once(&qword_1E94FF468, &unk_1EF2BF1A0);
  }
  int v2 = (void *)qword_1E94FF460;

  return (Class)v2;
}

+ (BOOL)decorateWatchfacePreview:(id)a3 andWriteToURL:(id)a4 imagePxSize:(CGSize *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  *a5 = *(CGSize *)MEMORY[0x1E4F1DB30];
  MEMORY[0x1A6227910](@"BlastDoorWatchfacePreview", @"BlastDoor");
  if (objc_opt_isKindOfClass()) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;
  v11 = [v10 image];
  uint64_t v12 = [v11 cgImage];

  if (v12)
  {
    id v18 = 0;
    BOOL v13 = +[IMImageUtilities persistPreviewToDiskCache:v12 previewURL:v8 error:&v18];
    id v14 = v18;
    if (!v13 && IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v14;
        _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "IMWatchfacePreviewGenerator - Failed to write decorated image to URL %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "IMWatchfacePreviewGenerator - Failed to get image from BlastDoor image", buf, 2u);
      }
    }
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  v62[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = _os_activity_create(&dword_1A0772000, "com.apple.messages.AttachmentGeneratePreviewWatchFace", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  if (v13 && a7 && a8)
  {
    v37 = a8;
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Invoking Blastdoor for image", (uint8_t *)&buf, 2u);
      }
    }
    id v18 = (void *)MEMORY[0x1E4F1CB10];
    v19 = IMSafeTemporaryDirectory();
    id v20 = [v19 path];
    v62[0] = v20;
    v62[1] = @"ImagePreview";
    __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
    id v22 = [v18 fileURLWithPathComponents:v21];

    uint64_t v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v23 createDirectoryAtURL:v22 withIntermediateDirectories:1 attributes:0 error:0];

    v24 = [NSString stringGUID];
    v25 = [v22 URLByAppendingPathComponent:v24 isDirectory:0];
    id v26 = [v25 URLByAppendingPathExtension:@"ktx"];

    if (v26)
    {
      if ([a1 _isAvailable])
      {
        uint64_t v52 = 0;
        v53 = &v52;
        uint64_t v54 = 0x2020000000;
        char v55 = 0;
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v58 = 0x3010000000;
        uint64_t v60 = 0;
        uint64_t v61 = 0;
        v59 = &unk_1A0A86C2F;
        uint64_t v46 = 0;
        v47 = &v46;
        uint64_t v48 = 0x3032000000;
        v49 = sub_1A07777DC;
        v50 = sub_1A07776D4;
        id v51 = 0;
        v27 = dispatch_group_create();
        dispatch_group_enter(v27);
        double var0 = a6->var0;
        double var2 = a6->var2;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = sub_1A07B5AB8;
        v39[3] = &unk_1E5A107B8;
        v42 = &v52;
        id v45 = a1;
        id v30 = v26;
        id v40 = v30;
        p_long long buf = &buf;
        v44 = &v46;
        v31 = v27;
        v41 = v31;
        +[IMAttachmentBlastdoor generatePreview:v13 senderContext:v14 maxPxWidth:v39 scale:var0 withCompletionBlock:var2];
        dispatch_group_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
        if (*((unsigned char *)v53 + 24) && !v47[5])
        {
          *a7 = *(CGSize *)(*((void *)&buf + 1) + 32);
        }
        else
        {

          v32 = (void *)v47[5];
          id v30 = 0;
          if (v32) {
            id *v37 = v32;
          }
        }
        id v26 = v30;

        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(&v52, 8);
        v34 = v26;
      }
      else
      {
        v34 = 0;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v24;
          _os_log_impl(&dword_1A0772000, v35, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL %@", (uint8_t *)&buf, 0xCu);
        }
      }
      [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:12 userInfo:0];
      id v26 = 0;
      v34 = 0;
      id *v37 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A0772000, v33, OS_LOG_TYPE_INFO, "Invalid parameters", (uint8_t *)&buf, 2u);
      }
    }
    v34 = 0;
  }
  os_activity_scope_leave(&state);

  return v34;
}

@end