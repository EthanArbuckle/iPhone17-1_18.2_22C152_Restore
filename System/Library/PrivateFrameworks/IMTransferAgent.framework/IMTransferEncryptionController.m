@interface IMTransferEncryptionController
+ (id)sharedInstance;
- (void)decryptURL:(id)a3 key:(id)a4 outputFileName:(id)a5 completionBlock:(id)a6;
- (void)encryptURL:(id)a3 completionBlock:(id)a4;
@end

@implementation IMTransferEncryptionController

+ (id)sharedInstance
{
  if (qword_26AF3FDD8 != -1) {
    dispatch_once(&qword_26AF3FDD8, &unk_26F0B8EA8);
  }
  v2 = (void *)qword_26AF3FE00;
  return v2;
}

- (void)encryptURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v9 = 138412290;
          id v10 = v5;
          _os_log_impl(&dword_23CAED000, v8, OS_LOG_TYPE_INFO, "Request to encrypt data at url: %@", (uint8_t *)&v9, 0xCu);
        }
      }
      +[IMTransferEncryptionHelpers encryptURL:v5 completionBlock:v7];
    }
    else
    {
      (*((void (**)(id, void, void, void, void, uint64_t))v6 + 2))(v6, 0, 0, 0, 0, 300);
    }
  }
}

- (void)decryptURL:(id)a3 key:(id)a4 outputFileName:(id)a5 completionBlock:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (v12)
  {
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412546;
          id v16 = v9;
          __int16 v17 = 2112;
          id v18 = v10;
          _os_log_impl(&dword_23CAED000, v14, OS_LOG_TYPE_INFO, "Request to decrypt data at url: %@  with key: %@", (uint8_t *)&v15, 0x16u);
        }
      }
      +[IMTransferEncryptionHelpers decryptURL:v9 key:v10 outputFileName:v11 completionBlock:v13];
    }
    else
    {
      (*((void (**)(id, void, void, void, uint64_t))v12 + 2))(v12, 0, 0, 0, 301);
    }
  }
}

@end