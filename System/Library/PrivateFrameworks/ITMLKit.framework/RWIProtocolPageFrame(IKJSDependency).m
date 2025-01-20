@interface RWIProtocolPageFrame(IKJSDependency)
+ (id)safe_initWithIdentifier:()IKJSDependency loaderId:url:securityOrigin:mimeType:;
@end

@implementation RWIProtocolPageFrame(IKJSDependency)

+ (id)safe_initWithIdentifier:()IKJSDependency loaderId:url:securityOrigin:mimeType:
{
  v19[5] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v17 = a4;
  id v16 = a5;
  id v15 = a6;
  id v14 = a7;
  v19[0] = &v18;
  v19[1] = &v17;
  v19[2] = &v16;
  v19[3] = &v15;
  v19[4] = &v14;
  id v11 = objc_alloc(MEMORY[0x1E4FB6CF8]);
  v12 = objc_msgSend(v11, "ik_initWithSelectorString:arguments:", @"initWithIdentifier:loaderId:url:securityOrigin:mimeType:", v19);

  return v12;
}

@end