@interface CSProminentDisplayViewController
+ (Class)viewClass;
- (BOOL)_canShowWhileLocked;
- (BOOL)_sensitiveUIEnabled;
- (BOOL)_shouldShowElement:(unint64_t)a3;
- (BOOL)animatesTimeChanges;
- (BOOL)isFourDigitTime;
- (BOOL)shouldApplyVibrancyToComplications;
- (BOOL)usesEditingLayout;
- (BOOL)usesLandscapeTimeFontVariant;
- (BOOL)usesLightTimeFontVariant;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (BSUIVibrancyLUT)alternativeVibrancyEffectLUT;
- (CGRect)_timeStyleBounds;
- (CGRect)contentBoundingBox;
- (CGRect)previousTimeStyleBounds;
- (CSProminentDisplayInteractiveTransition)currentTransition;
- (CSProminentDisplayViewController)init;
- (CSProminentDisplayViewController)initWithElements:(unint64_t)a3 baseFont:(id)a4 date:(id)a5 textColor:(id)a6;
- (CSProminentDisplayViewController)initWithElements:(unint64_t)a3 date:(id)a4 textColor:(id)a5;
- (CSVibrantContentStyleRenderer)complicationRenderer;
- (CSVibrantContentStyleRenderer)timeRenderer;
- (NSDate)displayDate;
- (NSLocale)alternateCalendarLocale;
- (NSString)alternateCalendarIdentifier;
- (NSString)groupName;
- (NSString)numberingSystem;
- (PRPosterContentStyle)titleContentStyle;
- (UIColor)textColor;
- (UIFont)baseFont;
- (UIView)backgroundView;
- (UIViewController)complicationContainerViewController;
- (UIViewController)complicationSidebarViewController;
- (UIViewController)subtitleComplicationViewController;
- (double)complicationRowAlpha;
- (double)complicationSidebarAlpha;
- (double)timeAlpha;
- (double)vibrancyShadowAlpha;
- (id)_customSubtitleGlyphWithName:(id)a3;
- (id)_fallbackDate;
- (id)beginInteractiveTransitionToBaseFont:(id)a3 textColor:(id)a4;
- (id)beginInteractiveTransitionToBaseFont:(id)a3 vibrancyConfiguration:(id)a4;
- (id)beginInteractiveTransitionToBaseFont:(id)a3 vibrancyConfiguration:(id)a4 cachingVibrancyTransitionProvider:(id)a5;
- (id)effectiveTextColor;
- (id)transientSubtitleText;
- (int64_t)backgroundType;
- (int64_t)effectType;
- (int64_t)vibrancyContentType;
- (unint64_t)elements;
- (void)_createOrDestroyComplicationRowElementIfNecessary;
- (void)_createOrDestroyComplicationSidebarElementIfNecessary;
- (void)_createOrDestroySubtitleComplicationElementIfNecessary;
- (void)_createOrDestroySubtitleElementIfNecessary;
- (void)_createOrDestroyTimeElementIfNecessary;
- (void)_createOrDestroyVibrancyShadowViewIfNecessary;
- (void)_updateContentForSensitiveUI;
- (void)_updateElements;
- (void)_updateStyleBoundingRects;
- (void)_updateViewColors;
- (void)dealloc;
- (void)interactiveTransition:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)interactiveTransition:(id)a3 didUpdate:(double)a4;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAlternateCalendarIdentifier:(id)a3;
- (void)setAlternateCalendarIdentifier:(id)a3 locale:(id)a4;
- (void)setAlternateCalendarLocale:(id)a3;
- (void)setAlternativeVibrancyEffectLUTIdentifier:(id)a3 alternativeVibrancyEffectLUTBundleURL:(id)a4;
- (void)setAlternativeVibrancyEffectLUTIdentifier:(id)a3 alternativeVibrancyEffectLUTBundleURL:(id)a4 luminanceReduced:(BOOL)a5;
- (void)setAnimatesTimeChanges:(BOOL)a3;
- (void)setBackgroundType:(int64_t)a3;
- (void)setBaseFont:(id)a3;
- (void)setComplicationContainerViewController:(id)a3;
- (void)setComplicationRenderer:(id)a3;
- (void)setComplicationRowAlpha:(double)a3;
- (void)setComplicationSidebarAlpha:(double)a3;
- (void)setComplicationSidebarViewController:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentAlpha:(double)a3 forElements:(unint64_t)a4;
- (void)setCurrentTransition:(id)a3;
- (void)setCustomSubtitleWithText:(id)a3 glyphName:(id)a4;
- (void)setDateTimeAlignment:(int64_t)a3;
- (void)setDisplayDate:(id)a3;
- (void)setEffectType:(int64_t)a3;
- (void)setElements:(unint64_t)a3;
- (void)setGroupName:(id)a3;
- (void)setNumberingSystem:(id)a3;
- (void)setPreviousTimeStyleBounds:(CGRect)a3;
- (void)setShouldApplyVibrancyToComplications:(BOOL)a3;
- (void)setSubtitleComplicationViewController:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTimeAlpha:(double)a3;
- (void)setTimeRenderer:(id)a3;
- (void)setTitleContentStyle:(id)a3;
- (void)setTransientSubtitleText:(id)a3;
- (void)setTransientSubtitleText:(id)a3 withTimeout:(double)a4;
- (void)setUsesEditingLayout:(BOOL)a3;
- (void)setUsesLandscapeTimeFontVariant:(BOOL)a3;
- (void)setUsesLightTimeFontVariant:(BOOL)a3;
- (void)setVibrancyContentType:(int64_t)a3;
- (void)setVibrancyShadowAlpha:(double)a3;
- (void)updateCustomSubtitleWithText:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CSProminentDisplayViewController

- (void)setDisplayDate:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = v6;
    if (!v6)
    {
      v4 = [(CSProminentDisplayViewController *)self _fallbackDate];
    }
    id v6 = v4;
    objc_storeStrong((id *)&self->_displayDate, v4);
    v5 = [(CSProminentDisplayViewController *)self _displayView];
    [v5 setDisplayDate:v6];
  }
}

- (CSProminentDisplayViewController)initWithElements:(unint64_t)a3 date:(id)a4 textColor:(id)a5
{
  return [(CSProminentDisplayViewController *)self initWithElements:a3 baseFont:0 date:a4 textColor:a5];
}

- (CSProminentDisplayViewController)initWithElements:(unint64_t)a3 baseFont:(id)a4 date:(id)a5 textColor:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CSProminentDisplayViewController;
  v14 = [(CSProminentDisplayViewController *)&v20 init];
  v15 = v14;
  if (v14)
  {
    v14->_elements = a3;
    if (v12)
    {
      v16 = (NSDate *)v12;
    }
    else
    {
      v16 = [(CSProminentDisplayViewController *)v14 _fallbackDate];
    }
    displayDate = v15->_displayDate;
    v15->_displayDate = v16;

    v15->_effectType = 0;
    objc_storeStrong((id *)&v15->_textColor, a6);
    objc_storeStrong((id *)&v15->_baseFont, a4);
    v15->_timeAlpha = 1.0;
    v15->_complicationRowAlpha = 1.0;
    v15->_complicationSidebarAlpha = 1.0;
    v15->_vibrancyShadowAlpha = 1.0;
    v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v18 addObserver:v15 forKeyPath:@"SBSensitiveUIEnabled" options:1 context:0];

    [(CSProminentDisplayViewController *)v15 _updateContentForSensitiveUI];
  }

  return v15;
}

- (CSProminentDisplayViewController)init
{
  return [(CSProminentDisplayViewController *)self initWithElements:63 baseFont:0 date:0 textColor:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"SBSensitiveUIEnabled"];

  v4.receiver = self;
  v4.super_class = (Class)CSProminentDisplayViewController;
  [(CSProminentDisplayViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc((Class)[(id)objc_opt_class() viewClass]);
  objc_super v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  id v10 = (id)objc_msgSend(v3, "initWithFrame:");

  v5 = [v10 layer];
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 setName:v7];

  [(CSProminentDisplayViewController *)self setView:v10];
  v8 = [(CSProminentDisplayViewController *)self _displayView];
  objc_msgSend(v8, "setShouldApplyVibrancyToComplications:", -[CSProminentDisplayViewController shouldApplyVibrancyToComplications](self, "shouldApplyVibrancyToComplications"));
  v9 = [v8 vibrancyEffectView];
  objc_msgSend(v9, "setContentType:", -[CSProminentDisplayViewController vibrancyContentType](self, "vibrancyContentType"));

  [(CSProminentDisplayViewController *)self _updateElements];
  [(CSProminentDisplayViewController *)self _updateViewColors];
}

- (void)setShouldApplyVibrancyToComplications:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldApplyVibrancyToComplications = a3;
  id v4 = [(CSProminentDisplayViewController *)self _displayViewIfLoaded];
  [v4 setShouldApplyVibrancyToComplications:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSProminentDisplayViewController;
  -[CSProminentDisplayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = [(CSProminentDisplayViewController *)self view];
  v9 = [v8 window];

  uint64_t v10 = [v9 _toWindowOrientation];
  if (v10 != [v9 _fromWindowOrientation])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__CSProminentDisplayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E5E8A690;
    v11[4] = self;
    v11[5] = v10;
    [v7 animateAlongsideTransition:v11 completion:0];
  }
}

void __87__CSProminentDisplayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _displayView];
  [v2 updateContainerOrientationForBackgroundViews:*(void *)(a1 + 40)];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CSProminentDisplayViewController;
  [(CSProminentDisplayViewController *)&v9 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  v5 = [(CSProminentDisplayViewController *)self view];
  id v6 = [v5 window];
  uint64_t v7 = [v6 _windowInterfaceOrientation];

  v8 = [(CSProminentDisplayViewController *)self _displayView];
  [v8 updateContainerOrientationForBackgroundViews:v7];
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CSProminentDisplayViewController;
  [(CSProminentDisplayViewController *)&v8 viewDidLoad];
  BOOL v3 = [(CSProminentDisplayViewController *)self _displayView];
  id v4 = [v3 _screen];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  uint64_t v7 = v6;

  [v7 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSProminentDisplayViewController;
  [(CSProminentDisplayViewController *)&v6 viewWillAppear:a3];
  id v4 = [(CSProminentDisplayViewController *)self _displayView];
  v5 = [v4 timeView];
  [v5 setVisible:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSProminentDisplayViewController;
  [(CSProminentDisplayViewController *)&v6 viewDidDisappear:a3];
  id v4 = [(CSProminentDisplayViewController *)self _displayView];
  v5 = [v4 timeView];
  [v5 setVisible:0];
}

- (void)viewDidLayoutSubviews
{
  [(CSProminentDisplayViewController *)self _timeStyleBounds];
  if ((BSRectEqualToRect() & 1) == 0)
  {
    [(CSProminentDisplayViewController *)self _updateViewColors];
  }
}

- (CGRect)_timeStyleBounds
{
  id v2 = [(CSProminentDisplayViewController *)self _displayView];
  BOOL v3 = [v2 timeView];
  id v4 = [v3 textLabel];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGRect)contentBoundingBox
{
  +[CSProminentLayoutController frameForElements:self->_elements];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAlternateCalendarIdentifier:(id)a3 locale:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_alternateCalendarIdentifier, a3);
  objc_storeStrong((id *)&self->_alternateCalendarLocale, a4);
  double v8 = [(CSProminentDisplayViewController *)self _displayView];
  double v9 = [v8 subtitleView];

  double v10 = [(CSProminentDisplayViewController *)self _displayView];
  double v11 = [v10 subtitleView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [v9 setAlternateCalendarIdentifier:v13 locale:v7];
  }
}

- (void)setContentAlpha:(double)a3
{
}

- (void)setContentAlpha:(double)a3 forElements:(unint64_t)a4
{
  char v4 = a4;
  id v11 = [(CSProminentDisplayViewController *)self _displayView];
  if ((v4 & 0x20) != 0)
  {
    self->_vibrancyShadowAlpha = a3;
    id v7 = [v11 vibrancyShadowView];
    [v7 setAlpha:a3];
  }
  if (v4)
  {
    self->_timeAlpha = a3;
    double v8 = [v11 timeView];
    [v8 setAlpha:a3];
  }
  if ((v4 & 6) != 0) {
    [v11 setSubtitleAlpha:a3];
  }
  if ((v4 & 8) != 0)
  {
    self->_complicationRowAlpha = a3;
    double v9 = [v11 complicationRowView];
    [v9 setAlpha:a3];
  }
  if ((v4 & 0x10) != 0)
  {
    self->_complicationSidebarAlpha = a3;
    double v10 = [v11 complicationSidebarView];
    [v10 setAlpha:a3];
  }
}

- (id)beginInteractiveTransitionToBaseFont:(id)a3 textColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  double v8 = [(CSProminentDisplayViewController *)self _displayView];
  double v9 = [v8 vibrancyEffectView];
  double v10 = [v9 configuration];

  id v11 = objc_alloc(MEMORY[0x1E4F4F8E8]);
  uint64_t v12 = [v10 effectType];
  uint64_t v13 = [v10 backgroundType];
  double v14 = [(CSProminentDisplayViewController *)self alternativeVibrancyEffectLUT];
  double v15 = (void *)[v11 initWithEffectType:v12 backgroundType:v13 color:v7 groupName:0 blendConfiguration:0 blendAmount:v14 alternativeVibrancyEffectLUT:0.0];

  double v16 = [(CSProminentDisplayViewController *)self beginInteractiveTransitionToBaseFont:v6 vibrancyConfiguration:v15 cachingVibrancyTransitionProvider:0];

  return v16;
}

- (id)beginInteractiveTransitionToBaseFont:(id)a3 vibrancyConfiguration:(id)a4
{
  return [(CSProminentDisplayViewController *)self beginInteractiveTransitionToBaseFont:a3 vibrancyConfiguration:a4 cachingVibrancyTransitionProvider:0];
}

- (id)beginInteractiveTransitionToBaseFont:(id)a3 vibrancyConfiguration:(id)a4 cachingVibrancyTransitionProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:0.0];
  }
  id v11 = [(CSProminentDisplayViewController *)self _displayView];
  uint64_t v12 = [v11 vibrancyEffectView];
  uint64_t v13 = [v12 configuration];

  double v14 = [[CSProminentDisplayInteractiveTransition alloc] initWithViewController:self baseFont:v8 fromVibrancyConfiguration:v13 toVibrancyConfiguration:v9 cachingVibrancyTransitionProvider:v10];
  [(CSProminentDisplayViewController *)self setCurrentTransition:v14];

  return v14;
}

- (BOOL)usesLightTimeFontVariant
{
  double v2 = [(CSProminentDisplayViewController *)self _displayView];
  double v3 = [v2 timeView];
  char v4 = [v3 usesLightTimeFontVariant];

  return v4;
}

- (void)setUsesLightTimeFontVariant:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSProminentDisplayViewController *)self _displayView];
  char v4 = [v5 timeView];
  [v4 setUsesLightTimeFontVariant:v3];
}

- (BOOL)usesLandscapeTimeFontVariant
{
  double v2 = [(CSProminentDisplayViewController *)self _displayView];
  BOOL v3 = [v2 timeView];
  char v4 = [v3 usesLandscapeTimeFontVariant];

  return v4;
}

- (void)setUsesLandscapeTimeFontVariant:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSProminentDisplayViewController *)self _displayView];
  char v4 = [v5 timeView];
  [v4 setUsesLandscapeTimeFontVariant:v3];
}

- (BOOL)animatesTimeChanges
{
  double v2 = [(CSProminentDisplayViewController *)self _displayView];
  BOOL v3 = [v2 timeView];
  char v4 = [v3 animatesTimeChanges];

  return v4;
}

- (void)setAnimatesTimeChanges:(BOOL)a3
{
  uint64_t v4 = [(CSProminentDisplayViewController *)self _sensitiveUIEnabled] & a3;
  id v6 = [(CSProminentDisplayViewController *)self _displayView];
  id v5 = [v6 timeView];
  [v5 setAnimatesTimeChanges:v4];
}

- (void)setDateTimeAlignment:(int64_t)a3
{
  id v5 = [(CSProminentDisplayViewController *)self _displayView];
  id v6 = [v5 timeView];
  id v7 = [v6 textLabel];
  [v7 setTextAlignment:a3];

  id v10 = [(CSProminentDisplayViewController *)self _displayView];
  id v8 = [v10 subtitleView];
  id v9 = [v8 textLabel];
  [v9 setTextAlignment:a3];
}

- (BOOL)usesEditingLayout
{
  double v2 = [(CSProminentDisplayViewController *)self _displayView];
  char v3 = [v2 usesEditingLayout];

  return v3;
}

- (void)setUsesEditingLayout:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSProminentDisplayViewController *)self _displayView];
  [v4 setUsesEditingLayout:v3];
}

- (id)transientSubtitleText
{
  double v2 = [(CSProminentDisplayViewController *)self _displayView];
  BOOL v3 = [v2 transientSubtitleView];
  id v4 = [v3 textLabel];
  id v5 = [v4 text];

  return v5;
}

- (void)setTransientSubtitleText:(id)a3
{
  id v16 = a3;
  if ([v16 length])
  {
    id v4 = [(CSProminentDisplayViewController *)self view];
    id v5 = [v4 window];
    +[CSProminentLayoutController fontSizeForElementType:isLandscapeVariant:](CSProminentLayoutController, "fontSizeForElementType:isLandscapeVariant:", 2, (unint64_t)([v5 interfaceOrientation] - 3) < 2);
    double v7 = v6;

    +[CSProminentLayoutController fontWeightForElementType:2];
    id v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v7 weight:v8];
    id v10 = [CSProminentTextElementView alloc];
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v12 = [(CSProminentDisplayViewController *)self effectiveTextColor];
    uint64_t v13 = [(CSProminentTextElementView *)v10 initWithDate:v11 font:v9 textColor:v12];

    double v14 = [(CSProminentTextElementView *)v13 textLabel];
    if (objc_opt_respondsToSelector()) {
      [v14 setAdjustsFontSizeToFitWidth:1];
    }
    [v14 setMinimumScaleFactor:0.25];
    [(CSProminentTextElementView *)v13 setOverrideString:v16];
    double v15 = [(CSProminentDisplayViewController *)self _displayView];
    [v15 setTransientSubtitleView:v13];
  }
  else
  {
    id v9 = [(CSProminentDisplayViewController *)self _displayView];
    [v9 setTransientSubtitleView:0];
  }
}

- (void)setTransientSubtitleText:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 length];
  [(CSProminentDisplayViewController *)self setTransientSubtitleText:v6];
  if (v7)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__CSProminentDisplayViewController_setTransientSubtitleText_withTimeout___block_invoke;
    block[3] = &unk_1E5E8A6B8;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __73__CSProminentDisplayViewController_setTransientSubtitleText_withTimeout___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v2 = [WeakRetained _displayView];
  BOOL v3 = [v2 transientSubtitleView];
  id v4 = [v3 overrideString];
  int v5 = BSEqualStrings();

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v1);
    [v6 setTransientSubtitleText:0];
  }
}

- (BOOL)isFourDigitTime
{
  double v2 = [(CSProminentDisplayViewController *)self _displayView];
  BOOL v3 = [v2 timeView];
  char v4 = [v3 fourDigitTime];

  return v4;
}

- (void)setCustomSubtitleWithText:(id)a3 glyphName:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if ([v18 length])
  {
    uint64_t v7 = [(CSProminentDisplayViewController *)self view];
    dispatch_time_t v8 = [v7 window];
    +[CSProminentLayoutController fontSizeForElementType:isLandscapeVariant:](CSProminentLayoutController, "fontSizeForElementType:isLandscapeVariant:", 2, (unint64_t)([v8 interfaceOrientation] - 3) < 2);
    double v10 = v9;

    id v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v10];
    uint64_t v12 = [CSProminentLabeledElementView alloc];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    double v14 = [(CSProminentDisplayViewController *)self effectiveTextColor];
    double v15 = [(CSProminentDisplayViewController *)self _customSubtitleGlyphWithName:v6];
    id v16 = [(CSProminentLabeledElementView *)v12 initWithDate:v13 font:v11 textColor:v14 glyph:v15];

    [(CSProminentLabeledElementView *)v16 setAccessibilityIdentifier:@"cs-timer-countdown-view"];
    [(CSProminentLabeledElementView *)v16 setOverrideString:v18];
    v17 = [(CSProminentDisplayViewController *)self _displayView];
    [v17 setCustomSubtitleView:v16];
  }
  else
  {
    id v11 = [(CSProminentDisplayViewController *)self _displayView];
    [v11 setCustomSubtitleView:0];
  }
}

- (void)updateCustomSubtitleWithText:(id)a3
{
  id v4 = a3;
  id v6 = [(CSProminentDisplayViewController *)self _displayView];
  int v5 = [v6 customSubtitleView];
  [v5 setOverrideString:v4];
}

- (id)_customSubtitleGlyphWithName:(id)a3
{
  id v4 = a3;
  int v5 = [(CSProminentDisplayViewController *)self view];
  id v6 = [v5 window];
  +[CSProminentLayoutController fontSizeForElementType:isLandscapeVariant:](CSProminentLayoutController, "fontSizeForElementType:isLandscapeVariant:", 2, (unint64_t)([v6 interfaceOrientation] - 3) < 2);
  double v8 = v7;

  double v9 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:v8];
  double v10 = [MEMORY[0x1E4FB1818] systemImageNamed:v4 withConfiguration:v9];

  id v11 = [v10 imageWithRenderingMode:2];

  return v11;
}

- (id)_fallbackDate
{
  double v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:1168335660.0];
  BOOL v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  double v4 = 1168335660.0 - (double)[v3 secondsFromGMTForDate:v2];

  int v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v4];

  return v5;
}

- (void)setBaseFont:(id)a3
{
  objc_storeStrong((id *)&self->_baseFont, a3);
  id v5 = a3;
  id v7 = [(CSProminentDisplayViewController *)self _displayView];
  id v6 = [v7 timeView];
  [v6 setBaseFont:v5];
}

- (void)setNumberingSystem:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  numberingSystem = self->_numberingSystem;
  self->_numberingSystem = v5;

  id v8 = [(CSProminentDisplayViewController *)self _displayView];
  uint64_t v7 = CSTimeNumberingSystemStringToType(v4);

  [v8 setNumberingSystem:v7];
}

- (void)setSubtitleComplicationViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  subtitleComplicationViewController = self->_subtitleComplicationViewController;
  if (subtitleComplicationViewController != v5)
  {
    id v8 = v5;
    if (subtitleComplicationViewController)
    {
      [(UIViewController *)subtitleComplicationViewController willMoveToParentViewController:0];
      uint64_t v7 = [(CSProminentDisplayViewController *)self _displayView];
      [v7 setSubtitleComplicationView:0];

      [(UIViewController *)self->_subtitleComplicationViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_subtitleComplicationViewController, a3);
    subtitleComplicationViewController = (UIViewController *)[(CSProminentDisplayViewController *)self _updateElements];
    id v5 = v8;
  }

  MEMORY[0x1F41817F8](subtitleComplicationViewController, v5);
}

- (void)setComplicationContainerViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  complicationContainerViewController = self->_complicationContainerViewController;
  if (complicationContainerViewController != v5)
  {
    id v8 = v5;
    if (complicationContainerViewController)
    {
      [(UIViewController *)complicationContainerViewController willMoveToParentViewController:0];
      uint64_t v7 = [(CSProminentDisplayViewController *)self _displayView];
      [v7 setComplicationRowView:0];

      [(UIViewController *)self->_complicationContainerViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_complicationContainerViewController, a3);
    complicationContainerViewController = (UIViewController *)[(CSProminentDisplayViewController *)self _updateElements];
    id v5 = v8;
  }

  MEMORY[0x1F41817F8](complicationContainerViewController, v5);
}

- (void)setComplicationSidebarViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  complicationSidebarViewController = self->_complicationSidebarViewController;
  if (complicationSidebarViewController != v5)
  {
    id v8 = v5;
    if (complicationSidebarViewController)
    {
      [(UIViewController *)complicationSidebarViewController willMoveToParentViewController:0];
      uint64_t v7 = [(CSProminentDisplayViewController *)self _displayView];
      [v7 setComplicationSidebarView:0];

      [(UIViewController *)self->_complicationSidebarViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_complicationSidebarViewController, a3);
    complicationSidebarViewController = (UIViewController *)[(CSProminentDisplayViewController *)self _updateElements];
    id v5 = v8;
  }

  MEMORY[0x1F41817F8](complicationSidebarViewController, v5);
}

- (UIView)backgroundView
{
  double v2 = [(CSProminentDisplayViewController *)self _displayViewIfLoaded];
  BOOL v3 = [v2 backgroundView];

  return (UIView *)v3;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);

  [(CSProminentDisplayViewController *)self _updateViewColors];
}

- (void)setBackgroundType:(int64_t)a3
{
  self->_backgroundType = a3;
  [(CSProminentDisplayViewController *)self _updateViewColors];
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
  [(CSProminentDisplayViewController *)self _updateViewColors];
}

- (void)setGroupName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  groupName = self->_groupName;
  self->_groupName = v4;

  [(CSProminentDisplayViewController *)self _updateViewColors];
}

- (void)setAlternativeVibrancyEffectLUTIdentifier:(id)a3 alternativeVibrancyEffectLUTBundleURL:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    alternativeVibrancyEffectLUT = (BSUIVibrancyLUT *)[objc_alloc(MEMORY[0x1E4F4F8F8]) initWithIdentifier:v8 bundleURL:v6];
    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alternativeVibrancyEffectLUT, alternativeVibrancyEffectLUT);
      [(CSProminentDisplayViewController *)self _updateViewColors];
    }
  }
  else
  {
    alternativeVibrancyEffectLUT = self->_alternativeVibrancyEffectLUT;
    self->_alternativeVibrancyEffectLUT = 0;
  }
}

- (void)setAlternativeVibrancyEffectLUTIdentifier:(id)a3 alternativeVibrancyEffectLUTBundleURL:(id)a4 luminanceReduced:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  if (v11 && v8)
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F8F8]) initWithIdentifier:v11 bundleURL:v8];
    alternativeVibrancyEffectLUT = (BSUIVibrancyLUT *)[v9 copyWithLuminanceReduced:v5];

    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alternativeVibrancyEffectLUT, alternativeVibrancyEffectLUT);
      [(CSProminentDisplayViewController *)self _updateViewColors];
    }
  }
  else
  {
    alternativeVibrancyEffectLUT = self->_alternativeVibrancyEffectLUT;
    self->_alternativeVibrancyEffectLUT = 0;
  }
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  vibrancyConfiguration = self->_vibrancyConfiguration;
  if (!vibrancyConfiguration) {
    goto LABEL_7;
  }
  uint64_t v4 = [(BSUIVibrancyConfiguration *)vibrancyConfiguration backgroundType];
  if (v4 != [(CSProminentDisplayViewController *)self backgroundType]) {
    goto LABEL_7;
  }
  BOOL v5 = [(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration color];
  id v6 = [(CSProminentDisplayViewController *)self textColor];
  int v7 = BSEqualObjects();

  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v8 = [(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration effectType];
  if (v8 != [(CSProminentDisplayViewController *)self effectType]) {
    goto LABEL_7;
  }
  double v9 = [(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration groupName];
  double v10 = [(CSProminentDisplayViewController *)self groupName];
  int v11 = BSEqualObjects();

  if (!v11
    || ([(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration alternativeVibrancyEffectLUT], uint64_t v12 = objc_claimAutoreleasedReturnValue(), [(CSProminentDisplayViewController *)self alternativeVibrancyEffectLUT], v13 = objc_claimAutoreleasedReturnValue(), v14 = BSEqualObjects(), v13, v12, (v14 & 1) == 0))
  {
LABEL_7:
    id v15 = objc_alloc(MEMORY[0x1E4F4F8E8]);
    int64_t v16 = [(CSProminentDisplayViewController *)self effectType];
    int64_t v17 = [(CSProminentDisplayViewController *)self backgroundType];
    id v18 = [(CSProminentDisplayViewController *)self textColor];
    v19 = [(CSProminentDisplayViewController *)self groupName];
    objc_super v20 = [(CSProminentDisplayViewController *)self alternativeVibrancyEffectLUT];
    v21 = (BSUIVibrancyConfiguration *)[v15 initWithEffectType:v16 backgroundType:v17 color:v18 groupName:v19 blendConfiguration:0 blendAmount:v20 alternativeVibrancyEffectLUT:0.0];
    v22 = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v21;
  }
  v23 = self->_vibrancyConfiguration;

  return v23;
}

- (void)setVibrancyContentType:(int64_t)a3
{
  self->_vibrancyContentType = a3;
  id v5 = [(CSProminentDisplayViewController *)self _displayViewIfLoaded];
  uint64_t v4 = [v5 vibrancyEffectView];
  [v4 setContentType:a3];
}

- (id)effectiveTextColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (void)_updateViewColors
{
  BOOL v3 = [(CSProminentDisplayViewController *)self _displayView];
  [(CSProminentDisplayViewController *)self _timeStyleBounds];
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  timeRenderer = self->_timeRenderer;
  if (timeRenderer)
  {
    -[CSVibrantContentStyleRenderer setStyleBoundingRect:](timeRenderer, "setStyleBoundingRect:", v4, v5, v6, v7);
  }
  else
  {
    uint64_t v13 = [CSVibrantContentStyleRenderer alloc];
    char v14 = [v3 timeVibrancyEffectView];
    id v15 = -[CSVibrantContentStyleRenderer initWithVibrancyView:styleBoundingRect:](v13, "initWithVibrancyView:styleBoundingRect:", v14, v8, v9, v10, v11);
    int64_t v16 = self->_timeRenderer;
    self->_timeRenderer = v15;
  }
  complicationRenderer = self->_complicationRenderer;
  if (complicationRenderer)
  {
    -[CSVibrantContentStyleRenderer setStyleBoundingRect:](complicationRenderer, "setStyleBoundingRect:", v8, v9, v10, v11);
  }
  else
  {
    id v18 = [CSVibrantContentStyleRenderer alloc];
    v19 = [v3 vibrancyEffectView];
    objc_super v20 = -[CSVibrantContentStyleRenderer initWithVibrancyView:styleBoundingRect:](v18, "initWithVibrancyView:styleBoundingRect:", v19, v8, v9, v10, v11);
    v21 = self->_complicationRenderer;
    self->_complicationRenderer = v20;
  }
  v22 = [(CSProminentDisplayViewController *)self vibrancyConfiguration];
  [(CSVibrantContentStyleRenderer *)self->_timeRenderer setVibrancyConfiguration:v22];
  v23 = self->_timeRenderer;
  v24 = [(CSProminentDisplayViewController *)self titleContentStyle];
  [(CSVibrantContentStyleRenderer *)v23 applyStyle:v24];

  v25 = [(CSProminentDisplayViewController *)self titleContentStyle];
  uint64_t v26 = [v25 type];

  v27 = self->_complicationRenderer;
  if (v26 == 1)
  {
    [(CSVibrantContentStyleRenderer *)v27 clearAllStyling];
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2050000000;
    v28 = (void *)getPRPosterContentVibrantMonochromeStyleClass_softClass;
    uint64_t v42 = getPRPosterContentVibrantMonochromeStyleClass_softClass;
    if (!getPRPosterContentVibrantMonochromeStyleClass_softClass)
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __getPRPosterContentVibrantMonochromeStyleClass_block_invoke;
      v38[3] = &unk_1E5E8A6E0;
      v38[4] = &v39;
      __getPRPosterContentVibrantMonochromeStyleClass_block_invoke((uint64_t)v38);
      v28 = (void *)v40[3];
    }
    v29 = v28;
    _Block_object_dispose(&v39, 8);
    id v30 = objc_alloc_init(v29);
    [(CSVibrantContentStyleRenderer *)self->_complicationRenderer applyStyle:v30];
  }
  else
  {
    [(CSVibrantContentStyleRenderer *)v27 setVibrancyConfiguration:v22];
    v31 = self->_complicationRenderer;
    v32 = [(CSProminentDisplayViewController *)self titleContentStyle];
    [(CSVibrantContentStyleRenderer *)v31 applyStyle:v32];
  }
  v33 = [v3 vibrancyShadowView];
  [v33 setConfiguration:v22];

  v34 = [(CSProminentDisplayViewController *)self effectiveTextColor];
  v35 = [v3 timeView];
  [v35 setPrimaryTextColor:v34];

  v36 = [v3 subtitleView];
  [v36 setPrimaryTextColor:v34];

  v37 = [v3 transientSubtitleView];
  [v37 setPrimaryTextColor:v34];

  self->_previousTimeStyleBounds.origin.x = v8;
  self->_previousTimeStyleBounds.origin.y = v9;
  self->_previousTimeStyleBounds.size.double width = v10;
  self->_previousTimeStyleBounds.size.double height = v11;
}

- (void)_updateStyleBoundingRects
{
  [(CSProminentDisplayViewController *)self _timeStyleBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CSVibrantContentStyleRenderer setStyleBoundingRect:](self->_timeRenderer, "setStyleBoundingRect:");
  complicationRenderer = self->_complicationRenderer;

  -[CSVibrantContentStyleRenderer setStyleBoundingRect:](complicationRenderer, "setStyleBoundingRect:", v4, v6, v8, v10);
}

- (void)setTitleContentStyle:(id)a3
{
  objc_storeStrong((id *)&self->_titleContentStyle, a3);

  [(CSProminentDisplayViewController *)self _updateViewColors];
}

- (BOOL)_sensitiveUIEnabled
{
  double v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v2 BOOLForKey:@"SBSensitiveUIEnabled"])
  {
    BOOL v3 = 1;
  }
  else
  {
    double v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    double v5 = [v4 objectForKey:@"SBSensitiveUIEnabled"];
    BOOL v3 = v5 == 0;
  }
  return v3;
}

- (void)_updateContentForSensitiveUI
{
  BOOL v3 = [(CSProminentDisplayViewController *)self _sensitiveUIEnabled];

  [(CSProminentDisplayViewController *)self setAnimatesTimeChanges:v3];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (BSEqualStrings())
  {
    [(CSProminentDisplayViewController *)self _updateContentForSensitiveUI];
  }
}

- (void)setElements:(unint64_t)a3
{
  if (self->_elements != a3)
  {
    self->_elements = a3;
    [(CSProminentDisplayViewController *)self _updateElements];
  }
}

- (void)_updateElements
{
  [(CSProminentDisplayViewController *)self _createOrDestroyVibrancyShadowViewIfNecessary];
  [(CSProminentDisplayViewController *)self _createOrDestroyTimeElementIfNecessary];
  [(CSProminentDisplayViewController *)self _createOrDestroySubtitleElementIfNecessary];
  [(CSProminentDisplayViewController *)self _createOrDestroySubtitleComplicationElementIfNecessary];
  [(CSProminentDisplayViewController *)self _createOrDestroyComplicationRowElementIfNecessary];
  [(CSProminentDisplayViewController *)self _createOrDestroyComplicationSidebarElementIfNecessary];
  [(CSProminentDisplayViewController *)self _updateViewColors];
  id v3 = [(CSProminentDisplayViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)_createOrDestroyVibrancyShadowViewIfNecessary
{
  id v8 = [(CSProminentDisplayViewController *)self _displayView];
  id v3 = [v8 vibrancyShadowView];
  BOOL v4 = v3 == 0;

  BOOL v5 = [(CSProminentDisplayViewController *)self _shouldShowElement:32];
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F4F900]);
      double v7 = [(CSProminentDisplayViewController *)self vibrancyConfiguration];
      [v6 setConfiguration:v7];

      [v6 setAlpha:self->_vibrancyShadowAlpha];
      [v8 setVibrancyShadowView:v6];
    }
    else
    {
      [v8 setVibrancyShadowView:0];
    }
  }
}

- (void)_createOrDestroyTimeElementIfNecessary
{
  id v13 = [(CSProminentDisplayViewController *)self _displayView];
  id v3 = [v13 timeView];
  BOOL v4 = v3 == 0;

  BOOL v5 = [(CSProminentDisplayViewController *)self _shouldShowElement:1];
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5)
    {
      baseFont = self->_baseFont;
      if (baseFont)
      {
        double v7 = baseFont;
      }
      else
      {
        double v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:0.0];
      }
      id v8 = v7;
      double v9 = [CSProminentTimeView alloc];
      displayDate = self->_displayDate;
      double v11 = [(CSProminentDisplayViewController *)self effectiveTextColor];
      uint64_t v12 = [(CSProminentTimeView *)v9 initWithDate:displayDate baseFont:v8 textColor:v11];

      [(CSProminentTimeView *)v12 setNumberingSystem:CSTimeNumberingSystemStringToType(self->_numberingSystem)];
      [(CSProminentTimeView *)v12 setAlpha:self->_timeAlpha];
      [v13 setTimeView:v12];
    }
    else
    {
      [v13 setTimeView:0];
    }
  }
}

- (void)_createOrDestroySubtitleElementIfNecessary
{
  id v10 = [(CSProminentDisplayViewController *)self _displayView];
  id v3 = [v10 subtitleView];
  BOOL v4 = v3 == 0;

  BOOL v5 = [(CSProminentDisplayViewController *)self _shouldShowElement:2];
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5)
    {
      id v6 = [CSProminentSubtitleDateView alloc];
      displayDate = self->_displayDate;
      id v8 = [(CSProminentDisplayViewController *)self effectiveTextColor];
      double v9 = [(CSProminentSubtitleDateView *)v6 initWithDate:displayDate textColor:v8];

      [(CSProminentSubtitleDateView *)v9 setAlternateCalendarIdentifier:self->_alternateCalendarIdentifier locale:self->_alternateCalendarLocale];
      [v10 setSubtitleView:v9];
    }
    else
    {
      [v10 setSubtitleView:0];
    }
  }
}

- (void)_createOrDestroySubtitleComplicationElementIfNecessary
{
  id v9 = [(CSProminentDisplayViewController *)self _displayView];
  id v3 = [v9 subtitleComplicationView];
  BOOL v4 = v3 == 0;

  BOOL v5 = [(CSProminentDisplayViewController *)self _shouldShowElement:4];
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5 && self->_subtitleComplicationViewController)
    {
      -[CSProminentDisplayViewController addChildViewController:](self, "addChildViewController:");
      id v6 = [CSProminentEmptyElementView alloc];
      double v7 = [(UIViewController *)self->_subtitleComplicationViewController view];
      id v8 = [(CSProminentEmptyElementView *)v6 initWithContentView:v7];

      [v9 setSubtitleComplicationView:v8];
      [(UIViewController *)self->_subtitleComplicationViewController didMoveToParentViewController:self];
    }
    else
    {
      [v9 setSubtitleComplicationView:0];
    }
  }
}

- (void)_createOrDestroyComplicationRowElementIfNecessary
{
  id v9 = [(CSProminentDisplayViewController *)self _displayView];
  id v3 = [v9 complicationRowView];
  BOOL v4 = v3 == 0;

  BOOL v5 = [(CSProminentDisplayViewController *)self _shouldShowElement:8];
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5 && self->_complicationContainerViewController)
    {
      -[CSProminentDisplayViewController addChildViewController:](self, "addChildViewController:");
      id v6 = [CSProminentEmptyElementView alloc];
      double v7 = [(UIViewController *)self->_complicationContainerViewController view];
      id v8 = [(CSProminentEmptyElementView *)v6 initWithContentView:v7];

      [(CSProminentEmptyElementView *)v8 setAlpha:self->_complicationRowAlpha];
      [v9 setComplicationRowView:v8];
      [(UIViewController *)self->_complicationContainerViewController didMoveToParentViewController:self];
    }
    else
    {
      [v9 setComplicationRowView:0];
    }
  }
}

- (void)_createOrDestroyComplicationSidebarElementIfNecessary
{
  id v9 = [(CSProminentDisplayViewController *)self _displayView];
  id v3 = [v9 complicationSidebarView];
  BOOL v4 = v3 == 0;

  BOOL v5 = [(CSProminentDisplayViewController *)self _shouldShowElement:16];
  if (((v4 ^ v5) & 1) == 0)
  {
    if (v5 && self->_complicationSidebarViewController)
    {
      -[CSProminentDisplayViewController addChildViewController:](self, "addChildViewController:");
      id v6 = [CSProminentEmptyElementView alloc];
      double v7 = [(UIViewController *)self->_complicationSidebarViewController view];
      id v8 = [(CSProminentEmptyElementView *)v6 initWithContentView:v7];

      [(CSProminentEmptyElementView *)v8 setAlpha:self->_complicationSidebarAlpha];
      [v9 setComplicationSidebarView:v8];
      [(UIViewController *)self->_complicationSidebarViewController didMoveToParentViewController:self];
    }
    else
    {
      [v9 setComplicationSidebarView:0];
    }
  }
}

- (BOOL)_shouldShowElement:(unint64_t)a3
{
  return (a3 & ~self->_elements) == 0;
}

- (void)interactiveTransition:(id)a3 didUpdate:(double)a4
{
  id v22 = a3;
  id v6 = [(CSProminentDisplayViewController *)self currentTransition];

  double v7 = v22;
  if (v6 == v22)
  {
    id v8 = [v22 cachingVibrancyTransitionProvider];

    if (v8)
    {
      id v9 = [v22 cachingVibrancyTransitionProvider];
      id v10 = [v22 fromVibrancyConfiguration];
      double v11 = [v10 alternativeVibrancyEffectLUT];
      uint64_t v12 = [v22 toVibrancyConfiguration];
      id v13 = [v12 alternativeVibrancyEffectLUT];
      char v14 = [v13 lutIdentifier];
      id v15 = [v9 vibrancyLUTWithStartingLUT:v11 transitionProgress:v14 toIdentifier:a4];

      int64_t v16 = [v22 fromVibrancyConfiguration];
      int64_t v17 = [v22 toVibrancyConfiguration];
      id v8 = (void *)[v16 copyWithBlendAmount:v17 blendConfiguration:v15 alternativeVibrancyEffectLUT:a4];
    }
    id v18 = [(CSProminentDisplayViewController *)self _displayView];
    v19 = [v18 timeVibrancyEffectView];
    [v19 setConfiguration:v8];

    objc_super v20 = [v18 vibrancyEffectView];
    [v20 setConfiguration:v8];

    v21 = [v18 vibrancyShadowView];
    [v21 setConfiguration:v8];

    double v7 = v22;
  }
}

- (void)interactiveTransition:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v15 = a3;
  id v6 = [(CSProminentDisplayViewController *)self currentTransition];

  double v7 = v15;
  if (v6 == v15)
  {
    if (a4)
    {
      id v8 = [v15 baseFont];
      [(CSProminentDisplayViewController *)self setBaseFont:v8];

      [v15 toVibrancyConfiguration];
    }
    else
    {
      [v15 fromVibrancyConfiguration];
    id v9 = };
    id v10 = [v9 color];
    [(CSProminentDisplayViewController *)self setTextColor:v10];

    -[CSProminentDisplayViewController setBackgroundType:](self, "setBackgroundType:", [v9 backgroundType]);
    -[CSProminentDisplayViewController setEffectType:](self, "setEffectType:", [v9 effectType]);
    double v11 = [v9 alternativeVibrancyEffectLUT];
    uint64_t v12 = [v11 lutIdentifier];
    id v13 = [v11 bundleURL];
    [(CSProminentDisplayViewController *)self setAlternativeVibrancyEffectLUTIdentifier:v12 alternativeVibrancyEffectLUTBundleURL:v13 luminanceReduced:0];

    char v14 = [v9 groupName];
    [(CSProminentDisplayViewController *)self setGroupName:v14];

    [(CSProminentDisplayViewController *)self setCurrentTransition:0];
    double v7 = v15;
  }
}

- (unint64_t)elements
{
  return self->_elements;
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BSUIVibrancyLUT)alternativeVibrancyEffectLUT
{
  return self->_alternativeVibrancyEffectLUT;
}

- (int64_t)vibrancyContentType
{
  return self->_vibrancyContentType;
}

- (PRPosterContentStyle)titleContentStyle
{
  return self->_titleContentStyle;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (UIFont)baseFont
{
  return self->_baseFont;
}

- (NSString)numberingSystem
{
  return self->_numberingSystem;
}

- (UIViewController)subtitleComplicationViewController
{
  return self->_subtitleComplicationViewController;
}

- (UIViewController)complicationContainerViewController
{
  return self->_complicationContainerViewController;
}

- (UIViewController)complicationSidebarViewController
{
  return self->_complicationSidebarViewController;
}

- (BOOL)shouldApplyVibrancyToComplications
{
  return self->_shouldApplyVibrancyToComplications;
}

- (double)vibrancyShadowAlpha
{
  return self->_vibrancyShadowAlpha;
}

- (void)setVibrancyShadowAlpha:(double)a3
{
  self->_vibrancyShadowAlpha = a3;
}

- (double)timeAlpha
{
  return self->_timeAlpha;
}

- (void)setTimeAlpha:(double)a3
{
  self->_timeAlpha = a3;
}

- (double)complicationRowAlpha
{
  return self->_complicationRowAlpha;
}

- (void)setComplicationRowAlpha:(double)a3
{
  self->_complicationRowAlpha = a3;
}

- (double)complicationSidebarAlpha
{
  return self->_complicationSidebarAlpha;
}

- (void)setComplicationSidebarAlpha:(double)a3
{
  self->_complicationSidebarAlpha = a3;
}

- (NSString)alternateCalendarIdentifier
{
  return self->_alternateCalendarIdentifier;
}

- (void)setAlternateCalendarIdentifier:(id)a3
{
}

- (NSLocale)alternateCalendarLocale
{
  return self->_alternateCalendarLocale;
}

- (void)setAlternateCalendarLocale:(id)a3
{
}

- (CSProminentDisplayInteractiveTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
}

- (CSVibrantContentStyleRenderer)timeRenderer
{
  return self->_timeRenderer;
}

- (void)setTimeRenderer:(id)a3
{
}

- (CSVibrantContentStyleRenderer)complicationRenderer
{
  return self->_complicationRenderer;
}

- (void)setComplicationRenderer:(id)a3
{
}

- (CGRect)previousTimeStyleBounds
{
  double x = self->_previousTimeStyleBounds.origin.x;
  double y = self->_previousTimeStyleBounds.origin.y;
  double width = self->_previousTimeStyleBounds.size.width;
  double height = self->_previousTimeStyleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousTimeStyleBounds:(CGRect)a3
{
  self->_previousTimeStyleBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationRenderer, 0);
  objc_storeStrong((id *)&self->_timeRenderer, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_alternateCalendarLocale, 0);
  objc_storeStrong((id *)&self->_alternateCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_complicationSidebarViewController, 0);
  objc_storeStrong((id *)&self->_complicationContainerViewController, 0);
  objc_storeStrong((id *)&self->_subtitleComplicationViewController, 0);
  objc_storeStrong((id *)&self->_numberingSystem, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_titleContentStyle, 0);
  objc_storeStrong((id *)&self->_alternativeVibrancyEffectLUT, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_displayDate, 0);
}

@end