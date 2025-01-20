@interface CRKComposedView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CRKComposedView)initWithFrame:(CGRect)a3;
- (NSArray)cardSectionSubviews;
- (UIEdgeInsets)cardSectionContentMargins;
- (void)addCardSectionSubview:(id)a3 withKeyline:(int64_t)a4;
- (void)cardSectionSubviewWantsToBeRemovedFromHierarchy:(id)a3;
- (void)setCardSectionSubviews:(id)a3;
@end

@implementation CRKComposedView

- (CRKComposedView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKComposedView;
  v3 = -[CRKComposedView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableCardSectionSubviews = v3->_mutableCardSectionSubviews;
    v3->_mutableCardSectionSubviews = v4;
  }
  return v3;
}

- (UIEdgeInsets)cardSectionContentMargins
{
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)addCardSectionSubview:(id)a3 withKeyline:(int64_t)a4
{
  if (a3)
  {
    mutableCardSectionSubviews = self->_mutableCardSectionSubviews;
    id v6 = a3;
    [(NSMutableArray *)mutableCardSectionSubviews addObject:v6];
    [(CRKComposedView *)self addSubview:v6];
    [v6 setComposedSuperview:self];

    [(CRKComposedView *)self setNeedsLayout];
  }
}

- (void)cardSectionSubviewWantsToBeRemovedFromHierarchy:(id)a3
{
  mutableCardSectionSubviews = self->_mutableCardSectionSubviews;
  id v4 = a3;
  [(NSMutableArray *)mutableCardSectionSubviews removeObject:v4];
  [v4 removeFromSuperview];
  [v4 setComposedSuperview:0];
}

- (NSArray)cardSectionSubviews
{
  double v2 = (void *)[(NSMutableArray *)self->_mutableCardSectionSubviews copy];

  return (NSArray *)v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setCardSectionSubviews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionSubviews, 0);

  objc_storeStrong((id *)&self->_mutableCardSectionSubviews, 0);
}

@end