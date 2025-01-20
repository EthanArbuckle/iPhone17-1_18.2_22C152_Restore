@interface IMEmojiTapbackMessageProcessingPipelineComponent
- (id)createMessageItemWithInput:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMEmojiTapbackMessageProcessingPipelineComponent

- (id)createMessageItemWithInput:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 plainTextBody];
  v8 = (void *)[v6 initWithString:v7];

  v30 = objc_msgSend(v8, "__im_attributedStringByAssigningMessagePartNumbers");

  unint64_t v29 = [(IMTextMessageProcessingPipelineComponent *)self computeFlagsForInput:v5];
  v9 = [v5 associatedMessageGUID];
  id v27 = objc_alloc(MEMORY[0x1E4F6E5E0]);
  v26 = [v5 fromDisplayID];
  v10 = (void *)MEMORY[0x1E4F1C9C8];
  v28 = [v5 timestamp];
  v11 = objc_msgSend(v10, "__im_iMessageDateFromTimeStamp:", v28);
  v12 = [v5 GUID];
  uint64_t v13 = [v5 associatedMessageType];
  uint64_t v14 = [v5 associatedMessageRange];
  uint64_t v16 = v15;
  v17 = [v5 associatedMessageEmoji];
  v18 = [v5 messageSummaryInfo];
  v19 = [v5 threadIdentifierGUID];
  v20 = objc_msgSend(v27, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:messageSummaryInfo:threadIdentifier:", v26, v11, v30, 0, 0, v29, 0, v12, v9, v13, v14, v16, v17, v18, v19);

  v21 = [v5 replicatedFallbackGUIDs];

  [v20 setReplicatedFallbackGUIDs:v21];
  v22 = [(IMTextMessageProcessingPipelineComponent *)self _findMessageItemForAssociatedMessageItem:v20];
  v23 = [(IMTextMessageProcessingPipelineComponent *)self _findAssociatedMessagePartTextForMessageItem:v20 associatedMessageItem:v22];
  [v20 setAssociatedMessagePartText:v23];

  v24 = [v22 expressiveSendStyleID];
  [v20 setAssociatedMessageEffect:v24];

  return v20;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v6 = [v5 isEmojiTapbacksEnabled];

  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = [v4 GUID];
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "<IMEmojiTapbackMessageProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);
      }
    }
    v16.receiver = self;
    v16.super_class = (Class)IMEmojiTapbackMessageProcessingPipelineComponent;
    v10 = [(IMTextMessageProcessingPipelineComponent *)&v16 runIndividuallyWithInput:v4];
  }
  else
  {
    if (v7)
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [v4 GUID];
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "<IMEmojiTapbackMessageProcessingPipelineComponent> Rejecting message with GUID: %@", buf, 0xCu);
      }
    }
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = (void *)[v13 initWithDomain:*MEMORY[0x1E4F6BE88] code:23 userInfo:0];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v14];
  }

  return v10;
}

@end