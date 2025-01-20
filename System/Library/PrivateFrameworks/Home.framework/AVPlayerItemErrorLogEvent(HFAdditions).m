@interface AVPlayerItemErrorLogEvent(HFAdditions)
- (id)hf_prettyDescription;
@end

@implementation AVPlayerItemErrorLogEvent(HFAdditions)

- (id)hf_prettyDescription
{
  v2 = [MEMORY[0x263F58188] builderWithObject:a1];
  v3 = [a1 date];
  id v4 = (id)[v2 appendObject:v3 withName:@"date"];

  v5 = [a1 URI];
  id v6 = (id)[v2 appendObject:v5 withName:@"URI"];

  v7 = [a1 errorComment];
  id v8 = (id)[v2 appendObject:v7 withName:@"error"];

  v9 = [v2 build];

  return v9;
}

@end