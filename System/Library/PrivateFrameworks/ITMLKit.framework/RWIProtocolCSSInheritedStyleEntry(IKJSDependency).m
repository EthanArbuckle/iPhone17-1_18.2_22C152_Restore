@interface RWIProtocolCSSInheritedStyleEntry(IKJSDependency)
+ (id)safe_initWithMatchedCSSRules:()IKJSDependency;
@end

@implementation RWIProtocolCSSInheritedStyleEntry(IKJSDependency)

+ (id)safe_initWithMatchedCSSRules:()IKJSDependency
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7[0] = &v6;
  id v3 = objc_alloc(MEMORY[0x1E4FB6BE8]);
  v4 = objc_msgSend(v3, "ik_initWithSelectorString:arguments:", @"initWithMatchedCSSRules:", v7);

  return v4;
}

@end