@interface NSObject(INEnumerable)
- (uint64_t)_intents_enumerateObjectsOfClass:()INEnumerable withBlock:;
@end

@implementation NSObject(INEnumerable)

- (uint64_t)_intents_enumerateObjectsOfClass:()INEnumerable withBlock:
{
  v6 = a4;
  if (objc_opt_class() == a3) {
    uint64_t v7 = v6[2](v6, a1);
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

@end