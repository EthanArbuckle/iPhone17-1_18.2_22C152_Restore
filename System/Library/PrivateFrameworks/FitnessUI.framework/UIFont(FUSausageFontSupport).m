@interface UIFont(FUSausageFontSupport)
+ (id)_fu_sausageFontOfSize:()FUSausageFontSupport fontWeight:;
+ (id)_fu_sausageFontOfSize:()FUSausageFontSupport fontWeight:centeredColons:;
+ (id)fu_alternateColonsFeatureSetting;
+ (id)fu_bodyEmphasizeFont;
+ (id)fu_bodyShortFont;
+ (id)fu_fontByApplyingFeatureSettings:()FUSausageFontSupport toFont:;
+ (id)fu_mediumFontOfSize:()FUSausageFontSupport centeredColons:;
+ (id)fu_systemFontOfSize:()FUSausageFontSupport centeredColons:;
+ (uint64_t)fu_boldSausageFontOfSize:()FUSausageFontSupport;
+ (uint64_t)fu_heavySausageFontOfSize:()FUSausageFontSupport;
+ (uint64_t)fu_lightSausageFontOfSize:()FUSausageFontSupport;
+ (uint64_t)fu_lightSausageFontOfSize:()FUSausageFontSupport centeredColons:;
+ (uint64_t)fu_mediumFontOfSize:()FUSausageFontSupport;
+ (uint64_t)fu_mediumSausageFontOfSize:()FUSausageFontSupport;
+ (uint64_t)fu_sausageFontOfSize:()FUSausageFontSupport;
+ (uint64_t)fu_sausageFontOfSize:()FUSausageFontSupport centeredColons:;
+ (uint64_t)fu_semiboldSausageFontOfSize:()FUSausageFontSupport;
- (id)fu_fontWithCenteredColons;
- (id)fu_fontWithSize:()FUSausageFontSupport;
- (id)fu_fontWithSizeFittingString:()FUSausageFontSupport withinWidth:accountForGlyphOffset:;
- (id)fu_fontWithStraightSidedNumbers;
- (id)fu_monospacedFont;
- (id)fu_shortSlashFont;
- (id)fu_smallCapsFont;
- (uint64_t)fu_fontWithSizeFittingString:()FUSausageFontSupport withinWidth:;
@end

@implementation UIFont(FUSausageFontSupport)

+ (uint64_t)fu_sausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 0, a3, *MEMORY[0x263F81838]);
}

+ (id)_fu_sausageFontOfSize:()FUSausageFontSupport fontWeight:centeredColons:
{
  v6 = objc_msgSend(MEMORY[0x263F81708], "systemFontOfSize:weight:design:", *MEMORY[0x263F03B70]);
  if (v6)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  NSLog(&cfstr_UnableToLoadRo.isa);
  v6 = [MEMORY[0x263F81708] systemFontOfSize:a1];
  if (a4)
  {
LABEL_3:
    uint64_t v7 = objc_msgSend(v6, "fu_fontWithCenteredColons");

    v6 = (void *)v7;
  }
LABEL_4:
  return v6;
}

- (id)fu_fontWithCenteredColons
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263F81708], "fu_alternateColonsFeatureSetting");
  v6[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  v4 = objc_msgSend(MEMORY[0x263F81708], "fu_fontByApplyingFeatureSettings:toFont:", v3, a1);

  return v4;
}

+ (id)fu_alternateColonsFeatureSetting
{
  v4[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F817B0];
  v3[0] = *MEMORY[0x263F817B8];
  v3[1] = v0;
  v4[0] = &unk_26CF75598;
  v4[1] = &unk_26CF755C8;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return v1;
}

+ (id)fu_fontByApplyingFeatureSettings:()FUSausageFontSupport toFont:
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [a4 fontDescriptor];
  uint64_t v11 = *MEMORY[0x263F81748];
  v12[0] = v5;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v8 = [v6 fontDescriptorByAddingAttributes:v7];

  v9 = [MEMORY[0x263F81708] fontWithDescriptor:v8 size:0.0];

  return v9;
}

+ (uint64_t)fu_mediumSausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 0, a3, *MEMORY[0x263F81828]);
}

+ (id)fu_systemFontOfSize:()FUSausageFontSupport centeredColons:
{
  v4 = objc_msgSend(MEMORY[0x263F81708], "systemFontOfSize:");
  id v5 = v4;
  if (a3)
  {
    uint64_t v6 = objc_msgSend(v4, "fu_fontWithCenteredColons");

    id v5 = (void *)v6;
  }
  return v5;
}

+ (uint64_t)fu_mediumFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "fu_mediumFontOfSize:centeredColons:", 0);
}

+ (id)fu_mediumFontOfSize:()FUSausageFontSupport centeredColons:
{
  id v5 = [MEMORY[0x263F81708] systemFontOfSize:a1 weight:*MEMORY[0x263F81828]];
  uint64_t v6 = v5;
  if (a4)
  {
    uint64_t v7 = objc_msgSend(v5, "fu_fontWithCenteredColons");

    uint64_t v6 = (void *)v7;
  }
  return v6;
}

- (id)fu_fontWithSize:()FUSausageFontSupport
{
  v3 = [a1 fontDescriptor];
  v4 = [MEMORY[0x263F81708] fontWithDescriptor:v3 size:a2];

  return v4;
}

- (id)fu_fontWithStraightSidedNumbers
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F817B0];
  v7[0] = *MEMORY[0x263F817B8];
  v7[1] = v2;
  v8[0] = &unk_26CF75598;
  v8[1] = &unk_26CF755B0;
  v3 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v9[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  id v5 = objc_msgSend(MEMORY[0x263F81708], "fu_fontByApplyingFeatureSettings:toFont:", v4, a1);

  return v5;
}

- (id)fu_monospacedFont
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x263F817B0];
  v8[0] = *MEMORY[0x263F817B8];
  v8[1] = v3;
  v9[0] = &unk_26CF755C8;
  v9[1] = &unk_26CF755E0;
  v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  v10[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  uint64_t v6 = objc_msgSend(v2, "fu_fontByApplyingFeatureSettings:toFont:", v5, a1);

  return v6;
}

- (id)fu_smallCapsFont
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x263F817B0];
  v8[0] = *MEMORY[0x263F817B8];
  v8[1] = v3;
  v9[0] = &unk_26CF755F8;
  v9[1] = &unk_26CF75610;
  v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  v10[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  uint64_t v6 = objc_msgSend(v2, "fu_fontByApplyingFeatureSettings:toFont:", v5, a1);

  return v6;
}

- (id)fu_shortSlashFont
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x263F817B0];
  v8[0] = *MEMORY[0x263F817B8];
  v8[1] = v3;
  v9[0] = &unk_26CF75628;
  v9[1] = &unk_26CF755E0;
  v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  v10[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  uint64_t v6 = objc_msgSend(v2, "fu_fontByApplyingFeatureSettings:toFont:", v5, a1);

  return v6;
}

+ (uint64_t)fu_sausageFontOfSize:()FUSausageFontSupport centeredColons:
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 1, a3, *MEMORY[0x263F81838]);
}

+ (uint64_t)fu_lightSausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "fu_lightSausageFontOfSize:centeredColons:", 0);
}

+ (uint64_t)fu_lightSausageFontOfSize:()FUSausageFontSupport centeredColons:
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", a3, *MEMORY[0x263F81818]);
}

+ (uint64_t)fu_semiboldSausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 0, a3, *MEMORY[0x263F81840]);
}

+ (uint64_t)fu_boldSausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 0, a3, *MEMORY[0x263F81800]);
}

+ (uint64_t)fu_heavySausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 0, a3, *MEMORY[0x263F81810]);
}

+ (id)_fu_sausageFontOfSize:()FUSausageFontSupport fontWeight:
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F81708], "systemFontOfSize:weight:design:", *MEMORY[0x263F03B70]);
  if (!v2)
  {
    NSLog(&cfstr_UnableToLoadRo.isa);
    uint64_t v2 = [MEMORY[0x263F81708] systemFontOfSize:a1];
  }
  return v2;
}

+ (id)fu_bodyShortFont
{
  uint64_t v0 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570] addingSymbolicTraits:0x8000 options:1];
  v1 = [MEMORY[0x263F81708] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (id)fu_bodyEmphasizeFont
{
  uint64_t v0 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570] addingSymbolicTraits:2 options:1];
  v1 = [MEMORY[0x263F81708] fontWithDescriptor:v0 size:0.0];

  return v1;
}

- (uint64_t)fu_fontWithSizeFittingString:()FUSausageFontSupport withinWidth:
{
  return objc_msgSend(a1, "fu_fontWithSizeFittingString:withinWidth:accountForGlyphOffset:", a3, 0);
}

- (id)fu_fontWithSizeFittingString:()FUSausageFontSupport withinWidth:accountForGlyphOffset:
{
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a1;
  v10 = v9;
  if (a2 > 2.22044605e-16)
  {
    [v9 pointSize];
    double v12 = v11 * 0.5;
    [v10 pointSize];
    if (v13 >= v12)
    {
      uint64_t v16 = *MEMORY[0x263F814F0];
      while (1)
      {
        double v17 = 0.0;
        if (a5) {
          double v17 = FIUILeftOffsetForFontAndString(v10, v8);
        }
        uint64_t v23 = v16;
        v24[0] = v10;
        v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
        [v8 sizeWithAttributes:v18];
        double v20 = v17 + v19;

        if (v20 <= a2) {
          break;
        }
        [v10 pointSize];
        v14 = objc_msgSend(v10, "fu_fontWithSize:", v21 * 0.9);

        [v14 pointSize];
        v10 = v14;
        if (v22 < v12) {
          goto LABEL_4;
        }
      }
    }
  }
  v14 = v10;
LABEL_4:

  return v14;
}

@end