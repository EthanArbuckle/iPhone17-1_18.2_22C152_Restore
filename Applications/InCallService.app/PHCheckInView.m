@interface PHCheckInView
- (BOOL)pauseTimer;
- (NSTimer)checkInTimer;
- (PHCheckInView)initWithFrame:(CGRect)a3;
- (PHCheckInViewModel)checkInViewModel;
- (PHSlidingButton)sosCallSlidingButton;
- (SOSVoiceMessageManager)voiceMessageManager;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)distanceFromBottom;
- (double)distanceFromTop;
- (id)completion;
- (void)commonInit;
- (void)didFinishSlideForSlidingButton:(id)a3;
- (void)pause;
- (void)restart;
- (void)resume;
- (void)setCheckInTimer:(id)a3;
- (void)setCheckInViewModel:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setPauseTimer:(BOOL)a3;
- (void)setSosCallSlidingButton:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setVoiceMessageManager:(id)a3;
- (void)start:(id)a3 completion:(id)a4;
- (void)startCountdown;
- (void)stop;
- (void)stopAndNotifyResult:(unint64_t)a3;
- (void)stopCheckInTimer;
- (void)stopVoiceLoopMessagePlayback;
@end

@implementation PHCheckInView

- (PHCheckInView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHCheckInView;
  v3 = -[PHCheckInView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PHCheckInView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  id v3 = objc_alloc_init((Class)UILabel);
  [(PHCheckInView *)self setTitleLabel:v3];

  v4 = [(PHCheckInView *)self titleLabel];
  [v4 setTextAlignment:1];

  v5 = [(PHCheckInView *)self titleLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v6 = +[UIFont boldSystemFontOfSize:34.0];
  v7 = [(PHCheckInView *)self titleLabel];
  [v7 setFont:v6];

  v8 = +[UIColor whiteColor];
  v9 = [(PHCheckInView *)self titleLabel];
  [v9 setTextColor:v8];

  v10 = [(PHCheckInView *)self titleLabel];
  [v10 setNumberOfLines:0];

  v11 = [(PHCheckInView *)self titleLabel];
  [(PHCheckInView *)self addSubview:v11];

  id v12 = objc_alloc_init((Class)UILabel);
  [(PHCheckInView *)self setSubtitleLabel:v12];

  v13 = [(PHCheckInView *)self subtitleLabel];
  [v13 setTextAlignment:1];

  v14 = [(PHCheckInView *)self subtitleLabel];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = +[UIFont systemFontOfSize:22.0];
  v16 = [(PHCheckInView *)self subtitleLabel];
  [v16 setFont:v15];

  v17 = +[UIColor whiteColor];
  v18 = [(PHCheckInView *)self subtitleLabel];
  [v18 setTextColor:v17];

  v19 = [(PHCheckInView *)self subtitleLabel];
  [v19 setNumberOfLines:0];

  v20 = [(PHCheckInView *)self subtitleLabel];
  [(PHCheckInView *)self addSubview:v20];

  v21 = [[PHSlidingButton alloc] initWithSlidingButtonType:7 appearanceType:0 callState:2];
  [(PHCheckInView *)self setSosCallSlidingButton:v21];

  v22 = [(PHCheckInView *)self sosCallSlidingButton];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = [(PHCheckInView *)self sosCallSlidingButton];
  [v23 setDelegate:self];

  v24 = [(PHCheckInView *)self sosCallSlidingButton];
  [(PHCheckInView *)self addSubview:v24];

  [(PHCheckInView *)self setUpConstraints];
}

- (void)setUpConstraints
{
  id v46 = objc_alloc_init((Class)NSMutableArray);
  id v3 = [(PHCheckInView *)self titleLabel];
  v4 = [v3 leadingAnchor];
  v5 = [(PHCheckInView *)self leadingAnchor];
  objc_super v6 = [v4 constraintEqualToAnchor:v5];
  [v46 addObject:v6];

  v7 = [(PHCheckInView *)self titleLabel];
  v8 = [v7 trailingAnchor];
  v9 = [(PHCheckInView *)self trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v46 addObject:v10];

  v11 = [(PHCheckInView *)self titleLabel];
  id v12 = [v11 topAnchor];
  v13 = [(PHCheckInView *)self safeAreaLayoutGuide];
  v14 = [v13 topAnchor];
  [(PHCheckInView *)self distanceFromTop];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v46 addObject:v15];

  v16 = [(PHCheckInView *)self titleLabel];
  v17 = [v16 centerXAnchor];
  v18 = [(PHCheckInView *)self centerXAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v46 addObject:v19];

  v20 = [(PHCheckInView *)self subtitleLabel];
  v21 = [v20 leadingAnchor];
  v22 = [(PHCheckInView *)self leadingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  [v46 addObject:v23];

  v24 = [(PHCheckInView *)self subtitleLabel];
  v25 = [v24 trailingAnchor];
  v26 = [(PHCheckInView *)self trailingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v46 addObject:v27];

  v28 = [(PHCheckInView *)self subtitleLabel];
  v29 = [v28 topAnchor];
  v30 = [(PHCheckInView *)self titleLabel];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:22.0];
  [v46 addObject:v32];

  v33 = [(PHCheckInView *)self subtitleLabel];
  v34 = [v33 centerXAnchor];
  v35 = [(PHCheckInView *)self centerXAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v46 addObject:v36];

  v37 = [(PHCheckInView *)self sosCallSlidingButton];
  v38 = [v37 centerXAnchor];
  v39 = [(PHCheckInView *)self centerXAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v46 addObject:v40];

  v41 = [(PHCheckInView *)self sosCallSlidingButton];
  v42 = [v41 bottomAnchor];
  v43 = [(PHCheckInView *)self bottomAnchor];
  [(PHCheckInView *)self distanceFromBottom];
  v45 = [v42 constraintEqualToAnchor:v43 constant:-v44];
  [v46 addObject:v45];

  +[NSLayoutConstraint activateConstraints:v46];
}

- (double)distanceFromTop
{
  double v2 = 27.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing])
  {
    id v3 = +[UIScreen mainScreen];
    [v3 bounds];
    double v2 = v4 * 0.0599999987;
  }
  return v2;
}

- (double)distanceFromBottom
{
  double v2 = 30.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing])
  {
    id v3 = +[UIScreen mainScreen];
    [v3 bounds];
    double v2 = v4 * 0.0500000007;
  }
  return v2;
}

- (void)start:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PHCheckInView *)self setCheckInViewModel:v7];
  v8 = [v7 titleString];
  v9 = [(PHCheckInView *)self titleLabel];
  [v9 setText:v8];

  v10 = [v7 subtitleString];

  v11 = [(PHCheckInView *)self subtitleLabel];
  [v11 setText:v10];

  [(PHCheckInView *)self setCompletion:v6];

  [(PHCheckInView *)self startCountdown];
}

- (void)startCountdown
{
  [(PHCheckInView *)self stopCheckInTimer];
  [(PHCheckInView *)self stopVoiceLoopMessagePlayback];
  id v3 = [(PHCheckInView *)self checkInViewModel];
  id v4 = [v3 sosVoiceMessageType];

  if (v4
    && (+[SOSUtilities shouldSilenceSOSFlow] & 1) == 0)
  {
    id v5 = [objc_alloc((Class)SOSVoiceMessageManager) initWithMessageType:v4];
    [(PHCheckInView *)self setVoiceMessageManager:v5];

    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCheckInView,starting check-in voice message", buf, 2u);
    }

    id v7 = [(PHCheckInView *)self voiceMessageManager];
    [v7 startMessagePlayback];
  }
  v8 = [(PHCheckInView *)self checkInTimer];

  if (!v8)
  {
    objc_initWeak(&location, self);
    *(void *)buf = 0;
    v23 = buf;
    uint64_t v24 = 0x2020000000;
    unint64_t v25 = 0;
    v9 = [(PHCheckInView *)self checkInViewModel];
    [v9 timeout];
    unint64_t v11 = (unint64_t)v10;

    unint64_t v25 = v11;
    id v12 = [(PHCheckInView *)self checkInViewModel];
    [v12 countdownTickDuration];
    double v14 = v13;
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_1000486A4;
    v19 = &unk_1002CE300;
    objc_copyWeak(&v21, &location);
    v20 = buf;
    v15 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:&v16 block:v14];
    -[PHCheckInView setCheckInTimer:](self, "setCheckInTimer:", v15, v16, v17, v18, v19);

    objc_destroyWeak(&v21);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);
  }
}

- (void)pause
{
}

- (void)resume
{
}

- (void)restart
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHCheckInView,restarting countdown timer", v4, 2u);
  }

  [(PHCheckInView *)self setPauseTimer:0];
  [(PHCheckInView *)self startCountdown];
}

- (void)stopCheckInTimer
{
  id v3 = [(PHCheckInView *)self checkInTimer];
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating PHCheckInView timer", v7, 2u);
    }

    id v6 = [(PHCheckInView *)self checkInTimer];
    [v6 invalidate];

    [(PHCheckInView *)self setCheckInTimer:0];
  }
}

- (void)stopVoiceLoopMessagePlayback
{
  id v3 = [(PHCheckInView *)self voiceMessageManager];

  if (v3)
  {
    unsigned int v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHCheckInView,stopping check-in voice message", v6, 2u);
    }

    id v5 = [(PHCheckInView *)self voiceMessageManager];
    [v5 stopMessagePlayback];

    [(PHCheckInView *)self setVoiceMessageManager:0];
  }
}

- (void)stop
{
}

- (void)stopAndNotifyResult:(unint64_t)a3
{
  [(PHCheckInView *)self stopVoiceLoopMessagePlayback];
  [(PHCheckInView *)self stopCheckInTimer];
  id v5 = [(PHCheckInView *)self completion];

  if (v5)
  {
    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCheckInView,returning result,%d", (uint8_t *)v8, 8u);
    }

    id v7 = [(PHCheckInView *)self completion];
    v7[2](v7, a3);

    [(PHCheckInView *)self setCompletion:0];
  }
}

- (void)didFinishSlideForSlidingButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PHCheckInView *)self sosCallSlidingButton];

  if (v5 == v4)
  {
    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHCheckInView,user slid SOS slider", v7, 2u);
    }

    [(PHCheckInView *)self stopAndNotifyResult:1];
  }
}

- (PHCheckInViewModel)checkInViewModel
{
  return self->_checkInViewModel;
}

- (void)setCheckInViewModel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (PHSlidingButton)sosCallSlidingButton
{
  return self->_sosCallSlidingButton;
}

- (void)setSosCallSlidingButton:(id)a3
{
}

- (NSTimer)checkInTimer
{
  return self->_checkInTimer;
}

- (void)setCheckInTimer:(id)a3
{
}

- (BOOL)pauseTimer
{
  return self->_pauseTimer;
}

- (void)setPauseTimer:(BOOL)a3
{
  self->_pauseTimer = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (SOSVoiceMessageManager)voiceMessageManager
{
  return self->_voiceMessageManager;
}

- (void)setVoiceMessageManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceMessageManager, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_checkInTimer, 0);
  objc_storeStrong((id *)&self->_sosCallSlidingButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_checkInViewModel, 0);
}

@end