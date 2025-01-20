@interface IMAudioMessageProcessingPipelineComponent
- (id)createMessageItemWithInput:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMAudioMessageProcessingPipelineComponent

- (id)createMessageItemWithInput:(id)a3
{
  id v4 = a3;
  unint64_t v18 = [(IMTextMessageProcessingPipelineComponent *)self computeFlagsForInput:v4] | 0x1200000;
  id v5 = objc_alloc(MEMORY[0x1E4F6E850]);
  v6 = [v4 fromIdentifier];
  v7 = [v6 _stripFZIDPrefix];
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  v9 = [v4 timestamp];
  v10 = objc_msgSend(v8, "__im_iMessageDateFromTimeStamp:", v9);
  v11 = [v4 richBody];
  v12 = [v4 fileTransferGUIDs];
  v13 = [v4 GUID];
  v14 = [v4 threadIdentifierGUID];
  v15 = (void *)[v5 initWithSender:v7 time:v10 body:v11 attributes:0 fileTransferGUIDs:v12 flags:v18 error:0 guid:v13 threadIdentifier:v14];

  v16 = [v4 replicatedFallbackGUIDs];

  [v15 setReplicatedFallbackGUIDs:v16];

  return v15;
}

- (id)runIndividuallyWithInput:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IMAudioMessageProcessingPipelineComponent;
  v3 = [(IMTextMessageProcessingPipelineComponent *)&v5 runIndividuallyWithInput:a3];

  return v3;
}

@end