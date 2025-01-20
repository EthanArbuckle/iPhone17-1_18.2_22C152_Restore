@interface LPButtonStyle
+ (id)systemPillButtonStyleForPlatform:(int64_t)a3 sizeClass:(unint64_t)a4;
- (BOOL)enableUserInteractionForDecorativeButton;
- (BOOL)ignoresInvertColors;
- (BOOL)prefersBehavioralStylePad;
- (BOOL)showsChevronForSingleAction;
- (BOOL)useSegmentedControl;
- (BOOL)useSystemButtonAppearance;
- (LPButtonStyle)initWithPlatform:(int64_t)a3;
- (LPCircularProgressIndicatorStyle)progressIndicatorStyle;
- (LPPadding)margin;
- (LPPadding)padding;
- (LPPointUnit)additionalVerticalPadding;
- (LPPointUnit)height;
- (LPPointUnit)imagePadding;
- (LPPointUnit)indicatorSpacing;
- (LPPointUnit)menuMinimumWidth;
- (LPPointUnit)minimumHeight;
- (LPPointUnit)minimumWidth;
- (UIColor)backgroundColor;
- (UIColor)foregroundColor;
- (UIColor)menuBackgroundColor;
- (UIFont)font;
- (UIFont)menuFont;
- (UIImageSymbolConfiguration)symbolConfiguration;
- (int64_t)behavior;
- (void)setAdditionalVerticalPadding:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBehavior:(int64_t)a3;
- (void)setEnableUserInteractionForDecorativeButton:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHeight:(id)a3;
- (void)setIgnoresInvertColors:(BOOL)a3;
- (void)setImagePadding:(id)a3;
- (void)setIndicatorSpacing:(id)a3;
- (void)setMargin:(id)a3;
- (void)setMenuBackgroundColor:(id)a3;
- (void)setMenuFont:(id)a3;
- (void)setMenuMinimumWidth:(id)a3;
- (void)setMinimumHeight:(id)a3;
- (void)setMinimumWidth:(id)a3;
- (void)setPadding:(id)a3;
- (void)setPrefersBehavioralStylePad:(BOOL)a3;
- (void)setProgressIndicatorStyle:(id)a3;
- (void)setShowsChevronForSingleAction:(BOOL)a3;
- (void)setSymbolConfiguration:(id)a3;
- (void)setUseSegmentedControl:(BOOL)a3;
- (void)setUseSystemButtonAppearance:(BOOL)a3;
@end

@implementation LPButtonStyle

- (LPButtonStyle)initWithPlatform:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)LPButtonStyle;
  v4 = [(LPButtonStyle *)&v13 init];
  if (v4)
  {
    v5 = objc_alloc_init(LPPadding);
    padding = v4->_padding;
    v4->_padding = v5;

    v7 = objc_alloc_init(LPPadding);
    margin = v4->_margin;
    v4->_margin = v7;

    v4->_enableUserInteractionForDecorativeButton = 1;
    v9 = [[LPCircularProgressIndicatorStyle alloc] initWithPlatform:a3];
    progressIndicatorStyle = v4->_progressIndicatorStyle;
    v4->_progressIndicatorStyle = v9;

    v11 = v4;
  }

  return v4;
}

+ (id)systemPillButtonStyleForPlatform:(int64_t)a3 sizeClass:(unint64_t)a4
{
  v6 = [[LPButtonStyle alloc] initWithPlatform:a3];
  v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [(LPButtonStyle *)v6 setForegroundColor:v7];

  v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(LPButtonStyle *)v6 setBackgroundColor:v8];

  v9 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
  [(LPButtonStyle *)v6 setMenuBackgroundColor:v9];

  if (+[LPTestingOverrides forceMonospaceFonts])
  {
    uint64_t v10 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:11.0 weight:*MEMORY[0x1E4FB29C0]];
  }
  else
  {
    if (a3 == 5) {
      uint64_t v11 = 0x8000;
    }
    else {
      uint64_t v11 = 32770;
    }
    v12 = (void **)MEMORY[0x1E4FB2908];
    if (a3 != 5) {
      v12 = (void **)MEMORY[0x1E4FB2950];
    }
    uint64_t v10 = fontWithTraits(*v12, v11, a4);
  }
  objc_super v13 = (void *)v10;
  [(LPButtonStyle *)v6 setFont:v10];

  if (+[LPTestingOverrides forceMonospaceFonts]) {
    [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:11.0 weight:*MEMORY[0x1E4FB29C0]];
  }
  else {
    fontWithTraits((void *)*MEMORY[0x1E4FB2950], 0x8000, a4);
  }
  v14 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
  [(LPButtonStyle *)v6 setMenuFont:v14];

  if ((unint64_t)a3 < 5 || a3 == 6)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1830], "_lp_configurationWithTextStyle:weight:scale:", *MEMORY[0x1E4FB28C8], 7, 1);
  }
  else
  {
    if (a3 != 5) {
      goto LABEL_15;
    }
    uint64_t v15 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2998] scale:2];
  }
  v14 = (LPPointUnit *)v15;
LABEL_15:
  [(LPButtonStyle *)v6 setSymbolConfiguration:v14];

  if ((unint64_t)a3 <= 6) {
    v14 = [[LPPointUnit alloc] initWithValue:dbl_1A3711B10[a3]];
  }
  v16 = [(LPButtonStyle *)v6 padding];
  [v16 setLeading:v14];

  v17 = [(LPButtonStyle *)v6 padding];
  v18 = [v17 leading];
  v19 = [(LPButtonStyle *)v6 padding];
  [v19 setTrailing:v18];

  if ((unint64_t)a3 <= 6)
  {
    if (((1 << a3) & 0x65) != 0)
    {
      v20 = +[LPPointUnit zero];
    }
    else
    {
      v20 = [[LPPointUnit alloc] initWithValue:3.0];
    }
    v17 = v20;
  }
  v21 = [(LPButtonStyle *)v6 padding];
  [v21 setTop:v17];

  v22 = [(LPButtonStyle *)v6 padding];
  v23 = [v22 top];
  v24 = [(LPButtonStyle *)v6 padding];
  [v24 setBottom:v23];

  v25 = outerHorizontalIconMargin((id)a3);
  v26 = [(LPButtonStyle *)v6 margin];
  [v26 setLeading:v25];

  if ((unint64_t)a3 < 5) {
    goto LABEL_26;
  }
  if (a3 == 5)
  {
    v27 = [[LPPointUnit alloc] initWithValue:20.0];
    goto LABEL_27;
  }
  if (a3 == 6)
  {
LABEL_26:
    outerHorizontalIconMargin((id)a3);
    v27 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
LABEL_27:
    v25 = v27;
  }
  v28 = [(LPButtonStyle *)v6 margin];
  [v28 setTrailing:v25];

  v29 = [(LPButtonStyle *)v6 margin];
  v30 = [v29 trailing];
  v31 = [(LPButtonStyle *)v6 margin];
  [v31 setTop:v30];

  v32 = [(LPButtonStyle *)v6 margin];
  v33 = [v32 trailing];
  v34 = [(LPButtonStyle *)v6 margin];
  [v34 setBottom:v33];

  v35 = [[LPPointUnit alloc] initWithValue:24.0];
  [(LPButtonStyle *)v6 setIndicatorSpacing:v35];

  if ((unint64_t)a3 <= 6)
  {
    if (((1 << a3) & 0x65) != 0)
    {
      v36 = [[LPPointUnit alloc] initWithValue:72.0];
    }
    else
    {
      v36 = +[LPPointUnit zero];
    }
    v35 = v36;
  }
  [(LPButtonStyle *)v6 setMinimumWidth:v35];

  if ((unint64_t)a3 <= 6)
  {
    if (((1 << a3) & 0x1A) != 0)
    {
      uint64_t v39 = +[LPPointUnit zero];
    }
    else
    {
      v37 = [LPPointUnit alloc];
      if (((1 << a3) & 0x45) != 0) {
        double v38 = 36.0;
      }
      else {
        double v38 = 44.0;
      }
      uint64_t v39 = [(LPPointUnit *)v37 initWithValue:v38];
    }
    v35 = (LPPointUnit *)v39;
  }
  [(LPButtonStyle *)v6 setMinimumHeight:v35];

  if ((unint64_t)a3 <= 6)
  {
    if (((1 << a3) & 0x1A) != 0)
    {
      uint64_t v42 = +[LPPointUnit zero];
    }
    else
    {
      v40 = [LPPointUnit alloc];
      if (((1 << a3) & 0x45) != 0) {
        double v41 = 36.0;
      }
      else {
        double v41 = 44.0;
      }
      uint64_t v42 = [(LPPointUnit *)v40 initWithValue:v41];
    }
    v35 = (LPPointUnit *)v42;
  }
  [(LPButtonStyle *)v6 setHeight:v35];

  [(LPButtonStyle *)v6 setIgnoresInvertColors:0];
  if (a3 == 5) {
    [(LPButtonStyle *)v6 setUseSystemButtonAppearance:1];
  }

  return v6;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)menuBackgroundColor
{
  return self->_menuBackgroundColor;
}

- (void)setMenuBackgroundColor:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (UIFont)menuFont
{
  return self->_menuFont;
}

- (void)setMenuFont:(id)a3
{
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  return self->_symbolConfiguration;
}

- (void)setSymbolConfiguration:(id)a3
{
}

- (LPPadding)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
}

- (LPPadding)margin
{
  return self->_margin;
}

- (void)setMargin:(id)a3
{
}

- (LPPointUnit)imagePadding
{
  return self->_imagePadding;
}

- (void)setImagePadding:(id)a3
{
}

- (LPPointUnit)menuMinimumWidth
{
  return self->_menuMinimumWidth;
}

- (void)setMenuMinimumWidth:(id)a3
{
}

- (LPPointUnit)minimumWidth
{
  return self->_minimumWidth;
}

- (void)setMinimumWidth:(id)a3
{
}

- (LPPointUnit)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(id)a3
{
}

- (LPPointUnit)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
}

- (LPPointUnit)additionalVerticalPadding
{
  return self->_additionalVerticalPadding;
}

- (void)setAdditionalVerticalPadding:(id)a3
{
}

- (LPPointUnit)indicatorSpacing
{
  return self->_indicatorSpacing;
}

- (void)setIndicatorSpacing:(id)a3
{
}

- (LPCircularProgressIndicatorStyle)progressIndicatorStyle
{
  return self->_progressIndicatorStyle;
}

- (void)setProgressIndicatorStyle:(id)a3
{
}

- (BOOL)ignoresInvertColors
{
  return self->_ignoresInvertColors;
}

- (void)setIgnoresInvertColors:(BOOL)a3
{
  self->_ignoresInvertColors = a3;
}

- (BOOL)enableUserInteractionForDecorativeButton
{
  return self->_enableUserInteractionForDecorativeButton;
}

- (void)setEnableUserInteractionForDecorativeButton:(BOOL)a3
{
  self->_enableUserInteractionForDecorativeButton = a3;
}

- (BOOL)showsChevronForSingleAction
{
  return self->_showsChevronForSingleAction;
}

- (void)setShowsChevronForSingleAction:(BOOL)a3
{
  self->_showsChevronForSingleAction = a3;
}

- (BOOL)useSystemButtonAppearance
{
  return self->_useSystemButtonAppearance;
}

- (void)setUseSystemButtonAppearance:(BOOL)a3
{
  self->_useSystemButtonAppearance = a3;
}

- (BOOL)useSegmentedControl
{
  return self->_useSegmentedControl;
}

- (void)setUseSegmentedControl:(BOOL)a3
{
  self->_useSegmentedControl = a3;
}

- (BOOL)prefersBehavioralStylePad
{
  return self->_prefersBehavioralStylePad;
}

- (void)setPrefersBehavioralStylePad:(BOOL)a3
{
  self->_prefersBehavioralStylePad = a3;
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicatorStyle, 0);
  objc_storeStrong((id *)&self->_indicatorSpacing, 0);
  objc_storeStrong((id *)&self->_additionalVerticalPadding, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_minimumHeight, 0);
  objc_storeStrong((id *)&self->_minimumWidth, 0);
  objc_storeStrong((id *)&self->_menuMinimumWidth, 0);
  objc_storeStrong((id *)&self->_imagePadding, 0);
  objc_storeStrong((id *)&self->_margin, 0);
  objc_storeStrong((id *)&self->_padding, 0);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
  objc_storeStrong((id *)&self->_menuFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_menuBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_foregroundColor, 0);
}

@end