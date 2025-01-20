@interface NSBundle(ARAdditions)
- (__CFString)ar_pathForPrivateResourceBundlePath;
- (id)ar_pathForPrivateResource:()ARAdditions ofType:;
@end

@implementation NSBundle(ARAdditions)

- (__CFString)ar_pathForPrivateResourceBundlePath
{
  return @"/AppleInternal/Library/Bundles/ARKitInternalExtras.bundle";
}

- (id)ar_pathForPrivateResource:()ARAdditions ofType:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.ARKitInternalExtras"];
  if (!v8)
  {
    v9 = ARKitCoreBundle();
    v10 = [v9 bundlePath];
    v11 = [v10 stringByDeletingLastPathComponent];
    v12 = [v11 stringByAppendingPathComponent:@"ARKitInternalExtras.bundle"];

    v8 = [MEMORY[0x1E4F28B50] bundleWithPath:v12];

    if (!v8)
    {
      v13 = (void *)MEMORY[0x1E4F28B50];
      v14 = objc_msgSend(a1, "ar_pathForPrivateResourceBundlePath");
      v8 = [v13 bundleWithPath:v14];
    }
  }
  v15 = [v8 pathForResource:v6 ofType:v7];

  return v15;
}

@end