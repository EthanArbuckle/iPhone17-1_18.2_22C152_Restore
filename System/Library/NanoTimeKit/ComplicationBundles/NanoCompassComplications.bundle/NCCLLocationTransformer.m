@interface NCCLLocationTransformer
+ (id)allowedTopLevelClasses;
@end

@implementation NCCLLocationTransformer

+ (id)allowedTopLevelClasses
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v2, (uint64_t)v5, 1);

  return v3;
}

@end