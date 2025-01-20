@interface AMSUIWebAppearance
+ (AMSUIWebAppearance)defaultAppearance;
+ (AMSUIWebAppearance)tableViewAppearance;
+ (UIColor)defaultPlatformBackgroundColor;
+ (UIColor)secondarySystemBackgroundColor;
+ (UIColor)secondarySystemGroupedBackgroundColor;
+ (UIColor)systemBackgroundColor;
+ (UIColor)systemClearColor;
+ (UIColor)systemGroupedBackgroundColor;
+ (UIColor)tertiarySystemBackgroundColor;
+ (UIColor)tertiarySystemGroupedBackgroundColor;
+ (id)ams_tertiarySystemFillColor;
- (UIColor)backgroundColor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackgroundColor:(id)a3;
- (void)updateBackgroundColorWithJSString:(id)a3;
@end

@implementation AMSUIWebAppearance

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[AMSUIWebAppearance allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_backgroundColor, self->_backgroundColor);
  return v4;
}

+ (AMSUIWebAppearance)defaultAppearance
{
  v2 = objc_alloc_init(AMSUIWebAppearance);
  v3 = [(id)objc_opt_class() defaultPlatformBackgroundColor];
  [(AMSUIWebAppearance *)v2 setBackgroundColor:v3];

  return v2;
}

+ (AMSUIWebAppearance)tableViewAppearance
{
  v2 = objc_alloc_init(AMSUIWebAppearance);
  v3 = [(id)objc_opt_class() systemGroupedBackgroundColor];
  [(AMSUIWebAppearance *)v2 setBackgroundColor:v3];

  return v2;
}

- (void)updateBackgroundColorWithJSString:(id)a3
{
  v15[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v14[0] = @"-apple-system-background";
    v5 = [(id)objc_opt_class() systemBackgroundColor];
    v15[0] = v5;
    v14[1] = @"-apple-system-clear";
    v6 = [(id)objc_opt_class() systemClearColor];
    v15[1] = v6;
    v14[2] = @"-apple-system-secondary-background";
    v7 = [(id)objc_opt_class() secondarySystemBackgroundColor];
    v15[2] = v7;
    v14[3] = @"-apple-system-tertiary-background";
    v8 = [(id)objc_opt_class() tertiarySystemBackgroundColor];
    v15[3] = v8;
    v14[4] = @"-apple-system-grouped-background";
    v9 = [(id)objc_opt_class() systemGroupedBackgroundColor];
    v15[4] = v9;
    v14[5] = @"-apple-system-secondary-grouped-background";
    v10 = [(id)objc_opt_class() secondarySystemGroupedBackgroundColor];
    v15[5] = v10;
    v14[6] = @"-apple-system-tertiary-grouped-background";
    v11 = [(id)objc_opt_class() tertiarySystemGroupedBackgroundColor];
    v15[6] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:7];

    v13 = [v12 objectForKeyedSubscript:v4];
    if (v13
      || (objc_msgSend(MEMORY[0x263F825C8], "ams_colorFromHexString:", v4),
          (v13 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(AMSUIWebAppearance *)self setBackgroundColor:v13];
    }
  }
}

+ (UIColor)defaultPlatformBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F825C8], "ams_defaultPlatformBackgroundColor");
}

+ (UIColor)systemBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F825C8], "ams_primaryBackground");
}

+ (UIColor)systemClearColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F825C8], "ams_clear");
}

+ (UIColor)secondarySystemBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F825C8], "ams_secondaryBackground");
}

+ (UIColor)tertiarySystemBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F825C8] tertiarySystemBackgroundColor];
}

+ (UIColor)systemGroupedBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F825C8], "ams_primaryGroupedBackground");
}

+ (UIColor)secondarySystemGroupedBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F825C8], "ams_secondaryGroupedBackground");
}

+ (id)ams_tertiarySystemFillColor
{
  return (id)[MEMORY[0x263F825C8] tertiarySystemFillColor];
}

+ (UIColor)tertiarySystemGroupedBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F825C8] tertiarySystemGroupedBackgroundColor];
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end