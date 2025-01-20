@interface RWIProtocolPageCookie(IKJSDependency)
+ (id)safe_initWithName:()IKJSDependency value:domain:path:expires:session:httpOnly:secure:sameSite:;
@end

@implementation RWIProtocolPageCookie(IKJSDependency)

+ (id)safe_initWithName:()IKJSDependency value:domain:path:expires:session:httpOnly:secure:sameSite:
{
  v28[9] = *MEMORY[0x1E4F143B8];
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  double v23 = a1;
  char v22 = a8;
  char v21 = a9;
  char v20 = a10;
  v28[0] = &v27;
  v28[1] = &v26;
  v28[2] = &v25;
  v28[3] = &v24;
  v28[4] = &v23;
  v28[5] = &v22;
  v28[6] = &v21;
  v28[7] = &v20;
  v28[8] = &a11;
  id v17 = objc_alloc(MEMORY[0x1E4FB6CF0]);
  v18 = objc_msgSend(v17, "ik_initWithSelectorString:arguments:", @"initWithName:value:domain:path:expires:session:httpOnly:secure:sameSite:", v28);

  return v18;
}

@end