@interface MFAtomTextView
+ (Class)_backgroundViewClass;
+ (Class)_fieldEditorClass;
+ (id)defaultFont;
+ (id)defaultPlaceholderColor;
+ (id)defaultTextColor;
- (BOOL)_cursorAccessoriesVisible;
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
- (MFAtomTextView)initWithFrame:(CGRect)a3;
- (MFAtomTextViewDelegate)delegate;
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
- (_MFAtomFieldEditor)_fieldEditor;
- (_NSRange)_characterRangeForAtomView:(id)a3;
- (_NSRange)selectionRange;
- (id)_atomLayoutViewForRepresentedObject:(id)a3;
- (id)_attachmentAtCharacterIndex:(unint64_t)a3;
- (id)_baseAttributedStringWithRepresentedObject:(id)a3;
- (id)_clearButtonImageForState:(unint64_t)a3;
- (id)_cursorAccessories;
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

@implementation MFAtomTextView

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
  return (id)[MEMORY[0x1E4FB1618] blackColor];
}

+ (id)defaultPlaceholderColor
{
  return (id)[MEMORY[0x1E4FB1618] _systemMidGrayTintColor];
}

- (MFAtomTextView)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)MFAtomTextView;
  v3 = -[MFAtomTextView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFAtomTextView *)v3 _setHostsLayoutEngine:1];
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
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", v12, v13, v14, v15);
    scrollView = v4->_scrollView;
    v4->_scrollView = (UIScrollView *)v18;

    [(UIScrollView *)v4->_scrollView setDelegate:v4];
    [(UIScrollView *)v4->_scrollView setScrollsToTop:0];
    [(UIScrollView *)v4->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v4->_scrollView setShowsVerticalScrollIndicator:0];
    uint64_t v20 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_fieldEditorClass")), "initWithFrame:textContainer:", 0, v12, v13, v14, v15);
    textView = v4->_textView;
    v4->_textView = (_MFAtomFieldEditor *)v20;

    [(_MFAtomFieldEditor *)v4->_textView setAutoresizingMask:0];
    [(_MFAtomFieldEditor *)v4->_textView setBackgroundColor:0];
    v22 = [(MFAtomTextView *)v4 font];
    [(_MFAtomFieldEditor *)v4->_textView setFont:v22];

    [(_MFAtomFieldEditor *)v4->_textView setScrollEnabled:0];
    [(_MFAtomFieldEditor *)v4->_textView setScrollsToTop:0];
    [(_MFAtomFieldEditor *)v4->_textView setTextAlignment:4];
    v23 = [(MFAtomTextView *)v4 baseAttributes];
    [(_MFAtomFieldEditor *)v4->_textView setTypingAttributes:v23];

    v24 = [(_MFAtomFieldEditor *)v4->_textView layoutManager];
    [v24 setAllowsNonContiguousLayout:1];

    [(_MFAtomFieldEditor *)v4->_textView setDelegate:v4];
    v25 = [(_MFAtomFieldEditor *)v4->_textView layoutManager];
    [v25 setDelegate:v4];

    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v27 = [(_MFAtomFieldEditor *)v4->_textView textStorage];
    [v26 addObserver:v4 selector:sel__textStorageDidProcessEditing_ name:*MEMORY[0x1E4FB07F0] object:v27];

    if (v4->_background) {
      -[MFAtomTextView addSubview:](v4, "addSubview:");
    }
    [(MFAtomTextView *)v4 addSubview:v4->_scrollView];
    [(UIScrollView *)v4->_scrollView addSubview:v4->_textView];
    v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__tapRecognized_];
    [v28 setCancelsTouchesInView:0];
    [(MFAtomTextView *)v4 addGestureRecognizer:v28];
    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    atomViews = v4->_atomViews;
    v4->_atomViews = v29;
  }
  return v4;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(UIScrollView *)self->_scrollView setDelegate:0];
  [(_MFAtomFieldEditor *)self->_textView setDelegate:0];
  v3 = [(_MFAtomFieldEditor *)self->_textView layoutManager];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)MFAtomTextView;
  [(MFAtomTextView *)&v4 dealloc];
}

- (_MFAtomFieldEditor)_fieldEditor
{
  return self->_textView;
}

- (UIView)_systemBackgroundView
{
  return (UIView *)self->_background;
}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_drawsDebugBaselines != a3)
  {
    BOOL v3 = a3;
    self->_drawsDebugBaselines = a3;
    -[_MFAtomFieldEditor _setDrawsDebugBaselines:](self->_textView, "_setDrawsDebugBaselines:");
    [(UILabel *)self->_placeholderLabel _setDrawsDebugBaselines:v3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = self->_atomViews;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "viewForLastBaselineLayout", (void)v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v9 _setDrawsDebugBaselines:v3];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(MFAtomTextView *)self setNeedsLayout];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 16;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v9;
    uint64_t v5 = obj;
  }
}

- (void)setFont:(id)a3
{
  objc_super v4 = (UIFont *)a3;
  if (!v4)
  {
    objc_super v4 = [(id)objc_opt_class() defaultFont];
  }
  id obj = v4;
  if (self->_font != v4)
  {
    objc_storeStrong((id *)&self->_font, v4);
    [(_MFAtomFieldEditor *)self->_textView setFont:obj];
    [(UILabel *)self->_placeholderLabel setFont:obj];
    [(_MFAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setFont:obj];
    [(MFAtomTextView *)self setNeedsLayout];
  }
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
    char v8 = __31__MFAtomTextView_setTextColor___block_invoke;
    char v9 = &unk_1E5F79038;
    long long v10 = self;
    long long v11 = v4;
    uint64_t v5 = (void (**)(void))_Block_copy(&v6);
    if (objc_msgSend(MEMORY[0x1E4FB1EB0], "areAnimationsEnabled", v6, v7, v8, v9, v10)) {
      [MEMORY[0x1E4FB1EB0] transitionWithView:self->_textView duration:5242880 options:v5 animations:0 completion:0.35];
    }
    else {
      v5[2](v5);
    }
  }
}

void __31__MFAtomTextView_setTextColor___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 488) setTextColor:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) baseAttributes];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 488), "setTypingAttributes:");
}

- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)MFAtomTextView;
  -[MFAtomTextView setEnabled:](&v16, sel_setEnabled_);
  [(_UITextFieldRoundedRectBackgroundViewNeue *)self->_background setEnabled:v5 animated:v4];
  uint64_t v7 = [(MFAtomTextView *)self clearButton];
  [v7 setEnabled:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v8 = self->_atomViews;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setEnabled:animated:", v5, v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setEnabled:(BOOL)a3
{
}

- (id)paragraphStyle
{
  if (paragraphStyle_onceToken != -1) {
    dispatch_once(&paragraphStyle_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)paragraphStyle_sParagraphStyle;

  return v2;
}

void __32__MFAtomTextView_paragraphStyle__block_invoke()
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
  BOOL v5 = [(MFAtomTextView *)self font];
  v17[0] = v5;
  v16[1] = *MEMORY[0x1E4FB0700];
  uint64_t v6 = [(MFAtomTextView *)self textColor];
  v17[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4FB0738];
  v16[2] = *MEMORY[0x1E4FB0738];
  char v8 = [(MFAtomTextView *)self paragraphStyle];
  v17[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v11 = [(MFAtomTextView *)self _atomLayoutViewForRepresentedObject:v4];
    long long v12 = +[_MFAtomAttachment attachmentWithAtomLayoutView:v11 representedObject:v4];
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
  return [(MFAtomTextView *)self baseAttributesWithRepresentedObject:0];
}

- (id)_baseAttributedStringWithRepresentedObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFAtomTextView *)self baseAttributesWithRepresentedObject:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v5];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    __int16 v10 = -4;
    char v8 = [NSString stringWithCharacters:&v10 length:1];
    uint64_t v6 = (void *)[v7 initWithString:v8 attributes:v5];
  }

  return v6;
}

- (BOOL)_hasContent
{
  id v2 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_representedObjectsInRange:(_NSRange)a3 ranges:(id *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  char v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v8);
  __int16 v10 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3010000000;
  v31[3] = "";
  long long v32 = xmmword_1AFA90620;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__MFAtomTextView__representedObjectsInRange_ranges___block_invoke;
  aBlock[3] = &unk_1E5F79260;
  v30 = v31;
  id v11 = v8;
  id v27 = v11;
  id v12 = v10;
  id v28 = v12;
  id v13 = v9;
  id v29 = v13;
  long long v14 = _Block_copy(aBlock);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__MFAtomTextView__representedObjectsInRange_ranges___block_invoke_2;
  v21[3] = &unk_1E5F79288;
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

double __52__MFAtomTextView__representedObjectsInRange_ranges___block_invoke(uint64_t a1)
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
    *(_OWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = xmmword_1AFA90620;
  }
  return result;
}

void __52__MFAtomTextView__representedObjectsInRange_ranges___block_invoke_2(void *a1, void *a2, NSUInteger location, NSUInteger length)
{
  id v15 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void))(a1[6] + 16))();
    id v7 = (void *)a1[4];
    char v8 = [v15 representedObject];
    [v7 addObject:v8];

    uint64_t v9 = (void *)a1[5];
    __int16 v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
    [v9 addObject:v10];
  }
  else if (!v15)
  {
    uint64_t v11 = *(void *)(a1[7] + 8);
    v12.NSUInteger location = *(void *)(v11 + 32);
    if (v12.location == 0x7FFFFFFFFFFFFFFFLL
      || (v12.NSUInteger length = *(void *)(v11 + 40), v12.length + v12.location != location))
    {
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      v17.NSUInteger location = location;
      v17.NSUInteger length = length;
      NSRange v13 = NSUnionRange(v12, v17);
      NSUInteger location = v13.location;
      NSUInteger length = v13.length;
    }
    uint64_t v14 = *(void *)(a1[7] + 8);
    *(void *)(v14 + 32) = location;
    *(void *)(v14 + 40) = length;
  }
}

- (id)currentEditingString:(_NSRange *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = (_NSRange)xmmword_1AFA90620;
  }
  BOOL v5 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  uint64_t v6 = [(_MFAtomFieldEditor *)self->_textView selectedRange];
  uint64_t v8 = v7;
  id v33 = 0;
  uint64_t v9 = -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v5 length], &v33);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v33;
  uint64_t v11 = (char *)[v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    id v27 = v9;
    id v28 = v5;
    NSRange v12 = 0;
    unint64_t v13 = v6 + v8;
    uint64_t v14 = *(void *)v30;
    while (2)
    {
      id v15 = 0;
      id v16 = &v11[(void)v12];
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v10);
        }
        unint64_t v17 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)v15), "rangeValue", v27, v28, (void)v29);
        NSUInteger v19 = v17;
        NSUInteger v20 = v18;
        if (v13 - v17 < v18 && v13 >= v17 || v13 == v17 + v18)
        {
          id v23 = &v15[(void)v12];
          uint64_t v9 = v27;
          BOOL v5 = v28;
          id v24 = [v27 objectAtIndexedSubscript:v23];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v11 = [v27 objectAtIndexedSubscript:v23];
            if (a3)
            {
              a3->NSUInteger location = v19;
              a3->NSUInteger length = v20;
            }
          }
          else
          {
            uint64_t v11 = 0;
          }
          goto LABEL_22;
        }
        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = (char *)[v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      NSRange v12 = v16;
      if (v11) {
        continue;
      }
      break;
    }
    uint64_t v9 = v27;
    BOOL v5 = v28;
  }
LABEL_22:

  return v11;
}

- (NSString)currentEditingString
{
  return (NSString *)[(MFAtomTextView *)self currentEditingString:0];
}

- (NSArray)representedObjects
{
  BOOL v3 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  id v4 = -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v3 length], 0);

  return (NSArray *)v4;
}

- (NSArray)selectedRepresentedObjects
{
  uint64_t v4 = [(_MFAtomFieldEditor *)self->_textView selectedRange];

  return (NSArray *)-[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", v4, v3, 0);
}

- (void)insertRepresentedObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  [v7 beginEditing];
  id v14 = 0;
  -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v7 length], &v14);
  uint64_t v8 = (char *)objc_claimAutoreleasedReturnValue();
  id v9 = v14;

  if (v8)
  {
    id v10 = [v9 objectAtIndexedSubscript:a4];
    uint64_t v11 = [v10 rangeValue];

    NSRange v12 = [(MFAtomTextView *)self _baseAttributedStringWithRepresentedObject:v6];
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
    unint64_t v13 = [(_MFAtomFieldEditor *)self->_textView layoutManager];
    objc_msgSend(v13, "invalidateLayoutForCharacterRange:actualCharacterRange:", v11, v8, 0);
  }
  [(MFAtomTextView *)self setNeedsLayout];
  [(MFAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", &v8[v11], 0);
}

- (void)_deleteCharactersInStorage:(id)a3 ranges:(id)a4 rangeToAdjust:(_NSRange *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = objc_msgSend(a4, "reverseObjectEnumerator", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        NSUInteger v12 = [*(id *)(*((void *)&v19 + 1) + 8 * v11) rangeValue];
        unint64_t v14 = v13;
        objc_msgSend(v7, "deleteCharactersInRange:", v12, v13);
        NSUInteger location = a5->location;
        NSUInteger length = a5->length;
        if (v12 < length + a5->location)
        {
          if (location >= v12 + v14)
          {
            a5->NSUInteger location = location - v14;
          }
          else
          {
            if (v12 <= location)
            {
              NSUInteger v18 = location - (v12 + v14) + length;
              a5->NSUInteger location = v12;
            }
            else
            {
              BOOL v17 = length >= v14;
              NSUInteger v18 = length - v14;
              if (!v17) {
                NSUInteger v18 = 0;
              }
            }
            a5->NSUInteger length = v18;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (void)removeRepresentedObjectsAtIndexes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  [v5 beginEditing];
  uint64_t v11 = [(_MFAtomFieldEditor *)self->_textView selectedRange];
  uint64_t v12 = v6;
  id v10 = 0;
  id v7 = -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v5 length], &v10);
  id v8 = v10;

  if (v7)
  {
    uint64_t v9 = [v8 objectsAtIndexes:v4];
    [(MFAtomTextView *)self _deleteCharactersInStorage:v5 ranges:v9 rangeToAdjust:&v11];
  }
  [v5 endEditing];
  [(MFAtomTextView *)self setNeedsLayout];
  [(MFAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v11, v12);
}

- (void)removeRepresentedObjects:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  [v5 beginEditing];
  uint64_t v18 = [(_MFAtomFieldEditor *)self->_textView selectedRange];
  uint64_t v19 = v6;
  id v17 = 0;
  id v7 = -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v5 length], &v17);
  id v8 = v17;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  unint64_t v14 = __43__MFAtomTextView_removeRepresentedObjects___block_invoke;
  id v15 = &unk_1E5F792B0;
  id v9 = v4;
  id v16 = v9;
  id v10 = [v7 indexesOfObjectsPassingTest:&v12];
  uint64_t v11 = objc_msgSend(v8, "objectsAtIndexes:", v10, v12, v13, v14, v15);
  [(MFAtomTextView *)self _deleteCharactersInStorage:v5 ranges:v11 rangeToAdjust:&v18];

  [v5 endEditing];
  [(MFAtomTextView *)self setNeedsLayout];
  [(MFAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v18, v19);
}

uint64_t __43__MFAtomTextView_removeRepresentedObjects___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)removeRepresentedObjectAtIndex:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  -[MFAtomTextView removeRepresentedObjectsAtIndexes:](self, "removeRepresentedObjectsAtIndexes:");
}

- (void)removeRepresentedObject:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(MFAtomTextView *)self removeRepresentedObjects:v6];
  }
}

- (void)setRepresentedObjects:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  [v5 beginEditing];
  objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v5, "length"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = -[MFAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
        [v5 appendAttributedString:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v5 endEditing];
  uint64_t v11 = [(_MFAtomFieldEditor *)self->_textView layoutManager];
  objc_msgSend(v11, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v5, "length"), 0);

  [(MFAtomTextView *)self setNeedsLayout];
  [(MFAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", [v5 length], 0);
}

- (void)addRepresentedObject:(id)a3
{
  id v9 = a3;
  id v4 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  [v4 beginEditing];
  BOOL v5 = [(MFAtomTextView *)self _baseAttributedStringWithRepresentedObject:v9];
  uint64_t v6 = [v4 length];
  uint64_t v7 = [v5 length];
  [v4 appendAttributedString:v5];
  [v4 endEditing];
  if (v7)
  {
    uint64_t v8 = [(_MFAtomFieldEditor *)self->_textView layoutManager];
    objc_msgSend(v8, "invalidateLayoutForCharacterRange:actualCharacterRange:", v6, v7, 0);
  }
  [(MFAtomTextView *)self setNeedsLayout];
  [(MFAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", [v4 length], 0);
}

- (id)_atomLayoutViewForRepresentedObject:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = [WeakRetained atomTextView:self atomViewForRepresentedObject:v4];

  objc_msgSend(v6, "setEnabled:", -[MFAtomTextView isEnabled](self, "isEnabled"));
  uint64_t v7 = [v6 viewForLastBaselineLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v7, "_setDrawsDebugBaselines:", -[MFAtomTextView _drawsDebugBaselines](self, "_drawsDebugBaselines"));
  }
  uint64_t v8 = +[_MFAtomLayoutView layoutViewWithDelegateView:v6];

  return v8;
}

- (id)_supportedPasteboardTypes
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v5 = [WeakRetained supportedPasteboardTypesForAtomTextView:self];

    id v2 = (void *)v5;
  }
  else
  {
    id v2 = 0;
  }
  if ([v2 count]) {
    uint64_t v6 = v2;
  }
  else {
    uint64_t v6 = (void *)*MEMORY[0x1E4FB2E48];
  }
  id v7 = v6;

  return v7;
}

- (id)_representedObjectsFromPasteboard:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 4) == 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        [WeakRetained atomTextView:self representedObjectsFromPasteboard:v4],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        WeakRetained,
        !v6))
  {
    uint64_t v7 = [v4 string];
    uint64_t v8 = (void *)v7;
    if (v7)
    {
      v10[0] = v7;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v6;
}

- (void)_storeRepresentedObjects:(id)a3 onPasteboard:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v15 = a4;
  if ((*(unsigned char *)&self->_flags & 8) == 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        char v7 = [WeakRetained atomTextView:self storeRepresentedObjects:v16 onPasteboard:v15],
        WeakRetained,
        (v7 & 1) == 0))
  {
    uint64_t v8 = [MEMORY[0x1E4F28E78] string];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v16;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v8 length]) {
              long long v14 = @" ";
            }
            else {
              long long v14 = &stru_1F0817A00;
            }
            [v8 appendFormat:@"%@%@", v14, v13];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v15 setString:v8];
  }
}

- (void)_insertRepresentedObjects:(id)a3 atCharacterRange:(_NSRange)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  _NSRange v48 = a4;
  id v36 = a3;
  id v4 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  v37 = v4;
  [v4 beginEditing];
  if (v48.length)
  {
    uint64_t v5 = [MEMORY[0x1E4F29238] valueWithRange:v48.location];
    v51[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
    [(MFAtomTextView *)self _deleteCharactersInStorage:v4 ranges:v6 rangeToAdjust:&v48];
  }
  char v7 = [v36 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v47 = 0;
    id v9 = -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, [v4 length], &v47);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v10 = v47;
    uint64_t v11 = (char *)[v10 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v44;
      do
      {
        long long v14 = 0;
        id v15 = &v11[(void)v12];
        do
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(v10);
          }
          NSUInteger v16 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)v14) rangeValue];
          if (v48.location >= v16 && v48.location - v16 < v17)
          {
            id v15 = &v14[(void)v12];
            uint64_t v11 = [v9 objectAtIndexedSubscript:&v14[(void)v12]];
            goto LABEL_18;
          }
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = (char *)[v10 countByEnumeratingWithState:&v43 objects:v50 count:16];
        uint64_t v12 = v15;
      }
      while (v11);
    }
    else
    {
      id v15 = 0;
    }
LABEL_18:

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = [v10 objectAtIndexedSubscript:v15];
      uint64_t v20 = [v19 rangeValue];
      uint64_t v22 = v21;

      if (v48.location != v20)
      {
        v48.NSUInteger location = v20 + v22;
        v48.NSUInteger length = 0;
      }
    }
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v23 = v36;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v49 count:16];
  NSUInteger length = 0;
  if (v24)
  {
    uint64_t v26 = *(void *)v40;
    NSUInteger v27 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v29 = [(MFAtomTextView *)self _baseAttributedStringWithRepresentedObject:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        [v37 insertAttributedString:v29 atIndex:v48.location];
        NSUInteger location = v48.location;
        uint64_t v31 = [v29 length];
        NSUInteger v32 = v31;
        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v27 = location;
          NSUInteger length = v31;
        }
        else
        {
          v52.NSUInteger location = location;
          v52.NSUInteger length = v32;
          v53.NSUInteger location = v27;
          v53.NSUInteger length = length;
          NSRange v33 = NSUnionRange(v52, v53);
          NSUInteger v27 = v33.location;
          NSUInteger length = v33.length;
        }
        v48.NSUInteger location = v32 + location;
        v48.NSUInteger length = 0;
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v24);
  }
  else
  {
    NSUInteger v27 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v34 = v37;
  [v37 endEditing];
  if (length)
  {
    uint64_t v35 = [(_MFAtomFieldEditor *)self->_textView layoutManager];
    objc_msgSend(v35, "invalidateLayoutForCharacterRange:actualCharacterRange:", v27, length, 0);

    v34 = v37;
  }
  [(MFAtomTextView *)self setNeedsLayout];
  [(MFAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v48.location, v48.length);
}

- (void)_removeRepresentedObjectsInCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  [v6 beginEditing];
  uint64_t v10 = [(_MFAtomFieldEditor *)self->_textView selectedRange];
  uint64_t v11 = v7;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(MFAtomTextView *)self _deleteCharactersInStorage:v6 ranges:v9 rangeToAdjust:&v10];

  [v6 endEditing];
  [(MFAtomTextView *)self setNeedsLayout];
  [(MFAtomTextView *)self sendActionsForControlEvents:0x20000];
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v10, v11);
}

- (UIEdgeInsets)_edgeInsetsForDirectionalInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  double leading = a3.leading;
  CGFloat top = a3.top;
  int v7 = [(MFAtomTextView *)self _shouldReverseLayoutDirection];
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

  -[MFAtomTextView convertRect:fromView:](self, "convertRect:fromView:", scrollView, v4 + v12, v6 + v11, v8 - (v12 + v14), v10 - (v11 + v13));
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_clearButtonImageForState:(unint64_t)a3
{
  double v6 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UITextFieldClearButton"];
  double v7 = [(MFAtomTextView *)self tintColor];
  if (!v7
    || ([MEMORY[0x1E4FB1618] systemBlueColor],
        double v3 = objc_claimAutoreleasedReturnValue(),
        [v7 isEqual:v3]))
  {
    id v8 = [MEMORY[0x1E4FB1618] colorWithRed:0.047 green:0.455 blue:0.867 alpha:1.0];
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
    id v9 = v8;
  }
  else
  {
    if (a3 == 2) {
      [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    }
    else {
    id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.275];
    }
  }
  double v10 = v9;
  double v11 = (void *)MEMORY[0x1E4FB1818];
  [v6 size];
  double v12 = objc_msgSend(v11, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v10, 0, v6, 0);

  return v12;
}

- (UIButton)clearButton
{
  clearButton = self->_clearButton;
  if (!clearButton)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14D0]);
    double v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->_clearButton;
    self->_clearButton = v5;

    [(UIButton *)self->_clearButton addTarget:self action:sel__clearButtonTapped_ forControlEvents:64];
    double v7 = self->_clearButton;
    id v8 = [(MFAtomTextView *)self _clearButtonImageForState:0];
    [(UIButton *)v7 setImage:v8 forState:0];

    id v9 = self->_clearButton;
    double v10 = [(MFAtomTextView *)self _clearButtonImageForState:1];
    [(UIButton *)v9 setImage:v10 forState:1];

    double v11 = self->_clearButton;
    double v12 = [(MFAtomTextView *)self _clearButtonImageForState:2];
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
  [(MFAtomTextView *)self _clearButtonSize];
  double v10 = v9;
  double v12 = v11;
  [(UIView *)self mf_currentScreenScale];
  if ([(MFAtomTextView *)self _shouldReverseLayoutDirection])
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
  [(MFAtomTextView *)self clearButtonInsets];
  -[MFAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
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
  uint64_t v8 = [(MFAtomTextView *)self _shouldReverseLayoutDirection] ^ 1;
  double v9 = [(MFAtomTextView *)self leadingView];
  -[MFAtomTextView _rectForBounds:sizingView:isLeft:](self, "_rectForBounds:sizingView:isLeft:", v9, v8, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  [(MFAtomTextView *)self leadingViewInsets];
  -[MFAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
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
  uint64_t v8 = [(MFAtomTextView *)self trailingView];
  -[MFAtomTextView _rectForBounds:sizingView:isLeft:](self, "_rectForBounds:sizingView:isLeft:", v8, [(MFAtomTextView *)self _shouldReverseLayoutDirection], x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  [(MFAtomTextView *)self trailingViewInsets];
  -[MFAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
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
  BOOL v7 = [(MFAtomTextView *)self isFirstResponder];
  BOOL v8 = v7 & [(MFAtomTextView *)self _hasContent];
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
  int64_t v3 = [(MFAtomTextView *)self clearButtonMode];
  BOOL v4 = [(MFAtomTextView *)self _hasContent];

  return [(MFAtomTextView *)self _showViewWithMode:v3 alwaysDefinition:v4];
}

- (BOOL)_showsLeadingView
{
  int64_t v3 = [(MFAtomTextView *)self leadingView];
  if (v3) {
    BOOL v4 = [(MFAtomTextView *)self _showViewWithMode:[(MFAtomTextView *)self leadingViewMode] alwaysDefinition:1];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_showsTrailingView
{
  int64_t v3 = [(MFAtomTextView *)self trailingView];
  BOOL v4 = v3
    && ![(MFAtomTextView *)self _showsClearButton]
    && [(MFAtomTextView *)self _showViewWithMode:[(MFAtomTextView *)self trailingViewMode] alwaysDefinition:1];

  return v4;
}

- (void)_layoutButtons
{
  [(MFAtomTextView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(MFAtomTextView *)self _showsClearButton])
  {
    id v14 = [(MFAtomTextView *)self clearButton];
    -[MFAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v14, "setFrame:");
    [(MFAtomTextView *)self addSubview:v14];
  }
  else
  {
    clearButton = self->_clearButton;
    if (clearButton) {
      [(UIButton *)clearButton removeFromSuperview];
    }
  }
  if ([(MFAtomTextView *)self _showsLeadingView])
  {
    id v15 = [(MFAtomTextView *)self leadingView];
    -[MFAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v15, "setFrame:");
    [(MFAtomTextView *)self addSubview:v15];
  }
  else
  {
    leadingView = self->_leadingView;
    if (leadingView) {
      [(UIView *)leadingView removeFromSuperview];
    }
  }
  if ([(MFAtomTextView *)self _showsTrailingView])
  {
    id v16 = [(MFAtomTextView *)self trailingView];
    -[MFAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v16, "setFrame:");
    [(MFAtomTextView *)self addSubview:v16];
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
      double v8 = __38__MFAtomTextView_setPlaceholderColor___block_invoke;
      double v9 = &unk_1E5F79038;
      double v10 = self;
      double v11 = v4;
      double v5 = (void (**)(void))_Block_copy(&v6);
      if (objc_msgSend(MEMORY[0x1E4FB1EB0], "areAnimationsEnabled", v6, v7, v8, v9, v10)) {
        [MEMORY[0x1E4FB1EB0] transitionWithView:self->_placeholderLabel duration:5242880 options:v5 animations:0 completion:0.35];
      }
      else {
        v5[2](v5);
      }
    }
  }
}

uint64_t __38__MFAtomTextView_setPlaceholderColor___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setTextColor:*(void *)(a1 + 40)];
}

- (UILabel)placeholderLabel
{
  placeholderLabel = self->_placeholderLabel;
  if (!placeholderLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_placeholderLabel;
    self->_placeholderLabel = v5;

    [(UILabel *)self->_placeholderLabel _setDrawsDebugBaselines:[(MFAtomTextView *)self _drawsDebugBaselines]];
    uint64_t v7 = [(MFAtomTextView *)self font];
    [(UILabel *)self->_placeholderLabel setFont:v7];

    double v8 = [(MFAtomTextView *)self placeholderColor];
    [(UILabel *)self->_placeholderLabel setTextColor:v8];

    double v9 = [(MFAtomTextView *)self placeholder];
    [(UILabel *)self->_placeholderLabel setText:v9];

    placeholderLabel = self->_placeholderLabel;
  }

  return placeholderLabel;
}

- (void)setPlaceholder:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  if (self->_placeholder != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copy];
    placeholder = self->_placeholder;
    self->_placeholder = v4;

    [(UILabel *)self->_placeholderLabel setText:self->_placeholder];
    [(MFAtomTextView *)self setNeedsLayout];
  }
}

- (CGRect)placeholderFrameForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UILabel sizeThatFits:](self->_placeholderLabel, "sizeThatFits:", a3.size.width, a3.size.height);
  [(UIView *)self mf_currentScreenScale];
  uint64_t v38 = v8;
  UIRectCenteredYInRectScale();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  char v17 = [(MFAtomTextView *)self _shouldReverseLayoutDirection];
  BOOL v18 = [(MFAtomTextView *)self _showsLeadingView];
  BOOL v19 = [(MFAtomTextView *)self _showsTrailingView];
  BOOL v20 = [(MFAtomTextView *)self _showsClearButton];
  int v21 = v19 || v20;
  double v39 = v16;
  if ((v17 & 1) == 0 && v18)
  {
    -[MFAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", x, y, width, height);
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
        -[MFAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", x, y, width, height);
      }
      else {
        -[MFAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", x, y, width, height);
      }
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  if (v21)
  {
    if (v20) {
      -[MFAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", x, y, width, height);
    }
    else {
      -[MFAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", x, y, width, height);
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
  -[MFAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", x, y, width, height);
LABEL_15:
  double v27 = v24 - (v26 + 16.0);
LABEL_19:
  [(MFAtomTextView *)self placeholderInsets];
  -[MFAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
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
  return ![(MFAtomTextView *)self _hasContent];
}

- (void)_layoutPlaceholder
{
  if ([(MFAtomTextView *)self _showsPlaceholder])
  {
    id v4 = [(MFAtomTextView *)self placeholderLabel];
    [(MFAtomTextView *)self bounds];
    -[MFAtomTextView placeholderFrameForBounds:](self, "placeholderFrameForBounds:");
    objc_msgSend(v4, "setFrame:");
    [(MFAtomTextView *)self addSubview:v4];
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
  double v32 = "";
  long long v3 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  long long v33 = *MEMORY[0x1E4FB2848];
  long long v34 = v3;
  [(MFAtomTextView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(MFAtomTextView *)self _shouldReverseLayoutDirection];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__MFAtomTextView_edgeInsets__block_invoke;
  aBlock[3] = &unk_1E5F792D8;
  void aBlock[4] = &v29;
  *(double *)&aBlock[5] = v5;
  *(double *)&aBlock[6] = v7;
  *(double *)&aBlock[7] = v9;
  *(double *)&aBlock[8] = v11;
  double v13 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if ([(MFAtomTextView *)self _showsClearButton])
  {
    -[MFAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12);
    uint64_t v14 = 7;
    if (v12) {
      uint64_t v14 = 5;
    }
    v30[v14] = v30[v14] + 7.0;
  }
  if ([(MFAtomTextView *)self _showsLeadingView])
  {
    -[MFAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12 ^ 1);
  }
  if ([(MFAtomTextView *)self _showsTrailingView])
  {
    -[MFAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12);
  }
  [(MFAtomTextView *)self textInsets];
  -[MFAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
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

double __28__MFAtomTextView_edgeInsets__block_invoke(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
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
  [(MFAtomTextView *)self _layoutPlaceholder];
  [(MFAtomTextView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MFAtomTextView *)self edgeInsets];
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
  -[_MFAtomFieldEditor sizeThatFits:](self->_textView, "sizeThatFits:", 1.79769313e308, CGRectGetHeight(v39));
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
  [(UIView *)self mf_currentScreenScale];
  uint64_t v37 = v28;
  UIRectCenteredYInRectScale();
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  [(_MFAtomFieldEditor *)self->_textView frame];
  v44.origin.double x = v30;
  v44.origin.double y = v32;
  v44.size.double width = v34;
  v44.size.double height = v36;
  if (!CGRectEqualToRect(v43, v44)) {
    -[_MFAtomFieldEditor setFrame:](self->_textView, "setFrame:", v30, v32, v34, v36);
  }
  [(MFAtomTextView *)self _layoutButtons];
  -[MFAtomTextView _updateBaselineConstraintIfNecessaryUsingTextViewFrame:](self, "_updateBaselineConstraintIfNecessaryUsingTextViewFrame:", v30, v32, v34, v36);

  [(MFAtomTextView *)self _scrollToSelectionIfNeeded];
}

- (void)setTextInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_textInsets.leading != a3.leading
    || self->_textInsets.top != a3.top
    || self->_textInsets.trailing != a3.trailing
    || self->_textInsets.bottom != a3.bottom)
  {
    self->_textInsets = a3;
    [(MFAtomTextView *)self setNeedsLayout];
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
    [(MFAtomTextView *)self setNeedsLayout];
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
    [(MFAtomTextView *)self setNeedsLayout];
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
    [(MFAtomTextView *)self setNeedsLayout];
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
    [(MFAtomTextView *)self setNeedsLayout];
  }
}

- (CGPoint)_firstGlyphBaselineLeftPointWithLayoutManager:(id)a3
{
  id v4 = a3;
  double v5 = [v4 textStorage];
  uint64_t v6 = [v5 length];
  if (!v6)
  {
    double v7 = [(MFAtomTextView *)self _baseAttributedStringWithRepresentedObject:@"X"];
    [v5 appendAttributedString:v7];
  }
  uint64_t v33 = 0;
  double v34 = &v33;
  uint64_t v35 = 0x3032000000;
  double v36 = __Block_byref_object_copy_;
  uint64_t v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = (double *)&v27;
  uint64_t v29 = 0x4010000000;
  double v30 = "";
  *(void *)&long long v8 = -1;
  *((void *)&v8 + 1) = -1;
  long long v31 = v8;
  long long v32 = v8;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__MFAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke;
  v26[3] = &unk_1E5F79300;
  v26[4] = &v27;
  v26[5] = &v33;
  objc_msgSend(v4, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, 1, v26);
  uint64_t v20 = 0;
  CGFloat v21 = (CGRect *)&v20;
  uint64_t v22 = 0x4010000000;
  CGFloat v23 = "";
  *(void *)&long long v9 = -1;
  *((void *)&v9 + 1) = -1;
  long long v24 = v9;
  long long v25 = v9;
  uint64_t v10 = v34[5];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__MFAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke_2;
  v19[3] = &unk_1E5F79328;
  v19[4] = &v20;
  objc_msgSend(v4, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", 0, 1, 0x7FFFFFFFFFFFFFFFLL, 0, v10, v19);
  [v4 baselineOffsetForGlyphAtIndex:0];
  double v12 = v11;
  CGFloat MinX = CGRectGetMinX(v21[1]);
  double v14 = v28[5];
  [(_MFAtomFieldEditor *)self->_textView textContainerInset];
  double v16 = v15;
  if (!v6) {
    objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v5, "length"));
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  double v17 = MinX;
  double v18 = v12 + v14 + v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

void __64__MFAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, unsigned char *a13)
{
  double v14 = *(double **)(*(void *)(a1 + 32) + 8);
  v14[4] = a7;
  v14[5] = a8;
  v14[6] = a9;
  v14[7] = a10;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  *a13 = 1;
}

uint64_t __64__MFAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke_2(uint64_t result, unsigned char *a2, double a3, double a4, double a5, double a6)
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
    double v3 = [_MFAtomTextViewBaselineLayoutStrut alloc];
    id v4 = -[_MFAtomTextViewBaselineLayoutStrut initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    baselineLayoutLabel = self->_baselineLayoutLabel;
    self->_baselineLayoutLabel = v4;

    uint64_t v6 = [(MFAtomTextView *)self font];
    [(_MFAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setFont:v6];

    [(_MFAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MFAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setHidden:1];
    [(MFAtomTextView *)self addSubview:self->_baselineLayoutLabel];
    LODWORD(v7) = 1148846080;
    [(_MFAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setContentCompressionResistancePriority:1 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(_MFAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel setContentHuggingPriority:1 forAxis:v8];
    long long v9 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v10 = _NSDictionaryOfVariableBindings(&cfstr_Baselinelayout.isa, self->_baselineLayoutLabel, 0);
    double v11 = [v9 constraintsWithVisualFormat:@"H:|[_baselineLayoutLabel(0)]" options:0 metrics:0 views:v10];
    [v9 activateConstraints:v11];

    double v12 = [(_MFAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel topAnchor];
    double v13 = [(MFAtomTextView *)self topAnchor];
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
      [(_MFAtomTextViewBaselineLayoutStrut *)baselineLayoutLabel frame];
      double v10 = v9;
      double v12 = v11;
      [(_MFAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel intrinsicContentSize];
      -[_MFAtomTextViewBaselineLayoutStrut setFrame:](self->_baselineLayoutLabel, "setFrame:", v10, v12, v13, v14);
      double v15 = [(_MFAtomFieldEditor *)self->_textView layoutManager];
      [(MFAtomTextView *)self _firstGlyphBaselineLeftPointWithLayoutManager:v15];

      UIRoundToViewScale();
      double v17 = v16;
      double v18 = [(_MFAtomFieldEditor *)self->_textView superview];
      -[MFAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v18, x, y, width, height);
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;

      v32.origin.double x = v20;
      v32.origin.double y = v22;
      v32.size.double width = v24;
      v32.size.double height = v26;
      double v27 = v17 + CGRectGetMinY(v32);
      [(_MFAtomTextViewBaselineLayoutStrut *)self->_baselineLayoutLabel _firstLineBaselineOffsetFromBoundsTop];
      double v29 = v27 - v28;
      baselineLayoutConstraint = self->_baselineLayoutConstraint;
      [(NSLayoutConstraint *)baselineLayoutConstraint setConstant:v29];
    }
  }
}

- (id)viewForLastBaselineLayout
{
  [(MFAtomTextView *)self _createBaselineLayoutStrutIfNecessary];
  baselineLayoutLabel = self->_baselineLayoutLabel;

  return baselineLayoutLabel;
}

- (id)_attachmentAtCharacterIndex:(unint64_t)a3
{
  id v4 = [(_MFAtomFieldEditor *)self->_textView textStorage];
  double v5 = [v4 attribute:*MEMORY[0x1E4FB06B8] atIndex:a3 effectiveRange:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (_NSRange)_characterRangeForAtomView:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3010000000;
  double v18 = "";
  long long v19 = xmmword_1AFA90620;
  if (v4)
  {
    double v5 = [(_MFAtomFieldEditor *)self->_textView textStorage];
    uint64_t v6 = [v5 length];
    uint64_t v7 = *MEMORY[0x1E4FB06B8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __45__MFAtomTextView__characterRangeForAtomView___block_invoke;
    v12[3] = &unk_1E5F79350;
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

void __45__MFAtomTextView__characterRangeForAtomView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_atomViews;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "bounds", (void)v17);
        -[MFAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v12);
        v25.origin.CGFloat x = v13;
        v25.origin.CGFloat y = v14;
        v25.size.CGFloat width = v15;
        v25.size.CGFloat height = v16;
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        CGRect v24 = CGRectIntersection(v23, v25);
        -[MFAtomTextView convertRect:toView:](self, "convertRect:toView:", v12, v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
        objc_msgSend(v12, "setMaskBounds:");
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)_tapRecognized:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [v4 locationInView:self];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    if (![(MFAtomTextView *)self isFirstResponder]) {
      [(MFAtomTextView *)self becomeFirstResponder];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = self->_atomViews;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          CGFloat v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          CGFloat v14 = objc_msgSend(v13, "delegateView", (void)v17);
          [v14 bounds];
          -[MFAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v14);
          v23.CGFloat x = v6;
          v23.CGFloat y = v8;
          if (CGRectContainsPoint(v24, v23))
          {
            uint64_t v16 = [(MFAtomTextView *)self _characterRangeForAtomView:v13];
            if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
              -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v16, v15);
            }

            goto LABEL_16;
          }
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
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
  [(MFAtomTextView *)self setRepresentedObjects:0];

  [(MFAtomTextView *)self becomeFirstResponder];
}

- (void)escKeyPressed:(id)a3
{
  id v4 = a3;
  if ([(MFAtomTextView *)self _showsClearButton]) {
    [(MFAtomTextView *)self _clearButtonTapped:v4];
  }
}

- (CGRect)_usedRectWithLayoutManager:(id)a3 textContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 usedRectForTextContainer:v7];
  double v9 = v8;
  double v11 = v10;
  [(_MFAtomFieldEditor *)self->_textView textContainerInset];
  double v13 = v12;
  [(_MFAtomFieldEditor *)self->_textView textContainerInset];
  double v15 = v14;
  [(_MFAtomFieldEditor *)self->_textView textContainerInset];
  double v17 = v16;
  [(_MFAtomFieldEditor *)self->_textView textContainerInset];
  double v18 = *MEMORY[0x1E4F1DAD8];
  double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v21 = v9 - (v17 + v20);

  double v22 = v18;
  double v23 = v19;
  double v24 = v21;
  double v25 = v11 - (v13 + v15);
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v5 && (*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    double v10 = [MEMORY[0x1E4F1CA80] setWithArray:self->_atomViews];
    double v29 = objc_msgSend(v8, "textStorage", v10);
    uint64_t v11 = [v29 length];
    uint64_t v12 = *MEMORY[0x1E4FB06B8];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __72__MFAtomTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke;
    v34[3] = &unk_1E5F79378;
    id v13 = v10;
    id v35 = v13;
    double v36 = self;
    id v14 = v8;
    id v37 = v14;
    id v15 = v9;
    id v38 = v15;
    objc_msgSend(v29, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, v34);
    if ([v13 count])
    {
      atomViews = self->_atomViews;
      double v17 = [v13 allObjects];
      [(NSMutableArray *)atomViews removeObjectsInArray:v17];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v18 = v13;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v31;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v30 + 1) + 8 * v21++) removeFromSuperview];
          }
          while (v19 != v21);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v19);
      }
    }
    [(MFAtomTextView *)self _usedRectWithLayoutManager:v14 textContainer:v15];
    [(UIView *)self mf_currentScreenScale];
    UIRectIntegralWithScale();
    double v23 = v22;
    double v25 = v24;
    [(UIScrollView *)self->_scrollView contentSize];
    if (v27 != v23 || v26 != v25) {
      -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v23, v25);
    }
    [(MFAtomTextView *)self _visibleAtomsRect];
    -[MFAtomTextView _updateAtomMasksInRect:](self, "_updateAtomMasksInRect:");
  }
}

void __72__MFAtomTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v23 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v23 atomView];
    [*(id *)(a1 + 32) removeObject:v7];
    id v8 = [v7 superview];

    if (!v8)
    {
      [*(id *)(*(void *)(a1 + 40) + 488) addSubview:v7];
      [*(id *)(*(void *)(a1 + 40) + 512) addObject:v7];
    }
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 48), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
    objc_msgSend(*(id *)(a1 + 48), "boundingRectForGlyphRange:inTextContainer:", v9, v10, *(void *)(a1 + 56));
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 488), "convertGlyphRect:");
    objc_msgSend(v7, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    objc_msgSend(*(id *)(a1 + 40), "mf_currentScreenScale");
    UIRectIntegralWithScale();
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [v7 frame];
    if (v16 != v20 || v18 != v19)
    {
      objc_msgSend(v7, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v16, v18);
      [v7 layoutSubviews];
    }
    uint64_t v21 = [v7 viewForLastBaselineLayout];
    [v21 frame];
    objc_msgSend(v7, "setFrame:", v12, v14 - v22, v16, v18);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_scrollView == a3)
  {
    [(MFAtomTextView *)self _visibleAtomsRect];
    -[MFAtomTextView _updateAtomMasksInRect:](self, "_updateAtomMasksInRect:");
  }
}

- (void)_scrollToSelectionIfNeeded
{
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    textView = self->_textView;
    uint64_t v4 = [(_MFAtomFieldEditor *)textView selectedRange];
    -[_MFAtomFieldEditor _rectForScrollToVisible:](textView, "_rectForScrollToVisible:", v4, v5);
    -[_MFAtomFieldEditor scrollRectToVisible:animated:](self->_textView, "scrollRectToVisible:animated:", 1);
    *(unsigned char *)&self->_flags &= ~0x40u;
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
}

- (void)textViewDidEndEditing:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 textStorage];
  objc_msgSend(v5, "setSelectedRange:", objc_msgSend(v4, "length"), 0);

  [(MFAtomTextView *)self sendActionsForControlEvents:0x40000];
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
    double v11 = [v9 textStorage];
    objc_msgSend(v9, "setSelectedRange:", objc_msgSend(v11, "length"), 0);

    [(MFAtomTextView *)self sendActionsForControlEvents:0x80000];
    BOOL v12 = 0;
    goto LABEL_4;
  }
  int v14 = [v10 isEqualToString:&stru_1F0817A00];
  if (length == 1) {
    int v15 = v14;
  }
  else {
    int v15 = 0;
  }
  if (v15 == 1)
  {
    double v16 = [(MFAtomTextView *)self _attachmentAtCharacterIndex:location];
    double v17 = [v16 atomView];

    if (v17 && ![v17 selectionStyle])
    {
      objc_msgSend(v9, "setSelectedRange:", location, length);
LABEL_19:
      BOOL v12 = 0;
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  BOOL v12 = 1;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0 && length == 1)
  {
    double v17 = [(MFAtomTextView *)self _attachmentAtCharacterIndex:location];
    double v18 = [v17 atomView];
    if (![v18 selectionStyle])
    {

      goto LABEL_20;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v20 = [v17 representedObject];
    char v21 = [WeakRetained _atomTextView:self shouldReplaceRepresentedObject:v20 replacementText:v10];

    if ((v21 & 1) == 0)
    {
      objc_msgSend(v9, "setSelectedRange:", location + 1, 0);
      [v9 insertText:v10];
      goto LABEL_19;
    }
LABEL_16:
    BOOL v12 = 1;
LABEL_20:
  }
LABEL_4:

  return v12;
}

- (void)textViewDidChange:(id)a3
{
  [(MFAtomTextView *)self setNeedsLayout];

  [(MFAtomTextView *)self sendActionsForControlEvents:0x20000];
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  double v18 = [v4 textStorage];
  id v5 = [v4 layoutManager];
  uint64_t v6 = objc_msgSend(v4, "selectedRange", v5);
  uint64_t v8 = v7;
  uint64_t v9 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v18, "length"), 0);
  uint64_t v11 = v10;
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x3032000000;
  double v29 = __Block_byref_object_copy_;
  long long v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__MFAtomTextView_textViewDidChangeSelection___block_invoke;
  v19[3] = &unk_1E5F793C8;
  id v12 = v5;
  id v20 = v12;
  id v13 = v18;
  id v21 = v13;
  uint64_t v24 = v6;
  uint64_t v25 = v8;
  id v14 = v4;
  id v22 = v14;
  id v23 = &v26;
  objc_msgSend(v12, "enumerateLineFragmentsForGlyphRange:usingBlock:", v9, v11, v19);
  int v15 = (void *)v27[5];
  textView = self->_textView;
  if (v15)
  {
    [v15 bounds];
    -[_MFAtomFieldEditor convertRect:fromView:](textView, "convertRect:fromView:", v27[5]);
  }
  else
  {
    -[_MFAtomFieldEditor _rectForScrollToVisible:](self->_textView, "_rectForScrollToVisible:", v6, v8);
  }
  -[_MFAtomFieldEditor scrollRectToVisible:animated:](self->_textView, "scrollRectToVisible:animated:", 1);
  if (*(unsigned char *)&self->_flags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained atomTextViewDidChangeSelection:self];
  }
  _Block_object_dispose(&v26, 8);
}

void __45__MFAtomTextView_textViewDidChangeSelection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  uint64_t v7 = v6;
  uint64_t v8 = *MEMORY[0x1E4FB06B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __45__MFAtomTextView_textViewDidChangeSelection___block_invoke_2;
  v12[3] = &unk_1E5F793A0;
  long long v15 = *(_OWORD *)(a1 + 64);
  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  id v13 = v10;
  uint64_t v14 = v11;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v8, v5, v7, 0, v12);
}

void __45__MFAtomTextView_textViewDidChangeSelection___block_invoke_2(void *a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v24 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v24 atomView];
    uint64_t v8 = 0;
    unint64_t v9 = a1[6];
    if (a3 >= v9)
    {
      unint64_t v10 = a1[7];
      if (a3 - v9 < v10)
      {
        uint64_t v11 = (void *)a1[4];
        id v12 = [v11 beginningOfDocument];
        id v13 = [v11 positionFromPosition:v12 offset:a3];
        uint64_t v14 = [v11 baseWritingDirectionForPosition:v13 inDirection:0];
        BOOL v15 = a3 + a4 == v10 + v9;
        BOOL v16 = a3 == v9;

        if (v14 == 1) {
          BOOL v17 = v15;
        }
        else {
          BOOL v17 = v16;
        }
        if (v14 == 1) {
          BOOL v18 = v16;
        }
        else {
          BOOL v18 = v15;
        }
        int v19 = v17 || v18;
        BOOL v20 = !v17;
        uint64_t v21 = 4;
        if (v20) {
          uint64_t v21 = 0;
        }
        BOOL v20 = !v18;
        uint64_t v22 = 8;
        if (v20) {
          uint64_t v22 = 0;
        }
        uint64_t v23 = v21 | v22;
        if (v19) {
          uint64_t v8 = v23;
        }
        else {
          uint64_t v8 = 1;
        }
        objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v7);
      }
    }
    [v7 setSelectionStyle:v8 animated:0];
  }
}

- (void)_textStorageDidProcessEditing:(id)a3
{
  if ([(_MFAtomFieldEditor *)self->_textView isSelectable])
  {
    if ([(MFAtomTextView *)self isFirstResponder]) {
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
  NSUInteger v2 = [(_MFAtomFieldEditor *)self->_textView selectionRange];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (BOOL)hasContent
{
  return [(_MFAtomFieldEditor *)self->_textView hasContent];
}

- (void)selectAll
{
}

- (BOOL)hasSelection
{
  return [(_MFAtomFieldEditor *)self->_textView hasSelection];
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  uint64_t v5 = [(_MFAtomFieldEditor *)self->_textView rangeEnclosingPosition:a3 withGranularity:a4 inDirection:a5];

  return v5;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return [(_MFAtomFieldEditor *)self->_textView isPosition:a3 atBoundary:a4 inDirection:a5];
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return [(_MFAtomFieldEditor *)self->_textView isPosition:a3 withinTextUnit:a4 inDirection:a5];
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  uint64_t v5 = [(_MFAtomFieldEditor *)self->_textView positionFromPosition:a3 toBoundary:a4 inDirection:a5];

  return v5;
}

- (BOOL)_cursorAccessoriesVisible
{
  return 0;
}

- (id)_cursorAccessories
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return [(_MFAtomFieldEditor *)self->_textView baseWritingDirectionForPosition:a3 inDirection:a4];
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
}

- (CGRect)firstRectForRange:(id)a3
{
  [(_MFAtomFieldEditor *)self->_textView firstRectForRange:a3];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  [(_MFAtomFieldEditor *)self->_textView caretRectForPosition:a3];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  double v3 = [(_MFAtomFieldEditor *)self->_textView selectionRectsForRange:a3];

  return v3;
}

- (id)textInRange:(id)a3
{
  double v3 = [(_MFAtomFieldEditor *)self->_textView textInRange:a3];

  return v3;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
}

- (BOOL)hasText
{
  return [(_MFAtomFieldEditor *)self->_textView hasText];
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
  return (id)-[_MFAtomFieldEditor characterRangeAtPoint:](self->_textView, "characterRangeAtPoint:", a3.x, a3.y);
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  double v4 = [(_MFAtomFieldEditor *)self->_textView characterRangeByExtendingPosition:a3 inDirection:a4];

  return v4;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  double v4 = [(_MFAtomFieldEditor *)self->_textView textRangeFromPosition:a3 toPosition:a4];

  return v4;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  double v4 = [(_MFAtomFieldEditor *)self->_textView positionFromPosition:a3 offset:a4];

  return v4;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  double v5 = [(_MFAtomFieldEditor *)self->_textView positionFromPosition:a3 inDirection:a4 offset:a5];

  return v5;
}

- (id)positionWithinRange:(id)a3 atCharacterOffset:(int64_t)a4
{
  double v4 = [(_MFAtomFieldEditor *)self->_textView positionWithinRange:a3 atCharacterOffset:a4];

  return v4;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  double v4 = [(_MFAtomFieldEditor *)self->_textView positionWithinRange:a3 farthestInDirection:a4];

  return v4;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return (id)-[_MFAtomFieldEditor closestPositionToPoint:](self->_textView, "closestPositionToPoint:", a3.x, a3.y);
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double v4 = -[_MFAtomFieldEditor closestPositionToPoint:withinRange:](self->_textView, "closestPositionToPoint:withinRange:", a4, a3.x, a3.y);

  return v4;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return [(_MFAtomFieldEditor *)self->_textView comparePosition:a3 toPosition:a4];
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return [(_MFAtomFieldEditor *)self->_textView offsetFromPosition:a3 toPosition:a4];
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
}

- (id)textInputTraits
{
  textInputTraits = self->_textInputTraits;
  if (!textInputTraits)
  {
    double v4 = (UITextInputTraits *)objc_alloc_init(MEMORY[0x1E4FB1D98]);
    double v5 = self->_textInputTraits;
    self->_textInputTraits = v4;

    textInputTraits = self->_textInputTraits;
  }

  return textInputTraits;
}

- (void)takeTraitsFrom:(id)a3
{
  id v5 = a3;
  double v4 = [(MFAtomTextView *)self textInputTraits];
  [v4 takeTraitsFrom:v5];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ([(id)objc_opt_class() instancesRespondToSelector:a3])
  {
    id v5 = [(MFAtomTextView *)self textInputTraits];
  }
  else if ([(id)objc_opt_class() instancesRespondToSelector:a3])
  {
    id v5 = self->_textView;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MFAtomTextView;
    id v5 = [(MFAtomTextView *)&v7 forwardingTargetForSelector:a3];
  }

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  double v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    objc_super v7 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
    uint64_t v8 = v7;
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
  v7.super_class = (Class)MFAtomTextView;
  if (-[MFAtomTextView respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(MFAtomTextView *)self textInputTraits];
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
  v7[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v2 = (void *)keyCommands_keyCommands;
  if (!keyCommands_keyCommands)
  {
    double v3 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_escKeyPressed_];
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    id v5 = (void *)keyCommands_keyCommands;
    keyCommands_keyCommands = v4;

    NSUInteger v2 = (void *)keyCommands_keyCommands;
  }

  return v2;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  BOOL v7 = sel__clearButtonTapped_ == a3
    || sel_escKeyPressed_ == a3 && [(MFAtomTextView *)self _showsClearButton]
    || [(_MFAtomFieldEditor *)self->_textView canPerformAction:a3 withSender:v6];

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return [(_MFAtomFieldEditor *)self->_textView canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [(_MFAtomFieldEditor *)self->_textView becomeFirstResponder];
}

- (BOOL)canResignFirstResponder
{
  return [(_MFAtomFieldEditor *)self->_textView canResignFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [(_MFAtomFieldEditor *)self->_textView resignFirstResponder];
}

- (BOOL)isFirstResponder
{
  return [(_MFAtomFieldEditor *)self->_textView isFirstResponder];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MFAtomTextView;
  -[MFAtomTextView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (MFAtomTextView *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self || v5 == (MFAtomTextView *)self->_textView)
  {
    BOOL v7 = [(UIButton *)self->_clearButton superview];
    if (v7 != self)
    {
      uint64_t v8 = [(UIView *)self->_leadingView superview];
      if (v8 != self)
      {
        [(UIView *)self->_trailingView superview];
      }
    }
  }

  return v6;
}

- (MFAtomTextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFAtomTextViewDelegate *)WeakRetained;
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

uint64_t __24___MFAtomTextView_atoms__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __60___MFAtomTextView_enumerateAtomsInCharacterRange_withBlock___block_invoke(uint64_t a1, void *a2)
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

void __44___MFAtomTextView_enumerateAtomAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:*MEMORY[0x1E4FB06B8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __42___MFAtomTextView_selectionRectsForRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  BOOL v7 = [a2 objectForKey:*MEMORY[0x1E4FB06B8]];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v22 = *(void **)(a1 + 32);
    uint64_t v23 = [v22 beginningOfDocument];
    objc_super v10 = [v22 positionFromPosition:v23 offset:a3];

    uint64_t v21 = [*(id *)(a1 + 32) positionFromPosition:v10 offset:a4];
    id v24 = [*(id *)(a1 + 32) textRangeFromPosition:v10 toPosition:v21];
    uint64_t v25 = *(void **)(a1 + 40);
    v27.receiver = *(id *)(a1 + 32);
    v27.super_class = (Class)_MFAtomTextView;
    uint64_t v26 = objc_msgSendSuper2(&v27, sel_selectionRectsForRange_, v24);
    [v25 addObjectsFromArray:v26];

    goto LABEL_8;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  objc_super v10 = [v7 atomView];
  uint64_t v11 = *(void **)(a1 + 32);
  [v10 selectionFrame];
  objc_msgSend(v11, "convertRect:fromView:", v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (a3 == v8)
  {
    BOOL v20 = objc_alloc_init(_MFAtomTextSelectionRect);
    -[_MFAtomTextSelectionRect setRect:](v20, "setRect:", v13, v15, 0.0, v19);
    [(_MFAtomTextSelectionRect *)v20 setContainsStart:1];
    [*(id *)(a1 + 40) addObject:v20];
  }
  if (v9 + v8 == a3 + a4)
  {
    uint64_t v21 = objc_alloc_init(_MFAtomTextSelectionRect);
    -[_MFAtomTextSelectionRect setRect:](v21, "setRect:", v13 + v17, v15, 0.0, v19);
    [(_MFAtomTextSelectionRect *)v21 setContainsEnd:1];
    [*(id *)(a1 + 40) addObject:v21];
LABEL_8:
  }
}

@end