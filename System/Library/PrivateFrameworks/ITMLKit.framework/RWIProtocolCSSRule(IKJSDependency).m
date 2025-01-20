@interface RWIProtocolCSSRule(IKJSDependency)
+ (id)safe_initWithSelectorList:()IKJSDependency sourceLine:origin:style:;
@end

@implementation RWIProtocolCSSRule(IKJSDependency)

+ (id)safe_initWithSelectorList:()IKJSDependency sourceLine:origin:style:
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  int v14 = a4;
  uint64_t v13 = a5;
  id v12 = a6;
  v16[0] = &v15;
  v16[1] = &v14;
  v16[2] = &v13;
  v16[3] = &v12;
  id v9 = objc_alloc(MEMORY[0x1E4FB6C08]);
  v10 = objc_msgSend(v9, "ik_initWithSelectorString:arguments:", @"initWithSelectorList:sourceLine:origin:style:", v16);

  return v10;
}

@end