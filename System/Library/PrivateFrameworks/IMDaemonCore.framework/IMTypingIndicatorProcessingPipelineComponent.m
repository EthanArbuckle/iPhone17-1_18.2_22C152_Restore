@interface IMTypingIndicatorProcessingPipelineComponent
- (BOOL)canSuppressMessageWithInput:(id)a3;
- (id)createMessageItemWithInput:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMTypingIndicatorProcessingPipelineComponent

- (BOOL)canSuppressMessageWithInput:(id)a3
{
  return 0;
}

- (id)createMessageItemWithInput:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(IMTextMessageProcessingPipelineComponent *)self computeFlagsForInput:v4] | 8;
  if (![v4 isFinished]) {
    v5 &= ~1uLL;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F6E850]);
  v7 = [v4 fromIdentifier];
  v8 = [v7 _stripFZIDPrefix];
  v9 = (void *)MEMORY[0x1E4F1C9C8];
  v10 = [v4 timestamp];
  v11 = objc_msgSend(v9, "__im_iMessageDateFromTimeStamp:", v10);
  v12 = [v4 GUID];
  v13 = [v4 threadIdentifierGUID];
  v14 = (void *)[v6 initWithSender:v8 time:v11 body:0 attributes:0 fileTransferGUIDs:0 flags:v5 error:0 guid:v12 threadIdentifier:v13];

  v15 = [v4 balloonPluginBundleID];
  [v14 setBalloonBundleID:v15];

  v16 = [v4 typingIndicatorIconData];
  [v14 setTypingIndicatorIcon:v16];

  v17 = [v4 replicatedFallbackGUIDs];

  [v14 setReplicatedFallbackGUIDs:v17];

  return v14;
}

- (id)runIndividuallyWithInput:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IMTypingIndicatorProcessingPipelineComponent;
  v3 = [(IMTextMessageProcessingPipelineComponent *)&v5 runIndividuallyWithInput:a3];

  return v3;
}

@end