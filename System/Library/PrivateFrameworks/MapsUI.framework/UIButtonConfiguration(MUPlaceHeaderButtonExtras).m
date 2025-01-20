@interface UIButtonConfiguration(MUPlaceHeaderButtonExtras)
+ (id)_mapsui_configurationForPrimaryType:()MUPlaceHeaderButtonExtras;
+ (id)_mapsui_primaryHeaderActionConfiguration;
+ (id)_mapsui_secondaryHeaderActionConfiguration;
+ (id)_setupDirectionsButtonConfiguration:()MUPlaceHeaderButtonExtras;
@end

@implementation UIButtonConfiguration(MUPlaceHeaderButtonExtras)

+ (id)_mapsui_primaryHeaderActionConfiguration
{
  v2 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  v3 = [a1 _setupDirectionsButtonConfiguration:v2];

  return v3;
}

+ (id)_mapsui_secondaryHeaderActionConfiguration
{
  v2 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  v3 = [a1 _setupDirectionsButtonConfiguration:v2];

  return v3;
}

+ (id)_setupDirectionsButtonConfiguration:()MUPlaceHeaderButtonExtras
{
  id v3 = a3;
  [v3 setTitleTextAttributesTransformer:&__block_literal_global_30];
  [v3 setImagePadding:4.0];
  v4 = [v3 background];
  [v4 setCornerRadius:10.0];

  double v5 = *MEMORY[0x1E4FB12A8];
  double v6 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
  double v7 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  double v8 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  v9 = [v3 background];
  objc_msgSend(v9, "setBackgroundInsets:", v5, v6, v7, v8);

  objc_msgSend(v3, "setContentInsets:", v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E4FB1830];
  v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  v12 = [v10 configurationWithFont:v11];
  [v3 setPreferredSymbolConfigurationForImage:v12];

  [v3 setTitleLineBreakMode:4];
  if (+[MUInfoCardStyle platterStyle] == 1)
  {
    [v3 setBaseBackgroundColor:0];
    v13 = [v3 background];
    [v13 setBackgroundColor:0];

    v14 = +[MUInfoCardStyle tintColor];
    [v3 setBaseForegroundColor:v14];

    v15 = (void *)MEMORY[0x1E4FB1EA0];
    v16 = [MEMORY[0x1E4FB14C8] effectWithStyle:1100];
    v17 = [v15 effectForBlurEffect:v16 style:6];
    v18 = [v3 background];
    [v18 setVisualEffect:v17];
  }
  return v3;
}

+ (id)_mapsui_configurationForPrimaryType:()MUPlaceHeaderButtonExtras
{
  switch(a3)
  {
    case 0:
    case 3:
      uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB14D8], "_mapsui_secondaryHeaderActionConfiguration");
      goto LABEL_4;
    case 1:
    case 4:
      uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB14D8], "_mapsui_primaryHeaderActionConfiguration");
LABEL_4:
      v4 = (void *)v3;
      break;
    case 2:
      v4 = objc_msgSend(MEMORY[0x1E4FB14D8], "_mapsui_primaryHeaderActionConfiguration");
      double v5 = [MEMORY[0x1E4FB1618] systemGreenColor];
      [v4 setBaseBackgroundColor:v5];

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

@end