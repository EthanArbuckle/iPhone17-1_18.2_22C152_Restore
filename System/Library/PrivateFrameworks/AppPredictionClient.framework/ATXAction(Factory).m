@interface ATXAction(Factory)
@end

@implementation ATXAction(Factory)

+ (void)atx_startCallActionWithTitle:()Factory subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:mediaType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Return call action not created for unexpected media type", v2, v3, v4, v5, v6);
}

+ (void)atx_startCallActionWithTitle:()Factory subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:mediaType:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Return call action not created for unknown media type", v2, v3, v4, v5, v6);
}

+ (void)atx_startVideoCallActionWithTitle:()Factory subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Failed to create video call intent for an unknown call service", v2, v3, v4, v5, v6);
}

+ (void)atx_startVideoCallActionWithTitle:()Factory subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "Using call service as preferred call provider: %@", v2, v3, v4, v5, v6);
}

+ (void)atx_setAirplaneModeActionWithTitle:()Factory subtitle:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "Airplane Mode: made intent: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)atx_startAudioCallActionWithTitle:()Factory subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Failed to create audio call intent for an unknown call service", v2, v3, v4, v5, v6);
}

+ (void)atx_updateAlarmActionWithTitle:()Factory subtitle:alarmID:alarmTitle:heuristicName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "Failed to create generic intent from MTUpdateAlarmIntent", v2, v3, v4, v5, v6);
}

+ (void)atx_updateAlarmActionWithTitle:()Factory subtitle:alarmID:alarmTitle:heuristicName:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Generic intent created from MTUpdateAlarmIntent is not an INIntent object.", v2, v3, v4, v5, v6);
}

+ (void)atx_setAlarmActionWithTitle:()Factory subtitle:eventIdentifier:eventTitle:alarmDate:heuristicName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "Failed to create generic intent from MTCreateAlarmIntent", v2, v3, v4, v5, v6);
}

+ (void)atx_setAlarmActionWithTitle:()Factory subtitle:eventIdentifier:eventTitle:alarmDate:heuristicName:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "Generic intent created from MTCreateAlarmIntent is not an INIntent object.", v2, v3, v4, v5, v6);
}

+ (void)atx_showCheckInActionWithTeamId:()Factory userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "atx_showCheckInAction: Called with no teamId", v2, v3, v4, v5, v6);
}

+ (void)atx_showCheckInActionWithTeamId:()Factory userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "atx_showCheckInAction: Called with no userActivityString", v2, v3, v4, v5, v6);
}

+ (void)atx_showCheckInActionWithTeamId:()Factory userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "atx_showCheckInAction: Called with no subtitle", v2, v3, v4, v5, v6);
}

+ (void)atx_showCheckInActionWithTeamId:()Factory userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1A790D000, v0, OS_LOG_TYPE_FAULT, "atx_showCheckInAction: Could not create NSUserActivity from string '%@'", v1, 0xCu);
}

+ (void)atx_showCheckInActionWithTeamId:()Factory userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:.cold.5(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 activityType];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "atx_showCheckInAction: Could not find an installed app for activityType='%@' or a webpageURL to fall back to.", v4, 0xCu);
}

@end