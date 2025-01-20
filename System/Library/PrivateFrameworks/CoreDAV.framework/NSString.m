@interface NSString
@end

@implementation NSString

void __69__NSString_CoreDAVExtensions__CDVStringByAddingPercentEscapesForHREF__block_invoke()
{
  v0 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 addCharactersInString:@"%"];
  [v3 removeCharactersInString:@"@?:#"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)CDVStringByAddingPercentEscapesForHREF_allowedCharacterSet;
  CDVStringByAddingPercentEscapesForHREF_allowedCharacterSet = v1;
}

void __85__NSString_CoreDAVExtensions__CDVStringByAddingPercentEscapesForHREFIncludingPercent__block_invoke()
{
  v0 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"@?:#"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)CDVStringByAddingPercentEscapesForHREFIncludingPercent_allowedCharacterSet;
  CDVStringByAddingPercentEscapesForHREFIncludingPercent_allowedCharacterSet = v1;
}

void __79__NSString_CoreDAVExtensions__CDVStringByAddingPercentEscapesForUserOrPassword__block_invoke()
{
  v0 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@":@/?#[]&"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)CDVStringByAddingPercentEscapesForUserOrPassword_allowedCharacterSet;
  CDVStringByAddingPercentEscapesForUserOrPassword_allowedCharacterSet = v1;
}

@end