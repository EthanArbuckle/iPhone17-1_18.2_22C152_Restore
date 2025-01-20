@interface NSSet
+ (id)_baassets_collectionClasses;
+ (uint64_t)_baassets_propertyListClasses;
@end

@implementation NSSet

+ (uint64_t)_baassets_propertyListClasses
{
  self;
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
}

+ (id)_baassets_collectionClasses
{
  v4[10] = *MEMORY[0x263EF8340];
  self;
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 setWithArray:v1];

  return v2;
}

@end