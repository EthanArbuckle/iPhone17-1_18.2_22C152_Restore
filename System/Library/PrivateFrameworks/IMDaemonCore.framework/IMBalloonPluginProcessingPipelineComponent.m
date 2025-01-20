@interface IMBalloonPluginProcessingPipelineComponent
- (id)createMessageItemWithInput:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMBalloonPluginProcessingPipelineComponent

- (id)createMessageItemWithInput:(id)a3
{
  id v4 = a3;
  v5 = [v4 associatedMessageGUID];

  if (v5)
  {
    unint64_t v28 = [(IMTextMessageProcessingPipelineComponent *)self computeFlagsForInput:v4];
    id v27 = objc_alloc(MEMORY[0x1E4F6E5E0]);
    v26 = [v4 fromDisplayID];
    v6 = (void *)MEMORY[0x1E4F1C9C8];
    v29 = [v4 timestamp];
    v25 = objc_msgSend(v6, "__im_iMessageDateFromTimeStamp:", v29);
    v7 = [v4 richBody];
    v8 = [v4 fileTransferGUIDs];
    v9 = [v4 GUID];
    v10 = [v4 associatedMessageGUID];
    uint64_t v11 = [v4 associatedMessageType];
    uint64_t v12 = [v4 associatedMessageRange];
    uint64_t v14 = v13;
    v15 = [v4 messageSummaryInfo];
    v16 = [v4 threadIdentifierGUID];
    v17 = objc_msgSend(v27, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v26, v25, v7, 0, v8, v28, 0, v9, v10, v11, v12, v14, v15, v16);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)IMBalloonPluginProcessingPipelineComponent;
    v17 = [(IMTextMessageProcessingPipelineComponent *)&v30 createMessageItemWithInput:v4];
  }
  v18 = [v4 balloonPluginBundleID];
  if ([v18 containsString:*MEMORY[0x1E4F6CC30]])
  {
  }
  else
  {
    v19 = [v4 balloonPluginBundleID];
    int v20 = [v19 containsString:*MEMORY[0x1E4F6CC38]];

    if (!v20) {
      goto LABEL_8;
    }
  }
  [v17 setFileTransferGUIDs:0];
LABEL_8:
  v21 = [v4 balloonPluginBundleID];
  [v17 setBalloonBundleID:v21];

  v22 = [v4 balloonPluginPayload];
  [v17 setPayloadData:v22];

  v23 = [v4 replicatedFallbackGUIDs];
  [v17 setReplicatedFallbackGUIDs:v23];

  return v17;
}

- (id)runIndividuallyWithInput:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IMBalloonPluginProcessingPipelineComponent;
  v3 = [(IMTextMessageProcessingPipelineComponent *)&v5 runIndividuallyWithInput:a3];

  return v3;
}

@end