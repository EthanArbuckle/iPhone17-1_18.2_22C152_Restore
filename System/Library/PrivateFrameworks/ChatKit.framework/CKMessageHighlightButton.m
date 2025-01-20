@interface CKMessageHighlightButton
- (BOOL)didUpdate;
- (BOOL)isHighlighted;
- (CAShapeLayer)blurEffectMaskLayer;
- (CGRect)balloonViewFrame;
- (CGRect)calculateFrameRelativeToBalloonViewFrame;
- (CGRect)calculateFrameRelativeToBalloonViewFrame:(CGRect)a3 transcriptHighlightFrame:(CGRect)a4;
- (CGRect)calculateTranscriptHighlightFrameRelativeToBalloonFrame:(CGRect)a3;
- (CGRect)replyButtonFrame;
- (CGSize)buttonSize;
- (CGSize)buttonSizeWithInsets;
- (CGSize)transcriptHighlightSize;
- (CKMessageHighlightButton)initWithCoder:(id)a3;
- (CKMessageHighlightButton)initWithFrame:(CGRect)a3;
- (CKMessageHighlightButton)initWithInitialState:(BOOL)a3;
- (CKMessageHighlightButtonDelegate)delegate;
- (UIButton)button;
- (UIImageView)glyphView;
- (UIImageView)glyphViewForCrossFade;
- (UIView)backgroundColorView;
- (UIView)backgroundColorViewForCrossFade;
- (UIVisualEffectView)blurEffectView;
- (char)transcriptOrientation;
- (void)buttonWasPressed:(id)a3;
- (void)layoutSubviews;
- (void)performFadeoutAnimationWithDuration:(double)a3 completion:(id)a4;
- (void)performHideAnimationWithDuration:(double)a3 completion:(id)a4;
- (void)performSelectedAnimation:(id)a3;
- (void)performShowAnimation:(id)a3;
- (void)performUnselectedDismissAnimationWithDuration:(double)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CKMessageHighlightButton

- (CKMessageHighlightButton)initWithCoder:(id)a3
{
  return [(CKMessageHighlightButton *)self initWithInitialState:0];
}

- (CKMessageHighlightButton)initWithFrame:(CGRect)a3
{
  return -[CKMessageHighlightButton initWithInitialState:](self, "initWithInitialState:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CKMessageHighlightButton)initWithInitialState:(BOOL)a3
{
  BOOL v3 = a3;
  v44.receiver = self;
  v44.super_class = (Class)CKMessageHighlightButton;
  v4 = -[CKMessageHighlightButton initWithFrame:](&v44, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  if (v4)
  {
    v5 = +[CKUIBehavior sharedBehaviors];
    v6 = [v5 messageHighlightButtonUnselectedBackgroundColor];

    v7 = +[CKUIBehavior sharedBehaviors];
    v43 = [v7 messageHighlightButtonSelectedBackgroundColor];

    v8 = +[CKUIBehavior sharedBehaviors];
    v42 = [v8 messageHighlightButtonImageHighlightOn];

    v9 = +[CKUIBehavior sharedBehaviors];
    uint64_t v10 = [v9 messageHighlightButtonImageHighlightOff];

    id v11 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
    backgroundColorView = v4->_backgroundColorView;
    v4->_backgroundColorView = (UIView *)v16;

    [(CKMessageHighlightButton *)v4 addSubview:v4->_backgroundColorView];
    v18 = (void *)MEMORY[0x1E4F427D8];
    v19 = +[CKUIBehavior sharedBehaviors];
    [v19 replyButtonBackgroundBlurRadius];
    v20 = objc_msgSend(v18, "effectWithBlurRadius:");

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v20];
    blurEffectView = v4->_blurEffectView;
    v4->_blurEffectView = (UIVisualEffectView *)v21;

    uint64_t v23 = [MEMORY[0x1E4F39C88] layer];
    blurEffectMaskLayer = v4->_blurEffectMaskLayer;
    v4->_blurEffectMaskLayer = (CAShapeLayer *)v23;

    [(UIVisualEffectView *)v4->_blurEffectView setBackgroundColor:v6];
    [(UIView *)v4->_backgroundColorView addSubview:v4->_blurEffectView];
    v25 = [(UIView *)v4->_backgroundColorView layer];
    [v25 setMask:v4->_blurEffectMaskLayer];

    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v12, v13, v14, v15);
    backgroundColorViewForCrossFade = v4->_backgroundColorViewForCrossFade;
    v4->_backgroundColorViewForCrossFade = (UIView *)v26;

    v28 = [(UIView *)v4->_backgroundColorViewForCrossFade layer];
    [v28 setOpacity:0.0];

    if (v3) {
      v29 = v6;
    }
    else {
      v29 = v43;
    }
    if (v3) {
      v30 = v42;
    }
    else {
      v30 = (void *)v10;
    }
    v31 = (void *)v10;
    [(UIView *)v4->_backgroundColorViewForCrossFade setBackgroundColor:v29];
    [(CKMessageHighlightButton *)v4 addSubview:v4->_backgroundColorViewForCrossFade];
    uint64_t v32 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v30];
    glyphView = v4->_glyphView;
    v4->_glyphView = (UIImageView *)v32;

    [(UIImageView *)v4->_glyphView setContentMode:1];
    [(CKMessageHighlightButton *)v4 addSubview:v4->_glyphView];
    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v30];
    glyphViewForCrossFade = v4->_glyphViewForCrossFade;
    v4->_glyphViewForCrossFade = (UIImageView *)v34;

    v36 = [(UIImageView *)v4->_glyphViewForCrossFade layer];
    [v36 setOpacity:0.0];

    [(CKMessageHighlightButton *)v4 addSubview:v4->_glyphViewForCrossFade];
    uint64_t v37 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    button = v4->_button;
    v4->_button = (UIButton *)v37;

    v39 = v4->_button;
    v40 = +[CKUIBehavior sharedBehaviors];
    [v40 messageHighlightButtonInsets];
    -[UIButton setContentEdgeInsets:](v39, "setContentEdgeInsets:");

    [(UIButton *)v4->_button addTarget:v4 action:sel_buttonWasPressed_ forControlEvents:64];
    [(UIButton *)v4->_button setEnabled:1];
    [(CKMessageHighlightButton *)v4 addSubview:v4->_button];
    v4->_isHighlighted = v3;
    [(CKMessageHighlightButton *)v4 setUserInteractionEnabled:1];
  }
  return v4;
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)CKMessageHighlightButton;
  [(CKMessageHighlightButton *)&v44 layoutSubviews];
  [(CKMessageHighlightButton *)self buttonSize];
  double v4 = v3;
  double v6 = v5;
  [(CKMessageHighlightButton *)self bounds];
  double v9 = v8 + floor((v7 - v4) * 0.5);
  double v12 = v11 + floor((v10 - v6) * 0.5);
  double v13 = [(CKMessageHighlightButton *)self traitCollection];
  [v13 displayScale];
  double v15 = round(v14 * v9) / v14;
  double v16 = round(v14 * v12) / v14;
  double v17 = round(v4 * v14) / v14;
  double v18 = round(v6 * v14) / v14;

  v19 = [(UIView *)self->_backgroundColorView layer];
  [v19 setCornerRadius:v18 * 0.5];

  -[UIView setFrame:](self->_backgroundColorView, "setFrame:", v15, v16, v17, v18);
  v20 = [(UIView *)self->_backgroundColorViewForCrossFade layer];
  [v20 setCornerRadius:v18 * 0.5];

  -[UIView setFrame:](self->_backgroundColorViewForCrossFade, "setFrame:", v15, v16, v17, v18);
  uint64_t v21 = +[CKUIBehavior sharedBehaviors];
  [v21 messageHighlightButtonGlyphSymbolPointSize];
  double v23 = v22;
  v24 = +[CKUIBehavior sharedBehaviors];
  [v24 messageHighlightButtonGlyphSymbolPointSize];
  double v26 = v25;

  [(CKMessageHighlightButton *)self bounds];
  double v28 = (v27 - v23) * 0.5;
  [(CKMessageHighlightButton *)self bounds];
  double v30 = (v29 - v26) * 0.5;
  -[UIImageView setFrame:](self->_glyphView, "setFrame:", v28, v30, v23, v26);
  -[UIImageView setFrame:](self->_glyphViewForCrossFade, "setFrame:", v28, v30, v23, v26);
  [(CKMessageHighlightButton *)self bounds];
  -[UIButton setFrame:](self->_button, "setFrame:");
  [(UIView *)self->_backgroundColorView bounds];
  -[UIVisualEffectView setFrame:](self->_blurEffectView, "setFrame:");
  blurEffectMaskLayer = self->_blurEffectMaskLayer;
  uint64_t v32 = (void *)MEMORY[0x1E4F427D0];
  [(UIVisualEffectView *)self->_blurEffectView frame];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  v41 = [(UIView *)self->_backgroundColorView layer];
  [v41 cornerRadius];
  objc_msgSend(v32, "bezierPathWithRoundedRect:cornerRadius:", v34, v36, v38, v40, v42);
  id v43 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](blurEffectMaskLayer, "setPath:", [v43 CGPath]);
}

- (void)buttonWasPressed:(id)a3
{
  self->_didUpdate = 1;
  self->_isHighlighted ^= 1u;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CKMessageHighlightButton_buttonWasPressed___block_invoke;
  v6[3] = &unk_1E5620C40;
  v6[4] = self;
  [(CKMessageHighlightButton *)self performSelectedAnimation:v6];
  double v4 = [(CKMessageHighlightButton *)self delegate];

  if (v4)
  {
    double v5 = [(CKMessageHighlightButton *)self delegate];
    [v5 messageHightlightButtonWasClicked:self];
  }
}

void __45__CKMessageHighlightButton_buttonWasPressed___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 messageHightlightButtonDidFinishAnimating:*(void *)(a1 + 32)];
  }
}

- (CGSize)buttonSize
{
  [(CKMessageHighlightButton *)self replyButtonFrame];
  if (v2 == *MEMORY[0x1E4F1DB30] && v2 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v6 = +[CKUIBehavior sharedBehaviors];
    [v6 messageHighlightButtonVisibleViewSize];
    double v8 = v7;
    double v10 = v9;

    double v4 = v8;
    double v5 = v10;
  }
  else
  {
    double v4 = v2;
    double v5 = v2;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)buttonSizeWithInsets
{
  [(CKMessageHighlightButton *)self buttonSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CKMessageHighlightButton *)self button];
  [v7 contentEdgeInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v4 + v11 + v15;
  double v17 = v6 + v9 + v13;
  result.height = v17;
  result.width = v16;
  return result;
}

- (char)transcriptOrientation
{
  double v2 = self;
  double v3 = [(CKMessageHighlightButton *)self delegate];
  LOBYTE(v2) = [v3 messageHightlightButtonTranscriptOrientation:v2];

  return (char)v2;
}

- (CGRect)balloonViewFrame
{
  double v3 = [(CKMessageHighlightButton *)self delegate];
  [v3 messageHightlightButtonBalloonViewFrame:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)replyButtonFrame
{
  double v3 = [(CKMessageHighlightButton *)self delegate];
  [v3 messageHightlightButtonReplyButtonFrame:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)transcriptHighlightSize
{
  double v2 = +[CKUIBehavior sharedBehaviors];
  [v2 messageHighlightTranscriptBalloonSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = +[CKUIBehavior sharedBehaviors];
  [v7 messageHighlightTranscriptBalloonBorderWidth];
  double v9 = v8 + v8;

  double v10 = v4 + v9;
  double v11 = v6 + v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGRect)calculateTranscriptHighlightFrameRelativeToBalloonFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CKMessageHighlightButton *)self transcriptHighlightSize];
  double v9 = v8;
  double v11 = v10;
  double v12 = +[CKUIBehavior sharedBehaviors];
  [v12 messageHighlightTranscriptBalloonRelativePosition];
  double v14 = v13;
  double v16 = v15;

  int v17 = [(CKMessageHighlightButton *)self transcriptOrientation];
  if (v17 == 2)
  {
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    CGFloat v25 = CGRectGetMinX(v28) - v9;
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v29);
    double v19 = v14 + v25;
    goto LABEL_6;
  }
  if (v17 == 1)
  {
    uint64_t v21 = IMLogHandleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CKMessageHighlightButton calculateTranscriptHighlightFrameRelativeToBalloonFrame:](v21);
    }

    goto LABEL_10;
  }
  if (v17)
  {
LABEL_10:
    double v19 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_11;
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v27);
  double v19 = MaxX - v14;
LABEL_6:
  double v20 = MaxY - v16;
LABEL_11:
  double v22 = v9;
  double v23 = v11;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)calculateFrameRelativeToBalloonViewFrame
{
  [(CKMessageHighlightButton *)self balloonViewFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CKMessageHighlightButton calculateTranscriptHighlightFrameRelativeToBalloonFrame:](self, "calculateTranscriptHighlightFrameRelativeToBalloonFrame:");

  -[CKMessageHighlightButton calculateFrameRelativeToBalloonViewFrame:transcriptHighlightFrame:](self, "calculateFrameRelativeToBalloonViewFrame:transcriptHighlightFrame:", v4, v6, v8, v10, v11, v12, v13, v14);
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)calculateFrameRelativeToBalloonViewFrame:(CGRect)a3 transcriptHighlightFrame:(CGRect)a4
{
  CGFloat y = a4.origin.y;
  CGFloat height = a4.size.height;
  double x = a4.origin.x;
  double width = a4.size.width;
  double v5 = (CGFloat *)MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (CKMainScreenScale_once_60 != -1) {
    dispatch_once(&CKMainScreenScale_once_60, &__block_literal_global_157);
  }
  if (*(double *)&CKMainScreenScale_sMainScreenScale_60 == 0.0) {
    double v8 = 1.0;
  }
  else {
    double v8 = *(double *)&CKMainScreenScale_sMainScreenScale_60;
  }
  double v9 = 1.0 / v8;
  [(CKMessageHighlightButton *)self buttonSizeWithInsets];
  double v11 = v10;
  double v13 = v12;
  [(CKMessageHighlightButton *)self replyButtonFrame];
  double v14 = v34.origin.y;
  v36.origin.double x = *v5;
  v36.origin.CGFloat y = v5[1];
  v36.size.double width = v6;
  v36.size.CGFloat height = v7;
  if (CGRectEqualToRect(v34, v36))
  {
    double v15 = v9 * (v29 * v8 + floor((v31 * v8 - v7 * v8) * 0.5)) - v13 * 0.5;
  }
  else
  {
    double v16 = [(CKMessageHighlightButton *)self button];
    [v16 contentEdgeInsets];
    double v15 = v14 - v17;
  }
  double v18 = [(CKMessageHighlightButton *)self traitCollection];
  [v18 displayScale];
  double v20 = round((v9 * (x * v8 + floor((width * v8 - v6 * v8) * 0.5)) - v11 * 0.5) * v19) / v19;
  double v21 = round(v15 * v19) / v19;
  double v22 = round(v11 * v19) / v19;
  double v23 = round(v13 * v19) / v19;

  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.double width = v26;
  result.origin.CGFloat y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)performShowAnimation:(id)a3
{
  v58[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CKMessageHighlightButton *)self balloonViewFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[CKMessageHighlightButton calculateTranscriptHighlightFrameRelativeToBalloonFrame:](self, "calculateTranscriptHighlightFrameRelativeToBalloonFrame:");
  CGFloat v14 = v13;
  double v16 = v15;
  CGFloat v18 = v17;
  double v19 = v8;
  CGFloat v21 = v20;
  -[CKMessageHighlightButton calculateFrameRelativeToBalloonViewFrame:transcriptHighlightFrame:](self, "calculateFrameRelativeToBalloonViewFrame:transcriptHighlightFrame:", v6, v19, v10, v12, v13, v16);
  CGFloat v53 = v23;
  CGFloat v54 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  -[CKMessageHighlightButton setFrame:](self, "setFrame:");
  [(CKMessageHighlightButton *)self setHidden:0];
  [(CKMessageHighlightButton *)self alpha];
  uint64_t v29 = v28;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.300000012];
  double v30 = (void *)MEMORY[0x1E4F39CF8];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __49__CKMessageHighlightButton_performShowAnimation___block_invoke;
  v55[3] = &unk_1E5629550;
  v55[4] = self;
  uint64_t v57 = v29;
  id v31 = v4;
  id v56 = v31;
  [v30 setCompletionBlock:v55];
  uint64_t v32 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position"];
  double v33 = (void *)MEMORY[0x1E4F29238];
  v59.origin.double x = v14;
  v59.origin.CGFloat y = v16;
  v59.size.double width = v21;
  v59.size.CGFloat height = v18;
  double MidX = CGRectGetMidX(v59);
  v60.origin.double x = v14;
  double v35 = v18;
  v60.origin.CGFloat y = v16;
  v60.size.double width = v21;
  v60.size.CGFloat height = v18;
  CGRect v36 = objc_msgSend(v33, "valueWithCGPoint:", MidX, CGRectGetMidY(v60));
  [v32 setFromValue:v36];

  double v37 = (void *)MEMORY[0x1E4F29238];
  v61.origin.double x = v54;
  v61.origin.CGFloat y = v53;
  v61.size.double width = v25;
  v61.size.CGFloat height = v27;
  double v38 = CGRectGetMidX(v61);
  v62.origin.double x = v54;
  v62.origin.CGFloat y = v53;
  v62.size.double width = v25;
  v62.size.CGFloat height = v27;
  double v39 = objc_msgSend(v37, "valueWithCGPoint:", v38, CGRectGetMidY(v62));
  [v32 setToValue:v39];

  [v32 setDuration:0.300000012];
  uint64_t v40 = *MEMORY[0x1E4F3A490];
  v41 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v32 setTimingFunction:v41];

  [v32 setRemovedOnCompletion:1];
  if (self->_isHighlighted)
  {
    [(CKMessageHighlightButton *)self buttonSize];
    double v43 = v35 / v42;
  }
  else
  {
    double v43 = 0.0;
  }
  objc_super v44 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale.xy"];
  v45 = [NSNumber numberWithDouble:v43];
  v58[0] = v45;
  v58[1] = &unk_1EDF17288;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  [v44 setValues:v46];

  [v44 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [v44 setDuration:0.300000012];
  v47 = [MEMORY[0x1E4F39C10] functionWithName:v40];
  [v44 setTimingFunction:v47];

  LODWORD(v48) = 1.0;
  [v44 setRepeatCount:v48];
  [v44 setAutoreverses:0];
  [v44 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v44 setRemovedOnCompletion:1];
  v49 = [(CKMessageHighlightButton *)self layer];
  [v49 addAnimation:v44 forKey:@"transform.scale.xy"];

  v50 = [(CKMessageHighlightButton *)self layer];
  [v50 addAnimation:v32 forKey:@"position"];

  if (!self->_isHighlighted)
  {
    v51 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v51 setFromValue:&unk_1EDF17298];
    [v51 setDuration:0.300000012];
    [v51 setRemovedOnCompletion:1];
    [v51 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v51 setBeginTime:0.100000001];
    [v51 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
    v52 = [(CKMessageHighlightButton *)self layer];
    [v52 addAnimation:v51 forKey:@"opacity"];
  }
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __49__CKMessageHighlightButton_performShowAnimation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)performFadeoutAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:a3];
  double v7 = (void *)MEMORY[0x1E4F39CF8];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  double v17 = __75__CKMessageHighlightButton_performFadeoutAnimationWithDuration_completion___block_invoke;
  CGFloat v18 = &unk_1E5622330;
  double v19 = self;
  id v20 = v6;
  id v8 = v6;
  [v7 setCompletionBlock:&v15];
  double v9 = objc_msgSend(MEMORY[0x1E4F39C90], "animationWithKeyPath:", @"transform.scale.xy", v15, v16, v17, v18, v19);
  [v9 setToValue:&unk_1EDF172A8];
  LODWORD(v10) = 1.5;
  [v9 setSpeed:v10];
  [v9 setMass:1.0];
  [v9 setStiffness:350.0];
  [v9 setDamping:40.0];
  [v9 setDuration:a3];
  [v9 setRemovedOnCompletion:0];
  uint64_t v11 = *MEMORY[0x1E4F39FA0];
  [v9 setFillMode:*MEMORY[0x1E4F39FA0]];
  double v12 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v12 setToValue:&unk_1EDF172B8];
  [v12 setDuration:a3];
  [v12 setRemovedOnCompletion:0];
  [v12 setFillMode:v11];
  double v13 = [(CKMessageHighlightButton *)self layer];
  [v13 addAnimation:v9 forKey:@"transform.scale.xy"];

  CGFloat v14 = [(CKMessageHighlightButton *)self layer];
  [v14 addAnimation:v12 forKey:@"opacity"];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __75__CKMessageHighlightButton_performFadeoutAnimationWithDuration_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)performHideAnimationWithDuration:(double)a3 completion:(id)a4
{
  if (self->_isHighlighted) {
    [(CKMessageHighlightButton *)self performUnselectedDismissAnimationWithDuration:a4 completion:a3];
  }
  else {
    [(CKMessageHighlightButton *)self performFadeoutAnimationWithDuration:a4 completion:a3];
  }
}

- (void)performSelectedAnimation:(id)a3
{
  v62[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CKMessageHighlightButton *)self balloonViewFrame];
  -[CKMessageHighlightButton calculateTranscriptHighlightFrameRelativeToBalloonFrame:](self, "calculateTranscriptHighlightFrameRelativeToBalloonFrame:");
  CGFloat v58 = v6;
  CGFloat v59 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  [(CKMessageHighlightButton *)self frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v19 = +[CKUIBehavior sharedBehaviors];
  [v19 messageHighlightButtonInsets];
  double v21 = v20;

  double v22 = 0.0;
  if (self->_isHighlighted) {
    double v22 = (v10 + v21) / v18;
  }
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", *(void *)&v22);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.3];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v4];

  v63.origin.double x = v12;
  v63.origin.CGFloat y = v14;
  v63.size.double width = v16;
  v63.size.CGFloat height = v18;
  double MidX = CGRectGetMidX(v63);
  v64.origin.double x = v12;
  v64.origin.CGFloat y = v14;
  v64.size.double width = v16;
  v64.size.CGFloat height = v18;
  double MidY = CGRectGetMidY(v64);
  v65.origin.double x = v59;
  v65.origin.CGFloat y = v8;
  v65.size.double width = v58;
  v65.size.CGFloat height = v10;
  double v25 = CGRectGetMidX(v65);
  v66.origin.double x = v59;
  v66.origin.CGFloat y = v8;
  v66.size.double width = v58;
  v66.size.CGFloat height = v10;
  double v26 = CGRectGetMidY(v66);
  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", MidX, MidY);
  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v25, v26);
  uint64_t v29 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position"];
  v62[0] = v27;
  v62[1] = v27;
  CGRect v60 = (void *)v27;
  v62[2] = v28;
  double v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];
  [v29 setValues:v30];

  uint64_t v31 = *MEMORY[0x1E4F39D70];
  [v29 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [v29 setTensionValues:&unk_1EDF15620];
  [v29 setDuration:0.3];
  uint64_t v32 = *MEMORY[0x1E4F3A490];
  double v33 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v29 setTimingFunction:v33];

  LODWORD(v34) = 1.0;
  [v29 setRepeatCount:v34];
  [v29 setAutoreverses:0];
  uint64_t v35 = *MEMORY[0x1E4F39FA8];
  [v29 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v29 setRemovedOnCompletion:0];
  CGRect v36 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale.xy"];
  v61[0] = &unk_1EDF17288;
  v61[1] = &unk_1EDF172C8;
  double v37 = [NSNumber numberWithDouble:v57];
  v61[2] = v37;
  double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
  [v36 setValues:v38];

  [v36 setTensionValues:&unk_1EDF15638];
  [v36 setCalculationMode:v31];
  [v36 setDuration:0.3];
  double v39 = [MEMORY[0x1E4F39C10] functionWithName:v32];
  [v36 setTimingFunction:v39];

  LODWORD(v40) = 1.0;
  [v36 setRepeatCount:v40];
  [v36 setAutoreverses:0];
  [v36 setFillMode:v35];
  [v36 setRemovedOnCompletion:0];
  v41 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v41 setValues:&unk_1EDF15650];
  [v41 setTensionValues:&unk_1EDF15668];
  [v41 setCalculationMode:v31];
  double v42 = [MEMORY[0x1E4F39C10] functionWithName:v32];
  [v41 setTimingFunction:v42];

  LODWORD(v43) = 1.0;
  [v41 setRepeatCount:v43];
  [v41 setAutoreverses:0];
  [v41 setFillMode:v35];
  [v41 setRemovedOnCompletion:0];
  objc_super v44 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v44 setValues:&unk_1EDF15680];
  [v44 setTensionValues:&unk_1EDF15698];
  [v44 setCalculationMode:v31];
  v45 = [MEMORY[0x1E4F39C10] functionWithName:v32];
  [v44 setTimingFunction:v45];

  LODWORD(v46) = 1.0;
  [v44 setRepeatCount:v46];
  [v44 setAutoreverses:0];
  [v44 setFillMode:v35];
  [v44 setRemovedOnCompletion:0];
  if (!self->_isHighlighted)
  {
    v47 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v47 setValues:&unk_1EDF156B0];
    [v47 setTensionValues:&unk_1EDF156C8];
    [v47 setCalculationMode:v31];
    [v47 setDuration:0.3];
    double v48 = [MEMORY[0x1E4F39C10] functionWithName:v32];
    [v47 setTimingFunction:v48];

    LODWORD(v49) = 1.0;
    [v47 setRepeatCount:v49];
    [v47 setAutoreverses:0];
    [v47 setFillMode:v35];
    [v47 setRemovedOnCompletion:0];
    v50 = [(CKMessageHighlightButton *)self layer];
    [v50 addAnimation:v47 forKey:@"opacity"];
  }
  v51 = [(CKMessageHighlightButton *)self layer];
  [v51 addAnimation:v29 forKey:@"position"];

  v52 = [(UIView *)self->_backgroundColorView layer];
  [v52 addAnimation:v41 forKey:@"opacity"];

  CGFloat v53 = [(UIView *)self->_backgroundColorViewForCrossFade layer];
  [v53 addAnimation:v44 forKey:@"opacity"];

  CGFloat v54 = [(UIImageView *)self->_glyphView layer];
  [v54 addAnimation:v41 forKey:@"opacity"];

  v55 = [(UIImageView *)self->_glyphViewForCrossFade layer];
  [v55 addAnimation:v44 forKey:@"opacity"];

  id v56 = [(CKMessageHighlightButton *)self layer];
  [v56 addAnimation:v36 forKey:@"bounds"];

  [MEMORY[0x1E4F39CF8] setDisableActions:0];
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)performUnselectedDismissAnimationWithDuration:(double)a3 completion:(id)a4
{
  v49[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(CKMessageHighlightButton *)self balloonViewFrame];
  -[CKMessageHighlightButton calculateTranscriptHighlightFrameRelativeToBalloonFrame:](self, "calculateTranscriptHighlightFrameRelativeToBalloonFrame:");
  CGFloat v46 = v7;
  CGFloat v43 = v8;
  CGFloat v10 = v9;
  double v12 = v11;
  [(CKMessageHighlightButton *)self frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  double v44 = fmax(a3, 0.3);
  double v21 = +[CKUIBehavior sharedBehaviors];
  [v21 messageHighlightButtonInsets];
  double v23 = v22;

  double v45 = (v12 + v23) / v20;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:v44];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v6];

  v50.origin.double x = v14;
  v50.origin.CGFloat y = v16;
  v50.size.double width = v18;
  v50.size.CGFloat height = v20;
  double MidX = CGRectGetMidX(v50);
  v51.origin.double x = v14;
  v51.origin.CGFloat y = v16;
  v51.size.double width = v18;
  v51.size.CGFloat height = v20;
  double MidY = CGRectGetMidY(v51);
  v52.origin.double x = v46;
  v52.origin.CGFloat y = v43;
  v52.size.double width = v10;
  v52.size.CGFloat height = v12;
  double v26 = CGRectGetMidX(v52);
  v53.origin.double x = v46;
  v53.origin.CGFloat y = v43;
  v53.size.double width = v10;
  v53.size.CGFloat height = v12;
  double v27 = CGRectGetMidY(v53);
  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", MidX, MidY);
  v47 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v26, v27);
  uint64_t v29 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position"];
  v49[0] = v28;
  v49[1] = v28;
  v49[2] = v47;
  double v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
  [v29 setValues:v30];

  uint64_t v31 = *MEMORY[0x1E4F39D70];
  [v29 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [v29 setTensionValues:&unk_1EDF156E0];
  [v29 setDuration:v44];
  uint64_t v32 = *MEMORY[0x1E4F3A490];
  double v33 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v29 setTimingFunction:v33];

  LODWORD(v34) = 1.0;
  [v29 setRepeatCount:v34];
  [v29 setAutoreverses:0];
  uint64_t v35 = *MEMORY[0x1E4F39FA8];
  [v29 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v29 setRemovedOnCompletion:0];
  CGRect v36 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale.xy"];
  v48[0] = &unk_1EDF17288;
  double v37 = [NSNumber numberWithDouble:v45];
  v48[1] = v37;
  double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  [v36 setValues:v38];

  [v36 setTensionValues:&unk_1EDF156F8];
  [v36 setCalculationMode:v31];
  [v36 setDuration:v44];
  double v39 = [MEMORY[0x1E4F39C10] functionWithName:v32];
  [v36 setTimingFunction:v39];

  LODWORD(v40) = 1.0;
  [v36 setRepeatCount:v40];
  [v36 setAutoreverses:0];
  [v36 setFillMode:v35];
  [v36 setRemovedOnCompletion:0];
  v41 = [(CKMessageHighlightButton *)self layer];
  [v41 addAnimation:v29 forKey:@"position"];

  double v42 = [(CKMessageHighlightButton *)self layer];
  [v42 addAnimation:v36 forKey:@"bounds"];

  [MEMORY[0x1E4F39CF8] setDisableActions:0];
  [MEMORY[0x1E4F39CF8] commit];
}

- (CKMessageHighlightButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKMessageHighlightButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (UIButton)button
{
  return self->_button;
}

- (BOOL)didUpdate
{
  return self->_didUpdate;
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (UIView)backgroundColorViewForCrossFade
{
  return self->_backgroundColorViewForCrossFade;
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (CAShapeLayer)blurEffectMaskLayer
{
  return self->_blurEffectMaskLayer;
}

- (UIImageView)glyphView
{
  return self->_glyphView;
}

- (UIImageView)glyphViewForCrossFade
{
  return self->_glyphViewForCrossFade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphViewForCrossFade, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_blurEffectMaskLayer, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundColorViewForCrossFade, 0);
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)calculateTranscriptHighlightFrameRelativeToBalloonFrame:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Positioning CKTranscriptOrientationCenter not supported", v1, 2u);
}

@end