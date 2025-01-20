@interface BKSHIDCGSConnectIDEventDeferringToken
@end

@implementation BKSHIDCGSConnectIDEventDeferringToken

uint64_t __56___BKSHIDCGSConnectIDEventDeferringToken_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_81];
  uint64_t v2 = protobufSchema_schema_78;
  protobufSchema_schema_78 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __56___BKSHIDCGSConnectIDEventDeferringToken_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addField:"_CGSConnectionID" forTag:3];
}

@end