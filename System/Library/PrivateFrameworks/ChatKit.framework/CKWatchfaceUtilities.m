@interface CKWatchfaceUtilities
+ (void)addWatchFaceAtURL:(id)a3 completionHandler:(id)a4;
@end

@implementation CKWatchfaceUtilities

+ (void)addWatchFaceAtURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _WatchFaceLibrary_onceToken;
  id v6 = a4;
  id v7 = a3;
  id v9 = v7;
  if (v5 == -1)
  {
    id v8 = v7;
  }
  else
  {
    dispatch_once(&_WatchFaceLibrary_onceToken, &__block_literal_global_152);
    id v8 = v9;
  }
  [(id)_WatchFaceLibrary_library _addWatchFaceAtURL:v8 shouldValidate:0 completionHandler:v6];
}

@end