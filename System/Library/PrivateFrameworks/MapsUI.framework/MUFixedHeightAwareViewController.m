@interface MUFixedHeightAwareViewController
- (BOOL)_canShowWhileLocked;
- (MUFixedHeightAwareViewController)initWithViewController:(id)a3;
- (void)_setupChildVC;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
@end

@implementation MUFixedHeightAwareViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MUFixedHeightAwareViewController)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUFixedHeightAwareViewController;
  v6 = [(MUFixedHeightAwareViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_childVC, a3);
    [(MUFixedHeightAwareViewController *)v7 _setupChildVC];
  }

  return v7;
}

- (void)_setupChildVC
{
  v37[5] = *MEMORY[0x1E4F143B8];
  v3 = [(UIViewController *)self->_childVC view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(UIViewController *)self->_childVC view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(UIViewController *)self->_childVC view];
    [v6 setScrollEnabled:0];
  }
  [(MUFixedHeightAwareViewController *)self addChildViewController:self->_childVC];
  v7 = [(MUFixedHeightAwareViewController *)self view];
  v8 = [(UIViewController *)self->_childVC view];
  [v7 addSubview:v8];

  [(UIViewController *)self->_childVC didMoveToParentViewController:self];
  objc_super v9 = [(UIViewController *)self->_childVC view];
  v10 = [v9 heightAnchor];
  [(UIViewController *)self->_childVC preferredContentSize];
  v12 = [v10 constraintEqualToConstant:v11];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v12;

  v27 = (void *)MEMORY[0x1E4F28DC8];
  v36 = [(UIViewController *)self->_childVC view];
  v34 = [v36 leadingAnchor];
  v35 = [(MUFixedHeightAwareViewController *)self view];
  v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v37[0] = v32;
  v31 = [(UIViewController *)self->_childVC view];
  v29 = [v31 trailingAnchor];
  v30 = [(MUFixedHeightAwareViewController *)self view];
  v28 = [v30 trailingAnchor];
  v26 = [v29 constraintEqualToAnchor:v28];
  v37[1] = v26;
  v25 = [(UIViewController *)self->_childVC view];
  v24 = [v25 topAnchor];
  v14 = [(MUFixedHeightAwareViewController *)self view];
  v15 = [v14 topAnchor];
  v16 = [v24 constraintEqualToAnchor:v15];
  v37[2] = v16;
  v17 = [(UIViewController *)self->_childVC view];
  v18 = [v17 bottomAnchor];
  v19 = [(MUFixedHeightAwareViewController *)self view];
  v20 = [v19 bottomAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v22 = self->_heightConstraint;
  v37[3] = v21;
  v37[4] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
  [v27 activateConstraints:v23];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  [(UIViewController *)self->_childVC preferredContentSize];
  -[MUFixedHeightAwareViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(UIViewController *)self->_childVC preferredContentSize];
  heightConstraint = self->_heightConstraint;
  [(NSLayoutConstraint *)heightConstraint setConstant:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childVC, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end