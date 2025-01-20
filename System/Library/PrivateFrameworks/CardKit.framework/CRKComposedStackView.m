@interface CRKComposedStackView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CRKComposedStackView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)templatedContentMargins;
- (unint64_t)direction;
- (void)_updateLayout;
- (void)addCardSectionSubview:(id)a3 withKeyline:(int64_t)a4;
- (void)cardSectionSubviewWantsToBeRemovedFromHierarchy:(id)a3;
- (void)layoutSubviews;
- (void)setCardSectionSubviews:(id)a3;
- (void)setDirection:(unint64_t)a3;
- (void)triggerLayoutAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation CRKComposedStackView

- (CRKComposedStackView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKComposedStackView;
  v3 = -[CRKComposedView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    keylines = v3->_keylines;
    v3->_keylines = v4;
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CRKComposedStackView;
  [(CRKComposedStackView *)&v3 layoutSubviews];
  [(CRKComposedStackView *)self _updateLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(CRKComposedView *)self cardSectionSubviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "sizeThatFits:", width, height);
        double v9 = v9 + v11;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  if (height >= v9) {
    double v12 = v9;
  }
  else {
    double v12 = height;
  }
  double v13 = width;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)_updateLayout
{
  [(CRKComposedStackView *)self bounds];
  CGFloat Width = CGRectGetWidth(v18);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  uint64_t v9 = 0;
  v10 = (double *)&v9;
  uint64_t v11 = 0x4010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  double v12 = "";
  CGFloat v15 = Width;
  uint64_t v16 = 0x3FF0000000000000;
  if ([(NSMutableArray *)self->_keylines count])
  {
    v4 = [(NSMutableArray *)self->_keylines firstObject];
    objc_msgSend(v4, "sizeThatFits:", v10[6], v10[7]);
    uint64_t v6 = v5;

    *((void *)v10 + 7) = v6;
  }
  uint64_t v7 = [(CRKComposedView *)self cardSectionSubviews];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__CRKComposedStackView__updateLayout__block_invoke;
  v8[3] = &unk_26470ECD0;
  v8[4] = self;
  v8[5] = v17;
  *(CGFloat *)&v8[7] = Width;
  v8[6] = &v9;
  [v7 enumerateObjectsUsingBlock:v8];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v17, 8);
}

void __37__CRKComposedStackView__updateLayout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  double v5 = 0.0;
  if ([v8 conformsToProtocol:&unk_26D866B80])
  {
    [*(id *)(a1 + 32) bounds];
    objc_msgSend(v8, "sizeThatFits:", CGRectGetWidth(v10), 1.79769313e308);
    double v5 = v6;
  }
  objc_msgSend(v8, "setFrame:", 0.0, *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(double *)(a1 + 56), v5);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 424) objectAtIndex:a3];
  objc_msgSend(v7, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
  objc_msgSend(v7, "setHidden:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "count") - 1 == a3);
}

- (void)triggerLayoutAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__CRKComposedStackView_triggerLayoutAnimated_completion___block_invoke;
  v11[3] = &unk_26470ECF8;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  uint64_t v8 = MEMORY[0x22A6282E0](v11);
  uint64_t v9 = (void *)v8;
  if (v4)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__CRKComposedStackView_triggerLayoutAnimated_completion___block_invoke_2;
    v10[3] = &unk_26470E988;
    v10[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v10 usingSpringWithDamping:v7 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:0.5];
  }
  else
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
}

uint64_t __57__CRKComposedStackView_triggerLayoutAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLayout];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __57__CRKComposedStackView_triggerLayoutAnimated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLayout];
}

- (void)setCardSectionSubviews:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKComposedView *)self cardSectionSubviews];
  if (v5 != v4)
  {
    keylines = self->_keylines;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __47__CRKComposedStackView_setCardSectionSubviews___block_invoke;
    v12[3] = &unk_26470ED20;
    v12[4] = self;
    id v7 = v4;
    id v13 = v7;
    id v14 = v5;
    uint64_t v8 = [(NSMutableArray *)keylines sortedArrayUsingComparator:v12];
    uint64_t v9 = (NSMutableArray *)[v8 mutableCopy];
    CGRect v10 = self->_keylines;
    self->_keylines = v9;

    v11.receiver = self;
    v11.super_class = (Class)CRKComposedStackView;
    [(CRKComposedView *)&v11 setCardSectionSubviews:v7];
  }
}

uint64_t __47__CRKComposedStackView_setCardSectionSubviews___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 424);
  id v6 = a3;
  uint64_t v7 = [v5 indexOfObject:a2];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 424) indexOfObject:v6];

  uint64_t v9 = *(void **)(a1 + 40);
  CGRect v10 = [*(id *)(a1 + 48) objectAtIndex:v7];
  uint64_t v11 = [v9 indexOfObject:v10];

  id v12 = *(void **)(a1 + 40);
  id v13 = [*(id *)(a1 + 48) objectAtIndex:v8];
  uint64_t v14 = [v12 indexOfObject:v13];

  CGFloat v15 = [NSNumber numberWithUnsignedInteger:v11];
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:v14];
  uint64_t v17 = [v15 compare:v16];

  return v17;
}

- (void)addCardSectionSubview:(id)a3 withKeyline:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKComposedStackView;
  [(CRKComposedView *)&v10 addCardSectionSubview:v6 withKeyline:a4];
  if (v6)
  {
    uint64_t v7 = [v6 traitCollection];
    BOOL v8 = [v7 userInterfaceStyle] == 2;

    uint64_t v9 = [[CRKKeyline alloc] initWithType:a4 direction:self->_direction - 3 < 0xFFFFFFFFFFFFFFFELL visualEffectStyle:v8];
    [(NSMutableArray *)self->_keylines addObject:v9];
    [(CRKComposedStackView *)self addSubview:v9];
    [(CRKComposedStackView *)self setNeedsLayout];
  }
}

- (void)cardSectionSubviewWantsToBeRemovedFromHierarchy:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CRKComposedView *)self cardSectionSubviews];
    uint64_t v6 = [v5 indexOfObject:v4];

    uint64_t v7 = [(NSMutableArray *)self->_keylines objectAtIndex:v6];
    [(NSMutableArray *)self->_keylines removeObject:v7];
    [v7 removeFromSuperview];
    [(CRKComposedStackView *)self setNeedsLayout];
  }
  v8.receiver = self;
  v8.super_class = (Class)CRKComposedStackView;
  [(CRKComposedView *)&v8 cardSectionSubviewWantsToBeRemovedFromHierarchy:v4];
}

- (UIEdgeInsets)templatedContentMargins
{
  double v2 = 0.0;
  double v3 = 16.0;
  double v4 = 0.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (void).cxx_destruct
{
}

@end