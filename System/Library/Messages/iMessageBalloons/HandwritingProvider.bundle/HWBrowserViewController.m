@interface HWBrowserViewController
- (BOOL)_advancePageLeftButtonShouldBeVisible;
- (BOOL)_advancePageRightButtonShouldBeVisible;
- (BOOL)_currentKeyboardIsRTL;
- (BOOL)_deviceOrientationPortrait;
- (BOOL)_heightAvailableForLandscapeStylePresentation:(double)a3;
- (BOOL)_swipePageHintTextShouldBeVisible;
- (BOOL)handwritingScrollView:(id)a3 shouldCancelTouchesInView:(id)a4;
- (BOOL)shouldPresentModally;
- (BOOL)supportsResumablePayload;
- (CGRect)_visibleInkRegionInView;
- (CGSize)_canvasSize;
- (CGSize)currentLayoutSize;
- (CKBrowserItemPayload)resumablePayload;
- (DKInkView)canvasView;
- (HWFavoritesPickerView)recentsPicker;
- (HWHandwritingItem)currentHandwritingItem;
- (HWPreviewBubbleView)handwritingPreviewBubble;
- (HWRepeatingButton)undoButton;
- (HWScrollView)handwritingScrollView;
- (NSLayoutConstraint)bottomStackViewBottomToBottomScrollViewConstraint;
- (NSLayoutConstraint)bottomStackViewToSuperViewBottomConstraint;
- (NSLayoutConstraint)bottomStackViewTopToBottomScrollViewConstraint;
- (NSLayoutConstraint)bottomViewHeightConstraint;
- (NSLayoutConstraint)leftPageButtonWidthAnchor;
- (NSLayoutConstraint)rightPageButtonWidthAnchor;
- (NSLayoutConstraint)scrollViewCenterYConstraint;
- (NSLayoutConstraint)topStackViewBottomToTopScrollViewConstraint;
- (NSLayoutConstraint)topStackViewHeightConstraint;
- (NSLayoutConstraint)topStackViewToSuperViewTopConstraint;
- (NSLayoutConstraint)topStackViewTopToTopScrollViewConstraint;
- (UIButton)clearButton;
- (UIButton)doneButton;
- (UIButton)inputMethodPickerButton;
- (UIButton)keyboardButton;
- (UIButton)recentsButton;
- (UILabel)roateInstructionLabel;
- (UILabel)swipeInstructionLabel;
- (UIStackView)bottomStackView;
- (UIStackView)topStackView;
- (UIView)advancePageLeftButton;
- (UIView)advancePageRightButton;
- (UIView)backgroundView;
- (UIView)bottomView;
- (UIView)handwritingContainerView;
- (UIView)handwritingPreviewContainer;
- (double)pickerOffsetForEditMode:(id)a3;
- (double)topBarHeight;
- (id)_attributedButtonTitleForString:(id)a3 foregroundColor:(id)a4;
- (id)_createAdvancePageLeftButton;
- (id)_createAdvancePageRightButton;
- (id)_handwritingItemFromCurrentState;
- (id)_keyboardImageDeviceSize:(BOOL)a3 orientationIsLandscape:(BOOL)a4;
- (id)_pageButtonWith:(SEL)a3 image:(id)a4 label:(id)a5;
- (id)_recentsPickerImageForState:(BOOL)a3 isLandscape:(BOOL)a4;
- (int64_t)browserPresentationStyle;
- (int64_t)buttonYMargin;
- (int64_t)inkViewMargin;
- (int64_t)topBarSpacing;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_clear:(id)a3;
- (void)_configureLayoutToiPadLandscape;
- (void)_configureLayoutToiPadPortrait;
- (void)_configureLayoutToiPhoneRecentsPicker;
- (void)_configureLayoutToiPhoneWritepad;
- (void)_datasourceUpdated:(id)a3;
- (void)_dismissAndShowKeyboard:(id)a3;
- (void)_done:(id)a3;
- (void)_inkViewTouchesBeganNotification:(id)a3;
- (void)_inkViewTouchesEndedNotification:(id)a3;
- (void)_loadDrawingFromResumablePayload;
- (void)_nextInputMode:(id)a3;
- (void)_pickLayoutForSize:(CGSize)a3;
- (void)_resetScrollView:(BOOL)a3;
- (void)_scrollPageToLeft:(id)a3;
- (void)_scrollPageToRight:(id)a3;
- (void)_scrollToVisibleRegion;
- (void)_sendHandwritingMessage;
- (void)_sendTypingIndicator;
- (void)_setupViewHierarchyForiPadWithBindings:(id)a3;
- (void)_setupViewHierarchyForiPhoneWithBindings:(id)a3;
- (void)_showInputMethodPicker:(id)a3 event:(id)a4;
- (void)_toggleRecentsPicker:(id)a3;
- (void)_udpatePageButtonVisibility:(BOOL)a3;
- (void)_undo:(id)a3;
- (void)_updateBackgroundView;
- (void)_updateCanvasSize;
- (void)_updateClearButton;
- (void)_updateCoronaColors;
- (void)_updateLayoutForKeboardInterfaceOrientaion;
- (void)_updateLayoutForRecentsPickerHidden:(BOOL)a3;
- (void)_updateSwipePageHintTextVisibility:(BOOL)a3;
- (void)_updateUndoButton:(id)a3;
- (void)_updateUserInterfaceStyle;
- (void)_workaround_sendNilMessageToForceModalDismiss;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)pickerDidEnterEditMode:(id)a3;
- (void)pickerDidExitEditMode:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)sendEncodedHandwriting:(id)a3;
- (void)setAdvancePageLeftButton:(id)a3;
- (void)setAdvancePageRightButton:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBottomStackView:(id)a3;
- (void)setBottomStackViewBottomToBottomScrollViewConstraint:(id)a3;
- (void)setBottomStackViewToSuperViewBottomConstraint:(id)a3;
- (void)setBottomStackViewTopToBottomScrollViewConstraint:(id)a3;
- (void)setBottomView:(id)a3;
- (void)setBottomViewHeightConstraint:(id)a3;
- (void)setCanvasView:(id)a3;
- (void)setClearButton:(id)a3;
- (void)setCurrentHandwritingItem:(id)a3;
- (void)setCurrentLayoutSize:(CGSize)a3;
- (void)setDoneButton:(id)a3;
- (void)setHandwritingContainerView:(id)a3;
- (void)setHandwritingPreviewBubble:(id)a3;
- (void)setHandwritingPreviewContainer:(id)a3;
- (void)setHandwritingScrollView:(id)a3;
- (void)setInputMethodPickerButton:(id)a3;
- (void)setKeyboardButton:(id)a3;
- (void)setLeftPageButtonWidthAnchor:(id)a3;
- (void)setRecentsButton:(id)a3;
- (void)setRecentsPicker:(id)a3;
- (void)setResumablePayload:(id)a3;
- (void)setRightPageButtonWidthAnchor:(id)a3;
- (void)setRoateInstructionLabel:(id)a3;
- (void)setScrollViewCenterYConstraint:(id)a3;
- (void)setSwipeInstructionLabel:(id)a3;
- (void)setTopStackView:(id)a3;
- (void)setTopStackViewBottomToTopScrollViewConstraint:(id)a3;
- (void)setTopStackViewHeightConstraint:(id)a3;
- (void)setTopStackViewToSuperViewTopConstraint:(id)a3;
- (void)setTopStackViewTopToTopScrollViewConstraint:(id)a3;
- (void)setUndoButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HWBrowserViewController

- (int64_t)buttonYMargin
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 preferredContentSizeCategory];
  if (_UIContentSizeCategoryIsAccessibilityContentSizeCategory()) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = 16;
  }

  return v4;
}

- (int64_t)inkViewMargin
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 preferredContentSizeCategory];
  if (_UIContentSizeCategoryIsAccessibilityContentSizeCategory()) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = 11;
  }

  return v4;
}

- (int64_t)topBarSpacing
{
  int64_t v3 = [(HWBrowserViewController *)self buttonYMargin];
  return [(HWBrowserViewController *)self inkViewMargin] + v3;
}

- (double)topBarHeight
{
  double v3 = (double)[(HWBrowserViewController *)self topBarSpacing];
  int64_t v4 = [(HWBrowserViewController *)self view];
  [v4 safeAreaInsets];
  double v6 = v5;

  if (v6 <= 0.0) {
    double v7 = v3;
  }
  else {
    double v7 = v3 * 0.5;
  }
  -[HWRepeatingButton sizeThatFits:](self->_undoButton, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  return v7 + v8;
}

- (void)viewDidLoad
{
  v133.receiver = self;
  v133.super_class = (Class)HWBrowserViewController;
  [(HWBrowserViewController *)&v133 viewDidLoad];
  double v3 = +[UIColor handwritingBrowserBackgroundColor];
  int64_t v4 = [(HWBrowserViewController *)self view];
  [v4 setBackgroundColor:v3];

  if (qword_33610 != -1) {
    dispatch_once(&qword_33610, &stru_28718);
  }
  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_datasourceUpdated:" name:HWRecentsManagerUpdatedNotification object:0];

  [(HWBrowserViewController *)self _updateBackgroundView];
  double v6 = [HWRepeatingButton alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v10 = -[HWRepeatingButton initWithFrame:](v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  undoButton = self->_undoButton;
  self->_undoButton = v10;

  [(HWRepeatingButton *)self->_undoButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HWRepeatingButton *)self->_undoButton setEnabled:0];
  v12 = +[UIColor enabledButtonColor];
  [(HWRepeatingButton *)self->_undoButton setTintColor:v12];

  [(HWRepeatingButton *)self->_undoButton setContentHorizontalAlignment:1];
  v13 = self->_undoButton;
  v14 = +[NSBundle hw_handwritingPluginBundle];
  v15 = [v14 localizedStringForKey:@"Undo" value:&stru_28B68 table:@"HWBrowserViewController"];
  v16 = [(HWRepeatingButton *)self->_undoButton tintColor];
  v17 = [(HWBrowserViewController *)self _attributedButtonTitleForString:v15 foregroundColor:v16];
  [(HWRepeatingButton *)v13 setAttributedTitle:v17 forState:0];

  v18 = self->_undoButton;
  v19 = +[NSBundle hw_handwritingPluginBundle];
  v20 = [v19 localizedStringForKey:@"Undo" value:&stru_28B68 table:@"HWBrowserViewController"];
  v21 = [(HWRepeatingButton *)self->_undoButton tintColor];
  v22 = [v21 colorWithAlphaComponent:0.4];
  v23 = [(HWBrowserViewController *)self _attributedButtonTitleForString:v20 foregroundColor:v22];
  [(HWRepeatingButton *)v18 setAttributedTitle:v23 forState:1];

  v24 = self->_undoButton;
  v25 = +[NSBundle hw_handwritingPluginBundle];
  v26 = [v25 localizedStringForKey:@"Undo" value:&stru_28B68 table:@"HWBrowserViewController"];
  v27 = +[UIColor disabledButtonColor];
  v28 = [(HWBrowserViewController *)self _attributedButtonTitleForString:v26 foregroundColor:v27];
  [(HWRepeatingButton *)v24 setAttributedTitle:v28 forState:2];

  [(HWRepeatingButton *)self->_undoButton addTarget:self action:"_undo:" forControlEvents:64];
  [(HWRepeatingButton *)self->_undoButton setRepeatingAction:"_undo:"];
  v29 = +[UIButton buttonWithType:0];
  clearButton = self->_clearButton;
  self->_clearButton = v29;

  [(UIButton *)self->_clearButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_clearButton setHidden:1];
  v31 = +[UIColor enabledButtonColor];
  [(UIButton *)self->_clearButton setTintColor:v31];

  [(UIButton *)self->_clearButton setContentHorizontalAlignment:2];
  v32 = self->_clearButton;
  v33 = +[NSBundle hw_handwritingPluginBundle];
  v34 = [v33 localizedStringForKey:@"Clear" value:&stru_28B68 table:@"HWBrowserViewController"];
  v35 = [(UIButton *)self->_clearButton tintColor];
  v36 = [(HWBrowserViewController *)self _attributedButtonTitleForString:v34 foregroundColor:v35];
  [(UIButton *)v32 setAttributedTitle:v36 forState:0];

  v37 = self->_clearButton;
  v38 = +[NSBundle hw_handwritingPluginBundle];
  v39 = [v38 localizedStringForKey:@"Clear" value:&stru_28B68 table:@"HWBrowserViewController"];
  v40 = +[UIColor disabledButtonColor];
  v41 = [(HWBrowserViewController *)self _attributedButtonTitleForString:v39 foregroundColor:v40];
  [(UIButton *)v37 setAttributedTitle:v41 forState:2];

  [(UIButton *)self->_clearButton addTarget:self action:"_clear:" forControlEvents:64];
  v42 = +[UIButton buttonWithType:0];
  doneButton = self->_doneButton;
  self->_doneButton = v42;

  [(UIButton *)self->_doneButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v44 = +[UIColor enabledButtonColor];
  [(UIButton *)self->_doneButton setTintColor:v44];

  [(UIButton *)self->_doneButton setContentHorizontalAlignment:2];
  v45 = self->_doneButton;
  v46 = +[NSBundle hw_handwritingPluginBundle];
  v47 = [v46 localizedStringForKey:@"Done" value:&stru_28B68 table:@"HWBrowserViewController"];
  v48 = [(UIButton *)self->_doneButton tintColor];
  v49 = [(HWBrowserViewController *)self _attributedButtonTitleForString:v47 foregroundColor:v48];
  [(UIButton *)v45 setAttributedTitle:v49 forState:0];

  [(UIButton *)self->_doneButton addTarget:self action:"_done:" forControlEvents:64];
  v50 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  roateInstructionLabel = self->_roateInstructionLabel;
  self->_roateInstructionLabel = v50;

  [(UILabel *)self->_roateInstructionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_roateInstructionLabel setTextAlignment:1];
  v52 = +[NSBundle hw_handwritingPluginBundle];
  v53 = [v52 localizedStringForKey:@"Rotate to begin writing" value:&stru_28B68 table:@"HWBrowserViewController"];
  [(UILabel *)self->_roateInstructionLabel setText:v53];

  v54 = +[UIColor favoritesLabelColor];
  [(UILabel *)self->_roateInstructionLabel setTextColor:v54];

  v55 = +[UIFont systemFontOfSize:14.0 weight:UIFontWeightLight];
  [(UILabel *)self->_roateInstructionLabel setFont:v55];

  [(UILabel *)self->_roateInstructionLabel setHidden:1];
  v56 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  swipeInstructionLabel = self->_swipeInstructionLabel;
  self->_swipeInstructionLabel = v56;

  [(UILabel *)self->_swipeInstructionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_swipeInstructionLabel setTextAlignment:1];
  v58 = +[NSBundle hw_handwritingPluginBundle];
  v59 = [v58 localizedStringForKey:@"Swipe with two fingers to go back." value:&stru_28B68 table:@"HWBrowserViewController"];
  [(UILabel *)self->_swipeInstructionLabel setText:v59];

  v60 = +[UIColor favoritesLabelColor];
  [(UILabel *)self->_swipeInstructionLabel setTextColor:v60];

  v61 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  [v61 _scaledValueForValue:16.0];
  v62 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  [(UILabel *)self->_swipeInstructionLabel setFont:v62];

  [(UILabel *)self->_swipeInstructionLabel setHidden:0];
  [(UILabel *)self->_swipeInstructionLabel setAlpha:0.0];
  [(UILabel *)self->_swipeInstructionLabel setNumberOfLines:0];
  [(UILabel *)self->_swipeInstructionLabel sizeToFit];
  v63 = +[UIButton buttonWithType:0];
  keyboardButton = self->_keyboardButton;
  self->_keyboardButton = v63;

  [(UIButton *)self->_keyboardButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v65 = +[UIColor keyboardButtonTintColor];
  [(UIButton *)self->_keyboardButton setTintColor:v65];

  v66 = +[NSBundle hw_handwritingPluginBundle];
  v67 = [v66 localizedStringForKey:@"Keyboard" value:&stru_28B68 table:@"HWBrowserViewController"];
  [(UIButton *)self->_keyboardButton setAccessibilityLabel:v67];

  [(UIButton *)self->_keyboardButton addTarget:self action:"_dismissAndShowKeyboard:" forControlEvents:64];
  v68 = +[UIButton buttonWithType:0];
  recentsButton = self->_recentsButton;
  self->_recentsButton = v68;

  [(UIButton *)self->_recentsButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v70 = +[UIColor keyboardButtonTintColor];
  [(UIButton *)self->_recentsButton setTintColor:v70];

  v71 = +[NSBundle hw_handwritingPluginBundle];
  v72 = [v71 localizedStringForKey:@"Recents" value:&stru_28B68 table:@"HWBrowserViewController"];
  [(UIButton *)self->_recentsButton setAccessibilityLabel:v72];

  [(UIButton *)self->_recentsButton addTarget:self action:"_toggleRecentsPicker:" forControlEvents:64];
  v73 = +[UIButton buttonWithType:0];
  inputMethodPickerButton = self->_inputMethodPickerButton;
  self->_inputMethodPickerButton = v73;

  [(UIButton *)self->_inputMethodPickerButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v75 = +[UIColor favoritesGlobeButtonTintColor];
  [(UIButton *)self->_inputMethodPickerButton setTintColor:v75];

  v76 = +[NSBundle hw_handwritingPluginBundle];
  v77 = [v76 localizedStringForKey:@"Input method" value:&stru_28B68 table:@"HWBrowserViewController"];
  [(UIButton *)self->_inputMethodPickerButton setAccessibilityLabel:v77];

  v78 = self->_inputMethodPickerButton;
  v79 = UIKeyboardGetGlobeKeyImage();
  v80 = [v79 imageWithRenderingMode:2];
  [(UIButton *)v78 setImage:v80 forState:0];

  [(UIButton *)self->_inputMethodPickerButton addTarget:self action:"_nextInputMode:" forControlEvents:64];
  [(UIButton *)self->_inputMethodPickerButton addTarget:self action:"_showInputMethodPicker:event:" forControlEvents:0xFFFFFFFFLL];
  v81 = -[HWFavoritesPickerView initWithFrame:]([HWFavoritesPickerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  recentsPicker = self->_recentsPicker;
  self->_recentsPicker = v81;

  [(HWFavoritesPickerView *)self->_recentsPicker setTranslatesAutoresizingMaskIntoConstraints:0];
  v83 = +[UIColor clearColor];
  [(HWFavoritesPickerView *)self->_recentsPicker setBackgroundColor:v83];

  [(HWFavoritesPickerView *)self->_recentsPicker setDelegate:self];
  objc_initWeak(&location, self);
  v130[0] = _NSConcreteStackBlock;
  v130[1] = 3221225472;
  v130[2] = sub_5FE0;
  v130[3] = &unk_28688;
  objc_copyWeak(&v131, &location);
  [(HWFavoritesPickerView *)self->_recentsPicker setSelectionHandler:v130];
  v84 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  handwritingContainerView = self->_handwritingContainerView;
  self->_handwritingContainerView = v84;

  [(UIView *)self->_handwritingContainerView setTranslatesAutoresizingMaskIntoConstraints:1];
  [(UIView *)self->_handwritingContainerView setUserInteractionEnabled:0];
  v86 = +[UIColor clearColor];
  [(UIView *)self->_handwritingContainerView setBackgroundColor:v86];

  v87 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  handwritingPreviewContainer = self->_handwritingPreviewContainer;
  self->_handwritingPreviewContainer = v87;

  [(UIView *)self->_handwritingPreviewContainer setTranslatesAutoresizingMaskIntoConstraints:1];
  v89 = (DKInkView *)objc_msgSend(objc_alloc((Class)DKInkView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  canvasView = self->_canvasView;
  self->_canvasView = v89;

  [(DKInkView *)self->_canvasView setTranslatesAutoresizingMaskIntoConstraints:1];
  v91 = +[UIColor drawingCanvasBackgroundColor];
  [(DKInkView *)self->_canvasView setBackgroundColor:v91];

  [(DKInkView *)self->_canvasView setExclusiveTouch:1];
  v92 = +[UIColor inkColor];
  [(DKInkView *)self->_canvasView setStrokeColor:v92];

  [(DKInkView *)self->_canvasView setRenderPreviewMode:2];
  v93 = -[HWScrollView initWithFrame:]([HWScrollView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  handwritingScrollView = self->_handwritingScrollView;
  self->_handwritingScrollView = v93;

  [(HWScrollView *)self->_handwritingScrollView setDelegate:self];
  [(HWScrollView *)self->_handwritingScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HWScrollView *)self->_handwritingScrollView setShowsVerticalScrollIndicator:0];
  [(HWScrollView *)self->_handwritingScrollView setShowsHorizontalScrollIndicator:0];
  v95 = [(HWScrollView *)self->_handwritingScrollView panGestureRecognizer];
  [v95 setMinimumNumberOfTouches:2];

  v96 = [(HWScrollView *)self->_handwritingScrollView panGestureRecognizer];
  [v96 _setHysteresis:1.0];

  v97 = [(HWScrollView *)self->_handwritingScrollView panGestureRecognizer];
  [v97 setEnabled:0];

  [(HWScrollView *)self->_handwritingScrollView setDelaysContentTouches:0];
  [(HWScrollView *)self->_handwritingScrollView setCanCancelContentTouches:1];
  [(HWScrollView *)self->_handwritingScrollView setPagingEnabled:0];
  -[HWScrollView setContentInset:](self->_handwritingScrollView, "setContentInset:", *(double *)(qword_335F8 + 16), *(double *)(qword_335F8 + 24), *(double *)(qword_335F8 + 32), *(double *)(qword_335F8 + 40));
  v98 = [(HWBrowserViewController *)self _createAdvancePageRightButton];
  advancePageRightButton = self->_advancePageRightButton;
  self->_advancePageRightButton = v98;

  v100 = [(HWBrowserViewController *)self _createAdvancePageLeftButton];
  advancePageLeftButton = self->_advancePageLeftButton;
  self->_advancePageLeftButton = v100;

  v102 = [[HWStackView alloc] initWithArrangedSubviews:&__NSArray0__struct];
  topStackView = self->_topStackView;
  self->_topStackView = &v102->super;

  [(UIStackView *)self->_topStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_topStackView setLayoutMarginsRelativeArrangement:1];
  [(UIStackView *)self->_topStackView setSpacing:(double)[(HWBrowserViewController *)self topBarSpacing]];
  -[UIStackView setLayoutMargins:](self->_topStackView, "setLayoutMargins:", *(double *)(qword_335F8 + 160), *(double *)(qword_335F8 + 168), *(double *)(qword_335F8 + 176), *(double *)(qword_335F8 + 184));
  v104 = -[HWView initWithFrame:]([HWView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  bottomView = self->_bottomView;
  self->_bottomView = &v104->super;

  [(UIView *)self->_bottomView setTranslatesAutoresizingMaskIntoConstraints:0];
  v106 = [(UIView *)self->_bottomView heightAnchor];
  v107 = [v106 constraintEqualToConstant:65.0];
  bottomViewHeightConstraint = self->_bottomViewHeightConstraint;
  self->_bottomViewHeightConstraint = v107;

  [(NSLayoutConstraint *)self->_bottomViewHeightConstraint setActive:1];
  v109 = [[HWStackView alloc] initWithArrangedSubviews:&__NSArray0__struct];
  bottomStackView = self->_bottomStackView;
  self->_bottomStackView = &v109->super;

  [(UIStackView *)self->_bottomStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_bottomStackView setLayoutMarginsRelativeArrangement:1];
  [(UIStackView *)self->_bottomStackView setSpacing:32.0];
  -[UIStackView setLayoutMargins:](self->_bottomStackView, "setLayoutMargins:", *(double *)(qword_335F8 + 192), *(double *)(qword_335F8 + 200), *(double *)(qword_335F8 + 208), *(double *)(qword_335F8 + 216));
  [(UIStackView *)self->_bottomStackView setSemanticContentAttribute:3];
  v111 = [(HWBrowserViewController *)self view];
  [v111 addSubview:self->_handwritingScrollView];

  v112 = [(HWBrowserViewController *)self view];
  [v112 addSubview:self->_backgroundView];

  v113 = [(HWBrowserViewController *)self view];
  [v113 sendSubviewToBack:self->_backgroundView];

  v114 = [(HWBrowserViewController *)self view];
  [v114 addSubview:self->_topStackView];

  v115 = [(HWBrowserViewController *)self view];
  [v115 addSubview:self->_bottomView];

  v116 = [(HWBrowserViewController *)self view];
  [v116 addSubview:self->_advancePageRightButton];

  v117 = [(HWBrowserViewController *)self view];
  [v117 addSubview:self->_advancePageLeftButton];

  v118 = [(HWBrowserViewController *)self view];
  [v118 addSubview:self->_swipeInstructionLabel];

  [(HWScrollView *)self->_handwritingScrollView addSubview:self->_canvasView];
  [(HWScrollView *)self->_handwritingScrollView addSubview:self->_handwritingContainerView];
  [(UIView *)self->_bottomView addSubview:self->_bottomStackView];
  v119 = _NSDictionaryOfVariableBindings(@"_backgroundView, _topStackView, _bottomView, _bottomStackView, _canvasView, _handwritingContainerView, _handwritingScrollView, _advancePageRightButton, _advancePageLeftButton, _recentsPicker, _swipeInstructionLabel", self->_backgroundView, self->_topStackView, self->_bottomView, self->_bottomStackView, self->_canvasView, self->_handwritingContainerView, self->_handwritingScrollView, self->_advancePageRightButton, self->_advancePageLeftButton, self->_recentsPicker, self->_swipeInstructionLabel, 0);
  v120 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backgroundView]|" options:0 metrics:0 views:v119];
  +[NSLayoutConstraint activateConstraints:v120];

  v121 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backgroundView]|" options:0 metrics:0 views:v119];
  +[NSLayoutConstraint activateConstraints:v121];

  if (HWDeviceIsiPad()) {
    [(HWBrowserViewController *)self _setupViewHierarchyForiPadWithBindings:v119];
  }
  else {
    [(HWBrowserViewController *)self _setupViewHierarchyForiPhoneWithBindings:v119];
  }
  v122 = +[NSNotificationCenter defaultCenter];
  v123 = [(DKInkView *)self->_canvasView strokeUndoManager];
  [v122 addObserver:self selector:"_updateUndoButton:" name:NSUndoManagerDidUndoChangeNotification object:v123];

  v124 = +[NSNotificationCenter defaultCenter];
  v125 = [(DKInkView *)self->_canvasView strokeUndoManager];
  [v124 addObserver:self selector:"_updateUndoButton:" name:NSUndoManagerCheckpointNotification object:v125];

  v126 = +[NSNotificationCenter defaultCenter];
  [v126 addObserver:self selector:"_inkViewTouchesBeganNotification:" name:DKInkViewTouchesBeganNotification object:self->_canvasView];

  v127 = +[NSNotificationCenter defaultCenter];
  [v127 addObserver:self selector:"_inkViewTouchesEndedNotification:" name:DKInkViewTouchesEndedNotification object:self->_canvasView];

  v128 = +[NSNotificationCenter defaultCenter];
  [v128 addObserver:self selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

  v129 = +[NSNotificationCenter defaultCenter];
  [v129 addObserver:self selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

  [(HWBrowserViewController *)self _udpatePageButtonVisibility:0];
  [(HWBrowserViewController *)self _updateClearButton];

  objc_destroyWeak(&v131);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HWBrowserViewController;
  -[HWBrowserViewController viewWillAppear:](&v14, "viewWillAppear:");
  [(HWBrowserViewController *)self _updateUserInterfaceStyle];
  double v5 = [(HWBrowserViewController *)self navigationController];
  [v5 setNavigationBarHidden:1 animated:v3];

  double v6 = [(HWBrowserViewController *)self view];
  [v6 bounds];
  -[HWBrowserViewController _pickLayoutForSize:](self, "_pickLayoutForSize:", v7, v8);

  [(HWBrowserViewController *)self _updateLayoutForKeboardInterfaceOrientaion];
  v9 = +[HWRecentsManager sharedManager];
  [v9 reloadStoredItems];

  v10 = +[HWRecentsManager sharedManager];
  v11 = [v10 items];
  v12 = [(HWBrowserViewController *)self recentsPicker];
  [v12 setItems:v11];

  if (+[DKInkView gpuAvailable])
  {
    v13 = [(HWBrowserViewController *)self canvasView];
    [v13 resumeRendering];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HWBrowserViewController;
  [(HWCKBrowserViewController *)&v4 viewDidAppear:a3];
  if (self->_resumablePayloadToLoad) {
    [(HWBrowserViewController *)self _loadDrawingFromResumablePayload];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HWBrowserViewController;
  [(HWCKBrowserViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HWBrowserViewController;
  [(HWBrowserViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(HWBrowserViewController *)self canvasView];
  [v4 pauseRendering];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 30;
  }
  else {
    return 24;
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)HWBrowserViewController;
  [(HWBrowserViewController *)&v2 didReceiveMemoryWarning];
}

- (void)dealloc
{
  [(DKInkView *)self->_canvasView teardown];
  canvasView = self->_canvasView;
  self->_canvasView = 0;

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];

  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  double v6 = +[NSNotificationCenter defaultCenter];
  double v7 = [(DKInkView *)self->_canvasView strokeUndoManager];
  [v6 removeObserver:self name:NSUndoManagerDidUndoChangeNotification object:v7];

  double v8 = +[NSNotificationCenter defaultCenter];
  v9 = [(DKInkView *)self->_canvasView strokeUndoManager];
  [v8 removeObserver:self name:NSUndoManagerCheckpointNotification object:v9];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 removeObserver:self name:DKInkViewTouchesBeganNotification object:0];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 removeObserver:self name:DKInkViewTouchesEndedNotification object:0];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 removeObserver:self name:HWRecentsManagerUpdatedNotification object:0];

  v13 = +[NSNotificationCenter defaultCenter];
  [v13 removeObserver:self];

  v14.receiver = self;
  v14.super_class = (Class)HWBrowserViewController;
  [(HWBrowserViewController *)&v14 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HWBrowserViewController;
  [(HWBrowserViewController *)&v13 viewDidLayoutSubviews];
  [(NSLayoutConstraint *)self->_leftPageButtonWidthAnchor setConstant:62.0];
  [(NSLayoutConstraint *)self->_rightPageButtonWidthAnchor setConstant:62.0];
  [(HWBrowserViewController *)self _updateCanvasSize];
  [(HWBrowserViewController *)self _udpatePageButtonVisibility:1];
  id v3 = [(HWBrowserViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(HWBrowserViewController *)self currentLayoutSize];
  if (v5 == v9 && v7 == v8)
  {
    if (!self->_canvasNeedsRepositioning) {
      return;
    }
  }
  else
  {
    v10 = [(HWBrowserViewController *)self view];
    [v10 bounds];
    -[HWBrowserViewController _pickLayoutForSize:](self, "_pickLayoutForSize:", v11, v12);
  }
  if (([(DKInkView *)self->_canvasView canvasHasInk] & 1) == 0) {
    [(HWBrowserViewController *)self _resetScrollView:0];
  }
  self->_canvasNeedsRepositioning = 0;
}

- (BOOL)shouldPresentModally
{
  objc_super v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (int64_t)browserPresentationStyle
{
  return HWDeviceIsiPhone();
}

- (void)_undo:(id)a3
{
  double v4 = [(HWBrowserViewController *)self canvasView];
  [v4 undoLastStroke];

  double v5 = [(HWBrowserViewController *)self canvasView];
  double v6 = [v5 strokeUndoManager];
  unsigned __int8 v7 = [v6 canUndo];

  if (v7) {
    [(HWBrowserViewController *)self _scrollToVisibleRegion];
  }
  else {
    [(HWBrowserViewController *)self _resetScrollView:1];
  }
  [(HWBrowserViewController *)self _udpatePageButtonVisibility:1];

  [(HWBrowserViewController *)self _updateClearButton];
}

- (void)_clear:(id)a3
{
  [(HWBrowserViewController *)self setCurrentHandwritingItem:0];
  id v4 = objc_alloc_init((Class)DKDrawing);
  double v5 = [(HWBrowserViewController *)self canvasView];
  [v5 setCurrentDrawing:v4];

  double v6 = [(HWBrowserViewController *)self resumablePayload];
  [v6 setData:0];

  [(HWBrowserViewController *)self _resetScrollView:0];
  [(HWBrowserViewController *)self _udpatePageButtonVisibility:1];

  [(HWBrowserViewController *)self _updateUndoButton:0];
}

- (void)_done:(id)a3
{
  if ([(HWFavoritesPickerView *)self->_recentsPicker isEditing])
  {
    recentsPicker = self->_recentsPicker;
    [(HWFavoritesPickerView *)recentsPicker cancelEditing:1];
  }
  else
  {
    [(HWBrowserViewController *)self _sendHandwritingMessage];
    [(HWBrowserViewController *)self setCurrentHandwritingItem:0];
    id v5 = objc_alloc_init((Class)DKDrawing);
    double v6 = [(HWBrowserViewController *)self canvasView];
    [v6 setCurrentDrawing:v5];

    [(HWBrowserViewController *)self _updateUndoButton:0];
    [(HWBrowserViewController *)self _resetScrollView:0];
    [(HWBrowserViewController *)self _udpatePageButtonVisibility:1];
  }
}

- (void)_dismissAndShowKeyboard:(id)a3
{
  [(HWFavoritesPickerView *)self->_recentsPicker cancelEditing:0];

  [(HWCKBrowserViewController *)self dismiss];
}

- (void)_toggleRecentsPicker:(id)a3
{
  unsigned int v4 = [(HWFavoritesPickerView *)self->_recentsPicker isHidden];
  if (v4)
  {
    id v5 = +[HWRecentsManager sharedManager];
    [v5 reloadStoredItems];

    double v6 = +[HWRecentsManager sharedManager];
    unsigned __int8 v7 = [v6 items];
    double v8 = [(HWBrowserViewController *)self recentsPicker];
    [v8 setItems:v7];
  }

  [(HWBrowserViewController *)self _updateLayoutForRecentsPickerHidden:v4 ^ 1];
}

- (void)_updateLayoutForRecentsPickerHidden:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(HWBrowserViewController *)self _deviceOrientationPortrait];
  [(HWScrollView *)self->_handwritingScrollView setHidden:v3 ^ 1];
  [(DKInkView *)self->_canvasView setHidden:v3 ^ 1];
  [(HWFavoritesPickerView *)self->_recentsPicker setHidden:v3];
  [(UIView *)self->_advancePageRightButton setHidden:v3 ^ 1];
  [(UIView *)self->_advancePageLeftButton setHidden:v3 ^ 1];
  [(UIStackView *)self->_topStackView setHidden:v3 ^ 1];
  [(UIButton *)self->_keyboardButton setHidden:v3 ^ 1];
  if (HWDeviceIsiPad())
  {
    double v6 = (double *)qword_335F8;
    double bottom = *(double *)(qword_335F8 + 256);
    if ((v5 & 1) != 0
      || ([(HWBrowserViewController *)self currentLayoutSize],
          v9 = [(HWBrowserViewController *)self _heightAvailableForLandscapeStylePresentation:v8], double v6 = (double *)qword_335F8, !v9))
    {
      double v10 = v6[16];
      double v11 = v6[17];
      double v12 = v6[18];
      double v13 = v6[19];
      [(NSLayoutConstraint *)self->_bottomStackViewBottomToBottomScrollViewConstraint setActive:v3];
      [(NSLayoutConstraint *)self->_bottomStackViewToSuperViewBottomConstraint setActive:v3 ^ 1];
      if (!v3) {
        goto LABEL_5;
      }
    }
    else
    {
      double v10 = *(double *)(qword_335F8 + 192);
      double v11 = *(double *)(qword_335F8 + 200);
      double v12 = *(double *)(qword_335F8 + 208);
      double v13 = *(double *)(qword_335F8 + 216);
      if (!v3)
      {
LABEL_5:
        -[UIStackView setLayoutMargins:](self->_bottomStackView, "setLayoutMargins:", *(double *)(qword_335F8 + 224), *(double *)(qword_335F8 + 232), *(double *)(qword_335F8 + 240), *(double *)(qword_335F8 + 248));
        double right = 0.0;
        uint64_t v15 = 2;
        double left = 0.0;
        double top = 0.0;
LABEL_8:
        -[UIButton setImageEdgeInsets:](self->_recentsButton, "setImageEdgeInsets:", top, left, bottom, right);
        [(UIButton *)self->_recentsButton setContentVerticalAlignment:v15];
        goto LABEL_9;
      }
    }
    -[UIStackView setLayoutMargins:](self->_bottomStackView, "setLayoutMargins:", v10, v11, v12, v13);
    uint64_t v15 = 0;
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    goto LABEL_8;
  }
LABEL_9:
  [(HWFavoritesPickerView *)self->_recentsPicker reloadData];
  v18 = [(HWBrowserViewController *)self recentsPicker];
  [v18 cancelEditing:0];

  id v19 = [(HWBrowserViewController *)self _recentsPickerImageForState:[(HWFavoritesPickerView *)self->_recentsPicker isHidden] ^ 1 isLandscape:v5 ^ 1];
  [(UIButton *)self->_recentsButton setImage:v19 forState:0];
}

- (void)_showInputMethodPicker:(id)a3 event:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unsigned __int8 v7 = [(HWBrowserViewController *)self parentViewController];
  if (objc_opt_respondsToSelector()) {
    [v7 handleInputModeListFromView:v8 withEvent:v6];
  }
}

- (void)_nextInputMode:(id)a3
{
  id v3 = [(HWBrowserViewController *)self parentViewController];
  if (objc_opt_respondsToSelector()) {
    [v3 advanceToNextInputMode];
  }
}

- (void)_sendHandwritingMessage
{
  id v7 = [(HWBrowserViewController *)self _handwritingItemFromCurrentState];
  id v3 = [(HWBrowserViewController *)self currentHandwritingItem];

  unsigned int v4 = [v7 drawing];
  id v5 = [v4 totalPoints];

  if ((uint64_t)v5 < 1)
  {
    [(HWBrowserViewController *)self _workaround_sendNilMessageToForceModalDismiss];
  }
  else
  {
    id v6 = +[HWEncoding encodeHandwriting:v7 compress:1];
    [(HWBrowserViewController *)self sendEncodedHandwriting:v6];
    if (v7 != v3) {
      [(HWBrowserViewController *)self storeHandwritingToFavorites:v7];
    }
  }
}

- (void)_sendTypingIndicator
{
  id v2 = [(HWCKBrowserViewController *)self sendDelegate];
  [v2 setLocalUserIsTyping:1];
}

- (id)_handwritingItemFromCurrentState
{
  id v3 = [(HWBrowserViewController *)self canvasView];
  unsigned int v4 = [v3 strokeUndoManager];
  if ([v4 canUndo])
  {
  }
  else
  {
    id v5 = [(HWBrowserViewController *)self currentHandwritingItem];

    if (v5)
    {
      id v6 = [(HWBrowserViewController *)self currentHandwritingItem];
      goto LABEL_6;
    }
  }
  id v7 = [(HWBrowserViewController *)self canvasView];
  id v8 = [v7 currentDrawing];
  id v9 = [v8 copy];

  double v10 = [(HWBrowserViewController *)self canvasView];
  [v10 bounds];
  objc_msgSend(v9, "setCanvasBounds:");

  id v6 = [objc_alloc((Class)HWHandwritingItem) initWithDrawing:v9];
LABEL_6:

  return v6;
}

- (CGSize)_canvasSize
{
  id v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (HWDeviceIsLargeiPad())
  {
    if (v5 >= v7) {
      double v8 = v5;
    }
    else {
      double v8 = v7;
    }
    double v9 = v8 - (*(double *)(qword_335F8 + 56) + *(double *)(qword_335F8 + 72));
  }
  else
  {
    double v9 = 1266.0;
  }
  [(HWScrollView *)self->_handwritingScrollView bounds];
  double v11 = v10;
  double v12 = v9;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)_updateCanvasSize
{
  [(HWBrowserViewController *)self _canvasSize];
  double v4 = v3;
  double v6 = v5;
  -[HWScrollView setContentSize:](self->_handwritingScrollView, "setContentSize:");
  -[UIView setFrame:](self->_handwritingContainerView, "setFrame:", 0.0, 0.0, v4, v6);
  canvasView = self->_canvasView;

  -[DKInkView setFrame:](canvasView, "setFrame:", 0.0, 0.0, v4, v6);
}

- (void)_resetScrollView:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(HWBrowserViewController *)self _currentKeyboardIsRTL];
  handwritingScrollView = self->_handwritingScrollView;
  if (v5)
  {
    [(HWScrollView *)handwritingScrollView contentSize];
    double v8 = v7;
    [(HWScrollView *)self->_handwritingScrollView bounds];
    double v10 = v8 - v9;
    [(HWScrollView *)self->_handwritingScrollView contentInset];
    double v12 = v10 + v11;
  }
  else
  {
    [(HWScrollView *)handwritingScrollView contentInset];
    double v12 = -v13;
  }
  -[HWScrollView setContentOffset:animated:](self->_handwritingScrollView, "setContentOffset:animated:", v3, v12, 0.0);

  [(HWBrowserViewController *)self _udpatePageButtonVisibility:1];
}

- (void)_udpatePageButtonVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(HWBrowserViewController *)self _advancePageRightButtonShouldBeVisible];
  unsigned int v6 = [(HWBrowserViewController *)self _advancePageLeftButtonShouldBeVisible];
  if (v5) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  if (v6) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  [(UIView *)self->_advancePageRightButton alpha];
  if (v9 != v7 || ([(UIView *)self->_advancePageLeftButton alpha], v10 != v8))
  {
    if (v3)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_7220;
      v12[3] = &unk_286B0;
      v12[4] = self;
      *(double *)&v12[5] = v7;
      *(double *)&v12[6] = v8;
      +[UIView animateWithDuration:v12 animations:0.18];
    }
    else
    {
      [(UIView *)self->_advancePageRightButton setAlpha:v7];
      advancePageLeftButton = self->_advancePageLeftButton;
      [(UIView *)advancePageLeftButton setAlpha:v8];
    }
  }
}

- (BOOL)_advancePageRightButtonShouldBeVisible
{
  [(HWScrollView *)self->_handwritingScrollView contentSize];
  double v4 = v3;
  [(HWScrollView *)self->_handwritingScrollView bounds];
  double v6 = v4 - v5;
  [(HWScrollView *)self->_handwritingScrollView contentInset];
  double v8 = v6 + v7;
  [(HWScrollView *)self->_handwritingScrollView contentOffset];
  if (v9 >= v8) {
    return 0;
  }
  if ([(DKInkView *)self->_canvasView canvasHasInk]) {
    return 1;
  }
  canvasView = self->_canvasView;

  return [(DKInkView *)canvasView trackingTouches];
}

- (BOOL)_advancePageLeftButtonShouldBeVisible
{
  [(HWScrollView *)self->_handwritingScrollView contentOffset];
  if (v3 <= 0.0) {
    return 0;
  }
  if ([(DKInkView *)self->_canvasView canvasHasInk]) {
    return 1;
  }
  canvasView = self->_canvasView;

  return [(DKInkView *)canvasView trackingTouches];
}

- (void)_updateSwipePageHintTextVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HWBrowserViewController *)self _swipePageHintTextShouldBeVisible]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  if (!self->_hasSwipeTextBeenShown)
  {
    self->_hasSwipeTextBeenShown = 1;
    id v6 = objc_alloc((Class)NSUserDefaults);
    id v7 = [v6 initWithSuiteName:HWPreferencesDomain];
    [v7 setBool:1 forKey:HWPreferencesSwipeHintTextHasBeenShownKey];
    [v7 synchronize];
  }
  [(UILabel *)self->_swipeInstructionLabel alpha];
  if (v8 != v5)
  {
    if (v3)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_74F0;
      v10[3] = &unk_286D8;
      v10[4] = self;
      *(double *)&v10[5] = v5;
      +[UIView animateWithDuration:v10 animations:0.18];
    }
    else
    {
      swipeInstructionLabel = self->_swipeInstructionLabel;
      [(UILabel *)swipeInstructionLabel setAlpha:v5];
    }
  }
}

- (BOOL)_swipePageHintTextShouldBeVisible
{
  if (!self->_hasSwipeDefaultBeenLoaded)
  {
    self->_hasSwipeDefaultBeenLoaded = 1;
    id v3 = objc_alloc((Class)NSUserDefaults);
    id v4 = [v3 initWithSuiteName:HWPreferencesDomain];
    self->_hasSwipeTextBeenShown = [v4 BOOLForKey:HWPreferencesSwipeHintTextHasBeenShownKey];
  }
  return !self->_hasSwipeTextBeenShown;
}

- (void)_scrollPageToLeft:(id)a3
{
  [(HWScrollView *)self->_handwritingScrollView contentInset];
  double v5 = -v4;
  [(HWScrollView *)self->_handwritingScrollView bounds];
  CGFloat v6 = CGRectGetWidth(v10) * -0.8;
  [(HWScrollView *)self->_handwritingScrollView contentOffset];
  double v8 = v7 + v6;
  if (v8 < v5) {
    double v8 = v5;
  }
  if (v8 + -10.0 >= v5) {
    double v8 = v5;
  }
  [(HWScrollView *)self->_handwritingScrollView setContentOffset:1 animated:v8];
  if (self->_hasSwipeTextBeenShown)
  {
    [(HWBrowserViewController *)self _updateSwipePageHintTextVisibility:1];
  }
}

- (void)_scrollPageToRight:(id)a3
{
  [(HWScrollView *)self->_handwritingScrollView contentSize];
  double v5 = v4;
  [(HWScrollView *)self->_handwritingScrollView bounds];
  double v7 = v5 - v6;
  [(HWScrollView *)self->_handwritingScrollView contentInset];
  double v9 = v7 + v8;
  [(HWScrollView *)self->_handwritingScrollView bounds];
  CGFloat v10 = CGRectGetWidth(v14) * 0.8;
  [(HWScrollView *)self->_handwritingScrollView contentOffset];
  double v12 = v10 + v11;
  if (v12 >= v9) {
    double v12 = v9;
  }
  if (v12 + 10.0 >= v9) {
    double v12 = v9;
  }
  [(HWScrollView *)self->_handwritingScrollView setContentOffset:1 animated:v12];
  if (self->_hasSwipeTextBeenShown)
  {
    [(HWBrowserViewController *)self _updateSwipePageHintTextVisibility:1];
  }
}

- (void)_scrollToVisibleRegion
{
  [(DKInkView *)self->_canvasView inkBounds];
  double v26 = v3;
  double v27 = v4;
  double v28 = v6;
  double v29 = v5;
  [(HWBrowserViewController *)self _visibleInkRegionInView];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  uint64_t v15 = [(HWBrowserViewController *)self view];
  [v15 bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v31.origin.x = v8;
  v31.origin.double y = v10;
  v31.size.double width = v12;
  v31.size.double height = v14;
  v33.origin.x = v17;
  v33.origin.double y = v19;
  v33.size.double width = v21;
  v33.size.double height = v23;
  if (!CGRectIntersectsRect(v31, v33))
  {
    v34.origin.x = CGRectZero.origin.x;
    v34.origin.double y = CGRectZero.origin.y;
    v34.size.double width = CGRectZero.size.width;
    v34.size.double height = CGRectZero.size.height;
    v32.origin.x = v8;
    v32.origin.double y = v10;
    v32.size.double width = v12;
    v32.size.double height = v14;
    if (!CGRectEqualToRect(v32, v34))
    {
      double v24 = 0.0;
      if (v26 >= 60.0) {
        double v24 = v26;
      }
      handwritingScrollView = self->_handwritingScrollView;
      -[HWScrollView scrollRectToVisible:animated:](handwritingScrollView, "scrollRectToVisible:animated:", 1, v24, v29, v28, v27);
    }
  }
}

- (CGRect)_visibleInkRegionInView
{
  [(DKInkView *)self->_canvasView inkBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(HWBrowserViewController *)self view];
  CGFloat v12 = [(HWBrowserViewController *)self canvasView];
  objc_msgSend(v11, "convertRect:fromView:", v12, v4, v6, v8, v10);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.x = v21;
  return result;
}

- (id)_createAdvancePageRightButton
{
  double v3 = -[HWView initWithFrame:]([HWView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(HWView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v4 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:-1 scale:30.0];
  double v5 = +[UIImage systemImageNamed:@"chevron.right" withConfiguration:v4];

  double v6 = +[NSBundle hw_handwritingPluginBundle];
  double v7 = [v6 localizedStringForKey:@"Next page" value:&stru_28B68 table:@"HWBrowserViewController"];
  double v8 = [(HWBrowserViewController *)self _pageButtonWith:"_scrollPageToRight:" image:v5 label:v7];

  objc_msgSend(v8, "setImageEdgeInsets:", 0.0, 0.0, 0.0, 2.0);
  [(HWView *)v3 addSubview:v8];
  double v9 = [v8 leadingAnchor];
  double v10 = [(HWView *)v3 leadingAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10];

  [v11 setConstant:4.5];
  [v11 setActive:1];
  CGFloat v12 = [v8 centerYAnchor];
  double v13 = [(HWView *)v3 centerYAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  return v3;
}

- (id)_createAdvancePageLeftButton
{
  double v3 = -[HWView initWithFrame:]([HWView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(HWView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v4 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:-1 scale:30.0];
  double v5 = +[UIImage systemImageNamed:@"chevron.left" withConfiguration:v4];

  double v6 = +[NSBundle hw_handwritingPluginBundle];
  double v7 = [v6 localizedStringForKey:@"Previous page" value:&stru_28B68 table:@"HWBrowserViewController"];
  double v8 = [(HWBrowserViewController *)self _pageButtonWith:"_scrollPageToLeft:" image:v5 label:v7];

  objc_msgSend(v8, "setImageEdgeInsets:", 0.0, 2.0, 0.0, 0.0);
  [(HWView *)v3 addSubview:v8];
  double v9 = [v8 trailingAnchor];
  double v10 = [(HWView *)v3 trailingAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10];

  [v11 setConstant:-4.5];
  [v11 setActive:1];
  CGFloat v12 = [v8 centerYAnchor];
  double v13 = [(HWView *)v3 centerYAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  return v3;
}

- (id)_pageButtonWith:(SEL)a3 image:(id)a4 label:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  double v10 = +[UIButton buttonWithType:1];
  [v10 setAccessibilityLabel:v8];

  double v11 = +[UIColor advancePageButtonEnabledColor];
  [v10 setTintColor:v11];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setContentHorizontalAlignment:0];
  [v10 addTarget:self action:a3 forControlEvents:64];
  [v10 setImage:v9 forState:0];

  CGFloat v12 = [v10 widthAnchor];
  double v13 = [v12 constraintEqualToConstant:40.0];
  [v13 setActive:1];

  double v14 = [v10 heightAnchor];
  double v15 = [v14 constraintEqualToConstant:60.0];
  [v15 setActive:1];

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HWBrowserViewController;
  id v4 = a3;
  [(HWBrowserViewController *)&v8 traitCollectionDidChange:v4];
  double v5 = [(HWBrowserViewController *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(HWBrowserViewController *)self _updateUserInterfaceStyle];
  }
}

- (void)_updateUserInterfaceStyle
{
  [(HWBrowserViewController *)self _updateCoronaColors];

  [(HWBrowserViewController *)self _updateBackgroundView];
}

- (void)_updateCoronaColors
{
  id v3 = +[UIColor favoritesPickerBorderColor];
  id v4 = [v3 CGColor];
  double v5 = [(DKInkView *)self->_canvasView layer];
  [v5 setBorderColor:v4];

  id v8 = +[UIColor favoritesPickerBorderColor];
  id v6 = [v8 CGColor];
  id v7 = [(UIView *)self->_handwritingContainerView layer];
  [v7 setBorderColor:v6];
}

- (void)_updateBackgroundView
{
  double v17 = self->_backgroundView;
  id v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (char *)&dword_0 + 1)
  {
  }
  else
  {
    id v4 = [(HWBrowserViewController *)self traitCollection];
    double v5 = (char *)[v4 userInterfaceStyle];

    if (v5 != (unsigned char *)&dword_0 + 2)
    {
      id v9 = objc_alloc((Class)UIView);
      double v10 = [(HWBrowserViewController *)self view];
      [v10 bounds];
      double v11 = (UIView *)objc_msgSend(v9, "initWithFrame:");
      backgroundView = self->_backgroundView;
      self->_backgroundView = v11;

      id v6 = +[UIColor handwritingBrowserBackgroundColor];
      [(UIView *)self->_backgroundView setBackgroundColor:v6];
      goto LABEL_6;
    }
  }
  id v6 = +[HWBlurEffect effectWithStyle:1];
  id v7 = (UIView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v6];
  id v8 = self->_backgroundView;
  self->_backgroundView = v7;

LABEL_6:
  [(UIView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v13 = [(UIView *)v17 superview];
  double v14 = v13;
  if (v13)
  {
    double v15 = [v13 subviews];
    id v16 = [v15 indexOfObject:v17];

    if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [(UIView *)v17 removeFromSuperview];
      [v14 insertSubview:self->_backgroundView atIndex:v16];
    }
  }
}

- (void)_setupViewHierarchyForiPadWithBindings:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v9 = objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setUserInteractionEnabled:0];
  [(UIStackView *)self->_topStackView addArrangedSubview:self->_undoButton];
  [(UIStackView *)self->_topStackView addArrangedSubview:self->_clearButton];
  [(UIStackView *)self->_topStackView addArrangedSubview:v9];
  [(UIStackView *)self->_topStackView addArrangedSubview:self->_doneButton];
  LODWORD(v10) = 1132068864;
  [(UIStackView *)self->_topStackView setContentHuggingPriority:1 forAxis:v10];
  LODWORD(v11) = 1132068864;
  [(HWRepeatingButton *)self->_undoButton setContentHuggingPriority:1 forAxis:v11];
  LODWORD(v12) = 1132068864;
  [(UIButton *)self->_clearButton setContentHuggingPriority:1 forAxis:v12];
  LODWORD(v13) = 1132068864;
  [v9 setContentHuggingPriority:1 forAxis:v13];
  LODWORD(v14) = 1132068864;
  [(UIButton *)self->_doneButton setContentHuggingPriority:1 forAxis:v14];
  id v114 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);

  [v114 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v114 setUserInteractionEnabled:0];
  [(UIStackView *)self->_bottomStackView addArrangedSubview:self->_recentsButton];
  [(UIStackView *)self->_bottomStackView addArrangedSubview:v114];
  [(UIStackView *)self->_bottomStackView addArrangedSubview:self->_keyboardButton];
  LODWORD(v15) = 1132068864;
  [(UIStackView *)self->_bottomStackView setContentHuggingPriority:1 forAxis:v15];
  LODWORD(v16) = 1132068864;
  [(UIButton *)self->_recentsButton setContentHuggingPriority:1 forAxis:v16];
  LODWORD(v17) = 1132068864;
  [v114 setContentHuggingPriority:1 forAxis:v17];
  LODWORD(v18) = 1132068864;
  [(UIButton *)self->_keyboardButton setContentHuggingPriority:1 forAxis:v18];
  [(HWFavoritesPickerView *)self->_recentsPicker setHidden:1];
  double v19 = +[UIColor clearColor];
  [(HWFavoritesPickerView *)self->_recentsPicker setBackgroundColor:v19];

  double v20 = [(HWBrowserViewController *)self view];
  [v20 insertSubview:self->_recentsPicker belowSubview:self->_bottomView];

  [(UIView *)self->_handwritingPreviewContainer setHidden:1];
  double v21 = +[UIScreen mainScreen];
  [v21 scale];
  double v23 = 1.0 / v22;
  double v24 = [(DKInkView *)self->_canvasView layer];
  [v24 setBorderWidth:v23];

  id v25 = +[UIColor favoritesPickerBorderColor];
  id v26 = [v25 CGColor];
  double v27 = [(DKInkView *)self->_canvasView layer];
  [v27 setBorderColor:v26];

  double v28 = [(DKInkView *)self->_canvasView layer];
  [v28 setCornerRadius:10.0];

  [(DKInkView *)self->_canvasView setClipsToBounds:1];
  v113 = +[NSNumber numberWithInteger:[(HWBrowserViewController *)self buttonYMargin]];
  v112 = +[NSNumber numberWithInteger:[(HWBrowserViewController *)self inkViewMargin]];
  double v29 = _NSDictionaryOfVariableBindings(@"buttonXMargin, buttonYMargin, labelMargin, bottomBarHeight, inkViewMargin, advanceViewWidth", &off_29B90, v113, &off_29B48, &off_29B78, v112, &off_29B60, 0);
  handwritingScrollView = self->_handwritingScrollView;
  CGRect v31 = [(HWBrowserViewController *)self view];
  CGRect v32 = +[NSLayoutConstraint constraintWithItem:handwritingScrollView attribute:10 relatedBy:0 toItem:v31 attribute:10 multiplier:1.0 constant:0.0];
  scrollViewCenterYConstraint = self->_scrollViewCenterYConstraint;
  self->_scrollViewCenterYConstraint = v32;

  [(NSLayoutConstraint *)self->_scrollViewCenterYConstraint setActive:1];
  CGRect v34 = self->_handwritingScrollView;
  v35 = [(HWBrowserViewController *)self view];
  v36 = +[NSLayoutConstraint constraintWithItem:v34 attribute:5 relatedBy:0 toItem:v35 attribute:5 multiplier:1.0 constant:0.0];
  [v36 setActive:1];

  v37 = self->_handwritingScrollView;
  v38 = [(HWBrowserViewController *)self view];
  v39 = +[NSLayoutConstraint constraintWithItem:v37 attribute:6 relatedBy:0 toItem:v38 attribute:6 multiplier:1.0 constant:0.0];
  [v39 setActive:1];

  v40 = self->_handwritingScrollView;
  v41 = [(HWBrowserViewController *)self view];
  v42 = +[NSLayoutConstraint constraintWithItem:v40 attribute:9 relatedBy:0 toItem:v41 attribute:9 multiplier:1.0 constant:0.0];
  [v42 setActive:1];

  v43 = [(HWScrollView *)self->_handwritingScrollView heightAnchor];
  v44 = [v43 constraintEqualToConstant:*(double *)(qword_335F8 + 8)];
  [v44 setActive:1];

  v45 = [(UIView *)self->_advancePageRightButton widthAnchor];
  v46 = [v45 constraintEqualToConstant:62.0];
  [v46 setActive:1];

  v47 = [(UIView *)self->_advancePageRightButton rightAnchor];
  v48 = [(HWScrollView *)self->_handwritingScrollView rightAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  v50 = [(UIView *)self->_advancePageRightButton heightAnchor];
  v51 = [(HWScrollView *)self->_handwritingScrollView heightAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v53 = [(UIView *)self->_advancePageRightButton centerYAnchor];
  v54 = [(HWScrollView *)self->_handwritingScrollView centerYAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  [v55 setActive:1];

  v56 = [(UIView *)self->_advancePageLeftButton widthAnchor];
  v57 = [v56 constraintEqualToConstant:62.0];
  [v57 setActive:1];

  v58 = [(UIView *)self->_advancePageLeftButton leftAnchor];
  v59 = [(HWScrollView *)self->_handwritingScrollView leftAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  [v60 setActive:1];

  v61 = [(UIView *)self->_advancePageLeftButton heightAnchor];
  v62 = [(HWScrollView *)self->_handwritingScrollView heightAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  [v63 setActive:1];

  v64 = [(UIView *)self->_advancePageLeftButton centerYAnchor];
  v65 = [(HWScrollView *)self->_handwritingScrollView centerYAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  [v66 setActive:1];

  v67 = [(UILabel *)self->_swipeInstructionLabel centerYAnchor];
  v68 = [(HWScrollView *)self->_handwritingScrollView centerYAnchor];
  v69 = [v67 constraintEqualToAnchor:v68 constant:0.0];
  [v69 setActive:1];

  v70 = [(UILabel *)self->_swipeInstructionLabel leftAnchor];
  v71 = [(HWScrollView *)self->_handwritingScrollView leftAnchor];
  v72 = [v70 constraintEqualToAnchor:v71 constant:0.0];
  [v72 setActive:1];

  v73 = [(UILabel *)self->_swipeInstructionLabel rightAnchor];
  v74 = [(HWScrollView *)self->_handwritingScrollView rightAnchor];
  v75 = [v73 constraintEqualToAnchor:v74 constant:0.0];
  [v75 setActive:1];

  v76 = [(UIStackView *)self->_topStackView topAnchor];
  v77 = [(HWBrowserViewController *)self view];
  v78 = [v77 topAnchor];
  v79 = [v76 constraintEqualToAnchor:v78];
  topStackViewToSuperViewTopConstraint = self->_topStackViewToSuperViewTopConstraint;
  self->_topStackViewToSuperViewTopConstraint = v79;

  v81 = [(UIStackView *)self->_topStackView topAnchor];
  v82 = [(HWScrollView *)self->_handwritingScrollView topAnchor];
  v83 = [v81 constraintEqualToAnchor:v82];
  topStackViewTopToTopScrollViewConstraint = self->_topStackViewTopToTopScrollViewConstraint;
  self->_topStackViewTopToTopScrollViewConstraint = v83;

  v85 = [(UIStackView *)self->_topStackView bottomAnchor];
  v86 = [(HWScrollView *)self->_handwritingScrollView topAnchor];
  v87 = [v85 constraintEqualToAnchor:v86];
  topStackViewBottomToTopScrollViewConstraint = self->_topStackViewBottomToTopScrollViewConstraint;
  self->_topStackViewBottomToTopScrollViewConstraint = v87;

  [(NSLayoutConstraint *)self->_topStackViewTopToTopScrollViewConstraint setConstant:*(double *)(qword_335F8 + 264)];
  [(NSLayoutConstraint *)self->_topStackViewTopToTopScrollViewConstraint setActive:1];
  v89 = [(UIStackView *)self->_topStackView heightAnchor];
  [(HWBrowserViewController *)self topBarHeight];
  objc_msgSend(v89, "constraintEqualToConstant:");
  v90 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topStackViewHeightConstraint = self->_topStackViewHeightConstraint;
  self->_topStackViewHeightConstraint = v90;

  [(NSLayoutConstraint *)self->_topStackViewHeightConstraint setActive:1];
  v92 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_topStackView]|" options:0 metrics:v29 views:v4];
  +[NSLayoutConstraint activateConstraints:v92];

  v93 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_topStackView]" options:0 metrics:v29 views:v4];
  +[NSLayoutConstraint activateConstraints:v93];

  v94 = [(UIView *)self->_bottomView bottomAnchor];
  v95 = [(HWBrowserViewController *)self view];
  v96 = [v95 bottomAnchor];
  v97 = [v94 constraintEqualToAnchor:v96];
  bottomStackViewToSuperViewBottomConstraint = self->_bottomStackViewToSuperViewBottomConstraint;
  self->_bottomStackViewToSuperViewBottomConstraint = v97;

  v99 = [(UIView *)self->_bottomView bottomAnchor];
  v100 = [(HWScrollView *)self->_handwritingScrollView bottomAnchor];
  v101 = [v99 constraintEqualToAnchor:v100];
  bottomStackViewBottomToBottomScrollViewConstraint = self->_bottomStackViewBottomToBottomScrollViewConstraint;
  self->_bottomStackViewBottomToBottomScrollViewConstraint = v101;

  v103 = [(UIView *)self->_bottomView topAnchor];
  v104 = [(HWScrollView *)self->_handwritingScrollView bottomAnchor];
  v105 = [v103 constraintEqualToAnchor:v104];
  bottomStackViewTopToBottomScrollViewConstraint = self->_bottomStackViewTopToBottomScrollViewConstraint;
  self->_bottomStackViewTopToBottomScrollViewConstraint = v105;

  [(NSLayoutConstraint *)self->_bottomStackViewBottomToBottomScrollViewConstraint setConstant:*(double *)(qword_335F8 + 272)];
  [(NSLayoutConstraint *)self->_bottomStackViewBottomToBottomScrollViewConstraint setActive:1];
  v107 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_bottomView]|" options:0 metrics:v29 views:v4];
  +[NSLayoutConstraint activateConstraints:v107];

  v108 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_bottomStackView]|" options:0 metrics:v29 views:v4];
  +[NSLayoutConstraint activateConstraints:v108];

  v109 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_bottomStackView]|" options:0 metrics:v29 views:v4];
  +[NSLayoutConstraint activateConstraints:v109];

  v110 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_recentsPicker]|" options:0 metrics:v29 views:v4];
  +[NSLayoutConstraint activateConstraints:v110];

  v111 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_recentsPicker]|" options:0 metrics:v29 views:v4];

  +[NSLayoutConstraint activateConstraints:v111];
}

- (void)_setupViewHierarchyForiPhoneWithBindings:(id)a3
{
  id v96 = a3;
  id v4 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:19.0];
  id v100 = +[UIImage systemImageNamed:@"keyboard" withConfiguration:v4];

  [(UIButton *)self->_keyboardButton setImage:v100 forState:0];
  id v5 = [HWPreviewBubbleView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v9 = -[HWPreviewBubbleView initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  handwritingPreviewBubble = self->_handwritingPreviewBubble;
  self->_handwritingPreviewBubble = v9;

  [(HWPreviewBubbleView *)self->_handwritingPreviewBubble setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HWPreviewBubbleView *)self->_handwritingPreviewBubble setInkView:self->_canvasView];
  [(DKInkView *)self->_canvasView setRenderPreviewDelegate:self->_handwritingPreviewBubble];
  [(UIView *)self->_handwritingPreviewContainer addSubview:self->_handwritingPreviewBubble];
  double v11 = +[UIScreen mainScreen];
  [v11 scale];
  double v13 = 1.0 / v12;
  double v14 = [(UIView *)self->_handwritingContainerView layer];
  [v14 setBorderWidth:v13];

  id v15 = +[UIColor favoritesPickerBorderColor];
  id v16 = [v15 CGColor];
  double v17 = [(UIView *)self->_handwritingContainerView layer];
  [v17 setBorderColor:v16];

  LODWORD(v18) = 1144750080;
  [(UIButton *)self->_keyboardButton setContentHuggingPriority:0 forAxis:v18];
  [(UIStackView *)self->_topStackView addArrangedSubview:self->_undoButton];
  [(UIStackView *)self->_topStackView addArrangedSubview:self->_clearButton];
  [(UIStackView *)self->_topStackView addArrangedSubview:self->_handwritingPreviewContainer];
  [(UIStackView *)self->_topStackView addArrangedSubview:self->_doneButton];
  double v19 = [(HWRepeatingButton *)self->_undoButton heightAnchor];
  double v20 = [(UIStackView *)self->_topStackView heightAnchor];
  double v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  double v22 = [(HWRepeatingButton *)self->_undoButton topAnchor];
  double v23 = [(UIStackView *)self->_topStackView topAnchor];
  double v24 = [v22 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  id v25 = [(UIButton *)self->_clearButton heightAnchor];
  id v26 = [(UIStackView *)self->_topStackView heightAnchor];
  double v27 = [v25 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  double v28 = [(UIButton *)self->_clearButton topAnchor];
  double v29 = [(UIStackView *)self->_topStackView topAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  CGRect v31 = [(UIView *)self->_handwritingPreviewContainer heightAnchor];
  CGRect v32 = [(UIStackView *)self->_topStackView heightAnchor];
  CGRect v33 = [v31 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  CGRect v34 = [(UIView *)self->_handwritingPreviewContainer topAnchor];
  v35 = [(UIStackView *)self->_topStackView topAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v36 setActive:1];

  v37 = [(UIButton *)self->_doneButton heightAnchor];
  v38 = [(UIStackView *)self->_topStackView heightAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  [v39 setActive:1];

  v40 = [(UIButton *)self->_doneButton topAnchor];
  v41 = [(UIStackView *)self->_topStackView topAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v42 setActive:1];

  id v43 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
  v99 = v43;
  [v43 setUserInteractionEnabled:0];
  [(UIStackView *)self->_bottomStackView addArrangedSubview:self->_inputMethodPickerButton];
  [(UIStackView *)self->_bottomStackView addArrangedSubview:self->_recentsPicker];
  [(UIStackView *)self->_bottomStackView addArrangedSubview:v43];
  [(UIStackView *)self->_bottomStackView addArrangedSubview:self->_keyboardButton];
  v98 = +[NSNumber numberWithInteger:[(HWBrowserViewController *)self buttonYMargin]];
  v97 = +[NSNumber numberWithInteger:[(HWBrowserViewController *)self inkViewMargin]];
  v44 = _NSDictionaryOfVariableBindings(@"buttonXMargin, buttonYMargin, labelMargin, bottomBarHeight, inkViewMargin, advanceViewWidth", &off_29B90, v98, &off_29B48, &off_29B78, v97, &off_29B60, 0);
  v45 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_handwritingScrollView]|" options:0 metrics:v44 views:v96];
  +[NSLayoutConstraint activateConstraints:v45];

  v46 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_topStackView][_handwritingScrollView][_bottomView]" options:0 metrics:v44 views:v96];
  +[NSLayoutConstraint activateConstraints:v46];

  v47 = [(UIView *)self->_advancePageRightButton widthAnchor];
  v48 = [v47 constraintEqualToConstant:62.0];
  rightPageButtonWidthAnchor = self->_rightPageButtonWidthAnchor;
  self->_rightPageButtonWidthAnchor = v48;

  [(NSLayoutConstraint *)self->_rightPageButtonWidthAnchor setActive:1];
  v50 = [(UIView *)self->_advancePageRightButton rightAnchor];
  v51 = [(HWScrollView *)self->_handwritingScrollView rightAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v53 = [(UIView *)self->_advancePageRightButton heightAnchor];
  v54 = [(HWScrollView *)self->_handwritingScrollView heightAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  [v55 setActive:1];

  v56 = [(UIView *)self->_advancePageRightButton centerYAnchor];
  v57 = [(HWScrollView *)self->_handwritingScrollView centerYAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  [v58 setActive:1];

  v59 = [(UIView *)self->_advancePageLeftButton widthAnchor];
  v60 = [v59 constraintEqualToConstant:62.0];
  leftPageButtonWidthAnchor = self->_leftPageButtonWidthAnchor;
  self->_leftPageButtonWidthAnchor = v60;

  [(NSLayoutConstraint *)self->_leftPageButtonWidthAnchor setActive:1];
  v62 = [(UIView *)self->_advancePageLeftButton leftAnchor];
  v63 = [(HWScrollView *)self->_handwritingScrollView leftAnchor];
  v64 = [v62 constraintEqualToAnchor:v63];
  [v64 setActive:1];

  v65 = [(UIView *)self->_advancePageLeftButton heightAnchor];
  v66 = [(HWScrollView *)self->_handwritingScrollView heightAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  [v67 setActive:1];

  v68 = [(UIView *)self->_advancePageLeftButton centerYAnchor];
  v69 = [(HWScrollView *)self->_handwritingScrollView centerYAnchor];
  v70 = [v68 constraintEqualToAnchor:v69];
  [v70 setActive:1];

  v71 = [(UILabel *)self->_swipeInstructionLabel centerYAnchor];
  v72 = [(HWScrollView *)self->_handwritingScrollView centerYAnchor];
  v73 = [v71 constraintEqualToAnchor:v72 constant:0.0];
  [v73 setActive:1];

  v74 = [(UILabel *)self->_swipeInstructionLabel leftAnchor];
  v75 = [(HWScrollView *)self->_handwritingScrollView leftAnchor];
  v76 = [v74 constraintEqualToAnchor:v75 constant:0.0];
  [v76 setActive:1];

  v77 = [(UILabel *)self->_swipeInstructionLabel rightAnchor];
  v78 = [(HWScrollView *)self->_handwritingScrollView rightAnchor];
  v79 = [v77 constraintEqualToAnchor:v78 constant:0.0];
  [v79 setActive:1];

  v80 = _NSDictionaryOfVariableBindings(@"_handwritingPreviewBubble", self->_handwritingPreviewBubble, 0);
  v81 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_handwritingPreviewBubble]|" options:0 metrics:v44 views:v80];
  +[NSLayoutConstraint activateConstraints:v81];

  v82 = +[NSLayoutConstraint constraintWithItem:self->_handwritingPreviewBubble attribute:10 relatedBy:0 toItem:self->_handwritingPreviewContainer attribute:10 multiplier:1.0 constant:0.0];
  [v82 setActive:1];

  v83 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_topStackView]|" options:0 metrics:v44 views:v96];
  +[NSLayoutConstraint activateConstraints:v83];

  v84 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_topStackView]" options:0 metrics:v44 views:v96];
  +[NSLayoutConstraint activateConstraints:v84];

  v85 = [(UIStackView *)self->_topStackView heightAnchor];
  [(HWBrowserViewController *)self topBarHeight];
  objc_msgSend(v85, "constraintEqualToConstant:");
  v86 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topStackViewHeightConstraint = self->_topStackViewHeightConstraint;
  self->_topStackViewHeightConstraint = v86;

  [(NSLayoutConstraint *)self->_topStackViewHeightConstraint setActive:1];
  v88 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_bottomView]|" options:0 metrics:v44 views:v96];
  +[NSLayoutConstraint activateConstraints:v88];

  v89 = [(UIView *)self->_bottomView bottomAnchor];
  v90 = [(HWBrowserViewController *)self view];
  v91 = [v90 safeAreaLayoutGuide];
  v92 = [v91 bottomAnchor];
  v93 = [v89 constraintEqualToAnchor:v92 constant:0.0];
  [v93 setActive:1];

  v94 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_bottomStackView]|" options:0 metrics:v44 views:v96];
  +[NSLayoutConstraint activateConstraints:v94];

  v95 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_bottomStackView]|" options:0 metrics:v44 views:v96];

  +[NSLayoutConstraint activateConstraints:v95];
}

- (void)_pickLayoutForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(HWBrowserViewController *)self setCurrentLayoutSize:"setCurrentLayoutSize:"];
  id v6 = +[UIScreen mainScreen];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v22.origin.x = v8;
  v22.origin.double y = v10;
  v22.size.double width = v12;
  v22.size.double height = v14;
  double v15 = CGRectGetWidth(v22);
  v23.origin.x = v8;
  v23.origin.double y = v10;
  v23.size.double width = v12;
  v23.size.double height = v14;
  double v16 = CGRectGetHeight(v23);
  if (v15 >= v16) {
    double v17 = v16;
  }
  else {
    double v17 = v15;
  }
  double v18 = *(double *)(qword_335F8 + 8);
  if (HWDeviceIsiPad())
  {
    double v19 = height - v18;
    if (width <= v17 || v19 <= 50.0) {
      [(HWBrowserViewController *)self _configureLayoutToiPadPortrait];
    }
    else {
      [(HWBrowserViewController *)self _configureLayoutToiPadLandscape];
    }
    [(HWFavoritesPickerView *)self->_recentsPicker isHidden];
    [(HWBrowserViewController *)self _updateLayoutForRecentsPickerHidden:"_updateLayoutForRecentsPickerHidden:"];
  }
  else if (width <= v17)
  {
    [(HWBrowserViewController *)self _configureLayoutToiPhoneRecentsPicker];
  }
  else
  {
    [(HWBrowserViewController *)self _configureLayoutToiPhoneWritepad];
  }
}

- (BOOL)_deviceOrientationPortrait
{
  [(HWBrowserViewController *)self currentLayoutSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = +[UIScreen mainScreen];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v23.origin.x = v9;
  v23.origin.double y = v11;
  v23.size.double width = v13;
  v23.size.double height = v15;
  double Width = CGRectGetWidth(v23);
  v24.origin.x = v9;
  v24.origin.double y = v11;
  v24.size.double width = v13;
  v24.size.double height = v15;
  double Height = CGRectGetHeight(v24);
  if (Width >= Height) {
    double v18 = Height;
  }
  else {
    double v18 = Width;
  }
  unsigned __int8 v19 = [(HWBrowserViewController *)self _heightAvailableForLandscapeStylePresentation:v6];
  BOOL v20 = HWDeviceIsiPad();
  char v21 = v19 ^ 1;
  if (v4 <= v18) {
    char v21 = 1;
  }
  if (v20) {
    return v21;
  }
  else {
    return v4 <= v18;
  }
}

- (void)_configureLayoutToiPadPortrait
{
  double v3 = [(HWBrowserViewController *)self _keyboardImageDeviceSize:!HWDeviceIsLargeiPad() orientationIsLandscape:0];
  [(UIButton *)self->_keyboardButton setImage:v3 forState:0];
  double v4 = [(HWBrowserViewController *)self _recentsPickerImageForState:[(HWFavoritesPickerView *)self->_recentsPicker isHidden] ^ 1 isLandscape:0];
  [(UIButton *)self->_recentsButton setImage:v4 forState:0];
  -[UIStackView setLayoutMargins:](self->_topStackView, "setLayoutMargins:", *(double *)(qword_335F8 + 96), *(double *)(qword_335F8 + 104), *(double *)(qword_335F8 + 112), *(double *)(qword_335F8 + 120));
  -[UIStackView setLayoutMargins:](self->_bottomStackView, "setLayoutMargins:", *(double *)(qword_335F8 + 128), *(double *)(qword_335F8 + 136), *(double *)(qword_335F8 + 144), *(double *)(qword_335F8 + 152));
  -[HWScrollView setContentInset:](self->_handwritingScrollView, "setContentInset:", *(double *)(qword_335F8 + 16), *(double *)(qword_335F8 + 24), *(double *)(qword_335F8 + 32), *(double *)(qword_335F8 + 40));
  topStackViewBottomToTopScrollViewConstraint = self->_topStackViewBottomToTopScrollViewConstraint;
  v12[0] = self->_topStackViewToSuperViewTopConstraint;
  v12[1] = topStackViewBottomToTopScrollViewConstraint;
  bottomStackViewTopToBottomScrollViewConstraint = self->_bottomStackViewTopToBottomScrollViewConstraint;
  v12[2] = self->_bottomStackViewToSuperViewBottomConstraint;
  v12[3] = bottomStackViewTopToBottomScrollViewConstraint;
  double v7 = +[NSArray arrayWithObjects:v12 count:4];
  +[NSLayoutConstraint deactivateConstraints:v7];

  [(NSLayoutConstraint *)self->_scrollViewCenterYConstraint setConstant:*(double *)(qword_335F8 + 80)];
  bottomStackViewBottomToBottomScrollViewConstraint = self->_bottomStackViewBottomToBottomScrollViewConstraint;
  v11[0] = self->_topStackViewTopToTopScrollViewConstraint;
  v11[1] = bottomStackViewBottomToBottomScrollViewConstraint;
  bottomViewHeightConstraint = self->_bottomViewHeightConstraint;
  v11[2] = self->_topStackViewHeightConstraint;
  v11[3] = bottomViewHeightConstraint;
  double v10 = +[NSArray arrayWithObjects:v11 count:4];
  +[NSLayoutConstraint activateConstraints:v10];

  [(HWFavoritesPickerView *)self->_recentsPicker setLayoutMode:2];
  [(HWFavoritesPickerView *)self->_recentsPicker reloadData];
}

- (void)_configureLayoutToiPadLandscape
{
  double v3 = [(HWBrowserViewController *)self _keyboardImageDeviceSize:!HWDeviceIsLargeiPad() orientationIsLandscape:1];
  [(UIButton *)self->_keyboardButton setImage:v3 forState:0];
  double v4 = [(HWBrowserViewController *)self _recentsPickerImageForState:[(HWFavoritesPickerView *)self->_recentsPicker isHidden] ^ 1 isLandscape:1];
  [(UIButton *)self->_recentsButton setImage:v4 forState:0];
  -[UIStackView setLayoutMargins:](self->_topStackView, "setLayoutMargins:", *(double *)(qword_335F8 + 160), *(double *)(qword_335F8 + 168), *(double *)(qword_335F8 + 176), *(double *)(qword_335F8 + 184));
  -[UIStackView setLayoutMargins:](self->_bottomStackView, "setLayoutMargins:", *(double *)(qword_335F8 + 192), *(double *)(qword_335F8 + 200), *(double *)(qword_335F8 + 208), *(double *)(qword_335F8 + 216));
  -[HWScrollView setContentInset:](self->_handwritingScrollView, "setContentInset:", *(double *)(qword_335F8 + 48), *(double *)(qword_335F8 + 56), *(double *)(qword_335F8 + 64), *(double *)(qword_335F8 + 72));
  bottomStackViewBottomToBottomScrollViewConstraint = self->_bottomStackViewBottomToBottomScrollViewConstraint;
  v12[0] = self->_topStackViewTopToTopScrollViewConstraint;
  v12[1] = bottomStackViewBottomToBottomScrollViewConstraint;
  bottomViewHeightConstraint = self->_bottomViewHeightConstraint;
  v12[2] = self->_topStackViewHeightConstraint;
  v12[3] = bottomViewHeightConstraint;
  double v7 = +[NSArray arrayWithObjects:v12 count:4];
  +[NSLayoutConstraint deactivateConstraints:v7];

  [(NSLayoutConstraint *)self->_scrollViewCenterYConstraint setConstant:*(double *)(qword_335F8 + 88)];
  topStackViewBottomToTopScrollViewConstraint = self->_topStackViewBottomToTopScrollViewConstraint;
  v11[0] = self->_topStackViewToSuperViewTopConstraint;
  v11[1] = topStackViewBottomToTopScrollViewConstraint;
  bottomStackViewTopToBottomScrollViewConstraint = self->_bottomStackViewTopToBottomScrollViewConstraint;
  v11[2] = self->_bottomStackViewToSuperViewBottomConstraint;
  v11[3] = bottomStackViewTopToBottomScrollViewConstraint;
  double v10 = +[NSArray arrayWithObjects:v11 count:4];
  +[NSLayoutConstraint activateConstraints:v10];

  [(HWFavoritesPickerView *)self->_recentsPicker setLayoutMode:1];
}

- (void)_configureLayoutToiPhoneWritepad
{
  [(HWScrollView *)self->_handwritingScrollView setHidden:0];
  [(DKInkView *)self->_canvasView setHidden:0];
  [(UIView *)self->_advancePageRightButton setHidden:0];
  [(UIView *)self->_advancePageLeftButton setHidden:0];
  [(UIStackView *)self->_topStackView setHidden:0];
  [(UILabel *)self->_roateInstructionLabel removeFromSuperview];
  [(HWFavoritesPickerView *)self->_recentsPicker setLayoutMode:1];
  [(HWFavoritesPickerView *)self->_recentsPicker removeFromSuperview];
  double v3 = [(UIStackView *)self->_bottomStackView arrangedSubviews];
  double v4 = (char *)[v3 indexOfObject:self->_inputMethodPickerButton] + 1;

  [(UIStackView *)self->_bottomStackView insertArrangedSubview:self->_recentsPicker atIndex:v4];
  double v5 = [(UIStackView *)self->_bottomStackView arrangedSubviews];
  double v6 = (char *)[v5 indexOfObject:self->_keyboardButton] - 1;

  double v7 = [(UIStackView *)self->_bottomStackView arrangedSubviews];
  double v8 = [v7 objectAtIndex:v6];
  [v8 setHidden:1];

  CGFloat v9 = [(UIStackView *)self->_bottomStackView heightAnchor];
  double v10 = [(HWFavoritesPickerView *)self->_recentsPicker heightAnchor];
  CGFloat v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  [(UIButton *)self->_inputMethodPickerButton setHidden:1];
  [(UILabel *)self->_roateInstructionLabel setHidden:1];
  keyboardButton = self->_keyboardButton;

  [(UIButton *)keyboardButton setHidden:0];
}

- (void)_configureLayoutToiPhoneRecentsPicker
{
  [(UIStackView *)self->_bottomStackView removeArrangedSubview:self->_recentsPicker];
  [(HWFavoritesPickerView *)self->_recentsPicker removeFromSuperview];
  double v3 = [(UIStackView *)self->_bottomStackView arrangedSubviews];
  double v4 = (char *)[v3 indexOfObject:self->_keyboardButton] - 1;

  double v5 = [(UIStackView *)self->_bottomStackView arrangedSubviews];
  double v6 = [v5 objectAtIndex:v4];
  [v6 setHidden:0];

  [(HWFavoritesPickerView *)self->_recentsPicker setLayoutMode:2];
  [(UILabel *)self->_roateInstructionLabel setHidden:0];
  [(UIButton *)self->_keyboardButton setHidden:1];
  [(UIButton *)self->_inputMethodPickerButton setHidden:0];
  [(UIStackView *)self->_topStackView setHidden:1];
  [(HWScrollView *)self->_handwritingScrollView setHidden:1];
  [(DKInkView *)self->_canvasView setHidden:1];
  [(UIView *)self->_advancePageRightButton setHidden:1];
  [(UIView *)self->_advancePageLeftButton setHidden:1];
  double v7 = [(HWBrowserViewController *)self view];
  [v7 insertSubview:self->_recentsPicker aboveSubview:self->_handwritingScrollView];

  [(UIView *)self->_bottomView insertSubview:self->_roateInstructionLabel aboveSubview:self->_bottomStackView];
  _NSDictionaryOfVariableBindings(@"_recentsPicker, _bottomView, _roateInstructionLabel", self->_recentsPicker, self->_bottomView, self->_roateInstructionLabel, 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  double v8 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_recentsPicker]|" options:0 metrics:0 views:v12];
  +[NSLayoutConstraint activateConstraints:v8];

  CGFloat v9 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_recentsPicker][_bottomView]|" options:0 metrics:0 views:v12];
  +[NSLayoutConstraint activateConstraints:v9];

  double v10 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_roateInstructionLabel]|" options:0 metrics:0 views:v12];
  +[NSLayoutConstraint activateConstraints:v10];

  CGFloat v11 = +[NSLayoutConstraint constraintWithItem:self->_roateInstructionLabel attribute:10 relatedBy:0 toItem:self->_inputMethodPickerButton attribute:10 multiplier:1.0 constant:0.0];
  [v11 setActive:1];
}

- (id)_recentsPickerImageForState:(BOOL)a3 isLandscape:(BOOL)a4
{
  if (a3) {
    CFStringRef v4 = @"clock.fill";
  }
  else {
    CFStringRef v4 = @"clock";
  }
  double v5 = 16.0;
  if (a4) {
    double v5 = 20.0;
  }
  double v6 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:v5];
  double v7 = +[UIImage systemImageNamed:v4 withConfiguration:v6];

  return v7;
}

- (id)_keyboardImageDeviceSize:(BOOL)a3 orientationIsLandscape:(BOOL)a4
{
  double v4 = 17.0;
  double v5 = 19.0;
  if (!a3)
  {
    double v5 = 17.0;
    double v4 = 16.0;
  }
  if (a4) {
    double v4 = v5;
  }
  double v6 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:v4];
  double v7 = +[UIImage systemImageNamed:@"keyboard" withConfiguration:v6];

  return v7;
}

- (BOOL)_heightAvailableForLandscapeStylePresentation:(double)a3
{
  return a3 - *(double *)(qword_335F8 + 8) > 50.0;
}

- (void)_updateLayoutForKeboardInterfaceOrientaion
{
  if ([(HWBrowserViewController *)self _currentKeyboardIsRTL]) {
    id v3 = &dword_4;
  }
  else {
    id v3 = &dword_0 + 3;
  }
  if ([(UIStackView *)self->_topStackView semanticContentAttribute] == v3)
  {
    [(UIStackView *)self->_bottomStackView setSemanticContentAttribute:3];
  }
  else
  {
    [(UIStackView *)self->_topStackView setSemanticContentAttribute:v3];
    [(UIStackView *)self->_topStackView setNeedsLayout];
    self->_canvasNeedsRepositioning = 1;
    [(UIStackView *)self->_bottomStackView setSemanticContentAttribute:3];
    [(HWFavoritesPickerView *)self->_recentsPicker setSemanticContentAttribute:v3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    double v4 = [(HWFavoritesPickerView *)self->_recentsPicker subviews];
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        double v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) setSemanticContentAttribute:v3];
          double v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(UIStackView *)self->_bottomStackView setNeedsLayout];
    [(HWFavoritesPickerView *)self->_recentsPicker resetScrollPosition];
  }
  CGFloat v9 = [(HWBrowserViewController *)self view];
  [v9 layoutIfNeeded];
}

- (BOOL)_currentKeyboardIsRTL
{
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  id v3 = [v2 currentInputMode];

  if ([v3 isExtensionInputMode])
  {
    double v4 = [v3 primaryLanguage];
    id v5 = [v4 lowercaseString];
    if ([v5 hasPrefix:@"und"])
    {
    }
    else
    {
      id v6 = [v3 primaryLanguage];
      uint64_t v7 = [v6 lowercaseString];
      unsigned int v8 = [v7 hasPrefix:@"mul"];

      if (!v8)
      {
        long long v11 = [v3 primaryLanguage];
        unsigned __int8 v9 = (char *)+[NSLocale characterDirectionForLanguage:v11] == (char *)&dword_0 + 2;

        goto LABEL_6;
      }
    }
  }
  unsigned __int8 v9 = [v3 isDefaultRightToLeft];
LABEL_6:

  return v9;
}

- (void)setCurrentHandwritingItem:(id)a3
{
  p_currentHandwritingItem = &self->_currentHandwritingItem;
  uint64_t v7 = (HWHandwritingItem *)a3;
  if (*p_currentHandwritingItem != v7)
  {
    objc_storeStrong((id *)&self->_currentHandwritingItem, a3);
    id v6 = [(HWHandwritingItem *)*p_currentHandwritingItem drawing];
    if (!v6) {
      id v6 = objc_alloc_init((Class)DKDrawing);
    }
    [(DKInkView *)self->_canvasView setCurrentDrawing:v6 scaleDrawingToFitBounds:0 withAnimationType:0 animationCompletionHandler:0];
    [(HWBrowserViewController *)self _udpatePageButtonVisibility:1];
  }
  [(HWBrowserViewController *)self _updateUndoButton:0];
}

- (void)sendEncodedHandwriting:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc_init((Class)sub_AB30());
  [v7 setData:v4];

  BOOL v5 = HWDeviceIsiPhone();
  id v6 = [(HWCKBrowserViewController *)self sendDelegate];
  [v6 startEditingPayload:v7 dismiss:v5];
}

- (void)_workaround_sendNilMessageToForceModalDismiss
{
  id v2 = [(HWCKBrowserViewController *)self sendDelegate];
  [v2 commitPayload:0];
}

- (void)_datasourceUpdated:(id)a3
{
  id v6 = +[HWRecentsManager sharedManager];
  id v4 = [v6 items];
  BOOL v5 = [(HWBrowserViewController *)self recentsPicker];
  [v5 setItems:v4];
}

- (void)_updateUndoButton:(id)a3
{
  id v4 = [(DKInkView *)self->_canvasView strokeUndoManager];
  -[HWRepeatingButton setEnabled:](self->_undoButton, "setEnabled:", [v4 canUndo]);

  BOOL v5 = [(HWBrowserViewController *)self recentsPicker];
  [v5 cancelEditing:1];

  [(HWBrowserViewController *)self _updateClearButton];

  [(HWBrowserViewController *)self _udpatePageButtonVisibility:1];
}

- (void)_updateClearButton
{
  id v3 = [(DKInkView *)self->_canvasView strokeUndoManager];
  if ([v3 canUndo])
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [(HWBrowserViewController *)self canvasView];
    id v6 = [v5 currentDrawing];
    BOOL v4 = (uint64_t)[v6 totalPoints] < 1;
  }
  clearButton = self->_clearButton;

  [(UIButton *)clearButton setHidden:v4];
}

- (void)_inkViewTouchesEndedNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 object];
  if (v5 == self->_canvasView)
  {
    [(HWBrowserViewController *)self _udpatePageButtonVisibility:1];
    [(HWBrowserViewController *)self _updateClearButton];
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKey:DKInkViewTouchesEndedLocationInViewUserInfoKey];

    if (!v7)
    {
LABEL_10:

      goto LABEL_11;
    }
    CGPoint v13 = CGPointZero;
    CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)v7, &v13);
    if ([(HWBrowserViewController *)self _currentKeyboardIsRTL])
    {
      unsigned int v8 = self->_advancePageLeftButton;
      [(UIView *)v8 convertPoint:v5 fromView:v13];
      double v10 = v9;
      [(UIView *)v8 bounds];
      if (v10 < CGRectGetWidth(v14))
      {
        long long v11 = &selRef__scrollPageToLeft_;
LABEL_8:
        [(HWBrowserViewController *)self performSelector:*v11 withObject:self afterDelay:0.0];
      }
    }
    else
    {
      unsigned int v8 = self->_advancePageRightButton;
      [(UIView *)v8 convertPoint:v5 fromView:v13];
      if (v12 > 0.0)
      {
        long long v11 = &selRef__scrollPageToRight_;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (void)_inkViewTouchesBeganNotification:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_hasSwipeTextBeenShown)
  {
    [(HWBrowserViewController *)self _updateSwipePageHintTextVisibility:1];
    id v4 = v6;
  }
  BOOL v5 = [v4 object];
  if (v5 == self->_canvasView) {
    [(HWBrowserViewController *)self _sendTypingIndicator];
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  [(DKInkView *)self->_canvasView teardown];
  canvasView = self->_canvasView;
  self->_canvasView = 0;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  [(HWBrowserViewController *)self _updateLayoutForKeboardInterfaceOrientaion];
  id v4 = [(HWBrowserViewController *)self view];
  BOOL v5 = [v4 window];
  unsigned __int8 v6 = [v5 isHidden];

  if ((v6 & 1) == 0)
  {
    canvasView = self->_canvasView;
    [(DKInkView *)canvasView resumeRendering];
  }
}

- (BOOL)supportsResumablePayload
{
  return 1;
}

- (CKBrowserItemPayload)resumablePayload
{
  id v3 = [(HWBrowserViewController *)self _handwritingItemFromCurrentState];
  id v4 = [v3 drawing];
  id v5 = [v4 totalPoints];

  resumablePayload = self->_resumablePayload;
  if ((uint64_t)v5 < 1)
  {
    [(CKBrowserItemPayload *)resumablePayload setData:0];
    double v10 = 0;
  }
  else
  {
    if (!resumablePayload)
    {
      id v7 = (CKBrowserItemPayload *)objc_alloc_init((Class)sub_AB30());
      unsigned int v8 = self->_resumablePayload;
      self->_resumablePayload = v7;
    }
    double v9 = +[HWEncoding encodeHandwriting:v3 compress:1];
    [(CKBrowserItemPayload *)self->_resumablePayload setData:v9];
    double v10 = self->_resumablePayload;
  }

  return v10;
}

- (void)setResumablePayload:(id)a3
{
  if (self->_resumablePayload != a3)
  {
    objc_storeStrong((id *)&self->_resumablePayload, a3);
    objc_storeStrong((id *)&self->_resumablePayloadToLoad, self->_resumablePayload);
    if ([(HWBrowserViewController *)self isViewLoaded]) {
      [(HWBrowserViewController *)self _loadDrawingFromResumablePayload];
    }
  }

  _objc_release_x1();
}

- (void)_loadDrawingFromResumablePayload
{
  id v3 = [(CKBrowserItemPayload *)self->_resumablePayloadToLoad data];
  id v8 = +[HWEncoding decodeHandwritingFromData:v3];

  [(HWBrowserViewController *)self setCurrentHandwritingItem:v8];
  id v4 = [v8 drawing];

  if (!v4)
  {
    id v5 = objc_alloc_init((Class)DKDrawing);
    unsigned __int8 v6 = [(HWBrowserViewController *)self canvasView];
    [v6 setCurrentDrawing:v5];
  }
  resumablePayloadToLoad = self->_resumablePayloadToLoad;
  self->_resumablePayloadToLoad = 0;

  [(HWBrowserViewController *)self _updateUndoButton:0];
}

- (void)pickerDidEnterEditMode:(id)a3
{
}

- (void)pickerDidExitEditMode:(id)a3
{
  double v4 = *(double *)(qword_335F8 + 192);
  double v5 = *(double *)(qword_335F8 + 200);
  double v6 = *(double *)(qword_335F8 + 208);
  double v7 = *(double *)(qword_335F8 + 216);
  id v8 = [(HWBrowserViewController *)self bottomStackView];
  objc_msgSend(v8, "setLayoutMargins:", v4, v5, v6, v7);

  id v9 = [(HWBrowserViewController *)self bottomStackView];
  [v9 layoutIfNeeded];
}

- (double)pickerOffsetForEditMode:(id)a3
{
  return 17.0;
}

- (BOOL)handwritingScrollView:(id)a3 shouldCancelTouchesInView:(id)a4
{
  double v5 = [(HWBrowserViewController *)self canvasView];

  if (!v5) {
    return 0;
  }
  double v6 = [(HWBrowserViewController *)self canvasView];
  id v7 = [v6 countOfCurrentStroke];

  return (uint64_t)v7 < 5;
}

- (void)scrollViewDidScroll:(id)a3
{
  [(HWBrowserViewController *)self _udpatePageButtonVisibility:1];
  if (self->_hasSwipeTextBeenShown)
  {
    [(HWBrowserViewController *)self _updateSwipePageHintTextVisibility:1];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  [(HWBrowserViewController *)self _udpatePageButtonVisibility:1];
  if (!self->_hasSwipeTextBeenShown)
  {
    [(HWBrowserViewController *)self _updateSwipePageHintTextVisibility:1];
  }
}

- (id)_attributedButtonTitleForString:(id)a3 foregroundColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [v8 _scaledValueForValue:*(double *)(qword_335F8 + 280)];
  double v10 = v9;

  long long v11 = +[UIFont systemFontOfSize:v10 weight:UIFontWeightMedium];
  [v7 setObject:v11 forKeyedSubscript:NSFontAttributeName];

  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:NSForegroundColorAttributeName];
  }
  id v12 = [objc_alloc((Class)NSAttributedString) initWithString:v6 attributes:v7];

  return v12;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIStackView)topStackView
{
  return self->_topStackView;
}

- (void)setTopStackView:(id)a3
{
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void)setBottomView:(id)a3
{
}

- (UIStackView)bottomStackView
{
  return self->_bottomStackView;
}

- (void)setBottomStackView:(id)a3
{
}

- (NSLayoutConstraint)bottomViewHeightConstraint
{
  return self->_bottomViewHeightConstraint;
}

- (void)setBottomViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewCenterYConstraint
{
  return self->_scrollViewCenterYConstraint;
}

- (void)setScrollViewCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)topStackViewHeightConstraint
{
  return self->_topStackViewHeightConstraint;
}

- (void)setTopStackViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)leftPageButtonWidthAnchor
{
  return self->_leftPageButtonWidthAnchor;
}

- (void)setLeftPageButtonWidthAnchor:(id)a3
{
}

- (NSLayoutConstraint)rightPageButtonWidthAnchor
{
  return self->_rightPageButtonWidthAnchor;
}

- (void)setRightPageButtonWidthAnchor:(id)a3
{
}

- (NSLayoutConstraint)topStackViewToSuperViewTopConstraint
{
  return self->_topStackViewToSuperViewTopConstraint;
}

- (void)setTopStackViewToSuperViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)topStackViewTopToTopScrollViewConstraint
{
  return self->_topStackViewTopToTopScrollViewConstraint;
}

- (void)setTopStackViewTopToTopScrollViewConstraint:(id)a3
{
}

- (NSLayoutConstraint)topStackViewBottomToTopScrollViewConstraint
{
  return self->_topStackViewBottomToTopScrollViewConstraint;
}

- (void)setTopStackViewBottomToTopScrollViewConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomStackViewToSuperViewBottomConstraint
{
  return self->_bottomStackViewToSuperViewBottomConstraint;
}

- (void)setBottomStackViewToSuperViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomStackViewBottomToBottomScrollViewConstraint
{
  return self->_bottomStackViewBottomToBottomScrollViewConstraint;
}

- (void)setBottomStackViewBottomToBottomScrollViewConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomStackViewTopToBottomScrollViewConstraint
{
  return self->_bottomStackViewTopToBottomScrollViewConstraint;
}

- (void)setBottomStackViewTopToBottomScrollViewConstraint:(id)a3
{
}

- (UIView)handwritingPreviewContainer
{
  return self->_handwritingPreviewContainer;
}

- (void)setHandwritingPreviewContainer:(id)a3
{
}

- (HWPreviewBubbleView)handwritingPreviewBubble
{
  return self->_handwritingPreviewBubble;
}

- (void)setHandwritingPreviewBubble:(id)a3
{
}

- (HWRepeatingButton)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void)setClearButton:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIButton)keyboardButton
{
  return self->_keyboardButton;
}

- (void)setKeyboardButton:(id)a3
{
}

- (UIButton)inputMethodPickerButton
{
  return self->_inputMethodPickerButton;
}

- (void)setInputMethodPickerButton:(id)a3
{
}

- (UIButton)recentsButton
{
  return self->_recentsButton;
}

- (void)setRecentsButton:(id)a3
{
}

- (HWFavoritesPickerView)recentsPicker
{
  return self->_recentsPicker;
}

- (void)setRecentsPicker:(id)a3
{
}

- (UILabel)swipeInstructionLabel
{
  return self->_swipeInstructionLabel;
}

- (void)setSwipeInstructionLabel:(id)a3
{
}

- (UILabel)roateInstructionLabel
{
  return self->_roateInstructionLabel;
}

- (void)setRoateInstructionLabel:(id)a3
{
}

- (UIView)advancePageRightButton
{
  return self->_advancePageRightButton;
}

- (void)setAdvancePageRightButton:(id)a3
{
}

- (UIView)advancePageLeftButton
{
  return self->_advancePageLeftButton;
}

- (void)setAdvancePageLeftButton:(id)a3
{
}

- (DKInkView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
}

- (HWScrollView)handwritingScrollView
{
  return self->_handwritingScrollView;
}

- (void)setHandwritingScrollView:(id)a3
{
}

- (UIView)handwritingContainerView
{
  return self->_handwritingContainerView;
}

- (void)setHandwritingContainerView:(id)a3
{
}

- (HWHandwritingItem)currentHandwritingItem
{
  return self->_currentHandwritingItem;
}

- (CGSize)currentLayoutSize
{
  double width = self->_currentLayoutSize.width;
  double height = self->_currentLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCurrentLayoutSize:(CGSize)a3
{
  self->_currentLayoutSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHandwritingItem, 0);
  objc_storeStrong((id *)&self->_handwritingContainerView, 0);
  objc_storeStrong((id *)&self->_handwritingScrollView, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_advancePageLeftButton, 0);
  objc_storeStrong((id *)&self->_advancePageRightButton, 0);
  objc_storeStrong((id *)&self->_roateInstructionLabel, 0);
  objc_storeStrong((id *)&self->_swipeInstructionLabel, 0);
  objc_storeStrong((id *)&self->_recentsPicker, 0);
  objc_storeStrong((id *)&self->_recentsButton, 0);
  objc_storeStrong((id *)&self->_inputMethodPickerButton, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_handwritingPreviewBubble, 0);
  objc_storeStrong((id *)&self->_handwritingPreviewContainer, 0);
  objc_storeStrong((id *)&self->_bottomStackViewTopToBottomScrollViewConstraint, 0);
  objc_storeStrong((id *)&self->_bottomStackViewBottomToBottomScrollViewConstraint, 0);
  objc_storeStrong((id *)&self->_bottomStackViewToSuperViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topStackViewBottomToTopScrollViewConstraint, 0);
  objc_storeStrong((id *)&self->_topStackViewTopToTopScrollViewConstraint, 0);
  objc_storeStrong((id *)&self->_topStackViewToSuperViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_rightPageButtonWidthAnchor, 0);
  objc_storeStrong((id *)&self->_leftPageButtonWidthAnchor, 0);
  objc_storeStrong((id *)&self->_topStackViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_bottomViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_bottomStackView, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_topStackView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_resumablePayloadToLoad, 0);

  objc_storeStrong((id *)&self->_resumablePayload, 0);
}

@end