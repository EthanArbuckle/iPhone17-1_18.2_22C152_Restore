@interface VCSession(Messaging)
@end

@implementation VCSession(Messaging)

- (void)processSymptomFromMessage:()Messaging participantID:isLocalInitiated:isLocalSideOnly:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d groupID is nil, return", v2, v3, v4, v5, v6);
}

- (void)handleDeviceStateMessage:()Messaging forParticipantId:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d deviceStateMessage is nil", v2, v3, v4, v5, v6);
}

- (void)handleDeviceStateMessage:()Messaging forParticipantId:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
}

- (void)handleDeviceStateMessage:()Messaging forParticipantId:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Participant uuid is nil", v2, v3, v4, v5, v6);
}

- (void)handleNetworkCapabilityMessage:()Messaging forParticipantId:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d rateControlConfigMessage is nil", v2, v3, v4, v5, v6);
}

- (void)handleNetworkCapabilityMessage:()Messaging forParticipantId:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
}

- (void)remoteCellTechStateUpdate:()Messaging maxRemoteBitrate:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCSession(Messaging) remoteCellTechStateUpdate:maxRemoteBitrate:]";
  __int16 v6 = 1024;
  int v7 = 580;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected remoteCellTech=%d", v3, 0x22u);
}

- (void)processMediaStateMessage:()Messaging remoteParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d mediaStateMessage is nil", v2, v3, v4, v5, v6);
}

- (void)processMediaStateMessage:()Messaging remoteParticipantID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
}

@end