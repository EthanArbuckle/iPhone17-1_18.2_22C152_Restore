@interface IMAutomationMessageSend
- (IMAutomationMessageSend)init;
- (NSMutableDictionary)sentMessageInfo;
- (NSMutableSet)pendingSendGUIDs;
- (id)_sendIMMessage:(id)a3 chat:(id)a4 service:(id)a5 timeOut:(double)a6 resultDict:(id)a7 error:(id *)a8;
- (id)appendFilePathsWithGUIDs:(id)a3 withText:(id)a4;
- (id)clearAttachmentsUploadedToCloudkit;
- (id)copyFilePathsToTmpLocation:(id)a3;
- (id)createIMMessageToSendWithMessage:(id)a3 filePaths:(id)a4 bundleID:(id)a5 attributionInfoName:(id)a6 isAudioMessage:(BOOL)a7 threadIdentifier:(id)a8;
- (id)deleteAttachmentWithMessageGUID:(id)a3 andFilePathIndex:(int64_t)a4;
- (id)dictionaryFromGUID:(id)a3;
- (id)fileSizeForMessageGUID:(id)a3 withFilePathIndex:(int64_t)a4;
- (id)loadHighResolutionFileForMessageGUID:(id)a3 withFilePathIndex:(int64_t)a4;
- (id)sendIMMessage:(id)a3 chat:(id)a4 timeOut:(double)a5 resultDict:(id)a6 error:(id *)a7;
- (id)sendMessage:(id)a3 destinationID:(id)a4 filePaths:(id)a5 groupID:(id)a6 bundleID:(id)a7 attributionInfoName:(id)a8 service:(id)a9 timeOut:(double)a10 error:(id *)a11;
- (id)sendMessage:(id)a3 destinationID:(id)a4 filePaths:(id)a5 groupID:(id)a6 service:(id)a7 timeOut:(double)a8 error:(id *)a9;
- (id)sendMessage:(id)a3 destinationID:(id)a4 filePaths:(id)a5 isAudioMessage:(BOOL)a6 groupID:(id)a7 bundleID:(id)a8 attributionInfoName:(id)a9 service:(id)a10 timeOut:(double)a11 threadIdentifier:(id)a12 error:(id *)a13;
- (id)sendMessage:(id)a3 destinationID:(id)a4 timeOut:(double)a5 threadIdentifier:(id)a6 error:(id *)a7;
- (id)uploadAttachmentToCloudkitWithMessageGUID:(id)a3 andFilePathIndex:(int64_t)a4;
- (void)deleteTmpFilePath:(id)a3;
- (void)setPendingSendGUIDs:(id)a3;
- (void)setSentMessageInfo:(id)a3;
@end

@implementation IMAutomationMessageSend

- (IMAutomationMessageSend)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMAutomationMessageSend;
  v2 = [(IMAutomationMessageSend *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingSendGUIDs = v2->_pendingSendGUIDs;
    v2->_pendingSendGUIDs = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sentMessageInfo = v2->_sentMessageInfo;
    v2->_sentMessageInfo = v5;
  }
  return v2;
}

- (id)createIMMessageToSendWithMessage:(id)a3 filePaths:(id)a4 bundleID:(id)a5 attributionInfoName:(id)a6 isAudioMessage:(BOOL)a7 threadIdentifier:(id)a8
{
  BOOL v75 = a7;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v12 = a4;
  id v13 = a5;
  id v83 = a6;
  id v77 = a8;
  id v82 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (objc_msgSend_count(v12, v14, v15, v16))
  {
    unint64_t v20 = 0;
    uint64_t v81 = *MEMORY[0x1E4F6D3E0];
    uint64_t v80 = *MEMORY[0x1E4F6D3D0];
    uint64_t v79 = *MEMORY[0x1E4F6D3C8];
    do
    {
      v21 = (void *)MEMORY[0x1E4F1CB10];
      v22 = objc_msgSend_objectAtIndex_(v12, v17, v20, v19);
      v25 = objc_msgSend_fileURLWithPath_(v21, v23, (uint64_t)v22, v24);

      v29 = objc_msgSend_sharedInstance(IMFileTransferCenter, v26, v27, v28);
      v32 = objc_msgSend_createNewOutgoingTransferWithLocalFileURL_(v29, v30, (uint64_t)v25, v31);

      if (objc_msgSend_length(v13, v33, v34, v35) && objc_msgSend_length(v83, v36, v37, v38))
      {
        v40 = objc_msgSend_sharedInstance(IMFileTransferCenter, v36, v39, v38);
        v43 = objc_msgSend_transferForGUID_(v40, v41, (uint64_t)v32, v42);

        v44 = IMBalloonExtensionIDWithSuffix();
        if (IMOSLoggingEnabled())
        {
          v46 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v87 = v44;
            __int16 v88 = 2112;
            id v89 = v83;
            __int16 v90 = 2112;
            v91 = v32;
            _os_log_impl(&dword_1A4AF7000, v46, OS_LOG_TYPE_INFO, "createIMMessageToSendWithMessage, setting bundleID value to %@ and attribution info name %@ on transferGUID %@", buf, 0x20u);
          }
        }
        v84[0] = v81;
        v84[1] = v80;
        v85[0] = v44;
        v85[1] = v83;
        v84[2] = v79;
        v85[2] = &unk_1EF914578;
        v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)v85, (uint64_t)v84, 3);
        objc_msgSend_setAttributionInfo_(v43, v48, (uint64_t)v47, v49);

        if (IMOSLoggingEnabled())
        {
          v50 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            v54 = objc_msgSend_attributionInfo(v43, v51, v52, v53);
            *(_DWORD *)buf = 138412290;
            v87 = v54;
            _os_log_impl(&dword_1A4AF7000, v50, OS_LOG_TYPE_INFO, "createIMMessageToSendWithMessage, attribution info %@", buf, 0xCu);
          }
        }
      }
      objc_msgSend_addObject_(v82, v36, (uint64_t)v32, v38);
      v58 = objc_msgSend_sharedInstance(IMFileTransferCenter, v55, v56, v57);
      objc_msgSend_registerTransferWithDaemon_(v58, v59, (uint64_t)v32, v60);

      ++v20;
    }
    while (objc_msgSend_count(v12, v61, v62, v63) > v20);
  }
  if (objc_msgSend_count(v82, v17, v18, v19))
  {
    v68 = objc_msgSend_appendFilePathsWithGUIDs_withText_(self, v64, (uint64_t)v82, (uint64_t)v78);
    if (v75) {
      objc_msgSend_instantMessageWithText_messageSubject_fileTransferGUIDs_flags_threadIdentifier_(IMMessage, v67, (uint64_t)v68, 0, v82, 2097157, v77);
    }
    else {
    uint64_t v69 = objc_msgSend_instantMessageWithText_messageSubject_fileTransferGUIDs_flags_threadIdentifier_(IMMessage, v67, (uint64_t)v68, 0, v82, 5, v77);
    }
    goto LABEL_22;
  }
  if (objc_msgSend_length(v78, v64, v65, v66))
  {
    id v70 = objc_alloc(MEMORY[0x1E4F28B18]);
    v68 = objc_msgSend_initWithString_attributes_(v70, v71, (uint64_t)v78, 0);
    uint64_t v69 = objc_msgSend_instantMessageWithText_flags_threadIdentifier_(IMMessage, v72, (uint64_t)v68, 5, v77);
LABEL_22:
    v73 = (void *)v69;

    goto LABEL_23;
  }
  v73 = 0;
LABEL_23:

  return v73;
}

- (id)sendMessage:(id)a3 destinationID:(id)a4 filePaths:(id)a5 groupID:(id)a6 service:(id)a7 timeOut:(double)a8 error:(id *)a9
{
  return (id)objc_msgSend_sendMessage_destinationID_filePaths_groupID_bundleID_attributionInfoName_service_timeOut_error_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, 0, 0, 10.0, a7, a9);
}

- (id)sendMessage:(id)a3 destinationID:(id)a4 filePaths:(id)a5 groupID:(id)a6 bundleID:(id)a7 attributionInfoName:(id)a8 service:(id)a9 timeOut:(double)a10 error:(id *)a11
{
  return (id)objc_msgSend_sendMessage_destinationID_filePaths_isAudioMessage_groupID_bundleID_attributionInfoName_service_timeOut_threadIdentifier_error_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, a6, a7, a10, a8, a9, 0, a11);
}

- (id)sendMessage:(id)a3 destinationID:(id)a4 timeOut:(double)a5 threadIdentifier:(id)a6 error:(id *)a7
{
  return (id)objc_msgSend_sendMessage_destinationID_filePaths_isAudioMessage_groupID_bundleID_attributionInfoName_service_timeOut_threadIdentifier_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, 0, 0, a6, a7);
}

- (id)sendMessage:(id)a3 destinationID:(id)a4 filePaths:(id)a5 isAudioMessage:(BOOL)a6 groupID:(id)a7 bundleID:(id)a8 attributionInfoName:(id)a9 service:(id)a10 timeOut:(double)a11 threadIdentifier:(id)a12 error:(id *)a13
{
  BOOL v74 = a6;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v79 = a4;
  id v20 = a5;
  id v21 = a7;
  id v77 = a8;
  id v78 = a9;
  id v76 = a10;
  id v75 = a12;
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413570;
      id v81 = v19;
      __int16 v82 = 2112;
      id v83 = v79;
      __int16 v84 = 2112;
      id v85 = v20;
      __int16 v86 = 2112;
      id v87 = v77;
      __int16 v88 = 2112;
      id v89 = v78;
      __int16 v90 = 2048;
      double v91 = a11;
      _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "sendMessageSync messageText %@ handle %@ filePaths %@ bundleID %@ attributionInfoName %@ timeout: %f", buf, 0x3Eu);
    }
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  uint64_t v27 = objc_msgSend_length(v21, v24, v25, v26);
  uint64_t v31 = objc_msgSend_length(v19, v28, v29, v30);
  if (v27)
  {
    if (v20 && v31)
    {
LABEL_8:
      BOOL v35 = v27 == 0;
      uint64_t v72 = objc_msgSend_copyFilePathsToTmpLocation_(self, v32, (uint64_t)v20, v34);
      if (v76) {
        objc_msgSend_serviceWithInternalName_(IMServiceImpl, v36, (uint64_t)v76, v37, v72);
      }
      else {
      v41 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v36, *MEMORY[0x1E4F6E1B0], v37, v72);
      }
      if (v35)
      {
        v54 = objc_msgSend_sharedInstance(IMAccountController, v38, v39, v40);
        uint64_t v42 = objc_msgSend_bestAccountForService_(v54, v55, (uint64_t)v41, v56);

        v59 = objc_msgSend_imHandleWithID_(v42, v57, (uint64_t)v79, v58);
        uint64_t v63 = objc_msgSend_sharedRegistry(IMChatRegistry, v60, v61, v62);
        v45 = objc_msgSend_chatWithHandle_(v63, v64, (uint64_t)v59, v65);
      }
      else
      {
        uint64_t v42 = objc_msgSend_sharedRegistry(IMChatRegistry, v38, v39, v40);
        v45 = objc_msgSend_existingChatWithGroupID_(v42, v43, (uint64_t)v21, v44);
      }

      if (v45)
      {
        v67 = objc_msgSend_createIMMessageToSendWithMessage_filePaths_bundleID_attributionInfoName_isAudioMessage_threadIdentifier_(self, v66, (uint64_t)v19, (uint64_t)v73, v77, v78, v74, v75);
        uint64_t v69 = objc_msgSend__sendIMMessage_chat_service_timeOut_resultDict_error_(self, v68, (uint64_t)v67, (uint64_t)v45, v41, v23, a13, a11);

        id v23 = (id)v69;
      }
      if (IMOSLoggingEnabled())
      {
        id v70 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v81 = v23;
          _os_log_impl(&dword_1A4AF7000, v70, OS_LOG_TYPE_INFO, "SendMessage returning resultDir:%@", buf, 0xCu);
        }
      }
      id v53 = v23;

      goto LABEL_34;
    }
  }
  else
  {
    BOOL v46 = v20 == 0;
    if (objc_msgSend_length(v19, v32, v33, v34)) {
      BOOL v46 = 0;
    }
    if (objc_msgSend_length(v79, v47, v48, v49)) {
      char v50 = v46;
    }
    else {
      char v50 = 1;
    }
    if ((v50 & 1) == 0) {
      goto LABEL_8;
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v52 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "Invalid parameters", buf, 2u);
    }
  }
  if (a13)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v51, @"com.apple.private.IMCore.IMAutomationMessageSend", 2, 0);
    *a13 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v53 = v23;
LABEL_34:

  return v53;
}

- (id)sendIMMessage:(id)a3 chat:(id)a4 timeOut:(double)a5 resultDict:(id)a6 error:(id *)a7
{
  return (id)objc_msgSend__sendIMMessage_chat_service_timeOut_resultDict_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, a6, a7, a5);
}

- (id)_sendIMMessage:(id)a3 chat:(id)a4 service:(id)a5 timeOut:(double)a6 resultDict:(id)a7 error:(id *)a8
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v19 = (__CFString *)objc_msgSend_initWithDictionary_(v16, v17, (uint64_t)v15, v18);
  id v23 = objc_msgSend_guid(v12, v20, v21, v22);
  objc_msgSend_setObject_forKey_(v19, v24, (uint64_t)v23, @"GUID");
  uint64_t v28 = objc_msgSend_pendingSendGUIDs(self, v25, v26, v27);
  objc_msgSend_addObject_(v28, v29, (uint64_t)v23, v30);

  uint64_t v34 = objc_msgSend_sharedRegistry(IMChatRegistry, v31, v32, v33);
  objc_msgSend__setPostMessageSentNotifications_(v34, v35, 1, v36);

  objc_msgSend_refreshServiceForSending(v13, v37, v38, v39);
  if (IMOSLoggingEnabled())
  {
    uint64_t v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_plainBody(v12, v43, v44, v45);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isTypingMessage(v12, v47, v48, v49)) {
        id v53 = @"YES";
      }
      else {
        id v53 = @"NO";
      }
      v54 = NSNumber;
      uint64_t v55 = objc_msgSend_flags(v12, v50, v51, v52);
      uint64_t v58 = objc_msgSend_numberWithUnsignedLongLong_(v54, v56, v55, v57);
      int v61 = 138412802;
      id v62 = v46;
      __int16 v63 = 2112;
      v64 = v53;
      __int16 v65 = 2112;
      uint64_t v66 = v58;
      _os_log_impl(&dword_1A4AF7000, v42, OS_LOG_TYPE_INFO, "messageToSend body:%@ isTyping message %@ flags %@", (uint8_t *)&v61, 0x20u);
    }
  }
  if (v14) {
    objc_msgSend_sendMessage_onService_(v13, v40, (uint64_t)v12, (uint64_t)v14);
  }
  else {
    objc_msgSend_sendMessage_(v13, v40, (uint64_t)v12, v41);
  }
  if (IMOSLoggingEnabled())
  {
    v59 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      int v61 = 138412546;
      id v62 = v23;
      __int16 v63 = 2112;
      v64 = v19;
      _os_log_impl(&dword_1A4AF7000, v59, OS_LOG_TYPE_INFO, "Sent IMmessage %@ resultDir:%@", (uint8_t *)&v61, 0x16u);
    }
  }

  return v19;
}

- (id)loadHighResolutionFileForMessageGUID:(id)a3 withFilePathIndex:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1A4B3457C;
  v17 = sub_1A4B343A4;
  id v18 = 0;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = (const void *)IMDMessageRecordCopyMessageForGUID();
  if (v6)
  {
    CFArrayRef v7 = (const __CFArray *)IMDMessageRecordCopyAttachments();
    CFArrayRef v8 = v7;
    if (a4 < 0 || !v7)
    {
      if (!v7)
      {
LABEL_8:
        CFRelease(v6);
        goto LABEL_9;
      }
    }
    else if (CFArrayGetCount(v7) > a4)
    {
      CFArrayGetValueAtIndex(v8, a4);
      uint64_t v12 = 0;
      CFTypeRef cf = 0;
      _IMDAttachmentRecordBulkCopy();
    }
    CFRelease(v8);
    goto LABEL_8;
  }
LABEL_9:
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (id)deleteAttachmentWithMessageGUID:(id)a3 andFilePathIndex:(int64_t)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return v4;
}

- (id)clearAttachmentsUploadedToCloudkit
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return v2;
}

- (id)uploadAttachmentToCloudkitWithMessageGUID:(id)a3 andFilePathIndex:(int64_t)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return v4;
}

- (id)fileSizeForMessageGUID:(id)a3 withFilePathIndex:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = IMDMessageRecordCopyMessageForGUID();
  if (!v7)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v6, v8, @"Could not find IMDMessageRecordRef with message guid", @"error");
    goto LABEL_10;
  }
  id v9 = (const void *)v7;
  CFArrayRef v10 = (const __CFArray *)IMDMessageRecordCopyAttachments();
  CFArrayRef v11 = v10;
  if ((a4 & 0x8000000000000000) == 0 && v10)
  {
    if (CFArrayGetCount(v10) > a4)
    {
      CFArrayGetValueAtIndex(v11, a4);
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      _IMDAttachmentRecordBulkCopy();
    }
    goto LABEL_8;
  }
  if (v10) {
LABEL_8:
  }
    CFRelease(v11);
  CFRelease(v9);
LABEL_10:

  return v6;
}

- (id)dictionaryFromGUID:(id)a3
{
  id v3 = a3;
  if (qword_1E965EA48 != -1) {
    dispatch_once(&qword_1E965EA48, &unk_1EF8E55D8);
  }
  if (qword_1E965EA58 != -1) {
    dispatch_once(&qword_1E965EA58, &unk_1EF8E4390);
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = off_1E965EA40(v3);
  if (v5)
  {
    id v6 = (const void *)v5;
    uint64_t v88 = 0;
    uint64_t v89 = 0;
    uint64_t v86 = 0;
    CFTypeRef v87 = 0;
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    CFTypeRef v82 = 0;
    uint64_t v83 = 0;
    CFTypeRef v80 = 0;
    CFTypeRef v81 = 0;
    CFTypeRef v78 = 0;
    CFTypeRef v79 = 0;
    uint64_t v76 = 0;
    CFTypeRef v77 = 0;
    uint64_t v74 = 0;
    CFTypeRef v75 = 0;
    uint64_t v73 = 0;
    __int16 v72 = 0;
    uint64_t v70 = 0;
    CFTypeRef v71 = 0;
    CFTypeRef v68 = 0;
    uint64_t v69 = 0;
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    CFTypeRef v62 = 0;
    uint64_t v63 = 0;
    uint64_t v61 = 0;
    long long v60 = 0u;
    uint64_t v58 = 0;
    CFTypeRef v59 = 0;
    uint64_t v56 = 0;
    CFTypeRef cf = 0;
    CFTypeRef v55 = 0;
    off_1E965EA50(v5, &v69, &v89, &v88, &v87, &v86, &v85, &v84, &v83, &v82, &v81, &v80, &v79, &v78, &v77, &v76, &v75, &v74, &v73,
      (char *)&v72 + 1,
      &v72,
      &v71,
      &v67,
      &v68,
      &v64,
      &v65,
      &v66,
      &v70,
      &v63,
      &v62,
      &v61,
      &v60,
      0,
      &cf,
      &v59,
      &v58,
      &v56,
      0,
      0,
      0,
      0,
      &v55,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0);
    if (v87)
    {
      if (v69)
      {
        id v9 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v69, v8);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v10, (uint64_t)v9, @"itemType");
      }
      if (v89)
      {
        CFArrayRef v11 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v89, v8);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, @"messageID");
      }
      if (v88)
      {
        uint64_t v13 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v88, v8);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, @"replaceID");
      }
      if (v87) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v87, @"GUID");
      }
      if (v86)
      {
        uint64_t v15 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v86, v8);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v16, (uint64_t)v15, @"date");
      }
      if (v85)
      {
        v17 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v85, v8);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v18, (uint64_t)v17, @"date-read");
      }
      if (v84)
      {
        uint64_t v19 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v84, v8);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v20, (uint64_t)v19, @"date-delivered");
      }
      if (v83)
      {
        uint64_t v21 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v83, v8);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v22, (uint64_t)v21, @"datePlayed");
      }
      if (v82) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v82, @"body");
      }
      if (v81) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v81, @"attributedBody");
      }
      if (v80) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v80, @"flags");
      }
      if (v79) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v79, @"service");
      }
      if (v78) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v78, @"account");
      }
      if (v77) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v77, @"accountGUID");
      }
      if (v76)
      {
        id v23 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v76, v8);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v24, (uint64_t)v23, @"handleID");
      }
      if (v75) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v75, @"messageSubject");
      }
      if (v74)
      {
        uint64_t v25 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v74, v8);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v26, (uint64_t)v25, @"error");
      }
      if (v73)
      {
        uint64_t v27 = objc_msgSend_numberWithLongLong_(NSNumber, v7, v73, v8);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v28, (uint64_t)v27, @"type");
      }
      uint64_t v29 = objc_msgSend_numberWithBool_(NSNumber, v7, HIBYTE(v72) != 0, v8);
      objc_msgSend_setObject_forKeyedSubscript_(v4, v30, (uint64_t)v29, @"hasAttachments");

      uint64_t v33 = objc_msgSend_numberWithBool_(NSNumber, v31, (_BYTE)v72 != 0, v32);
      objc_msgSend_setObject_forKeyedSubscript_(v4, v34, (uint64_t)v33, @"wasDDScanned");

      if (v71) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v35, (uint64_t)v71, @"roomnames");
      }
      if (v67)
      {
        uint64_t v37 = objc_msgSend_numberWithLongLong_(NSNumber, v35, v67, v36);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v38, (uint64_t)v37, @"otherHandleID");
      }
      if (v68) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v35, (uint64_t)v68, @"groupTitle");
      }
      if (v64)
      {
        uint64_t v39 = objc_msgSend_numberWithLongLong_(NSNumber, v35, v64, v36);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v40, (uint64_t)v39, @"groupActionType");
      }
      if (v65)
      {
        uint64_t v41 = objc_msgSend_numberWithLongLong_(NSNumber, v35, v65, v36);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v42, (uint64_t)v41, @"shareStatus");
      }
      if (v66)
      {
        v43 = objc_msgSend_numberWithLongLong_(NSNumber, v35, v66, v36);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v44, (uint64_t)v43, @"shareDirection");
      }
      if (v70)
      {
        uint64_t v45 = objc_msgSend_numberWithLongLong_(NSNumber, v35, v70, v36);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v46, (uint64_t)v45, @"expireState");
      }
      if (v63)
      {
        v47 = objc_msgSend_numberWithLongLong_(NSNumber, v35, v63, v36);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v48, (uint64_t)v47, @"messageActionType");
      }
      if (v62) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v35, (uint64_t)v62, @"associatedMessageGUID");
      }
      if (v61)
      {
        uint64_t v49 = objc_msgSend_numberWithLongLong_(NSNumber, v35, v61, v36);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v50, (uint64_t)v49, @"associatedMessageType");
      }
      if (cf) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v35, (uint64_t)cf, @"payloadData");
      }
      if (v59) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v35, (uint64_t)v59, @"expressiveSendStyleID");
      }
      if (v58)
      {
        uint64_t v51 = objc_msgSend_numberWithLongLong_(NSNumber, v35, v58, v36);
        objc_msgSend_setObject_forKeyedSubscript_(v4, v52, (uint64_t)v51, @"timePlayedExpressiveSend");
      }
      if (v56) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v35, v56, @"messageSummaryInfo");
      }
      if (v55) {
        objc_msgSend_setObject_forKeyedSubscript_(v4, v35, (uint64_t)v55, @"destinationCallerID");
      }
      if (v87) {
        CFRelease(v87);
      }
    }
    if (v82) {
      CFRelease(v82);
    }
    if (v68) {
      CFRelease(v68);
    }
    if (v81) {
      CFRelease(v81);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v80) {
      CFRelease(v80);
    }
    if (v79) {
      CFRelease(v79);
    }
    if (v78) {
      CFRelease(v78);
    }
    if (v77) {
      CFRelease(v77);
    }
    if (v75) {
      CFRelease(v75);
    }
    if (v71) {
      CFRelease(v71);
    }
    if (v62) {
      CFRelease(v62);
    }
    if (v59) {
      CFRelease(v59);
    }
    if (v55) {
      CFRelease(v55);
    }
    CFRelease(v6);
  }
  id v53 = v4;

  return v53;
}

- (NSMutableSet)pendingSendGUIDs
{
  return self->_pendingSendGUIDs;
}

- (void)setPendingSendGUIDs:(id)a3
{
}

- (NSMutableDictionary)sentMessageInfo
{
  return self->_sentMessageInfo;
}

- (void)setSentMessageInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentMessageInfo, 0);

  objc_storeStrong((id *)&self->_pendingSendGUIDs, 0);
}

- (id)copyFilePathsToTmpLocation:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v44, (uint64_t)v51, 16);
  if (v7)
  {
    uint64_t v9 = *(void *)v45;
    *(void *)&long long v8 = 138412290;
    long long v39 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(obj);
        }
        CFArrayRef v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend_componentsSeparatedByString_(v11, v5, @"/", v6, v39);
        uint64_t v13 = IMSafeTemporaryDirectory();
        v17 = objc_msgSend_lastObject(v12, v14, v15, v16);
        char v50 = v17;
        uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)&v50, 1);
        uint64_t v22 = objc_msgSend_im_URLByAppendingPathComponents_(v13, v20, (uint64_t)v19, v21);
        uint64_t v26 = objc_msgSend_path(v22, v23, v24, v25);

        objc_msgSend_deleteTmpFilePath_(self, v27, (uint64_t)v26, v28);
        uint64_t v32 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v29, v30, v31);
        id v43 = 0;
        LODWORD(v17) = objc_msgSend_copyItemAtPath_toPath_error_(v32, v33, (uint64_t)v11, (uint64_t)v26, &v43);
        id v34 = v43;

        if (v17)
        {
          objc_msgSend_addObject_(v40, v35, (uint64_t)v26, v36);
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v39;
            id v49 = v34;
            _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "Error occurred copying attachment files to tmp path: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v44, (uint64_t)v51, 16);
    }
    while (v7);
  }

  return v40;
}

- (void)deleteTmpFilePath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v4, v5, v6);
  if (objc_msgSend_fileExistsAtPath_(v7, v8, (uint64_t)v3, v9))
  {
    uint64_t v13 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v10, v11, v12);
    id v18 = 0;
    char v15 = objc_msgSend_removeItemAtPath_error_(v13, v14, (uint64_t)v3, (uint64_t)&v18);
    id v16 = v18;

    if ((v15 & 1) == 0 && IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v16;
        _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Error occurred deleting tmp attachment file: %@", buf, 0xCu);
      }
    }
  }
  else
  {

    id v16 = 0;
  }
}

- (id)appendFilePathsWithGUIDs:(id)a3 withText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = objc_msgSend_length(v6, v9, v10, v11);
  id v16 = (uint64_t *)MEMORY[0x1E4F6C1F8];
  unint64_t v17 = 0x1E4F28000uLL;
  id v53 = v6;
  if (v12)
  {
    NSLog(&cfstr_ValidText.isa);
    id v20 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v18, 0, v19);
    objc_msgSend_setObject_forKey_(v8, v21, (uint64_t)v20, *v16);

    id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v24 = objc_msgSend_initWithString_attributes_(v22, v23, (uint64_t)v6, (uint64_t)v8);
    objc_msgSend_appendAttributedString_(v7, v25, (uint64_t)v24, v26);

    int v27 = 1;
  }
  else
  {
    int v27 = 0;
  }
  id v54 = v7;
  if (objc_msgSend_count(v5, v13, v14, v15))
  {
    unint64_t v30 = 0;
    uint64_t v31 = *v16;
    uint64_t v32 = *MEMORY[0x1E4F6C188];
    do
    {
      uint64_t v33 = objc_msgSend_objectAtIndex_(v5, v28, v30, v29);
      if (v33)
      {
        id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

        uint64_t v37 = objc_msgSend_numberWithUnsignedInteger_(*(void **)(v17 + 3792), v35, v27, v36);
        objc_msgSend_setObject_forKey_(v34, v38, (uint64_t)v37, v31);

        objc_msgSend_setObject_forKey_(v34, v39, (uint64_t)v33, v32);
        ++v27;
        __int16 v55 = -4;
        id v40 = [NSString alloc];
        uint64_t v42 = objc_msgSend_initWithCharacters_length_(v40, v41, (uint64_t)&v55, 1);
        id v43 = objc_alloc(MEMORY[0x1E4F28B18]);
        unint64_t v45 = v17;
        long long v46 = objc_msgSend_initWithString_attributes_(v43, v44, (uint64_t)v42, (uint64_t)v34);
        objc_msgSend_appendAttributedString_(v54, v47, (uint64_t)v46, v48);

        unint64_t v17 = v45;
        id v8 = v34;
      }

      ++v30;
    }
    while (objc_msgSend_count(v5, v49, v50, v51) > v30);
  }

  return v54;
}

@end