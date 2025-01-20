@interface NSString(ECHTMLEntityParser)
- (id)ec_parseHTMLEntity;
- (uint64_t)ec_parseHTMLEntityCharacter;
@end

@implementation NSString(ECHTMLEntityParser)

- (id)ec_parseHTMLEntity
{
  id v3 = 0;
  parseEntity(a1, &v3);
  id v1 = v3;
  return v1;
}

- (uint64_t)ec_parseHTMLEntityCharacter
{
  return parseEntity(a1, 0);
}

@end