@interface ASRelationshipEvent(CloudKitCoding)
@end

@implementation ASRelationshipEvent(CloudKitCoding)

+ (void)relationshipEventWithRecord:()CloudKitCoding .cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Relationship Event does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
}

+ (void)relationshipEventWithRecord:()CloudKitCoding .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21EC60000, v0, v1, "Relationship Event record schema version (%ld) is too low (%ld), ignoring.", v2, v3, v4, v5, v6);
}

@end