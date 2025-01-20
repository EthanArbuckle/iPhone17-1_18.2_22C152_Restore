@interface VTUISiriVoiceSelectionViewController
- (BOOL)holdBeforeDisplaying;
- (id)languageCode;
- (id)viewController;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)dealloc;
- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4;
@end

@implementation VTUISiriVoiceSelectionViewController

- (BOOL)holdBeforeDisplaying
{
  if (!self->_provider)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v3 = (void *)qword_CD68;
    uint64_t v19 = qword_CD68;
    if (!qword_CD68)
    {
      location[0] = _NSConcreteStackBlock;
      location[1] = (id)3221225472;
      location[2] = sub_4654;
      location[3] = &unk_8238;
      location[4] = &v16;
      sub_4654((uint64_t)location);
      v3 = (void *)v17[3];
    }
    v4 = v3;
    _Block_object_dispose(&v16, 8);
    v5 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init(v4);
    provider = self->_provider;
    self->_provider = v5;
  }
  v7 = [(VTUISiriVoiceSelectionViewController *)self languageCode];
  objc_initWeak(location, self);
  v8 = self->_provider;
  v20 = v7;
  v9 = +[NSArray arrayWithObjects:&v20 count:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_3F8C;
  v12[3] = &unk_82D8;
  objc_copyWeak(&v14, location);
  id v10 = v7;
  id v13 = v10;
  [(AFEnablementFlowConfigurationProvider *)v8 configurationForEnablementFlow:4 recognitionLanguageCodes:v9 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(location);

  return 1;
}

- (id)viewController
{
  voiceSelectionViewController = self->_voiceSelectionViewController;
  if (!voiceSelectionViewController)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"NEXT" value:&stru_8458 table:@"Localizable"];
    id v7 = [v4 initWithTitle:v6 style:0 target:0 action:0];

    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v8 = (void *)qword_CD78;
    uint64_t v20 = qword_CD78;
    if (!qword_CD78)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_481C;
      v16[3] = &unk_8238;
      v16[4] = &v17;
      sub_481C((uint64_t)v16);
      v8 = (void *)v18[3];
    }
    v9 = v8;
    _Block_object_dispose(&v17, 8);
    id v10 = [v9 alloc];
    v11 = [(VTUISiriVoiceSelectionViewController *)self languageCode];
    v12 = (VTUIVoiceSelectionViewController *)objc_msgSend(v10, "initWithRecognitionLanguage:allowsRandomSelection:barButtonItemForContinue:customVoicePreviewer:delegate:", v11, -[AFEnablementConfiguration voiceSelectionAllowsRandomSelection](self->_configuration, "voiceSelectionAllowsRandomSelection"), v7, 0, self);
    id v13 = self->_voiceSelectionViewController;
    self->_voiceSelectionViewController = v12;

    id v14 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController navigationItem];
    [v14 setRightBarButtonItem:v7];

    voiceSelectionViewController = self->_voiceSelectionViewController;
  }

  return voiceSelectionViewController;
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  VTUISetSiriEnabled(a3);
  id v4 = [(VTUISiriVoiceSelectionViewController *)self delegate];
  [v4 buddyControllerDone:self];
}

- (void)dealloc
{
  if (self->_configuration)
  {
    v3 = [sub_440C() sharedPreferences];
    id v4 = [v3 outputVoice];
    BOOL v5 = v4 != 0;

    v6 = [(AFEnablementConfiguration *)self->_configuration completionLoggingBlock];
    v6[2](v6, v5);
  }
  v7.receiver = self;
  v7.super_class = (Class)VTUISiriVoiceSelectionViewController;
  [(VTUISiriVoiceSelectionViewController *)&v7 dealloc];
}

- (id)languageCode
{
  v2 = [sub_440C() sharedPreferences];
  v3 = [v2 languageCode];

  if (!v3)
  {
    id v4 = [sub_440C() sharedPreferences];
    v3 = [v4 bestSupportedLanguageCodeForLanguageCode:0];
  }

  return v3;
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  id v5 = a4;
  v6 = [sub_440C() sharedPreferences];
  objc_super v7 = [(VTUISiriVoiceSelectionViewController *)self languageCode];
  [v6 setLanguageCode:v7 outputVoice:v5];

  [(VTUISiriVoiceSelectionViewController *)self applyConfirmedOptin:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSelectionViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

@end