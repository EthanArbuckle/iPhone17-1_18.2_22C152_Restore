@interface UIButtonConfiguration(MapsUI)
+ (id)_mapsui_filledButtonConfiguration;
+ (id)_mapsui_grayButtonConfiguration;
+ (id)_mapsui_textButtonConfiguration;
+ (id)_mapsui_textButtonConfigurationWithFont:()MapsUI textColor:;
+ (id)_setupButtonConfiguration:()MapsUI;
@end

@implementation UIButtonConfiguration(MapsUI)

+ (id)_setupButtonConfiguration:()MapsUI
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E4FB2948], *MEMORY[0x1E4FB09E0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__UIButtonConfiguration_MapsUI___setupButtonConfiguration___block_invoke;
  v8[3] = &unk_1E574F9C0;
  id v9 = v4;
  id v5 = v4;
  [v3 setTitleTextAttributesTransformer:v8];
  objc_msgSend(v3, "setContentInsets:", 15.0, 10.0, 15.0, 10.0);
  v6 = [v3 background];
  [v6 setCornerRadius:8.0];

  return v3;
}

+ (id)_mapsui_grayButtonConfiguration
{
  v2 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  id v3 = [a1 _setupButtonConfiguration:v2];

  return v3;
}

+ (id)_mapsui_filledButtonConfiguration
{
  v2 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  id v3 = [a1 _setupButtonConfiguration:v2];

  return v3;
}

+ (id)_mapsui_textButtonConfiguration
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  id v3 = +[MUInfoCardStyle tintColor];
  v4 = objc_msgSend(a1, "_mapsui_textButtonConfigurationWithFont:textColor:", v2, v3);

  return v4;
}

+ (id)_mapsui_textButtonConfigurationWithFont:()MapsUI textColor:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  [v7 setTitleAlignment:1];
  v8 = [v7 background];
  [v8 setBackgroundColorTransformer:&__block_literal_global_14];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__UIButtonConfiguration_MapsUI___mapsui_textButtonConfigurationWithFont_textColor___block_invoke_2;
  v12[3] = &unk_1E574FA08;
  id v13 = v5;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  [v7 setTitleTextAttributesTransformer:v12];

  return v7;
}

@end