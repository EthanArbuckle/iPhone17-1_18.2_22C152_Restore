@interface SRCompactEditableUtterancePresenter
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (SRCompactEditableUtterancePresenter)initWithUserEditingDataManager:(id)a3 delegate:(id)a4;
- (id)attributedStringAtIndex:(int64_t)a3;
- (int64_t)numberOfAlternativeUtterances;
- (void)_editableUtteranceViewControllerDidDismiss:(id)a3;
- (void)_editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:(id)a3;
- (void)didResignFirstResponderFromUtteranceViewController:(id)a3;
- (void)dismissEditableUtteranceViewControllerAndShouldStartNewRequest:(BOOL)a3 completion:(id)a4;
- (void)editableUtteranceViewController:(id)a3 alternativeSelectedAtIndex:(int64_t)a4;
- (void)editableUtteranceViewController:(id)a3 didFinishEditingWithText:(id)a4;
- (void)editableUtteranceViewController:(id)a3 openURL:(id)a4;
- (void)editableUtteranceViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)presentUtteranceViewControllerFromViewController:(id)a3 animateAlongsideTransition:(id)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 fromViewController:(id)a4 animateAlongsideTransition:(id)a5 completion:(id)a6;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)willBeginEditingFromUtteranceViewController:(id)a3;
@end

@implementation SRCompactEditableUtterancePresenter

- (SRCompactEditableUtterancePresenter)initWithUserEditingDataManager:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SRCompactEditableUtterancePresenter;
  v9 = [(SRCompactEditableUtterancePresenter *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_userUtteranceEditingDataManager, a3);
    v11 = [SRCompactEditableUtteranceViewController alloc];
    v12 = [(SiriSharedUIUserUtteranceEditingDataManaging *)v10->_userUtteranceEditingDataManager userUtterance];
    v13 = [(SRCompactEditableUtteranceViewController *)v11 initWithUserUtterance:v12 delegate:v10 dataSource:v10];
    editableUtteranceViewController = v10->_editableUtteranceViewController;
    v10->_editableUtteranceViewController = &v13->super;
  }
  return v10;
}

- (void)presentUtteranceViewControllerFromViewController:(id)a3 animateAlongsideTransition:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[SRCompactEditableUtterancePresenter presentUtteranceViewControllerFromViewController:animateAlongsideTransit"
          "ion:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #compact: presentingEditableUtteranceViewController", (uint8_t *)&v12, 0xCu);
  }
  [(SRCompactEditableUtterancePresenter *)self presentViewController:self->_editableUtteranceViewController fromViewController:v8 animateAlongsideTransition:v9 completion:v10];
}

- (void)dismissEditableUtteranceViewControllerAndShouldStartNewRequest:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SRCompactEditableUtterancePresenter dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact: dismissing editableUtteranceViewController", buf, 0xCu);
  }
  self->_shouldStartNewRequest = a3;
  objc_initWeak((id *)buf, self);
  editableUtteranceViewController = self->_editableUtteranceViewController;
  int v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10006C9A8;
  v15 = &unk_100144910;
  objc_copyWeak(&v17, (id *)buf);
  id v9 = v6;
  id v16 = v9;
  [(UIViewController *)editableUtteranceViewController dismissViewControllerAnimated:1 completion:&v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = [(UIViewController *)self->_editableUtteranceViewController transitionCoordinator];
  [WeakRetained willDismissEditableUtterancePresenter:self transitionCoordinator:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  return self->_editableUtteranceViewController && self->_editableUtteranceViewControllerIsPresented;
}

- (id)attributedStringAtIndex:(int64_t)a3
{
  return [(SiriSharedUIUserUtteranceEditingDataManaging *)self->_userUtteranceEditingDataManager attributedStringAtIndex:a3];
}

- (int64_t)numberOfAlternativeUtterances
{
  return (int64_t)[(SiriSharedUIUserUtteranceEditingDataManaging *)self->_userUtteranceEditingDataManager numberOfAlternativeUtterances];
}

- (void)didResignFirstResponderFromUtteranceViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didResignFirstResponderFromUtterancePresenter:self];
}

- (void)editableUtteranceViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained editableUtterancePresenter:self requestsKeyboardWithCompletion:v6];
}

- (void)willBeginEditingFromUtteranceViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained willBeginEditingFromUtterancePresenter:self];
}

- (void)editableUtteranceViewController:(id)a3 alternativeSelectedAtIndex:(int64_t)a4
{
  id v6 = [(SRCompactEditableUtterancePresenter *)self attributedStringAtIndex:a4];
  id v10 = [v6 string];

  id v7 = [(SiriSharedUIUserUtteranceEditingDataManaging *)self->_userUtteranceEditingDataManager selectionResultsForAlternateTextAtIndex:a4];
  LODWORD(v6) = [(SiriSharedUIUserUtteranceEditingDataManaging *)self->_userUtteranceEditingDataManager isEditedTextSameAsUtterance:v10];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = v6 ^ 1;
  [WeakRetained editableUtterancePresenter:self didFinishEditingWithText:v10 selectionResults:v7 shouldStartNewRequest:v9];

  [(SRCompactEditableUtterancePresenter *)self dismissEditableUtteranceViewControllerAndShouldStartNewRequest:v9 completion:0];
}

- (void)editableUtteranceViewController:(id)a3 didFinishEditingWithText:(id)a4
{
  userUtteranceEditingDataManager = self->_userUtteranceEditingDataManager;
  id v6 = a4;
  id v9 = [(SiriSharedUIUserUtteranceEditingDataManaging *)userUtteranceEditingDataManager selectionResultsForEditedText:v6];
  LODWORD(userUtteranceEditingDataManager) = [(SiriSharedUIUserUtteranceEditingDataManaging *)self->_userUtteranceEditingDataManager isEditedTextSameAsUtterance:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = userUtteranceEditingDataManager ^ 1;
  [WeakRetained editableUtterancePresenter:self didFinishEditingWithText:v6 selectionResults:v9 shouldStartNewRequest:v8];

  [(SRCompactEditableUtterancePresenter *)self dismissEditableUtteranceViewControllerAndShouldStartNewRequest:v8 completion:0];
}

- (void)editableUtteranceViewController:(id)a3 openURL:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained editableUtterancePresenter:self openURL:v6];
}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 animateAlongsideTransition:(id)a5 completion:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v20 setModalPresentationStyle:2];
  [v20 setModalPresentationCapturesStatusBarAppearance:1];
  [v20 setNeedsStatusBarAppearanceUpdate];
  uint64_t v13 = [v10 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v15 = [v10 view];
    id v16 = [v15 window];
    id v17 = [v16 _rootSheetPresentationController];

    [(SRCompactEditableUtterancePresenter *)self _editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:v17];
    [v10 presentViewController:v20 animated:1 completion:0];
    v18 = [v20 presentationController];
    [v18 setDelegate:self];

    v19 = [v20 transitionCoordinator];
    [v19 animateAlongsideTransition:v11 completion:v12];
  }
}

- (void)_editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:(id)a3
{
  self->_editableUtteranceViewControllerIsPresented = 1;
  p_sheetPresentationController = &self->_sheetPresentationController;
  id v8 = a3;
  id v5 = objc_storeWeak((id *)p_sheetPresentationController, v8);
  unsigned __int8 v6 = [v8 _shouldScaleDownBehindDescendantSheets];

  self->_previousShouldScaleDownBehindDescendantSheetsValue = v6;
  id WeakRetained = objc_loadWeakRetained((id *)p_sheetPresentationController);
  [WeakRetained _setShouldScaleDownBehindDescendantSheets:0];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = [(UIViewController *)self->_editableUtteranceViewController transitionCoordinator];
  [WeakRetained willDismissEditableUtterancePresenter:self transitionCoordinator:v4];
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)_editableUtteranceViewControllerDidDismiss:(id)a3
{
  p_sheetPresentationController = &self->_sheetPresentationController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sheetPresentationController);
  [WeakRetained _setShouldScaleDownBehindDescendantSheets:self->_previousShouldScaleDownBehindDescendantSheetsValue];

  self->_previousShouldScaleDownBehindDescendantSheetsValue = 0;
  objc_storeWeak((id *)p_sheetPresentationController, 0);
  self->_editableUtteranceViewControllerIsPresented = 0;
  editableUtteranceViewController = self->_editableUtteranceViewController;
  self->_editableUtteranceViewController = 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sheetPresentationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editableUtteranceViewController, 0);

  objc_storeStrong((id *)&self->_userUtteranceEditingDataManager, 0);
}

@end