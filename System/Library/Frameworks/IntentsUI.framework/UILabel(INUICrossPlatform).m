@interface UILabel(INUICrossPlatform)
+ (id)_inui_labelWithText:()INUICrossPlatform;
@end

@implementation UILabel(INUICrossPlatform)

+ (id)_inui_labelWithText:()INUICrossPlatform
{
  v3 = (objc_class *)MEMORY[0x263F1C768];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "_inui_setText:", v4);

  return v5;
}

@end