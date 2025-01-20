@interface CKActionMenuView
+ (void)collapseAnimation:(id)a3 completion:(id)a4;
- (BOOL)isCollapsed;
- (BOOL)isTouchInside;
- (CGPoint)presentationTargetPosition;
- (CGRect)presentationTargetBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKActionMenuController)actionMenuController;
- (CKActionMenuView)initWithActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 blurEffectStyle:(int64_t)a5;
- (NSArray)actionMenuItems;
- (NSArray)presentationActionMenuItems;
- (UIBlurEffect)blurEffect;
- (UIVisualEffectView)blurView;
- (id)actionMenuItemAtPoint:(CGPoint)a3 velocity:(CGPoint)a4;
- (id)description;
- (unint64_t)defaultActionIndex;
- (unint64_t)presentationDefaultActionIndex;
- (void)actionMenuGestureRecognized:(id)a3;
- (void)configureForPresentationAtPoint:(CGPoint)a3 inRect:(CGRect)a4;
- (void)dismissActionMenuViewAnimated:(BOOL)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)presentActionMenuViewFromPoint:(CGPoint)a3 inRect:(CGRect)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setActionMenuController:(id)a3;
- (void)setActionMenuItems:(id)a3;
- (void)setActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)setBlurEffect:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDefaultActionIndex:(unint64_t)a3;
- (void)setPresentationActionMenuItems:(id)a3;
- (void)setPresentationDefaultActionIndex:(unint64_t)a3;
- (void)setPresentationTargetBounds:(CGRect)a3;
- (void)setPresentationTargetPosition:(CGPoint)a3;
- (void)setTouchInside:(BOOL)a3;
@end

@implementation CKActionMenuView

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKActionMenuView;
  v4 = [(CKActionMenuView *)&v8 description];
  v5 = [(CKActionMenuView *)self actionMenuItems];
  v6 = [v3 stringWithFormat:@"%@ actionMenuItems: %@ defaultActionIndex: %d", v4, v5, -[CKActionMenuView defaultActionIndex](self, "defaultActionIndex")];

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(CKActionMenuView *)self actionMenuItems];
  double v4 = (double)(unint64_t)([v3 count] - 1) * 90.0 + 60.0;

  double v5 = 60.0;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)CKActionMenuView;
  [(CKActionMenuView *)&v44 layoutSubviews];
  [(CKActionMenuView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKActionMenuView *)self blurView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(CKActionMenuView *)self presentationActionMenuItems];
  if ([(CKActionMenuView *)self isCollapsed])
  {
    v48.origin.x = v4;
    v48.origin.y = v6;
    v48.size.width = v8;
    v48.size.height = v10;
    double MidX = CGRectGetMidX(v48);
    v49.origin.x = v4;
    v49.origin.y = v6;
    v49.size.width = v8;
    v49.size.height = v10;
    double MidY = CGRectGetMidY(v49);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v15 = v12;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v21 = [v20 view];
          v22 = [v21 layer];
          objc_msgSend(v22, "setPosition:", MidX, MidY);

          v23 = [v20 label];
          v24 = [v23 layer];
          objc_msgSend(v24, "setPosition:", 70.0, MidY);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v17);
    }
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v25 = v12;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v37;
      double v29 = 30.0;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          v31 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          v32 = objc_msgSend(v31, "view", (void)v36);
          v33 = [v32 layer];
          objc_msgSend(v33, "setPosition:", 30.0, v29);

          v34 = [v31 label];
          v35 = [v34 layer];
          objc_msgSend(v35, "setPosition:", 70.0, v29);

          double v29 = v29 + 90.0;
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v27);
    }
  }
}

- (CKActionMenuView)initWithActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 blurEffectStyle:(int64_t)a5
{
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKActionMenuView;
  double v9 = -[CKActionMenuView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v9)
  {
    double v10 = [MEMORY[0x1E4F427D8] effectWithStyle:a5];
    [(CKActionMenuView *)v9 setBlurEffect:v10];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    [(CKActionMenuView *)v9 setBlurView:v11];
    [(CKActionMenuView *)v9 addSubview:v11];
    v12 = [v11 contentView];
    v13 = [MEMORY[0x1E4F428B8] whiteColor];
    [v12 setBackgroundColor:v13];

    v14 = [v11 contentView];
    id v15 = [v14 layer];
    [v15 setCompositingFilter:*MEMORY[0x1E4F3A298]];

    uint64_t v16 = [v11 layer];
    [v16 setMasksToBounds:1];

    uint64_t v17 = [v11 layer];
    [v17 setCornerRadius:30.0];

    -[CKActionMenuView setPresentationTargetBounds:](v9, "setPresentationTargetBounds:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [(CKActionMenuView *)v9 setPresentationActionMenuItems:v8];
    [(CKActionMenuView *)v9 setPresentationDefaultActionIndex:a4];
    [(CKActionMenuView *)v9 setActionMenuItems:v8 defaultActionIndex:a4 animated:0];
    [(CKActionMenuView *)v9 setCollapsed:1 animated:0 completion:0];
    uint64_t v18 = +[CKActionMenuGestureRecognizer actionMenuGestureRecognizer];
    [v18 setMinimumPressDuration:0.0];
    [(CKActionMenuView *)v9 addGestureRecognizer:v18];
  }
  return v9;
}

- (void)setActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count] <= a4)
  {
    [NSString stringWithFormat:@"*** %s: defaultActionIndex %d must be a valid index in actionMenuItems %@", "-[CKActionMenuView setActionMenuItems:defaultActionIndex:animated:]", a4, v8];
    id v43 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v43);
  }
  double v9 = [(CKActionMenuView *)self actionMenuItems];
  [(CKActionMenuView *)self setActionMenuItems:v8];
  [(CKActionMenuView *)self setDefaultActionIndex:a4];
  BOOL v44 = v5;
  if ([(CKActionMenuView *)self isCollapsed])
  {
    memset(&v57, 0, sizeof(v57));
    CGAffineTransformMakeScale(&v57, 0.5, 0.5);
    double v10 = 0.0;
  }
  else
  {
    [(CKActionMenuView *)self presentationTargetBounds];
    if (!CGRectIsNull(v60))
    {
      v11 = [(CKActionMenuView *)self layer];
      [v11 position];
      double v13 = v12;
      double v15 = v14;

      [(CKActionMenuView *)self presentationTargetPosition];
      double v17 = v16;
      double v19 = v18;
      [(CKActionMenuView *)self presentationTargetBounds];
      -[CKActionMenuView configureForPresentationAtPoint:inRect:](self, "configureForPresentationAtPoint:inRect:", v17, v19, v20, v21, v22, v23);
      v24 = [(CKActionMenuView *)self layer];
      objc_msgSend(v24, "setPosition:", v13, v15);
    }
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v57.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v57.c = v25;
    *(_OWORD *)&v57.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v10 = 1.0;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v26 = v8;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v54 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if ((objc_msgSend(v9, "ck_containsObjectIdenticalTo:", v31) & 1) == 0)
        {
          v32 = [v31 view];
          [v32 setAlpha:0.0];
          CGAffineTransform v52 = v57;
          [v32 setTransform:&v52];
          v33 = [(CKActionMenuView *)self blurView];
          [(CKActionMenuView *)self insertSubview:v32 aboveSubview:v33];

          v34 = [v31 label];
          [v34 setAlpha:0.0];
          CGAffineTransform v52 = v57;
          [v34 setTransform:&v52];
          v35 = [v34 layer];
          objc_msgSend(v35, "setAnchorPoint:", 0.0, 0.5);

          long long v36 = [(CKActionMenuView *)self blurView];
          [(CKActionMenuView *)self insertSubview:v34 aboveSubview:v36];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v28);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CKActionMenuView_setActionMenuItems_defaultActionIndex_animated___block_invoke;
  aBlock[3] = &unk_1E5620E38;
  id v37 = v9;
  id v49 = v37;
  id v38 = v26;
  id v50 = v38;
  double v51 = v10;
  long long v39 = (void (**)(void))_Block_copy(aBlock);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __67__CKActionMenuView_setActionMenuItems_defaultActionIndex_animated___block_invoke_2;
  v45[3] = &unk_1E5621EA8;
  id v40 = v37;
  id v46 = v40;
  id v41 = v38;
  id v47 = v41;
  long long v42 = (void (**)(void *, uint64_t))_Block_copy(v45);
  if (v44)
  {
    +[CKActionMenuItem animate:v39 completion:v42];
  }
  else
  {
    v39[2](v39);
    v42[2](v42, 1);
  }
}

void __67__CKActionMenuView_setActionMenuItems_defaultActionIndex_animated___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "ck_containsObjectIdenticalTo:", v7) & 1) == 0)
        {
          id v8 = [v7 view];
          [v8 setAlpha:0.0];

          double v9 = [v7 label];
          [v9 setAlpha:0.0];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v4);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        if ((objc_msgSend(*(id *)(a1 + 32), "ck_containsObjectIdenticalTo:", v15, (void)v18) & 1) == 0)
        {
          double v16 = [v15 view];
          [v16 setAlpha:*(double *)(a1 + 48)];

          double v17 = [v15 label];
          [v17 setAlpha:*(double *)(a1 + 48)];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }
}

void __67__CKActionMenuView_setActionMenuItems_defaultActionIndex_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "ck_containsObjectIdenticalTo:", v7, (void)v10) & 1) == 0)
        {
          id v8 = [v7 view];
          [v8 removeFromSuperview];

          double v9 = [v7 label];
          [v9 removeFromSuperview];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)presentActionMenuViewFromPoint:(CGPoint)a3 inRect:(CGRect)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = a3.y;
  double v12 = a3.x;
  id v14 = a6;
  -[CKActionMenuView setPresentationTargetPosition:](self, "setPresentationTargetPosition:", v12, v11);
  -[CKActionMenuView setPresentationTargetBounds:](self, "setPresentationTargetBounds:", x, y, width, height);
  -[CKActionMenuView configureForPresentationAtPoint:inRect:](self, "configureForPresentationAtPoint:inRect:", v12, v11, x, y, width, height);
  uint64_t v15 = [(CKActionMenuView *)self actionMenuItems];
  objc_msgSend(v15, "objectAtIndex:", -[CKActionMenuView defaultActionIndex](self, "defaultActionIndex"));
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  [v16 updateForState:1 touchInside:1];
  [(CKActionMenuView *)self setTouchInside:1];
  [(CKActionMenuView *)self setCollapsed:0 animated:v6 completion:v14];
}

- (void)dismissActionMenuViewAnimated:(BOOL)a3 completion:(id)a4
{
  [(CKActionMenuView *)self setCollapsed:1 animated:a3 completion:a4];
  -[CKActionMenuView setPresentationTargetPosition:](self, "setPresentationTargetPosition:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v5 = *MEMORY[0x1E4F1DB20];
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);

  -[CKActionMenuView setPresentationTargetBounds:](self, "setPresentationTargetBounds:", v5, v6, v7, v8);
}

- (void)actionMenuGestureRecognized:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  [v4 locationInView:self];
  double v7 = v6;
  double v9 = v8;
  [v4 velocityInView:self];
  double v12 = -[CKActionMenuView actionMenuItemAtPoint:velocity:](self, "actionMenuItemAtPoint:velocity:", v7, v9, v10, v11);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = [(CKActionMenuView *)self actionMenuItems];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v17) updateForState:v5 touchInside:*(void *)(*((void *)&v18 + 1) + 8 * v17) == (void)v12];
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  [(CKActionMenuView *)self setTouchInside:v12 != 0];
}

+ (void)collapseAnimation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  [MEMORY[0x1E4F42FF0] _animateUsingSpringWithDuration:6 delay:a3 options:0 mass:1.545 stiffness:0.0 damping:1.0 initialVelocity:400.0 animations:25.0 completion:0.0];
  dispatch_time_t v6 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CKActionMenuView_collapseAnimation_completion___block_invoke;
  block[3] = &unk_1E5620F48;
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __49__CKActionMenuView_collapseAnimation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCollapsed:(BOOL)a3
{
}

- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (self->_collapsed != v6)
  {
    self->_collapsed = v6;
    id v9 = [(CKActionMenuView *)self actionMenuController];
    uint64_t v10 = [v9 delegate];
    double v11 = (void *)v10;
    if (v6)
    {
      uint64_t v28 = (void *)v10;
      BOOL v29 = v5;
      memset(&v50, 0, sizeof(v50));
      CGAffineTransformMakeScale(&v50, 0.5, 0.5);
      long long v49 = 0u;
      long long v48 = 0u;
      long long v47 = 0u;
      long long v46 = 0u;
      double v12 = [(CKActionMenuView *)self actionMenuItems];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v47 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [*(id *)(*((void *)&v46 + 1) + 8 * i) label];
            [v17 setAlpha:0.0];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v14);
      }

      double v18 = 0.0;
      uint64_t v19 = 0x404E000000000000;
      uint64_t v20 = 0x404E000000000000;
      BOOL v5 = v29;
      double v11 = v28;
    }
    else
    {
      -[CKActionMenuView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v50.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v50.c = v21;
      *(_OWORD *)&v50.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v18 = 1.0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke;
    aBlock[3] = &unk_1E5629578;
    void aBlock[4] = self;
    uint64_t v40 = v19;
    uint64_t v41 = v20;
    BOOL v44 = v6;
    CGAffineTransform v42 = v50;
    double v43 = v18;
    id v22 = v11;
    id v38 = v22;
    id v23 = v9;
    id v39 = v23;
    BOOL v45 = v5;
    long long v24 = (void (**)(void))_Block_copy(aBlock);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke_2;
    v30[3] = &unk_1E56295A0;
    id v34 = v8;
    BOOL v36 = v6;
    id v25 = v22;
    id v31 = v25;
    id v26 = v23;
    id v32 = v26;
    v33 = self;
    double v35 = v18;
    uint64_t v27 = (void (**)(void *, uint64_t))_Block_copy(v30);
    if (v5)
    {
      +[CKActionMenuView collapseAnimation:v24 completion:v27];
    }
    else
    {
      v24[2](v24);
      v27[2](v27, 1);
    }
  }
}

uint64_t __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  id v2 = [*(id *)(a1 + 32) blurView];
  uint64_t v3 = [v2 contentView];
  if (*(unsigned char *)(a1 + 128))
  {
    id v4 = [MEMORY[0x1E4F428B8] whiteColor];
    [v3 setBackgroundColor:v4];
  }
  else
  {
    id v4 = +[CKUIBehavior sharedBehaviors];
    BOOL v5 = [v4 theme];
    BOOL v6 = [v5 entryFieldAudioRecordingBalloonColor];
    [v3 setBackgroundColor:v6];
  }
  id v7 = [*(id *)(a1 + 32) blurView];
  id v8 = v7;
  if (*(unsigned char *)(a1 + 128))
  {
    [v7 setEffect:0];
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) blurEffect];
    [v8 setEffect:v9];
  }
  uint64_t v10 = *(void **)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 88);
  long long v28 = *(_OWORD *)(a1 + 72);
  long long v29 = v11;
  long long v30 = *(_OWORD *)(a1 + 104);
  [v10 setTransform:&v28];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v12 = objc_msgSend(*(id *)(a1 + 32), "actionMenuItems", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = (long long *)(a1 + 72);
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v12);
        }
        double v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v19 = [v18 view];
        [v19 setAlpha:*(double *)(a1 + 120)];
        long long v20 = *(_OWORD *)(a1 + 88);
        long long v28 = *v15;
        long long v29 = v20;
        long long v30 = *(_OWORD *)(a1 + 104);
        [v19 setTransform:&v28];
        long long v21 = [v18 label];
        long long v22 = *(_OWORD *)(a1 + 88);
        long long v28 = *v15;
        long long v29 = v22;
        long long v30 = *(_OWORD *)(a1 + 104);
        [v21 setTransform:&v28];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v14);
  }

  [*(id *)(a1 + 32) layoutIfNeeded];
  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return [*(id *)(a1 + 40) actionMenuControllerWillDismissActionMenu:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 129)];
    }
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return [*(id *)(a1 + 40) actionMenuControllerWillPresentActionMenu:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 129)];
    }
  }
  return result;
}

uint64_t __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      return [v4 actionMenuControllerDidDismissActionMenu:v5];
    }
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke_3;
    v6[3] = &unk_1E5622950;
    v6[4] = *(void *)(a1 + 48);
    v6[5] = *(void *)(a1 + 64);
    [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:0.3];
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return [*(id *)(a1 + 32) actionMenuControllerDidPresentActionMenu:*(void *)(a1 + 40)];
    }
  }
  return result;
}

void __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "actionMenuItems", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) label];
        [v7 setAlpha:*(double *)(a1 + 40)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)actionMenuItemAtPoint:(CGPoint)a3 velocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (-[UIView pointMostlyInside:threshold:velocity:](self, "pointMostlyInside:threshold:velocity:", a3.x, a3.y, 10.0, *MEMORY[0x1E4F1DAD8], v10)|| (x == v9 ? (BOOL v24 = y == v10) : (BOOL v24 = 0), !v24&& -[CKActionMenuView isTouchInside](self, "isTouchInside")&& -[UIView pointMostlyInside:threshold:velocity:](self, "pointMostlyInside:threshold:velocity:", v7, v6, 10.0, x, y)))
  {
    long long v11 = [(CKActionMenuView *)self presentationActionMenuItems];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v12) {
      goto LABEL_13;
    }
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        double v18 = [v17 view];
        if ([v17 isEnabled])
        {
          objc_msgSend(v18, "convertPoint:fromView:", self, v7, v6);
          if (objc_msgSend(v18, "pointMostlyInside:threshold:velocity:"))
          {
            id v19 = v17;

            uint64_t v14 = v19;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
    if (!v14)
    {
LABEL_13:
      double v20 = v7 + -30.0;
      double v21 = atan2(v6 + -30.0, v20);
      if (v21 < -2.35619449
        || v21 > -0.785398163
        || ([v11 firstObject], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        [(CKActionMenuView *)self bounds];
        CGFloat MaxY = CGRectGetMaxY(v33);
        double v23 = atan2(v6 - (MaxY + -30.0), v20);
        uint64_t v14 = 0;
        if (v23 >= 0.785398163 && v23 <= 2.35619449)
        {
          uint64_t v14 = [v11 lastObject];
        }
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)configureForPresentationAtPoint:(CGPoint)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.y;
  double v9 = a3.x;
  long long v11 = [(CKActionMenuView *)self actionMenuItems];
  unint64_t v12 = [(CKActionMenuView *)self defaultActionIndex];
  uint64_t v13 = [v11 objectAtIndex:v12];
  -[CKActionMenuView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  CGFloat v15 = v14;
  double v17 = v16;
  double v61 = v9;
  double v18 = v9 + v14 * -0.5;
  double v57 = (double)v12;
  double v62 = v8;
  double v19 = v8 + -((double)v12 * 90.0 + 30.0) / v16 * v16;
  v67.origin.CGFloat x = x;
  CGFloat rect = y;
  v67.origin.CGFloat y = y;
  v67.size.CGFloat width = width;
  v67.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v67);
  v68.origin.CGFloat x = v18;
  v68.origin.CGFloat y = v19;
  v68.size.CGFloat width = v15;
  v68.size.CGFloat height = v17;
  if (MinX <= CGRectGetMinX(v68))
  {
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = rect;
    v71.size.CGFloat width = width;
    v71.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v71);
    v72.origin.CGFloat x = v18;
    v72.origin.CGFloat y = v19;
    v72.size.CGFloat width = v15;
    v72.size.CGFloat height = v17;
    CGFloat v24 = CGRectGetMaxX(v72);
    double v25 = 0.0;
    if (MaxX >= v24) {
      goto LABEL_6;
    }
    v73.origin.CGFloat x = x;
    v73.origin.CGFloat y = rect;
    v73.size.CGFloat width = width;
    v73.size.CGFloat height = height;
    double v21 = CGRectGetMaxX(v73);
    v74.origin.CGFloat x = v18;
    v74.origin.CGFloat y = v19;
    v74.size.CGFloat width = v15;
    v74.size.CGFloat height = v17;
    double v22 = CGRectGetMaxX(v74);
  }
  else
  {
    v69.origin.CGFloat x = x;
    v69.origin.CGFloat y = rect;
    v69.size.CGFloat width = width;
    v69.size.CGFloat height = height;
    double v21 = CGRectGetMinX(v69);
    v70.origin.CGFloat x = v18;
    v70.origin.CGFloat y = v19;
    v70.size.CGFloat width = v15;
    v70.size.CGFloat height = v17;
    double v22 = CGRectGetMinX(v70);
  }
  double v25 = v21 - v22;
LABEL_6:
  double v59 = v25;
  v75.origin.CGFloat x = x;
  v75.origin.CGFloat y = rect;
  v75.size.CGFloat width = width;
  v75.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v75);
  v76.origin.CGFloat x = v18;
  v76.origin.CGFloat y = v19;
  v76.size.CGFloat width = v15;
  v76.size.CGFloat height = v17;
  BOOL v27 = MinY <= CGRectGetMinY(v76);
  CGFloat v64 = height;
  CGFloat v28 = x;
  if (v27)
  {
    CGFloat v34 = rect;
    CGFloat v35 = width;
    CGFloat v36 = height;
    double MaxY = CGRectGetMaxY(*(CGRect *)&v28);
    v78.origin.CGFloat x = v18;
    v78.origin.CGFloat y = v19;
    v78.size.CGFloat width = v15;
    v78.size.CGFloat height = v17;
    double v38 = 0.0;
    if (MaxY >= CGRectGetMaxY(v78)) {
      goto LABEL_11;
    }
    v79.origin.CGFloat x = x;
    v79.size.CGFloat height = v64;
    v79.origin.CGFloat y = rect;
    v79.size.CGFloat width = width;
    double v32 = CGRectGetMaxY(v79);
    v80.origin.CGFloat x = v18;
    v80.origin.CGFloat y = v19;
    v80.size.CGFloat width = v15;
    v80.size.CGFloat height = v17;
    double v33 = CGRectGetMaxY(v80);
  }
  else
  {
    CGFloat v29 = rect;
    CGFloat v30 = width;
    CGFloat v31 = height;
    double v32 = CGRectGetMinY(*(CGRect *)&v28);
    v77.origin.CGFloat x = v18;
    v77.origin.CGFloat y = v19;
    v77.size.CGFloat width = v15;
    v77.size.CGFloat height = v17;
    double v33 = CGRectGetMinY(v77);
  }
  double v38 = v32 - v33;
LABEL_11:
  id v39 = v11;
  double v40 = fabs(v38);
  CGFloat v60 = v18;
  v63 = v39;
  if (v40 <= 30.0)
  {
    CGFloat v42 = v15;
    double v44 = v57 * 90.0 + 30.0;
    BOOL v45 = v39;
    CGFloat v46 = v64;
  }
  else
  {
    uint64_t v41 = (uint64_t)(ceil((v40 + -30.0) / 90.0) * (double)((v38 < 0.0) - (v38 > 0.0)));
    CGFloat v42 = v15;
    if (v41 < 1)
    {
      if (v41) {
        uint64_t v43 = 0;
      }
      else {
        uint64_t v43 = v12;
      }
    }
    else
    {
      uint64_t v43 = [v39 count] - 1;
      id v39 = v63;
    }
    CGFloat v46 = v64;
    BOOL v45 = objc_msgSend(v39, "mutableCopy", *(void *)&v57);
    [v45 removeObjectAtIndex:v12];
    [v45 insertObject:v13 atIndex:v43];

    double v44 = (double)(unint64_t)v43 * 90.0 + 30.0;
    unint64_t v12 = v43;
  }
  double v58 = v44 / v17;
  double v47 = v62 - v44 / v17 * v17;
  v81.origin.CGFloat x = x;
  v81.origin.CGFloat y = rect;
  v81.size.CGFloat width = width;
  v81.size.CGFloat height = v46;
  double v48 = CGRectGetMinY(v81);
  v82.origin.CGFloat x = v60;
  v82.origin.CGFloat y = v47;
  v82.size.CGFloat width = v42;
  v82.size.CGFloat height = v17;
  if (v48 <= CGRectGetMinY(v82))
  {
    v85.origin.CGFloat x = x;
    v85.origin.CGFloat y = rect;
    v85.size.CGFloat width = width;
    v85.size.CGFloat height = v64;
    double v51 = CGRectGetMaxY(v85);
    v86.origin.CGFloat x = v60;
    v86.origin.CGFloat y = v47;
    v86.size.CGFloat width = v42;
    v86.size.CGFloat height = v17;
    CGFloat v52 = CGRectGetMaxY(v86);
    double v53 = 0.0;
    if (v51 >= v52) {
      goto LABEL_24;
    }
    v87.origin.CGFloat x = x;
    v87.origin.CGFloat y = rect;
    v87.size.CGFloat width = width;
    v87.size.CGFloat height = v64;
    double v49 = CGRectGetMaxY(v87);
    v88.origin.CGFloat x = v60;
    v88.origin.CGFloat y = v47;
    v88.size.CGFloat width = v42;
    v88.size.CGFloat height = v17;
    double v50 = CGRectGetMaxY(v88);
  }
  else
  {
    v83.origin.CGFloat x = x;
    v83.origin.CGFloat y = rect;
    v83.size.CGFloat width = width;
    v83.size.CGFloat height = v64;
    double v49 = CGRectGetMinY(v83);
    v84.origin.CGFloat x = v60;
    v84.origin.CGFloat y = v47;
    v84.size.CGFloat width = v42;
    v84.size.CGFloat height = v17;
    double v50 = CGRectGetMinY(v84);
  }
  double v53 = v49 - v50;
LABEL_24:
  double v54 = v62 + v53;
  long long v55 = [(CKActionMenuView *)self layer];
  objc_msgSend(v55, "setPosition:", v61 + v59, v54);

  long long v56 = [(CKActionMenuView *)self layer];
  objc_msgSend(v56, "setAnchorPoint:", 0.5, v58);

  [(CKActionMenuView *)self setPresentationActionMenuItems:v45];
  [(CKActionMenuView *)self setPresentationDefaultActionIndex:v12];
}

- (NSArray)actionMenuItems
{
  return self->_actionMenuItems;
}

- (void)setActionMenuItems:(id)a3
{
}

- (unint64_t)defaultActionIndex
{
  return self->_defaultActionIndex;
}

- (void)setDefaultActionIndex:(unint64_t)a3
{
  self->_defaultActionIndeCGFloat x = a3;
}

- (CKActionMenuController)actionMenuController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionMenuController);

  return (CKActionMenuController *)WeakRetained;
}

- (void)setActionMenuController:(id)a3
{
}

- (NSArray)presentationActionMenuItems
{
  return self->_presentationActionMenuItems;
}

- (void)setPresentationActionMenuItems:(id)a3
{
}

- (unint64_t)presentationDefaultActionIndex
{
  return self->_presentationDefaultActionIndex;
}

- (void)setPresentationDefaultActionIndex:(unint64_t)a3
{
  self->_presentationDefaultActionIndeCGFloat x = a3;
}

- (CGRect)presentationTargetBounds
{
  double x = self->_presentationTargetBounds.origin.x;
  double y = self->_presentationTargetBounds.origin.y;
  double width = self->_presentationTargetBounds.size.width;
  double height = self->_presentationTargetBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentationTargetBounds:(CGRect)a3
{
  self->_presentationTargetBounds = a3;
}

- (CGPoint)presentationTargetPosition
{
  double x = self->_presentationTargetPosition.x;
  double y = self->_presentationTargetPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPresentationTargetPosition:(CGPoint)a3
{
  self->_presentationTargetPosition = a3;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void)setBlurEffect:(id)a3
{
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)isTouchInside
{
  return self->_touchInside;
}

- (void)setTouchInside:(BOOL)a3
{
  self->_touchInside = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_presentationActionMenuItems, 0);
  objc_destroyWeak((id *)&self->_actionMenuController);

  objc_storeStrong((id *)&self->_actionMenuItems, 0);
}

@end