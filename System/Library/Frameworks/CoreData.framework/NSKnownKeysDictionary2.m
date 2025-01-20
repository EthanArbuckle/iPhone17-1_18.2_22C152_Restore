@interface NSKnownKeysDictionary2
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (id)newInstanceWithSearchStrategy:(id)a3 inData:(id)a4;
@end

@implementation NSKnownKeysDictionary2

+ (id)newInstanceWithSearchStrategy:(id)a3 inData:(id)a4
{
  uint64_t v6 = [a3 length];
  if (v6 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  id result = _PFAllocateObject((Class)a1, 8 * v7);
  *((void *)result + 2) = a3;
  *((_DWORD *)result + 3) = -1;
  return result;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 0;
}

@end