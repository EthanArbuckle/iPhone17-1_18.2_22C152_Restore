@interface IMAdaptiveImageGlyphPreviewGenerator
+ (BOOL)generatesMetadata;
+ (BOOL)generatesPreview;
+ (BOOL)shouldScaleUpPreview;
+ (BOOL)shouldShadePreview;
+ (BOOL)writesToDisk;
+ (id)UTITypes;
+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8;
@end

@implementation IMAdaptiveImageGlyphPreviewGenerator

+ (id)UTITypes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)generatesPreview
{
  return 1;
}

+ (BOOL)writesToDisk
{
  return 1;
}

+ (BOOL)generatesMetadata
{
  return 0;
}

+ (BOOL)shouldScaleUpPreview
{
  return 0;
}

+ (BOOL)shouldShadePreview
{
  return 0;
}

+ (id)generateAndPersistPreviewFromSourceURL:(id)a3 senderContext:(id)a4 balloonBundleID:(id)a5 withPreviewConstraints:(IMPreviewConstraints *)a6 outSize:(CGSize *)a7 error:(id *)a8
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = _os_activity_create(&dword_1A0772000, "com.apple.messages.AttachmentGeneratePreviewAdaptiveImageGlyph", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  v37 = v14;
  if (v12 && a7 && a8)
  {
    v16 = (void *)MEMORY[0x1E4F1CB10];
    v17 = IMSafeTemporaryDirectory();
    v18 = objc_msgSend(v17, "path", v37);
    v42[0] = v18;
    v42[1] = @"AdaptiveImageGlyphPreview";
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    v20 = [v16 fileURLWithPathComponents:v19];

    v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v21 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:0];

    v22 = [NSString stringGUID];
    v23 = [v20 URLByAppendingPathComponent:v22 isDirectory:0];
    v24 = [v23 URLByAppendingPathExtension:@"heic"];

    if (v24)
    {
      if (IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v12;
          _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Invoking BlastDoor for adaptive image glyph at source URL: %@", buf, 0xCu);
        }
      }
      v26 = +[IMAdaptiveImageGlyphBlastDoor generateEmojiImageAssetFromSourceURL:v12 senderContext:v13];
      v27 = v26;
      if (v26)
      {
        v28 = [v26 imageData];
        id v38 = 0;
        char v29 = [v28 writeToURL:v24 options:1 error:&v38];
        id v30 = v38;
        if (v29)
        {
          id v31 = v24;
        }
        else
        {
          v35 = IMLogHandleForCategory("IMAdaptiveImageGlyphPreviewGenerator");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_1A09F1C6C((uint64_t)v24, (uint64_t)v30, v35);
          }

          id v31 = 0;
          *a8 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMPreviewGenerationErrorDomain" code:9 userInfo:0];
        }
      }
      else
      {
        v34 = IMLogHandleForCategory("IMAdaptiveImageGlyphPreviewGenerator");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_1A09F1BF4((uint64_t)v24, v34);
        }

        id v31 = 0;
        *a8 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMPreviewGenerationErrorDomain" code:1 userInfo:0];
      }
    }
    else
    {
      v33 = IMLogHandleForCategory("IMAdaptiveImageGlyphPreviewGenerator");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1A09F1B7C((uint64_t)v12, v33);
      }

      [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:6 userInfo:0];
      id v31 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v32, OS_LOG_TYPE_INFO, "Invalid parameters", buf, 2u);
      }
    }
    id v31 = 0;
  }
  os_activity_scope_leave(&state);

  return v31;
}

@end