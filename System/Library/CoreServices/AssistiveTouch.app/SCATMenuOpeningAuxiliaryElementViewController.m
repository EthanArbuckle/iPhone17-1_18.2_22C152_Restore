@interface SCATMenuOpeningAuxiliaryElementViewController
- (BOOL)_canShowWhileLocked;
- (SCATMenuOpeningAuxiliaryElementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SCATMenuOpeningElement)menuOpeningElement;
- (void)setMenuOpeningElement:(id)a3;
- (void)viewDidLoad;
@end

@implementation SCATMenuOpeningAuxiliaryElementViewController

- (SCATMenuOpeningAuxiliaryElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SCATMenuOpeningAuxiliaryElementViewController;
  v4 = [(SCATMenuOpeningAuxiliaryElementViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_opt_new();
    [(SCATMenuOpeningAuxiliaryElementViewController *)v4 setMenuOpeningElement:v5];
  }
  return v4;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)SCATMenuOpeningAuxiliaryElementViewController;
  [(SCATAuxiliaryElementManagerViewController *)&v11 viewDidLoad];
  v3 = [(SCATMenuOpeningAuxiliaryElementViewController *)self view];
  v4 = [(SCATMenuOpeningAuxiliaryElementViewController *)self menuOpeningElement];
  [v3 addSubview:v4];
  v5 = [v3 bottomAnchor];
  v6 = [v4 bottomAnchor];
  objc_super v7 = [v5 constraintEqualToAnchor:v6 constant:20.0];
  [v7 setActive:1];

  v8 = [v3 trailingAnchor];
  v9 = [v4 trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:20.0];
  [v10 setActive:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SCATMenuOpeningElement)menuOpeningElement
{
  return *(SCATMenuOpeningElement **)(&self->super._transitioningToOrFromActive + 1);
}

- (void)setMenuOpeningElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end