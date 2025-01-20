@interface RWIProtocolNetworkRequest(IKJSDependency)
+ (id)safe_initWithUrl:()IKJSDependency method:headers:;
@end

@implementation RWIProtocolNetworkRequest(IKJSDependency)

+ (id)safe_initWithUrl:()IKJSDependency method:headers:
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v11 = a4;
  id v10 = a5;
  v13[0] = &v12;
  v13[1] = &v11;
  v13[2] = &v10;
  id v7 = objc_alloc(MEMORY[0x1E4FB6CC0]);
  v8 = objc_msgSend(v7, "ik_initWithSelectorString:arguments:", @"initWithUrl:method:headers:", v13);

  return v8;
}

@end