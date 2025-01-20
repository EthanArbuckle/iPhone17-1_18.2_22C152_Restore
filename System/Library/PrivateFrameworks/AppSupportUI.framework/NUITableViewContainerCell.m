@interface NUITableViewContainerCell
+ (Class)containerViewClass;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NUIContainerView)containerView;
- (NUITableViewContainerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation NUITableViewContainerCell

uint64_t __59__NUITableViewContainerCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) containerViewDidLoad];
}

- (NUIContainerView)containerView
{
  return self->_containerView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(NUITableViewContainerCell *)self contentView];
  [v6 bounds];
  double v8 = v7;

  if (width >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = width;
  }
  containerView = self->_containerView;
  -[NUIContainerView effectiveLayoutSizeFittingSize:](containerView, "effectiveLayoutSizeFittingSize:", v9, height);
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (NUITableViewContainerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)NUITableViewContainerCell;
  v4 = [(NUITableViewContainerCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)[(id)objc_opt_class() containerViewClass]);
    v6 = [(NUITableViewContainerCell *)v4 contentView];
    [v6 bounds];
    uint64_t v7 = objc_msgSend(v5, "initWithFrame:");
    containerView = v4->_containerView;
    v4->_containerView = (NUIContainerView *)v7;

    [(NUIContainerView *)v4->_containerView setPreservesSuperviewLayoutMargins:1];
    [(NUIContainerView *)v4->_containerView setLayoutMarginsRelativeArrangement:1];
    [(NUIContainerView *)v4->_containerView setAutoresizingMask:18];
    double v9 = [(NUITableViewContainerCell *)v4 contentView];
    [v9 addSubview:v4->_containerView];

    [(UIView *)v4->_containerView setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];
    v10 = v4->_containerView;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__NUITableViewContainerCell_initWithStyle_reuseIdentifier___block_invoke;
    v12[3] = &unk_1E5EFF280;
    v13 = v4;
    [(NUIContainerView *)v10 performBatchUpdates:v12];
  }
  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  if (a4 <= 50.0) {
    a3.double width = 0.0;
  }
  if (a5 <= 50.0) {
    a3.double height = 0.0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NUITableViewContainerCell;
  -[NUITableViewContainerCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v7, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  result.double height = v6;
  result.double width = v5;
  return result;
}

+ (Class)containerViewClass
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  objc_super v7 = NSStringFromSelector(a2);
  [v3 raise:v4, @"-[%@ %@] not implemented.", v6, v7 format];

  return 0;
}

- (void).cxx_destruct
{
}

@end