@interface IMPassPreviewGenerator
+ (BOOL)generatesMetadata;
+ (BOOL)generatesPreview;
+ (BOOL)isSupported;
+ (id)UTITypes;
+ (id)_dictionaryRepresentationForColor:(id)a3;
+ (id)_dictionaryRepresentationForPassText:(id)a3;
+ (id)generateAndPersistMetadataFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6;
+ (id)metadataExtension;
+ (id)previewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6;
+ (id)temporaryDirectory;
@end

@implementation IMPassPreviewGenerator

+ (id)UTITypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.pkpass";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)temporaryDirectory
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = IMSafeTemporaryDirectory();
  v4 = [v3 path];
  v9[0] = v4;
  v9[1] = @"PassPreview";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v6 = [v2 fileURLWithPathComponents:v5];

  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];

  return v6;
}

+ (BOOL)generatesPreview
{
  return 0;
}

+ (id)metadataExtension
{
  return @"plist";
}

+ (BOOL)generatesMetadata
{
  return 1;
}

+ (id)_dictionaryRepresentationForPassText:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [v4 text];
  if (v6)
  {
    CFDictionarySetValue(v5, @"text", v6);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A09F2554();
  }

  v7 = [v4 color];
  v8 = [a1 _dictionaryRepresentationForColor:v7];

  if (v8)
  {
    CFDictionarySetValue(v5, @"color", v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A09F24CC();
  }

  return v5;
}

+ (id)_dictionaryRepresentationForColor:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = NSNumber;
  [v3 red];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  if (v6)
  {
    CFDictionarySetValue(v4, @"red", v6);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A09F1A6C();
  }

  v7 = NSNumber;
  [v3 green];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  if (v8)
  {
    CFDictionarySetValue(v4, @"green", v8);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A09F19E4();
  }

  v9 = NSNumber;
  [v3 blue];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  if (v10)
  {
    CFDictionarySetValue(v4, @"blue", v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A09F195C();
  }

  v11 = NSNumber;
  [v3 alpha];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  if (v12)
  {
    CFDictionarySetValue(v4, @"alpha", v12);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1A09F18D4();
  }

  return v4;
}

+ (id)generateAndPersistMetadataFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = _os_activity_create(&dword_1A0772000, "com.apple.messages.AttachmentGeneratePreviewWallet", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  long long v13 = *(_OWORD *)&a5->var1.height;
  *(_OWORD *)buf = *(_OWORD *)&a5->var0;
  *(_OWORD *)&buf[16] = v13;
  uint64_t v60 = *(void *)&a5->var3;
  v55 = v10;
  v14 = [a1 previewFromSourceURL:v10 senderContext:v11 withPreviewConstraints:buf error:a6];
  if (!v14)
  {
    id v56 = 0;
    goto LABEL_61;
  }
  v54 = [a1 temporaryDirectory];
  v53 = [NSString stringGUID];
  v15 = objc_msgSend(v54, "URLByAppendingPathComponent:isDirectory:");
  id v56 = [v15 URLByAppendingPathExtension:@"plist"];

  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v17 = [v14 backgroundColor];
  v18 = [a1 _dictionaryRepresentationForColor:v17];

  if (v18) {
    CFDictionarySetValue(v16, @"backgroundColor", v18);
  }

  NSSelectorFromString(&cfstr_Background.isa);
  if (objc_opt_respondsToSelector())
  {
    v19 = [v14 valueForKeyPath:@"background.image.image"];
    id v20 = [v19 dataUsingEncoding:0 error:0];
    if (v20) {
      CFDictionarySetValue(v16, @"backgroundImage", v20);
    }
  }
  v21 = [v14 primaryText];

  if (v21)
  {
    v22 = [v14 primaryText];
    v23 = [a1 _dictionaryRepresentationForPassText:v22];

    if (v23)
    {
      CFDictionarySetValue(v16, @"primaryText", v23);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_1A09F1AF4();
    }
  }
  v24 = [v14 secondaryText];

  if (v24)
  {
    v25 = [v14 secondaryText];
    v26 = [a1 _dictionaryRepresentationForPassText:v25];

    if (v26)
    {
      CFDictionarySetValue(v16, @"secondaryText", v26);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_1A09F2664();
    }
  }
  v27 = [v14 tertiaryText];

  if (v27)
  {
    v28 = [v14 tertiaryText];
    v29 = [a1 _dictionaryRepresentationForPassText:v28];

    if (v29)
    {
      CFDictionarySetValue(v16, @"tertiaryText", v29);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_1A09F25DC();
    }
  }
  v30 = [v14 headerImage];
  v31 = [v30 image];
  v32 = [v31 dataUsingEncoding:0 error:0];

  id v33 = v32;
  if (v33) {
    CFDictionarySetValue(v16, @"image", v33);
  }

  v34 = [v14 icon];
  v35 = [v34 image];
  v36 = [v35 dataUsingEncoding:0 error:0];

  id v37 = v36;
  if (v37) {
    CFDictionarySetValue(v16, @"icon", v37);
  }

  if (IMOSLoggingEnabled())
  {
    v38 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v16;
      _os_log_impl(&dword_1A0772000, v38, OS_LOG_TYPE_INFO, "Writing pass plist %p", buf, 0xCu);
    }
  }
  id v57 = 0;
  v39 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v16 format:200 options:0 error:&v57];
  id v40 = v57;
  v41 = v40;
  if (v39)
  {
    v42 = [v56 path];
    int v43 = [v39 writeToFile:v42 atomically:1];

    if (v43)
    {
      if (IMOSLoggingEnabled())
      {
        v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = [v56 path];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v45;
          _os_log_impl(&dword_1A0772000, v44, OS_LOG_TYPE_INFO, "Wrote down pass plist to %@", buf, 0xCu);
        }
      }
      id v46 = 0;
      int v47 = 1;
      goto LABEL_52;
    }
    if (IMOSLoggingEnabled())
    {
      v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = [v56 path];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v50;
        _os_log_impl(&dword_1A0772000, v49, OS_LOG_TYPE_INFO, "Couldn't write down pass plist to %@", buf, 0xCu);
      }
    }
    id v46 = 0;
  }
  else
  {
    id v46 = v40;
    if (IMOSLoggingEnabled())
    {
      v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v46;
        _os_log_impl(&dword_1A0772000, v48, OS_LOG_TYPE_INFO, "Failed making plist %@", buf, 0xCu);
      }
    }
  }
  int v47 = 0;
LABEL_52:

  if (a6 && !v47 && v46) {
    *a6 = v46;
  }
  if (IMOSLoggingEnabled())
  {
    v51 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v56;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v46;
      _os_log_impl(&dword_1A0772000, v51, OS_LOG_TYPE_INFO, "Generated metadata to %@ with error: %@", buf, 0x16u);
    }
  }
LABEL_61:

  os_activity_scope_leave(&state);

  return v56;
}

+ (id)previewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    *(void *)&long long v45 = 0;
    *((void *)&v45 + 1) = &v45;
    uint64_t v46 = 0x3032000000;
    int v47 = sub_1A077792C;
    v48 = sub_1A0777788;
    id v49 = 0;
    id v10 = (void *)MEMORY[0x1E4F1CB10];
    id v11 = IMSafeTemporaryDirectory();
    v12 = [v11 path];
    v44[0] = v12;
    v44[1] = @"PassPreview";
    long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    v14 = [v10 fileURLWithPathComponents:v13];

    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v15 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:0];

    v16 = [NSString stringGUID];
    v17 = [v14 URLByAppendingPathComponent:v16 isDirectory:0];
    v18 = [v17 URLByAppendingPathExtension:@"plist"];

    if (v18)
    {
      *(void *)&long long v39 = 0;
      *((void *)&v39 + 1) = &v39;
      uint64_t v40 = 0x3032000000;
      v41 = sub_1A077792C;
      v42 = sub_1A0777788;
      id v43 = 0;
      v19 = dispatch_group_create();
      dispatch_group_enter(v19);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = sub_1A085F818;
      v31[3] = &unk_1E5A13598;
      id v33 = &v39;
      v34 = &v45;
      id v20 = v19;
      v32 = v20;
      +[IMAttachmentBlastdoor generatePassPreview:v8 senderContext:v9 withCompletionBlock:v31];
      dispatch_time_t v21 = dispatch_time(0, 5000000000);
      if (dispatch_group_wait(v20, v21))
      {
        if (IMOSLoggingEnabled())
        {
          v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "Blastdoor validation timed out", buf, 2u);
          }
        }
        if (a6)
        {
          [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:12 userInfo:0];
          id v23 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v23 = 0;
        }
      }
      else
      {
        if (a6)
        {
          v27 = *(void **)(*((void *)&v45 + 1) + 40);
          if (v27) {
            *a6 = v27;
          }
        }
        if (IMOSLoggingEnabled())
        {
          v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v29 = *(void *)(*((void *)&v45 + 1) + 40);
            *(_DWORD *)buf = 67109378;
            int v36 = 0;
            __int16 v37 = 2112;
            uint64_t v38 = v29;
            _os_log_impl(&dword_1A0772000, v28, OS_LOG_TYPE_INFO, "Blastdoor validation completed, result: %d, err: %@", buf, 0x12u);
          }
        }
        id v23 = *(id *)(*((void *)&v39 + 1) + 40);
      }

      _Block_object_dispose(&v39, 8);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LODWORD(v39) = 138412290;
          *(void *)((char *)&v39 + 4) = v16;
          _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL %@", (uint8_t *)&v39, 0xCu);
        }
      }
      if (a6)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:12 userInfo:0];
        id v23 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v23 = 0;
      }
    }

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LODWORD(v45) = 138412290;
        *(void *)((char *)&v45 + 4) = objc_opt_class();
        id v25 = *(id *)((char *)&v45 + 4);
        _os_log_impl(&dword_1A0772000, v24, OS_LOG_TYPE_INFO, "%@ - sourceURL is nil", (uint8_t *)&v45, 0xCu);
      }
    }
    if (a6)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:5 userInfo:0];
      id v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v23 = 0;
    }
  }

  return v23;
}

@end