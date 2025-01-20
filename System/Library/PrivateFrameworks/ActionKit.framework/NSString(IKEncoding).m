@interface NSString(IKEncoding)
- (uint64_t)ik_URLEncodedString;
@end

@implementation NSString(IKEncoding)

- (uint64_t)ik_URLEncodedString
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @"!*'();:@&=+$,/?%#[]"),
         "invertedSet");
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

@end