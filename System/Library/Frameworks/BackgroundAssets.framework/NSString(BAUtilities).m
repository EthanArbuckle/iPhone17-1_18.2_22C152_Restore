@interface NSString(BAUtilities)
- (__CFString)_baassets_stringByRemovingLastIdentifierComponent;
- (id)_baassets_validUTI;
- (id)_baassets_validUTIWithWildcard;
@end

@implementation NSString(BAUtilities)

- (__CFString)_baassets_stringByRemovingLastIdentifierComponent
{
  uint64_t v2 = [a1 rangeOfString:@"." options:4];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = &stru_26DAF5988;
  }
  else
  {
    v3 = [a1 substringToIndex:v2];
  }

  return v3;
}

- (id)_baassets_validUTI
{
  uint64_t v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-."];
  v3 = [v2 invertedSet];

  v4 = [a1 stringByTrimmingCharactersInSet:v3];

  return v4;
}

- (id)_baassets_validUTIWithWildcard
{
  uint64_t v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-.*"];
  v3 = [v2 invertedSet];

  v4 = [a1 stringByTrimmingCharactersInSet:v3];

  return v4;
}

@end