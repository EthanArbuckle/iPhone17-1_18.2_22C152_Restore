@interface PHVoicemailGreetingPlaybackCell
+ (double)rowHeight;
- (BOOL)accessibilityConstraintsEnabled;
- (BOOL)builtConstraints;
- (NSLayoutConstraint)playStopYConstraint;
- (NSLayoutConstraint)recordStopXConstraint;
- (NSLayoutConstraint)recordStopYConstraint;
- (PHVoicemailGreetingPlaybackCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PHVoicemailGreetingPlaybackCellDelegate)delegate;
- (UIButton)playStopButton;
- (UIButton)recordStopButton;
- (void)_buildConstraints;
- (void)_playStopButtonTapped:(id)a3;
- (void)_recordStopButtonTapped:(id)a3;
- (void)_updateConstraints;
- (void)_updateConstraintsConstants;
- (void)_updateFonts;
- (void)_updateRecordStopXConstraints;
- (void)_updateTextColor;
- (void)dealloc;
- (void)handleContentSizeCategoryDidChangeNotification:(id)a3;
- (void)setAccessibilityConstraintsEnabled:(BOOL)a3;
- (void)setBuiltConstraints:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPlayStopButton:(id)a3;
- (void)setPlayStopYConstraint:(id)a3;
- (void)setRecordStopButton:(id)a3;
- (void)setRecordStopXConstraint:(id)a3;
- (void)setRecordStopYConstraint:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation PHVoicemailGreetingPlaybackCell

- (PHVoicemailGreetingPlaybackCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)PHVoicemailGreetingPlaybackCell;
  v4 = [(PHVoicemailGreetingPlaybackCell *)&v31 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"handleContentSizeCategoryDidChangeNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];

    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    -[PHVoicemailGreetingPlaybackCell setSeparatorInset:](v4, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
    [(PHVoicemailGreetingPlaybackCell *)v4 setPreservesSuperviewLayoutMargins:0];
    -[PHVoicemailGreetingPlaybackCell setLayoutMargins:](v4, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
    v9 = [(PHVoicemailGreetingPlaybackCell *)v4 traitCollection];
    v4->_accessibilityConstraintsEnabled = [v9 isPreferredContentSizeCategoryAccessible];

    uint64_t v10 = +[UIButton buttonWithType:0];
    playStopButton = v4->_playStopButton;
    v4->_playStopButton = (UIButton *)v10;

    [(UIButton *)v4->_playStopButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4->_playStopButton setContentHorizontalAlignment:1];
    [(UIButton *)v4->_playStopButton addTarget:v4 action:"_playStopButtonTapped:" forControlEvents:64];
    LODWORD(v12) = 1148846080;
    [(UIButton *)v4->_playStopButton setContentHuggingPriority:1 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(UIButton *)v4->_playStopButton setContentCompressionResistancePriority:1 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(UIButton *)v4->_playStopButton setContentCompressionResistancePriority:0 forAxis:v14];
    LODWORD(v15) = -0.75;
    [(UIButton *)v4->_playStopButton setCharge:v15];
    [(UIButton *)v4->_playStopButton _setChargeEnabled:1];
    v16 = v4->_playStopButton;
    v17 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    v18 = [v17 localizedStringForKey:@"PLAY" value:&stru_100285990 table:@"Voicemail"];
    [(UIButton *)v16 setTitle:v18 forState:0];

    v19 = [(PHVoicemailGreetingPlaybackCell *)v4 contentView];
    [v19 addSubview:v4->_playStopButton];

    uint64_t v20 = +[UIButton buttonWithType:0];
    recordStopButton = v4->_recordStopButton;
    v4->_recordStopButton = (UIButton *)v20;

    [(UIButton *)v4->_recordStopButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4->_recordStopButton setContentHorizontalAlignment:2];
    [(UIButton *)v4->_recordStopButton addTarget:v4 action:"_recordStopButtonTapped:" forControlEvents:64];
    LODWORD(v22) = 1148846080;
    [(UIButton *)v4->_recordStopButton setContentHuggingPriority:1 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UIButton *)v4->_recordStopButton setContentCompressionResistancePriority:1 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(UIButton *)v4->_recordStopButton setContentCompressionResistancePriority:0 forAxis:v24];
    LODWORD(v25) = -0.75;
    [(UIButton *)v4->_recordStopButton setCharge:v25];
    [(UIButton *)v4->_recordStopButton _setChargeEnabled:1];
    v26 = v4->_recordStopButton;
    v27 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    v28 = [v27 localizedStringForKey:@"RECORD" value:&stru_100285990 table:@"Voicemail"];
    [(UIButton *)v26 setTitle:v28 forState:0];

    v29 = [(PHVoicemailGreetingPlaybackCell *)v4 contentView];
    [v29 addSubview:v4->_recordStopButton];

    [(PHVoicemailGreetingPlaybackCell *)v4 _updateTextColor];
    [(PHVoicemailGreetingPlaybackCell *)v4 _updateFonts];
    [(PHVoicemailGreetingPlaybackCell *)v4 _updateConstraints];
  }
  return v4;
}

- (void)dealloc
{
  [(PHVoicemailGreetingPlaybackCell *)self setDelegate:0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHVoicemailGreetingPlaybackCell;
  [(PHVoicemailGreetingPlaybackCell *)&v4 dealloc];
}

- (void)_buildConstraints
{
  if (![(PHVoicemailGreetingPlaybackCell *)self builtConstraints])
  {
    playStopButton = self->_playStopButton;
    objc_super v4 = [(PHVoicemailGreetingPlaybackCell *)self contentView];
    v5 = +[NSLayoutConstraint constraintWithItem:playStopButton attribute:10 relatedBy:0 toItem:v4 attribute:10 multiplier:1.0 constant:0.0];
    playStopYConstraint = self->_playStopYConstraint;
    self->_playStopYConstraint = v5;

    v7 = [(PHVoicemailGreetingPlaybackCell *)self contentView];
    [v7 addConstraint:self->_playStopYConstraint];

    v8 = [(PHVoicemailGreetingPlaybackCell *)self contentView];
    v9 = self->_playStopButton;
    uint64_t v10 = [(PHVoicemailGreetingPlaybackCell *)self contentView];
    v11 = +[NSLayoutConstraint constraintWithItem:v9 attribute:4 relatedBy:-1 toItem:v10 attribute:4 multiplier:1.0 constant:0.0];
    [v8 addConstraint:v11];

    double v12 = [(PHVoicemailGreetingPlaybackCell *)self contentView];
    double v13 = self->_playStopButton;
    double v14 = [(PHVoicemailGreetingPlaybackCell *)self contentView];
    double v15 = +[NSLayoutConstraint constraintWithItem:v13 attribute:1 relatedBy:0 toItem:v14 attribute:1 multiplier:1.0 constant:15.0];
    [v12 addConstraint:v15];

    recordStopButton = self->_recordStopButton;
    v17 = [(PHVoicemailGreetingPlaybackCell *)self contentView];
    v18 = +[NSLayoutConstraint constraintWithItem:recordStopButton attribute:10 relatedBy:0 toItem:v17 attribute:10 multiplier:1.0 constant:0.0];
    recordStopYConstraint = self->_recordStopYConstraint;
    self->_recordStopYConstraint = v18;

    uint64_t v20 = [(PHVoicemailGreetingPlaybackCell *)self contentView];
    [v20 addConstraint:self->_recordStopYConstraint];

    [(PHVoicemailGreetingPlaybackCell *)self _updateRecordStopXConstraints];
    [(PHVoicemailGreetingPlaybackCell *)self setBuiltConstraints:1];
  }
}

- (void)_updateRecordStopXConstraints
{
  if (self->_recordStopXConstraint)
  {
    v3 = [(PHVoicemailGreetingPlaybackCell *)self contentView];
    [v3 removeConstraint:self->_recordStopXConstraint];
  }
  unsigned int v4 = [(PHVoicemailGreetingPlaybackCell *)self accessibilityConstraintsEnabled];
  recordStopButton = self->_recordStopButton;
  if (v4)
  {
    v6 = +[NSLayoutConstraint constraintWithItem:self->_recordStopButton attribute:1 relatedBy:0 toItem:self->_playStopButton attribute:1 multiplier:1.0 constant:0.0];
    recordStopXConstraint = self->_recordStopXConstraint;
    self->_recordStopXConstraint = v6;
  }
  else
  {
    recordStopXConstraint = [(PHVoicemailGreetingPlaybackCell *)self contentView];
    v8 = +[NSLayoutConstraint constraintWithItem:recordStopButton attribute:2 relatedBy:0 toItem:recordStopXConstraint attribute:2 multiplier:1.0 constant:0.0];
    v9 = self->_recordStopXConstraint;
    self->_recordStopXConstraint = v8;
  }
  id v10 = [(PHVoicemailGreetingPlaybackCell *)self contentView];
  [v10 addConstraint:self->_recordStopXConstraint];
}

- (void)_updateConstraintsConstants
{
  unsigned int v3 = [(PHVoicemailGreetingPlaybackCell *)self accessibilityConstraintsEnabled];
  recordStopXConstraint = self->_recordStopXConstraint;
  if (v3)
  {
    [(NSLayoutConstraint *)recordStopXConstraint setConstant:0.0];
    [(id)objc_opt_class() rowHeight];
    [(NSLayoutConstraint *)self->_playStopYConstraint setConstant:v5 * -0.25];
    [(id)objc_opt_class() rowHeight];
    double v7 = v6 * 0.25;
  }
  else
  {
    [(NSLayoutConstraint *)recordStopXConstraint setConstant:-15.0];
    double v7 = 0.0;
    [(NSLayoutConstraint *)self->_playStopYConstraint setConstant:0.0];
  }
  recordStopYConstraint = self->_recordStopYConstraint;

  [(NSLayoutConstraint *)recordStopYConstraint setConstant:v7];
}

- (void)_updateConstraints
{
  if (![(PHVoicemailGreetingPlaybackCell *)self builtConstraints]) {
    [(PHVoicemailGreetingPlaybackCell *)self _buildConstraints];
  }
  [(PHVoicemailGreetingPlaybackCell *)self _updateConstraintsConstants];

  [(PHVoicemailGreetingPlaybackCell *)self setNeedsLayout];
}

- (void)_updateFonts
{
  unsigned int v3 = +[UIFont telephonyUIBodyShortFont];
  unsigned int v4 = [(UIButton *)self->_playStopButton titleLabel];
  [v4 setFont:v3];

  id v6 = +[UIFont telephonyUIBodyShortFont];
  double v5 = [(UIButton *)self->_recordStopButton titleLabel];
  [v5 setFont:v6];
}

- (void)_playStopButtonTapped:(id)a3
{
  id v3 = [(PHVoicemailGreetingPlaybackCell *)self delegate];
  [v3 playStopButtonTapped];
}

- (void)_recordStopButtonTapped:(id)a3
{
  id v3 = [(PHVoicemailGreetingPlaybackCell *)self delegate];
  [v3 recordStopButtonTapped];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PHVoicemailGreetingPlaybackCell;
  -[PHVoicemailGreetingPlaybackCell setUserInteractionEnabled:](&v5, "setUserInteractionEnabled:");
  [(UIButton *)self->_playStopButton setEnabled:v3];
  [(UIButton *)self->_recordStopButton setEnabled:v3];
}

+ (double)rowHeight
{
  v2 = +[UIScreen mainScreen];
  BOOL v3 = [v2 traitCollection];
  unsigned int v4 = [v3 isPreferredContentSizeCategoryAccessible];

  if (v4) {
    double v5 = 86.0;
  }
  else {
    double v5 = 43.0;
  }
  id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v6 _scaledValueForValue:v5];
  double v8 = v7;

  return v8;
}

- (void)handleContentSizeCategoryDidChangeNotification:(id)a3
{
  unsigned int v4 = [(PHVoicemailGreetingPlaybackCell *)self traitCollection];
  id v5 = [v4 isPreferredContentSizeCategoryAccessible];

  if (v5 != [(PHVoicemailGreetingPlaybackCell *)self accessibilityConstraintsEnabled])
  {
    [(PHVoicemailGreetingPlaybackCell *)self setAccessibilityConstraintsEnabled:v5];
    [(PHVoicemailGreetingPlaybackCell *)self _updateRecordStopXConstraints];
  }

  [(PHVoicemailGreetingPlaybackCell *)self _updateConstraints];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PHVoicemailGreetingPlaybackCell;
  [(PHVoicemailGreetingPlaybackCell *)&v3 tintColorDidChange];
  [(PHVoicemailGreetingPlaybackCell *)self _updateTextColor];
}

- (void)_updateTextColor
{
  playStopButton = self->_playStopButton;
  unsigned int v4 = [(PHVoicemailGreetingPlaybackCell *)self tintColor];
  id v5 = [(PHVoicemailGreetingPlaybackCell *)self _accessibilityHigherContrastTintColorForColor:v4];
  [(UIButton *)playStopButton setTitleColor:v5 forState:0];

  id v6 = self->_playStopButton;
  double v7 = +[UIColor systemGrayColor];
  double v8 = [(PHVoicemailGreetingPlaybackCell *)self _accessibilityHigherContrastTintColorForColor:v7];
  [(UIButton *)v6 setTitleColor:v8 forState:2];

  recordStopButton = self->_recordStopButton;
  id v10 = [(PHVoicemailGreetingPlaybackCell *)self tintColor];
  v11 = [(PHVoicemailGreetingPlaybackCell *)self _accessibilityHigherContrastTintColorForColor:v10];
  [(UIButton *)recordStopButton setTitleColor:v11 forState:0];

  double v12 = self->_recordStopButton;
  id v14 = +[UIColor systemGrayColor];
  double v13 = [(PHVoicemailGreetingPlaybackCell *)self _accessibilityHigherContrastTintColorForColor:v14];
  [(UIButton *)v12 setTitleColor:v13 forState:2];
}

- (UIButton)playStopButton
{
  return self->_playStopButton;
}

- (void)setPlayStopButton:(id)a3
{
}

- (UIButton)recordStopButton
{
  return self->_recordStopButton;
}

- (void)setRecordStopButton:(id)a3
{
}

- (PHVoicemailGreetingPlaybackCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHVoicemailGreetingPlaybackCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)accessibilityConstraintsEnabled
{
  return self->_accessibilityConstraintsEnabled;
}

- (void)setAccessibilityConstraintsEnabled:(BOOL)a3
{
  self->_accessibilityConstraintsEnabled = a3;
}

- (NSLayoutConstraint)playStopYConstraint
{
  return self->_playStopYConstraint;
}

- (void)setPlayStopYConstraint:(id)a3
{
}

- (NSLayoutConstraint)recordStopXConstraint
{
  return self->_recordStopXConstraint;
}

- (void)setRecordStopXConstraint:(id)a3
{
}

- (NSLayoutConstraint)recordStopYConstraint
{
  return self->_recordStopYConstraint;
}

- (void)setRecordStopYConstraint:(id)a3
{
}

- (BOOL)builtConstraints
{
  return self->_builtConstraints;
}

- (void)setBuiltConstraints:(BOOL)a3
{
  self->_builtConstraints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordStopYConstraint, 0);
  objc_storeStrong((id *)&self->_recordStopXConstraint, 0);
  objc_storeStrong((id *)&self->_playStopYConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordStopButton, 0);

  objc_storeStrong((id *)&self->_playStopButton, 0);
}

@end