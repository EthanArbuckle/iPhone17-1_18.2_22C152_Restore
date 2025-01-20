@interface CKTextBalloonView
+ (BOOL)supportsAllowsTextAnimationChanges;
- (BOOL)containsExcessiveLineHeightCharacters;
- (BOOL)ignoreSelectionEvent;
- (BOOL)isCandidateForTextEffectPlayback;
- (BOOL)isSelected;
- (BOOL)shouldResignFirstResponderForPresses;
- (BOOL)wantsTapbackPickerBackingBubble;
- (CGRect)_computedTextViewFrameForBoundsSize:(CGSize)a3;
- (CGSize)_minimumFittingSize;
- (CGSize)_textSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5;
- (CKBalloonTextViewProtocol)textView;
- (CKTextBalloonView)initWithFrame:(CGRect)a3;
- (CKTextBalloonView)initWithFrame:(CGRect)a3 textView:(id)a4;
- (CKTextBalloonViewTextEffectsDelegate)textEffectsDelegate;
- (Class)invisibleInkEffectViewClass;
- (NSAttributedString)attributedText;
- (NSString)description;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)targetTextContainerInsets;
- (double)textViewWidthForWidth:(double)a3;
- (id)nonVibrantSubViews;
- (id)updateTextSelectionState:(id)a3 forTextSelectionArea:(int64_t)a4;
- (unint64_t)_allowedTextViewLayoutAction;
- (void)_textViewDidChangeCustomRenderBounds:(id)a3;
- (void)_updateTextViewFrame;
- (void)_updateTextViewOrigin;
- (void)addFilter:(id)a3;
- (void)addOverlaySubview:(id)a3;
- (void)attachInvisibleInkEffectView;
- (void)clearFilters;
- (void)configureForComposition:(id)a3;
- (void)configureForMessagePart:(id)a3;
- (void)cullSubviewsWithVisibleBounds:(CGRect)a3;
- (void)detachInvisibleInkEffectView;
- (void)interactionStartedFromPreviewItemControllerInTextView:(id)a3;
- (void)interactionStartedLongPressInTextView:(id)a3;
- (void)interactionStartedTapInTextView:(id)a3 withModifierFlags:(int64_t)a4 selectedText:(id)a5;
- (void)interactionStoppedFromPreviewItemControllerInTextView:(id)a3;
- (void)interactionTextView:(id)a3 userDidDragOutsideViewWithPoint:(CGPoint)a4;
- (void)interactionTextViewShouldCopyToPasteboard:(id)a3;
- (void)invisibleInkEffectViewWasResumed;
- (void)invisibleInkEffectViewWasSuspended;
- (void)invisibleInkEffectViewWasUncovered;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)restoreFromLargeTextTruncation;
- (void)setAttributedText:(id)a3;
- (void)setContainsExcessiveLineHeightCharacters:(BOOL)a3;
- (void)setIgnoreSelectionEvent:(BOOL)a3;
- (void)setSelected:(BOOL)a3 withSelectionState:(id)a4;
- (void)setTextEffectsDelegate:(id)a3;
- (void)setTextView:(id)a3;
- (void)tapGestureRecognized:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)truncateForLargeText;
- (void)updateRasterizationForInvisibleInkEffect;
- (void)vibrantContainerWillReparentNonVibrantSubviews:(id)a3;
@end

@implementation CKTextBalloonView

- (void)configureForComposition:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKTextBalloonView;
  [(CKColoredBalloonView *)&v31 configureForComposition:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F28E48]);
  v6 = [v4 text];
  v7 = (void *)[v5 initWithAttributedString:v6];

  uint64_t v8 = [v7 length];
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  v10 = +[CKUIBehavior sharedBehaviors];
  v11 = [v10 theme];
  v12 = objc_msgSend(v11, "balloonTextColorForColorType:", -[CKBalloonView color](self, "color"));
  objc_msgSend(v7, "addAttribute:value:range:", v9, v12, 0, v8);

  v13 = +[CKUIBehavior sharedBehaviors];
  switch(objc_msgSend(v7, "__ck_bigEmojiStyleWithSingleBigEmojiSupported:", objc_msgSend(v13, "entryViewSupportsSingleBigEmojiFont")))
  {
    case 0:
      uint64_t v14 = [v13 balloonTextFont];
      goto LABEL_7;
    case 1:
      uint64_t v14 = [v13 singleBigEmojiFont];
      goto LABEL_7;
    case 2:
      uint64_t v14 = [v13 multipleBigEmojiFont];
      goto LABEL_7;
    case 3:
      uint64_t v14 = [v13 singleBigAssetFont];
LABEL_7:
      v15 = (void *)v14;
      break;
    default:
      v15 = 0;
      break;
  }
  uint64_t v16 = *MEMORY[0x1E4FB06F8];
  objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v15, 0, v8);
  v17 = [v4 subject];
  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28E48]);
    [v4 subject];
    v19 = uint64_t v29 = v9;
    v20 = (void *)[v18 initWithAttributedString:v19];

    uint64_t v21 = [v20 length];
    +[CKUIBehavior sharedBehaviors];
    v30 = v15;
    v23 = v22 = self;
    v24 = [v23 balloonSubjectFont];
    objc_msgSend(v20, "addAttribute:value:range:", v16, v24, 0, v21);

    v25 = +[CKUIBehavior sharedBehaviors];
    v26 = [v25 theme];
    v27 = objc_msgSend(v26, "balloonTextColorForColorType:", -[CKBalloonView color](v22, "color"));
    objc_msgSend(v20, "addAttribute:value:range:", v29, v27, 0, v21);

    self = v22;
    v15 = v30;

    v28 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    [v20 appendAttributedString:v28];

    [v20 appendAttributedString:v7];
    v7 = v20;
  }
  [(CKTextBalloonView *)self setAttributedText:v7];
}

- (void)configureForMessagePart:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKTextBalloonView;
  [(CKColoredBalloonView *)&v11 configureForMessagePart:v4];
  if ([v4 containsHyperlink])
  {
    id v5 = [(CKTextBalloonView *)self textView];
    v12[0] = *MEMORY[0x1E4FB0700];
    v6 = +[CKUIBehavior sharedBehaviors];
    v7 = [v6 theme];
    uint64_t v8 = objc_msgSend(v7, "balloonTextLinkColorForColorType:", objc_msgSend(v4, "color"));
    v12[1] = *MEMORY[0x1E4FB0808];
    v13[0] = v8;
    v13[1] = &unk_1EDF168C8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    [v5 setLinkTextAttributes:v9];
  }
  v10 = [v4 transcriptText];
  [(CKTextBalloonView *)self setAttributedText:v10];

  -[CKTextBalloonView setContainsExcessiveLineHeightCharacters:](self, "setContainsExcessiveLineHeightCharacters:", [v4 containsExcessiveLineHeightCharacters]);
}

+ (BOOL)supportsAllowsTextAnimationChanges
{
  v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isExpressiveTextEnabled];

  if (!v3) {
    return 0;
  }
  id v4 = (void *)MEMORY[0x1E4F42F58];

  return objc_msgSend(v4, "ck_supportsDynamicallyTogglingAllowsTextAnimations");
}

- (NSString)description
{
  int v3 = NSString;
  id v4 = [(CKTextBalloonView *)self textView];
  v8.receiver = self;
  v8.super_class = (Class)CKTextBalloonView;
  id v5 = [(CKColoredBalloonView *)&v8 description];
  v6 = [v3 stringWithFormat:@"[CKTextBalloonView textView:%@ %@]", v4, v5];

  return (NSString *)v6;
}

- (CKTextBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v8 = +[CKBalloonTextView makeTextView];
  uint64_t v9 = -[CKTextBalloonView initWithFrame:textView:](self, "initWithFrame:textView:", v8, x, y, width, height);

  return v9;
}

- (CKTextBalloonView)initWithFrame:(CGRect)a3 textView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKTextBalloonView;
  v10 = -[CKColoredBalloonView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    [v9 _disableTiledViews];
    [v9 setInteractionDelegate:v10];
    [v9 setDelegate:v10];
    [v9 setShouldAdjustInsetsForMinimumSize:1];
    [(CKTextBalloonView *)v10 addSubview:v9];
    [(CKTextBalloonView *)v10 setTextView:v9];
  }

  return v10;
}

- (unint64_t)_allowedTextViewLayoutAction
{
  int v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isExpressiveTextEnabled];

  if (!v4) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
  unint64_t v6 = [WeakRetained textBalloonViewAllowedLayoutActionForTextBalloonView:self];

  v7 = [(CKTextBalloonView *)self textView];
  LODWORD(WeakRetained) = objc_msgSend(v7, "ck_hasPlayingOrPausedTextAnimator");

  if (WeakRetained) {
    return v6;
  }
  else {
    return 0;
  }
}

- (void)layoutSubviews
{
  p_textEffectsDelegate = &self->_textEffectsDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_textEffectsDelegate);
    [v5 textBalloonViewWillLayoutSubviews:self];
  }
  v9.receiver = self;
  v9.super_class = (Class)CKTextBalloonView;
  [(CKColoredBalloonView *)&v9 layoutSubviews];
  unint64_t v6 = [(CKTextBalloonView *)self _allowedTextViewLayoutAction];
  if (v6 == 1)
  {
    [(CKTextBalloonView *)self _updateTextViewOrigin];
  }
  else if (!v6)
  {
    [(CKTextBalloonView *)self _updateTextViewFrame];
  }
  id v7 = objc_loadWeakRetained((id *)p_textEffectsDelegate);

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_textEffectsDelegate);
    [v8 textBalloonViewDidLayoutSubviews:self];
  }
}

- (UIEdgeInsets)targetTextContainerInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 balloonTextContainerInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  v20.receiver = self;
  v20.super_class = (Class)CKTextBalloonView;
  [(CKColoredBalloonView *)&v20 alignmentRectInsets];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = +[CKUIBehavior sharedBehaviors];
  [v10 textAlignmentRectInsetsScaleFactor];
  double v12 = v3 * v11;
  double v13 = v5 * v11;
  double v14 = v7 * v11;
  double v15 = v9 * v11;

  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)prepareForDisplay
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)CKTextBalloonView;
  [(CKColoredBalloonView *)&v35 prepareForDisplay];
  double v3 = [(CKTextBalloonView *)self textView];
  double v4 = [(CKTextBalloonView *)self attributedText];
  double v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isExpressiveTextEnabled];

  if (v6
    && ([(id)objc_opt_class() supportsAllowsTextAnimationChanges] & 1) == 0
    && [v3 allowsTextAnimations])
  {
    double v7 = [(CKTextBalloonView *)self textEffectsDelegate];
    double v8 = [v7 customTextRenderingDisplayLinkForTextBalloonViewTextView:self];

    double v9 = [(CKTextBalloonView *)self textView];
    [v9 _setCustomRenderDisplayLink:v8];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v10 = [(CKBalloonView *)self filters];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        double v16 = [v15 textColor];

        if (v16)
        {
          double v17 = (void *)[v4 mutableCopy];
          uint64_t v18 = *MEMORY[0x1E4FB0700];
          uint64_t v19 = [v4 length];
          uint64_t v25 = MEMORY[0x1E4F143A8];
          uint64_t v26 = 3221225472;
          v27 = __38__CKTextBalloonView_prepareForDisplay__block_invoke;
          v28 = &unk_1E5625D98;
          id v29 = v17;
          v30 = v15;
          id v20 = v17;
          objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v19, 0, &v25);
          id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v22 = objc_msgSend(v21, "initWithAttributedString:", v20, v25, v26, v27, v28);

          double v4 = (void *)v22;
          goto LABEL_15;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if (objc_opt_respondsToSelector()) {
    [v3 setAttributedText:v4 checkForMentions:0];
  }
  else {
    [v3 setAttributedText:v4];
  }
  v23 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v24 = [v23 isExpressiveTextEnabled];

  if (v24 && [(id)objc_opt_class() supportsAllowsTextAnimationChanges])
  {
    [v3 _setCustomRenderDisplayLink:0];
    [v3 setAllowsTextAnimations:0];
  }
}

void __38__CKTextBalloonView_prepareForDisplay__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x1E4FB0700];
  double v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) textColor];
  objc_msgSend(v7, "addAttribute:value:range:", v6, v8, a3, a4);
}

- (void)prepareForReuse
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)CKTextBalloonView;
  [(CKColoredBalloonView *)&v19 prepareForReuse];
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isExpressiveTextEnabled];

  if (v4)
  {
    double v5 = [(CKTextBalloonView *)self textView];
    int v6 = [v5 allowsTextAnimations];

    if (v6)
    {
      double v7 = [(CKTextBalloonView *)self textView];
      [v7 _setCustomRenderDisplayLink:0];

      if ([(id)objc_opt_class() supportsAllowsTextAnimationChanges])
      {
        id v8 = [(CKTextBalloonView *)self textView];
        [v8 setAllowsTextAnimations:0];
      }
    }
  }
  double v9 = [(CKTextBalloonView *)self textView];
  [v9 setHidden:0];

  [(CKTextBalloonView *)self setContainsExcessiveLineHeightCharacters:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v10 = [(CKTextBalloonView *)self nonVibrantSubViews];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setUserInteractionEnabled:1];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (BOOL)shouldResignFirstResponderForPresses
{
  return 1;
}

- (CGSize)_textSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = [(CKTextBalloonView *)self textView];
  objc_msgSend(v9, "sizeThatFits:textAlignmentInsets:isSingleLine:isReplyPreview:", a4, a5, 0, width, height);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)_minimumFittingSize
{
  if ([(CKBalloonView *)self hasTail]) {
    uint64_t v3 = [(CKBalloonView *)self balloonTailShape];
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = +[CKUIBehavior sharedBehaviors];
  [v4 skinnyBalloonMaskSizeWithTailShape:v3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  -[CKTextBalloonView sizeThatFits:textAlignmentInsets:isSingleLine:](self, "sizeThatFits:textAlignmentInsets:isSingleLine:", a4, 0, a3.width, a3.height);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5
{
  -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", a3.width, a3.height);
  double v9 = v8;
  double v11 = v10;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  long long v54 = *MEMORY[0x1E4F437F8];
  long long v55 = v12;
  double v13 = [(CKTextBalloonView *)self textView];
  double v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 isExpressiveTextEnabled];

  if (v15)
  {
    -[CKTextBalloonView _textSizeThatFits:textAlignmentInsets:isSingleLine:](self, "_textSizeThatFits:textAlignmentInsets:isSingleLine:", &v54, a5, v9, v11);
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    id v20 = [(CKTextBalloonView *)self textView];
    objc_msgSend(v20, "sizeThatFits:textAlignmentInsets:isSingleLine:isReplyPreview:", &v54, a5, 0, v9, v11);
    double v17 = v21;
    double v19 = v22;
  }
  [(CKTextBalloonView *)self alignmentRectInsets];
  if (*((double *)&v54 + 1) >= v24) {
    double v27 = v24;
  }
  else {
    double v27 = *((double *)&v54 + 1);
  }
  if (*((double *)&v55 + 1) >= v26) {
    double v28 = v26;
  }
  else {
    double v28 = *((double *)&v55 + 1);
  }
  if (*(double *)&v54 >= v23) {
    double v29 = v23;
  }
  else {
    double v29 = *(double *)&v54;
  }
  if (*(double *)&v55 >= v25) {
    double v30 = v25;
  }
  else {
    double v30 = *(double *)&v55;
  }
  -[UIView __ck_frameSizeForAlignmentRectSize:](self, "__ck_frameSizeForAlignmentRectSize:", v17 - (v27 + v28), v19 - (v29 + v30));
  double v32 = v31;
  double v34 = v33;
  [(CKTextBalloonView *)self _minimumFittingSize];
  double v36 = v35;
  double v38 = v37;
  if ([v13 shouldAdjustInsetsForMinimumSize])
  {
    double v39 = (v36 - v32) * 0.5;
    if (v32 >= v36) {
      double v39 = 0.0;
    }
    double v28 = v28 - v39;
    double v27 = v27 - v39;
    double v40 = (v38 - v34) * 0.5;
    double v41 = v29 - v40;
    double v42 = v30 - v40;
    if (v34 < v38)
    {
      double v30 = v42;
      double v29 = v41;
    }
  }
  if (a4)
  {
    a4->top = v29;
    a4->left = v27;
    a4->bottom = v30;
    a4->right = v28;
  }
  v43 = [(CKTextBalloonView *)self traitCollection];
  [v43 displayScale];
  if (v44 == 0.0)
  {
    if (CKMainScreenScale_once_72 != -1) {
      dispatch_once(&CKMainScreenScale_once_72, &__block_literal_global_182);
    }
    double v45 = *(double *)&CKMainScreenScale_sMainScreenScale_72;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_72 == 0.0) {
      double v45 = 1.0;
    }
    double v46 = ceil(v32 * v45) / v45;
    double v44 = *(double *)&CKMainScreenScale_sMainScreenScale_72;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_72 == 0.0) {
      double v44 = 1.0;
    }
  }
  else
  {
    double v46 = ceil(v32 * v44) / v44;
  }
  double v47 = ceil(v34 * v44) / v44;

  double v48 = fmax(v46, v36);
  double v49 = fmax(v47, v38);
  if ([(CKBalloonView *)self hasSuggestedActionsMenu])
  {
    if (v48 < 250.0) {
      double v50 = 250.0 - v48;
    }
    else {
      double v50 = 0.0;
    }
    -[CKBalloonView suggestedActionsMenuAdditionalHeightForBalloonSize:](self, "suggestedActionsMenuAdditionalHeightForBalloonSize:", fmax(v48, 250.0), 1.79769313e308);
    double v48 = v48 + v50;
    double v49 = v49 + v51;
  }

  double v52 = v48;
  double v53 = v49;
  result.double height = v53;
  result.double width = v52;
  return result;
}

- (void)clearFilters
{
  v8.receiver = self;
  v8.super_class = (Class)CKTextBalloonView;
  [(CKColoredBalloonView *)&v8 clearFilters];
  uint64_t v3 = [(CKTextBalloonView *)self textView];
  double v4 = [v3 layer];
  [v4 setAllowsGroupBlending:1];

  double v5 = [v3 layer];
  [v5 setAllowsGroupOpacity:1];

  double v6 = [v3 layer];
  [v6 setCompositingFilter:0];

  double v7 = [(CKTextBalloonView *)self attributedText];
  [v3 setAttributedText:v7];

  [v3 setAlpha:1.0];
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKTextBalloonView;
  [(CKColoredBalloonView *)&v22 addFilter:v4];
  double v5 = [(CKTextBalloonView *)self textView];
  double v6 = [v5 layer];
  [v6 setAllowsGroupBlending:0];

  double v7 = [v5 layer];
  [v7 setAllowsGroupOpacity:0];

  objc_super v8 = [v5 layer];
  double v9 = [v4 textCompositingFilter];
  [v8 setCompositingFilter:v9];

  [v4 contentAlpha];
  objc_msgSend(v5, "setAlpha:");
  double v10 = [v4 textColor];

  if (v10)
  {
    double v11 = [v5 attributedText];
    long long v12 = (void *)[v11 mutableCopy];

    uint64_t v13 = *MEMORY[0x1E4FB0700];
    uint64_t v14 = [v12 length];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    double v18 = __31__CKTextBalloonView_addFilter___block_invoke;
    double v19 = &unk_1E5625D98;
    id v20 = v12;
    id v21 = v4;
    id v15 = v12;
    objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v14, 0, &v16);
    objc_msgSend(v5, "setAttributedText:", v15, v16, v17, v18, v19);
  }
}

void __31__CKTextBalloonView_addFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x1E4FB0700];
  double v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) textColor];
  objc_msgSend(v7, "addAttribute:value:range:", v6, v8, a3, a4);
}

- (void)updateRasterizationForInvisibleInkEffect
{
  if ([(CKBalloonView *)self invisibleInkEffectEnabled]) {
    BOOL v3 = [(CKBalloonView *)self invisibleInkEffectPaused];
  }
  else {
    BOOL v3 = 0;
  }
  id v5 = [(CKBalloonView *)self invisibleInkEffectController];
  id v4 = [v5 effectView];
  [v4 _setShouldRasterize:v3];
}

- (BOOL)wantsTapbackPickerBackingBubble
{
  return 1;
}

- (BOOL)isCandidateForTextEffectPlayback
{
  BOOL v3 = [(CKBalloonView *)self invisibleInkEffectController];

  if (!v3) {
    return 1;
  }
  id v4 = [(CKBalloonView *)self invisibleInkEffectController];
  char v5 = [v4 isSuspended];

  return v5;
}

- (void)_updateTextViewFrame
{
  [(CKTextBalloonView *)self bounds];
  -[CKTextBalloonView _computedTextViewFrameForBoundsSize:](self, "_computedTextViewFrameForBoundsSize:", v3, v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(CKTextBalloonView *)self textView];
  [(CKTextBalloonView *)self targetTextContainerInsets];
  objc_msgSend(v13, "setTextContainerInset:");
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
}

- (void)_updateTextViewOrigin
{
  [(CKTextBalloonView *)self bounds];
  -[CKTextBalloonView _computedTextViewFrameForBoundsSize:](self, "_computedTextViewFrameForBoundsSize:", v3, v4);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat rect = v9;
  CGFloat v11 = v10;
  double v12 = [(CKTextBalloonView *)self textView];
  [v12 frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  [(CKTextBalloonView *)self bounds];
  double Width = CGRectGetWidth(v35);
  v36.origin.double x = v14;
  v36.origin.double y = v16;
  v36.size.double width = v18;
  v36.size.double height = v20;
  double v31 = CGRectGetWidth(v36);
  if ([(CKTextBalloonView *)self _shouldReverseLayoutDirection])
  {
    v37.origin.double x = v6;
    v37.origin.double y = v8;
    v37.size.double width = rect;
    v37.size.double height = v11;
    CGFloat v22 = CGRectGetWidth(v37);
    v38.size.double height = v11;
    double v23 = Width - v22;
    v38.origin.double x = v6;
    v38.origin.double y = v8;
    v38.size.double width = rect;
    double MinX = Width - v31 - (v23 - CGRectGetMinX(v38));
  }
  else
  {
    v39.origin.double x = v6;
    v39.origin.double y = v8;
    v39.size.double width = rect;
    v39.size.double height = v11;
    double MinX = CGRectGetMinX(v39);
  }
  v40.origin.double x = v14;
  v40.origin.double y = v16;
  v40.size.double width = v18;
  v40.size.double height = v20;
  double MinY = CGRectGetMinY(v40);
  double v26 = [(CKTextBalloonView *)self textView];
  [v26 frame];
  double v28 = v27;
  double v30 = v29;

  recta = [(CKTextBalloonView *)self textView];
  objc_msgSend(recta, "setFrame:", MinX, MinY, v28, v30);
}

- (CGRect)_computedTextViewFrameForBoundsSize:(CGSize)a3
{
  -[CKTextBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:", 0.0, 0.0, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CKBalloonView *)self textAlignmentInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v11 + v12 + v18;
  if ([(CKTextBalloonView *)self containsExcessiveLineHeightCharacters])
  {
    CGFloat v20 = +[CKUIBehavior sharedBehaviors];
    [v20 transcriptTextFontLanguageAwareOutsets];
    double v37 = v7;
    double v21 = v5;
    double v23 = v22;
    double v25 = v24;

    double v26 = v23 + v25;
    double v5 = v21;
    double v7 = v37;
    double v19 = v19 + v26;
  }
  double v27 = v9 + v15 + v17;
  double v28 = v7 - v13;
  double v29 = [(CKTextBalloonView *)self traitCollection];
  [v29 displayScale];
  double v31 = round((v5 - v15) * v30) / v30;
  double v32 = round(v28 * v30) / v30;

  double v33 = v31;
  double v34 = v32;
  double v35 = v27;
  double v36 = v19;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (void)interactionStartedFromPreviewItemControllerInTextView:(id)a3
{
  id v4 = [(CKBalloonView *)self delegate];
  [v4 interactionStartedFromPreviewItemControllerInBalloonView:self];
}

- (void)interactionStoppedFromPreviewItemControllerInTextView:(id)a3
{
  id v4 = [(CKBalloonView *)self delegate];
  [v4 interactionStoppedFromPreviewItemControllerInBalloonView:self];
}

- (void)interactionStartedLongPressInTextView:(id)a3
{
  id v4 = [(CKBalloonView *)self delegate];
  [v4 balloonViewLongTouched:self];
}

- (void)interactionStartedTapInTextView:(id)a3 withModifierFlags:(int64_t)a4 selectedText:(id)a5
{
  id v7 = a5;
  id v8 = [(CKBalloonView *)self delegate];
  [v8 balloonViewTapped:self withModifierFlags:a4 selectedText:v7];
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(CKTextBalloonView *)self ignoreSelectionEvent];
  double v5 = v9;
  if (!v4)
  {
    double v6 = [v9 selectedTextRange];
    id v7 = [v9 textInRange:v6];
    if ([v7 length])
    {
      id v8 = [(CKBalloonView *)self delegate];
      [v8 balloonViewTextViewDidChangeSelection:self selectedText:v7 textView:v9];

      if ([(CKBalloonView *)self hasOverlay]) {
        [(CKBalloonView *)self setHasOverlay:0];
      }
    }

    double v5 = v9;
  }
}

- (void)_textViewDidChangeCustomRenderBounds:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
  [WeakRetained textBalloonViewTextViewDidChangeRenderBounds:self];
}

- (void)interactionTextViewShouldCopyToPasteboard:(id)a3
{
  id v4 = [(CKBalloonView *)self delegate];
  [v4 balloonViewShouldCopyToPasteboard:self];
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = a3;
  if ([v4 modifierFlags])
  {
    v9.receiver = self;
    v9.super_class = (Class)CKTextBalloonView;
    [(CKBalloonView *)&v9 tapGestureRecognized:v4];
  }
  else
  {
    double v5 = [(CKTextBalloonView *)self textView];
    double v6 = [v5 selectedTextRange];
    id v7 = [v5 textInRange:v6];
    id v8 = [(CKBalloonView *)self delegate];
    objc_msgSend(v8, "balloonViewTapped:withModifierFlags:selectedText:", self, objc_msgSend(v4, "modifierFlags"), v7);
  }
}

- (void)interactionTextView:(id)a3 userDidDragOutsideViewWithPoint:(CGPoint)a4
{
  -[CKTextBalloonView convertPoint:fromView:](self, "convertPoint:fromView:", a3, a4.x, a4.y);
  double v6 = v5;
  double v8 = v7;
  [(CKTextBalloonView *)self bounds];
  v11.double x = v6;
  v11.double y = v8;
  if (!CGRectContainsPoint(v12, v11))
  {
    id v9 = [(CKBalloonView *)self delegate];
    objc_msgSend(v9, "balloonView:userDidDragOutsideBalloonWithPoint:", self, v6, v8);
  }
}

- (void)setAttributedText:(id)a3
{
  id v4 = (NSAttributedString *)a3;
  if (self->_attributedText != v4)
  {
    double v6 = v4;
    double v5 = (NSAttributedString *)[(NSAttributedString *)v4 copy];

    objc_storeStrong((id *)&self->_attributedText, v5);
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
    id v4 = v5;
  }
}

- (double)textViewWidthForWidth:(double)a3
{
  -[CKTextBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:", 0.0, 0.0, a3, 0.0);
  double v5 = v4;
  [(CKBalloonView *)self textAlignmentInsets];
  return v5 + v6 + v7;
}

- (void)cullSubviewsWithVisibleBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CKBalloonView *)self invisibleInkEffectController];
  id v9 = [v8 effectView];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[CKTextBalloonView convertRect:toView:](self, "convertRect:toView:", v9, x, y, width, height);
    objc_msgSend(v9, "cullSubviewsWithVisibleBounds:");
  }
}

- (Class)invisibleInkEffectViewClass
{
  return (Class)objc_opt_class();
}

- (void)invisibleInkEffectViewWasUncovered
{
  double v3 = [(CKBalloonView *)self invisibleInkEffectController];
  [v3 suspendForTimeInterval:5.0];

  double v4 = [(CKTextBalloonView *)self textEffectsDelegate];

  if (v4)
  {
    id v5 = [(CKTextBalloonView *)self textEffectsDelegate];
    objc_msgSend(v5, "textBalloonViewTextView:didChangeTextEffectPlaybackCandidateStatus:", self, -[CKTextBalloonView isCandidateForTextEffectPlayback](self, "isCandidateForTextEffectPlayback"));
  }
}

- (void)invisibleInkEffectViewWasSuspended
{
  v5.receiver = self;
  v5.super_class = (Class)CKTextBalloonView;
  [(CKBalloonView *)&v5 invisibleInkEffectViewWasSuspended];
  double v3 = [(CKTextBalloonView *)self textEffectsDelegate];

  if (v3)
  {
    double v4 = [(CKTextBalloonView *)self textEffectsDelegate];
    objc_msgSend(v4, "textBalloonViewTextView:didChangeTextEffectPlaybackCandidateStatus:", self, -[CKTextBalloonView isCandidateForTextEffectPlayback](self, "isCandidateForTextEffectPlayback"));
  }
}

- (void)invisibleInkEffectViewWasResumed
{
  v5.receiver = self;
  v5.super_class = (Class)CKTextBalloonView;
  [(CKBalloonView *)&v5 invisibleInkEffectViewWasResumed];
  double v3 = [(CKTextBalloonView *)self textEffectsDelegate];

  if (v3)
  {
    double v4 = [(CKTextBalloonView *)self textEffectsDelegate];
    objc_msgSend(v4, "textBalloonViewTextView:didChangeTextEffectPlaybackCandidateStatus:", self, -[CKTextBalloonView isCandidateForTextEffectPlayback](self, "isCandidateForTextEffectPlayback"));
  }
}

- (void)attachInvisibleInkEffectView
{
  double v3 = [(CKBalloonView *)self invisibleInkEffectController];
  id v5 = [v3 effectView];

  [(CKTextBalloonView *)self invisibleInkEffectViewClass];
  if (objc_opt_isKindOfClass()) {
    [v5 attachToBalloonView:self];
  }
  double v4 = [(CKTextBalloonView *)self textView];
  [(CKTextBalloonView *)self insertSubview:v5 aboveSubview:v4];
}

- (void)detachInvisibleInkEffectView
{
  double v3 = [(CKBalloonView *)self invisibleInkEffectController];
  id v4 = [v3 effectView];

  [(CKTextBalloonView *)self invisibleInkEffectViewClass];
  if (objc_opt_isKindOfClass()) {
    [v4 detachFromBalloonView];
  }
  [v4 removeFromSuperview];
}

- (void)truncateForLargeText
{
  double v3 = [(CKTextBalloonView *)self textView];
  id v4 = [v3 textContainer];
  [v4 setMaximumNumberOfLines:3];

  id v6 = [(CKTextBalloonView *)self textView];
  id v5 = [v6 textContainer];
  [v5 setLineBreakMode:4];
}

- (void)restoreFromLargeTextTruncation
{
  double v3 = [(CKTextBalloonView *)self textView];
  id v4 = [v3 textContainer];
  [v4 setMaximumNumberOfLines:0];

  id v6 = [(CKTextBalloonView *)self textView];
  id v5 = [v6 textContainer];
  [v5 setLineBreakMode:0];
}

- (void)setSelected:(BOOL)a3 withSelectionState:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  [(CKTextBalloonView *)self setIgnoreSelectionEvent:1];
  id v6 = [(CKTextBalloonView *)self textView];
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v7 = [v13 style];
  if (!v7)
  {
    [v6 setFakeSelected:0];
    objc_msgSend(v6, "setBalloonTextSelectedRange:", 0, 0);
    uint64_t v12 = 1;
    goto LABEL_8;
  }
  if (v7 != 1) {
    goto LABEL_9;
  }
  [v13 textSelectionRange];
  if (v8)
  {
    [v6 setFakeSelected:0];
    uint64_t v9 = [v13 textSelectionRange];
    uint64_t v11 = v10;
  }
  else
  {
LABEL_6:
    [v6 setFakeSelected:v4];
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  objc_msgSend(v6, "setBalloonTextSelectedRange:", v9, v11);
  uint64_t v12 = 0;
LABEL_8:
  [(CKBalloonView *)self setHasOverlay:v12];
LABEL_9:

  [(CKTextBalloonView *)self setIgnoreSelectionEvent:0];
}

- (BOOL)isSelected
{
  double v2 = [(CKTextBalloonView *)self textView];
  if ([v2 isFakeSelected])
  {
    BOOL v3 = 1;
  }
  else
  {
    [v2 selectedRange];
    BOOL v3 = v4 != 0;
  }

  return v3;
}

- (id)nonVibrantSubViews
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_textView;
  double v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)vibrantContainerWillReparentNonVibrantSubviews:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setUserInteractionEnabled:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)updateTextSelectionState:(id)a3 forTextSelectionArea:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(CKTextBalloonView *)self textView];
  long long v8 = v7;
  if (a4 == 1)
  {
    long long v11 = [v7 text];
    unint64_t v12 = [v11 length];

    uint64_t v13 = [v6 textSelectionRange];
    [v6 textSelectionRange];
    if (v14 + v13 >= v12) {
      goto LABEL_9;
    }
    uint64_t v15 = [v6 textSelectionRange];
    [v6 textSelectionRange];
    uint64_t v10 = v16 + v15;
    uint64_t v17 = [v6 textSelectionRange];
    [v6 textSelectionRange];
    uint64_t v9 = v12 - (v17 + v18);
  }
  else
  {
    if (a4 || ![v6 textSelectionRange]) {
      goto LABEL_9;
    }
    uint64_t v9 = [v6 textSelectionRange];
    uint64_t v10 = 0;
  }
  uint64_t v19 = +[CKBalloonSelectionState balloonSelectionState:textSelectionRange:](CKBalloonSelectionState, "balloonSelectionState:textSelectionRange:", [v6 style], v10, v9);
  if (v19)
  {
    id v20 = (id)v19;
    [(CKTextBalloonView *)self setSelected:1 withSelectionState:v19];
    goto LABEL_10;
  }
LABEL_9:
  id v20 = v6;
LABEL_10:

  return v20;
}

- (void)addOverlaySubview:(id)a3
{
  id v4 = a3;
  id v5 = [(CKTextBalloonView *)self textView];
  [(CKTextBalloonView *)self insertSubview:v4 belowSubview:v5];
}

- (CKTextBalloonViewTextEffectsDelegate)textEffectsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  return (CKTextBalloonViewTextEffectsDelegate *)WeakRetained;
}

- (void)setTextEffectsDelegate:(id)a3
{
}

- (CKBalloonTextViewProtocol)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (BOOL)containsExcessiveLineHeightCharacters
{
  return self->_containsExcessiveLineHeightCharacters;
}

- (void)setContainsExcessiveLineHeightCharacters:(BOOL)a3
{
  self->_containsExcessiveLineHeightCharacters = a3;
}

- (BOOL)ignoreSelectionEvent
{
  return self->_ignoreSelectionEvent;
}

- (void)setIgnoreSelectionEvent:(BOOL)a3
{
  self->_ignoreSelectionEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_textView, 0);

  objc_destroyWeak((id *)&self->_textEffectsDelegate);
}

@end