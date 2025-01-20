@interface WFContentItemRegistry(ActionKit)
+ (id)allContentItemClassesInActionKit;
@end

@implementation WFContentItemRegistry(ActionKit)

+ (id)allContentItemClassesInActionKit
{
  v2[22] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  v2[15] = objc_opt_class();
  v2[16] = objc_opt_class();
  v2[17] = objc_opt_class();
  v2[18] = objc_opt_class();
  v2[19] = objc_opt_class();
  v2[20] = objc_opt_class();
  v2[21] = objc_opt_class();
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:22];
  return v0;
}

@end