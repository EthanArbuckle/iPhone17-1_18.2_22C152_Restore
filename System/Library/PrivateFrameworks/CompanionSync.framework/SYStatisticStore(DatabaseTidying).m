@interface SYStatisticStore(DatabaseTidying)
- (void)_LOCKED_allServiceNames;
@end

@implementation SYStatisticStore(DatabaseTidying)

- (void)_LOCKED_allServiceNames
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Failed to create statement - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

- (void)_LOCKED_pruneMessageLogForServices:()DatabaseTidying .cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Failed to execute prune statement - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

- (void)_LOCKED_pruneMessageLogForServices:()DatabaseTidying .cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Failed to create prune statement - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

@end