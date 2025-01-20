@interface CKWatchfaceInProcessPreviewGenerator
+ (Class)implementation;
+ (void)generateFacePreviewImageFromUrl:(id)a3 completionBlock:(id)a4;
@end

@implementation CKWatchfaceInProcessPreviewGenerator

+ (Class)implementation
{
  if (implementation_onceToken != -1) {
    dispatch_once(&implementation_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)implementation_impl;

  return (Class)v2;
}

uint64_t __54__CKWatchfaceInProcessPreviewGenerator_implementation__block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"NTKGreenfieldUtilities", @"NanoTimeKitCompanion");
  implementation_impl = result;
  return result;
}

+ (void)generateFacePreviewImageFromUrl:(id)a3 completionBlock:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = (void *)[a1 implementation];
  if (v7) {
    [v7 generateFacePreviewImageFromUrl:v8 completionBlock:v6];
  }
  else {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

@end