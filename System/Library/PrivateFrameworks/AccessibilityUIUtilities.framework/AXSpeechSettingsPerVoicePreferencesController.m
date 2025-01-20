@interface AXSpeechSettingsPerVoicePreferencesController
- (AXSettingsResourceDownloadController)parentController;
- (NSString)speechSourceKey;
- (NSString)voiceIdentifier;
- (TTSPerVoiceSettingsViewController)pvsettingViewController;
- (id)getVoiceSettings;
- (void)setParentController:(id)a3;
- (void)setPvsettingViewController:(id)a3;
- (void)setSpeechSourceKey:(id)a3;
- (void)setVoiceIdentifier:(id)a3;
- (void)viewDidLoad;
- (void)voiceSettingsDidChangeForVoice:(id)a3 settings:(id)a4;
@end

@implementation AXSpeechSettingsPerVoicePreferencesController

- (void)viewDidLoad
{
  v48[4] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)AXSpeechSettingsPerVoicePreferencesController;
  [(AXSpeechSettingsPerVoicePreferencesController *)&v42 viewDidLoad];
  v3 = [(AXSpeechSettingsPerVoicePreferencesController *)self parentController];
  v4 = [v3 view];
  v5 = [v4 backgroundColor];
  v6 = [(AXSpeechSettingsPerVoicePreferencesController *)self view];
  [v6 setBackgroundColor:v5];

  v7 = AXUILocalizedStringForKey(@"VOICE_SETTINGS");
  [(AXSpeechSettingsPerVoicePreferencesController *)self setTitle:v7];

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v8 = (void *)getTTSPerVoiceSettingsViewControllerClass_softClass;
  uint64_t v47 = getTTSPerVoiceSettingsViewControllerClass_softClass;
  if (!getTTSPerVoiceSettingsViewControllerClass_softClass)
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __getTTSPerVoiceSettingsViewControllerClass_block_invoke;
    v43[3] = &unk_1E649BF00;
    v43[4] = &v44;
    __getTTSPerVoiceSettingsViewControllerClass_block_invoke((uint64_t)v43);
    v8 = (void *)v45[3];
  }
  v9 = v8;
  _Block_object_dispose(&v44, 8);
  v10 = (TTSPerVoiceSettingsViewController *)objc_alloc_init(v9);
  pvsettingViewController = self->_pvsettingViewController;
  self->_pvsettingViewController = v10;

  v12 = [(AXSpeechSettingsPerVoicePreferencesController *)self speechSourceKey];
  [(TTSPerVoiceSettingsViewController *)self->_pvsettingViewController setSpeechSource:v12];

  [(TTSPerVoiceSettingsViewController *)self->_pvsettingViewController setDataDelegate:self];
  v13 = [(TTSPerVoiceSettingsViewController *)self->_pvsettingViewController view];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(AXSpeechSettingsPerVoicePreferencesController *)self view];
  v15 = [v14 backgroundColor];
  v16 = [(TTSPerVoiceSettingsViewController *)self->_pvsettingViewController view];
  [v16 setBackgroundColor:v15];

  v17 = [(AXSpeechSettingsPerVoicePreferencesController *)self view];
  v18 = [(TTSPerVoiceSettingsViewController *)self->_pvsettingViewController view];
  [v17 addSubview:v18];

  v27 = (void *)MEMORY[0x1E4F28DC8];
  v41 = [(TTSPerVoiceSettingsViewController *)self->_pvsettingViewController view];
  v39 = [v41 leadingAnchor];
  v40 = [(AXSpeechSettingsPerVoicePreferencesController *)self view];
  v38 = [v40 leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v48[0] = v37;
  v36 = [(TTSPerVoiceSettingsViewController *)self->_pvsettingViewController view];
  v33 = [v36 topAnchor];
  v35 = [(AXSpeechSettingsPerVoicePreferencesController *)self view];
  v34 = [v35 safeAreaLayoutGuide];
  v32 = [v34 topAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v48[1] = v31;
  v30 = [(TTSPerVoiceSettingsViewController *)self->_pvsettingViewController view];
  v28 = [v30 trailingAnchor];
  v29 = [(AXSpeechSettingsPerVoicePreferencesController *)self view];
  v19 = [v29 trailingAnchor];
  v20 = [v28 constraintEqualToAnchor:v19];
  v48[2] = v20;
  v21 = [(TTSPerVoiceSettingsViewController *)self->_pvsettingViewController view];
  v22 = [v21 bottomAnchor];
  v23 = [(AXSpeechSettingsPerVoicePreferencesController *)self view];
  v24 = [v23 bottomAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v48[3] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
  [v27 activateConstraints:v26];

  [(TTSPerVoiceSettingsViewController *)self->_pvsettingViewController didMoveToParentViewController:self];
}

- (id)getVoiceSettings
{
  v3 = [(AXSpeechSettingsPerVoicePreferencesController *)self parentController];
  v4 = [(AXSpeechSettingsPerVoicePreferencesController *)self voiceIdentifier];
  v5 = [v3 getVoiceSettingsForVoice:v4];

  return v5;
}

- (void)voiceSettingsDidChangeForVoice:(id)a3 settings:(id)a4
{
  id v5 = a4;
  id v7 = [(AXSpeechSettingsPerVoicePreferencesController *)self parentController];
  v6 = [(AXSpeechSettingsPerVoicePreferencesController *)self voiceIdentifier];
  [v7 voiceSettingsDidChangeForVoice:v6 settings:v5];
}

- (NSString)voiceIdentifier
{
  return self->_voiceIdentifier;
}

- (void)setVoiceIdentifier:(id)a3
{
}

- (AXSettingsResourceDownloadController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  return (AXSettingsResourceDownloadController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (NSString)speechSourceKey
{
  return self->_speechSourceKey;
}

- (void)setSpeechSourceKey:(id)a3
{
}

- (TTSPerVoiceSettingsViewController)pvsettingViewController
{
  return self->_pvsettingViewController;
}

- (void)setPvsettingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pvsettingViewController, 0);
  objc_storeStrong((id *)&self->_speechSourceKey, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_voiceIdentifier, 0);
}

@end