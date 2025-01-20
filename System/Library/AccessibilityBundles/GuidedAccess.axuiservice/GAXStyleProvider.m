@interface GAXStyleProvider
+ (GAXStyleProvider)allocWithZone:(_NSZone *)a3;
- (BOOL)reduceTransparencyAndGraphics;
- (BOOL)workspaceInstructionsLabelShouldBeDisplayed;
- (BOOL)workspaceNavigationBarNeedsMiniMetricsInitialized;
- (CGSize)appFeatureViewIconSize;
- (CGSize)minimumSizeForInterestAreaPath;
- (GAXStyleProvider)init;
- (NSBundle)bundle;
- (NSDictionary)workspaceNavigationBarButtonTextAttributes;
- (NSMutableDictionary)cachedStyleProperties;
- (UIBlurEffect)featureViewOptionsBlurEffect;
- (UIColor)defaultButtonTitleColor;
- (UIColor)defaultLabelBackgroundColor;
- (UIColor)defaultLabelTextColor;
- (UIColor)featureViewControllerInstructionsColor;
- (UIColor)featureViewIconColor;
- (UIColor)featureViewOptionsButtonLineColor;
- (UIColor)hostedApplicationShadowColor;
- (UIColor)interestAreaViewBackgroundColor;
- (UIColor)interestAreaViewFingerPathStrokeColor;
- (UIColor)optionsDoneButtonBackgroundColor;
- (UIColor)optionsDoneButtonBackgroundHighlightedColor;
- (UIColor)optionsViewBackgroundDimmingColor;
- (UIEdgeInsets)featureViewFrameEdgeInsets;
- (UIEdgeInsets)hostedApplicationScaledFrameEdgeInsetsForInterfaceOrientation:(int64_t)a3;
- (UIEdgeInsets)workspaceInstructionsLabelEdgeInsets;
- (UIFont)featureViewControllerInstructionsFont;
- (UIFont)featureViewControllerOptionsButtonFont;
- (UIFont)featureViewControllerOptionsCellTextFont;
- (UIFont)featureViewDetailTextFont;
- (UIFont)featureViewOptionsButtonFont;
- (UIFont)featureViewTextFont;
- (UIFont)optionsDoneButtonFont;
- (UIFont)workspaceInstructionsLabelFont;
- (UIFont)workspaceNavigationBarTitleFont;
- (UIImage)appFeatureViewDefineIcon;
- (UIImage)hardwareFeatureViewHomeIcon;
- (UIImage)hardwareFeatureViewLockIcon;
- (UIImage)hardwareFeatureViewVolumeIcon;
- (UIImage)interestAreaViewBackgroundHatchingTexture;
- (UIImage)interestAreaViewCloseButtonImage;
- (UIImage)interestAreaViewResizingKnobButtonImage;
- (UIImage)systemFeatureViewKeyboardIcon;
- (UIImage)systemFeatureViewMotionIcon;
- (UIImage)systemFeatureViewTouchIcon;
- (UIImage)timeRestrictionsFeatureViewTimerIcon;
- (UIOffset)featureViewControllerOptionsButtonMiniOffset;
- (UIOffset)featureViewControllerOptionsButtonOffset;
- (UIOffset)featureViewOptionsButtonOffset;
- (UIOffset)featureViewToggleOffset;
- (UIOffset)optionsFeatureViewTextOffset;
- (double)_scaledFontSizeFromValue:(double)a3 maximum:(double)a4;
- (double)applicationViewRoundedCornerRadius;
- (double)defaultAnimationDuration;
- (double)fastAnimationDuration;
- (double)featureViewAdditionalBottomOffsetForLargeText;
- (double)featureViewControllerHeight;
- (double)featureViewControllerInstructionsHorizontalOffset;
- (double)featureViewControllerInstructionsMiniHorizontalOffset;
- (double)featureViewControllerLandscapeGutterWidth;
- (double)featureViewControllerMiniHeight;
- (double)featureViewControllerMinimimGutterWidth;
- (double)featureViewControllerMinimumHorizontalSpacing;
- (double)featureViewControllerOptionsButtonTitleHorizontalPadding;
- (double)featureViewControllerPortraitGutterWidth;
- (double)featureViewControllerVerticalOffset;
- (double)featureViewIconLargeTextLayoutTextIndent;
- (double)featureViewIconStandardLayoutWidth;
- (double)featureViewMinimumHeight;
- (double)featureViewOptionsButtonHeight;
- (double)featureViewOptionsButtonLineWidth;
- (double)featureViewOptionsButtonTitleHorizontalPadding;
- (double)featureViewTextHorizontalPadding;
- (double)interestAreaViewBackgroundHatchingTextureAlpha;
- (double)interestAreaViewBackgroundStripePatternAlpha;
- (double)interestAreaViewFingerPathLineWidth;
- (double)interestAreaViewSnapAnimationDuration;
- (double)marginOfErrorForDecidingToMergeInterestAreaPaths;
- (double)optionsDoneButtonHeight;
- (double)optionsViewSeparatorHeight;
- (double)optionsViewSeparatorHorizontalPadding;
- (double)optionsViewSeparatorVerticalPadding;
- (double)workspaceNavigationBarDismissButtonMinimumWidth;
- (id)_boldLabelFontWithSize:(double)a3;
- (id)_boldLabelFontWithSize:(double)a3 scale:(BOOL)a4;
- (id)_cachedIconWithName:(id)a3 forPropertyWithSelector:(SEL)a4;
- (id)_cachedIconWithName:(id)a3 inBundle:(id)a4 forPropertyWithSelector:(SEL)a5;
- (id)_cachedIconWithName:(id)a3 inBundle:(id)a4 withSize:(CGSize)a5 forPropertyWithSelector:(SEL)a6;
- (id)_cachedImageWithName:(id)a3 forPropertyWithSelector:(SEL)a4;
- (id)_cachedStyleObjectForPropertyWithSelector:(SEL)a3;
- (id)_lightLabelFontWithSize:(double)a3;
- (id)_mediumLabelFontWithSize:(double)a3;
- (id)_regularLabelFontWithSize:(double)a3;
- (void)_didReceiveMemoryWarning:(id)a3;
- (void)_setCachedStyleObject:(id)a3 forPropertyWithSelector:(SEL)a4;
- (void)dealloc;
- (void)setBundle:(id)a3;
- (void)setCachedStyleProperties:(id)a3;
@end

@implementation GAXStyleProvider

+ (GAXStyleProvider)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    if (!GAXUserInterfaceIdiomIsPad()) {
      GAXIsWidescreenPhone();
    }
    v6 = objc_opt_class();
    return (GAXStyleProvider *)[v6 allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___GAXStyleProvider;
    return (GAXStyleProvider *)objc_msgSendSuper2(&v7, "allocWithZone:", a3);
  }
}

- (GAXStyleProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)GAXStyleProvider;
  v2 = [(GAXStyleProvider *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_didReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationDidReceiveMemoryWarningNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)GAXStyleProvider;
  [(GAXStyleProvider *)&v4 dealloc];
}

- (NSBundle)bundle
{
  bundle = self->_bundle;
  if (!bundle)
  {
    objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v5 = self->_bundle;
    self->_bundle = v4;

    bundle = self->_bundle;
  }

  return bundle;
}

- (id)_cachedStyleObjectForPropertyWithSelector:(SEL)a3
{
  if (a3)
  {
    objc_super v4 = NSStringFromSelector(a3);
    if (v4)
    {
      objc_super v5 = [(GAXStyleProvider *)self cachedStyleProperties];
      v6 = [v5 objectForKey:v4];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_setCachedStyleObject:(id)a3 forPropertyWithSelector:(SEL)a4
{
  id v6 = a3;
  if (v6 && a4)
  {
    id v9 = v6;
    objc_super v7 = NSStringFromSelector(a4);
    if (v7)
    {
      v8 = [(GAXStyleProvider *)self cachedStyleProperties];
      if (!v8)
      {
        v8 = objc_opt_new();
        [(GAXStyleProvider *)self setCachedStyleProperties:v8];
      }
      [v8 setObject:v9 forKey:v7];
    }
    id v6 = v9;
  }
}

- (id)_cachedImageWithName:(id)a3 forPropertyWithSelector:(SEL)a4
{
  id v6 = a3;
  objc_super v7 = [(GAXStyleProvider *)self _cachedStyleObjectForPropertyWithSelector:a4];
  if (!v7)
  {
    if ([v6 length])
    {
      v8 = [(GAXStyleProvider *)self bundle];
      objc_super v7 = +[UIImage imageNamed:v6 inBundle:v8];

      [(GAXStyleProvider *)self _setCachedStyleObject:v7 forPropertyWithSelector:a4];
    }
    else
    {
      objc_super v7 = 0;
    }
  }

  return v7;
}

- (id)_cachedIconWithName:(id)a3 forPropertyWithSelector:(SEL)a4
{
  id v6 = a3;
  objc_super v7 = [(GAXStyleProvider *)self bundle];
  v8 = [(GAXStyleProvider *)self _cachedIconWithName:v6 inBundle:v7 forPropertyWithSelector:a4];

  return v8;
}

- (id)_cachedIconWithName:(id)a3 inBundle:(id)a4 forPropertyWithSelector:(SEL)a5
{
  return -[GAXStyleProvider _cachedIconWithName:inBundle:withSize:forPropertyWithSelector:](self, "_cachedIconWithName:inBundle:withSize:forPropertyWithSelector:", a3, a4, a5, CGSizeZero.width, CGSizeZero.height);
}

- (id)_cachedIconWithName:(id)a3 inBundle:(id)a4 withSize:(CGSize)a5 forPropertyWithSelector:(SEL)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a4;
  v13 = [(GAXStyleProvider *)self _cachedStyleObjectForPropertyWithSelector:a6];
  if (!v13)
  {
    if ([v11 length])
    {
      v14 = +[UIImage imageNamed:v11 inBundle:v12];
      v15 = v14;
      if (width != CGSizeZero.width || height != CGSizeZero.height)
      {
        uint64_t v17 = objc_msgSend(v14, "imageByPreparingThumbnailOfSize:", width, height);

        v15 = (void *)v17;
      }
      v18 = [(GAXStyleProvider *)self featureViewIconColor];
      v13 = [v15 flattenedImageWithColor:v18];

      [(GAXStyleProvider *)self _setCachedStyleObject:v13 forPropertyWithSelector:a6];
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (double)_scaledFontSizeFromValue:(double)a3 maximum:(double)a4
{
  id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v6 _scaledValueForValue:a3];
  double v8 = fmin(a4, v7);

  return v8;
}

- (id)_boldLabelFontWithSize:(double)a3
{
  return [(GAXStyleProvider *)self _boldLabelFontWithSize:1 scale:a3];
}

- (id)_boldLabelFontWithSize:(double)a3 scale:(BOOL)a4
{
  if (a4) {
    [(GAXStyleProvider *)self _scaledFontSizeFromValue:a3 maximum:1.79769313e308];
  }

  return +[UIFont boldSystemFontOfSize:a3];
}

- (id)_mediumLabelFontWithSize:(double)a3
{
  [(GAXStyleProvider *)self _scaledFontSizeFromValue:a3 maximum:1.79769313e308];

  return +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
}

- (id)_regularLabelFontWithSize:(double)a3
{
  [(GAXStyleProvider *)self _scaledFontSizeFromValue:a3 maximum:1.79769313e308];

  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (id)_lightLabelFontWithSize:(double)a3
{
  [(GAXStyleProvider *)self _scaledFontSizeFromValue:a3 maximum:1.79769313e308];

  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  [(GAXStyleProvider *)self setCachedStyleProperties:0];

  [(GAXStyleProvider *)self setBundle:0];
}

- (double)defaultAnimationDuration
{
  return 0.3;
}

- (double)fastAnimationDuration
{
  [(GAXStyleProvider *)self defaultAnimationDuration];
  return v2 / 3.0 + v2 / 3.0;
}

- (double)applicationViewRoundedCornerRadius
{
  return 0.0;
}

- (BOOL)reduceTransparencyAndGraphics
{
  if (UIAccessibilityIsReduceTransparencyEnabled()) {
    return 1;
  }
  v3 = +[UIDevice currentDevice];
  BOOL v2 = [v3 _graphicsQuality] == (char *)&dword_8 + 2;

  return v2;
}

- (UIColor)defaultButtonTitleColor
{
  return +[UIColor whiteColor];
}

- (UIColor)defaultLabelTextColor
{
  return +[UIColor whiteColor];
}

- (UIColor)defaultLabelBackgroundColor
{
  return +[UIColor clearColor];
}

- (UIFont)workspaceNavigationBarTitleFont
{
  return (UIFont *)[(GAXStyleProvider *)self _boldLabelFontWithSize:0 scale:18.0];
}

- (double)workspaceNavigationBarDismissButtonMinimumWidth
{
  return 60.0;
}

- (NSDictionary)workspaceNavigationBarButtonTextAttributes
{
  NSAttributedStringKey v5 = NSForegroundColorAttributeName;
  BOOL v2 = +[UIColor whiteColor];
  id v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (BOOL)workspaceNavigationBarNeedsMiniMetricsInitialized
{
  return 0;
}

- (UIFont)workspaceInstructionsLabelFont
{
  return (UIFont *)[(GAXStyleProvider *)self _lightLabelFontWithSize:14.0];
}

- (UIEdgeInsets)workspaceInstructionsLabelEdgeInsets
{
  double v2 = 0.0;
  double v3 = 20.0;
  double v4 = 27.0;
  double v5 = 20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIColor)hostedApplicationShadowColor
{
  return +[UIColor colorWithWhite:0.0 alpha:0.1];
}

- (double)interestAreaViewSnapAnimationDuration
{
  [(GAXStyleProvider *)self defaultAnimationDuration];
  return v2 + v2;
}

- (double)interestAreaViewBackgroundStripePatternAlpha
{
  return 0.9;
}

- (UIColor)interestAreaViewBackgroundColor
{
  return +[UIColor colorWithWhite:0.58203125 alpha:1.0];
}

- (UIImage)interestAreaViewBackgroundHatchingTexture
{
  return (UIImage *)[(GAXStyleProvider *)self _cachedImageWithName:@"hatching" forPropertyWithSelector:a2];
}

- (double)interestAreaViewBackgroundHatchingTextureAlpha
{
  [(GAXStyleProvider *)self interestAreaViewBackgroundStripePatternAlpha];
  return 0.05 / v2;
}

- (UIColor)interestAreaViewFingerPathStrokeColor
{
  return +[UIColor colorWithRed:0.12109375 green:0.12109375 blue:0.12109375 alpha:1.0];
}

- (double)interestAreaViewFingerPathLineWidth
{
  return 3.0;
}

- (UIImage)interestAreaViewCloseButtonImage
{
  return (UIImage *)[(GAXStyleProvider *)self _cachedImageWithName:@"closebox" forPropertyWithSelector:a2];
}

- (UIImage)interestAreaViewResizingKnobButtonImage
{
  return (UIImage *)[(GAXStyleProvider *)self _cachedImageWithName:@"knob" forPropertyWithSelector:a2];
}

- (CGSize)minimumSizeForInterestAreaPath
{
  double v2 = 30.0;
  double v3 = 30.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)marginOfErrorForDecidingToMergeInterestAreaPaths
{
  return 8.0;
}

- (double)featureViewControllerHeight
{
  return 44.0;
}

- (double)featureViewControllerMiniHeight
{
  return 31.5;
}

- (UIFont)featureViewControllerInstructionsFont
{
  return (UIFont *)[(GAXStyleProvider *)self _lightLabelFontWithSize:12.0];
}

- (UIColor)featureViewControllerInstructionsColor
{
  return +[UIColor whiteColor];
}

- (double)featureViewControllerInstructionsHorizontalOffset
{
  return 4.0;
}

- (double)featureViewControllerInstructionsMiniHorizontalOffset
{
  return 4.0;
}

- (double)featureViewControllerLandscapeGutterWidth
{
  return 137.0;
}

- (double)featureViewControllerMinimimGutterWidth
{
  return 15.0;
}

- (double)featureViewControllerMinimumHorizontalSpacing
{
  return 45.0;
}

- (UIFont)featureViewControllerOptionsButtonFont
{
  return (UIFont *)[(GAXStyleProvider *)self _regularLabelFontWithSize:17.0];
}

- (UIOffset)featureViewControllerOptionsButtonMiniOffset
{
  double v2 = 4.0;
  double v3 = 5.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIOffset)featureViewControllerOptionsButtonOffset
{
  double v2 = 9.0;
  double v3 = 10.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (double)featureViewControllerOptionsButtonTitleHorizontalPadding
{
  return 8.0;
}

- (UIFont)featureViewControllerOptionsCellTextFont
{
  return (UIFont *)[(GAXStyleProvider *)self _boldLabelFontWithSize:17.0];
}

- (double)featureViewControllerPortraitGutterWidth
{
  return 69.0;
}

- (double)featureViewControllerVerticalOffset
{
  return 17.0;
}

- (UIFont)featureViewDetailTextFont
{
  return (UIFont *)[(GAXStyleProvider *)self _mediumLabelFontWithSize:15.0];
}

- (UIEdgeInsets)featureViewFrameEdgeInsets
{
  double v2 = 0.0;
  double v3 = 15.0;
  double v4 = 0.0;
  double v5 = 15.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIColor)featureViewIconColor
{
  return +[UIColor whiteColor];
}

- (double)featureViewIconStandardLayoutWidth
{
  return 65.0;
}

- (double)featureViewIconLargeTextLayoutTextIndent
{
  return 43.0;
}

- (UIFont)featureViewOptionsButtonFont
{
  double v3 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  double v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v3];
  [v4 pointSize];
  double v6 = v5;

  [(GAXStyleProvider *)self _scaledFontSizeFromValue:17.0 maximum:v6];
  double v7 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");

  return (UIFont *)v7;
}

- (double)featureViewOptionsButtonHeight
{
  return 31.0;
}

- (UIColor)featureViewOptionsButtonLineColor
{
  return +[UIColor colorWithWhite:0.901960784 alpha:1.0];
}

- (double)featureViewOptionsButtonLineWidth
{
  return 1.5;
}

- (UIOffset)featureViewOptionsButtonOffset
{
  double v2 = 15.0;
  double v3 = -1.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (double)featureViewOptionsButtonTitleHorizontalPadding
{
  return 20.0;
}

- (UIBlurEffect)featureViewOptionsBlurEffect
{
  return +[UIBlurEffect effectWithStyle:1200];
}

- (double)featureViewTextHorizontalPadding
{
  return 14.0;
}

- (double)featureViewAdditionalBottomOffsetForLargeText
{
  return 0.0;
}

- (UIImage)appFeatureViewDefineIcon
{
  return (UIImage *)[(GAXStyleProvider *)self _cachedIconWithName:@"feature-define" forPropertyWithSelector:a2];
}

- (CGSize)appFeatureViewIconSize
{
  double v2 = 45.0;
  double v3 = 45.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (UIImage)hardwareFeatureViewHomeIcon
{
  if (MGGetBoolAnswer()) {
    CFStringRef v4 = @"feature-home-mesa";
  }
  else {
    CFStringRef v4 = @"feature-home";
  }
  double v5 = [(GAXStyleProvider *)self _cachedIconWithName:v4 forPropertyWithSelector:a2];

  return (UIImage *)v5;
}

- (UIImage)hardwareFeatureViewLockIcon
{
  CFStringRef v4 = AXAssistiveTouchBundle();
  double v5 = [(GAXStyleProvider *)self _cachedIconWithName:@"IconLock", v4, a2, 40.0, 40.0 inBundle withSize forPropertyWithSelector];

  return (UIImage *)v5;
}

- (UIImage)hardwareFeatureViewVolumeIcon
{
  CFStringRef v4 = AXAssistiveTouchBundle();
  double v5 = [(GAXStyleProvider *)self _cachedIconWithName:@"IconVolumeUp", v4, a2, 25.0, 25.0 inBundle withSize forPropertyWithSelector];

  return (UIImage *)v5;
}

- (UIImage)timeRestrictionsFeatureViewTimerIcon
{
  return +[UIImage systemImageNamed:@"timer"];
}

- (UIOffset)optionsFeatureViewTextOffset
{
  double v2 = 0.0;
  double v3 = -6.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIImage)systemFeatureViewKeyboardIcon
{
  return +[UIImage systemImageNamed:@"keyboard"];
}

- (UIImage)systemFeatureViewMotionIcon
{
  CFStringRef v4 = AXAssistiveTouchBundle();
  double v5 = [(GAXStyleProvider *)self _cachedIconWithName:@"IconRotate", v4, a2, 35.0, 35.0 inBundle withSize forPropertyWithSelector];

  return (UIImage *)v5;
}

- (UIImage)systemFeatureViewTouchIcon
{
  CFStringRef v4 = AXAssistiveTouchBundle();
  double v5 = [(GAXStyleProvider *)self _cachedIconWithName:@"SCATIcon_gestures_fingers1", v4, a2, 43.0, 43.0 inBundle withSize forPropertyWithSelector];

  return (UIImage *)v5;
}

- (UIColor)optionsDoneButtonBackgroundColor
{
  return +[UIColor clearColor];
}

- (UIColor)optionsDoneButtonBackgroundHighlightedColor
{
  return +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.05];
}

- (UIFont)optionsDoneButtonFont
{
  return (UIFont *)[(GAXStyleProvider *)self _regularLabelFontWithSize:23.0];
}

- (double)optionsDoneButtonHeight
{
  return 53.0;
}

- (UIColor)optionsViewBackgroundDimmingColor
{
  return +[UIColor blackColor];
}

- (double)optionsViewSeparatorHeight
{
  return 1.0 / GAXMainScreenScale();
}

- (double)optionsViewSeparatorHorizontalPadding
{
  return 15.0;
}

- (double)optionsViewSeparatorVerticalPadding
{
  return 12.5;
}

- (void)setBundle:(id)a3
{
}

- (NSMutableDictionary)cachedStyleProperties
{
  return self->_cachedStyleProperties;
}

- (void)setCachedStyleProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStyleProperties, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

- (BOOL)workspaceInstructionsLabelShouldBeDisplayed
{
  return 0;
}

- (UIEdgeInsets)hostedApplicationScaledFrameEdgeInsetsForInterfaceOrientation:(int64_t)a3
{
  sub_F7A8();
  objc_opt_class();
  sub_F78C();
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)featureViewMinimumHeight
{
  return 0.0;
}

- (UIFont)featureViewTextFont
{
  return 0;
}

- (UIOffset)featureViewToggleOffset
{
  sub_F7A8();
  objc_opt_class();
  sub_F78C();
  double horizontal = UIOffsetZero.horizontal;
  double vertical = UIOffsetZero.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

@end