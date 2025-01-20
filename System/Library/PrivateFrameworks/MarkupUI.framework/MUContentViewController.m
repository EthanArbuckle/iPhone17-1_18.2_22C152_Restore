@interface MUContentViewController
- (AKController)annotationController;
- (MUContentViewController)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5;
- (MUContentViewControllerDelegate)delegate;
- (void)setAnnotationController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MUContentViewController

- (MUContentViewController)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MUContentViewController;
  v9 = [(MUContentViewController *)&v12 initWithNibName:a3 bundle:a4];
  v10 = v9;
  if (v9) {
    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v10;
}

- (MUContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKController)annotationController
{
  return (AKController *)objc_getProperty(self, a2, 984, 1);
}

- (void)setAnnotationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end