@interface SRUserUtteranceViewController
- (AFUserUtterance)_userUtterance;
- (BOOL)editableTextViewTextShouldPreventCorrection:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSString)description;
- (double)_insertionAnimatedZPosition;
- (double)_scaledPaddingForPadding:(double)a3;
- (double)baselineOffsetFromBottom;
- (double)desiredHeightForWidth:(double)a3;
- (double)desiredPinnedTopPadding;
- (id)_correctionIdentifier;
- (id)_processUserUtterance:(id)a3 isCombined:(BOOL)a4 displayedText:(id)a5 withScore:(BOOL)a6;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)speechAlternativeHighlightListWithScore:(BOOL)a3;
- (id)userSelectionResults:(id)a3;
- (int64_t)_insertionAnimation;
- (int64_t)_pinAnimationType;
- (int64_t)_replacementAnimation;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_checkUpdatedSizingForEditableTextView:(id)a3;
- (void)_createSpeechAlternativeViewsIfNecessary;
- (void)_hideEditableUtteranceView;
- (void)_setUserUtterance:(id)a3;
- (void)_updateViewWithChangeUtteranceIfNeeded:(id)a3;
- (void)_updateViewWithUserUtterance:(id)a3;
- (void)_utteranceViewDidSelect:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)createEditableUtteranceView;
- (void)createViewArray;
- (void)editableTextViewRequestKeyboardForTapToEditWithCompletion:(id)a3;
- (void)editableTextViewTextDidChange:(id)a3;
- (void)editableTextViewTextDidFinishCorrecting:(id)a3;
- (void)editableTextViewTextDidResignFirstResponder:(id)a3;
- (void)editableTextViewTextWillBeginCorrecting:(id)a3;
- (void)endEditingAndCorrect:(BOOL)a3;
- (void)endEditingAndCorrectByTouchPoint:(CGPoint)a3;
- (void)handleAceCommand:(id)a3;
- (void)handleChangeUtteranceCommand:(id)a3;
- (void)handleSelectRow:(int64_t)a3;
- (void)handleShowSpeechAlternativesCommand:(id)a3;
- (void)loadView;
- (void)removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary;
- (void)removeSpeechAlternatives;
- (void)restoreOriginalEditTextContents:(id)a3;
- (void)setAceObject:(id)a3;
- (void)setTurnIdentifier:(id)a3;
- (void)setUtteranceUserInteractionEnabled:(BOOL)a3;
- (void)siriDidDeactivate;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SRUserUtteranceViewController

- (void)loadView
{
  if (!self->_utteranceView)
  {
    v3 = -[SRUserUtteranceView initWithFrame:]([SRUserUtteranceView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    utteranceView = self->_utteranceView;
    self->_utteranceView = v3;

    [(SRUserUtteranceView *)self->_utteranceView setEditable:1];
    v5 = [(SRUserUtteranceViewController *)self _userUtterance];
    [(SRUserUtteranceViewController *)self _updateViewWithUserUtterance:v5];

    v6 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_utteranceViewDidSelect:"];
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v6;

    [(SRUserUtteranceView *)self->_utteranceView addGestureRecognizer:self->_tapRecognizer];
    v8 = objc_alloc_init(SRUserUtteranceContainerView);
    containerView = self->_containerView;
    self->_containerView = v8;

    [(SRUserUtteranceContainerView *)self->_containerView addSubview:self->_utteranceView];
    [(SRUserUtteranceContainerView *)self->_containerView setDisplayView:self->_utteranceView];
    v10 = self->_containerView;
    [(SRUserUtteranceViewController *)self setView:v10];
  }
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SRUserUtteranceViewController;
  [(SRUserUtteranceViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(SRUserUtteranceViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (self->_previousBounds.size.width != v9 || self->_previousBounds.size.height != v11)
  {
    if (self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews)
    {
      v13 = [(UICollectionView *)self->_speechAlternativeCollectionView collectionViewLayout];
      [v13 invalidateLayout];
    }
    self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 1;
    self->_previousBounds.origin.x = v5;
    self->_previousBounds.origin.y = v7;
    self->_previousBounds.size.width = v9;
    self->_previousBounds.size.height = v11;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = [(SRUserUtteranceViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  if (v10 != width || v12 != height)
  {
    self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 0;
    objc_super v14 = [(UICollectionView *)self->_speechAlternativeCollectionView collectionViewLayout];
    [v14 invalidateLayout];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100034C18;
    block[3] = &unk_100142E88;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v15.receiver = self;
  v15.super_class = (Class)SRUserUtteranceViewController;
  -[SRUserUtteranceViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SRUserUtteranceViewController;
  [(SRUserUtteranceViewController *)&v15 viewDidLayoutSubviews];
  [(SRUserUtteranceView *)self->_utteranceView frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  if (self->_oldUtteranceViewSize.width != v3 || self->_oldUtteranceViewSize.height != v4)
  {
    CGFloat v10 = v3;
    CGFloat v11 = v4;
    double v12 = [(SRUserUtteranceViewController *)self delegate];
    [v12 siriViewControllerHeightDidChange:self];

    v16.origin.x = v6;
    v16.origin.y = v8;
    v16.size.double width = v10;
    v16.size.double height = v11;
    CGFloat Width = CGRectGetWidth(v16);
    v17.origin.x = v6;
    v17.origin.y = v8;
    v17.size.double width = v10;
    v17.size.double height = v11;
    CGFloat Height = CGRectGetHeight(v17);
    self->_oldUtteranceViewSize.double width = Width;
    self->_oldUtteranceViewSize.double height = Height;
  }
}

- (void)_updateViewWithUserUtterance:(id)a3
{
  utteranceView = self->_utteranceView;
  id v5 = a3;
  CGFloat v6 = [v5 bestTextInterpretation];
  [(SRUserUtteranceView *)utteranceView setText:v6];

  id v9 = [v5 allPhrases];

  if (v9)
  {
    self->_changeUtteranceShouldDisplay = 1;
    self->_receivedFinalRecognitionResult = 1;
    [(SRUserUtteranceViewController *)self _updateViewWithChangeUtteranceIfNeeded:self->_changeUtteranceCommand];
    if (self->_editableUtteranceView)
    {
      double v7 = [(SRUserUtteranceViewController *)self _userUtterance];
      [(SRUserUtteranceViewController *)self restoreOriginalEditTextContents:v7];
    }
    else
    {
      [(SRUserUtteranceViewController *)self createEditableUtteranceView];
    }
    [(SRUserUtteranceView *)self->_utteranceView setBlendEffectEnabled:1];
    CGFloat v8 = [(SRUserUtteranceViewController *)self delegate];
    [v8 siriViewControllerHeightDidChange:self];
  }
}

- (void)_updateViewWithChangeUtteranceIfNeeded:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_changeUtteranceShouldDisplay)
    {
      id v10 = v4;
      uint64_t v5 = (uint64_t)[v4 utteranceIndex];
      id v4 = v10;
      if (v5 >= 1)
      {
        CGFloat v6 = [(SRUserUtteranceViewController *)self _userUtterance];
        id v7 = [v6 numberOfAlternativeUtterances];

        id v4 = v10;
        if (v5 < (uint64_t)v7)
        {
          CGFloat v8 = [(SRUserUtteranceViewController *)self _userUtterance];
          id v9 = [v8 textOfUtteranceAtIndex:v5];

          [(SRUserUtteranceView *)self->_utteranceView setText:v9];
          id v4 = v10;
        }
      }
    }
  }
}

- (void)setUtteranceUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SRUserUtteranceViewController;
  -[SRUserUtteranceViewController setUtteranceUserInteractionEnabled:](&v8, "setUtteranceUserInteractionEnabled:");
  BOOL v5 = !v3;
  [(SRUserUtteranceView *)self->_utteranceView setChevronHidden:v5];
  utteranceView = self->_utteranceView;
  tapRecognizer = self->_tapRecognizer;
  if (v5) {
    [(SRUserUtteranceView *)utteranceView removeGestureRecognizer:tapRecognizer];
  }
  else {
    [(SRUserUtteranceView *)utteranceView addGestureRecognizer:tapRecognizer];
  }
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)SRUserUtteranceViewController;
  BOOL v3 = [(SRUserUtteranceViewController *)&v7 description];
  id v4 = [(SRUserUtteranceViewController *)self _userUtterance];
  BOOL v5 = [v3 stringByAppendingFormat:@"%@", v4];

  return (NSString *)v5;
}

- (void)_setUserUtterance:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v8 = v5;
    id v7 = [(SRUserUtteranceViewController *)self _userUtterance];

    id v6 = v8;
    if (v7 != v8)
    {
      self->_forceBestTextInterpretation = 0;
      [(SRUserUtteranceViewController *)self _updateViewWithUserUtterance:v8];
      objc_storeStrong((id *)&self->_userUtterance, a3);
      id v6 = v8;
    }
  }

  _objc_release_x1(v5, v6);
}

- (id)_correctionIdentifier
{
  v2 = [(SRUserUtteranceViewController *)self _userUtterance];
  BOOL v3 = [v2 correctionIdentifier];

  return v3;
}

- (double)desiredHeightForWidth:(double)a3
{
  self->_latestGivenCGFloat Width = a3;
  if (self->_showSpeechAlternativeList) {
    [(SiriUICollectionViewFlowLayout *)self->_speechAlternativeCollectionViewLayout collectionViewContentSize];
  }
  else {
    -[SRUserUtteranceView sizeThatFits:](self->_utteranceView, "sizeThatFits:");
  }
  return v3;
}

- (void)removeSpeechAlternatives
{
  speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
  self->_speechAlternativeDisplayList = (NSArray *)&__NSArray0__struct;

  [(NSMutableArray *)self->_speechAlternativeList removeAllObjects];
  [(SRUserUtteranceViewController *)self createViewArray];
  [(UICollectionView *)self->_speechAlternativeCollectionView reloadData];
  speechAlternativeCollectionView = self->_speechAlternativeCollectionView;
  uint64_t v5 = SiriLanguageSemanticContentAttribute();

  [(UICollectionView *)speechAlternativeCollectionView recursive_setSemanticContentAttribute:v5];
}

- (void)removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary
{
  self->_showSpeechAlternativeList = 0;
  double v3 = [(SRUserUtteranceViewController *)self delegate];
  [v3 siriViewControllerHeightDidChange:self pinTopOfSnippet:1];

  id v4 = [(SRUserUtteranceViewController *)self _privateDelegate];
  [v4 siriViewControllerRequestToPin:self];

  if (self->_textChanged)
  {
    [(SRUserUtteranceViewController *)self removeSpeechAlternatives];
  }
  else
  {
    uint64_t v5 = [(SRUserUtteranceViewController *)self _userUtterance];
    [(SRUserUtteranceViewController *)self restoreOriginalEditTextContents:v5];

    utteranceView = self->_utteranceView;
    id v7 = [(SREditableTextView *)self->_editableUtteranceView text];
    [(SRUserUtteranceView *)utteranceView setText:v7];
  }
}

- (void)handleAceCommand:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_changeUtteranceCommand, a3);
    [(SRUserUtteranceViewController *)self handleChangeUtteranceCommand:self->_changeUtteranceCommand];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SRUserUtteranceViewController *)self handleShowSpeechAlternativesCommand:v5];
    }
  }
}

- (void)setTurnIdentifier:(id)a3
{
}

- (void)handleShowSpeechAlternativesCommand:(id)a3
{
  id v4 = [(SRUserUtteranceViewController *)self _userUtterance];
  [(SRUserUtteranceViewController *)self restoreOriginalEditTextContents:v4];

  id v5 = [(UICollectionView *)self->_speechAlternativeCollectionView window];

  if (v5)
  {
    editableUtteranceView = self->_editableUtteranceView;
    [(SREditableTextView *)editableUtteranceView beginEditing];
  }
  else
  {
    utteranceView = self->_utteranceView;
    [(SRUserUtteranceViewController *)self _utteranceViewDidSelect:utteranceView];
  }
}

- (void)handleChangeUtteranceCommand:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    v23 = "-[SRUserUtteranceViewController handleChangeUtteranceCommand:]";
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s handleChangeUtteranceCommand: %@", (uint8_t *)&v22, 0x16u);
  }
  if (self->_receivedFinalRecognitionResult)
  {
    changeUtteranceCommand = (SAUIChangePrimaryUtterance *)v4;
    uint64_t v7 = (uint64_t)[(SAUIChangePrimaryUtterance *)changeUtteranceCommand utteranceIndex];
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      id v9 = [(SRUserUtteranceViewController *)self _userUtterance];
      id v10 = [v9 numberOfAlternativeUtterances];

      if (v8 < (uint64_t)v10)
      {
        self->_forceBestTextInterpretation = 1;
        CGFloat v11 = [(SRUserUtteranceViewController *)self _userUtterance];
        double v12 = [v11 dictationResult];

        v13 = [(SRUserUtteranceViewController *)self _userUtterance];
        id v14 = [v13 updateDictationResult:v12 withAlternativeUtteranceAtIndex:v8];

        objc_super v15 = [(SRUserUtteranceViewController *)self speechAlternativeHighlightListWithScore:SiriUIShowSpeechAlternativeScore()];
        speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
        self->_speechAlternativeDisplayList = v15;

        [(SRUserUtteranceViewController *)self createViewArray];
        [(UICollectionView *)self->_speechAlternativeCollectionView reloadData];
        [(UICollectionView *)self->_speechAlternativeCollectionView recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
        utteranceView = self->_utteranceView;
        v18 = [(SREditableTextView *)self->_editableUtteranceView text];
        [(SRUserUtteranceView *)utteranceView setText:v18];

        [(SRUserUtteranceView *)self->_utteranceView setNeedsLayout];
        v19 = [(SRUserUtteranceViewController *)self delegate];
        [v19 siriViewControllerHeightDidChange:self];

        v20 = [(SRUserUtteranceViewController *)self view];
        [v20 setNeedsLayout];
      }
    }
  }
  else
  {
    v21 = (SAUIChangePrimaryUtterance *)v4;
    changeUtteranceCommand = self->_changeUtteranceCommand;
    self->_changeUtteranceCommand = v21;
  }
}

- (void)setAceObject:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SRUserUtteranceViewController;
  [(SRUserUtteranceViewController *)&v24 setAceObject:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 af_userUtteranceValue];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v5 title];
    speechAlternativeListTitle = self->_speechAlternativeListTitle;
    self->_speechAlternativeListTitle = v7;

    if (!self->_speechAlternativeListTitle)
    {
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      id v10 = [v9 siriUILocalizedStringForKey:@"TITLE_FOR_SPEECH_ALTERNATIVE_LIST" table:0];
      id v11 = objc_alloc((Class)NSLocale);
      double v12 = AFUIGetLanguageCode();
      id v13 = [v11 initWithLocaleIdentifier:v12];
      id v14 = [v10 uppercaseStringWithLocale:v13];
      objc_super v15 = self->_speechAlternativeListTitle;
      self->_speechAlternativeListTitle = v14;
    }
    CGRect v16 = +[NSMutableDictionary dictionary];
    alternativeInfoMap = self->_alternativeInfoMap;
    self->_alternativeInfoMap = v16;

    v18 = [v5 sessionId];
    sessionId = self->_sessionId;
    self->_sessionId = v18;

    if (AFIsInternalInstall())
    {
      CFStringRef v25 = @"bestTextInterpretation";
      v20 = [v5 af_bestTextInterpretation];
      v26 = v20;
      v21 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    }
    else
    {
      v21 = 0;
    }
    int v22 = +[AFAnalytics sharedAnalytics];
    [v22 logEventWithType:1507 context:v21];

LABEL_12:
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = 0;
      goto LABEL_13;
    }
    id v5 = [v4 text];
    id v6 = [objc_alloc((Class)AFUserUtterance) initWithString:v5 correctionIdentifier:0];
    goto LABEL_12;
  }
  [v4 af_userUtteranceValue];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  [(SRUserUtteranceViewController *)self _setUserUtterance:v6];
  v23 = [(SRUserUtteranceViewController *)self _userUtterance];
  [(SRUserUtteranceViewController *)self _updateViewWithUserUtterance:v23];
}

- (double)desiredPinnedTopPadding
{
  if (SiriUIIsCompactWidth())
  {
    double v3 = 52.0;
  }
  else
  {
    int v4 = SiriUIIsCompactHeight();
    double v3 = 84.0;
    if (v4) {
      double v3 = 52.0;
    }
  }

  [(SRUserUtteranceViewController *)self _scaledPaddingForPadding:v3];
  return result;
}

- (double)_scaledPaddingForPadding:(double)a3
{
  id v5 = +[UIFont siriui_userUtteranceFont];
  [v5 _scaledValueForValue:a3];
  double v7 = v6;

  [(SRUserUtteranceContainerView *)self->_containerView firstLineBaselineOffsetFromTop];
  return v7 - v8;
}

- (double)baselineOffsetFromBottom
{
  [(SRUserUtteranceContainerView *)self->_containerView baselineOffsetFromBottom];
  return result;
}

- (void)endEditingAndCorrect:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SREditableTextView *)self->_editableUtteranceView window];

  if (v5) {
    [(SREditableTextView *)self->_editableUtteranceView endEditingAndCorrect:v3];
  }
  if (!v3)
  {
    self->_showSpeechAlternativeList = 0;
    [(SRUserUtteranceViewController *)self _hideEditableUtteranceView];
    id v6 = [(SRUserUtteranceViewController *)self _privateDelegate];
    [v6 siriViewControllerRequestTearDownEditingViewController:self];
  }
}

- (void)endEditingAndCorrectByTouchPoint:(CGPoint)a3
{
  int v4 = -[UICollectionView hitTest:withEvent:](self->_speechAlternativeCollectionView, "hitTest:withEvent:", 0, a3.x, a3.y);
  id v5 = v4;
  uint64_t v14 = 0;
  objc_super v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    viewArray = self->_viewArray;
    double v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_100035D00;
    id v11 = &unk_1001437C8;
    id v12 = v4;
    id v13 = &v14;
    [(NSMutableArray *)viewArray enumerateObjectsUsingBlock:&v8];
  }
  double v7 = [(SRUserUtteranceViewController *)self _privateDelegate];
  [v7 siriViewControllerRequestTearDownEditingViewController:self];

  if (v15[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SRUserUtteranceViewController *)self removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary];
    [(SRUserUtteranceViewController *)self _hideEditableUtteranceView];
  }
  else
  {
    -[SRUserUtteranceViewController handleSelectRow:](self, "handleSelectRow:");
  }
  _Block_object_dispose(&v14, 8);
}

- (void)siriDidDeactivate
{
  if ([(SREditableTextView *)self->_editableUtteranceView isFirstResponder])
  {
    [(SRUserUtteranceViewController *)self endEditingAndCorrect:0];
  }
}

- (int64_t)_pinAnimationType
{
  return 1;
}

- (int64_t)_insertionAnimation
{
  return SiriUIIsStreamingDictationEnabled() ^ 1;
}

- (int64_t)_replacementAnimation
{
  if (SiriUIIsStreamingDictationEnabled()) {
    return 0;
  }
  else {
    return 2;
  }
}

- (double)_insertionAnimatedZPosition
{
  +[SRUserUtteranceView insertionAnimatedZPosition];
  return result;
}

- (void)_utteranceViewDidSelect:(id)a3
{
  if (self->_receivedFinalRecognitionResult)
  {
    [(SRUserUtteranceViewController *)self _createSpeechAlternativeViewsIfNecessary];
    self->_showSpeechAlternativeList = 1;
    [(SiriUICollectionViewFlowLayout *)self->_speechAlternativeCollectionViewLayout invalidateLayout];
    [(SREditableTextView *)self->_editableUtteranceView beginEditing];
    containerView = self->_containerView;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100035F50;
    v5[3] = &unk_100142E88;
    v5[4] = self;
    [(SRUserUtteranceContainerView *)containerView animateToEditWithDuration:v5 completion:0.1];
  }
}

- (void)_hideEditableUtteranceView
{
  utteranceView = self->_utteranceView;
  int v4 = [(SREditableTextView *)self->_editableUtteranceView text];
  [(SRUserUtteranceView *)utteranceView setText:v4];

  containerView = self->_containerView;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003607C;
  v6[3] = &unk_100142E88;
  v6[4] = self;
  [(SRUserUtteranceContainerView *)containerView animateToDisplayWithDuration:v6 completion:0.1];
}

- (void)createEditableUtteranceView
{
  if (!self->_editableUtteranceView)
  {
    BOOL v3 = -[SREditableTextView initWithFrame:presentationStyle:]([SREditableTextView alloc], "initWithFrame:presentationStyle:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    editableUtteranceView = self->_editableUtteranceView;
    self->_editableUtteranceView = v3;

    if (SiriLanguageIsRTL()) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
    [(SREditableTextView *)self->_editableUtteranceView setTextAlignment:v5];
    [(SREditableTextView *)self->_editableUtteranceView setDelegate:self];
    [(SREditableTextView *)self->_editableUtteranceView setAutoresizingMask:18];
    id v6 = [(SRUserUtteranceViewController *)self _userUtterance];
    [(SRUserUtteranceViewController *)self restoreOriginalEditTextContents:v6];
  }
}

- (BOOL)editableTextViewTextShouldPreventCorrection:(id)a3
{
  BOOL v3 = self;
  int v4 = [(SRUserUtteranceViewController *)self _privateDelegate];
  LOBYTE(v3) = [v4 siriViewControllerShouldPreventUserInteraction:v3];

  return (char)v3;
}

- (void)editableTextViewRequestKeyboardForTapToEditWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SRUserUtteranceViewController *)self _privateDelegate];
  [v5 siriViewControllerRequestKeyboardForTapToEditWithCompletion:v4];
}

- (void)editableTextViewTextWillBeginCorrecting:(id)a3
{
  id v4 = [(SREditableTextView *)self->_editableUtteranceView text];
  preCorrectionText = self->_preCorrectionText;
  self->_preCorrectionText = v4;

  editableUtteranceView = self->_editableUtteranceView;
  [(SREditableTextView *)editableUtteranceView frame];
  -[SREditableTextView sizeThatFits:](editableUtteranceView, "sizeThatFits:", CGRectGetWidth(v18), 1.79769313e308);
  self->_currentTextSize.double width = v7;
  self->_currentTextSize.double height = v8;
  self->_textChanged = 0;
  speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
  if (!speechAlternativeDisplayList)
  {
    id v10 = [(SRUserUtteranceViewController *)self speechAlternativeHighlightListWithScore:SiriUIShowSpeechAlternativeScore()];
    id v11 = self->_speechAlternativeDisplayList;
    self->_speechAlternativeDisplayList = v10;

    speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
  }
  if ([(NSArray *)speechAlternativeDisplayList count])
  {
    id v12 = [(SRUserUtteranceViewController *)self delegate];
    [v12 siriViewControllerHeightDidChange:self pinTopOfSnippet:1];
  }
  id v13 = [(SRUserUtteranceViewController *)self _privateDelegate];
  [v13 siriViewControllerWillBeginEditing:self];

  id v16 = +[AFAnalytics sharedAnalytics];
  uint64_t v14 = [(SRUserUtteranceViewController *)self aceObject];
  objc_super v15 = AFAnalyticsContextCreateWithCommand();
  [v16 logEventWithType:1424 context:v15];
}

- (void)_checkUpdatedSizingForEditableTextView:(id)a3
{
  id v4 = a3;
  [v4 frame];
  [v4 sizeThatFits:CGRectGetWidth(v12) 1.79769313e308];
  double v6 = v5;
  double v8 = v7;

  if (v6 != self->_currentTextSize.width || v8 != self->_currentTextSize.height)
  {
    self->_currentTextSize.double width = v6;
    self->_currentTextSize.double height = v8;
    [(SiriUICollectionViewFlowLayout *)self->_speechAlternativeCollectionViewLayout invalidateLayout];
    id v10 = [(SRUserUtteranceViewController *)self delegate];
    [v10 siriViewControllerHeightDidChange:self];
  }
}

- (void)editableTextViewTextDidChange:(id)a3
{
  id v4 = a3;
  [(SRUserUtteranceViewController *)self _checkUpdatedSizingForEditableTextView:v4];
  [v4 setNeedsLayout];
  preCorrectionText = self->_preCorrectionText;
  double v6 = [v4 text];

  double v7 = +[NSCharacterSet whitespaceCharacterSet];
  double v8 = [v6 stringByTrimmingCharactersInSet:v7];
  self->_textChanged = ![(NSString *)preCorrectionText isEqualToString:v8];

  id v9 = [(SRUserUtteranceViewController *)self _privateDelegate];
  [v9 siriViewControllerRequestToPin:self];
}

- (void)editableTextViewTextDidFinishCorrecting:(id)a3
{
  id v4 = a3;
  double v5 = [(SRUserUtteranceViewController *)self _privateDelegate];
  [v5 siriViewControllerDidEndEditing:self];

  double v6 = [v4 text];
  double v7 = v6;
  self->_showSpeechAlternativeList = 0;
  if (!self->_textChanged)
  {
    id v11 = [(SRUserUtteranceViewController *)self _userUtterance];
    [(SRUserUtteranceViewController *)self restoreOriginalEditTextContents:v11];
    goto LABEL_6;
  }
  if (![v6 length])
  {
    CGRect v18 = [(SRUserUtteranceViewController *)self _userUtterance];
    [(SRUserUtteranceViewController *)self restoreOriginalEditTextContents:v18];

    utteranceView = self->_utteranceView;
    v20 = [(SRUserUtteranceViewController *)self _userUtterance];
    v21 = [v20 bestTextInterpretation];
    [(SRUserUtteranceView *)utteranceView setText:v21];

    goto LABEL_11;
  }
  if (![(NSString *)self->_preCorrectionText isEqualToString:v7])
  {
    id v8 = objc_alloc((Class)AFUserUtterance);
    id v9 = [(SRUserUtteranceViewController *)self _userUtterance];
    id v10 = [v9 correctionIdentifier];
    id v11 = [v8 initWithString:v7 correctionIdentifier:v10];

    [(SRUserUtteranceViewController *)self _setUserUtterance:v11];
    [(SRUserUtteranceViewController *)self removeSpeechAlternatives];
    [v4 setText:v7];
    self->_newRequestSent = 1;
LABEL_6:
  }
  id v12 = objc_alloc_init((Class)SAUIListItem);
  [v12 setSelectionText:v7];
  id v13 = [(SRUserUtteranceViewController *)self delegate];
  [v13 siriViewController:self addSelectionResponse:v12];

  uint64_t v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315394;
    v23 = "-[SRUserUtteranceViewController editableTextViewTextDidFinishCorrecting:]";
    __int16 v24 = 2112;
    CFStringRef v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s CorrectedText = %@", (uint8_t *)&v22, 0x16u);
  }
  objc_super v15 = [(SRUserUtteranceViewController *)self _privateDelegate];
  id v16 = [(SRUserUtteranceViewController *)self _correctionIdentifier];
  uint64_t v17 = [(SRUserUtteranceViewController *)self userSelectionResults:v7];
  [v15 siriViewController:self startCorrectedSpeechRequestWithText:v7 correctionIdentifier:v16 userSelectionResults:v17];

LABEL_11:
  [(SRUserUtteranceViewController *)self _hideEditableUtteranceView];
}

- (void)editableTextViewTextDidResignFirstResponder:(id)a3
{
  id v4 = [(SRUserUtteranceViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRUserUtteranceViewController *)self delegate];
    [v6 siriViewControllerDidResignFirstResponder:self];
  }
}

- (void)restoreOriginalEditTextContents:(id)a3
{
  id v8 = a3;
  id v4 = [v8 allPhrases];
  if (v4 && !self->_forceBestTextInterpretation)
  {
    editableUtteranceView = self->_editableUtteranceView;
    id v6 = [v8 correctionIdentifier];
    [(SREditableTextView *)editableUtteranceView setDictationResult:v4 withCorrectionIdentifier:v6];
  }
  else
  {
    char v5 = self->_editableUtteranceView;
    id v6 = [v8 bestTextInterpretation];
    [(SREditableTextView *)v5 setText:v6];
  }
}

- (void)createViewArray
{
  BOOL v3 = +[NSMutableArray array];
  viewArray = self->_viewArray;
  self->_viewArray = v3;

  editableUtteranceView = self->_editableUtteranceView;
  self->_editableUtteranceView = 0;

  [(SRUserUtteranceViewController *)self createEditableUtteranceView];
  [(NSMutableArray *)self->_viewArray addObject:self->_editableUtteranceView];
  if ([(NSMutableArray *)self->_speechAlternativeList count])
  {
    id v6 = self->_viewArray;
    double v7 = [SRSpeechAlternativeLabelCellView alloc];
    speechAlternativeListTitle = self->_speechAlternativeListTitle;
    id v9 = +[UIFont siriui_serverUtteranceFont];
    id v10 = [(SRSpeechAlternativeLabelCellView *)v7 initWithTitle:speechAlternativeListTitle font:v9];
    [(NSMutableArray *)v6 addObject:v10];

    self->_speechAlternativesStartIndex = (int64_t)[(NSMutableArray *)self->_viewArray count];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = self->_speechAlternativeDisplayList;
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        objc_super v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v15);
          uint64_t v17 = [SRSpeechAlternativeCellView alloc];
          CGRect v18 = -[SRSpeechAlternativeCellView initWithTitle:](v17, "initWithTitle:", v16, (void)v19);
          [(NSMutableArray *)self->_viewArray addObject:v18];

          objc_super v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
}

- (void)_createSpeechAlternativeViewsIfNecessary
{
  if (!self->_speechAlternativeDisplayList)
  {
    BOOL v3 = [(SRUserUtteranceViewController *)self speechAlternativeHighlightListWithScore:SiriUIShowSpeechAlternativeScore()];
    speechAlternativeDisplayList = self->_speechAlternativeDisplayList;
    self->_speechAlternativeDisplayList = v3;
  }
  if (!self->_speechAlternativeCollectionView)
  {
    char v5 = (SiriUICollectionViewFlowLayout *)objc_alloc_init((Class)SiriUICollectionViewFlowLayout);
    speechAlternativeCollectionViewLayout = self->_speechAlternativeCollectionViewLayout;
    self->_speechAlternativeCollectionViewLayout = v5;

    [(SiriUICollectionViewFlowLayout *)self->_speechAlternativeCollectionViewLayout setMinimumLineSpacing:0.0];
    [(SiriUICollectionViewFlowLayout *)self->_speechAlternativeCollectionViewLayout setMinimumInteritemSpacing:0.0];
    double v7 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height collectionViewLayout:self->_speechAlternativeCollectionViewLayout];
    speechAlternativeCollectionView = self->_speechAlternativeCollectionView;
    self->_speechAlternativeCollectionView = v7;

    [(UICollectionView *)self->_speechAlternativeCollectionView setDelegate:self];
    [(UICollectionView *)self->_speechAlternativeCollectionView setDataSource:self];
    [(UICollectionView *)self->_speechAlternativeCollectionView setScrollEnabled:0];
    [(UICollectionView *)self->_speechAlternativeCollectionView setShowsVerticalScrollIndicator:0];
    id v9 = self->_speechAlternativeCollectionView;
    id v10 = +[UIColor clearColor];
    [(UICollectionView *)v9 setBackgroundColor:v10];

    id v11 = self->_speechAlternativeCollectionView;
    uint64_t v12 = objc_opt_class();
    id v13 = +[SiriUIContentCollectionViewCell reuseIdentifier];
    [(UICollectionView *)v11 registerClass:v12 forCellWithReuseIdentifier:v13];

    [(SRUserUtteranceViewController *)self createViewArray];
    [(UICollectionView *)self->_speechAlternativeCollectionView reloadData];
    [(UICollectionView *)self->_speechAlternativeCollectionView recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
    containerView = self->_containerView;
    objc_super v15 = self->_speechAlternativeCollectionView;
    [(SRUserUtteranceContainerView *)containerView setTableView:v15];
  }
}

- (id)speechAlternativeHighlightListWithScore:(BOOL)a3
{
  BOOL v3 = a3;
  if (SiriUIDisableAlternativesFeature())
  {
    char v5 = 0;
    goto LABEL_23;
  }
  speechAlternativeList = self->_speechAlternativeList;
  if (speechAlternativeList) {
    [(NSMutableArray *)speechAlternativeList removeAllObjects];
  }
  double v7 = +[NSMutableArray array];
  id v8 = self->_speechAlternativeList;
  self->_speechAlternativeList = v7;

  [(NSMutableDictionary *)self->_alternativeInfoMap removeAllObjects];
  self->_showOnDeviceResults = 0;
  id v9 = [(SRUserUtteranceViewController *)self _userUtterance];
  id v10 = [v9 allRecognitionStringsAndScores];

  id v11 = [(SRUserUtteranceViewController *)self _userUtterance];
  uint64_t v12 = [v11 textOfUtteranceAtIndex:0];

  if (!v12)
  {
    v26 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B7BB0(v26);
    }
    char v5 = 0;
    goto LABEL_22;
  }
  id v13 = objc_alloc_init((Class)SRUIFAlternativeInfo);
  [v13 setOriginalRank:&off_100149AF0];
  uint64_t v14 = [v10 objectForKey:v12];
  uint64_t v15 = AFUserUtteranceConfidenceAverageKey;
  uint64_t v16 = [v14 objectForKey:AFUserUtteranceConfidenceAverageKey];
  [v13 setOriginalScore:v16];

  [v13 setIsFromDevice:&__kCFBooleanFalse];
  [(NSMutableDictionary *)self->_alternativeInfoMap setObject:v13 forKey:v12];
  uint64_t v17 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    CGRect v18 = v17;
    long long v19 = [v10 objectForKey:v12];
    long long v20 = [v19 objectForKey:v15];
    int v30 = 136315650;
    v31 = "-[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]";
    __int16 v32 = 2112;
    v33 = v12;
    __int16 v34 = 2112;
    v35 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Original utterance:  %@ (%@)", (uint8_t *)&v30, 0x20u);
  }
  long long v21 = [(SRUserUtteranceViewController *)self delegate];
  char v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) == 0)
  {
    __int16 v24 = 0;
LABEL_18:
    v27 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315138;
      v31 = "-[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s server results only", (uint8_t *)&v30, 0xCu);
    }
    v28 = [(SRUserUtteranceViewController *)self _userUtterance];
    char v5 = [(SRUserUtteranceViewController *)self _processUserUtterance:v28 isCombined:0 displayedText:v12 withScore:v3];

    goto LABEL_21;
  }
  v23 = [(SRUserUtteranceViewController *)self delegate];
  __int16 v24 = [v23 updatedUserUtteranceForSiriViewController:self];

  if (!v24 || (uint64_t)[v24 numberOfAlternativeUtterances] < 1) {
    goto LABEL_18;
  }
  CFStringRef v25 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136315138;
    v31 = "-[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]";
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s combined results", (uint8_t *)&v30, 0xCu);
  }
  char v5 = [(SRUserUtteranceViewController *)self _processUserUtterance:v24 isCombined:1 displayedText:v12 withScore:v3];
LABEL_21:

LABEL_22:
LABEL_23:

  return v5;
}

- (id)_processUserUtterance:(id)a3 isCombined:(BOOL)a4 displayedText:(id)a5 withScore:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  NSAttributedStringKey v39 = NSForegroundColorAttributeName;
  uint64_t v12 = +[UIColor colorWithWhite:1.0 alpha:1.0];
  v40 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

  NSAttributedStringKey v37 = NSForegroundColorAttributeName;
  uint64_t v14 = +[UIColor colorWithWhite:1.0 alpha:0.5];
  v38 = v14;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];

  uint64_t v16 = [v10 allRecognitionStringsAndScores];
  uint64_t v17 = [v16 keysSortedByValueUsingComparator:&stru_100143808];
  +[NSMutableArray array];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100037468;
  v27[3] = &unk_100143830;
  id v28 = v11;
  id v29 = v16;
  int v30 = self;
  id v31 = v15;
  BOOL v35 = a4;
  id v32 = v10;
  id v33 = v13;
  BOOL v36 = a6;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v34 = v18;
  id v19 = v13;
  id v20 = v10;
  id v21 = v15;
  id v22 = v16;
  id v23 = v11;
  [v17 enumerateObjectsUsingBlock:v27];
  __int16 v24 = v34;
  id v25 = v18;

  return v25;
}

- (void)handleSelectRow:(int64_t)a3
{
  if ([(NSMutableArray *)self->_speechAlternativeList count])
  {
    int64_t v5 = a3 - self->_speechAlternativesStartIndex;
    if (v5 >= 0 && v5 < (unint64_t)[(NSMutableArray *)self->_speechAlternativeList count])
    {
      id v6 = [(NSMutableArray *)self->_speechAlternativeList objectAtIndex:v5];
      double v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315394;
        id v18 = "-[SRUserUtteranceViewController handleSelectRow:]";
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s alternativeString = %@", (uint8_t *)&v17, 0x16u);
      }
      id v8 = objc_alloc((Class)AFUserUtterance);
      id v9 = [(SRUserUtteranceViewController *)self _userUtterance];
      id v10 = [v9 correctionIdentifier];
      id v11 = [v8 initWithString:v6 correctionIdentifier:v10];

      [(SRUserUtteranceViewController *)self _setUserUtterance:v11];
      [(SRUserUtteranceView *)self->_utteranceView setText:v6];
      [(SREditableTextView *)self->_editableUtteranceView setText:v6];
      self->_showSpeechAlternativeList = 0;
      [(SRUserUtteranceViewController *)self removeSpeechAlternatives];
      uint64_t v12 = [(SRUserUtteranceViewController *)self delegate];
      [v12 siriViewControllerHeightDidChange:self pinTopOfSnippet:1];

      id v13 = [(SRUserUtteranceViewController *)self _privateDelegate];
      uint64_t v14 = [(SRUserUtteranceViewController *)self _correctionIdentifier];
      uint64_t v15 = [(SRUserUtteranceViewController *)self userSelectionResults:v6];
      [v13 siriViewController:self startCorrectedSpeechRequestWithText:v6 correctionIdentifier:v14 userSelectionResults:v15];

      self->_newRequestSent = 1;
      [(SRUserUtteranceViewController *)self _hideEditableUtteranceView];
    }
  }
  else
  {
    editableUtteranceView = self->_editableUtteranceView;
    [(SREditableTextView *)editableUtteranceView beginEditing];
  }
}

- (id)userSelectionResults:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AFUserUtteranceSelectionResults);
  id v6 = v5;
  if (v4)
  {
    double v7 = [(NSMutableDictionary *)self->_alternativeInfoMap objectForKey:v4];
    id v8 = [v7 originalScore];
    [v6 setOriginalScore:v8];

    id v9 = [v7 originalRank];
    [v6 setOriginalRank:v9];

    id v10 = [v7 isFromDevice];
    unsigned int v11 = [v10 BOOLValue];

    uint64_t v12 = &SASStartCorrectedSpeechRequestUtteranceSourceCLIENTValue;
    if (!v11) {
      uint64_t v12 = &SASStartCorrectedSpeechRequestUtteranceSourceSERVERValue;
    }
    [v6 setUtteranceSource:*v12];
    id v13 = [v7 combinedRank];
    [v6 setCombinedRank:v13];

    uint64_t v14 = [v7 combinedScore];
    [v6 setCombinedScore:v14];
  }
  else
  {
    [v5 setUtteranceSource:SASStartCorrectedSpeechRequestUtteranceSourceUSER_EDITEDValue];
  }
  uint64_t v15 = [(SRUserUtteranceViewController *)self aceObject];
  uint64_t v16 = [v15 refId];
  [v6 setInteractionId:v16];

  int v17 = +[NSNumber numberWithBool:self->_showOnDeviceResults];
  [v6 setOnDeviceUtterancesPresent:v17];

  [v6 setSessionId:self->_sessionId];
  [v6 setPreviousUtterance:self->_preCorrectionText];
  id v18 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    id v21 = "-[SRUserUtteranceViewController userSelectionResults:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s AFUserUtteranceSelectionResults = %@", (uint8_t *)&v20, 0x16u);
  }

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_viewArray count];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [v9 setHasChevron:0];
  id v10 = [v6 item];

  unsigned int v11 = +[UIColor clearColor];
  [v9 setBackgroundColor:v11];

  if (v10)
  {
    [v9 setKeylineType:4];
    uint64_t v12 = [v9 keyline];
    [v12 setCustomLeftPadding:44.0];

    id v13 = [v9 keyline];
    [v13 setCustomRightPadding:44.0];

    uint64_t v14 = [v9 keyline];
    uint64_t v15 = +[UIColor colorWithWhite:0.5 alpha:0.3];
    [v14 setCustomBackgroundColor:v15];
  }
  else
  {
    [v9 setKeylineType:0];
  }
  uint64_t v16 = [(NSMutableArray *)self->_viewArray objectAtIndex:v10];
  int v17 = [v9 contentView];
  [v9 bounds];
  double Width = CGRectGetWidth(v44);
  [v9 bounds];
  [v17 setBounds:0.0, 0.0, Width, CGRectGetHeight(v45)];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v19 = [v9 contentView];
    [v19 addSubview:v16];

    int v20 = [v9 contentView];
    [v20 bounds];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    [v16 edgeInsets];
    double v30 = v22 + v29;
    double v32 = v24 + v31;
    double v34 = v26 - (v29 + v33);
    double v36 = v28 - (v31 + v35);
LABEL_9:

    [v16 setFrame:v30, v32, v34, v36];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    NSAttributedStringKey v37 = [v9 contentView];
    [v37 addSubview:v16];

    int v20 = [v9 contentView];
    [v20 bounds];
    double v30 = v38;
    double v32 = v39;
    double v34 = v40;
    double v36 = v41;
    goto LABEL_9;
  }
LABEL_10:

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  id v7 = [v6 row];

  [(SRUserUtteranceViewController *)self handleSelectRow:v7];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(SRUserUtteranceViewController *)self delegate];
  [v7 siriViewControllerExpectedWidth:self];
  double width = v8;

  CGFloat height = CGSizeZero.height;
  id v11 = [v6 item];

  if (v11 >= [(NSMutableArray *)self->_viewArray count])
  {
    double width = CGSizeZero.width;
  }
  else
  {
    uint64_t v12 = [(NSMutableArray *)self->_viewArray objectAtIndex:v11];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v12 sizeThatFits:width, 1.79769313e308];
      CGFloat height = v13;
    }
  }
  double v14 = width;
  double v15 = height;
  result.CGFloat height = v15;
  result.double width = v14;
  return result;
}

- (AFUserUtterance)_userUtterance
{
  return self->_userUtterance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_storeStrong((id *)&self->_changeUtteranceCommand, 0);
  objc_storeStrong((id *)&self->_preCorrectionText, 0);
  objc_storeStrong((id *)&self->_originalUtteranceText, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_alternativeInfoMap, 0);
  objc_storeStrong((id *)&self->_speechAlternativeListTitle, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_speechAlternativeCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->_speechAlternativeCollectionView, 0);
  objc_storeStrong((id *)&self->_editableUtteranceView, 0);
  objc_storeStrong((id *)&self->_viewArray, 0);
  objc_storeStrong((id *)&self->_speechAlternativeList, 0);
  objc_storeStrong((id *)&self->_speechAlternativeDisplayList, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);

  objc_storeStrong((id *)&self->_utteranceView, 0);
}

@end