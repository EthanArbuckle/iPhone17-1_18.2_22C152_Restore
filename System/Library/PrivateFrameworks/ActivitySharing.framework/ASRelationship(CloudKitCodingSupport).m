@interface ASRelationship(CloudKitCodingSupport)
@end

@implementation ASRelationship(CloudKitCodingSupport)

+ (void)_relationshipWithRecord:()CloudKitCodingSupport relationshipEventRecords:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 134218496;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 2;
  __int16 v6 = 2048;
  uint64_t v7 = 3;
  _os_log_error_impl(&dword_21EC60000, a2, OS_LOG_TYPE_ERROR, "Relationship record schema version (%ld) is incompatible (compatible versions: %ld, %ld), ignoring.", (uint8_t *)&v2, 0x20u);
}

+ (void)_relationshipWithRecord:()CloudKitCodingSupport relationshipEventRecords:completion:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21EC60000, v0, v1, "Relationship does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
}

+ (void)_relationshipWithRecord:()CloudKitCodingSupport relationshipEventRecords:completion:.cold.3(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 relationshipEvents];
  [v4 count];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11(&dword_21EC60000, v5, v6, "Recieved a mismatched number of relationship events when creating relationship, relationship has a count of %lu events and %lu events were found.", v7, v8, v9, v10, v11);
}

+ (void)_relationshipWithRecord:()CloudKitCodingSupport relationshipEventRecords:completion:.cold.5()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_21EC60000, v0, v1, "Error decoding system fields: %@", v2);
}

+ (void)relationshipWithCodableRelationship:()CloudKitCodingSupport version:.cold.1(uint8_t *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = a2;
  uint64_t v7 = objc_opt_class();
  *(_DWORD *)a1 = 138543362;
  *a4 = v7;
  id v8 = v7;
  _os_log_error_impl(&dword_21EC60000, v6, OS_LOG_TYPE_ERROR, "Codable relationship contained an event that has class %{public}@", a1, 0xCu);
}

+ (void)relationshipsWithRelationshipAndEventRecords:()CloudKitCodingSupport .cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_21EC60000, v0, v1, "Unused relationship event records when creating relationship objects: %@", v2);
}

@end