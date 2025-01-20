@interface UIImage(MessageUI)
+ (double)mf_scaledImageLayoutValue:()MessageUI forView:;
+ (id)_mf_symbolConfigurationForView:()MessageUI imageSymbolType:;
+ (id)_mf_systemImageNamed:()MessageUI textStyle:scale:weight:imageSymbolType:traits:maximumContentSizeCategory:;
+ (id)mf_assistantBarSystemImageNamed:()MessageUI;
+ (id)mf_imageWithColor:()MessageUI size:;
+ (id)mf_imageWithImage:()MessageUI scaledToSize:;
+ (id)mf_largeContentSizeImageNamed:()MessageUI;
+ (id)mf_symbolConfigurationForImageSymbolType:()MessageUI textStyle:scale:weight:traits:maximumContentSizeCategory:;
+ (id)mf_symbolImageCapAtContentSizeCategoryForView:()MessageUI;
+ (id)mf_symbolImageFontTextStyleForView:()MessageUI;
+ (id)mf_systemImageNamed:()MessageUI forView:;
+ (id)mf_systemImageNamed:()MessageUI textStyle:scale:;
+ (id)mf_systemImageNamed:()MessageUI textStyle:scale:weight:;
+ (id)mf_systemImageNamed:()MessageUI textStyle:scale:weight:maximumContentSizeCategory:;
+ (uint64_t)mf_imageSymbolTypeForView:()MessageUI;
+ (uint64_t)mf_symbolConfigurationForView:()MessageUI;
+ (uint64_t)mf_symbolImageScaleForView:()MessageUI;
+ (uint64_t)mf_symbolImageWeightForView:()MessageUI;
+ (uint64_t)mf_symbolicTraitsForView:()MessageUI;
@end

@implementation UIImage(MessageUI)

+ (uint64_t)mf_symbolConfigurationForView:()MessageUI
{
  v4 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_imageSymbolTypeForView:");

  return objc_msgSend(v4, "_mf_symbolConfigurationForView:imageSymbolType:", a3, v5);
}

+ (id)_mf_symbolConfigurationForView:()MessageUI imageSymbolType:
{
  v7 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolImageFontTextStyleForView:");
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolImageScaleForView:", a3);
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolImageWeightForView:", a3);
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolicTraitsForView:", a3);
  v11 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolImageCapAtContentSizeCategoryForView:", a3);
  v12 = objc_msgSend(a1, "mf_symbolConfigurationForImageSymbolType:textStyle:scale:weight:traits:maximumContentSizeCategory:", a4, v7, v8, v9, v10, v11);

  return v12;
}

+ (id)mf_systemImageNamed:()MessageUI forView:
{
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolImageFontTextStyleForView:", a4);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolImageScaleForView:", a4);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolImageWeightForView:", a4);
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_imageSymbolTypeForView:", a4);
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolicTraitsForView:", a4);
  v11 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolImageCapAtContentSizeCategoryForView:", a4);
  v12 = objc_msgSend(MEMORY[0x1E4FB1818], "_mf_systemImageNamed:textStyle:scale:weight:imageSymbolType:traits:maximumContentSizeCategory:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

+ (uint64_t)mf_symbolicTraitsForView:()MessageUI
{
  v4 = objc_msgSend(a1, "mf_symbolImageCapAtContentSizeCategoryForView:");

  id v5 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);
  uint64_t v7 = (void *)*MEMORY[0x1E4FB27F0];

  if (a3 == 9 || a3 == 22) {
    unsigned int v9 = 2;
  }
  else {
    unsigned int v9 = 0;
  }
  if (IsAccessibilityCategory && v4 != v7) {
    return 0;
  }
  else {
    return v9;
  }
}

+ (id)mf_symbolImageCapAtContentSizeCategoryForView:()MessageUI
{
  id v4 = (id)*MEMORY[0x1E4FB27F0];
  uint64_t v5 = a3 - 11;
  if (unint64_t)(a3 - 11) <= 7 && ((0x93u >> v5))
  {
    id v6 = **((id **)&unk_1E5F7D390 + v5);

    id v4 = v6;
  }

  return v4;
}

+ (uint64_t)mf_symbolImageWeightForView:()MessageUI
{
  uint64_t v3 = 9;
  if (((1 << a3) & 0x400007) == 0) {
    uint64_t v3 = 0;
  }
  if (a3 <= 0x16) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (uint64_t)mf_symbolImageScaleForView:()MessageUI
{
  if (a3 > 0x18) {
    return 2;
  }
  else {
    return qword_1AFA90A10[a3];
  }
}

+ (id)mf_symbolImageFontTextStyleForView:()MessageUI
{
  id v4 = (id)*MEMORY[0x1E4FB28C8];
  uint64_t v5 = (id *)MEMORY[0x1E4FB2988];
  switch(a3)
  {
    case 0xAuLL:
    case 0xCuLL:
    case 0x13uLL:
      uint64_t v5 = (id *)MEMORY[0x1E4FB2950];
      goto LABEL_7;
    case 0xBuLL:
      uint64_t v5 = (id *)MEMORY[0x1E4FB28D8];
      goto LABEL_7;
    case 0xDuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      goto LABEL_8;
    case 0xEuLL:
      goto LABEL_7;
    case 0x14uLL:
      uint64_t v5 = (id *)MEMORY[0x1E4FB28F0];
      goto LABEL_7;
    default:
      if (a3 >= 2) {
        goto LABEL_8;
      }
LABEL_7:
      id v6 = *v5;

      id v4 = v6;
LABEL_8:
      return v4;
  }
}

+ (uint64_t)mf_imageSymbolTypeForView:()MessageUI
{
  if ((unint64_t)(a3 - 11) > 0xD) {
    return 0;
  }
  else {
    return qword_1AFA90AD8[a3 - 11];
  }
}

+ (id)_mf_systemImageNamed:()MessageUI textStyle:scale:weight:imageSymbolType:traits:maximumContentSizeCategory:
{
  id v15 = a3;
  v16 = objc_msgSend(a1, "mf_symbolConfigurationForImageSymbolType:textStyle:scale:weight:traits:maximumContentSizeCategory:", a7, a4, a5, a6, a8, a9);
  v17 = [MEMORY[0x1E4FB1818] systemImageNamed:v15 withConfiguration:v16];

  return v17;
}

+ (id)mf_symbolConfigurationForImageSymbolType:()MessageUI textStyle:scale:weight:traits:maximumContentSizeCategory:
{
  id v13 = a4;
  id v14 = a8;
  if (a6)
  {
    id v15 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v13 scale:a5];
    goto LABEL_14;
  }
  if (!a7)
  {
    v17 = (void *)*MEMORY[0x1E4FB28C8];
    if (v13) {
      v17 = v13;
    }
    id v16 = v17;

    v18 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    v19 = v18;
    if (a3 == 1)
    {
      uint64_t v20 = [MEMORY[0x1E4FB1438] _defaultContentSizeCategory];
    }
    else
    {
      if (a3 != 2)
      {
LABEL_12:
        CTFontDescriptorGetTextStyleSize();
        id v15 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithPointSize:weight:scale:", 0, a5);

        goto LABEL_13;
      }
      uint64_t v20 = MFUIContentSizeCategoryMin(v18, v14);
    }
    v21 = (void *)v20;

    v19 = v21;
    goto LABEL_12;
  }
  MEMORY[0x1B3E86420](v13, a7);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  id v15 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v16 scale:a5];
LABEL_13:
  id v13 = v16;
LABEL_14:

  return v15;
}

+ (id)mf_imageWithColor:()MessageUI size:
{
  id v7 = a5;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", a1, a2);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__UIImage_MessageUI__mf_imageWithColor_size___block_invoke;
  v12[3] = &unk_1E5F7D370;
  id v9 = v7;
  id v13 = v9;
  double v14 = a1;
  double v15 = a2;
  uint64_t v10 = [v8 imageWithActions:v12];

  return v10;
}

+ (id)mf_systemImageNamed:()MessageUI textStyle:scale:
{
  uint64_t v5 = objc_msgSend(a1, "mf_systemImageNamed:textStyle:scale:weight:", a3, a4, a5, 0);

  return v5;
}

+ (id)mf_systemImageNamed:()MessageUI textStyle:scale:weight:
{
  id v6 = objc_msgSend(a1, "mf_systemImageNamed:textStyle:scale:weight:maximumContentSizeCategory:", a3, a4, a5, a6, *MEMORY[0x1E4FB27F0]);

  return v6;
}

+ (id)mf_systemImageNamed:()MessageUI textStyle:scale:weight:maximumContentSizeCategory:
{
  id v7 = objc_msgSend(a1, "_mf_systemImageNamed:textStyle:scale:weight:imageSymbolType:traits:maximumContentSizeCategory:", a3, a4, a5, a6, 2, 0, a7);

  return v7;
}

+ (id)mf_assistantBarSystemImageNamed:()MessageUI
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1818], "_mf_systemImageNamed:textStyle:scale:weight:imageSymbolType:traits:maximumContentSizeCategory:", a3, *MEMORY[0x1E4FB28C8], 3, 0, 1, 0, *MEMORY[0x1E4FB27F0]);

  return v3;
}

+ (id)mf_largeContentSizeImageNamed:()MessageUI
{
  v0 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:");
  [v0 size];
  if (v1 > 0.0 && v2 > 0.0)
  {
    if (v1 >= v2)
    {
      if (v1 <= v2)
      {
        double v3 = 75.0;
        double v4 = 75.0;
      }
      else
      {
        double v4 = 75.0;
        double v3 = v2 * 75.0 / v1;
      }
    }
    else
    {
      double v3 = 75.0;
      double v4 = v1 * 75.0 / v2;
    }
    uint64_t v5 = objc_msgSend(v0, "imageByPreparingThumbnailOfSize:", v4, v3);

    v0 = (void *)v5;
  }

  return v0;
}

+ (id)mf_imageWithImage:()MessageUI scaledToSize:
{
  id v7 = a5;
  [v7 size];
  double v9 = v8;
  [v7 size];
  double v11 = a2 / v10;
  if (a1 / v9 >= v11) {
    double v12 = v11;
  }
  else {
    double v12 = a1 / v9;
  }
  [v7 size];
  double v14 = v13;
  [v7 size];
  double v16 = v15;
  v20.width = a1;
  v20.height = a2;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  objc_msgSend(v7, "drawInRect:", (a1 - v12 * v14) * 0.5, (a2 - v12 * v16) * 0.5);
  v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

+ (double)mf_scaledImageLayoutValue:()MessageUI forView:
{
  id v6 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolImageFontTextStyleForView:");
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_imageSymbolTypeForView:", a4);
  if (!v7)
  {
    double v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v6];
    [v9 _scaledValueForValue:a1];
    a1 = v12;
    goto LABEL_5;
  }
  if (v7 == 2)
  {
    double v8 = (void *)MEMORY[0x1E4FB08E0];
    double v9 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolImageCapAtContentSizeCategoryForView:", a4);
    double v10 = [v8 _preferredFontForTextStyle:v6 maximumContentSizeCategory:v9];
    [v10 _scaledValueForValue:a1];
    a1 = v11;

LABEL_5:
  }

  return a1;
}

@end