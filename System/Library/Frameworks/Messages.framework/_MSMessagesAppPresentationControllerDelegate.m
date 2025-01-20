@interface _MSMessagesAppPresentationControllerDelegate
- (MSMessagesAppViewController)appViewController;
- (_MSMessagesAppPresentationControllerDelegate)initWithMessagesAppViewController:(id)a3;
- (void)setAppViewController:(id)a3;
- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3;
@end

@implementation _MSMessagesAppPresentationControllerDelegate

- (_MSMessagesAppPresentationControllerDelegate)initWithMessagesAppViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MSMessagesAppPresentationControllerDelegate;
  v5 = [(_MSMessagesAppPresentationControllerDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_appViewController, v4);
  }

  return v6;
}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  id v4 = [a3 selectedDetentIdentifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F43CE8]];

  p_appViewController = &self->_appViewController;
  id WeakRetained = objc_loadWeakRetained((id *)p_appViewController);
  objc_super v8 = WeakRetained;
  if (v5)
  {
    [WeakRetained willTransitionToPresentationStyle:1];

    id v9 = objc_loadWeakRetained((id *)p_appViewController);
    [v9 _setAppPresentationStyle:1];

    id v10 = objc_loadWeakRetained((id *)p_appViewController);
    id v13 = v10;
    uint64_t v11 = 1;
  }
  else
  {
    [WeakRetained willTransitionToPresentationStyle:0];

    id v12 = objc_loadWeakRetained((id *)p_appViewController);
    [v12 _setAppPresentationStyle:0];

    id v10 = objc_loadWeakRetained((id *)p_appViewController);
    id v13 = v10;
    uint64_t v11 = 0;
  }
  [v10 didTransitionToPresentationStyle:v11];
}

- (MSMessagesAppViewController)appViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appViewController);

  return (MSMessagesAppViewController *)WeakRetained;
}

- (void)setAppViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end