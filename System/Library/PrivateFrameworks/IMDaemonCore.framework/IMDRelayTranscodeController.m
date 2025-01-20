@interface IMDRelayTranscodeController
+ (id)sharedInstance;
- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 target:(int64_t)a5 transcoderUserInfo:(id)a6 isSticker:(BOOL)a7 highQualityMaxByteSize:(unint64_t)a8 lowQualityMaxByteSize:(unint64_t)a9 representations:(int64_t)a10 completionBlock:(id)a11;
@end

@implementation IMDRelayTranscodeController

+ (id)sharedInstance
{
  if (qword_1EBE2B8C0 != -1) {
    dispatch_once(&qword_1EBE2B8C0, &unk_1F3391AA0);
  }
  v2 = (void *)qword_1EBE2B9F8;

  return v2;
}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 target:(int64_t)a5 transcoderUserInfo:(id)a6 isSticker:(BOOL)a7 highQualityMaxByteSize:(unint64_t)a8 lowQualityMaxByteSize:(unint64_t)a9 representations:(int64_t)a10 completionBlock:(id)a11
{
  BOOL v12 = a7;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a11;
  if (v19)
  {
    int64_t v35 = a5;
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v39 = v16;
        __int16 v40 = 2112;
        id v41 = v18;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Transcoder received request to transcode: %@  transcodeInfo: %@", buf, 0x16u);
      }
    }
    char v36 = 0;
    v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    v22 = [v16 path];
    char v23 = [v21 fileExistsAtPath:v22 isDirectory:&v36];

    if (v23)
    {
      if (v36)
      {
        if (IMOSLoggingEnabled())
        {
          v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Input URL is a directory, not transcoding", buf, 2u);
          }
        }
        v25 = IMSingleObjectArray();
        (*((void (**)(id, id, void *, void, void, uint64_t, void, void))v19 + 2))(v19, v16, v25, 0, 0, 1, 0, 0);
      }
      else
      {
        v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v34 = [v27 resourcePath];

        v33 = +[IMDAttachmentUtilities messageAttachmentSendableUTIsForResourcePath:v34];
        v28 = [MEMORY[0x1E4F6EBE0] sharedInstance];
        v29 = [NSNumber numberWithUnsignedLong:a8];
        v37[0] = v29;
        v30 = [NSNumber numberWithUnsignedLong:a9];
        v37[1] = v30;
        v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
        LOBYTE(v32) = 0;
        [v28 transcodeFileTransferContents:v16 utiType:v17 isSticker:v12 allowUnfilteredUTIs:v33 target:v35 sizes:v31 commonCapabilities:0 maxDimension:-1 transcoderUserInfo:v18 representations:a10 isLQMEnabled:v32 completionBlock:v19];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v16;
          _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "File doesn't exist at source path (%@), failing transcoding", buf, 0xCu);
        }
      }
      (*((void (**)(id, id, void, void, void, void, void, void))v19 + 2))(v19, v16, 0, 0, 0, 0, 0, 0);
    }
  }
}

@end