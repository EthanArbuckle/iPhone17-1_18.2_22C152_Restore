@interface RWIProtocolCSSRuleId(IKJSDependency)
+ (id)safe_initWithStyleSheetId:()IKJSDependency ordinal:;
@end

@implementation RWIProtocolCSSRuleId(IKJSDependency)

+ (id)safe_initWithStyleSheetId:()IKJSDependency ordinal:
{
  v9[2] = *MEMORY[0x1E4F143B8];
  int v7 = a4;
  id v8 = a3;
  v9[0] = &v8;
  v9[1] = &v7;
  id v4 = objc_alloc(MEMORY[0x1E4FB6C10]);
  v5 = objc_msgSend(v4, "ik_initWithSelectorString:arguments:", @"initWithStyleSheetId:ordinal:", v9);

  return v5;
}

@end