@interface NSRegularExpression
@end

@implementation NSRegularExpression

uint64_t __81__NSRegularExpression_Intents___intents_sharedStringsDictFormatRegularExpression__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%#@([a-zA-Z0-9\\_]+)@" options:0 error:0];
  uint64_t v1 = _intents_sharedStringsDictFormatRegularExpression_regularExpression;
  _intents_sharedStringsDictFormatRegularExpression_regularExpression = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __73__NSRegularExpression_Intents___intents_sharedOldFormatRegularExpression__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:\\\\?\\()([a-zA-Z0-9\\_\\.]+)(?:\\))" options:0 error:0];
  uint64_t v1 = _intents_sharedOldFormatRegularExpression_regularExpression;
  _intents_sharedOldFormatRegularExpression_regularExpression = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __72__NSRegularExpression_Intents___intents_sharedFunctionRegularExpression__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\.([a-zA-Z0-9\\\\_]+\\(.*?\\))" options:0 error:0];
  uint64_t v1 = _intents_sharedFunctionRegularExpression_regularExpression;
  _intents_sharedFunctionRegularExpression_regularExpression = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __70__NSRegularExpression_Intents___intents_sharedFormatRegularExpression__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:\\$\\{)(.*?)(?:\\})" options:0 error:0];
  uint64_t v1 = _intents_sharedFormatRegularExpression_regularExpression;
  _intents_sharedFormatRegularExpression_regularExpression = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end