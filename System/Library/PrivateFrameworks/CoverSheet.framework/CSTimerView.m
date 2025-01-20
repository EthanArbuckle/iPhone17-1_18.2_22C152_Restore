@interface CSTimerView
- (CSTimerView)init;
- (NSString)timerText;
- (double)interItemSpacing;
- (id)_newTimerDialForSettings:(id)a3 withFont:(id)a4;
- (id)_timerFont;
- (id)accessoryView;
- (void)_updateLegibilityStrength;
- (void)dealloc;
- (void)setEndDate:(id)a3;
- (void)setFont:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateTimerLabel;
@end

@implementation CSTimerView

- (CSTimerView)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSTimerView;
  v2 = [(SBFLockScreenDateSubtitleView *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(CSTimerView *)v2 _timerFont];
    [(CSTimerView *)v3 setFont:v4];

    v5 = [(SBFLockScreenDateSubtitleView *)v3 legibilitySettings];
    v6 = [(SBFLockScreenDateSubtitleView *)v3 font];
    id v7 = [(CSTimerView *)v3 _newTimerDialForSettings:v5 withFont:v6];
    [(SBFLockScreenDateSubtitleView *)v3 setAccessoryView:v7];

    v8 = [MEMORY[0x1E4FA5F38] rootSettings];
    [v8 addKeyObserver:v3];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4FA5F38] rootSettings];
  [v3 removeKeyObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSTimerView;
  [(SBFLockScreenDateSubtitleView *)&v4 dealloc];
}

- (id)accessoryView
{
  v8.receiver = self;
  v8.super_class = (Class)CSTimerView;
  v2 = [(SBFLockScreenDateSubtitleView *)&v8 accessoryView];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)setFont:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSTimerView;
  id v4 = a3;
  [(SBFLockScreenDateSubtitleView *)&v6 setFont:v4];
  v5 = [(CSTimerView *)self accessoryView];
  [v5 setFont:v4];

  [v5 sizeToFit];
}

- (void)setLegibilitySettings:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSTimerView;
  id v4 = a3;
  [(SBFLockScreenDateSubtitleView *)&v7 setLegibilitySettings:v4];
  [(CSTimerView *)self _updateLegibilityStrength];
  v5 = [(SBFLockScreenDateSubtitleView *)self font];
  id v6 = [(CSTimerView *)self _newTimerDialForSettings:v4 withFont:v5];

  [(SBFLockScreenDateSubtitleView *)self setAccessoryView:v6];
}

- (double)interItemSpacing
{
  return 0.0;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)timerText
{
  [(NSDate *)self->_endDate timeIntervalSinceNow];
  double v3 = v2;
  id v4 = [MEMORY[0x1E4F4F708] sharedInstance];
  v5 = [v4 formatAbbreviatedTimerDuration:v3];

  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    id v6 = @"\u200F%@%@";
  }
  else {
    id v6 = @"%@%@";
  }
  objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", v6, @" ", v5);

  return (NSString *)v7;
}

- (void)updateTimerLabel
{
  id v3 = [(CSTimerView *)self timerText];
  [(SBFLockScreenDateSubtitleView *)self setString:v3];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  v5 = (void *)MEMORY[0x1E4FA5F38];
  id v6 = a3;
  id v7 = [v5 rootSettings];

  if (v7 == v6)
  {
    [(CSTimerView *)self _updateLegibilityStrength];
  }
}

- (void)_updateLegibilityStrength
{
  id v3 = [(SBFLockScreenDateSubtitleView *)self legibilitySettings];
  uint64_t v4 = [v3 style];

  id v5 = [MEMORY[0x1E4FA5F38] rootSettings];
  [v5 timerTextStrengthForStyle:v4];
  -[SBFLockScreenDateSubtitleView setStrength:](self, "setStrength:");
}

- (id)_newTimerDialForSettings:(id)a3 withFont:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FA7960];
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)[[v5 alloc] initWithSymbolFont:v6];

  v9 = [MEMORY[0x1E4FA5F38] rootSettings];
  objc_msgSend(v9, "timerDialStrengthForStyle:", objc_msgSend(v7, "style"));
  objc_msgSend(v8, "setStrength:");

  [v8 setLegibilitySettings:v7];
  [v8 sizeToFit];
  return v8;
}

- (id)_timerFont
{
  double v2 = (void *)MEMORY[0x1E4F42A30];
  id v3 = [(SBFLockScreenDateSubtitleView *)self font];
  [v3 pointSize];
  uint64_t v4 = objc_msgSend(v2, "monospacedDigitSystemFontOfSize:weight:");

  return v4;
}

- (void).cxx_destruct
{
}

@end