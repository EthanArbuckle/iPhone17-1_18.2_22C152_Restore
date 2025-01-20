@interface CEKLightingControlItem
+ (id)_defaultOutlineImage;
- (CEKLightingControlItem)initWithType:(int64_t)a3;
- (NSString)displayName;
- (UIImage)displayImage;
- (UIImage)displayOutlineImage;
- (UIImage)displayShadowImage;
- (UIImage)selectionBackgroundImage;
- (int64_t)lightingType;
@end

@implementation CEKLightingControlItem

+ (id)_defaultOutlineImage
{
  if (_defaultOutlineImage_onceToken != -1) {
    dispatch_once(&_defaultOutlineImage_onceToken, &__block_literal_global_433);
  }
  v2 = (void *)_defaultOutlineImage_kDefaultOutlineImage;
  return v2;
}

void __46__CEKLightingControlItem__defaultOutlineImage__block_invoke()
{
  v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v0 scale];
  double v2 = v1;

  v10.width = 1.0 / v2 + 31.0 + 2.0 / v2 * 2.0;
  v10.height = v10.width;
  UIGraphicsBeginImageContextWithOptions(v10, 0, v2);
  CurrentContext = UIGraphicsGetCurrentContext();
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v4 setStroke];

  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0 / v2 + 31.0 + 2.0 / v2 * 2.0;
  v11.size.height = v11.size.width;
  CGRect v12 = CGRectInset(v11, 2.0 / v2, 2.0 / v2);
  CGContextStrokeEllipseInRect(CurrentContext, v12);
  uint64_t v5 = UIGraphicsGetImageFromCurrentImageContext();
  v6 = (void *)_defaultOutlineImage_kDefaultOutlineImage;
  _defaultOutlineImage_kDefaultOutlineImage = v5;

  uint64_t v7 = [(id)_defaultOutlineImage_kDefaultOutlineImage imageWithRenderingMode:2];
  v8 = (void *)_defaultOutlineImage_kDefaultOutlineImage;
  _defaultOutlineImage_kDefaultOutlineImage = v7;

  UIGraphicsEndImageContext();
}

- (CEKLightingControlItem)initWithType:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CEKLightingControlItem;
  v4 = [(CEKLightingControlItem *)&v17 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_lightingType = a3;
    uint64_t v6 = +[CEKLightingEffectManager displayNameForLightingType:a3];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = +[CEKLightingEffectManager displayImageForLightingType:a3];
    displayImage = v5->_displayImage;
    v5->_displayImage = (UIImage *)v8;

    CGSize v10 = (void *)MEMORY[0x1E4FB1818];
    CGRect v11 = CEKFrameworkBundle();
    uint64_t v12 = [v10 imageNamed:@"CEKLightingShadow" inBundle:v11];
    displayShadowImage = v5->_displayShadowImage;
    v5->_displayShadowImage = (UIImage *)v12;

    if ((unint64_t)(a3 - 2) <= 4)
    {
      uint64_t v14 = [(id)objc_opt_class() _defaultOutlineImage];
      displayOutlineImage = v5->_displayOutlineImage;
      v5->_displayOutlineImage = (UIImage *)v14;
    }
  }
  return v5;
}

- (int64_t)lightingType
{
  return self->_lightingType;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (UIImage)displayImage
{
  return self->_displayImage;
}

- (UIImage)displayShadowImage
{
  return self->_displayShadowImage;
}

- (UIImage)displayOutlineImage
{
  return self->_displayOutlineImage;
}

- (UIImage)selectionBackgroundImage
{
  return self->_selectionBackgroundImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionBackgroundImage, 0);
  objc_storeStrong((id *)&self->_displayOutlineImage, 0);
  objc_storeStrong((id *)&self->_displayShadowImage, 0);
  objc_storeStrong((id *)&self->_displayImage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end