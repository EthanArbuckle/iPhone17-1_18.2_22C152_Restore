@interface RWIProtocolNetworkResponse(IKJSDependency)
+ (id)safe_initWithUrl:()IKJSDependency status:statusText:headers:mimeType:source:;
@end

@implementation RWIProtocolNetworkResponse(IKJSDependency)

+ (id)safe_initWithUrl:()IKJSDependency status:statusText:headers:mimeType:source:
{
  v22[6] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  int v20 = a4;
  id v19 = a5;
  id v18 = a6;
  uint64_t v16 = a8;
  id v17 = a7;
  v22[0] = &v21;
  v22[1] = &v20;
  v22[2] = &v19;
  v22[3] = &v18;
  v22[4] = &v17;
  v22[5] = &v16;
  id v13 = objc_alloc(MEMORY[0x1E4FB6CD0]);
  v14 = objc_msgSend(v13, "ik_initWithSelectorString:arguments:", @"initWithUrl:status:statusText:headers:mimeType:source:", v22);

  return v14;
}

@end