@interface NSDictionary(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (id)cmsCoded;
@end

@implementation NSDictionary(CMSCoding)

- (id)cmsCoded
{
  v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__NSDictionary_CMSCoding__cmsCoded__block_invoke;
  v5[3] = &unk_2648882C8;
  id v3 = v2;
  id v6 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];

  return v3;
}

+ (id)instanceFromCMSCoded:()CMSCoding
{
  id v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (v3) {
    v5 = (void *)[v3 copy];
  }
  else {
    v5 = 0;
  }

  return v5;
}

@end