@interface RWIProtocolCSSPseudoIdMatches(IKJSDependency)
+ (id)safe_initWithPseudoId:()IKJSDependency matches:;
@end

@implementation RWIProtocolCSSPseudoIdMatches(IKJSDependency)

+ (id)safe_initWithPseudoId:()IKJSDependency matches:
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a3;
  id v7 = a4;
  v9[0] = &v8;
  v9[1] = &v7;
  id v4 = objc_alloc(MEMORY[0x1E4FB6C00]);
  v5 = objc_msgSend(v4, "ik_initWithSelectorString:arguments:", @"initWithPseudoId:matches:", v9);

  return v5;
}

@end