@interface CMAMessagesExtensionStorageHelper
+ (void)markFilePurgeableAtURL:(id)a3;
+ (void)markFilesPurgeableForAsset:(id)a3;
@end

@implementation CMAMessagesExtensionStorageHelper

+ (void)markFilePurgeableAtURL:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    uint64_t v9 = 66057;
    id v5 = v3;
    int v6 = fsctl((const char *)[v5 fileSystemRepresentation], 0xC0084A44uLL, &v9, 0);
    v7 = os_log_create("com.apple.camera", "CameraMessagesApp");
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000AD7C((uint64_t)v5, v6, v8);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Marked file purgeable: %{public}@", buf, 0xCu);
    }
  }
}

+ (void)markFilesPurgeableForAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 providedFullsizeImageURL];
  [a1 markFilePurgeableAtURL:v5];

  int v6 = [v4 providedFullsizeRenderImageURL];
  [a1 markFilePurgeableAtURL:v6];

  v7 = [v4 providedVideoURL];
  [a1 markFilePurgeableAtURL:v7];

  id v8 = [v4 providedFullsizeRenderVideoURL];

  [a1 markFilePurgeableAtURL:v8];
}

@end