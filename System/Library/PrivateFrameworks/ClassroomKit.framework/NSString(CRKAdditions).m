@interface NSString(CRKAdditions)
+ (uint64_t)crk_stringWithIPAddress:()CRKAdditions;
- (BOOL)crk_hasCaseInsensitivePrefix:()CRKAdditions;
- (id)crk_sha1Hash;
- (id)crk_stringByRemovingPrefix:()CRKAdditions;
- (id)crk_stringByRemovingSuffix:()CRKAdditions;
- (id)crk_stringBySanitizingFileName;
- (id)crk_substringAfterString:()CRKAdditions;
- (uint64_t)crk_isFourDigitPasscode;
@end

@implementation NSString(CRKAdditions)

- (id)crk_stringBySanitizingFileName
{
  v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"/\\?%*|\"<>:,&"];
  v3 = [a1 componentsSeparatedByCharactersInSet:v2];
  v4 = [v3 componentsJoinedByString:&stru_26D7E7B00];

  v5 = [MEMORY[0x263F08708] newlineCharacterSet];
  v6 = [v4 componentsSeparatedByCharactersInSet:v5];
  v7 = [v6 componentsJoinedByString:&stru_26D7E7B00];

  return v7;
}

+ (uint64_t)crk_stringWithIPAddress:()CRKAdditions
{
  v3 = NSString;
  v5 = inet_ntoa(a3);

  return [v3 stringWithUTF8String:v5];
}

- (id)crk_sha1Hash
{
  v1 = [a1 dataUsingEncoding:4];
  v2 = objc_msgSend(v1, "crk_sha1Hash");

  return v2;
}

- (id)crk_stringByRemovingPrefix:()CRKAdditions
{
  id v4 = a3;
  if ([a1 hasPrefix:v4])
  {
    uint64_t v5 = objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
  }
  else
  {
    uint64_t v5 = [a1 copy];
  }
  v6 = (void *)v5;

  return v6;
}

- (id)crk_stringByRemovingSuffix:()CRKAdditions
{
  id v4 = a3;
  if ([a1 hasSuffix:v4])
  {
    uint64_t v5 = objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length"));
  }
  else
  {
    uint64_t v5 = [a1 copy];
  }
  v6 = (void *)v5;

  return v6;
}

- (uint64_t)crk_isFourDigitPasscode
{
  if ([a1 length] != 4) {
    return 0;
  }
  if (![a1 length]) {
    return 1;
  }
  unint64_t v2 = 0;
  do
  {
    unsigned int v3 = ([a1 characterAtIndex:v2] << 24) - 788529153;
    BOOL v4 = v3 < 0xAFFFFFF;
    if (v3 >= 0xAFFFFFF) {
      break;
    }
    ++v2;
  }
  while (v2 < [a1 length]);
  return v4;
}

- (id)crk_substringAfterString:()CRKAdditions
{
  uint64_t v2 = objc_msgSend(a1, "rangeOfString:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = [a1 substringFromIndex:v2 + v3];
  }

  return v4;
}

- (BOOL)crk_hasCaseInsensitivePrefix:()CRKAdditions
{
  id v4 = a3;
  BOOL v6 = [v4 length]
    && (unint64_t v5 = [a1 length], v5 >= objc_msgSend(v4, "length"))
    && objc_msgSend(a1, "rangeOfString:options:range:", v4, 1, 0, objc_msgSend(v4, "length")) == 0;

  return v6;
}

@end