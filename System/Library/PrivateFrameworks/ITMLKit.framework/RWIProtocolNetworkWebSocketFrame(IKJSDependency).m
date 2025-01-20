@interface RWIProtocolNetworkWebSocketFrame(IKJSDependency)
+ (id)safe_initWithOpcode:()IKJSDependency mask:payloadData:payloadLength:;
@end

@implementation RWIProtocolNetworkWebSocketFrame(IKJSDependency)

+ (id)safe_initWithOpcode:()IKJSDependency mask:payloadData:payloadLength:
{
  v14[4] = *MEMORY[0x1E4F143B8];
  double v13 = a1;
  char v12 = a5;
  id v11 = a6;
  double v10 = a2;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v14[3] = &v10;
  id v7 = objc_alloc(MEMORY[0x1E4FB6CD8]);
  v8 = objc_msgSend(v7, "ik_initWithSelectorString:arguments:", @"initWithOpcode:mask:payloadData:payloadLength:", v14);

  return v8;
}

@end