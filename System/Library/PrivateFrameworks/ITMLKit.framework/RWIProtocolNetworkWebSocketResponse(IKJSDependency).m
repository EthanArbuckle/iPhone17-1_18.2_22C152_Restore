@interface RWIProtocolNetworkWebSocketResponse(IKJSDependency)
+ (id)safe_initWithStatus:()IKJSDependency statusText:headers:;
@end

@implementation RWIProtocolNetworkWebSocketResponse(IKJSDependency)

+ (id)safe_initWithStatus:()IKJSDependency statusText:headers:
{
  v12[3] = *MEMORY[0x1E4F143B8];
  int v11 = a3;
  id v10 = a4;
  id v9 = a5;
  v12[0] = &v11;
  v12[1] = &v10;
  v12[2] = &v9;
  id v6 = objc_alloc(MEMORY[0x1E4FB6CE8]);
  v7 = objc_msgSend(v6, "ik_initWithSelectorString:arguments:", @"initWithStatus:statusText:headers:", v12);

  return v7;
}

@end