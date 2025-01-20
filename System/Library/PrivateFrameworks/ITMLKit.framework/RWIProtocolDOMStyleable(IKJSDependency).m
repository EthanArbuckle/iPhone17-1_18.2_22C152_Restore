@interface RWIProtocolDOMStyleable(IKJSDependency)
+ (id)safe_initWithNodeId:()IKJSDependency;
@end

@implementation RWIProtocolDOMStyleable(IKJSDependency)

+ (id)safe_initWithNodeId:()IKJSDependency
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int v6 = a3;
  v7[0] = &v6;
  id v3 = objc_alloc(MEMORY[0x1E4FB6C98]);
  v4 = objc_msgSend(v3, "ik_initWithSelectorString:arguments:", @"initWithNodeId:", v7);

  return v4;
}

@end