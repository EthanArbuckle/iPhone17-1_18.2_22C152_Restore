@interface IMStickerTapbackMessageProcessingPipelineComponent
- (id)createMessageItemWithInput:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMStickerTapbackMessageProcessingPipelineComponent

- (id)createMessageItemWithInput:(id)a3
{
  id v4 = a3;
  unint64_t v25 = [(IMTextMessageProcessingPipelineComponent *)self computeFlagsForInput:v4];
  id v24 = objc_alloc(MEMORY[0x1E4F6E5E0]);
  v27 = [v4 fromIdentifier];
  v23 = [v27 _stripFZIDPrefix];
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  v26 = [v4 timestamp];
  v22 = objc_msgSend(v5, "__im_iMessageDateFromTimeStamp:", v26);
  v6 = [v4 richBody];
  v7 = [v4 fileTransferGUIDs];
  v8 = [v4 GUID];
  v9 = [v4 associatedMessageGUID];
  uint64_t v10 = [v4 associatedMessageType];
  uint64_t v11 = [v4 associatedMessageRange];
  uint64_t v13 = v12;
  v14 = [v4 messageSummaryInfo];
  v15 = [v4 threadIdentifierGUID];
  v16 = objc_msgSend(v24, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v23, v22, v6, 0, v7, v25, 0, v8, v9, v10, v11, v13, v14, v15);

  v17 = [v4 replicatedFallbackGUIDs];

  [v16 setReplicatedFallbackGUIDs:v17];
  v18 = [(IMTextMessageProcessingPipelineComponent *)self _findMessageItemForAssociatedMessageItem:v16];
  v19 = [(IMTextMessageProcessingPipelineComponent *)self _findAssociatedMessagePartTextForMessageItem:v16 associatedMessageItem:v18];
  [v16 setAssociatedMessagePartText:v19];

  v20 = [v18 expressiveSendStyleID];
  [v16 setAssociatedMessageEffect:v20];

  return v16;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
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
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "<IMStickerTapbackMessageProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);
      }
    }
    v16.receiver = self;
    v16.super_class = (Class)IMStickerTapbackMessageProcessingPipelineComponent;
    uint64_t v10 = [(IMTextMessageProcessingPipelineComponent *)&v16 runIndividuallyWithInput:v4];
  }
  else
  {
    if (v7)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v4 GUID];
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "<IMStickerTapbackMessageProcessingPipelineComponent> Rejecting message with GUID: %@", buf, 0xCu);
      }
    }
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    v14 = (void *)[v13 initWithDomain:*MEMORY[0x1E4F6BE88] code:23 userInfo:0];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithError:v14];
  }

  return v10;
}

@end