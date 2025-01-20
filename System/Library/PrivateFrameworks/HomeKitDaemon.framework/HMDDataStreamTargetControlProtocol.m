@interface HMDDataStreamTargetControlProtocol
+ (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3 dataStreamProtocolDelegate:(id)a4;
@end

@implementation HMDDataStreamTargetControlProtocol

+ (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3 dataStreamProtocolDelegate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v10[1] = *MEMORY[0x263EF8340];
  v9 = @"identifier";
  v5 = NSNumber;
  id v6 = a4;
  v7 = [v5 numberWithUnsignedInt:v4];
  v10[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  [v6 sendEventForProtocol:@"targetControl" topic:@"whoami" payload:v8 completion:&__block_literal_global_264597];
}

@end