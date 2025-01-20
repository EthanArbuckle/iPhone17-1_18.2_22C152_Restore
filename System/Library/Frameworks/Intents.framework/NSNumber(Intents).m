@interface NSNumber(Intents)
- (BOOL)_intents_isDouble;
- (BOOL)_intents_isInteger;
@end

@implementation NSNumber(Intents)

- (BOOL)_intents_isDouble
{
  v1 = (const char *)[a1 objCType];
  return !strcmp(v1, "f") || strcmp(v1, "d") == 0;
}

- (BOOL)_intents_isInteger
{
  v1 = (const char *)[a1 objCType];
  return !strcmp(v1, "i")
      || !strcmp(v1, "I")
      || !strcmp(v1, "s")
      || !strcmp(v1, "S")
      || !strcmp(v1, "q")
      || strcmp(v1, "Q") == 0;
}

@end