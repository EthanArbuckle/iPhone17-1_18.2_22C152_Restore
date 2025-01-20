@interface IMDDController
+ (id)allSupportedDDAttributesKeys;
+ (id)sharedInstance;
- (BOOL)_scanAttributedStringWithMessage:(id)a3 attributedString:(id)a4 plainText:(id)a5;
- (BOOL)_scanMessageUsingScanner:(id)a3 attributedString:(id)a4;
- (IMDDController)init;
- (OS_dispatch_queue)scannerQueue;
- (__DDScanner)sharedScanner;
- (void)_processLinkInAttributedString:(id)a3;
- (void)scanMessage:(id)a3 completionBlock:(id)a4;
- (void)scanMessage:(id)a3 outgoing:(BOOL)a4 waitUntilDone:(BOOL)a5 completionBlock:(id)a6;
- (void)setScannerQueue:(id)a3;
@end

@implementation IMDDController

+ (id)sharedInstance
{
  if (qword_1EB3F24F0 != -1) {
    dispatch_once(&qword_1EB3F24F0, &unk_1EF8E5D38);
  }
  v2 = (void *)qword_1EB3F2550;

  return v2;
}

- (IMDDController)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDDController;
  v2 = [(IMDDController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.IMDDScannerQueue", 0);
    scannerQueue = v2->_scannerQueue;
    v2->_scannerQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (__DDScanner)sharedScanner
{
  return (__DDScanner *)MEMORY[0x1F4123A28](self, a2);
}

- (void)scanMessage:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = qword_1E965EAB0;
  id v7 = a4;
  id v8 = a3;
  id v11 = v8;
  if (v6 == -1)
  {
    objc_msgSend_scanMessage_outgoing_waitUntilDone_completionBlock_(self, v9, (uint64_t)v8, 0, byte_1E965EAA8, v7);
  }
  else
  {
    dispatch_once(&qword_1E965EAB0, &unk_1EF8E5E78);
    objc_msgSend_scanMessage_outgoing_waitUntilDone_completionBlock_(self, v10, (uint64_t)v11, 0, byte_1E965EAA8, v7);
  }
}

- (BOOL)_scanMessageUsingScanner:(id)a3 attributedString:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  if (v10)
  {
    id v11 = objc_msgSend_text(v6, v7, v8, v9);
    v15 = objc_msgSend_string(v11, v12, v13, v14);

    if (v15)
    {
      if (objc_msgSend__scanAttributedStringWithMessage_attributedString_plainText_(self, v16, (uint64_t)v6, (uint64_t)v10, v15))
      {
        char v20 = 1;
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v21 = *MEMORY[0x1E4F6C1D0];
      uint64_t v22 = objc_msgSend_length(v10, v17, v18, v19);
      if (objc_msgSend_attribute_existsInRange_(v10, v23, v21, 0, v22))
      {
        objc_msgSend__processLinkInAttributedString_(self, v24, (uint64_t)v10, v25);
        v29 = objc_msgSend_string(v10, v26, v27, v28);
        char v20 = objc_msgSend__scanAttributedStringWithMessage_attributedString_plainText_(self, v30, (uint64_t)v6, (uint64_t)v10, v29);

        goto LABEL_9;
      }
    }
    char v20 = 0;
    goto LABEL_9;
  }
  char v20 = 0;
LABEL_10:

  return v20;
}

- (void)_processLinkInAttributedString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F6C1D0];
  uint64_t v8 = objc_msgSend_length(v3, v5, v6, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A4C3E85C;
  v11[3] = &unk_1E5B7DB08;
  id v12 = v3;
  id v9 = v3;
  objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(v9, v10, v4, 0, v8, 0, v11);
}

- (BOOL)_scanAttributedStringWithMessage:(id)a3 attributedString:(id)a4 plainText:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_guid(v7, v10, v11, v12);
  v17 = objc_msgSend_sender(v7, v14, v15, v16);
  uint64_t v21 = objc_msgSend_ID(v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend_time(v7, v22, v23, v24);
  objc_msgSend_isFromMe(v7, v26, v27, v28);
  char v29 = IMDDScanAttributedStringWithContext();

  return v29;
}

- (void)scanMessage:(id)a3 outgoing:(BOOL)a4 waitUntilDone:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Request to scan message: %@", buf, 0xCu);
    }
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1A4C3ECB8;
  v17[3] = &unk_1E5B7EB08;
  id v13 = v10;
  BOOL v21 = a4;
  id v18 = v13;
  uint64_t v19 = self;
  BOOL v22 = v7;
  id v14 = v11;
  id v20 = v14;
  uint64_t v15 = _Block_copy(v17);
  scannerQueue = self->_scannerQueue;
  if (v7) {
    dispatch_sync(scannerQueue, v15);
  }
  else {
    dispatch_async(scannerQueue, v15);
  }
}

+ (id)allSupportedDDAttributesKeys
{
  if (qword_1E965EAB8 != -1) {
    dispatch_once(&qword_1E965EAB8, &unk_1EF8E5F18);
  }
  v2 = (void *)qword_1E965EAC0;

  return v2;
}

- (OS_dispatch_queue)scannerQueue
{
  return self->_scannerQueue;
}

- (void)setScannerQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end