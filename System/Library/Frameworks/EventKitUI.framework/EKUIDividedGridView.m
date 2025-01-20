@interface EKUIDividedGridView
- (CGSize)intrinsicContentSize;
- (EKUIDividedGridViewController)viewController;
- (void)setViewController:(id)a3;
@end

@implementation EKUIDividedGridView

- (CGSize)intrinsicContentSize
{
  v2 = [(EKUIDividedGridView *)self viewController];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (EKUIDividedGridViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (EKUIDividedGridViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end