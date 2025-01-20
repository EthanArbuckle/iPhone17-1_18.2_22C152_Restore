@interface NUICollectionViewContainerCell
+ (Class)containerViewClass;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NUICollectionViewContainerCell)initWithFrame:(CGRect)a3;
- (NUIContainerView)containerView;
@end

@implementation NUICollectionViewContainerCell

+ (Class)containerViewClass
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  [v3 raise:v4, @"-[%@ %@] not implemented.", v6, v7 format];

  return 0;
}

- (NUICollectionViewContainerCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NUICollectionViewContainerCell;
  v3 = -[NUICollectionViewContainerCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(NUICollectionViewContainerCell *)v3 contentView];
    containerView = v4->_containerView;
    v4->_containerView = (NUIContainerView *)v5;

    [(UIView *)v4->_containerView setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];
    [(NUIContainerView *)v4->_containerView setLayoutMarginsRelativeArrangement:1];
    v7 = v4->_containerView;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__NUICollectionViewContainerCell_initWithFrame___block_invoke;
    v9[3] = &unk_1E5EFF280;
    v10 = v4;
    [(NUIContainerView *)v7 performBatchUpdates:v9];
  }
  return v4;
}

uint64_t __48__NUICollectionViewContainerCell_initWithFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) containerViewDidLoad];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  if (a4 > 50.0) {
    double width = a3.width;
  }
  else {
    double width = 0.0;
  }
  if (a5 > 50.0) {
    double height = a3.height;
  }
  else {
    double height = 0.0;
  }
  v9 = [(NUICollectionViewContainerCell *)self containerView];
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = [(NUICollectionViewContainerCell *)self containerView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (NUIContainerView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
}

@end