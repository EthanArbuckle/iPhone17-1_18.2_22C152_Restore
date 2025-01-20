@interface NSString
@end

@implementation NSString

uint64_t __49__NSString_BCSNSStringExtras___bcs_trimmedString__block_invoke()
{
  v0 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v1 = [v0 mutableCopy];
  v2 = (void *)_bcs_trimmedString_whitespaceCharacterSet;
  _bcs_trimmedString_whitespaceCharacterSet = v1;

  v3 = (void *)_bcs_trimmedString_whitespaceCharacterSet;
  return [v3 addCharactersInString:@"﻿"];
}

uint64_t __56__NSString_BCSNSStringExtras___bcs_urlEncodedQueryValue__block_invoke()
{
  v0 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  uint64_t v1 = [v0 mutableCopy];
  v2 = (void *)_bcs_urlEncodedQueryValue_queryValueAllowedCharacters;
  _bcs_urlEncodedQueryValue_queryValueAllowedCharacters = v1;

  v3 = (void *)_bcs_urlEncodedQueryValue_queryValueAllowedCharacters;
  return [v3 removeCharactersInString:@"+=&"];
}

@end