@interface IMTransferAgentIDSInterface
+ (id)sharedInstance;
- (BOOL)_sendIDSMessage:(id)a3 topic:(id)a4 localPath:(id)a5;
- (BOOL)isLocalDevicePresent;
- (IMTransferAgentIDSInterface)init;
- (id)localCompanionDevice;
- (void)_handleUploadRequest:(id)a3;
- (void)_handleUploadResponse:(id)a3;
- (void)_sendUploadRequest:(id)a3 topic:(id)a4 transferID:(id)a5 sourceAppID:(id)a6 allowReauthorize:(BOOL)a7;
- (void)_sendUploadResponse:(id)a3 topic:(id)a4 success:(BOOL)a5 error:(id)a6 ownerID:(id)a7 signature:(id)a8 requestURLString:(id)a9 transferID:(id)a10;
- (void)dealloc;
- (void)decrementTransferCount;
- (void)incrementTransferCount;
- (void)remoteUploadFileRequest:(id)a3 topic:(id)a4 transferID:(id)a5 sourceAppID:(id)a6 completionBlock:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation IMTransferAgentIDSInterface

+ (id)sharedInstance
{
  if (qword_26AF3FDB8 != -1) {
    dispatch_once(&qword_26AF3FDB8, &unk_26F0B8E28);
  }
  v2 = (void *)qword_26AF3FDE0;
  return v2;
}

- (IMTransferAgentIDSInterface)init
{
  v12.receiver = self;
  v12.super_class = (Class)IMTransferAgentIDSInterface;
  v2 = [(IMTransferAgentIDSInterface *)&v12 init];
  if (v2)
  {
    IMSetEmbeddedTempDirectory();
    id v3 = objc_alloc_init(MEMORY[0x263F08850]);
    v4 = NSTemporaryDirectory();
    [v3 changeCurrentDirectoryPath:v4];

    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_23CAED000, v5, OS_LOG_TYPE_INFO, "IMTransfer Agent IDS Interface starting", v11, 2u);
      }
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.idstransfers"];
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v6;

    v8 = v2->_idsService;
    v9 = im_primary_queue();
    [(IDSService *)v8 addDelegate:v2 queue:v9];
  }
  return v2;
}

- (void)dealloc
{
  [(IDSService *)self->_idsService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)IMTransferAgentIDSInterface;
  [(IMTransferAgentIDSInterface *)&v3 dealloc];
}

- (BOOL)isLocalDevicePresent
{
  return 1;
}

- (void)remoteUploadFileRequest:(id)a3 topic:(id)a4 transferID:(id)a5 sourceAppID:(id)a6 completionBlock:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412546;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_impl(&dword_23CAED000, v17, OS_LOG_TYPE_INFO, "Received Request to Remote Upload an Attachment at %@ sourceApp %@", (uint8_t *)&v24, 0x16u);
    }
  }
  im_assert_primary_queue();
  if (!v14)
  {
    StringGUID();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_uniqueIDToTransferCompletionBlockMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    uniqueIDToTransferCompletionBlockMap = self->_uniqueIDToTransferCompletionBlockMap;
    self->_uniqueIDToTransferCompletionBlockMap = Mutable;
  }
  if (!self->_uniqueIDToFilePathMap)
  {
    v20 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    uniqueIDToFilePathMap = self->_uniqueIDToFilePathMap;
    self->_uniqueIDToFilePathMap = v20;
  }
  v22 = self->_uniqueIDToTransferCompletionBlockMap;
  v23 = (void *)MEMORY[0x23ECF1F70](v16);
  [(NSMutableDictionary *)v22 setObject:v23 forKey:v14];

  [(NSMutableDictionary *)self->_uniqueIDToFilePathMap setObject:v12 forKey:v14];
  [(IMTransferAgentIDSInterface *)self _sendUploadRequest:v12 topic:v13 transferID:v14 sourceAppID:v15 allowReauthorize:0];
}

- (void)incrementTransferCount
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  im_assert_primary_queue();
  *(int32x2_t *)&self->_int numTransfers = vadd_s32(*(int32x2_t *)&self->_numTransfers, (int32x2_t)0x100000001);
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int numTransfers = self->_numTransfers;
      int totalTransfers = self->_totalTransfers;
      v6[0] = 67109376;
      v6[1] = numTransfers;
      __int16 v7 = 1024;
      int v8 = totalTransfers;
      _os_log_impl(&dword_23CAED000, v3, OS_LOG_TYPE_INFO, "(Incremented) Transfer Count is now %d, total at %d", (uint8_t *)v6, 0xEu);
    }
  }
}

- (void)decrementTransferCount
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  im_assert_primary_queue();
  --self->_numTransfers;
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int numTransfers = self->_numTransfers;
      *(_DWORD *)buf = 67109120;
      int v7 = numTransfers;
      _os_log_impl(&dword_23CAED000, v3, OS_LOG_TYPE_INFO, "(Decremented) Transfer Count is now %d", buf, 8u);
    }
  }
  if (self->_numTransfers <= 0)
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23CAED000, v5, OS_LOG_TYPE_INFO, "We Have No More Transfers Remaining, We will shut down in 1 hour", buf, 2u);
      }
    }
    im_dispatch_after_primary_queue();
  }
}

- (void)_sendUploadRequest:(id)a3 topic:(id)a4 transferID:(id)a5 sourceAppID:(id)a6 allowReauthorize:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  im_assert_primary_queue();
  id v15 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v11];
  id v16 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v17 = v15;
  if (v17)
  {
    CFDictionarySetValue(v16, (const void *)qword_268BC9E18, v17);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05A50();
  }

  id v18 = v12;
  if (v18)
  {
    CFDictionarySetValue(v16, (const void *)qword_268BC9E28, v18);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB059CC();
  }

  id v19 = v13;
  if (v19)
  {
    CFDictionarySetValue(v16, (const void *)qword_268BC9E30, v19);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05948();
  }

  CFDictionarySetValue(v16, (const void *)qword_268BC9E10, &unk_26F0BAEF8);
  if (v14) {
    CFDictionarySetValue(v16, (const void *)qword_268BC9E38, v14);
  }
  [(IMTransferAgentIDSInterface *)self _sendIDSMessage:v16 topic:v18 localPath:v11];
}

- (void)_sendUploadResponse:(id)a3 topic:(id)a4 success:(BOOL)a5 error:(id)a6 ownerID:(id)a7 signature:(id)a8 requestURLString:(id)a9 transferID:(id)a10
{
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a4;
  im_assert_primary_queue();
  v21 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v22 = v15;
  if (v22)
  {
    CFDictionarySetValue(v21, (const void *)qword_268BC9E48, v22);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05CE4();
  }

  v23 = [NSNumber numberWithBool:v12];
  if (v23)
  {
    CFDictionarySetValue(v21, (const void *)qword_268BC9E50, v23);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05C60();
  }

  id v24 = v16;
  if (v24)
  {
    CFDictionarySetValue(v21, (const void *)qword_268BC9E60, v24);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05BDC();
  }

  id v25 = v17;
  if (v25)
  {
    CFDictionarySetValue(v21, (const void *)qword_268BC9E68, v25);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05B58();
  }

  id v26 = v18;
  if (v26)
  {
    CFDictionarySetValue(v21, (const void *)qword_268BC9E70, v26);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05AD4();
  }

  id v27 = v19;
  if (v27)
  {
    CFDictionarySetValue(v21, (const void *)qword_268BC9E30, v27);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    sub_23CB05948();
  }

  CFDictionarySetValue(v21, (const void *)qword_268BC9E10, &unk_26F0BAF10);
  [(IMTransferAgentIDSInterface *)self _sendIDSMessage:v21 topic:v20 localPath:v22];

  [(IMTransferAgentIDSInterface *)self decrementTransferCount];
}

- (void)_handleUploadRequest:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23CAED000, v5, OS_LOG_TYPE_INFO, "RECEIVED Remote Attachment IDS Message", buf, 2u);
    }
  }
  im_assert_primary_queue();
  [(IMTransferAgentIDSInterface *)self incrementTransferCount];
  uint64_t v6 = [v4 _dataForKey:qword_268BC9E18];
  int v7 = [v4 _stringForKey:qword_268BC9E40];
  uint64_t v8 = [v4 _stringForKey:qword_268BC9E28];
  uint64_t v9 = [v4 _stringForKey:qword_268BC9E30];
  v10 = [v4 _stringForKey:qword_268BC9E38];
  id v11 = [MEMORY[0x263F08850] defaultManager];
  BOOL v12 = objc_msgSend(v11, "im_randomTemporaryFileURLWithFileName:", v7);
  id v13 = [v12 path];

  if (v6)
  {
    [v6 writeToFile:v13 atomically:1];
    id v14 = +[IMTransferAgentController sharedInstance];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_23CAEF774;
    v15[3] = &unk_264E80C70;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    [v14 sendFilePath:v13 encrypt:0 topic:v16 transferID:v17 sourceAppID:v10 userInfo:0 progressBlock:0 completionBlock:v15];
  }
}

- (void)_handleUploadResponse:(id)a3
{
  id v4 = a3;
  im_assert_primary_queue();
  v5 = [v4 _stringForKey:qword_268BC9E30];
  uint64_t v6 = [v4 objectForKey:qword_268BC9E50];
  uint64_t v7 = [v6 BOOLValue];

  uint64_t v8 = [v4 _stringForKey:qword_268BC9E60];
  uint64_t v9 = [v4 objectForKey:qword_268BC9E68];
  v10 = [v4 _stringForKey:qword_268BC9E70];
  id v11 = [(NSMutableDictionary *)self->_uniqueIDToTransferCompletionBlockMap objectForKey:v5];
  BOOL v12 = [(NSMutableDictionary *)self->_uniqueIDToFilePathMap objectForKey:v5];
  int v13 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v13)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23CAED000, v14, OS_LOG_TYPE_INFO, " Found completion block for attachment", buf, 2u);
      }
    }
    if (v12)
    {
      id v15 = [MEMORY[0x263F08850] defaultManager];
      [v15 attributesOfItemAtPath:v12 error:0];
      id v27 = v11;
      uint64_t v28 = v5;
      id v16 = v12;
      id v17 = v10;
      id v18 = v9;
      v20 = id v19 = v8;

      [v20 objectForKeyedSubscript:*MEMORY[0x263F080B8]];
      id v22 = v21 = v7;
      uint64_t v23 = [v22 unsignedIntegerValue];

      uint64_t v7 = v21;
      uint64_t v8 = v19;
      uint64_t v9 = v18;
      v10 = v17;
      BOOL v12 = v16;
      id v11 = v27;
      v5 = v28;
    }
    else
    {
      uint64_t v23 = 0;
    }
    ((void (**)(void, uint64_t, void *, uint64_t, void *, void *, void *, void, void))v11)[2](v11, v7, v12, v23, v8, v9, v10, 0, 0);
    [(NSMutableDictionary *)self->_uniqueIDToTransferCompletionBlockMap removeObjectForKey:v5];
    [(NSMutableDictionary *)self->_uniqueIDToFilePathMap removeObjectForKey:v5];
  }
  else if (v13)
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_23CAED000, v24, OS_LOG_TYPE_INFO, " No completion block for attachment found", v29, 2u);
    }
  }
  if (![(NSMutableDictionary *)self->_uniqueIDToTransferCompletionBlockMap count])
  {
    uniqueIDToTransferCompletionBlockMap = self->_uniqueIDToTransferCompletionBlockMap;
    self->_uniqueIDToTransferCompletionBlockMap = 0;
  }
  if (![(NSMutableDictionary *)self->_uniqueIDToFilePathMap count])
  {
    uniqueIDToFilePathMap = self->_uniqueIDToFilePathMap;
    self->_uniqueIDToFilePathMap = 0;
  }
}

- (BOOL)_sendIDSMessage:(id)a3 topic:(id)a4 localPath:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl(&dword_23CAED000, v11, OS_LOG_TYPE_INFO, " SENDING Remote Attachment IDS Message with content %@", buf, 0xCu);
    }
  }
  im_assert_primary_queue();
  BOOL v12 = JWEncodeDictionary();
  int v13 = (void *)[v12 _CUTCopyGzippedData];
  idsService = self->_idsService;
  id v15 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49E30]];
  id v23 = 0;
  id v24 = 0;
  int v16 = [(IDSService *)idsService sendData:v13 toDestinations:v15 priority:300 options:0 identifier:&v24 error:&v23];
  id v17 = v24;
  id v18 = v23;

  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v26 = v17;
      if (v16) {
        id v20 = @"YES";
      }
      __int16 v27 = 2112;
      id v28 = v18;
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_23CAED000, v19, OS_LOG_TYPE_INFO, "Sending message to local account (identifier %@)  (error %@)  (messageDict %@) success: %@", buf, 0x2Au);
    }
  }
  if (v16 && IMTransferRequestIsForMessages(v9, v10))
  {
    uint64_t v21 = [v10 lastPathComponent];
    IMGreenTeaAttachmentTransmitLoggingFormat();
  }
  return v16;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v23 = 138413314;
      id v24 = v12;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v14;
      __int16 v29 = 2112;
      id v30 = v15;
      __int16 v31 = 2112;
      id v32 = v16;
      _os_log_impl(&dword_23CAED000, v17, OS_LOG_TYPE_INFO, "incomingData on service %@, account %@ data %@ fromID %@ context %@", (uint8_t *)&v23, 0x34u);
    }
  }
  im_assert_primary_queue();
  id v18 = [v14 _CUTOptionallyDecompressData];
  id v19 = JWDecodeDictionary();
  id v20 = [v19 objectForKey:qword_268BC9E10];
  int v21 = [v20 unsignedIntValue];

  if (v21 == 2)
  {
    [(IMTransferAgentIDSInterface *)self _handleUploadResponse:v19];
  }
  else if (v21 == 1)
  {
    [(IMTransferAgentIDSInterface *)self _handleUploadRequest:v19];
  }
  else if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v23 = 67109120;
      LODWORD(v24) = v21;
      _os_log_impl(&dword_23CAED000, v22, OS_LOG_TYPE_INFO, "Unknown incoming IDS message for remote attachments with command %d, ignoring...", (uint8_t *)&v23, 8u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = @"NO";
      if (v8) {
        id v16 = @"YES";
      }
      int v17 = 138412546;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v16;
      _os_log_impl(&dword_23CAED000, v15, OS_LOG_TYPE_INFO, "Sent message with identifier %@ success %@", (uint8_t *)&v17, 0x16u);
    }
  }
  im_assert_primary_queue();
}

- (id)localCompanionDevice
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIDToFilePathMap, 0);
  objc_storeStrong((id *)&self->_uniqueIDToTransferCompletionBlockMap, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end