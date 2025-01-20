@interface NSMutableDictionary(Utilities)
+ (id)dictionaryOfChangesBetween:()Utilities and:;
- (uint64_t)setObject:()Utilities forKey:objectIfNil:;
- (void)copyToKey:()Utilities fromKey:inDictionary:objectIfNil:;
@end

@implementation NSMutableDictionary(Utilities)

- (uint64_t)setObject:()Utilities forKey:objectIfNil:
{
  if (!a3) {
    a3 = a5;
  }
  return objc_msgSend(a1, "setObject:forKey:", a3);
}

- (void)copyToKey:()Utilities fromKey:inDictionary:objectIfNil:
{
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = [a5 objectForKey:a4];
  id v14 = (id)v12;
  if (v12) {
    id v13 = (id)v12;
  }
  else {
    id v13 = v10;
  }
  [a1 setObject:v13 forKey:v11];
}

+ (id)dictionaryOfChangesBetween:()Utilities and:
{
  v0 = (void *)MEMORY[0x263EFF9A0];
  v1 = objc_msgSend(NSDictionary, "dictionaryOfChangesBetween:and:");
  v2 = [v0 dictionaryWithDictionary:v1];

  return v2;
}

@end