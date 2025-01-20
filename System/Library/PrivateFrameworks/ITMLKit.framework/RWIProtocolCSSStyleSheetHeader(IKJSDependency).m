@interface RWIProtocolCSSStyleSheetHeader(IKJSDependency)
+ (id)safe_initWithStyleSheetId:()IKJSDependency frameId:sourceURL:origin:title:disabled:isInline:startLine:startColumn:;
@end

@implementation RWIProtocolCSSStyleSheetHeader(IKJSDependency)

+ (id)safe_initWithStyleSheetId:()IKJSDependency frameId:sourceURL:origin:title:disabled:isInline:startLine:startColumn:
{
  v30[9] = *MEMORY[0x1E4F143B8];
  id v29 = a5;
  id v28 = a6;
  uint64_t v26 = a8;
  id v27 = a7;
  id v25 = a9;
  char v24 = a10;
  char v23 = a11;
  double v21 = a2;
  double v22 = a1;
  v30[0] = &v29;
  v30[1] = &v28;
  v30[2] = &v27;
  v30[3] = &v26;
  v30[4] = &v25;
  v30[5] = &v24;
  v30[6] = &v23;
  v30[7] = &v22;
  v30[8] = &v21;
  id v18 = objc_alloc(MEMORY[0x1E4FB6C60]);
  v19 = objc_msgSend(v18, "ik_initWithSelectorString:arguments:", @"initWithStyleSheetId:frameId:sourceURL:origin:title:disabled:isInline:startLine:startColumn:", v30);

  return v19;
}

@end