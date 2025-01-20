@interface MessageTranscodeController
+ (id)sharedInstance;
- (void)generateSnapshotForMessageGUID:(id)a3 payloadData:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7;
- (void)transcodeFallbackFileTransferContents:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 sizes:(id)a6 commonCapabilities:(id)a7 representations:(int64_t)a8 isLQMEnabled:(BOOL)a9 completionBlock:(id)a10;
- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 transcoderUserInfo:(id)a6 sizes:(id)a7 commonCapabilities:(id)a8 representations:(int64_t)a9 isLQMEnabled:(BOOL)a10 completionBlock:(id)a11;
- (void)transcodePayloadData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 completionBlock:(id)a6;
- (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4;
@end

@implementation MessageTranscodeController

+ (id)sharedInstance
{
  if (qword_EC518 != -1) {
    dispatch_once(&qword_EC518, &stru_DF9F8);
  }
  return (id)qword_EC530;
}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 transcoderUserInfo:(id)a6 sizes:(id)a7 commonCapabilities:(id)a8 representations:(int64_t)a9 isLQMEnabled:(BOOL)a10 completionBlock:(id)a11
{
  if (a11)
  {
    BOOL v14 = a5;
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = a3;
        __int16 v25 = 2112;
        id v26 = a6;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Transcoder received request to transcode: %@  transcodeInfo: %@", buf, 0x16u);
      }
    }
    char v22 = 0;
    if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", [a3 path], &v22))
    {
      if (v22)
      {
        if (IMOSLoggingEnabled())
        {
          v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Input URL is a directory, not transcoding", buf, 2u);
          }
        }
        uint64_t v19 = IMSingleObjectArray();
        (*((void (**)(id, id, uint64_t, void, void, uint64_t, void, void))a11 + 2))(a11, a3, v19, 0, 0, 1, 0, 0);
      }
      else
      {
        LOBYTE(v21) = a10;
        [+[IMTranscodeController sharedInstance](IMTranscodeController, "sharedInstance") transcodeFileTransferContents:a3 utiType:a4 isSticker:v14 allowUnfilteredUTIs:+[IMDAttachmentUtilities messageAttachmentSendableUTIs] target:0 sizes:a7 commonCapabilities:a8 maxDimension:-1 transcoderUserInfo:a6 representations:a9 isLQMEnabled:v21 completionBlock:a11];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = a3;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "File doesn't exist at source path (%@), failing transcoding", buf, 0xCu);
        }
      }
      (*((void (**)(id, id, void, void, void, void, void, void))a11 + 2))(a11, a3, 0, 0, 0, 0, 0, 0);
    }
  }
}

- (void)transcodeFallbackFileTransferContents:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 sizes:(id)a6 commonCapabilities:(id)a7 representations:(int64_t)a8 isLQMEnabled:(BOOL)a9 completionBlock:(id)a10
{
  LOBYTE(v10) = a9;
  [+[IMTranscodeController sharedInstance] transcodeFallbackFileTransferContents:a3 utiType:a4 allowUnfilteredUTIs:0 target:0 sizes:a6 commonCapabilities:a7 maxDimension:-1 transcoderUserInfo:a5 representations:a8 isLQMEnabled:v10 completionBlock:a10];
}

- (void)transcodePayloadData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 completionBlock:(id)a6
{
  if (a6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 134218242;
        id v12 = [a3 length];
        __int16 v13 = 2112;
        id v14 = a4;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Transcoder received request to fallback data : %lu  balloonBundleID: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    [+[IMTranscodeController sharedInstance] transcodeFallbackFileTransferPayloadData:a3 balloonBundleID:a4 attachments:a5 completionBlock:a6];
  }
}

- (void)generateSnapshotForMessageGUID:(id)a3 payloadData:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7
{
  uint64_t PayloadURL = IMSharedHelperExtractPayloadURL();
  int v13 = IMOSLoggingEnabled();
  if (PayloadURL)
  {
    if (v13)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = 134218242;
        id v17 = [a4 length];
        __int16 v18 = 2112;
        id v19 = a5;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Transcoder received request to snapshot data: %lu  balloonBundleID: %@", (uint8_t *)&v16, 0x16u);
      }
    }
    [+[IMTranscodeController sharedInstance] generateSnapshotForMessageGUID:a3 payloadURL:PayloadURL balloonBundleID:a5 senderContext:a6 completionBlock:a7];
  }
  else
  {
    if (v13)
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Failed to extract URL from payload data!", (uint8_t *)&v16, 2u);
      }
    }
    (*((void (**)(id, void, NSError *))a7 + 2))(a7, 0, +[NSError errorWithDomain:IMTranscodeErrorDomain code:-3 userInfo:0]);
  }
}

- (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4
{
  v6 = +[IMTranscodeController sharedInstance];

  [(IMTranscodeController *)v6 transcribeAudioForAudioTransferURL:a3 withCompletion:a4];
}

@end