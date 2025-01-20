@interface BKSHIDStringIdentifierEventDeferringToken
@end

@implementation BKSHIDStringIdentifierEventDeferringToken

uint64_t __60___BKSHIDStringIdentifierEventDeferringToken_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_56];
  uint64_t v2 = protobufSchema_schema_53;
  protobufSchema_schema_53 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

uint64_t __60___BKSHIDStringIdentifierEventDeferringToken_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addField:"_stringIdentifier" forTag:2];
}

@end