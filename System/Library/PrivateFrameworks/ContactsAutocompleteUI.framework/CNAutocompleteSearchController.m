@interface CNAutocompleteSearchController
- (BOOL)autocompleteResultsController:(id)a3 willOverrideImageDataForRecipient:(id)a4 completion:(id)a5;
- (BOOL)autocompleteResultsController:(id)a3 willOverrideImageDataForRecipient:(id)a4 imageUpdateBlock:(id)a5;
- (BOOL)becomeFirstResponder;
- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3;
- (BOOL)collapseSelectedSearchResultForComposeRecipientView:(id)a3;
- (BOOL)composeRecipientViewShowingSearchResults:(id)a3;
- (BOOL)didAddRecipientFromTypedQuery;
- (BOOL)didPresentContactCard;
- (BOOL)didPresentContactPicker;
- (BOOL)didPresentSomeViewController;
- (BOOL)expandRecipientsInNamedGroups;
- (BOOL)expandSelectedSearchResultForComposeRecipientView:(id)a3;
- (BOOL)finalWindowAttached;
- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4;
- (BOOL)hasSmallScreen;
- (BOOL)hasSpaceToDisplaySuggestions;
- (BOOL)ignoreDidFinishAddress;
- (BOOL)isiPhone;
- (BOOL)shouldHideSuggestionsAfterFirstRecipient;
- (BOOL)shouldRestoreFirstResponderToComposeField;
- (BOOL)shouldUseScreenRelativeFooterViewPositioning;
- (BOOL)suggestionsAllowed;
- (BOOL)suggestionsController:(id)a3 imageDataForRecipient:(id)a4 imageUpdateBlock:(id)a5;
- (BOOL)wantsAddButton;
- (CGRect)latestKeyboardFrame;
- (CNAutocompleteResultsTableViewController)resultsController;
- (CNAutocompleteSearchController)initWithSearchManager:(id)a3 textView:(id)a4 resultsController:(id)a5;
- (CNAutocompleteSearchController)initWithSearchType:(unint64_t)a3;
- (CNAutocompleteSearchController)initWithSearchType:(unint64_t)a3 options:(id)a4;
- (CNAutocompleteSearchControllerDelegate)delegate;
- (CNAutocompleteSearchControllerOptions)options;
- (CNAutocompleteSearchControllerSafeDelegateWrapper)delegateWrapper;
- (CNAutocompleteSearchManager)searchManager;
- (CNAutocompleteSuggestionsViewController)suggestionsController;
- (CNComposeRecipientTextView)composeField;
- (NSArray)autocompleteResults;
- (NSArray)expandedOtherRecipientAddresses;
- (NSArray)otherRecipientAddresses;
- (NSArray)recipients;
- (NSNumber)currentTaskID;
- (NSObject)keyboardWillHideNotificationObserver;
- (NSObject)keyboardWillShowNotificationObserver;
- (NSObject)uiContentSizeCategoryDidChangeNotificationObserver;
- (NSString)composeFieldInfoText;
- (UIScrollView)composeFieldScrollView;
- (UIView)composeFieldContainerView;
- (UIView)footerView;
- (UIView)headerView;
- (id)atomViewForRecipient:(id)a3;
- (id)autocompleteResultsController:(id)a3 preferredRecipientForRecipient:(id)a4;
- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4;
- (id)composeRecipientView:(id)a3 contextMenuConfigurationForAtom:(id)a4;
- (id)selectedRecipientsForSuggestionsController:(id)a3;
- (unint64_t)presentationOptionsForRecipient:(id)a3;
- (void)_addRecipient:(id)a3;
- (void)addRecipient:(id)a3;
- (void)adjustInsetsForKeyboardFrame:(CGRect)a3;
- (void)autocompleteResultsController:(id)a3 didAskToRemoveRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didEndDisplayingRowForRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5;
- (void)autocompleteResultsController:(id)a3 willDisplayRowForRecipient:(id)a4;
- (void)autocompleteResultsControllerWillBeginToScroll:(id)a3;
- (void)cancelAutocompleteSearch;
- (void)clearPresentedViewControllerState;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4;
- (void)composeRecipientView:(id)a3 showPersonCardForAtom:(id)a4;
- (void)composeRecipientView:(id)a3 showPersonCardForRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)consumeResults:(id)a3 taskID:(id)a4;
- (void)dealloc;
- (void)disambiguateRecipient:(id)a3;
- (void)finishedTaskWithID:(id)a3;
- (void)hideResultsController;
- (void)hideSoftwareKeyboard;
- (void)hideSuggestionsController;
- (void)invalidatePreferredRecipients;
- (void)invalidateRecipientTintColors;
- (void)prepareForReuse;
- (void)prewarmSuggestedRecipientsWithCompletionBlock:(id)a3;
- (void)providePeopleSuggesterFeedbackForRemovedRecipient:(id)a3;
- (void)providePeopleSuggesterFeedbackForSuggestedRecipient:(id)a3;
- (void)providePeopleSuggesterFeedbackForTypedRecipient:(id)a3;
- (void)providePeopleSuggesterFeedbackForViewWillAppear;
- (void)providePeopleSuggesterFeedbackForViewWillDisappear;
- (void)scrollToBottomOfRecipientView;
- (void)selectNextSearchResultForComposeRecipientView:(id)a3;
- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3;
- (void)setAutocompleteResults:(id)a3;
- (void)setComposeFieldContainerView:(id)a3;
- (void)setComposeFieldInfoText:(id)a3;
- (void)setComposeFieldScrollView:(id)a3;
- (void)setCurrentTaskID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateWrapper:(id)a3;
- (void)setDidAddRecipientFromTypedQuery:(BOOL)a3;
- (void)setDidPresentContactCard:(BOOL)a3;
- (void)setDidPresentContactPicker:(BOOL)a3;
- (void)setExpandRecipientsInNamedGroups:(BOOL)a3;
- (void)setExpandedOtherRecipientAddresses:(id)a3;
- (void)setFinalWindowAttached:(BOOL)a3;
- (void)setFooterView:(id)a3;
- (void)setHasSmallScreen:(BOOL)a3;
- (void)setHeaderView:(id)a3;
- (void)setIgnoreDidFinishAddress:(BOOL)a3;
- (void)setIsiPhone:(BOOL)a3;
- (void)setKeyboardWillHideNotificationObserver:(id)a3;
- (void)setKeyboardWillShowNotificationObserver:(id)a3;
- (void)setLatestKeyboardFrame:(CGRect)a3;
- (void)setOptions:(id)a3;
- (void)setOtherRecipientAddresses:(id)a3;
- (void)setPreferredRecipient:(id)a3 forRecipient:(id)a4;
- (void)setPresentationOptions:(unint64_t)a3 forRecipient:(id)a4;
- (void)setRecipients:(id)a3;
- (void)setSearchManager:(id)a3;
- (void)setShouldHideSuggestionsAfterFirstRecipient:(BOOL)a3;
- (void)setShouldRestoreFirstResponderToComposeField:(BOOL)a3;
- (void)setSuggestionsAllowed:(BOOL)a3;
- (void)setSuggestionsHeaderTitleOverride:(id)a3;
- (void)setTintColor:(id)a3 forRecipient:(id)a4;
- (void)setUiContentSizeCategoryDidChangeNotificationObserver:(id)a3;
- (void)setWantsAddButton:(BOOL)a3;
- (void)showSuggestionsController;
- (void)stopDisambiguatingForComposeRecipientView:(id)a3;
- (void)suggestionsController:(id)a3 didDeselectRecipient:(id)a4;
- (void)suggestionsController:(id)a3 didSelectRecipient:(id)a4;
- (void)suggestionsControllerWillBeginScroll:(id)a3;
- (void)unhideResultsController;
- (void)updateFooterPositionWithKeyboardFrame:(CGRect)a3;
- (void)updateHeaderFooterPositionWithKeyboardIntersectionRect:(CGRect)a3;
- (void)updateHeaderFooterVisibility;
- (void)updateResultsControllerFrame;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CNAutocompleteSearchController

- (BOOL)shouldUseScreenRelativeFooterViewPositioning
{
  if (shouldUseScreenRelativeFooterViewPositioning_cn_once_token_1 != -1) {
    dispatch_once(&shouldUseScreenRelativeFooterViewPositioning_cn_once_token_1, &__block_literal_global_8);
  }
  v2 = (void *)shouldUseScreenRelativeFooterViewPositioning_cn_once_object_1;

  return [v2 BOOLValue];
}

void __78__CNAutocompleteSearchController_shouldUseScreenRelativeFooterViewPositioning__block_invoke()
{
  v0 = NSNumber;
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v4 bundleIdentifier];
  uint64_t v2 = objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "isEqualToString:", @"com.apple.InCallService.RemotePeoplePicker"));
  v3 = (void *)shouldUseScreenRelativeFooterViewPositioning_cn_once_object_1;
  shouldUseScreenRelativeFooterViewPositioning_cn_once_object_1 = v2;
}

- (CNAutocompleteSearchController)initWithSearchType:(unint64_t)a3
{
  return [(CNAutocompleteSearchController *)self initWithSearchType:a3 options:0];
}

- (CNAutocompleteSearchController)initWithSearchType:(unint64_t)a3 options:(id)a4
{
  id v6 = a4;
  v7 = (CNAutocompleteSearchControllerOptions *)[v6 copy];
  options = self->_options;
  self->_options = v7;

  v9 = [[CNAutocompleteSearchManager alloc] initWithAutocompleteSearchType:a3];
  v10 = [[CNComposeRecipientTextView alloc] initWithOptions:v6];
  v11 = [[CNAutocompleteResultsTableViewController alloc] initWithOptions:v6];

  v12 = [(CNAutocompleteSearchController *)self initWithSearchManager:v9 textView:v10 resultsController:v11];
  return v12;
}

- (CNAutocompleteSearchController)initWithSearchManager:(id)a3 textView:(id)a4 resultsController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CNAutocompleteSearchController;
  v12 = [(CNAutocompleteSearchController *)&v25 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchManager, a3);
    [(CNAutocompleteSearchManager *)v13->_searchManager setFetchDelegate:v13];
    objc_storeStrong((id *)&v13->_composeField, a4);
    [(CNComposeHeaderView *)v13->_composeField setDelegate:v13];
    objc_storeStrong((id *)&v13->_resultsController, a5);
    [(CNAutocompleteResultsTableViewController *)v13->_resultsController setDelegate:v13];
    v14 = -[CNAutocompleteSuggestionsViewController initWithSearchType:]([CNAutocompleteSuggestionsViewController alloc], "initWithSearchType:", [v9 autocompleteSearchType]);
    suggestionsController = v13->_suggestionsController;
    v13->_suggestionsController = v14;

    v16 = [MEMORY[0x1E4F428B8] clearColor];
    v17 = [(CNAutocompleteSuggestionsViewController *)v13->_suggestionsController view];
    [v17 setBackgroundColor:v16];

    [(CNAutocompleteSuggestionsViewController *)v13->_suggestionsController setDelegate:v13];
    v18 = [MEMORY[0x1E4F42948] currentDevice];
    v13->_isiPhone = [v18 userInterfaceIdiom] == 0;

    [(CNAutocompleteSearchController *)v13 setSuggestionsHeaderTitleOverride:0];
    v19 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v20 = [v19 featureFlags];
    v13->_shouldHideSuggestionsAfterFirstRecipient = [v20 isFeatureEnabled:17] ^ 1;

    v21 = [MEMORY[0x1E4F42D90] mainScreen];
    [v21 bounds];
    v13->_hasSmallScreen = v22 <= 667.0;

    v23 = v13;
  }

  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [(CNAutocompleteSearchController *)self keyboardWillShowNotificationObserver];
  [v3 removeObserver:v4];

  v5 = [(CNAutocompleteSearchController *)self keyboardWillHideNotificationObserver];
  [v3 removeObserver:v5];

  id v6 = [(CNAutocompleteSearchController *)self uiContentSizeCategoryDidChangeNotificationObserver];
  [v3 removeObserver:v6];

  v7.receiver = self;
  v7.super_class = (Class)CNAutocompleteSearchController;
  [(CNAutocompleteSearchController *)&v7 dealloc];
}

- (void)setRecipients:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAutocompleteSearchController *)self composeField];
  [v5 setRecipients:v4];
}

- (NSArray)recipients
{
  uint64_t v2 = [(CNAutocompleteSearchController *)self composeField];
  v3 = [v2 recipients];

  return (NSArray *)v3;
}

- (void)setDelegate:(id)a3
{
  if (a3)
  {
    id v4 = [[CNAutocompleteSearchControllerSafeDelegateWrapper alloc] initWithDelegate:a3];
    [(CNAutocompleteSearchController *)self setDelegateWrapper:v4];
  }
  else
  {
    id v5 = 0;
    [(CNAutocompleteSearchController *)self setDelegateWrapper:0];
  }
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setOtherRecipientAddresses:(id)a3
{
  id v8 = a3;
  if ((-[NSArray isEqual:](self->_otherRecipientAddresses, "isEqual:") & 1) == 0)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1BA08]) initWithHandles:v8];
    id v5 = [v4 expandedHandles];
    id v6 = [(CNAutocompleteSearchController *)self suggestionsController];
    [v6 setOtherRecipientAddresses:v5];

    expandedOtherRecipientAddresses = self->_expandedOtherRecipientAddresses;
    self->_expandedOtherRecipientAddresses = v5;
  }
}

- (void)setPresentationOptions:(unint64_t)a3 forRecipient:(id)a4
{
  id v6 = a4;
  id v7 = [(CNAutocompleteSearchController *)self composeField];
  [v7 setAtomPresentationOptions:a3 forRecipient:v6];
}

- (void)setTintColor:(id)a3 forRecipient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAutocompleteSearchController *)self resultsController];
  [v8 setTintColor:v7 forRecipient:v6];
}

- (void)setPreferredRecipient:(id)a3 forRecipient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAutocompleteSearchController *)self resultsController];
  [v8 setPreferredRecipient:v7 forRecipient:v6];
}

- (void)setComposeFieldInfoText:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAutocompleteSearchController *)self composeField];
  [v5 setComposeFieldInfoText:v4];
}

- (NSString)composeFieldInfoText
{
  uint64_t v2 = [(CNAutocompleteSearchController *)self composeField];
  v3 = [v2 composeFieldInfoText];

  return (NSString *)v3;
}

- (void)setHeaderView:(id)a3
{
  id v5 = (UIView *)a3;
  p_headerView = &self->_headerView;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    double v22 = v5;
    id v8 = [(UIView *)headerView superview];
    id v9 = [(CNAutocompleteSearchController *)self view];

    if (v8 == v9) {
      [(UIView *)*p_headerView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_headerView, a3);
    id v10 = [(CNAutocompleteSearchController *)self view];
    [v10 addSubview:*p_headerView];

    id v11 = [(CNAutocompleteSearchController *)self suggestionsController];
    [v11 additionalContentInsets];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    [(UIView *)v22 frame];
    double v19 = v18;
    v20 = [(CNAutocompleteSearchController *)self suggestionsController];
    objc_msgSend(v20, "setAdditionalContentInsets:", v19, v13, v15, v17);

    [(CNAutocompleteSearchController *)self latestKeyboardFrame];
    -[CNAutocompleteSearchController adjustInsetsForKeyboardFrame:](self, "adjustInsetsForKeyboardFrame:");
    v21 = [(CNAutocompleteSearchController *)self view];
    [v21 setNeedsLayout];

    headerView = (UIView *)[(CNAutocompleteSearchController *)self updateHeaderFooterVisibility];
    id v5 = v22;
  }

  MEMORY[0x1F41817F8](headerView, v5);
}

- (void)setFooterView:(id)a3
{
  id v5 = (UIView *)a3;
  p_footerView = &self->_footerView;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    double v22 = v5;
    id v8 = [(UIView *)footerView superview];
    id v9 = [(CNAutocompleteSearchController *)self view];

    if (v8 == v9) {
      [(UIView *)*p_footerView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_footerView, a3);
    id v10 = [(CNAutocompleteSearchController *)self view];
    [v10 addSubview:*p_footerView];

    id v11 = [(CNAutocompleteSearchController *)self suggestionsController];
    [v11 additionalContentInsets];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    [(UIView *)v22 frame];
    double v19 = v18;
    v20 = [(CNAutocompleteSearchController *)self suggestionsController];
    objc_msgSend(v20, "setAdditionalContentInsets:", v13, v15, v19, v17);

    [(CNAutocompleteSearchController *)self latestKeyboardFrame];
    -[CNAutocompleteSearchController adjustInsetsForKeyboardFrame:](self, "adjustInsetsForKeyboardFrame:");
    v21 = [(CNAutocompleteSearchController *)self view];
    [v21 setNeedsLayout];

    footerView = (UIView *)[(CNAutocompleteSearchController *)self updateHeaderFooterVisibility];
    id v5 = v22;
  }

  MEMORY[0x1F41817F8](footerView, v5);
}

- (void)setExpandRecipientsInNamedGroups:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNAutocompleteSearchController *)self composeField];
  [v4 setExpandRecipientsInNamedGroups:v3];
}

- (BOOL)expandRecipientsInNamedGroups
{
  uint64_t v2 = [(CNAutocompleteSearchController *)self composeField];
  char v3 = [v2 expandRecipientsInNamedGroups];

  return v3;
}

- (void)setWantsAddButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNAutocompleteSearchController *)self composeField];
  [v4 setShowsAddButtonWhenExpanded:v3];
}

- (BOOL)wantsAddButton
{
  uint64_t v2 = [(CNAutocompleteSearchController *)self composeField];
  char v3 = [v2 showsAddButtonWhenExpanded];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  uint64_t v2 = [(CNAutocompleteSearchController *)self composeField];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (void)prepareForReuse
{
  [(CNAutocompleteSearchController *)self setRecipients:MEMORY[0x1E4F1CBF0]];
  char v3 = [(CNAutocompleteSearchController *)self composeField];
  [v3 clearText];

  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  -[CNAutocompleteSearchController setLatestKeyboardFrame:](self, "setLatestKeyboardFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [(CNAutocompleteSearchController *)self hideResultsController];
  [(CNAutocompleteSearchController *)self setHeaderView:0];
  [(CNAutocompleteSearchController *)self setFooterView:0];
  -[CNAutocompleteSearchController setLatestKeyboardFrame:](self, "setLatestKeyboardFrame:", v4, v5, v6, v7);
  id v8 = [(CNAutocompleteSearchController *)self suggestionsController];
  [v8 prepareForReuse];

  [(CNAutocompleteSearchController *)self latestKeyboardFrame];
  -[CNAutocompleteSearchController adjustInsetsForKeyboardFrame:](self, "adjustInsetsForKeyboardFrame:");
  id v9 = [(CNAutocompleteSearchController *)self currentTaskID];

  if (v9)
  {
    id v10 = [(CNAutocompleteSearchController *)self searchManager];
    id v11 = [(CNAutocompleteSearchController *)self currentTaskID];
    [v10 cancelTaskWithID:v11];

    [(CNAutocompleteSearchController *)self setCurrentTaskID:0];
  }
}

- (void)setSuggestionsHeaderTitleOverride:(id)a3
{
  if (a3)
  {
    suggestionsController = self->_suggestionsController;
    -[CNAutocompleteSuggestionsViewController setSuggestionsHeaderTitle:](suggestionsController, "setSuggestionsHeaderTitle:");
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v5 = [v6 localizedStringForKey:@"ZKW_SUGGESTIONS" value:&stru_1F0EC0C28 table:@"Localized"];
    [(CNAutocompleteSuggestionsViewController *)self->_suggestionsController setSuggestionsHeaderTitle:v5];
  }
}

- (void)viewDidLoad
{
  v108.receiver = self;
  v108.super_class = (Class)CNAutocompleteSearchController;
  [(CNAutocompleteSearchController *)&v108 viewDidLoad];
  char v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  double v4 = [(CNAutocompleteSearchController *)self view];
  [v4 setBackgroundColor:v3];

  double v5 = [(CNAutocompleteSearchController *)self view];
  [v5 safeAreaInsets];
  double v7 = v6;
  id v8 = [(CNAutocompleteSearchController *)self view];
  [v8 bounds];
  double v10 = v9;
  +[CNComposeHeaderView preferredHeight];
  double v12 = v11;
  double v13 = [(CNAutocompleteSearchController *)self composeField];
  objc_msgSend(v13, "setFrame:", 0.0, v7, v10, v12);

  id v14 = objc_alloc(MEMORY[0x1E4F42DB0]);
  double v15 = [(CNAutocompleteSearchController *)self composeField];
  [v15 frame];
  double v16 = objc_msgSend(v14, "initWithFrame:");
  [(CNAutocompleteSearchController *)self setComposeFieldScrollView:v16];

  double v17 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
  [v17 setAutoresizingMask:2];

  double v18 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
  [v18 setShowsHorizontalScrollIndicator:0];

  double v19 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
  [v19 setScrollsToTop:0];

  v20 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
  [v20 setBounces:0];

  v21 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
  [v21 setAutoresizesSubviews:0];

  double v22 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
  v23 = [(CNAutocompleteSearchController *)self composeField];
  [v22 addSubview:v23];

  id v24 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(CNAutocompleteSearchController *)self setComposeFieldContainerView:v24];

  objc_super v25 = [(CNAutocompleteSearchController *)self composeField];
  [v25 frame];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  v35 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
  [v35 setAutoresizingMask:2];

  v36 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
  v37 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
  [v36 addSubview:v37];

  v38 = [(CNAutocompleteSearchController *)self view];
  v39 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
  [v38 addSubview:v39];

  v40 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v41 = [v40 localizedStringForKey:@"TO" value:&stru_1F0EC0C28 table:@"Localized"];
  v42 = [(CNAutocompleteSearchController *)self composeField];
  [v42 setLabel:v41];

  v43 = [MEMORY[0x1E4F428B8] clearColor];
  v44 = [(CNAutocompleteSearchController *)self composeField];
  [v44 setBackgroundColor:v43];

  v45 = [(CNAutocompleteSearchController *)self composeField];
  [v45 setAutoresizingMask:2];

  v46 = [(CNAutocompleteSearchController *)self composeField];
  [v46 frame];
  double MaxY = CGRectGetMaxY(v109);
  v48 = [(CNAutocompleteSearchController *)self view];
  [v48 bounds];
  double v50 = v49;
  v51 = [(CNAutocompleteSearchController *)self view];
  [v51 bounds];
  double v53 = v52;
  v54 = [(CNAutocompleteSearchController *)self composeField];
  [v54 frame];
  double v55 = v53 - CGRectGetMaxY(v110);
  v56 = [(CNAutocompleteSearchController *)self suggestionsController];
  v57 = [v56 view];
  objc_msgSend(v57, "setFrame:", 0.0, MaxY, v50, v55);

  v58 = [(CNAutocompleteSearchController *)self suggestionsController];
  v59 = [v58 view];
  [v59 setAutoresizingMask:2];

  v60 = [(CNAutocompleteSearchController *)self suggestionsController];
  [v60 willMoveToParentViewController:self];

  v61 = [(CNAutocompleteSearchController *)self view];
  v62 = [(CNAutocompleteSearchController *)self suggestionsController];
  v63 = [v62 view];
  [v61 addSubview:v63];

  v64 = [(CNAutocompleteSearchController *)self suggestionsController];
  [(CNAutocompleteSearchController *)self addChildViewController:v64];

  [(CNAutocompleteSearchController *)self showSuggestionsController];
  v65 = [(CNAutocompleteSearchController *)self composeField];
  [v65 frame];
  double v66 = CGRectGetMaxY(v111);
  v67 = [(CNAutocompleteSearchController *)self view];
  [v67 bounds];
  double v69 = v68;
  v70 = [(CNAutocompleteSearchController *)self view];
  [v70 bounds];
  double v72 = v71;
  v73 = [(CNAutocompleteSearchController *)self composeField];
  [v73 frame];
  double v74 = CGRectGetMaxY(v112);
  v75 = [(CNAutocompleteSearchController *)self view];
  [v75 safeAreaInsets];
  double v77 = v72 - (v74 + v76);
  v78 = [(CNAutocompleteSearchController *)self resultsController];
  v79 = [v78 view];
  objc_msgSend(v79, "setFrame:", 0.0, v66, v69, v77);

  v80 = [(CNAutocompleteSearchController *)self resultsController];
  v81 = [v80 view];
  [v81 setAutoresizingMask:2];

  v82 = [(CNAutocompleteSearchController *)self resultsController];
  v83 = [v82 view];
  [v83 setHidden:1];

  v84 = [MEMORY[0x1E4F428B8] clearColor];
  v85 = [(CNAutocompleteSearchController *)self resultsController];
  v86 = [v85 view];
  [v86 setBackgroundColor:v84];

  v87 = [(CNAutocompleteSearchController *)self view];
  v88 = [(CNAutocompleteSearchController *)self resultsController];
  v89 = [v88 view];
  [v87 addSubview:v89];

  v90 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_initWeak(&location, self);
  uint64_t v91 = *MEMORY[0x1E4F43B88];
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __45__CNAutocompleteSearchController_viewDidLoad__block_invoke;
  v105[3] = &unk_1E6128460;
  objc_copyWeak(&v106, &location);
  v92 = [v90 addObserverForName:v91 object:0 queue:0 usingBlock:v105];
  [(CNAutocompleteSearchController *)self setKeyboardWillShowNotificationObserver:v92];

  uint64_t v93 = *MEMORY[0x1E4F43B80];
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __45__CNAutocompleteSearchController_viewDidLoad__block_invoke_2;
  v103[3] = &unk_1E6128460;
  objc_copyWeak(&v104, &location);
  v94 = [v90 addObserverForName:v93 object:0 queue:0 usingBlock:v103];
  [(CNAutocompleteSearchController *)self setKeyboardWillHideNotificationObserver:v94];

  uint64_t v95 = *MEMORY[0x1E4F43788];
  uint64_t v98 = MEMORY[0x1E4F143A8];
  uint64_t v99 = 3221225472;
  v100 = __45__CNAutocompleteSearchController_viewDidLoad__block_invoke_3;
  v101 = &unk_1E6128460;
  objc_copyWeak(&v102, &location);
  v96 = [v90 addObserverForName:v95 object:0 queue:0 usingBlock:&v98];
  -[CNAutocompleteSearchController setUiContentSizeCategoryDidChangeNotificationObserver:](self, "setUiContentSizeCategoryDidChangeNotificationObserver:", v96, v98, v99, v100, v101);

  v97 = [(CNAutocompleteSearchController *)self composeField];
  [v97 becomeFirstResponder];

  objc_destroyWeak(&v102);
  objc_destroyWeak(&v104);
  objc_destroyWeak(&v106);
  objc_destroyWeak(&location);
}

void __45__CNAutocompleteSearchController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [WeakRetained composeField];
  [v4 setUsingActiveAppearance:1 animated:0];

  double v5 = [v3 userInfo];

  double v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F43AF0]];
  [v6 CGRectValue];
  objc_msgSend(WeakRetained, "setLatestKeyboardFrame:");

  [WeakRetained latestKeyboardFrame];
  objc_msgSend(WeakRetained, "adjustInsetsForKeyboardFrame:");
}

void __45__CNAutocompleteSearchController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = [WeakRetained suggestionsController];
  int v5 = [v4 useAccessibleLayout];

  if (v5)
  {
    double v6 = [WeakRetained composeField];
    [v6 setUsingActiveAppearance:0 animated:0];
  }
  if ([WeakRetained shouldUseScreenRelativeFooterViewPositioning])
  {
    objc_msgSend(WeakRetained, "setLatestKeyboardFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  else
  {
    double v7 = [v9 userInfo];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F43AF0]];
    [v8 CGRectValue];
    objc_msgSend(WeakRetained, "setLatestKeyboardFrame:");
  }
  [WeakRetained latestKeyboardFrame];
  objc_msgSend(WeakRetained, "adjustInsetsForKeyboardFrame:");
}

void __45__CNAutocompleteSearchController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained suggestionsAllowed]) {
    [WeakRetained showSuggestionsController];
  }
  else {
    [WeakRetained hideSuggestionsController];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNAutocompleteSearchController *)self providePeopleSuggesterFeedbackForViewWillAppear];
  v5.receiver = self;
  v5.super_class = (Class)CNAutocompleteSearchController;
  [(CNAutocompleteSearchController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNAutocompleteSearchController *)self providePeopleSuggesterFeedbackForViewWillDisappear];
  v5.receiver = self;
  v5.super_class = (Class)CNAutocompleteSearchController;
  [(CNAutocompleteSearchController *)&v5 viewWillDisappear:v3];
}

- (void)viewWillLayoutSubviews
{
  if ([(CNAutocompleteSearchController *)self shouldUseScreenRelativeFooterViewPositioning])
  {
    if (![(CNAutocompleteSearchController *)self finalWindowAttached])
    {
      [(CNAutocompleteSearchController *)self latestKeyboardFrame];
      if (v3 > 0.0)
      {
        if ([(CNAutocompleteSearchController *)self isViewLoaded])
        {
          double v4 = [(CNAutocompleteSearchController *)self view];
          objc_super v5 = [v4 window];
        }
        else
        {
          objc_super v5 = 0;
        }
        double v6 = [v5 screen];
        if (v6)
        {
          [v5 bounds];
          double v8 = v7;
          [v6 bounds];
          if (v8 != v9)
          {
            double v10 = v9;
            [(CNAutocompleteSearchController *)self setFinalWindowAttached:1];
            double v11 = v10 - v8;
            double v12 = [(CNAutocompleteSearchController *)self traitCollection];
            uint64_t v13 = [v12 horizontalSizeClass];

            if (v13 == 2) {
              double v14 = v11 * 0.5;
            }
            else {
              double v14 = v11;
            }
            [(CNAutocompleteSearchController *)self latestKeyboardFrame];
            double v16 = v15;
            double v18 = v17;
            double v20 = v19;
            double v22 = v21 - v14;
            -[CNAutocompleteSearchController setLatestKeyboardFrame:](self, "setLatestKeyboardFrame:");
            -[CNAutocompleteSearchController updateFooterPositionWithKeyboardFrame:](self, "updateFooterPositionWithKeyboardFrame:", v16, v22, v18, v20);
          }
        }
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)CNAutocompleteSearchController;
  [(CNAutocompleteSearchController *)&v23 viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
  double v3 = [(CNAutocompleteSearchController *)self composeField];
  [v3 frame];
  double v5 = v4;

  double v6 = [(CNAutocompleteSearchController *)self view];
  [v6 bounds];
  double v8 = v7 + -16.0;
  double v9 = [(CNAutocompleteSearchController *)self composeField];
  objc_msgSend(v9, "setFrame:", 8.0, 0.0, v8, v5);

  double v10 = [(CNAutocompleteSearchController *)self view];
  [v10 safeAreaInsets];
  double v12 = v11;
  uint64_t v13 = [(CNAutocompleteSearchController *)self view];
  [v13 bounds];
  double v15 = v14;
  double v16 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
  [v16 frame];
  double v18 = v17;
  double v19 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
  objc_msgSend(v19, "setFrame:", 0.0, v12, v15, v18);

  double v20 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
  [v20 frame];
  double MaxY = CGRectGetMaxY(v87);
  double v22 = [(CNAutocompleteSearchController *)self view];
  [v22 bounds];
  double v24 = v23;
  objc_super v25 = [(CNAutocompleteSearchController *)self view];
  [v25 bounds];
  double v27 = v26;
  double v28 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
  [v28 frame];
  double v29 = v27 - CGRectGetMaxY(v88);
  double v30 = [(CNAutocompleteSearchController *)self suggestionsController];
  double v31 = [v30 view];
  objc_msgSend(v31, "setFrame:", 0.0, MaxY, v24, v29);

  [(CNAutocompleteSearchController *)self updateResultsControllerFrame];
  double v32 = [(CNAutocompleteSearchController *)self headerView];

  if (v32)
  {
    double v33 = [(CNAutocompleteSearchController *)self headerView];
    [v33 frame];
    double v35 = v34;
    double v37 = v36;

    v38 = [(CNAutocompleteSearchController *)self view];
    [v38 bounds];
    double v40 = v39;

    v41 = [(CNAutocompleteSearchController *)self headerView];
    objc_msgSend(v41, "setFrame:", 0.0, v35, v40, v37);

    v42 = [(CNAutocompleteSearchController *)self suggestionsController];
    int v43 = [v42 useAccessibleLayout];

    if (v43)
    {
      v44 = [(CNAutocompleteSearchController *)self suggestionsController];
      v45 = [v44 view];
      [v45 frame];
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;

      v54 = [(CNAutocompleteSearchController *)self headerView];
      [v54 bounds];
      double v56 = v49 + v55;

      v57 = [(CNAutocompleteSearchController *)self suggestionsController];
      v58 = [v57 view];
      objc_msgSend(v58, "setFrame:", v47, v56, v51, v53);
    }
  }
  v59 = [(CNAutocompleteSearchController *)self footerView];

  if (v59)
  {
    v60 = [(CNAutocompleteSearchController *)self footerView];
    [v60 frame];
    double v62 = v61;
    double v64 = v63;

    v65 = [(CNAutocompleteSearchController *)self view];
    [v65 bounds];
    double v67 = v66;

    double v68 = [(CNAutocompleteSearchController *)self footerView];
    objc_msgSend(v68, "setFrame:", 0.0, v62, v67, v64);

    [(CNAutocompleteSearchController *)self latestKeyboardFrame];
    -[CNAutocompleteSearchController updateFooterPositionWithKeyboardFrame:](self, "updateFooterPositionWithKeyboardFrame:");
    double v69 = [(CNAutocompleteSearchController *)self suggestionsController];
    int v70 = [v69 useAccessibleLayout];

    if (v70)
    {
      double v71 = [(CNAutocompleteSearchController *)self suggestionsController];
      double v72 = [v71 view];
      [v72 frame];
      double v74 = v73;
      double v76 = v75;
      double v78 = v77;
      double v80 = v79;

      v81 = [(CNAutocompleteSearchController *)self footerView];
      [v81 bounds];
      double v83 = v80 - v82;

      v84 = [(CNAutocompleteSearchController *)self suggestionsController];
      v85 = [v84 view];
      objc_msgSend(v85, "setFrame:", v74, v76, v78, v83);
    }
  }
  v86.receiver = self;
  v86.super_class = (Class)CNAutocompleteSearchController;
  [(CNAutocompleteSearchController *)&v86 viewDidLayoutSubviews];
}

- (void)updateResultsControllerFrame
{
  id v20 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
  [v20 frame];
  double MaxY = CGRectGetMaxY(v22);
  double v4 = [(CNAutocompleteSearchController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v7 = [(CNAutocompleteSearchController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v10 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
  [v10 frame];
  double v11 = CGRectGetMaxY(v23);
  double v12 = [(CNAutocompleteSearchController *)self view];
  [v12 safeAreaInsets];
  double v14 = v11 + v13;
  double v15 = [(CNAutocompleteSearchController *)self view];
  [v15 safeAreaInsets];
  double v17 = v9 - (v14 + v16);
  double v18 = [(CNAutocompleteSearchController *)self resultsController];
  double v19 = [v18 view];
  objc_msgSend(v19, "setFrame:", 0.0, MaxY, v6, v17);
}

- (BOOL)hasSpaceToDisplaySuggestions
{
  if (![(CNAutocompleteSearchController *)self hasSmallScreen]) {
    return 1;
  }
  double v3 = [(CNAutocompleteSearchController *)self suggestionsController];
  char v4 = [v3 useAccessibleLayout];

  return v4 ^ 1;
}

- (void)addRecipient:(id)a3
{
  id v4 = a3;
  [(CNAutocompleteSearchController *)self setDidAddRecipientFromTypedQuery:1];
  [(CNAutocompleteSearchController *)self _addRecipient:v4];
  [(CNAutocompleteSearchController *)self providePeopleSuggesterFeedbackForTypedRecipient:v4];
}

- (void)_addRecipient:(id)a3
{
  id v4 = a3;
  double v5 = [(CNAutocompleteSearchController *)self recipients];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__CNAutocompleteSearchController__addRecipient___block_invoke;
  v9[3] = &unk_1E6128188;
  id v6 = v4;
  id v10 = v6;
  char v7 = objc_msgSend(v5, "_cn_any:", v9);

  if ((v7 & 1) == 0)
  {
    double v8 = [(CNAutocompleteSearchController *)self composeField];
    [v8 addRecipient:v6];

    [(CNAutocompleteSearchController *)self scrollToBottomOfRecipientView];
  }
}

uint64_t __48__CNAutocompleteSearchController__addRecipient___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 address];
  id v4 = [*(id *)(a1 + 32) address];
  uint64_t v5 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", v4);

  return v5;
}

- (void)disambiguateRecipient:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CNAutocompleteSearchController *)self resultsController];
  v7[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v5 updateRecipients:v6 disambiguatingRecipient:v4];

  [(CNAutocompleteSearchController *)self unhideResultsController];
}

- (void)unhideResultsController
{
  [(CNAutocompleteSearchController *)self setShouldRestoreFirstResponderToComposeField:0];
  [(CNAutocompleteSearchController *)self updateHeaderFooterVisibility];
  double v3 = [(CNAutocompleteSearchController *)self delegateWrapper];
  id v4 = [(CNAutocompleteSearchController *)self resultsController];
  uint64_t v5 = [v4 view];
  [v3 searchController:self willShowResultsView:v5];

  id v6 = [(CNAutocompleteSearchController *)self resultsController];
  char v7 = [v6 view];
  [v7 setHidden:0];

  [(CNAutocompleteSearchController *)self hideSuggestionsController];
  id v10 = [(CNAutocompleteSearchController *)self delegateWrapper];
  double v8 = [(CNAutocompleteSearchController *)self resultsController];
  double v9 = [v8 view];
  [v10 searchController:self didShowResultsView:v9];
}

- (void)hideResultsController
{
  [(CNAutocompleteSearchController *)self updateHeaderFooterVisibility];
  double v3 = [(CNAutocompleteSearchController *)self delegateWrapper];
  id v4 = [(CNAutocompleteSearchController *)self resultsController];
  uint64_t v5 = [v4 view];
  [v3 searchController:self willHideResultsView:v5];

  id v6 = [(CNAutocompleteSearchController *)self resultsController];
  char v7 = [v6 view];
  [v7 setHidden:1];

  id v10 = [(CNAutocompleteSearchController *)self delegateWrapper];
  double v8 = [(CNAutocompleteSearchController *)self resultsController];
  double v9 = [v8 view];
  [v10 searchController:self didHideResultsView:v9];
}

- (void)showSuggestionsController
{
  [(CNAutocompleteSearchController *)self setSuggestionsAllowed:1];
  uint64_t v3 = [(CNAutocompleteSearchController *)self hasSpaceToDisplaySuggestions] ^ 1;
  id v5 = [(CNAutocompleteSearchController *)self suggestionsController];
  id v4 = [v5 view];
  [v4 setHidden:v3];
}

- (void)hideSuggestionsController
{
  [(CNAutocompleteSearchController *)self setSuggestionsAllowed:0];
  id v4 = [(CNAutocompleteSearchController *)self suggestionsController];
  uint64_t v3 = [v4 view];
  [v3 setHidden:1];
}

- (void)invalidateRecipientTintColors
{
  uint64_t v3 = [(CNAutocompleteSearchController *)self resultsController];
  [v3 invalidateAddressTintColors];

  id v4 = [(CNAutocompleteSearchController *)self composeField];
  [v4 invalidateAtomPresentationOptions];
}

- (void)invalidatePreferredRecipients
{
  id v2 = [(CNAutocompleteSearchController *)self resultsController];
  [v2 invalidatePreferredRecipients];
}

- (void)adjustInsetsForKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CNAutocompleteSearchController *)self resultsController];
  id v45 = [v8 tableView];

  double v9 = [v45 window];
  double v44 = height;
  objc_msgSend(v9, "convertRect:fromWindow:", 0, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  objc_msgSend(v45, "convertRect:fromView:", 0, v11, v13, v15, v17);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  [v45 frame];
  v49.origin.double x = v19;
  v49.origin.double y = v21;
  v49.size.double width = v23;
  v49.size.double height = v25;
  CGRect v48 = CGRectIntersection(v47, v49);
  double v26 = CGRectGetHeight(v48);
  double v27 = [(CNAutocompleteSearchController *)self footerView];
  if (v27)
  {
    double v28 = [(CNAutocompleteSearchController *)self footerView];
    [v28 bounds];
    double v30 = v29;
  }
  else
  {
    double v30 = 0.0;
  }

  double v31 = [(CNAutocompleteSearchController *)self resultsController];
  double v32 = [v31 tableView];
  [v32 contentInset];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  double v39 = v26 + v30;
  double v40 = [(CNAutocompleteSearchController *)self resultsController];
  v41 = [v40 tableView];
  objc_msgSend(v41, "setContentInset:", v34, v36, v39, v38);

  v42 = [(CNAutocompleteSearchController *)self resultsController];
  int v43 = [v42 tableView];
  objc_msgSend(v43, "setScrollIndicatorInsets:", v34, v36, v39, v38);

  -[CNAutocompleteSearchController updateFooterPositionWithKeyboardFrame:](self, "updateFooterPositionWithKeyboardFrame:", x, y, width, v44);
}

- (void)updateFooterPositionWithKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(CNAutocompleteSearchController *)self isViewLoaded])
  {
    double v8 = [(CNAutocompleteSearchController *)self view];
    double v9 = [v8 window];

    if (v9)
    {
      id v27 = [(CNAutocompleteSearchController *)self view];
      double v10 = [v27 window];
      objc_msgSend(v10, "convertRect:fromWindow:", 0, x, y, width, height);
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;

      objc_msgSend(v27, "convertRect:fromView:", 0, v12, v14, v16, v18);
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      [v27 frame];
      v31.origin.double x = v20;
      v31.origin.double y = v22;
      v31.size.double width = v24;
      v31.size.double height = v26;
      CGRect v30 = CGRectIntersection(v29, v31);
      -[CNAutocompleteSearchController updateHeaderFooterPositionWithKeyboardIntersectionRect:](self, "updateHeaderFooterPositionWithKeyboardIntersectionRect:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    }
  }
}

- (void)updateHeaderFooterPositionWithKeyboardIntersectionRect:(CGRect)a3
{
  double height = a3.size.height;
  id v5 = [(CNAutocompleteSearchController *)self view];
  id v6 = [v5 superview];
  [v6 safeAreaInsets];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(CNAutocompleteSearchController *)self headerView];

  if (v11)
  {
    double v12 = [(CNAutocompleteSearchController *)self headerView];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    double v19 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
    [v19 frame];
    double v20 = v8 + CGRectGetMaxY(v36);

    double v21 = [(CNAutocompleteSearchController *)self headerView];
    objc_msgSend(v21, "setFrame:", v14, v20, v16, v18);
  }
  CGFloat v22 = [(CNAutocompleteSearchController *)self footerView];

  if (v22)
  {
    double v23 = [(CNAutocompleteSearchController *)self footerView];
    [v23 frame];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    CGRect v30 = [(CNAutocompleteSearchController *)self view];
    [v30 bounds];
    double v31 = CGRectGetMaxY(v37) - (height + v29);

    double v32 = 0.0;
    if (height == 0.0) {
      double v32 = v10;
    }
    double v33 = v31 - v32;
    id v34 = [(CNAutocompleteSearchController *)self footerView];
    objc_msgSend(v34, "setFrame:", v25, v33, v27, v29);
  }
}

- (void)updateHeaderFooterVisibility
{
  id v5 = [(CNAutocompleteSearchController *)self composeField];
  id v6 = [v5 text];
  if (v6
    && ([(CNAutocompleteSearchController *)self composeField],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 text],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 length]))
  {
    uint64_t v7 = 1;
  }
  else
  {
    double v8 = [(CNAutocompleteSearchController *)self resultsController];
    uint64_t v7 = [v8 inDisambiguationMode];

    if (!v6) {
      goto LABEL_6;
    }
  }

LABEL_6:
  double v9 = [(CNAutocompleteSearchController *)self headerView];

  if (v9)
  {
    double v10 = [(CNAutocompleteSearchController *)self headerView];
    [v10 setHidden:v7];
  }
  double v11 = [(CNAutocompleteSearchController *)self footerView];

  if (v11)
  {
    id v12 = [(CNAutocompleteSearchController *)self footerView];
    [v12 setHidden:v7];
  }
}

- (void)prewarmSuggestedRecipientsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAutocompleteSearchController *)self suggestionsController];
  [v5 fetchSuggestedRecipientsWithCompletionBlock:v4];
}

- (id)atomViewForRecipient:(id)a3
{
  composeField = self->_composeField;
  if (composeField)
  {
    composeField = [composeField atomViewForRecipient:a3];
  }

  return composeField;
}

- (void)consumeResults:(id)a3 taskID:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = [(CNAutocompleteSearchController *)self currentTaskID];
  int v8 = [v6 isEqualToNumber:v7];

  if (v8)
  {
    double v9 = [(CNAutocompleteSearchController *)self autocompleteResults];

    if (v9)
    {
      double v10 = [(CNAutocompleteSearchController *)self autocompleteResults];
      double v11 = [v10 arrayByAddingObjectsFromArray:v14];
      [(CNAutocompleteSearchController *)self setAutocompleteResults:v11];
    }
    else
    {
      [(CNAutocompleteSearchController *)self setAutocompleteResults:v14];
    }
    id v12 = [(CNAutocompleteSearchController *)self autocompleteResults];
    double v13 = [(CNAutocompleteSearchController *)self resultsController];
    [v13 setRecipients:v12];

    [(CNAutocompleteSearchController *)self unhideResultsController];
  }
}

- (void)finishedTaskWithID:(id)a3
{
  id v7 = a3;
  id v4 = [(CNAutocompleteSearchController *)self currentTaskID];
  int v5 = [v7 isEqualToNumber:v4];

  if (v5)
  {
    id v6 = [(CNAutocompleteSearchController *)self autocompleteResults];

    if (!v6) {
      [(CNAutocompleteSearchController *)self consumeResults:MEMORY[0x1E4F1CBF0] taskID:v7];
    }
    [(CNAutocompleteSearchController *)self setCurrentTaskID:0];
  }
}

- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(CNAutocompleteSearchController *)self delegateWrapper];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__CNAutocompleteSearchController_getSupplementalGroupsForSearchQuery_completionHandler___block_invoke;
  v11[3] = &unk_1E6128BE0;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(self) = [v8 searchController:self supplementalGroupsForSearchQuery:v7 completionHandler:v11];

  return (char)self;
}

void __88__CNAutocompleteSearchController_getSupplementalGroupsForSearchQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  id v6 = objc_msgSend(v7, "_cn_map:", &__block_literal_global_46);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

CNAutocompleteSupplementalGroup *__88__CNAutocompleteSearchController_getSupplementalGroupsForSearchQuery_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 members];
  id v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_49);

  id v5 = [CNAutocompleteSupplementalGroup alloc];
  id v6 = [v2 identifier];
  id v7 = [v2 title];

  int v8 = [(CNAutocompleteSupplementalGroup *)v5 initWithIdentifier:v6 title:v7 members:v4];

  return v8;
}

CNAutocompleteSupplementalGroupMember *__88__CNAutocompleteSearchController_getSupplementalGroupsForSearchQuery_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [CNAutocompleteSupplementalGroupMember alloc];
  id v4 = [v2 nameComponents];
  id v5 = [v2 address];
  uint64_t v6 = [v2 addressType];

  id v7 = [(CNAutocompleteSupplementalGroupMember *)v3 initWithNameComponents:v4 address:v5 addressType:v6];

  return v7;
}

- (BOOL)autocompleteResultsController:(id)a3 willOverrideImageDataForRecipient:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CNAutocompleteSearchController *)self delegateWrapper];
  LOBYTE(self) = [v9 searchController:self imageDataForRecipient:v8 imageUpdateBlock:v7];

  return (char)self;
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = [(CNAutocompleteSearchController *)self composeField];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v14 = [(CNAutocompleteSearchController *)self delegateWrapper];
  objc_msgSend(v14, "searchController:textViewWillChangeSize:", self, width, height);

  double v15 = [(CNAutocompleteSearchController *)self composeField];
  objc_msgSend(v15, "setFrame:", v9, v11, v13, height);

  double v16 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
  [v16 contentSize];
  double v18 = v17;
  double v20 = v19;

  if (v13 != v18 || height != v20)
  {
    double v21 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
    objc_msgSend(v21, "setContentSize:", v13, height);

    CGFloat v22 = [(CNAutocompleteSearchController *)self view];
    [v22 bounds];
    [(CNAutocompleteSearchController *)self latestKeyboardFrame];
    double v23 = [(CNAutocompleteSearchController *)self footerView];
    [v23 bounds];

    +[CNComposeHeaderView preferredHeight];
    if (height <= 150.0) {
      double v24 = height;
    }
    else {
      double v24 = 150.0;
    }
    double v25 = [(CNAutocompleteSearchController *)self composeFieldContainerView];
    objc_msgSend(v25, "setFrame:", v9, v11, v13, v24);

    double v26 = [(CNAutocompleteSearchController *)self view];
    [v26 safeAreaInsets];
    double v28 = v27;
    double v29 = [(CNAutocompleteSearchController *)self view];
    [v29 bounds];
    double v31 = v30;

    double v32 = [(CNAutocompleteSearchController *)self composeFieldScrollView];
    objc_msgSend(v32, "setFrame:", 0.0, v28, v31, v24);
  }
  double v33 = [(CNAutocompleteSearchController *)self view];
  [v33 setNeedsLayout];

  id v34 = [(CNAutocompleteSearchController *)self delegateWrapper];
  objc_msgSend(v34, "searchController:textViewDidChangeSize:", self, width, height);
}

- (void)scrollToBottomOfRecipientView
{
  uint64_t v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 schedulerProvider];
  id v5 = [v4 mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __63__CNAutocompleteSearchController_scrollToBottomOfRecipientView__block_invoke;
  v7[3] = &unk_1E6128548;
  v7[4] = self;
  id v6 = (id)[v5 afterDelay:v7 performBlock:0.0];
}

void __63__CNAutocompleteSearchController_scrollToBottomOfRecipientView__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) composeFieldScrollView];
  id v2 = [*(id *)(a1 + 32) composeFieldScrollView];
  [v2 contentOffset];
  double v4 = v3;
  id v5 = [*(id *)(a1 + 32) composeFieldScrollView];
  [v5 contentSize];
  objc_msgSend(v7, "scrollRectToVisible:animated:", 1, v4, v6 + -1.0, 1.0, 1.0);
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(CNAutocompleteSearchController *)self cancelAutocompleteSearch];
  int v8 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))();
  double v9 = [(CNAutocompleteSearchController *)self delegateWrapper];
  [v9 searchController:self textViewTextDidChange:v7];

  double v10 = [v6 recipients];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    if (!v8) {
      goto LABEL_8;
    }
LABEL_6:
    double v12 = [(CNAutocompleteSearchController *)self resultsController];
    [v12 setRecipients:0];

    [(CNAutocompleteSearchController *)self hideResultsController];
    goto LABEL_18;
  }
  [(CNAutocompleteSearchController *)self setDidAddRecipientFromTypedQuery:0];
  if (v8)
  {
    [(CNAutocompleteSearchController *)self showSuggestionsController];
    goto LABEL_6;
  }
  [(CNAutocompleteSearchController *)self hideSuggestionsController];
LABEL_8:
  double v13 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = [(CNAutocompleteSearchController *)self expandedOtherRecipientAddresses];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        [v13 addObject:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v16);
  }

  id v30 = v6;
  double v19 = [v6 uncommentedAddresses];
  [v13 addObjectsFromArray:v19];

  id v20 = objc_alloc_init(MEMORY[0x1E4F5A060]);
  double v21 = (void *)[v13 copy];
  [v20 setOtherAddressesAlreadyChosen:v21];

  CGFloat v22 = [(CNAutocompleteSearchController *)self searchManager];
  double v23 = [v22 searchForText:v7 withAutocompleteFetchContext:v20 consumer:self];
  [(CNAutocompleteSearchController *)self setCurrentTaskID:v23];

  double v24 = [(CNAutocompleteSearchController *)self composeField];
  double v25 = [v24 textView];
  unint64_t v26 = [v25 selectedRange];
  double v27 = [(CNAutocompleteSearchController *)self composeField];
  double v28 = [v27 recipients];
  unint64_t v29 = [v28 count];

  if (v26 > v29) {
    [(CNAutocompleteSearchController *)self scrollToBottomOfRecipientView];
  }

  id v6 = v30;
LABEL_18:
}

- (void)cancelAutocompleteSearch
{
  double v3 = [(CNAutocompleteSearchController *)self currentTaskID];

  if (v3)
  {
    double v4 = [(CNAutocompleteSearchController *)self searchManager];
    id v5 = [(CNAutocompleteSearchController *)self currentTaskID];
    [v4 cancelTaskWithID:v5];

    [(CNAutocompleteSearchController *)self setCurrentTaskID:0];
  }

  [(CNAutocompleteSearchController *)self setAutocompleteResults:0];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAutocompleteSearchController *)self delegateWrapper];
  id v8 = [v6 searchController:self composeRecipientForAddress:v5];

  if (v8)
  {
    [(CNAutocompleteSearchController *)self cancelAutocompleteSearch];
    id v7 = [(CNAutocompleteSearchController *)self composeField];
    [v7 clearText];

    [(CNAutocompleteSearchController *)self addRecipient:v8];
    [(CNAutocompleteSearchController *)self hideResultsController];
  }
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(CNAutocompleteSearchController *)self delegateWrapper];
  [v7 searchController:self didAddRecipient:v6];

  if (-[CNAutocompleteSearchController shouldHideSuggestionsAfterFirstRecipient](self, "shouldHideSuggestionsAfterFirstRecipient")&& ([v11 recipients], v8 = objc_claimAutoreleasedReturnValue(), uint64_t v9 = objc_msgSend(v8, "count"), v8, v9)|| -[CNAutocompleteSearchController didAddRecipientFromTypedQuery](self, "didAddRecipientFromTypedQuery"))
  {
    [(CNAutocompleteSearchController *)self hideSuggestionsController];
  }
  else
  {
    [(CNAutocompleteSearchController *)self showSuggestionsController];
    double v10 = [(CNAutocompleteSearchController *)self suggestionsController];
    [v10 invalidateSelectedRecipients];
  }
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(CNAutocompleteSearchController *)self delegateWrapper];
  [v7 searchController:self didRemoveRecipient:v6];

  if ([(CNAutocompleteSearchController *)self shouldHideSuggestionsAfterFirstRecipient])
  {
    id v8 = [v12 recipients];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      double v10 = [(CNAutocompleteSearchController *)self suggestionsController];
      [v10 setRecipients:0];

      [(CNAutocompleteSearchController *)self showSuggestionsController];
    }
  }
  id v11 = [(CNAutocompleteSearchController *)self suggestionsController];
  [v11 invalidateSelectedRecipients];

  [(CNAutocompleteSearchController *)self providePeopleSuggesterFeedbackForRemovedRecipient:v6];
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  double v4 = [(CNAutocompleteSearchController *)self composeField];
  [v4 clearText];

  id v5 = [(CNAutocompleteSearchController *)self autocompleteResults];

  if (v5)
  {
    [(CNAutocompleteSearchController *)self setAutocompleteResults:0];
    [(CNAutocompleteSearchController *)self hideResultsController];
    if (![(CNAutocompleteSearchController *)self shouldHideSuggestionsAfterFirstRecipient]|| ![(CNAutocompleteSearchController *)self didAddRecipientFromTypedQuery])
    {
      [(CNAutocompleteSearchController *)self showSuggestionsController];
    }
  }
  id v8 = [(CNAutocompleteSearchController *)self delegateWrapper];
  id v6 = [(CNAutocompleteSearchController *)self composeField];
  id v7 = [v6 addButton];
  [v8 didTapTextViewAccessoryButtonForSearchController:self anchoredToView:v7];
}

- (void)composeRecipientView:(id)a3 showPersonCardForAtom:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAutocompleteSearchController *)self composeField];
  [v6 clearText];

  id v7 = [v5 recipient];

  [(CNAutocompleteSearchController *)self disambiguateRecipient:v7];
}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAutocompleteSearchController *)self composeField];
  [v6 clearText];

  id v7 = [v5 recipient];

  [(CNAutocompleteSearchController *)self disambiguateRecipient:v7];
}

- (void)stopDisambiguatingForComposeRecipientView:(id)a3
{
  double v4 = [(CNAutocompleteSearchController *)self resultsController];
  id v5 = [v4 view];
  char v6 = [v5 isHidden];

  if ((v6 & 1) == 0)
  {
    [(CNAutocompleteSearchController *)self hideResultsController];
  }
}

- (id)composeRecipientView:(id)a3 contextMenuConfigurationForAtom:(id)a4
{
  id v5 = a4;
  char v6 = [(CNAutocompleteSearchController *)self delegateWrapper];
  id v7 = [v5 recipient];

  id v8 = [v6 searchController:self contextMenuConfigurationForRecipient:v7];

  return v8;
}

- (void)composeRecipientView:(id)a3 showPersonCardForRecipient:(id)a4
{
  id v5 = a4;
  [(CNAutocompleteSearchController *)self setDidPresentContactCard:1];
  id v6 = [(CNAutocompleteSearchController *)self delegateWrapper];
  [v6 searchController:self didTapTableAccessoryForRecipient:v5];
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAutocompleteSearchController *)self delegateWrapper];
  id v7 = [v6 searchController:self composeRecipientForAddress:v5];

  return v7;
}

- (unint64_t)presentationOptionsForRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAutocompleteSearchController *)self delegateWrapper];
  unint64_t v6 = [v5 searchController:self presentationOptionsForRecipient:v4];

  return v6;
}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, id))a5;
  id v8 = a4;
  uint64_t v9 = [(CNAutocompleteSearchController *)self delegateWrapper];
  id v10 = [v9 searchController:self tintColorForRecipient:v8];

  v7[2](v7, v10);
}

- (id)autocompleteResultsController:(id)a3 preferredRecipientForRecipient:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(CNAutocompleteSearchController *)self delegateWrapper];
  id v7 = [v6 searchController:self preferredRecipientForRecipient:v5];

  return v7;
}

- (BOOL)autocompleteResultsController:(id)a3 willOverrideImageDataForRecipient:(id)a4 imageUpdateBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(CNAutocompleteSearchController *)self delegateWrapper];
  LOBYTE(self) = [v9 searchController:self imageDataForRecipient:v8 imageUpdateBlock:v7];

  return (char)self;
}

- (void)suggestionsController:(id)a3 didSelectRecipient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CNAutocompleteSearchController *)self _addRecipient:v6];
  id v8 = [(CNAutocompleteSearchController *)self delegateWrapper];
  [v8 searchController:self didAddRecipientBySuggestionsController:v6];

  [(CNAutocompleteSearchController *)self providePeopleSuggesterFeedbackForSuggestedRecipient:v6];
  LODWORD(v6) = [v7 useAccessibleLayout];

  if (v6)
  {
    [(CNAutocompleteSearchController *)self hideSoftwareKeyboard];
  }
}

- (void)suggestionsController:(id)a3 didDeselectRecipient:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAutocompleteSearchController *)self composeField];
  [v6 removeRecipient:v5];
}

- (void)hideSoftwareKeyboard
{
  if (([MEMORY[0x1E4F42B08] isInHardwareKeyboardMode] & 1) == 0)
  {
    double v3 = [(CNAutocompleteSearchController *)self suggestionsController];
    int v4 = [v3 useAccessibleLayout];

    if (v4)
    {
      id v5 = [(CNAutocompleteSearchController *)self composeField];
      [v5 setUsingActiveAppearance:0 animated:0];
    }
    [(CNAutocompleteSearchController *)self setIgnoreDidFinishAddress:1];
    id v6 = [(CNAutocompleteSearchController *)self composeField];
    [v6 resignFirstResponder];

    [(CNAutocompleteSearchController *)self setIgnoreDidFinishAddress:0];
  }
}

- (id)selectedRecipientsForSuggestionsController:(id)a3
{
  double v3 = [(CNAutocompleteSearchController *)self composeField];
  int v4 = [v3 recipients];

  return v4;
}

- (void)suggestionsControllerWillBeginScroll:(id)a3
{
  [(CNAutocompleteSearchController *)self setIgnoreDidFinishAddress:1];
  int v4 = [(CNAutocompleteSearchController *)self composeField];
  [v4 resignFirstResponder];

  [(CNAutocompleteSearchController *)self setIgnoreDidFinishAddress:0];
}

- (BOOL)suggestionsController:(id)a3 imageDataForRecipient:(id)a4 imageUpdateBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(CNAutocompleteSearchController *)self delegateWrapper];
  LOBYTE(self) = [v9 searchController:self imageDataForRecipient:v8 imageUpdateBlock:v7];

  return (char)self;
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = a4;
  [(CNAutocompleteSearchController *)self cancelAutocompleteSearch];
  id v7 = [(CNAutocompleteSearchController *)self composeField];
  [v7 clearText];

  [(CNAutocompleteSearchController *)self addRecipient:v6];
  id v8 = [(CNAutocompleteSearchController *)self delegateWrapper];
  [v8 searchController:self didAddRecipientByResultsController:v6];

  [(CNAutocompleteSearchController *)self hideResultsController];
  [(CNAutocompleteSearchController *)self updateHeaderFooterVisibility];
  if ([(CNAutocompleteSearchController *)self shouldRestoreFirstResponderToComposeField])
  {
    [(CNAutocompleteSearchController *)self becomeFirstResponder];
  }
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id v5 = a4;
  [(CNAutocompleteSearchController *)self setIgnoreDidFinishAddress:1];
  id v6 = [(CNAutocompleteSearchController *)self composeField];
  [v6 resignFirstResponder];

  [(CNAutocompleteSearchController *)self setIgnoreDidFinishAddress:0];
  [(CNAutocompleteSearchController *)self setDidPresentContactCard:1];
  id v7 = [(CNAutocompleteSearchController *)self delegateWrapper];
  [v7 searchController:self didTapTableAccessoryForRecipient:v5];
}

- (void)autocompleteResultsController:(id)a3 didAskToRemoveRecipient:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAutocompleteSearchController *)self searchManager];
  [v6 removeRecipientResult:v5];
}

- (void)autocompleteResultsControllerWillBeginToScroll:(id)a3
{
  id v6 = [(CNAutocompleteSearchController *)self composeField];
  if ([v6 isFirstResponder])
  {
    char v4 = [MEMORY[0x1E4F42B08] isInHardwareKeyboardMode];

    if ((v4 & 1) == 0)
    {
      [(CNAutocompleteSearchController *)self setIgnoreDidFinishAddress:1];
      id v5 = [(CNAutocompleteSearchController *)self composeField];
      [v5 resignFirstResponder];

      [(CNAutocompleteSearchController *)self setShouldRestoreFirstResponderToComposeField:1];
      [(CNAutocompleteSearchController *)self setIgnoreDidFinishAddress:0];
    }
  }
  else
  {
  }
}

- (void)selectNextSearchResultForComposeRecipientView:(id)a3
{
  id v3 = [(CNAutocompleteSearchController *)self resultsController];
  [v3 selectNextSearchResult];
}

- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3
{
  id v3 = [(CNAutocompleteSearchController *)self resultsController];
  [v3 selectPreviousSearchResult];
}

- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3
{
  id v3 = [(CNAutocompleteSearchController *)self resultsController];
  char v4 = [v3 confirmSelectedRecipient];

  return v4;
}

- (BOOL)composeRecipientViewShowingSearchResults:(id)a3
{
  char v4 = [(CNAutocompleteSearchController *)self resultsController];
  id v5 = [v4 view];
  if ([v5 isHidden])
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = [(CNAutocompleteSearchController *)self autocompleteResults];
    BOOL v6 = [v7 count] != 0;
  }
  return v6;
}

- (BOOL)expandSelectedSearchResultForComposeRecipientView:(id)a3
{
  id v3 = [(CNAutocompleteSearchController *)self resultsController];
  char v4 = [v3 expandSelectedRecipient];

  return v4;
}

- (BOOL)collapseSelectedSearchResultForComposeRecipientView:(id)a3
{
  id v3 = [(CNAutocompleteSearchController *)self resultsController];
  char v4 = [v3 collapseSelectedRecipient];

  return v4;
}

- (void)autocompleteResultsController:(id)a3 willDisplayRowForRecipient:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAutocompleteSearchController *)self delegateWrapper];
  [v6 searchController:self willDisplayRowForRecipient:v5];
}

- (void)autocompleteResultsController:(id)a3 didEndDisplayingRowForRecipient:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAutocompleteSearchController *)self delegateWrapper];
  [v6 searchController:self didEndDisplayingRowForRecipient:v5];
}

- (BOOL)didPresentSomeViewController
{
  if ([(CNAutocompleteSearchController *)self didPresentContactPicker]) {
    return 1;
  }

  return [(CNAutocompleteSearchController *)self didPresentContactCard];
}

- (void)clearPresentedViewControllerState
{
  [(CNAutocompleteSearchController *)self setDidPresentContactPicker:0];

  [(CNAutocompleteSearchController *)self setDidPresentContactCard:0];
}

- (void)providePeopleSuggesterFeedbackForViewWillAppear
{
  BOOL v3 = [(CNAutocompleteSearchController *)self didPresentSomeViewController];
  char v4 = (void *)MEMORY[0x1E4F5A080];
  if (v3)
  {
    [MEMORY[0x1E4F5A080] userEnteredExistingSession];
    [(CNAutocompleteSearchController *)self clearPresentedViewControllerState];
  }
  else
  {
    [v4 userEnteredNewSession];
  }
}

- (void)providePeopleSuggesterFeedbackForViewWillDisappear
{
  BOOL v2 = [(CNAutocompleteSearchController *)self didPresentSomeViewController];
  BOOL v3 = (void *)MEMORY[0x1E4F5A080];
  if (v2)
  {
    [v3 userNavigatedAwayFromSession];
  }
  else
  {
    [v3 userTerminatedSession];
  }
}

- (void)providePeopleSuggesterFeedbackForSuggestedRecipient:(id)a3
{
  BOOL v3 = [a3 autocompleteResult];
  id v5 = [v3 psSuggestion];

  char v4 = v5;
  if (v5)
  {
    [MEMORY[0x1E4F5A080] userSelectedSuggestion:v5];
    char v4 = v5;
  }
}

- (void)providePeopleSuggesterFeedbackForTypedRecipient:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNAutocompleteSearchController *)self didPresentContactPicker];
  id v6 = (void *)MEMORY[0x1E4F5A080];
  id v7 = [v4 contact];

  if (v5) {
    [v6 userSelectedFromContactPicker:v7];
  }
  else {
    [v6 userEnteredContact:v7];
  }
}

- (void)providePeopleSuggesterFeedbackForRemovedRecipient:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F5A080];
  id v4 = [a3 contact];
  [v3 userRemovedContact:v4];
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (NSArray)otherRecipientAddresses
{
  return self->_otherRecipientAddresses;
}

- (CNAutocompleteSearchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAutocompleteSearchControllerDelegate *)WeakRetained;
}

- (CNAutocompleteSearchControllerSafeDelegateWrapper)delegateWrapper
{
  return self->_delegateWrapper;
}

- (void)setDelegateWrapper:(id)a3
{
}

- (CNAutocompleteSearchManager)searchManager
{
  return self->_searchManager;
}

- (void)setSearchManager:(id)a3
{
}

- (CNComposeRecipientTextView)composeField
{
  return self->_composeField;
}

- (CNAutocompleteResultsTableViewController)resultsController
{
  return self->_resultsController;
}

- (CNAutocompleteSuggestionsViewController)suggestionsController
{
  return self->_suggestionsController;
}

- (UIScrollView)composeFieldScrollView
{
  return self->_composeFieldScrollView;
}

- (void)setComposeFieldScrollView:(id)a3
{
}

- (UIView)composeFieldContainerView
{
  return self->_composeFieldContainerView;
}

- (void)setComposeFieldContainerView:(id)a3
{
}

- (NSObject)keyboardWillShowNotificationObserver
{
  return self->_keyboardWillShowNotificationObserver;
}

- (void)setKeyboardWillShowNotificationObserver:(id)a3
{
}

- (NSObject)keyboardWillHideNotificationObserver
{
  return self->_keyboardWillHideNotificationObserver;
}

- (void)setKeyboardWillHideNotificationObserver:(id)a3
{
}

- (NSObject)uiContentSizeCategoryDidChangeNotificationObserver
{
  return self->_uiContentSizeCategoryDidChangeNotificationObserver;
}

- (void)setUiContentSizeCategoryDidChangeNotificationObserver:(id)a3
{
}

- (CGRect)latestKeyboardFrame
{
  double x = self->_latestKeyboardFrame.origin.x;
  double y = self->_latestKeyboardFrame.origin.y;
  double width = self->_latestKeyboardFrame.size.width;
  double height = self->_latestKeyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLatestKeyboardFrame:(CGRect)a3
{
  self->_latestKeyboardFrame = a3;
}

- (NSNumber)currentTaskID
{
  return self->_currentTaskID;
}

- (void)setCurrentTaskID:(id)a3
{
}

- (NSArray)autocompleteResults
{
  return self->_autocompleteResults;
}

- (void)setAutocompleteResults:(id)a3
{
}

- (NSArray)expandedOtherRecipientAddresses
{
  return self->_expandedOtherRecipientAddresses;
}

- (void)setExpandedOtherRecipientAddresses:(id)a3
{
}

- (BOOL)ignoreDidFinishAddress
{
  return self->_ignoreDidFinishAddress;
}

- (void)setIgnoreDidFinishAddress:(BOOL)a3
{
  self->_ignoreDidFinishAddress = a3;
}

- (BOOL)didPresentContactPicker
{
  return self->_didPresentContactPicker;
}

- (void)setDidPresentContactPicker:(BOOL)a3
{
  self->_didPresentContactPicker = a3;
}

- (BOOL)didPresentContactCard
{
  return self->_didPresentContactCard;
}

- (void)setDidPresentContactCard:(BOOL)a3
{
  self->_didPresentContactCard = a3;
}

- (BOOL)shouldRestoreFirstResponderToComposeField
{
  return self->_shouldRestoreFirstResponderToComposeField;
}

- (void)setShouldRestoreFirstResponderToComposeField:(BOOL)a3
{
  self->_shouldRestoreFirstResponderToComposeField = a3;
}

- (BOOL)didAddRecipientFromTypedQuery
{
  return self->_didAddRecipientFromTypedQuery;
}

- (void)setDidAddRecipientFromTypedQuery:(BOOL)a3
{
  self->_didAddRecipientFromTypedQuerdouble y = a3;
}

- (BOOL)suggestionsAllowed
{
  return self->_suggestionsAllowed;
}

- (void)setSuggestionsAllowed:(BOOL)a3
{
  self->_suggestionsAllowed = a3;
}

- (BOOL)hasSmallScreen
{
  return self->_hasSmallScreen;
}

- (void)setHasSmallScreen:(BOOL)a3
{
  self->_hasSmallScreen = a3;
}

- (BOOL)finalWindowAttached
{
  return self->_finalWindowAttached;
}

- (void)setFinalWindowAttached:(BOOL)a3
{
  self->_finalWindowAttached = a3;
}

- (BOOL)shouldHideSuggestionsAfterFirstRecipient
{
  return self->_shouldHideSuggestionsAfterFirstRecipient;
}

- (void)setShouldHideSuggestionsAfterFirstRecipient:(BOOL)a3
{
  self->_shouldHideSuggestionsAfterFirstRecipient = a3;
}

- (BOOL)isiPhone
{
  return self->_isiPhone;
}

- (void)setIsiPhone:(BOOL)a3
{
  self->_isiPhone = a3;
}

- (CNAutocompleteSearchControllerOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_expandedOtherRecipientAddresses, 0);
  objc_storeStrong((id *)&self->_autocompleteResults, 0);
  objc_storeStrong((id *)&self->_currentTaskID, 0);
  objc_storeStrong((id *)&self->_uiContentSizeCategoryDidChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_keyboardWillHideNotificationObserver, 0);
  objc_storeStrong((id *)&self->_keyboardWillShowNotificationObserver, 0);
  objc_storeStrong((id *)&self->_composeFieldContainerView, 0);
  objc_storeStrong((id *)&self->_composeFieldScrollView, 0);
  objc_storeStrong((id *)&self->_suggestionsController, 0);
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_storeStrong((id *)&self->_composeField, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_delegateWrapper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_otherRecipientAddresses, 0);
  objc_storeStrong((id *)&self->_footerView, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end