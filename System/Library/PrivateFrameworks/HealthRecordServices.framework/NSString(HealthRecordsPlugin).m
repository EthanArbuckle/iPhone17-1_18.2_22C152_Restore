@interface NSString(HealthRecordsPlugin)
- (id)hk_base64PaddedString;
@end

@implementation NSString(HealthRecordsPlugin)

- (id)hk_base64PaddedString
{
  if (([a1 length] & 3) != 0)
  {
    v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v3 = [a1 stringByTrimmingCharactersInSet:v2];
    id v4 = (id)[v3 mutableCopy];

    unint64_t v5 = [v4 length] | 0xFFFFFFFFFFFFFFFCLL;
    do
      [v4 appendString:@"="];
    while (!__CFADD__(v5++, 1));
  }
  else
  {
    id v4 = a1;
  }

  return v4;
}

@end