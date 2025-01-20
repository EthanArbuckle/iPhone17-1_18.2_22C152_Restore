@interface DNDSModeConfigurationRecord(CKRecord)
@end

@implementation DNDSModeConfigurationRecord(CKRecord)

+ (void)dictionaryRepresentationWithCKRecord:()CKRecord partitionType:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  v6 = [a3 recordID];
  v7 = [v6 recordName];
  int v8 = 138412546;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1D3052000, v5, OS_LOG_TYPE_ERROR, "%@ partition data is nil in record data %{public}@", (uint8_t *)&v8, 0x16u);
}

- (void)populateCKRecord:()CKRecord lastChanceRecord:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Partition: %{private}@", v2, v3, v4, v5, v6);
}

- (void)populateCKRecord:()CKRecord lastChanceRecord:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Dictionary: %{private}@", v2, v3, v4, v5, v6);
}

- (void)populateCKRecord:()CKRecord lastChanceRecord:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Configuration: %{private}@", v2, v3, v4, v5, v6);
}

- (void)populateCKRecord:()CKRecord lastChanceRecord:.cold.4(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 recordID];
  uint64_t v5 = [v4 recordName];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1D3052000, v3, OS_LOG_TYPE_ERROR, "Record %{public}@ is not valid JSON", v6, 0xCu);
}

@end