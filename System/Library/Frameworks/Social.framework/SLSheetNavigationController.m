@interface SLSheetNavigationController
- (BOOL)_canShowWhileLocked;
- (SLSheetNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)loadView;
- (void)setDefaultNavigationBarStyle;
- (void)setSheetNavigationBarStyle;
- (void)viewDidLoad;
@end

@implementation SLSheetNavigationController

- (SLSheetNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SLSheetNavigationController;
  v4 = [(SLSheetNavigationController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(SLSheetNavigationController *)v4 _setPreferredNavigationBarPosition:2];
  }
  return v5;
}

- (void)loadView
{
  v20.receiver = self;
  v20.super_class = (Class)SLSheetNavigationController;
  [(SLSheetNavigationController *)&v20 loadView];
  v3 = [(SLSheetNavigationController *)self view];
  [v3 setOpaque:0];

  v4 = [MEMORY[0x1E4F428B8] clearColor];
  v5 = [(SLSheetNavigationController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(SLSheetNavigationController *)self view];
  objc_super v7 = [v6 layer];
  [v7 setMasksToBounds:1];

  v8 = [(SLSheetNavigationController *)self view];
  v9 = [v8 layer];
  [v9 setCornerRadius:7.0];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithStyle:2];
  id v11 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v11 setOpaque:0];
  v12 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v13 = [v12 colorWithAlphaComponent:0.6];
  [v11 setBackgroundColor:v13];

  v14 = [(SLSheetNavigationController *)self view];
  [v14 bounds];
  objc_msgSend(v11, "setFrame:");

  [v11 setAutoresizingMask:18];
  v15 = [(SLSheetNavigationController *)self view];
  [v15 addSubview:v11];

  v16 = [(SLSheetNavigationController *)self view];
  [v16 sendSubviewToBack:v11];

  v17 = [(SLSheetNavigationController *)self view];
  [v17 bounds];
  objc_msgSend(v10, "setFrame:");

  [v10 setAutoresizingMask:18];
  v18 = [(SLSheetNavigationController *)self view];
  [v18 addSubview:v10];

  v19 = [(SLSheetNavigationController *)self view];
  [v19 sendSubviewToBack:v10];

  [(SLSheetNavigationController *)self setSheetNavigationBarStyle];
}

- (void)setSheetNavigationBarStyle
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SLSheetNavigationController *)self navigationBar];
  v4 = [MEMORY[0x1E4F42A80] socialFrameworkImageNamed:@"SLSheetNavBarBackgroundDefault"];
  [v3 setBackgroundImage:v4 forBarMetrics:0];

  v5 = [(SLSheetNavigationController *)self navigationBar];
  v6 = [MEMORY[0x1E4F42A80] socialFrameworkImageNamed:@"SLSheetNavBarBackgroundLandscapeiPhone"];
  [v5 setBackgroundImage:v6 forBarMetrics:1];

  objc_super v7 = [(SLSheetNavigationController *)self navigationBar];
  [v7 setTranslucent:1];

  uint64_t v11 = *MEMORY[0x1E4F42510];
  v8 = [MEMORY[0x1E4F428B8] labelColor];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v10 = [(SLSheetNavigationController *)self navigationBar];
  [v10 setTitleTextAttributes:v9];
}

- (void)setDefaultNavigationBarStyle
{
  v3 = [(SLSheetNavigationController *)self navigationBar];
  [v3 setBackgroundImage:0 forBarMetrics:0];

  id v4 = [(SLSheetNavigationController *)self navigationBar];
  [v4 setBackgroundImage:0 forBarMetrics:1];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)SLSheetNavigationController;
  [(SLSheetNavigationController *)&v2 viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)SLSheetNavigationController;
  [(SLSheetNavigationController *)&v2 didReceiveMemoryWarning];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end