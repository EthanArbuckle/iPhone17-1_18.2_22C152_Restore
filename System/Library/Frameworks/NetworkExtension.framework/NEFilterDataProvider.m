@interface NEFilterDataProvider
- (NEFilterDataVerdict)handleInboundDataCompleteForFlow:(NEFilterFlow *)flow;
- (NEFilterDataVerdict)handleInboundDataFromFlow:(NEFilterFlow *)flow readBytesStartOffset:(NSUInteger)offset readBytes:(NSData *)readBytes;
- (NEFilterDataVerdict)handleOutboundDataCompleteForFlow:(NEFilterFlow *)flow;
- (NEFilterDataVerdict)handleOutboundDataFromFlow:(NEFilterFlow *)flow readBytesStartOffset:(NSUInteger)offset readBytes:(NSData *)readBytes;
- (NEFilterNewFlowVerdict)handleNewFlow:(NEFilterFlow *)flow;
- (NEFilterRemediationVerdict)handleRemediationForFlow:(NEFilterFlow *)flow;
- (void)applySettings:(NEFilterSettings *)settings completionHandler:(void *)completionHandler;
- (void)resumeFlow:(NEFilterFlow *)flow withVerdict:(NEFilterVerdict *)verdict;
- (void)updateFlow:(NEFilterSocketFlow *)flow usingVerdict:(NEFilterDataVerdict *)verdict forDirection:(NETrafficDirection)direction;
@end

@implementation NEFilterDataProvider

- (void)updateFlow:(NEFilterSocketFlow *)flow usingVerdict:(NEFilterDataVerdict *)verdict forDirection:(NETrafficDirection)direction
{
  v8 = verdict;
  v9 = flow;
  id v10 = [(NEProvider *)self context];
  [v10 updateFlow:v9 withVerdict:v8 forDirection:direction];
}

- (void)resumeFlow:(NEFilterFlow *)flow withVerdict:(NEFilterVerdict *)verdict
{
  v6 = verdict;
  v7 = flow;
  id v8 = [(NEProvider *)self context];
  [v8 resumeFlow:v7 withVerdict:v6];
}

- (void)applySettings:(NEFilterSettings *)settings completionHandler:(void *)completionHandler
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v6 = settings;
  v7 = completionHandler;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(NEFilterSettings *)v6 checkValidityAndCollectErrors:v8])
    {
      v9 = [(NEProvider *)self context];
      [v9 applySettings:v6 completionHandler:v7];
    }
    else
    {
      if ([v8 count])
      {
        uint64_t v15 = *MEMORY[0x1E4F28568];
        v13 = [v8 componentsJoinedByString:@"\n"];
        v16 = v13;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      }
      else
      {
        v9 = 0;
      }
      v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEFilterErrorDomain" code:1 userInfo:v9];
      v7[2](v7, v14);
    }
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v11 = NEResourcesCopyLocalizedNSString(@"FILTER_SETTINGS_NOT_A_SETTINGS_OBJECT", @"FILTER_SETTINGS_NOT_A_SETTINGS_OBJECT");
    v18[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v9 = (void *)[v10 initWithDomain:@"NEFilterErrorDomain" code:1 userInfo:v12];

    v7[2](v7, v9);
  }
}

- (NEFilterRemediationVerdict)handleRemediationForFlow:(NEFilterFlow *)flow
{
  return 0;
}

- (NEFilterDataVerdict)handleOutboundDataCompleteForFlow:(NEFilterFlow *)flow
{
  return 0;
}

- (NEFilterDataVerdict)handleInboundDataCompleteForFlow:(NEFilterFlow *)flow
{
  return 0;
}

- (NEFilterDataVerdict)handleOutboundDataFromFlow:(NEFilterFlow *)flow readBytesStartOffset:(NSUInteger)offset readBytes:(NSData *)readBytes
{
  return 0;
}

- (NEFilterDataVerdict)handleInboundDataFromFlow:(NEFilterFlow *)flow readBytesStartOffset:(NSUInteger)offset readBytes:(NSData *)readBytes
{
  return 0;
}

- (NEFilterNewFlowVerdict)handleNewFlow:(NEFilterFlow *)flow
{
  return 0;
}

@end