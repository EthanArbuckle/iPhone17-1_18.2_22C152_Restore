@interface IMSimulatedChat
- (BOOL)_handleIncomingItem:(id)a3;
- (BOOL)shouldUseTimedAck;
- (IMSimulatedAccount)simulatedAccount;
- (IMSimulatedChat)initWithIncomingIDs:(id)a3 messageIDOffset:(unint64_t)a4 account:(id)a5;
- (IMSimulatedChatDelegate)delegate;
- (NSMutableArray)simulatedAttachments;
- (NSMutableDictionary)guidToMessageItemNeedingAckMap;
- (NSString)simulatedChatIdentifier;
- (NSString)simulatedDisplayName;
- (id)_messageWithGUID:(id)a3;
- (id)_messagesToProcessFromMessage:(id)a3;
- (id)account;
- (id)beginObservingHandleStatuses;
- (id)chatIdentifier;
- (id)daemonController;
- (id)displayName;
- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5;
- (int64_t)joinState;
- (unint64_t)currentMessageID;
- (void)_processMessage:(id)a3 receivingHandle:(id)a4 sendingHandle:(id)a5;
- (void)receiveDemoMessage:(id)a3;
- (void)sendMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGuidToMessageItemNeedingAckMap:(id)a3;
- (void)setSimulatedChatIdentifier:(id)a3;
- (void)setSimulatedDisplayName:(id)a3;
- (void)setUseTimedAck:(BOOL)a3;
- (void)simulateMessageDeliveryForGUID:(id)a3;
- (void)simulatedChat:(id)a3 didSendMessage:(id)a4;
- (void)simulatedDaemon:(id)a3 willSendBalloonPayload:(id)a4 attachments:(id)a5 messageGUID:(id)a6 bundleID:(id)a7;
@end

@implementation IMSimulatedChat

- (IMSimulatedChat)initWithIncomingIDs:(id)a3 messageIDOffset:(unint64_t)a4 account:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (qword_1E965E970 != -1) {
    dispatch_once(&qword_1E965E970, &unk_1EF8E54B8);
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = objc_msgSend_count(v8, v11, v12, v13);
  v17 = objc_msgSend_initWithCapacity_(v10, v15, v14, v16);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v18 = v8;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v51 != v23) {
          objc_enumerationMutation(v18);
        }
        v25 = objc_msgSend_imHandleWithID_alreadyCanonical_(v9, v21, *(void *)(*((void *)&v50 + 1) + 8 * i), 0);
        objc_msgSend_addObject_(v17, v26, (uint64_t)v25, v27);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v22);
  }

  v31 = objc_msgSend_stringGUID(NSString, v28, v29, v30);
  v49.receiver = self;
  v49.super_class = (Class)IMSimulatedChat;
  BYTE2(v48) = 0;
  LOWORD(v48) = 0;
  if ((unint64_t)objc_msgSend_count(v17, v32, v33, v34) <= 1) {
    v35 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:](&v49, sel__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_, v31, v9, 45, 0, 0, 0, 0, 0, v17, 1, v48);
  }
  else {
    v35 = -[IMChat _initWithGUID:account:style:roomName:displayName:lastAddressedHandle:lastAddressedSIMID:items:participants:isFiltered:hasHadSuccessfulQuery:isRecovered:isDeletingIncomingMessages:](&v49, sel__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_, v31, v9, 43, 0, 0, 0, 0, 0, v17, 1, v48);
  }
  v36 = v35;

  if (v36)
  {
    objc_storeStrong((id *)&v36->_simulatedAccount, a5);
    v36->_currentMessageID = a4;
    uint64_t v40 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v37, v38, v39);
    simulatedAttachments = v36->_simulatedAttachments;
    v36->_simulatedAttachments = (NSMutableArray *)v40;

    uint64_t v45 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v42, v43, v44);
    guidToMessageItemNeedingAckMap = v36->_guidToMessageItemNeedingAckMap;
    v36->_guidToMessageItemNeedingAckMap = (NSMutableDictionary *)v45;
  }
  return v36;
}

- (void)sendMessage:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  objc_msgSend__messagesToProcessFromMessage_(self, v4, (uint64_t)v36, v5);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v39, (uint64_t)v45, 16);
  if (v7)
  {
    uint64_t v9 = *(void *)v40;
    *(void *)&long long v8 = 138412290;
    long long v35 = v8;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * v10);
        if (IMOSLoggingEnabled())
        {
          uint64_t v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            uint64_t v16 = objc_msgSend_guid(v36, v13, v14, v15);
            *(_DWORD *)buf = v35;
            uint64_t v44 = v16;
            _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "sending demo message with messageGUID: %@", buf, 0xCu);
          }
        }
        v38.receiver = self;
        v38.super_class = (Class)IMSimulatedChat;
        -[IMChat sendMessage:](&v38, sel_sendMessage_, v11, v35);
        uint64_t v20 = objc_msgSend_participants(self, v17, v18, v19);
        v24 = objc_msgSend_firstObject(v20, v21, v22, v23);
        v28 = objc_msgSend_simulatedAccount(self, v25, v26, v27);
        v32 = objc_msgSend_loginHandle(v28, v29, v30, v31);
        objc_msgSend__processMessage_receivingHandle_sendingHandle_(self, v33, v11, (uint64_t)v24, v32);

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v39, (uint64_t)v45, 16);
    }
    while (v7);
  }
}

- (void)receiveDemoMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    long long v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend_guid(v4, v9, v10, v11);
      int v27 = 138412290;
      v28 = v12;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "receiving demo message with messageGUID: %@", (uint8_t *)&v27, 0xCu);
    }
  }
  uint64_t v13 = objc_msgSend_simulatedAccount(self, v5, v6, v7);
  v17 = objc_msgSend_loginHandle(v13, v14, v15, v16);
  v21 = objc_msgSend_participants(self, v18, v19, v20);
  v25 = objc_msgSend_firstObject(v21, v22, v23, v24);
  objc_msgSend__processMessage_receivingHandle_sendingHandle_(self, v26, (uint64_t)v4, (uint64_t)v17, v25);
}

- (void)_processMessage:(id)a3 receivingHandle:(id)a4 sendingHandle:(id)a5
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v92 = a4;
  id v94 = a5;
  v89 = v8;
  objc_msgSend__messagesToProcessFromMessage_(self, v9, (uint64_t)v8, v10);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v103, (uint64_t)v112, 16);
  if (v93)
  {
    uint64_t v91 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v93; ++i)
      {
        if (*(void *)v104 != v91) {
          objc_enumerationMutation(obj);
        }
        v96 = objc_msgSend__imMessageItem(*(void **)(*((void *)&v103 + 1) + 8 * i), v12, v13, v14);
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        uint64_t v18 = objc_msgSend_fileTransferGUIDs(v96, v15, v16, v17);
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v99, (uint64_t)v111, 16);
        if (v23)
        {
          uint64_t v24 = *(void *)v100;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v100 != v24) {
                objc_enumerationMutation(v18);
              }
              uint64_t v26 = *(void *)(*((void *)&v99 + 1) + 8 * j);
              int v27 = objc_msgSend_sharedInstance(IMFileTransferCenter, v20, v21, v22);
              uint64_t v30 = objc_msgSend_transferForGUID_(v27, v28, v26, v29);

              uint64_t v34 = objc_msgSend_simulatedAttachments(self, v31, v32, v33);
              long long v35 = [IMAttachment alloc];
              long long v39 = objc_msgSend_localPath(v30, v36, v37, v38);
              long long v41 = objc_msgSend_initWithPath_guid_(v35, v40, (uint64_t)v39, v26);
              objc_msgSend_addObject_(v34, v42, (uint64_t)v41, v43);
            }
            uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v99, (uint64_t)v111, 16);
          }
          while (v23);
        }

        v47 = objc_msgSend_simulatedAccount(self, v44, v45, v46);
        long long v51 = objc_msgSend_loginHandle(v47, v48, v49, v50);
        int isEqual = objc_msgSend_isEqual_(v94, v52, (uint64_t)v51, v53);

        if (isEqual) {
          uint64_t v58 = 36869;
        }
        else {
          uint64_t v58 = 36865;
        }
        ++self->_currentMessageID;
        uint64_t v59 = objc_msgSend_currentMessageID(self, v55, v56, v57);
        v60 = sub_1A4BCA9A0(v96, v58, v59, v94, v92, 0);
        guidToMessageItemNeedingAckMap = self->_guidToMessageItemNeedingAckMap;
        v65 = objc_msgSend_guid(v60, v62, v63, v64);
        objc_msgSend_setObject_forKeyedSubscript_(guidToMessageItemNeedingAckMap, v66, (uint64_t)v60, (uint64_t)v65);

        v70 = objc_msgSend_delegate(self, v67, v68, v69);
        objc_msgSend_simulatedChat_didSendMessage_(v70, v71, (uint64_t)self, (uint64_t)v60);

        if (objc_msgSend_shouldUseTimedAck(self, v72, v73, v74))
        {
          if (IMOSLoggingEnabled())
          {
            v75 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              v79 = objc_msgSend_numberWithDouble_(NSNumber, v76, v77, v78, 1.0);
              v83 = objc_msgSend_message(v96, v80, v81, v82);
              v87 = objc_msgSend_guid(v83, v84, v85, v86);
              *(_DWORD *)buf = 138412546;
              v108 = v79;
              __int16 v109 = 2112;
              v110 = v87;
              _os_log_impl(&dword_1A4AF7000, v75, OS_LOG_TYPE_INFO, "deliveryDelay: %@ for messageGUID: %@", buf, 0x16u);
            }
          }
          dispatch_time_t v88 = dispatch_time(0, 1000000000);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1A4BCB060;
          block[3] = &unk_1E5B7B130;
          block[4] = self;
          id v98 = v96;
          dispatch_after(v88, MEMORY[0x1E4F14428], block);
        }
      }
      uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v103, (uint64_t)v112, 16);
    }
    while (v93);
  }
}

- (void)simulateMessageDeliveryForGUID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "simulateMessageDeliveryForGUID: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(self->_guidToMessageItemNeedingAckMap, v5, (uint64_t)v4, v6);
  if (v10)
  {
    objc_msgSend__handleIncomingItem_(self, v8, (uint64_t)v10, v9);
    uint64_t v14 = objc_msgSend_delegate(self, v11, v12, v13);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      uint64_t v19 = objc_msgSend_delegate(self, v16, v17, v18);
      objc_msgSend_simulatedChat_didHandleItem_(v19, v20, (uint64_t)self, (uint64_t)v10);
    }
    objc_msgSend_removeObjectForKey_(self->_guidToMessageItemNeedingAckMap, v16, (uint64_t)v4, v18);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v4;
      _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "Did not find messageItem for messageGUID: %@. Nothing to process", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (id)_messagesToProcessFromMessage:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_hasDataDetectorResults(v4, v5, v6, v7))
  {
    objc_msgSend_messagesBySeparatingRichLinks(v4, v8, v9, v10);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v38, (uint64_t)v43, 16);
    if (v13)
    {
      uint64_t v17 = v13;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v11);
          }
          uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v21 = objc_msgSend_sender(v4, v14, v15, v16, (void)v38);
          objc_msgSend__updateSender_(v20, v22, (uint64_t)v21, v23);
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v38, (uint64_t)v43, 16);
      }
      while (v17);
    }
  }
  else
  {
    if (objc_msgSend_isStewieChat(self, v8, v9, v10)
      && (objc_msgSend_text(v4, v24, v25, v26),
          int v27 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_string(v27, v28, v29, v30),
          uint64_t v31 = objc_claimAutoreleasedReturnValue(),
          unint64_t v34 = objc_msgSend_lengthOfBytesUsingEncoding_(v31, v32, 4, v33),
          v31,
          v27,
          v34 >= 0xA1))
    {
      uint64_t v36 = objc_msgSend_messagesSeparatedByByteLength_(v4, v24, 160, v35);
    }
    else
    {
      id v42 = v4;
      uint64_t v36 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)&v42, 1);
    }
    id v11 = (id)v36;
  }

  return v11;
}

- (BOOL)_handleIncomingItem:(id)a3
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v130 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v145 = v130;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Handling item: %@", buf, 0xCu);
    }
  }
  if (objc_msgSend_associatedMessageType(v130, v3, v4, v5) == 2)
  {
    v128 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9);
    v129 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12);
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    objc_msgSend__items(self, v13, v14, v15);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v138, (uint64_t)v143, 16);
    if (!v17) {
      goto LABEL_32;
    }
    uint64_t v18 = *(void *)v139;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v139 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v138 + 1) + 8 * v19);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = v130;
          id v23 = v20;
          if (objc_msgSend_messageID(v23, v24, v25, v26))
          {
            uint64_t v30 = objc_msgSend_pluginSessionGUID(v23, v27, v28, v29);
            unint64_t v34 = objc_msgSend_associatedMessageGUID(v22, v31, v32, v33);
            if ((objc_msgSend_isEqualToString_(v30, v35, (uint64_t)v34, v36) & 1) == 0)
            {

              goto LABEL_18;
            }
            long long v40 = objc_msgSend_balloonBundleID(v23, v37, v38, v39);
            uint64_t v44 = objc_msgSend_balloonBundleID(v22, v41, v42, v43);
            int isEqualToString = objc_msgSend_isEqualToString_(v40, v45, (uint64_t)v44, v46);

            if (isEqualToString)
            {
              if (objc_msgSend_associatedMessageType(v23, v48, v49, v50) == 3)
              {
                uint64_t v30 = objc_msgSend_payloadData(v23, v51, v52, v53);
                objc_msgSend_addObject_(v129, v54, (uint64_t)v30, v55);
                goto LABEL_18;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_associatedMessageType(v23, v56, v57, v58) == 2)
              {
                id v59 = objc_alloc(MEMORY[0x1E4F6E5E0]);
                uint64_t v30 = objc_msgSend_initWithMessageItem_(v59, v60, (uint64_t)v23, v61);
                if (objc_msgSend_isFromMe(v23, v62, v63, v64))
                {
                  uint64_t v68 = objc_msgSend_simulatedAccount(self, v65, v66, v67);
                  objc_msgSend_loginHandle(v68, v69, v70, v71);
                }
                else
                {
                  uint64_t v68 = objc_msgSend_participants(self, v65, v66, v67);
                  objc_msgSend_firstObject(v68, v72, v73, v74);
                v75 = };
                if (objc_msgSend_isFromMe(v23, v76, v77, v78))
                {
                  uint64_t v82 = objc_msgSend_participants(self, v79, v80, v81);
                  objc_msgSend_firstObject(v82, v83, v84, v85);
                }
                else
                {
                  uint64_t v82 = objc_msgSend_simulatedAccount(self, v79, v80, v81);
                  objc_msgSend_loginHandle(v82, v86, v87, v88);
                v89 = };
                objc_msgSend__updateContextWithSenderHandle_otherHandle_(v30, v90, (uint64_t)v75, (uint64_t)v89);

                id v94 = objc_msgSend_associatedMessageGUID(v22, v91, v92, v93);
                objc_msgSend_setAssociatedMessageGUID_(v30, v95, (uint64_t)v94, v96);

                objc_msgSend_setAssociatedMessageType_(v30, v97, 3, v98);
                long long v102 = objc_msgSend_breadcrumbText(v22, v99, v100, v101);
                objc_msgSend_setBody_(v30, v103, (uint64_t)v102, v104);

                objc_msgSend_addObject_(v128, v105, (uint64_t)v30, v106);
                v110 = objc_msgSend_payloadData(v23, v107, v108, v109);
                objc_msgSend_addObject_(v129, v111, (uint64_t)v110, v112);

LABEL_18:
              }
            }
          }
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v138, (uint64_t)v143, 16);
      uint64_t v17 = v113;
      if (!v113)
      {
LABEL_32:

        long long v136 = 0u;
        long long v137 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        id v114 = v128;
        uint64_t v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v114, v115, (uint64_t)&v134, (uint64_t)v142, 16);
        if (v118)
        {
          uint64_t v119 = *(void *)v135;
          do
          {
            uint64_t v120 = 0;
            do
            {
              if (*(void *)v135 != v119) {
                objc_enumerationMutation(v114);
              }
              objc_msgSend__handleIncomingItem_(self, v116, *(void *)(*((void *)&v134 + 1) + 8 * v120++), v117);
            }
            while (v118 != v120);
            uint64_t v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v114, v116, (uint64_t)&v134, (uint64_t)v142, 16);
          }
          while (v118);
        }

        if (objc_msgSend_count(v129, v121, v122, v123)) {
          objc_msgSend_setConsumedSessionPayloads_(v130, v124, (uint64_t)v129, v125);
        }

        break;
      }
    }
  }
  v133.receiver = self;
  v133.super_class = (Class)IMSimulatedChat;
  BOOL v126 = [(IMChat *)&v133 _handleIncomingItem:v130];

  return v126;
}

- (id)chatIdentifier
{
  uint64_t v5 = objc_msgSend_simulatedChatIdentifier(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_length(v5, v6, v7, v8);

  if (!v9)
  {
    uint64_t v13 = objc_msgSend_participants(self, v10, v11, v12);
    if (objc_msgSend_count(v13, v14, v15, v16) == 1)
    {
      uint64_t v20 = objc_msgSend_firstObject(v13, v17, v18, v19);
      uint64_t v24 = objc_msgSend_ID(v20, v21, v22, v23);
      objc_msgSend_setSimulatedChatIdentifier_(self, v25, (uint64_t)v24, v26);
    }
    else
    {
      uint64_t v20 = objc_msgSend_stringGUID(NSString, v17, v18, v19);
      objc_msgSend_setSimulatedChatIdentifier_(self, v27, (uint64_t)v20, v28);
    }
  }

  return (id)objc_msgSend_simulatedChatIdentifier(self, v10, v11, v12);
}

- (id)account
{
  return self->_simulatedAccount;
}

- (id)displayName
{
  return self->_simulatedDisplayName;
}

- (void)setDisplayName:(id)a3
{
  uint64_t v4 = (const char *)a3;
  uint64_t simulatedDisplayName = (uint64_t)self->_simulatedDisplayName;
  if ((const char *)simulatedDisplayName != v4)
  {
    uint64_t v16 = (char *)v4;
    uint64_t simulatedDisplayName = objc_msgSend_isEqualToString_((void *)simulatedDisplayName, v4, (uint64_t)v4, v5);
    uint64_t v4 = v16;
    if ((simulatedDisplayName & 1) == 0)
    {
      uint64_t v9 = (NSString *)objc_msgSend_copy(v16, v16, v7, v8);
      uint64_t v10 = self->_simulatedDisplayName;
      self->_uint64_t simulatedDisplayName = v9;

      uint64_t v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
      objc_msgSend_postNotificationName_object_(v14, v15, @"__kIMChatDisplayNameChangedNotification", (uint64_t)self);

      uint64_t v4 = v16;
    }
  }

  MEMORY[0x1F41817F8](simulatedDisplayName, v4);
}

- (int64_t)joinState
{
  return 3;
}

- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5
{
  return (id)objc_msgSend_stringGUID(NSString, a2, (uint64_t)a3, a4, a5);
}

- (void)simulatedChat:(id)a3 didSendMessage:(id)a4
{
  ++self->_currentMessageID;
  id v5 = a4;
  uint64_t v9 = objc_msgSend_currentMessageID(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_participants(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_firstObject(v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_simulatedAccount(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_loginHandle(v21, v22, v23, v24);
  sub_1A4BCA9A0(v5, 1, v9, v17, v25, 1);
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__handleIncomingItem_(self, v26, (uint64_t)v28, v27);
}

- (void)simulatedDaemon:(id)a3 willSendBalloonPayload:(id)a4 attachments:(id)a5 messageGUID:(id)a6 bundleID:(id)a7
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v14 = objc_msgSend__messageWithGUID_(self, v12, (uint64_t)a6, v13);
  uint64_t v18 = (void *)v14;
  if (v14)
  {
    uint64_t v63 = (void *)v14;
    uint64_t v64 = self;
    uint64_t v66 = (uint64_t)v10;
    uint64_t v19 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v15, v16, v17);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v65 = v11;
    id obj = v11;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v68, (uint64_t)v72, 16);
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v69;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v69 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void **)(*((void *)&v68 + 1) + 8 * v24);
          uint64_t v26 = IMSafeTemporaryDirectory();
          uint64_t v30 = objc_msgSend_stringGUID(NSString, v27, v28, v29);
          uint64_t v33 = objc_msgSend_URLByAppendingPathComponent_(v26, v31, (uint64_t)v30, v32);
          uint64_t v37 = objc_msgSend_path(v33, v34, v35, v36);

          objc_msgSend_writeToFile_atomically_(v25, v38, (uint64_t)v37, 1);
          uint64_t v42 = objc_msgSend_sharedInstance(IMFileTransferCenter, v39, v40, v41);
          uint64_t v45 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v43, (uint64_t)v37, v44);
          int v48 = objc_msgSend_createNewOutgoingTransferWithLocalFileURL_(v42, v46, (uint64_t)v45, v47);
          objc_msgSend_addObject_(v19, v49, (uint64_t)v48, v50);

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v68, (uint64_t)v72, 16);
      }
      while (v22);
    }

    uint64_t v18 = v63;
    id v10 = (id)v66;
    objc_msgSend_setPayloadData_(v63, v52, v66, v53);
    objc_msgSend_setFileTransferGUIDs_(v63, v54, (uint64_t)v19, v55);
    objc_msgSend__handleIncomingItem_(v64, v56, (uint64_t)v63, v57);
    uint64_t v61 = objc_msgSend_delegate(v64, v58, v59, v60);
    objc_msgSend_simulatedChat_didSendMessage_(v61, v62, (uint64_t)v64, (uint64_t)v63);

    id v11 = v65;
  }
}

- (id)_messageWithGUID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = objc_msgSend__items(self, v5, v6, v7, 0);
  id v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_guid(v16, v10, v11, v12);
        if (objc_msgSend_isEqualToString_(v17, v18, (uint64_t)v4, v19))
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v13 = v16;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v13);
  }
LABEL_12:

  return v13;
}

- (id)daemonController
{
  return 0;
}

- (id)beginObservingHandleStatuses
{
  return 0;
}

- (IMSimulatedChatDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMSimulatedChatDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldUseTimedAck
{
  return self->_useTimedAck;
}

- (void)setUseTimedAck:(BOOL)a3
{
  self->_useTimedAck = a3;
}

- (IMSimulatedAccount)simulatedAccount
{
  return self->_simulatedAccount;
}

- (unint64_t)currentMessageID
{
  return self->_currentMessageID;
}

- (NSString)simulatedChatIdentifier
{
  return self->_simulatedChatIdentifier;
}

- (void)setSimulatedChatIdentifier:(id)a3
{
}

- (NSMutableArray)simulatedAttachments
{
  return self->_simulatedAttachments;
}

- (NSString)simulatedDisplayName
{
  return self->_simulatedDisplayName;
}

- (void)setSimulatedDisplayName:(id)a3
{
}

- (NSMutableDictionary)guidToMessageItemNeedingAckMap
{
  return self->_guidToMessageItemNeedingAckMap;
}

- (void)setGuidToMessageItemNeedingAckMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidToMessageItemNeedingAckMap, 0);
  objc_storeStrong((id *)&self->_simulatedDisplayName, 0);
  objc_storeStrong((id *)&self->_simulatedAttachments, 0);
  objc_storeStrong((id *)&self->_simulatedChatIdentifier, 0);
  objc_storeStrong((id *)&self->_simulatedAccount, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end