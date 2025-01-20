@interface DNDSModeConfigurationRecord(DNDSIDSRecord)
@end

@implementation DNDSModeConfigurationRecord(DNDSIDSRecord)

+ (void)newWithDNDSIDSRecord:()DNDSIDSRecord currentRecord:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = [a2 recordID];
  v5 = [v4 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1D3052000, v6, v7, "Record data is nil in record data %{public}@", v8, v9, v10, v11, v12);
}

+ (void)newWithDNDSIDSRecord:()DNDSIDSRecord currentRecord:.cold.2(void *a1, void *a2)
{
  id v3 = a1;
  v4 = [a2 recordID];
  v5 = [v4 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1D3052000, v6, v7, "Partioned record data is nil in record data %{public}@", v8, v9, v10, v11, v12);
}

+ (void)newWithDNDSIDSRecord:()DNDSIDSRecord currentRecord:.cold.3(void *a1, void *a2)
{
  id v3 = a1;
  v4 = [a2 recordID];
  v5 = [v4 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1D3052000, v6, v7, "Failed to decode partitioned record data %{public}@: %{public}@", v8, v9, v10, v11, v12);
}

+ (void)newWithDNDSIDSRecord:()DNDSIDSRecord currentRecord:.cold.4(void *a1, void *a2)
{
  id v3 = a1;
  v4 = [a2 recordID];
  v5 = [v4 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1D3052000, v6, v7, "Failed to decode record data %{public}@: %{public}@", v8, v9, v10, v11, v12);
}

- (void)populateDNDSIDSRecord:()DNDSIDSRecord .cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Partition: %{private}@", v2, v3, v4, v5, v6);
}

- (void)populateDNDSIDSRecord:()DNDSIDSRecord .cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Dictionary: %{private}@", v2, v3, v4, v5, v6);
}

- (void)populateDNDSIDSRecord:()DNDSIDSRecord .cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Configuration: %{private}@", v2, v3, v4, v5, v6);
}

- (void)populateDNDSIDSRecord:()DNDSIDSRecord .cold.4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 recordID];
  uint64_t v5 = [v4 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1D3052000, v6, v7, "Record %{public}@ is not valid JSON", v8, v9, v10, v11, v12);
}

@end