@interface VMPlayerTimelineSlider
- (AVTimeFormatter)timeFormatter;
- (BOOL)labelsEnabled;
- (NSLayoutConstraint)elapsedTimeLabelBottomAnchorLayoutConstraint;
- (NSLayoutConstraint)elapsedTimeLabelFirstBaselineAnchorLayoutConstraint;
- (NSLayoutConstraint)elapsedTimeLabelLeadingAnchorLayoutConstraint;
- (NSLayoutConstraint)elapsedTimeLabelTrailingAnchorLayoutConstraint;
- (NSLayoutConstraint)remainingTimeLabelBottomAnchorLayoutConstraint;
- (NSLayoutConstraint)remainingTimeLabelFirstBaselineAnchorLayoutConstraint;
- (NSLayoutConstraint)remainingTimeLabelLeadingAnchorLayoutConstraint;
- (NSLayoutConstraint)remainingTimeLabelTrailingAnchorLayoutConstraint;
- (NSLayoutConstraint)sliderBottomAnchorLayoutConstraint;
- (NSLayoutConstraint)sliderLeadingAnchorLayoutConstraint;
- (NSLayoutConstraint)sliderTopAnchorLayoutConstraint;
- (NSLayoutConstraint)sliderTrailingAnchorLayoutConstraint;
- (UILabel)elapsedTimeLabel;
- (UILabel)remainingTimeLabel;
- (VMDetailSlider)slider;
- (VMPlayerTimelineSliderDelegate)delegate;
- (double)duration;
- (double)elapsedTime;
- (double)elapsedTimeLabelFirstBaselineAnchorLayoutConstraintConstant;
- (double)remainingTime;
- (double)remainingTimeLabelFirstBaselineAnchorLayoutConstraintConstant;
- (id)localizedStringForTimeInterval:(double)a3 timeFormatter:(id)a4;
- (void)_updateTextColor;
- (void)commonInit;
- (void)detailSlider:(id)a3 didChangeElapsedTime:(double)a4;
- (void)detailSliderTrackingDidBegin:(id)a3;
- (void)detailSliderTrackingDidCancel:(id)a3;
- (void)detailSliderTrackingDidEnd:(id)a3;
- (void)loadConstraints;
- (void)loadLabelConstraints;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTime:(double)a3 animated:(BOOL)a4;
- (void)setElapsedTimeLabelBottomAnchorLayoutConstraint:(id)a3;
- (void)setElapsedTimeLabelFirstBaselineAnchorLayoutConstraint:(id)a3;
- (void)setElapsedTimeLabelLeadingAnchorLayoutConstraint:(id)a3;
- (void)setElapsedTimeLabelTrailingAnchorLayoutConstraint:(id)a3;
- (void)setLabelsEnabled:(BOOL)a3;
- (void)setRemainingTimeLabelBottomAnchorLayoutConstraint:(id)a3;
- (void)setRemainingTimeLabelFirstBaselineAnchorLayoutConstraint:(id)a3;
- (void)setRemainingTimeLabelLeadingAnchorLayoutConstraint:(id)a3;
- (void)setRemainingTimeLabelTrailingAnchorLayoutConstraint:(id)a3;
- (void)setSliderBottomAnchorLayoutConstraint:(id)a3;
- (void)setSliderLeadingAnchorLayoutConstraint:(id)a3;
- (void)setSliderTopAnchorLayoutConstraint:(id)a3;
- (void)setSliderTrailingAnchorLayoutConstraint:(id)a3;
- (void)setTimeFormatter:(id)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
- (void)unloadConstraints;
- (void)updateConstraintsConstants;
- (void)updateElapsedTimeLabelText;
- (void)updateFonts;
- (void)updateRemainingTimeLabelText;
@end

@implementation VMPlayerTimelineSlider

- (double)duration
{
  v2 = [(VMPlayerTimelineSlider *)self slider];
  [v2 maximumTime];
  double v4 = v3;

  return v4;
}

- (void)setDuration:(double)a3
{
  v5 = [(VMPlayerTimelineSlider *)self slider];
  [v5 maximumTime];
  double v7 = v6;

  if (v7 != a3)
  {
    v8 = [(VMPlayerTimelineSlider *)self slider];
    [v8 setMaximumTime:a3];

    [(VMPlayerTimelineSlider *)self updateElapsedTimeLabelText];
    [(VMPlayerTimelineSlider *)self updateRemainingTimeLabelText];
  }
}

- (double)elapsedTime
{
  v2 = [(VMPlayerTimelineSlider *)self slider];
  [v2 elapsedTime];
  double v4 = v3;

  return v4;
}

- (void)setElapsedTime:(double)a3
{
  v5 = [(VMPlayerTimelineSlider *)self slider];
  [v5 setElapsedTime:a3];

  [(VMPlayerTimelineSlider *)self updateElapsedTimeLabelText];

  [(VMPlayerTimelineSlider *)self updateRemainingTimeLabelText];
}

- (void)setElapsedTime:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(VMPlayerTimelineSlider *)self slider];
  [v7 setElapsedTime:v4 animated:a3];

  [(VMPlayerTimelineSlider *)self updateElapsedTimeLabelText];

  [(VMPlayerTimelineSlider *)self updateRemainingTimeLabelText];
}

- (double)remainingTime
{
  double v3 = [(VMPlayerTimelineSlider *)self slider];
  [v3 maximumTime];
  double v5 = v4;
  double v6 = [(VMPlayerTimelineSlider *)self slider];
  [v6 elapsedTime];
  double v8 = v5 - v7;

  return v8;
}

- (void)setLabelsEnabled:(BOOL)a3
{
  if (self->_labelsEnabled != a3)
  {
    self->_BOOL labelsEnabled = a3;
    [(VMPlayerTimelineSlider *)self unloadConstraints];
    BOOL labelsEnabled = self->_labelsEnabled;
    double v5 = [(VMPlayerTimelineSlider *)self elapsedTimeLabel];
    double v6 = v5;
    if (labelsEnabled)
    {
      [(VMPlayerTimelineSlider *)self addSubview:v5];

      double v7 = [(VMPlayerTimelineSlider *)self remainingTimeLabel];
      [(VMPlayerTimelineSlider *)self addSubview:v7];
    }
    else
    {
      [v5 removeFromSuperview];

      double v7 = [(VMPlayerTimelineSlider *)self remainingTimeLabel];
      [v7 removeFromSuperview];
    }

    [(VMPlayerTimelineSlider *)self setNeedsUpdateConstraints];
  }
}

- (AVTimeFormatter)timeFormatter
{
  timeFormatter = self->_timeFormatter;
  if (!timeFormatter)
  {
    double v4 = (AVTimeFormatter *)objc_alloc_init((Class)AVTimeFormatter);
    double v5 = self->_timeFormatter;
    self->_timeFormatter = v4;

    timeFormatter = self->_timeFormatter;
  }

  return timeFormatter;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(VMPlayerTimelineSlider *)self slider];
  *(float *)&double v6 = a3;
  [v7 setValue:v4 animated:v6];
}

- (void)commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)VMPlayerTimelineSlider;
  [(VMPlayerTimelineSlider *)&v3 commonInit];
  self->_BOOL labelsEnabled = 1;
  [(VMPlayerTimelineSlider *)self loadView];
}

- (void)loadView
{
  [(VMPlayerTimelineSlider *)self setSemanticContentAttribute:1];
  objc_super v3 = objc_alloc_init(VMDetailSlider);
  slider = self->_slider;
  self->_slider = v3;

  [(VMDetailSlider *)self->_slider setDelegate:self];
  [(VMDetailSlider *)self->_slider setSemanticContentAttribute:1];
  [(VMDetailSlider *)self->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VMPlayerTimelineSlider *)self addSubview:self->_slider];
  double v5 = (UILabel *)objc_alloc_init((Class)UILabel);
  elapsedTimeLabel = self->_elapsedTimeLabel;
  self->_elapsedTimeLabel = v5;

  [(UILabel *)self->_elapsedTimeLabel setBackgroundColor:0];
  [(UILabel *)self->_elapsedTimeLabel setLineBreakMode:2];
  [(UILabel *)self->_elapsedTimeLabel setOpaque:0];
  id v7 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  double v8 = [v7 localizedStringForKey:@"UNKNOWN_DURATION" value:&stru_10008F308 table:@"Voicemail"];
  [(UILabel *)self->_elapsedTimeLabel setText:v8];

  [(UILabel *)self->_elapsedTimeLabel setTextAlignment:2];
  [(UILabel *)self->_elapsedTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VMPlayerTimelineSlider *)self addSubview:self->_elapsedTimeLabel];
  v9 = (UILabel *)objc_alloc_init((Class)UILabel);
  remainingTimeLabel = self->_remainingTimeLabel;
  self->_remainingTimeLabel = v9;

  [(UILabel *)self->_remainingTimeLabel setBackgroundColor:0];
  [(UILabel *)self->_remainingTimeLabel setLineBreakMode:2];
  [(UILabel *)self->_remainingTimeLabel setOpaque:0];
  v11 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v12 = [v11 localizedStringForKey:@"UNKNOWN_DURATION" value:&stru_10008F308 table:@"Voicemail"];
  [(UILabel *)self->_remainingTimeLabel setText:v12];

  [(UILabel *)self->_remainingTimeLabel setTextAlignment:0];
  [(UILabel *)self->_remainingTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VMPlayerTimelineSlider *)self addSubview:self->_remainingTimeLabel];

  [(VMPlayerTimelineSlider *)self _updateTextColor];
}

- (void)loadConstraints
{
  v23.receiver = self;
  v23.super_class = (Class)VMPlayerTimelineSlider;
  [(VMPlayerTimelineSlider *)&v23 loadConstraints];
  objc_super v3 = [(VMPlayerTimelineSlider *)self slider];
  BOOL v4 = [v3 leadingAnchor];
  double v5 = [(VMPlayerTimelineSlider *)self leadingAnchor];
  double v6 = [v4 constraintEqualToAnchor:v5];

  id v7 = NSStringFromSelector("sliderLeadingAnchorLayoutConstraint");
  [v6 setIdentifier:v7];

  [v6 setActive:1];
  [(VMPlayerTimelineSlider *)self setSliderLeadingAnchorLayoutConstraint:v6];
  double v8 = [(VMPlayerTimelineSlider *)self trailingAnchor];
  v9 = [(VMPlayerTimelineSlider *)self slider];
  v10 = [v9 trailingAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];

  v12 = NSStringFromSelector("sliderTrailingAnchorLayoutConstraint");
  [v11 setIdentifier:v12];

  [v11 setActive:1];
  [(VMPlayerTimelineSlider *)self setSliderTrailingAnchorLayoutConstraint:v11];
  v13 = [(VMPlayerTimelineSlider *)self slider];
  v14 = [v13 topAnchor];
  v15 = [(VMPlayerTimelineSlider *)self topAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];

  v17 = NSStringFromSelector("sliderTopAnchorLayoutConstraint");
  [v16 setIdentifier:v17];

  [v16 setActive:1];
  [(VMPlayerTimelineSlider *)self setSliderTopAnchorLayoutConstraint:v16];
  if ([(VMPlayerTimelineSlider *)self labelsEnabled])
  {
    [(VMPlayerTimelineSlider *)self loadLabelConstraints];
  }
  else
  {
    v18 = [(VMPlayerTimelineSlider *)self bottomAnchor];
    v19 = [(VMPlayerTimelineSlider *)self slider];
    v20 = [v19 bottomAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];

    v22 = NSStringFromSelector("sliderBottomAnchorLayoutConstraint");
    [v21 setIdentifier:v22];

    [v21 setActive:1];
    [(VMPlayerTimelineSlider *)self setSliderBottomAnchorLayoutConstraint:v21];
    v16 = v21;
  }
  if ([(VMPlayerTimelineSlider *)self isAccessiblityConstraintsEnabled])[(VMPlayerTimelineSlider *)self loadAccessibilityConstraints]; {
}
  }

- (void)loadLabelConstraints
{
  objc_super v3 = [(VMPlayerTimelineSlider *)self elapsedTimeLabel];
  BOOL v4 = [v3 leadingAnchor];
  double v5 = [(VMPlayerTimelineSlider *)self leadingAnchor];
  double v6 = [v4 constraintEqualToAnchor:v5];

  id v7 = NSStringFromSelector("elapsedTimeLabelLeadingAnchorLayoutConstraint");
  [v6 setIdentifier:v7];

  [v6 setActive:1];
  [(VMPlayerTimelineSlider *)self setElapsedTimeLabelLeadingAnchorLayoutConstraint:v6];
  double v8 = [(VMPlayerTimelineSlider *)self elapsedTimeLabel];
  v9 = [v8 firstBaselineAnchor];
  v10 = [(VMPlayerTimelineSlider *)self slider];
  v11 = [v10 lastBaselineAnchor];
  [(VMPlayerTimelineSlider *)self elapsedTimeLabelFirstBaselineAnchorLayoutConstraintConstant];
  v12 = [v9 constraintGreaterThanOrEqualToAnchor:v11];

  v13 = NSStringFromSelector("elapsedTimeLabelFirstBaselineAnchorLayoutConstraint");
  [v12 setIdentifier:v13];

  [v12 setActive:1];
  [(VMPlayerTimelineSlider *)self setElapsedTimeLabelFirstBaselineAnchorLayoutConstraint:v12];
  v14 = [(VMPlayerTimelineSlider *)self bottomAnchor];
  v15 = [(VMPlayerTimelineSlider *)self elapsedTimeLabel];
  v16 = [v15 bottomAnchor];
  v17 = [v14 constraintGreaterThanOrEqualToAnchor:v16];

  v18 = NSStringFromSelector("elapsedTimeLabelBottomAnchorLayoutConstraint");
  [v17 setIdentifier:v18];

  [v17 setActive:1];
  [(VMPlayerTimelineSlider *)self setElapsedTimeLabelBottomAnchorLayoutConstraint:v17];
  v19 = [(VMPlayerTimelineSlider *)self remainingTimeLabel];
  v20 = [v19 leadingAnchor];
  v21 = [(VMPlayerTimelineSlider *)self elapsedTimeLabel];
  v22 = [v21 trailingAnchor];
  objc_super v23 = [v20 constraintGreaterThanOrEqualToAnchor:v22];

  v24 = NSStringFromSelector("remainingTimeLabelLeadingAnchorLayoutConstraint");
  [v23 setIdentifier:v24];

  [v23 setActive:1];
  [(VMPlayerTimelineSlider *)self setRemainingTimeLabelLeadingAnchorLayoutConstraint:v23];
  v25 = [(VMPlayerTimelineSlider *)self trailingAnchor];
  v26 = [(VMPlayerTimelineSlider *)self remainingTimeLabel];
  v27 = [v26 trailingAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];

  v29 = NSStringFromSelector("remainingTimeLabelTrailingAnchorLayoutConstraint");
  [v28 setIdentifier:v29];

  [v28 setActive:1];
  [(VMPlayerTimelineSlider *)self setRemainingTimeLabelTrailingAnchorLayoutConstraint:v28];
  v30 = [(VMPlayerTimelineSlider *)self remainingTimeLabel];
  v31 = [v30 firstBaselineAnchor];
  v32 = [(VMPlayerTimelineSlider *)self slider];
  v33 = [v32 lastBaselineAnchor];
  [(VMPlayerTimelineSlider *)self remainingTimeLabelFirstBaselineAnchorLayoutConstraintConstant];
  v34 = [v31 constraintGreaterThanOrEqualToAnchor:v33];

  v35 = NSStringFromSelector("remainingTimeLabelFirstBaselineAnchorLayoutConstraint");
  [v34 setIdentifier:v35];

  [v34 setActive:1];
  [(VMPlayerTimelineSlider *)self setRemainingTimeLabelFirstBaselineAnchorLayoutConstraint:v34];
  v36 = [(VMPlayerTimelineSlider *)self bottomAnchor];
  v37 = [(VMPlayerTimelineSlider *)self remainingTimeLabel];
  v38 = [v37 bottomAnchor];
  v39 = [v36 constraintGreaterThanOrEqualToAnchor:v38];

  v40 = NSStringFromSelector("remainingTimeLabelBottomAnchorLayoutConstraint");
  [v39 setIdentifier:v40];

  [v39 setActive:1];
  [(VMPlayerTimelineSlider *)self setRemainingTimeLabelBottomAnchorLayoutConstraint:v39];
  v41 = [(VMPlayerTimelineSlider *)self remainingTimeLabel];
  v42 = [v41 firstBaselineAnchor];
  v43 = [(VMPlayerTimelineSlider *)self elapsedTimeLabel];
  v44 = [v43 firstBaselineAnchor];
  id v45 = [v42 constraintEqualToAnchor:v44];

  [v45 setActive:1];
}

- (void)unloadConstraints
{
  v15.receiver = self;
  v15.super_class = (Class)VMPlayerTimelineSlider;
  [(VMPlayerTimelineSlider *)&v15 unloadConstraints];
  objc_super v3 = [(VMPlayerTimelineSlider *)self sliderBottomAnchorLayoutConstraint];
  [v3 setActive:0];

  BOOL v4 = [(VMPlayerTimelineSlider *)self sliderLeadingAnchorLayoutConstraint];
  [v4 setActive:0];

  double v5 = [(VMPlayerTimelineSlider *)self sliderTopAnchorLayoutConstraint];
  [v5 setActive:0];

  double v6 = [(VMPlayerTimelineSlider *)self sliderTrailingAnchorLayoutConstraint];
  [v6 setActive:0];

  id v7 = [(VMPlayerTimelineSlider *)self elapsedTimeLabelBottomAnchorLayoutConstraint];
  [v7 setActive:0];

  double v8 = [(VMPlayerTimelineSlider *)self elapsedTimeLabelLeadingAnchorLayoutConstraint];
  [v8 setActive:0];

  v9 = [(VMPlayerTimelineSlider *)self elapsedTimeLabelFirstBaselineAnchorLayoutConstraint];
  [v9 setActive:0];

  v10 = [(VMPlayerTimelineSlider *)self elapsedTimeLabelTrailingAnchorLayoutConstraint];
  [v10 setActive:0];

  v11 = [(VMPlayerTimelineSlider *)self remainingTimeLabelBottomAnchorLayoutConstraint];
  [v11 setActive:0];

  v12 = [(VMPlayerTimelineSlider *)self remainingTimeLabelLeadingAnchorLayoutConstraint];
  [v12 setActive:0];

  v13 = [(VMPlayerTimelineSlider *)self remainingTimeLabelFirstBaselineAnchorLayoutConstraint];
  [v13 setActive:0];

  v14 = [(VMPlayerTimelineSlider *)self remainingTimeLabelTrailingAnchorLayoutConstraint];
  [v14 setActive:0];
}

- (void)updateConstraintsConstants
{
  v2.receiver = self;
  v2.super_class = (Class)VMPlayerTimelineSlider;
  [(VMPlayerTimelineSlider *)&v2 updateConstraintsConstants];
}

- (void)updateFonts
{
  v9.receiver = self;
  v9.super_class = (Class)VMPlayerTimelineSlider;
  [(VMPlayerTimelineSlider *)&v9 updateFonts];
  objc_super v3 = +[UIFont telephonyUIFootnoteShortFont];
  [v3 pointSize];
  BOOL v4 = +[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:");
  double v5 = [(VMPlayerTimelineSlider *)self elapsedTimeLabel];
  [v5 setFont:v4];

  double v6 = [(VMPlayerTimelineSlider *)self elapsedTimeLabel];
  id v7 = [v6 font];
  double v8 = [(VMPlayerTimelineSlider *)self remainingTimeLabel];
  [v8 setFont:v7];
}

- (id)localizedStringForTimeInterval:(double)a3 timeFormatter:(id)a4
{
  BOOL v4 = [a4 stringFromSeconds:a3];

  return v4;
}

- (void)updateElapsedTimeLabelText
{
  id v5 = [(VMPlayerTimelineSlider *)self timeFormatter];
  [v5 setStyle:1];
  [(VMPlayerTimelineSlider *)self elapsedTime];
  objc_super v3 = -[VMPlayerTimelineSlider localizedStringForTimeInterval:timeFormatter:](self, "localizedStringForTimeInterval:timeFormatter:", v5);
  BOOL v4 = [(VMPlayerTimelineSlider *)self elapsedTimeLabel];
  [v4 setText:v3];
}

- (void)updateRemainingTimeLabelText
{
  id v5 = [(VMPlayerTimelineSlider *)self timeFormatter];
  [v5 setStyle:2];
  [(VMPlayerTimelineSlider *)self remainingTime];
  objc_super v3 = -[VMPlayerTimelineSlider localizedStringForTimeInterval:timeFormatter:](self, "localizedStringForTimeInterval:timeFormatter:", v5);
  BOOL v4 = [(VMPlayerTimelineSlider *)self remainingTimeLabel];
  [v4 setText:v3];
}

- (void)detailSliderTrackingDidBegin:(id)a3
{
  BOOL v4 = [(VMPlayerTimelineSlider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VMPlayerTimelineSlider *)self delegate];
    [v6 playerTimelineSliderScrubbingDidBegin:self];
  }
}

- (void)detailSliderTrackingDidCancel:(id)a3
{
  BOOL v4 = [(VMPlayerTimelineSlider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VMPlayerTimelineSlider *)self delegate];
    [v6 playerTimelineSliderScrubbingDidCancel:self];
  }
}

- (void)detailSliderTrackingDidEnd:(id)a3
{
  BOOL v4 = [(VMPlayerTimelineSlider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VMPlayerTimelineSlider *)self delegate];
    [v6 playerTimelineSliderScrubbingDidEnd:self];
  }
}

- (void)detailSlider:(id)a3 didChangeElapsedTime:(double)a4
{
  id v6 = [(VMPlayerTimelineSlider *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(VMPlayerTimelineSlider *)self delegate];
    [v8 playerTimelineSlider:self didChangeElapsedTime:a4];
  }
}

- (double)elapsedTimeLabelFirstBaselineAnchorLayoutConstraintConstant
{
  objc_super v2 = +[UIFont telephonyUIFootnoteShortFont];
  objc_super v3 = [v2 fontDescriptor];
  BOOL v4 = [v3 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v4)
  {
    char v5 = +[UIFontMetrics metricsForTextStyle:v4];
    [v5 scaledValueForValue:16.0];
    double v7 = v6;
  }
  else
  {
    double v7 = 16.0;
  }

  return v7;
}

- (double)remainingTimeLabelFirstBaselineAnchorLayoutConstraintConstant
{
  objc_super v2 = +[UIFont telephonyUIFootnoteShortFont];
  objc_super v3 = [v2 fontDescriptor];
  BOOL v4 = [v3 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v4)
  {
    char v5 = +[UIFontMetrics metricsForTextStyle:v4];
    [v5 scaledValueForValue:16.0];
    double v7 = v6;
  }
  else
  {
    double v7 = 16.0;
  }

  return v7;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)VMPlayerTimelineSlider;
  [(VMPlayerTimelineSlider *)&v3 tintColorDidChange];
  [(VMPlayerTimelineSlider *)self _updateTextColor];
}

- (void)_updateTextColor
{
  objc_super v3 = +[UIColor dynamicSecondaryLabelColor];
  BOOL v4 = [(VMPlayerTimelineSlider *)self _accessibilityHigherContrastTintColorForColor:v3];
  [(UILabel *)self->_elapsedTimeLabel setTextColor:v4];

  id v6 = +[UIColor dynamicSecondaryLabelColor];
  char v5 = [(VMPlayerTimelineSlider *)self _accessibilityHigherContrastTintColorForColor:v6];
  [(UILabel *)self->_remainingTimeLabel setTextColor:v5];
}

- (VMPlayerTimelineSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VMPlayerTimelineSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)labelsEnabled
{
  return self->_labelsEnabled;
}

- (UILabel)elapsedTimeLabel
{
  return self->_elapsedTimeLabel;
}

- (UILabel)remainingTimeLabel
{
  return self->_remainingTimeLabel;
}

- (VMDetailSlider)slider
{
  return self->_slider;
}

- (void)setTimeFormatter:(id)a3
{
}

- (NSLayoutConstraint)sliderBottomAnchorLayoutConstraint
{
  return self->_sliderBottomAnchorLayoutConstraint;
}

- (void)setSliderBottomAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)sliderLeadingAnchorLayoutConstraint
{
  return self->_sliderLeadingAnchorLayoutConstraint;
}

- (void)setSliderLeadingAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)sliderTopAnchorLayoutConstraint
{
  return self->_sliderTopAnchorLayoutConstraint;
}

- (void)setSliderTopAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)sliderTrailingAnchorLayoutConstraint
{
  return self->_sliderTrailingAnchorLayoutConstraint;
}

- (void)setSliderTrailingAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)elapsedTimeLabelBottomAnchorLayoutConstraint
{
  return self->_elapsedTimeLabelBottomAnchorLayoutConstraint;
}

- (void)setElapsedTimeLabelBottomAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)elapsedTimeLabelLeadingAnchorLayoutConstraint
{
  return self->_elapsedTimeLabelLeadingAnchorLayoutConstraint;
}

- (void)setElapsedTimeLabelLeadingAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)elapsedTimeLabelFirstBaselineAnchorLayoutConstraint
{
  return self->_elapsedTimeLabelFirstBaselineAnchorLayoutConstraint;
}

- (void)setElapsedTimeLabelFirstBaselineAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)elapsedTimeLabelTrailingAnchorLayoutConstraint
{
  return self->_elapsedTimeLabelTrailingAnchorLayoutConstraint;
}

- (void)setElapsedTimeLabelTrailingAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)remainingTimeLabelBottomAnchorLayoutConstraint
{
  return self->_remainingTimeLabelBottomAnchorLayoutConstraint;
}

- (void)setRemainingTimeLabelBottomAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)remainingTimeLabelLeadingAnchorLayoutConstraint
{
  return self->_remainingTimeLabelLeadingAnchorLayoutConstraint;
}

- (void)setRemainingTimeLabelLeadingAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)remainingTimeLabelFirstBaselineAnchorLayoutConstraint
{
  return self->_remainingTimeLabelFirstBaselineAnchorLayoutConstraint;
}

- (void)setRemainingTimeLabelFirstBaselineAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)remainingTimeLabelTrailingAnchorLayoutConstraint
{
  return self->_remainingTimeLabelTrailingAnchorLayoutConstraint;
}

- (void)setRemainingTimeLabelTrailingAnchorLayoutConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingTimeLabelTrailingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabelFirstBaselineAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabelLeadingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabelBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabelTrailingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabelFirstBaselineAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabelLeadingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabelBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_sliderTrailingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_sliderTopAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_sliderLeadingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_sliderBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabel, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end