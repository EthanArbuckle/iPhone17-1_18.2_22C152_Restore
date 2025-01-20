@interface CKBalloonTextView
+ (BOOL)_textEffectsBalloonDebugHighlightingEnabled;
+ (CGSize)_textKit1_sizeThatFits:(CGSize)a3 attributedText:(id)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 isReplyPreview:(BOOL)a7 outTextAlignmentInsets:(UIEdgeInsets *)a8 outIsSingleLine:(BOOL *)a9;
+ (CGSize)_textKit2_sizeThatFits:(CGSize)a3 attributedText:(id)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 isReplyPreview:(BOOL)a7 outTextAlignmentInsets:(UIEdgeInsets *)a8 outIsSingleLine:(BOOL *)a9;
+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 isReplyPreview:(BOOL)a7 outTextAlignmentInsets:(UIEdgeInsets *)a8 outIsSingleLine:(BOOL *)a9;
+ (id)makeTextView;
+ (id)makeTextViewUsingConfiguration:(id)a3;
+ (id)makeTextViewUsingTextKit1;
+ (id)makeTextViewUsingTextKit2UsingConfiguration:(id)a3;
+ (void)_commonTextViewContainerSetup:(id)a3;
- (BOOL)_showsEditMenu;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isFakeSelected;
- (BOOL)resignFirstResponder;
- (BOOL)shouldAdjustInsetsForMinimumSize;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5 isReplyPreview:(BOOL)a6;
- (CKBalloonTextViewInteractionDelegate)interactionDelegate;
- (NSAttributedString)attributedText;
- (NSString)description;
- (UIPanGestureRecognizer)dragGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (_NSRange)_selectedRange;
- (char)selectionColorType;
- (id)_fakeSelectionBackgroundColor;
- (id)_textWithHyphenationAppliedForAttributedText:(id)a3;
- (id)initReadonlyAndUnselectableWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)selectionHighlightColor;
- (void)_displayAttributedTextIfPossible:(id)a3 applyHyphenation:(BOOL)a4;
- (void)_interactionStartedFromPreviewItemController:(id)a3;
- (void)_interactionStoppedFromPreviewItemController:(id)a3;
- (void)_removeFakeSelectionBackgroundColor;
- (void)_setFakeSelectionBackgroundColor;
- (void)_setFakeSelectionBackgroundColorForRange:(_NSRange)a3;
- (void)_updateFakeSelectionBackgroundColor:(id)a3;
- (void)copy:(id)a3;
- (void)didMoveToWindow;
- (void)panGestureRecognized:(id)a3;
- (void)setAllowsTextAnimations:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setBalloonTextSelectedRange:(_NSRange)a3;
- (void)setDragGestureRecognizer:(id)a3;
- (void)setFakeSelected:(BOOL)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setSelectionColorType:(char)a3;
- (void)setShouldAdjustInsetsForMinimumSize:(BOOL)a3;
- (void)set_selectedRange:(_NSRange)a3;
- (void)viewDidMoveToSuperview;
@end

@implementation CKBalloonTextView

+ (id)makeTextView
{
  v3 = +[CKBalloonTextViewConfiguration defaultConfiguration];
  v4 = [a1 makeTextViewUsingConfiguration:v3];

  return v4;
}

+ (id)makeTextViewUsingConfiguration:(id)a3
{
  id v4 = a3;
  if ([v4 textKit2Enabled]) {
    [a1 makeTextViewUsingTextKit2UsingConfiguration:v4];
  }
  else {
  v5 = [a1 makeTextViewUsingTextKit1];
  }
  [v5 setShowsVerticalScrollIndicator:0];
  [v5 setShowsHorizontalScrollIndicator:0];
  [v5 setBackgroundColor:0];
  [v5 setContentMode:11];
  v6 = +[CKUIBehavior sharedBehaviors];
  int v7 = [v6 enableBalloonTextSelection];

  if (v7)
  {
    [v5 setSelectable:1];
    [v5 setTextLoupeVisibility:1];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:v5 action:sel_panGestureRecognized_];
    [v8 setDelegate:v5];
    [v8 setCancelsTouchesInView:0];
    [v8 setName:@"panGestureRecognizer"];
    [v8 setRequiresExclusiveTouchType:0];
    [v8 setAllowedScrollTypesMask:3];
    [v5 addGestureRecognizer:v8];
    [v5 setDragGestureRecognizer:v8];
  }
  else
  {
    [v5 setUserInteractionEnabled:0];
  }
  [v5 setLinkTextAttributes:MEMORY[0x1E4F1CC08]];

  return v5;
}

+ (void)_commonTextViewContainerSetup:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "setSize:", 0.0, 1.79769313e308);
  [v3 setWidthTracksTextView:1];
  [v3 setHeightTracksTextView:1];
}

+ (id)makeTextViewUsingTextKit2UsingConfiguration:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB0888];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  int v7 = objc_alloc_init(CKTextStorage);
  [v6 setTextStorage:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4FB0890]);
  id v9 = objc_alloc_init(MEMORY[0x1E4FB0880]);
  [v8 setTextContainer:v9];
  [v6 addTextLayoutManager:v8];
  int v10 = [a1 instancesRespondToSelector:sel_initReadonlyAndUnselectableWithFrame_textContainer_textLayoutManagerEnabled_];
  id v11 = objc_alloc((Class)a1);
  double v12 = *MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (v10) {
    uint64_t v16 = objc_msgSend(v11, "initReadonlyAndUnselectableWithFrame:textContainer:textLayoutManagerEnabled:", v9, 1, v12, v13, v14, v15);
  }
  else {
    uint64_t v16 = objc_msgSend(v11, "initWithFrame:textContainer:", v9, v12, v13, v14, v15);
  }
  v17 = (void *)v16;
  int v18 = [v5 expressiveTextEnabled];

  if (v18)
  {
    if ((objc_msgSend(MEMORY[0x1E4F42F58], "ck_supportsDynamicallyTogglingAllowsTextAnimations") & 1) == 0) {
      [v17 setAllowsTextAnimations:1];
    }
    v19 = [v17 textLayoutManager];
    [v19 setRequiresCTLineRef:1];
  }
  v20 = [v17 textContainer];
  [a1 _commonTextViewContainerSetup:v20];

  if ((v10 & 1) == 0)
  {
    [v17 setSelectable:0];
    [v17 setEditable:0];
    [v17 setScrollEnabled:0];
  }

  return v17;
}

+ (id)makeTextViewUsingTextKit1
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB0880]);
  [a1 _commonTextViewContainerSetup:v3];
  id v4 = objc_alloc_init(CKTextStorage);
  id v5 = objc_alloc_init(MEMORY[0x1E4FB0840]);
  [v5 setAllowsNonContiguousLayout:1];
  [v5 addTextContainer:v3];
  [(CKTextStorage *)v4 addLayoutManager:v5];
  int v6 = [a1 instancesRespondToSelector:sel_initReadonlyAndUnselectableWithFrame_textContainer_textLayoutManagerEnabled_];
  id v7 = objc_alloc((Class)a1);
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (v6) {
    uint64_t v12 = objc_msgSend(v7, "initReadonlyAndUnselectableWithFrame:textContainer:textLayoutManagerEnabled:", v3, 0, v8, v9, v10, v11);
  }
  else {
    uint64_t v12 = objc_msgSend(v7, "initReadonlyAndUnselectableWithFrame:textContainer:", v3, v8, v9, v10, v11);
  }
  double v13 = (void *)v12;

  return v13;
}

- (id)selectionHighlightColor
{
  id v3 = [(CKBalloonTextView *)self superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_3;
  }
  id v5 = [(CKBalloonTextView *)self superview];
  int v6 = +[CKUIBehavior sharedBehaviors];
  id v7 = [v6 theme];
  double v8 = objc_msgSend(v7, "selectionHighlightColorOverrideForColorType:", objc_msgSend(v5, "color"));

  if (!v8)
  {
LABEL_3:
    v10.receiver = self;
    v10.super_class = (Class)CKBalloonTextView;
    double v8 = [(CKBalloonTextView *)&v10 selectionHighlightColor];
  }

  return v8;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(CKBalloonTextView *)self frame];
  int v6 = NSStringFromCGRect(v17);
  if ([(CKBalloonTextView *)self clipsToBounds]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  if ([(CKBalloonTextView *)self isOpaque]) {
    double v8 = @"YES";
  }
  else {
    double v8 = @"NO";
  }
  if ([(CKBalloonTextView *)self isUserInteractionEnabled]) {
    double v9 = @"YES";
  }
  else {
    double v9 = @"NO";
  }
  [(CKBalloonTextView *)self contentOffset];
  objc_super v10 = NSStringFromCGPoint(v15);
  [(CKBalloonTextView *)self contentSize];
  double v11 = NSStringFromCGSize(v16);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; frame = %@; clipsToBounds = %@; opaque = %@; userInteractionEnabled = %@; contentOffset = %@; contentSize = %@>",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
  uint64_t v12 = v11);

  return (NSString *)v12;
}

- (id)initReadonlyAndUnselectableWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CKBalloonTextView;
  id v4 = -[CKBalloonTextView initReadonlyAndUnselectableWithFrame:textContainer:](&v11, sel_initReadonlyAndUnselectableWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    id v5 = +[CKUIBehavior sharedBehaviors];
    [v5 balloonTextContainerInset];
    objc_msgSend(v4, "setTextContainerInset:");

    int v6 = [v4 textContainer];
    id v7 = +[CKUIBehavior sharedBehaviors];
    [v7 balloonLineFragmentPadding];
    objc_msgSend(v6, "setLineFragmentPadding:");

    double v8 = [v4 layoutManager];
    [v8 setBackgroundLayoutEnabled:0];

    double v9 = [v4 layoutManager];
    [v9 setSynchronizesAlignmentToDirection:1];

    [v4 setShouldPresentSheetsInAWindowLayeredAboveTheKeyboard:1];
    [v4 registerForEvents];
  }
  return v4;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CKBalloonTextView;
  [(CKBalloonTextView *)&v4 didMoveToWindow];
  id v3 = [(CKBalloonTextView *)self attributedText];
  [(CKBalloonTextView *)self _displayAttributedTextIfPossible:v3 applyHyphenation:1];
}

- (void)viewDidMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)CKBalloonTextView;
  [(CKBalloonTextView *)&v4 viewDidMoveToSuperview];
  id v3 = [(CKBalloonTextView *)self attributedText];
  [(CKBalloonTextView *)self _displayAttributedTextIfPossible:v3 applyHyphenation:1];
}

- (void)_displayAttributedTextIfPossible:(id)a3 applyHyphenation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isTextKit2Enabled];

  if (v8) {
    [(CKBalloonTextView *)self superview];
  }
  else {
  double v9 = [(CKBalloonTextView *)self window];
  }
  objc_super v10 = +[CKPrintController sharedInstance];
  char v11 = [v10 isPrinting];

  if ((v11 & 1) != 0 || v9)
  {
    id v12 = v6;
    if (v4)
    {
      uint64_t v13 = [(CKBalloonTextView *)self _textWithHyphenationAppliedForAttributedText:v12];

      id v12 = (id)v13;
    }
    v14.receiver = self;
    v14.super_class = (Class)CKBalloonTextView;
    [(CKBalloonTextView *)&v14 setAttributedText:v12];
  }
}

- (void)setAttributedText:(id)a3
{
  if (self->_attributedText != a3)
  {
    -[CKBalloonTextView _textWithHyphenationAppliedForAttributedText:](self, "_textWithHyphenationAppliedForAttributedText:");
    BOOL v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    attributedText = self->_attributedText;
    self->_attributedText = v4;

    id v6 = self->_attributedText;
    [(CKBalloonTextView *)self _displayAttributedTextIfPossible:v6 applyHyphenation:0];
  }
}

- (id)_textWithHyphenationAppliedForAttributedText:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];
  BOOL v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = [v4 balloonParagraphStyle];

  if (!v5)
  {
    id v5 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  }
  objc_msgSend(v3, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v5, 0, objc_msgSend(v3, "length"));

  return v3;
}

- (void)copy:(id)a3
{
  id v4 = [(CKBalloonTextView *)self interactionDelegate];
  [v4 interactionTextViewShouldCopyToPasteboard:self];
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5 isReplyPreview:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.height;
  double width = a3.width;
  id v12 = [(CKBalloonTextView *)self attributedText];
  uint64_t v13 = [(CKBalloonTextView *)self textContainer];
  +[CKBalloonTextView sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:](CKBalloonTextView, "sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:", v12, [v13 maximumNumberOfLines], objc_msgSend(v13, "lineBreakMode"), v6, a4, a5, width, height);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 isReplyPreview:(BOOL)a7 outTextAlignmentInsets:(UIEdgeInsets *)a8 outIsSingleLine:(BOOL *)a9
{
  BOOL v11 = a7;
  double height = a3.height;
  double width = a3.width;
  double v17 = (void *)MEMORY[0x1E4F6E778];
  id v18 = a4;
  double v19 = [v17 sharedFeatureFlags];
  int v20 = [v19 isTextKit2Enabled];

  if (v20) {
    objc_msgSend(a1, "_textKit2_sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:", v18, a5, a6, v11, a8, a9, width, height);
  }
  else {
    objc_msgSend(a1, "_textKit1_sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:", v18, a5, a6, v11, a8, a9, width, height);
  }
  double v23 = v21;
  double v24 = v22;

  double v25 = v23;
  double v26 = v24;
  result.double height = v26;
  result.double width = v25;
  return result;
}

+ (CGSize)_textKit1_sizeThatFits:(CGSize)a3 attributedText:(id)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 isReplyPreview:(BOOL)a7 outTextAlignmentInsets:(UIEdgeInsets *)a8 outIsSingleLine:(BOOL *)a9
{
  BOOL v11 = a7;
  double width = a3.width;
  id v15 = a4;
  if (_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__once != -1) {
    dispatch_once(&_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__once, &__block_literal_global_255);
  }
  [(id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer setMaximumNumberOfLines:a5];
  [(id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer setLineBreakMode:a6];
  if (v15)
  {
    [(id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage beginEditing];
    [(id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage setAttributedString:v15];
    [(id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage endEditing];
  }
  [(id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer lineFragmentPadding];
  double v17 = width + v16 * 2.0;
  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer, "setSize:", v17, 1.79769313e308);
  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer, "sizeThatFits:textAlignmentInsets:isSingleLine:", a8, a9, v17, 1.79769313e308);
  double v19 = v18;
  double v21 = v20;
  double v22 = +[CKUIBehavior sharedBehaviors];
  double v23 = v22;
  if (v11) {
    [v22 replyBalloonTextContainerInset];
  }
  else {
    [v22 balloonTextContainerInset];
  }
  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;

  if (a8)
  {
    CGFloat v32 = v29 + a8->left;
    CGFloat v33 = v30 + a8->bottom;
    CGFloat v34 = v31 + a8->right;
    a8->top = v28 + a8->top;
    a8->left = v32;
    a8->bottom = v33;
    a8->right = v34;
  }

  double v35 = v19 + v29 + v31;
  double v36 = v21 + v28 + v30;
  result.double height = v36;
  result.double width = v35;
  return result;
}

uint64_t __148__CKBalloonTextView__textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB0840]);
  v1 = (void *)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager;
  _textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4FB0880]);
  id v3 = (void *)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer;
  _textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer = (uint64_t)v2;

  [(id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager addTextContainer:_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer];
  [(id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager setAllowsNonContiguousLayout:1];
  id v4 = objc_alloc_init(CKTextStorage);
  id v5 = (void *)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage;
  _textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage = (uint64_t)v4;

  [(id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage addLayoutManager:_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager];
  BOOL v6 = (void *)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer;
  id v7 = +[CKUIBehavior sharedBehaviors];
  [v7 balloonLineFragmentPadding];
  objc_msgSend(v6, "setLineFragmentPadding:");

  [(id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager setBackgroundLayoutEnabled:0];
  int v8 = (void *)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager;

  return [v8 setSynchronizesAlignmentToDirection:1];
}

+ (CGSize)_textKit2_sizeThatFits:(CGSize)a3 attributedText:(id)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 isReplyPreview:(BOOL)a7 outTextAlignmentInsets:(UIEdgeInsets *)a8 outIsSingleLine:(BOOL *)a9
{
  BOOL v11 = a7;
  double height = a3.height;
  double width = a3.width;
  id v16 = a4;
  if (_textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__once != -1) {
    dispatch_once(&_textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__once, &__block_literal_global_113_1);
  }
  double v17 = +[CKUIBehavior sharedBehaviors];
  if (!v16)
  {
    id v16 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EDE4CA38];
    double v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[CKBalloonTextView _textKit2_sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:](v18);
    }
  }
  double v19 = [[CKTextMetricsRequest alloc] initWithAttributedString:v16];
  [v17 balloonLineFragmentPadding];
  -[CKTextMetricsRequest setLineFragmentPadding:](v19, "setLineFragmentPadding:");
  [(CKTextMetricsRequest *)v19 setLineBreakMode:a6];
  [(CKTextMetricsRequest *)v19 setMaximumNumberOfLines:a5];
  [(CKTextMetricsRequest *)v19 setMaximumWidth:width];
  [(CKTextMetricsRequest *)v19 setMaximumHeight:height];
  [(CKTextMetricsRequest *)v19 setAlreadyPadded:0];
  if (v11) {
    [v17 replyBalloonTextContainerInset];
  }
  else {
    [v17 balloonTextContainerInset];
  }
  -[CKTextMetricsRequest setContainerInset:](v19, "setContainerInset:");
  double v20 = [(id)_textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__metricsProvider metricsForRequest:v19];
  [v20 size];
  double v22 = v21;
  double v24 = v23;
  if (a8)
  {
    [v20 alignmentInset];
    a8->top = v25;
    a8->left = v26;
    a8->bottom = v27;
    a8->right = v28;
  }
  if (a9) {
    *a9 = [v20 isSingleLine];
  }

  double v29 = v22;
  double v30 = v24;
  result.double height = v30;
  result.double width = v29;
  return result;
}

void __148__CKBalloonTextView__textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine___block_invoke()
{
  id v0 = objc_alloc_init(CKTextMetricsProvider);
  v1 = (void *)_textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__metricsProvider;
  _textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__metricsProvider = (uint64_t)v0;
}

- (void)_interactionStartedFromPreviewItemController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKBalloonTextView;
  [(CKBalloonTextView *)&v5 _interactionStartedFromPreviewItemController:a3];
  id v4 = [(CKBalloonTextView *)self interactionDelegate];
  [v4 interactionStartedFromPreviewItemControllerInTextView:self];
}

- (void)_interactionStoppedFromPreviewItemController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKBalloonTextView;
  [(CKBalloonTextView *)&v5 _interactionStoppedFromPreviewItemController:a3];
  id v4 = [(CKBalloonTextView *)self interactionDelegate];
  [v4 interactionStoppedFromPreviewItemControllerInTextView:self];
}

- (void)panGestureRecognized:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  double v7 = v6;
  [(CKBalloonTextView *)self bounds];
  v10.x = v5;
  v10.y = v7;
  if (CGRectContainsPoint(v11, v10))
  {
    if ([(CKBalloonTextView *)self isFakeSelected])
    {
      [(CKBalloonTextView *)self setFakeSelected:0];
    }
  }
  else
  {
    id v8 = [(CKBalloonTextView *)self interactionDelegate];
    objc_msgSend(v8, "interactionTextView:userDidDragOutsideViewWithPoint:", self, v5, v7);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBalloonTextView *)self dragGestureRecognizer];

  BOOL v6 = v5 != v4 || [v4 buttonMask] == 1;
  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_setFakeSelectionBackgroundColor
{
  id v3 = [(CKBalloonTextView *)self attributedText];
  uint64_t v4 = [v3 length];

  -[CKBalloonTextView _setFakeSelectionBackgroundColorForRange:](self, "_setFakeSelectionBackgroundColorForRange:", 0, v4);
}

- (id)_fakeSelectionBackgroundColor
{
  uint64_t v4 = +[CKUIBehavior sharedBehaviors];
  int v5 = [v4 enableBalloonTextSelection];

  if (v5)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CKBalloonTextView.m" lineNumber:538 description:@"Need to set colors for fakeSelectionBackgroundColor for iPad"];
  }
  return 0;
}

- (void)_setFakeSelectionBackgroundColorForRange:(_NSRange)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    BOOL v6 = [(CKBalloonTextView *)self attributedText];
    double v7 = (void *)[v6 mutableCopy];

    NSUInteger v8 = [v7 length];
    v22.NSUInteger location = location;
    v22.NSUInteger length = length;
    v25.NSUInteger location = 0;
    v25.NSUInteger length = v8;
    NSRange v9 = NSIntersectionRange(v22, v25);
    if (location != v9.location || length != v9.length)
    {
      CGPoint v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v23.NSUInteger location = 0;
        v23.NSUInteger length = v8;
        id v12 = NSStringFromRange(v23);
        v24.NSUInteger location = location;
        v24.NSUInteger length = length;
        uint64_t v13 = NSStringFromRange(v24);
        double v14 = NSStringFromRange(v9);
        int v15 = 138412802;
        id v16 = v12;
        __int16 v17 = 2112;
        double v18 = v13;
        __int16 v19 = 2112;
        double v20 = v14;
        _os_log_error_impl(&dword_18EF18000, v10, OS_LOG_TYPE_ERROR, "Attempted to add selection on textRange: %@ with invalid range: %@, corrected to validatedRange: %@", (uint8_t *)&v15, 0x20u);
      }
    }
    [(CKBalloonTextView *)self _removeFakeSelectionBackgroundColor];
    CGRect v11 = [(CKBalloonTextView *)self _fakeSelectionBackgroundColor];
    if (v11) {
      objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E4FB06C0], v11, v9.location, v9.length);
    }
    [(CKBalloonTextView *)self setAttributedText:v7];
  }
}

- (void)_removeFakeSelectionBackgroundColor
{
  id v3 = [(CKBalloonTextView *)self attributedText];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    int v5 = [(CKBalloonTextView *)self attributedText];
    id v7 = (id)[v5 mutableCopy];

    uint64_t v6 = [v7 length];
    objc_msgSend(v7, "removeAttribute:range:", *MEMORY[0x1E4FB06C0], 0, v6);
    [(CKBalloonTextView *)self setAttributedText:v7];
  }
}

- (void)_updateFakeSelectionBackgroundColor:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CKBalloonTextView__updateFakeSelectionBackgroundColor___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__CKBalloonTextView__updateFakeSelectionBackgroundColor___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isFakeSelected];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _setFakeSelectionBackgroundColor];
  }
  return result;
}

- (void)setFakeSelected:(BOOL)a3
{
  if (self->_fakeSelected != a3)
  {
    self->_fakeSelected = a3;
    if (a3) {
      [(CKBalloonTextView *)self _setFakeSelectionBackgroundColor];
    }
    else {
      [(CKBalloonTextView *)self _removeFakeSelectionBackgroundColor];
    }
  }
}

- (BOOL)resignFirstResponder
{
  uint64_t v3 = [(CKBalloonTextView *)self selectedRange];
  -[CKBalloonTextView set_selectedRange:](self, "set_selectedRange:", v3, v4);
  v9.receiver = self;
  v9.super_class = (Class)CKBalloonTextView;
  BOOL v5 = [(CKBalloonTextView *)&v9 resignFirstResponder];
  uint64_t v6 = [(CKBalloonTextView *)self _selectedRange];
  -[CKBalloonTextView _setFakeSelectionBackgroundColorForRange:](self, "_setFakeSelectionBackgroundColorForRange:", v6, v7);
  return v5;
}

- (BOOL)becomeFirstResponder
{
  v8.receiver = self;
  v8.super_class = (Class)CKBalloonTextView;
  BOOL v3 = [(CKBalloonTextView *)&v8 becomeFirstResponder];
  [(CKBalloonTextView *)self _selectedRange];
  if (v4)
  {
    [(CKBalloonTextView *)self setSelectable:1];
    [(CKBalloonTextView *)self _removeFakeSelectionBackgroundColor];
    uint64_t v5 = [(CKBalloonTextView *)self _selectedRange];
    -[CKBalloonTextView setSelectedRange:](self, "setSelectedRange:", v5, v6);
  }
  return v3;
}

- (void)setBalloonTextSelectedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(CKBalloonTextView *)self isFirstResponder])
  {
    -[CKBalloonTextView setSelectedRange:](self, "setSelectedRange:", location, length);
  }
  else
  {
    [(CKBalloonTextView *)self _selectedRange];
    if (v6) {
      [(CKBalloonTextView *)self _removeFakeSelectionBackgroundColor];
    }
    -[CKBalloonTextView set_selectedRange:](self, "set_selectedRange:", location, length);
    [(CKBalloonTextView *)self _selectedRange];
    if (v7)
    {
      uint64_t v9 = [(CKBalloonTextView *)self _selectedRange];
      -[CKBalloonTextView _setFakeSelectionBackgroundColorForRange:](self, "_setFakeSelectionBackgroundColorForRange:", v9, v8);
    }
  }
}

- (BOOL)_showsEditMenu
{
  [(CKBalloonTextView *)self _selectedRange];
  if (v3) {
    return 1;
  }
  [(CKBalloonTextView *)self selectedRange];
  return v5 != 0;
}

+ (BOOL)_textEffectsBalloonDebugHighlightingEnabled
{
  if (_textEffectsBalloonDebugHighlightingEnabled_onceToken != -1) {
    dispatch_once(&_textEffectsBalloonDebugHighlightingEnabled_onceToken, &__block_literal_global_137_2);
  }
  return _textEffectsBalloonDebugHighlightingEnabled_enabled;
}

void __64__CKBalloonTextView__textEffectsBalloonDebugHighlightingEnabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v1 = [v0 isInternalInstall];

  if (v1)
  {
    id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    _textEffectsBalloonDebugHighlightingEnabled_enabled = [v2 BOOLForKey:@"textEffectsBalloonDebugHighlightingEnabled"];
  }
}

- (void)setAllowsTextAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKBalloonTextView;
  unsigned int v5 = [(CKBalloonTextView *)&v12 allowsTextAnimations];
  v11.receiver = self;
  v11.super_class = (Class)CKBalloonTextView;
  [(CKBalloonTextView *)&v11 setAllowsTextAnimations:v3];
  if (v5 != v3 && [(id)objc_opt_class() _textEffectsBalloonDebugHighlightingEnabled])
  {
    if (v3)
    {
      uint64_t v6 = [MEMORY[0x1E4F428B8] redColor];
      uint64_t v7 = [v6 colorWithAlphaComponent:0.5];

      double v8 = 1.5;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F428B8] clearColor];
      double v8 = 0.0;
    }
    uint64_t v9 = [(CKBalloonTextView *)self layer];
    id v10 = v7;
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));
    [v9 setBorderWidth:v8];
  }
}

- (BOOL)isFakeSelected
{
  return self->_fakeSelected;
}

- (CKBalloonTextViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (CKBalloonTextViewInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (BOOL)shouldAdjustInsetsForMinimumSize
{
  return self->_shouldAdjustInsetsForMinimumSize;
}

- (void)setShouldAdjustInsetsForMinimumSize:(BOOL)a3
{
  self->_shouldAdjustInsetsForMinimumSize = a3;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UIPanGestureRecognizer)dragGestureRecognizer
{
  return self->_dragGestureRecognizer;
}

- (void)setDragGestureRecognizer:(id)a3
{
}

- (_NSRange)_selectedRange
{
  p_selectedRange = &self->__selectedRange;
  NSUInteger location = self->__selectedRange.location;
  NSUInteger length = p_selectedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)set_selectedRange:(_NSRange)a3
{
  self->__selectedRange = a3;
}

- (char)selectionColorType
{
  return self->_selectionColorType;
}

- (void)setSelectionColorType:(char)a3
{
  self->_selectionColorType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);

  objc_destroyWeak((id *)&self->_interactionDelegate);
}

+ (void)_textKit2_sizeThatFits:(os_log_t)log attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "attempted to compute size with nil attributedText", v1, 2u);
}

@end