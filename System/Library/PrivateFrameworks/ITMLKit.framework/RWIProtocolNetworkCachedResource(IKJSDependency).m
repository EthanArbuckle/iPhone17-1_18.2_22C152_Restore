@interface RWIProtocolNetworkCachedResource(IKJSDependency)
+ (id)safe_initWithUrl:()IKJSDependency type:bodySize:;
@end

@implementation RWIProtocolNetworkCachedResource(IKJSDependency)

+ (id)safe_initWithUrl:()IKJSDependency type:bodySize:
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a5;
  id v11 = a4;
  double v9 = a1;
  v12[0] = &v11;
  v12[1] = &v10;
  v12[2] = &v9;
  id v6 = objc_alloc(MEMORY[0x1E4FB6CA0]);
  v7 = objc_msgSend(v6, "ik_initWithSelectorString:arguments:", @"initWithUrl:type:bodySize:", v12);

  return v7;
}

@end