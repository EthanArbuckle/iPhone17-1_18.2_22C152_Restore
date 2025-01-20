@interface LegacySMSRelayTranscodeController
+ (id)sharedInstance;
- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 highQualityMaxByteSize:(unint64_t)a6 lowQualityMaxByteSize:(unint64_t)a7 representations:(int64_t)a8 completionBlock:(id)a9;
@end

@implementation LegacySMSRelayTranscodeController

+ (id)sharedInstance
{
  if (qword_9C0C0 != -1) {
    dispatch_once(&qword_9C0C0, &stru_8D430);
  }
  v2 = (void *)qword_9C0C8;

  return v2;
}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 highQualityMaxByteSize:(unint64_t)a6 lowQualityMaxByteSize:(unint64_t)a7 representations:(int64_t)a8 completionBlock:(id)a9
{
  id v14 = a3;
  id v32 = a4;
  id v15 = a5;
  id v16 = a9;
  if (v16)
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v36 = v14;
        __int16 v37 = 2112;
        id v38 = v15;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Transcoder received request to transcode: %@  transcodeInfo: %@", buf, 0x16u);
      }
    }
    char v33 = 0;
    v18 = +[NSFileManager defaultManager];
    v19 = [v14 path];
    unsigned __int8 v20 = [v18 fileExistsAtPath:v19 isDirectory:&v33];

    if (v20)
    {
      if (v33)
      {
        if (IMOSLoggingEnabled())
        {
          v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Input URL is a directory, not transcoding", buf, 2u);
          }
        }
        v22 = IMSingleObjectArray();
        (*((void (**)(id, id, void *, void, void, uint64_t, void, void))v16 + 2))(v16, v14, v22, 0, 0, 1, 0, 0);
      }
      else
      {
        v24 = +[NSBundle bundleForClass:objc_opt_class()];
        v31 = [v24 resourcePath];

        v25 = sub_EA00(v31);
        v26 = +[IMTranscodeController sharedInstance];
        v27 = +[NSNumber numberWithUnsignedLong:a6];
        v34[0] = v27;
        v28 = +[NSNumber numberWithUnsignedLong:a7];
        v34[1] = v28;
        v29 = +[NSArray arrayWithObjects:v34 count:2];
        LOBYTE(v30) = 0;
        [v26 transcodeFileTransferContents:v14 utiType:v32 isSticker:0 allowUnfilteredUTIs:v25 target:1 sizes:v29 commonCapabilities:0 maxDimension:-1 transcoderUserInfo:v15 representations:a8 isLQMEnabled:v30 completionBlock:v16];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v14;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "File doesn't exist at source path (%@), failing transcoding", buf, 0xCu);
        }
      }
      (*((void (**)(id, id, void, void, void, void, void, void))v16 + 2))(v16, v14, 0, 0, 0, 0, 0, 0);
    }
  }
}

@end