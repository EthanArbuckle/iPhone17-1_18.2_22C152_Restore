@interface MPUTheme
+ (double)tableViewContentLeftInset;
+ (id)_themeAssetCache;
+ (id)cachedObjectWithKey:(id)a3 block:(id)a4;
+ (id)disabledPlaybackControlColor;
@end

@implementation MPUTheme

+ (id)cachedObjectWithKey:(id)a3 block:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (v6)
  {
    v8 = [a1 _themeAssetCache];
    v9 = [v8 objectForKey:v6];

    if (v7)
    {
      if (!v9)
      {
        v9 = v7[2](v7);
        if (v9)
        {
          v10 = [a1 _themeAssetCache];
          [v10 setObject:v9 forKey:v6];
        }
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)disabledPlaybackControlColor
{
  v3 = NSStringFromSelector(a2);
  v4 = [a1 cachedObjectWithKey:v3 block:&__block_literal_global];

  return v4;
}

uint64_t __40__MPUTheme_disabledPlaybackControlColor__block_invoke()
{
  return [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.15];
}

+ (double)tableViewContentLeftInset
{
  return 15.0;
}

+ (id)_themeAssetCache
{
  if (_themeAssetCache___onceToken != -1) {
    dispatch_once(&_themeAssetCache___onceToken, &__block_literal_global_3);
  }
  v2 = (void *)_themeAssetCache___themeAssetCache;
  return v2;
}

uint64_t __28__MPUTheme__themeAssetCache__block_invoke()
{
  _themeAssetCache___themeAssetCache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);
  return MEMORY[0x270F9A758]();
}

@end