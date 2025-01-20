@interface AXPronunciationSuggestionsViewController
- (AXPronunciationSuggestionsViewController)initWithSuggestions:(id)a3;
- (AXPronunciationSuggestionsViewControllerDelegate)delegate;
- (NSArray)suggestions;
- (NSString)language;
- (NSString)selectedPhonemes;
- (NSString)voiceId;
- (TTSSpeechManager)speechManager;
- (id)specifiers;
- (void)cleanupSynthesizer;
- (void)dealloc;
- (void)handleBackButtonTapped:(id)a3;
- (void)handleCancelButtonTapped:(id)a3;
- (void)handleDoneButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setSelectedPhonemes:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setVoiceId:(id)a3;
- (void)speakPhonemes:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AXPronunciationSuggestionsViewController

- (AXPronunciationSuggestionsViewController)initWithSuggestions:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    _AXAssert();
  }
  v13.receiver = self;
  v13.super_class = (Class)AXPronunciationSuggestionsViewController;
  v5 = [(AXPronunciationSuggestionsViewController *)&v13 init];
  if (v5)
  {
    v6 = +[NSSet setWithArray:v4];
    v7 = [v6 allObjects];
    [(AXPronunciationSuggestionsViewController *)v5 setSuggestions:v7];

    id v8 = objc_alloc_init((Class)TTSSpeechManager);
    [(AXPronunciationSuggestionsViewController *)v5 setSpeechManager:v8];

    v9 = [(AXPronunciationSuggestionsViewController *)v5 speechManager];
    [v9 setUsesAuxiliarySession:1];

    v10 = [(AXPronunciationSuggestionsViewController *)v5 speechManager];
    v11 = [v10 audioSession];
    [v11 setCategory:AVAudioSessionCategoryVoiceOver withOptions:2 error:0];
  }
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AXPronunciationSuggestionsViewController;
  [(AXPronunciationSuggestionsViewController *)&v12 viewWillAppear:a3];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"handleCancelButtonTapped:"];
  v5 = [(AXPronunciationSuggestionsViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];

  v6 = [(AXPronunciationSuggestionsViewController *)self navigationItem];
  v7 = [v6 leftBarButtonItem];
  [v7 setEnabled:1];

  id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"handleDoneButtonTapped:"];
  v9 = [(AXPronunciationSuggestionsViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  v10 = [(AXPronunciationSuggestionsViewController *)self navigationItem];
  v11 = [v10 rightBarButtonItem];
  [v11 setEnabled:1];
}

- (void)cleanupSynthesizer
{
  v3 = [(AXPronunciationSuggestionsViewController *)self speechManager];
  [v3 stopSpeaking];

  id v4 = [(AXPronunciationSuggestionsViewController *)self speechManager];
  [v4 tearDown];

  [(AXPronunciationSuggestionsViewController *)self setSpeechManager:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXPronunciationSuggestionsViewController;
  [(AXPronunciationSuggestionsViewController *)&v4 viewWillDisappear:a3];
  [(AXPronunciationSuggestionsViewController *)self cleanupSynthesizer];
}

- (void)dealloc
{
  [(AXPronunciationSuggestionsViewController *)self cleanupSynthesizer];
  v3.receiver = self;
  v3.super_class = (Class)AXPronunciationSuggestionsViewController;
  [(AXPronunciationSuggestionsViewController *)&v3 dealloc];
}

- (id)specifiers
{
  objc_super v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v15 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v14 = +[PSSpecifier emptyGroupSpecifier];
    objc_msgSend(v4, "addObject:");
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = [(AXPronunciationSuggestionsViewController *)self suggestions];
    id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      uint64_t v8 = PSEnabledKey;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(id *)(*((void *)&v17 + 1) + 8 * (void)v9);
          v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:-1 edit:0];
          [v11 setObject:v10 forKeyedSubscript:@"phonemes"];
          [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:v8];
          [v4 addObject:v11];

          v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    objc_super v12 = *(void **)&self->AXUISettingsBaseListController_opaque[v15];
    *(void *)&self->AXUISettingsBaseListController_opaque[v15] = v4;

    objc_super v3 = *(void **)&self->AXUISettingsBaseListController_opaque[v15];
  }

  return v3;
}

- (void)speakPhonemes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)TTSSpeechAction);
  [v5 setShouldQueue:1];
  id v6 = [(AXPronunciationSuggestionsViewController *)self language];
  [v5 setLanguage:v6];

  uint64_t v7 = [(AXPronunciationSuggestionsViewController *)self voiceId];
  [v5 setVoiceIdentifier:v7];

  id v8 = objc_alloc((Class)NSAttributedString);
  objc_super v12 = AVSpeechSynthesisIPANotationAttribute;
  id v13 = v4;
  v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  id v10 = [v8 initWithString:@"_" attributes:v9];
  [v5 setAttributedString:v10];
  v11 = [(AXPronunciationSuggestionsViewController *)self speechManager];
  [v11 dispatchSpeechAction:v5];
}

- (void)handleCancelButtonTapped:(id)a3
{
  id v4 = [(AXPronunciationSuggestionsViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AXPronunciationSuggestionsViewController *)self delegate];
    [v6 pronunciationSuggestionsViewController:self didSelectPhonemes:0];
  }
}

- (void)handleDoneButtonTapped:(id)a3
{
  id v4 = [(AXPronunciationSuggestionsViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(AXPronunciationSuggestionsViewController *)self delegate];
    id v6 = [(AXPronunciationSuggestionsViewController *)self selectedPhonemes];
    [v7 pronunciationSuggestionsViewController:self didSelectPhonemes:v6];
  }
}

- (void)handleBackButtonTapped:(id)a3
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)AXPronunciationSuggestionsViewController;
  id v6 = a4;
  [(AXPronunciationSuggestionsViewController *)&v13 tableView:a3 didSelectRowAtIndexPath:v6];
  -[AXPronunciationSuggestionsViewController updateTableCheckedSelection:](self, "updateTableCheckedSelection:", v6, v13.receiver, v13.super_class);
  id v7 = [(AXPronunciationSuggestionsViewController *)self specifierForIndexPath:v6];

  id v8 = [v7 objectForKeyedSubscript:@"phonemes"];
  [(AXPronunciationSuggestionsViewController *)self setSelectedPhonemes:v8];

  v9 = [(AXPronunciationSuggestionsViewController *)self selectedPhonemes];
  [(AXPronunciationSuggestionsViewController *)self speakPhonemes:v9];

  id v10 = [(AXPronunciationSuggestionsViewController *)self cellForSpecifier:v7];
  [v10 setAccessoryType:3];
  v11 = [(AXPronunciationSuggestionsViewController *)self navigationItem];
  objc_super v12 = [v11 rightBarButtonItem];
  [v12 setEnabled:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = [(AXPronunciationSuggestionsViewController *)self specifierForIndexPath:a5];
  v9 = [v8 objectForKeyedSubscript:@"phonemes"];
  id v10 = [(AXPronunciationSuggestionsViewController *)self specifier];
  v11 = [v10 name];
  objc_super v12 = +[AXAttributedString axAttributedStringWithString:v11];

  NSAttributedStringKey v16 = UIAccessibilitySpeechAttributeIPANotation;
  long long v17 = v9;
  objc_super v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [v12 setAttributes:v13];

  [v7 setAccessibilityLabel:v12];
  v14 = [(AXPronunciationSuggestionsViewController *)self selectedPhonemes];
  LODWORD(v13) = [v9 isEqualToString:v14];

  if (v13) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [v7 setAccessoryType:v15];
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)voiceId
{
  return self->_voiceId;
}

- (void)setVoiceId:(id)a3
{
}

- (AXPronunciationSuggestionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXPronunciationSuggestionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (NSString)selectedPhonemes
{
  return self->_selectedPhonemes;
}

- (void)setSelectedPhonemes:(id)a3
{
}

- (TTSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_selectedPhonemes, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_voiceId, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

@end