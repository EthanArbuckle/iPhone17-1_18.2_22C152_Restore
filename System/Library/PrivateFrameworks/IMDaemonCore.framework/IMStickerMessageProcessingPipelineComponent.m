@interface IMStickerMessageProcessingPipelineComponent
- (IMDiMessagePipelineResources)pipelineResources;
- (IMStickerMessageProcessingPipelineComponent)initWithPipelineResources:(id)a3;
- (NSDictionary)messageSummaryAdditions;
- (id)createMessageItemWithInput:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
- (void)setMessageSummaryAdditions:(id)a3;
@end

@implementation IMStickerMessageProcessingPipelineComponent

- (IMStickerMessageProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5 = a3;
  v6 = [v5 messageStore];
  v9.receiver = self;
  v9.super_class = (Class)IMStickerMessageProcessingPipelineComponent;
  v7 = [(IMTextMessageProcessingPipelineComponent *)&v9 initWithMessageStore:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_pipelineResources, a3);
  }

  return v7;
}

- (id)createMessageItemWithInput:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(IMTextMessageProcessingPipelineComponent *)self computeFlagsForInput:v4];
  v6 = [v4 associatedMessageGUID];

  unint64_t v47 = v5;
  if (v6)
  {
    v7 = [v4 messageSummaryInfo];
    v8 = [(IMStickerMessageProcessingPipelineComponent *)self messageSummaryAdditions];

    v45 = self;
    if (v8)
    {
      objc_super v9 = (void *)[v7 mutableCopy];
      v10 = [(IMStickerMessageProcessingPipelineComponent *)self messageSummaryAdditions];
      [v9 addEntriesFromDictionary:v10];

      v46 = v9;
    }
    else
    {
      v46 = v7;
    }
    id v42 = objc_alloc(MEMORY[0x1E4F6E5E0]);
    v44 = [v4 fromIdentifier];
    v41 = [v44 _stripFZIDPrefix];
    v25 = (void *)MEMORY[0x1E4F1C9C8];
    v43 = [v4 timestamp];
    v26 = objc_msgSend(v25, "__im_iMessageDateFromTimeStamp:", v43);
    v27 = [v4 richBody];
    v28 = [v4 fileTransferGUIDs];
    v29 = [v4 GUID];
    v30 = [v4 associatedMessageGUID];
    uint64_t v31 = [v4 associatedMessageType];
    uint64_t v32 = [v4 associatedMessageRange];
    uint64_t v34 = v33;
    v35 = [v4 threadIdentifierGUID];
    v21 = objc_msgSend(v42, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v41, v26, v27, 0, v28, v47, 0, v29, v30, v31, v32, v34, v46, v35);

    v36 = [v4 replicatedFallbackGUIDs];
    [v21 setReplicatedFallbackGUIDs:v36];

    v37 = [(IMTextMessageProcessingPipelineComponent *)v45 _findMessageItemForAssociatedMessageItem:v21];
    v38 = [(IMTextMessageProcessingPipelineComponent *)v45 _findAssociatedMessagePartTextForMessageItem:v21 associatedMessageItem:v37];
    [v21 setAssociatedMessagePartText:v38];

    v24 = v46;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F6E850]);
    v12 = [v4 fromIdentifier];
    v13 = [v12 _stripFZIDPrefix];
    v14 = (void *)MEMORY[0x1E4F1C9C8];
    v15 = [v4 timestamp];
    v16 = objc_msgSend(v14, "__im_iMessageDateFromTimeStamp:", v15);
    v17 = [v4 richBody];
    v18 = [v4 fileTransferGUIDs];
    v19 = [v4 GUID];
    v20 = [v4 threadIdentifierGUID];
    v21 = (void *)[v11 initWithSender:v13 time:v16 body:v17 attributes:0 fileTransferGUIDs:v18 flags:v47 error:0 guid:v19 threadIdentifier:v20];

    v22 = [v4 messageSummaryInfo];
    [v21 setMessageSummaryInfo:v22];

    v23 = [v4 expressiveSendStyleIdentifier];
    [v21 setExpressiveSendStyleID:v23];

    v24 = [v4 replicatedFallbackGUIDs];
    [v21 setReplicatedFallbackGUIDs:v24];
  }

  if ([v4 scheduleType] == 2 && objc_msgSend(v21, "isFromMe"))
  {
    objc_msgSend(v21, "setScheduleType:", objc_msgSend(v4, "scheduleType"));
    [v21 setScheduleState:2];
    v39 = [v4 scheduledDate];
    [v21 setTime:v39];
  }

  return v21;
}

- (id)runIndividuallyWithInput:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IMStickerMessageProcessingPipelineComponent;
  v3 = [(IMAssociatedMessageProcessingPipelineComponent *)&v5 runIndividuallyWithInput:a3];

  return v3;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (NSDictionary)messageSummaryAdditions
{
  return self->_messageSummaryAdditions;
}

- (void)setMessageSummaryAdditions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSummaryAdditions, 0);

  objc_storeStrong((id *)&self->_pipelineResources, 0);
}

@end