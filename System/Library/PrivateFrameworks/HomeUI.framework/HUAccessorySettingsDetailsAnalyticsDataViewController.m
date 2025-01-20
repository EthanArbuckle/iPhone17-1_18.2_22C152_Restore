@interface HUAccessorySettingsDetailsAnalyticsDataViewController
- (HUAccessorySettingsDetailsAnalyticsDataViewController)initWithAccessoryGroupItem:(id)a3;
- (id)hu_preloadContent;
- (void)viewDidLoad;
@end

@implementation HUAccessorySettingsDetailsAnalyticsDataViewController

- (HUAccessorySettingsDetailsAnalyticsDataViewController)initWithAccessoryGroupItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUAccessorySettingsDetailsAnalyticsDataViewController;
  return [(HUAccessorySettingsDetailsAnalyticsDataViewController *)&v4 init];
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)HUAccessorySettingsDetailsAnalyticsDataViewController;
  [(HUAccessorySettingsDetailsAnalyticsDataViewController *)&v21 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] systemBlackColor];
  objc_super v4 = [(HUAccessorySettingsDetailsAnalyticsDataViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = objc_opt_new();
  [v5 setText:@"👷UNDER CONSTRUCTION👷\nENGINEERING UI"];
  [v5 setNumberOfLines:2];
  [v5 setTextAlignment:1];
  v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v5 setBackgroundColor:v6];

  v7 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v5 setTextColor:v7];

  [v5 sizeToFit];
  v8 = [(HUAccessorySettingsDetailsAnalyticsDataViewController *)self view];
  [v8 addSubview:v5];

  [v5 frame];
  double v10 = v9;
  double v12 = v11;
  v13 = [(HUAccessorySettingsDetailsAnalyticsDataViewController *)self view];
  [v13 frame];
  float v15 = v14 * 0.5 - v10 * 0.5;
  double v16 = ceilf(v15);

  v17 = [(HUAccessorySettingsDetailsAnalyticsDataViewController *)self view];
  [v17 frame];
  float v19 = v18 * 0.5 - v12 * 0.5;
  double v20 = ceilf(v19);

  objc_msgSend(v5, "setFrame:", v16, v20, v10, v12);
}

@end