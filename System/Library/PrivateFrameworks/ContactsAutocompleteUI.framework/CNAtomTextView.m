@interface CNAtomTextView
+ (Class)_backgroundViewClass;
+ (Class)_fieldEditorClass;
+ (id)defaultFont;
+ (id)defaultPlaceholderColor;
+ (id)defaultTextColor;
- (BOOL)_drawsDebugBaselines;
- (BOOL)_hasContent;
- (BOOL)_showViewWithMode:(int64_t)a3 alwaysDefinition:(BOOL)a4;
- (BOOL)_showsClearButton;
- (BOOL)_showsLeadingView;
- (BOOL)_showsPlaceholder;
- (BOOL)_showsTrailingView;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResignFirstResponder;
- (BOOL)hasContent;
- (BOOL)hasSelection;
- (BOOL)hasText;
- (BOOL)isFirstResponder;
- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)keyboardInputChanged:(id)a3;
- (BOOL)resignFirstResponder;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (CGPoint)_firstGlyphBaselineLeftPointWithLayoutManager:(id)a3;
- (CGRect)_rectForBounds:(CGRect)a3 sizingView:(id)a4 isLeft:(BOOL)a5;
- (CGRect)_usedRectWithLayoutManager:(id)a3 textContainer:(id)a4;
- (CGRect)_visibleAtomsRect;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)clearButtonFrameForBounds:(CGRect)a3;
- (CGRect)firstRectForRange:(id)a3;
- (CGRect)leadingViewFrameForBounds:(CGRect)a3;
- (CGRect)placeholderFrameForBounds:(CGRect)a3;
- (CGRect)trailingViewFrameForBounds:(CGRect)a3;
- (CGSize)_clearButtonSize;
- (CNAtomTextView)initWithFrame:(CGRect)a3;
- (CNAtomTextViewDelegate)delegate;
- (NSArray)representedObjects;
- (NSArray)selectedRepresentedObjects;
- (NSDirectionalEdgeInsets)clearButtonInsets;
- (NSDirectionalEdgeInsets)leadingViewInsets;
- (NSDirectionalEdgeInsets)placeholderInsets;
- (NSDirectionalEdgeInsets)textInsets;
- (NSDirectionalEdgeInsets)trailingViewInsets;
- (NSString)currentEditingString;
- (NSString)placeholder;
- (UIButton)clearButton;
- (UIColor)placeholderColor;
- (UIColor)textColor;
- (UIEdgeInsets)_edgeInsetsForDirectionalInsets:(NSDirectionalEdgeInsets)a3;
- (UIEdgeInsets)edgeInsets;
- (UIFont)font;
- (UILabel)placeholderLabel;
- (UIView)_systemBackgroundView;
- (UIView)leadingView;
- (UIView)trailingView;
- (_CNAtomFieldEditor)_fieldEditor;
- (_NSRange)_characterRangeForAtomView:(id)a3;
- (_NSRange)selectionRange;
- (id)_atomLayoutViewForRepresentedObject:(id)a3;
- (id)_attachmentAtCharacterIndex:(unint64_t)a3;
- (id)_baseAttributedStringWithRepresentedObject:(id)a3;
- (id)_clearButtonImageForState:(unint64_t)a3;
- (id)_representedObjectsFromPasteboard:(id)a3;
- (id)_representedObjectsInRange:(_NSRange)a3 ranges:(id *)a4;
- (id)_supportedPasteboardTypes;
- (id)baseAttributes;
- (id)baseAttributesWithRepresentedObject:(id)a3;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)currentEditingString:(_NSRange *)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)keyCommands;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)paragraphStyle;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (id)positionWithinRange:(id)a3 atCharacterOffset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5;
- (id)selectionRectsForRange:(id)a3;
- (id)textInRange:(id)a3;
- (id)textInputTraits;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)viewForLastBaselineLayout;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)clearButtonMode;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)leadingViewMode;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)trailingViewMode;
- (void)_clearButtonTapped:(id)a3;
- (void)_createBaselineLayoutStrutIfNecessary;
- (void)_deleteCharactersInStorage:(id)a3 ranges:(id)a4 rangeToAdjust:(_NSRange *)a5;
- (void)_insertRepresentedObjects:(id)a3 atCharacterRange:(_NSRange)a4;
- (void)_layoutButtons;
- (void)_layoutPlaceholder;
- (void)_removeRepresentedObjectsInCharacterRange:(_NSRange)a3;
- (void)_scrollToSelectionIfNeeded;
- (void)_setDrawsDebugBaselines:(BOOL)a3;
- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_storeRepresentedObjects:(id)a3 onPasteboard:(id)a4;
- (void)_tapRecognized:(id)a3;
- (void)_textStorageDidProcessEditing:(id)a3;
- (void)_updateAtomMasksInRect:(CGRect)a3;
- (void)_updateBaselineConstraintIfNecessaryUsingTextViewFrame:(CGRect)a3;
- (void)addRepresentedObject:(id)a3;
- (void)dealloc;
- (void)deleteBackward;
- (void)escKeyPressed:(id)a3;
- (void)insertRepresentedObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertText:(id)a3;
- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5;
- (void)layoutSubviews;
- (void)removeRepresentedObject:(id)a3;
- (void)removeRepresentedObjectAtIndex:(unint64_t)a3;
- (void)removeRepresentedObjects:(id)a3;
- (void)removeRepresentedObjectsAtIndexes:(id)a3;
- (void)replaceCurrentEditingStringWithRepresentedObject:(id)a3;
- (void)replaceCurrentEditingStringWithRepresentedObject:(id)a3 autoSelect:(BOOL)a4;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)selectAll;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setClearButtonInsets:(NSDirectionalEdgeInsets)a3;
- (void)setClearButtonMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setLeadingView:(id)a3;
- (void)setLeadingViewInsets:(NSDirectionalEdgeInsets)a3;
- (void)setLeadingViewMode:(int64_t)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setPlaceholder:(id)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setPlaceholderInsets:(NSDirectionalEdgeInsets)a3;
- (void)setRepresentedObjects:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextInsets:(NSDirectionalEdgeInsets)a3;
- (void)setTrailingView:(id)a3;
- (void)setTrailingViewInsets:(NSDirectionalEdgeInsets)a3;
- (void)setTrailingViewMode:(int64_t)a3;
- (void)takeTraitsFrom:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)unmarkText;
@end

@implementation CNAtomTextView

+ (Class)_fieldEditorClass
{
  return (Class)objc_opt_class();
}

+ (Class)_backgroundViewClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultFont
{
  return (id)[MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
}

+ (id)defaultTextColor
{
  return (id)[MEMORY[0x1E4F428B8] labelColor];
}

+ (id)defaultPlaceholderColor
{
  return (id)[MEMORY[0x1E4F428B8] secondaryLabelColor];
}

- (CNAtomTextView)initWithFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)CNAtomTextView;
  v3 = -[CNAtomTextView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CNAtomTextView *)v3 _setHostsLayoutEngine:1];
    uint64_t v5 = [(id)objc_opt_class() defaultFont];
    font = v4->_font;
    v4->_font = (UIFont *)v5;

    uint64_t v7 = [(id)objc_opt_class() defaultTextColor];
    textColor = v4->_textColor;
    v4->_textColor = (UIColor *)v7;

    uint64_t v9 = [(id)objc_opt_class() defaultPlaceholderColor];
    placeholderColor = v4->_placeholderColor;
    v4->_placeholderColor = (UIColor *)v9;

    id v11 = objc_alloc((Class)[(id)objc_opt_class() _backgroundViewClass]);
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v16 = objc_msgSend(v11, "initWithFrame:active:", 1, *MEMORY[0x1E4F1DB28], v13, v14, v15);
    background = v4->_background;
    v4->_background = (_UITextFieldRoundedRectBackgroundViewNeue *)v16;

    [(_UITextFieldRoundedRectBackgroundViewNeue *)v4->_background setAutoresizingMask:0];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42DB0]), "initWithFrame:", v12, v13, v14, v15);
    scrollView = v4->_scrollView;
    v4->_scrollView = (UIScrollView *)v18;

    [(UIScrollView *)v4->_scrollView setDelegate:v4];
    [(UIScrollView *)v4->_scrollView setScrollsToTop:0];
    [(UIScrollView *)v4->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v4->_scrollView setShowsVerticalScrollIndicator:0];
    uint64_t v20 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_fieldEditorClass")), "initWithFrame:textContainer:", 0, v12, v13, v14, v15);
    textView = v4->_textView;
    v4->_textView = (_CNAtomFieldEditor *)v20;

    [(_CNAtomFieldEditor *)v4->_textView setAutoresizingMask:0];
    [(_CNAtomFieldEditor *)v4->_textView setBackgroundColor:0];
    v22 = [(CNAtomTextView *)v4 font];
    [(_CNAtomFieldEditor *)v4->_textView setFont:v22];

    [(_CNAtomFieldEditor *)v4->_textView setScrollEnabled:0];
    [(_CNAtomFieldEditor *)v4->_textView setScrollsToTop:0];
    [(_CNAtomFieldEditor *)v4->_textView setTextAlignment:4];
    v23 = [(CNAtomTextView *)v4 baseAttributes];
    [(_CNAtomFieldEditor *)v4->_textView setTypingAttributes:v23];

    v24 = [(_CNAtomFieldEditor *)v4->_textView layoutManager];
    [v24 setAllowsNonContiguousLayout:1];

    [(_CNAtomFieldEditor *)v4->_textView setDelegate:v4];
    v25 = [(_CNAtomFieldEditor *)v4->_textView layoutManager];
    [v25 setDelegate:v4];

    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v27 = *MEMORY[0x1E4FB07F0];
    v28 = [(_CNAtomFieldEditor *)v4->_textView textStorage];
    [v26 addObserver:v4 selector:sel__textStorageDidProcessEditing_ name:v27 object:v28];

    if (v4->_background) {
      -[CNAtomTextView addSubview:](v4, "addSubview:");
    }
    [(CNAtomTextView *)v4 addSubview:v4->_scrollView];
    [(UIScrollView *)v4->_scrollView addSubview:v4->_textView];
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v4 action:sel__tapRecognized_];
    [v29 setCancelsTouchesInView:0];
    [(CNAtomTextView *)v4 addGestureRecognizer:v29];
    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    atomViews = v4->_atomViews;
    v4->_atomViews = v30;
  }
  return v4;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(UIScrollView *)self->_scrollView setDelegate:0];
  [(_CNAtomFieldEditor *)self->_textView setDelegate:0];
  v3 = [(_CNAtomFieldEditor *)self->_textView layoutManager];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)CNAtomTextView;
  [(CNAtomTextView *)&v4 dealloc];
}

- (_CNAtomFieldEditor)_fieldEditor
{
  return self->_textView;
}

- (UIView)_systemBackgroundView
{
  return (UIView *)self->_background;
}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_drawsDebugBaselines != a3)
  {
    BOOL v3 = a3;
    self->_drawsDebugBaselines = a3;
    -[_CNAtomFieldEditor _setDrawsDebugBaselines:](self->_textView, "_setDrawsDebugBaselines:");
    [(UILabel *)self->_placeholderLabel _setDrawsDebugBaselines:v3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = self->_atomViews;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "viewForLastBaselineLayout", (void)v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v10 _setDrawsDebugBaselines:v3];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    [(CNAtomTextView *)self setNeedsLayout];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 16;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v8;
  }
}

- (void)setFont:(id)a3
{
  objc_super v4 = (UIFont *)a3;
  if (!v4)
  {
    objc_super v4 = [(id)objc_opt_class() defaultFont];
  }
  p_font = &self->_font;
  if (self->_font != v4)
  {
    char v6 = v4;
    objc_storeStrong((id *)p_font, v4);
    [(_CNAtomFieldEditor *)self->_textView setFont:v6];
    [(UILabel *)self->_placeholderLabel setFont:v6];
    [(_CNAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setFont:v6];
    p_font = (UIFont **)[(CNAtomTextView *)self setNeedsLayout];
    objc_super v4 = v6;
  }

  MEMORY[0x1F41817F8](p_font, v4);
}

- (void)setTextColor:(id)a3
{
  objc_super v4 = (UIColor *)a3;
  if (!v4)
  {
    objc_super v4 = [(id)objc_opt_class() defaultTextColor];
  }
  if (self->_textColor != v4)
  {
    objc_storeStrong((id *)&self->_textColor, v4);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    char v8 = __31__CNAtomTextView_setTextColor___block_invoke;
    uint64_t v9 = &unk_1E61283C0;
    v10 = self;
    long long v11 = v4;
    char v5 = (void (**)(void))MEMORY[0x1BA9A6470](&v6);
    if (objc_msgSend(MEMORY[0x1E4F42FF0], "areAnimationsEnabled", v6, v7, v8, v9, v10)) {
      [MEMORY[0x1E4F42FF0] transitionWithView:self->_textView duration:5242880 options:v5 animations:0 completion:0.35];
    }
    else {
      v5[2](v5);
    }
  }
}

void __31__CNAtomTextView_setTextColor___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 488) setTextColor:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) baseAttributes];
  [*(id *)(*(void *)(a1 + 32) + 488) setTypingAttributes:v2];
}

- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CNAtomTextView;
  -[CNAtomTextView setEnabled:](&v17, sel_setEnabled_);
  [(_UITextFieldRoundedRectBackgroundViewNeue *)self->_background setEnabled:v5 animated:v4];
  uint64_t v7 = [(CNAtomTextView *)self clearButton];
  [v7 setEnabled:v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v8 = self->_atomViews;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "setEnabled:animated:", v5, v4, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)setEnabled:(BOOL)a3
{
}

- (id)paragraphStyle
{
  if (paragraphStyle_onceToken != -1) {
    dispatch_once(&paragraphStyle_onceToken, &__block_literal_global_3);
  }
  id v2 = (void *)paragraphStyle_sParagraphStyle;

  return v2;
}

void __32__CNAtomTextView_paragraphStyle__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v2 setLineBreakMode:2];
  uint64_t v0 = [v2 copy];
  v1 = (void *)paragraphStyle_sParagraphStyle;
  paragraphStyle_sParagraphStyle = v0;
}

- (id)baseAttributesWithRepresentedObject:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16[0] = *MEMORY[0x1E4FB06F8];
  BOOL v5 = [(CNAtomTextView *)self font];
  v17[0] = v5;
  v16[1] = *MEMORY[0x1E4FB0700];
  uint64_t v6 = [(CNAtomTextView *)self textColor];
  v17[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4FB0738];
  v16[2] = *MEMORY[0x1E4FB0738];
  char v8 = [(CNAtomTextView *)self paragraphStyle];
  v17[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v11 = [(CNAtomTextView *)self _atomLayoutViewForRepresentedObject:v4];
    uint64_t v12 = +[_CNAtomAttachment attachmentWithAtomLayoutView:v11 representedObject:v4];
    uint64_t v10 = (void *)[v9 mutableCopy];
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FB06B8]];
    if (objc_opt_respondsToSelector())
    {
      long long v13 = [v9 objectForKeyedSubscript:v7];
      long long v14 = (void *)[v13 mutableCopy];

      objc_msgSend(v14, "setBaseWritingDirection:", objc_msgSend(v11, "baseWritingDirection"));
      [v10 setObject:v14 forKeyedSubscript:v7];
    }
  }
  else
  {
    uint64_t v10 = v9;
  }

  return v10;
}

- (id)baseAttributes
{
  return [(CNAtomTextView *)self baseAttributesWithRepresentedObject:0];
}

- (id)_baseAttributedStringWithRepresentedObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNAtomTextView *)self baseAttributesWithRepresentedObject:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  char v8 = v7;
  if (isKindOfClass)
  {
    uint64_t v9 = (void *)[v7 initWithString:v4 attributes:v5];
  }
  else
  {
    __int16 v12 = -4;
    uint64_t v10 = [NSString stringWithCharacters:&v12 length:1];
    uint64_t v9 = (void *)[v8 initWithString:v10 attributes:v5];
  }

  return v9;
}

- (BOOL)_hasContent
{
  id v2 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_representedObjectsInRange:(_NSRange)a3 ranges:(id *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  char v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3010000000;
  v31[3] = &unk_1B5B44B83;
  long long v32 = xmmword_1B5B40C80;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __52__CNAtomTextView__representedObjectsInRange_ranges___block_invoke;
  v26[3] = &unk_1E6128688;
  v30 = v31;
  id v11 = v8;
  id v27 = v11;
  id v12 = v10;
  id v28 = v12;
  id v13 = v9;
  id v29 = v13;
  long long v14 = (void *)MEMORY[0x1BA9A6470](v26);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__CNAtomTextView__representedObjectsInRange_ranges___block_invoke_2;
  v21[3] = &unk_1E61286B0;
  long long v15 = v14;
  id v24 = v15;
  id v16 = v11;
  id v22 = v16;
  id v17 = v13;
  id v23 = v17;
  v25 = v31;
  objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v21);
  v15[2](v15);
  if (a4) {
    *a4 = v17;
  }
  uint64_t v18 = v23;
  id v19 = v16;

  _Block_object_dispose(v31, 8);

  return v19;
}

double __52__CNAtomTextView__representedObjectsInRange_ranges___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = *(void **)(a1 + 32);
    BOOL v3 = [*(id *)(a1 + 40) string];
    id v4 = objc_msgSend(v3, "substringWithRange:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    [v2 addObject:v4];

    BOOL v5 = *(void **)(a1 + 48);
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    [v5 addObject:v6];

    double result = NAN;
    *(_OWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = xmmword_1B5B40C80;
  }
  return result;
}

void __52__CNAtomTextView__representedObjectsInRange_ranges___block_invoke_2(void *a1, void *a2, NSUInteger location, NSUInteger length)
{
  id v16 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void))(a1[6] + 16))();
    id v7 = (void *)a1[4];
    char v8 = [v16 representedObject];
    [v7 addObject:v8];

    uint64_t v9 = (void *)a1[5];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
    [v9 addObject:v10];
  }
  else
  {
    id v11 = v16;
    if (v16) {
      goto LABEL_10;
    }
    uint64_t v12 = *(void *)(a1[7] + 8);
    v13.NSUInteger location = *(void *)(v12 + 32);
    if (v13.location == 0x7FFFFFFFFFFFFFFFLL
      || (v13.NSUInteger length = *(void *)(v12 + 40), v13.length + v13.location != location))
    {
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      v18.NSUInteger location = location;
      v18.NSUInteger length = length;
      NSRange v14 = NSUnionRange(v13, v18);
      NSUInteger location = v14.location;
      NSUInteger length = v14.length;
    }
    uint64_t v15 = *(void *)(a1[7] + 8);
    *(void *)(v15 + 32) = location;
    *(void *)(v15 + 40) = length;
  }
  id v11 = v16;
LABEL_10:
}

- (id)currentEditingString:(_NSRange *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = (_NSRange)xmmword_1B5B40C80;
  }
  BOOL v5 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  uint64_t v6 = [(_CNAtomFieldEditor *)self->_textView selectedRange];
  uint64_t v8 = v7;
  id v32 = 0;
  uint64_t v9 = -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v5 length], &v32);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v32;
  id v11 = (char *)[v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    v26 = v5;
    id v27 = v9;
    uint64_t v12 = 0;
    unint64_t v13 = v6 + v8;
    uint64_t v14 = *(void *)v29;
    while (2)
    {
      uint64_t v15 = 0;
      id v16 = &v11[(void)v12];
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v10);
        }
        unint64_t v17 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * (void)v15), "rangeValue", v26);
        if (v13 - v17 < v18 && v13 >= v17 || v13 == v17 + v18)
        {
          NSUInteger v21 = v17;
          NSUInteger v22 = v18;
          uint64_t v9 = v27;
          id v23 = [v27 objectAtIndexedSubscript:&v15[(void)v12]];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v11 = [v27 objectAtIndexedSubscript:&v15[(void)v12]];
            BOOL v5 = v26;
            if (a3)
            {
              a3->NSUInteger location = v21;
              a3->NSUInteger length = v22;
            }
          }
          else
          {
            id v11 = 0;
            BOOL v5 = v26;
          }
          goto LABEL_22;
        }
        ++v15;
      }
      while (v11 != v15);
      id v11 = (char *)[v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      uint64_t v12 = v16;
      if (v11) {
        continue;
      }
      break;
    }
    BOOL v5 = v26;
    uint64_t v9 = v27;
  }
LABEL_22:

  return v11;
}

- (NSString)currentEditingString
{
  return (NSString *)[(CNAtomTextView *)self currentEditingString:0];
}

- (NSArray)representedObjects
{
  BOOL v3 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  id v4 = -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v3 length], 0);

  return (NSArray *)v4;
}

- (NSArray)selectedRepresentedObjects
{
  uint64_t v4 = [(_CNAtomFieldEditor *)self->_textView selectedRange];

  return (NSArray *)-[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", v4, v3, 0);
}

- (void)insertRepresentedObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  [v7 beginEditing];
  id v14 = 0;
  -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v7 length], &v14);
  uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
  id v9 = v14;

  if (v8)
  {
    id v10 = [v9 objectAtIndexedSubscript:a4];
    uint64_t v11 = [v10 rangeValue];

    uint64_t v12 = [(CNAtomTextView *)self _baseAttributedStringWithRepresentedObject:v6];
    [v7 insertAttributedString:v12 atIndex:v11];
    uint64_t v8 = (char *)[v12 length];
  }
  else
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v7 endEditing];
  if (v8)
  {
    unint64_t v13 = [(_CNAtomFieldEditor *)self->_textView layoutManager];
    objc_msgSend(v13, "invalidateLayoutForCharacterRange:actualCharacterRange:", v11, v8, 0);
  }
  [(CNAtomTextView *)self setNeedsLayout];
  [(CNAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", &v8[v11], 0);
}

- (void)_deleteCharactersInStorage:(id)a3 ranges:(id)a4 rangeToAdjust:(_NSRange *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = objc_msgSend(a4, "reverseObjectEnumerator", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        NSUInteger v13 = [*(id *)(*((void *)&v20 + 1) + 8 * v12) rangeValue];
        unint64_t v15 = v14;
        objc_msgSend(v7, "deleteCharactersInRange:", v13, v14);
        NSUInteger location = a5->location;
        NSUInteger length = a5->length;
        if (v13 < length + a5->location)
        {
          if (location >= v13 + v15)
          {
            a5->NSUInteger location = location - v15;
          }
          else
          {
            if (v13 <= location)
            {
              NSUInteger v19 = location - (v13 + v15) + length;
              a5->NSUInteger location = v13;
            }
            else
            {
              BOOL v18 = length >= v15;
              NSUInteger v19 = length - v15;
              if (!v18) {
                NSUInteger v19 = 0;
              }
            }
            a5->NSUInteger length = v19;
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (void)removeRepresentedObjectsAtIndexes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  [v5 beginEditing];
  uint64_t v11 = [(_CNAtomFieldEditor *)self->_textView selectedRange];
  uint64_t v12 = v6;
  id v10 = 0;
  id v7 = -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v5 length], &v10);
  id v8 = v10;

  if (v7)
  {
    uint64_t v9 = [v8 objectsAtIndexes:v4];
    [(CNAtomTextView *)self _deleteCharactersInStorage:v5 ranges:v9 rangeToAdjust:&v11];
  }
  [v5 endEditing];
  [(CNAtomTextView *)self setNeedsLayout];
  [(CNAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v11, v12);
}

- (void)removeRepresentedObjects:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  [v5 beginEditing];
  uint64_t v18 = [(_CNAtomFieldEditor *)self->_textView selectedRange];
  uint64_t v19 = v6;
  id v17 = 0;
  id v7 = -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v5 length], &v17);
  id v8 = v17;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __43__CNAtomTextView_removeRepresentedObjects___block_invoke;
  unint64_t v15 = &unk_1E61286D8;
  id v16 = v4;
  id v9 = v4;
  id v10 = [v7 indexesOfObjectsPassingTest:&v12];
  uint64_t v11 = objc_msgSend(v8, "objectsAtIndexes:", v10, v12, v13, v14, v15);
  [(CNAtomTextView *)self _deleteCharactersInStorage:v5 ranges:v11 rangeToAdjust:&v18];

  [v5 endEditing];
  [(CNAtomTextView *)self setNeedsLayout];
  [(CNAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v18, v19);
}

uint64_t __43__CNAtomTextView_removeRepresentedObjects___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)removeRepresentedObjectAtIndex:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  [(CNAtomTextView *)self removeRepresentedObjectsAtIndexes:v4];
}

- (void)removeRepresentedObject:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

    -[CNAtomTextView removeRepresentedObjects:](self, "removeRepresentedObjects:", v6, v7, v8);
  }
}

- (void)setRepresentedObjects:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  [v5 beginEditing];
  objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v5, "length"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[CNAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        [v5 appendAttributedString:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [v5 endEditing];
  uint64_t v12 = [(_CNAtomFieldEditor *)self->_textView layoutManager];
  objc_msgSend(v12, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v5, "length"), 0);

  [(CNAtomTextView *)self setNeedsLayout];
  [(CNAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", [v5 length], 0);
}

- (void)addRepresentedObject:(id)a3
{
  textView = self->_textView;
  id v5 = a3;
  id v10 = [(_CNAtomFieldEditor *)textView textStorage];
  [v10 beginEditing];
  id v6 = [(CNAtomTextView *)self _baseAttributedStringWithRepresentedObject:v5];

  uint64_t v7 = [v10 length];
  uint64_t v8 = [v6 length];
  [v10 appendAttributedString:v6];
  [v10 endEditing];
  if (v8)
  {
    uint64_t v9 = [(_CNAtomFieldEditor *)self->_textView layoutManager];
    objc_msgSend(v9, "invalidateLayoutForCharacterRange:actualCharacterRange:", v7, v8, 0);
  }
  [(CNAtomTextView *)self setNeedsLayout];
  [(CNAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", [v10 length], 0);
}

- (void)replaceCurrentEditingStringWithRepresentedObject:(id)a3
{
}

- (void)replaceCurrentEditingStringWithRepresentedObject:(id)a3 autoSelect:(BOOL)a4
{
  BOOL v4 = a4;
  textView = self->_textView;
  id v7 = a3;
  uint64_t v8 = [(_CNAtomFieldEditor *)textView textStorage];
  [v8 beginEditing];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v9 = [(CNAtomTextView *)self currentEditingString:&v16];
  id v10 = [(CNAtomTextView *)self _baseAttributedStringWithRepresentedObject:v7];

  if (!v9 || v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = [v8 length];
    uint64_t v17 = 0;
    [v8 appendAttributedString:v10];
  }
  else
  {
    objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v16, v17, v10);
  }
  [v8 endEditing];
  uint64_t v11 = v16;
  uint64_t v12 = [v10 length];
  if (v12)
  {
    long long v13 = [(_CNAtomFieldEditor *)self->_textView layoutManager];
    objc_msgSend(v13, "invalidateLayoutForCharacterRange:actualCharacterRange:", v11, v12, 0);
  }
  [(CNAtomTextView *)self setNeedsLayout];
  [(CNAtomTextView *)self sendActionsForControlEvents:0x20000];
  uint64_t v14 = v12 + v11;
  if (v4)
  {
    [(CNAtomTextView *)self becomeFirstResponder];
    --v14;
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v15 = 0;
  }
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v14, v15);
}

- (id)_atomLayoutViewForRepresentedObject:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v7 = [WeakRetained atomTextView:self atomViewForRepresentedObject:v5];

  objc_msgSend(v7, "setEnabled:", -[CNAtomTextView isEnabled](self, "isEnabled"));
  uint64_t v8 = [v7 viewForLastBaselineLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v8, "_setDrawsDebugBaselines:", -[CNAtomTextView _drawsDebugBaselines](self, "_drawsDebugBaselines"));
  }
  uint64_t v9 = +[_CNAtomLayoutView layoutViewWithDelegateView:v7];

  return v9;
}

- (id)_supportedPasteboardTypes
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v2 = [WeakRetained supportedPasteboardTypesForAtomTextView:self];
  }
  else
  {
    id v2 = 0;
  }
  if ([v2 count]) {
    id v5 = v2;
  }
  else {
    id v5 = (void *)*MEMORY[0x1E4F43C18];
  }
  id v6 = v5;

  return v6;
}

- (id)_representedObjectsFromPasteboard:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 4) == 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        [WeakRetained atomTextView:self representedObjectsFromPasteboard:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        WeakRetained,
        !v6))
  {
    uint64_t v7 = [v4 string];
    uint64_t v8 = (void *)v7;
    if (v7)
    {
      v10[0] = v7;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v6;
}

- (void)_storeRepresentedObjects:(id)a3 onPasteboard:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((*(unsigned char *)&self->_flags & 8) == 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        char v9 = [WeakRetained atomTextView:self storeRepresentedObjects:v6 onPasteboard:v7],
        WeakRetained,
        (v9 & 1) == 0))
  {
    uint64_t v18 = v7;
    id v10 = [MEMORY[0x1E4F28E78] string];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v10 length]) {
              uint64_t v17 = @" ";
            }
            else {
              uint64_t v17 = &stru_1F0EC0C28;
            }
            [v10 appendFormat:@"%@%@", v17, v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    id v7 = v18;
    [v18 setString:v10];
  }
}

- (void)_insertRepresentedObjects:(id)a3 atCharacterRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v58[1] = *MEMORY[0x1E4F143B8];
  _NSRange v55 = a4;
  id v7 = a3;
  uint64_t v8 = 488;
  char v9 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  [v9 beginEditing];
  if (length)
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
    v58[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
    [(CNAtomTextView *)self _deleteCharactersInStorage:v9 ranges:v11 rangeToAdjust:&v55];
  }
  uint64_t v12 = [v7 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v45 = self;
  if ((isKindOfClass & 1) == 0)
  {
    id v54 = 0;
    uint64_t v14 = -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v9 length], &v54);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v15 = v54;
    uint64_t v16 = (char *)[v15 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v16)
    {
      v43 = v9;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v51;
      do
      {
        long long v19 = 0;
        long long v20 = &v16[(void)v17];
        do
        {
          if (*(void *)v51 != v18) {
            objc_enumerationMutation(v15);
          }
          NSUInteger v21 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * (void)v19), "rangeValue", v43);
          if (v55.location >= v21 && v55.location - v21 < v22)
          {
            long long v20 = &v19[(void)v17];
            uint64_t v16 = [v14 objectAtIndexedSubscript:&v19[(void)v17]];
            goto LABEL_16;
          }
          ++v19;
        }
        while (v16 != v19);
        uint64_t v16 = (char *)[v15 countByEnumeratingWithState:&v50 objects:v57 count:16];
        uint64_t v17 = v20;
      }
      while (v16);
LABEL_16:
      char v9 = v43;
    }
    else
    {
      long long v20 = 0;
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 objectAtIndexedSubscript:v20];
      v25 = uint64_t v24 = v9;
      uint64_t v26 = [v25 rangeValue];
      uint64_t v28 = v27;

      char v9 = v24;
      if (v55.location != v26)
      {
        v55.NSUInteger location = v26 + v28;
        v55.NSUInteger length = 0;
      }
    }

    self = v45;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v29 = v7;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v44 = 488;
    NSUInteger v32 = 0;
    uint64_t v33 = *(void *)v47;
    NSUInteger v34 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v29);
        }
        v36 = -[CNAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", *(void *)(*((void *)&v46 + 1) + 8 * i), v44);
        v37 = v9;
        [v9 insertAttributedString:v36 atIndex:v55.location];
        NSUInteger v38 = v55.location;
        uint64_t v39 = [v36 length];
        NSUInteger v40 = v39;
        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v34 = v38;
          NSUInteger v32 = v39;
        }
        else
        {
          v59.NSUInteger location = v38;
          v59.NSUInteger length = v40;
          v60.NSUInteger location = v34;
          v60.NSUInteger length = v32;
          NSRange v41 = NSUnionRange(v59, v60);
          NSUInteger v34 = v41.location;
          NSUInteger v32 = v41.length;
        }
        v55.NSUInteger location = v40 + v38;
        v55.NSUInteger length = 0;

        self = v45;
        char v9 = v37;
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v31);

    [v37 endEditing];
    uint64_t v8 = v44;
    if (v32)
    {
      v42 = [*(id *)((char *)&v45->super.super.super.super.isa + v44) layoutManager];
      objc_msgSend(v42, "invalidateLayoutForCharacterRange:actualCharacterRange:", v34, v32, 0);
    }
  }
  else
  {

    [v9 endEditing];
  }
  [(CNAtomTextView *)self setNeedsLayout];
  [(CNAtomTextView *)self sendActionsForControlEvents:0x20000];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v8), "setSelectedRange:", v55.location, v55.length);
}

- (void)_removeRepresentedObjectsInCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  [v6 beginEditing];
  uint64_t v10 = [(_CNAtomFieldEditor *)self->_textView selectedRange];
  uint64_t v11 = v7;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
  v12[0] = v8;
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(CNAtomTextView *)self _deleteCharactersInStorage:v6 ranges:v9 rangeToAdjust:&v10];

  [v6 endEditing];
  [(CNAtomTextView *)self setNeedsLayout];
  [(CNAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v10, v11);
}

- (UIEdgeInsets)_edgeInsetsForDirectionalInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  double leading = a3.leading;
  CGFloat top = a3.top;
  int v7 = [(CNAtomTextView *)self _shouldReverseLayoutDirection];
  if (v7) {
    double v8 = trailing;
  }
  else {
    double v8 = leading;
  }
  if (v7) {
    double v9 = leading;
  }
  else {
    double v9 = trailing;
  }
  double v10 = top;
  double v11 = bottom;
  result.right = v9;
  result.CGFloat bottom = v11;
  result.left = v8;
  result.CGFloat top = v10;
  return result;
}

- (CGRect)_visibleAtomsRect
{
  [(UIScrollView *)self->_scrollView bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self->_scrollView contentInset];
  scrollView = self->_scrollView;

  -[CNAtomTextView convertRect:fromView:](self, "convertRect:fromView:", scrollView, v4 + v12, v6 + v11, v8 - (v12 + v14), v10 - (v11 + v13));
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_clearButtonImageForState:(unint64_t)a3
{
  double v6 = [MEMORY[0x1E4F42A80] kitImageNamed:@"UITextFieldClearButton"];
  double v7 = [(CNAtomTextView *)self tintColor];
  if (!v7
    || ([MEMORY[0x1E4F428B8] systemBlueColor],
        double v3 = objc_claimAutoreleasedReturnValue(),
        ([v7 isEqual:v3] & 1) != 0))
  {
    id v8 = [MEMORY[0x1E4F428B8] colorWithRed:0.047 green:0.455 blue:0.867 alpha:1.0];
    if (!v7) {
      goto LABEL_6;
    }
  }
  else
  {
    id v8 = v7;
  }

LABEL_6:
  if (a3 == 1)
  {
    id v10 = v8;
  }
  else
  {
    if (a3 == 2) {
      double v9 = 0.1;
    }
    else {
      double v9 = 0.275;
    }
    id v10 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:v9];
  }
  double v11 = v10;
  double v12 = (void *)MEMORY[0x1E4F42A80];
  [v6 size];
  double v13 = objc_msgSend(v12, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v11, 0, v6, 0);

  return v13;
}

- (UIButton)clearButton
{
  clearButton = self->_clearButton;
  if (!clearButton)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F427E0]);
    double v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->_clearButton;
    self->_clearButton = v5;

    [(UIButton *)self->_clearButton addTarget:self action:sel__clearButtonTapped_ forControlEvents:64];
    double v7 = self->_clearButton;
    id v8 = [(CNAtomTextView *)self _clearButtonImageForState:0];
    [(UIButton *)v7 setImage:v8 forState:0];

    double v9 = self->_clearButton;
    id v10 = [(CNAtomTextView *)self _clearButtonImageForState:1];
    [(UIButton *)v9 setImage:v10 forState:1];

    double v11 = self->_clearButton;
    double v12 = [(CNAtomTextView *)self _clearButtonImageForState:2];
    [(UIButton *)v11 setImage:v12 forState:2];

    [(UIButton *)self->_clearButton setOpaque:0];
    [(UIButton *)self->_clearButton setBackgroundColor:0];
    -[UIButton _setTouchInsets:](self->_clearButton, "_setTouchInsets:", -12.5, -12.5, -12.5, -12.5);
    clearButton = self->_clearButton;
  }

  return clearButton;
}

- (CGSize)_clearButtonSize
{
  double v2 = 19.0;
  double v3 = 19.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)clearButtonFrameForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = (CGFloat *)MEMORY[0x1E4F1DB28];
  CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [(CNAtomTextView *)self _clearButtonSize];
  double v10 = v9;
  double v12 = v11;
  [(UIView *)self cnaui_currentScreenScale];
  if ([(CNAtomTextView *)self _shouldReverseLayoutDirection])
  {
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    CGRectGetMinX(v31);
  }
  else
  {
    CGFloat v29 = v10;
    double v13 = v12;
    CGFloat v14 = *v8;
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGRectGetMaxX(v32);
    v33.origin.CGFloat x = v14;
    double v12 = v13;
    double v10 = v29;
    v33.origin.CGFloat y = rect;
    v33.size.CGFloat width = v29;
    v33.size.CGFloat height = v12;
    CGRectGetWidth(v33);
  }
  UIRoundToViewScale();
  double v16 = v15;
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRectGetMidY(v34);
  v35.origin.CGFloat x = v16;
  v35.origin.CGFloat y = rect;
  v35.size.CGFloat width = v10;
  v35.size.CGFloat height = v12;
  CGRectGetHeight(v35);
  UIRoundToViewScale();
  double v18 = v17;
  [(CNAtomTextView *)self clearButtonInsets];
  -[CNAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
  double v20 = v18 + v19;
  double v23 = v10 - (v21 + v22);
  double v25 = v12 - (v19 + v24);
  double v26 = v16 + v21;
  double v27 = v20;
  double v28 = v23;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (CGRect)_rectForBounds:(CGRect)a3 sizingView:(id)a4 isLeft:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v10 = (CGFloat *)MEMORY[0x1E4F1DB28];
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  objc_msgSend(a4, "systemLayoutSizeFittingSize:", a3.size.width, a3.size.height);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  if (v5)
  {
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRectGetMinX(v25);
  }
  else
  {
    CGFloat v24 = v11;
    CGFloat v16 = *v10;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    CGRectGetMaxX(v26);
    v27.origin.CGFloat x = v16;
    CGFloat v11 = v24;
    v27.origin.CGFloat y = v24;
    v27.size.CGFloat width = v13;
    v27.size.CGFloat height = v15;
    CGRectGetWidth(v27);
  }
  UIRoundToViewScale();
  CGFloat v18 = v17;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGRectGetMidY(v28);
  v29.origin.CGFloat x = v18;
  v29.origin.CGFloat y = v11;
  v29.size.CGFloat width = v13;
  v29.size.CGFloat height = v15;
  CGRectGetHeight(v29);
  UIRoundToViewScale();
  double v20 = v19;
  double v21 = v18;
  double v22 = v13;
  double v23 = v15;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)leadingViewFrameForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(CNAtomTextView *)self _shouldReverseLayoutDirection] ^ 1;
  double v9 = [(CNAtomTextView *)self leadingView];
  -[CNAtomTextView _rectForBounds:sizingView:isLeft:](self, "_rectForBounds:sizingView:isLeft:", v9, v8, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  [(CNAtomTextView *)self leadingViewInsets];
  -[CNAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
  double v19 = v13 + v18;
  double v22 = v15 - (v20 + v21);
  double v24 = v17 - (v18 + v23);
  double v25 = v11 + v20;
  double v26 = v19;
  double v27 = v22;
  result.size.double height = v24;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGRect)trailingViewFrameForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(CNAtomTextView *)self trailingView];
  -[CNAtomTextView _rectForBounds:sizingView:isLeft:](self, "_rectForBounds:sizingView:isLeft:", v8, [(CNAtomTextView *)self _shouldReverseLayoutDirection], x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  [(CNAtomTextView *)self trailingViewInsets];
  -[CNAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
  double v18 = v12 + v17;
  double v21 = v14 - (v19 + v20);
  double v23 = v16 - (v17 + v22);
  double v24 = v10 + v19;
  double v25 = v18;
  double v26 = v21;
  result.size.double height = v23;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (BOOL)_showViewWithMode:(int64_t)a3 alwaysDefinition:(BOOL)a4
{
  BOOL v7 = [(CNAtomTextView *)self isFirstResponder];
  BOOL v8 = v7 & [(CNAtomTextView *)self _hasContent];
  BOOL v9 = !v8;
  BOOL v10 = a3 == 3 && a4;
  if (a3 != 2) {
    BOOL v9 = v10;
  }
  if (a3 == 1) {
    return v8;
  }
  else {
    return v9;
  }
}

- (BOOL)_showsClearButton
{
  int64_t v3 = [(CNAtomTextView *)self clearButtonMode];
  BOOL v4 = [(CNAtomTextView *)self _hasContent];

  return [(CNAtomTextView *)self _showViewWithMode:v3 alwaysDefinition:v4];
}

- (BOOL)_showsLeadingView
{
  int64_t v3 = [(CNAtomTextView *)self leadingView];
  if (v3) {
    BOOL v4 = [(CNAtomTextView *)self _showViewWithMode:[(CNAtomTextView *)self leadingViewMode] alwaysDefinition:1];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_showsTrailingView
{
  int64_t v3 = [(CNAtomTextView *)self trailingView];
  BOOL v4 = v3
    && ![(CNAtomTextView *)self _showsClearButton]
    && [(CNAtomTextView *)self _showViewWithMode:[(CNAtomTextView *)self trailingViewMode] alwaysDefinition:1];

  return v4;
}

- (void)_layoutButtons
{
  [(CNAtomTextView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CNAtomTextView *)self _showsClearButton])
  {
    double v11 = [(CNAtomTextView *)self clearButton];
    -[CNAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v11, "setFrame:");
    [(CNAtomTextView *)self addSubview:v11];
  }
  else
  {
    clearButton = self->_clearButton;
    if (clearButton) {
      [(UIButton *)clearButton removeFromSuperview];
    }
  }
  if ([(CNAtomTextView *)self _showsLeadingView])
  {
    double v13 = [(CNAtomTextView *)self leadingView];
    -[CNAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v13, "setFrame:");
    [(CNAtomTextView *)self addSubview:v13];
  }
  else
  {
    leadingView = self->_leadingView;
    if (leadingView) {
      [(UIView *)leadingView removeFromSuperview];
    }
  }
  if ([(CNAtomTextView *)self _showsTrailingView])
  {
    id v16 = [(CNAtomTextView *)self trailingView];
    -[CNAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v16, "setFrame:");
    [(CNAtomTextView *)self addSubview:v16];
  }
  else
  {
    trailingView = self->_trailingView;
    if (trailingView)
    {
      [(UIView *)trailingView removeFromSuperview];
    }
  }
}

- (void)setPlaceholderColor:(id)a3
{
  double v4 = (UIColor *)a3;
  if (!v4)
  {
    double v4 = [(id)objc_opt_class() defaultPlaceholderColor];
  }
  if (self->_placeholderColor != v4)
  {
    objc_storeStrong((id *)&self->_placeholderColor, v4);
    if (self->_placeholderLabel)
    {
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      double v8 = __38__CNAtomTextView_setPlaceholderColor___block_invoke;
      double v9 = &unk_1E61283C0;
      double v10 = self;
      double v11 = v4;
      double v5 = (void (**)(void))MEMORY[0x1BA9A6470](&v6);
      if (objc_msgSend(MEMORY[0x1E4F42FF0], "areAnimationsEnabled", v6, v7, v8, v9, v10)) {
        [MEMORY[0x1E4F42FF0] transitionWithView:self->_placeholderLabel duration:5242880 options:v5 animations:0 completion:0.35];
      }
      else {
        v5[2](v5);
      }
    }
  }
}

uint64_t __38__CNAtomTextView_setPlaceholderColor___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setTextColor:*(void *)(a1 + 40)];
}

- (UILabel)placeholderLabel
{
  placeholderLabel = self->_placeholderLabel;
  if (!placeholderLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_placeholderLabel;
    self->_placeholderLabel = v5;

    [(UILabel *)self->_placeholderLabel _setDrawsDebugBaselines:[(CNAtomTextView *)self _drawsDebugBaselines]];
    uint64_t v7 = [(CNAtomTextView *)self font];
    [(UILabel *)self->_placeholderLabel setFont:v7];

    double v8 = [(CNAtomTextView *)self placeholderColor];
    [(UILabel *)self->_placeholderLabel setTextColor:v8];

    double v9 = [(CNAtomTextView *)self placeholder];
    [(UILabel *)self->_placeholderLabel setText:v9];

    placeholderLabel = self->_placeholderLabel;
  }

  return placeholderLabel;
}

- (void)setPlaceholder:(id)a3
{
  if (self->_placeholder != a3)
  {
    id v4 = (NSString *)[a3 copy];
    placeholder = self->_placeholder;
    self->_placeholder = v4;

    [(UILabel *)self->_placeholderLabel setText:self->_placeholder];
    [(CNAtomTextView *)self setNeedsLayout];
  }
}

- (CGRect)placeholderFrameForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UILabel sizeThatFits:](self->_placeholderLabel, "sizeThatFits:", a3.size.width, a3.size.height);
  [(UIView *)self cnaui_currentScreenScale];
  uint64_t v38 = v8;
  UIRectCenteredYInRectScale();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  char v17 = [(CNAtomTextView *)self _shouldReverseLayoutDirection];
  BOOL v18 = [(CNAtomTextView *)self _showsLeadingView];
  BOOL v19 = [(CNAtomTextView *)self _showsTrailingView];
  BOOL v20 = [(CNAtomTextView *)self _showsClearButton];
  int v21 = v19 || v20;
  double v39 = v16;
  if ((v17 & 1) == 0 && v18)
  {
    -[CNAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", x, y, width, height);
    double v23 = v22 + 16.0;
    double v24 = v14 - (v22 + 16.0);
    if ((v21 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  if ((v17 & 1) == 0)
  {
    double v24 = v14 + -8.0;
    double v23 = 8.0;
    if (v21)
    {
LABEL_10:
      if (v20) {
        -[CNAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", x, y, width, height);
      }
      else {
        -[CNAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", x, y, width, height);
      }
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  if (v21)
  {
    if (v20) {
      -[CNAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", x, y, width, height);
    }
    else {
      -[CNAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", x, y, width, height);
    }
    double v23 = v25 + 16.0;
    double v24 = v14 - (v25 + 16.0);
    if (!v18) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  double v24 = v14 + -8.0;
  double v23 = 8.0;
  if (!v18)
  {
LABEL_18:
    double v27 = v24 + -8.0;
    goto LABEL_19;
  }
LABEL_14:
  -[CNAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", x, y, width, height);
LABEL_15:
  double v27 = v24 - (v26 + 16.0);
LABEL_19:
  [(CNAtomTextView *)self placeholderInsets];
  -[CNAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
  double v29 = v12 + v28;
  double v32 = v27 - (v30 + v31);
  double v34 = v39 - (v28 + v33);
  double v35 = v10 + v23 + v30;
  double v36 = v29;
  double v37 = v32;
  result.size.double height = v34;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

- (BOOL)_showsPlaceholder
{
  return ![(CNAtomTextView *)self _hasContent];
}

- (void)_layoutPlaceholder
{
  if ([(CNAtomTextView *)self _showsPlaceholder])
  {
    id v4 = [(CNAtomTextView *)self placeholderLabel];
    [(CNAtomTextView *)self bounds];
    -[CNAtomTextView placeholderFrameForBounds:](self, "placeholderFrameForBounds:");
    objc_msgSend(v4, "setFrame:");
    [(CNAtomTextView *)self addSubview:v4];
  }
  else
  {
    placeholderLabel = self->_placeholderLabel;
    if (placeholderLabel)
    {
      [(UILabel *)placeholderLabel removeFromSuperview];
    }
  }
}

- (UIEdgeInsets)edgeInsets
{
  uint64_t v29 = 0;
  double v30 = (double *)&v29;
  uint64_t v31 = 0x4010000000;
  double v32 = &unk_1B5B44B83;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  long long v33 = *MEMORY[0x1E4F437F8];
  long long v34 = v3;
  [(CNAtomTextView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(CNAtomTextView *)self _shouldReverseLayoutDirection];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __28__CNAtomTextView_edgeInsets__block_invoke;
  v28[3] = &unk_1E6128700;
  v28[4] = &v29;
  *(double *)&v28[5] = v5;
  *(double *)&v28[6] = v7;
  *(double *)&v28[7] = v9;
  *(double *)&v28[8] = v11;
  double v13 = (void (**)(void, void))MEMORY[0x1BA9A6470](v28);
  if ([(CNAtomTextView *)self _showsClearButton])
  {
    -[CNAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12);
    uint64_t v14 = 7;
    if (v12) {
      uint64_t v14 = 5;
    }
    v30[v14] = v30[v14] + 7.0;
  }
  if ([(CNAtomTextView *)self _showsLeadingView])
  {
    -[CNAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12 ^ 1);
  }
  if ([(CNAtomTextView *)self _showsTrailingView])
  {
    -[CNAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12);
  }
  [(CNAtomTextView *)self textInsets];
  -[CNAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
  UIEdgeInsetsAdd();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = v30;
  v30[4] = v15;
  v23[5] = v17;
  v23[6] = v19;
  v23[7] = v21;

  _Block_object_dispose(&v29, 8);
  double v24 = v16;
  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  result.right = v27;
  result.CGFloat bottom = v26;
  result.left = v25;
  result.CGFloat top = v24;
  return result;
}

double __28__CNAtomTextView_edgeInsets__block_invoke(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  if (a2)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&a3);
    uint64_t v12 = (double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    double v13 = CGRectGetMaxX(*(CGRect *)(a1 + 40));
    v15.origin.double x = a3;
    v15.origin.double y = a4;
    v15.size.double width = a5;
    v15.size.double height = a6;
    double MaxX = v13 - CGRectGetMinX(v15);
    uint64_t v12 = (double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
  }
  double result = MaxX + *v12;
  *uint64_t v12 = result;
  return result;
}

- (void)layoutSubviews
{
  [(CNAtomTextView *)self _layoutPlaceholder];
  [(CNAtomTextView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CNAtomTextView *)self edgeInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  -[_UITextFieldRoundedRectBackgroundViewNeue setFrame:](self->_background, "setFrame:", v4, v6, v8, v10);
  CGFloat v19 = v4 + v14;
  CGFloat v20 = v6 + v12;
  CGFloat v21 = v8 - (v14 + v18);
  CGFloat v22 = v10 - (v12 + v16);
  CGFloat v23 = v19;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v19, v6 + v12, v21, v22);
  CGFloat v24 = *MEMORY[0x1E4F1DB28];
  CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  *(unsigned char *)&self->_flags |= 0x20u;
  v39.origin.double x = v23;
  v39.origin.double y = v20;
  v39.size.double width = v21;
  v39.size.double height = v22;
  -[_CNAtomFieldEditor sizeThatFits:](self->_textView, "sizeThatFits:", 1.79769313e308, CGRectGetHeight(v39));
  v40.size.double width = v26;
  v40.size.double height = v27;
  *(unsigned char *)&self->_flags &= ~0x20u;
  v40.origin.double x = v24;
  v40.origin.double y = v25;
  CGRectGetWidth(v40);
  v41.origin.double x = v23;
  v41.origin.double y = v20;
  v41.size.double width = v21;
  v41.size.double height = v22;
  CGRectGetWidth(v41);
  [(UILabel *)self->_placeholderLabel bounds];
  CGRectGetHeight(v42);
  [(UIView *)self cnaui_currentScreenScale];
  uint64_t v37 = v28;
  UIRectCenteredYInRectScale();
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  [(_CNAtomFieldEditor *)self->_textView frame];
  v44.origin.double x = v30;
  v44.origin.double y = v32;
  v44.size.double width = v34;
  v44.size.double height = v36;
  if (!CGRectEqualToRect(v43, v44)) {
    -[_CNAtomFieldEditor setFrame:](self->_textView, "setFrame:", v30, v32, v34, v36);
  }
  [(CNAtomTextView *)self _layoutButtons];
  -[CNAtomTextView _updateBaselineConstraintIfNecessaryUsingTextViewFrame:](self, "_updateBaselineConstraintIfNecessaryUsingTextViewFrame:", v30, v32, v34, v36);

  [(CNAtomTextView *)self _scrollToSelectionIfNeeded];
}

- (void)setTextInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_textInsets.leading != a3.leading
    || self->_textInsets.top != a3.top
    || self->_textInsets.trailing != a3.trailing
    || self->_textInsets.bottom != a3.bottom)
  {
    self->_textInsets = a3;
    [(CNAtomTextView *)self setNeedsLayout];
  }
}

- (void)setPlaceholderInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_placeholderInsets.leading != a3.leading
    || self->_placeholderInsets.top != a3.top
    || self->_placeholderInsets.trailing != a3.trailing
    || self->_placeholderInsets.bottom != a3.bottom)
  {
    self->_placeholderInsets = a3;
    [(CNAtomTextView *)self setNeedsLayout];
  }
}

- (void)setLeadingViewInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_leadingViewInsets.leading != a3.leading
    || self->_leadingViewInsets.top != a3.top
    || self->_leadingViewInsets.trailing != a3.trailing
    || self->_leadingViewInsets.bottom != a3.bottom)
  {
    self->_leadingViewInsets = a3;
    [(CNAtomTextView *)self setNeedsLayout];
  }
}

- (void)setTrailingViewInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_trailingViewInsets.leading != a3.leading
    || self->_trailingViewInsets.top != a3.top
    || self->_trailingViewInsets.trailing != a3.trailing
    || self->_trailingViewInsets.bottom != a3.bottom)
  {
    self->_trailingViewInsets = a3;
    [(CNAtomTextView *)self setNeedsLayout];
  }
}

- (void)setClearButtonInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_clearButtonInsets.leading != a3.leading
    || self->_clearButtonInsets.top != a3.top
    || self->_clearButtonInsets.trailing != a3.trailing
    || self->_clearButtonInsets.bottom != a3.bottom)
  {
    self->_clearButtonInsets = a3;
    [(CNAtomTextView *)self setNeedsLayout];
  }
}

- (CGPoint)_firstGlyphBaselineLeftPointWithLayoutManager:(id)a3
{
  id v4 = a3;
  double v5 = [v4 textStorage];
  uint64_t v6 = [v5 length];
  if (!v6)
  {
    double v7 = [(CNAtomTextView *)self _baseAttributedStringWithRepresentedObject:@"X"];
    [v5 appendAttributedString:v7];
  }
  uint64_t v31 = 0;
  double v32 = &v31;
  uint64_t v33 = 0x3032000000;
  double v34 = __Block_byref_object_copy__0;
  double v35 = __Block_byref_object_dispose__0;
  id v36 = 0;
  uint64_t v25 = 0;
  CGFloat v26 = (double *)&v25;
  uint64_t v27 = 0x4010000000;
  uint64_t v28 = &unk_1B5B44B83;
  long long v29 = 0u;
  long long v30 = 0u;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__CNAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke;
  v24[3] = &unk_1E6128728;
  v24[4] = &v25;
  v24[5] = &v31;
  objc_msgSend(v4, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, 1, v24);
  uint64_t v18 = 0;
  CGFloat v19 = (CGRect *)&v18;
  uint64_t v20 = 0x4010000000;
  CGFloat v21 = &unk_1B5B44B83;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = v32[5];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__CNAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke_2;
  v17[3] = &unk_1E6128750;
  void v17[4] = &v18;
  objc_msgSend(v4, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", 0, 1, 0x7FFFFFFFFFFFFFFFLL, 0, v8, v17);
  [v4 baselineOffsetForGlyphAtIndex:0];
  double v10 = v9;
  CGFloat MinX = CGRectGetMinX(v19[1]);
  double v12 = v26[5];
  [(_CNAtomFieldEditor *)self->_textView textContainerInset];
  double v14 = v13;
  if (!v6) {
    objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v5, "length"));
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  double v15 = MinX;
  double v16 = v10 + v12 + v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

void __64__CNAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, unsigned char *a13)
{
  double v14 = *(double **)(*(void *)(a1 + 32) + 8);
  v14[4] = a7;
  v14[5] = a8;
  v14[6] = a9;
  v14[7] = a10;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  *a13 = 1;
}

uint64_t __64__CNAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke_2(uint64_t result, unsigned char *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6 = *(double **)(*(void *)(result + 32) + 8);
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  *a2 = 1;
  return result;
}

- (void)_createBaselineLayoutStrutIfNecessary
{
  if (!self->_baselineLayoutLabel)
  {
    double v3 = [_CNAtomTextViewBaselineLayoutStrut alloc];
    id v4 = -[_CNAtomTextViewBaselineLayoutStrut initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    baselineLayoutLabel = self->_baselineLayoutLabel;
    self->_baselineLayoutLabel = v4;

    uint64_t v6 = [(CNAtomTextView *)self font];
    [(_CNAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setFont:v6];

    [(_CNAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_CNAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setHidden:1];
    [(CNAtomTextView *)self addSubview:self->_baselineLayoutLabel];
    LODWORD(v7) = 1148846080;
    [(_CNAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setContentCompressionResistancePriority:1 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(_CNAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setContentHuggingPriority:1 forAxis:v8];
    double v9 = (void *)MEMORY[0x1E4F28DC8];
    double v10 = _NSDictionaryOfVariableBindings(&cfstr_Baselinelayout.isa, self->_baselineLayoutLabel, 0);
    double v11 = [v9 constraintsWithVisualFormat:@"H:|[_baselineLayoutLabel(0)]" options:0 metrics:0 views:v10];
    [v9 activateConstraints:v11];

    double v12 = [(_CNAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel topAnchor];
    double v13 = [(CNAtomTextView *)self topAnchor];
    double v14 = [v12 constraintEqualToAnchor:v13];
    baselineLayoutConstraint = self->_baselineLayoutConstraint;
    self->_baselineLayoutConstraint = v14;

    double v16 = self->_baselineLayoutConstraint;
    [(NSLayoutConstraint *)v16 setActive:1];
  }
}

- (void)_updateBaselineConstraintIfNecessaryUsingTextViewFrame:(CGRect)a3
{
  if (self->_baselineLayoutConstraint)
  {
    baselineLayoutLabel = self->_baselineLayoutLabel;
    if (baselineLayoutLabel)
    {
      double height = a3.size.height;
      double width = a3.size.width;
      double y = a3.origin.y;
      double x = a3.origin.x;
      [(_CNAtomTextViewBaselineLayoutStrut *)baselineLayoutLabel frame];
      double v10 = v9;
      double v12 = v11;
      [(_CNAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel intrinsicContentSize];
      -[_CNAtomTextViewBaselineLayoutStrut setFrame:](self->_baselineLayoutLabel, "setFrame:", v10, v12, v13, v14);
      double v15 = [(_CNAtomFieldEditor *)self->_textView layoutManager];
      [(CNAtomTextView *)self _firstGlyphBaselineLeftPointWithLayoutManager:v15];

      UIRoundToViewScale();
      double v17 = v16;
      uint64_t v18 = [(_CNAtomFieldEditor *)self->_textView superview];
      -[CNAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v18, x, y, width, height);
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;

      v32.origin.double x = v20;
      v32.origin.double y = v22;
      v32.size.double width = v24;
      v32.size.double height = v26;
      double v27 = v17 + CGRectGetMinY(v32);
      [(_CNAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel _firstLineBaselineOffsetFromBoundsTop];
      double v29 = v27 - v28;
      baselineLayoutConstraint = self->_baselineLayoutConstraint;
      [(NSLayoutConstraint *)baselineLayoutConstraint setConstant:v29];
    }
  }
}

- (id)viewForLastBaselineLayout
{
  [(CNAtomTextView *)self _createBaselineLayoutStrutIfNecessary];
  baselineLayoutLabel = self->_baselineLayoutLabel;

  return baselineLayoutLabel;
}

- (id)_attachmentAtCharacterIndex:(unint64_t)a3
{
  id v4 = [(_CNAtomFieldEditor *)self->_textView textStorage];
  double v5 = [v4 attribute:*MEMORY[0x1E4FB06B8] atIndex:a3 effectiveRange:0];

  objc_opt_class();
  id v6 = 0;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }

  return v6;
}

- (_NSRange)_characterRangeForAtomView:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3010000000;
  uint64_t v18 = &unk_1B5B44B83;
  long long v19 = xmmword_1B5B40C80;
  if (v4)
  {
    double v5 = [(_CNAtomFieldEditor *)self->_textView textStorage];
    uint64_t v6 = [v5 length];
    uint64_t v7 = *MEMORY[0x1E4FB06B8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __45__CNAtomTextView__characterRangeForAtomView___block_invoke;
    v12[3] = &unk_1E6128778;
    id v13 = v4;
    double v14 = &v15;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v12);

    uint64_t v8 = v16[4];
    NSUInteger v9 = v16[5];
  }
  else
  {
    NSUInteger v9 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v15, 8);

  NSUInteger v10 = v8;
  NSUInteger v11 = v9;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

void __45__CNAtomTextView__characterRangeForAtomView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v9 = [v12 atomView];
    NSUInteger v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      *(void *)(v11 + 32) = a3;
      *(void *)(v11 + 40) = a4;
      *a5 = 1;
    }
  }
}

- (void)_updateAtomMasksInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = self->_atomViews;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "bounds", (void)v18);
        -[CNAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v13);
        v26.origin.CGFloat x = v14;
        v26.origin.CGFloat y = v15;
        v26.size.CGFloat width = v16;
        v26.size.CGFloat height = v17;
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        CGRect v25 = CGRectIntersection(v24, v26);
        -[CNAtomTextView convertRect:toView:](self, "convertRect:toView:", v13, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
        objc_msgSend(v13, "setMaskBounds:");
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)_tapRecognized:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [v4 locationInView:self];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    if (![(CNAtomTextView *)self isFirstResponder]) {
      [(CNAtomTextView *)self becomeFirstResponder];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = self->_atomViews;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          CGFloat v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          CGFloat v15 = objc_msgSend(v14, "delegateView", (void)v18);
          [v15 bounds];
          -[CNAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v15);
          v24.CGFloat x = v6;
          v24.CGFloat y = v8;
          if (CGRectContainsPoint(v25, v24))
          {
            uint64_t v16 = [(CNAtomTextView *)self _characterRangeForAtomView:v14];
            if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
              -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v16, v17);
            }

            goto LABEL_16;
          }
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
}

- (void)_clearButtonTapped:(id)a3
{
  [(CNAtomTextView *)self setRepresentedObjects:0];

  [(CNAtomTextView *)self becomeFirstResponder];
}

- (void)escKeyPressed:(id)a3
{
  id v4 = a3;
  if ([(CNAtomTextView *)self _showsClearButton]) {
    [(CNAtomTextView *)self _clearButtonTapped:v4];
  }
}

- (CGRect)_usedRectWithLayoutManager:(id)a3 textContainer:(id)a4
{
  [a3 usedRectForTextContainer:a4];
  double v6 = v5;
  double v8 = v7;
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(_CNAtomFieldEditor *)self->_textView textContainerInset];
  double v12 = v11;
  [(_CNAtomFieldEditor *)self->_textView textContainerInset];
  double v14 = v8 - (v12 + v13);
  [(_CNAtomFieldEditor *)self->_textView textContainerInset];
  double v16 = v15;
  [(_CNAtomFieldEditor *)self->_textView textContainerInset];
  double v18 = v6 - (v16 + v17);
  double v19 = v9;
  double v20 = v10;
  double v21 = v14;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v5 && (*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    double v10 = [MEMORY[0x1E4F1CA80] setWithArray:self->_atomViews];
    double v11 = [v8 textStorage];
    uint64_t v12 = [v11 length];
    uint64_t v13 = *MEMORY[0x1E4FB06B8];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __72__CNAtomTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke;
    v36[3] = &unk_1E61287A0;
    id v14 = v10;
    id v37 = v14;
    uint64_t v38 = self;
    id v15 = v8;
    id v39 = v15;
    id v16 = v9;
    id v40 = v16;
    uint64_t v31 = v11;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v12, 0, v36);
    if ([v14 count])
    {
      atomViews = self->_atomViews;
      double v18 = [v14 allObjects];
      [(NSMutableArray *)atomViews removeObjectsInArray:v18];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v19 = v14;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v33;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(v19);
            }
            [*(id *)(*((void *)&v32 + 1) + 8 * v23++) removeFromSuperview];
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v21);
      }
    }
    [(CNAtomTextView *)self _usedRectWithLayoutManager:v15 textContainer:v16];
    [(UIView *)self cnaui_currentScreenScale];
    UIRectIntegralWithScale();
    double v25 = v24;
    double v27 = v26;
    [(UIScrollView *)self->_scrollView contentSize];
    if (v29 != v25 || v28 != v27) {
      -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v25, v27);
    }
    [(CNAtomTextView *)self _visibleAtomsRect];
    -[CNAtomTextView _updateAtomMasksInRect:](self, "_updateAtomMasksInRect:");
  }
}

uint64_t __72__CNAtomTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v27 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v27;
  if (isKindOfClass)
  {
    id v9 = [v27 atomView];
    [*(id *)(a1 + 32) removeObject:v9];
    double v10 = [v9 superview];

    if (!v10)
    {
      [*(id *)(*(void *)(a1 + 40) + 488) addSubview:v9];
      [*(id *)(*(void *)(a1 + 40) + 512) addObject:v9];
    }
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 48), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
    objc_msgSend(*(id *)(a1 + 48), "boundingRectForGlyphRange:inTextContainer:", v11, v12, *(void *)(a1 + 56));
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 488), "convertGlyphRect:");
    objc_msgSend(v9, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    objc_msgSend(*(id *)(a1 + 40), "cnaui_currentScreenScale");
    UIRectIntegralWithScale();
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v9 frame];
    if (v18 != v22 || v20 != v21)
    {
      objc_msgSend(v9, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v18, v20);
      [v9 layoutSubviews];
    }
    double v24 = [v9 viewForLastBaselineLayout];
    [v24 frame];
    objc_msgSend(v9, "setFrame:", v14, v16 - v25, v18, v20);

    id v8 = v27;
  }

  return MEMORY[0x1F41817F8](isKindOfClass, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_scrollView == a3)
  {
    [(CNAtomTextView *)self _visibleAtomsRect];
    -[CNAtomTextView _updateAtomMasksInRect:](self, "_updateAtomMasksInRect:");
  }
}

- (void)_scrollToSelectionIfNeeded
{
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    textView = self->_textView;
    uint64_t v4 = [(_CNAtomFieldEditor *)textView selectedRange];
    -[_CNAtomFieldEditor _rectForScrollToVisible:](textView, "_rectForScrollToVisible:", v4, v5);
    -[_CNAtomFieldEditor scrollRectToVisible:animated:](self->_textView, "scrollRectToVisible:animated:", 1);
    *(unsigned char *)&self->_flags &= ~0x40u;
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 textStorage];
  objc_msgSend(v4, "setSelectedRange:", objc_msgSend(v5, "length"), 0);

  [(CNAtomTextView *)self sendActionsForControlEvents:0x40000];
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if (([v10 isEqualToString:@"\n"] & 1) != 0
    || [v10 isEqualToString:@"\t"])
  {
    uint64_t v11 = [v9 textStorage];
    objc_msgSend(v9, "setSelectedRange:", objc_msgSend(v11, "length"), 0);

    [(CNAtomTextView *)self sendActionsForControlEvents:0x80000];
LABEL_4:
    BOOL v12 = 0;
    goto LABEL_5;
  }
  if ([v10 isEqualToString:&stru_1F0EC0C28] && length == 1)
  {
    double v14 = [(CNAtomTextView *)self _attachmentAtCharacterIndex:location];
    double v15 = [v14 atomView];

    if (v15 && ![v15 selectionStyle])
    {
      objc_msgSend(v9, "setSelectedRange:", location, 1);
      BOOL v12 = 0;
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 1;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0 && length == 1)
    {
      double v16 = [(CNAtomTextView *)self _attachmentAtCharacterIndex:location];
      double v17 = [v16 atomView];
      if ([v17 selectionStyle])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        double v19 = [v16 representedObject];
        char v20 = [WeakRetained _atomTextView:self shouldReplaceRepresentedObject:v19 replacementText:v10];

        if ((v20 & 1) == 0)
        {
          objc_msgSend(v9, "setSelectedRange:", location + 1, 0);
          [v9 insertText:v10];

          goto LABEL_4;
        }
      }
      else
      {
      }
      BOOL v12 = 1;
    }
  }
LABEL_5:

  return v12;
}

- (void)textViewDidChange:(id)a3
{
  [(CNAtomTextView *)self setNeedsLayout];

  [(CNAtomTextView *)self sendActionsForControlEvents:0x20000];
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 textStorage];
  double v6 = [v4 layoutManager];
  uint64_t v7 = [v4 selectedRange];
  uint64_t v9 = v8;
  uint64_t v10 = objc_msgSend(v6, "glyphRangeForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v5, "length"), 0);
  uint64_t v12 = v11;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__0;
  long long v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  double v21 = __45__CNAtomTextView_textViewDidChangeSelection___block_invoke;
  double v22 = &unk_1E61287F0;
  id v13 = v6;
  id v23 = v13;
  id v14 = v5;
  id v24 = v14;
  uint64_t v27 = v7;
  uint64_t v28 = v9;
  id v15 = v4;
  id v25 = v15;
  double v26 = &v29;
  objc_msgSend(v13, "enumerateLineFragmentsForGlyphRange:usingBlock:", v10, v12, &v19);
  double v16 = (void *)v30[5];
  textView = self->_textView;
  if (v16)
  {
    objc_msgSend(v16, "bounds", v19, v20, v21, v22, v23, v24);
    -[_CNAtomFieldEditor convertRect:fromView:](textView, "convertRect:fromView:", v30[5]);
  }
  else
  {
    -[_CNAtomFieldEditor _rectForScrollToVisible:](self->_textView, "_rectForScrollToVisible:", v7, v9, v19, v20, v21, v22, v23, v24);
  }
  -[_CNAtomFieldEditor scrollRectToVisible:animated:](self->_textView, "scrollRectToVisible:animated:", 1);
  if (*(unsigned char *)&self->_flags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained atomTextViewDidChangeSelection:self];
  }
  _Block_object_dispose(&v29, 8);
}

void __45__CNAtomTextView_textViewDidChangeSelection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  uint64_t v7 = v6;
  uint64_t v8 = *MEMORY[0x1E4FB06B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __45__CNAtomTextView_textViewDidChangeSelection___block_invoke_2;
  v12[3] = &unk_1E61287C8;
  long long v15 = *(_OWORD *)(a1 + 64);
  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  id v13 = v10;
  uint64_t v14 = v11;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v8, v5, v7, 0, v12);
}

uint64_t __45__CNAtomTextView_textViewDidChangeSelection___block_invoke_2(void *a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v28 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v28;
  if (isKindOfClass)
  {
    uint64_t v9 = [v28 atomView];
    unint64_t v10 = a1[6];
    unint64_t v11 = a1[7];
    if (a3 < v10 || a3 - v10 >= v11)
    {
      uint64_t v13 = 0;
    }
    else
    {
      BOOL v14 = a3 == v10;
      BOOL v15 = a3 + a4 == v11 + v10;
      double v16 = (void *)a1[4];
      double v17 = [v16 beginningOfDocument];
      double v18 = [v16 positionFromPosition:v17 offset:a3];
      uint64_t v19 = [v16 baseWritingDirectionForPosition:v18 inDirection:0];

      if (v19 == 1) {
        BOOL v20 = v15;
      }
      else {
        BOOL v20 = v14;
      }
      if (v19 == 1) {
        BOOL v21 = v14;
      }
      else {
        BOOL v21 = v15;
      }
      int v22 = v20 || v21;
      BOOL v23 = !v20;
      uint64_t v24 = 4;
      if (v23) {
        uint64_t v24 = 0;
      }
      BOOL v23 = !v21;
      uint64_t v25 = 8;
      if (v23) {
        uint64_t v25 = 0;
      }
      uint64_t v26 = v24 | v25;
      if (v22) {
        uint64_t v13 = v26;
      }
      else {
        uint64_t v13 = 1;
      }
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v9);
    }
    [v9 setSelectionStyle:v13 animated:0];

    id v8 = v28;
  }

  return MEMORY[0x1F41817F8](isKindOfClass, v8);
}

- (void)_textStorageDidProcessEditing:(id)a3
{
  if ([(_CNAtomFieldEditor *)self->_textView isSelectable])
  {
    if ([(CNAtomTextView *)self isFirstResponder]) {
      *(unsigned char *)&self->_flags |= 0x40u;
    }
  }
}

- (BOOL)keyboardInputChanged:(id)a3
{
  return 1;
}

- (_NSRange)selectionRange
{
  NSUInteger v2 = [(_CNAtomFieldEditor *)self->_textView selectionRange];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (BOOL)hasContent
{
  return [(_CNAtomFieldEditor *)self->_textView hasContent];
}

- (void)selectAll
{
}

- (BOOL)hasSelection
{
  return [(_CNAtomFieldEditor *)self->_textView hasSelection];
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  return (id)[(_CNAtomFieldEditor *)self->_textView rangeEnclosingPosition:a3 withGranularity:a4 inDirection:a5];
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return [(_CNAtomFieldEditor *)self->_textView isPosition:a3 atBoundary:a4 inDirection:a5];
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return [(_CNAtomFieldEditor *)self->_textView isPosition:a3 withinTextUnit:a4 inDirection:a5];
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return (id)[(_CNAtomFieldEditor *)self->_textView positionFromPosition:a3 toBoundary:a4 inDirection:a5];
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return [(_CNAtomFieldEditor *)self->_textView baseWritingDirectionForPosition:a3 inDirection:a4];
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
}

- (CGRect)firstRectForRange:(id)a3
{
  [(_CNAtomFieldEditor *)self->_textView firstRectForRange:a3];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  [(_CNAtomFieldEditor *)self->_textView caretRectForPosition:a3];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  return [(_CNAtomFieldEditor *)self->_textView selectionRectsForRange:a3];
}

- (id)textInRange:(id)a3
{
  return (id)[(_CNAtomFieldEditor *)self->_textView textInRange:a3];
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
}

- (BOOL)hasText
{
  return [(_CNAtomFieldEditor *)self->_textView hasText];
}

- (void)insertText:(id)a3
{
}

- (void)deleteBackward
{
}

- (void)unmarkText
{
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return (id)-[_CNAtomFieldEditor characterRangeAtPoint:](self->_textView, "characterRangeAtPoint:", a3.x, a3.y);
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return (id)[(_CNAtomFieldEditor *)self->_textView characterRangeByExtendingPosition:a3 inDirection:a4];
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return (id)[(_CNAtomFieldEditor *)self->_textView textRangeFromPosition:a3 toPosition:a4];
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return (id)[(_CNAtomFieldEditor *)self->_textView positionFromPosition:a3 offset:a4];
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return (id)[(_CNAtomFieldEditor *)self->_textView positionFromPosition:a3 inDirection:a4 offset:a5];
}

- (id)positionWithinRange:(id)a3 atCharacterOffset:(int64_t)a4
{
  return (id)[(_CNAtomFieldEditor *)self->_textView positionWithinRange:a3 atCharacterOffset:a4];
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return (id)[(_CNAtomFieldEditor *)self->_textView positionWithinRange:a3 farthestInDirection:a4];
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return (id)-[_CNAtomFieldEditor closestPositionToPoint:](self->_textView, "closestPositionToPoint:", a3.x, a3.y);
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return (id)-[_CNAtomFieldEditor closestPositionToPoint:withinRange:](self->_textView, "closestPositionToPoint:withinRange:", a4, a3.x, a3.y);
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return [(_CNAtomFieldEditor *)self->_textView comparePosition:a3 toPosition:a4];
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return [(_CNAtomFieldEditor *)self->_textView offsetFromPosition:a3 toPosition:a4];
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
}

- (id)textInputTraits
{
  textInputTraits = self->_textInputTraits;
  if (!textInputTraits)
  {
    double v4 = (UITextInputTraits *)objc_alloc_init(MEMORY[0x1E4F42F28]);
    double v5 = self->_textInputTraits;
    self->_textInputTraits = v4;

    textInputTraits = self->_textInputTraits;
  }

  return textInputTraits;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAtomTextView *)self textInputTraits];
  [v5 takeTraitsFrom:v4];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ([(id)objc_opt_class() instancesRespondToSelector:a3])
  {
    id v5 = [(CNAtomTextView *)self textInputTraits];
  }
  else if ([(id)objc_opt_class() instancesRespondToSelector:a3])
  {
    id v5 = self->_textView;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNAtomTextView;
    id v5 = [(CNAtomTextView *)&v7 forwardingTargetForSelector:a3];
  }

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    objc_super v7 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
    }
    id v6 = v9;
  }

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNAtomTextView;
  if (-[CNAtomTextView respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(CNAtomTextView *)self textInputTraits];
    if (objc_opt_respondsToSelector()) {
      char v4 = 1;
    }
    else {
      char v4 = objc_opt_respondsToSelector();
    }
  }
  return v4 & 1;
}

- (id)keyCommands
{
  v5[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v2 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439F0] modifierFlags:0 action:sel_escKeyPressed_];
  v5[0] = v2;
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  BOOL v7 = sel__clearButtonTapped_ == a3
    || sel_escKeyPressed_ == a3 && [(CNAtomTextView *)self _showsClearButton]
    || [(_CNAtomFieldEditor *)self->_textView canPerformAction:a3 withSender:v6];

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return [(_CNAtomFieldEditor *)self->_textView canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [(_CNAtomFieldEditor *)self->_textView becomeFirstResponder];
}

- (BOOL)canResignFirstResponder
{
  return [(_CNAtomFieldEditor *)self->_textView canResignFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [(_CNAtomFieldEditor *)self->_textView resignFirstResponder];
}

- (BOOL)isFirstResponder
{
  return [(_CNAtomFieldEditor *)self->_textView isFirstResponder];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CNAtomTextView;
  -[CNAtomTextView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (CNAtomTextView *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self || v5 == (CNAtomTextView *)self->_textView)
  {
    BOOL v7 = [(UIButton *)self->_clearButton superview];
    if (v7 != self)
    {
      id v8 = [(UIView *)self->_leadingView superview];
      if (v8 != self)
      {
        [(UIView *)self->_trailingView superview];
      }
    }
  }

  return v6;
}

- (CNAtomTextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAtomTextViewDelegate *)WeakRetained;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSDirectionalEdgeInsets)textInsets
{
  double top = self->_textInsets.top;
  double leading = self->_textInsets.leading;
  double bottom = self->_textInsets.bottom;
  double trailing = self->_textInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (NSDirectionalEdgeInsets)placeholderInsets
{
  double top = self->_placeholderInsets.top;
  double leading = self->_placeholderInsets.leading;
  double bottom = self->_placeholderInsets.bottom;
  double trailing = self->_placeholderInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (void)setLeadingView:(id)a3
{
}

- (int64_t)leadingViewMode
{
  return self->_leadingViewMode;
}

- (void)setLeadingViewMode:(int64_t)a3
{
  self->_leadingViewMode = a3;
}

- (NSDirectionalEdgeInsets)leadingViewInsets
{
  double top = self->_leadingViewInsets.top;
  double leading = self->_leadingViewInsets.leading;
  double bottom = self->_leadingViewInsets.bottom;
  double trailing = self->_leadingViewInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (void)setTrailingView:(id)a3
{
}

- (int64_t)trailingViewMode
{
  return self->_trailingViewMode;
}

- (void)setTrailingViewMode:(int64_t)a3
{
  self->_trailingViewMode = a3;
}

- (NSDirectionalEdgeInsets)trailingViewInsets
{
  double top = self->_trailingViewInsets.top;
  double leading = self->_trailingViewInsets.leading;
  double bottom = self->_trailingViewInsets.bottom;
  double trailing = self->_trailingViewInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (int64_t)clearButtonMode
{
  return self->_clearButtonMode;
}

- (void)setClearButtonMode:(int64_t)a3
{
  self->_clearButtonMode = a3;
}

- (NSDirectionalEdgeInsets)clearButtonInsets
{
  double top = self->_clearButtonInsets.top;
  double leading = self->_clearButtonInsets.leading;
  double bottom = self->_clearButtonInsets.bottom;
  double trailing = self->_clearButtonInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (BOOL)_drawsDebugBaselines
{
  return self->_drawsDebugBaselines;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_baselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_baselineLayoutLabel, 0);
  objc_storeStrong((id *)&self->_atomViews, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __25___CNAtomTextView_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "composerecipient");
  uint64_t v1 = os_log_cn_once_object_8;
  os_log_cn_once_object_8 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __24___CNAtomTextView_atoms__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __60___CNAtomTextView_enumerateAtomsInCharacterRange_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 objectForKey:*MEMORY[0x1E4FB06B8]];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v3 = [v6 atomView];

      if (v3)
      {
        uint64_t v4 = *(void *)(a1 + 32);
        id v5 = [v6 atomView];
        (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
      }
    }
  }
}

void __44___CNAtomTextView_enumerateAtomAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:*MEMORY[0x1E4FB06B8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __42___CNAtomTextView_selectionRectsForRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  BOOL v7 = [a2 objectForKey:*MEMORY[0x1E4FB06B8]];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56) + v8;
    uint64_t v10 = a3 + a4;
    unint64_t v11 = [v7 atomView];
    uint64_t v12 = *(void **)(a1 + 32);
    [v11 selectionFrame];
    objc_msgSend(v12, "convertRect:fromView:", v11);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    if (a3 == v8)
    {
      BOOL v21 = objc_alloc_init(_CNAtomTextSelectionRect);
      -[_CNAtomTextSelectionRect setRect:](v21, "setRect:", v14, v16, 0.0, v20);
      [(_CNAtomTextSelectionRect *)v21 setContainsStart:1];
      [*(id *)(a1 + 40) addObject:v21];
    }
    if (v9 == v10)
    {
      int v22 = objc_alloc_init(_CNAtomTextSelectionRect);
      -[_CNAtomTextSelectionRect setRect:](v22, "setRect:", v14 + v18, v16, 0.0, v20);
      [(_CNAtomTextSelectionRect *)v22 setContainsEnd:1];
      [*(id *)(a1 + 40) addObject:v22];
    }
  }
  else
  {
    BOOL v23 = *(void **)(a1 + 32);
    uint64_t v24 = [v23 beginningOfDocument];
    uint64_t v25 = [v23 positionFromPosition:v24 offset:a3];

    uint64_t v26 = [*(id *)(a1 + 32) positionFromPosition:v25 offset:a4];
    uint64_t v27 = [*(id *)(a1 + 32) textRangeFromPosition:v25 toPosition:v26];
    id v28 = *(void **)(a1 + 40);
    v30.receiver = *(id *)(a1 + 32);
    v30.super_class = (Class)_CNAtomTextView;
    uint64_t v29 = objc_msgSendSuper2(&v30, sel_selectionRectsForRange_, v27);
    [v28 addObjectsFromArray:v29];
  }
}

uint64_t __25___CNAtomTextView_paste___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 canLoadObjectOfClass:objc_opt_class()];

  return v3;
}

uint64_t __26___CNAtomTextView_delete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 recipient];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __26___CNAtomTextView_delete___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didRemoveRecipient:a2];
}

void __30___CNAtomTextView_keyCommands__block_invoke(uint64_t a1)
{
  v17[8] = *MEMORY[0x1E4F143B8];
  double v15 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F43A80] modifierFlags:0 action:sel_upArrowPressed];
  [v15 setWantsPriorityOverSystemBehavior:1];
  id v2 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439D8] modifierFlags:0 action:sel_downArrowPressed];
  [v2 setWantsPriorityOverSystemBehavior:1];
  uint64_t v3 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F43A60] modifierFlags:0 action:sel_leftArrowPressed];
  [v3 setWantsPriorityOverSystemBehavior:1];
  uint64_t v4 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F43A78] modifierFlags:0 action:sel_rightArrowPressed];
  [v4 setWantsPriorityOverSystemBehavior:1];
  id v5 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_returnPressed];
  [v5 setWantsPriorityOverSystemBehavior:1];
  uint64_t v6 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"\t" modifierFlags:0 action:sel_tabPressed];
  [v6 setWantsPriorityOverSystemBehavior:1];
  BOOL v7 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"," modifierFlags:0 action:sel_commaPressed];
  [v7 setWantsPriorityOverSystemBehavior:1];
  uint64_t v8 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439F0] modifierFlags:0 action:sel_escKeyPressed];
  [v8 setWantsPriorityOverSystemBehavior:1];
  v16.receiver = *(id *)(a1 + 32);
  v16.super_class = (Class)_CNAtomTextView;
  uint64_t v9 = objc_msgSendSuper2(&v16, sel_keyCommands);
  uint64_t v10 = (void *)v9;
  if (v9) {
    unint64_t v11 = (void *)v9;
  }
  else {
    unint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v17[0] = v15;
  v17[1] = v2;
  v17[2] = v3;
  v17[3] = v4;
  void v17[4] = v5;
  void v17[5] = v6;
  v17[6] = v7;
  v17[7] = v8;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:8];
  uint64_t v13 = [v11 arrayByAddingObjectsFromArray:v12];
  double v14 = (void *)keyCommands_keyCommands;
  keyCommands_keyCommands = v13;
}

@end