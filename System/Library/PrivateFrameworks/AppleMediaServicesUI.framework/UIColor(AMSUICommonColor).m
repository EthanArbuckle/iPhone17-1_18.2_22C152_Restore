@interface UIColor(AMSUICommonColor)
+ (AMSUICommonDynamicColor)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:lightHighContrastColor:darkHighContrastColor:;
+ (id)_colorIdentifierDictionary;
+ (id)ams_colorFromDictionary:()AMSUICommonColor;
+ (id)ams_colorFromHexString:()AMSUICommonColor;
+ (id)ams_dynamicColorFromDictionary:()AMSUICommonColor;
+ (id)ams_namedColorFromDictionary:()AMSUICommonColor;
+ (id)ams_rgbColorFromDictionary:()AMSUICommonColor;
+ (uint64_t)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:;
+ (uint64_t)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:darkHighContrastColor:;
+ (uint64_t)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:lightHighContrastColor:;
- (BOOL)ams_isDark;
- (BOOL)ams_isLight;
@end

@implementation UIColor(AMSUICommonColor)

+ (id)ams_colorFromHexString:()AMSUICommonColor
{
  id v3 = a3;
  v4 = v3;
  if ([v3 hasPrefix:@"#"])
  {
    v4 = [v3 substringFromIndex:1];
  }
  if ((unint64_t)[v4 length] < 6)
  {
    v5 = 0;
    goto LABEL_21;
  }
  int v25 = 256;
  v6 = objc_msgSend(v4, "substringWithRange:", 0, 2);
  v7 = [MEMORY[0x263F08B08] scannerWithString:v6];
  if ([v7 scanHexInt:&v25])
  {
    int v24 = 256;
    v8 = objc_msgSend(v4, "substringWithRange:", 2, 2);
    v9 = [MEMORY[0x263F08B08] scannerWithString:v8];

    if (![v9 scanHexInt:&v24])
    {
      v5 = 0;
LABEL_19:

      v7 = v9;
      goto LABEL_20;
    }
    int v23 = 256;
    v10 = objc_msgSend(v4, "substringWithRange:", 4, 2);
    v11 = [MEMORY[0x263F08B08] scannerWithString:v10];

    if (![v11 scanHexInt:&v23])
    {
      v5 = 0;
LABEL_18:

      v9 = v11;
      goto LABEL_19;
    }
    int v22 = 256;
    unint64_t v12 = [v4 length];
    double v16 = 1.0;
    if (v12 < 8)
    {
      v18 = v11;
    }
    else
    {
      v17 = objc_msgSend(v4, "substringWithRange:", 6, 2);
      v18 = [MEMORY[0x263F08B08] scannerWithString:v17];

      int v19 = [v18 scanHexInt:&v22];
      if (!v19)
      {
        v5 = 0;
        goto LABEL_17;
      }
      LODWORD(v20) = v22;
      double v13 = (double)v20;
      HIDWORD(v14) = 1064304640;
      double v16 = v13 * 0.00390625;
    }
    LODWORD(v14) = v24;
    LODWORD(v13) = v25;
    LODWORD(v15) = v23;
    v5 = [MEMORY[0x263F825C8] colorWithRed:(double)*(unint64_t *)&v13 * 0.00390625 green:(double)v14 * 0.00390625 blue:(double)v15 * 0.00390625 alpha:v16];
LABEL_17:
    v11 = v18;
    goto LABEL_18;
  }
  v5 = 0;
LABEL_20:

LABEL_21:
  return v5;
}

+ (uint64_t)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:
{
  return objc_msgSend(a1, "ams_dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:", a3, a4, a3, a4);
}

+ (uint64_t)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:lightHighContrastColor:
{
  return objc_msgSend(a1, "ams_dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:", a3, a4, a5, a4);
}

+ (uint64_t)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:darkHighContrastColor:
{
  return objc_msgSend(a1, "ams_dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:", a3, a4, a3, a5);
}

+ (AMSUICommonDynamicColor)ams_dynamicColorWithLightColor:()AMSUICommonColor darkColor:lightHighContrastColor:darkHighContrastColor:
{
  return +[AMSUICommonDynamicColor dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:](AMSUICommonDynamicColor, "dynamicColorWithLightColor:darkColor:lightHighContrastColor:darkHighContrastColor:");
}

+ (id)ams_colorFromDictionary:()AMSUICommonColor
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if ([v7 isEqualToString:@"named"])
    {
      uint64_t v9 = objc_msgSend(a1, "ams_namedColorFromDictionary:", v5);
    }
    else
    {
      if ([v7 isEqualToString:@"dynamic"]) {
        objc_msgSend(a1, "ams_dynamicColorFromDictionary:", v5);
      }
      else {
      uint64_t v9 = objc_msgSend(a1, "ams_rgbColorFromDictionary:", v5);
      }
    }
    v8 = (void *)v9;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)ams_rgbColorFromDictionary:()AMSUICommonColor
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"red"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6 = [v3 objectForKeyedSubscript:@"green"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v8 = [v3 objectForKeyedSubscript:@"blue"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  v10 = 0;
  if (v5 && v7 && v9)
  {
    v11 = [v3 objectForKeyedSubscript:@"alpha"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    double v13 = &unk_26CC73B00;
    if (v12) {
      double v13 = v12;
    }
    id v14 = v13;

    unint64_t v15 = (void *)MEMORY[0x263F825C8];
    [v5 doubleValue];
    double v17 = v16;
    [v7 doubleValue];
    double v19 = v18;
    [v9 doubleValue];
    double v21 = v20;
    [v14 doubleValue];
    double v23 = v22;

    v10 = [v15 colorWithRed:v17 green:v19 blue:v21 alpha:v23];
  }

  return v10;
}

+ (id)ams_namedColorFromDictionary:()AMSUICommonColor
{
  id v4 = [a3 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    v6 = [a1 _colorIdentifierDictionary];
    id v7 = [v6 objectForKeyedSubscript:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)ams_dynamicColorFromDictionary:()AMSUICommonColor
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"lightColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6 = objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v5);
  if (v6)
  {
    id v7 = [v3 objectForKeyedSubscript:@"darkColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    v10 = objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v8);
    if (v10 && ([v6 isEqual:v10] & 1) == 0)
    {
      objc_msgSend(MEMORY[0x263F825C8], "ams_dynamicColorWithLightColor:darkColor:", v6, v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = v6;
    }
    id v9 = v11;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)ams_isDark
{
  objc_msgSend(a1, "ams_luminance");
  return v1 < 0.5;
}

- (BOOL)ams_isLight
{
  objc_msgSend(a1, "ams_luminance");
  return v1 >= 0.5;
}

+ (id)_colorIdentifierDictionary
{
  v39[34] = *MEMORY[0x263EF8340];
  v38[0] = @"black";
  v37 = [MEMORY[0x263F825C8] blackColor];
  v39[0] = v37;
  v38[1] = @"blue";
  v36 = [MEMORY[0x263F825C8] systemBlueColor];
  v39[1] = v36;
  v38[2] = @"brown";
  v35 = [MEMORY[0x263F825C8] systemBrownColor];
  v39[2] = v35;
  v38[3] = @"clear";
  v34 = [MEMORY[0x263F825C8] clearColor];
  v39[3] = v34;
  v38[4] = @"cyan";
  v33 = [MEMORY[0x263F825C8] systemCyanColor];
  v39[4] = v33;
  v38[5] = @"gray";
  v32 = [MEMORY[0x263F825C8] systemGrayColor];
  v39[5] = v32;
  v38[6] = @"green";
  v31 = [MEMORY[0x263F825C8] systemGreenColor];
  v39[6] = v31;
  v38[7] = @"indigo";
  v30 = [MEMORY[0x263F825C8] systemIndigoColor];
  v39[7] = v30;
  v38[8] = @"mint";
  v29 = [MEMORY[0x263F825C8] systemMintColor];
  v39[8] = v29;
  v38[9] = @"orange";
  v28 = [MEMORY[0x263F825C8] systemOrangeColor];
  v39[9] = v28;
  v38[10] = @"pink";
  v27 = [MEMORY[0x263F825C8] systemPinkColor];
  v39[10] = v27;
  v38[11] = @"purple";
  v26 = [MEMORY[0x263F825C8] systemPurpleColor];
  v39[11] = v26;
  v38[12] = @"red";
  int v25 = [MEMORY[0x263F825C8] systemRedColor];
  v39[12] = v25;
  v38[13] = @"teal";
  int v24 = [MEMORY[0x263F825C8] systemTealColor];
  v39[13] = v24;
  v38[14] = @"white";
  double v23 = [MEMORY[0x263F825C8] whiteColor];
  v39[14] = v23;
  v38[15] = @"yellow";
  double v22 = [MEMORY[0x263F825C8] systemYellowColor];
  v39[15] = v22;
  v38[16] = @"appTint";
  uint64_t v0 = objc_msgSend(MEMORY[0x263F825C8], "ams_appTint");
  double v21 = (void *)v0;
  if (!v0)
  {
    uint64_t v0 = [MEMORY[0x263F825C8] systemBlueColor];
  }
  v39[16] = v0;
  v38[17] = @"defaultPlatformBackground";
  double v20 = objc_msgSend(MEMORY[0x263F825C8], "ams_defaultPlatformBackgroundColor", v0);
  v39[17] = v20;
  v38[18] = @"primaryBackground";
  double v19 = objc_msgSend(MEMORY[0x263F825C8], "ams_primaryBackground");
  v39[18] = v19;
  v38[19] = @"primaryGroupedBackground";
  double v18 = objc_msgSend(MEMORY[0x263F825C8], "ams_primaryGroupedBackground");
  v39[19] = v18;
  v38[20] = @"secondaryBackground";
  double v17 = objc_msgSend(MEMORY[0x263F825C8], "ams_secondaryBackground");
  v39[20] = v17;
  v38[21] = @"secondaryGroupedBackground";
  double v16 = objc_msgSend(MEMORY[0x263F825C8], "ams_secondaryGroupedBackground");
  v39[21] = v16;
  v38[22] = @"componentBackground";
  unint64_t v15 = objc_msgSend(MEMORY[0x263F825C8], "ams_componentBackground");
  v39[22] = v15;
  v38[23] = @"placeholderBackground";
  id v14 = objc_msgSend(MEMORY[0x263F825C8], "ams_placeholderBackground");
  v39[23] = v14;
  v38[24] = @"tertiarySystemFillColor";
  double v1 = objc_msgSend(MEMORY[0x263F825C8], "ams_tertiarySystemFillColor");
  v39[24] = v1;
  v38[25] = @"defaultLine";
  v2 = objc_msgSend(MEMORY[0x263F825C8], "ams_defaultLine");
  v39[25] = v2;
  v38[26] = @"primaryText";
  id v3 = objc_msgSend(MEMORY[0x263F825C8], "ams_primaryText");
  v39[26] = v3;
  v38[27] = @"secondaryText";
  id v4 = objc_msgSend(MEMORY[0x263F825C8], "ams_secondaryText");
  v39[27] = v4;
  v38[28] = @"tertiaryText";
  id v5 = objc_msgSend(MEMORY[0x263F825C8], "ams_tertiaryText");
  v39[28] = v5;
  v38[29] = @"quaternaryText";
  v6 = objc_msgSend(MEMORY[0x263F825C8], "ams_quaternaryText");
  v39[29] = v6;
  v38[30] = @"primaryFill";
  id v7 = [MEMORY[0x263F825C8] systemFillColor];
  v39[30] = v7;
  v38[31] = @"secondaryFill";
  id v8 = [MEMORY[0x263F825C8] secondarySystemFillColor];
  v39[31] = v8;
  v38[32] = @"tertiaryFill";
  id v9 = [MEMORY[0x263F825C8] tertiarySystemFillColor];
  v39[32] = v9;
  v38[33] = @"quaternaryFill";
  v10 = [MEMORY[0x263F825C8] quaternarySystemFillColor];
  v39[33] = v10;
  id v13 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:34];

  if (!v21) {
  return v13;
  }
}

@end