@interface DTNetQualSettingsCell
- (DTNetQualSettingsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)_fillNetworkQualityCell;
- (void)_runNetworkQuality;
- (void)cancelNetworkQualityRun;
- (void)runNetworkQualityWithCompletionHandler:(id)a3;
@end

@implementation DTNetQualSettingsCell

- (DTNetQualSettingsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DTNetQualSettingsCell;
  v9 = [(DTNetQualSettingsCell *)&v16 initWithStyle:1 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->specifier, a5);
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"RESPONSIVENESS" value:&stru_35910 table:@"DTNetQualSettings"];
    v13 = [(DTNetQualSettingsCell *)v10 textLabel];
    [v13 setText:v12];

    [(DTNetQualSettingsCell *)v10 _fillNetworkQualityCell];
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v10 selector:"cancelNetworkQualityRun" name:@"com.apple.Preferences.DTNetQualViewWillDisappear" object:0];
  }
  return v10;
}

- (void)cancelNetworkQualityRun
{
  if (self->networkQualityAssessment)
  {
    self->networkQualitySpinning = 0;
    [(NetworkQualityAssessment *)self->networkQualityAssessment cancel];
    networkQualityAssessment = self->networkQualityAssessment;
    self->networkQualityAssessment = 0;
  }
}

- (void)runNetworkQualityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NetworkQualityAssessment);
  id v6 = objc_alloc_init((Class)NetworkQualityConfiguration);
  v7 = (NetworkQualityAssessment *)[v5 initWithConfiguration:v6];
  networkQualityAssessment = self->networkQualityAssessment;
  self->networkQualityAssessment = v7;

  v9 = self->networkQualityAssessment;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1B1C4;
  v11[3] = &unk_35218;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(NetworkQualityAssessment *)v9 runWithCompletionHandler:v11];
}

- (void)_runNetworkQuality
{
  if (!self->networkQualitySpinning)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[DTNetQualSettingsCell _runNetworkQuality]";
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "NetQuality: %s: User scheduled a run", buf, 0xCu);
    }
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"DATA_RATES_TITLE" value:&stru_35910 table:@"DTNetQualSettings"];

    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"DATA_RATES_TEXT" value:&stru_35910 table:@"DTNetQualSettings"];

    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"DATA_RATES_CONTINUE" value:&stru_35910 table:@"DTNetQualSettings"];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"DATA_RATES_CANCEL" value:&stru_35910 table:@"DTNetQualSettings"];

    v11 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];
    id v12 = +[UIAlertAction actionWithTitle:v10 style:1 handler:&stru_35258];
    [v11 addAction:v12];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1B794;
    v15[3] = &unk_35010;
    v15[4] = self;
    v13 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v15];
    [v11 addAction:v13];
    [v11 setPreferredAction:v13];
    v14 = [(PSSpecifier *)self->specifier target];
    [v14 presentViewController:v11 animated:1 completion:0];
  }
}

- (void)_fillNetworkQualityCell
{
  if (self->networkQualitySpinning)
  {
    id v16 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [(DTNetQualSettingsCell *)self setAccessoryView:v16];
    [v16 startAnimating];
    goto LABEL_15;
  }
  networkQualityResponsiveness = self->networkQualityResponsiveness;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (networkQualityResponsiveness)
  {
    id v6 = [v4 localizedStringForKey:@"LABEL_RPM" value:&stru_35910 table:@"DTNetQualSettings"];

    int64_t networkQualityResponsivenessRating = self->networkQualityResponsivenessRating;
    if (networkQualityResponsivenessRating == 2)
    {
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"LABEL_HIGH";
    }
    else if (networkQualityResponsivenessRating == 1)
    {
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"LABEL_MEDIUM";
    }
    else
    {
      if (networkQualityResponsivenessRating)
      {
        v11 = 0;
        goto LABEL_13;
      }
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      CFStringRef v10 = @"LABEL_LOW";
    }
    v11 = [v8 localizedStringForKey:v10 value:&stru_35910 table:@"DTNetQualSettings"];

LABEL_13:
    id v16 = +[NSString stringWithFormat:@"%@ (%u %@)", v11, [(NSNumber *)self->networkQualityResponsiveness unsignedIntValue], v6];

    goto LABEL_14;
  }
  id v16 = [v4 localizedStringForKey:@"LABEL_TEST" value:&stru_35910 table:@"DTNetQualSettings"];
  id v6 = v5;
LABEL_14:

  id v12 = +[UIButton buttonWithType:1];
  [v12 setTitle:v16 forState:0];
  [(DTNetQualSettingsCell *)self setAccessoryView:v12];
  v13 = [(DTNetQualSettingsCell *)self textLabel];
  v14 = [v13 font];
  v15 = [v12 titleLabel];
  [v15 setFont:v14];

  [v12 sizeToFit];
  [v12 addTarget:self action:"_runNetworkQuality" forControlEvents:64];

LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->networkQualityAssessment, 0);
  objc_storeStrong((id *)&self->networkQualityResponsiveness, 0);

  objc_storeStrong((id *)&self->specifier, 0);
}

@end