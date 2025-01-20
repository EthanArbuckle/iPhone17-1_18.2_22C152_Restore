@interface MFComposeRecipientTextView
+ (id)defaultFont;
- (BOOL)_canAddAdditionalAtoms;
- (BOOL)_delegateRespondsToSizeChange;
- (BOOL)_hasUnsafeRecipients;
- (BOOL)_isAddButtonVisible;
- (BOOL)_isTextViewCollapsed;
- (BOOL)_shouldAnimateAtomViewChanges;
- (BOOL)_shouldEmbedLabelInTextView;
- (BOOL)_textViewContainsAtomizedRecipients;
- (BOOL)_useRightToLeftLayout;
- (BOOL)becomeFirstResponder;
- (BOOL)containsAddress:(id)a3;
- (BOOL)didIgnoreFirstResponderResign;
- (BOOL)editable;
- (BOOL)expanded;
- (BOOL)finishEnteringRecipient;
- (BOOL)hasContent;
- (BOOL)indicatesUnsafeRecipientsWhenCollapsed;
- (BOOL)isFirstResponder;
- (BOOL)isSeparatorHidden;
- (BOOL)showsAddButtonWhenExpanded;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MFComposeRecipientTextView)initWithFrame:(CGRect)a3;
- (MFComposeRecipientTextView)initWithFrame:(CGRect)a3 dragDropDelegate:(id)a4;
- (MFComposeRecipientTextViewDelegate)delegate;
- (NSArray)addresses;
- (NSArray)recipients;
- (NSArray)uncommentedAddresses;
- (NSString)text;
- (UIButton)addButton;
- (UIColor)inactiveTextColor;
- (UIColor)typingTextColor;
- (UIFont)baseFont;
- (UITextView)textView;
- (UIView)atomContainerView;
- (_MFAtomTextAttachment)placeholderAttachment;
- (_NSRange)_placeholderAttachmentRange;
- (_NSRange)_rangeForComposeRecipientAtom:(id)a3;
- (double)offsetForRowWithTextField;
- (double)textFieldOffsetForNumberOfRowsToScroll:(unint64_t)a3 numberOfRowsAboveField:(int64_t)a4;
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
- (id)dragPreviewForDraggedItem:(id)a3 withContainer:(id)a4;
- (id)selectedAtoms;
- (id)undoManager;
- (int64_t)hideLastAtomComma;
- (int64_t)maxRecipients;
- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3;
- (unint64_t)indexOfRecipientForInsertionAtPoint:(CGPoint)a3;
- (unint64_t)numberOfRowsOfTextInField;
- (void)_addAddressAtomSubview:(id)a3;
- (void)_addButtonTapped:(id)a3;
- (void)_addRecord:(void *)a3 identifier:(int)a4;
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
- (void)_recipientsWereAdded:(id)a3;
- (void)_recomputeTextContainerExclusionPaths;
- (void)_removeAddressAtomSubview:(id)a3;
- (void)_removeAllRecipients;
- (void)_resetSelectionState;
- (void)_setAddButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setTextViewIsCollapsed:(BOOL)a3 animated:(BOOL)a4;
- (void)_setValue:(id)a3 forAtomLayoutOption:(id)a4 withRecipient:(id)a5;
- (void)_tapGestureRecognized:(id)a3;
- (void)_updateAddButtonVisibility;
- (void)_updateInactiveTextView;
- (void)addAddress:(id)a3;
- (void)addRecipient:(id)a3;
- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5;
- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5 notify:(BOOL)a6;
- (void)addRecipient:(id)a3 notify:(BOOL)a4;
- (void)addRecord:(void *)a3 property:(int)a4 identifier:(int)a5;
- (void)atomTextView:(id)a3 didChangeWritingDirection:(int64_t)a4;
- (void)atomTextViewDidBecomeFirstResponder:(id)a3;
- (void)atomTextViewDidResignFirstResponder:(id)a3;
- (void)clearText;
- (void)composeRecipientAtomShowPersonCard:(id)a3;
- (void)dealloc;
- (void)deselectComposeRecipientAtom:(id)a3;
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
- (void)selectComposeRecipientAtom:(id)a3;
- (void)setAddresses:(id)a3;
- (void)setBaseFont:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEditable:(BOOL)a3 animated:(BOOL)a4;
- (void)setExpanded:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHideLastAtomComma:(int64_t)a3;
- (void)setInactiveTextColor:(id)a3;
- (void)setIndicatesUnsafeRecipientsWhenCollapsed:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMaxRecipients:(int64_t)a3;
- (void)setPlaceholderAttachment:(id)a3;
- (void)setProperties:(id)a3;
- (void)setProperty:(int)a3;
- (void)setRecipients:(id)a3;
- (void)setSeparatorHidden:(BOOL)a3;
- (void)setShowsAddButtonWhenExpanded:(BOOL)a3;
- (void)setTypingTextColor:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
@end

@implementation MFComposeRecipientTextView

+ (id)defaultFont
{
  v2 = +[MFFontMetricCache sharedFontMetricCache];
  v3 = [v2 cachedFont:&__block_literal_global_11 forKey:@"MFComposeRecipientTextViewDefaultFont"];

  return v3;
}

id __41__MFComposeRecipientTextView_defaultFont__block_invoke()
{
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x8000 options:0];
  v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

- (void)dealloc
{
  [(_MFAtomTextView *)self->_textView setHostRecipientView:0];
  [(_MFAtomTextView *)self->_textView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MFComposeRecipientTextView;
  [(MFComposeRecipientTextView *)&v3 dealloc];
}

- (MFComposeRecipientTextView)initWithFrame:(CGRect)a3 dragDropDelegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = -[MFComposeRecipientTextView initWithFrame:](self, "initWithFrame:", x, y, width, height);
  if (v10)
  {
    v11 = [[MFDragSource alloc] initWithView:v10 delegate:v9];
    dragSource = v10->_dragSource;
    v10->_dragSource = v11;

    [(MFDragSource *)v10->_dragSource setAllowsDragOverridingMasterSwitch:1];
    v13 = [[MFDropTarget alloc] initWithView:v10 delegate:v9];
    dropTarget = v10->_dropTarget;
    v10->_dropTarget = v13;

    v15 = (void *)MEMORY[0x1E4F1CA80];
    v16 = +[MFComposeRecipient readableTypeIdentifiersForItemProvider];
    v17 = [v15 setWithArray:v16];

    v18 = [MEMORY[0x1E4F1BC00] readableTypeIdentifiersForItemProvider];
    [v17 addObjectsFromArray:v18];

    v19 = +[MFComposeRecipients readableTypeIdentifiersForItemProvider];
    [v17 addObjectsFromArray:v19];

    [(MFDropTarget *)v10->_dropTarget setAcceptableUTIs:v17];
    [(_MFAtomTextView *)v10->_textView setInteractions:MEMORY[0x1E4F1CBF0]];
  }
  return v10;
}

- (MFComposeRecipientTextView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)MFComposeRecipientTextView;
  objc_super v3 = -[MFComposeHeaderView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFComposeRecipientTextView *)v3 setClipsToBounds:1];
    v5 = [_MFAtomTextView alloc];
    [(MFComposeRecipientTextView *)v4 bounds];
    uint64_t v6 = -[_MFAtomTextView initWithFrame:](v5, "initWithFrame:");
    textView = v4->_textView;
    v4->_textView = (_MFAtomTextView *)v6;

    v8 = [(_MFAtomTextView *)v4->_textView textContainer];
    [v8 setLineFragmentPadding:0.0];

    id v9 = v4->_textView;
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(_MFAtomTextView *)v9 setBackgroundColor:v10];

    [(_MFAtomTextView *)v4->_textView setDelegate:v4];
    v11 = v4->_textView;
    v12 = +[MFModernAtomView defaultFont];
    [(_MFAtomTextView *)v11 setFont:v12];

    [(_MFAtomTextView *)v4->_textView setForceEnableDictation:1];
    [(_MFAtomTextView *)v4->_textView setAutocorrectionType:1];
    [(_MFAtomTextView *)v4->_textView setAutocapitalizationType:0];
    [(_MFAtomTextView *)v4->_textView setKeyboardType:7];
    [(_MFAtomTextView *)v4->_textView setBounces:0];
    [(_MFAtomTextView *)v4->_textView setAutoresizingMask:0];
    [(_MFAtomTextView *)v4->_textView setHostRecipientView:v4];
    v13 = [(_MFAtomTextView *)v4->_textView layoutManager];
    [v13 setDelegate:v4];

    v14 = [(_MFAtomTextView *)v4->_textView layoutManager];
    [v14 setAllowsNonContiguousLayout:1];

    [(_MFAtomTextView *)v4->_textView setScrollsToTop:0];
    [(MFComposeRecipientTextView *)v4 addSubview:v4->_textView];
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    atomViews = v4->_atomViews;
    v4->_atomViews = v15;

    [(MFHeaderLabelView *)v4->super._labelView removeFromSuperview];
    [(_MFAtomTextView *)v4->_textView addSubview:v4->super._labelView];
    [(MFComposeRecipientTextView *)v4 _setAddButtonVisible:0 animated:0];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__tapGestureRecognized_];
    [v17 setCancelsTouchesInView:0];
    [(MFComposeRecipientTextView *)v4 addGestureRecognizer:v17];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v4 action:sel__longPressGestureRecognized_];
    [v18 setCancelsTouchesInView:0];
    [(MFComposeRecipientTextView *)v4 addGestureRecognizer:v18];
    v4->_textViewExclusionPathsAreValid = 1;
    v4->_atomViewAnimationDepth = 0;
    v4->_parentIsClosing = 0;
    v4->_isTextFieldCollapsed = 0;
    v4->_collapsedStateInitialized = 0;
    v4->_indicatesUnsafeRecipientsWhenCollapsed = 0;
    v4->_notifyDelegateOfSizeChange = 1;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    atomPresentationOptionsByRecipient = v4->_atomPresentationOptionsByRecipient;
    v4->_atomPresentationOptionsByRecipient = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    atomLayoutOptionsByRecipient = v4->_atomLayoutOptionsByRecipient;
    v4->_atomLayoutOptionsByRecipient = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recipientsBeingRemoved = v4->_recipientsBeingRemoved;
    v4->_recipientsBeingRemoved = v23;

    v4->_showsAddButtonWhenExpanded = 1;
    [(MFComposeRecipientTextView *)v4 setEditable:1 animated:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)MFComposeRecipientTextView;
  [(MFComposeHeaderView *)&v33 layoutSubviews];
  BOOL v3 = [(MFComposeRecipientTextView *)self _useRightToLeftLayout];
  [(MFComposeHeaderView *)self _contentRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (!MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    [(_MFAtomTextView *)self->_textView bounds];
    if (v12 <= 0.00000011920929) {
      textView = self;
    }
    else {
      textView = self->_textView;
    }
    [textView bounds];
    double v11 = v14;
  }
  -[_MFAtomTextView setFrame:](self->_textView, "setFrame:", v5, v7, v9, v11);
  [(MFComposeHeaderView *)self _recipientViewEdgeInsets];
  -[_MFAtomTextView setTextContainerInset:](self->_textView, "setTextContainerInset:");
  v15 = [(id)objc_opt_class() defaultFont];
  [v15 lineHeight];

  [(MFComposeRecipientTextView *)self bounds];
  UIRoundToViewScale();
  if (self->_addButton)
  {
    p_addButtonFrame = &self->_addButtonFrame;
    CGFloat x = self->_addButtonFrame.origin.x;
    CGFloat y = self->_addButtonFrame.origin.y;
    CGFloat width = self->_addButtonFrame.size.width;
    CGFloat height = self->_addButtonFrame.size.height;
    UIRoundToViewScale();
    self->_addButtonFrame.origin.CGFloat y = v21;
    BOOL v22 = [(MFComposeRecipientTextView *)self _useRightToLeftLayout];
    [(MFComposeHeaderView *)self _contentRect];
    if (v22)
    {
      CGFloat MinX = CGRectGetMinX(*(CGRect *)&v23);
      double v28 = self->_addButtonFrame.size.width;
    }
    else
    {
      CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v23);
      double v28 = self->_addButtonFrame.size.width;
      CGFloat MinX = MaxX - v28;
    }
    p_addButtonFrame->origin.CGFloat x = MinX;
    CGFloat v30 = self->_addButtonFrame.origin.y;
    CGFloat v31 = self->_addButtonFrame.size.height;
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    if (!CGRectEqualToRect(*(CGRect *)&MinX, v34))
    {
      -[UIButton setFrame:](self->_addButton, "setFrame:", p_addButtonFrame->origin.x, self->_addButtonFrame.origin.y, self->_addButtonFrame.size.width, self->_addButtonFrame.size.height);
      [(MFComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
    }
  }
  if (![(MFComposeRecipientTextView *)self editable]) {
    [(MFComposeRecipientTextView *)self _updateInactiveTextView];
  }
  if (v3)
  {
    v32.receiver = self;
    v32.super_class = (Class)MFComposeRecipientTextView;
    [(MFComposeHeaderView *)&v32 layoutSubviews];
  }
}

- (BOOL)_shouldEmbedLabelInTextView
{
  return 1;
}

- (void)refreshPreferredContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientTextView;
  [(MFComposeHeaderView *)&v4 refreshPreferredContentSize];
  textView = self->_textView;
  [(MFComposeHeaderView *)self _recipientViewEdgeInsets];
  -[_MFAtomTextView setTextContainerInset:](textView, "setTextContainerInset:");
  [(MFComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
  [(MFComposeRecipientTextView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[_MFAtomTextView sizeThatFits:](self->_textView, "sizeThatFits:", a3.width, a3.height);
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
  [(MFComposeRecipientTextView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)MFComposeRecipientTextView;
  -[MFComposeHeaderView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  if (!CGRectEqualToRect(v17, v18)) {
    [(MFComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MFComposeRecipientTextView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)MFComposeRecipientTextView;
  -[MFComposeHeaderView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  if (!CGRectEqualToRect(v17, v18)) {
    [(MFComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
  }
}

- (void)_removeAllRecipients
{
  id v6 = [(_MFAtomTextView *)self->_textView textStorage];
  uint64_t v3 = [v6 length];

  if (v3)
  {
    id v7 = [(_MFAtomTextView *)self->_textView textStorage];
    uint64_t v4 = [v7 length];

    id v8 = [(_MFAtomTextView *)self->_textView textStorage];
    objc_msgSend(v8, "deleteCharactersInRange:", 0, v4);

    id v9 = [(_MFAtomTextView *)self->_textView layoutManager];
    double v5 = [(_MFAtomTextView *)self->_textView textContainer];
    [v9 ensureLayoutForTextContainer:v5];
  }
}

- (void)setAddresses:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(MFComposeRecipientTextView *)self recipients];
  id v6 = (void *)[v5 copy];

  [(MFComposeRecipientTextView *)self _removeAllRecipients];
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        CGFloat v13 = objc_msgSend(WeakRetained, "composeRecipientView:composeRecipientForAddress:", self, *(void *)(*((void *)&v18 + 1) + 8 * v12), (void)v18);
        if (([v8 containsObject:v13] & 1) == 0)
        {
          [(MFComposeRecipientTextView *)self addRecipient:v13 notify:0];
          [v8 addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  [(MFComposeRecipientTextView *)self _recipientsWereAdded:v8];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = [v6 count];
    uint64_t v15 = [v8 count];
    if (v14) {
      objc_super v16 = v6;
    }
    else {
      objc_super v16 = 0;
    }
    if (v15) {
      CGRect v17 = v8;
    }
    else {
      CGRect v17 = 0;
    }
    objc_msgSend(WeakRetained, "composeRecipientView:didReplaceRecipients:withRecipients:", self, v16, v17, (void)v18);
  }
  [(MFComposeRecipientTextView *)self _updateInactiveTextView];
  [(MFComposeRecipientTextView *)self reflow];
}

- (NSArray)recipients
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  textView = self->_textView;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MFComposeRecipientTextView_recipients__block_invoke;
  v7[3] = &unk_1E5F79B48;
  id v5 = v3;
  id v8 = v5;
  [(_MFAtomTextView *)textView enumerateAtoms:v7];

  return (NSArray *)v5;
}

void __40__MFComposeRecipientTextView_recipients__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 recipient];

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
  [(MFComposeRecipientTextView *)self _removeAllRecipients];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MFComposeRecipientTextView_setRecipients___block_invoke;
  v5[3] = &unk_1E5F79B70;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  [(MFComposeRecipientTextView *)self _updateInactiveTextView];
}

uint64_t __44__MFComposeRecipientTextView_setRecipients___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addRecipient:a2];
}

- (void)addRecipient:(id)a3
{
}

- (void)addRecipient:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [(MFComposeRecipientTextView *)self recipients];
  -[MFComposeRecipientTextView addRecipient:index:animate:notify:](self, "addRecipient:index:animate:notify:", v7, [v6 count], 0, v4);
}

- (void)_addRecord:(void *)a3 identifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  id v8 = [WeakRetained composeRecipientView:self composeRecipientForRecord:a3 identifier:v4];

  [(MFComposeRecipientTextView *)self addRecipient:v8];
}

- (void)addRecord:(void *)a3 property:(int)a4 identifier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector())
  {
    id v9 = [WeakRetained composeRecipientView:self composeRecipientForRecord:a3 property:v6 identifier:v5];
    [(MFComposeRecipientTextView *)self addRecipient:v9];
  }
  else
  {
    [(MFComposeRecipientTextView *)self _addRecord:a3 identifier:v5];
  }
}

- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5
{
}

- (void)addRecipient:(id)a3 index:(unint64_t)a4 animate:(BOOL)a5 notify:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v7) {
    [(MFComposeRecipientTextView *)self _beginAtomViewAnimations];
  }
  if ([v10 isGroup])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = objc_msgSend(v10, "children", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          [(MFComposeRecipientTextView *)self addRecipient:*(void *)(*((void *)&v21 + 1) + 8 * i) index:a4 animate:v7];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v10)
  {
    uint64_t v15 = [(MFComposeRecipientTextView *)self recipients];
    char v16 = [v15 containsObject:v10];

    if ((v16 & 1) == 0)
    {
      uint64_t v11 = [(MFComposeRecipientTextView *)self _atomAttachmentForRecipient:v10];
      [(MFComposeRecipientTextView *)self _insertAtomAttachment:v11 atCharacterIndex:a4];
      -[_MFAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", a4 + 1, 0);
      CGRect v17 = [(MFComposeRecipientTextView *)self undoManager];
      [v17 registerUndoWithTarget:self selector:sel_removeRecipient_ object:v10];
      if (([v17 isUndoing] & 1) == 0)
      {
        long long v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        long long v19 = [v18 localizedStringForKey:@"ADDRESS_ADDITION" value:&stru_1F0817A00 table:@"Main"];
        [v17 setActionName:v19];
      }
      if (v6)
      {
        id v25 = v10;
        long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        [(MFComposeRecipientTextView *)self _recipientsWereAdded:v20];
      }
      goto LABEL_19;
    }
  }
LABEL_20:
}

- (id)undoManager
{
  undoManager = self->_undoManager;
  if (!undoManager)
  {
    uint64_t v4 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E4F29140]);
    uint64_t v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }

  return undoManager;
}

- (void)_recipientsWereAdded:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained composeRecipientView:self didAddRecipients:v4];
  }
  else if (objc_opt_respondsToSelector())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(WeakRetained, "composeRecipientView:didAddRecipient:", self, *(void *)(*((void *)&v11 + 1) + 8 * v9++), (void)v11);
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", (void)v11);
  [v10 postNotificationName:@"MFComposeRecipientTextViewDidChangeNotification" object:self userInfo:0];
}

- (void)_didRemoveRecipient:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained composeRecipientView:self didRemoveRecipient:v9];
  }
  uint64_t v5 = [(MFComposeRecipientTextView *)self undoManager];
  [v5 registerUndoWithTarget:self selector:sel_addRecipient_ object:v9];
  if (([v5 isUndoing] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"ADDRESS_DELETION" value:&stru_1F0817A00 table:@"Main"];
    [v5 setActionName:v7];
  }
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"MFComposeRecipientTextViewDidChangeNotification" object:self userInfo:0];
}

- (void)removeRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3010000000;
  CGRect v17 = "";
  long long v18 = xmmword_1AFA90620;
  textView = self->_textView;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __46__MFComposeRecipientTextView_removeRecipient___block_invoke;
  long long v11 = &unk_1E5F79B98;
  id v6 = v4;
  id v12 = v6;
  long long v13 = &v14;
  [(_MFAtomTextView *)textView enumerateAtomAttachments:&v8];
  if (v15[4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(_MFAtomTextView *)self->_textView textStorage];
    objc_msgSend(v7, "deleteCharactersInRange:", v15[4], v15[5]);

    [(MFComposeRecipientTextView *)self _didRemoveRecipient:v6];
  }

  _Block_object_dispose(&v14, 8);
}

void __46__MFComposeRecipientTextView_removeRecipient___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v9 = [a2 recipient];
  int v10 = [v9 isEqual:*(void *)(a1 + 32)];

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
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  id v6 = [WeakRetained composeRecipientView:self composeRecipientForAddress:v4];

  if (v6)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    id v7 = [(MFComposeRecipientTextView *)self _userEnteredTextWithRange:&v11];
    textView = self->_textView;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__MFComposeRecipientTextView_addAddress___block_invoke;
    v9[3] = &unk_1E5F79BC0;
    v9[4] = self;
    long long v10 = v11;
    [(_MFAtomTextView *)textView batchTextStorageUpdates:v9];
    [(MFComposeRecipientTextView *)self addRecipient:v6 index:(void)v11 animate:1];
    -[_MFAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", (void)v11 + 1, 0);
  }
}

void __41__MFComposeRecipientTextView_addAddress___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 456) textStorage];
  objc_msgSend(v2, "deleteCharactersInRange:", a1[5], a1[6]);
}

- (BOOL)containsAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_MFAtomTextView *)self->_textView atoms];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__MFComposeRecipientTextView_containsAddress___block_invoke;
  v9[3] = &unk_1E5F79BE8;
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 indexesOfObjectsPassingTest:v9];
  LOBYTE(v4) = [v7 count] != 0;

  return (char)v4;
}

uint64_t __46__MFComposeRecipientTextView_containsAddress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 recipient];
  id v4 = [v3 uncommentedAddress];
  uint64_t v5 = objc_msgSend(v4, "ea_isEqualToEmailAddress:", *(void *)(a1 + 32));

  return v5;
}

- (void)_addButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained composeRecipientViewRequestAddRecipient:self];
  }
}

- (MFComposeRecipientTextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);

  return (MFComposeRecipientTextViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFComposeRecipientTextView;
  [(MFComposeHeaderView *)&v3 setDelegate:a3];
}

- (NSArray)addresses
{
  id v2 = [(MFComposeRecipientTextView *)self recipients];
  objc_super v3 = [v2 arrayByApplyingSelector:sel_commentedAddress];

  return (NSArray *)v3;
}

- (NSArray)uncommentedAddresses
{
  id v2 = [(MFComposeRecipientTextView *)self recipients];
  objc_super v3 = [v2 arrayByApplyingSelector:sel_uncommentedAddress];

  return (NSArray *)v3;
}

- (void)setEditable:(BOOL)a3
{
}

- (void)setEditable:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v14 = a4;
  if (self->_editable != a3)
  {
    BOOL v4 = a4;
    self->_editable = a3;
    collapsableUpdateTimer = self->_collapsableUpdateTimer;
    if (collapsableUpdateTimer)
    {
      [(NSTimer *)collapsableUpdateTimer invalidate];
      id v7 = self->_collapsableUpdateTimer;
      self->_collapsableUpdateTimer = 0;

      *(_DWORD *)&a3 = self->_editable;
    }
    BOOL v13 = !a3;
    if (v4)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CA18];
      uint64_t v9 = [(MFComposeRecipientTextView *)self methodSignatureForSelector:sel__setTextViewIsCollapsed_animated_];
      id v10 = [v8 invocationWithMethodSignature:v9];

      [v10 setTarget:self];
      [v10 setSelector:sel__setTextViewIsCollapsed_animated_];
      [v10 setArgument:&v13 atIndex:2];
      [v10 setArgument:&v14 atIndex:3];
      long long v11 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v10 invocation:0 repeats:0.1];
      id v12 = self->_collapsableUpdateTimer;
      self->_collapsableUpdateTimer = v11;
    }
    else
    {
      [(MFComposeRecipientTextView *)self _setTextViewIsCollapsed:!a3 animated:0];
    }
  }
}

- (void)setSeparatorHidden:(BOOL)a3
{
  if (self->_separatorHidden != a3)
  {
    self->_separatorHidden = a3;
    -[UIView setHidden:](self->super._separator, "setHidden:");
  }
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  [(MFComposeRecipientTextView *)self _updateAddButtonVisibility];

  [(MFComposeRecipientTextView *)self _recomputeTextContainerExclusionPaths];
}

- (void)_updateAddButtonVisibility
{
  BOOL v3 = self->_editable
    && self->_expanded
    && self->_showsAddButtonWhenExpanded
    && +[MFAddressBookManager isAuthorizedToUseAddressBook]&& [(MFComposeRecipientTextView *)self _canAddAdditionalAtoms];

  [(MFComposeRecipientTextView *)self _setAddButtonVisible:v3 animated:1];
}

- (void)setShowsAddButtonWhenExpanded:(BOOL)a3
{
  if (self->_showsAddButtonWhenExpanded != a3)
  {
    self->_showsAddButtonWhenExpanded = a3;
    [(MFComposeRecipientTextView *)self _updateAddButtonVisibility];
    [(MFComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
  }
}

- (BOOL)_hasUnsafeRecipients
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  textView = self->_textView;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MFComposeRecipientTextView__hasUnsafeRecipients__block_invoke;
  v5[3] = &unk_1E5F79C10;
  v5[4] = self;
  void v5[5] = &v6;
  [(_MFAtomTextView *)textView enumerateAtoms:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __50__MFComposeRecipientTextView__hasUnsafeRecipients__block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  BOOL v4 = [a2 recipient];
  LOBYTE(v3) = [v3 _atomPresentationOptionsForRecipient:v4];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)_userEnteredTextWithRange:(_NSRange *)a3
{
  uint64_t v5 = [(_MFAtomTextView *)self->_textView textStorage];
  uint64_t v6 = [v5 string];

  uint64_t v7 = [(_MFAtomTextView *)self->_textView selectedRange];
  uint64_t v9 = v7 + v8;
  if (v7 + v8 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = [v6 length];
  }
  id v10 = [v6 substringToIndex:v9];
  long long v11 = [MEMORY[0x1E4F28B88] textAttachmentCharacterSet];
  uint64_t v12 = [v10 rangeOfCharacterFromSet:v11 options:4];
  uint64_t v14 = v13;

  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v15 = 0;
  }
  else {
    NSUInteger v15 = v12 + v14;
  }
  int64_t v16 = v9 - v15;
  NSUInteger v17 = (v9 - v15) & ~((uint64_t)(v9 - v15) >> 63);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL || v16 <= 0)
  {
    long long v19 = &stru_1F0817A00;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  objc_msgSend(v6, "substringWithRange:", v15, v17);
  long long v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
LABEL_12:
    a3->location = v15;
    a3->length = v17;
  }
LABEL_13:

  return v19;
}

- (NSString)text
{
  return (NSString *)[(MFComposeRecipientTextView *)self _userEnteredTextWithRange:0];
}

- (UITextView)textView
{
  return (UITextView *)self->_textView;
}

- (double)offsetForRowWithTextField
{
  [(MFComposeRecipientTextView *)self bounds];
  double v3 = v2;
  [(id)objc_opt_class() preferredHeight];
  return v3 - v4;
}

- (unint64_t)numberOfRowsOfTextInField
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  double v3 = [(_MFAtomTextView *)self->_textView layoutManager];
  uint64_t v4 = [v3 numberOfGlyphs];

  uint64_t v5 = [(_MFAtomTextView *)self->_textView layoutManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__MFComposeRecipientTextView_numberOfRowsOfTextInField__block_invoke;
  v8[3] = &unk_1E5F79C38;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v4, v8);

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __55__MFComposeRecipientTextView_numberOfRowsOfTextInField__block_invoke(uint64_t result)
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
    [(_MFAtomTextView *)self->_textView setFont:*p_baseFont];
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
  double v2 = [(_MFAtomTextView *)self->_textView textStorage];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)setProperty:(int)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(MFComposeRecipientTextView *)self setProperties:v5];
}

- (void)setProperties:(id)a3
{
}

- (double)textFieldOffsetForNumberOfRowsToScroll:(unint64_t)a3 numberOfRowsAboveField:(int64_t)a4
{
  unint64_t v7 = [(MFComposeRecipientTextView *)self numberOfRowsOfTextInField];
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
    [(MFComposeHeaderView *)self _recipientViewEdgeInsets];
    double v11 = (v16 - v17) * (double)v10;
  }
  return v12 + v11;
}

- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  id v6 = [(NSMutableDictionary *)self->_atomPresentationOptionsByRecipient objectForKey:v4];
  unint64_t v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else if (objc_opt_respondsToSelector())
  {
    unint64_t v8 = [WeakRetained presentationOptionsForRecipient:v4];
    atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v8];
    [(NSMutableDictionary *)atomPresentationOptionsByRecipient setObject:v10 forKey:v4];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)_invalidateAtomPresentationOptionsCache
{
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeRecipientTextView;
  [(MFComposeHeaderView *)&v5 setLabel:v4];
  [(MFComposeRecipientTextView *)self reflow];
  [(MFComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
}

- (UIColor)inactiveTextColor
{
  inactiveTextColor = self->_inactiveTextColor;
  if (!inactiveTextColor)
  {
    id v4 = [(MFComposeRecipientTextView *)self interactionTintColor];
    objc_super v5 = (UIColor *)[v4 copy];
    id v6 = self->_inactiveTextColor;
    self->_inactiveTextColor = v5;

    inactiveTextColor = self->_inactiveTextColor;
  }

  return inactiveTextColor;
}

- (void)setInactiveTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveTextColor, a3);

  [(MFComposeRecipientTextView *)self _updateInactiveTextView];
}

- (id)_baseAttributes
{
  BOOL v3 = [(MFComposeRecipientTextView *)self typingTextColor];

  if (v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)MFComposeRecipientTextView;
    id v4 = [(MFComposeHeaderView *)&v9 _baseAttributes];
    objc_super v5 = (void *)[v4 mutableCopy];

    id v6 = [(MFComposeRecipientTextView *)self typingTextColor];
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFComposeRecipientTextView;
    objc_super v5 = [(MFComposeHeaderView *)&v8 _baseAttributes];
  }

  return v5;
}

- (void)clearText
{
  BOOL v3 = [(_MFAtomTextView *)self->_textView delegate];
  [(_MFAtomTextView *)self->_textView setDelegate:0];
  [(_MFAtomTextView *)self->_textView unmarkText];
  [(_MFAtomTextView *)self->_textView setDelegate:v3];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v4 = NSString;
  objc_super v5 = [(_MFAtomTextView *)self->_textView textStorage];
  id v6 = [v5 string];
  unint64_t v7 = [v4 stringWithString:v6];

  if ([v7 length])
  {
    objc_super v8 = [MEMORY[0x1E4F28B88] textAttachmentCharacterSet];
    objc_super v9 = [MEMORY[0x1E4F28FE8] scannerWithString:v7];
    uint64_t v10 = 0;
    while (1)
    {
      unint64_t v11 = [v9 scanLocation];
      if (v11 >= [v7 length]) {
        break;
      }
      id v23 = v10;
      int v12 = [v9 scanUpToCharactersFromSet:v8 intoString:&v23];
      id v13 = v23;

      if ([v13 length])
      {
        uint64_t v14 = [v9 scanLocation];
        uint64_t v15 = [v13 length];
        uint64_t v16 = [v13 length];
        double v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v14 - v15, v16);
        [v19 addObject:v17];
      }
      uint64_t v10 = v13;
      if (((v12 | [v9 scanCharactersFromSet:v8 intoString:0]) & 1) == 0) {
        goto LABEL_9;
      }
    }
    id v13 = v10;
LABEL_9:
    textView = self->_textView;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __39__MFComposeRecipientTextView_clearText__block_invoke;
    v20[3] = &unk_1E5F79038;
    id v21 = v19;
    long long v22 = self;
    [(_MFAtomTextView *)textView batchTextStorageUpdates:v20];
  }
}

void __39__MFComposeRecipientTextView_clearText__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "reverseObjectEnumerator", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v10 + 1) + 8 * v5) rangeValue];
        uint64_t v8 = v7;
        objc_super v9 = [*(id *)(*(void *)(a1 + 40) + 456) textStorage];
        objc_msgSend(v9, "deleteCharactersInRange:", v6, v8);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (void)invalidateAtomPresentationOptions
{
  [(NSMutableDictionary *)self->_atomPresentationOptionsByRecipient removeAllObjects];
  [(NSMutableDictionary *)self->_atomLayoutOptionsByRecipient removeAllObjects];

  [(MFComposeRecipientTextView *)self reflow];
}

- (void)invalidateAtomPresentationOptionsForRecipient:(id)a3
{
  id v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](self->_atomPresentationOptionsByRecipient, "removeObjectForKey:");
  uint64_t v4 = [(MFComposeRecipientTextView *)self atomViewForRecipient:v5];
  objc_msgSend(v4, "setPresentationOptions:", -[MFComposeRecipientTextView _atomPresentationOptionsForRecipient:](self, "_atomPresentationOptionsForRecipient:", v5));
  [(MFComposeRecipientTextView *)self reflow];
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
  BOOL v2 = [(MFComposeRecipientTextView *)self editable];
  if (!v2) {
    return v2;
  }
  uint64_t v4 = [(MFComposeRecipientTextView *)self text];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
LABEL_2:
    LOBYTE(v2) = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(MFComposeRecipientTextView *)self text];
      [WeakRetained composeRecipientView:self didFinishEnteringAddress:v7];
    }
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (BOOL)becomeFirstResponder
{
  return [(_MFAtomTextView *)self->_textView becomeFirstResponder];
}

- (BOOL)isFirstResponder
{
  return [(_MFAtomTextView *)self->_textView isFirstResponder];
}

- (BOOL)_useRightToLeftLayout
{
  BOOL v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == 1;

  return v3;
}

- (void)reflow
{
  if (![(_MFAtomTextView *)self->_textView isEditingTextStorage])
  {
    BOOL v3 = [(_MFAtomTextView *)self->_textView layoutManager];
    uint64_t v4 = [v3 numberOfGlyphs];

    uint64_t v5 = [(_MFAtomTextView *)self->_textView layoutManager];
    uint64_t v6 = objc_msgSend(v5, "characterRangeForGlyphRange:actualGlyphRange:", 0, v4, 0);
    uint64_t v8 = v7;

    objc_super v9 = [(_MFAtomTextView *)self->_textView layoutManager];
    objc_msgSend(v9, "invalidateLayoutForCharacterRange:actualCharacterRange:", v6, v8, 0);

    if ([(MFComposeRecipientTextView *)self _isTextViewCollapsed])
    {
      [(MFComposeRecipientTextView *)self _updateInactiveTextView];
    }
  }
}

- (id)_textContainerExclusionPathsWithAddButton:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (v3) {
    [(MFComposeRecipientTextView *)self _ensureAddButton];
  }
  v12.receiver = self;
  v12.super_class = (Class)MFComposeRecipientTextView;
  [(MFComposeRecipientTextView *)&v12 layoutIfNeeded];
  BOOL v6 = [(MFComposeRecipientTextView *)self _useRightToLeftLayout];
  if (v6) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 2;
  }
  [(MFComposeHeaderView *)self _exclusionRectForView:self->super._labelView alongEdge:v7];
  -[MFComposeRecipientTextView convertRect:toView:](self, "convertRect:toView:", self->_textView);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:");
  [v5 addObject:v8];
  if (v3)
  {
    if (v6) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 8;
    }
    [(MFComposeHeaderView *)self _exclusionRectForView:self->_addButton alongEdge:v9];
    -[MFComposeRecipientTextView convertRect:toView:](self, "convertRect:toView:", self->_textView);
    long long v10 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:");
    [v5 addObject:v10];
  }

  return v5;
}

- (void)_recomputeTextContainerExclusionPaths
{
  if (!self->_textViewExclusionPathsAreValid)
  {
    if (self->_expanded
      || ([(_MFAtomTextView *)self->_textView attributedText],
          id v7 = (id)objc_claimAutoreleasedReturnValue(),
          uint64_t v3 = [v7 length],
          v7,
          v3))
    {
      id v8 = [(MFComposeRecipientTextView *)self _textContainerExclusionPathsWithAddButton:self->_showsAddButtonWhenExpanded];
      uint64_t v4 = [(_MFAtomTextView *)self->_textView textContainer];
      [v4 setExclusionPaths:v8];

      self->_textViewExclusionPathsAreValid = 1;
      textView = self->_textView;
      BOOL v6 = [(MFComposeRecipientTextView *)self _baseAttributes];
      [(_MFAtomTextView *)textView setTypingAttributes:v6];

      if ([(MFComposeRecipientTextView *)self _isTextViewCollapsed]) {
        [(MFComposeRecipientTextView *)self _updateInactiveTextView];
      }
    }
  }
}

- (void)_invalidateTextContainerExclusionPaths
{
  if (self->_textViewExclusionPathsAreValid)
  {
    self->_textViewExclusionPathsAreValid = 0;
    objc_msgSend(MEMORY[0x1E4F60F28], "__mui_nextRunLoopMainThreadScheduler");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = -[MFComposeRecipientTextView ef_onScheduler:](self, "ef_onScheduler:");
    [v3 _recomputeTextContainerExclusionPaths];
  }
}

- (_NSRange)_rangeForComposeRecipientAtom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3010000000;
  double v17 = "";
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  int64x2_t v18 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  if (v4)
  {
    textView = self->_textView;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__MFComposeRecipientTextView__rangeForComposeRecipientAtom___block_invoke;
    v11[3] = &unk_1E5F79B98;
    id v12 = v4;
    long long v13 = &v14;
    [(_MFAtomTextView *)textView enumerateAtomAttachments:v11];

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
  result.location = v9;
  return result;
}

void __60__MFComposeRecipientTextView__rangeForComposeRecipientAtom___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
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
  id v4 = [(_MFAtomTextView *)self->_textView textStorage];
  uint64_t v5 = [v4 attributesAtIndex:a3 effectiveRange:0];

  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4FB06B8]];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [v6 atomView];
  }
  else
  {
    id v7 = 0;
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
    -[NSMutableDictionary setObject:forKey:](self->_atomLayoutOptionsByRecipient, "setObject:forKey:");
  }
  [v10 setObject:v11 forKey:v8];
}

- (id)_valueForAtomLayoutOption:(id)a3 withRecipient:(id)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_atomLayoutOptionsByRecipient objectForKey:a4];
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
  uint64_t v3 = [(_MFAtomTextView *)self->_textView text];
  uint64_t v4 = [v3 length];

  -[_MFAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", v4, 0);
  atomViews = self->_atomViews;

  [(NSMutableArray *)atomViews enumerateObjectsUsingBlock:&__block_literal_global_131];
}

uint64_t __50__MFComposeRecipientTextView__resetSelectionState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelected:0 animated:1];
}

- (BOOL)_textViewContainsAtomizedRecipients
{
  uint64_t v3 = [(_MFAtomTextView *)self->_textView textStorage];
  if ([v3 length])
  {
    uint64_t v4 = [(MFComposeRecipientTextView *)self recipients];
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
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4FB0700];
  p_labelView = &self->super._labelView;
  uint64_t v4 = [(MFHeaderLabelView *)self->super._labelView textColor];
  v14[0] = v4;
  v13[1] = *MEMORY[0x1E4FB06F8];
  BOOL v5 = [(MFHeaderLabelView *)*p_labelView font];
  v14[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v8 = [(MFHeaderLabelView *)self->super._labelView text];
  id v9 = (void *)v8;
  if (v8) {
    NSUInteger v10 = (__CFString *)v8;
  }
  else {
    NSUInteger v10 = &stru_1F0817A00;
  }
  id v11 = (void *)[v7 initWithString:v10 attributes:v6];

  return v11;
}

- (void)_ensureInactiveTextView
{
  if (!self->_inactiveTextView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    uint64_t v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:textContainer:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    inactiveTextView = self->_inactiveTextView;
    self->_inactiveTextView = v4;

    id v6 = self->_inactiveTextView;
    id v7 = [MEMORY[0x1E4FB1618] clearColor];
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

    NSUInteger v10 = self->_inactiveTextView;
    [(MFComposeRecipientTextView *)self addSubview:v10];
  }
}

- (void)_updateInactiveTextView
{
  [(MFComposeRecipientTextView *)self _ensureInactiveTextView];
  id v3 = [(MFComposeRecipientTextView *)self _attributedStringWithAtomizedRecipients];
  [(UITextView *)self->_inactiveTextView setAttributedText:v3];

  [(UITextView *)self->_inactiveTextView frame];
  [(_MFAtomTextView *)self->_textView frame];
  double v5 = v4;
  double v7 = v6;
  [(_MFAtomTextView *)self->_textView frame];
  double v9 = v8;
  if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
  {
    [(_MFAtomTextView *)self->_textView frame];
  }
  else
  {
    +[MFComposeHeaderView preferredHeight];
    double v10 = v11;
  }
  inactiveTextView = self->_inactiveTextView;

  -[UITextView setFrame:](inactiveTextView, "setFrame:", v5, v7, v9, v10);
}

- (id)_attributedStringWithAtomizedRecipients
{
  if ([(MFComposeRecipientTextView *)self _textViewContainsAtomizedRecipients])
  {
    id v3 = [(MFComposeRecipientTextView *)self _baseAttributes];
    double v4 = (void *)[v3 mutableCopy];

    if (self->_indicatesUnsafeRecipientsWhenCollapsed
      && [(MFComposeRecipientTextView *)self _hasUnsafeRecipients])
    {
      double v5 = [MEMORY[0x1E4FB1618] systemRedColor];
      [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
    }
    else
    {
      double v5 = [(MFComposeRecipientTextView *)self inactiveTextColor];
      [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
    }

    double v7 = [(MFComposeRecipientTextView *)self recipients];
    double v8 = [(_MFAtomTextView *)self->_textView layoutManager];
    [v8 lineFragmentRectForGlyphAtIndex:0 effectiveRange:0];
    uint64_t v10 = v9;

    double v11 = NSString;
    uint64_t v12 = [v7 count];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__MFComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke;
    v23[3] = &unk_1E5F79720;
    id v13 = v7;
    id v24 = v13;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__MFComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke_2;
    v20[3] = &unk_1E5F79C80;
    id v14 = v4;
    id v21 = v14;
    uint64_t v22 = v10;
    uint64_t v15 = objc_msgSend(v11, "mf_commaSeparatedRecipientListWithRecipientCount:prefixForRecipientAtIndex:stringForRecipientAtIndex:lengthValidationBlock:", v12, 0, v23, v20);
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v15 attributes:v14];
    [(MFComposeHeaderView *)self _recipientViewEdgeInsets];
    -[UITextView setTextContainerInset:](self->_inactiveTextView, "setTextContainerInset:");
    id v16 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    objc_msgSend(v16, "setBounds:", 0.0, 0.0, 5.0, 5.0);
    double v17 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v16];
    [v6 insertAttributedString:v17 atIndex:0];
    int64x2_t v18 = [(MFComposeRecipientTextView *)self _toString];
    [v6 insertAttributedString:v18 atIndex:0];
  }
  else
  {
    double v6 = [(MFComposeRecipientTextView *)self _toString];
  }

  return v6;
}

id __69__MFComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = [*(id *)(a1 + 32) objectAtIndex:a2];
  id v3 = [v2 displayString];

  return v3;
}

BOOL __69__MFComposeRecipientTextView__attributedStringWithAtomizedRecipients__block_invoke_2(uint64_t a1, void *a2)
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

  BOOL v8 = [(MFComposeRecipientTextView *)self _isTextViewCollapsed];
  if (v5) {
    int v9 = ![(MFComposeRecipientTextView *)self _textViewContainsAtomizedRecipients];
  }
  else {
    int v9 = 0;
  }
  if (!self->_collapsedStateInitialized || ((v9 | v8 ^ v5 ^ 1) & 1) == 0)
  {
    self->_collapsedStateInitialized = 1;
    self->_isTextFieldCollapsed = v5;
    if (v5) {
      [(MFComposeRecipientTextView *)self _updateInactiveTextView];
    }
    if (!MFModernUIApplicationPreferredContentSizeIsAccessibility())
    {
      [(_MFAtomTextView *)self->_textView bounds];
      -[_MFAtomTextView setBounds:](self->_textView, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__MFComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke;
    aBlock[3] = &unk_1E5F79898;
    aBlock[4] = self;
    BOOL v25 = v5;
    uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63__MFComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke_2;
    v22[3] = &unk_1E5F798C0;
    v22[4] = self;
    BOOL v23 = v5;
    double v11 = (void (**)(void *, uint64_t))_Block_copy(v22);
    if (v4)
    {
      [(UITextView *)self->_inactiveTextView setHidden:0];
      if (v5) {
        double v12 = 0.0;
      }
      else {
        double v12 = 1.0;
      }
      [(UITextView *)self->_inactiveTextView setAlpha:v12];
      if (v5) {
        double v13 = 1.0;
      }
      else {
        double v13 = 0.0;
      }
      [(_MFAtomTextView *)self->_textView setAlpha:v13];
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v10 animations:v11 completion:0.23];
    }
    else
    {
      v10[2](v10);
      v11[2](v11, 1);
    }
    if (v5)
    {
      id v14 = [(UITextView *)self->_inactiveTextView text];
      if ([v14 length])
      {
        BOOL v15 = [(MFComposeRecipientTextView *)self _delegateRespondsToSizeChange];

        if (v15)
        {
          [(MFComposeRecipientTextView *)self bounds];
          double v17 = v16;
          [(UITextView *)self->_inactiveTextView frame];
          -[MFComposeRecipientTextView _notifyDelegateOfNewSize:](self, "_notifyDelegateOfNewSize:", v17, v18);
          [(_MFAtomTextView *)self->_textView bounds];
          -[_MFAtomTextView setBounds:](self->_textView, "setBounds:");
        }
        goto LABEL_25;
      }
    }
    else
    {
      id v19 = [(_MFAtomTextView *)self->_textView layoutManager];
      long long v20 = [(_MFAtomTextView *)self->_textView textStorage];
      objc_msgSend(v19, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v20, "length"), 0);

      id v14 = [(_MFAtomTextView *)self->_textView layoutManager];
      id v21 = [(_MFAtomTextView *)self->_textView textContainer];
      [v14 ensureLayoutForTextContainer:v21];
    }
LABEL_25:
  }
}

uint64_t __63__MFComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:v2];
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 456);

  return [v4 setAlpha:v3];
}

uint64_t __63__MFComposeRecipientTextView__setTextViewIsCollapsed_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 464) setHidden:*(unsigned char *)(result + 40) == 0];
  }
  return result;
}

- (void)_ensureAddButton
{
  if (!self->_addButton)
  {
    double v3 = [MEMORY[0x1E4FB14D0] buttonWithType:5];
    addButton = self->_addButton;
    self->_addButton = v3;

    BOOL v5 = [(MFComposeRecipientTextView *)self _isAddButtonVisible];
    double v6 = 0.0;
    if (v5) {
      double v6 = 1.0;
    }
    [(UIButton *)self->_addButton setAlpha:v6];
    [(UIButton *)self->_addButton setAccessibilityIdentifier:*MEMORY[0x1E4F73B80]];
    double v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v8 = [v7 localizedStringForKey:@"ADD_CONTACT_ACCESSIBILITY_LABEL" value:&stru_1F0817A00 table:@"Main"];
    [(UIButton *)self->_addButton setAccessibilityLabel:v8];

    [(UIButton *)self->_addButton setAutoresizingMask:0];
    [(UIButton *)self->_addButton setAutoresizesSubviews:0];
    [(UIButton *)self->_addButton addTarget:self action:sel__addButtonTapped_ forControlEvents:64];
    [(UIButton *)self->_addButton frame];
    self->_addButtonFrame.origin.double x = v9;
    self->_addButtonFrame.origin.double y = v10;
    self->_addButtonFrame.size.double width = v11;
    self->_addButtonFrame.size.double height = v12;
    double v13 = self->_addButton;
    [(MFComposeRecipientTextView *)self addSubview:v13];
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
  if ([(MFComposeRecipientTextView *)self _isAddButtonVisible] != a3)
  {
    if (v5 && !self->_addButton) {
      [(MFComposeRecipientTextView *)self _ensureAddButton];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__MFComposeRecipientTextView__setAddButtonVisible_animated___block_invoke;
    aBlock[3] = &unk_1E5F79898;
    aBlock[4] = self;
    BOOL v15 = v5;
    double v7 = _Block_copy(aBlock);
    BOOL v8 = v7;
    if (v4)
    {
      double v9 = 1.0;
      if (v5) {
        double v9 = 0.0;
      }
      [(UIButton *)self->_addButton setAlpha:v9];
      if (v5)
      {
        CGAffineTransformMakeTranslation(&v13, 2.0, 0.0);
      }
      else
      {
        long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v13.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v13.c = v10;
        *(_OWORD *)&v13.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      }
      addButton = self->_addButton;
      CGAffineTransform v12 = v13;
      [(UIButton *)addButton setTransform:&v12];
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.2];
    }
    else
    {
      (*((void (**)(void *))v7 + 2))(v7);
    }
  }
}

void __60__MFComposeRecipientTextView__setAddButtonVisible_animated___block_invoke(uint64_t a1)
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
  void v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 setTransform:v6];
}

- (void)_tapGestureRecognized:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3) {
    [(_MFAtomTextView *)self->_textView becomeFirstResponder];
  }
}

- (void)_longPressGestureRecognized:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1) {
    [(_MFAtomTextView *)self->_textView becomeFirstResponder];
  }
}

- (BOOL)_canAddAdditionalAtoms
{
  if (self->_maxRecipients < 1) {
    return 1;
  }
  double v3 = [(MFComposeRecipientTextView *)self recipients];
  BOOL v4 = (unint64_t)[v3 count] < self->_maxRecipients;

  return v4;
}

- (id)_atomAttachmentForRecipient:(id)a3
{
  id v4 = a3;
  long long v5 = [MFModernComposeRecipientAtom alloc];
  double v6 = -[MFModernComposeRecipientAtom initWithFrame:recipient:](v5, "initWithFrame:recipient:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MFModernAtomView *)v6 setPresentationOptions:[(MFComposeRecipientTextView *)self _atomPresentationOptionsForRecipient:v4]];
  double v7 = [[_MFAtomTextAttachment alloc] initWithAtomView:v6];

  return v7;
}

- (void)_insertAtomAttachment:(id)a3 atCharacterIndex:(unint64_t)a4
{
}

- (void)_insertAtomAttachment:(id)a3 andReplaceCharactersInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  double v7 = [(MFComposeRecipientTextView *)self _baseAttributes];
  BOOL v8 = [v10 attributedStringWithBaseAttributes:v7];

  double v9 = [(_MFAtomTextView *)self->_textView textStorage];
  if (length) {
    objc_msgSend(v9, "replaceCharactersInRange:withAttributedString:", location, length, v8);
  }
  else {
    [v9 insertAttributedString:v8 atIndex:location];
  }

  if (![(_MFAtomTextView *)self->_textView isEditingTextStorage]) {
    [(MFComposeRecipientTextView *)self _recomputeTextContainerExclusionPaths];
  }
}

- (void)_addAddressAtomSubview:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->_atomViews, "containsObject:") & 1) == 0)
  {
    [v4 setDelegate:self];
    [(NSMutableArray *)self->_atomViews addObject:v4];
    [(_MFAtomTextView *)self->_textView addSubview:v4];
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
  v10[2] = __47__MFComposeRecipientTextView_atomViewsInRange___block_invoke;
  v10[3] = &unk_1E5F79B48;
  id v8 = v6;
  id v11 = v8;
  -[_MFAtomTextView enumerateAtomsInCharacterRange:withBlock:](textView, "enumerateAtomsInCharacterRange:withBlock:", location, length, v10);

  return v8;
}

uint64_t __47__MFComposeRecipientTextView_atomViewsInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)selectedAtoms
{
  uint64_t v4 = [(_MFAtomTextView *)self->_textView selectedRange];

  return -[MFComposeRecipientTextView atomViewsInRange:](self, "atomViewsInRange:", v4, v3);
}

- (unint64_t)indexOfRecipientForInsertionAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  long long v5 = [(_MFAtomTextView *)self->_textView atoms];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v12 = [v5 count];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MFComposeRecipientTextView_indexOfRecipientForInsertionAtPoint___block_invoke;
  v8[3] = &unk_1E5F79CA8;
  *(CGFloat *)&void v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];
  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __66__MFComposeRecipientTextView_indexOfRecipientForInsertionAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  [v9 frame];
  double MaxX = CGRectGetMaxX(v11);
  [v9 frame];
  if (*(double *)(a1 + 40) < MaxX + v8 * -0.5)
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
  if ([v10 isEqualToString:@"\n"]) {
    int v11 = 1;
  }
  else {
    int v11 = [v10 isEqualToString:@"\t"];
  }
  if ([v10 isEqualToString:@","])
  {
    uint64_t v12 = [v9 markedTextRange];
    BOOL v13 = v12 == 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  if ((v11 | v13) != 1)
  {
    if ([v10 isEqualToString:&stru_1F0817A00])
    {
      if (length == 1)
      {
        long long v16 = [(MFComposeRecipientTextView *)self _atomViewAtCharacterIndex:location];
        double v17 = v16;
        if (v16)
        {
          int v15 = [v16 isSelected];
          if (v15)
          {
            recipientsBeingRemoved = self->_recipientsBeingRemoved;
            id v19 = [v17 recipient];
            [(NSMutableArray *)recipientsBeingRemoved addObject:v19];
          }
          else
          {
            [(MFComposeRecipientTextView *)self selectComposeRecipientAtom:v17];
          }

          goto LABEL_19;
        }
      }
      else
      {
        textView = self->_textView;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __79__MFComposeRecipientTextView_textView_shouldChangeTextInRange_replacementText___block_invoke;
        v22[3] = &unk_1E5F79B48;
        v22[4] = self;
        -[_MFAtomTextView enumerateAtomsInCharacterRange:withBlock:](textView, "enumerateAtomsInCharacterRange:withBlock:", location, length, v22);
      }
    }
    LOBYTE(v15) = 1;
    goto LABEL_19;
  }
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (![(MFComposeRecipientTextView *)self finishEnteringRecipient]
    && (objc_opt_respondsToSelector() & v11) == 1)
  {
    [WeakRetained composeRecipientViewReturnPressed:self];
  }

  LOBYTE(v15) = 0;
LABEL_19:

  return v15;
}

void __79__MFComposeRecipientTextView_textView_shouldChangeTextInRange_replacementText___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 recipient];
  if (v3) {
    [*(id *)(*(void *)(a1 + 32) + 584) addObject:v3];
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 selectedRange];
  uint64_t v7 = v6;
  double v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(_MFAtomTextView *)self->_textView textStorage];
  uint64_t v10 = [v9 length];

  int v11 = [(_MFAtomTextView *)self->_textView layoutManager];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  long long v16 = __57__MFComposeRecipientTextView_textViewDidChangeSelection___block_invoke;
  double v17 = &unk_1E5F79CF8;
  uint64_t v18 = self;
  uint64_t v20 = v5;
  uint64_t v21 = v7;
  id v12 = v8;
  id v19 = v12;
  objc_msgSend(v11, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v10, &v14);

  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "composeRecipientView:didSelectRecipients:", self, v12, v14, v15, v16, v17, v18);
  }
}

void __57__MFComposeRecipientTextView_textViewDidChangeSelection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 456) layoutManager];
  uint64_t v8 = objc_msgSend(v7, "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  uint64_t v10 = v9;

  int v11 = *(void **)(*(void *)(a1 + 32) + 456);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__MFComposeRecipientTextView_textViewDidChangeSelection___block_invoke_2;
  v12[3] = &unk_1E5F79CD0;
  uint64_t v15 = v8;
  uint64_t v16 = v10;
  uint64_t v14 = v18;
  long long v17 = *(_OWORD *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  objc_msgSend(v11, "enumerateAtomsInCharacterRange:withBlock:", v8, v10, v12);

  _Block_object_dispose(v18, 8);
}

void __57__MFComposeRecipientTextView_textViewDidChangeSelection___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(*(void *)(a1[5] + 8) + 24) + a1[6];
  unint64_t v5 = a1[8];
  unint64_t v6 = a1[9];
  BOOL v7 = v4 < v5 || v4 - v5 >= v6;
  id v14 = v3;
  if (v7)
  {
    if ([v3 isSelected]) {
      [v14 setSelected:0 animated:0];
    }
  }
  else
  {
    uint64_t v8 = v5 + v6 - 1;
    BOOL v9 = v4 == v5;
    uint64_t v10 = 4;
    if (!v9) {
      uint64_t v10 = 1;
    }
    if (v4 == v8) {
      uint64_t v11 = v10 | 8;
    }
    else {
      uint64_t v11 = v10;
    }
    [v3 setSelected:1 animated:0 style:v11];
    id v12 = (void *)a1[4];
    id v13 = [v14 recipient];
    [v12 addObject:v13];
  }
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
}

- (void)textViewDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_recipientsBeingRemoved count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v4 = self->_recipientsBeingRemoved;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          -[MFComposeRecipientTextView _didRemoveRecipient:](self, "_didRemoveRecipient:", *(void *)(*((void *)&v10 + 1) + 8 * v7++), (void)v10);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    [(NSMutableArray *)self->_recipientsBeingRemoved removeAllObjects];
  }
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector())
  {
    BOOL v9 = [(MFComposeRecipientTextView *)self text];
    [WeakRetained composeRecipientView:self textDidChange:v9];
  }
}

- (void)atomTextViewDidBecomeFirstResponder:(id)a3
{
  self->_didIgnoreFirstResponderResign = 0;
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained recipientViewDidBecomeFirstResponder:self];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained composeRecipientViewDidBecomeFirstResponder:self];
  }
  if (![(MFComposeRecipientTextView *)self _canAddAdditionalAtoms])
  {
    unint64_t v4 = [(NSMutableArray *)self->_atomViews lastObject];
    [v4 setSelected:1 animated:1];
  }
  if ([(MFComposeRecipientTextView *)self editable]) {
    [(MFComposeRecipientTextView *)self setExpanded:1];
  }
}

- (void)atomTextViewDidResignFirstResponder:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained recipientViewShouldIgnoreFirstResponderChanges:self])
  {
    self->_didIgnoreFirstResponderResign = 1;
  }
  else
  {
    [(MFComposeRecipientTextView *)self finishEnteringRecipient];
    if (objc_opt_respondsToSelector()) {
      [WeakRetained recipientViewDidResignFirstResponder:self];
    }
    [(MFComposeRecipientTextView *)self _resetSelectionState];
    [(MFComposeRecipientTextView *)self setExpanded:0];
  }
}

- (void)atomTextView:(id)a3 didChangeWritingDirection:(int64_t)a4
{
  textView = self->_textView;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __69__MFComposeRecipientTextView_atomTextView_didChangeWritingDirection___block_invoke;
  _OWORD v6[3] = &__block_descriptor_33_e38_v16__0__MFModernComposeRecipientAtom_8l;
  BOOL v7 = a4 == 1;
  [(_MFAtomTextView *)textView enumerateAtoms:v6];
  [(MFComposeRecipientTextView *)self reflow];
}

uint64_t __69__MFComposeRecipientTextView_atomTextView_didChangeWritingDirection___block_invoke(uint64_t a1, void *a2)
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
    CGFloat v30 = [MEMORY[0x1E4F1CA80] setWithArray:self->_atomViews];
    int64_t v10 = [(_MFAtomTextView *)self->_textView baseWritingDirection];
    long long v11 = [v8 textStorage];
    uint64_t v12 = [v11 length];

    long long v13 = [v8 textStorage];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __84__MFComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke;
    v35[3] = &unk_1E5F79D68;
    v35[4] = self;
    int64_t v39 = v10;
    id v14 = v8;
    id v36 = v14;
    id v15 = v9;
    id v37 = v15;
    id v16 = v30;
    id v38 = v16;
    objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0, v35);

    int64_t atomViewAnimationDepth = self->_atomViewAnimationDepth;
    if (atomViewAnimationDepth <= 1) {
      int64_t atomViewAnimationDepth = 1;
    }
    self->_int64_t atomViewAnimationDepth = atomViewAnimationDepth - 1;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v18);
          }
          [(MFComposeRecipientTextView *)self _removeAddressAtomSubview:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v19);
    }

    if (self->_editable)
    {
      [(_MFAtomTextView *)self->_textView textContainerInset];
      [v14 usedRectForTextContainer:v15];
      UIRoundToViewScale();
      double v23 = v22;
      [(_MFAtomTextView *)self->_textView bounds];
      double v25 = v24;
      if (MFModernUIApplicationPreferredContentSizeIsAccessibility())
      {
        double width = self->_currentTextRect.size.width;
        double height = self->_currentTextRect.size.height;
      }
      else
      {
        [(_MFAtomTextView *)self->_textView bounds];
      }
      if (v25 != width || v23 != height)
      {
        double v28 = *MEMORY[0x1E4F1DAD8];
        double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        self->_currentTextRect.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
        self->_currentTextRect.origin.CGFloat y = v29;
        self->_currentTextRect.size.double width = v25;
        self->_currentTextRect.size.double height = v23;
        if (!MFModernUIApplicationPreferredContentSizeIsAccessibility()) {
          -[_MFAtomTextView setFrame:](self->_textView, "setFrame:", v28, v29, v25, v23);
        }
        [(MFComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
        [(MFComposeRecipientTextView *)self _notifyDelegateOfSizeChange];
      }
    }
  }
}

void __84__MFComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = [v7 objectForKey:*MEMORY[0x1E4FB06B8]];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 atomView];
      char v10 = [v8 isPlaceholder];
      if (v9) {
        char v11 = v10;
      }
      else {
        char v11 = 1;
      }
      if ((v11 & 1) == 0)
      {
        uint64_t v12 = [v8 recipient];
        long long v13 = [*(id *)(a1 + 32) _valueForAtomLayoutOption:@"MFAtomLayoutOptionShouldBuildIn" withRecipient:v12];
        int v14 = [v13 BOOLValue];

        id v15 = [*(id *)(a1 + 32) _valueForAtomLayoutOption:@"MFAtomLayoutOptionShouldHide" withRecipient:v12];
        int v16 = [v15 BOOLValue];

        long long v17 = [v9 superview];

        if (!v17)
        {
          [*(id *)(a1 + 32) _addAddressAtomSubview:v9];
          if (v16) {
            [v9 setAlpha:0.0];
          }
          int v14 = 1;
        }
        uint64_t v18 = [*(id *)(a1 + 32) _atomPresentationOptionsForRecipient:v12];
        if ([v9 presentationOptions] != v18) {
          [v9 setPresentationOptions:v18];
        }
        [v9 setSeparatorStyle:0];
        [v9 setSeparatorHidden:0];
        [v9 setSeparatorIsLeftAligned:*(void *)(a1 + 64) == 1];
        objc_msgSend(*(id *)(a1 + 40), "boundingRectForGlyphRange:inTextContainer:", a3, a4, *(void *)(a1 + 48));
        uint64_t v20 = v19;
        uint64_t v22 = v21;
        double v24 = v23;
        [v9 intrinsicContentSize];
        double v26 = v25;
        [v9 frame];
        if (v24 != v28 || v26 != v27)
        {
          objc_msgSend(v9, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v24, v26);
          [v9 layoutSubviews];
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __84__MFComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke_2;
        aBlock[3] = &unk_1E5F79D40;
        aBlock[4] = *(void *)(a1 + 32);
        uint64_t v37 = v20;
        uint64_t v38 = v22;
        double v39 = v24;
        double v40 = v26;
        id v29 = v9;
        id v35 = v29;
        id v30 = *(id *)(a1 + 40);
        uint64_t v31 = *(void *)(a1 + 64);
        id v36 = v30;
        uint64_t v41 = v31;
        char v42 = v16;
        long long v32 = (void (**)(void))_Block_copy(aBlock);
        if (([*(id *)(a1 + 32) _shouldAnimateAtomViewChanges] ^ 1 | v14)) {
          v32[2](v32);
        }
        else {
          [MEMORY[0x1E4FB1EB0] animateWithDuration:v32 animations:0.25];
        }
        if (v14 && [*(id *)(a1 + 32) _shouldAnimateAtomViewChanges])
        {
          long long v33 = [*(id *)(*(void *)(a1 + 32) + 456) textColor];
          [v29 performBuildInAnimationFromTextColor:v33 withDuration:0.25];
        }
        [*(id *)(a1 + 56) removeObject:v29];
      }
    }
  }
}

uint64_t __84__MFComposeRecipientTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "convertGlyphRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  char v10 = [*(id *)(a1 + 40) titleLabel];
  [v10 frame];

  double v11 = *(double *)(a1 + 64);
  [*(id *)(a1 + 48) lineFragmentUsedRectForGlyphAtIndex:0 effectiveRange:0];
  if (v11 < v12)
  {
    [*(id *)(*(void *)(a1 + 32) + 416) frame];
    CGRectGetMaxY(v20);
    [*(id *)(*(void *)(a1 + 32) + 416) _baselineOffsetFromBottom];
    v21.origin.CGFloat x = v3;
    v21.origin.CGFloat y = v5;
    v21.size.double width = v7;
    v21.size.double height = v9;
    CGRectGetHeight(v21);
    long long v13 = [*(id *)(a1 + 40) titleLabel];
    [v13 _baselineOffsetFromBottom];
  }
  [*(id *)(a1 + 40) edgeInsets];
  int v14 = *(void **)(a1 + 40);
  id v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 scale];
  UIRectIntegralWithScale();
  objc_msgSend(v14, "setFrame:");

  double v16 = 0.0;
  if (!*(unsigned char *)(a1 + 96)) {
    double v16 = 1.0;
  }
  long long v17 = *(void **)(a1 + 40);

  return [v17 setAlpha:v16];
}

- (BOOL)_delegateRespondsToSizeChange
{
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
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
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(WeakRetained, "composeHeaderView:didChangeSize:", self, width, height);
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend(WeakRetained, "composeRecipientView:didChangeSize:", self, width, height);
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
    v4[2] = __57__MFComposeRecipientTextView__notifyDelegateOfSizeChange__block_invoke;
    v4[3] = &unk_1E5F79088;
    v4[4] = self;
    [v3 addOperationWithBlock:v4];
  }
}

uint64_t __57__MFComposeRecipientTextView__notifyDelegateOfSizeChange__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) frame];
  double v3 = v2;
  double v5 = v4;
  uint64_t result = [*(id *)(a1 + 32) _delegateRespondsToSizeChange];
  if (result) {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfNewSize:", v3, v5);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 565) = 1;
  return result;
}

- (id)_placeholderAttachmentWithStaticWidth
{
  double v2 = +[MFComposeRecipient recipientWithProperty:*MEMORY[0x1E4F49AC0] address:@"email@me.com"];
  double v3 = [MFModernComposeRecipientAtom alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = -[MFModernComposeRecipientAtom initWithFrame:recipient:](v3, "initWithFrame:recipient:", v2, *MEMORY[0x1E4F1DB28], v5, *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MFModernAtomView *)v6 intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;
  double v11 = [[_MFAtomTextAttachment alloc] initWithAtomView:0];
  -[_MFAtomTextAttachment setBounds:](v11, "setBounds:", v4, v5, v8, v10);
  [(_MFAtomTextAttachment *)v11 setIsPlaceholder:1];

  return v11;
}

- (_NSRange)_placeholderAttachmentRange
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3010000000;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  long long v13 = "";
  double v3 = [(MFComposeRecipientTextView *)self placeholderAttachment];

  if (v3)
  {
    textView = self->_textView;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__MFComposeRecipientTextView__placeholderAttachmentRange__block_invoke;
    v9[3] = &unk_1E5F79B98;
    void v9[4] = self;
    void v9[5] = &v10;
    [(_MFAtomTextView *)textView enumerateAtomAttachments:v9];
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

void __57__MFComposeRecipientTextView__placeholderAttachmentRange__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v11 = a2;
  id v9 = [*(id *)(a1 + 32) placeholderAttachment];

  if (v9 == v11)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v10 + 32) = a3;
    *(void *)(v10 + 40) = a4;
    *a5 = 1;
  }
}

- (id)dragPreviewForDraggedItem:(id)a3 withContainer:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  NSUInteger v8 = [(MFComposeRecipientTextView *)self atomViewForRecipient:v6];
  id v9 = [MFModernComposeRecipientAtom alloc];
  [v8 frame];
  uint64_t v14 = -[MFModernComposeRecipientAtom initWithFrame:recipient:presentationOptions:](v9, "initWithFrame:recipient:presentationOptions:", v6, [v8 presentationOptions], v10, v11, v12, v13);
  [(MFModernAtomView *)v14 setSeparatorHidden:1];
  uint64_t v15 = [v8 tintColor];
  [(MFModernComposeRecipientAtom *)v14 setTintColor:v15];

  [(MFModernAtomView *)v14 setSelected:1];
  [(MFModernAtomView *)v14 layoutSubviews];
  [(MFModernComposeRecipientAtom *)v14 frame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(MFModernAtomView *)v14 preferredWidth];
  -[MFModernComposeRecipientAtom setFrame:](v14, "setFrame:", v17, v19, v22, v21);
  double v23 = [v8 superview];
  [(MFModernComposeRecipientAtom *)v14 center];
  objc_msgSend(v23, "convertPoint:toView:", v7);
  double v25 = v24;
  double v27 = v26;

  id v28 = objc_alloc(MEMORY[0x1E4FB1728]);
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v39[0] = *MEMORY[0x1E4F1DAB8];
  v39[1] = v29;
  v39[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id v30 = objc_msgSend(v28, "initWithContainer:center:transform:", v7, v39, v25, v27);
  id v31 = objc_alloc(MEMORY[0x1E4FB1720]);
  long long v32 = (void *)MEMORY[0x1E4F29238];
  [(MFModernComposeRecipientAtom *)v14 bounds];
  CGRect v43 = CGRectInset(v42, 8.0, 8.0);
  long long v33 = objc_msgSend(v32, "valueWithCGRect:", v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
  v40[0] = v33;
  long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  id v35 = (void *)[v31 initWithTextLineRects:v34];

  id v36 = [(MFModernAtomView *)v14 effectiveTintColor];
  [v35 setBackgroundColor:v36];

  uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v14 parameters:v35 target:v30];

  return v37;
}

- (void)dragEnteredAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(MFComposeRecipientTextView *)self placeholderAttachment];

  if (!v6)
  {
    id v7 = [(MFComposeRecipientTextView *)self _placeholderAttachmentWithStaticWidth];
    [(MFComposeRecipientTextView *)self setPlaceholderAttachment:v7];

    double v14 = 0.0;
    NSUInteger v8 = [(_MFAtomTextView *)self->_textView layoutManager];
    id v9 = [(_MFAtomTextView *)self->_textView textContainer];
    uint64_t v10 = objc_msgSend(v8, "glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:", v9, &v14, x, y);

    [(MFComposeRecipientTextView *)self _beginAtomViewAnimations];
    if (v14 + -1.0 >= 0.0) {
      double v11 = v14 + -1.0;
    }
    else {
      double v11 = -(v14 + -1.0);
    }
    double v12 = [(MFComposeRecipientTextView *)self placeholderAttachment];
    if (v11 >= 0.00000011920929)
    {
      [(MFComposeRecipientTextView *)self _insertAtomAttachment:v12 atCharacterIndex:v10];
    }
    else
    {
      double v13 = [(_MFAtomTextView *)self->_textView textStorage];
      -[MFComposeRecipientTextView _insertAtomAttachment:atCharacterIndex:](self, "_insertAtomAttachment:atCharacterIndex:", v12, [v13 length]);
    }
  }
  [(MFComposeRecipientTextView *)self _recomputeTextContainerExclusionPaths];
}

- (void)dragMovedToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(MFComposeRecipientTextView *)self placeholderAttachment];

  if (v6)
  {
    uint64_t v7 = [(MFComposeRecipientTextView *)self _placeholderAttachmentRange];
    uint64_t v9 = v8;
    double v33 = 0.0;
    uint64_t v10 = [(_MFAtomTextView *)self->_textView layoutManager];
    double v11 = [(_MFAtomTextView *)self->_textView textContainer];
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
      double v22 = [(MFComposeRecipientTextView *)self recipients];
      uint64_t v23 = [v22 count];

      if (!v23) {
        [(_MFAtomTextView *)self->_textView becomeFirstResponder];
      }
      return;
    }
    uint64_t v15 = [(_MFAtomTextView *)self->_textView textStorage];
    double v16 = [(MFComposeRecipientTextView *)self placeholderAttachment];
    double v17 = [(MFComposeRecipientTextView *)self _baseAttributes];
    double v18 = [v16 attributedStringWithBaseAttributes:v17];

    [(MFComposeRecipientTextView *)self _beginAtomViewAnimations];
    textView = self->_textView;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    double v26 = __47__MFComposeRecipientTextView_dragMovedToPoint___block_invoke;
    double v27 = &unk_1E5F79D90;
    id v20 = v15;
    id v28 = v20;
    uint64_t v30 = v7;
    uint64_t v31 = v9;
    id v21 = v18;
    id v29 = v21;
    uint64_t v32 = v12;
    [(_MFAtomTextView *)textView batchTextStorageUpdates:&v24];

    goto LABEL_11;
  }
}

uint64_t __47__MFComposeRecipientTextView_dragMovedToPoint___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);

  return [v2 insertAttributedString:v3 atIndex:v4];
}

- (void)dragExited
{
  [(MFComposeRecipientTextView *)self _beginAtomViewAnimations];
  uint64_t v3 = [(_MFAtomTextView *)self->_textView textStorage];
  uint64_t v4 = [(MFComposeRecipientTextView *)self _placeholderAttachmentRange];
  objc_msgSend(v3, "deleteCharactersInRange:", v4, v5);

  [(MFComposeRecipientTextView *)self setPlaceholderAttachment:0];
  textView = self->_textView;

  [(_MFAtomTextView *)textView resignFirstResponder];
}

- (void)dropItems:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke;
  v28[3] = &unk_1E5F79B70;
  v28[4] = self;
  id v16 = v4;
  [v4 enumerateObjectsUsingBlock:v28];
  uint64_t v5 = [(MFComposeRecipientTextView *)self _placeholderAttachmentRange];
  uint64_t v7 = v6;
  [(MFComposeRecipientTextView *)self _beginAtomViewAnimations];
  textView = self->_textView;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke_4;
  v23[3] = &unk_1E5F79E08;
  id v9 = v16;
  id v24 = v9;
  uint64_t v25 = self;
  uint64_t v26 = v5;
  uint64_t v27 = v7;
  [(_MFAtomTextView *)textView batchTextStorageUpdates:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        [(MFComposeRecipientTextView *)self _beginAtomViewAnimations];
        [(MFComposeRecipientTextView *)self _setValue:MEMORY[0x1E4F1CC28] forAtomLayoutOption:@"MFAtomLayoutOptionShouldHide" withRecipient:v13];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke_6;
        v18[3] = &unk_1E5F79038;
        void v18[4] = self;
        v18[5] = v13;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v18 animations:0.35];
        id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v29 = v13;
          uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
          [WeakRetained composeRecipientView:self didAddRecipients:v15];
        }
        else if (objc_opt_respondsToSelector())
        {
          [WeakRetained composeRecipientView:self didAddRecipient:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v10);
  }

  [(_MFAtomTextView *)self->_textView resignFirstResponder];
  [(MFComposeRecipientTextView *)self setPlaceholderAttachment:0];
}

void __40__MFComposeRecipientTextView_dropItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 456) atoms];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke_2;
  v11[3] = &unk_1E5F79BE8;
  id v5 = v3;
  id v12 = v5;
  uint64_t v6 = [v4 indexesOfObjectsPassingTest:v11];

  if ([v6 count])
  {
    uint64_t v7 = [*(id *)(a1 + 32) recipients];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke_3;
    v9[3] = &unk_1E5F79DB8;
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    id v8 = v7;
    [v6 enumerateIndexesUsingBlock:v9];
  }
}

uint64_t __40__MFComposeRecipientTextView_dropItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 recipient];
  id v4 = [v3 uncommentedAddress];
  id v5 = [*(id *)(a1 + 32) uncommentedAddress];
  uint64_t v6 = objc_msgSend(v4, "ea_isEqualToEmailAddress:", v5);

  return v6;
}

void __40__MFComposeRecipientTextView_dropItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  objc_msgSend(v2, "removeRecipient:");
}

uint64_t __40__MFComposeRecipientTextView_dropItems___block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__MFComposeRecipientTextView_dropItems___block_invoke_5;
  v3[3] = &unk_1E5F79DE0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __40__MFComposeRecipientTextView_dropItems___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setValue:forAtomLayoutOption:withRecipient:", MEMORY[0x1E4F1CC38], @"MFAtomLayoutOptionShouldHide");
  id v5 = [*(id *)(a1 + 32) _atomAttachmentForRecipient:v8];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if (a3) {
    [v6 _insertAtomAttachment:v5 atCharacterIndex:v7 + a3];
  }
  else {
    objc_msgSend(v6, "_insertAtomAttachment:andReplaceCharactersInRange:", v5, v7, *(void *)(a1 + 48));
  }
}

void __40__MFComposeRecipientTextView_dropItems___block_invoke_6(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) atomViewForRecipient:*(void *)(a1 + 40)];
  [v1 setAlpha:1.0];
}

- (void)selectComposeRecipientAtom:(id)a3
{
  id v6 = a3;
  uint64_t v4 = -[MFComposeRecipientTextView _rangeForComposeRecipientAtom:](self, "_rangeForComposeRecipientAtom:");
  -[_MFAtomTextView setSelectedRange:](self->_textView, "setSelectedRange:", v4, v5);
}

- (void)deselectComposeRecipientAtom:(id)a3
{
  textView = self->_textView;
  id v4 = [(_MFAtomTextView *)textView textStorage];
  -[_MFAtomTextView setSelectedRange:](textView, "setSelectedRange:", [v4 length], 0);
}

- (void)composeRecipientAtomShowPersonCard:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained composeRecipientView:self showPersonCardForAtom:v5];
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

- (BOOL)editable
{
  return self->_editable;
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

- (UIColor)typingTextColor
{
  return self->_typingTextColor;
}

- (void)setTypingTextColor:(id)a3
{
}

- (int64_t)hideLastAtomComma
{
  return self->_hideLastAtomComma;
}

- (void)setHideLastAtomComma:(int64_t)a3
{
  self->_hideLastAtomComma = a3;
}

- (_MFAtomTextAttachment)placeholderAttachment
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

- (void).cxx_destruct
{
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
  objc_storeStrong((id *)&self->_inactiveTextColor, 0);
  objc_storeStrong((id *)&self->_inactiveTextView, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end