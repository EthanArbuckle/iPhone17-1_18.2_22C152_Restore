@interface ABVCardActivityAlertEscapingSerializationStrategy
+ (BOOL)strategyWouldAlterString:(id)a3;
+ (id)charactersToTriggerStrategy;
+ (id)regex;
+ (id)serializeString:(id)a3;
@end

@implementation ABVCardActivityAlertEscapingSerializationStrategy

+ (BOOL)strategyWouldAlterString:(id)a3
{
  return objc_msgSend(a3, "rangeOfCharacterFromSet:", objc_msgSend(a1, "charactersToTriggerStrategy")) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)charactersToTriggerStrategy
{
  if (charactersToTriggerStrategy_onceToken != -1) {
    dispatch_once(&charactersToTriggerStrategy_onceToken, &__block_literal_global_74);
  }
  return (id)charactersToTriggerStrategy_sCharSet;
}

id __80__ABVCardActivityAlertEscapingSerializationStrategy_charactersToTriggerStrategy__block_invoke()
{
  id result = (id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"=,\\\""];
  charactersToTriggerStrategy_sCharSet = (uint64_t)result;
  return result;
}

+ (id)serializeString:(id)a3
{
  v4 = (void *)[a1 regex];
  uint64_t v5 = [a3 length];
  return (id)objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", a3, 0, 0, v5, @"\\\\$1");
}

+ (id)regex
{
  if (regex_onceToken_80 != -1) {
    dispatch_once(&regex_onceToken_80, &__block_literal_global_82);
  }
  return (id)regex_sRegEx_79;
}

uint64_t __58__ABVCardActivityAlertEscapingSerializationStrategy_regex__block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"([=,\\\\\"])" options:0 error:0];
  regex_sRegEx_79 = result;
  return result;
}

@end