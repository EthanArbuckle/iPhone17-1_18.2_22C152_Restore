@interface MKPresentableSelectionAccessoryViewController
- (MKPresentableSelectionAccessoryViewController)initWithSelectionAccessoryView:(id)a3;
- (void)loadView;
@end

@implementation MKPresentableSelectionAccessoryViewController

- (MKPresentableSelectionAccessoryViewController)initWithSelectionAccessoryView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKPresentableSelectionAccessoryViewController;
  v6 = [(MKPresentableSelectionAccessoryViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessoryView, a3);
    [(MKViewSwitchingSelectionAccessoryView *)v7->_accessoryView setParentViewController:v7];
  }

  return v7;
}

- (void)loadView
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)MKPresentableSelectionAccessoryViewController;
  [(MKPresentableSelectionAccessoryViewController *)&v25 loadView];
  v3 = [(MKPresentableSelectionAccessoryViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  id v5 = [(MKPresentableSelectionAccessoryViewController *)self view];
  [v5 setBackgroundColor:v4];

  [(MKViewSwitchingSelectionAccessoryView *)self->_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(MKPresentableSelectionAccessoryViewController *)self view];
  [v6 addSubview:self->_accessoryView];

  v17 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [(MKViewSwitchingSelectionAccessoryView *)self->_accessoryView topAnchor];
  v24 = [(MKPresentableSelectionAccessoryViewController *)self view];
  v22 = [v24 topAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v26[0] = v21;
  v19 = [(MKViewSwitchingSelectionAccessoryView *)self->_accessoryView leadingAnchor];
  v20 = [(MKPresentableSelectionAccessoryViewController *)self view];
  v18 = [v20 leadingAnchor];
  v7 = [v19 constraintEqualToAnchor:v18];
  v26[1] = v7;
  v8 = [(MKPresentableSelectionAccessoryViewController *)self view];
  objc_super v9 = [v8 trailingAnchor];
  v10 = [(MKViewSwitchingSelectionAccessoryView *)self->_accessoryView trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v26[2] = v11;
  v12 = [(MKPresentableSelectionAccessoryViewController *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [(MKViewSwitchingSelectionAccessoryView *)self->_accessoryView bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v26[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  [v17 activateConstraints:v16];
}

- (void).cxx_destruct
{
}

@end