@interface FBSBundleInfo(CarPlayApp)
- (id)_iconKeyForFormat:()CarPlayApp;
- (id)iconWithFormat:()CarPlayApp;
@end

@implementation FBSBundleInfo(CarPlayApp)

- (id)_iconKeyForFormat:()CarPlayApp
{
  v4 = NSString;
  v5 = [a1 bundleIdentifier];
  v6 = [v4 stringWithFormat:@"%@-%d", v5, a3];

  return v6;
}

- (id)iconWithFormat:()CarPlayApp
{
  if (iconWithFormat__onceToken != -1) {
    dispatch_once(&iconWithFormat__onceToken, &__block_literal_global_176);
  }
  v5 = [a1 _iconKeyForFormat:a3];
  v6 = [(id)iconWithFormat__iconCache objectForKey:v5];
  if (!v6)
  {
    v7 = [a1 bundleIdentifier];
    v8 = [MEMORY[0x263F82B60] _carScreen];
    [v8 scale];
    double v9 = DBIconImageInfoForScale();
    v6 = DBIconImageForBundleIdentifierWithInfoAndBorder(v7, 0, v9, v10, v11, v12);

    if (v6) {
      [(id)iconWithFormat__iconCache setObject:v6 forKey:v5];
    }
  }

  return v6;
}

@end