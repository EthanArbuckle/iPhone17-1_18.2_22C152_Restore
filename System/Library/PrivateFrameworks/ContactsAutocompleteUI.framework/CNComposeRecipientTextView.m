@interface CNComposeRecipientTextView
- (BOOL)_canAddAdditionalAtoms;
- (BOOL)_delegateRespondsToSizeChange;
- (BOOL)_hasDowntimeBlockedRecipients;
- (BOOL)_hasRecipientsWithPresentationOptions:(unint64_t)a3;
- (BOOL)_hasUnsafeRecipients;
- (BOOL)_isAddButtonVisible;
- (BOOL)_isTextViewCollapsed;
- (BOOL)_recipientAtomHitInView:(id)a3 atLocation:(CGPoint)a4;
- (BOOL)_shouldAnimateAtomViewChanges;
- (BOOL)_shouldEmbedLabelInTextView;
- (BOOL)_textViewContainsAtomizedRecipients;
- (BOOL)_useRightToLeftLayout;
- (BOOL)becomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)containsAddress:(id)a3;
- (BOOL)didIgnoreFirstResponderResign;
- (BOOL)editable;
- (BOOL)enabled;
- (BOOL)expandRecipientsInNamedGroups;
- (BOOL)expanded;
- (BOOL)finishEnteringRecipient;
- (BOOL)hasContent;
- (BOOL)hostRecipientViewHasSearchResults;
- (BOOL)indicatesUnsafeRecipientsWhenCollapsed;
- (BOOL)isFirstResponder;
- (BOOL)isSeparatorHidden;
- (BOOL)keyboardIsHiding;
- (BOOL)resignFirstResponder;
- (BOOL)shouldAlwaysShowAddContactsButton;
- (BOOL)shouldExpandRecipient:(id)a3;
- (BOOL)showsAddButtonWhenExpanded;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)usingActiveAppearance;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNComposeRecipientTextView)initWithFrame:(CGRect)a3;
- (CNComposeRecipientTextView)initWithFrame:(CGRect)a3 dragDropDelegate:(id)a4;
- (CNComposeRecipientTextView)initWithOptions:(id)a3;
- (NSArray)addresses;
- (NSArray)recipients;
- (NSArray)uncommentedAddresses;
- (NSObject)keyboardDidHideNotificationObserver;
- (NSObject)keyboardWillHideNotificationObserver;
- (NSString)text;
- (UIButton)addButton;
- (UIColor)inactiveTextColor;
- (UIColor)typingTextColor;
- (UIFont)baseFont;
- (UITextView)textView;
- (UIView)atomContainerView;
- (_CNAtomTextAttachment)placeholderAttachment;
- (_NSRange)_placeholderAttachmentRange;
- (_NSRange)_rangeForComposeRecipientAtom:(id)a3;
- (double)labelTopPadding;
- (double)offsetForRowWithTextField;
- (double)textFieldOffsetForNumberOfRowsToScroll:(unint64_t)a3 numberOfRowsAboveField:(int64_t)a4;
- (double)trailingButtonMidlineInsetFromLayoutMargin;
- (id)_atomAttachmentForRecipient:(id)a3;
- (id)_atomViewAtCharacterIndex:(unint64_t)a3;
- (id)_attributedStringWithAtomizedRecipients;
- (id)_baseAttributes;
- (id)_placeholderAttachmentWithStaticWidth;
- (id)_textContainerExclusionPathsWithAddButton:(BOOL)a3;
- (id)_toString;
- (id)_userEnteredTextWithRange:(_NSRange *)a3;
- (id)_valueForAtomLayoutOption:(id)a3 withRecipient:(id)a4;
- (id)atomViewForRecipient:(id)a3;
- (id)atomViewsInRange:(_NSRange)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)dragPreviewForDraggedItem:(id)a3 withContainer:(id)a4;
- (id)menuConfigurationForAtomView:(id)a3;
- (id)selectedAtoms;
- (id)undoManager;
- (int)hideLastAtomComma;
- (int64_t)maxRecipients;
- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3;
- (unint64_t)indexOfRecipientForInsertionAtPoint:(CGPoint)a3;
- (unint64_t)numberOfRowsOfTextInField;
- (void)_addAddressAtomSubview:(id)a3;
- (void)_addButtonTapped:(id)a3;
- (void)_beginAtomViewAnimations;
- (void)_didRemoveRecipient:(id)a3;
- (void)_ensureAddButton;
- (void)_ensureInactiveTextView;
- (void)_insertAtomAttachment:(id)a3 andReplaceCharactersInRange:(_NSRange)a4;
- (void)_insertAtomAttachment:(id)a3 atCharacterIndex:(unint64_t)a4;
- (void)_invalidateAtomPresentationOptionsCache;
- (void)_invalidateTextContainerExclusionPaths;
- (void)_longPressGestureRecognized:(id)a3;
- (void)_notifyDelegateOfNewSize:(CGSize)a3;
- (void)_notifyDelegateOfSizeChange;
- (void)_recomputeTextContainerExclusionPaths;
- (void)_removeAddressAtomSubview:(id)a3;
- (void)_removeAllRecipients;
- (void)_resetSelectionState;
- (void)_setAddButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setTextViewIsCollapsed:(BOOL)a3 animated:(BOOL)a4;
- (void)_setValue:(id)a3 forAtomLayoutOption:(id)a4 withRecipient:(id)a5;
- (void)_tapGestureRecognized:(id)a3;
- (void)_updateAddButtonVisibility;
- (void)_updateAddButtonVisibilityAnimated:(BOOL)a3;
- (void)_updateInactiveTextView;
- (void)addAddress:(id)a3;
- (void)addRecipient:(id)a3;
- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5;
- (void)addRecipientsFromContactItemProviders:(id)a3;
- (void)atomTextView:(id)a3 didChangeWritingDirection:(int64_t)a4;
- (void)atomTextViewDidBecomeFirstResponder:(id)a3;
- (void)atomTextViewDidResignFirstResponder:(id)a3;
- (void)clearText;
- (void)composeRecipientAtomDisambiguate:(id)a3;
- (void)composeRecipientAtomShowPersonCard:(id)a3;
- (void)composeRecipientAtomStopDisambiguating;
- (void)dealloc;
- (void)deselectAllAtoms;
- (void)dragEnteredAtPoint:(CGPoint)a3;
- (void)dragExited;
- (void)dragMovedToPoint:(CGPoint)a3;
- (void)dropItems:(id)a3;
- (void)invalidateAtomPresentationOptions;
- (void)invalidateAtomPresentationOptionsForRecipient:(id)a3;
- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5;
- (void)layoutSubviews;
- (void)parentDidClose;
- (void)parentWillClose;
- (void)reflow;
- (void)refreshPreferredContentSize;
- (void)removeRecipient:(id)a3;
- (void)removeSingleRecipient:(id)a3;
- (void)selectAllAtoms;
- (void)selectAtom:(id)a3;
- (void)selectAtomForRecipient:(id)a3;
- (void)setAddresses:(id)a3;
- (void)setAtomPresentationOptions:(unint64_t)a3 forRecipient:(id)a4;
- (void)setBaseFont:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExpandRecipientsInNamedGroups:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHideLastAtomComma:(int)a3;
- (void)setInactiveTextColor:(id)a3;
- (void)setIndicatesUnsafeRecipientsWhenCollapsed:(BOOL)a3;
- (void)setKeyboardDidHideNotificationObserver:(id)a3;
- (void)setKeyboardIsHiding:(BOOL)a3;
- (void)setKeyboardWillHideNotificationObserver:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMaxRecipients:(int64_t)a3;
- (void)setPlaceholderAttachment:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setShouldAlwaysShowAddContactsButton:(BOOL)a3;
- (void)setShowsAddButtonWhenExpanded:(BOOL)a3;
- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3;
- (void)setTypingTextColor:(id)a3;
- (void)setUsingActiveAppearance:(BOOL)a3;
- (void)setUsingActiveAppearance:(BOOL)a3 animated:(BOOL)a4;
- (void)shiftSelectAtom:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
@end

@implementation CNComposeRecipientTextView

- (void)dealloc
{
  [(_CNAtomTextView *)self->_textView setHostRecipientView:0];
  [(_CNAtomTextView *)self->_textView setDelegate:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [(CNComposeRecipientTextView *)self keyboardWillHideNotificationObserver];
  [v3 removeObserver:v4];

  v5 = [(CNComposeRecipientTextView *)self keyboardDidHideNotificationObserver];
  [v3 removeObserver:v5];

  v6.receiver = self;
  v6.super_class = (Class)CNComposeRecipientTextView;
  [(CNComposeRecipientTextView *)&v6 dealloc];
}

- (CNComposeRecipientTextView)initWithFrame:(CGRect)a3 dragDropDelegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = -[CNComposeRecipientTextView initWithFrame:](self, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    v11 = [[CNComposeDragSource alloc] initWithView:v10 delegate:v9];
    dragSource = v10->_dragSource;
    v10->_dragSource = v11;

    [(CNComposeDragSource *)v10->_dragSource setAllowsDragOverridingMasterSwitch:1];
    v13 = [[CNComposeDropTarget alloc] initWithView:v10 delegate:v9];
    dropTarget = v10->_dropTarget;
    v10->_dropTarget = v13;

    v15 = (void *)MEMORY[0x1E4F1CA80];
    v16 = +[CNComposeRecipient readableTypeIdentifiersForItemProvider];
    v17 = [v15 setWithArray:v16];

    v18 = [MEMORY[0x1E4F1BC00] readableTypeIdentifiersForItemProvider];
    [v17 addObjectsFromArray:v18];

    v19 = +[CNComposeRecipients readableTypeIdentifiersForItemProvider];
    [v17 addObjectsFromArray:v19];

    [(CNComposeDropTarget *)v10->_dropTarget setAcceptableUTIs:v17];
    v20 = [(_CNAtomTextView *)v10->_textView interactions];
    v21 = objc_msgSend(v20, "_cn_filter:", &__block_literal_global_15);
    [(_CNAtomTextView *)v10->_textView setInteractions:v21];
  }
  return v10;
}

BOOL __61__CNComposeRecipientTextView_initWithFrame_dragDropDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v4 = objc_opt_class();
    BOOL v5 = v4 != objc_opt_class();
  }

  return v5;
}

- (CNComposeRecipientTextView)initWithOptions:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNComposeRecipientTextView;
  BOOL v5 = [(CNComposeRecipientTextView *)&v15 init];
  objc_super v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 copy];
    options = v6->_options;
    v6->_options = (CNAutocompleteSearchControllerOptions *)v7;

    id v9 = [(CNAutocompleteSearchControllerOptions *)v6->_options trailingButtonMidlineInsetFromLayoutMargin];

    if (v9)
    {
      v10 = [(CNAutocompleteSearchControllerOptions *)v6->_options trailingButtonMidlineInsetFromLayoutMargin];
      [v10 floatValue];
      [(CNComposeRecipientTextView *)v6 setTrailingButtonMidlineInsetFromLayoutMargin:v11];
    }
    v12 = [(CNAutocompleteSearchControllerOptions *)v6->_options shouldAlwaysShowAddContactsButton];

    if (v12)
    {
      v13 = [(CNAutocompleteSearchControllerOptions *)v6->_options shouldAlwaysShowAddContactsButton];
      -[CNComposeRecipientTextView setShouldAlwaysShowAddContactsButton:](v6, "setShouldAlwaysShowAddContactsButton:", [v13 BOOLValue]);
    }
    else
    {
      [(CNComposeRecipientTextView *)v6 setShouldAlwaysShowAddContactsButton:0];
    }
  }

  return v6;
}

- (CNComposeRecipientTextView)initWithFrame:(CGRect)a3
{
  v39.receiver = self;
  v39.super_class = (Class)CNComposeRecipientTextView;
  uint64_t v3 = -[CNComposeHeaderView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(CNComposeRecipientTextView *)v3 setClipsToBounds:1];
    v4->_usingActiveAppearance = 1;
    BOOL v5 = [_CNAtomTextView alloc];
    [(CNComposeRecipientTextView *)v4 bounds];
    uint64_t v6 = -[_CNAtomTextView initWithFrame:](v5, "initWithFrame:");
    textView = v4->_textView;
    v4->_textView = (_CNAtomTextView *)v6;

    v8 = [(_CNAtomTextView *)v4->_textView textContainer];
    [v8 setLineFragmentPadding:0.0];

    id v9 = v4->_textView;
    v10 = [MEMORY[0x1E4F428B8] clearColor];
    [(_CNAtomTextView *)v9 setBackgroundColor:v10];

    [(_CNAtomTextView *)v4->_textView setDelegate:v4];
    float v11 = v4->_textView;
    v12 = +[CNAtomView defaultFont];
    [(_CNAtomTextView *)v11 setFont:v12];

    [(_CNAtomTextView *)v4->_textView setForceEnableDictation:1];
    [(_CNAtomTextView *)v4->_textView setAutocorrectionType:1];
    [(_CNAtomTextView *)v4->_textView setAutocapitalizationType:0];
    [(_CNAtomTextView *)v4->_textView setKeyboardType:7];
    [(_CNAtomTextView *)v4->_textView setBounces:0];
    [(_CNAtomTextView *)v4->_textView setAutoresizingMask:0];
    [(_CNAtomTextView *)v4->_textView setHostRecipientView:v4];
    v13 = [(_CNAtomTextView *)v4->_textView layoutManager];
    [v13 setDelegate:v4];

    v14 = [(_CNAtomTextView *)v4->_textView layoutManager];
    [v14 setAllowsNonContiguousLayout:1];

    [(_CNAtomTextView *)v4->_textView setScrollsToTop:0];
    v4->_enabled = 1;
    [(CNComposeRecipientTextView *)v4 addSubview:v4->_textView];
    objc_super v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    atomViews = v4->_atomViews;
    v4->_atomViews = v15;

    v17 = [(CNComposeHeaderView *)v4 labelView];
    [v17 removeFromSuperview];

    v18 = v4->_textView;
    v19 = [(CNComposeHeaderView *)v4 labelView];
    [(_CNAtomTextView *)v18 addSubview:v19];

    [(CNComposeRecipientTextView *)v4 _setAddButtonVisible:0 animated:0];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v4 action:sel__tapGestureRecognized_];
    [v20 setCancelsTouchesInView:0];
    [(CNComposeRecipientTextView *)v4 addGestureRecognizer:v20];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v4 action:sel__longPressGestureRecognized_];
    [v21 setCancelsTouchesInView:0];
    [(CNComposeRecipientTextView *)v4 addGestureRecognizer:v21];
    v4->_textViewExclusionPathsAreValid = 1;
    v4->_atomViewAnimationDepth = 0;
    v4->_parentIsClosing = 0;
    v4->_isTextFieldCollapsed = 0;
    v4->_collapsedStateInitialized = 0;
    v4->_indicatesUnsafeRecipientsWhenCollapsed = 0;
    v4->_notifyDelegateOfSizeChange = 1;
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    atomPresentationOptionsByRecipient = v4->_atomPresentationOptionsByRecipient;
    v4->_atomPresentationOptionsByRecipient = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    atomLayoutOptionsByRecipient = v4->_atomLayoutOptionsByRecipient;
    v4->_atomLayoutOptionsByRecipient = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recipientsBeingRemoved = v4->_recipientsBeingRemoved;
    v4->_recipientsBeingRemoved = v26;

    v4->_showsAddButtonWhenExpanded = 1;
    *(_WORD *)&v4->_expandRecipientsInNamedGroups = 1;
    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_initWeak(&location, v4);
    uint64_t v29 = *MEMORY[0x1E4F43B80];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __44__CNComposeRecipientTextView_initWithFrame___block_invoke;
    v36[3] = &unk_1E6128460;
    objc_copyWeak(&v37, &location);
    v30 = [v28 addObserverForName:v29 object:0 queue:0 usingBlock:v36];
    [(CNComposeRecipientTextView *)v4 setKeyboardWillHideNotificationObserver:v30];

    uint64_t v31 = *MEMORY[0x1E4F43AC0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __44__CNComposeRecipientTextView_initWithFrame___block_invoke_2;
    v34[3] = &unk_1E6128460;
    objc_copyWeak(&v35, &location);
    v32 = [v28 addObserverForName:v31 object:0 queue:0 usingBlock:v34];
    [(CNComposeRecipientTextView *)v4 setKeyboardDidHideNotificationObserver:v32];

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __44__CNComposeRecipientTextView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setKeyboardIsHiding:1];
}

void __44__CNComposeRecipientTextView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setKeyboardIsHiding:0];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return 0;
}

- (id)menuConfigurationForAtomView:(id)a3
{
  return 0;
}

- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3
{
  self->_trailingButtonMidlineInsetFromLayoutMargin = a3;
  [(CNComposeRecipientTextView *)self setNeedsLayout];
}

- (double)labelTopPadding
{
  options = self->_options;
  if (options
    && ([(CNAutocompleteSearchControllerOptions *)options labelTopPadding],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    BOOL v5 = [(CNAutocompleteSearchControllerOptions *)self->_options labelTopPadding];
    [v5 floatValue];
    double v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CNComposeRecipientTextView;
    [(CNComposeHeaderView *)&v10 labelTopPadding];
    return v8;
  }
  return v7;
}

- (void)layoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)CNComposeRecipientTextView;
  [(CNComposeHeaderView *)&v58 layoutSubviews];
  BOOL v3 = [(CNComposeRecipientTextView *)self _useRightToLeftLayout];
  [(CNComposeHeaderView *)self _contentRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [(_CNAtomTextView *)self->_textView bounds];
  if (v10 <= 0.00000011920929) {
    textView = self;
  }
  else {
    textView = self->_textView;
  }
  [textView bounds];
  double v13 = v12;
  if (v3)
  {
    [(_CNAtomTextView *)self->_textView frame];
    v61.origin.CGFloat x = v5;
    v61.origin.CGFloat y = v7;
    v61.size.CGFloat width = v9;
    v61.size.CGFloat height = v13;
    if (!CGRectEqualToRect(v59, v61)) {
      [(CNComposeRecipientTextView *)self _recomputeTextContainerExclusionPaths];
    }
  }
  -[_CNAtomTextView setFrame:](self->_textView, "setFrame:", v5, v7, v9, v13);
  [(CNComposeHeaderView *)self _recipientViewEdgeInsets];
  -[_CNAtomTextView setTextContainerInset:](self->_textView, "setTextContainerInset:");
  v14 = [(id)objc_opt_class() defaultFont];
  [v14 lineHeight];

  [(CNComposeRecipientTextView *)self bounds];
  UIRoundToViewScale();
  addButton = self->_addButton;
  if (addButton)
  {
    p_addButtonFrame = &self->_addButtonFrame;
    CGFloat x = self->_addButtonFrame.origin.x;
    CGFloat y = self->_addButtonFrame.origin.y;
    CGFloat width = self->_addButtonFrame.size.width;
    CGFloat height = self->_addButtonFrame.size.height;
    [(UIButton *)addButton intrinsicContentSize];
    self->_addButtonFrame.size.CGFloat width = v21;
    self->_addButtonFrame.size.CGFloat height = v22;
    UIRoundToViewScale();
    self->_addButtonFrame.origin.CGFloat y = v23;
    [(CNComposeHeaderView *)self _contentRect];
    if (v3) {
      double MinX = CGRectGetMinX(*(CGRect *)&v24);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v24) - self->_addButtonFrame.size.width;
    }
    p_addButtonFrame->origin.CGFloat x = MinX;
    [(CNComposeRecipientTextView *)self trailingButtonMidlineInsetFromLayoutMargin];
    if (v29 == 0.0)
    {
      double v34 = p_addButtonFrame->origin.x;
    }
    else
    {
      [(CNComposeRecipientTextView *)self trailingButtonMidlineInsetFromLayoutMargin];
      double v31 = v30;
      v60.origin.CGFloat x = p_addButtonFrame->origin.x;
      v60.origin.CGFloat y = self->_addButtonFrame.origin.y;
      v60.size.CGFloat width = self->_addButtonFrame.size.width;
      v60.size.CGFloat height = self->_addButtonFrame.size.height;
      double v32 = v31 + CGRectGetWidth(v60) * -0.5;
      double v33 = -1.0;
      if (v3) {
        double v33 = 1.0;
      }
      double v34 = p_addButtonFrame->origin.x + v32 * v33;
      p_addButtonFrame->origin.CGFloat x = v34;
    }
    CGFloat v35 = self->_addButtonFrame.origin.y;
    CGFloat v36 = self->_addButtonFrame.size.width;
    CGFloat v37 = self->_addButtonFrame.size.height;
    v62.origin.CGFloat x = x;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.CGFloat height = height;
    if (!CGRectEqualToRect(*(CGRect *)&v34, v62))
    {
      -[UIButton setFrame:](self->_addButton, "setFrame:", p_addButtonFrame->origin.x, self->_addButtonFrame.origin.y, self->_addButtonFrame.size.width, self->_addButtonFrame.size.height);
      [(CNComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
    }
  }
  if (![(CNComposeRecipientTextView *)self usingActiveAppearance]) {
    [(CNComposeRecipientTextView *)self _updateInactiveTextView];
  }
  if (v3)
  {
    v57.receiver = self;
    v57.super_class = (Class)CNComposeRecipientTextView;
    [(CNComposeHeaderView *)&v57 layoutSubviews];
  }
  options = self->_options;
  if (options)
  {
    objc_super v39 = [(CNAutocompleteSearchControllerOptions *)options labelLeadingPadding];

    if (v39)
    {
      v40 = [(CNComposeHeaderView *)self labelView];
      [v40 frame];
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;

      [(CNAutocompleteSearchControllerOptions *)self->_options labelLeadingPadding];
      if (v3) {
        v49 = {;
      }
        [v49 floatValue];
        double v51 = v42 - v50;
      }
      else {
        v49 = {;
      }
        [v49 floatValue];
        double v51 = v52;
      }

      v53 = [(CNComposeHeaderView *)self labelView];
      objc_msgSend(v53, "setFrame:", v51, v44, v46, v48);
    }
    v54 = self->_options;
    if (v54)
    {
      v55 = [(CNAutocompleteSearchControllerOptions *)v54 shouldHideSeparator];

      if (v55)
      {
        v56 = [(CNAutocompleteSearchControllerOptions *)self->_options shouldHideSeparator];
        -[CNComposeRecipientTextView setSeparatorHidden:](self, "setSeparatorHidden:", [v56 BOOLValue]);
      }
    }
  }
}

- (BOOL)_shouldEmbedLabelInTextView
{
  return 1;
}

- (void)refreshPreferredContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)CNComposeRecipientTextView;
  [(CNComposeHeaderView *)&v4 refreshPreferredContentSize];
  textView = self->_textView;
  [(CNComposeHeaderView *)self _recipientViewEdgeInsets];
  -[_CNAtomTextView setTextContainerInset:](textView, "setTextContainerInset:");
  [(CNComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
  [(CNComposeRecipientTextView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[_CNAtomTextView sizeThatFits:](self->_textView, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4 + -2.0;
  result.CGFloat height = v5;
  result.CGFloat width = v3;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CNComposeRecipientTextView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeRecipientTextView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  if (!CGRectEqualToRect(v17, v18)) {
    [(CNComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CNComposeRecipientTextView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)CNComposeRecipientTextView;
  -[CNComposeRecipientTextView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  if (!CGRectEqualToRect(v17, v18)) {
    [(CNComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
  }
}

- (void)_removeAllRecipients
{
  double v3 = [(_CNAtomTextView *)self->_textView textStorage];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    double v5 = [(_CNAtomTextView *)self->_textView textStorage];
    uint64_t v6 = [v5 length];

    double v7 = [(_CNAtomTextView *)self->_textView textStorage];
    objc_msgSend(v7, "deleteCharactersInRange:", 0, v6);

    id v9 = [(_CNAtomTextView *)self->_textView layoutManager];
    double v8 = [(_CNAtomTextView *)self->_textView textContainer];
    [v9 ensureLayoutForTextContainer:v8];
  }
}

- (void)setAddresses:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(CNComposeRecipientTextView *)self recipients];
  uint64_t v6 = (void *)[v5 copy];

  [(CNComposeRecipientTextView *)self _removeAllRecipients];
  double v7 = [(CNComposeHeaderView *)self delegate];
  double v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = objc_msgSend(v7, "composeRecipientView:composeRecipientForAddress:", self, *(void *)(*((void *)&v17 + 1) + 8 * v13), (void)v17);
        if (([v8 containsObject:v14] & 1) == 0)
        {
          [(CNComposeRecipientTextView *)self addRecipient:v14];
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  if (objc_opt_respondsToSelector())
  {
    if ([v6 count]) {
      CGFloat v15 = v6;
    }
    else {
      CGFloat v15 = 0;
    }
    if (objc_msgSend(v8, "count", (void)v17)) {
      objc_super v16 = v8;
    }
    else {
      objc_super v16 = 0;
    }
    [v7 composeRecipientView:self didReplaceRecipients:v15 withRecipients:v16];
  }
  [(CNComposeRecipientTextView *)self _updateInactiveTextView];
  [(CNComposeRecipientTextView *)self reflow];
}

- (NSArray)recipients
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  textView = self->_textView;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__CNComposeRecipientTextView_recipients__block_invoke;
  v7[3] = &unk_1E6128F48;
  id v5 = v3;
  id v8 = v5;
  [(_CNAtomTextView *)textView enumerateAtoms:v7];

  return (NSArray *)v5;
}

void __40__CNComposeRecipientTextView_recipients__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  double v3 = [v6 recipient];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 recipient];
    [v4 addObject:v5];
  }
}

- (void)setRecipients:(id)a3
{
  id v4 = a3;
  [(CNComposeRecipientTextView *)self _removeAllRecipients];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CNComposeRecipientTextView_setRecipients___block_invoke;
  v5[3] = &unk_1E6128F70;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];

  [(CNComposeRecipientTextView *)self _updateInactiveTextView];
}

uint64_t __44__CNComposeRecipientTextView_setRecipients___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addRecipient:a2];
}

- (void)addRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [(CNComposeRecipientTextView *)self recipients];
  -[CNComposeRecipientTextView addRecipient:index:animate:](self, "addRecipient:index:animate:", v4, [v5 count], 0);
}

- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    objc_super v39 = v8;
    if (v5) {
      [(CNComposeRecipientTextView *)self _beginAtomViewAnimations];
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v10 = [(CNComposeRecipientTextView *)self selectedAtoms];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
    BOOL v40 = v5;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v10);
          }
          CGFloat v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          objc_super v16 = [(CNComposeRecipientTextView *)self recipients];
          long long v17 = [v15 recipient];
          a4 = [v16 indexOfObject:v17];

          long long v18 = [v15 recipient];
          [(CNComposeRecipientTextView *)self removeRecipient:v18];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v12);
    }

    id v9 = v39;
    if ([(CNComposeRecipientTextView *)self shouldExpandRecipient:v39])
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v19 = [v39 sortedChildren];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v42 = *(void *)v49;
        obuint64_t j = v19;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v49 != v42) {
              objc_enumerationMutation(obj);
            }
            CGFloat v23 = *(void **)(*((void *)&v48 + 1) + 8 * j);
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v24 = [v23 children];
            v25 = [v24 arrayByAddingObject:v23];

            uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v56 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v45;
              do
              {
                for (uint64_t k = 0; k != v27; ++k)
                {
                  if (*(void *)v45 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  [*(id *)(*((void *)&v44 + 1) + 8 * k) setIsMemberOfGroup:0];
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v56 count:16];
              }
              while (v27);
            }

            double v30 = [(CNComposeRecipientTextView *)self recipients];
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __57__CNComposeRecipientTextView_addRecipient_index_animate___block_invoke;
            v43[3] = &unk_1E6128188;
            v43[4] = v23;
            char v31 = objc_msgSend(v30, "_cn_any:", v43);

            if ((v31 & 1) == 0) {
              [(CNComposeRecipientTextView *)self addRecipient:v23 index:a4++ animate:v40];
            }
          }
          long long v19 = obj;
          uint64_t v21 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
        }
        while (v21);
      }
      id v9 = v39;
    }
    else
    {
      double v32 = [(CNComposeRecipientTextView *)self recipients];
      char v33 = [v32 containsObject:v39];

      if ((v33 & 1) == 0)
      {
        double v34 = [(CNComposeRecipientTextView *)self _atomAttachmentForRecipient:v39];
        [(CNComposeRecipientTextView *)self _insertAtomAttachment:v34 atCharacterIndex:a4];
        CGFloat v35 = [(CNComposeHeaderView *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v35 composeRecipientView:self didAddRecipient:v39];
        }
        -[_CNAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", a4 + 1, 0);
        CGFloat v36 = [(CNComposeRecipientTextView *)self undoManager];
        [v36 registerUndoWithTarget:self selector:sel_removeRecipient_ object:v39];
        if (([v36 isUndoing] & 1) == 0)
        {
          CGFloat v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v38 = [v37 localizedStringForKey:@"ADDRESS_ADDITION" value:&stru_1F0EC0C28 table:@"Localized"];
          [v36 setActionName:v38];

          id v9 = v39;
        }
      }
      [(CNComposeRecipientTextView *)self _updateAddButtonVisibility];
      long long v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 postNotificationName:@"CNComposeRecipientTextViewDidChangeNotification" object:self userInfo:0];
    }
  }
}

uint64_t __57__CNComposeRecipientTextView_addRecipient_index_animate___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 normalizedAddress];
  id v4 = [*(id *)(a1 + 32) normalizedAddress];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)shouldExpandRecipient:(id)a3
{
  id v4 = a3;
  if ([v4 isGroup])
  {
    if ([(CNComposeRecipientTextView *)self expandRecipientsInNamedGroups])
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v6 = *MEMORY[0x1E4F5A298];
      double v7 = [v4 displayString];
      char v5 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)undoManager
{
  undoManager = self->_undoManager;
  if (!undoManager)
  {
    id v4 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E4F29140]);
    char v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }

  return undoManager;
}

- (void)_didRemoveRecipient:(id)a3
{
  id v9 = a3;
  id v4 = [(CNComposeHeaderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 composeRecipientView:self didRemoveRecipient:v9];
  }
  char v5 = [(CNComposeRecipientTextView *)self undoManager];
  [v5 registerUndoWithTarget:self selector:sel_addRecipient_ object:v9];
  if (([v5 isUndoing] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v7 = [v6 localizedStringForKey:@"ADDRESS_DELETION" value:&stru_1F0EC0C28 table:@"Localized"];
    [v5 setActionName:v7];
  }
  [(CNComposeRecipientTextView *)self _updateAddButtonVisibility];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"CNComposeRecipientTextViewDidChangeNotification" object:self userInfo:0];
}

- (void)removeRecipient:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNComposeRecipientTextView *)self shouldExpandRecipient:v4])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    char v5 = objc_msgSend(v4, "children", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(CNComposeRecipientTextView *)self removeSingleRecipient:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [(CNComposeRecipientTextView *)self removeSingleRecipient:v4];
  }
}

- (void)removeSingleRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3010000000;
  long long v17 = &unk_1B5B44B83;
  long long v18 = xmmword_1B5B40C80;
  textView = self->_textView;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __52__CNComposeRecipientTextView_removeSingleRecipient___block_invoke;
  long long v11 = &unk_1E6128F98;
  id v6 = v4;
  id v12 = v6;
  long long v13 = &v14;
  [(_CNAtomTextView *)textView enumerateAtomAttachments:&v8];
  if (v15[4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(_CNAtomTextView *)self->_textView textStorage];
    objc_msgSend(v7, "deleteCharactersInRange:", v15[4], v15[5]);

    [(CNComposeRecipientTextView *)self _didRemoveRecipient:v6];
  }

  _Block_object_dispose(&v14, 8);
}

void __52__CNComposeRecipientTextView_removeSingleRecipient___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v9 = [a2 recipient];
  int v10 = [v9 isEquivalentAddressToRecipient:*(void *)(a1 + 32)];

  if (v10)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v11 + 32) = a3;
    *(void *)(v11 + 40) = a4;
    *a5 = 1;
  }
}

- (void)addAddress:(id)a3
{
  id v4 = a3;
  char v5 = [(CNComposeHeaderView *)self delegate];
  id v6 = [v5 composeRecipientView:self composeRecipientForAddress:v4];

  if (v6)
  {
    long long v11 = 0uLL;
    id v7 = [(CNComposeRecipientTextView *)self _userEnteredTextWithRange:&v11];
    textView = self->_textView;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__CNComposeRecipientTextView_addAddress___block_invoke;
    v9[3] = &unk_1E6128FC0;
    v9[4] = self;
    long long v10 = v11;
    [(_CNAtomTextView *)textView batchTextStorageUpdates:v9];
    [(CNComposeRecipientTextView *)self addRecipient:v6 index:(void)v11 animate:1];
    -[_CNAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", (void)v11 + 1, 0);
  }
}

void __41__CNComposeRecipientTextView_addAddress___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 544) textStorage];
  objc_msgSend(v2, "deleteCharactersInRange:", a1[5], a1[6]);
}

- (BOOL)containsAddress:(id)a3
{
  id v4 = a3;
  char v5 = [(_CNAtomTextView *)self->_textView atoms];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__CNComposeRecipientTextView_containsAddress___block_invoke;
  v10[3] = &unk_1E6128FE8;
  id v11 = v4;
  id v6 = v4;
  id v7 = [v5 indexesOfObjectsPassingTest:v10];
  BOOL v8 = [v7 count] != 0;

  return v8;
}

uint64_t __46__CNComposeRecipientTextView_containsAddress___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 recipient];
  id v4 = [v3 uncommentedAddress];
  uint64_t v5 = objc_msgSend(v4, "ea_isEqualToEmailAddress:", *(void *)(a1 + 32));

  return v5;
}

- (void)_addButtonTapped:(id)a3
{
  id v4 = [(CNComposeHeaderView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    self->_addButtonWasTapped = 1;
    [v4 composeRecipientViewRequestAddRecipient:self];
  }
}

- (void)addRecipientsFromContactItemProviders:(id)a3
{
}

- (NSArray)addresses
{
  id v2 = [(CNComposeRecipientTextView *)self recipients];
  double v3 = [v2 arrayByApplyingSelector:sel_commentedAddress];

  return (NSArray *)v3;
}

- (NSArray)uncommentedAddresses
{
  id v2 = [(CNComposeRecipientTextView *)self recipients];
  double v3 = [v2 arrayByApplyingSelector:sel_uncommentedAddress];

  return (NSArray *)v3;
}

- (void)setUsingActiveAppearance:(BOOL)a3
{
}

- (void)setUsingActiveAppearance:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v14 = a4;
  if (self->_usingActiveAppearance != a3)
  {
    BOOL v4 = a4;
    self->_usingActiveAppearance = a3;
    collapsableUpdateTimer = self->_collapsableUpdateTimer;
    if (collapsableUpdateTimer)
    {
      [(NSTimer *)collapsableUpdateTimer invalidate];
      id v7 = self->_collapsableUpdateTimer;
      self->_collapsableUpdateTimer = 0;

      *(_DWORD *)&a3 = self->_usingActiveAppearance;
    }
    BOOL v13 = !a3;
    if (v4)
    {
      BOOL v8 = (void *)MEMORY[0x1E4F1CA18];
      uint64_t v9 = [(CNComposeRecipientTextView *)self methodSignatureForSelector:sel__setTextViewIsCollapsed_animated_];
      long long v10 = [v8 invocationWithMethodSignature:v9];

      [v10 setTarget:self];
      [v10 setSelector:sel__setTextViewIsCollapsed_animated_];
      [v10 setArgument:&v13 atIndex:2];
      [v10 setArgument:&v14 atIndex:3];
      id v11 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v10 invocation:0 repeats:0.1];
      id v12 = self->_collapsableUpdateTimer;
      self->_collapsableUpdateTimer = v11;
    }
    else
    {
      [(CNComposeRecipientTextView *)self _setTextViewIsCollapsed:!a3 animated:0];
    }
  }
}

- (void)setEditable:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    -[_CNAtomTextView setEditable:](self->_textView, "setEditable:");
    [(CNComposeRecipientTextView *)self setUserInteractionEnabled:v3];
  }
}

- (void)setSeparatorHidden:(BOOL)a3
{
  if (self->_separatorHidden != a3)
  {
    BOOL v3 = a3;
    self->_separatorHidden = a3;
    id v4 = [(CNComposeHeaderView *)self separator];
    [v4 setHidden:v3];
  }
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  [(CNComposeRecipientTextView *)self _updateAddButtonVisibility];

  [(CNComposeRecipientTextView *)self _recomputeTextContainerExclusionPaths];
}

- (void)_updateAddButtonVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (self->_addButtonWasTapped || self->_usingActiveAppearance && self->_expanded)
    && self->_showsAddButtonWhenExpanded
    && [(CNComposeRecipientTextView *)self _canAddAdditionalAtoms];

  [(CNComposeRecipientTextView *)self _setAddButtonVisible:v5 animated:v3];
}

- (void)_updateAddButtonVisibility
{
}

- (void)setShowsAddButtonWhenExpanded:(BOOL)a3
{
  if (self->_showsAddButtonWhenExpanded != a3)
  {
    self->_showsAddButtonWhenExpanded = a3;
    [(CNComposeRecipientTextView *)self _updateAddButtonVisibility];
    [(CNComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
  }
}

- (BOOL)_hasUnsafeRecipients
{
  return [(CNComposeRecipientTextView *)self _hasRecipientsWithPresentationOptions:1];
}

- (BOOL)_hasDowntimeBlockedRecipients
{
  return [(CNComposeRecipientTextView *)self _hasRecipientsWithPresentationOptions:0x2000];
}

- (BOOL)_hasRecipientsWithPresentationOptions:(unint64_t)a3
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  textView = self->_textView;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__CNComposeRecipientTextView__hasRecipientsWithPresentationOptions___block_invoke;
  v6[3] = &unk_1E6129010;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  [(_CNAtomTextView *)textView enumerateAtoms:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __68__CNComposeRecipientTextView__hasRecipientsWithPresentationOptions___block_invoke(void *a1, void *a2)
{
  BOOL v3 = (void *)a1[4];
  char v4 = [a2 recipient];
  uint64_t v5 = [v3 _atomPresentationOptionsForRecipient:v4];

  if ((a1[6] & v5) != 0) {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
}

- (id)_userEnteredTextWithRange:(_NSRange *)a3
{
  uint64_t v5 = [(_CNAtomTextView *)self->_textView textStorage];
  id v6 = [v5 string];

  uint64_t v7 = [(_CNAtomTextView *)self->_textView selectedRange];
  uint64_t v9 = v7 + v8;
  if (v7 + v8 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = [v6 length];
  }
  uint64_t v10 = [v6 length];
  id v11 = [v6 substringToIndex:v9];
  id v12 = [MEMORY[0x1E4F28B88] textAttachmentCharacterSet];
  uint64_t v13 = [v11 rangeOfCharacterFromSet:v12 options:4];
  uint64_t v15 = v14;

  uint64_t v16 = [v6 substringFromIndex:v9];

  long long v17 = [MEMORY[0x1E4F28B88] textAttachmentCharacterSet];
  uint64_t v18 = [v16 rangeOfCharacterFromSet:v17 options:0];

  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v19 = 0;
  }
  else {
    NSUInteger v19 = v13 + v15;
  }
  uint64_t v20 = v18 + v9;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v20 = v10;
  }
  uint64_t v21 = v20 - v19;
  NSUInteger v22 = v21 & ~(v21 >> 63);
  if (v19 == 0x7FFFFFFFFFFFFFFFLL || v21 < 1)
  {
    uint64_t v24 = &stru_1F0EC0C28;
    if (a3)
    {
LABEL_16:
      a3->id location = v19;
      a3->length = v22;
    }
  }
  else
  {
    objc_msgSend(v6, "substringWithRange:", v19, v21 & ~(v21 >> 63));
    uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (a3) {
      goto LABEL_16;
    }
  }

  return v24;
}

- (NSString)text
{
  return (NSString *)[(CNComposeRecipientTextView *)self _userEnteredTextWithRange:0];
}

- (UITextView)textView
{
  return (UITextView *)self->_textView;
}

- (double)offsetForRowWithTextField
{
  [(CNComposeRecipientTextView *)self bounds];
  double v3 = v2;
  [(id)objc_opt_class() preferredHeight];
  return v3 - v4;
}

- (unint64_t)numberOfRowsOfTextInField
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  double v3 = [(_CNAtomTextView *)self->_textView layoutManager];
  uint64_t v4 = [v3 numberOfGlyphs];

  uint64_t v5 = [(_CNAtomTextView *)self->_textView layoutManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CNComposeRecipientTextView_numberOfRowsOfTextInField__block_invoke;
  v8[3] = &unk_1E6129038;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v4, v8);

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __55__CNComposeRecipientTextView_numberOfRowsOfTextInField__block_invoke(uint64_t result)
{
  return result;
}

- (void)setBaseFont:(id)a3
{
  p_baseFont = &self->_baseFont;
  id v6 = a3;
  if ((-[UIFont isEqual:](*p_baseFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_baseFont, a3);
    [(_CNAtomTextView *)self->_textView setFont:*p_baseFont];
  }
}

- (UIFont)baseFont
{
  double v2 = self->_baseFont;
  if (!v2)
  {
    double v2 = [(id)objc_opt_class() defaultFont];
  }

  return v2;
}

- (BOOL)hasContent
{
  double v2 = [(_CNAtomTextView *)self->_textView textStorage];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (double)textFieldOffsetForNumberOfRowsToScroll:(unint64_t)a3 numberOfRowsAboveField:(int64_t)a4
{
  unint64_t v7 = [(CNComposeRecipientTextView *)self numberOfRowsOfTextInField];
  if (a4 >= a3) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = a4;
  }
  unint64_t v9 = a3 - v8;
  if (v7 < a3 - v8) {
    unint64_t v9 = v7;
  }
  if (a4 >= a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }
  double v11 = 0.0;
  double v12 = 0.0;
  if (v8 >= 1)
  {
    double v13 = (double)v8;
    [(id)objc_opt_class() preferredHeight];
    double v12 = v14 * v13;
  }
  if (v10 >= 1)
  {
    [(id)objc_opt_class() preferredHeight];
    double v16 = v15;
    [(CNComposeHeaderView *)self _recipientViewEdgeInsets];
    double v11 = (v16 - v17) * (double)v10;
  }
  return v12 + v11;
}

- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNComposeHeaderView *)self delegate];
  id v6 = [(NSMutableDictionary *)self->_atomPresentationOptionsByRecipient objectForKey:v4];
  unint64_t v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else if (objc_opt_respondsToSelector())
  {
    unint64_t v8 = [v5 presentationOptionsForRecipient:v4];
    atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v8];
    [(NSMutableDictionary *)atomPresentationOptionsByRecipient setObject:v10 forKey:v4];
  }
  else
  {
    unint64_t v8 = 0;
  }
  if ([(CNComposeDropTarget *)self->_dropTarget handlesDroppedContacts]
    && ![v4 kind])
  {
    uint64_t v11 = *MEMORY[0x1E4F5A2A0];
    double v12 = [v4 address];
    if ((*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12))
    {
      double v13 = (void *)MEMORY[0x1E4F607F8];
      double v14 = [v4 address];
      double v15 = [v13 emailAddressWithString:v14];

      if (!v15) {
        v8 |= 0x20000uLL;
      }
    }
    else
    {

      v8 |= 0x20000uLL;
    }
  }

  return v8;
}

- (void)_invalidateAtomPresentationOptionsCache
{
}

- (void)setLabel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNComposeRecipientTextView;
  [(CNComposeHeaderView *)&v4 setLabel:a3];
  [(CNComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
}

- (UIColor)inactiveTextColor
{
  inactiveTextColor = self->_inactiveTextColor;
  if (!inactiveTextColor)
  {
    objc_super v4 = [(CNComposeRecipientTextView *)self interactionTintColor];
    uint64_t v5 = (UIColor *)[v4 copy];
    id v6 = self->_inactiveTextColor;
    self->_inactiveTextColor = v5;

    inactiveTextColor = self->_inactiveTextColor;
  }

  return inactiveTextColor;
}

- (void)setInactiveTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveTextColor, a3);

  [(CNComposeRecipientTextView *)self _updateInactiveTextView];
}

- (id)_baseAttributes
{
  v8.receiver = self;
  v8.super_class = (Class)CNComposeRecipientTextView;
  BOOL v3 = [(CNComposeHeaderView *)&v8 _baseAttributes];
  objc_super v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(CNComposeRecipientTextView *)self typingTextColor];

  if (v5)
  {
    id v6 = [(CNComposeRecipientTextView *)self typingTextColor];
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
  }

  return v4;
}

- (void)clearText
{
  BOOL v3 = [(_CNAtomTextView *)self->_textView delegate];
  [(_CNAtomTextView *)self->_textView setDelegate:0];
  [(_CNAtomTextView *)self->_textView unmarkText];
  [(_CNAtomTextView *)self->_textView setDelegate:v3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  uint64_t v5 = NSString;
  id v6 = [(_CNAtomTextView *)self->_textView textStorage];
  unint64_t v7 = [v6 string];
  objc_super v8 = [v5 stringWithString:v7];

  if ([v8 length])
  {
    unint64_t v9 = [MEMORY[0x1E4F28B88] textAttachmentCharacterSet];
    uint64_t v10 = [MEMORY[0x1E4F28FE8] scannerWithString:v8];
    [v10 setCharactersToBeSkipped:0];
    uint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = [v10 scanLocation];
      if (v12 >= [v8 length]) {
        break;
      }
      id v23 = v11;
      int v13 = [v10 scanUpToCharactersFromSet:v9 intoString:&v23];
      id v14 = v23;

      if ([v14 length])
      {
        uint64_t v15 = [v10 scanLocation];
        uint64_t v16 = v15 - [v14 length];
        uint64_t v17 = [v14 length];
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v16, v17);
        [v4 addObject:v18];
      }
      uint64_t v11 = v14;
      if (((v13 | [v10 scanCharactersFromSet:v9 intoString:0]) & 1) == 0) {
        goto LABEL_9;
      }
    }
    id v14 = v11;
LABEL_9:
    textView = self->_textView;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __39__CNComposeRecipientTextView_clearText__block_invoke;
    v20[3] = &unk_1E61283C0;
    id v21 = v4;
    NSUInteger v22 = self;
    [(_CNAtomTextView *)textView batchTextStorageUpdates:v20];
  }
}

void __39__CNComposeRecipientTextView_clearText__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "reverseObjectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v11 + 1) + 8 * v6) rangeValue];
        uint64_t v9 = v8;
        uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 544) textStorage];
        objc_msgSend(v10, "deleteCharactersInRange:", v7, v9);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)invalidateAtomPresentationOptions
{
  [(NSMutableDictionary *)self->_atomPresentationOptionsByRecipient removeAllObjects];
  [(NSMutableDictionary *)self->_atomLayoutOptionsByRecipient removeAllObjects];
  textView = self->_textView;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__CNComposeRecipientTextView_invalidateAtomPresentationOptions__block_invoke;
  v4[3] = &unk_1E6128F48;
  v4[4] = self;
  [(_CNAtomTextView *)textView enumerateAtoms:v4];
  [(CNComposeRecipientTextView *)self reflow];
}

void __63__CNComposeRecipientTextView_invalidateAtomPresentationOptions__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 recipient];
  if (v3) {
    objc_msgSend(v4, "setPresentationOptions:", objc_msgSend(*(id *)(a1 + 32), "_atomPresentationOptionsForRecipient:", v3));
  }
}

- (void)invalidateAtomPresentationOptionsForRecipient:(id)a3
{
  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  id v5 = a3;
  [(NSMutableDictionary *)atomPresentationOptionsByRecipient removeObjectForKey:v5];
  id v7 = [(CNComposeRecipientTextView *)self atomViewForRecipient:v5];
  unint64_t v6 = [(CNComposeRecipientTextView *)self _atomPresentationOptionsForRecipient:v5];

  [v7 setPresentationOptions:v6];
  [(CNComposeRecipientTextView *)self reflow];
}

- (void)setAtomPresentationOptions:(unint64_t)a3 forRecipient:(id)a4
{
  id v8 = a4;
  unint64_t v6 = -[CNComposeRecipientTextView atomViewForRecipient:](self, "atomViewForRecipient:");
  if (v6)
  {
    id v7 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)self->_atomPresentationOptionsByRecipient setObject:v7 forKeyedSubscript:v8];

    [v6 setPresentationOptions:a3];
    [(CNComposeRecipientTextView *)self reflow];
  }
  else
  {
    [(NSMutableDictionary *)self->_atomPresentationOptionsByRecipient removeObjectForKey:v8];
  }
}

- (void)parentWillClose
{
  self->_parentIsClosing = 1;
}

- (void)parentDidClose
{
  self->_parentIsClosing = 0;
}

- (BOOL)finishEnteringRecipient
{
  if (self->_parentIsClosing) {
    goto LABEL_2;
  }
  BOOL v2 = [(CNComposeRecipientTextView *)self usingActiveAppearance];
  if (!v2) {
    return v2;
  }
  id v4 = [(CNComposeRecipientTextView *)self text];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
LABEL_2:
    LOBYTE(v2) = 0;
  }
  else
  {
    unint64_t v6 = [(CNComposeHeaderView *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(CNComposeRecipientTextView *)self text];
      [v6 composeRecipientView:self didFinishEnteringAddress:v7];
    }
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (BOOL)becomeFirstResponder
{
  return [(_CNAtomTextView *)self->_textView becomeFirstResponder];
}

- (BOOL)isFirstResponder
{
  return [(_CNAtomTextView *)self->_textView isFirstResponder];
}

- (BOOL)resignFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)CNComposeRecipientTextView;
  [(CNComposeRecipientTextView *)&v4 resignFirstResponder];
  return [(_CNAtomTextView *)self->_textView resignFirstResponder];
}

- (BOOL)_useRightToLeftLayout
{
  BOOL v2 = [MEMORY[0x1E4F42738] sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == 1;

  return v3;
}

- (void)reflow
{
  if (![(_CNAtomTextView *)self->_textView isEditingTextStorage])
  {
    BOOL v3 = [(_CNAtomTextView *)self->_textView layoutManager];
    uint64_t v4 = [v3 numberOfGlyphs];

    uint64_t v5 = [(_CNAtomTextView *)self->_textView layoutManager];
    uint64_t v6 = objc_msgSend(v5, "characterRangeForGlyphRange:actualGlyphRange:", 0, v4, 0);
    uint64_t v8 = v7;

    uint64_t v9 = [(_CNAtomTextView *)self->_textView layoutManager];
    objc_msgSend(v9, "invalidateLayoutForCharacterRange:actualCharacterRange:", v6, v8, 0);

    if ([(CNComposeRecipientTextView *)self _isTextViewCollapsed]) {
      [(CNComposeRecipientTextView *)self _updateInactiveTextView];
    }
    [(CNComposeRecipientTextView *)self setNeedsLayout];
  }
}

- (id)_textContainerExclusionPathsWithAddButton:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (v3) {
    [(CNComposeRecipientTextView *)self _ensureAddButton];
  }
  v30.receiver = self;
  v30.super_class = (Class)CNComposeRecipientTextView;
  [(CNComposeRecipientTextView *)&v30 layoutIfNeeded];
  BOOL v6 = [(CNComposeRecipientTextView *)self _useRightToLeftLayout];
  if (v6) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 2;
  }
  uint64_t v8 = [(CNComposeHeaderView *)self labelView];
  [(CNComposeHeaderView *)self _exclusionRectForView:v8 alongEdge:v7];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  uint64_t v17 = [(CNComposeRecipientTextView *)self textView];
  -[CNComposeRecipientTextView convertRect:toView:](self, "convertRect:toView:", v17, v10, v12, v14, v16);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  uint64_t v26 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", v19, v21, v23, v25);
  [v5 addObject:v26];
  if (v3)
  {
    if (v6) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = 8;
    }
    [(CNComposeHeaderView *)self _exclusionRectForView:self->_addButton alongEdge:v27];
    -[CNComposeRecipientTextView convertRect:toView:](self, "convertRect:toView:", self->_textView);
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:");
    [v5 addObject:v28];
  }

  return v5;
}

- (void)_recomputeTextContainerExclusionPaths
{
  if (!self->_textViewExclusionPathsAreValid)
  {
    if (self->_expanded
      || ([(_CNAtomTextView *)self->_textView attributedText],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          uint64_t v4 = [v3 length],
          v3,
          v4))
    {
      id v8 = [(CNComposeRecipientTextView *)self _textContainerExclusionPathsWithAddButton:self->_showsAddButtonWhenExpanded];
      uint64_t v5 = [(_CNAtomTextView *)self->_textView textContainer];
      [v5 setExclusionPaths:v8];

      self->_textViewExclusionPathsAreValid = 1;
      textView = self->_textView;
      uint64_t v7 = [(CNComposeRecipientTextView *)self _baseAttributes];
      [(_CNAtomTextView *)textView setTypingAttributes:v7];

      if ([(CNComposeRecipientTextView *)self _isTextViewCollapsed]) {
        [(CNComposeRecipientTextView *)self _updateInactiveTextView];
      }
    }
  }
}

- (void)_invalidateTextContainerExclusionPaths
{
  if (self->_textViewExclusionPathsAreValid)
  {
    self->_textViewExclusionPathsAreValid = 0;
    BOOL v3 = [MEMORY[0x1E4F5A4F0] defaultProvider];
    uint64_t v4 = [v3 mainThreadScheduler];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__CNComposeRecipientTextView__invalidateTextContainerExclusionPaths__block_invoke;
    v6[3] = &unk_1E6128548;
    v6[4] = self;
    id v5 = (id)[v4 afterDelay:v6 performBlock:0.0];
  }
}

uint64_t __68__CNComposeRecipientTextView__invalidateTextContainerExclusionPaths__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recomputeTextContainerExclusionPaths];
}

- (_NSRange)_rangeForComposeRecipientAtom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3010000000;
  uint64_t v17 = &unk_1B5B44B83;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  int64x2_t v18 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  if (v4)
  {
    textView = self->_textView;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__CNComposeRecipientTextView__rangeForComposeRecipientAtom___block_invoke;
    v11[3] = &unk_1E6128F98;
    id v12 = v4;
    double v13 = &v14;
    [(_CNAtomTextView *)textView enumerateAtomAttachments:v11];

    uint64_t v8 = v15[4];
    uint64_t v6 = v15[5];
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v14, 8);

  NSUInteger v9 = v8;
  NSUInteger v10 = v6;
  result.length = v10;
  result.id location = v9;
  return result;
}

void __60__CNComposeRecipientTextView__rangeForComposeRecipientAtom___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  NSUInteger v9 = [a2 atomView];
  NSUInteger v10 = *(void **)(a1 + 32);

  if (v9 == v10)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v11 + 32) = a3;
    *(void *)(v11 + 40) = a4;
    *a5 = 1;
  }
}

- (id)_atomViewAtCharacterIndex:(unint64_t)a3
{
  id v4 = [(_CNAtomTextView *)self->_textView textStorage];
  id v5 = [v4 attributesAtIndex:a3 effectiveRange:0];

  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4FB06B8]];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = [v6 atomView];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_setValue:(id)a3 forAtomLayoutOption:(id)a4 withRecipient:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  NSUInteger v10 = [(NSMutableDictionary *)self->_atomLayoutOptionsByRecipient objectForKey:v9];
  if (!v10)
  {
    NSUInteger v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_atomLayoutOptionsByRecipient setObject:v10 forKey:v9];
  }
  [v10 setObject:v11 forKey:v8];
}

- (id)_valueForAtomLayoutOption:(id)a3 withRecipient:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_atomLayoutOptionsByRecipient objectForKey:a4];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKey:v6];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_beginAtomViewAnimations
{
}

- (BOOL)_shouldAnimateAtomViewChanges
{
  return self->_atomViewAnimationDepth > 0;
}

- (void)_resetSelectionState
{
  BOOL v3 = [(_CNAtomTextView *)self->_textView text];
  uint64_t v4 = [v3 length];

  -[_CNAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", v4, 0);
  atomViews = self->_atomViews;

  [(NSMutableArray *)atomViews enumerateObjectsUsingBlock:&__block_literal_global_116];
}

uint64_t __50__CNComposeRecipientTextView__resetSelectionState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelected:0 animated:1];
}

- (BOOL)_textViewContainsAtomizedRecipients
{
  BOOL v3 = [(_CNAtomTextView *)self->_textView textStorage];
  if ([v3 length])
  {
    uint64_t v4 = [(CNComposeRecipientTextView *)self recipients];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_toString
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4FB0700];
  BOOL v3 = [(CNComposeHeaderView *)self labelView];
  uint64_t v4 = [v3 textColor];
  v16[0] = v4;
  v15[1] = *MEMORY[0x1E4FB06F8];
  BOOL v5 = [(CNComposeHeaderView *)self labelView];
  id v6 = [v5 font];
  v16[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v9 = [(CNComposeHeaderView *)self labelView];
  uint64_t v10 = [v9 text];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = &stru_1F0EC0C28;
  }
  double v13 = (void *)[v8 initWithString:v12 attributes:v7];

  return v13;
}

- (void)_ensureInactiveTextView
{
  if (!self->_inactiveTextView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42F58]);
    uint64_t v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:textContainer:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    inactiveTextView = self->_inactiveTextView;
    self->_inactiveTextView = v4;

    id v6 = self->_inactiveTextView;
    uint64_t v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITextView *)v6 setBackgroundColor:v7];

    [(UITextView *)self->_inactiveTextView setEditable:0];
    [(UITextView *)self->_inactiveTextView setSelectable:0];
    [(UITextView *)self->_inactiveTextView setScrollEnabled:0];
    [(UITextView *)self->_inactiveTextView setUserInteractionEnabled:0];
    [(UITextView *)self->_inactiveTextView setHidden:!self->_isTextFieldCollapsed];
    double v8 = 1.0;
    if (!self->_isTextFieldCollapsed) {
      double v8 = 0.0;
    }
    [(UITextView *)self->_inactiveTextView setAlpha:v8];
    id v9 = [(UITextView *)self->_inactiveTextView textContainer];
    [v9 setLineFragmentPadding:0.0];

    uint64_t v10 = self->_inactiveTextView;
    [(CNComposeRecipientTextView *)self addSubview:v10];
  }
}

- (void)_updateInactiveTextView
{
  [(CNComposeRecipientTextView *)self _ensureInactiveTextView];
  [(CNComposeHeaderView *)self _recipientViewEdgeInsets];
  -[UITextView setTextContainerInset:](self->_inactiveTextView, "setTextContainerInset:");
  id v3 = [(CNComposeRecipientTextView *)self _attributedStringWithAtomizedRecipients];
  [(UITextView *)self->_inactiveTextView setAttributedText:v3];

  [(UITextView *)self->_inactiveTextView frame];
  [(_CNAtomTextView *)self->_textView frame];
  double v5 = v4;
  double v7 = v6;
  [(_CNAtomTextView *)self->_textView frame];
  double v9 = v8;
  +[CNComposeHeaderView preferredHeight];
  inactiveTextView = self->_inactiveTextView;

  -[UITextView setFrame:](inactiveTextView, "setFrame:", v5, v7, v9, v10);
}

- (id)_attributedStringWithAtomizedRecipients
{
  if ([(CNComposeRecipientTextView *)self _textViewContainsAtomizedRecipients])
  {
    id v3 = [(CNComposeRecipientTextView *)self _baseAttributes];
    double v4 = (void *)[v3 mutableCopy];

    if ([(CNComposeRecipientTextView *)self _hasDowntimeBlockedRecipients]
      || self->_indicatesUnsafeRecipientsWhenCollapsed
      && [(CNComposeRecipientTextView *)self _hasUnsafeRecipients])
    {
      uint64_t v5 = [MEMORY[0x1E4F428B8] systemRedColor];
    }
    else
    {
      uint64_t v5 = [(CNComposeRecipientTextView *)self inactiveTextColor];
    }
    double v7 = (void *)v5;
    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    double v8 = [(CNComposeRecipientTextView *)self recipients];
    double v9 = [(_CNAtomTextView *)self->_textView layoutManager];
    [v9 lineFragmentRectForGlyphAtIndex:0 effectiveRange:0];
    uint64_t v11 = v10;

    id v12 = objc_alloc_init(CNNameListBuilderBlockDelegate);
    -[CNNameListBuilderBlockDelegate setCountOfNames:](v12, "setCountOfNames:", [v8 count]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __69__CNComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke;
    v25[3] = &unk_1E6129080;
    id v26 = v8;
    id v13 = v8;
    [(CNNameListBuilderBlockDelegate *)v12 setNameProviderBlock:v25];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__CNComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke_2;
    v22[3] = &unk_1E61290A8;
    id v23 = v4;
    uint64_t v24 = v11;
    id v14 = v4;
    [(CNNameListBuilderBlockDelegate *)v12 setLengthValidationBlock:v22];
    double v15 = [[CNNameListBuilder alloc] initWithDelegate:v12];
    [(CNNameListBuilder *)v15 setShouldStripEllipses:0];
    uint64_t v16 = [(CNNameListBuilder *)v15 build];
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v16 attributes:v14];
    id v17 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    objc_msgSend(v17, "setBounds:", 0.0, 0.0, 5.0, 5.0);
    int64x2_t v18 = objc_opt_new();
    [v17 setImage:v18];

    double v19 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v17];
    [v6 insertAttributedString:v19 atIndex:0];
    double v20 = [(CNComposeRecipientTextView *)self _toString];
    [v6 insertAttributedString:v20 atIndex:0];
  }
  else
  {
    double v6 = [(CNComposeRecipientTextView *)self _toString];
  }

  return v6;
}

id __69__CNComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = [*(id *)(a1 + 32) objectAtIndex:a2];
  id v3 = [v2 compositeName];

  return v3;
}

BOOL __69__CNComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 sizeWithAttributes:*(void *)(a1 + 32)];
  return v3 < *(double *)(a1 + 40);
}

- (BOOL)_isTextViewCollapsed
{
  return self->_isTextFieldCollapsed;
}

- (void)_setTextViewIsCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  collapsableUpdateTimer = self->_collapsableUpdateTimer;
  self->_collapsableUpdateTimer = 0;

  BOOL v8 = [(CNComposeRecipientTextView *)self _isTextViewCollapsed];
  if (v5) {
    int v9 = ![(CNComposeRecipientTextView *)self _textViewContainsAtomizedRecipients];
  }
  else {
    int v9 = 0;
  }
  if (!self->_collapsedStateInitialized || ((v9 | v8 ^ v5 ^ 1) & 1) == 0)
  {
    self->_collapsedStateInitialized = 1;
    self->_isTextFieldCollapsed = v5;
    if (v5) {
      [(CNComposeRecipientTextView *)self _updateInactiveTextView];
    }
    [(_CNAtomTextView *)self->_textView bounds];
    -[_CNAtomTextView setBounds:](self->_textView, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __63__CNComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke;
    v32[3] = &unk_1E6128D08;
    v32[4] = self;
    BOOL v33 = v5;
    uint64_t v10 = (void (**)(void))MEMORY[0x1BA9A6470](v32);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __63__CNComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke_2;
    v30[3] = &unk_1E6128E20;
    v30[4] = self;
    BOOL v31 = v5;
    uint64_t v11 = (void (**)(void, void))MEMORY[0x1BA9A6470](v30);
    if (v4)
    {
      [(UITextView *)self->_inactiveTextView setHidden:0];
      if (v5) {
        double v12 = 0.0;
      }
      else {
        double v12 = 1.0;
      }
      if (v5) {
        double v13 = 1.0;
      }
      else {
        double v13 = 0.0;
      }
      [(UITextView *)self->_inactiveTextView setAlpha:v12];
      [(_CNAtomTextView *)self->_textView setAlpha:v13];
      [MEMORY[0x1E4F42FF0] animateWithDuration:v10 animations:v11 completion:0.23];
      if (!v5) {
        goto LABEL_16;
      }
    }
    else
    {
      v10[2](v10);
      v11[2](v11, 1);
      if (!v5)
      {
LABEL_16:
        id v14 = [(_CNAtomTextView *)self->_textView layoutManager];
        double v15 = [(_CNAtomTextView *)self->_textView textStorage];
        objc_msgSend(v14, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v15, "length"), 0);

        uint64_t v16 = [(_CNAtomTextView *)self->_textView layoutManager];
        id v17 = [(_CNAtomTextView *)self->_textView textContainer];
        [v16 ensureLayoutForTextContainer:v17];

        goto LABEL_21;
      }
    }
    uint64_t v16 = [(UITextView *)self->_inactiveTextView text];
    if ([v16 length])
    {
      BOOL v18 = [(CNComposeRecipientTextView *)self _delegateRespondsToSizeChange];

      if (v18)
      {
        [(CNComposeRecipientTextView *)self bounds];
        double v20 = v19;
        [(CNComposeHeaderView *)self _additionalContentHeight];
        double v22 = v21;
        [(UITextView *)self->_inactiveTextView frame];
        -[CNComposeRecipientTextView _notifyDelegateOfNewSize:](self, "_notifyDelegateOfNewSize:", v20, v22 + v23);
        [(_CNAtomTextView *)self->_textView bounds];
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        [(UITextView *)self->_inactiveTextView frame];
        -[_CNAtomTextView setBounds:](self->_textView, "setBounds:", v25, v27, v29);
      }
      goto LABEL_22;
    }
LABEL_21:

LABEL_22:
  }
}

uint64_t __63__CNComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 552) setAlpha:v2];
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 544);

  return [v4 setAlpha:v3];
}

uint64_t __63__CNComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 552) setHidden:*(unsigned char *)(result + 40) == 0];
  }
  return result;
}

- (void)_ensureAddButton
{
  if (!self->_addButton)
  {
    double v3 = [MEMORY[0x1E4F42A80] systemImageNamed:@"plus.circle"];
    BOOL v4 = +[CNComposeRecipientActionButton systemButtonWithImage:v3 target:self action:sel__addButtonTapped_];
    addButton = self->_addButton;
    self->_addButton = v4;

    double v6 = self->_addButton;
    double v7 = +[CNComposeTableViewCell axCappedSymbolConfigurationIsBold:0];
    [(UIButton *)v6 setPreferredSymbolConfiguration:v7 forImageInState:0];

    [(CNComposeRecipientTextView *)self _updateAddButtonVisibilityAnimated:0];
    [(UIButton *)self->_addButton setAccessibilityIdentifier:@"ComposeRecipientAddButton"];
    BOOL v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v9 = [v8 localizedStringForKey:@"ADD_CONTACT_ACCESSIBILITY_LABEL" value:&stru_1F0EC0C28 table:@"Localized"];
    [(UIButton *)self->_addButton setAccessibilityLabel:v9];

    [(UIButton *)self->_addButton setAutoresizingMask:0];
    [(UIButton *)self->_addButton setAutoresizesSubviews:0];
    [(UIButton *)self->_addButton setPointerInteractionEnabled:1];
    [(UIButton *)self->_addButton frame];
    self->_addButtonFrame.origin.double x = v10;
    self->_addButtonFrame.origin.double y = v11;
    self->_addButtonFrame.size.double width = v12;
    self->_addButtonFrame.size.double height = v13;
    id v14 = self->_addButton;
    [(CNComposeRecipientTextView *)self addSubview:v14];
  }
}

- (BOOL)_isAddButtonVisible
{
  [(UIButton *)self->_addButton alpha];
  return v2 > 0.0;
}

- (void)_setAddButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CNComposeRecipientTextView *)self _isAddButtonVisible] != a3)
  {
    if (v5 && !self->_addButton) {
      [(CNComposeRecipientTextView *)self _ensureAddButton];
    }
    if ([(CNComposeRecipientTextView *)self shouldAlwaysShowAddContactsButton])
    {
      id v12 = [(CNComposeRecipientTextView *)self addButton];
      [v12 setAlpha:1.0];
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __60__CNComposeRecipientTextView__setAddButtonVisible_animated___block_invoke;
      v15[3] = &unk_1E6128D08;
      v15[4] = self;
      BOOL v16 = v5;
      uint64_t v7 = MEMORY[0x1BA9A6470](v15);
      BOOL v8 = (void *)v7;
      if (v4)
      {
        double v9 = 1.0;
        if (v5) {
          double v9 = 0.0;
        }
        [(UIButton *)self->_addButton setAlpha:v9];
        if (v5)
        {
          CGAffineTransformMakeTranslation(&v14, 2.0, 0.0);
        }
        else
        {
          long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          *(_OWORD *)&v14.a = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&v14.c = v10;
          *(_OWORD *)&v14.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        }
        addButton = self->_addButton;
        CGAffineTransform v13 = v14;
        [(UIButton *)addButton setTransform:&v13];
        [MEMORY[0x1E4F42FF0] animateWithDuration:v8 animations:0.2];
      }
      else
      {
        (*(void (**)(uint64_t))(v7 + 16))(v7);
      }
    }
  }
}

void __60__CNComposeRecipientTextView__setAddButtonVisible_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  double v3 = [*(id *)(a1 + 32) addButton];
  [v3 setAlpha:v2];

  BOOL v4 = [*(id *)(a1 + 32) addButton];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 setTransform:v6];
}

- (BOOL)_recipientAtomHitInView:(id)a3 atLocation:(CGPoint)a4
{
  BOOL v4 = objc_msgSend(a3, "hitTest:withEvent:", 0, a4.x, a4.y);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_tapGestureRecognized:(id)a3
{
  id v8 = a3;
  if ([v8 state] == 3)
  {
    BOOL v4 = [(CNComposeRecipientTextView *)self textView];
    if ([v4 isEditable])
    {
    }
    else
    {
      long long v5 = [v8 view];
      double v6 = [v8 view];
      [v8 locationInView:v6];
      BOOL v7 = -[CNComposeRecipientTextView _recipientAtomHitInView:atLocation:](self, "_recipientAtomHitInView:atLocation:", v5);

      if (!v7) {
        goto LABEL_6;
      }
    }
    [(_CNAtomTextView *)self->_textView becomeFirstResponder];
  }
LABEL_6:
}

- (void)_longPressGestureRecognized:(id)a3
{
  id v8 = a3;
  if ([v8 state] == 1)
  {
    BOOL v4 = [(CNComposeRecipientTextView *)self textView];
    if ([v4 isEditable])
    {
    }
    else
    {
      long long v5 = [v8 view];
      double v6 = [v8 view];
      [v8 locationInView:v6];
      BOOL v7 = -[CNComposeRecipientTextView _recipientAtomHitInView:atLocation:](self, "_recipientAtomHitInView:atLocation:", v5);

      if (!v7) {
        goto LABEL_6;
      }
    }
    [(_CNAtomTextView *)self->_textView becomeFirstResponder];
  }
LABEL_6:
}

- (BOOL)_canAddAdditionalAtoms
{
  if (self->_maxRecipients < 1) {
    return 1;
  }
  double v3 = [(CNComposeRecipientTextView *)self recipients];
  BOOL v4 = (unint64_t)[v3 count] < self->_maxRecipients;

  return v4;
}

- (id)_atomAttachmentForRecipient:(id)a3
{
  id v4 = a3;
  long long v5 = [CNComposeRecipientAtom alloc];
  double v6 = -[CNComposeRecipientAtom initWithFrame:recipient:](v5, "initWithFrame:recipient:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  unint64_t v7 = [(CNComposeRecipientTextView *)self _atomPresentationOptionsForRecipient:v4];

  [(CNAtomView *)v6 setPresentationOptions:v7];
  id v8 = [[_CNAtomTextAttachment alloc] initWithAtomView:v6];

  return v8;
}

- (void)_insertAtomAttachment:(id)a3 atCharacterIndex:(unint64_t)a4
{
}

- (void)_insertAtomAttachment:(id)a3 andReplaceCharactersInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = [(CNComposeRecipientTextView *)self _baseAttributes];
  id v10 = [v7 attributedStringWithBaseAttributes:v8];

  double v9 = [(_CNAtomTextView *)self->_textView textStorage];
  if (length) {
    objc_msgSend(v9, "replaceCharactersInRange:withAttributedString:", location, length, v10);
  }
  else {
    [v9 insertAttributedString:v10 atIndex:location];
  }

  if (![(_CNAtomTextView *)self->_textView isEditingTextStorage]) {
    [(CNComposeRecipientTextView *)self _recomputeTextContainerExclusionPaths];
  }
}

- (void)_addAddressAtomSubview:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_atomViews, "containsObject:") & 1) == 0)
  {
    [v4 setDelegate:self];
    [(NSMutableArray *)self->_atomViews addObject:v4];
    [(_CNAtomTextView *)self->_textView addSubview:v4];
  }
}

- (void)_removeAddressAtomSubview:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:0];
  [(NSMutableArray *)self->_atomViews removeObject:v4];
  [v4 removeFromSuperview];
}

- (id)atomViewForRecipient:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v5 = self->_atomViews;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "recipient", (void)v13);
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)atomViewsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  textView = self->_textView;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__CNComposeRecipientTextView_atomViewsInRange___block_invoke;
  v10[3] = &unk_1E6128F48;
  id v8 = v6;
  id v11 = v8;
  -[_CNAtomTextView enumerateAtomsInCharacterRange:withBlock:](textView, "enumerateAtomsInCharacterRange:withBlock:", location, length, v10);

  return v8;
}

uint64_t __47__CNComposeRecipientTextView_atomViewsInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)selectedAtoms
{
  uint64_t v4 = [(_CNAtomTextView *)self->_textView selectedRange];

  return -[CNComposeRecipientTextView atomViewsInRange:](self, "atomViewsInRange:", v4, v3);
}

- (unint64_t)indexOfRecipientForInsertionAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  long long v5 = [(_CNAtomTextView *)self->_textView atoms];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v12 = [v5 count];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__CNComposeRecipientTextView_indexOfRecipientForInsertionAtPoint___block_invoke;
  v8[3] = &unk_1E61290D0;
  *(CGFloat *)&void v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];
  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __66__CNComposeRecipientTextView_indexOfRecipientForInsertionAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  [v7 frame];
  double MaxX = CGRectGetMaxX(v11);
  [v7 frame];
  double v10 = v9;

  if (*(double *)(a1 + 40) < MaxX + v10 * -0.5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  int v11 = [v10 isEqualToString:@"\n"];
  int v12 = [v10 isEqualToString:@"\t"];
  if ([v10 isEqualToString:@","])
  {
    long long v13 = [v9 markedTextRange];
    BOOL v14 = v13 == 0;
  }
  else
  {
    BOOL v14 = 0;
  }
  int v15 = v11 | v12;
  if ((v15 & 1) == 0 && !v14)
  {
    if ([v10 isEqualToString:&stru_1F0EC0C28])
    {
      if (length == 1)
      {
        long long v16 = [(CNComposeRecipientTextView *)self _atomViewAtCharacterIndex:location];
        if (v16)
        {
          id v17 = v16;
          if (([v16 isSelected] & 1) != 0 || objc_msgSend(v9, "_textInputSource") == 3)
          {
            recipientsBeingRemoved = self->_recipientsBeingRemoved;
            double v19 = [v17 recipient];
            [(NSMutableArray *)recipientsBeingRemoved addObject:v19];

            BOOL v20 = 1;
          }
          else
          {
            [(CNComposeRecipientTextView *)self selectComposeRecipientAtom:v17];
            BOOL v20 = 0;
          }

          goto LABEL_22;
        }
      }
      else
      {
        textView = self->_textView;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __79__CNComposeRecipientTextView_textView_shouldChangeTextInRange_replacementText___block_invoke;
        v24[3] = &unk_1E6128F48;
        v24[4] = self;
        -[_CNAtomTextView enumerateAtomsInCharacterRange:withBlock:](textView, "enumerateAtomsInCharacterRange:withBlock:", location, length, v24);
      }
    }
    BOOL v20 = 1;
    goto LABEL_22;
  }
  double v21 = [(CNComposeHeaderView *)self delegate];
  if (![(CNComposeRecipientTextView *)self finishEnteringRecipient])
  {
    if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v21 composeRecipientViewTabPressed:self];
    }
    else if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v21 composeRecipientViewReturnPressed:self];
    }
  }

  BOOL v20 = 0;
LABEL_22:

  return v20;
}

uint64_t __79__CNComposeRecipientTextView_textView_shouldChangeTextInRange_replacementText___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 recipient];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 680) addObject:v3];
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)textViewDidChangeSelection:(id)a3
{
  uint64_t v4 = [a3 selectedRange];
  uint64_t v6 = v5;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(_CNAtomTextView *)self->_textView textStorage];
  uint64_t v9 = [v8 length];

  id v10 = [(_CNAtomTextView *)self->_textView layoutManager];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __57__CNComposeRecipientTextView_textViewDidChangeSelection___block_invoke;
  long long v16 = &unk_1E6129120;
  id v17 = self;
  uint64_t v19 = v4;
  uint64_t v20 = v6;
  id v11 = v7;
  id v18 = v11;
  objc_msgSend(v10, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v9, &v13);

  int v12 = [(CNComposeHeaderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v12 composeRecipientView:self didSelectRecipients:v11];
  }
}

void __57__CNComposeRecipientTextView_textViewDidChangeSelection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  id v8 = [*(id *)(*(void *)(a1 + 32) + 544) layoutManager];
  uint64_t v9 = objc_msgSend(v8, "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  uint64_t v11 = v10;

  int v12 = *(void **)(*(void *)(a1 + 32) + 544);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__CNComposeRecipientTextView_textViewDidChangeSelection___block_invoke_2;
  v13[3] = &unk_1E61290F8;
  uint64_t v16 = v9;
  uint64_t v17 = v11;
  int v15 = v19;
  long long v18 = *(_OWORD *)(a1 + 48);
  id v14 = *(id *)(a1 + 40);
  objc_msgSend(v12, "enumerateAtomsInCharacterRange:withBlock:", v9, v11, v13);

  _Block_object_dispose(v19, 8);
}

uint64_t __57__CNComposeRecipientTextView_textViewDidChangeSelection___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(*(void *)(a1[5] + 8) + 24) + a1[6];
  unint64_t v5 = a1[8];
  unint64_t v6 = a1[9];
  BOOL v7 = v4 < v5 || v4 - v5 >= v6;
  uint64_t v17 = v3;
  if (v7)
  {
    uint64_t v8 = [v3 isSelected];
    uint64_t v9 = v17;
    if (!v8) {
      goto LABEL_18;
    }
    uint64_t v8 = [v17 setSelected:0 animated:0];
  }
  else
  {
    BOOL v11 = v4 == v5 + v6 - 1;
    uint64_t v10 = 3;
    if (v11)
    {
      BOOL v11 = v4 == v5;
    }
    else
    {
      uint64_t v10 = 1;
      BOOL v11 = 0;
    }
    uint64_t v12 = 2;
    if (v11) {
      uint64_t v12 = 4;
    }
    if (v4 == v5) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = v10;
    }
    [v3 setSelected:1 animated:0 style:v13];
    id v14 = (void *)a1[4];
    int v15 = [v17 recipient];
    [v14 addObject:v15];
  }
  uint64_t v9 = v17;
LABEL_18:
  ++*(void *)(*(void *)(a1[5] + 8) + 24);

  return MEMORY[0x1F41817F8](v8, v9);
}

- (void)textViewDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_recipientsBeingRemoved count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    unint64_t v4 = self->_recipientsBeingRemoved;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          -[CNComposeRecipientTextView _didRemoveRecipient:](self, "_didRemoveRecipient:", *(void *)(*((void *)&v11 + 1) + 8 * v8++), (void)v11);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [(NSMutableArray *)self->_recipientsBeingRemoved removeAllObjects];
  }
  uint64_t v9 = [(CNComposeHeaderView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [(CNComposeRecipientTextView *)self text];
    [v9 composeRecipientView:self textDidChange:v10];
  }
}

- (void)atomTextViewDidBecomeFirstResponder:(id)a3
{
  self->_didIgnoreFirstResponderResign = 0;
  self->_addButtonWasTapped = 0;
  id v5 = [(CNComposeHeaderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 recipientViewDidBecomeFirstResponder:self];
  }
  if (objc_opt_respondsToSelector()) {
    [v5 composeRecipientViewDidBecomeFirstResponder:self];
  }
  if (![(CNComposeRecipientTextView *)self _canAddAdditionalAtoms])
  {
    unint64_t v4 = [(NSMutableArray *)self->_atomViews lastObject];
    [v4 setSelected:1 animated:1];
  }
  if ([(CNComposeRecipientTextView *)self usingActiveAppearance]) {
    [(CNComposeRecipientTextView *)self setExpanded:1];
  }
}

- (BOOL)hostRecipientViewHasSearchResults
{
  id v3 = [(CNComposeHeaderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 composeRecipientViewShowingSearchResults:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)atomTextViewDidResignFirstResponder:(id)a3
{
  if ([(CNComposeRecipientTextView *)self keyboardIsHiding]
    && [(CNComposeRecipientTextView *)self hostRecipientViewHasSearchResults])
  {
    self->_didIgnoreFirstResponderResign = 1;
  }
  else
  {
    id v4 = [(CNComposeHeaderView *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v4 recipientViewShouldIgnoreFirstResponderChanges:self])
    {
      self->_didIgnoreFirstResponderResign = 1;
    }
    else
    {
      [(CNComposeRecipientTextView *)self finishEnteringRecipient];
      if (objc_opt_respondsToSelector()) {
        [v4 recipientViewDidResignFirstResponder:self];
      }
      [(CNComposeRecipientTextView *)self _resetSelectionState];
      [(CNComposeRecipientTextView *)self setExpanded:0];
    }
  }
}

- (void)atomTextView:(id)a3 didChangeWritingDirection:(int64_t)a4
{
  textView = self->_textView;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__CNComposeRecipientTextView_atomTextView_didChangeWritingDirection___block_invoke;
  _OWORD v6[3] = &__block_descriptor_33_e32_v16__0__CNComposeRecipientAtom_8l;
  BOOL v7 = a4 == 1;
  [(_CNAtomTextView *)textView enumerateAtoms:v6];
  [(CNComposeRecipientTextView *)self reflow];
}

uint64_t __69__CNComposeRecipientTextView_atomTextView_didChangeWritingDirection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSeparatorIsLeftAligned:*(unsigned __int8 *)(a1 + 32)];
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithArray:self->_atomViews];
    int64_t v11 = [(_CNAtomTextView *)self->_textView baseWritingDirection];
    long long v12 = [v8 textStorage];
    uint64_t v13 = [v12 length];

    long long v14 = [v8 textStorage];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __84__CNComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke;
    v35[3] = &unk_1E6129190;
    v35[4] = self;
    int64_t v39 = v11;
    id v15 = v8;
    id v36 = v15;
    id v16 = v9;
    id v37 = v16;
    id v17 = v10;
    id v38 = v17;
    objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v35);

    int64_t atomViewAnimationDepth = self->_atomViewAnimationDepth;
    if (atomViewAnimationDepth <= 1) {
      int64_t atomViewAnimationDepth = 1;
    }
    self->_int64_t atomViewAnimationDepth = atomViewAnimationDepth - 1;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          -[CNComposeRecipientTextView _removeAddressAtomSubview:](self, "_removeAddressAtomSubview:", *(void *)(*((void *)&v31 + 1) + 8 * v23++), (void)v31);
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v21);
    }

    if ([(CNComposeRecipientTextView *)self usingActiveAppearance])
    {
      [(_CNAtomTextView *)self->_textView textContainerInset];
      [v15 usedRectForTextContainer:v16];
      UICeilToViewScale();
      *(float *)&double v24 = v24;
      double v25 = roundf(*(float *)&v24);
      [(_CNAtomTextView *)self->_textView bounds];
      double v27 = v26;
      [(_CNAtomTextView *)self->_textView bounds];
      if (v27 != v29 || v28 != v25)
      {
        CGFloat v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        self->_currentTextRect.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
        self->_currentTextRect.origin.CGFloat y = v30;
        self->_currentTextRect.size.double width = v27;
        self->_currentTextRect.size.double height = v25;
        [(_CNAtomTextView *)self->_textView setFrame:(void)v31];
        [(CNComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
        [(CNComposeRecipientTextView *)self _notifyDelegateOfSizeChange];
      }
    }
  }
}

void __84__CNComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  BOOL v7 = [a2 objectForKey:*MEMORY[0x1E4FB06B8]];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 atomView];
      if (([v7 isPlaceholder] & 1) != 0 || !v8) {
        goto LABEL_21;
      }
      id v9 = [v7 recipient];
      uint64_t v10 = [*(id *)(a1 + 32) _valueForAtomLayoutOption:@"CNAtomLayoutOptionShouldBuildIn" withRecipient:v9];
      int v11 = [v10 BOOLValue];

      long long v12 = [*(id *)(a1 + 32) _valueForAtomLayoutOption:@"CNAtomLayoutOptionShouldHide" withRecipient:v9];
      int v13 = [v12 BOOLValue];

      long long v14 = [v8 superview];

      if (!v14)
      {
        [*(id *)(a1 + 32) _addAddressAtomSubview:v8];
        if (v13) {
          [v8 setAlpha:0.0];
        }
        int v11 = 1;
      }
      uint64_t v15 = [*(id *)(a1 + 32) _atomPresentationOptionsForRecipient:v9];
      if ([v8 presentationOptions] != v15) {
        [v8 setPresentationOptions:v15];
      }
      [v8 setSeparatorStyle:2];
      [v8 setSeparatorHidden:0];
      [v8 setSeparatorIsLeftAligned:*(void *)(a1 + 64) == 1];
      objc_msgSend(*(id *)(a1 + 40), "boundingRectForGlyphRange:inTextContainer:", a3, a4, *(void *)(a1 + 48));
      uint64_t v17 = v16;
      uint64_t v19 = v18;
      double v21 = v20;
      [v8 intrinsicContentSize];
      double v23 = v22;
      [v8 frame];
      if (v21 != v25 || v23 != v24)
      {
        objc_msgSend(v8, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v21, v23);
        [v8 layoutSubviews];
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __84__CNComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke_2;
      v31[3] = &unk_1E6129168;
      v31[4] = *(void *)(a1 + 32);
      uint64_t v34 = v17;
      uint64_t v35 = v19;
      double v36 = v21;
      double v37 = v23;
      id v26 = v8;
      id v32 = v26;
      id v27 = *(id *)(a1 + 40);
      uint64_t v28 = *(void *)(a1 + 64);
      id v33 = v27;
      uint64_t v38 = v28;
      char v39 = v13;
      double v29 = (void (**)(void))MEMORY[0x1BA9A6470](v31);
      if (([*(id *)(a1 + 32) _shouldAnimateAtomViewChanges] ^ 1 | v11))
      {
        v29[2](v29);
        if (!v11) {
          goto LABEL_20;
        }
      }
      else
      {
        [MEMORY[0x1E4F42FF0] animateWithDuration:v29 animations:0.25];
        if (!v11)
        {
LABEL_20:
          [*(id *)(a1 + 56) removeObject:v26];

LABEL_21:
          goto LABEL_22;
        }
      }
      if ([*(id *)(a1 + 32) _shouldAnimateAtomViewChanges])
      {
        CGFloat v30 = [*(id *)(*(void *)(a1 + 32) + 544) textColor];
        [v26 performBuildInAnimationFromTextColor:v30 withDuration:0.25];
      }
      goto LABEL_20;
    }
  }
LABEL_22:
}

uint64_t __84__CNComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 544), "convertGlyphRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  CGFloat v3 = v2;
  double v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  uint64_t v10 = [*(id *)(a1 + 40) titleLabel];
  [v10 frame];
  double v12 = v11;

  double v13 = *(double *)(a1 + 64);
  [*(id *)(a1 + 48) lineFragmentUsedRectForGlyphAtIndex:0 effectiveRange:0];
  if (v13 >= v14)
  {
    double v19 = v5 - v12;
  }
  else
  {
    uint64_t v15 = [*(id *)(a1 + 32) labelView];
    [v15 frame];
    CGRectGetMaxY(v26);
    uint64_t v16 = [*(id *)(a1 + 32) labelView];
    [v16 _baselineOffsetFromBottom];

    v27.origin.CGFloat x = v3;
    v27.origin.CGFloat y = v5;
    v27.size.double width = v7;
    v27.size.double height = v9;
    CGRectGetHeight(v27);
    uint64_t v17 = [*(id *)(a1 + 40) titleLabel];
    [v17 _baselineOffsetFromBottom];

    [*(id *)(a1 + 40) edgeInsets];
    double v19 = -v18;
    if (*(void *)(a1 + 88) == 1) {
      double v19 = v18;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "presentationOptions", v19);
  double v20 = *(void **)(a1 + 40);
  double v21 = [MEMORY[0x1E4F42D90] mainScreen];
  [v21 scale];
  UIRectIntegralWithScale();
  objc_msgSend(v20, "setFrame:");

  double v22 = 0.0;
  if (!*(unsigned char *)(a1 + 96)) {
    double v22 = 1.0;
  }
  double v23 = *(void **)(a1 + 40);

  return [v23 setAlpha:v22];
}

- (BOOL)_delegateRespondsToSizeChange
{
  double v2 = [(CNComposeHeaderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }

  return v3 & 1;
}

- (void)_notifyDelegateOfNewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(CNComposeHeaderView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v6, "composeHeaderView:didChangeSize:", self, width, height);
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v6, "composeRecipientView:didChangeSize:", self, width, height);
  }
}

- (void)_notifyDelegateOfSizeChange
{
  if (self->_notifyDelegateOfSizeChange)
  {
    self->_notifyDelegateOfSizeChange = 0;
    char v3 = [MEMORY[0x1E4F28F08] mainQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__CNComposeRecipientTextView__notifyDelegateOfSizeChange__block_invoke;
    v4[3] = &unk_1E6128548;
    v4[4] = self;
    [v3 addOperationWithBlock:v4];
  }
}

uint64_t __57__CNComposeRecipientTextView__notifyDelegateOfSizeChange__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 544) frame];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 32) _additionalContentHeight];
  double v7 = v6;
  uint64_t result = [*(id *)(a1 + 32) _delegateRespondsToSizeChange];
  if (result) {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfNewSize:", v3, v5 + v7);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 661) = 1;
  return result;
}

- (void)selectAtomForRecipient:(id)a3
{
  id v4 = [(CNComposeRecipientTextView *)self atomViewForRecipient:a3];
  [(CNComposeRecipientTextView *)self selectAtom:v4];
}

- (void)selectAtom:(id)a3
{
  uint64_t v5 = [(CNComposeRecipientTextView *)self _rangeForComposeRecipientAtom:a3];
  textView = self->_textView;

  -[_CNAtomTextView setSelectedRange:](textView, "setSelectedRange:", v5, v4);
}

- (void)shiftSelectAtom:(id)a3
{
  NSUInteger v4 = [(CNComposeRecipientTextView *)self _rangeForComposeRecipientAtom:a3];
  NSUInteger v6 = v5;
  v10.NSUInteger location = [(_CNAtomTextView *)self->_textView selectedRange];
  textView = self->_textView;
  v11.NSUInteger location = v4;
  v11.NSUInteger length = v6;
  NSRange v8 = NSUnionRange(v10, v11);

  -[_CNAtomTextView setSelectedRange:](textView, "setSelectedRange:", v8.location, v8.length);
}

- (void)selectAllAtoms
{
  textView = self->_textView;
  id v3 = [(_CNAtomTextView *)textView textStorage];
  -[_CNAtomTextView setSelectedRange:](textView, "setSelectedRange:", 0, [v3 length]);
}

- (void)deselectAllAtoms
{
  textView = self->_textView;
  id v3 = [(_CNAtomTextView *)textView textStorage];
  -[_CNAtomTextView setSelectedRange:](textView, "setSelectedRange:", [v3 length], 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CNComposeRecipientTextView;
  BOOL v6 = [(CNComposeRecipientTextView *)&v10 canPerformAction:a3 withSender:a4];
  if (sel_selectAll_ != a3) {
    return v6;
  }
  NSRange v8 = [(_CNAtomTextView *)self->_textView text];
  BOOL v7 = [v8 length] != 0;

  return v7;
}

- (id)_placeholderAttachmentWithStaticWidth
{
  uint64_t v2 = MEMORY[0x1E4F1DB28];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  NSUInteger v5 = [[CNComposeRecipient alloc] initWithContact:0 address:@"email@me.com" kind:0];
  BOOL v6 = -[CNComposeRecipientAtom initWithFrame:recipient:]([CNComposeRecipientAtom alloc], "initWithFrame:recipient:", v5, v3, v4, *(double *)(v2 + 16), *(double *)(v2 + 24));
  [(CNAtomView *)v6 intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;
  NSRange v11 = [[_CNAtomTextAttachment alloc] initWithAtomView:0];
  -[_CNAtomTextAttachment setBounds:](v11, "setBounds:", v3, v4, v8, v10);
  [(_CNAtomTextAttachment *)v11 setIsPlaceholder:1];

  return v11;
}

- (_NSRange)_placeholderAttachmentRange
{
  uint64_t v10 = 0;
  NSRange v11 = &v10;
  uint64_t v12 = 0x3010000000;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  double v13 = &unk_1B5B44B83;
  double v3 = [(CNComposeRecipientTextView *)self placeholderAttachment];

  if (v3)
  {
    textView = self->_textView;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__CNComposeRecipientTextView__placeholderAttachmentRange__block_invoke;
    v9[3] = &unk_1E6128F98;
    v9[4] = self;
    void v9[5] = &v10;
    [(_CNAtomTextView *)textView enumerateAtomAttachments:v9];
  }
  NSUInteger v5 = v11[4];
  NSUInteger v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  NSUInteger v7 = v5;
  NSUInteger v8 = v6;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

void __57__CNComposeRecipientTextView__placeholderAttachmentRange__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  double v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 placeholderAttachment];

  if (v11 == v10)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v12 + 32) = a3;
    *(void *)(v12 + 40) = a4;
    *a5 = 1;
  }
}

- (id)dragPreviewForDraggedItem:(id)a3 withContainer:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  NSUInteger v8 = [(CNComposeRecipientTextView *)self atomViewForRecipient:v7];
  double v9 = [CNComposeRecipientAtom alloc];
  [v8 frame];
  uint64_t v14 = -[CNComposeRecipientAtom initWithFrame:recipient:presentationOptions:](v9, "initWithFrame:recipient:presentationOptions:", v7, [v8 presentationOptions], v10, v11, v12, v13);

  [(CNAtomView *)v14 setSeparatorHidden:1];
  uint64_t v15 = [v8 tintColor];
  [(CNComposeRecipientAtom *)v14 setTintColor:v15];

  [(CNAtomView *)v14 setSelected:1];
  [(CNAtomView *)v14 layoutSubviews];
  [(CNComposeRecipientAtom *)v14 frame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(CNAtomView *)v14 preferredWidth];
  -[CNComposeRecipientAtom setFrame:](v14, "setFrame:", v17, v19, v22, v21);
  double v23 = [v8 superview];
  [(CNComposeRecipientAtom *)v14 center];
  objc_msgSend(v23, "convertPoint:toView:", v6);
  double v25 = v24;
  double v27 = v26;

  id v28 = objc_alloc(MEMORY[0x1E4F429B8]);
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v39[0] = *MEMORY[0x1E4F1DAB8];
  v39[1] = v29;
  v39[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGFloat v30 = objc_msgSend(v28, "initWithContainer:center:transform:", v6, v39, v25, v27);

  id v31 = objc_alloc(MEMORY[0x1E4F429B0]);
  id v32 = (void *)MEMORY[0x1E4F29238];
  [(CNComposeRecipientAtom *)v14 bounds];
  CGRect v43 = CGRectInset(v42, 8.0, 8.0);
  id v33 = objc_msgSend(v32, "valueWithCGRect:", v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
  v40[0] = v33;
  uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  uint64_t v35 = (void *)[v31 initWithTextLineRects:v34];

  double v36 = [(CNAtomView *)v14 effectiveTintColor];
  [v35 setBackgroundColor:v36];

  double v37 = (void *)[objc_alloc(MEMORY[0x1E4F42ED0]) initWithView:v14 parameters:v35 target:v30];

  return v37;
}

- (void)dragEnteredAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CNComposeRecipientTextView *)self placeholderAttachment];

  if (!v6)
  {
    id v7 = [(CNComposeRecipientTextView *)self _placeholderAttachmentWithStaticWidth];
    [(CNComposeRecipientTextView *)self setPlaceholderAttachment:v7];

    double v14 = 0.0;
    NSUInteger v8 = [(_CNAtomTextView *)self->_textView layoutManager];
    double v9 = [(_CNAtomTextView *)self->_textView textContainer];
    uint64_t v10 = objc_msgSend(v8, "glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:", v9, &v14, x, y);

    [(CNComposeRecipientTextView *)self _beginAtomViewAnimations];
    if (v14 + -1.0 >= 0.0) {
      double v11 = v14 + -1.0;
    }
    else {
      double v11 = -(v14 + -1.0);
    }
    double v12 = [(CNComposeRecipientTextView *)self placeholderAttachment];
    if (v11 >= 0.00000011920929)
    {
      [(CNComposeRecipientTextView *)self _insertAtomAttachment:v12 atCharacterIndex:v10];
    }
    else
    {
      double v13 = [(_CNAtomTextView *)self->_textView textStorage];
      -[CNComposeRecipientTextView _insertAtomAttachment:atCharacterIndex:](self, "_insertAtomAttachment:atCharacterIndex:", v12, [v13 length]);
    }
  }
  [(CNComposeRecipientTextView *)self _recomputeTextContainerExclusionPaths];
}

- (void)dragMovedToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CNComposeRecipientTextView *)self placeholderAttachment];

  if (v6)
  {
    uint64_t v7 = [(CNComposeRecipientTextView *)self _placeholderAttachmentRange];
    uint64_t v9 = v8;
    double v33 = 0.0;
    uint64_t v10 = [(_CNAtomTextView *)self->_textView layoutManager];
    double v11 = [(_CNAtomTextView *)self->_textView textContainer];
    uint64_t v12 = objc_msgSend(v10, "glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:", v11, &v33, x, y);

    if (v12 != v7 && v12 - v7 == 1)
    {
      double v13 = v33;
      if (v33 <= 0.4 || v33 >= 0.9) {
        goto LABEL_11;
      }
    }
    else if (v12 == v7)
    {
LABEL_11:
      double v22 = [(CNComposeRecipientTextView *)self recipients];
      uint64_t v23 = [v22 count];

      if (!v23) {
        [(_CNAtomTextView *)self->_textView becomeFirstResponder];
      }
      return;
    }
    uint64_t v15 = [(_CNAtomTextView *)self->_textView textStorage];
    double v16 = [(CNComposeRecipientTextView *)self placeholderAttachment];
    double v17 = [(CNComposeRecipientTextView *)self _baseAttributes];
    double v18 = [v16 attributedStringWithBaseAttributes:v17];

    [(CNComposeRecipientTextView *)self _beginAtomViewAnimations];
    textView = self->_textView;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    double v26 = __47__CNComposeRecipientTextView_dragMovedToPoint___block_invoke;
    double v27 = &unk_1E61291B8;
    uint64_t v30 = v7;
    uint64_t v31 = v9;
    id v28 = v15;
    id v29 = v18;
    uint64_t v32 = v12;
    id v20 = v18;
    id v21 = v15;
    [(_CNAtomTextView *)textView batchTextStorageUpdates:&v24];

    goto LABEL_11;
  }
}

uint64_t __47__CNComposeRecipientTextView_dragMovedToPoint___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);

  return [v2 insertAttributedString:v3 atIndex:v4];
}

- (void)dragExited
{
  [(CNComposeRecipientTextView *)self _beginAtomViewAnimations];
  uint64_t v3 = [(_CNAtomTextView *)self->_textView textStorage];
  uint64_t v4 = [(CNComposeRecipientTextView *)self _placeholderAttachmentRange];
  objc_msgSend(v3, "deleteCharactersInRange:", v4, v5);

  [(CNComposeRecipientTextView *)self setPlaceholderAttachment:0];
  textView = self->_textView;

  [(_CNAtomTextView *)textView resignFirstResponder];
}

- (void)dropItems:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke;
  v28[3] = &unk_1E6128F70;
  v28[4] = self;
  [v4 enumerateObjectsUsingBlock:v28];
  uint64_t v5 = [(CNComposeRecipientTextView *)self _placeholderAttachmentRange];
  uint64_t v7 = v6;
  [(CNComposeRecipientTextView *)self _beginAtomViewAnimations];
  uint64_t v16 = 544;
  textView = self->_textView;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke_4;
  v23[3] = &unk_1E6129230;
  id v9 = v4;
  id v24 = v9;
  uint64_t v25 = self;
  uint64_t v26 = v5;
  uint64_t v27 = v7;
  [(_CNAtomTextView *)textView batchTextStorageUpdates:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        [(CNComposeRecipientTextView *)self _beginAtomViewAnimations];
        [(CNComposeRecipientTextView *)self _setValue:MEMORY[0x1E4F1CC28] forAtomLayoutOption:@"CNAtomLayoutOptionShouldHide" withRecipient:v14];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke_6;
        v18[3] = &unk_1E61283C0;
        v18[4] = self;
        v18[5] = v14;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v18 animations:0.35];
        uint64_t v15 = [(CNComposeHeaderView *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v15 composeRecipientView:self didAddRecipient:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v11);
  }

  [*(id *)((char *)&self->super.super.super.super.isa + v16) resignFirstResponder];
  [(CNComposeRecipientTextView *)self setPlaceholderAttachment:0];
}

void __40__CNComposeRecipientTextView_dropItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 544) atoms];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke_2;
  v11[3] = &unk_1E6128FE8;
  id v5 = v3;
  id v12 = v5;
  uint64_t v6 = [v4 indexesOfObjectsPassingTest:v11];

  if ([v6 count])
  {
    uint64_t v7 = [*(id *)(a1 + 32) recipients];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke_3;
    v9[3] = &unk_1E61291E0;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    id v8 = v7;
    [v6 enumerateIndexesUsingBlock:v9];
  }
}

uint64_t __40__CNComposeRecipientTextView_dropItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 recipient];
  id v4 = [v3 uncommentedAddress];
  id v5 = [*(id *)(a1 + 32) uncommentedAddress];
  uint64_t v6 = objc_msgSend(v4, "ea_isEqualToEmailAddress:", v5);

  return v6;
}

void __40__CNComposeRecipientTextView_dropItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  [v2 removeRecipient:v3];
}

uint64_t __40__CNComposeRecipientTextView_dropItems___block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__CNComposeRecipientTextView_dropItems___block_invoke_5;
  v3[3] = &unk_1E6129208;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __40__CNComposeRecipientTextView_dropItems___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 _setValue:MEMORY[0x1E4F1CC38] forAtomLayoutOption:@"CNAtomLayoutOptionShouldHide" withRecipient:v6];
  id v9 = [*(id *)(a1 + 32) _atomAttachmentForRecipient:v6];

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  if (a3) {
    [v7 _insertAtomAttachment:v9 atCharacterIndex:v8 + a3];
  }
  else {
    objc_msgSend(v7, "_insertAtomAttachment:andReplaceCharactersInRange:", v9, v8, *(void *)(a1 + 48));
  }
}

void __40__CNComposeRecipientTextView_dropItems___block_invoke_6(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) atomViewForRecipient:*(void *)(a1 + 40)];
  [v1 setAlpha:1.0];
}

- (void)composeRecipientAtomDisambiguate:(id)a3
{
  id v7 = a3;
  long long v4 = [(CNComposeHeaderView *)self delegate];
  id v5 = [(CNComposeRecipientTextView *)self selectedAtoms];
  if ([v5 count] == 1)
  {
    char v6 = objc_opt_respondsToSelector();

    if (v6) {
      [v4 composeRecipientView:self disambiguateRecipientForAtom:v7];
    }
  }
  else
  {
  }
}

- (void)composeRecipientAtomStopDisambiguating
{
  id v3 = [(CNComposeHeaderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 stopDisambiguatingForComposeRecipientView:self];
  }
}

- (void)composeRecipientAtomShowPersonCard:(id)a3
{
  id v5 = a3;
  long long v4 = [(CNComposeHeaderView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 composeRecipientView:self showPersonCardForAtom:v5];
  }
}

- (BOOL)indicatesUnsafeRecipientsWhenCollapsed
{
  return self->_indicatesUnsafeRecipientsWhenCollapsed;
}

- (void)setIndicatesUnsafeRecipientsWhenCollapsed:(BOOL)a3
{
  self->_indicatesUnsafeRecipientsWhenCollapsed = a3;
}

- (BOOL)usingActiveAppearance
{
  return self->_usingActiveAppearance;
}

- (BOOL)isSeparatorHidden
{
  return self->_separatorHidden;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (BOOL)didIgnoreFirstResponderResign
{
  return self->_didIgnoreFirstResponderResign;
}

- (int64_t)maxRecipients
{
  return self->_maxRecipients;
}

- (void)setMaxRecipients:(int64_t)a3
{
  self->_maxRecipients = a3;
}

- (UIButton)addButton
{
  return self->_addButton;
}

- (BOOL)showsAddButtonWhenExpanded
{
  return self->_showsAddButtonWhenExpanded;
}

- (BOOL)expandRecipientsInNamedGroups
{
  return self->_expandRecipientsInNamedGroups;
}

- (void)setExpandRecipientsInNamedGroups:(BOOL)a3
{
  self->_expandRecipientsInNamedGroups = a3;
}

- (BOOL)shouldAlwaysShowAddContactsButton
{
  return self->_shouldAlwaysShowAddContactsButton;
}

- (void)setShouldAlwaysShowAddContactsButton:(BOOL)a3
{
  self->_shouldAlwaysShowAddContactsButton = a3;
}

- (UIColor)typingTextColor
{
  return self->_typingTextColor;
}

- (void)setTypingTextColor:(id)a3
{
}

- (double)trailingButtonMidlineInsetFromLayoutMargin
{
  return self->_trailingButtonMidlineInsetFromLayoutMargin;
}

- (int)hideLastAtomComma
{
  return self->_hideLastAtomComma;
}

- (void)setHideLastAtomComma:(int)a3
{
  self->_hideLastAtomComma = a3;
}

- (BOOL)editable
{
  return self->_editable;
}

- (_CNAtomTextAttachment)placeholderAttachment
{
  return self->_placeholderAttachment;
}

- (void)setPlaceholderAttachment:(id)a3
{
}

- (UIView)atomContainerView
{
  return self->_atomContainerView;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)keyboardIsHiding
{
  return self->_keyboardIsHiding;
}

- (void)setKeyboardIsHiding:(BOOL)a3
{
  self->_keyboardIsHiding = a3;
}

- (NSObject)keyboardWillHideNotificationObserver
{
  return self->_keyboardWillHideNotificationObserver;
}

- (void)setKeyboardWillHideNotificationObserver:(id)a3
{
}

- (NSObject)keyboardDidHideNotificationObserver
{
  return self->_keyboardDidHideNotificationObserver;
}

- (void)setKeyboardDidHideNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardDidHideNotificationObserver, 0);
  objc_storeStrong((id *)&self->_keyboardWillHideNotificationObserver, 0);
  objc_storeStrong((id *)&self->_atomContainerView, 0);
  objc_storeStrong((id *)&self->_placeholderAttachment, 0);
  objc_storeStrong((id *)&self->_typingTextColor, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_recipientsBeingRemoved, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_collapsableUpdateTimer, 0);
  objc_storeStrong((id *)&self->_dropTarget, 0);
  objc_storeStrong((id *)&self->_dragSource, 0);
  objc_storeStrong((id *)&self->_atomLayoutOptionsByRecipient, 0);
  objc_storeStrong((id *)&self->_atomPresentationOptionsByRecipient, 0);
  objc_storeStrong((id *)&self->_atomViews, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_inactiveTextColor, 0);
  objc_storeStrong((id *)&self->_inactiveTextView, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end