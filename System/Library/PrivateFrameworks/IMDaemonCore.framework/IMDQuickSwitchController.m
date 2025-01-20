@interface IMDQuickSwitchController
+ (id)sharedInstance;
- (BOOL)_isPairedDeviceInProxyMode;
- (BOOL)_sendIDSFile:(id)a3 withCommand:(int64_t)a4;
- (BOOL)_sendIDSMessage:(id)a3;
- (BOOL)_sendZippedFileAtPath:(id)a3 withCommand:(int64_t)a4;
- (BOOL)_supportsQuickSwitchWithPairedDevice;
- (BOOL)_truncateDBToPath:(id)a3;
- (IDSService)quickSwitchIDSService;
- (IMDQuickSwitchController)init;
- (PSYSyncCoordinator)syncCoordinator;
- (id)_defaultPairedDevice;
- (id)_getDowngradedDBPath;
- (id)_getTempDBPath;
- (id)_getTempRecentsPath;
- (id)_getTruncatedDBPath;
- (id)_getZippedDBPath;
- (id)_getZippedRecentsPath;
- (int64_t)_getCurrentDBVersion;
- (unint64_t)_getFileSizeAtPath:(id)a3;
- (void)_cleanUpTemporaryFiles;
- (void)_compressFileAtPath:(id)a3 toPath:(id)a4 withCompletionBlock:(id)a5;
- (void)_decompressFileAtPath:(id)a3 toPath:(id)a4 withCompletionBlock:(id)a5;
- (void)_deleteFileAtPath:(id)a3;
- (void)_handleDBVersionResponse:(id)a3;
- (void)_handleIncomingDB:(id)a3;
- (void)_handleIncomingRecents:(id)a3;
- (void)_handleQuickSwitchCompleted:(id)a3;
- (void)_handleQuickSwitchInitiateRequest;
- (void)_handleRecentsRequest;
- (void)_initiateQuickSwitch;
- (void)_notifyPSYDataSent;
- (void)_notifyPSYWithResult:(BOOL)a3;
- (void)_quickSwitchCompleted:(BOOL)a3;
- (void)_sendDBVersionResponse:(int64_t)a3;
- (void)_sendQuickSwitchCompletedWithResult:(BOOL)a3;
- (void)_sendRecentsRequest;
- (void)dealloc;
- (void)dummyMethod;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setQuickSwitchIDSService:(id)a3;
- (void)setSyncCoordinator:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
@end

@implementation IMDQuickSwitchController

+ (id)sharedInstance
{
  if (qword_1EBE2B848 != -1) {
    dispatch_once(&qword_1EBE2B848, &unk_1F3390F00);
  }
  return (id)qword_1EBE2B978;
}

- (IMDQuickSwitchController)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMDQuickSwitchController;
  v2 = [(IMDQuickSwitchController *)&v8 init];
  if (v2)
  {
    if (qword_1EBE2BB40 != -1) {
      dispatch_once(&qword_1EBE2BB40, &unk_1F3390EE0);
    }
    v3 = (IDSService *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.messagesquickswitch"];
    v2->_quickSwitchIDSService = v3;
    [(IDSService *)v3 addDelegate:v2 queue:MEMORY[0x1E4F14428]];
    v4 = (PSYSyncCoordinator *)(id)[(id)qword_1EBE2BB48 syncCoordinatorWithServiceName:@"com.apple.pairedsync.messagessync"];
    v2->_syncCoordinator = v4;
    [(PSYSyncCoordinator *)v4 setDelegate:v2];
    [(IMDQuickSwitchController *)v2 _cleanUpTemporaryFiles];
  }
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Instantiated IMDQuickSwitchController", v7, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  [(IMDQuickSwitchController *)self _cleanUpTemporaryFiles];
  v3.receiver = self;
  v3.super_class = (Class)IMDQuickSwitchController;
  [(IMDQuickSwitchController *)&v3 dealloc];
}

- (void)dummyMethod
{
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Sending dummy request", v4, 2u);
    }
  }
  [(IMDQuickSwitchController *)self _isPairedDeviceInProxyMode];
  [(IMDQuickSwitchController *)self _initiateQuickSwitch];
}

- (int64_t)_getCurrentDBVersion
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t SchemaVersion = IMDSMSRecordStoreGetSchemaVersion();
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      int64_t v6 = SchemaVersion;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Current db version is %ld", (uint8_t *)&v5, 0xCu);
    }
  }
  return SchemaVersion;
}

- (id)_getTempDBPath
{
  v2 = (void *)[(id)IMSafeTemporaryDirectory() path];

  return (id)[v2 stringByAppendingPathComponent:@"MessagesQSwitch"];
}

- (id)_getTempRecentsPath
{
  v2 = (void *)[(id)IMSafeTemporaryDirectory() path];

  return (id)[v2 stringByAppendingPathComponent:@"Recents"];
}

- (id)_getZippedRecentsPath
{
  v2 = (void *)[(id)IMSafeTemporaryDirectory() path];

  return (id)[v2 stringByAppendingPathComponent:@"compressedSMSRecents.zip"];
}

- (id)_getTruncatedDBPath
{
  v2 = (void *)[(id)IMSafeTemporaryDirectory() path];

  return (id)[v2 stringByAppendingPathComponent:@"tempSMS.db"];
}

- (id)_getDowngradedDBPath
{
  v2 = (void *)[(id)IMSafeTemporaryDirectory() path];

  return (id)[v2 stringByAppendingPathComponent:@"tempDowngradedSMS.db"];
}

- (id)_getZippedDBPath
{
  v2 = (void *)[(id)IMSafeTemporaryDirectory() path];

  return (id)[v2 stringByAppendingPathComponent:@"compressedSMSDB.zip"];
}

- (unint64_t)_getFileSizeAtPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    v9 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    int64_t v6 = "QuickSwitch Could not determine file size as path was nil";
    uint64_t v7 = v9;
    uint32_t v8 = 2;
    goto LABEL_9;
  }
  unint64_t v13 = 0;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", a3, &v13);
  if (v13)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    int v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412546;
    id v15 = a3;
    __int16 v16 = 2112;
    unint64_t v17 = v13;
    int64_t v6 = "QuickSwitch Could not determine file size at path %@ with error %@";
    uint64_t v7 = v5;
    uint32_t v8 = 22;
LABEL_9:
    _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, v6, buf, v8);
    return 0;
  }
  unint64_t v10 = [v4 fileSize];
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = a3;
      __int16 v16 = 2048;
      unint64_t v17 = v10;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Size of file at path %@ is %lu", buf, 0x16u);
    }
  }
  return v10;
}

- (BOOL)_truncateDBToPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((IMDDatabaseDelete() & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        int v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v11 = a3;
          _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "QuickSwitch Could not delete DB at path %@", buf, 0xCu);
        }
      }
    }
    IMTimingStartTimingForKey();
    char v6 = IMDTrimSharedDatabaseToMessageCount();
    if (v6)
    {
      IMTimingStopTimingForKey();
      [(IMDQuickSwitchController *)self _getFileSizeAtPath:a3];
    }
    else if (IMOSLoggingEnabled())
    {
      uint32_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "QuickSwitch Could not trim DB with error %@ ", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "QuickSwitch We got a nil path to truncate to.", buf, 2u);
      }
    }
    return 0;
  }
  return v6;
}

- (void)_deleteFileAtPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v14 = 0;
    char v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", a3, &v14);
    int v5 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v5)
      {
        char v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          id v16 = a3;
          uint64_t v7 = "Deleted file at path %@ ";
          uint32_t v8 = v6;
          uint32_t v9 = 12;
LABEL_12:
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v15, v9);
        }
      }
    }
    else if (v5)
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v14 domain];
        uint64_t v13 = [v14 code];
        int v15 = 138412802;
        id v16 = a3;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        __int16 v19 = 2048;
        uint64_t v20 = v13;
        uint64_t v7 = "QuickSwitch Could not delete file at path %@ with error domain '%@' code: %ld";
        uint32_t v8 = v11;
        uint32_t v9 = 32;
        goto LABEL_12;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    unint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      uint64_t v7 = "QuickSwitch we were given a nil path to delete";
      uint32_t v8 = v10;
      uint32_t v9 = 2;
      goto LABEL_12;
    }
  }
}

- (void)_cleanUpTemporaryFiles
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Cleaning up temporary files", buf, 2u);
    }
  }
  [(IMDQuickSwitchController *)self _deleteFileAtPath:[(IMDQuickSwitchController *)self _getTempDBPath]];
  [(IMDQuickSwitchController *)self _deleteFileAtPath:[(IMDQuickSwitchController *)self _getTempRecentsPath]];
  [(IMDQuickSwitchController *)self _deleteFileAtPath:[(IMDQuickSwitchController *)self _getZippedDBPath]];
  [(IMDQuickSwitchController *)self _deleteFileAtPath:[(IMDQuickSwitchController *)self _getZippedRecentsPath]];
  [(IMDQuickSwitchController *)self _deleteFileAtPath:[(IMDQuickSwitchController *)self _getTruncatedDBPath]];
  [(IMDQuickSwitchController *)self _deleteFileAtPath:[(IMDQuickSwitchController *)self _getDowngradedDBPath]];
  [(IMDQuickSwitchController *)self _getTruncatedDBPath];
  if ((IMDDatabaseDelete() & 1) == 0 && IMOSLoggingEnabled())
  {
    char v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [(IMDQuickSwitchController *)self _getTruncatedDBPath];
      *(_DWORD *)buf = 138412546;
      id v7 = v5;
      __int16 v8 = 2112;
      uint64_t v9 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "QuickSwitch Could not delete DB at path %@ %@", buf, 0x16u);
    }
  }
}

- (void)_compressFileAtPath:(id)a3 toPath:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", a4))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "QuickSwitch. We do not expect file to already exist. Clearing it.", buf, 2u);
      }
    }
    uint64_t v17 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", a4, &v17) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v19 = a4;
          __int16 v20 = 2112;
          uint64_t v21 = v17;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "QuickSwitch Could not delete zipped file DB at path %@ with error %@", buf, 0x16u);
        }
      }
    }
  }
  uint64_t v15 = MEMORY[0x1E4F143A8];
  id v16 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F6C340]);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", a3, v15, 3221225472, sub_1D972523C, &unk_1E6B75188, a4, self, v16);
  uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a4];
  id v14 = (void *)[v11 initWithInputURL:v12 outputURL:v13 identifier:0 operation:2 completionBlock:&v15 queue:MEMORY[0x1E4F14428]];
  IMTimingStartTimingForKey();
  [v14 start];
}

- (void)_decompressFileAtPath:(id)a3 toPath:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", a4))
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "QuickSwitch. We do not expect file to already exist.", buf, 2u);
      }
    }
    uint64_t v15 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", a4, &v15) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v17 = a4;
          __int16 v18 = 2112;
          uint64_t v19 = v15;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "QuickSwitch Could not delete zipped file DB at path %@ with error %@", buf, 0x16u);
        }
      }
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1D972557C;
  v14[3] = &unk_1E6B751B0;
  v14[4] = a4;
  v14[5] = a5;
  id v10 = objc_alloc(MEMORY[0x1E4F6C340]);
  uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a4];
  uint64_t v13 = (void *)[v10 initWithInputURL:v11 outputURL:v12 identifier:0 operation:1 completionBlock:v14 queue:MEMORY[0x1E4F14428]];
  IMTimingStartTimingForKey();
  [v13 start];
}

- (void)_initiateQuickSwitch
{
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Initiating quick switch", buf, 2u);
    }
  }
  id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v5 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInteger:", 1), @"c", 0);
  if (![(IMDQuickSwitchController *)self _sendIDSMessage:v5])
  {
    if (IMOSLoggingEnabled())
    {
      char v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "QuickSwitch Could not send initiate QuickSwitch message. Bailing!", v7, 2u);
      }
    }
    [(IMDQuickSwitchController *)self _quickSwitchCompleted:0];
  }
}

- (void)_sendDBVersionResponse:(int64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v6 = [NSNumber numberWithInteger:2];
  id v7 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, @"c", objc_msgSend(NSNumber, "numberWithInteger:", a3), @"dbv", 0);
  if (![(IMDQuickSwitchController *)self _sendIDSMessage:v7])
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Could not send initiate QuickSwitch message. Bailing!", buf, 2u);
      }
    }
    [(IMDQuickSwitchController *)self _quickSwitchCompleted:0];
  }
}

- (void)_sendRecentsRequest
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = objc_msgSend(v3, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInteger:", 5), @"c", 0);
  if (![(IMDQuickSwitchController *)self _sendIDSMessage:v4])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Could not send QuickSwitch Recents request. Bailing!", buf, 2u);
      }
    }
    [(IMDQuickSwitchController *)self _quickSwitchCompleted:0];
  }
}

- (void)_handleQuickSwitchInitiateRequest
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "We tried to _handleQuickSwitchInitiateRequest a non watch device for QuickSwitch. This is really bad!", v3, 2u);
    }
  }
}

- (void)_quickSwitchCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = @"NO";
      if (v3) {
        uint64_t v6 = @"YES";
      }
      int v7 = 138412290;
      __int16 v8 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Finished with success %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(IMDQuickSwitchController *)self _cleanUpTemporaryFiles];
  [(IMDQuickSwitchController *)self _notifyPSYWithResult:v3];
}

- (BOOL)_sendZippedFileAtPath:(id)a3 withCommand:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");

  return MEMORY[0x1F4181798](self, sel__sendIDSFile_withCommand_);
}

- (void)_handleDBVersionResponse:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v32 = (int64_t)a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "dbVersionResponse %@", buf, 0xCu);
    }
  }
  int64_t v6 = [(IMDQuickSwitchController *)self _getCurrentDBVersion];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"dbv"), "integerValue");
  if (v6 != v7)
  {
    int v12 = IMDCanDowngradeDatabaseToVersion();
    int v13 = IMOSLoggingEnabled();
    if (!v12)
    {
      if (v13)
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          int64_t v32 = v6;
          __int16 v33 = 2048;
          uint64_t v34 = v7;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Trying to QuickSwitch to incompatible gizmo. Bailing quick switch. localDBVersion %ld gizmoDBVersion %ld", buf, 0x16u);
        }
      }
      goto LABEL_15;
    }
    if (v13)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v32 = v7;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Downgrade: found a database that can be downgraded to version: %ld", buf, 0xCu);
      }
    }
  }
  id v8 = [(IMDQuickSwitchController *)self _getTruncatedDBPath];
  if (![(IMDQuickSwitchController *)self _truncateDBToPath:v8]
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v8) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v32 = (int64_t)v8;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "QuickSwitch Truncated DB did not succeed at path %@, Really bad! ", buf, 0xCu);
      }
    }
    goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Truncation succeeded! :-)", buf, 2u);
    }
  }
  if (v6 == v7) {
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      int64_t v32 = v6;
      __int16 v33 = 2048;
      uint64_t v34 = v7;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Attempting downgrade from %ld to %ld...", buf, 0x16u);
    }
  }
  id v17 = [(IMDQuickSwitchController *)self _getDowngradedDBPath];
  id v30 = 0;
  char v18 = IMDDowngradeDatabaseToVersion();
  int v19 = IMOSLoggingEnabled();
  if ((v18 & 1) == 0)
  {
    if (v19)
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = [v30 localizedDescription];
        *(_DWORD *)buf = 134218498;
        int64_t v32 = v7;
        __int16 v33 = 2048;
        uint64_t v34 = v6;
        __int16 v35 = 2112;
        uint64_t v36 = v26;
        _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Error Trying to QuickSwitch watch to version %ld from %ld. Downgrade failed with error: %@", buf, 0x20u);
      }
    }
LABEL_15:
    [(IMDQuickSwitchController *)self _quickSwitchCompleted:0];
    return;
  }
  if (v19)
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      int64_t v32 = v6;
      __int16 v33 = 2048;
      uint64_t v34 = v7;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Downgraded from %ld to %ld ok! :-D", buf, 0x16u);
    }
  }
  [(IMDQuickSwitchController *)self _deleteFileAtPath:v8];
  int64_t v29 = 0;
  char v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "moveItemAtPath:toPath:error:", v17, v8, &v29);
  if (v29) {
    char v22 = 0;
  }
  else {
    char v22 = v21;
  }
  int v23 = IMOSLoggingEnabled();
  if (v22)
  {
    if (v23)
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        int64_t v32 = (int64_t)v17;
        __int16 v33 = 2112;
        uint64_t v34 = (uint64_t)v8;
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "renamed %@ to %@ in preperation for compression - this means the downgrade completed ok. :-D", buf, 0x16u);
      }
    }
LABEL_11:
    id v10 = [(IMDQuickSwitchController *)self _getZippedDBPath];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1D972622C;
    v28[3] = &unk_1E6B73178;
    v28[4] = self;
    [(IMDQuickSwitchController *)self _compressFileAtPath:v8 toPath:v10 withCompletionBlock:v28];
    return;
  }
  if (v23)
  {
    v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v32 = v29;
      _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "QuickSwitch failed to rename downgraded db to tempdb with error: %@", buf, 0xCu);
    }
  }
  [(IMDQuickSwitchController *)self _quickSwitchCompleted:0];
}

- (void)_handleRecentsRequest
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)FormattedRecentDomainDirectory() stringByStandardizingPath];
  id v4 = [(IMDQuickSwitchController *)self _getTempRecentsPath];
  id v5 = [(IMDQuickSwitchController *)self _getZippedRecentsPath];
  uint64_t v9 = 0;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v3)) {
    goto LABEL_6;
  }
  if (IMOSLoggingEnabled())
  {
    int64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v3;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Copying from %@ to %@", buf, 0x16u);
    }
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "copyItemAtPath:toPath:error:", v3, v4, &v9) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "QuickSwitch could not copy path to temp directory with error %@. Bailing!!", buf, 0xCu);
      }
    }
    [(IMDQuickSwitchController *)self _deleteFileAtPath:v4];
    [(IMDQuickSwitchController *)self _quickSwitchCompleted:0];
  }
  else
  {
LABEL_6:
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1D97265F8;
    v8[3] = &unk_1E6B746B8;
    v8[4] = v5;
    v8[5] = self;
    [(IMDQuickSwitchController *)self _compressFileAtPath:v4 toPath:v5 withCompletionBlock:v8];
  }
}

- (void)_handleQuickSwitchCompleted:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "_handleQuickSwitchCompleted %@", (uint8_t *)&v6, 0xCu);
    }
  }
  -[IMDQuickSwitchController _quickSwitchCompleted:](self, "_quickSwitchCompleted:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"s"), "BOOLValue"));
}

- (void)_handleIncomingDB:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "QuickSwitch got _handleIncomingDB on a non gizmo. Really bad!!", v4, 2u);
    }
  }
}

- (void)_handleIncomingRecents:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "QuickSwitch got _handleIncomingRecents on a non gizmo. Really bad!!", v4, 2u);
    }
  }
}

- (void)_sendQuickSwitchCompletedWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v6 = [NSNumber numberWithInteger:4];
  id v7 = (id)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, @"c", objc_msgSend(NSNumber, "numberWithBool:", v3), @"s", 0);
  [(IMDQuickSwitchController *)self _sendIDSMessage:v7];
}

- (BOOL)_sendIDSFile:(id)a3 withCommand:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v8 = objc_msgSend(v7, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInteger:", a4), @"c", 0);
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  int v9 = -[IDSService sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:](self->_quickSwitchIDSService, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", a3, v8, [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F6ADA8]], 300, 0, &v14, &v13);
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = @"NO";
      if (v9) {
        uint64_t v11 = @"YES";
      }
      *(_DWORD *)buf = 138413314;
      id v16 = a3;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      char v22 = v8;
      __int16 v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Sending file at URL %@ to local account (identifier %@)  (error %@)  (metadata %@) success: %@", buf, 0x34u);
    }
  }

  return v9;
}

- (BOOL)_sendIDSMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  id v5 = (void *)[(id)JWEncodeDictionary() _FTCopyGzippedData];
  int v6 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](self->_quickSwitchIDSService, "sendData:toDestinations:priority:options:identifier:error:", v5, [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F6ADA8]], 300, 0, &v11, &v10);
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = @"NO";
      if (v6) {
        uint64_t v8 = @"YES";
      }
      *(_DWORD *)buf = 138413058;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = a3;
      __int16 v18 = 2112;
      __int16 v19 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Sending message to local account (identifier %@)  (error %@)  (request %@) success: %@", buf, 0x2Au);
    }
  }

  return v6;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v23 = 138413314;
      uint64_t v24 = (uint64_t)a3;
      __int16 v25 = 2112;
      id v26 = a4;
      __int16 v27 = 2112;
      id v28 = a5;
      __int16 v29 = 2112;
      id v30 = a6;
      __int16 v31 = 2112;
      id v32 = a7;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "service %@, account %@, incomingData %@ fromID %@ context %@", (uint8_t *)&v23, 0x34u);
    }
  }
  if ([a3 deviceForFromID:a6])
  {
    [a5 _FTOptionallyDecompressData];
    __int16 v14 = (void *)JWDecodeDictionary();
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        uint64_t v24 = (uint64_t)v14;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Got request %@", (uint8_t *)&v23, 0xCu);
      }
    }
    uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "objectForKey:", @"c"), "integerValue");
    switch(v16)
    {
      case 1:
        if (IMOSLoggingEnabled())
        {
          id v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandInitiateQuickSwitch", (uint8_t *)&v23, 2u);
          }
        }
        [(IMDQuickSwitchController *)self _handleQuickSwitchInitiateRequest];
        break;
      case 2:
        if (IMOSLoggingEnabled())
        {
          uint64_t v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandResponeDBVersion", (uint8_t *)&v23, 2u);
          }
        }
        [(IMDQuickSwitchController *)self _handleDBVersionResponse:v14];
        break;
      case 4:
        if (IMOSLoggingEnabled())
        {
          __int16 v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandQuickSwitchCompleted", (uint8_t *)&v23, 2u);
          }
        }
        [(IMDQuickSwitchController *)self _handleQuickSwitchCompleted:v14];
        break;
      case 5:
        if (IMOSLoggingEnabled())
        {
          char v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandRequestRecents", (uint8_t *)&v23, 2u);
          }
        }
        [(IMDQuickSwitchController *)self _handleRecentsRequest];
        break;
      default:
        if (IMOSLoggingEnabled())
        {
          __int16 v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            int v23 = 134217984;
            uint64_t v24 = v16;
            __int16 v19 = "QuickSwitch got unknown request over quick switch service %ld";
            goto LABEL_31;
          }
        }
        break;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      uint64_t v24 = (uint64_t)a6;
      __int16 v19 = "Not an IDSDevice: fromID %@. Bailing";
LABEL_31:
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v22 = 138413570;
      id v23 = a3;
      __int16 v24 = 2112;
      id v25 = a4;
      __int16 v26 = 2112;
      id v27 = a5;
      __int16 v28 = 2112;
      id v29 = a6;
      __int16 v30 = 2112;
      id v31 = a7;
      __int16 v32 = 2112;
      id v33 = a8;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "service %@, account %@, resourceURL %@ metadata %@ fromID %@ context %@", (uint8_t *)&v22, 0x3Eu);
    }
  }
  if (![a3 deviceForFromID:a7])
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    __int16 v19 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v22 = 138412290;
    id v23 = a7;
    uint64_t v20 = "Not an IDSDevice: fromID %@. Bailing";
    goto LABEL_21;
  }
  uint64_t v16 = objc_msgSend((id)objc_msgSend(a6, "objectForKey:", @"c"), "integerValue");
  id v17 = (void *)v16;
  if (v16 != 6)
  {
    if (v16 == 3)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v22 = 138412290;
          id v23 = a5;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandIncomingDB at url %@", (uint8_t *)&v22, 0xCu);
        }
      }
      -[IMDQuickSwitchController _handleIncomingDB:](self, "_handleIncomingDB:", [a5 path]);
      return;
    }
    if (!IMOSLoggingEnabled()) {
      return;
    }
    __int16 v19 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v22 = 134217984;
    id v23 = v17;
    uint64_t v20 = "QuickSwitch got unknown resource ULR callback over quick switch service %ld";
LABEL_21:
    _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v22, 0xCu);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = a5;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Got IMDQuickSwitchControllerCommandIncomingRecents at url %@", (uint8_t *)&v22, 0xCu);
    }
  }
  -[IMDQuickSwitchController _handleIncomingRecents:](self, "_handleIncomingRecents:", [a5 path]);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = a5;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "message sent with identifier %@ ", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)_isPairedDeviceInProxyMode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Checking if we are in proxy mode", buf, 2u);
    }
  }
  BOOL v3 = +[IMDServiceController sharedController];
  id v4 = (void *)MEMORY[0x1E4F6E1B0];
  id v5 = [+[IMDAccountController sharedInstance] activeAccountsForService:[(IMDServiceController *)v3 serviceWithName:*MEMORY[0x1E4F6E1B0]]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "service"), "internalName"), "isEqualToString:", *v4)&& objc_msgSend((id)objc_msgSend(v9, "loginID"), "_appearsToBeEmail"))
        {
          if (IMOSLoggingEnabled())
          {
            __int16 v12 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v19 = v9;
              _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Not in proxy mode. Found active iMessage account signed into email %@ ", buf, 0xCu);
            }
          }
          return 0;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  if (!IMOSLoggingEnabled()) {
    return 1;
  }
  id v10 = OSLogHandleForIMEventCategory();
  BOOL v11 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "In proxy mode. Did not find any active iMessage account logged in using email.", buf, 2u);
  }
  return v11;
}

- (id)_defaultPairedDevice
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = (void *)[self->_quickSwitchIDSService devices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice])
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v8 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              long long v15 = v6;
              _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Found default paired device %@", buf, 0xCu);
            }
          }
          return v6;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "QuickSwitch Did not find default paired device", buf, 2u);
    }
  }
  return 0;
}

- (BOOL)_supportsQuickSwitchWithPairedDevice
{
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F79EF0], "sharedInstance"), "getActivePairedDevice");
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A6E3ECD8-FC98-42E0-B5AD-AC9ECA775FBE"];

  return [v2 supportsCapability:v3];
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = a3;
      __int16 v11 = 2112;
      id v12 = a4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Got beginSyncSession call with coordinator %@ and session %@", (uint8_t *)&v9, 0x16u);
    }
  }
  if ([(IMDQuickSwitchController *)self _supportsQuickSwitchWithPairedDevice])
  {
    [(IMDQuickSwitchController *)self _initiateQuickSwitch];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "QuickSwitch. Pairing with older gizmo. Not supported", (uint8_t *)&v9, 2u);
      }
    }
    [(IMDQuickSwitchController *)self _quickSwitchCompleted:0];
  }
}

- (void)_notifyPSYWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)[(PSYSyncCoordinator *)[(IMDQuickSwitchController *)self syncCoordinator] activeSyncSession];
  int v5 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Calling back to PSY with success", buf, 2u);
      }
    }
    [v4 syncDidComplete];
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Calling back to PSY with failure", v8, 2u);
      }
    }
    [v4 syncDidFailWithError:0];
  }
}

- (void)_notifyPSYDataSent
{
  uint64_t v2 = [(PSYSyncCoordinator *)[(IMDQuickSwitchController *)self syncCoordinator] activeSyncSession];

  MEMORY[0x1F4181798](v2, sel_syncDidCompleteSending);
}

- (IDSService)quickSwitchIDSService
{
  return self->_quickSwitchIDSService;
}

- (void)setQuickSwitchIDSService:(id)a3
{
}

- (PSYSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
}

@end