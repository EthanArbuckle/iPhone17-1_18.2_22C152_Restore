@interface PHAudioCallVoiceLoopView
- (PHAudioCallVoiceLoopView)initWithFrame:(CGRect)a3;
- (PHAudioCallVoiceLoopViewDelegate)delegate;
- (UIButton)stopVoiceLoopButton;
- (UILabel)descriptionText;
- (void)commonInit;
- (void)setDelegate:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setStopVoiceLoopButton:(id)a3;
- (void)stopVoiceLoopButtonPressed;
@end

@implementation PHAudioCallVoiceLoopView

- (PHAudioCallVoiceLoopView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHAudioCallVoiceLoopView;
  v3 = -[PHAudioCallVoiceLoopView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PHAudioCallVoiceLoopView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = +[UIColor clearColor];
  [(PHAudioCallVoiceLoopView *)self setBackgroundColor:v3];

  unsigned int v4 = +[SOSUtilities isKappaUnmasked];
  v5 = +[NSBundle mainBundle];
  objc_super v6 = v5;
  if (v4)
  {
    v57 = [v5 localizedStringForKey:@"SOS_KAPPA_VOICE_LOOP_VIEW_DESCRIPTION" value:&stru_1002D6110 table:@"Localizable-kappa"];

    v7 = +[NSBundle mainBundle];
    [v7 localizedStringForKey:@"SOS_KAPPA_VOICE_LOOP_VIEW_BUTTON_LABEL" value:&stru_1002D6110 table:@"Localizable-kappa"];
  }
  else
  {
    v57 = [v5 localizedStringForKey:@"SOS_KAPPA_MASKED_VOICE_LOOP_VIEW_DESCRIPTION" value:&stru_1002D6110 table:@"Localizable-kappa"];

    v7 = +[NSBundle mainBundle];
    [v7 localizedStringForKey:@"SOS_KAPPA_MASKED_VOICE_LOOP_VIEW_BUTTON_LABEL" value:&stru_1002D6110 table:@"Localizable-kappa"];
  v59 = };

  v64[0] = NSFontAttributeName;
  v8 = +[UIFont systemFontOfSize:20.0 weight:UIFontWeightSemibold];
  v65[0] = v8;
  v64[1] = NSForegroundColorAttributeName;
  v9 = +[UIColor systemRedColor];
  v65[1] = v9;
  v58 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];

  id v56 = [objc_alloc((Class)NSAttributedString) initWithString:v59 attributes:v58];
  id v10 = objc_alloc_init((Class)UILabel);
  [(PHAudioCallVoiceLoopView *)self setDescriptionText:v10];

  v11 = [(PHAudioCallVoiceLoopView *)self descriptionText];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(PHAudioCallVoiceLoopView *)self descriptionText];
  [v12 setText:v57];

  v13 = +[UIFont boldSystemFontOfSize:34.0];
  v14 = [(PHAudioCallVoiceLoopView *)self descriptionText];
  [v14 setFont:v13];

  v15 = [(PHAudioCallVoiceLoopView *)self descriptionText];
  [v15 setTextAlignment:1];

  v16 = +[UIColor whiteColor];
  v17 = [(PHAudioCallVoiceLoopView *)self descriptionText];
  [v17 setTextColor:v16];

  v18 = [(PHAudioCallVoiceLoopView *)self descriptionText];
  [v18 setNumberOfLines:0];

  v19 = [(PHAudioCallVoiceLoopView *)self descriptionText];
  [(PHAudioCallVoiceLoopView *)self addSubview:v19];

  objc_initWeak(&location, self);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100112580;
  v60[3] = &unk_1002CE218;
  objc_copyWeak(&v61, &location);
  v38 = +[UIAction actionWithTitle:v59 image:0 identifier:0 handler:v60];
  v20 = +[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 0);
  [(PHAudioCallVoiceLoopView *)self setStopVoiceLoopButton:v20];

  v21 = [(PHAudioCallVoiceLoopView *)self stopVoiceLoopButton];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [(PHAudioCallVoiceLoopView *)self stopVoiceLoopButton];
  v23 = [v22 layer];
  [v23 setCornerRadius:36.0];

  v24 = +[UIColor whiteColor];
  v25 = [(PHAudioCallVoiceLoopView *)self stopVoiceLoopButton];
  [v25 setBackgroundColor:v24];

  v26 = [(PHAudioCallVoiceLoopView *)self stopVoiceLoopButton];
  [v26 setAttributedTitle:v56 forState:0];

  v27 = [(PHAudioCallVoiceLoopView *)self stopVoiceLoopButton];
  [(PHAudioCallVoiceLoopView *)self addSubview:v27];

  v55 = [(PHAudioCallVoiceLoopView *)self descriptionText];
  v54 = [v55 leadingAnchor];
  v53 = [(PHAudioCallVoiceLoopView *)self leadingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53 constant:30.0];
  v63[0] = v52;
  v51 = [(PHAudioCallVoiceLoopView *)self descriptionText];
  v50 = [v51 trailingAnchor];
  v49 = [(PHAudioCallVoiceLoopView *)self trailingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:-30.0];
  v63[1] = v48;
  v47 = [(PHAudioCallVoiceLoopView *)self descriptionText];
  v46 = [v47 bottomAnchor];
  v45 = [(PHAudioCallVoiceLoopView *)self centerYAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:-11.0];
  v63[2] = v44;
  v43 = [(PHAudioCallVoiceLoopView *)self stopVoiceLoopButton];
  v42 = [v43 widthAnchor];
  v41 = [v42 constraintEqualToConstant:300.0];
  v63[3] = v41;
  v40 = [(PHAudioCallVoiceLoopView *)self stopVoiceLoopButton];
  v39 = [v40 heightAnchor];
  v28 = [v39 constraintEqualToConstant:72.0];
  v63[4] = v28;
  v29 = [(PHAudioCallVoiceLoopView *)self stopVoiceLoopButton];
  v30 = [v29 centerXAnchor];
  v31 = [(PHAudioCallVoiceLoopView *)self centerXAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v63[5] = v32;
  v33 = [(PHAudioCallVoiceLoopView *)self stopVoiceLoopButton];
  v34 = [v33 topAnchor];
  v35 = [(PHAudioCallVoiceLoopView *)self centerYAnchor];
  v36 = [v34 constraintEqualToAnchor:v35 constant:11.0];
  v63[6] = v36;
  v37 = +[NSArray arrayWithObjects:v63 count:7];
  +[NSLayoutConstraint activateConstraints:v37];

  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);
}

- (void)stopVoiceLoopButtonPressed
{
  uint64_t v3 = [(PHAudioCallVoiceLoopView *)self delegate];
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    v5 = [(PHAudioCallVoiceLoopView *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(PHAudioCallVoiceLoopView *)self delegate];
      [v7 stopVoiceLoopButtonPressed];
    }
  }
}

- (PHAudioCallVoiceLoopViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAudioCallVoiceLoopViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (UIButton)stopVoiceLoopButton
{
  return self->_stopVoiceLoopButton;
}

- (void)setStopVoiceLoopButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopVoiceLoopButton, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end