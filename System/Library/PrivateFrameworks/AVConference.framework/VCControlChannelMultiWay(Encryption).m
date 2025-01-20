@interface VCControlChannelMultiWay(Encryption)
@end

@implementation VCControlChannelMultiWay(Encryption)

- (void)updateEncryptionWithEncryptionMaterial:()Encryption .cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not update encryption cryptors for messaging, result:%X", v2, v3, v4, v5);
}

- (void)updateEncryptionWithEncryptionMaterial:()Encryption .cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not update encryption cryptors for messaging, result:%X", v2, v3, v4, v5);
}

- (void)updateEncryptionWithEncryptionMaterial:()Encryption .cold.3()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can not set currentSendMKI '%@': can not find corresponding cryptor for key");
}

- (void)updateEncryptionWithEncryptionMaterial:()Encryption .cold.4()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can not set currentSendMKI '%@': can not find corresponding cryptor for key");
}

- (void)updateEncryptionWithKeyMaterial:()Encryption .cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create crypto set for messaging, result:%X", v2, v3, v4, v5);
}

- (void)updateEncryptionWithKeyMaterial:()Encryption .cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not update encryption cryptors for messaging, result:%X", v2, v3, v4, v5);
}

- (void)setCurrentSendMKIWithKeyMaterial:()Encryption .cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can not set currentSendMKI with keyMaterial '%@': absent MKI");
}

- (void)setCurrentSendMKIWithKeyMaterial:()Encryption .cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can not set currentSendMKI with keyMaterial '%@': can not find corresponding cryptor");
}

- (void)updateEncryption:()Encryption derivedSSRC:.cold.1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create cryptoInfo with keyIndex:%@");
}

- (void)updateEncryption:()Encryption derivedSSRC:.cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 253;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d SRTPUpdateEncryptionInfo: failed to update encryption info", (uint8_t *)&v2, 0x1Cu);
}

- (void)updateEncryption:()Encryption derivedSSRC:.cold.3(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 245;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d updateEncryption: media key/salt derivation failed", (uint8_t *)&v2, 0x1Cu);
}

- (void)encryptData:()Encryption size:sequenceNumber:.cold.1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d encryptData: _currentSendMKI (%@) failed to match any cryptors");
}

- (void)decryptWithMKI:()Encryption data:size:sequenceNumber:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d decryptWithMKI: MKI (%@) failed to match any cryptors");
}

@end