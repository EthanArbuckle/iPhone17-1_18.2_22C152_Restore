@interface CXCallDirectoryNSExtensionManager
- (id)installedExtensionsWithError:(id *)a3;
@end

@implementation CXCallDirectoryNSExtensionManager

- (id)installedExtensionsWithError:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100013224;
  v22 = sub_100013234;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100013224;
  v16 = sub_100013234;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001323C;
  v8[3] = &unk_100034D80;
  v10 = &v18;
  v11 = &v12;
  v5 = dispatch_semaphore_create(0);
  v9 = v5;
  [(CXCallDirectoryNSExtensionManager *)self extensionsWithCompletionHandler:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v13[5];
  }
  id v6 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

@end