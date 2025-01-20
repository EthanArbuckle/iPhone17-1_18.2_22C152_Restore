@interface CKQuickActionButton
- (BOOL)isAnimating;
- (CAShapeLayer)borderLayer;
- (CKQuickActionButton)init;
- (CKQuickActionButton)initWithCoder:(id)a3;
- (CKQuickActionButton)initWithFrame:(CGRect)a3;
- (CKQuickActionButton)initWithInitialState:(unint64_t)a3;
- (CKQuickActionButtonAnimationDelegate)animationDelegate;
- (CKQuickActionButtonDelegate)delegate;
- (NSMutableArray)deferredAnimationIdentifiers;
- (NSMutableDictionary)deferredConfigurationStates;
- (NSString)currentAnimationIdentifier;
- (UIButton)button;
- (UIEdgeInsets)contentEdgeInsets;
- (UIEdgeInsets)contentEdgeInsetsForState:(unint64_t)a3;
- (UIImageView)imageView;
- (UIView)backgroundView;
- (double)animationDurationForState:(unint64_t)a3;
- (double)delayForFinalizingAnimation;
- (double)delayForImageSwapAnimation;
- (id)buttonImageForState:(unint64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)state;
- (void)_buttonTouchCanceled;
- (void)_buttonTouchDown;
- (void)_buttonTouchUpInside;
- (void)configureForState:(unint64_t)a3 animated:(BOOL)a4 identifier:(id)a5 wasDeferred:(BOOL)a6;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setCurrentAnimationIdentifier:(id)a3;
- (void)setDeferredAnimationIdentifiers:(id)a3;
- (void)setDeferredConfigurationStates:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4;
- (void)updateImageViewFrameForContentEdgeInsets;
@end

@implementation CKQuickActionButton

- (CKQuickActionButton)initWithInitialState:(unint64_t)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CKQuickActionButton;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[CKQuickActionButton initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  if (v8)
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v5, v6, v7);
    backgroundView = v8->_backgroundView;
    v8->_backgroundView = (UIView *)v9;

    [(CKQuickActionButton *)v8 addSubview:v8->_backgroundView];
    v11 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    borderLayer = v8->_borderLayer;
    v8->_borderLayer = v11;

    v13 = [(UIView *)v8->_backgroundView layer];
    [v13 addSublayer:v8->_borderLayer];

    uint64_t v14 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    button = v8->_button;
    v8->_button = (UIButton *)v14;

    [(UIButton *)v8->_button addTarget:v8 action:sel__buttonTouchUpInside forControlEvents:64];
    [(UIButton *)v8->_button addTarget:v8 action:sel__buttonTouchDown forControlEvents:1];
    [(UIButton *)v8->_button addTarget:v8 action:sel__buttonTouchCanceled forControlEvents:256];
    [(UIButton *)v8->_button addTarget:v8 action:sel__buttonTouchCanceled forControlEvents:128];
    [(CKQuickActionButton *)v8 addSubview:v8->_button];
    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    imageView = v8->_imageView;
    v8->_imageView = v16;

    [(UIImageView *)v8->_imageView setContentMode:4];
    [(CKQuickActionButton *)v8 addSubview:v8->_imageView];
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deferredAnimationIdentifiers = v8->_deferredAnimationIdentifiers;
    v8->_deferredAnimationIdentifiers = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deferredConfigurationStates = v8->_deferredConfigurationStates;
    v8->_deferredConfigurationStates = v20;

    v8->_state = a3;
    v22 = [NSString stringGUID];
    [(CKQuickActionButton *)v8 configureForState:a3 animated:0 identifier:v22 wasDeferred:0];
  }
  return v8;
}

- (CKQuickActionButton)init
{
  return [(CKQuickActionButton *)self initWithInitialState:0];
}

- (CKQuickActionButton)initWithCoder:(id)a3
{
  return [(CKQuickActionButton *)self initWithInitialState:0];
}

- (CKQuickActionButton)initWithFrame:(CGRect)a3
{
  return -[CKQuickActionButton initWithInitialState:](self, "initWithInitialState:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)CKQuickActionButton;
  [(CKQuickActionButton *)&v20 layoutSubviews];
  [(CKQuickActionButton *)self updateImageViewFrameForContentEdgeInsets];
  [(CKQuickActionButton *)self bounds];
  -[UIButton setFrame:](self->_button, "setFrame:");
  [(CKQuickActionButton *)self bounds];
  double v4 = v3 * 0.5;
  double v5 = [(UIView *)self->_backgroundView layer];
  [v5 setCornerRadius:v4];

  [(CKQuickActionButton *)self bounds];
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  double v6 = (void *)MEMORY[0x1E4F427D0];
  double v7 = [(CKQuickActionButton *)self backgroundView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(CKQuickActionButton *)self backgroundView];
  v17 = [v16 layer];
  [v17 cornerRadius];
  objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v18);
  id v19 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_borderLayer, "setPath:", [v19 CGPath]);
}

- (void)updateImageViewFrameForContentEdgeInsets
{
  [(CKQuickActionButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CKQuickActionButton *)self contentEdgeInsets];
  double v12 = v4 + v11;
  [(CKQuickActionButton *)self contentEdgeInsets];
  double v14 = v13;
  [(CKQuickActionButton *)self contentEdgeInsets];
  double v16 = v8 - (v14 + v15);
  [(CKQuickActionButton *)self contentEdgeInsets];
  double v18 = v6 + v17;
  [(CKQuickActionButton *)self contentEdgeInsets];
  double v20 = v19;
  [(CKQuickActionButton *)self contentEdgeInsets];
  imageView = self->_imageView;

  -[UIImageView setFrame:](imageView, "setFrame:", v12, v18, v16, v10 - (v20 + v21));
}

- (double)animationDurationForState:(unint64_t)a3
{
  return 0.0;
}

- (double)delayForFinalizingAnimation
{
  return 0.0;
}

- (double)delayForImageSwapAnimation
{
  return 0.0;
}

- (id)buttonImageForState:(unint64_t)a3
{
  return 0;
}

- (UIEdgeInsets)contentEdgeInsetsForState:(unint64_t)a3
{
  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)configureForState:(unint64_t)a3 animated:(BOOL)a4 identifier:(id)a5 wasDeferred:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  if (v6 && IMOSLoggingEnabled())
  {
    double v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v86 = a3;
      __int16 v87 = 2112;
      id v88 = v10;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Performing deferred state config for state %lu. identifier: %@", buf, 0x16u);
    }
  }
  double v12 = [(CKQuickActionButton *)self currentAnimationIdentifier];
  if (!v12
    || ([(CKQuickActionButton *)self currentAnimationIdentifier],
        double v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 isEqualToString:v10],
        v13,
        v12,
        (v14 & 1) != 0))
  {
    [(CKQuickActionButton *)self setCurrentAnimationIdentifier:v10];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke;
    aBlock[3] = &unk_1E5622950;
    aBlock[4] = self;
    aBlock[5] = a3;
    double v15 = (void (**)(void))_Block_copy(aBlock);
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_2;
    v82[3] = &unk_1E5620C40;
    v82[4] = self;
    double v16 = (void (**)(void))_Block_copy(v82);
    if (v7)
    {
      [(CKQuickActionButton *)self setAnimating:1];
      if (a3 < 2)
      {
        int64_t v59 = 0;
      }
      else
      {
        if (a3 != 3)
        {
          if (a3 == 2)
          {
            double v17 = [(CKQuickActionButton *)self imageView];
            double v18 = [v17 layer];
            double v19 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
            v84 = v19;
            double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
            [v18 setFilters:v20];

            double v21 = [(CKQuickActionButton *)self imageView];
            [v21 setAlpha:1.0];

            id v22 = objc_alloc(MEMORY[0x1E4F42FF0]);
            v23 = [(CKQuickActionButton *)self backgroundView];
            [v23 frame];
            objc_super v24 = objc_msgSend(v22, "initWithFrame:");

            CGAffineTransformMakeScale(&v81, 0.0, 0.0);
            [v24 setTransform:&v81];
            v25 = +[CKUIBehavior sharedBehaviors];
            v26 = [v25 theme];
            v27 = [v26 quickActionButtonBurstColor];
            [v24 setBackgroundColor:v27];

            v28 = [v24 layer];
            v29 = [(CKQuickActionButton *)self backgroundView];
            v30 = [v29 layer];
            [v30 cornerRadius];
            objc_msgSend(v28, "setCornerRadius:");

            v31 = [v24 layer];
            id v32 = [MEMORY[0x1E4F428B8] systemWhiteColor];
            objc_msgSend(v31, "setBorderColor:", objc_msgSend(v32, "CGColor"));

            v33 = [v24 layer];
            [v33 setBorderWidth:1.0];

            v34 = [(CKQuickActionButton *)self backgroundView];
            [(CKQuickActionButton *)self insertSubview:v24 belowSubview:v34];

            [v24 bounds];
            double v36 = v35;
            id v37 = objc_alloc(MEMORY[0x1E4F42FF0]);
            v38 = [(CKQuickActionButton *)self backgroundView];
            [v38 frame];
            v39 = objc_msgSend(v37, "initWithFrame:");

            CGAffineTransformMakeScale(&v80, 0.0, 0.0);
            [v39 setTransform:&v80];
            v40 = +[CKUIBehavior sharedBehaviors];
            v41 = [v40 theme];
            v42 = [v41 quickActionButtonBurstColor];
            [v39 setBackgroundColor:v42];

            v43 = [v39 layer];
            v44 = [(CKQuickActionButton *)self backgroundView];
            v45 = [v44 layer];
            [v45 cornerRadius];
            objc_msgSend(v43, "setCornerRadius:");

            [(CKQuickActionButton *)self insertSubview:v39 belowSubview:v24];
            [(CKQuickActionButton *)self animationDurationForState:2];
            double v47 = v46;
            v48 = (void *)MEMORY[0x1E4F42FF0];
            v78[0] = MEMORY[0x1E4F143A8];
            v78[1] = 3221225472;
            v78[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_3;
            v78[3] = &unk_1E5620AF8;
            v78[4] = self;
            id v79 = v24;
            v75[0] = MEMORY[0x1E4F143A8];
            v75[1] = 3221225472;
            v75[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_4;
            v75[3] = &unk_1E5629390;
            id v76 = v79;
            v77 = v15;
            id v49 = v79;
            [v48 animateWithDuration:v78 animations:v75 completion:v47];
            double v50 = v36 * 1.5 * (v47 / v36);
            v51 = (void *)MEMORY[0x1E4F42FF0];
            v72[0] = MEMORY[0x1E4F143A8];
            v72[1] = 3221225472;
            v72[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_5;
            v72[3] = &unk_1E5622950;
            id v52 = v39;
            id v73 = v52;
            uint64_t v74 = 0x3FF8000000000000;
            [v51 animateWithDuration:v72 animations:0 completion:v50];
            v53 = (void *)MEMORY[0x1E4F42FF0];
            v70[0] = MEMORY[0x1E4F143A8];
            v70[1] = 3221225472;
            v70[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_6;
            v70[3] = &unk_1E5620C40;
            id v71 = v52;
            v67[0] = MEMORY[0x1E4F143A8];
            v67[1] = 3221225472;
            v67[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_7;
            v67[3] = &unk_1E5622750;
            id v68 = v71;
            v69 = v16;
            id v54 = v71;
            [v53 animateWithDuration:196608 delay:v70 options:v67 animations:v50 - v47 completion:v47];
          }
          goto LABEL_22;
        }
        [(CKQuickActionButton *)self delayForImageSwapAnimation];
        int64_t v59 = (uint64_t)(v60 * 1000000000.0);
      }
      dispatch_time_t v61 = dispatch_time(0, v59);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_8;
      v62[3] = &unk_1E5629B78;
      v62[4] = self;
      unint64_t v65 = a3;
      uint64_t v66 = 0x3FD3333333333333;
      v63 = v15;
      v64 = v16;
      dispatch_after(v61, MEMORY[0x1E4F14428], v62);
    }
    else
    {
      v15[2](v15);
      v16[2](v16);
    }
LABEL_22:

    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    v55 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v86 = a3;
      __int16 v87 = 2112;
      id v88 = v10;
      _os_log_impl(&dword_18EF18000, v55, OS_LOG_TYPE_INFO, "Deferring state config for state %lu. identifier: %@", buf, 0x16u);
    }
  }
  v56 = [(CKQuickActionButton *)self deferredAnimationIdentifiers];
  [v56 addObject:v10];

  v57 = [(CKQuickActionButton *)self deferredConfigurationStates];
  v58 = [NSNumber numberWithUnsignedInteger:a3];
  [v57 setObject:v58 forKey:v10];

LABEL_23:
}

void __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke(uint64_t a1)
{
  v74[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) imageView];
  double v3 = [*(id *)(a1 + 32) buttonImageForState:*(void *)(a1 + 40)];
  [v2 setImage:v3];

  double v4 = *(void **)(a1 + 32);
  [v4 contentEdgeInsetsForState:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setContentEdgeInsets:");
  [*(id *)(a1 + 32) updateImageViewFrameForContentEdgeInsets];
  switch(*(void *)(a1 + 40))
  {
    case 0:
      double v5 = [*(id *)(a1 + 32) imageView];
      BOOL v6 = +[CKUIBehavior sharedBehaviors];
      BOOL v7 = [v6 theme];
      double v8 = [v7 quickActionButtonGlyphColor];
      [v5 setTintColor:v8];

      double v9 = [*(id *)(a1 + 32) imageView];
      id v10 = [v9 layer];
      double v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
      v74[0] = v11;
      double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
      [v10 setFilters:v12];

      double v13 = [*(id *)(a1 + 32) imageView];
      [v13 setAlpha:1.0];

      char v14 = [*(id *)(a1 + 32) backgroundView];
      double v15 = +[CKUIBehavior sharedBehaviors];
      double v16 = [v15 theme];
      double v17 = [v16 transcriptBackgroundColor];
      [v14 setBackgroundColor:v17];

      double v18 = [*(id *)(a1 + 32) backgroundView];
      [v18 setAlpha:1.0];

      double v19 = [*(id *)(a1 + 32) borderLayer];
      id v20 = [MEMORY[0x1E4F428B8] clearColor];
      objc_msgSend(v19, "setFillColor:", objc_msgSend(v20, "CGColor"));

      double v21 = [*(id *)(a1 + 32) borderLayer];
      id v22 = +[CKUIBehavior sharedBehaviors];
      v23 = [v22 theme];
      id v24 = [v23 quickActionButtonStrokeColor];
      objc_msgSend(v21, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

      goto LABEL_5;
    case 1:
      double v70 = 0.0;
      double v71 = 0.0;
      double v68 = 0.0;
      double v69 = 0.0;
      v25 = +[CKUIBehavior sharedBehaviors];
      v26 = [v25 theme];
      v27 = [v26 quickActionButtonGlyphColor];
      [v27 getRed:&v71 green:&v70 blue:&v69 alpha:&v68];

      v28 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:", fmin(v71 + 0.2, 1.0), fmin(v70 + 0.2, 1.0), fmin(v69 + 0.2, 1.0), v68);
      v29 = [*(id *)(a1 + 32) imageView];
      [v29 setTintColor:v28];

      v30 = [*(id *)(a1 + 32) imageView];
      v31 = [v30 layer];
      id v32 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
      id v73 = v32;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
      [v31 setFilters:v33];

      v34 = [*(id *)(a1 + 32) imageView];
      [v34 setAlpha:1.0];

      double v35 = [*(id *)(a1 + 32) backgroundView];
      double v36 = +[CKUIBehavior sharedBehaviors];
      id v37 = [v36 theme];
      v38 = [v37 transcriptBackgroundColor];
      [v35 setBackgroundColor:v38];

      v39 = [*(id *)(a1 + 32) backgroundView];
      [v39 setAlpha:1.0];

      v40 = [*(id *)(a1 + 32) borderLayer];
      id v41 = [MEMORY[0x1E4F428B8] clearColor];
      objc_msgSend(v40, "setFillColor:", objc_msgSend(v41, "CGColor"));

      v42 = [*(id *)(a1 + 32) borderLayer];
      v43 = +[CKUIBehavior sharedBehaviors];
      v44 = [v43 theme];
      id v45 = [v44 quickActionButtonStrokeColor];
      objc_msgSend(v42, "setStrokeColor:", objc_msgSend(v45, "CGColor"));

      double v46 = [*(id *)(a1 + 32) borderLayer];
      [v46 setLineWidth:1.0];

      break;
    case 2:
      double v47 = [*(id *)(a1 + 32) imageView];
      v48 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      [v47 setTintColor:v48];

      id v49 = [*(id *)(a1 + 32) imageView];
      double v50 = [v49 layer];
      v51 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
      v72 = v51;
      id v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
      [v50 setFilters:v52];

      v53 = [*(id *)(a1 + 32) imageView];
      [v53 setAlpha:1.0];

      id v54 = [*(id *)(a1 + 32) backgroundView];
      v55 = +[CKUIBehavior sharedBehaviors];
      v56 = [v55 theme];
      v57 = [v56 quickActionButtonBurstColor];
      [v54 setBackgroundColor:v57];

      v58 = [*(id *)(a1 + 32) backgroundView];
      int64_t v59 = [v58 layer];
      id v60 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      objc_msgSend(v59, "setBorderColor:", objc_msgSend(v60, "CGColor"));

      dispatch_time_t v61 = [*(id *)(a1 + 32) backgroundView];
      v62 = [v61 layer];
      [v62 setBorderWidth:1.0];

      v63 = [*(id *)(a1 + 32) backgroundView];
      [v63 setAlpha:1.0];

      v64 = [*(id *)(a1 + 32) borderLayer];
      id v65 = [MEMORY[0x1E4F428B8] clearColor];
      objc_msgSend(v64, "setFillColor:", objc_msgSend(v65, "CGColor"));

      double v21 = [*(id *)(a1 + 32) borderLayer];
      id v22 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      objc_msgSend(v21, "setStrokeColor:", objc_msgSend(v22, "CGColor"));
LABEL_5:

      uint64_t v66 = [*(id *)(a1 + 32) borderLayer];
      [v66 setLineWidth:1.0];

      break;
    case 3:
      v67 = *(void **)(a1 + 32);
      [v67 setAlpha:0.0];
      break;
    default:
      return;
  }
}

void __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentAnimationIdentifier:0];
  v2 = [*(id *)(a1 + 32) deferredAnimationIdentifiers];
  uint64_t v3 = [v2 count];

  double v4 = *(void **)(a1 + 32);
  if (v3)
  {
    double v5 = [v4 deferredAnimationIdentifiers];
    id v11 = [v5 firstObject];

    BOOL v6 = [*(id *)(a1 + 32) deferredAnimationIdentifiers];
    [v6 removeFirstObject];

    BOOL v7 = [*(id *)(a1 + 32) deferredConfigurationStates];
    double v8 = [v7 objectForKey:v11];
    uint64_t v9 = [v8 unsignedIntegerValue];

    id v10 = [*(id *)(a1 + 32) deferredConfigurationStates];
    [v10 removeObjectForKey:v11];

    [*(id *)(a1 + 32) configureForState:v9 animated:1 identifier:v11 wasDeferred:1];
  }
  else
  {
    [v4 setAnimating:0];
  }
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageView];
  uint64_t v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v2 setTintColor:v3];

  double v4 = [*(id *)(a1 + 32) backgroundView];
  [v4 setAlpha:0.0];

  double v5 = *(void **)(a1 + 40);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v5 setTransform:v8];
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);

  return [v2 removeFromSuperview];
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return [v1 setTransform:&v3];
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageView];
  CGAffineTransform v3 = [*(id *)(a1 + 32) buttonImageForState:*(void *)(a1 + 56)];
  [v2 setImage:v3];

  double v4 = *(void **)(a1 + 32);
  [v4 contentEdgeInsetsForState:*(void *)(a1 + 56)];
  objc_msgSend(v4, "setContentEdgeInsets:");
  [*(id *)(a1 + 32) updateImageViewFrameForContentEdgeInsets];
  double v5 = 0.0;
  if (*(void *)(a1 + 56) == 3)
  {
    [*(id *)(a1 + 32) delayForFinalizingAnimation];
    double v5 = v6;
  }
  BOOL v7 = (void *)MEMORY[0x1E4F42FF0];
  double v8 = *(double *)(a1 + 64);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_9;
  v11[3] = &unk_1E5620F48;
  id v12 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_10;
  v9[3] = &unk_1E5622358;
  id v10 = *(id *)(a1 + 48);
  [v7 animateWithDuration:0 delay:v11 options:v9 animations:v8 completion:v5];
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKQuickActionButton *)self isAnimating] != a3)
  {
    self->_animating = v3;
    double v5 = [(CKQuickActionButton *)self animationDelegate];
    id v6 = v5;
    if (v3) {
      [v5 quickActionButtonAnimationDidBegin:self];
    }
    else {
      [v5 quickActionButtonAnimationDidEnd:self];
    }
  }
}

- (void)setState:(unint64_t)a3
{
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CKQuickActionButton *)self state] != a3)
  {
    self->_state = a3;
    id v7 = [NSString stringGUID];
    [(CKQuickActionButton *)self configureForState:a3 animated:v4 identifier:v7 wasDeferred:0];
  }
}

- (void)_buttonTouchCanceled
{
}

- (void)_buttonTouchDown
{
}

- (void)_buttonTouchUpInside
{
  id v3 = [(CKQuickActionButton *)self delegate];
  [v3 quickActionButtonWasTapped:self];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(CKQuickActionButton *)self button];
  [v8 frame];
  v15.double x = x;
  v15.double y = y;
  BOOL v9 = CGRectContainsPoint(v16, v15);

  if (v9)
  {
    uint64_t v10 = [(CKQuickActionButton *)self button];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CKQuickActionButton;
    uint64_t v10 = -[CKQuickActionButton hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  }
  id v11 = (void *)v10;

  return v11;
}

- (CKQuickActionButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKQuickActionButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKQuickActionButtonAnimationDelegate)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);

  return (CKQuickActionButtonAnimationDelegate *)WeakRetained;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (UIButton)button
{
  return self->_button;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (CAShapeLayer)borderLayer
{
  return self->_borderLayer;
}

- (NSString)currentAnimationIdentifier
{
  return self->_currentAnimationIdentifier;
}

- (void)setCurrentAnimationIdentifier:(id)a3
{
}

- (NSMutableArray)deferredAnimationIdentifiers
{
  return self->_deferredAnimationIdentifiers;
}

- (void)setDeferredAnimationIdentifiers:(id)a3
{
}

- (NSMutableDictionary)deferredConfigurationStates
{
  return self->_deferredConfigurationStates;
}

- (void)setDeferredConfigurationStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredConfigurationStates, 0);
  objc_storeStrong((id *)&self->_deferredAnimationIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentAnimationIdentifier, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_animationDelegate);

  objc_destroyWeak((id *)&self->_delegate);
}

@end