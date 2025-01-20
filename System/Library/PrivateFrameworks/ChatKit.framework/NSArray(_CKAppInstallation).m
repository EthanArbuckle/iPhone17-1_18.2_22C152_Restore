@interface NSArray(_CKAppInstallation)
- (id)__ck_proxyWithBundleIdentifier:()_CKAppInstallation;
@end

@implementation NSArray(_CKAppInstallation)

- (id)__ck_proxyWithBundleIdentifier:()_CKAppInstallation
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__63;
  v15 = __Block_byref_object_dispose__63;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__NSArray__CKAppInstallation____ck_proxyWithBundleIdentifier___block_invoke;
  v8[3] = &unk_1E5628400;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

@end