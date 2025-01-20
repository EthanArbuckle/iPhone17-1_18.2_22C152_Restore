@interface RWIProtocolCSSGrouping(IKJSDependency)
+ (id)safe_initWithType:()IKJSDependency;
@end

@implementation RWIProtocolCSSGrouping(IKJSDependency)

+ (id)safe_initWithType:()IKJSDependency
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  v7[0] = &v6;
  id v3 = objc_alloc(MEMORY[0x1E4FB6BE0]);
  v4 = objc_msgSend(v3, "ik_initWithSelectorString:arguments:", @"initWithType:", v7);

  return v4;
}

@end