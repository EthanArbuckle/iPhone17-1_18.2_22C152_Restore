@interface DKSpinnerController
- (void)cancelPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation DKSpinnerController

- (void)viewDidLoad
{
  v23[2] = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)DKSpinnerController;
  [(DKSpinnerController *)&v22 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [(DKSpinnerController *)self view];
  [v4 addSubview:v3];

  v20 = (void *)MEMORY[0x263F08938];
  v21 = [v3 centerXAnchor];
  v5 = [(DKSpinnerController *)self view];
  v6 = [v5 centerXAnchor];
  v7 = [v21 constraintEqualToAnchor:v6];
  v23[0] = v7;
  v8 = [v3 centerYAnchor];
  v9 = [(DKSpinnerController *)self view];
  v10 = [v9 centerYAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v23[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  [v20 activateConstraints:v12];

  [v3 startAnimating];
  v13 = [(DKSpinnerController *)self view];
  v14 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v13 setBackgroundColor:v14];

  id v15 = objc_alloc(MEMORY[0x263F1C468]);
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
  v18 = (void *)[v15 initWithTitle:v17 style:0 target:self action:sel_cancelPressed_];
  v19 = [(DKSpinnerController *)self navigationItem];
  [v19 setLeftBarButtonItem:v18];
}

- (void)cancelPressed:(id)a3
{
}

@end