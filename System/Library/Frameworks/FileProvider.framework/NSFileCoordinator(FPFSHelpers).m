@interface NSFileCoordinator(FPFSHelpers)
+ (id)fp_fileCoordinatorForCurrentProcess:()FPFSHelpers;
@end

@implementation NSFileCoordinator(FPFSHelpers)

+ (id)fp_fileCoordinatorForCurrentProcess:()FPFSHelpers
{
  v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 infoDictionary];
  v7 = [v6 valueForKeyPath:@"NSExtension.NSExtensionPointIdentifier"];
  v8 = v7;
  if (v3)
  {
    v9 = v4;
    v10 = v3;
LABEL_3:
    [v9 setPurposeIdentifier:v10];
    goto LABEL_4;
  }
  if ([v7 isEqualToString:@"com.apple.fileprovider-nonui"])
  {
    v12 = [v5 bundleIdentifier];
    int v13 = objc_msgSend(v12, "fp_isiCloudDriveOrCloudDocsIdentifier");

    if (v13)
    {
      v10 = @"com.apple.bird";
      v9 = v4;
      goto LABEL_3;
    }
    v14 = [v5 bundleIdentifier];
    [v4 setPurposeIdentifier:v14];
  }
LABEL_4:

  return v4;
}

@end