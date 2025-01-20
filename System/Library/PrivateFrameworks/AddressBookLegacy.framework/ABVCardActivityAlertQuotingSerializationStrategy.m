@interface ABVCardActivityAlertQuotingSerializationStrategy
+ (BOOL)strategyWouldAlterString:(id)a3;
+ (id)regex;
+ (id)serializeString:(id)a3;
@end

@implementation ABVCardActivityAlertQuotingSerializationStrategy

+ (BOOL)strategyWouldAlterString:(id)a3
{
  return [a3 rangeOfString:@" "] != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)serializeString:(id)a3
{
  v5 = (void *)[a3 mutableCopy];
  objc_msgSend((id)objc_msgSend(a1, "regex"), "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(a3, "length"), @"\\\\$1");
  [v5 insertString:@"\"" atIndex:0];
  [v5 appendString:@"\""];
  return v5;
}

+ (id)regex
{
  if (regex_onceToken != -1) {
    dispatch_once(&regex_onceToken, &__block_literal_global_16);
  }
  return (id)regex_sRegEx;
}

uint64_t __57__ABVCardActivityAlertQuotingSerializationStrategy_regex__block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"([\"])" options:0 error:0];
  regex_sRegEx = result;
  return result;
}

@end