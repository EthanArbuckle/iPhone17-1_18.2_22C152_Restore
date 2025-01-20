@interface NSString
@end

@implementation NSString

uint64_t __42__NSString_FMCoreAdditions__fm_wifiToWLAN__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F270A820];
  v1 = (void *)fm_wifiToWLAN_stripWhitespaceWhitelist;
  fm_wifiToWLAN_stripWhitespaceWhitelist = v0;

  uint64_t result = MGGetBoolAnswer();
  fm_wifiToWLAN___wapi = result;
  return result;
}

void __54__NSString_FMCoreAdditions__legacyAllowedCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  v1 = (void *)[v0 mutableCopy];

  [v1 removeCharactersInString:@"!*'();:@&=+$,/?%#[]"];
  v2 = (void *)legacyAllowedCharacterSet_allowedCharSet;
  legacyAllowedCharacterSet_allowedCharSet = (uint64_t)v1;
}

@end