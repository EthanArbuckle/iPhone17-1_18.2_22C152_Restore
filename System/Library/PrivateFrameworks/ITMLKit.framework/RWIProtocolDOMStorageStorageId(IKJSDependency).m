@interface RWIProtocolDOMStorageStorageId(IKJSDependency)
+ (id)safe_initWithSecurityOrigin:()IKJSDependency isLocalStorage:;
@end

@implementation RWIProtocolDOMStorageStorageId(IKJSDependency)

+ (id)safe_initWithSecurityOrigin:()IKJSDependency isLocalStorage:
{
  v9[2] = *MEMORY[0x1E4F143B8];
  char v7 = a4;
  id v8 = a3;
  v9[0] = &v8;
  v9[1] = &v7;
  id v4 = objc_alloc(MEMORY[0x1E4FB6C90]);
  v5 = objc_msgSend(v4, "ik_initWithSelectorString:arguments:", @"initWithSecurityOrigin:isLocalStorage:", v9);

  return v5;
}

@end