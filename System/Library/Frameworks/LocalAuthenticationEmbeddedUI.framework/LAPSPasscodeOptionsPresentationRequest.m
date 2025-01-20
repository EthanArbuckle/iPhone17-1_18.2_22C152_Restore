@interface LAPSPasscodeOptionsPresentationRequest
- (BOOL)animated;
- (LAPSPasscodeOptionsPresentationRequest)initWithSourceViewController:(id)a3;
- (LAPSPasscodeOptionsViewControllerConfiguration)config;
- (LAPSPasscodeOptionsViewControllerDelegate)delegate;
- (UIBarButtonItem)sourceItem;
- (UIView)sourceView;
- (UIViewController)sourceViewController;
- (int64_t)presentationStyle;
- (void)setAnimated:(BOOL)a3;
- (void)setConfig:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setSourceItem:(id)a3;
- (void)setSourceView:(id)a3;
@end

@implementation LAPSPasscodeOptionsPresentationRequest

- (LAPSPasscodeOptionsPresentationRequest)initWithSourceViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAPSPasscodeOptionsPresentationRequest;
  v6 = [(LAPSPasscodeOptionsPresentationRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceViewController, a3);
    v7->_presentationStyle = 0;
  }

  return v7;
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (UIBarButtonItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (LAPSPasscodeOptionsViewControllerConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (LAPSPasscodeOptionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LAPSPasscodeOptionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);

  objc_storeStrong((id *)&self->_sourceViewController, 0);
}

@end