@interface ZWMenuLensEffectChooserViewController
- (NSArray)lensEffectIdentifiers;
- (ZWMenuLensEffectChooserViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setLensEffectIdentifiers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ZWMenuLensEffectChooserViewController

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)ZWMenuLensEffectChooserViewController;
  [(ZWMenuChooserTableViewController *)&v5 loadView];
  v3 = AXZoomAllLensEffects();
  v4 = [v3 array];
  [(ZWMenuLensEffectChooserViewController *)self setLensEffectIdentifiers:v4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ZWMenuLensEffectChooserViewController;
  id v6 = a4;
  [(ZWMenuChooserTableViewController *)&v11 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(ZWMenuLensEffectChooserViewController *)self delegate];
  v8 = [(ZWMenuLensEffectChooserViewController *)self lensEffectIdentifiers];
  id v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];
  [v7 menuLensEffectChooserViewController:self didChooseLensEffect:v10];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(ZWMenuLensEffectChooserViewController *)self lensEffectIdentifiers];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)ZWMenuLensEffectChooserViewController;
  id v6 = a4;
  v7 = [(ZWMenuChooserTableViewController *)&v18 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = [(ZWMenuLensEffectChooserViewController *)self lensEffectIdentifiers];
  id v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  objc_super v11 = AXUILocalizedTitleForZoomLensEffect();
  v12 = [v7 textLabel];
  [v12 setText:v11];

  v13 = [v7 textLabel];
  [v13 setTextAlignment:4];

  v14 = +[AXSettings sharedInstance];
  v15 = [v14 zoomCurrentLensEffect];

  if ([v15 isEqualToString:v10]) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 0;
  }
  [v7 setAccessoryType:v16];

  return v7;
}

- (ZWMenuLensEffectChooserViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ZWMenuLensEffectChooserViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)lensEffectIdentifiers
{
  return self->_lensEffectIdentifiers;
}

- (void)setLensEffectIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lensEffectIdentifiers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end