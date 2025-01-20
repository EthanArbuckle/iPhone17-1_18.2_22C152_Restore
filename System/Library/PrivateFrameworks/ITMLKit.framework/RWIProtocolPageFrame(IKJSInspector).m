@interface RWIProtocolPageFrame(IKJSInspector)
+ (id)ik_pageFrameFromDOMDocument:()IKJSInspector;
+ (uint64_t)ik_globalFrame;
- (uint64_t)ik_resourceTreeWithResources:()IKJSInspector;
@end

@implementation RWIProtocolPageFrame(IKJSInspector)

+ (uint64_t)ik_globalFrame
{
  return objc_msgSend(MEMORY[0x1E4FB6CF8], "safe_initWithIdentifier:loaderId:url:securityOrigin:mimeType:", @"Inspector", @"Inspector", @"Application", @"Inspector", @"text/xml");
}

+ (id)ik_pageFrameFromDOMDocument:()IKJSInspector
{
  id v3 = a3;
  v4 = [v3 documentElement];
  uint64_t v5 = objc_msgSend(v4, "ik_templateName");
  v6 = (void *)v5;
  v7 = &stru_1F3E09950;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = v7;

  v9 = [v3 _requestLoader];
  uint64_t v10 = [v9 identifier];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"Page";
  }
  v13 = v12;

  v14 = (void *)MEMORY[0x1E4FB6CF8];
  v15 = [v3 documentURI];

  if (v15) {
    v16 = v15;
  }
  else {
    v16 = v8;
  }
  v17 = objc_msgSend(v14, "safe_initWithIdentifier:loaderId:url:securityOrigin:mimeType:", @"Page", v13, v16, @"Inspector", @"text/xml");

  [v17 setName:v8];
  return v17;
}

- (uint64_t)ik_resourceTreeWithResources:()IKJSInspector
{
  return objc_msgSend(MEMORY[0x1E4FB6D08], "safe_initWithFrame:resources:", a1, a3);
}

@end