@interface ACSettingsSliderUIController
+ (id)snippetViewController;
- (ACSettingsSliderUIController)init;
- (BOOL)_canShowWhileLocked;
- (BOOL)isTracking;
- (BOOL)removedAfterDialogProgresses;
- (Class)headerViewClass;
- (double)desiredHeightForWidth:(double)a3;
- (id)sashItem;
- (void)_sliderChanged:(id)a3;
- (void)_touchesEnded:(id)a3;
- (void)loadView;
- (void)setSnippet:(id)a3;
- (void)settingChangedExternally:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ACSettingsSliderUIController

+ (id)snippetViewController
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (ACSettingsSliderUIController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ACSettingsSliderUIController;
  id v2 = [(ACSettingsSliderUIController *)&v5 init];
  if (v2)
  {
    v3 = ACSettingsLocalizedString(@"SETTINGS_TITLE");
    [(ACSettingsSliderUIController *)v2 setTitle:v3];
  }
  return v2;
}

- (void)setSnippet:(id)a3
{
  p_snippet = &self->_snippet;
  objc_storeStrong((id *)&self->_snippet, a3);
  id v6 = a3;
  id v10 = [(SASettingFloatSnippet *)*p_snippet settingKeys];
  [(ACSettingsBasicSetting *)self->_setting setDelegate:0];
  v7 = [v10 objectAtIndex:0];
  v8 = +[ACSettingsBasicSetting settingWithAceString:v7];
  setting = self->_setting;
  self->_setting = v8;

  [(ACSettingsBasicSetting *)self->_setting setDelegate:self];
}

- (double)desiredHeightForWidth:(double)a3
{
  v4 = [(ACSettingsSliderUIController *)self view];
  objc_msgSend(v4, "sizeThatFits:", a3, 1.79769313e308);
  double v6 = v5;

  return v6;
}

- (void)loadView
{
  v3 = -[ACSettingsSliderView initWithFrame:]([ACSettingsSliderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  settingView = self->_settingView;
  self->_settingView = v3;

  [(ACSettingsSliderUIController *)self setView:self->_settingView];
  -[ACSettingsSliderUIController setDefaultViewInsets:](self, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  double v5 = [(ACSettingsSliderView *)self->_settingView slider];
  double v6 = [(ACSettingsSliderSetting *)self->_setting leftImage];
  v7 = +[UIColor siriui_glyphColor];
  v8 = [v6 _flatImageWithColor:v7];
  [v5 setMinimumValueImage:v8];

  v9 = [(ACSettingsSliderView *)self->_settingView slider];
  id v10 = [(ACSettingsSliderSetting *)self->_setting rightImage];
  v11 = +[UIColor siriui_glyphColor];
  v12 = [v10 _flatImageWithColor:v11];
  [v9 setMaximumValueImage:v12];

  v13 = [(ACSettingsSliderView *)self->_settingView slider];
  [v13 addTarget:self action:"_sliderChanged:" forControlEvents:4095];

  id v14 = [(ACSettingsSliderView *)self->_settingView slider];
  [v14 addTarget:self action:"_touchesEnded:" forControlEvents:192];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ACSettingsSliderUIController;
  [(ACSettingsSliderUIController *)&v14 viewWillAppear:a3];
  if (![(ACSettingsSliderUIController *)self isVirgin] || self->_viewHasAppeared) {
    goto LABEL_3;
  }
  if ([(SASettingFloatSnippet *)self->_snippet increment])
  {
    setting = self->_setting;
    v7 = [(SASettingFloatSnippet *)self->_snippet value];
    [v7 floatValue];
    [(ACSettingsSliderSetting *)setting addDelta:v8];
LABEL_9:

    v12 = [(ACSettingsSliderView *)self->_settingView slider];
    [(ACSettingsSliderSetting *)self->_setting value];
    *(float *)&double v13 = v13;
    [v12 setValue:0 animated:v13];

    goto LABEL_4;
  }
  v9 = [(SASettingFloatSnippet *)self->_snippet value];

  if (v9)
  {
    id v10 = self->_setting;
    v7 = [(SASettingFloatSnippet *)self->_snippet value];
    [v7 floatValue];
    [(ACSettingsSliderSetting *)v10 setValue:0 isTracking:v11];
    goto LABEL_9;
  }
LABEL_3:
  v4 = [(ACSettingsSliderView *)self->_settingView slider];
  [(ACSettingsSliderSetting *)self->_setting value];
  *(float *)&double v5 = v5;
  [v4 setValue:0 animated:v5];

LABEL_4:
  self->_viewHasAppeared = 1;
}

- (BOOL)removedAfterDialogProgresses
{
  return 1;
}

- (Class)headerViewClass
{
  return 0;
}

- (id)sashItem
{
  return [(ACSettingsBasicSetting *)self->_setting sashItem];
}

- (void)_sliderChanged:(id)a3
{
  setting = self->_setting;
  id v4 = a3;
  [v4 value];
  double v6 = v5;
  id v7 = [v4 isTracking];

  [(ACSettingsSliderSetting *)setting setValue:v7 isTracking:v6];
}

- (void)_touchesEnded:(id)a3
{
  setting = self->_setting;
  [a3 value];
  double v5 = v4;

  [(ACSettingsSliderSetting *)setting setValue:0 isTracking:v5];
}

- (void)settingChangedExternally:(id)a3
{
  if (self->_setting == a3)
  {
    float v4 = [(ACSettingsSliderView *)self->_settingView slider];
    unsigned __int8 v5 = [v4 isTracking];

    if ((v5 & 1) == 0)
    {
      id v7 = [(ACSettingsSliderView *)self->_settingView slider];
      [(ACSettingsSliderSetting *)self->_setting value];
      *(float *)&double v6 = v6;
      [v7 setValue:1 animated:v6];
    }
  }
}

- (BOOL)isTracking
{
  id v2 = [(ACSettingsSliderView *)self->_settingView slider];
  unsigned __int8 v3 = [v2 isTracking];

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingView, 0);
  objc_storeStrong((id *)&self->_setting, 0);

  objc_storeStrong((id *)&self->_snippet, 0);
}

@end