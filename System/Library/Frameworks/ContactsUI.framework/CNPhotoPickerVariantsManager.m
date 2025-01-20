@interface CNPhotoPickerVariantsManager
+ (id)avatarBackgroundsFromDictionary:(id)a3;
+ (id)avatarPoseConfigurationsForAvatarRecord:(id)a3;
+ (id)colorFromRGBArray:(id)a3;
+ (id)colorFromRGBString:(id)a3;
+ (id)colorGradientBackground:(id)a3;
+ (id)colorVariantWithColorNamed:(id)a3;
+ (id)compositeColorForTopColor:(id)a3 bottomColor:(id)a4;
+ (id)defaultEmojisFromDictionary:(id)a3;
+ (id)generateGradientColorsByColor;
+ (id)generateMonogramGradientColorsByColor;
+ (id)gradientBackgroundImageForColor:(id)a3;
+ (id)gradientBackgroundImageForColor:(id)a3 bottomColor:(id)a4;
+ (id)gradientStartColor:(id)a3;
+ (id)monogramColorGradientBackground:(id)a3;
+ (id)nonAlphaColorForBackgroundColor:(id)a3;
+ (id)sharingProfileAvatarPoseConfigurationForAvatarRecord:(id)a3;
- (CNPhotoPickerVariantsManager)init;
- (NSArray)avatarBackgrounds;
- (NSArray)defaultEmojis;
- (id)randomColorVariant;
- (void)setAvatarBackgrounds:(id)a3;
- (void)setDefaultEmojis:(id)a3;
@end

@implementation CNPhotoPickerVariantsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultEmojis, 0);

  objc_storeStrong((id *)&self->_avatarBackgrounds, 0);
}

- (void)setDefaultEmojis:(id)a3
{
}

- (NSArray)defaultEmojis
{
  return self->_defaultEmojis;
}

- (void)setAvatarBackgrounds:(id)a3
{
}

- (NSArray)avatarBackgrounds
{
  return self->_avatarBackgrounds;
}

- (id)randomColorVariant
{
  v3 = [(CNPhotoPickerVariantsManager *)self avatarBackgrounds];
  uint64_t v4 = arc4random_uniform([v3 count]);

  v5 = [(CNPhotoPickerVariantsManager *)self avatarBackgrounds];
  v6 = [v5 objectAtIndexedSubscript:v4];

  return v6;
}

- (CNPhotoPickerVariantsManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)CNPhotoPickerVariantsManager;
  v2 = [(CNPhotoPickerVariantsManager *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 pathForResource:@"PhotoPickerVariants" ofType:@"plist"];

    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
    uint64_t v6 = [(id)objc_opt_class() avatarBackgroundsFromDictionary:v5];
    avatarBackgrounds = v2->_avatarBackgrounds;
    v2->_avatarBackgrounds = (NSArray *)v6;

    uint64_t v8 = [(id)objc_opt_class() defaultEmojisFromDictionary:v5];
    defaultEmojis = v2->_defaultEmojis;
    v2->_defaultEmojis = (NSArray *)v8;

    v10 = v2;
  }

  return v2;
}

+ (id)generateMonogramGradientColorsByColor
{
  v3 = [MEMORY[0x1E4F89D48] availableColors];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  objc_super v12 = __69__CNPhotoPickerVariantsManager_generateMonogramGradientColorsByColor__block_invoke;
  v13 = &unk_1E5497020;
  id v5 = v4;
  id v14 = v5;
  id v15 = a1;
  objc_msgSend(v3, "_cn_each:", &v10);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F89D48], "defaultGradientStartColor", v10, v11, v12, v13);
  v7 = [(id)objc_opt_class() gradientBackgroundImageForColor:v6];
  [v5 setObject:v7 forKeyedSubscript:v6];

  id v8 = v5;
  return v8;
}

void __69__CNPhotoPickerVariantsManager_generateMonogramGradientColorsByColor__block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 color];
  v3 = [(id)objc_opt_class() gradientBackgroundImageForColor:v4];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
}

+ (id)generateGradientColorsByColor
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 pathForResource:@"PhotoPickerVariants" ofType:@"plist"];

  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = [v5 objectForKeyedSubscript:@"avatarBackgrounds"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__CNPhotoPickerVariantsManager_generateGradientColorsByColor__block_invoke;
  v10[3] = &unk_1E5496FF8;
  id v12 = a1;
  id v8 = v6;
  id v11 = v8;
  objc_msgSend(v7, "_cn_each:", v10);

  return v8;
}

void __61__CNPhotoPickerVariantsManager_generateGradientColorsByColor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 objectForKeyedSubscript:@"rgbValuesTop"];
  id v4 = [v3 objectForKeyedSubscript:@"rgbValuesBottom"];

  id v5 = [*(id *)(a1 + 40) colorFromRGBArray:v8];
  uint64_t v6 = [*(id *)(a1 + 40) colorFromRGBArray:v4];
  v7 = [(id)objc_opt_class() gradientBackgroundImageForColor:v5 bottomColor:v6];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

+ (id)gradientBackgroundImageForColor:(id)a3 bottomColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGBitmapContextCreate(0, 0x32uLL, 0x32uLL, 8uLL, 0xC8uLL, DeviceRGB, 1u);
  uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
  id v11 = [v10 colorWithAlphaComponent:1.0];
  CGContextSetFillColorWithColor(v9, (CGColorRef)[v11 CGColor]);

  v22.size.width = 50.0;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.height = 50.0;
  CGContextFillRect(v9, v22);
  Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x1E4F1D510]);
  id v13 = v6;
  CFArrayAppendValue(Mutable, (const void *)[v13 CGColor]);
  if (v7)
  {
    CFArrayAppendValue(Mutable, (const void *)[v7 CGColor]);
  }
  else
  {
    id v14 = [a1 gradientStartColor:v13];
    CFArrayAppendValue(Mutable, (const void *)[v14 CGColor]);
  }
  id v15 = CGGradientCreateWithColors(DeviceRGB, Mutable, 0);
  v21.y = 50.0;
  v20.x = 0.0;
  v20.y = 0.0;
  v21.x = 0.0;
  CGContextDrawLinearGradient(v9, v15, v20, v21, 0);
  Image = CGBitmapContextCreateImage(v9);
  v17 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image];
  CGImageRelease(Image);
  CGGradientRelease(v15);
  CGContextRelease(v9);
  CGColorSpaceRelease(DeviceRGB);
  CFRelease(Mutable);

  return v17;
}

+ (id)gradientBackgroundImageForColor:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() gradientBackgroundImageForColor:v3 bottomColor:0];

  return v4;
}

+ (id)compositeColorForTopColor:(id)a3 bottomColor:(id)a4
{
  double v14 = 0.0;
  double v15 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  id v5 = a3;
  [a4 getRed:&v15 green:&v14 blue:&v13 alpha:&v12];
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  [v5 getRed:&v11 green:&v10 blue:&v9 alpha:&v8];

  id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", ((1.0 - v8) * (v12 * v15) + v11 * v8) / (v8 + v12 * (1.0 - v8)), ((1.0 - v8) * (v12 * v14) + v10 * v8) / (v8 + v12 * (1.0 - v8)), ((1.0 - v8) * (v12 * v13) + v9 * v8) / (v8 + v12 * (1.0 - v8)));

  return v6;
}

+ (id)nonAlphaColorForBackgroundColor:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  id v6 = [v4 compositeColorForTopColor:v3 bottomColor:v5];

  return v6;
}

+ (id)gradientStartColor:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  id v6 = [v5 colorWithAlphaComponent:0.3];
  id v7 = [v4 compositeColorForTopColor:v6 bottomColor:v3];

  return v7;
}

+ (id)colorGradientBackground:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CNPhotoPickerVariantsManager_colorGradientBackground___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = colorGradientBackground__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&colorGradientBackground__onceToken, block);
  }
  id v5 = [(id)colorGradientBackground__gradientColors objectForKeyedSubscript:v4];

  return v5;
}

void __56__CNPhotoPickerVariantsManager_colorGradientBackground___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) generateGradientColorsByColor];
  v2 = (void *)colorGradientBackground__gradientColors;
  colorGradientBackground__gradientColors = v1;
}

+ (id)monogramColorGradientBackground:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CNPhotoPickerVariantsManager_monogramColorGradientBackground___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (monogramColorGradientBackground__onceToken == -1)
  {
    if (v4)
    {
LABEL_3:
      id v6 = [(id)monogramColorGradientBackground__gradientColors objectForKeyedSubscript:v5];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&monogramColorGradientBackground__onceToken, block);
    if (v5) {
      goto LABEL_3;
    }
  }
  id v7 = [MEMORY[0x1E4F89D48] defaultGradientStartColor];
  id v6 = [(id)monogramColorGradientBackground__gradientColors objectForKeyedSubscript:v7];

LABEL_6:

  return v6;
}

void __64__CNPhotoPickerVariantsManager_monogramColorGradientBackground___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) generateMonogramGradientColorsByColor];
  v2 = (void *)monogramColorGradientBackground__gradientColors;
  monogramColorGradientBackground__gradientColors = v1;
}

+ (id)sharingProfileAvatarPoseConfigurationForAvatarRecord:(id)a3
{
  uint64_t v3 = [a1 avatarPoseConfigurationsForAvatarRecord:a3];
  id v4 = objc_msgSend(v3, "_cn_firstObjectPassingTest:", &__block_literal_global_39);
  if (!v4)
  {
    if ([v3 count])
    {
      id v4 = [v3 objectAtIndexedSubscript:0];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

uint64_t __85__CNPhotoPickerVariantsManager_sharingProfileAvatarPoseConfigurationForAvatarRecord___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = [v2 isEqual:@"big_happy"];

  return v3;
}

+ (id)avatarPoseConfigurationsForAvatarRecord:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v4 = (void *)getAVTPoseSelectionViewControllerClass_softClass;
  uint64_t v12 = getAVTPoseSelectionViewControllerClass_softClass;
  if (!getAVTPoseSelectionViewControllerClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getAVTPoseSelectionViewControllerClass_block_invoke;
    v8[3] = &unk_1E549AD00;
    v8[4] = &v9;
    __getAVTPoseSelectionViewControllerClass_block_invoke((uint64_t)v8);
    id v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [v5 poseConfigurationsForTypes:0 avatarRecord:v3];

  return v6;
}

+ (id)colorVariantWithColorNamed:(id)a3
{
  id v3 = a3;
  id v4 = +[CNPhotoPickerVariantsManager colorFromRGBString:v3];
  id v5 = [[CNPhotoPickerColorVariant alloc] initWithColor:v4 named:v3];

  return v5;
}

+ (id)colorFromRGBString:(id)a3
{
  uint64_t v3 = colorFromRGBString__cn_once_token_1;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&colorFromRGBString__cn_once_token_1, &__block_literal_global_6115);
  }
  id v5 = (id)colorFromRGBString__cn_once_object_1;
  id v6 = [v4 componentsSeparatedByString:@":"];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__CNPhotoPickerVariantsManager_colorFromRGBString___block_invoke_2;
  v11[3] = &unk_1E5496FB0;
  id v12 = v5;
  id v7 = v5;
  double v8 = objc_msgSend(v6, "_cn_map:", v11);

  uint64_t v9 = [(id)objc_opt_class() colorFromRGBArray:v8];

  return v9;
}

uint64_t __51__CNPhotoPickerVariantsManager_colorFromRGBString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) numberFromString:a2];
}

void __51__CNPhotoPickerVariantsManager_colorFromRGBString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v0 setNumberStyle:1];
  uint64_t v1 = (void *)colorFromRGBString__cn_once_object_1;
  colorFromRGBString__cn_once_object_1 = (uint64_t)v0;
}

+ (id)colorFromRGBArray:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 2)
  {
    +[CNUIColorRepository photoPickerAvatarBackgroundDefaultColor];
  }
  else
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    [v4 floatValue];
    double v6 = (float)(v5 / 255.0);

    id v7 = [v3 objectAtIndexedSubscript:1];
    [v7 floatValue];
    double v9 = (float)(v8 / 255.0);

    double v10 = [v3 objectAtIndexedSubscript:2];
    [v10 floatValue];
    double v12 = (float)(v11 / 255.0);

    [MEMORY[0x1E4FB1618] colorWithRed:v6 green:v9 blue:v12 alpha:1.0];
  double v13 = };

  return v13;
}

+ (id)defaultEmojisFromDictionary:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__CNPhotoPickerVariantsManager_defaultEmojisFromDictionary___block_invoke;
  v9[3] = &unk_1E5499220;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = defaultEmojisFromDictionary__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&defaultEmojisFromDictionary__onceToken, v9);
  }
  id v7 = (id)defaultEmojisFromDictionary__defaultEmojis;

  return v7;
}

void __60__CNPhotoPickerVariantsManager_defaultEmojisFromDictionary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"defaultEmojis"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__CNPhotoPickerVariantsManager_defaultEmojisFromDictionary___block_invoke_2;
  v5[3] = &__block_descriptor_40_e49___CNPhotoPickerDefaultEmoji_16__0__NSDictionary_8l;
  v5[4] = *(void *)(a1 + 40);
  uint64_t v3 = objc_msgSend(v2, "_cn_map:", v5);
  id v4 = (void *)defaultEmojisFromDictionary__defaultEmojis;
  defaultEmojisFromDictionary__defaultEmojis = v3;
}

CNPhotoPickerDefaultEmoji *__60__CNPhotoPickerVariantsManager_defaultEmojisFromDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"emojiString"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"backgroundColor"];

  id v6 = [v5 componentsJoinedByString:@":"];
  id v7 = [*(id *)(a1 + 32) colorFromRGBArray:v5];
  float v8 = [CNPhotoPickerDefaultEmoji alloc];
  double v9 = [[CNPhotoPickerColorVariant alloc] initWithColor:v7 named:v6];
  id v10 = [(CNPhotoPickerDefaultEmoji *)v8 initWithEmojiString:v4 colorVariant:v9];

  return v10;
}

+ (id)avatarBackgroundsFromDictionary:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CNPhotoPickerVariantsManager_avatarBackgroundsFromDictionary___block_invoke;
  v9[3] = &unk_1E5499220;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = avatarBackgroundsFromDictionary__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&avatarBackgroundsFromDictionary__onceToken, v9);
  }
  id v7 = (id)avatarBackgroundsFromDictionary__avatarBackgrounds;

  return v7;
}

void __64__CNPhotoPickerVariantsManager_avatarBackgroundsFromDictionary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"avatarBackgrounds"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__CNPhotoPickerVariantsManager_avatarBackgroundsFromDictionary___block_invoke_2;
  v5[3] = &__block_descriptor_40_e49___CNPhotoPickerColorVariant_16__0__NSDictionary_8l;
  v5[4] = *(void *)(a1 + 40);
  uint64_t v3 = objc_msgSend(v2, "_cn_map:", v5);
  id v4 = (void *)avatarBackgroundsFromDictionary__avatarBackgrounds;
  avatarBackgroundsFromDictionary__avatarBackgrounds = v3;
}

CNPhotoPickerColorVariant *__64__CNPhotoPickerVariantsManager_avatarBackgroundsFromDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"rgbValuesTop"];
  id v4 = [v3 componentsJoinedByString:@":"];
  uint64_t v5 = [*(id *)(a1 + 32) colorFromRGBArray:v3];
  id v6 = [[CNPhotoPickerColorVariant alloc] initWithColor:v5 named:v4];

  return v6;
}

@end