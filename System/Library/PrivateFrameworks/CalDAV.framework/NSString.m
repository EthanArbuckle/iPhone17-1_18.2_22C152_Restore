@interface NSString
@end

@implementation NSString

void __52__NSString_CALIDExtensions__stringByEncodingSlashes__block_invoke()
{
  v0 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"/"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)stringByEncodingSlashes_allowedCharacterSet;
  stringByEncodingSlashes_allowedCharacterSet = v1;
}

void __50__NSString_DAVExtensions__stringByURLQuotingPaths__block_invoke()
{
  v0 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"@?"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)stringByURLQuotingPaths_allowedCharacterSet;
  stringByURLQuotingPaths_allowedCharacterSet = v1;
}

void __45__NSString_DAVExtensions__stringByURLQuoting__block_invoke()
{
  v0 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"?"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)stringByURLQuoting_allowedCharacterSet;
  stringByURLQuoting_allowedCharacterSet = v1;
}

@end