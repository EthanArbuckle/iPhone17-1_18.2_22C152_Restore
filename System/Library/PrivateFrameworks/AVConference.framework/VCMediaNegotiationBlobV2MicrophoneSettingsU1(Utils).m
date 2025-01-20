@interface VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils)
@end

@implementation VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils)

- (void)initWithSSRC:()Utils audioPayloads:u1AuthTagEnabled:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  v5 = "-[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) initWithSSRC:audioPayloads:u1AuthTagEnabled:]";
  __int16 v6 = 1024;
  int v7 = 25;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d The payload set is empty", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithSSRC:()Utils audioPayloads:u1AuthTagEnabled:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  __int16 v6 = "-[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) initWithSSRC:audioPayloads:u1AuthTagEnabled:]";
  __int16 v7 = 1024;
  int v8 = 30;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d No payloads to negotiate. Audio payloads=%@", (uint8_t *)&v3, 0x26u);
}

@end