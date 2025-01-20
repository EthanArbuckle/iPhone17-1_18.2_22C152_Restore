@interface NSMapTable(SCNExtensions)
- (void)scn_enumerateKeysAndValuesUsingBlock:()SCNExtensions;
@end

@implementation NSMapTable(SCNExtensions)

- (void)scn_enumerateKeysAndValuesUsingBlock:()SCNExtensions
{
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, a1);
  value = 0;
  key = 0;
  do
  {
    if (!NSNextMapEnumeratorPair(&enumerator, &key, &value)) {
      break;
    }
    char v4 = 0;
    (*(void (**)(uint64_t, void *, void *, char *))(a3 + 16))(a3, key, value, &v4);
  }
  while (!v4);
  NSEndMapTableEnumeration(&enumerator);
}

@end