@interface RWIProtocolCSSShorthandEntry(IKJSDependency)
+ (id)safe_initWithName:()IKJSDependency value:;
@end

@implementation RWIProtocolCSSShorthandEntry(IKJSDependency)

+ (id)safe_initWithName:()IKJSDependency value:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  id v5 = objc_alloc(MEMORY[0x1E4FB6C30]);
  v6 = objc_msgSend(v5, "ik_initWithSelectorString:arguments:", @"initWithName:value:", v10);

  return v6;
}

@end