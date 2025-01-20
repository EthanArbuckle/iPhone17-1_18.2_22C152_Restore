@interface AVAudioSession(VoicemailUI)
- (void)activateVoicemailAudioSession;
- (void)deactivateVoicemailAudioSession;
@end

@implementation AVAudioSession(VoicemailUI)

- (void)activateVoicemailAudioSession
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set audio category to %@: %@", (uint8_t *)&v3, 0x16u);
}

- (void)deactivateVoicemailAudioSession
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to deactivate voicemail audio session: %@", (uint8_t *)&v2, 0xCu);
}

@end