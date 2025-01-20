@interface RWIProtocolDOMEventListener(IKJSDependency)
+ (id)safe_initWithEventListenerId:()IKJSDependency type:useCapture:isAttribute:;
@end

@implementation RWIProtocolDOMEventListener(IKJSDependency)

+ (id)safe_initWithEventListenerId:()IKJSDependency type:useCapture:isAttribute:
{
  v15[4] = *MEMORY[0x1E4F143B8];
  int v14 = a3;
  id v13 = a4;
  char v12 = a5;
  char v11 = a6;
  v15[0] = &v14;
  v15[1] = &v13;
  v15[2] = &v12;
  v15[3] = &v11;
  id v8 = objc_alloc(MEMORY[0x1E4FB6C78]);
  v9 = objc_msgSend(v8, "ik_initWithSelectorString:arguments:", @"initWithEventListenerId:type:useCapture:isAttribute:", v15);

  return v9;
}

@end