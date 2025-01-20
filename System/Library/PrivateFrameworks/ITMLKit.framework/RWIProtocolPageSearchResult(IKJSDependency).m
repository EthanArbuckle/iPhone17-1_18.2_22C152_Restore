@interface RWIProtocolPageSearchResult(IKJSDependency)
+ (id)safe_initWithUrl:()IKJSDependency frameId:matchesCount:;
@end

@implementation RWIProtocolPageSearchResult(IKJSDependency)

+ (id)safe_initWithUrl:()IKJSDependency frameId:matchesCount:
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v11 = a5;
  double v10 = a1;
  v13[0] = &v12;
  v13[1] = &v11;
  v13[2] = &v10;
  id v7 = objc_alloc(MEMORY[0x1E4FB6D10]);
  v8 = objc_msgSend(v7, "ik_initWithSelectorString:arguments:", @"initWithUrl:frameId:matchesCount:", v13);

  return v8;
}

@end