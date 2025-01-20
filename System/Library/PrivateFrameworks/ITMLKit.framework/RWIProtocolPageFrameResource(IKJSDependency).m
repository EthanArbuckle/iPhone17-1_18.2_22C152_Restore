@interface RWIProtocolPageFrameResource(IKJSDependency)
+ (id)safe_initWithUrl:()IKJSDependency type:mimeType:;
@end

@implementation RWIProtocolPageFrameResource(IKJSDependency)

+ (id)safe_initWithUrl:()IKJSDependency type:mimeType:
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a4;
  id v11 = a3;
  id v9 = a5;
  v12[0] = &v11;
  v12[1] = &v10;
  v12[2] = &v9;
  id v6 = objc_alloc(MEMORY[0x1E4FB6D00]);
  v7 = objc_msgSend(v6, "ik_initWithSelectorString:arguments:", @"initWithUrl:type:mimeType:", v12);

  return v7;
}

@end