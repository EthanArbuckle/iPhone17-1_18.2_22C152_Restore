@interface SRCompactTextRequestViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsCancellation;
- (SRCompactTextRequestView)_textRequestView;
- (SRCompactTextRequestViewControllerDelegate)delegate;
- (void)loadView;
- (void)setAllowsCancellation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)textRequestView:(id)a3 didChangeTextFieldText:(id)a4;
- (void)textRequestView:(id)a3 didEnableSuggestions:(BOOL)a4;
- (void)textRequestView:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)textRequestView:(id)a3 siriRequestCommittedWithText:(id)a4;
- (void)textRequestViewDidEndEditing:(id)a3;
- (void)textRequestViewDidEndTextEditMenuInteraction:(id)a3;
- (void)textRequestViewRequestsVoiceActivation:(id)a3;
- (void)textRequestViewWillBeginEditing:(id)a3;
- (void)textRequestViewWillBeginTextEditMenuInteraction:(id)a3;
@end

@implementation SRCompactTextRequestViewController

- (SRCompactTextRequestView)_textRequestView
{
  textRequestView = self->_textRequestView;
  if (!textRequestView)
  {
    v4 = objc_alloc_init(SRCompactTextRequestView);
    v5 = self->_textRequestView;
    self->_textRequestView = v4;

    [(SRCompactTextRequestView *)self->_textRequestView setDelegate:self];
    textRequestView = self->_textRequestView;
  }

  return textRequestView;
}

- (BOOL)allowsCancellation
{
  v2 = [(SRCompactTextRequestViewController *)self _textRequestView];
  unsigned __int8 v3 = [v2 allowsCancellation];

  return v3;
}

- (void)setAllowsCancellation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SRCompactTextRequestViewController *)self _textRequestView];
  [v4 setAllowsCancellation:v3];
}

- (void)loadView
{
  id v3 = [(SRCompactTextRequestViewController *)self _textRequestView];
  [(SRCompactTextRequestViewController *)self setView:v3];
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (void)textRequestView:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactTextRequestViewController *)self delegate];
  [v6 textRequestController:self requestsKeyboardWithCompletion:v5];
}

- (void)textRequestViewWillBeginEditing:(id)a3
{
  id v4 = [(SRCompactTextRequestViewController *)self delegate];
  [v4 textRequestControllerWillBeginEditing:self];
}

- (void)textRequestViewDidEndEditing:(id)a3
{
  id v4 = [(SRCompactTextRequestViewController *)self delegate];
  [v4 textRequestControllerDidEndEditing:self];
}

- (void)textRequestViewWillBeginTextEditMenuInteraction:(id)a3
{
  id v4 = [(SRCompactTextRequestViewController *)self delegate];
  [v4 textRequestControllerWillBeginTextEditMenuInteraction:self];
}

- (void)textRequestViewDidEndTextEditMenuInteraction:(id)a3
{
  id v4 = [(SRCompactTextRequestViewController *)self delegate];
  [v4 textRequestControllerDidEndTextEditMenuInteraction:self];
}

- (void)textRequestView:(id)a3 siriRequestCommittedWithText:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactTextRequestViewController *)self delegate];
  [v6 textRequestController:self siriRequestCommittedWithText:v5];
}

- (void)textRequestView:(id)a3 didChangeTextFieldText:(id)a4
{
  id v8 = a4;
  id v5 = [(SRCompactTextRequestViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(SRCompactTextRequestViewController *)self delegate];
    [v7 textRequestController:self didChangeText:v8];
  }
}

- (void)textRequestView:(id)a3 didEnableSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = [(SRCompactTextRequestViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SRCompactTextRequestViewController *)self delegate];
    [v8 textRequestController:self didEnableSuggestions:v4];
  }
}

- (void)textRequestViewRequestsVoiceActivation:(id)a3
{
  id v4 = [(SRCompactTextRequestViewController *)self delegate];
  [v4 textRequestControllerRequestsVoiceActivation:self];
}

- (SRCompactTextRequestViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SRCompactTextRequestViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_textRequestView, 0);
}

@end