@interface RWIProtocolDOMAccessibilityProperties(IKJSDependency)
+ (id)safe_initWithExists:()IKJSDependency label:nodeId:role:;
@end

@implementation RWIProtocolDOMAccessibilityProperties(IKJSDependency)

+ (id)safe_initWithExists:()IKJSDependency label:nodeId:role:
{
  v15[4] = *MEMORY[0x1E4F143B8];
  char v14 = a3;
  id v13 = a4;
  int v12 = a5;
  id v11 = a6;
  v15[0] = &v14;
  v15[1] = &v13;
  v15[2] = &v12;
  v15[3] = &v11;
  id v8 = objc_alloc(MEMORY[0x1E4FB6C68]);
  v9 = objc_msgSend(v8, "ik_initWithSelectorString:arguments:", @"initWithExists:label:nodeId:role:", v15);

  return v9;
}

@end