@interface APSPubSubPowerLog
@end

@implementation APSPubSubPowerLog

uint64_t (*__APSPubSubPowerLog_block_invoke_2())(void, void)
{
  result = (uint64_t (*)(void, void))CUTWeakLinkSymbol();
  PowerLogSubsystem_block_invoke__PPSCreateTelemetryIdentifier = result;
  return result;
}

uint64_t (*__APSPubSubPowerLog_block_invoke_3())(void, void)
{
  result = (uint64_t (*)(void, void))CUTWeakLinkSymbol();
  APSPubSubPowerLog__PPSSendTelemetry = result;
  return result;
}

@end