@interface NSString(AskPermission)
- (id)ap_percentEncodedString;
@end

@implementation NSString(AskPermission)

- (id)ap_percentEncodedString
{
  v2 = [MEMORY[0x263F08708] URLHostAllowedCharacterSet];
  v3 = [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  return v3;
}

@end