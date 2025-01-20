@interface LSApplicationProxy(_CKAppInstallation)
- (id)__ck_messagesPluginKitProxy;
@end

@implementation LSApplicationProxy(_CKAppInstallation)

- (id)__ck_messagesPluginKitProxy
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__63;
  v9 = __Block_byref_object_dispose__63;
  id v10 = 0;
  v1 = [a1 plugInKitPlugins];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__LSApplicationProxy__CKAppInstallation____ck_messagesPluginKitProxy__block_invoke;
  v4[3] = &unk_1E562B2D0;
  v4[4] = &v5;
  [v1 enumerateObjectsUsingBlock:v4];

  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

@end