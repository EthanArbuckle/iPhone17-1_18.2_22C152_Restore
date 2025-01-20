@interface MUInfoCardStyle
+ (BOOL)hasExternallyProvidedTintColor;
+ (BOOL)isDeveloperPlaceCard;
+ (id)actionRowTintColor;
+ (id)attributionTintColor;
+ (id)buttonCellTextColor;
+ (id)cardBackgroundColor;
+ (id)directionsButtonTintColor;
+ (id)imageTileBackgroundColor;
+ (id)labelForProminence:(int64_t)a3;
+ (id)preferredVerticalCardConfiguration;
+ (id)punchoutButtonPlatterColor;
+ (id)resolvedPrimaryColorForProposedColor:(id)a3;
+ (id)rowSelectedColor;
+ (id)rowUnselectedColor;
+ (id)secondaryTextColor;
+ (id)sectionHeaderTextColor;
+ (id)textColor;
+ (id)tintColor;
+ (id)tokenBackgroundColor;
+ (id)verifiedLogoBackgroundColor;
+ (int64_t)containerStyle;
+ (int64_t)platterStyle;
+ (int64_t)sectionHeaderStyle;
+ (void)setInfoCardContainerStyle:(int64_t)a3;
+ (void)setIsDeveloperPlaceCard:(BOOL)a3;
+ (void)setSectionHeaderStyle:(int64_t)a3;
+ (void)setTintColorProvider:(id)a3;
@end

@implementation MUInfoCardStyle

+ (id)preferredVerticalCardConfiguration
{
  if ([(id)objc_opt_class() containerStyle] == 1) {
    +[MUPlaceVerticalCardConfiguration plainConfiguration];
  }
  else {
  v2 = +[MUPlaceVerticalCardConfiguration separatorConfiguration];
  }
  return v2;
}

+ (id)resolvedPrimaryColorForProposedColor:(id)a3
{
  id v3 = a3;
  if (+[MUInfoCardStyle hasExternallyProvidedTintColor])
  {
    id v4 = +[MUInfoCardStyle tintColor];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (void)setTintColorProvider:(id)a3
{
  if ((id)tintColorBlock != a3)
  {
    uint64_t v3 = [a3 copy];
    id v4 = (void *)tintColorBlock;
    tintColorBlock = v3;

    v5 = (void *)MEMORY[0x1E4F30ED0];
    uint64_t v6 = tintColorBlock;
    [v5 setTintColorProvider:v6];
  }
}

+ (void)setInfoCardContainerStyle:(int64_t)a3
{
  _containerStyle = a3;
}

+ (void)setIsDeveloperPlaceCard:(BOOL)a3
{
  _isDeveloperPlaceCard = a3;
}

+ (int64_t)sectionHeaderStyle
{
  return _sectionHeaderStyle;
}

+ (void)setSectionHeaderStyle:(int64_t)a3
{
  _sectionHeaderStyle = a3;
}

+ (id)cardBackgroundColor
{
  if (_isDeveloperPlaceCard) {
    v2 = @"DeveloperPlaceCardPlatterBackgroundColor";
  }
  else {
    v2 = @"PlatterBackgroundColor";
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1618], "_mapsui_colorNamed:", v2);
  return v3;
}

+ (id)textColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

+ (id)secondaryTextColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

+ (id)sectionHeaderTextColor
{
  if (_sectionHeaderStyle == 1)
  {
    a1 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else if (!_sectionHeaderStyle)
  {
    a1 = [MEMORY[0x1E4FB1618] labelColor];
  }
  return a1;
}

+ (id)tokenBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] tertiarySystemFillColor];
}

+ (id)buttonCellTextColor
{
  return (id)[MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (id)tintColor
{
  if (tintColorBlock)
  {
    v2 = (*(void (**)(void))(tintColorBlock + 16))();
  }
  else
  {
    if (MapKitIdiomIsMacCatalyst()) {
      objc_msgSend(MEMORY[0x1E4FB1618], "_mapsui_accentColor");
    }
    else {
    v2 = [MEMORY[0x1E4FB1618] systemBlueColor];
    }
  }
  return v2;
}

+ (id)attributionTintColor
{
  v2 = [MEMORY[0x1E4F30ED0] currentTheme];
  if ([v2 isDarkTheme])
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)punchoutButtonPlatterColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "_mapsui_colorNamed:", @"PunchoutPlatterBackgroundColor");
}

+ (id)rowUnselectedColor
{
  return (id)[MEMORY[0x1E4FB1618] clearColor];
}

+ (id)rowSelectedColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.119999997];
}

+ (id)actionRowTintColor
{
  if (!tintColorBlock
    || ((*(void (**)(void))(tintColorBlock + 16))(), (v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v2 = objc_msgSend(MEMORY[0x1E4FB1618], "_mapsui_colorNamed:", @"ActionRowBackgroundColor");
  }
  return v2;
}

+ (id)imageTileBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "_mapsui_colorNamed:", @"ImageTileBackgroundColor");
}

+ (id)verifiedLogoBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "_mapsui_colorNamed:", @"VerifiedLogoBackgroundColor");
}

+ (id)directionsButtonTintColor
{
  if (!tintColorBlock
    || ((*(void (**)(void))(tintColorBlock + 16))(), (v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v2 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  }
  return v2;
}

+ (int64_t)containerStyle
{
  return _containerStyle;
}

+ (int64_t)platterStyle
{
  return _containerStyle == 1;
}

+ (id)labelForProminence:(int64_t)a3
{
  if (+[MUInfoCardStyle platterStyle] == 1)
  {
    if (a3 != 2) {
      a3 = a3 == 1;
    }
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F310A8]) initWithStyle:a3];
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v4 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  id v6 = v4;

  return v6;
}

+ (BOOL)isDeveloperPlaceCard
{
  return _isDeveloperPlaceCard;
}

+ (BOOL)hasExternallyProvidedTintColor
{
  BOOL result = 0;
  if (tintColorBlock)
  {
    v2 = (*(void (**)(void))(tintColorBlock + 16))();

    if (v2) {
      return 1;
    }
  }
  return result;
}

@end