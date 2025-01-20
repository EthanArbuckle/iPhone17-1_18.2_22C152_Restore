@interface UIImageView(INUICrossPlatform)
+ (id)_inui_imageViewWithImage:()INUICrossPlatform;
@end

@implementation UIImageView(INUICrossPlatform)

+ (id)_inui_imageViewWithImage:()INUICrossPlatform
{
  v3 = (objc_class *)MEMORY[0x263F1C6D0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithImage:v4];

  return v5;
}

@end