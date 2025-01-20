@interface IMAudioPreviewGenerator
+ (BOOL)generatesMetadata;
+ (BOOL)generatesPreview;
+ (BOOL)writesToDisk;
+ (id)UTITypes;
+ (id)audioMedataForFileURL:(id)a3 senderContext:(id)a4;
+ (id)generateAndPersistMetadataFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6;
+ (id)metadataExtension;
@end

@implementation IMAudioPreviewGenerator

+ (id)UTITypes
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F15A88];
  v5[0] = *MEMORY[0x1E4F15A68];
  v5[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

+ (BOOL)generatesPreview
{
  return 0;
}

+ (id)metadataExtension
{
  return @"plist";
}

+ (BOOL)writesToDisk
{
  return 1;
}

+ (BOOL)generatesMetadata
{
  return 1;
}

+ (id)generateAndPersistMetadataFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = _os_activity_create(&dword_1A0772000, "com.apple.messages.AttachmentGeneratePreviewAudioMessage", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  v12 = [a1 audioMedataForFileURL:v9 senderContext:v10];
  if (!v12) {
    goto LABEL_21;
  }
  v28 = [NSString stringGUID];
  v13 = (void *)MEMORY[0x1E4F1CB10];
  v14 = IMSafeTemporaryDirectory();
  v15 = [v14 path];
  v32[0] = v15;
  v32[1] = @"AudioPreviewMetadata";
  v32[2] = v28;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  v17 = [v13 fileURLWithPathComponents:v16];

  v18 = [v17 URLByAppendingPathComponent:@"Audio-Metadata" isDirectory:0];
  v19 = [a1 metadataExtension];
  v20 = [v18 URLByAppendingPathExtension:v19];

  if (v17)
  {
    if (v20)
    {
      v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v22 = [v21 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:a6];

      if (v22 && [v12 writeToURL:v20 error:a6])
      {
        if (IMOSLoggingEnabled())
        {
          v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v20;
            _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Successfully persisted audioMetadata plist at %@", buf, 0xCu);
          }
        }
        goto LABEL_26;
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v28;
        _os_log_impl(&dword_1A0772000, v24, OS_LOG_TYPE_INFO, "Failed to generate temporaryPreviewMetadataDirectoryURL from transferGUID %@", buf, 0xCu);
      }
    }
    if (v20) {
      goto LABEL_20;
    }
  }
  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v28;
      _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Failed to generate temporaryMetadataURL from transferGUID %@", buf, 0xCu);
    }
  }
LABEL_20:

LABEL_21:
  if (IMOSLoggingEnabled())
  {
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, "Failed to generated audioMetadata plist", buf, 2u);
    }
  }
  v20 = 0;
LABEL_26:

  os_activity_scope_leave(&state);

  return v20;
}

+ (id)audioMedataForFileURL:(id)a3 senderContext:(id)a4
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_1A07778AC;
  v37 = sub_1A0777744;
  id v38 = 0;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1A082E7F0;
  v30[3] = &unk_1E5A10768;
  v32 = &v33;
  v8 = v7;
  v31 = v8;
  +[IMAttachmentBlastdoor generateAudioPreview:v5 senderContext:v6 withCompletionBlock:v30];
  dispatch_time_t v9 = dispatch_time(0, 100000000000);
  if (dispatch_group_wait(v8, v9) && IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Timed out waiting for BlastDoor.", v29, 2u);
    }
  }
  if (v34[5])
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Received audioPreviewResult from BlastDoor!", v29, 2u);
      }
    }
    MEMORY[0x1A6227910](@"BlastDoorPreviewAudio", @"BlastDoor");
    if (objc_opt_isKindOfClass()) {
      v12 = (void *)v34[5];
    }
    else {
      v12 = 0;
    }
    id v15 = v12;
    id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v17 = [v15 powerLevels];
    v18 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

    if (v18)
    {
      for (unint64_t i = 0; ; ++i)
      {
        v20 = [v15 powerLevels];
        BOOL v21 = i < [v20 count];

        if (!v21) {
          break;
        }
        int v22 = NSNumber;
        v23 = [v15 powerLevels];
        v24 = [v23 objectAtIndexedSubscript:i];
        [v24 floatValue];
        v25 = objc_msgSend(v22, "numberWithFloat:");
        [v18 addObject:v25];
      }
    }
    v39[0] = @"duration";
    v26 = NSNumber;
    [v15 duration];
    v27 = objc_msgSend(v26, "numberWithDouble:");
    v39[1] = @"powerLevels";
    v40[0] = v27;
    v40[1] = v18;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "IMAudioPreviewGenerator - BlastDoor returned null audioPreviewResult!", v29, 2u);
      }
    }
    v14 = 0;
  }

  _Block_object_dispose(&v33, 8);

  return v14;
}

@end