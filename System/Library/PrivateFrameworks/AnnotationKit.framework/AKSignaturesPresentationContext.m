@interface AKSignaturesPresentationContext
- (UIView)sourceView;
- (UIViewController)presentingViewController;
- (void)setPresentingViewController:(id)a3;
- (void)setSourceView:(id)a3;
@end

@implementation AKSignaturesPresentationContext

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (void)setSourceView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end