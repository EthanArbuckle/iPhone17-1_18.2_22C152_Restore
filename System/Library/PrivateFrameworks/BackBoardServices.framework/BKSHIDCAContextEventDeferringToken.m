@interface BKSHIDCAContextEventDeferringToken
@end

@implementation BKSHIDCAContextEventDeferringToken

uint64_t __53___BKSHIDCAContextEventDeferringToken_protobufSchema__block_invoke(uint64_t a1)
{
  protobufSchema_schema_3856 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_3857];
  return MEMORY[0x1F41817F8]();
}

uint64_t __53___BKSHIDCAContextEventDeferringToken_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addField:"_CAContextID" forTag:1];
}

@end