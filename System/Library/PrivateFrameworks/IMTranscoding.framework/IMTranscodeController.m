@interface IMTranscodeController
+ (id)sharedInstance;
- (BOOL)_connect;
- (IMTranscodeController)init;
- (OS_dispatch_queue)connectionQueue;
- (OS_xpc_object)connection;
- (void)_decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 retries:(unint64_t)a6 completionBlock:(id)a7 blockUntilReply:(BOOL)a8;
- (void)_disconnected;
- (void)_generateMetadata:(id)a3 metadataURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 retries:(unint64_t)a7 completionBlock:(id)a8 blockUntilReply:(BOOL)a9;
- (void)_generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 retries:(unint64_t)a7 balloonBundleID:(id)a8 transferGUID:(id)a9 completionBlock:(id)a10 blockUntilReply:(BOOL)a11;
- (void)_generateSafeRender:(id)a3 constraints:(IMPreviewConstraints *)a4 retries:(int)a5 completionBlock:(id)a6;
- (void)_insertSandboxExtensionIntoXPCMessage:(id)a3 withKey:(id)a4 forFileURL:(id)a5 readOnly:(BOOL)a6;
- (void)_transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 allowUnfilteredUTIs:(id)a6 target:(int64_t)a7 sizes:(id)a8 commonCapabilities:(id)a9 maxDimension:(unint64_t)a10 transcoderUserInfo:(id)a11 representations:(int64_t)a12 fallBack:(BOOL)a13 retries:(int)a14 isLQMEnabled:(BOOL)a15 completionBlock:(id)a16;
- (void)_transcodeFileTransferPayloadData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 retries:(unint64_t)a6 fallBack:(BOOL)a7 completionBlock:(id)a8;
- (void)decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 completionBlock:(id)a6 blockUntilReply:(BOOL)a7;
- (void)generateMetadata:(id)a3 metadataURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7;
- (void)generateMetadata:(id)a3 metadataURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7 blockUntilReply:(BOOL)a8;
- (void)generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 balloonBundleID:(id)a7 transferGUID:(id)a8 completionBlock:(id)a9 blockUntilReply:(BOOL)a10;
- (void)generateSafeRender:(id)a3 completionBlock:(id)a4;
- (void)generateSafeRender:(id)a3 constraints:(IMPreviewConstraints *)a4 completionBlock:(id)a5;
- (void)generateSnapshotForMessageGUID:(id)a3 payloadURL:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7;
- (void)replaceTransferWithSafeTransfer:(id)a3 constraints:(IMPreviewConstraints *)a4 completionBlock:(id)a5;
- (void)setConnection:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)transcodeFallbackFileTransferContents:(id)a3 utiType:(id)a4 allowUnfilteredUTIs:(id)a5 target:(int64_t)a6 sizes:(id)a7 commonCapabilities:(id)a8 maxDimension:(unint64_t)a9 transcoderUserInfo:(id)a10 representations:(int64_t)a11 isLQMEnabled:(BOOL)a12 completionBlock:(id)a13;
- (void)transcodeFallbackFileTransferPayloadData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 completionBlock:(id)a6;
- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 allowUnfilteredUTIs:(id)a6 target:(int64_t)a7 sizes:(id)a8 commonCapabilities:(id)a9 maxDimension:(unint64_t)a10 transcoderUserInfo:(id)a11 representations:(int64_t)a12 isLQMEnabled:(BOOL)a13 completionBlock:(id)a14;
- (void)transcodeLocalTransferPayloadData:(id)a3 balloonBundleID:(id)a4 completionBlock:(id)a5;
- (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4;
@end

@implementation IMTranscodeController

+ (id)sharedInstance
{
  if (qword_26AC13668 != -1) {
    dispatch_once(&qword_26AC13668, &unk_26C8F00E8);
  }
  v2 = (void *)qword_26AC13670;
  return v2;
}

- (IMTranscodeController)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMTranscodeController;
  v2 = [(IMTranscodeController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.messages.transcoding-connection", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_disconnected
{
  if (IMOSLoggingEnabled())
  {
    dispatch_queue_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F26000, v3, OS_LOG_TYPE_INFO, "Clearing out _connection, we're disconnected", buf, 2u);
    }
  }
  if (self->_connection)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v6 = 0;
        _os_log_impl(&dword_217F26000, v4, OS_LOG_TYPE_INFO, "Forcing a disconnect, terminating connection", v6, 2u);
      }
    }
    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;
  }
}

- (BOOL)_connect
{
  connection = self->_connection;
  if (!connection)
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217F26000, v4, OS_LOG_TYPE_INFO, "Connecting to transcoder agent", buf, 2u);
      }
    }
    v5 = xpc_connection_create("com.apple.imtranscoding.IMTranscoderAgent", (dispatch_queue_t)self->_connectionQueue);
    objc_super v6 = self->_connection;
    self->_connection = v5;

    v7 = self->_connection;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_217F27374;
    handler[3] = &unk_2642F1950;
    handler[4] = self;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_resume(self->_connection);
    connection = self->_connection;
  }
  return connection != 0;
}

- (void)_insertSandboxExtensionIntoXPCMessage:(id)a3 withKey:(id)a4 forFileURL:(id)a5 readOnly:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [v11 fileSystemRepresentation];
  uint64_t v12 = sandbox_extension_issue_file();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [NSString stringWithCString:v12 encoding:4];
    [v10 UTF8String];
    id v15 = v14;
    [v15 UTF8String];
    IMInsertStringsToXPCDictionary();
    free(v13);
  }
  else if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = __error();
      v18 = @"read-write";
      int v19 = *v17;
      *(_DWORD *)buf = 138412802;
      if (v6) {
        v18 = @"read";
      }
      v21 = v18;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 1024;
      int v25 = v19;
      _os_log_impl(&dword_217F26000, v16, OS_LOG_TYPE_INFO, "Could not generate sandbox %@ extension for path %@, errno %d", buf, 0x1Cu);
    }
  }
}

- (void)generateSafeRender:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  IMClientPreviewConstraints();
  [(IMTranscodeController *)self generateSafeRender:v7 constraints:v8 completionBlock:v6];
}

- (void)generateSafeRender:(id)a3 constraints:(IMPreviewConstraints *)a4 completionBlock:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(v12[0]) = 138412290;
      *(void *)((char *)v12 + 4) = v8;
      _os_log_impl(&dword_217F26000, v10, OS_LOG_TYPE_INFO, "Generating safe render for file transfer: %@", (uint8_t *)v12, 0xCu);
    }
  }
  long long v11 = *(_OWORD *)&a4->var1.height;
  v12[0] = *(_OWORD *)&a4->var0;
  v12[1] = v11;
  uint64_t v13 = *(void *)&a4->var3;
  [(IMTranscodeController *)self _generateSafeRender:v8 constraints:v12 retries:0 completionBlock:v9];
}

- (void)replaceTransferWithSafeTransfer:(id)a3 constraints:(IMPreviewConstraints *)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  if (!v7)
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-2 userInfo:0];
    v8[2](v8, 0, v9);
  }
  id v10 = +[IMTranscodeController sharedInstance];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_217F27A74;
  v16[3] = &unk_2642F1978;
  id v17 = v7;
  id v18 = v8;
  long long v11 = *(_OWORD *)&a4->var1.height;
  v14[0] = *(_OWORD *)&a4->var0;
  v14[1] = v11;
  uint64_t v15 = *(void *)&a4->var3;
  uint64_t v12 = v8;
  id v13 = v7;
  [v10 generateSafeRender:v13 constraints:v14 completionBlock:v16];
}

- (void)_generateSafeRender:(id)a3 constraints:(IMPreviewConstraints *)a4 retries:(int)a5 completionBlock:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if ([(IMTranscodeController *)self _connect])
  {
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    IMInsertCodableObjectsToXPCDictionary();
    long long v13 = *(_OWORD *)&a4->var1.height;
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    long long v30 = v13;
    uint64_t v31 = *(void *)&a4->var3;
    uint64_t v14 = IMPreviewConstraintsDictionaryFromConstraint();
    IMInsertDictionariesToXPCDictionary();

    IMInsertIntsToXPCDictionary();
    [(IMTranscodeController *)self _insertSandboxExtensionIntoXPCMessage:v12, @"read-extension", v10, 1, 1, 0 withKey forFileURL readOnly];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_217F27F8C;
    v21[3] = &unk_2642F19C8;
    int v28 = a5;
    id v15 = v10;
    id v22 = v15;
    id v23 = self;
    long long v16 = *(_OWORD *)&a4->var1.height;
    long long v25 = *(_OWORD *)&a4->var0;
    long long v26 = v16;
    uint64_t v27 = *(void *)&a4->var3;
    id v24 = v11;
    id v17 = (void (**)(void, void))MEMORY[0x21D45C740](v21);
    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_217F26000, v18, OS_LOG_TYPE_INFO, "sending request to GenerateSafeRender for %@", buf, 0xCu);
      }
    }
    xpc_object_t v19 = xpc_connection_send_message_with_reply_sync(self->_connection, v12);
    ((void (**)(void, xpc_object_t))v17)[2](v17, v19);
  }
  else if (IMOSLoggingEnabled())
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F26000, v20, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service when generating safe render", buf, 2u);
    }
  }
}

- (void)_transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 allowUnfilteredUTIs:(id)a6 target:(int64_t)a7 sizes:(id)a8 commonCapabilities:(id)a9 maxDimension:(unint64_t)a10 transcoderUserInfo:(id)a11 representations:(int64_t)a12 fallBack:(BOOL)a13 retries:(int)a14 isLQMEnabled:(BOOL)a15 completionBlock:(id)a16
{
  BOOL v48 = a5;
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v52 = a4;
  id v54 = a6;
  id v53 = a8;
  id v55 = a9;
  id v56 = a11;
  id v20 = a16;
  uint64_t v78 = 0;
  v79 = (os_activity_scope_state_s *)&v78;
  uint64_t v80 = 0x3010000000;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  v81 = "";
  v51 = _os_activity_create(&dword_217F26000, "com.apple.messages.AttachmentTranscodeForSend", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v51, v79 + 2);
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = sub_217F28D20;
  v75[3] = &unk_2642F19F0;
  v77 = &v78;
  id v21 = v20;
  id v76 = v21;
  id v22 = (void (**)(void, void, void, void, void, void, void, void))MEMORY[0x21D45C740](v75);
  if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v85 = v19;
      _os_log_impl(&dword_217F26000, v23, OS_LOG_TYPE_INFO, "Transcoder received request to transcode %@", buf, 0xCu);
    }
  }
  if (v19)
  {
    id v24 = [MEMORY[0x263F08850] defaultManager];
    long long v25 = [v19 lastPathComponent];
    long long v26 = [v25 stringByDeletingPathExtension];
    uint64_t v27 = [v19 pathExtension];
    int v28 = [v26 stringByAppendingPathExtension:v27];
    v29 = objc_msgSend(v24, "im_randomTemporaryFileURLWithFileName:", v28);
  }
  else
  {
    v29 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    long long v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v85 = v19;
      __int16 v86 = 2112;
      v87 = v29;
      _os_log_impl(&dword_217F26000, v30, OS_LOG_TYPE_INFO, "Attempting to copy current transfer URL %@ to new URL %@", buf, 0x16u);
    }
  }
  if (v19)
  {
    uint64_t v31 = [MEMORY[0x263F08850] defaultManager];
    id v74 = 0;
    char v32 = [v31 copyItemAtURL:v19 toURL:v29 error:&v74];
    id v33 = v74;

    if (v32)
    {
      if ([(IMTranscodeController *)self _connect])
      {
        xpc_object_t v34 = xpc_dictionary_create(0, 0, 0);
        IMInsertCodableObjectsToXPCDictionary();
        objc_msgSend(v29, "path", v54, 0);
        id v35 = objc_claimAutoreleasedReturnValue();
        [v35 UTF8String];
        id v47 = v52;
        [v47 UTF8String];
        IMInsertStringsToXPCDictionary();

        IMInsertIntsToXPCDictionary();
        IMInsertArraysToXPCDictionary();
        IMInsertDictionariesToXPCDictionary();
        IMInsertBoolsToXPCDictionary();
        IMInsertBoolsToXPCDictionary();
        IMInsertBoolsToXPCDictionary();
        if (objc_msgSend(v56, "count", v48, 0, a10, "target", a7, "message_type", 0, 0))
        {
          id v45 = v56;
          uint64_t v46 = 0;
          IMInsertDictionariesToXPCDictionary();
        }
        [(IMTranscodeController *)self _insertSandboxExtensionIntoXPCMessage:v34, @"read-extension", v29, 1, v45, v46 withKey forFileURL readOnly];
        v57[0] = MEMORY[0x263EF8330];
        v57[1] = 3221225472;
        v57[2] = sub_217F28E04;
        v57[3] = &unk_2642F1A40;
        int v70 = a14;
        id v36 = v19;
        id v58 = v36;
        v59 = self;
        id v60 = v47;
        BOOL v71 = v48;
        id v61 = v54;
        int64_t v67 = a7;
        id v62 = v53;
        id v63 = v55;
        unint64_t v68 = a10;
        id v64 = v56;
        int64_t v69 = a12;
        BOOL v72 = a13;
        BOOL v73 = a15;
        v66 = v22;
        id v65 = v29;
        v37 = (void *)MEMORY[0x21D45C740](v57);
        if (IMOSLoggingEnabled())
        {
          v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v85 = v36;
            _os_log_impl(&dword_217F26000, v38, OS_LOG_TYPE_INFO, "sending request to TranscodeFile for %@", buf, 0xCu);
          }
        }
        connection = self->_connection;
        v40 = MEMORY[0x263EF83A0];
        id v41 = MEMORY[0x263EF83A0];
        xpc_connection_send_message_with_reply(connection, v34, v40, v37);
      }
      else if (IMOSLoggingEnabled())
      {
        v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217F26000, v42, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
        }
      }
      goto LABEL_32;
    }
  }
  else
  {
    id v33 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v85 = v33;
      _os_log_impl(&dword_217F26000, v43, OS_LOG_TYPE_INFO, "Linking failed with error %@, giving up since we're not guaranteed to get a file", buf, 0xCu);
    }
  }
  v44 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-2 userInfo:0];
  ((void (**)(void, id, void, void, void *, void, uint64_t, void))v22)[2](v22, v19, 0, 0, v44, 0, 1, 0);

LABEL_32:
  _Block_object_dispose(&v78, 8);
}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 isSticker:(BOOL)a5 allowUnfilteredUTIs:(id)a6 target:(int64_t)a7 sizes:(id)a8 commonCapabilities:(id)a9 maxDimension:(unint64_t)a10 transcoderUserInfo:(id)a11 representations:(int64_t)a12 isLQMEnabled:(BOOL)a13 completionBlock:(id)a14
{
  LOBYTE(v15) = a13;
  LOBYTE(v14) = 0;
  -[IMTranscodeController _transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:fallBack:retries:isLQMEnabled:completionBlock:](self, "_transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:fallBack:retries:isLQMEnabled:completionBlock:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v14, v15, a14);
}

- (void)transcodeFallbackFileTransferContents:(id)a3 utiType:(id)a4 allowUnfilteredUTIs:(id)a5 target:(int64_t)a6 sizes:(id)a7 commonCapabilities:(id)a8 maxDimension:(unint64_t)a9 transcoderUserInfo:(id)a10 representations:(int64_t)a11 isLQMEnabled:(BOOL)a12 completionBlock:(id)a13
{
  LOBYTE(v14) = a12;
  LOBYTE(v13) = 1;
  -[IMTranscodeController _transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:fallBack:retries:isLQMEnabled:completionBlock:](self, "_transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:fallBack:retries:isLQMEnabled:completionBlock:", a3, a4, 0, a5, a6, a7, a8, a9, a10, a11, v13, v14, a13);
}

- (void)_transcodeFileTransferPayloadData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 retries:(unint64_t)a6 fallBack:(BOOL)a7 completionBlock:(id)a8
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (v14 && v15)
  {
    if ([(IMTranscodeController *)self _connect])
    {
      xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
      IMInsertDatasToXPCDictionary();
      IMInsertArraysToXPCDictionary();
      id v19 = v15;
      objc_msgSend(v19, "UTF8String", v16, 0);
      IMInsertStringsToXPCDictionary();
      IMInsertBoolsToXPCDictionary();
      IMInsertIntsToXPCDictionary();
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = sub_217F29D34;
      v28[3] = &unk_2642F1A90;
      unint64_t v34 = a6;
      id v20 = v19;
      id v29 = v20;
      long long v30 = self;
      id v21 = v14;
      id v31 = v21;
      id v32 = v16;
      BOOL v35 = a7;
      id v33 = v17;
      id v22 = (void *)MEMORY[0x21D45C740](v28);
      if (IMOSLoggingEnabled())
      {
        id v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = objc_msgSend(v21, "length", 0, 0);
          *(_DWORD *)buf = 138412546;
          uint64_t v37 = (uint64_t)v20;
          __int16 v38 = 2048;
          uint64_t v39 = v24;
          _os_log_impl(&dword_217F26000, v23, OS_LOG_TYPE_INFO, "sending request to TranscodePayloadData for %@, data length: %lu", buf, 0x16u);
        }
      }
      xpc_connection_send_message_with_reply(self->_connection, v18, MEMORY[0x263EF83A0], v22);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217F26000, v27, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v37 = [v14 length];
        __int16 v38 = 2112;
        uint64_t v39 = (uint64_t)v15;
        _os_log_impl(&dword_217F26000, v25, OS_LOG_TYPE_INFO, "request error in TranscodingPayloadData: nil data (len=%lu) or balloonBundleID %@", buf, 0x16u);
      }
    }
    if (v17)
    {
      long long v26 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-2 userInfo:0];
      (*((void (**)(id, void, void, void *, void, void))v17 + 2))(v17, 0, 0, v26, 0, 0);
    }
  }
}

- (void)transcodeFallbackFileTransferPayloadData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 completionBlock:(id)a6
{
}

- (void)transcodeLocalTransferPayloadData:(id)a3 balloonBundleID:(id)a4 completionBlock:(id)a5
{
}

- (void)generateSnapshotForMessageGUID:(id)a3 payloadURL:(id)a4 balloonBundleID:(id)a5 senderContext:(id)a6 completionBlock:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13 && v14)
  {
    if ([(IMTranscodeController *)self _connect])
    {
      xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
      uint64_t v25 = [v12 UTF8String];
      IMInsertStringsToXPCDictionary();
      objc_msgSend(v13, "absoluteString", v25, 0);
      id v18 = objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v18 UTF8String];
      IMInsertStringsToXPCDictionary();

      objc_msgSend(v14, "UTF8String", v26, 0);
      IMInsertStringsToXPCDictionary();
      IMInsertKeyedCodableObjectsToXPCDictionary();
      IMInsertIntsToXPCDictionary();
      [(IMTranscodeController *)self _insertSandboxExtensionIntoXPCMessage:v17, @"read-extension", v13, 1, 2, 0 withKey forFileURL readOnly];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = sub_217F2A8E8;
      v27[3] = &unk_2642F1AB8;
      id v19 = v13;
      id v28 = v19;
      id v29 = v16;
      id v20 = (void *)MEMORY[0x21D45C740](v27);
      if (IMOSLoggingEnabled())
      {
        id v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v19;
          _os_log_impl(&dword_217F26000, v21, OS_LOG_TYPE_INFO, "sending request to GenerateSnapshot for %@", buf, 0xCu);
        }
      }
      xpc_connection_send_message_with_reply(self->_connection, v17, MEMORY[0x263EF83A0], v20);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217F26000, v24, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v31 = v13;
        __int16 v32 = 2112;
        id v33 = v14;
        _os_log_impl(&dword_217F26000, v22, OS_LOG_TYPE_INFO, "request error in GenerateSnapshot, nil payloadURL %@ or balloonBundleID %@", buf, 0x16u);
      }
    }
    if (v16)
    {
      id v23 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-2 userInfo:0];
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v23);
    }
  }
}

- (void)generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 balloonBundleID:(id)a7 transferGUID:(id)a8 completionBlock:(id)a9 blockUntilReply:(BOOL)a10
{
  BOOL v16 = a10;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = v22;
  if (v21)
  {
    uint64_t v24 = self;
    uint64_t v25 = (void *)MEMORY[0x21D45C740](v22);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_217F2ADE0;
    v32[3] = &unk_2642F1AE0;
    id v33 = v21;
    id v34 = v25;
    id v26 = v25;
    uint64_t v27 = MEMORY[0x21D45C740](v32);

    self = v24;
    BOOL v16 = a10;
    id v23 = (void *)v27;
  }
  long long v28 = *(_OWORD *)&a6->var1.height;
  v30[0] = *(_OWORD *)&a6->var0;
  v30[1] = v28;
  uint64_t v31 = *(void *)&a6->var3;
  LOBYTE(v29) = v16;
  [(IMTranscodeController *)self _generatePreview:v17 previewURL:v18 senderContext:v19 constraints:v30 retries:0 balloonBundleID:v20 transferGUID:v21 completionBlock:v23 blockUntilReply:v29];
}

- (void)_generatePreview:(id)a3 previewURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 retries:(unint64_t)a7 balloonBundleID:(id)a8 transferGUID:(id)a9 completionBlock:(id)a10 blockUntilReply:(BOOL)a11
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v39 = a5;
  id v19 = a8;
  id v38 = a9;
  id v20 = a10;
  if (v17 && v18)
  {
    if ([(IMTranscodeController *)self _connect])
    {
      xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
      IMInsertIntsToXPCDictionary();
      objc_msgSend(v17, "absoluteString", 3, 0);
      id v22 = objc_claimAutoreleasedReturnValue();
      uint64_t v34 = [v22 UTF8String];
      IMInsertStringsToXPCDictionary();

      objc_msgSend(v18, "absoluteString", v34, 0);
      id v23 = objc_claimAutoreleasedReturnValue();
      uint64_t v35 = [v23 UTF8String];
      IMInsertStringsToXPCDictionary();

      if (v19)
      {
        objc_msgSend(v19, "UTF8String", v35, 0);
        IMInsertStringsToXPCDictionary();
      }
      IMInsertKeyedCodableObjectsToXPCDictionary();
      [(IMTranscodeController *)self _insertSandboxExtensionIntoXPCMessage:v21, @"read-extension", v17, 1, v39, 0 withKey forFileURL readOnly];
      uint64_t v37 = IMCachesDirectoryURL();
      [(IMTranscodeController *)self _insertSandboxExtensionIntoXPCMessage:v21 withKey:@"write-extension" forFileURL:v37 readOnly:0];
      long long v24 = *(_OWORD *)&a6->var1.height;
      *(_OWORD *)buf = *(_OWORD *)&a6->var0;
      *(_OWORD *)&uint8_t buf[16] = v24;
      uint64_t v54 = *(void *)&a6->var3;
      id v36 = IMPreviewConstraintsDictionaryFromConstraint();
      IMInsertDictionariesToXPCDictionary();
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = sub_217F2B4D4;
      v40[3] = &unk_2642F1B08;
      unint64_t v48 = a7;
      id v25 = v17;
      id v41 = v25;
      v42 = self;
      id v43 = v18;
      id v44 = v39;
      long long v26 = *(_OWORD *)&a6->var1.height;
      long long v49 = *(_OWORD *)&a6->var0;
      long long v50 = v26;
      uint64_t v51 = *(void *)&a6->var3;
      id v45 = v19;
      id v46 = v38;
      id v47 = v20;
      BOOL v52 = a11;
      uint64_t v27 = (void (**)(void, void))MEMORY[0x21D45C740](v40);
      if (IMOSLoggingEnabled())
      {
        long long v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v25;
          _os_log_impl(&dword_217F26000, v28, OS_LOG_TYPE_INFO, "sending request to GeneratePreview for %@", buf, 0xCu);
        }
      }
      connection = self->_connection;
      if (a11)
      {
        long long v30 = xpc_connection_send_message_with_reply_sync(connection, v21);
        ((void (**)(void, NSObject *))v27)[2](v27, v30);
      }
      else
      {
        long long v30 = dispatch_get_global_queue(0, 0);
        xpc_connection_send_message_with_reply(connection, v21, v30, v27);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217F26000, v33, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_217F26000, v31, OS_LOG_TYPE_INFO, "request error in GeneratePreview, nil sourceURL %@ or previewURL %@", buf, 0x16u);
      }
    }
    if (v20)
    {
      __int16 v32 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-2 userInfo:0];
      (*((void (**)(id, void, void *, double, double))v20 + 2))(v20, 0, v32, 0.0, 0.0);
    }
  }
}

- (void)generateMetadata:(id)a3 metadataURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    long long v16 = *(_OWORD *)&a6->var1.height;
    v27[0] = *(_OWORD *)&a6->var0;
    v27[1] = v16;
    uint64_t v28 = *(void *)&a6->var3;
    LOBYTE(v18) = 0;
    [(IMTranscodeController *)self _generateMetadata:v12 metadataURL:v13 senderContext:v14 constraints:v27 retries:0 completionBlock:v15 blockUntilReply:v18];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_217F2BBB4;
    block[3] = &unk_2642F1B30;
    block[4] = self;
    id v20 = v12;
    id v21 = v13;
    id v22 = v14;
    long long v17 = *(_OWORD *)&a6->var1.height;
    long long v24 = *(_OWORD *)&a6->var0;
    long long v25 = v17;
    uint64_t v26 = *(void *)&a6->var3;
    id v23 = v15;
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

- (void)generateMetadata:(id)a3 metadataURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 completionBlock:(id)a7 blockUntilReply:(BOOL)a8
{
  long long v8 = *(_OWORD *)&a6->var1.height;
  v10[0] = *(_OWORD *)&a6->var0;
  v10[1] = v8;
  uint64_t v11 = *(void *)&a6->var3;
  LOBYTE(v9) = a8;
  [(IMTranscodeController *)self _generateMetadata:a3 metadataURL:a4 senderContext:a5 constraints:v10 retries:0 completionBlock:a7 blockUntilReply:v9];
}

- (void)_generateMetadata:(id)a3 metadataURL:(id)a4 senderContext:(id)a5 constraints:(IMPreviewConstraints *)a6 retries:(unint64_t)a7 completionBlock:(id)a8 blockUntilReply:(BOOL)a9
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  if (v15 && v16)
  {
    if ([(IMTranscodeController *)self _connect])
    {
      xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
      IMInsertIntsToXPCDictionary();
      objc_msgSend(v15, "absoluteString", 6, 0);
      id v20 = objc_claimAutoreleasedReturnValue();
      uint64_t v32 = [v20 UTF8String];
      IMInsertStringsToXPCDictionary();

      objc_msgSend(v16, "absoluteString", v32, 0);
      id v21 = objc_claimAutoreleasedReturnValue();
      [v21 UTF8String];
      IMInsertStringsToXPCDictionary();

      IMInsertKeyedCodableObjectsToXPCDictionary();
      [(IMTranscodeController *)self _insertSandboxExtensionIntoXPCMessage:v19, @"read-extension", v15, 1, v17, 0 withKey forFileURL readOnly];
      uint64_t v34 = IMCachesDirectoryURL();
      [(IMTranscodeController *)self _insertSandboxExtensionIntoXPCMessage:v19 withKey:@"write-extension" forFileURL:v34 readOnly:0];
      long long v22 = *(_OWORD *)&a6->var1.height;
      *(_OWORD *)buf = *(_OWORD *)&a6->var0;
      *(_OWORD *)&uint8_t buf[16] = v22;
      uint64_t v47 = *(void *)&a6->var3;
      id v33 = IMPreviewConstraintsDictionaryFromConstraint();
      IMInsertDictionariesToXPCDictionary();
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = sub_217F2C114;
      v35[3] = &unk_2642F1B80;
      unint64_t v41 = a7;
      id v23 = v15;
      id v36 = v23;
      uint64_t v37 = self;
      id v38 = v16;
      id v39 = v17;
      long long v24 = *(_OWORD *)&a6->var1.height;
      long long v42 = *(_OWORD *)&a6->var0;
      long long v43 = v24;
      uint64_t v44 = *(void *)&a6->var3;
      id v40 = v18;
      BOOL v45 = a9;
      long long v25 = (void (**)(void, void))MEMORY[0x21D45C740](v35);
      if (IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v23;
          _os_log_impl(&dword_217F26000, v26, OS_LOG_TYPE_INFO, "sending request to GenerateMetadata for %@", buf, 0xCu);
        }
      }
      connection = self->_connection;
      if (a9)
      {
        uint64_t v28 = xpc_connection_send_message_with_reply_sync(self->_connection, v19);
        ((void (**)(void, NSObject *))v25)[2](v25, v28);
      }
      else
      {
        uint64_t v28 = dispatch_get_global_queue(0, 0);
        xpc_connection_send_message_with_reply(connection, v19, v28, v25);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217F26000, v31, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        _os_log_impl(&dword_217F26000, v29, OS_LOG_TYPE_INFO, "request error in GenerateMetadata, nil sourceURL %@ or destinationURL %@", buf, 0x16u);
      }
    }
    if (v18)
    {
      long long v30 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-2 userInfo:0];
      (*((void (**)(id, void, void *, double, double))v18 + 2))(v18, 0, v30, 0.0, 0.0);
    }
  }
}

- (void)decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 completionBlock:(id)a6 blockUntilReply:(BOOL)a7
{
}

- (void)_decodeiMessageAppPayload:(id)a3 senderContext:(id)a4 bundleID:(id)a5 retries:(unint64_t)a6 completionBlock:(id)a7 blockUntilReply:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v30 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v14 && v15)
  {
    if ([(IMTranscodeController *)self _connect])
    {
      xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
      IMInsertIntsToXPCDictionary();
      objc_msgSend(v14, "absoluteString", 5, 0);
      id v18 = objc_claimAutoreleasedReturnValue();
      uint64_t v29 = [v18 UTF8String];
      IMInsertStringsToXPCDictionary();

      id v19 = v15;
      objc_msgSend(v19, "UTF8String", v29, 0);
      IMInsertStringsToXPCDictionary();
      IMInsertKeyedCodableObjectsToXPCDictionary();
      [(IMTranscodeController *)self _insertSandboxExtensionIntoXPCMessage:v17, @"read-extension", v14, 1, v30, 0 withKey forFileURL readOnly];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = sub_217F2CBEC;
      v31[3] = &unk_2642F1A90;
      unint64_t v37 = a6;
      id v20 = v14;
      id v32 = v20;
      id v21 = v19;
      id v33 = v21;
      uint64_t v34 = self;
      id v35 = v30;
      id v36 = v16;
      BOOL v38 = v8;
      long long v22 = (void (**)(void, void))MEMORY[0x21D45C740](v31);
      if (IMOSLoggingEnabled())
      {
        id v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v40 = v20;
          __int16 v41 = 2112;
          id v42 = v21;
          _os_log_impl(&dword_217F26000, v23, OS_LOG_TYPE_INFO, "sending request to DecodeiMessageAppPayload for %@ bundleID %@", buf, 0x16u);
        }
      }
      connection = self->_connection;
      if (v8)
      {
        long long v25 = xpc_connection_send_message_with_reply_sync(connection, v17);
        ((void (**)(void, NSObject *))v22)[2](v22, v25);
      }
      else
      {
        long long v25 = dispatch_get_global_queue(0, 0);
        xpc_connection_send_message_with_reply(connection, v17, v25, v22);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217F26000, v28, OS_LOG_TYPE_INFO, "Unable to connect to transcoding service", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v14;
        __int16 v41 = 2112;
        id v42 = v15;
        _os_log_impl(&dword_217F26000, v26, OS_LOG_TYPE_INFO, "request error in DecodeiMessageAppPayload: nil sourceURL %@ or bundleID %@", buf, 0x16u);
      }
    }
    if (v16)
    {
      uint64_t v27 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMTranscodeErrorDomain" code:-2 userInfo:0];
      (*((void (**)(id, void, void, void, void *))v16 + 2))(v16, 0, 0, 0, v27);
    }
  }
}

- (void)transcribeAudioForAudioTransferURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IMTranscodeController *)self _connect])
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    IMInsertIntsToXPCDictionary();
    objc_msgSend(v6, "absoluteString", 7, 0);
    id v9 = objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v9 UTF8String];
    IMInsertStringsToXPCDictionary();

    [(IMTranscodeController *)self _insertSandboxExtensionIntoXPCMessage:v8, @"read-extension", v6, 1, v13, 0 withKey forFileURL readOnly];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    _OWORD v14[2] = sub_217F2D3C4;
    v14[3] = &unk_2642F1AB8;
    id v15 = v6;
    id v16 = v7;
    id v10 = (void *)MEMORY[0x21D45C740](v14);
    connection = self->_connection;
    id v12 = im_primary_queue();
    xpc_connection_send_message_with_reply(connection, v8, v12, v10);
  }
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end