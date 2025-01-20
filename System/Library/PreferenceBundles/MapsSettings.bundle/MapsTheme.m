@interface MapsTheme
+ (Class)visualEffectClassAllowingBlur:(BOOL)a3;
+ (UIColor)apertureKeyColor;
+ (UIColor)floatingControlsTintColor;
+ (UIColor)ugcAddPhotoCellBackgroundColor;
+ (UIColor)ugcGlyphButtonViewMutedBackgroundColor;
+ (UIColor)ugcGlyphButtonViewMutedGlyphColor;
+ (UIColor)ugcGlyphButtonViewSelectedBackgroundColor;
+ (UIColor)ugcGlyphButtonViewSelectedGlyphColor;
+ (UIColor)ugcGlyphButtonViewUnselectedBackgroundColor;
+ (UIColor)ugcGlyphButtonViewUnselectedGlyphColor;
+ (UIColor)ugcHairlineColor;
+ (UIColor)ugcLegalAttributionLinkColor;
+ (UIColor)ugcPOIEnrichmentEditorBackgroundColor;
+ (UIColor)ugcPhotoCarouselCellBackgroundColor;
+ (UIColor)weatherWidgetTextColor;
+ (UIImage)locationImage;
+ (id)_colorWithAssetCatalogName:(id)a3;
+ (id)blurEffect;
+ (id)globalThemes;
+ (id)sharedTheme;
+ (id)visualEffectViewAllowingBlur:(BOOL)a3;
- (BOOL)isCurrentThemeSatellite;
- (BOOL)showLightContentForListStep;
- (BOOL)updateMapsThemeStyleIfNeeded:(unint64_t)a3;
- (BOOL)updateVisualEffectStyleIfNeeded:(unint64_t)a3;
- (MapsTheme)init;
- (MapsTheme)initWithMapsThemeStyle:(unint64_t)a3 visualEffectStyle:(unint64_t)a4;
- (NSString)vibrantBackgroundFilter;
- (NSString)vibrantTopFilter;
- (UIColor)addPhotoPlaceholderBackgroundColor;
- (UIColor)addPhotoPlaceholderForegroundColor;
- (UIColor)autocompleteSectionTitleTextColor;
- (UIColor)backgroundColorForModalFormSheet;
- (UIColor)browseTitleBackgroundColor;
- (UIColor)childItemButtonBackgroundColor;
- (UIColor)controlBackgroundColor;
- (UIColor)controlTintColor;
- (UIColor)darkKeyColor;
- (UIColor)disabledTitleColor;
- (UIColor)dynamicControlBackgroundColor;
- (UIColor)dynamicHairlineColor;
- (UIColor)favoriteCollectionIconBackgroundColor;
- (UIColor)favoriteCollectionIconColor;
- (UIColor)groupTableViewBackgroundColor;
- (UIColor)groupTableViewCellBackgroundColor;
- (UIColor)groupTableViewHairlineColor;
- (UIColor)hairlineBorderColor;
- (UIColor)hairlineColor;
- (UIColor)imageBackgroundColor;
- (UIColor)imageBorderColor;
- (UIColor)keyColor;
- (UIColor)navButtonPrimaryColor;
- (UIColor)navDirectionStepPrimaryColor;
- (UIColor)navDirectionStepSecondaryColor;
- (UIColor)navEndButtonBackgroundColor;
- (UIColor)navEndButtonBackgroundHighlightedColor;
- (UIColor)navEndButtonTitleColor;
- (UIColor)navPauseButtonBackgroundColor;
- (UIColor)navPauseButtonBackgroundHighlightedColor;
- (UIColor)navPauseButtonTitleColor;
- (UIColor)navResumeButtonColor;
- (UIColor)navResumeButtonHighlightedColor;
- (UIColor)navResumeRouteBannerBackgroundColor;
- (UIColor)navResumeRouteBannerHighlightColor;
- (UIColor)navSignGuidanceManeuverAccentColor;
- (UIColor)navSignGuidanceManeuverColor;
- (UIColor)navSignLaneGuidanceDividerColor;
- (UIColor)navSignMajorTextColor;
- (UIColor)navSignMinorTextColor;
- (UIColor)navSignPrimaryColor;
- (UIColor)navSignSecondaryColor;
- (UIColor)navSignTertiaryTextColor;
- (UIColor)navTraySecondaryTextColor;
- (UIColor)navTrayTitleTextColor;
- (UIColor)navigationFeatureCellBackgroundColor;
- (UIColor)navigationFeatureCellForegroundColor;
- (UIColor)navigationFeatureCellHighlightedOverlayColor;
- (UIColor)orbHintPhaseBackgroundColor;
- (UIColor)parkedCarNotePlaceholderColor;
- (UIColor)parkedCarSectionHeaderColor;
- (UIColor)progressBarDarkFillTintColor;
- (UIColor)progressBarLightFillTintColor;
- (UIColor)progressBarTrackTintColor;
- (UIColor)reservationsGrayColor;
- (UIColor)searchBarPlaceHolderColor;
- (UIColor)steppingSignButtonTitleColor;
- (UIColor)tableViewCellHighlightedOverlayColor;
- (UIColor)textFieldAtomSelectionBackgroundColor;
- (UIColor)textFieldAtomSelectionTextColor;
- (UIColor)transitSchedulesOnTimeStopTimeTextColor;
- (UIColor)transitSchedulesPastStopLinkColor;
- (UIColor)transitSchedulesPastStopTextColor;
- (UIColor)venueFloorPickerHighlightColor;
- (UIColor)venueFloorPickerLackingSearchResultsTextColor;
- (UIColor)venueFloorPickerTextColor;
- (UIColor)vibrantBackgroundColor;
- (UIColor)vibrantTopColor;
- (id)_mapsThemeStyleKey:(unint64_t)a3;
- (id)_maps_colorNamed:(id)a3;
- (id)_navigationTrayImageWithImageName:(id)a3 key:(id)a4 supportRTL:(BOOL)a5;
- (id)blackCircleButtonBackgroundColor:(unint64_t)a3;
- (id)blueButtonBackgroundColor:(unint64_t)a3;
- (id)blueButtonTitleColor:(unint64_t)a3;
- (id)closeXColor;
- (id)colorForTag:(id)a3;
- (id)fadedGrayButtonBackgroundColor:(unint64_t)a3;
- (id)fadedGrayButtonTitleColor:(unint64_t)a3;
- (id)flyoverTourButtonBackgroundColor:(BOOL)a3;
- (id)greenButtonBackgroundColor:(unint64_t)a3;
- (id)greenButtonTitleColor:(unint64_t)a3;
- (id)lazyLoadingImageWithKey:(id)a3 factory:(id)a4;
- (id)lazyLoadingImageWithKey:(id)a3 imageName:(id)a4;
- (id)lazyLoadingImageWithKey:(id)a3 imageName:(id)a4 imageColor:(id)a5 supportRTL:(BOOL)a6;
- (id)lazyLoadingImageWithKey:(id)a3 imageName:(id)a4 supportRTL:(BOOL)a5;
- (id)ridesharingRatingStarColorOn:(BOOL)a3;
- (id)ridesharingTippingOptionsBackgroundColor:(BOOL)a3;
- (id)ridesharingTippingOptionsForegroundColor:(BOOL)a3;
- (id)ridesharingTippingOptionsForegroundCurrencyColor:(BOOL)a3;
- (id)statusIndicatorBackgroundColor:(unint64_t)a3;
- (id)statusIndicatorTextColorForStyleDefault:(unint64_t)a3;
- (id)statusIndicatorTextColorForStyleLightContent:(unint64_t)a3;
- (int64_t)activityIndicatorStyle;
- (int64_t)blurDarkeningAppearance;
- (int64_t)selectionBackgroundAppearance;
- (int64_t)statusBarStyle;
- (int64_t)textFieldKeyboardAppearance;
- (unint64_t)infoCardThemeType;
- (unint64_t)interfaceStyleIntent;
- (unint64_t)mapsThemeStyle;
- (unint64_t)visualEffectStyle;
- (void)_updateCurrentTheme;
- (void)applyAppearance;
- (void)setMapsThemeStyle:(unint64_t)a3;
- (void)setVisualEffectStyle:(unint64_t)a3;
@end

@implementation MapsTheme

+ (Class)visualEffectClassAllowingBlur:(BOOL)a3
{
  v3 = objc_opt_class();

  return (Class)v3;
}

+ (id)visualEffectViewAllowingBlur:(BOOL)a3
{
  id v4 = objc_alloc((Class)[a1 visualEffectClassAllowingBlur:a3]);
  v5 = [a1 blurEffect];
  id v6 = [v4 initWithEffect:v5];

  [v6 _setGroupName:@"MapsTheme"];

  return v6;
}

+ (id)blurEffect
{
  v2 = +[UIDevice currentDevice];
  v3 = (char *)[v2 userInterfaceIdiom];

  if ((GEOConfigGetBOOL() & (v3 != (unsigned char *)&dword_4 + 1)) != 0) {
    uint64_t v4 = 9;
  }
  else {
    uint64_t v4 = 10;
  }
  v5 = +[UIBlurEffect effectWithStyle:v4];

  return v5;
}

- (void)setMapsThemeStyle:(unint64_t)a3
{
}

- (BOOL)updateMapsThemeStyleIfNeeded:(unint64_t)a3
{
  unint64_t mapsThemeStyle = self->_mapsThemeStyle;
  if (mapsThemeStyle != a3)
  {
    self->_unint64_t mapsThemeStyle = a3;
    [(MapsTheme *)self _updateCurrentTheme];
  }
  return mapsThemeStyle != a3;
}

- (void)setVisualEffectStyle:(unint64_t)a3
{
}

- (BOOL)updateVisualEffectStyleIfNeeded:(unint64_t)a3
{
  unint64_t currentVisualEffectStyle = self->_currentVisualEffectStyle;
  if (currentVisualEffectStyle != a3)
  {
    self->_unint64_t currentVisualEffectStyle = a3;
    [(MapsTheme *)self _updateCurrentTheme];
  }
  return currentVisualEffectStyle != a3;
}

- (void)_updateCurrentTheme
{
  id v6 = [(id)objc_opt_class() globalThemes];
  v3 = [(MapsTheme *)self _mapsThemeStyleKey:self->_mapsThemeStyle];
  uint64_t v4 = [v6 objectForKeyedSubscript:v3];
  colorsForCurrentTheme = self->_colorsForCurrentTheme;
  self->_colorsForCurrentTheme = v4;
}

- (id)_mapsThemeStyleKey:(unint64_t)a3
{
  unint64_t currentVisualEffectStyle = self->_currentVisualEffectStyle;
  CFStringRef v4 = @"DarkThemeWithoutVisualEffect";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (!a3) {
    CFStringRef v4 = @"StandardThemeWithoutVisualEffect";
  }
  if (a3 == 1) {
    CFStringRef v5 = @"DarkTheme";
  }
  else {
    CFStringRef v5 = 0;
  }
  if (!a3) {
    CFStringRef v5 = @"StandardTheme";
  }
  if (currentVisualEffectStyle) {
    CFStringRef v5 = 0;
  }
  if (currentVisualEffectStyle == 1) {
    return (id)v4;
  }
  else {
    return (id)v5;
  }
}

- (MapsTheme)initWithMapsThemeStyle:(unint64_t)a3 visualEffectStyle:(unint64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)MapsTheme;
  id v6 = [(MapsTheme *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_unint64_t mapsThemeStyle = a3;
    v6->_unint64_t currentVisualEffectStyle = a4;
    v8 = [(id)objc_opt_class() globalThemes];
    v9 = [(MapsTheme *)v7 _mapsThemeStyleKey:v7->_mapsThemeStyle];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];
    colorsForCurrentTheme = v7->_colorsForCurrentTheme;
    v7->_colorsForCurrentTheme = (NSDictionary *)v10;

    v12 = +[UIApplication sharedApplication];
    v7->_isRTL = [v12 userInterfaceLayoutDirection] == (char *)&dword_0 + 1;
  }
  return v7;
}

- (MapsTheme)init
{
  return [(MapsTheme *)self initWithMapsThemeStyle:0 visualEffectStyle:0];
}

+ (id)globalThemes
{
  if (qword_8DC70 != -1) {
    dispatch_once(&qword_8DC70, &stru_60DD0);
  }
  v2 = (void *)qword_8DC68;

  return v2;
}

+ (id)sharedTheme
{
  if (qword_8DC80 != -1) {
    dispatch_once(&qword_8DC80, &stru_60DF0);
  }
  v2 = (void *)qword_8DC78;

  return v2;
}

- (void)applyAppearance
{
  id v4 = [(id)objc_opt_class() blurEffect];
  v2 = +[UIVibrancyEffect effectForBlurEffect:v4 style:7];
  v3 = +[UITableView appearance];
  [v3 setSeparatorEffect:v2];
}

+ (UIImage)locationImage
{
  v2 = +[UIImage systemImageNamed:@"location"];
  v3 = +[UIImageSymbolConfiguration configurationWithPointSize:17.0];
  id v4 = [v2 imageWithConfiguration:v3];

  return (UIImage *)v4;
}

- (id)lazyLoadingImageWithKey:(id)a3 imageName:(id)a4
{
  return [(MapsTheme *)self lazyLoadingImageWithKey:a3 imageName:a4 supportRTL:0];
}

- (id)lazyLoadingImageWithKey:(id)a3 imageName:(id)a4 supportRTL:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(MapsTheme *)self keyColor];
  v11 = [(MapsTheme *)self lazyLoadingImageWithKey:v9 imageName:v8 imageColor:v10 supportRTL:v5];

  return v11;
}

- (id)lazyLoadingImageWithKey:(id)a3 imageName:(id)a4 imageColor:(id)a5 supportRTL:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(NSDictionary *)self->_colorsForCurrentTheme objectForKeyedSubscript:v10];
  objc_super v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_6960;
    v17[3] = &unk_60E58;
    id v18 = v12;
    BOOL v21 = a6;
    id v19 = v11;
    v20 = self;
    id v15 = [(MapsTheme *)self lazyLoadingImageWithKey:v10 factory:v17];
  }

  return v15;
}

- (id)lazyLoadingImageWithKey:(id)a3 factory:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  id v8 = [(NSDictionary *)self->_colorsForCurrentTheme objectForKeyedSubscript:v6];
  if (!v8)
  {
    id v9 = [(MapsTheme *)self _mapsThemeStyleKey:self->_mapsThemeStyle];
    id v10 = [(id)objc_opt_class() globalThemes];
    id v11 = [v10 objectForKeyedSubscript:v9];

    uint64_t v12 = [v11 objectForKeyedSubscript:v6];
    if (v12)
    {
      id v8 = (void *)v12;
      v13 = v11;
    }
    else
    {
      id v8 = v7[2](v7);
      objc_super v14 = +[NSMutableDictionary dictionaryWithDictionary:v11];
      [v14 setObject:v8 forKeyedSubscript:v6];
      v13 = (NSDictionary *)[v14 copy];

      id v15 = [(id)objc_opt_class() globalThemes];
      [v15 setObject:v13 forKeyedSubscript:v9];
    }
    colorsForCurrentTheme = self->_colorsForCurrentTheme;
    self->_colorsForCurrentTheme = v13;
  }

  return v8;
}

- (id)_navigationTrayImageWithImageName:(id)a3 key:(id)a4 supportRTL:(BOOL)a5
{
  return [(MapsTheme *)self lazyLoadingImageWithKey:a4 imageName:a3 imageColor:0 supportRTL:a5];
}

- (int64_t)activityIndicatorStyle
{
  return 100;
}

- (int64_t)statusBarStyle
{
  return self->_mapsThemeStyle != 0;
}

- (NSString)vibrantTopFilter
{
  return (NSString *)[(NSDictionary *)self->_colorsForCurrentTheme objectForKeyedSubscript:@"VibrantTopFilterKey"];
}

- (NSString)vibrantBackgroundFilter
{
  return (NSString *)[(NSDictionary *)self->_colorsForCurrentTheme objectForKeyedSubscript:@"VibrantBackgroundFilterKey"];
}

- (unint64_t)interfaceStyleIntent
{
  unint64_t mapsThemeStyle = self->_mapsThemeStyle;
  if (mapsThemeStyle) {
    return 2 * (mapsThemeStyle == 1);
  }
  else {
    return 1;
  }
}

- (unint64_t)infoCardThemeType
{
  if ([(MapsTheme *)self visualEffectStyle]
    && (char *)[(MapsTheme *)self visualEffectStyle] != (char *)&dword_0 + 1)
  {
    return 0;
  }
  if ([(MapsTheme *)self mapsThemeStyle]) {
    return 2;
  }
  return 1;
}

- (int64_t)textFieldKeyboardAppearance
{
  if (self->_mapsThemeStyle) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)blurDarkeningAppearance
{
  if (self->_mapsThemeStyle) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)selectionBackgroundAppearance
{
  if (self->_mapsThemeStyle) {
    return 1;
  }
  else {
    return 4;
  }
}

- (BOOL)isCurrentThemeSatellite
{
  return self->_mapsThemeStyle != 0;
}

- (id)statusIndicatorTextColorForStyleDefault:(unint64_t)a3
{
  if (a3 == 1) {
    +[UIColor colorWithWhite:0.0 alpha:0.400000006];
  }
  else {
  v3 = +[UIColor blackColor];
  }

  return v3;
}

- (id)statusIndicatorTextColorForStyleLightContent:(unint64_t)a3
{
  if (a3 == 1) {
    +[UIColor colorWithWhite:1.0 alpha:0.400000006];
  }
  else {
  v3 = +[UIColor whiteColor];
  }

  return v3;
}

- (id)statusIndicatorBackgroundColor:(unint64_t)a3
{
  if (a3 == 1) {
    [(MapsTheme *)self colorForTag:@"StatusIndicatorHighlightedColorKey"];
  }
  else {
  v3 = [(MapsTheme *)self blueButtonBackgroundColor:0];
  }

  return v3;
}

- (UIColor)transitSchedulesOnTimeStopTimeTextColor
{
  return +[UIColor labelColor];
}

- (UIColor)transitSchedulesPastStopTextColor
{
  return +[UIColor tertiaryLabelColor];
}

- (UIColor)transitSchedulesPastStopLinkColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"TransitSchedulesPastDepartureLinkColor"];
}

- (UIColor)backgroundColorForModalFormSheet
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"BackgroundColorForModalFormSheet"];
}

- (id)colorForTag:(id)a3
{
  return [(NSDictionary *)self->_colorsForCurrentTheme objectForKeyedSubscript:a3];
}

- (UIColor)keyColor
{
  return (UIColor *)+[UIColor _maps_keyColor];
}

- (UIColor)darkKeyColor
{
  return (UIColor *)+[UIColor _maps_darkKeyColor];
}

- (id)blackCircleButtonBackgroundColor:(unint64_t)a3
{
  v3 = +[UIColor colorWithWhite:dbl_45C90[a3 == 1] alpha:1.0];

  return v3;
}

- (id)closeXColor
{
  return +[UIColor whiteColor];
}

- (UIColor)textFieldAtomSelectionBackgroundColor
{
  return (UIColor *)+[UIColor _maps_keyColor];
}

- (UIColor)navSignGuidanceManeuverColor
{
  return +[UIColor whiteColor];
}

- (UIColor)navResumeRouteBannerBackgroundColor
{
  return (UIColor *)+[UIColor _maps_keyColor];
}

- (UIColor)navResumeRouteBannerHighlightColor
{
  v2 = +[UIColor _maps_keyColor];
  v3 = +[UIColor colorWithWhite:0.0 alpha:0.100000001];
  id v4 = [v2 _colorBlendedWithColor:v3];

  return (UIColor *)v4;
}

- (UIColor)navSignGuidanceManeuverAccentColor
{
  return +[UIColor colorWithWhite:0.321568638 alpha:1.0];
}

+ (UIColor)weatherWidgetTextColor
{
  return +[UIColor colorNamed:@"WeatherWidgetTextColor"];
}

- (id)fadedGrayButtonBackgroundColor:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = +[UIColor colorWithWhite:0.0 alpha:0.0500000007];
    id v4 = +[UIColor colorWithWhite:0.0 alpha:0.300000012];
    BOOL v5 = [v3 _colorBlendedWithColor:v4];
  }
  else
  {
    BOOL v5 = [(MapsTheme *)self _maps_colorNamed:@"FadedGrayButtonColorKey"];
  }

  return v5;
}

+ (UIColor)ugcGlyphButtonViewMutedBackgroundColor
{
  return +[UIColor tertiarySystemFillColor];
}

+ (UIColor)ugcGlyphButtonViewMutedGlyphColor
{
  return +[UIColor quaternaryLabelColor];
}

+ (UIColor)ugcGlyphButtonViewUnselectedBackgroundColor
{
  return +[UIColor tertiarySystemFillColor];
}

+ (UIColor)ugcGlyphButtonViewUnselectedGlyphColor
{
  return +[UIColor secondaryLabelColor];
}

+ (UIColor)ugcGlyphButtonViewSelectedGlyphColor
{
  return (UIColor *)+[UIColor systemWhiteColor];
}

+ (UIColor)ugcGlyphButtonViewSelectedBackgroundColor
{
  return +[UIColor systemBlueColor];
}

+ (UIColor)ugcAddPhotoCellBackgroundColor
{
  v2 = +[UIColor labelColor];
  v3 = [v2 colorWithAlphaComponent:0.0500000007];

  return (UIColor *)v3;
}

+ (UIColor)ugcPOIEnrichmentEditorBackgroundColor
{
  v2 = +[UIColor labelColor];
  v3 = [v2 colorWithAlphaComponent:0.0500000007];

  return (UIColor *)v3;
}

+ (UIColor)ugcLegalAttributionLinkColor
{
  return (UIColor *)+[MapsTheme _colorWithAssetCatalogName:@"UGCUnselectedGlyphColor"];
}

+ (UIColor)ugcPhotoCarouselCellBackgroundColor
{
  return +[UIColor clearColor];
}

+ (UIColor)ugcHairlineColor
{
  v2 = +[UIColor labelColor];
  v3 = [v2 colorWithAlphaComponent:0.100000001];

  return (UIColor *)v3;
}

+ (id)_colorWithAssetCatalogName:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  BOOL v5 = +[UIColor colorNamed:v3 inBundle:v4 compatibleWithTraitCollection:0];

  return v5;
}

+ (UIColor)floatingControlsTintColor
{
  return (UIColor *)+[MapsTheme _colorWithAssetCatalogName:@"FloatingControlsTintColor"];
}

+ (UIColor)apertureKeyColor
{
  return +[UIColor colorWithRed:0.4992 green:0.8017 blue:0.999 alpha:1.0];
}

- (id)_maps_colorNamed:(id)a3
{
  id v3 = a3;
  id v4 = +[UIColor colorNamed:v3];
  if (!v4)
  {
    BOOL v5 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
    id v4 = +[UIColor colorNamed:v3 inBundle:v5 compatibleWithTraitCollection:0];
  }

  return v4;
}

- (UIColor)imageBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"ImageBackgroundColorKey"];
}

- (UIColor)imageBorderColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"ImageBorderColorKey"];
}

- (UIColor)disabledTitleColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"DisabledTitleColorKey"];
}

- (UIColor)hairlineBorderColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"HairlineBorderColorKey"];
}

- (UIColor)searchBarPlaceHolderColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"SearchBarPlaceHolderColorKey"];
}

- (UIColor)tableViewCellHighlightedOverlayColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"TableViewCellHighlightedOverlayColorKey"];
}

- (UIColor)childItemButtonBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"ChildItemButtonBackgroundColorKey"];
}

- (UIColor)textFieldAtomSelectionTextColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"TextFieldAtomSelectionTextColorKey"];
}

- (UIColor)autocompleteSectionTitleTextColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"AutocompleteSectionTitleTextColor"];
}

- (UIColor)steppingSignButtonTitleColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"SteppingSignButtonTitleColor"];
}

- (id)greenButtonTitleColor:(unint64_t)a3
{
  if (a3 == 1) {
    CFStringRef v3 = @"GreenButtonHighlightedTitleColorKey";
  }
  else {
    CFStringRef v3 = @"GreenButtonTitleColorKey";
  }
  id v4 = [(MapsTheme *)self _maps_colorNamed:v3];

  return v4;
}

- (id)blueButtonTitleColor:(unint64_t)a3
{
  if (a3 == 1) {
    CFStringRef v3 = @"BlueButtonHighlightedTitleColorKey";
  }
  else {
    CFStringRef v3 = @"BlueButtonTitleColorKey";
  }
  id v4 = [(MapsTheme *)self _maps_colorNamed:v3];

  return v4;
}

- (id)fadedGrayButtonTitleColor:(unint64_t)a3
{
  if (a3 == 1) {
    CFStringRef v3 = @"FadedGrayButtonTitleColorKey";
  }
  else {
    CFStringRef v3 = @"FadedGrayButtonHighlightedTitleColorKey";
  }
  id v4 = [(MapsTheme *)self _maps_colorNamed:v3];

  return v4;
}

- (UIColor)progressBarTrackTintColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"ProgressBarTrackTintColorKey"];
}

- (UIColor)progressBarDarkFillTintColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"ProgressBarDarkFillTintColorKey"];
}

- (UIColor)progressBarLightFillTintColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"ProgressBarLightFillTintColorKey"];
}

- (UIColor)navigationFeatureCellBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavigationFeatureCellBackgroundColor"];
}

- (UIColor)navigationFeatureCellForegroundColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavigationFeatureCellForegroundColor"];
}

- (UIColor)navigationFeatureCellHighlightedOverlayColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavigationFeatureCellHighlightedOverlayColor"];
}

- (UIColor)navResumeButtonColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavResumeButtonColor"];
}

- (UIColor)navSignPrimaryColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavSignPrimaryColor"];
}

- (UIColor)navSignSecondaryColor
{
  if (qword_8DC90 != -1) {
    dispatch_once(&qword_8DC90, &stru_60E78);
  }
  v2 = (void *)qword_8DC88;

  return (UIColor *)v2;
}

- (UIColor)navSignMajorTextColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavSignMajorTextColor"];
}

- (UIColor)navSignMinorTextColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavSignMinorTextColor"];
}

- (UIColor)navSignTertiaryTextColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavSignTertiaryTextColor"];
}

- (UIColor)navSignLaneGuidanceDividerColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavSignLaneGuidanceDividerColor"];
}

- (UIColor)navButtonPrimaryColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavButtonPrimaryColor"];
}

- (UIColor)navDirectionStepPrimaryColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavDirectionStepPrimaryColor"];
}

- (UIColor)navDirectionStepSecondaryColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavDirectionStepSecondaryColor"];
}

- (UIColor)navTrayTitleTextColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"NavTrayTitleTextColor"];
}

- (UIColor)parkedCarSectionHeaderColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"ParkedCarSectionHeaderColor"];
}

- (UIColor)parkedCarNotePlaceholderColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"ParkedCarNotePlaceholderColor"];
}

- (UIColor)addPhotoPlaceholderBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"AddPhotoPlaceholderBackgroundColor"];
}

- (UIColor)addPhotoPlaceholderForegroundColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"AddPhotoPlaceholderForegroundColor"];
}

- (UIColor)reservationsGrayColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"ReservationsGrayColor"];
}

- (UIColor)orbHintPhaseBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"OrbHintPhaseBackgroundColorKey"];
}

- (id)ridesharingRatingStarColorOn:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"RidesharingRatingStarOnColor";
  }
  else {
    CFStringRef v3 = @"RidesharingRatingStarOffColor";
  }
  id v4 = [(MapsTheme *)self _maps_colorNamed:v3];

  return v4;
}

- (id)ridesharingTippingOptionsBackgroundColor:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"RidesharingTippingOptionsBackgroundSelectedColor";
  }
  else {
    CFStringRef v3 = @"RidesharingTippingOptionsBackgroundUnselectedColor";
  }
  id v4 = [(MapsTheme *)self _maps_colorNamed:v3];

  return v4;
}

- (id)ridesharingTippingOptionsForegroundColor:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"RidesharingTippingOptionsForegroundSelectedColor";
  }
  else {
    CFStringRef v3 = @"RidesharingTippingOptionsForegroundUnselectedColor";
  }
  id v4 = [(MapsTheme *)self _maps_colorNamed:v3];

  return v4;
}

- (id)ridesharingTippingOptionsForegroundCurrencyColor:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"RidesharingTippingOptionsForegroundCurrencySelectedColor";
  }
  else {
    CFStringRef v3 = @"RidesharingTippingOptionsForegroundCurrencyUnselectedColor";
  }
  id v4 = [(MapsTheme *)self _maps_colorNamed:v3];

  return v4;
}

- (id)flyoverTourButtonBackgroundColor:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"FlyoverTourButtonBackgroundSelectedColor";
  }
  else {
    CFStringRef v3 = @"FlyoverTourButtonBackgroundUnselectedColor";
  }
  id v4 = [(MapsTheme *)self _maps_colorNamed:v3];

  return v4;
}

- (UIColor)venueFloorPickerTextColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"VenueFloorPickerTextColor"];
}

- (UIColor)venueFloorPickerLackingSearchResultsTextColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"VenueFloorPickerLackingSearchResultsTextColor"];
}

- (UIColor)venueFloorPickerHighlightColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"VenueFloorPickerHighlightColor"];
}

- (UIColor)favoriteCollectionIconColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"FavoriteCollectionIconColor"];
}

- (UIColor)favoriteCollectionIconBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self _maps_colorNamed:@"FavoriteCollectionIconBackgroundColor"];
}

- (UIColor)vibrantTopColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"VibrantTopColorKey"];
}

- (UIColor)vibrantBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"VibrantBackgroundColorKey"];
}

- (UIColor)controlBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"ControlBackgroundColorKey"];
}

- (UIColor)dynamicControlBackgroundColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7878;
  block[3] = &unk_60EC8;
  block[4] = self;
  if (qword_8DCA0 != -1) {
    dispatch_once(&qword_8DCA0, block);
  }
  return (UIColor *)(id)qword_8DC98;
}

- (UIColor)groupTableViewBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"GroupTableViewBackgroundColorKey"];
}

- (UIColor)groupTableViewCellBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"GroupTableViewCellBackgroundColorKey"];
}

- (UIColor)groupTableViewHairlineColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"GroupTableViewHairlineColor"];
}

- (UIColor)hairlineColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"HairLineColorKey"];
}

- (UIColor)dynamicHairlineColor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7B18;
  block[3] = &unk_60EC8;
  block[4] = self;
  if (qword_8DCB0 != -1) {
    dispatch_once(&qword_8DCB0, block);
  }
  return (UIColor *)(id)qword_8DCA8;
}

- (UIColor)controlTintColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"controlTintColorKey"];
}

- (id)greenButtonBackgroundColor:(unint64_t)a3
{
  if (a3 == 1) {
    CFStringRef v3 = @"GreenButtonHighlightedColorKey";
  }
  else {
    CFStringRef v3 = @"GreenButtonColorKey";
  }
  id v4 = [(MapsTheme *)self colorForTag:v3];

  return v4;
}

- (id)blueButtonBackgroundColor:(unint64_t)a3
{
  if (a3 == 1) {
    [(MapsTheme *)self colorForTag:@"BlueButtonHighlightedColorKey"];
  }
  else {
  CFStringRef v3 = +[UIColor _maps_keyColor];
  }

  return v3;
}

- (UIColor)navEndButtonTitleColor
{
  return +[UIColor whiteColor];
}

- (UIColor)navEndButtonBackgroundColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"kNavEndButtonBackgroundColor"];
}

- (UIColor)navEndButtonBackgroundHighlightedColor
{
  v2 = +[UIColor colorWithRed:1.0 green:0.282352954 blue:0.282352954 alpha:1.0];
  CFStringRef v3 = +[UIColor colorWithWhite:0.0 alpha:0.100000001];
  id v4 = [v2 _colorBlendedWithColor:v3];

  return (UIColor *)v4;
}

- (UIColor)navPauseButtonTitleColor
{
  return +[UIColor systemBlueColor];
}

- (UIColor)navPauseButtonBackgroundColor
{
  return +[UIColor tertiarySystemFillColor];
}

- (UIColor)navPauseButtonBackgroundHighlightedColor
{
  v2 = +[UIColor tertiarySystemFillColor];
  CFStringRef v3 = +[UIColor colorWithWhite:0.0 alpha:0.100000001];
  id v4 = [v2 _colorBlendedWithColor:v3];

  return (UIColor *)v4;
}

- (UIColor)navResumeButtonHighlightedColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"NavResumeButtonHighlightedColor"];
}

- (UIColor)navTraySecondaryTextColor
{
  return (UIColor *)[(MapsTheme *)self colorForTag:@"kNavTraySecondaryTextColor"];
}

- (unint64_t)visualEffectStyle
{
  return self->_visualEffectStyle;
}

- (BOOL)showLightContentForListStep
{
  return self->_showLightContentForListStep;
}

- (UIColor)browseTitleBackgroundColor
{
  return self->_browseTitleBackgroundColor;
}

- (unint64_t)mapsThemeStyle
{
  return self->_mapsThemeStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseTitleBackgroundColor, 0);

  objc_storeStrong((id *)&self->_colorsForCurrentTheme, 0);
}

@end