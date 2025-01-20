@interface RWIProtocolCSSSelector(IKJSDependency)
+ (id)safe_initWithText:()IKJSDependency;
@end

@implementation RWIProtocolCSSSelector(IKJSDependency)

+ (id)safe_initWithText:()IKJSDependency
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7[0] = &v6;
  id v3 = objc_alloc(MEMORY[0x1E4FB6C20]);
  v4 = objc_msgSend(v3, "ik_initWithSelectorString:arguments:", @"initWithText:", v7);

  return v4;
}

@end