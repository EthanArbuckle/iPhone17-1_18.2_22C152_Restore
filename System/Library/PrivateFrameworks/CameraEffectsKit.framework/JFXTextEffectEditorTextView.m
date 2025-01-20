@interface JFXTextEffectEditorTextView
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (CGRect)textEditingFrame;
- (CGRect)textFrameWithoutFudge;
- (JFXTextEffectEditorTextView)initWithTextEditingProperties:(id)a3 editorView:(id)a4;
- (JFXTextEffectEditorTextView)initWithTextEditingProperties:(id)a3 editorView:(id)a4 textContainer:(id)a5;
- (JFXTextEffectEditorView)editorView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)textColorForCaretSelection;
- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4;
- (unint64_t)JFX_countNumberOfLines;
- (void)JFX_adjustSizeToMatchExpectedNumberOfLines:(id)a3;
- (void)JFX_adjustTextEditingViewFrameAndInsetsForShadow:(id)a3;
- (void)JFX_adjustTextEditingViewInsetsForVerticalAlignment:(int64_t)a3 textAreaHeight:(double)a4 textHeight:(double)a5;
- (void)applyTextEditingProperties:(id)a3;
- (void)setEditorView:(id)a3;
- (void)setTextFrameWithoutFudge:(CGRect)a3;
- (void)unmarkText;
@end

@implementation JFXTextEffectEditorTextView

- (JFXTextEffectEditorTextView)initWithTextEditingProperties:(id)a3 editorView:(id)a4 textContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 bounds];
  v18.receiver = self;
  v18.super_class = (Class)JFXTextEffectEditorTextView;
  v11 = -[JFXTextEffectEditorTextView initWithFrame:textContainer:](&v18, sel_initWithFrame_textContainer_, v10);

  if (v11)
  {
    [(JFXTextEffectEditorTextView *)v11 setEditorView:v9];
    v12 = [(JFXTextEffectEditorTextView *)v11 layer];
    [v12 setBorderWidth:0.0];

    v13 = [MEMORY[0x263F1C550] clearColor];
    [(JFXTextEffectEditorTextView *)v11 setBackgroundColor:v13];

    [(JFXTextEffectEditorTextView *)v11 setReturnKeyType:0];
    [(JFXTextEffectEditorTextView *)v11 setKeyboardAppearance:1];
    [(JFXTextEffectEditorTextView *)v11 setScrollEnabled:0];
    v14 = [(JFXTextEffectEditorTextView *)v11 textContainer];
    [v14 setLineFragmentPadding:0.0];

    -[JFXTextEffectEditorTextView setTextContainerInset:](v11, "setTextContainerInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    [(JFXTextEffectEditorTextView *)v11 setContentInsetAdjustmentBehavior:2];
    v15 = [(JFXTextEffectEditorTextView *)v11 textContainer];
    [v15 setWidthTracksTextView:1];

    v16 = [(JFXTextEffectEditorTextView *)v11 textContainer];
    [v16 setHeightTracksTextView:1];

    if ([v8 isAllCaps]) {
      [(JFXTextEffectEditorTextView *)v11 setAutocapitalizationType:3];
    }
    if ([v8 isEmoji]) {
      [(JFXTextEffectEditorTextView *)v11 setKeyboardType:124];
    }
  }

  return v11;
}

- (JFXTextEffectEditorTextView)initWithTextEditingProperties:(id)a3 editorView:(id)a4
{
  return [(JFXTextEffectEditorTextView *)self initWithTextEditingProperties:a3 editorView:a4 textContainer:0];
}

- (void)applyTextEditingProperties:(id)a3
{
  id v4 = a3;
  int v5 = [v4 useFullTransform];
  v6 = [(JFXTextEffectEditorTextView *)self editorView];
  v7 = [v6 transformView];
  id v8 = v7;
  if (v5)
  {
    long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v123[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    v123[5] = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v123[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v123[7] = v10;
    long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v123[0] = *MEMORY[0x263F15740];
    v123[1] = v11;
    long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v123[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v123[3] = v12;
    [v7 setTransform3D:v123];

    v13 = [v4 effectFrame];
    [v13 relativeToSize];
    double v14 = CGRectMakeWithSize();
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [(JFXTextEffectEditorTextView *)self editorView];
    v22 = [v21 transformView];
    objc_msgSend(v22, "setBounds:", v14, v16, v18, v20);

    double v23 = *MEMORY[0x263F00148];
    double v24 = *(double *)(MEMORY[0x263F00148] + 8);
    v25 = [(JFXTextEffectEditorTextView *)self editorView];
    v26 = [v25 transformView];
    objc_msgSend(v26, "setCenter:", v23, v24);
  }
  else
  {
    long long v27 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v122[0] = *MEMORY[0x263F000D0];
    v122[1] = v27;
    v122[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v7 setTransform:v122];

    [v4 frame];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    v25 = [(JFXTextEffectEditorTextView *)self editorView];
    v26 = [v25 transformView];
    objc_msgSend(v26, "setFrame:", v29, v31, v33, v35);
  }

  uint64_t v36 = [(JFXTextEffectEditorTextView *)self selectedRange];
  uint64_t v38 = v37;
  v39 = [v4 attributedText];
  [(JFXTextEffectEditorTextView *)self setAttributedText:v39];

  -[JFXTextEffectEditorTextView setSelectedRange:](self, "setSelectedRange:", v36, v38);
  v40 = [v4 customTextEditTintColor];
  [(JFXTextEffectEditorTextView *)self setTintColor:v40];

  [v4 bounds];
  if (v5)
  {
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v45 = [v4 effectFrame];
    v46 = v45;
    if (v45)
    {
      [v45 transform];
    }
    else
    {
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
    }

    long long v105 = v117;
    long long v107 = v115;
    long long v101 = v116;
    long long v102 = v114;
    long long v103 = v121;
    long long v104 = v119;
    long long v99 = v120;
    long long v100 = v118;
    v51 = [(JFXTextEffectEditorTextView *)self editorView];
    v52 = [v51 transformView];
    v113[0] = v102;
    v113[1] = v107;
    v113[2] = v101;
    v113[3] = v105;
    v113[4] = v100;
    v113[5] = v104;
    v113[6] = v99;
    v113[7] = v103;
    [v52 setTransform3D:v113];

    v53 = [v4 effectFrame];
    [v53 objectBounds];
    double v47 = v54;
    double v56 = v55;
    double v49 = v57;
    double v50 = v58;

    v59 = [v4 effectFrame];
    [v59 relativeToSize];
    double v48 = v60 - (v56 + v50);
  }
  else
  {
    double v47 = v41;
    double v48 = v42;
    double v49 = v43;
    double v50 = v44;
  }
  if ([v4 isSpecialCaseForGameOverPoster])
  {
    double v47 = v47 + (v49 - v49 * 0.73) * 0.5;
    double v48 = v48 + (v50 - v50 * 0.73) * 0.5;
    double v50 = v50 * 0.73;
    double v49 = v49 * 0.73;
  }
  -[JFXTextEffectEditorTextView setFrame:](self, "setFrame:", v47, v48, v49, v50);
  -[JFXTextEffectEditorTextView setTextContainerInset:](self, "setTextContainerInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  v61 = (void *)MEMORY[0x263F61248];
  v62 = [v4 attributedText];
  v63 = [v4 defaultTypingAttributes];
  v64 = [v61 shadowFromAttributedString:v62 defaultAttributes:v63];

  [(JFXTextEffectEditorTextView *)self JFX_adjustTextEditingViewFrameAndInsetsForShadow:v64];
  [(JFXTextEffectEditorTextView *)self frame];
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  double v73 = 1.0;
  double v74 = 1.0;
  if ((v5 & 1) == 0)
  {
    [v4 scale];
    double v73 = v75;
    double v74 = v76;
  }
  [(JFXTextEffectEditorTextView *)self textContainerInset];
  double v78 = v77;
  [(JFXTextEffectEditorTextView *)self textContainerInset];
  double v80 = v72 - (v78 + v79);
  v81 = (void *)MEMORY[0x263F61248];
  v82 = [v4 attributedText];
  v83 = [(JFXTextEffectEditorTextView *)self typingAttributes];
  [v81 textHeightFromAttributedString:v82 defaultAttributes:v83 scale:v73];
  double v85 = v84;

  v86 = (void *)MEMORY[0x263F61248];
  v87 = [v4 attributedText];
  v88 = [v4 defaultTypingAttributes];
  uint64_t v89 = [v86 verticalAlignmentFromAttributedString:v87 defaultAttributes:v88];

  [(JFXTextEffectEditorTextView *)self JFX_adjustTextEditingViewInsetsForVerticalAlignment:v89 textAreaHeight:v80 textHeight:v85];
  -[JFXTextEffectEditorTextView setTextFrameWithoutFudge:](self, "setTextFrameWithoutFudge:", v66, v68, v70, v72);
  -[JFXTextEffectEditorTextView setFrame:](self, "setFrame:", v66, v68, v70, v72 + 100.0);
  [(JFXTextEffectEditorTextView *)self JFX_adjustSizeToMatchExpectedNumberOfLines:v4];
  v90 = (void *)MEMORY[0x263F61248];
  v91 = [v4 attributedText];
  [v90 xOffsetForTextTrackingFromAttributedString:v91];
  double v108 = v73 * v92;

  [v4 baselineYOffset];
  double v106 = v74 * v93;
  [(JFXTextEffectEditorTextView *)self center];
  v95.f64[1] = v94;
  v96.f64[0] = v108;
  v96.f64[1] = v106;
  [(JFXTextEffectEditorTextView *)self setCenter:vaddq_f64(v96, v95)];
  if ((v5 & 1) == 0)
  {
    if (v4)
    {
      [v4 partialTransformNoScaleNoTranslation];
    }
    else
    {
      long long v111 = 0u;
      long long v112 = 0u;
      long long v110 = 0u;
    }
    v97 = [(JFXTextEffectEditorTextView *)self editorView];
    v98 = [v97 transformView];
    v109[0] = v110;
    v109[1] = v111;
    v109[2] = v112;
    [v98 setTransform:v109];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_paste_ == a3
    && ([MEMORY[0x263F1C840] generalPasteboard],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 hasImages],
        v7,
        (v8 & 1) != 0))
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)JFXTextEffectEditorTextView;
    BOOL v9 = [(JFXTextEffectEditorTextView *)&v11 canPerformAction:a3 withSender:v6];
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  char v8 = [(JFXTextEffectEditorTextView *)self beginningOfDocument];
  BOOL v9 = [(JFXTextEffectEditorTextView *)self endOfDocument];
  long long v10 = [(JFXTextEffectEditorTextView *)self textRangeFromPosition:v8 toPosition:v9];

  [(JFXTextEffectEditorTextView *)self selectionRectsForRange:v10];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) rect];
        v26.double x = x;
        v26.double y = y;
        if (CGRectContainsPoint(v27, v26))
        {
          v18.receiver = self;
          v18.super_class = (Class)JFXTextEffectEditorTextView;
          double v16 = -[JFXTextEffectEditorTextView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  double v16 = 0;
LABEL_11:

  return v16;
}

- (CGRect)textEditingFrame
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(JFXTextEffectEditorTextView *)self beginningOfDocument];
  id v4 = [(JFXTextEffectEditorTextView *)self endOfDocument];
  int v5 = [(JFXTextEffectEditorTextView *)self textRangeFromPosition:v3 toPosition:v4];

  id v6 = [(JFXTextEffectEditorTextView *)self selectionRectsForRange:v5];
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v14) rect];
        v28.origin.CGFloat x = x;
        v28.origin.CGFloat y = y;
        v28.size.CGFloat width = width;
        v28.size.CGFloat height = height;
        CGRect v26 = CGRectUnion(v25, v28);
        CGFloat x = v26.origin.x;
        CGFloat y = v26.origin.y;
        CGFloat width = v26.size.width;
        CGFloat height = v26.size.height;
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)unmarkText
{
  v3 = [(JFXTextEffectEditorTextView *)self delegate];
  int v4 = [v3 conformsToProtocol:&unk_26E84B750];

  if (v4)
  {
    int v5 = [(JFXTextEffectEditorTextView *)self delegate];
    [v5 textEffectEditorTextViewDidUnmarkText:self];
  }
  v6.receiver = self;
  v6.super_class = (Class)JFXTextEffectEditorTextView;
  [(JFXTextEffectEditorTextView *)&v6 unmarkText];
}

- (id)textColorForCaretSelection
{
  v2 = [(JFXTextEffectEditorTextView *)self editorView];
  v3 = [v2 textEditingProperties];

  int v4 = [v3 defaultTextColor];
  int v5 = [v3 customTextColor];
  objc_super v6 = [MEMORY[0x263F1C550] clearColor];
  int v7 = [v5 isEqual:v6];

  if (v7) {
    char v8 = v4;
  }
  else {
    char v8 = v5;
  }
  id v9 = v8;

  return v9;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(JFXTextEffectEditorTextView *)self editorView];
  char v8 = [v7 textEditingProperties];

  v17.receiver = self;
  v17.super_class = (Class)JFXTextEffectEditorTextView;
  id v9 = [(JFXTextEffectEditorTextView *)&v17 textStylingAtPosition:v6 inDirection:a4];

  uint64_t v10 = *MEMORY[0x263F1C240];
  uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F1C240]];
  if (!v11)
  {
    uint64_t v11 = [v8 customTextColor];
  }
  uint64_t v12 = [MEMORY[0x263F1C550] clearColor];
  int v13 = [v11 isEqual:v12];

  if (v13)
  {
    uint64_t v14 = [v8 defaultTextColor];
    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x263F1C550] blackColor];
    }
    id v15 = (id)[v9 mutableCopy];
    [v15 setObject:v14 forKeyedSubscript:v10];
  }
  else
  {
    id v15 = v9;
  }

  return v15;
}

- (void)JFX_adjustTextEditingViewFrameAndInsetsForShadow:(id)a3
{
  if (a3)
  {
    double v18 = self;
    id v4 = a3;
    [v4 shadowOffset];
    double v6 = fabs(v5);
    [v4 shadowBlurRadius];
    double v8 = v6 + fabs(v7);
    [v4 shadowOffset];
    double v10 = fabs(v9);
    [v4 shadowBlurRadius];
    double v12 = v11;

    double v13 = v10 + fabs(v12);
    [(JFXTextEffectEditorTextView *)v18 frame];
    CGRect v21 = CGRectInset(v20, -v8, -v13);
    -[JFXTextEffectEditorTextView setFrame:](v18, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    [(JFXTextEffectEditorTextView *)v18 textContainerInset];
    -[JFXTextEffectEditorTextView setTextContainerInset:](v18, "setTextContainerInset:", v13 + v14, v8 + v16, v13 + v15, v8 + v17);
  }
}

- (void)JFX_adjustTextEditingViewInsetsForVerticalAlignment:(int64_t)a3 textAreaHeight:(double)a4 textHeight:(double)a5
{
  if ((unint64_t)(a3 + 1) < 2) {
    return;
  }
  double v9 = self;
  if (a4 > a5)
  {
    double v10 = a4 - a5;
    if (a3 == 2)
    {
      double v14 = v9;
      [(JFXTextEffectEditorTextView *)v9 textContainerInset];
      double v12 = v10 + v13;
      goto LABEL_7;
    }
    if (a3 == 1)
    {
      double v14 = v9;
      [(JFXTextEffectEditorTextView *)v9 textContainerInset];
      double v12 = v10 * 0.5 + v11;
LABEL_7:
      [(JFXTextEffectEditorTextView *)v14 setTextContainerInset:v12];
      double v9 = v14;
    }
  }
}

- (void)JFX_adjustSizeToMatchExpectedNumberOfLines:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 numberOfLines];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = [v11 textAlignment];
    uint64_t v7 = 5;
    do
    {
      unint64_t v8 = [(JFXTextEffectEditorTextView *)self JFX_countNumberOfLines];
      if (v8 == v5) {
        break;
      }
      double v9 = v8 <= v5 ? -2.0 : 2.0;
      [(JFXTextEffectEditorTextView *)self frame];
      if (v6 == 2)
      {
        double v10 = v10 - v9;
      }
      else if (v6 == 1)
      {
        double v10 = v10 + v9 * -0.5;
      }
      [(JFXTextEffectEditorTextView *)self setFrame:v10];
      --v7;
    }
    while (v7);
  }
}

- (unint64_t)JFX_countNumberOfLines
{
  v2 = [(JFXTextEffectEditorTextView *)self layoutManager];
  unint64_t v3 = [v2 numberOfGlyphs];
  [v2 extraLineFragmentRect];
  unint64_t v5 = v4 > 0.0;
  if (v3)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      [v2 lineFragmentRectForGlyphAtIndex:v6 effectiveRange:&v8];
      uint64_t v6 = v9 + v8;
      ++v5;
    }
    while (v9 + v8 < v3);
  }

  return v5;
}

- (CGRect)textFrameWithoutFudge
{
  double x = self->_textFrameWithoutFudge.origin.x;
  double y = self->_textFrameWithoutFudge.origin.y;
  double width = self->_textFrameWithoutFudge.size.width;
  double height = self->_textFrameWithoutFudge.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTextFrameWithoutFudge:(CGRect)a3
{
  self->_textFrameWithoutFudge = a3;
}

- (JFXTextEffectEditorView)editorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editorView);
  return (JFXTextEffectEditorView *)WeakRetained;
}

- (void)setEditorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end