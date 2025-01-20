@interface SRSuggestionsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isShowingGuide;
- (BOOL)isShowingUserNudge;
- (BOOL)suggestionsViewIsInTextInputMode:(id)a3;
- (SRSuggestionsViewControllerDelegate)delegate;
- (double)contentWidthForSuggestionsView:(id)a3;
- (double)statusBarHeightForSuggestionsView:(id)a3;
- (double)statusViewHeightForSuggestionsView:(id)a3;
- (id)_initialHeaderText;
- (id)_nudgeHeaderText;
- (void)_createGuideController;
- (void)_showHeaderText:(id)a3 subheaderText:(id)a4 largeSubheaderText:(id)a5;
- (void)animateOut;
- (void)didShowSuggestionsForSuggestionsView:(id)a3;
- (void)hideAcousticIDSpinner;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)showAcousticIDSpinner;
- (void)showEmptyView;
- (void)showGreeting;
- (void)showUnavailable;
- (void)showUserNudge;
- (void)suggestionsView:(id)a3 didHideVibrantView:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SRSuggestionsViewController

- (void)loadView
{
  id v4 = [objc_alloc((Class)SiriUISuggestionsView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v4 setAutoresizingMask:18];
  [v4 setDelegate:self];
  [(SRSuggestionsViewController *)self setView:v4];
  v3 = [(SRSuggestionsViewController *)self view];
  [v3 setHidden:1];
}

- (id)_initialHeaderText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = objc_alloc((Class)SiriUISuggestionsHeaderText);
  id v4 = [v2 assistantUILocalizedStringForKey:@"ASSISTANT_INITIAL_QUERY_REGULAR" table:0];
  v5 = [v2 assistantUILocalizedStringForKey:@"ASSISTANT_INITIAL_QUERY_COMPACT" table:0];
  id v6 = [v3 initWithRegularString:v4 compactString:v5];

  return v6;
}

- (id)_nudgeHeaderText
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = objc_alloc((Class)SiriUISuggestionsHeaderText);
  id v4 = [v2 assistantUILocalizedStringForKey:@"ASSISTANT_LISTENING_NUDGE_REGULAR" table:0];
  v5 = [v2 assistantUILocalizedStringForKey:@"ASSISTANT_LISTENING_NUDGE_COMPACT" table:0];
  id v6 = [v3 initWithRegularString:v4 compactString:v5];

  return v6;
}

- (void)showUnavailable
{
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = objc_alloc((Class)SiriUISuggestionsHeaderText);
  id v4 = [v9 assistantUILocalizedStringForKey:@"ASSISTANT_NOT_AVAILABLE_TITLE" table:0];
  id v5 = [v3 initWithRegularString:v4 compactString:0];

  id v6 = objc_alloc((Class)SiriUISuggestionsHeaderText);
  v7 = [v9 assistantUILocalizedStringForKey:@"ASSISTANT_NO_NETWORK_SUBTITLE" table:0];
  id v8 = [v6 initWithRegularString:v7 compactString:0];

  [v5 setTextAlignment:1];
  [v8 setTextAlignment:1];
  [(SRSuggestionsViewController *)self _showHeaderText:v5 subheaderText:v8 largeSubheaderText:0];
}

- (void)showGreeting
{
  id v3 = [(SRSuggestionsViewController *)self _initialHeaderText];
  [(SRSuggestionsViewController *)self _showHeaderText:v3 subheaderText:0 largeSubheaderText:0];

  id v4 = [(SRSuggestionsViewController *)self view];
  [v4 clearCurrentSuggestions];

  id v5 = (void *)UIApp;
  uint64_t v6 = SUICPPTTestNameSiriBringupToInitialQuery;

  [v5 finishedIPTest:v6];
}

- (void)showUserNudge
{
  id v3 = [(SRSuggestionsViewController *)self _nudgeHeaderText];
  [(SRSuggestionsViewController *)self _showHeaderText:v3 subheaderText:0 largeSubheaderText:0];

  id v4 = [(SRSuggestionsViewController *)self view];
  [v4 setGuideHidden:1];
}

- (BOOL)isShowingUserNudge
{
  id v3 = [(SRSuggestionsViewController *)self view];
  id v4 = [v3 headerText];
  id v5 = [v4 regularString];
  uint64_t v6 = [(SRSuggestionsViewController *)self _nudgeHeaderText];
  v7 = [v6 regularString];
  unsigned __int8 v8 = [v5 isEqualToString:v7];

  return v8;
}

- (void)showEmptyView
{
  [(SRSuggestionsViewController *)self _showHeaderText:0 subheaderText:0 largeSubheaderText:0];
  id v3 = [(SRSuggestionsViewController *)self view];
  [v3 setGuideHidden:1];
}

- (void)_showHeaderText:(id)a3 subheaderText:(id)a4 largeSubheaderText:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(SRSuggestionsViewController *)self view];
  [v11 setHidden:0];

  v12 = [(SRSuggestionsViewController *)self view];
  [v12 setSubheaderText:v9];

  v13 = [(SRSuggestionsViewController *)self view];
  [v13 setLargeSubheaderText:v8];

  v14 = [(SRSuggestionsViewController *)self view];
  [v14 setHeaderText:v10];

  id v15 = [(SRSuggestionsViewController *)self view];
  [v15 setGuideHidden:1 animated:1];
}

- (void)showAcousticIDSpinner
{
  id v2 = [(SRSuggestionsViewController *)self view];
  [v2 showAcousticIDSpinner];
}

- (void)hideAcousticIDSpinner
{
  id v2 = [(SRSuggestionsViewController *)self view];
  [v2 hideAcousticIDSpinner];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRSuggestionsViewController;
  [(SRSuggestionsViewController *)&v6 viewWillAppear:a3];
  id v4 = [(SRSuggestionsViewController *)self view];
  [v4 setOrientation:[UIApp statusBarOrientation]];

  id v5 = [(SRSuggestionsViewController *)self view];
  [v5 setNeedsLayout];
}

- (BOOL)isShowingGuide
{
  id v2 = [(SRSuggestionsViewController *)self view];
  char v3 = [v2 isGuideHidden] ^ 1;

  return v3;
}

- (void)animateOut
{
  [(SRSuggestionsViewController *)self view];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001E5D8;
  v3[3] = &unk_100142E88;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = v4;
  [v2 animateOutWithCompletion:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SRSuggestionsViewController;
  -[SRSuggestionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  id v5 = [(SRSuggestionsViewController *)self view];
  [v5 setOrientation:[UIApp statusBarOrientation]];
}

- (void)_createGuideController
{
  id v8 = [objc_alloc((Class)AFUISiriLanguage) initWithDelegate:0];
  id v3 = objc_alloc((Class)AFConversation);
  id v4 = [v8 spokenLanguageCode];
  id v5 = (AFConversation *)[v3 initWithLanguageCode:v4];
  conversation = self->_conversation;
  self->_conversation = v5;

  [(AFConversation *)self->_conversation setDelegate:self];
  id v7 = objc_alloc_init((Class)SAUIShowHelp);
  [(AFConversation *)self->_conversation addItemsForShowHelpCommand:v7];
}

- (void)didShowSuggestionsForSuggestionsView:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 suggestionsViewDidShowSuggestions:self];
  }
}

- (double)statusBarHeightForSuggestionsView:(id)a3
{
  id v4 = [(SRSuggestionsViewController *)self delegate];
  [v4 statusBarFrameForSuggestionsViewController:self];
  double MaxY = CGRectGetMaxY(v7);

  return MaxY;
}

- (double)statusViewHeightForSuggestionsView:(id)a3
{
  id v4 = [(SRSuggestionsViewController *)self delegate];
  [v4 statusViewHeightForSuggestionsViewController:self];
  double v6 = v5;

  return v6;
}

- (void)suggestionsView:(id)a3 didHideVibrantView:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 suggestionsViewController:self didHideVibrantView:v8];
  }
}

- (double)contentWidthForSuggestionsView:(id)a3
{
  id v4 = [(SRSuggestionsViewController *)self delegate];
  [v4 contentWidthForSuggestionsViewController:self];
  double v6 = v5;

  return v6;
}

- (BOOL)suggestionsViewIsInTextInputMode:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  unsigned __int8 v8 = [v7 inTextInputModeForSuggestionsViewController:self];

  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (SRSuggestionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SRSuggestionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end