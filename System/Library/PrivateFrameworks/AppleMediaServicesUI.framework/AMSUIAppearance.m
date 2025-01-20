@interface AMSUIAppearance
+ (id)_accessoryButtonBackgroundColorWithDictionary:(id)a3;
+ (id)_accessoryButtonColorWithDictionary:(id)a3;
+ (id)_accessoryButtonFontWithDictionary:(id)a3;
+ (id)_accessorySecondaryButtonBackgroundColorWithDictionary:(id)a3;
+ (id)_accessorySecondaryButtonColorWithDictionary:(id)a3;
+ (id)_accessorySecondaryButtonFontWithDictionary:(id)a3;
+ (id)_backgroundColorWithDictionary:(id)a3;
+ (id)_backgroundColorWithMetadataDictionary:(id)a3;
+ (id)_backgroundImageWithDictionary:(id)a3;
+ (id)_backgroundImageWithMetadataDictionary:(id)a3;
+ (id)_defaultBackgroundColorForStyle:(unint64_t)a3 withTraitCollection:(id)a4;
+ (id)_defaultButtonBackgroundColorForStyle:(unint64_t)a3 withTraitCollection:(id)a4;
+ (id)_defaultButtonContentColorForStyle:(unint64_t)a3 isFooter:(BOOL)a4;
+ (id)_defaultButtonIconColorForStyle:(unint64_t)a3 isFooter:(BOOL)a4;
+ (id)_defaultButtonTextColorForStyle:(unint64_t)a3 isFooter:(BOOL)a4;
+ (id)_defaultButtonTextFontForStyle:(unint64_t)a3 withTraitCollection:(id)a4;
+ (id)_defaultImageViewColorForStyle:(unint64_t)a3;
+ (id)_defaultMessageColor;
+ (id)_defaultMessageFontForStyle:(unint64_t)a3 withTraitCollection:(id)a4;
+ (id)_defaultSeparatorColor;
+ (id)_defaultTitleColor;
+ (id)_defaultTitleFontForStyle:(unint64_t)a3 withTraitCollection:(id)a4;
+ (id)_footerButtonColorWithDictionary:(id)a3;
+ (id)_footerButtonFontWithDictionary:(id)a3;
+ (id)_gradientImageWithDictionary:(id)a3;
+ (id)_gradientLayerTypeForRawValue:(id)a3;
+ (id)_imageSymbolConfigurationWithDictionary:(id)a3;
+ (id)_imageTintColorWithDictionary:(id)a3;
+ (id)_impressionAnimationIdentifierWithDictionary:(id)a3;
+ (id)_messageFontWithDictionary:(id)a3;
+ (id)_messageTextColorWithDictionary:(id)a3;
+ (id)_separatorColorWithDictionary:(id)a3;
+ (id)_titleFontWithDictionary:(id)a3;
+ (id)_titleTextColorWithDictionary:(id)a3;
+ (int64_t)_iconAnimationPlayCount:(id)a3;
+ (int64_t)_primaryImageRenderingModeWithDictionary:(id)a3;
- (AMSUIAppearance)init;
- (AMSUIAppearance)initWithDictionary:(id)a3;
- (NSDictionary)_messageFontDictionary;
- (NSDictionary)_titleFontDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)set_messageFontDictionary:(id)a3;
- (void)set_titleFontDictionary:(id)a3;
@end

@implementation AMSUIAppearance

- (AMSUIAppearance)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIAppearance;
  return [(AMSUIAppearance *)&v3 init];
}

- (AMSUIAppearance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIAppearance *)self init];
  if (!v5)
  {
LABEL_11:
    v8 = v5;
    goto LABEL_12;
  }
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"subtitleFont"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }

    messageFontDictionary = v5->__messageFontDictionary;
    v5->__messageFontDictionary = v7;

    v10 = [v4 objectForKeyedSubscript:@"titleFont"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }

    titleFontDictionary = v5->__titleFontDictionary;
    v5->__titleFontDictionary = v11;

    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(AMSUIAppearance);
}

+ (id)_accessoryButtonColorWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"accessoryButtonColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = [v3 objectForKeyedSubscript:@"accessoryButtonColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_accessoryButtonBackgroundColorWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"accessoryButtonBackgroundColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = [v3 objectForKeyedSubscript:@"accessoryButtonBackgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_accessorySecondaryButtonBackgroundColorWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"accessorySecondaryButtonBackgroundColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = [v3 objectForKeyedSubscript:@"accessorySecondaryButtonBackgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_accessorySecondaryButtonColorWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"accessorySecondaryButtonColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = [v3 objectForKeyedSubscript:@"accessorySecondaryButtonColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_accessoryButtonFontWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"accessoryButtonFont"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    id v6 = +[AMSUIFontParser fontWithDictionary:v5];
  }
  else
  {
    v7 = [v3 objectForKeyedSubscript:@"accessoryButtonColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_accessorySecondaryButtonFontWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"accessorySecondaryButtonFont"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    id v6 = +[AMSUIFontParser fontWithDictionary:v5];
  }
  else
  {
    v7 = [v3 objectForKeyedSubscript:@"accessorySecondaryButtonColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_backgroundColorWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"background"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    id v6 = +[AMSUIAppearance _backgroundColorWithMetadataDictionary:v5];
  }
  else
  {
    v7 = [v3 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_backgroundColorWithMetadataDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"backgroundType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if ([v5 isEqualToString:@"solid"])
  {
    id v6 = [v3 objectForKeyedSubscript:@"color"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    v8 = objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_backgroundImageWithDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"background"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    id v5 = +[AMSUIAppearance _backgroundImageWithMetadataDictionary:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_backgroundImageWithMetadataDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"backgroundType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if ([v6 isEqualToString:@"gradient"])
  {
    id v7 = [a1 _gradientImageWithDictionary:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_footerButtonColorWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"footerButtonColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"footerButtonColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_footerButtonFontWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"footerButtonFont"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    id v6 = +[AMSUIFontParser fontWithDictionary:v5];
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"footerButtonFont"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (int64_t)_iconAnimationPlayCount:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"iconAnimationPlayCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4) {
    int64_t v5 = [v4 integerValue];
  }
  else {
    int64_t v5 = -90;
  }

  return v5;
}

+ (id)_imageSymbolConfigurationWithDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"iconSymbolConfiguration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    int64_t v5 = objc_msgSend(MEMORY[0x263F82818], "ams_imageSymbolConfigurationWithDictionary:", v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (id)_imageTintColorWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"imageTintColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"imageTintColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_impressionAnimationIdentifierWithDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"impressionAnimationIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)_messageFontWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"subtitleFont"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    id v6 = +[AMSUIFontParser fontWithDictionary:v5];
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"subtitleFont"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_messageTextColorWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"subtitleColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"subtitleColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_separatorColorWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"separatorColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"separatorColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_titleFontWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"titleFont"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    id v6 = +[AMSUIFontParser fontWithDictionary:v5];
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"titleFont"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (id)_titleTextColorWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"titleColor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"titleColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

+ (int64_t)_primaryImageRenderingModeWithDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"primaryImageRenderingMode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4) {
    int64_t v5 = [v4 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

+ (id)_gradientLayerTypeForRawValue:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F15DD0];
  v10[0] = @"axial";
  v10[1] = @"conic";
  uint64_t v4 = *MEMORY[0x263F15DD8];
  v11[0] = v3;
  v11[1] = v4;
  v10[2] = @"radial";
  v11[2] = *MEMORY[0x263F15DE0];
  int64_t v5 = NSDictionary;
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:3];
  v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

+ (id)_gradientImageWithDictionary:(id)a3
{
  id v4 = a3;
  int64_t v5 = [MEMORY[0x263F157D0] layer];
  id v6 = [v4 objectForKeyedSubscript:@"gradientType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 400.0, 400.0);
  if (v7)
  {
    v8 = [a1 _gradientLayerTypeForRawValue:v7];
    if (v8) {
      [v5 setType:v8];
    }
  }
  v9 = [v4 objectForKeyedSubscript:@"colors"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10 && [v10 count])
  {
    v11 = objc_msgSend(v10, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_1);
    [v5 setColors:v11];
  }
  v12 = [v4 objectForKeyedSubscript:@"locations"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v13) {
    [v5 setLocations:v13];
  }
  v14 = [v4 objectForKeyedSubscript:@"startPoint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  if (v15 && [v15 count] == 2)
  {
    v16 = [v15 objectAtIndexedSubscript:0];
    [v16 doubleValue];
    double v18 = v17;
    v19 = [v15 objectAtIndexedSubscript:1];
    [v19 doubleValue];
    objc_msgSend(v5, "setStartPoint:", v18, v20);
  }
  v21 = [v4 objectForKeyedSubscript:@"endPoint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }

  if (v22 && [v22 count] == 2)
  {
    v23 = [v22 objectAtIndexedSubscript:0];
    [v23 doubleValue];
    double v25 = v24;
    v26 = [v22 objectAtIndexedSubscript:1];
    [v26 doubleValue];
    objc_msgSend(v5, "setEndPoint:", v25, v27);
  }
  [v5 frame];
  v34.width = v28;
  v34.height = v29;
  UIGraphicsBeginImageContext(v34);
  [v5 renderInContext:UIGraphicsGetCurrentContext()];
  v30 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v31 = objc_msgSend(v30, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  return v31;
}

id __48__AMSUIAppearance__gradientImageWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromDictionary:", a2);
  id v2 = objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 CGColor];

  return v3;
}

+ (id)_defaultButtonBackgroundColorForStyle:(unint64_t)a3 withTraitCollection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263F825C8], "clearColor", a3, a4);
}

+ (id)_defaultBackgroundColorForStyle:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 0uLL:
      id v7 = (void *)MEMORY[0x263F825C8];
      v8 = objc_msgSend(MEMORY[0x263F825C8], "ams_secondaryBackground");
      uint64_t v9 = [MEMORY[0x263F825C8] tertiarySystemBackgroundColor];
      goto LABEL_6;
    case 1uLL:
      unint64_t v6 = [MEMORY[0x263F825C8] quaternarySystemFillColor];
      goto LABEL_9;
    case 2uLL:
      id v7 = (void *)MEMORY[0x263F825C8];
      v8 = [MEMORY[0x263F825C8] tertiarySystemBackgroundColor];
      uint64_t v9 = [MEMORY[0x263F825C8] quaternarySystemFillColor];
LABEL_6:
      id v10 = (void *)v9;
      a3 = objc_msgSend(v7, "ams_dynamicColorWithLightColor:darkColor:", v8, v9);

      break;
    case 3uLL:
    case 6uLL:
      unint64_t v6 = objc_msgSend(MEMORY[0x263F825C8], "ams_secondaryBackground");
      goto LABEL_9;
    case 4uLL:
      unint64_t v6 = [MEMORY[0x263F825C8] tertiarySystemBackgroundColor];
      goto LABEL_9;
    case 5uLL:
      unint64_t v6 = objc_msgSend(MEMORY[0x263F825C8], "ams_primaryBackground");
LABEL_9:
      a3 = v6;
      break;
    default:
      break;
  }

  return (id)a3;
}

+ (id)_defaultButtonContentColorForStyle:(unint64_t)a3 isFooter:(BOOL)a4
{
  switch(a3)
  {
    case 0uLL:
      id v5 = objc_msgSend(MEMORY[0x263F825C8], "ams_appTint");
      break;
    case 1uLL:
      id v5 = [MEMORY[0x263F825C8] tertiaryLabelColor];
      break;
    case 2uLL:
    case 3uLL:
    case 6uLL:
      id v4 = (void *)MEMORY[0x263F825C8];
      if (!a4) {
        goto LABEL_7;
      }
      id v5 = [MEMORY[0x263F825C8] tintColor];
      break;
    case 5uLL:
      id v5 = [MEMORY[0x263F825C8] labelColor];
      break;
    default:
      id v4 = (void *)MEMORY[0x263F825C8];
LABEL_7:
      id v5 = [v4 quaternaryLabelColor];
      break;
  }
  return v5;
}

+ (id)_defaultButtonTextColorForStyle:(unint64_t)a3 isFooter:(BOOL)a4
{
  if (a3 == 1) {
    objc_msgSend(MEMORY[0x263F825C8], "tintColor", 1, a4);
  }
  else {
  id v4 = +[AMSUIAppearance _defaultButtonContentColorForStyle:a3 isFooter:a4];
  }
  return v4;
}

+ (id)_defaultButtonIconColorForStyle:(unint64_t)a3 isFooter:(BOOL)a4
{
  if (!a3 && !a4)
  {
    id v4 = (void *)MEMORY[0x263F825C8];
LABEL_4:
    id v5 = [v4 tertiaryLabelColor];
    goto LABEL_9;
  }
  if (a3 == 5)
  {
    id v4 = (void *)MEMORY[0x263F825C8];
    if (a4) {
      goto LABEL_4;
    }
    id v5 = [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  else
  {
    id v5 = +[AMSUIAppearance _defaultButtonContentColorForStyle:a3 isFooter:a4];
  }
LABEL_9:
  return v5;
}

+ (id)_defaultButtonTextFontForStyle:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = (id)*MEMORY[0x263F83570];
  if (a3 - 2 < 2 || a3 == 6)
  {
    if ([v5 userInterfaceIdiom] != 5)
    {
      if ([v5 userInterfaceIdiom] == 6)
      {
        uint64_t v9 = 0;
        goto LABEL_13;
      }
      v8 = (id *)MEMORY[0x263F835F0];
      goto LABEL_11;
    }
  }
  else if (!a3)
  {
    uint64_t v7 = [v5 userInterfaceIdiom];
    v8 = (id *)MEMORY[0x263F835F0];
    if (v7 == 1) {
      v8 = (id *)MEMORY[0x263F835B8];
    }
LABEL_11:
    id v10 = *v8;

    id v6 = v10;
  }
  v11 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v6 compatibleWithTraitCollection:v5];
  v12 = [v11 fontDescriptorWithSymbolicTraits:0x8000];

  uint64_t v9 = [MEMORY[0x263F81708] fontWithDescriptor:v12 size:0.0];

LABEL_13:
  return v9;
}

+ (id)_defaultImageViewColorForStyle:(unint64_t)a3
{
  uint64_t v3 = 0;
  if (a3 <= 6)
  {
    if (((1 << a3) & 0x4C) != 0)
    {
      uint64_t v3 = [MEMORY[0x263F825C8] secondaryLabelColor];
    }
    else if (((1 << a3) & 3) != 0)
    {
      uint64_t v3 = [MEMORY[0x263F825C8] labelColor];
    }
  }
  return v3;
}

+ (id)_defaultMessageColor
{
  return (id)[MEMORY[0x263F825C8] secondaryLabelColor];
}

+ (id)_defaultMessageFontForStyle:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  v8 = (id *)MEMORY[0x263F835F0];
  if (!IsAccessibilityCategory)
  {
    if (a3 == 1)
    {
      v8 = (id *)MEMORY[0x263F83588];
    }
    else if (!a3 && [v5 userInterfaceIdiom] == 1)
    {
      v8 = (id *)MEMORY[0x263F835B8];
    }
  }
  id v9 = *v8;
  id v10 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v9 compatibleWithTraitCollection:v5];
  v11 = [MEMORY[0x263F81708] fontWithDescriptor:v10 size:0.0];

  return v11;
}

+ (id)_defaultSeparatorColor
{
  return (id)[MEMORY[0x263F825C8] separatorColor];
}

+ (id)_defaultTitleColor
{
  return (id)[MEMORY[0x263F825C8] labelColor];
}

+ (id)_defaultTitleFontForStyle:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    id v8 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835D0] compatibleWithTraitCollection:v5];
    id v9 = [MEMORY[0x263F81708] fontWithDescriptor:v8 size:0.0];
  }
  else
  {
    id v8 = (id)*MEMORY[0x263F83570];
    if (a3 < 2 || a3 == 6 && [v5 userInterfaceIdiom] != 5)
    {
      id v10 = (id)*MEMORY[0x263F835F0];

      id v8 = v10;
    }
    v11 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v8 compatibleWithTraitCollection:v5];
    v12 = [v11 fontDescriptorWithSymbolicTraits:2];

    id v9 = [MEMORY[0x263F81708] fontWithDescriptor:v12 size:0.0];
  }
  return v9;
}

- (NSDictionary)_messageFontDictionary
{
  return self->__messageFontDictionary;
}

- (void)set_messageFontDictionary:(id)a3
{
}

- (NSDictionary)_titleFontDictionary
{
  return self->__titleFontDictionary;
}

- (void)set_titleFontDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleFontDictionary, 0);
  objc_storeStrong((id *)&self->__messageFontDictionary, 0);
}

@end