@interface IMEditMessageCommandProcessingPipelineComponent
- (IMDiMessagePipelineResources)pipelineResources;
- (IMEditMessageCommandProcessingPipelineComponent)initWithPipelineResources:(id)a3;
- (double)_messageEditReceivedTimeout;
- (double)_messageRetractionReceivedTimeoutEnforcingExactTimeoutInterval:(BOOL)a3;
- (double)_timeoutIntervalForEditType:(unint64_t)a3 enforceExactRetractionTimeoutInterval:(BOOL)a4;
- (id)_account;
- (id)_adaptiveImageGlyphFileTransferGUIDsInMessageItem:(id)a3;
- (id)_applyEditsToMessage:(id)a3 preEditFullMessageText:(id)a4 editType:(unint64_t)a5 editedPartIndex:(int64_t)a6 editedMessagePartText:(id)a7 shouldRetractSubject:(BOOL)a8 editTimestamp:(id)a9 chat:(id)a10 updatedAssociatedMessageItems:(id *)a11;
- (id)_idsAccount;
- (id)_messageStore;
- (id)runIndividuallyWithInput:(id)a3;
- (int64_t)_messageEditHistoryLimit;
@end

@implementation IMEditMessageCommandProcessingPipelineComponent

- (IMEditMessageCommandProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMEditMessageCommandProcessingPipelineComponent;
  v6 = [(IMEditMessageCommandProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pipelineResources, a3);
  }

  return v7;
}

- (id)_idsAccount
{
  v2 = [(IMEditMessageCommandProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 imdAccount];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 idsAccount];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_account
{
  v2 = [(IMEditMessageCommandProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 imdAccount];

  return v3;
}

- (id)_messageStore
{
  v2 = [(IMEditMessageCommandProcessingPipelineComponent *)self pipelineResources];
  v3 = [v2 messageStore];

  return v3;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v92 = a3;
  v88 = [v92 editCommandGUID];
  v91 = [v92 editedMessageGUID];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v105 = (uint64_t)v88;
      __int16 v106 = 2112;
      uint64_t v107 = (uint64_t)v91;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "<IMEditMessageCommandProcessingPipelineComponent> Started processing for EditMessageCommand editCommandGUID: %@ editedMessageGUID: %@", buf, 0x16u);
    }
  }
  if (IMGetCachedDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v105 = (uint64_t)v88;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "    Ignoring edit message command for message: %@", buf, 0xCu);
      }
    }
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v92];
    goto LABEL_109;
  }
  if ([v91 length])
  {
    v7 = [(IMEditMessageCommandProcessingPipelineComponent *)self _messageStore];
    v90 = [v7 messageWithGUID:v91];

    if (!v90)
    {
      v27 = IMLogHandleForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1D990441C();
      }

      id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
      v89 = (void *)[v28 initWithDomain:*MEMORY[0x1E4F6BE88] code:5 userInfo:0];
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v89];
      goto LABEL_108;
    }
    v89 = [v90 body];
    if (!v89)
    {
      uint64_t v8 = [v90 plainBody];
      objc_super v9 = (void *)v8;
      v10 = &stru_1F3398578;
      if (v8) {
        v10 = (__CFString *)v8;
      }
      v11 = v10;

      v89 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11];
    }
    v12 = [v90 sender];
    v81 = [v12 _stripFZIDPrefix];

    v13 = [v92 idsTrustedData];
    v14 = [v13 fromIdentifier];
    v80 = [v14 _stripFZIDPrefix];

    v15 = [v92 idsTrustedData];
    unsigned int v16 = [v15 isFromMe];

    unsigned int v17 = [v90 isFromMe];
    if ((v16 & v17 & 1) == 0 && ([v80 isEqualToString:v81] & 1) == 0)
    {
      v31 = IMLogHandleForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413314;
        uint64_t v105 = (uint64_t)v91;
        __int16 v106 = 2112;
        uint64_t v107 = (uint64_t)v80;
        __int16 v108 = 2112;
        v109 = v81;
        __int16 v110 = 2048;
        unint64_t v111 = v17;
        __int16 v112 = 2048;
        uint64_t v113 = v16;
        _os_log_error_impl(&dword_1D967A000, v31, OS_LOG_TYPE_ERROR, "Not allowing message edit for guid %@. Edit sender %@, original sender %@, original isFromMe %ld, edit isFromMe %ld", buf, 0x34u);
      }

      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      v82 = (void *)[v32 initWithDomain:*MEMORY[0x1E4F6BE88] code:13 userInfo:0];
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v82];
      goto LABEL_107;
    }
    v18 = [(IMEditMessageCommandProcessingPipelineComponent *)self _messageStore];
    v82 = [v18 chatsForMessageGUID:v91];

    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v105 = (uint64_t)v91;
        __int16 v106 = 2112;
        uint64_t v107 = (uint64_t)v82;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Found chats for messageID: %@  chats: %@", buf, 0x16u);
      }
    }
    if (![v82 count])
    {
      v29 = IMLogHandleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1D9904484();
      }

      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      v87 = (void *)[v30 initWithDomain:*MEMORY[0x1E4F6BE88] code:8 userInfo:0];
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v87];

      goto LABEL_107;
    }
    v86 = [v92 editedMessagePartBody];
    uint64_t v84 = [v92 editedMessagePartIndex];
    uint64_t v20 = [v92 editType];
    v79 = [v92 editedMessagePartFileTransferGUIDs];
    unsigned int v83 = [v92 shouldRetractMessageSubject];
    int v21 = [v92 hasEditTypeAndPartIndex];
    if ((unint64_t)(v20 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v22 = IMLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1D99044EC();
      }

      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      v85 = (void *)[v23 initWithDomain:*MEMORY[0x1E4F6BE88] code:9 userInfo:0];
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v85];
      goto LABEL_106;
    }
    int v33 = v21;
    v34 = (void *)MEMORY[0x1E4F1C9C8];
    v35 = [v92 timestamp];
    v85 = objc_msgSend(v34, "__im_iMessageDateFromTimeStamp:", v35);

    v77 = [v90 time];
    [v85 timeIntervalSinceDate:v77];
    double v37 = v36;
    [(IMEditMessageCommandProcessingPipelineComponent *)self _timeoutIntervalForEditType:v20 enforceExactRetractionTimeoutInterval:v33 ^ 1u];
    double v38 = fabs(v37);
    if (v38 > v39)
    {
      v40 = IMLogHandleForCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        uint64_t v70 = (uint64_t)*MEMORY[0x1E4F6D560];
        *(_DWORD *)buf = 134218754;
        uint64_t v105 = (uint64_t)v38;
        __int16 v106 = 2048;
        uint64_t v107 = v70;
        __int16 v108 = 2112;
        v109 = v77;
        __int16 v110 = 2112;
        unint64_t v111 = (unint64_t)v85;
        _os_log_error_impl(&dword_1D967A000, v40, OS_LOG_TYPE_ERROR, "Unable to apply edits, message edit timestamp exceeds maximum receive timeout. TimeBetweenOriginalAndEdit: %ld, MaximumInterval: %ld, OriginalDate: %@, EditedDate: %@", buf, 0x2Au);
      }

      id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
      v78 = (void *)[v41 initWithDomain:*MEMORY[0x1E4F6BE88] code:14 userInfo:0];
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v78];
LABEL_105:

LABEL_106:
LABEL_107:

LABEL_108:
      goto LABEL_109;
    }
    v78 = [v90 dateEdited];
    if (v78)
    {
      if ([v78 compare:v85] == 1)
      {
        v42 = IMLogHandleForCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_1D99045F0();
        }

        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        v75 = (void *)[v43 initWithDomain:*MEMORY[0x1E4F6BE88] code:15 userInfo:0];
        v6 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v75];

        goto LABEL_105;
      }
      if (IMOSLoggingEnabled())
      {
        v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v105 = (uint64_t)v85;
          __int16 v106 = 2112;
          uint64_t v107 = (uint64_t)v78;
          _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "Message has already been edited, processing newer edit. ThisEdit: %@, DateOfLastEdit: %@", buf, 0x16u);
        }
      }
    }
    v76 = [v90 historyForMessagePart:v84];
    v73 = [v76 lastObject];
    v74 = [v73 dateSent];
    if (v74)
    {
      if ([v74 compare:v85] == 1)
      {
        v45 = IMLogHandleForCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v105 = v84;
          __int16 v106 = 2112;
          uint64_t v107 = (uint64_t)v85;
          __int16 v108 = 2112;
          v109 = v74;
          _os_log_error_impl(&dword_1D967A000, v45, OS_LOG_TYPE_ERROR, "Unable to apply edits, message edit is older than previously processed edit for message part %ld. ThisEdit: %@, DateOfLastEdit: %@", buf, 0x20u);
        }

        id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v47 = (id)[v46 initWithDomain:*MEMORY[0x1E4F6BE88] code:15 userInfo:0];
        uint64_t v48 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v47];
        goto LABEL_103;
      }
      if (IMOSLoggingEnabled())
      {
        v49 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v105 = (uint64_t)v85;
          __int16 v106 = 2112;
          uint64_t v107 = (uint64_t)v74;
          _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_INFO, "Message part has already been edited, processing newer edit. ThisEdit: %@, DateOfLastPartEdit: %@", buf, 0x16u);
        }
      }
    }
    unint64_t v50 = [(IMEditMessageCommandProcessingPipelineComponent *)self _messageEditHistoryLimit];
    if ([v76 count] > v50 && v20 == 1)
    {
      v51 = IMLogHandleForCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_1D9904554();
      }
    }
    else
    {
      if (v20 != 1 || [v86 length])
      {
        if ([v79 count])
        {
          id v47 = [(IMEditMessageCommandProcessingPipelineComponent *)self _adaptiveImageGlyphFileTransferGUIDsInMessageItem:v90];
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          id v52 = v79;
          uint64_t v53 = [v52 countByEnumeratingWithState:&v98 objects:v103 count:16];
          if (v53)
          {
            uint64_t v54 = *(void *)v99;
            while (2)
            {
              for (uint64_t i = 0; i != v53; ++i)
              {
                if (*(void *)v99 != v54) {
                  objc_enumerationMutation(v52);
                }
                if (![v47 containsObject:*(void *)(*((void *)&v98 + 1) + 8 * i)])
                {

                  v67 = IMLogHandleForCategory();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
                    sub_1D99045BC();
                  }

                  id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v69 = (void *)[v68 initWithDomain:*MEMORY[0x1E4F6BE88] code:9 userInfo:0];
                  v6 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v69];

                  goto LABEL_104;
                }
              }
              uint64_t v53 = [v52 countByEnumeratingWithState:&v98 objects:v103 count:16];
              if (v53) {
                continue;
              }
              break;
            }
          }
        }
        if (v20 == 2)
        {
          id v56 = objc_alloc_init(MEMORY[0x1E4FA69B8]);
          [v56 deleteSnapshotsForApplicationIdentifier:@"com.apple.MobileSMS"];
          [v56 invalidate];
        }
        id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v57 = v82;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v94 objects:v102 count:16];
        if (v58)
        {
          uint64_t v59 = *(void *)v95;
          do
          {
            for (uint64_t j = 0; j != v58; ++j)
            {
              if (*(void *)v95 != v59) {
                objc_enumerationMutation(v57);
              }
              uint64_t v61 = *(void *)(*((void *)&v94 + 1) + 8 * j);
              id v93 = 0;
              v62 = [(IMEditMessageCommandProcessingPipelineComponent *)self _applyEditsToMessage:v90 preEditFullMessageText:v89 editType:v20 editedPartIndex:v84 editedMessagePartText:v86 shouldRetractSubject:v83 editTimestamp:v85 chat:v61 updatedAssociatedMessageItems:&v93];
              id v63 = v93;
              if (v62) {
                [v47 addObject:v62];
              }
              if ([v63 count]) {
                [v47 addObjectsFromArray:v63];
              }
            }
            uint64_t v58 = [v57 countByEnumeratingWithState:&v94 objects:v102 count:16];
          }
          while (v58);
        }

        if (IMOSLoggingEnabled())
        {
          v64 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v105 = (uint64_t)v91;
            _os_log_impl(&dword_1D967A000, v64, OS_LOG_TYPE_INFO, "Successfully edited message with GUID=%@", buf, 0xCu);
          }
        }
        v65 = [v57 firstObject];
        [v92 setChat:v65];

        v66 = (void *)[v47 copy];
        [v92 setMessageItems:v66];

        uint64_t v48 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v92];
        goto LABEL_103;
      }
      v51 = IMLogHandleForCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_1D9904588();
      }
    }

    id v71 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v47 = (id)[v71 initWithDomain:*MEMORY[0x1E4F6BE88] code:9 userInfo:0];
    uint64_t v48 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v47];
LABEL_103:
    v6 = (void *)v48;
LABEL_104:

    goto LABEL_105;
  }
  v24 = IMLogHandleForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_1D99043E8();
  }

  id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
  v26 = (void *)[v25 initWithDomain:*MEMORY[0x1E4F6BE88] code:3 userInfo:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v26];

LABEL_109:

  return v6;
}

- (id)_applyEditsToMessage:(id)a3 preEditFullMessageText:(id)a4 editType:(unint64_t)a5 editedPartIndex:(int64_t)a6 editedMessagePartText:(id)a7 shouldRetractSubject:(BOOL)a8 editTimestamp:(id)a9 chat:(id)a10 updatedAssociatedMessageItems:(id *)a11
{
  BOOL v11 = a8;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v36 = a4;
  id v34 = a7;
  id v37 = a9;
  id v17 = a10;
  v35 = [v16 guid];
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v35;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Applying edits to the content of message: %@", buf, 0xCu);
    }
  }
  v19 = objc_msgSend(v16, "copyWithFlags:", objc_msgSend(v16, "flags"));
  objc_msgSend(v19, "_setMessageID:", objc_msgSend(v16, "messageID"));
  if (!a5)
  {
    int v21 = IMLogHandleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1D9904674();
    }

LABEL_12:
    uint64_t v20 = 0;
    goto LABEL_18;
  }
  if (a5 != 2)
  {
    if (a5 == 1)
    {
      uint64_t v20 = objc_msgSend(v36, "__im_messageTextByReplacingMessagePartIndex:withNewPartText:", a6, v34);
      [v19 addEditedPartIndex:a6];
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  uint64_t v20 = objc_msgSend(v36, "__im_messageTextByRemovingMessagePartIndex:", a6);
  [v19 addRetractedPartIndex:a6];
  if (v11) {
    [v19 setSubject:0];
  }
  v22 = objc_msgSend(v36, "__im_messagePartMatchingPartIndex:", a6);
  id v23 = [v22 transferGUID];
  if ([v23 length])
  {
    v24 = [v16 fileTransferGUIDs];
    id v25 = (void *)[v24 mutableCopy];

    [v25 removeObject:v23];
    v26 = (void *)[v25 copy];
    [v19 setFileTransferGUIDs:v26];
  }
LABEL_18:
  [v19 setBody:v20];
  [v19 setPlainBody:0];
  [v19 setDateEdited:v37];
  v27 = [(IMEditMessageCommandProcessingPipelineComponent *)self pipelineResources];
  id v28 = [v27 messageStore];

  id v38 = 0;
  v29 = [v28 storeEditedMessage:v19 editedPartIndex:a6 editType:a5 previousMessage:v16 chat:v17 updatedAssociatedMessageItems:&v38];
  id v30 = v38;
  v31 = v30;
  if (a11) {
    *a11 = v30;
  }

  return v29;
}

- (id)_adaptiveImageGlyphFileTransferGUIDsInMessageItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = +[IMDFileTransferCenter sharedInstance];
  v6 = [v3 fileTransferGUIDs];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v5 transferForGUID:v11];
        if ([v12 isAdaptiveImageGlyph]) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  v13 = (void *)[v4 copy];

  return v13;
}

- (double)_timeoutIntervalForEditType:(unint64_t)a3 enforceExactRetractionTimeoutInterval:(BOOL)a4
{
  if (a3 == 2)
  {
    MEMORY[0x1F4181798](self, sel__messageRetractionReceivedTimeoutEnforcingExactTimeoutInterval_);
  }
  else if (a3 == 1)
  {
    MEMORY[0x1F4181798](self, sel__messageEditReceivedTimeout);
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)_messageEditReceivedTimeout
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"message-edit-received-timeout"];
  double v4 = *MEMORY[0x1E4F6D560];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 doubleValue], v5 > 0.0))
  {
    double v6 = v5;
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 134218240;
        uint64_t v10 = (uint64_t)v6;
        __int16 v11 = 2048;
        uint64_t v12 = (uint64_t)v4;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Server bag overide for message edit received timeout. Server: %ld Default: %ld", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else
  {
    double v6 = v4;
  }

  return v6;
}

- (int64_t)_messageEditHistoryLimit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"message-edit-history-limit"];
  int64_t v4 = *MEMORY[0x1E4F6D558];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (uint64_t v5 = [v3 integerValue], v5 >= 1))
  {
    int64_t v6 = v5;
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = [NSNumber numberWithInteger:v6];
        int v9 = [NSNumber numberWithInteger:v4];
        int v11 = 138412546;
        uint64_t v12 = v8;
        __int16 v13 = 2112;
        v14 = v9;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Server bag override for message edit history limit. Server: %@ Default: %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {
    int64_t v6 = v4;
  }

  return v6;
}

- (double)_messageRetractionReceivedTimeoutEnforcingExactTimeoutInterval:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v3 = (double *)MEMORY[0x1E4F6D5F8];
  }
  else {
    id v3 = (double *)MEMORY[0x1E4F6D5F0];
  }
  int64_t v4 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  uint64_t v5 = [v4 objectForKey:@"message-retraction-received-timeout"];
  double v6 = *v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 doubleValue], v7 > 0.0))
  {
    double v8 = v7;
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 134218240;
        uint64_t v12 = (uint64_t)v8;
        __int16 v13 = 2048;
        uint64_t v14 = (uint64_t)v6;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Server bag overide for message retraction received timeout. Server: %ld Default: %ld", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {
    double v8 = v6;
  }

  return v8;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
}

@end