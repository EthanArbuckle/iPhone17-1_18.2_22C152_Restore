@interface IMTextMessageProcessingPipelineComponent
- (BOOL)_shouldFindAssociatedMessagePartTextForMessageItem:(id)a3;
- (IMTextMessageProcessingPipelineComponent)initWithMessageStore:(id)a3;
- (id)_findAssociatedMessagePartTextForMessageItem:(id)a3 associatedMessageItem:(id)a4;
- (id)_findMessageItemForAssociatedMessageItem:(id)a3;
- (id)_messagePartMatchingAssociatedMessageGUID:(id)a3 associatedMessageItem:(id)a4;
- (id)createMessageItemWithInput:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
- (unint64_t)computeFlagsForInput:(id)a3;
- (void)_configureAccountForMessageItem:(id)a3 input:(id)a4;
@end

@implementation IMTextMessageProcessingPipelineComponent

- (IMTextMessageProcessingPipelineComponent)initWithMessageStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMTextMessageProcessingPipelineComponent;
  v6 = [(IMTextMessageProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messageStore, a3);
  }

  return v7;
}

- (unint64_t)computeFlagsForInput:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  if ([v4 isFromMe])
  {
    v30[3] |= 0x8004uLL;
    id v5 = [v4 chat];
    if ([v5 style] == 45)
    {
    }
    else
    {
      v6 = [v4 participantIdentifiers];
      BOOL v7 = (unint64_t)[v6 count] < 3;

      if (!v7) {
        goto LABEL_6;
      }
    }
    v30[3] |= 0x1000uLL;
  }
LABEL_6:
  v8 = [v4 GUID];
  if ([(IMDMessageStore *)self->_messageStore popReadReceiptForMissingGUID:v8])
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v8;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Message guid was in readReceiptsForMissingMessage cache: %@", buf, 0xCu);
      }
    }
    v10 = v30;
    uint64_t v11 = v30[3] | 0x2000;
    v30[3] = v11;
  }
  else
  {
    v10 = v30;
    uint64_t v11 = v30[3];
  }
  v10[3] = v11 | 1;
  v12 = [v4 richBody];
  uint64_t v13 = [v12 length];

  v14 = [v4 richBody];
  uint64_t v15 = *MEMORY[0x1E4F6D538];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = sub_1D97E6A34;
  v26 = &unk_1E6B76F08;
  id v16 = v4;
  id v27 = v16;
  v28 = &v29;
  objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v13, 0, &v23);

  if (objc_msgSend(v16, "isExpirable", v23, v24, v25, v26)) {
    v30[3] |= 0x1000000uLL;
  }
  if ([v16 isAutoReply]) {
    v30[3] |= 0x40uLL;
  }
  if ([v16 wasDetonated]) {
    v30[3] |= 0x1000000000uLL;
  }
  if ([v16 isSOS]) {
    v30[3] |= 0x8000000000uLL;
  }
  v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v18 = [v17 isSOSAlertingEnabled];

  if (v18)
  {
    int v19 = [v16 isCritical];
    v20 = v30;
    if (v19) {
      v30[3] |= 0x4000000000uLL;
    }
  }
  else
  {
    v20 = v30;
  }
  unint64_t v21 = v20[3];

  _Block_object_dispose(&v29, 8);
  return v21;
}

- (id)createMessageItemWithInput:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = [v4 richBody];
  unint64_t v5 = [(IMTextMessageProcessingPipelineComponent *)self computeFlagsForInput:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F6E850]);
  BOOL v7 = [v4 fromIdentifier];
  v8 = [v7 _stripFZIDPrefix];
  objc_super v9 = (void *)MEMORY[0x1E4F1C9C8];
  v10 = [v4 timestamp];
  uint64_t v11 = objc_msgSend(v9, "__im_iMessageDateFromTimeStamp:", v10);
  v12 = [v4 fileTransferGUIDs];
  uint64_t v13 = [v4 GUID];
  v14 = [v4 threadIdentifierGUID];
  uint64_t v15 = (void *)[v6 initWithSender:v8 time:v11 body:v24 attributes:0 fileTransferGUIDs:v12 flags:v5 error:0 guid:v13 threadIdentifier:v14];

  id v16 = [v4 plainTextSubject];
  [v15 setSubject:v16];

  v17 = [v4 messageSummaryInfo];
  [v15 setMessageSummaryInfo:v17];

  char v18 = [v4 expressiveSendStyleIdentifier];
  [v15 setExpressiveSendStyleID:v18];

  int v19 = [v4 replicatedFallbackGUIDs];
  [v15 setReplicatedFallbackGUIDs:v19];

  if ([v4 scheduleType] == 2 && objc_msgSend(v15, "isFromMe"))
  {
    objc_msgSend(v15, "setScheduleType:", objc_msgSend(v4, "scheduleType"));
    [v15 setScheduleState:2];
    v20 = [v4 scheduledDate];
    [v15 setTime:v20];
  }
  if ([v15 wasDetonated] && IMOSLoggingEnabled())
  {
    unint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = [v15 guid];
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "createMessageItemWithInput created a detonated message for guid: %@", buf, 0xCu);
    }
  }

  return v15;
}

- (id)_findAssociatedMessagePartTextForMessageItem:(id)a3 associatedMessageItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(IMTextMessageProcessingPipelineComponent *)self _shouldFindAssociatedMessagePartTextForMessageItem:v6])
  {
    v8 = [v6 associatedMessageGUID];
    if ([v8 length])
    {
      objc_super v9 = [(IMTextMessageProcessingPipelineComponent *)self _messagePartMatchingAssociatedMessageGUID:v8 associatedMessageItem:v7];
      v10 = v9;
      if (v9)
      {
        uint64_t v11 = [v9 messagePartBody];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Do not need to find associatedMessagePartText for received associated message", v14, 2u);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_findMessageItemForAssociatedMessageItem:(id)a3
{
  id v4 = [a3 associatedMessageGUID];
  if ([v4 length])
  {
    unint64_t v5 = IMAssociatedMessageDecodeGUID();
    id v6 = [(IMDMessageStore *)self->_messageStore messageWithGUID:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_messagePartMatchingAssociatedMessageGUID:(id)a3 associatedMessageItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 length])
  {
    char v18 = 0;
    goto LABEL_21;
  }
  id v7 = IMAssociatedMessageDecodeGUID();
  uint64_t v8 = IMAssociatedMessageDecodePartIndex();
  if (![v7 length])
  {
    objc_super v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1D9904340(v9, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_18;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v9 = [v6 messageParts];
    if ((unint64_t)[v9 count] < 2)
    {
      if ([v9 count] == 1)
      {
        char v18 = [v9 firstObject];
LABEL_19:

        goto LABEL_20;
      }
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1D99043B0(v10, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    else
    {
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1D9904378(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }

LABEL_18:
    char v18 = 0;
    goto LABEL_19;
  }
  char v18 = [v6 messagePartMatchingPartIndex:v8];
  if (!v18)
  {
    objc_super v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Could not find message part matching message part index, possibly retracted part or malformed", v34, 2u);
    }
    goto LABEL_18;
  }
LABEL_20:

LABEL_21:

  return v18;
}

- (BOOL)_shouldFindAssociatedMessagePartTextForMessageItem:(id)a3
{
  v3 = [a3 messageSummaryInfo];
  id v4 = objc_msgSend(v3, "__im_associatedMessageContentType");
  char v5 = [v4 integerValue];

  return v5 == 1;
}

- (void)_configureAccountForMessageItem:(id)a3 input:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  id v6 = [v5 account];
  id v7 = [v6 accountID];
  [v19 setAccountID:v7];

  uint64_t v8 = [v6 service];
  objc_super v9 = [v8 internalName];
  [v19 setService:v9];

  v10 = [v6 loginID];
  uint64_t v11 = [v10 lowercaseString];
  [v19 setAccount:v11];

  uint64_t v12 = [v5 toIdentifier];
  uint64_t v13 = [v12 _stripFZIDPrefix];
  [v19 setDestinationCallerID:v13];

  uint64_t v14 = +[IMDServiceController sharedController];
  uint64_t v15 = [v5 replicationSourceServiceName];
  uint64_t v16 = [v14 serviceWithName:v15];
  uint64_t v17 = [v16 serviceProperties];
  char v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F6E228]];

  LODWORD(v14) = [v5 isFromMe];
  if (v14 && [v18 containsObject:*MEMORY[0x1E4F6E1B0]]) {
    [v19 setNeedsRepeatForRelayReplication:1];
  }
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = objc_opt_class();
      id v7 = [v4 GUID];
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v6;
      __int16 v37 = 2112;
      v38 = v7;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<%@> Started processing for Message GUID: %@", buf, 0x16u);
    }
  }
  uint64_t v8 = [v4 fromIdentifier];
  BOOL v9 = [v8 length] == 0;

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "<IMTextMessageProcessingPipelineComponent> Failed to find fromIdentifier", buf, 2u);
      }
    }
    goto LABEL_19;
  }
  v10 = [v4 toIdentifier];
  BOOL v11 = [v10 length] == 0;

  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "<IMTextMessageProcessingPipelineComponent> Failed to find toIdentifier", buf, 2u);
      }
    }
LABEL_19:
    id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = (void *)[v29 initWithDomain:*MEMORY[0x1E4F6BE88] code:7 userInfo:0];
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v20];
LABEL_27:
    uint64_t v27 = (void *)v30;
    goto LABEL_28;
  }
  uint64_t v12 = [v4 associatedMessageGUID];
  if (!v12) {
    goto LABEL_26;
  }
  uint64_t v13 = [v4 associatedMessageGUID];
  uint64_t v14 = [v4 GUID];
  char v15 = [v13 isEqualToString:v14];

  if (v15) {
    goto LABEL_26;
  }
  messageStore = self->_messageStore;
  uint64_t v17 = [v4 associatedMessageGUID];
  char v18 = [v4 chat];
  id v19 = [(IMDMessageStore *)messageStore sortedMessageItemsWithFallbackHash:v17 inChat:v18 limit:1];
  uint64_t v20 = [v19 firstObject];

  uint64_t v21 = [v20 service];
  LODWORD(v18) = [v21 isEqualToString:*MEMORY[0x1E4F6E1B8]];

  if (!v18)
  {

LABEL_26:
    uint64_t v20 = [(IMTextMessageProcessingPipelineComponent *)self createMessageItemWithInput:v4];
    [(IMTextMessageProcessingPipelineComponent *)self _configureAccountForMessageItem:v20 input:v4];
    v34 = v20;
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [v4 setMessageItems:v32];

    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
    goto LABEL_27;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v4 associatedMessageGUID];
      uint64_t v24 = [v4 GUID];
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = (uint64_t)v23;
      __int16 v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "<IMTextMessageProcessingPipelineComponent> Found associated GUID %@ for %@. Cross Service Association message has already binded this message to an IML. Dropping.", buf, 0x16u);
    }
  }
  id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v26 = (void *)[v25 initWithDomain:*MEMORY[0x1E4F6BE88] code:24 userInfo:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v26];

LABEL_28:

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageStore, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end