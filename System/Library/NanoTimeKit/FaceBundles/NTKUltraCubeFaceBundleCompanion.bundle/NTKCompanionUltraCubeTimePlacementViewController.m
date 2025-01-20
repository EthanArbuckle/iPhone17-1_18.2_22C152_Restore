@interface NTKCompanionUltraCubeTimePlacementViewController
- (NTKCompanionUltraCubeTimePlacementViewController)initWithOptions:(id)a3;
- (NTKCompanionUltraCubeTimePlacementViewControllerDelegate)delegate;
- (double)idealViewHeight;
- (int64_t)selectedOption;
- (void)adjustmentsViewControllerDidUpdateSelectedControl:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedOption:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation NTKCompanionUltraCubeTimePlacementViewController

- (NTKCompanionUltraCubeTimePlacementViewController)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKCompanionUltraCubeTimePlacementViewController;
  v5 = [(NTKCompanionUltraCubeTimePlacementViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = [[NTKCompanionUltraCubeTimePlacementDataSource alloc] initWithOptions:v4];
    adjustmentsDataSource = v5->_adjustmentsDataSource;
    v5->_adjustmentsDataSource = v6;
  }
  return v5;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)NTKCompanionUltraCubeTimePlacementViewController;
  [(NTKCompanionUltraCubeTimePlacementViewController *)&v7 viewDidLoad];
  v3 = objc_alloc_init(NTK_PUAdjustmentsViewController);
  [(NTK_PUAdjustmentsViewController *)v3 setDataSource:self->_adjustmentsDataSource];
  [(NTK_PUAdjustmentsViewController *)v3 setDelegate:self];
  [(NTK_PUAdjustmentsViewController *)v3 setLayoutDirection:0];
  id v4 = [(NTKCompanionUltraCubeTimePlacementViewController *)self view];
  v5 = [(NTK_PUAdjustmentsViewController *)v3 view];
  [(NTKCompanionUltraCubeTimePlacementViewController *)self addChildViewController:v3];
  [v4 addSubview:v5];
  [(NTK_PUAdjustmentsViewController *)v3 didMoveToParentViewController:self];
  adjustmentsViewController = self->_adjustmentsViewController;
  self->_adjustmentsViewController = v3;
}

- (double)idealViewHeight
{
  [(NTK_PUAdjustmentsViewController *)self->_adjustmentsViewController ntk_controlHeight];
  return result;
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKCompanionUltraCubeTimePlacementViewController;
  [(NTKCompanionUltraCubeTimePlacementViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(NTKCompanionUltraCubeTimePlacementViewController *)self view];
  [v3 bounds];
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  CGFloat v8 = CGRectGetWidth(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat v9 = CGRectGetHeight(v16);
  v10 = [(NTK_PUAdjustmentsViewController *)self->_adjustmentsViewController view];
  [(NTK_PUAdjustmentsViewController *)self->_adjustmentsViewController ntk_controlHeight];
  double v12 = v11;
  v17.origin.CGFloat x = 0.0;
  v17.origin.CGFloat y = 0.0;
  v17.size.CGFloat width = v8;
  v17.size.CGFloat height = v9;
  CGFloat v13 = CGRectGetMaxY(v17) - v12;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  objc_msgSend(v10, "setFrame:", 0.0, v13, CGRectGetWidth(v18), v12);
}

- (void)setSelectedOption:(int64_t)a3
{
  if (self->_selectedOption != a3)
  {
    self->_selectedOption = a3;
    -[NTKCompanionUltraCubeTimePlacementDataSource indexPathForOption:](self->_adjustmentsDataSource, "indexPathForOption:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
      id v4 = [(NTK_PUAdjustmentsViewController *)self->_adjustmentsViewController ntk_setSelectedIndexPath:v4];
      id v5 = v6;
    }
    _objc_release_x1(v4, v5);
  }
}

- (void)adjustmentsViewControllerDidUpdateSelectedControl:(id)a3
{
  id v4 = a3;
  id v6 = [(NTKCompanionUltraCubeTimePlacementViewController *)self delegate];
  id v5 = [v4 selectedAdjustmentInfo];

  self->_selectedOption = (int64_t)objc_msgSend(v5, "ntk_option");
  [v6 ultracubeTimePlacementViewControllerDidUpdateSelectedOption:self];
}

- (NTKCompanionUltraCubeTimePlacementViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKCompanionUltraCubeTimePlacementViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)selectedOption
{
  return self->_selectedOption;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_adjustmentsDataSource, 0);

  objc_storeStrong((id *)&self->_adjustmentsViewController, 0);
}

@end