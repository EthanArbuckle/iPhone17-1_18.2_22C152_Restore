@interface FMDVideoAssetValidator
- (BOOL)isValidVideoAtFilePath:(id)a3;
@end

@implementation FMDVideoAssetValidator

- (BOOL)isValidVideoAtFilePath:(id)a3
{
  v3 = +[NSURL fileURLWithPath:a3];
  v4 = +[AVURLAsset URLAssetWithURL:v3 options:0];
  unsigned __int8 v5 = [v4 isPlayable];

  return v5;
}

@end