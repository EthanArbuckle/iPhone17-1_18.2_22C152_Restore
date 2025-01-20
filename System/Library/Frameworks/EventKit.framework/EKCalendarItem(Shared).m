@interface EKCalendarItem(Shared)
@end

@implementation EKCalendarItem(Shared)

- (void)_structuredDataDictionaryFromData:()Shared local:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Failed to deserialize structured data. Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_dataFromStructuredDataDictionary:()Shared local:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Failed to serialize structured data dictionary: %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

@end