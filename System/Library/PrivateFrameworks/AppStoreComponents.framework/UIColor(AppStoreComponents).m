@interface UIColor(AppStoreComponents)
+ (id)_asc_highlightBlendColor;
+ (id)asc_colorWithLightColor:()AppStoreComponents darkColor:;
- (id)asc_highlightedColor;
@end

@implementation UIColor(AppStoreComponents)

+ (id)_asc_highlightBlendColor
{
  if (_asc_highlightBlendColor_onceToken != -1) {
    dispatch_once(&_asc_highlightBlendColor_onceToken, &__block_literal_global_34);
  }
  v0 = (void *)_asc_highlightBlendColor_highlightBlendColor;

  return v0;
}

+ (id)asc_colorWithLightColor:()AppStoreComponents darkColor:
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__UIColor_AppStoreComponents__asc_colorWithLightColor_darkColor___block_invoke;
  v12[3] = &unk_1E645ED18;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  v10 = [a1 colorWithDynamicProvider:v12];

  return v10;
}

- (id)asc_highlightedColor
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1618], "_asc_highlightBlendColor");
  v3 = [a1 _colorBlendedWithColor:v2];

  return v3;
}

@end