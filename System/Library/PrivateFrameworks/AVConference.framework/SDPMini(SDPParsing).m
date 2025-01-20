@interface SDPMini(SDPParsing)
@end

@implementation SDPMini(SDPParsing)

- (void)parseMediaLine:()SDPParsing .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 699;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid media line type", (uint8_t *)&v2, 0x1Cu);
}

- (void)parseMediaLine:()SDPParsing .cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 690;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to initialize media line", (uint8_t *)&v2, 0x1Cu);
}

@end