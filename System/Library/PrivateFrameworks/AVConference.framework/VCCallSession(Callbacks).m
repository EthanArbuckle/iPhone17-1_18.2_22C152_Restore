@interface VCCallSession(Callbacks)
@end

@implementation VCCallSession(Callbacks)

- (void)sipCallback:()Callbacks callID:msgIn:msgOut:optional:confIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: GKVoiceChatServiceSRTPEncryptionSetupError... (dtls-srtp)", v2, v3, v4, v5, v6);
}

- (void)sipCallback:()Callbacks callID:msgIn:msgOut:optional:confIndex:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: GKVoiceChatServiceSRTPEncryptionSetupError... (dtls-srtp)", v2, v3, v4, v5, v6);
}

- (void)sipCallback:()Callbacks callID:msgIn:msgOut:optional:confIndex:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: GKVoiceChatServiceSRTPEncryptionSetupError... (audio)", v2, v3, v4, v5, v6);
}

- (void)sipCallback:()Callbacks callID:msgIn:msgOut:optional:confIndex:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: GKVoiceChatServiceSRTPEncryptionSetupError... (audio)", v2, v3, v4, v5, v6);
}

- (void)sipCallback:()Callbacks callID:msgIn:msgOut:optional:confIndex:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: GKVoiceChatServiceSRTPEncryptionSetupError... (video)", v2, v3, v4, v5, v6);
}

- (void)sipCallback:()Callbacks callID:msgIn:msgOut:optional:confIndex:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: GKVoiceChatServiceSRTPEncryptionSetupError... (video)", v2, v3, v4, v5, v6);
}

@end