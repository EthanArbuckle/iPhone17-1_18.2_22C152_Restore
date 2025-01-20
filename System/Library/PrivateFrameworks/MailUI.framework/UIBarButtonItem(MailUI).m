@interface UIBarButtonItem(MailUI)
+ (id)_mui_capsuleConfigurationWithTitle:()MailUI titleColor:image:;
+ (id)mui_capsuleButtonItemWithTitle:()MailUI titleColor:imageName:action:;
+ (id)mui_capsuleButtonItemWithTitle:()MailUI titleColor:imageName:menu:;
@end

@implementation UIBarButtonItem(MailUI)

+ (id)mui_capsuleButtonItemWithTitle:()MailUI titleColor:imageName:menu:
{
  v9 = (void *)MEMORY[0x1E4FB14A8];
  v10 = (void *)MEMORY[0x1E4FB1818];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 systemImageNamed:a5];
  v15 = objc_msgSend(v9, "_mui_capsuleConfigurationWithTitle:titleColor:image:", v13, v12, v14);

  v16 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v15 primaryAction:0];
  [v16 setMenu:v11];

  [v16 setShowsMenuAsPrimaryAction:1];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v16];

  return v17;
}

+ (id)mui_capsuleButtonItemWithTitle:()MailUI titleColor:imageName:action:
{
  v9 = (void *)MEMORY[0x1E4FB14A8];
  v10 = (void *)MEMORY[0x1E4FB1818];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 systemImageNamed:a5];
  v15 = objc_msgSend(v9, "_mui_capsuleConfigurationWithTitle:titleColor:image:", v13, v12, v14);

  v16 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v15 primaryAction:v11];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v16];
  return v17;
}

+ (id)_mui_capsuleConfigurationWithTitle:()MailUI titleColor:image:
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4FB14D8];
  id v10 = a5;
  id v11 = [v9 filledButtonConfiguration];
  id v12 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
  [v11 setBaseBackgroundColor:v12];

  [v11 setCornerStyle:4];
  if (v8) {
    [v11 setBaseForegroundColor:v8];
  }
  if (v7)
  {
    objc_msgSend(v11, "setContentInsets:", 7.33333333, 12.0, 7.33333333, 12.0);
    [v11 setTitle:v7];
  }
  else
  {
    objc_msgSend(v11, "setContentInsets:", 5.0, 5.0, 5.0, 5.0);
  }
  uint64_t v13 = *MEMORY[0x1E4FB0928];
  uint64_t v14 = *MEMORY[0x1E4FB27B8];
  v15 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] design:*MEMORY[0x1E4FB0928] variant:1024 weight:*MEMORY[0x1E4FB27B8] maximumContentSizeCategory:0 compatibleWithTraitCollection:*MEMORY[0x1E4FB09E0]];
  v16 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] design:v13 variant:0 weight:v14 maximumContentSizeCategory:0 compatibleWithTraitCollection:*MEMORY[0x1E4FB09D0]];
  v17 = [MEMORY[0x1E4FB1830] configurationWithFont:v16 scale:-1];
  [v11 setPreferredSymbolConfigurationForImage:v17];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__UIBarButtonItem_MailUI___mui_capsuleConfigurationWithTitle_titleColor_image___block_invoke;
  v20[3] = &unk_1E6D13830;
  id v21 = v15;
  id v18 = v15;
  [v11 setTitleTextAttributesTransformer:v20];
  [v11 setImage:v10];

  return v11;
}

@end