@interface LTTextToSpeechSanitizer
@end

@implementation LTTextToSpeechSanitizer

void __46___LTTextToSpeechSanitizer__regularExpression__block_invoke()
{
  id v4 = 0;
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([\\p{L}']*[*]+[\\p{L}']*)+" options:1 error:&v4];
  id v1 = v4;
  v2 = (void *)_regularExpression_regularExpression;
  _regularExpression_regularExpression = v0;

  if (v1)
  {
    v3 = _LTOSLogTTS();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __46___LTTextToSpeechSanitizer__regularExpression__block_invoke_cold_1((uint64_t)v1, v3);
    }
  }
}

void __46___LTTextToSpeechSanitizer__regularExpression__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_24639B000, a2, OS_LOG_TYPE_FAULT, "Failed to create regular expression to find censored speech: %@", (uint8_t *)&v2, 0xCu);
}

@end