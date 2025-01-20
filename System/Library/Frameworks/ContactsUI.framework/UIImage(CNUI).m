@interface UIImage(CNUI)
+ (id)cnui_actionTypeForTransportType:()CNUI;
+ (id)cnui_carPlayUserActionSymbolImageForActionType:()CNUI;
+ (id)cnui_imageNamed:()CNUI;
+ (id)cnui_imageWithDataPreservingScale:()CNUI;
+ (id)cnui_roundedNavButtonPlatterImage;
+ (id)cnui_symbolImageForContactCardChevron;
+ (id)cnui_symbolImageForContactCardMenuChevron;
+ (id)cnui_symbolImageForDynamicallySizedContactCardChevron;
+ (id)cnui_symbolImageForNavigationListChevron;
+ (id)cnui_symbolImageForTransportType:()CNUI withColor:;
+ (id)cnui_symbolImageForUnknownNumberContactCardChevron;
+ (id)cnui_symbolImageNamed:()CNUI scale:weight:withColor:useFixedSize:compatibleWithTextStyle:;
+ (id)cnui_templateImageNamed:()CNUI withTint:;
+ (id)cnui_tintedImageNamed:()CNUI withTint:;
+ (id)cnui_userActionOutlinedSymbolImageForActionType:()CNUI scale:withColor:;
+ (id)cnui_userActionSymbolImageForActionType:()CNUI scale:withColor:compatibleWithTextStyle:;
+ (uint64_t)cnui_symbolImageForContactCardChevronWithColor:()CNUI;
+ (uint64_t)cnui_symbolImageForDynamicallySizedContactCardChevronWithColor:()CNUI;
+ (uint64_t)cnui_symbolImageForUnknownNumberContactCardChevronWithColor:()CNUI;
+ (uint64_t)cnui_symbolImageNamed:()CNUI scale:withColor:useFixedSize:;
+ (uint64_t)cnui_symbolImageNamed:()CNUI scale:withColor:useFixedSize:compatibleWithTextStyle:;
+ (uint64_t)cnui_userActionSymbolImageForActionType:()CNUI scale:withColor:;
- (uint64_t)cnui_CGImageSnapshot;
@end

@implementation UIImage(CNUI)

- (uint64_t)cnui_CGImageSnapshot
{
  if ([a1 ioSurface])
  {
    v2 = (CGImage *)UICreateCGImageFromIOSurface();
    [a1 size];
    double v4 = v3;
    [a1 size];
    double v6 = v5;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v8 = CGBitmapContextCreate(0, (unint64_t)v4, (unint64_t)v6, 8uLL, vcvtd_n_u64_f64(v4, 2uLL), DeviceRGB, 1u);
    v14.origin.x = 0.0;
    v14.origin.y = 0.0;
    v14.size.width = v4;
    v14.size.height = v6;
    CGContextDrawImage(v8, v14, v2);
    CGImageRef Image = CGBitmapContextCreateImage(v8);
    CGImageRef v10 = Image;
    if (Image) {
      CFAutorelease(Image);
    }
    if (v2) {
      CFRelease(v2);
    }
    CGColorSpaceRelease(DeviceRGB);
    if (v8) {
      CFRelease(v8);
    }
    return (uint64_t)v10;
  }
  else
  {
    id v12 = a1;
    return [v12 CGImage];
  }
}

+ (id)cnui_roundedNavButtonPlatterImage
{
  v0 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_imageNamed:", @"contact-card-nav-button-platter");
  v1 = objc_msgSend(v0, "imageWithAlignmentRectInsets:", 0.0, 4.0, 0.0, 4.0);

  return v1;
}

+ (id)cnui_symbolImageNamed:()CNUI scale:weight:withColor:useFixedSize:compatibleWithTextStyle:
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a8;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v16 = 0;
  }
  else
  {
    if (a7)
    {
      v17 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
      v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v15 compatibleWithTraitCollection:v17];
      v19 = (void *)MEMORY[0x1E4FB1830];
      [v18 pointSize];
      v20 = objc_msgSend(v19, "configurationWithPointSize:weight:scale:", a5, a4);
    }
    else
    {
      v20 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v15 scale:a4];
    }
    v21 = [MEMORY[0x1E4FB1818] _systemImageNamed:v13 withConfiguration:v20];
    v16 = v21;
    if (v14)
    {
      v22 = [v21 imageWithTintColor:v14];

      v16 = [v22 imageWithRenderingMode:1];
    }
  }

  return v16;
}

+ (uint64_t)cnui_symbolImageNamed:()CNUI scale:withColor:useFixedSize:compatibleWithTextStyle:
{
  return objc_msgSend(a1, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", a3, a4, 0, a5, a6, a7);
}

+ (uint64_t)cnui_symbolImageNamed:()CNUI scale:withColor:useFixedSize:
{
  return objc_msgSend(a1, "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", a3, a4, a5, a6, *MEMORY[0x1E4FB28C8]);
}

+ (id)cnui_carPlayUserActionSymbolImageForActionType:()CNUI
{
  v2 = objc_msgSend(MEMORY[0x1E4F5A740], "symbolImageNameForActionType:");
  double v3 = objc_msgSend(a1, "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", v2, 2, 0, 1, *MEMORY[0x1E4FB28D0]);

  return v3;
}

+ (id)cnui_userActionSymbolImageForActionType:()CNUI scale:withColor:compatibleWithTextStyle:
{
  v9 = (void *)MEMORY[0x1E4F5A740];
  id v10 = a6;
  id v11 = a5;
  id v12 = [v9 symbolImageNameForActionType:a3];
  id v13 = objc_msgSend(a1, "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", v12, 2, v11, 1, v10);

  return v13;
}

+ (uint64_t)cnui_userActionSymbolImageForActionType:()CNUI scale:withColor:
{
  return objc_msgSend(a1, "cnui_userActionSymbolImageForActionType:scale:withColor:compatibleWithTextStyle:", a3, a4, a5, *MEMORY[0x1E4FB28C8]);
}

+ (id)cnui_userActionOutlinedSymbolImageForActionType:()CNUI scale:withColor:
{
  uint64_t v7 = *MEMORY[0x1E4FB28C8];
  v8 = (void *)MEMORY[0x1E4F5A740];
  id v9 = a5;
  id v10 = [v8 symbolOulinedImageNameForActionType:a3];
  id v11 = objc_msgSend(a1, "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", v10, 2, v9, 1, v7);

  return v11;
}

+ (id)cnui_actionTypeForTransportType:()CNUI
{
  uint64_t v4 = a3 - 1;
  if (unint64_t)(a3 - 1) <= 6 && ((0x5Fu >> v4))
  {
    id v5 = **((id **)&unk_1E549BD60 + v4);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)cnui_symbolImageForTransportType:()CNUI withColor:
{
  if (a3 == 6)
  {
    uint64_t v5 = *MEMORY[0x1E4FB28C8];
    id v6 = a4;
    uint64_t v7 = objc_msgSend(a1, "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", @"staroflife.fill", 3, v6, 1, v5);
  }
  else
  {
    id v9 = a4;
    objc_msgSend(a1, "cnui_actionTypeForTransportType:", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = objc_msgSend(a1, "cnui_userActionSymbolImageForActionType:scale:withColor:", v6, 2, v9);
  }

  return v7;
}

+ (id)cnui_symbolImageForContactCardMenuChevron
{
  v2 = +[CNUIColorRepository contactCardChevronImageColor];
  uint64_t v3 = objc_msgSend(a1, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", @"chevron.up.chevron.down", 1, 7, v2, 0, *MEMORY[0x1E4FB28C8]);

  return v3;
}

+ (id)cnui_symbolImageForNavigationListChevron
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  v1 = +[CNUIColorRepository navigationListDisclosureImageColor];
  v2 = objc_msgSend(v0, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", @"chevron.down", 1, 7, v1, 0, *MEMORY[0x1E4FB28C8]);

  return v2;
}

+ (uint64_t)cnui_symbolImageForUnknownNumberContactCardChevronWithColor:()CNUI
{
  return objc_msgSend(a1, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", @"chevron.up.chevron.down", 1, 7, a3, 0, *MEMORY[0x1E4FB28C8]);
}

+ (id)cnui_symbolImageForUnknownNumberContactCardChevron
{
  v2 = +[CNUIColorRepository contactCardChevronImageColor];
  uint64_t v3 = objc_msgSend(a1, "cnui_symbolImageForUnknownNumberContactCardChevronWithColor:", v2);

  return v3;
}

+ (uint64_t)cnui_symbolImageForDynamicallySizedContactCardChevronWithColor:()CNUI
{
  return objc_msgSend(a1, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", @"chevron.forward", 1, 7, a3, 0, *MEMORY[0x1E4FB28C8]);
}

+ (id)cnui_symbolImageForDynamicallySizedContactCardChevron
{
  v2 = +[CNUIColorRepository contactCardChevronImageColor];
  uint64_t v3 = objc_msgSend(a1, "cnui_symbolImageForDynamicallySizedContactCardChevronWithColor:", v2);

  return v3;
}

+ (uint64_t)cnui_symbolImageForContactCardChevronWithColor:()CNUI
{
  return objc_msgSend(a1, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", @"chevron.forward", 1, 7, a3, 1, *MEMORY[0x1E4FB28C8]);
}

+ (id)cnui_symbolImageForContactCardChevron
{
  v2 = +[CNUIColorRepository contactCardChevronImageColor];
  uint64_t v3 = objc_msgSend(a1, "cnui_symbolImageForContactCardChevronWithColor:", v2);

  return v3;
}

+ (id)cnui_imageWithDataPreservingScale:()CNUI
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] _initWithData:v4 preserveScale:1];

  return v5;
}

+ (id)cnui_tintedImageNamed:()CNUI withTint:
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a1, "cnui_imageNamed:", a3);
  v8 = v7;
  if (v6)
  {
    id v9 = [v7 imageWithTintColor:v6];
  }
  else
  {
    id v9 = v7;
  }
  id v10 = v9;

  return v10;
}

+ (id)cnui_imageNamed:()CNUI
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  uint64_t v5 = CNContactsUIBundle();
  id v6 = [v3 imageNamed:v4 inBundle:v5];

  return v6;
}

+ (id)cnui_templateImageNamed:()CNUI withTint:
{
  id v6 = a3;
  id v7 = a4;
  if (cnui_templateImageNamed_withTint__cn_once_token_1 != -1) {
    dispatch_once(&cnui_templateImageNamed_withTint__cn_once_token_1, &__block_literal_global_64825);
  }
  id v8 = (id)cnui_templateImageNamed_withTint__cn_once_object_1;
  id v9 = v8;
  if (v6)
  {
    id v10 = [v8 objectForKey:v6];
    if (!v10)
    {
      id v11 = objc_msgSend(a1, "cnui_imageNamed:", v6);
      id v10 = [v11 imageWithRenderingMode:2];

      [v9 setObject:v10 forKey:v6];
    }
    if (v7)
    {
      uint64_t v12 = [v10 imageWithTintColor:v7];

      id v10 = (void *)v12;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end