@interface AXPronunciationEntryViewController
- (BOOL)_save;
- (BOOL)_stopRecording;
- (BOOL)_supportsPronunciationDictation;
- (BOOL)_usingSupportedDictationLanguage;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (TTSSpeechAction)lastAction;
- (TTSSpeechManager)speechManager;
- (TTSSubstitution)userSubstitution;
- (float)nextAudioLevel;
- (id)_appliesTo:(id)a3;
- (id)_assetUpdaterClient;
- (id)_ignoresCase:(id)a3;
- (id)_language;
- (id)_originalString:(id)a3;
- (id)_replacementString:(id)a3;
- (id)_selectedVoice:(id)a3;
- (id)appSpecifiers;
- (id)specifiers;
- (id)voicesSpecifier;
- (void)_calculateAndUpdateDictationStatus;
- (void)_calculateAndUpdateDictationStatus:(id)a3;
- (void)_dictateButtonTapped:(id)a3;
- (void)_handleViewHiddenStatus;
- (void)_hideAppCombinations;
- (void)_manageVoicesSelector;
- (void)_popSuggestionsController:(id)a3;
- (void)_setAppliesTo:(id)a3 specifier:(id)a4;
- (void)_setIgnoresCase:(id)a3 specifier:(id)a4;
- (void)_setOriginalString:(id)a3 specifier:(id)a4;
- (void)_setReplacementString:(id)a3 specifier:(id)a4;
- (void)_showAppCombinationsAnimated:(BOOL)a3;
- (void)_substitutionVoiceId:(id *)a3 andLanguage:(id *)a4;
- (void)_updateDictationViewWithStatus:(int64_t)a3 withCell:(id)a4;
- (void)_updatePlayButtonTraits;
- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5;
- (void)assistantConnection:(id)a3 requestFailedWithError:(id)a4 requestClass:(id)a5;
- (void)dealloc;
- (void)doneButtonPressed;
- (void)editingChanged:(id)a3;
- (void)handlePlayButton:(id)a3;
- (void)manipulateDictationView:(int64_t)a3;
- (void)pronunciationLanguageListController:(id)a3 didSelectLanguages:(id)a4;
- (void)pronunciationSuggestionsViewController:(id)a3 didSelectPhonemes:(id)a4;
- (void)pronunciationVoiceListController:(id)a3 didSelectVoices:(id)a4;
- (void)setLastAction:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setUserSubstitution:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation AXPronunciationEntryViewController

- (void)viewDidLoad
{
  if (viewDidLoad_onceToken != -1) {
    dispatch_once(&viewDidLoad_onceToken, &__block_literal_global_13);
  }
  v20.receiver = self;
  v20.super_class = (Class)AXPronunciationEntryViewController;
  [(AXPronunciationEntryViewController *)&v20 viewDidLoad];
  v3 = (AXSpeechPronunciationHelper *)objc_alloc_init((Class)AXSpeechPronunciationHelper);
  pronunciationHelper = self->_pronunciationHelper;
  self->_pronunciationHelper = v3;

  id v5 = objc_alloc_init((Class)TTSSpeechManager);
  [(AXPronunciationEntryViewController *)self setSpeechManager:v5];

  v6 = [(AXPronunciationEntryViewController *)self speechManager];
  [v6 setUsesAuxiliarySession:1];

  id v7 = objc_alloc((Class)UIBarButtonItem);
  v8 = settingsLocString(@"PLAY", @"Accessibility");
  id v9 = [v7 initWithTitle:v8 style:2 target:self action:"handlePlayButton:"];

  v10 = [(AXPronunciationEntryViewController *)self navigationItem];
  [v10 setRightBarButtonItem:v9];

  v11 = [(AXPronunciationEntryViewController *)self navigationItem];
  v12 = [v11 rightBarButtonItem];
  [v12 setEnabled:0];

  v13 = [(AXPronunciationEntryViewController *)self specifier];
  id v14 = [v13 propertyForKey:@"AXVocabularyListItem"];

  if (v14)
  {
    [(AXPronunciationEntryViewController *)self setUserSubstitution:v14];
    v15 = [(AXPronunciationEntryViewController *)self navigationItem];
    v16 = [v15 rightBarButtonItem];
    [v16 setEnabled:1];
  }
  else
  {
    id v14 = objc_alloc_init((Class)TTSSubstitution);
    v17 = +[AXLanguageManager sharedInstance];
    v18 = [v17 dialectForUserLocale];
    v15 = [v18 specificLanguageID];

    if (v15)
    {
      v19 = +[NSSet setWithObject:v15];
      [v14 setLanguages:v19];
    }
    [(AXPronunciationEntryViewController *)self setUserSubstitution:v14];
  }

  [(AXPronunciationEntryViewController *)self _updatePlayButtonTraits];
}

void __49__AXPronunciationEntryViewController_viewDidLoad__block_invoke(id a1)
{
  id v1 = +[AXValidationManager sharedInstance];
  [v1 performValidations:&__block_literal_global_322 withPreValidationHandler:&__block_literal_global_335 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_338];
}

BOOL __49__AXPronunciationEntryViewController_viewDidLoad__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 validateClass:@"UIDictationLayoutView" hasInstanceVariable:@"_endpointButton" withType:"UIButton"];
  [(AXValidationManager *)v2 validateClass:@"UIDictationLayoutView" hasInstanceVariable:@"_endpointButtonLandscape" withType:"UIButton"];
  [(AXValidationManager *)v2 validateClass:@"UIDictationLayoutView", @"finishReturnToKeyboard", "@", 0 hasInstanceMethod withFullSignature];

  return 1;
}

BOOL __49__AXPronunciationEntryViewController_viewDidLoad__block_invoke_3(id a1, AXValidationManager *a2)
{
  return 0;
}

void __49__AXPronunciationEntryViewController_viewDidLoad__block_invoke_4(id a1, AXValidationManager *a2)
{
}

- (float)nextAudioLevel
{
  [(AXSpeechPronunciationHelper *)self->_pronunciationHelper audioLevel];
  return result;
}

- (void)doneButtonPressed
{
}

- (void)_updatePlayButtonTraits
{
  v3 = [(AXPronunciationEntryViewController *)self navigationItem];
  v4 = [v3 rightBarButtonItem];
  unsigned int v5 = [v4 isEnabled];

  UIAccessibilityTraits v6 = UIAccessibilityTraitNotEnabled;
  if (v5) {
    UIAccessibilityTraits v6 = 0;
  }
  UIAccessibilityTraits v7 = UIAccessibilityTraitStartsMediaSession | UIAccessibilityTraitButton | v6;
  id v9 = [(AXPronunciationEntryViewController *)self navigationItem];
  v8 = [v9 rightBarButtonItem];
  [v8 setAccessibilityTraits:v7];
}

- (void)_substitutionVoiceId:(id *)a3 andLanguage:(id *)a4
{
  UIAccessibilityTraits v7 = [(AXPronunciationEntryViewController *)self userSubstitution];
  v8 = [v7 voiceIds];
  id v9 = (char *)[v8 count];

  v10 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v24 = v10;
  if (v9 == (unsigned char *)&dword_0 + 1)
  {
    v11 = [v10 voiceIds];
    *a3 = [v11 anyObject];
  }
  else
  {
    v12 = [v10 languages];
    v13 = [v12 anyObject];

    if (v13
      || (+[AVSpeechSynthesisVoice currentLanguageCode],
          v13 = objc_claimAutoreleasedReturnValue(),
          !UIAccessibilityIsVoiceOverRunning()))
    {
      id v14 = v13;
      v13 = v14;
    }
    else
    {
      AXLanguageCanonicalFormToGeneralLanguage();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a4 = v14;
    char v25 = 0;
    BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
    v16 = (id *)&AXSpeechSourceKeyVoiceOver;
    if (!IsVoiceOverRunning) {
      v16 = (id *)&AXSpeechSourceKeySpeechFeatures;
    }
    id v17 = *v16;
    v18 = +[AXSettings sharedInstance];
    v19 = [v18 speechVoiceIdentifierForLanguage:*a4 sourceKey:v17 exists:&v25];

    if (v25) {
      goto LABEL_16;
    }
    if (UIAccessibilityIsVoiceOverRunning())
    {
      id v20 = v13;
    }
    else
    {
      AXLanguageCanonicalFormToGeneralLanguage();
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;
    v22 = +[AXSettings sharedInstance];
    id v23 = [v22 speechVoiceIdentifierForLanguage:v21 sourceKey:v17 exists:&v25];

    v19 = v23;
    if (v25)
    {
LABEL_16:
      id v23 = v19;
      *a3 = v23;
    }
  }
}

- (void)handlePlayButton:(id)a3
{
  v4 = +[AVAudioSession sharedInstance];
  [v4 setCategory:AVAudioSessionCategoryVoiceOver withOptions:2 error:0];

  unsigned int v5 = +[AVAudioSession sharedInstance];
  [v5 setActive:1 error:0];

  id v6 = objc_alloc_init((Class)TTSSpeechAction);
  [v6 setShouldQueue:0];
  id v24 = 0;
  id v25 = 0;
  [(AXPronunciationEntryViewController *)self _substitutionVoiceId:&v25 andLanguage:&v24];
  id v7 = v25;
  id v8 = v24;
  [v6 setVoiceIdentifier:v7];
  [v6 setLanguage:v8];
  [v6 setIgnoreCustomSubstitutions:1];
  id v9 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"InputCell"];
  v10 = [v9 editableTextField];
  v11 = [v10 text];
  [v6 setString:v11];

  v12 = [v6 string];
  id v13 = [v12 length];

  if (v13)
  {
    id v14 = [(AXPronunciationEntryViewController *)self userSubstitution];
    v15 = [v14 phonemes];

    if (v15)
    {
      v26 = AVSpeechSynthesisIPANotationAttribute;
      v16 = [(AXPronunciationEntryViewController *)self userSubstitution];
      id v17 = [v16 phonemes];
      v27 = v17;
      v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    }
    else
    {
      v18 = 0;
    }
    id v21 = objc_alloc((Class)NSAttributedString);
    v22 = [v6 string];
    id v19 = [v21 initWithString:v22 attributes:v18];

    [v6 setAttributedString:v19];
  }
  else
  {
    v18 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"OriginalString"];
    id v19 = [v18 editableTextField];
    id v20 = [v19 text];
    [v6 setString:v20];
  }
  id v23 = [(AXPronunciationEntryViewController *)self speechManager];
  [v23 dispatchSpeechAction:v6];

  [(AXPronunciationEntryViewController *)self setLastAction:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXPronunciationEntryViewController;
  [(AXPronunciationEntryViewController *)&v7 viewWillAppear:a3];
  v4 = [(AXPronunciationEntryViewController *)self userSubstitution];
  unsigned __int8 v5 = [v4 appliesToAllApps];

  if ((v5 & 1) == 0) {
    [(AXPronunciationEntryViewController *)self _showAppCombinationsAnimated:0];
  }
  id v6 = settingsLocString(@"EDIT_PRONUNCIATION", @"VoiceOverSettings");
  [(AXPronunciationEntryViewController *)self setTitle:v6];

  [(AXPronunciationEntryViewController *)self _manageVoicesSelector];
}

- (id)voicesSpecifier
{
  v3 = settingsLocString(@"PRONUNCIATION_VOICES", @"VoiceOverSettings");
  v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:"_selectedVoice:" detail:objc_opt_class() cell:2 edit:0];

  unsigned __int8 v5 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v6 = [v5 voiceIds];
  [v4 setObject:v6 forKeyedSubscript:@"VoiceIds"];

  objc_super v7 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v8 = [v7 languages];
  [v4 setObject:v8 forKeyedSubscript:@"Languages"];

  [v4 setObject:@"Voices" forKeyedSubscript:PSIDKey];

  return v4;
}

- (void)_manageVoicesSelector
{
  id v9 = [(AXPronunciationEntryViewController *)self specifierForID:@"Voices"];
  v3 = [(AXPronunciationEntryViewController *)self userSubstitution];
  v4 = [v3 languages];
  id v5 = [v4 count];

  id v6 = v9;
  if (v9)
  {
    if (v5) {
      goto LABEL_7;
    }
    [(AXPronunciationEntryViewController *)self removeSpecifier:v9 animated:0];
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    objc_super v7 = [(AXPronunciationEntryViewController *)self specifierForID:@"Languages"];
    id v8 = [(AXPronunciationEntryViewController *)self voicesSpecifier];
    [(AXPronunciationEntryViewController *)self insertSpecifier:v8 afterSpecifier:v7];
  }
  id v6 = v9;
LABEL_7:
}

- (id)_selectedVoice:(id)a3
{
  v4 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v5 = [v4 voiceIds];
  id v6 = (char *)[v5 count];

  if (v6 == (unsigned char *)&dword_0 + 1)
  {
    objc_super v7 = [(AXPronunciationEntryViewController *)self userSubstitution];
    id v8 = [v7 voiceIds];
    id v9 = [v8 anyObject];
    v10 = +[AVSpeechSynthesisVoice _voiceFromInternalVoiceListWithIdentifier:v9];
    v11 = [v10 name];
  }
  else
  {
    v12 = [(AXPronunciationEntryViewController *)self userSubstitution];
    id v13 = [v12 voiceIds];
    id v14 = [v13 count];

    if (v14) {
      v15 = @"PRONUNCIATION_MULTIPLE_LANGUAGES_SELECTED";
    }
    else {
      v15 = @"ALL_LANGUAGES";
    }
    v11 = settingsLocString(v15, @"VoiceOverSettings");
  }

  return v11;
}

- (BOOL)_supportsPronunciationDictation
{
  unsigned int v3 = [(AXPronunciationEntryViewController *)self _usingSupportedDictationLanguage];
  if (v3)
  {
    pronunciationHelper = self->_pronunciationHelper;
    LOBYTE(v3) = [(AXSpeechPronunciationHelper *)pronunciationHelper supportsPronunciationSessions];
  }
  return v3;
}

- (BOOL)_usingSupportedDictationLanguage
{
  unsigned int v3 = +[TTSSpeechSynthesizer supportedIPAPhonemeLanguages];
  v4 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v5 = [v4 languages];
  id v6 = [v5 count];

  if (v6)
  {
    objc_super v7 = [(AXPronunciationEntryViewController *)self userSubstitution];
    id v8 = [v7 languages];
    id v9 = (char *)[v8 count];

    if (v9 != (unsigned char *)&dword_0 + 1) {
      goto LABEL_5;
    }
    v10 = [(AXPronunciationEntryViewController *)self userSubstitution];
    v11 = [v10 languages];
    v12 = [v11 anyObject];
    unsigned __int8 v13 = [v3 containsObject:v12];

    if (v13) {
      unsigned __int8 v14 = 1;
    }
    else {
LABEL_5:
    }
      unsigned __int8 v14 = 0;
  }
  else
  {
    v15 = +[AXLanguageManager sharedInstance];
    v16 = [v15 dialectForUserLocale];
    id v17 = [v16 specificLanguageID];
    unsigned __int8 v14 = [v3 containsObject:v17];
  }
  return v14;
}

- (void)manipulateDictationView:(int64_t)a3
{
  dictationView = self->_dictationView;
  if ((unint64_t)(a3 - 3) > 1)
  {
    if (dictationView)
    {
      dictationBackgroundView = self->_dictationBackgroundView;
      [(UIView *)dictationBackgroundView removeFromSuperview];
    }
  }
  else if (!dictationView)
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    id v6 = [v5 window];

    objc_super v7 = +[UIKeyboardImpl sharedInstance];
    [v7 bounds];
    double x = v8;
    double y = v10;
    double v13 = v12;
    double v15 = v14;

    if (!v6)
    {
      v16 = [(AXPronunciationEntryViewController *)self view];
      id v6 = [v16 window];

      double x = CGPointZero.x;
      double y = CGPointZero.y;
      id v17 = +[UIKeyboard activeKeyboard];
      +[UIKeyboardImpl keyboardSizeForInterfaceOrientation:](UIKeyboardImpl, "keyboardSizeForInterfaceOrientation:", [v17 interfaceOrientation]);
      double v13 = v18;
      double v15 = v19;
    }
    id v20 = (UIDictationView *)objc_msgSend(objc_alloc((Class)+[UIDictationView dictationViewClass](UIDictationView, "dictationViewClass")), "initWithFrame:", x, y, v13, v15);
    id v21 = self->_dictationView;
    self->_dictationView = v20;

    [(UIDictationView *)self->_dictationView setDisplayDelegate:self];
    [(UIDictationView *)self->_dictationView setAccessibilityIdentifier:@"AXPronunciationDictationView"];
    objc_opt_class();
    v22 = [(UIDictationView *)self->_dictationView safeUIViewForKey:@"_endpointButton"];
    id v23 = __UIAccessibilityCastAsClass();

    [v23 addTarget:self action:"doneButtonPressed" forControlEvents:64];
    objc_opt_class();
    id v24 = [(UIDictationView *)self->_dictationView safeUIViewForKey:@"_endpointButtonLandscape"];
    id v25 = __UIAccessibilityCastAsClass();

    [v25 addTarget:self action:"doneButtonPressed" forControlEvents:64];
    [(UIDictationView *)self->_dictationView frame];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    [v6 bounds];
    v33 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v27, v32 - v31, v29, v31);
    v34 = self->_dictationBackgroundView;
    self->_dictationBackgroundView = v33;

    v35 = +[UIColor darkGrayColor];
    [(UIView *)self->_dictationBackgroundView setBackgroundColor:v35];

    [v6 addSubview:self->_dictationBackgroundView];
    [(UIView *)self->_dictationBackgroundView addSubview:self->_dictationView];
    AXPerformSafeBlock();
  }
}

id __62__AXPronunciationEntryViewController_manipulateDictationView___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 208) setState:1];
  [*(id *)(*(void *)(a1 + 32) + 208) show];
  v2 = *(void **)(*(void *)(a1 + 32) + 208);

  return [v2 setState:2];
}

- (void)_updateDictationViewWithStatus:(int64_t)a3 withCell:(id)a4
{
  id v9 = a4;
  if (!v9)
  {
    id v6 = [(AXPronunciationEntryViewController *)self specifierForID:@"InputCell"];
    id v9 = [(AXPronunciationEntryViewController *)self cellForSpecifier:v6];

    if (!v9)
    {
      _AXAssert();
      id v9 = 0;
    }
  }
  [(AXPronunciationEntryViewController *)self manipulateDictationView:a3];
  switch(a3)
  {
    case 0:
      [v9 setShowsDictationButton:1];
      [v9 setShowsSpinner:0];
      [v9 setDictationButtonEnabled:0];
      break;
    case 1:
      [v9 setShowsSpinner:0];
      [v9 setShowsDictationButton:0];
      break;
    case 2:
      [v9 setShowsSpinner:0];
      [v9 setDictationButtonEnabled:1];
      [v9 setShowsDictationButton:1];
      objc_super v7 = v9;
      uint64_t v8 = 0;
      goto LABEL_9;
    case 3:
      [v9 setDictationButtonEnabled:0];
      objc_super v7 = v9;
      uint64_t v8 = 1;
LABEL_9:
      [v7 setShowsListeningState:v8];
      break;
    case 4:
      [v9 setShowsListeningState:0];
      [v9 setShowsSpinner:1];
      break;
    default:
      break;
  }
}

- (void)_calculateAndUpdateDictationStatus
{
}

- (void)_calculateAndUpdateDictationStatus:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_isRecording)
  {
    id v5 = v4;
    uint64_t v6 = 3;
    goto LABEL_10;
  }
  if ([(AXPronunciationEntryViewController *)self _supportsPronunciationDictation])
  {
    objc_super v7 = [(AXPronunciationEntryViewController *)self userSubstitution];
    uint64_t v8 = [v7 originalString];
    if ([v8 length])
    {
    }
    else
    {
      id v9 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"OriginalString"];
      double v10 = [v9 editableTextField];
      v11 = [v10 text];
      id v12 = [v11 length];

      if (!v12)
      {
        uint64_t v6 = 0;
        goto LABEL_9;
      }
    }
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v6 = 1;
  }
LABEL_9:
  id v5 = v13;
LABEL_10:
  [(AXPronunciationEntryViewController *)self _updateDictationViewWithStatus:v6 withCell:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)AXPronunciationEntryViewController;
  [(AXPronunciationEntryViewController *)&v18 viewDidAppear:a3];
  id v4 = [(AXPronunciationEntryViewController *)self specifierForID:@"OriginalString"];
  id v5 = [(AXPronunciationEntryViewController *)self cellForSpecifier:v4];

  uint64_t v6 = [v5 textField];
  [v6 setDelegate:self];

  objc_super v7 = [v5 textField];
  [v7 _accessibilitySetBoolValue:1 forKey:UIAccessibilityTokenIgnoreSubstitution];

  uint64_t v8 = [v5 textField];
  [v8 addTarget:self action:"editingChanged:" forControlEvents:0x20000];

  id v9 = [v5 textField];
  double v10 = [v9 text];
  id v11 = [v10 length];

  if (!v11) {
    [v5 becomeFirstResponder];
  }
  id v12 = [(AXPronunciationEntryViewController *)self specifierForID:@"InputCell"];
  id v13 = [(AXPronunciationEntryViewController *)self cellForSpecifier:v12];

  double v14 = [v13 textField];
  [v14 setDelegate:self];

  double v15 = [v13 textField];
  [v15 addTarget:self action:"editingChanged:" forControlEvents:0x20000];

  v16 = [(AXPronunciationEntryViewController *)self specifierForID:@"InputCell"];
  id v17 = [(AXPronunciationEntryViewController *)self cellForSpecifier:v16];

  [v17 setListeningDuration:4.0];
}

- (void)_handleViewHiddenStatus
{
  unsigned int v3 = [(AXPronunciationEntryViewController *)self speechManager];
  [v3 stopSpeaking];

  [(AXPronunciationEntryViewController *)self _stopRecording];
  if (![(AXPronunciationEntryViewController *)self _save]) {
    _AXLogWithFacility();
  }
}

- (void)willResignActive
{
  [(AXPronunciationEntryViewController *)self _handleViewHiddenStatus];
  v3.receiver = self;
  v3.super_class = (Class)AXPronunciationEntryViewController;
  [(AXPronunciationEntryViewController *)&v3 willResignActive];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(AXPronunciationEntryViewController *)self _handleViewHiddenStatus];
  v5.receiver = self;
  v5.super_class = (Class)AXPronunciationEntryViewController;
  [(AXPronunciationEntryViewController *)&v5 viewWillDisappear:v3];
}

- (void)dealloc
{
  BOOL v3 = [(AXPronunciationEntryViewController *)self speechManager];
  [v3 stopSpeaking];

  id v4 = [(AXPronunciationEntryViewController *)self speechManager];
  [v4 tearDown];

  [(UIView *)self->_dictationBackgroundView removeFromSuperview];
  v5.receiver = self;
  v5.super_class = (Class)AXPronunciationEntryViewController;
  [(AXPronunciationEntryViewController *)&v5 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v6 = +[PSSpecifier emptyGroupSpecifier];
    objc_super v7 = settingsLocString(@"PRONUNCIATION_DICTATE_HELP", @"VoiceOverSettings");
    [v6 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];

    [v5 addObject:v6];
    uint64_t v8 = settingsLocString(@"PRONUNCIATION_ORIGINAL_STRING", @"VoiceOverSettings");
    id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"_setOriginalString:specifier:" get:"_originalString:" detail:0 cell:8 edit:0];

    uint64_t v10 = PSIDKey;
    [v9 setObject:@"OriginalString" forKeyedSubscript:PSIDKey];
    [v9 setKeyboardType:0 autoCaps:2 autoCorrection:1];
    [v5 addObject:v9];
    id v11 = settingsLocString(@"PRONUNCIATION_REPLACEMENT_STRING", @"VoiceOverSettings");
    id v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"_setReplacementString:specifier:" get:"_replacementString:" detail:0 cell:8 edit:0];

    [v12 setObject:@"InputCell" forKeyedSubscript:v10];
    [v12 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
    [v12 setKeyboardType:0 autoCaps:2 autoCorrection:1];
    [v5 addObject:v12];
    id v13 = +[PSSpecifier emptyGroupSpecifier];

    [v5 addObject:v13];
    double v14 = settingsLocString(@"PRONUNCIATION_LANGUAGE", @"VoiceOverSettings");
    double v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:"_language" detail:objc_opt_class() cell:2 edit:0];

    v16 = [(AXPronunciationEntryViewController *)self userSubstitution];
    id v17 = [v16 languages];
    [v15 setObject:v17 forKeyedSubscript:@"Languages"];

    [v15 setObject:@"Languages" forKeyedSubscript:v10];
    [v5 addObject:v15];
    objc_super v18 = [(AXPronunciationEntryViewController *)self userSubstitution];
    double v19 = [v18 languages];
    id v20 = [v19 count];

    if (v20)
    {
      id v21 = [(AXPronunciationEntryViewController *)self voicesSpecifier];
      [v5 addObject:v21];
    }
    v22 = settingsLocString(@"PRONUNCIATION_IGNORE_CASE", @"VoiceOverSettings");
    id v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:"_setIgnoresCase:specifier:" get:"_ignoresCase:" detail:0 cell:6 edit:0];

    [v5 addObject:v23];
    id v24 = settingsLocString(@"APPLIES_TO", @"VoiceOverSettings");
    id v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:"_setAppliesTo:specifier:" get:"_appliesTo:" detail:0 cell:6 edit:0];

    [v25 setObject:@"AppApplies" forKeyedSubscript:v10];
    [v5 addObject:v25];
    uint64_t v26 = [(AXPronunciationEntryViewController *)self userSubstitution];
    if (v26)
    {
      double v27 = (void *)v26;
      double v28 = [(AXPronunciationEntryViewController *)self userSubstitution];
      unsigned __int8 v29 = [v28 appliesToAllApps];

      if ((v29 & 1) == 0)
      {
        double v30 = [(AXPronunciationEntryViewController *)self appSpecifiers];
        [v5 addObjectsFromArray:v30];
      }
    }
    double v31 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    id v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (BOOL)_stopRecording
{
  BOOL isRecording = self->_isRecording;
  if (self->_isRecording)
  {
    self->_BOOL isRecording = 0;
    [(AXSpeechPronunciationHelper *)self->_pronunciationHelper cancelPronunciationSession];
    [(AXPronunciationEntryViewController *)self _calculateAndUpdateDictationStatus];
  }
  return isRecording;
}

- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5
{
  id v6 = a4;
  objc_super v7 = +[AXSubsystemPronunciations sharedInstance];
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    id v9 = +[AXSubsystemPronunciations identifier];
    uint64_t v10 = AXLoggerForFacility();

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = AXColorizeFormatLog();
      id v13 = _AXStringForArgs();
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        double v15 = v13;
        _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
  self->_BOOL isRecording = 0;
}

- (void)assistantConnection:(id)a3 requestFailedWithError:(id)a4 requestClass:(id)a5
{
  id v6 = a4;
  objc_super v7 = +[AXSubsystemPronunciations sharedInstance];
  unsigned __int8 v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    id v9 = +[AXSubsystemPronunciations identifier];
    uint64_t v10 = AXLoggerForFacility();

    os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = AXColorizeFormatLog();
      id v13 = _AXStringForArgs();
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v13;
        _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_isRecording)
  {
    self->_BOOL isRecording = 0;
    double v14 = settingsLocString(@"DICTATE_ERROR_TITLE", @"VoiceOverSettings");
    double v15 = settingsLocString(@"DICTATE_TIMEOUT_MESSAGE", @"VoiceOverSettings");
    v16 = +[UIAlertController alertControllerWithTitle:v14 message:v15 preferredStyle:1];

    id v17 = settingsLocString(@"DICTATE_TIMEOUT_TRY_AGAIN", @"VoiceOverSettings");
    objc_super v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:0];
    [v16 addAction:v18];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __94__AXPronunciationEntryViewController_assistantConnection_requestFailedWithError_requestClass___block_invoke;
    v19[3] = &unk_2087C0;
    v19[4] = self;
    [(AXPronunciationEntryViewController *)self presentViewController:v16 animated:1 completion:v19];
  }
}

id __94__AXPronunciationEntryViewController_assistantConnection_requestFailedWithError_requestClass___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _calculateAndUpdateDictationStatus];
}

- (void)_popSuggestionsController:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSubsystemPronunciations sharedInstance];
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    objc_super v7 = +[AXSubsystemPronunciations identifier];
    unsigned __int8 v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = AXColorizeFormatLog();
      id v20 = v4;
      os_log_type_t v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v11;
        _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (objc_msgSend(v4, "count", v20) == (char *)&dword_0 + 1)
  {
    id v12 = [v4 firstObject];
    [(AXPronunciationEntryViewController *)self pronunciationSuggestionsViewController:0 didSelectPhonemes:v12];
LABEL_11:

    goto LABEL_12;
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    id v21 = 0;
    id v22 = 0;
    [(AXPronunciationEntryViewController *)self _substitutionVoiceId:&v22 andLanguage:&v21];
    id v12 = v22;
    id v13 = v21;
    double v14 = [[AXPronunciationSuggestionsViewController alloc] initWithSuggestions:v4];
    [(AXPronunciationSuggestionsViewController *)v14 setVoiceId:v12];
    [(AXPronunciationSuggestionsViewController *)v14 setLanguage:v13];

    [(AXPronunciationSuggestionsViewController *)v14 setDelegate:self];
    double v15 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"OriginalString"];
    v16 = [v15 editableTextField];
    id v17 = [v16 text];
    objc_super v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [(AXPronunciationSuggestionsViewController *)v14 setSpecifier:v18];

    id v19 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v14];
    [(AXPronunciationEntryViewController *)self presentViewController:v19 animated:1 completion:0];

    goto LABEL_11;
  }
LABEL_12:
}

- (void)_dictateButtonTapped:(id)a3
{
  id v4 = a3;
  if (self->_isRecording)
  {
    self->_BOOL isRecording = 0;
    [(AXSpeechPronunciationHelper *)self->_pronunciationHelper stopPronunciationSession];
    [(AXPronunciationEntryViewController *)self _calculateAndUpdateDictationStatus];
  }
  else
  {
    id v5 = [(AXPronunciationEntryViewController *)self specifierForID:@"InputCell"];
    unsigned __int8 v6 = [(AXPronunciationEntryViewController *)self cellForSpecifier:v5];

    [v6 setListeningDuration:4.0];
    objc_super v7 = objc_opt_new();
    unsigned __int8 v8 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"OriginalString"];
    uint64_t v9 = [v8 editableTextField];
    uint64_t v10 = [(id)v9 text];
    [v7 setOrthography:v10];

    os_log_type_t v11 = +[AXSubsystemPronunciations sharedInstance];
    LOBYTE(v9) = [v11 ignoreLogging];

    if ((v9 & 1) == 0)
    {
      id v12 = +[AXSubsystemPronunciations identifier];
      id v13 = AXLoggerForFacility();

      os_log_type_t v14 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v13, v14))
      {
        double v15 = AXColorizeFormatLog();
        id v22 = v7;
        v16 = _AXStringForArgs();
        if (os_log_type_enabled(v13, v14))
        {
          *(_DWORD *)buf = 138543362;
          double v27 = v16;
          _os_log_impl(&dword_0, v13, v14, "%{public}@", buf, 0xCu);
        }
      }
    }
    id v17 = [(AXPronunciationEntryViewController *)self userSubstitution];
    objc_super v18 = [v17 languages];
    id v19 = [v18 anyObject];
    [v7 setLanguage:v19];

    objc_initWeak((id *)buf, self);
    pronunciationHelper = self->_pronunciationHelper;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __59__AXPronunciationEntryViewController__dictateButtonTapped___block_invoke;
    v23[3] = &unk_2098C0;
    v23[4] = self;
    objc_copyWeak(&v25, (id *)buf);
    id v21 = v7;
    id v24 = v21;
    [(AXSpeechPronunciationHelper *)pronunciationHelper startPronunciationSession:v21 resultCallback:v23];
    self->_BOOL isRecording = 1;
    [(AXPronunciationEntryViewController *)self _calculateAndUpdateDictationStatus];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __59__AXPronunciationEntryViewController__dictateButtonTapped___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v31 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  char v30 = *(unsigned char *)(v6 + 193);
  *(unsigned char *)(v6 + 193) = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = v5;
  unsigned __int8 v8 = 0;
  id v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v42;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v13 = +[NSCharacterSet whitespaceCharacterSet];
        os_log_type_t v14 = [v12 stringByTrimmingCharactersInSet:v13];
        BOOL v15 = [v14 length] != 0;

        v8 |= v15;
      }
      id v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v9);
  }

  v16 = +[AXSubsystemPronunciations sharedInstance];
  unsigned __int8 v17 = [v16 ignoreLogging];

  if ((v17 & 1) == 0)
  {
    objc_super v18 = +[AXSubsystemPronunciations identifier];
    id v19 = AXLoggerForFacility();

    os_log_type_t v20 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = AXColorizeFormatLog();
      id v22 = _AXStringForArgs();
      if (os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v22;
        _os_log_impl(&dword_0, v19, v20, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (((v31 == 0) & v8) == 1)
  {
    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    v37 = __59__AXPronunciationEntryViewController__dictateButtonTapped___block_invoke_500;
    v38 = &unk_208BB8;
    objc_copyWeak(&v40, (id *)(a1 + 48));
    id v39 = v7;
    AXPerformBlockAsynchronouslyOnMainThread();

    objc_destroyWeak(&v40);
  }
  else
  {
    id v23 = +[AXSubsystemPronunciations sharedInstance];
    unsigned __int8 v24 = [v23 ignoreLogging];

    if ((v24 & 1) == 0)
    {
      id v25 = +[AXSubsystemPronunciations identifier];
      uint64_t v26 = AXLoggerForFacility();

      os_log_type_t v27 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v26, v27))
      {
        double v28 = AXColorizeFormatLog();
        unsigned __int8 v29 = _AXStringForArgs();
        if (os_log_type_enabled(v26, v27))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v29;
          _os_log_impl(&dword_0, v26, v27, "%{public}@", buf, 0xCu);
        }
      }
    }
    char v34 = v30;
    id v32 = *(id *)(a1 + 40);
    objc_copyWeak(&v33, (id *)(a1 + 48));
    AXPerformBlockAsynchronouslyOnMainThread();
    objc_destroyWeak(&v33);
  }
}

void __59__AXPronunciationEntryViewController__dictateButtonTapped___block_invoke_500(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _popSuggestionsController:*(void *)(a1 + 32)];
}

void __59__AXPronunciationEntryViewController__dictateButtonTapped___block_invoke_504(uint64_t a1)
{
  v2 = +[AXSubsystemPronunciations sharedInstance];
  unsigned __int8 v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    id v4 = +[AXSubsystemPronunciations identifier];
    id v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = AXColorizeFormatLog();
      unsigned __int8 v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v8;
        _os_log_impl(&dword_0, v5, v6, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v9 = settingsLocString(@"DICTATE_ERROR_MESSAGE", @"VoiceOverSettings");
    uint64_t v10 = [*(id *)(a1 + 32) orthography];
    os_log_type_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);

    id v12 = settingsLocString(@"DICTATE_ERROR_TITLE", @"VoiceOverSettings");
    id v13 = +[UIAlertController alertControllerWithTitle:v12 message:v11 preferredStyle:1];

    os_log_type_t v14 = settingsLocString(@"OK", @"Accessibility");
    BOOL v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:0];
    [v13 addAction:v15];

    v16 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __59__AXPronunciationEntryViewController__dictateButtonTapped___block_invoke_515;
    v18[3] = &unk_208798;
    objc_copyWeak(&v19, v16);
    [WeakRetained presentViewController:v13 animated:1 completion:v18];

    objc_destroyWeak(&v19);
  }
}

void __59__AXPronunciationEntryViewController__dictateButtonTapped___block_invoke_515(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _calculateAndUpdateDictationStatus];
}

- (id)_assetUpdaterClient
{
  if (_assetUpdaterClient_onceToken != -1) {
    dispatch_once(&_assetUpdaterClient_onceToken, &__block_literal_global_518);
  }
  v2 = (void *)_assetUpdaterClient_Client;

  return v2;
}

void __57__AXPronunciationEntryViewController__assetUpdaterClient__block_invoke(id a1)
{
  id v1 = objc_alloc((Class)AXUIClient);
  id v5 = +[NSNumber numberWithInt:getpid()];
  v2 = +[NSString stringWithFormat:@"AXAssetClient-pronunciation-%@", v5];
  id v3 = [v1 initWithIdentifier:v2 serviceBundleName:@"AXAssetAndDataServer"];
  id v4 = (void *)_assetUpdaterClient_Client;
  _assetUpdaterClient_Client = (uint64_t)v3;
}

- (BOOL)_save
{
  id v3 = [(AXPronunciationEntryViewController *)self userSubstitution];
  v85 = [v3 originalString];

  id v4 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v5 = [v4 replacementString];

  os_log_type_t v6 = [(AXPronunciationEntryViewController *)self userSubstitution];
  v84 = [v6 phonemes];

  id v7 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"OriginalString"];
  unsigned __int8 v8 = v7;
  if (v7)
  {
    id v9 = [v7 editableTextField];
    uint64_t v10 = [v9 text];
    os_log_type_t v11 = [(AXPronunciationEntryViewController *)self userSubstitution];
    [v11 setOriginalString:v10];
  }
  id v12 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v13 = [v12 phonemes];

  if (v13)
  {
    os_log_type_t v14 = [(AXPronunciationEntryViewController *)self userSubstitution];
    [v14 setReplacementString:0];
  }
  else
  {
    BOOL v15 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"InputCell"];
    os_log_type_t v14 = v15;
    if (v15)
    {
      v16 = [v15 editableTextField];
      unsigned __int8 v17 = [v16 text];
      objc_super v18 = [(AXPronunciationEntryViewController *)self userSubstitution];
      [v18 setReplacementString:v17];
    }
  }

  id v19 = [(AXPronunciationEntryViewController *)self userSubstitution];
  os_log_type_t v20 = [v19 originalString];
  id v21 = [v20 length];

  id v22 = +[AXSettings sharedInstance];
  id v23 = [v22 customPronunciationSubstitutions];
  id v24 = [v23 mutableCopy];

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = __43__AXPronunciationEntryViewController__save__block_invoke;
  v87[3] = &unk_209908;
  v87[4] = self;
  id v25 = [v24 indexOfObjectPassingTest:v87];
  if (v25 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = __43__AXPronunciationEntryViewController__save__block_invoke_2;
    v86[3] = &unk_209908;
    v86[4] = self;
    id v25 = [v24 indexOfObjectPassingTest:v86];
    if (v25 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (!v21) {
        goto LABEL_21;
      }
      uint64_t v26 = [(AXPronunciationEntryViewController *)self userSubstitution];
      [v24 addObject:v26];
      goto LABEL_13;
    }
  }
  if (v21)
  {
    uint64_t v26 = [(AXPronunciationEntryViewController *)self userSubstitution];
    [v24 replaceObjectAtIndex:v25 withObject:v26];
LABEL_13:

    goto LABEL_21;
  }
  os_log_type_t v27 = +[AXSubsystemPronunciations sharedInstance];
  uint64_t v28 = [v27 ignoreLogging];

  if ((v28 & 1) == 0)
  {
    unsigned __int8 v29 = +[AXSubsystemPronunciations identifier];
    char v30 = AXLoggerForFacility();

    os_log_type_t v31 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v30, v31))
    {
      id v32 = AXColorizeFormatLog();
      [(AXPronunciationEntryViewController *)self userSubstitution];
      uint64_t v80 = v78 = v25;
      id v33 = _AXStringForArgs();

      if (os_log_type_enabled(v30, v31))
      {
        *(_DWORD *)buf = 138543362;
        v92 = v33;
        _os_log_impl(&dword_0, v30, v31, "%{public}@", buf, 0xCu);
      }
    }
  }
  objc_msgSend(v24, "removeObjectAtIndex:", v25, v78, v80);
LABEL_21:
  char v34 = [(AXPronunciationEntryViewController *)self userSubstitution];
  v35 = [v34 originalString];
  unsigned int v36 = [v85 isEqualToString:v35];

  v37 = [(AXPronunciationEntryViewController *)self userSubstitution];
  v38 = [v37 replacementString];
  v83 = v8;
  if ([v5 isEqualToString:v38])
  {
    BOOL v39 = 0;
  }
  else
  {
    id v40 = [(AXPronunciationEntryViewController *)self userSubstitution];
    long long v41 = [v40 replacementString];
    BOOL v39 = [v41 length] != 0;
  }
  long long v42 = v5;

  long long v43 = [(AXPronunciationEntryViewController *)self userSubstitution];
  long long v44 = [v43 phonemes];
  if ([v84 isEqualToString:v44])
  {
    BOOL v45 = 0;
  }
  else
  {
    v46 = [(AXPronunciationEntryViewController *)self userSubstitution];
    v47 = [v46 phonemes];
    BOOL v45 = [v47 length] != 0;
  }
  v48 = &__NSDictionary0__struct;
  if ([v85 length])
  {
    v49 = (void *)(v36 ^ 1);
    v50 = &swift_allocBox_ptr;
    if (v49 | v39 | v45)
    {
      v51 = +[AXSubsystemPronunciations sharedInstance];
      unsigned __int8 v52 = [v51 ignoreLogging];

      if ((v52 & 1) == 0)
      {
        v53 = +[AXSubsystemPronunciations identifier];
        v54 = AXLoggerForFacility();

        os_log_type_t v55 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = AXColorizeFormatLog();
          [(AXPronunciationEntryViewController *)self userSubstitution];
          v82 = BOOL v81 = v45;
          v78 = v49;
          uint64_t v80 = v39;
          v57 = _AXStringForArgs();

          if (os_log_type_enabled(v54, v55))
          {
            *(_DWORD *)buf = 138543362;
            v92 = v57;
            _os_log_impl(&dword_0, v54, v55, "%{public}@", buf, 0xCu);
          }

          v50 = &swift_allocBox_ptr;
        }
      }
      v88 = v85;
      CFStringRef v89 = @"delete";
      v58 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v88, 1, v78, v80, v81, v82);
      v90 = v58;
      v48 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    }
  }
  else
  {
    v50 = &swift_allocBox_ptr;
  }
  v59 = [v50[469] sharedInstance];
  unsigned __int8 v60 = [v59 ignoreLogging];

  if ((v60 & 1) == 0)
  {
    v61 = [v50[469] identifier];
    v62 = AXLoggerForFacility();

    os_log_type_t v63 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = AXColorizeFormatLog();
      v78 = [(AXPronunciationEntryViewController *)self userSubstitution];
      v65 = _AXStringForArgs();

      if (os_log_type_enabled(v62, v63))
      {
        *(_DWORD *)buf = 138543362;
        v92 = v65;
        _os_log_impl(&dword_0, v62, v63, "%{public}@", buf, 0xCu);
      }
    }
    v50 = &swift_allocBox_ptr;
  }
  v66 = objc_msgSend(v50[469], "sharedInstance", v78);
  unsigned __int8 v67 = [v66 ignoreLogging];

  if ((v67 & 1) == 0)
  {
    v68 = [v50[469] identifier];
    v69 = AXLoggerForFacility();

    os_log_type_t v70 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = AXColorizeFormatLog();
      id v79 = v24;
      v72 = _AXStringForArgs();
      if (os_log_type_enabled(v69, v70))
      {
        *(_DWORD *)buf = 138543362;
        v92 = v72;
        _os_log_impl(&dword_0, v69, v70, "%{public}@", buf, 0xCu);
      }
    }
  }
  v73 = +[AXSettings sharedInstance];
  [v73 setCustomPronunciationSubstitutions:v24];

  v74 = [(AXPronunciationEntryViewController *)self _assetUpdaterClient];
  v75 = +[AXAccessQueue mainAccessQueue];
  [v74 sendAsynchronousMessage:v48 withIdentifier:1 targetAccessQueue:v75 completion:0];

  v76 = +[NSNotificationCenter defaultCenter];
  [v76 postNotificationName:@"AXVoiceOverReloadPronunciations" object:0];

  return 1;
}

id __43__AXPronunciationEntryViewController__save__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) userSubstitution];
  id v5 = [v4 uuid];
  id v6 = [v3 isEqual:v5];

  return v6;
}

id __43__AXPronunciationEntryViewController__save__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 originalString];
  id v4 = [*(id *)(a1 + 32) userSubstitution];
  id v5 = [v4 originalString];
  id v6 = [v3 isEqualToString:v5];

  return v6;
}

- (id)appSpecifiers
{
  appSpecifiers = self->_appSpecifiers;
  if (!appSpecifiers)
  {
    id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v5 = self->_appSpecifiers;
    self->_appSpecifiers = v4;

    AXGenerateAppNameSpecifiers(self, self->_appSpecifiers, 1);
    appSpecifiers = self->_appSpecifiers;
  }

  return appSpecifiers;
}

- (void)_showAppCombinationsAnimated:(BOOL)a3
{
  if (!self->_appSpecifiers)
  {
    BOOL v3 = a3;
    id v5 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"OriginalString"];
    id v6 = [v5 editableTextField];
    [v6 resignFirstResponder];

    id v7 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"InputCell"];
    unsigned __int8 v8 = [v7 editableTextField];
    [v8 resignFirstResponder];

    id v10 = [(AXPronunciationEntryViewController *)self appSpecifiers];
    id v9 = [(AXPronunciationEntryViewController *)self specifierForID:@"AppApplies"];
    [(AXPronunciationEntryViewController *)self insertContiguousSpecifiers:v10 afterSpecifier:v9 animated:v3];
  }
}

- (void)_hideAppCombinations
{
  [(AXPronunciationEntryViewController *)self removeContiguousSpecifiers:self->_appSpecifiers animated:1];
  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = 0;
}

- (void)_setOriginalString:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(AXPronunciationEntryViewController *)self userSubstitution];
  [v6 setOriginalString:v5];

  [(AXPronunciationEntryViewController *)self _save];
}

- (id)_originalString:(id)a3
{
  BOOL v3 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v4 = [v3 originalString];

  return v4;
}

- (void)_setReplacementString:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(AXPronunciationEntryViewController *)self userSubstitution];
  [v6 setPhonemes:0];

  id v7 = [(AXPronunciationEntryViewController *)self userSubstitution];
  [v7 setReplacementString:v5];

  [(AXPronunciationEntryViewController *)self _save];
}

- (id)_replacementString:(id)a3
{
  id v4 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v5 = [v4 phonemes];

  id v6 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v7 = v6;
  if (v5) {
    [v6 phonemes];
  }
  else {
  unsigned __int8 v8 = [v6 replacementString];
  }

  return v8;
}

- (void)_setIgnoresCase:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  id v6 = [(AXPronunciationEntryViewController *)self userSubstitution];
  [v6 setIgnoreCase:v5];

  [(AXPronunciationEntryViewController *)self _save];
}

- (id)_ignoresCase:(id)a3
{
  BOOL v3 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 ignoreCase]);

  return v4;
}

- (void)_setAppliesTo:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [v5 BOOLValue];
  id v7 = [(AXPronunciationEntryViewController *)self userSubstitution];
  [v7 setAppliesToAllApps:v6];

  LOBYTE(v6) = [v5 BOOLValue];
  if (v6) {
    [(AXPronunciationEntryViewController *)self _hideAppCombinations];
  }
  else {
    [(AXPronunciationEntryViewController *)self _showAppCombinationsAnimated:1];
  }

  [(AXPronunciationEntryViewController *)self _save];
}

- (id)_appliesTo:(id)a3
{
  BOOL v3 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 appliesToAllApps]);

  return v4;
}

- (id)_language
{
  BOOL v3 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v4 = [v3 languages];
  id v5 = (char *)[v4 count];

  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    id v6 = +[AXLanguageManager sharedInstance];
    id v7 = [(AXPronunciationEntryViewController *)self userSubstitution];
    unsigned __int8 v8 = [v7 languages];
    id v9 = [v8 anyObject];
    id v10 = [v6 dialectForLanguageID:v9];
    os_log_type_t v11 = [v10 languageNameAndLocaleInCurrentLocale];
  }
  else
  {
    id v12 = [(AXPronunciationEntryViewController *)self userSubstitution];
    id v13 = [v12 languages];
    id v14 = [v13 count];

    if (v14) {
      BOOL v15 = @"PRONUNCIATION_MULTIPLE_LANGUAGES_SELECTED";
    }
    else {
      BOOL v15 = @"ALL_LANGUAGES";
    }
    os_log_type_t v11 = settingsLocString(v15, @"VoiceOverSettings");
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(AXPronunciationEntryViewController *)self specifierForIndexPath:v7];
  uint64_t v9 = PSIDKey;
  id v10 = [v8 objectForKeyedSubscript:PSIDKey];
  unsigned int v11 = [v10 isEqualToString:@"Languages"];

  if (v11)
  {
    id v12 = [(AXPronunciationEntryViewController *)self userSubstitution];
    id v13 = [v12 languages];
    [v8 setObject:v13 forKeyedSubscript:@"Languages"];

    id v14 = AXPronunciationLanguageListController;
LABEL_5:
    id v21 = objc_alloc_init(v14);
    [v21 setSpecifier:v8];
    [v21 setDelegate:self];
    [(AXPronunciationEntryViewController *)self showController:v21];
    goto LABEL_6;
  }
  BOOL v15 = [v8 objectForKeyedSubscript:v9];
  unsigned int v16 = [v15 isEqualToString:@"Voices"];

  if (v16)
  {
    unsigned __int8 v17 = [(AXPronunciationEntryViewController *)self userSubstitution];
    objc_super v18 = [v17 voiceIds];
    [v8 setObject:v18 forKeyedSubscript:@"VoiceIds"];

    id v19 = [(AXPronunciationEntryViewController *)self userSubstitution];
    os_log_type_t v20 = [v19 languages];
    [v8 setObject:v20 forKeyedSubscript:@"Languages"];

    id v14 = AXPronunciationVoiceListController;
    goto LABEL_5;
  }
  v27.receiver = self;
  v27.super_class = (Class)AXPronunciationEntryViewController;
  [(AXPronunciationEntryViewController *)&v27 tableView:v6 didSelectRowAtIndexPath:v7];
  id v21 = [v8 propertyForKey:@"BundleIdentifier"];
  if (v21)
  {
    id v22 = [(AXPronunciationEntryViewController *)self userSubstitution];
    id v23 = [v22 bundleIdentifiers];
    id v24 = [v23 mutableCopy];

    if (!v24) {
      id v24 = objc_alloc_init((Class)NSMutableSet);
    }
    id v25 = [v6 cellForRowAtIndexPath:v7];
    if ([v24 containsObject:v21])
    {
      [v25 setChecked:0];
      [v24 removeObject:v21];
    }
    else
    {
      [v25 setChecked:1];
      [v24 addObject:v21];
    }
    uint64_t v26 = [(AXPronunciationEntryViewController *)self userSubstitution];
    [v26 setBundleIdentifiers:v24];

    [(AXPronunciationEntryViewController *)self _save];
  }
LABEL_6:
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v17 = a4;
  id v7 = [(AXPronunciationEntryViewController *)self specifierForIndexPath:a5];
  unsigned __int8 v8 = [v7 propertyForKey:@"BundleIdentifier"];
  if (v8)
  {
    uint64_t v9 = [(AXPronunciationEntryViewController *)self userSubstitution];
    id v10 = [v9 bundleIdentifiers];
    unsigned int v11 = [v10 containsObject:v8];

    if (v11) {
      [v17 setChecked:1];
    }
  }
  id v12 = [v7 objectForKeyedSubscript:PSIDKey];
  unsigned int v13 = [v12 isEqual:@"InputCell"];

  if (v13)
  {
    [v17 setAccessibilityTraits:UIAccessibilityTraitStartsMediaSession | UIAccessibilityTraitButton];
    id v14 = settingsLocString(@"DICTATE_HINT", @"VoiceOverSettings");
    [v17 setAccessibilityHint:v14];

    id v15 = v17;
    unsigned int v16 = [v15 dictateButton];
    [v16 addTarget:self action:"_dictateButtonTapped:" forControlEvents:64];

    [(AXPronunciationEntryViewController *)self _calculateAndUpdateDictationStatus:v15];
  }
  else
  {
    [v17 setAccessibilityTraits:UIAccessibilityTraitButton];
  }
}

- (void)pronunciationSuggestionsViewController:(id)a3 didSelectPhonemes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 length])
  {
    unsigned __int8 v8 = [(AXPronunciationEntryViewController *)self userSubstitution];
    [v8 setPhonemes:v6];

    [(AXPronunciationEntryViewController *)self _save];
    uint64_t v9 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"InputCell"];
    [v9 setShowsPhonemes:1];

    AXPerformBlockOnMainThreadAfterDelay();
  }
  id v10 = [(AXPronunciationEntryViewController *)self navigationItem];
  unsigned int v11 = [v10 rightBarButtonItem];
  [v11 setEnabled:1];

  [(AXPronunciationEntryViewController *)self _updatePlayButtonTraits];
  [(AXPronunciationEntryViewController *)self _calculateAndUpdateDictationStatus];
  id v12 = [(AXPronunciationEntryViewController *)self specifierForID:@"InputCell"];
  [(AXPronunciationEntryViewController *)self reloadSpecifier:v12 animated:1];

  unsigned int v13 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"InputCell"];
  [v13 layoutSubviews];

  [v7 dismissViewControllerAnimated:1 completion:0];
}

id __95__AXPronunciationEntryViewController_pronunciationSuggestionsViewController_didSelectPhonemes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handlePlayButton:0];
}

- (void)pronunciationVoiceListController:(id)a3 didSelectVoices:(id)a4
{
  id v5 = a4;
  id v7 = [(AXPronunciationEntryViewController *)self userSubstitution];
  [v7 setVoiceIds:v5];
  id v6 = [(AXPronunciationEntryViewController *)self specifierForID:@"Voices"];
  [v6 setProperty:v5 forKey:@"VoiceIds"];

  [(AXPronunciationEntryViewController *)self reloadSpecifier:v6];
  [(AXPronunciationEntryViewController *)self _save];
}

- (void)pronunciationLanguageListController:(id)a3 didSelectLanguages:(id)a4
{
  id v13 = a4;
  id v5 = [(AXPronunciationEntryViewController *)self userSubstitution];
  if (![v13 count]) {
    [v5 setVoiceIds:0];
  }
  [v5 setLanguages:v13];
  id v6 = [v5 originalString];
  if (![v6 length])
  {

    goto LABEL_9;
  }
  id v7 = [v5 phonemes];
  if ([v7 length])
  {
  }
  else
  {
    unsigned __int8 v8 = [v5 replacementString];
    id v9 = [v8 length];

    if (!v9) {
      goto LABEL_9;
    }
  }
  id v10 = [(AXPronunciationEntryViewController *)self navigationItem];
  unsigned int v11 = [v10 rightBarButtonItem];
  [v11 setEnabled:1];

  [(AXPronunciationEntryViewController *)self _updatePlayButtonTraits];
LABEL_9:
  [(AXPronunciationEntryViewController *)self _calculateAndUpdateDictationStatus];
  id v12 = [(AXPronunciationEntryViewController *)self specifierForID:@"Languages"];
  [v12 setProperty:v13 forKey:@"Languages"];
  [(AXPronunciationEntryViewController *)self reloadSpecifier:v12];
  [(AXPronunciationEntryViewController *)self _save];
}

- (void)editingChanged:(id)a3
{
  [(AXPronunciationEntryViewController *)self _save];

  [(AXPronunciationEntryViewController *)self _calculateAndUpdateDictationStatus];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  unsigned int v11 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"OriginalString"];
  id v12 = [v11 editableTextField];
  id v13 = [v12 text];
  id v34 = [v13 length];

  id v14 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"InputCell"];
  id v15 = [v14 editableTextField];
  unsigned int v16 = [v15 text];
  BOOL v17 = [v16 length] != 0;

  objc_super v18 = [(AXPronunciationEntryViewController *)self userSubstitution];
  id v19 = [v18 phonemes];
  id v20 = [v19 length];

  id v21 = [v9 text];
  id v22 = objc_msgSend(v21, "stringByReplacingCharactersInRange:withString:", location, length, v10);

  BOOL v23 = [v22 length] != 0;
  id v24 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"OriginalString"];
  id v25 = [v24 editableTextField];

  if (v25 == v9)
  {
    BOOL v28 = v23;
LABEL_6:
    BOOL v23 = v17;
    if (v28) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v26 = [(AXPronunciationEntryViewController *)self cellForSpecifierID:@"InputCell"];
  id v27 = [v26 editableTextField];

  BOOL v28 = v34 != 0;
  if (v27 != v9) {
    goto LABEL_6;
  }
  unsigned __int8 v29 = [(AXPronunciationEntryViewController *)self userSubstitution];
  [v29 setPhonemes:0];

  if (v34)
  {
LABEL_4:
    uint64_t v30 = 1;
    goto LABEL_10;
  }
LABEL_7:
  if (v20) {
    uint64_t v30 = 1;
  }
  else {
    uint64_t v30 = v23;
  }
LABEL_10:
  os_log_type_t v31 = [(AXPronunciationEntryViewController *)self navigationItem];
  id v32 = [v31 rightBarButtonItem];
  [v32 setEnabled:v30];

  [(AXPronunciationEntryViewController *)self _updatePlayButtonTraits];
  return 1;
}

- (TTSSubstitution)userSubstitution
{
  return self->_userSubstitution;
}

- (void)setUserSubstitution:(id)a3
{
}

- (TTSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (TTSSpeechAction)lastAction
{
  return self->_lastAction;
}

- (void)setLastAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAction, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_userSubstitution, 0);
  objc_storeStrong((id *)&self->_dictationBackgroundView, 0);
  objc_storeStrong((id *)&self->_dictationView, 0);
  objc_storeStrong((id *)&self->_pronunciationHelper, 0);

  objc_storeStrong((id *)&self->_appSpecifiers, 0);
}

@end