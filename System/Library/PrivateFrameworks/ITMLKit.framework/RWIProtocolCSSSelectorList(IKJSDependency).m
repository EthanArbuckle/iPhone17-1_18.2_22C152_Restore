@interface RWIProtocolCSSSelectorList(IKJSDependency)
+ (id)safe_initWithSelectors:()IKJSDependency text:;
@end

@implementation RWIProtocolCSSSelectorList(IKJSDependency)

+ (id)safe_initWithSelectors:()IKJSDependency text:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  id v5 = objc_alloc(MEMORY[0x1E4FB6C28]);
  v6 = objc_msgSend(v5, "ik_initWithSelectorString:arguments:", @"initWithSelectors:text:", v10);

  return v6;
}

@end