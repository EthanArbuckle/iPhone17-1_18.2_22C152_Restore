@interface RWIProtocolDOMRGBAColor(IKJSDependency)
+ (id)safe_initWithR:()IKJSDependency g:b:;
@end

@implementation RWIProtocolDOMRGBAColor(IKJSDependency)

+ (id)safe_initWithR:()IKJSDependency g:b:
{
  v11[3] = *MEMORY[0x1E4F143B8];
  int v9 = a4;
  int v10 = a3;
  int v8 = a5;
  v11[0] = &v10;
  v11[1] = &v9;
  v11[2] = &v8;
  id v5 = objc_alloc(MEMORY[0x1E4FB6C88]);
  v6 = objc_msgSend(v5, "ik_initWithSelectorString:arguments:", @"initWithR:g:b:", v11);

  return v6;
}

@end