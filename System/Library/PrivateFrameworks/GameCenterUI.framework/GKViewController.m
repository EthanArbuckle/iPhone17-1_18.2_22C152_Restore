@interface GKViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)displayUsingSplitNavigationBar;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldUpdateContentOnlyWhenAuthenticated;
- (GKColorPalette)colorPalette;
- (GKViewController)rootViewController;
- (void)loadView;
- (void)popToRootViewControllerAnimated:(BOOL)a3;
- (void)setColorPalette:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setShouldUpdateContentOnlyWhenAuthenticated:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKViewController

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)GKViewController;
  [(GKViewController *)&v5 loadView];
  v3 = [(GKViewController *)self view];
  v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:1];
}

- (GKViewController)rootViewController
{
  if (self->_rootViewController) {
    self = self->_rootViewController;
  }
  return self;
}

- (GKColorPalette)colorPalette
{
  colorPalette = self->_colorPalette;
  if (!colorPalette)
  {
    v4 = [MEMORY[0x1E4F639B0] sharedPalette];
    [(GKViewController *)self setColorPalette:v4];

    colorPalette = self->_colorPalette;
  }

  return colorPalette;
}

- (BOOL)displayUsingSplitNavigationBar
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKViewController;
  [(GKViewController *)&v6 viewWillAppear:a3];
  if (![(GKViewController *)self shouldUpdateContentOnlyWhenAuthenticated]
    || ([MEMORY[0x1E4F63760] localPlayer],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isAuthenticated],
        v4,
        v5))
  {
    [(GKViewController *)self _gkSetContentsNeedUpdateWithHandler:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKViewController;
  [(GKViewController *)&v3 viewDidAppear:a3];
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(GKViewController *)self navigationController];
  id v4 = (id)[v5 popToRootViewControllerAnimated:v3];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      BOOL v6 = *MEMORY[0x1E4F63A38] == 0;
    }
    else {
      BOOL v6 = 0;
    }
    char v7 = !v6;
  }
  else
  {
    char v7 = 0;
  }
  if (a3 == 1) {
    return 1;
  }
  else {
    return v7 ^ (*MEMORY[0x1E4F63830] != 0);
  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)setRootViewController:(id)a3
{
}

- (void)setColorPalette:(id)a3
{
}

- (BOOL)shouldUpdateContentOnlyWhenAuthenticated
{
  return self->_shouldUpdateContentOnlyWhenAuthenticated;
}

- (void)setShouldUpdateContentOnlyWhenAuthenticated:(BOOL)a3
{
  self->_shouldUpdateContentOnlyWhenAuthenticated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);

  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end