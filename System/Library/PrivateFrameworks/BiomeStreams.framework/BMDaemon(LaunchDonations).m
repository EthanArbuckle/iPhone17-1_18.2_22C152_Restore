@interface BMDaemon(LaunchDonations)
@end

@implementation BMDaemon(LaunchDonations)

+ (void)_donateDeviceMetadataWithBootDate:()LaunchDonations .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Unhandled platform %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)_donateDeviceBootSessionEventsWithBootDate:()LaunchDonations queue:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_18E67D000, v0, v1, "The previously found completed boot session is the same as the current boot session in biome daemon launch donation. This should not be possible.", v2, v3, v4, v5, v6);
}

+ (void)_donateDeviceBootSessionEventsWithBootDate:()LaunchDonations queue:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_18E67D000, a2, a3, "The last stored boot session occurred after the current boot session's start date in biome daemon launch donation. This should not be possible. Current boot session date: %@, previously stored device boot session date %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (void)_donateDeviceBootSessionEventsWithBootDate:()LaunchDonations queue:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_18E67D000, v0, v1, "Failure to create OSLogEventSource on biome daemon launch donation", v2, v3, v4, v5, v6);
}

+ (void)_donateDeviceBootSessionEventsWithBootDate:()LaunchDonations queue:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "Failed to read from Device.BootSession stream biome daemon during launch donation. Error: %@", (uint8_t *)&v3, 0xCu);
}

@end