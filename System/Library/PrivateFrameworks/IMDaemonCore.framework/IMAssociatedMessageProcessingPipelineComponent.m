@interface IMAssociatedMessageProcessingPipelineComponent
- (id)createMessageItemWithInput:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMAssociatedMessageProcessingPipelineComponent

- (id)createMessageItemWithInput:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 plainTextBody];
  v8 = (void *)[v6 initWithString:v7];

  v30 = objc_msgSend(v8, "__im_attributedStringByAssigningMessagePartNumbers");

  unint64_t v28 = [(IMTextMessageProcessingPipelineComponent *)self computeFlagsForInput:v5];
  id v27 = objc_alloc(MEMORY[0x1E4F6E5E0]);
  v26 = [v5 fromDisplayID];
  v9 = (void *)MEMORY[0x1E4F1C9C8];
  v10 = [v5 timestamp];
  v11 = objc_msgSend(v9, "__im_iMessageDateFromTimeStamp:", v10);
  v12 = [v5 GUID];
  v13 = [v5 associatedMessageGUID];
  uint64_t v14 = [v5 associatedMessageType];
  uint64_t v15 = [v5 associatedMessageRange];
  uint64_t v17 = v16;
  v18 = [v5 messageSummaryInfo];
  v19 = [v5 threadIdentifierGUID];
  v20 = objc_msgSend(v27, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v26, v11, v30, 0, 0, v28, 0, v12, v13, v14, v15, v17, v18, v19);

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
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 GUID];
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "<IMAssociatedMessageProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)IMAssociatedMessageProcessingPipelineComponent;
  v7 = [(IMTextMessageProcessingPipelineComponent *)&v9 runIndividuallyWithInput:v4];

  return v7;
}

@end