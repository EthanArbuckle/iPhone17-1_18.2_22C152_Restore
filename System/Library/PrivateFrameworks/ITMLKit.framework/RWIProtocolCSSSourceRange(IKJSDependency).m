@interface RWIProtocolCSSSourceRange(IKJSDependency)
+ (id)safe_initWithStartLine:()IKJSDependency startColumn:endLine:endColumn:;
@end

@implementation RWIProtocolCSSSourceRange(IKJSDependency)

+ (id)safe_initWithStartLine:()IKJSDependency startColumn:endLine:endColumn:
{
  v13[4] = *MEMORY[0x1E4F143B8];
  int v11 = a4;
  int v12 = a3;
  int v9 = a6;
  int v10 = a5;
  v13[0] = &v12;
  v13[1] = &v11;
  v13[2] = &v10;
  v13[3] = &v9;
  id v6 = objc_alloc(MEMORY[0x1E4FB6C38]);
  v7 = objc_msgSend(v6, "ik_initWithSelectorString:arguments:", @"initWithStartLine:startColumn:endLine:endColumn:", v13);

  return v7;
}

@end