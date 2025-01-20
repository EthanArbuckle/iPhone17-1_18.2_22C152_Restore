@interface CSFocusActivityIndicator
+ (CGSize)activityIndicatorExpandedSize;
+ (CGSize)activityIndicatorSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CSFocusActivityIndicator)init;
- (FCActivityDescribing)activity;
- (_UILegibilitySettings)legibilitySettings;
- (double)strength;
- (int64_t)_userInterfaceStyleForCurrentActivity;
- (void)_setSelected:(BOOL)a3;
- (void)_updateForActivity;
- (void)_updateStyle;
- (void)setActivity:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
@end

@implementation CSFocusActivityIndicator

- (CSFocusActivityIndicator)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSFocusActivityIndicator;
  v2 = [(CSFocusActivityIndicator *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSFocusActivityIndicator *)v2 _setSelected:1];
    [(UICoverSheetButton *)v3 setPronounced:1];
    [(UICoverSheetButton *)v3 setShouldUseContinuousCorners:1];
    [(UICoverSheetButton *)v3 setImageContentMode:1];
    [(UICoverSheetButton *)v3 setStatisticsIdentifier:@"focusActivityIndicator"];
    [(CSFocusActivityIndicator *)v3 setAccessibilityIdentifier:@"focus-activity-orb-button"];
  }
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSFocusActivityIndicator;
  [(CSFocusActivityIndicator *)&v4 setEnabled:a3];
  [(CSFocusActivityIndicator *)self _updateStyle];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = objc_opt_class();

  [v3 activityIndicatorSize];
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend(v5, "sb_isEqualToLegibilitySettings:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(CSFocusActivityIndicator *)self _updateStyle];
  }
}

- (void)setActivity:(id)a3
{
  id v5 = (FCActivityDescribing *)a3;
  p_activity = &self->_activity;
  if (self->_activity != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_activity, a3);
    if (*p_activity) {
      objc_storeStrong((id *)&self->_previousActivity, *p_activity);
    }
    [(CSFocusActivityIndicator *)self _updateForActivity];
    [(CSFocusActivityIndicator *)self setOverrideUserInterfaceStyle:[(CSFocusActivityIndicator *)self _userInterfaceStyleForCurrentActivity]];
    id v5 = v7;
  }
}

+ (CGSize)activityIndicatorSize
{
  double v2 = 60.0;
  double v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)activityIndicatorExpandedSize
{
  [a1 activityIndicatorSize];
  double v3 = v2 + 29.0;
  double v5 = v4 + 20.0;
  result.height = v3;
  result.width = v5;
  return result;
}

- (void)_setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSFocusActivityIndicator;
  if ([(CSFocusActivityIndicator *)&v7 respondsToSelector:sel_setSelected_animated_])
  {
    v6.receiver = self;
    v6.super_class = (Class)CSFocusActivityIndicator;
    [(CSFocusActivityIndicator *)&v6 setSelected:v3 animated:1];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSFocusActivityIndicator;
    [(UICoverSheetButton *)&v5 setSelected:v3];
  }
}

- (void)_updateStyle
{
  id v5 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  if ([(CSFocusActivityIndicator *)self isEnabled])
  {
    id v3 = v5;
  }
  else
  {
    uint64_t v4 = [v5 colorWithAlphaComponent:0.25];

    id v3 = (id)v4;
  }
  id v6 = v3;
  [(CSFocusActivityIndicator *)self setTintColor:v3];
}

- (void)_updateForActivity
{
  activity = self->_activity;
  if (!activity) {
    activity = self->_previousActivity;
  }
  uint64_t v4 = activity;
  id v10 = [(FCActivityDescribing *)v4 activitySymbolImageName];
  id v5 = [MEMORY[0x1E4F42A80] _systemImageNamed:v10];
  id v6 = [v5 imageWithRenderingMode:2];

  [(UICoverSheetButton *)self setSelectedImage:v6];
  [(UICoverSheetButton *)self setImage:v6];
  objc_super v7 = objc_msgSend(MEMORY[0x1E4F428B8], "fcui_colorForActivity:", self->_activity);
  [(UICoverSheetButton *)self setSelectedTintColor:v7];
  v8 = [MEMORY[0x1E4F428B8] whiteColor];
  [(CSFocusActivityIndicator *)self setTintColor:v8];

  v9 = [(FCActivityDescribing *)self->_activity activityDisplayName];

  [(UICoverSheetButton *)self setLocalizedAccessoryTitle:v9];
  [(CSFocusActivityIndicator *)self _setSelected:self->_activity != 0];
  [(CSFocusActivityIndicator *)self setNeedsLayout];
}

- (int64_t)_userInterfaceStyleForCurrentActivity
{
  if (self->_activity) {
    return 1;
  }
  else {
    return 2;
  }
}

- (double)strength
{
  return self->_strength;
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (FCActivityDescribing)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);

  objc_storeStrong((id *)&self->_previousActivity, 0);
}

@end