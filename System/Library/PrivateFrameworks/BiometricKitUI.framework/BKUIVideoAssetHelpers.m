@interface BKUIVideoAssetHelpers
+ (id)iPadVideoURLForAssetName:(id)a3;
@end

@implementation BKUIVideoAssetHelpers

+ (id)iPadVideoURLForAssetName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 URLForResource:v4 withExtension:@"mov" subdirectory:@"iPad_videos"];

  return v6;
}

@end