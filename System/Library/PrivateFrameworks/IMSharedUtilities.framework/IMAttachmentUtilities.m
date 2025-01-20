@interface IMAttachmentUtilities
+ (BOOL)asset:(id)a3 containsMetadataKey:(id)a4;
+ (Class)__AVDataAssetClass;
+ (id)photosSupportedPreviewGeneratorClasses;
@end

@implementation IMAttachmentUtilities

+ (Class)__AVDataAssetClass
{
  if (qword_1E94FF4A0 != -1) {
    dispatch_once(&qword_1E94FF4A0, &unk_1EF2C1098);
  }
  return (Class)qword_1E94FF498;
}

+ (BOOL)asset:(id)a3 containsMetadataKey:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v6 = dispatch_semaphore_create(0);
  v24[0] = @"availableMetadataFormats";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1A07C2318;
  v19[3] = &unk_1E5A10B08;
  v19[4] = v6;
  [a3 loadValuesAsynchronouslyForKeys:v7 completionHandler:v19];
  dispatch_time_t v8 = dispatch_time(0, 100000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = a4;
        __int16 v22 = 2048;
        uint64_t v23 = 0x4059000000000000;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Failed to fetch metadata for %@: Timeout during async fetch(%f ms)", buf, 0x16u);
      }
    }
    dispatch_release(v6);
    return 0;
  }
  dispatch_release(v6);
  v12 = (void *)MEMORY[0x1E4F16558];
  uint64_t v13 = [a3 metadataForFormat:*MEMORY[0x1E4F15D20]];
  v14 = (void *)[v12 metadataItemsFromArray:v13 withKey:a4 keySpace:*MEMORY[0x1E4F15E00]];
  if (![v14 count])
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = a4;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "IMAttachmentUtilities failed to load metadata for key %@", buf, 0xCu);
      }
    }
    return 0;
  }
  int v18 = 0;
  v15 = objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 0), "dataValue");
  char v10 = objc_msgSend(v15, "isEqualToData:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v18, 4));
  if ((v10 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = a4;
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "IMAttachmentUtilities found %@ metadata with unexpected contents, assuming metadata doesn't exist", buf, 0xCu);
      }
    }
  }
  return v10;
}

+ (id)photosSupportedPreviewGeneratorClasses
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
}

@end