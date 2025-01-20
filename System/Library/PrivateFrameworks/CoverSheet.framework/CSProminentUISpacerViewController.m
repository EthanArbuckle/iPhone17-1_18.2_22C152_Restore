@interface CSProminentUISpacerViewController
- (BOOL)insetsMargins;
- (BOOL)usesBackgroundView;
- (CSDashBoardRemoteContentSettings)remoteContentSettings;
- (CSProminentUISpacerViewController)init;
- (NSArray)requiredVisualStyleCategories;
- (double)topMarginToMimic;
- (void)_updatePreferredContentSize;
- (void)loadView;
- (void)setContainerSize:(CGSize)a3;
- (void)setRemoteContentSettings:(id)a3;
- (void)setTopMarginToMimic:(double)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)viewDidLoad;
@end

@implementation CSProminentUISpacerViewController

- (CSProminentUISpacerViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSProminentUISpacerViewController;
  result = [(CSProminentUISpacerViewController *)&v3 init];
  if (result) {
    result->_containerSize = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  return result;
}

- (void)loadView
{
  objc_super v3 = [CSProminentUISpacerView alloc];
  v4 = -[CSProminentUISpacerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CSProminentUISpacerView *)v4 setAutoresizingMask:0];
  [(CSProminentUISpacerViewController *)self setView:v4];
  [(CSProminentUISpacerViewController *)self _updatePreferredContentSize];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CSProminentUISpacerViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidLoad];
  objc_super v3 = +[CSLockScreenDomain rootSettings];
  v4 = [v3 dashBoardRemoteContentSettings];
  remoteContentSettings = self->_remoteContentSettings;
  self->_remoteContentSettings = v4;

  [(PTSettings *)self->_remoteContentSettings addKeyObserver:self];
  [(CSProminentUISpacerViewController *)self _updatePreferredContentSize];
}

- (void)setTopMarginToMimic:(double)a3
{
  if (self->_topMarginToMimic != a3)
  {
    self->_topMarginToMimic = a3;
    [(CSProminentUISpacerViewController *)self _updatePreferredContentSize];
  }
}

- (void)setContainerSize:(CGSize)a3
{
  if (self->_containerSize.width != a3.width || self->_containerSize.height != a3.height)
  {
    self->_containerSize = a3;
    [(CSProminentUISpacerViewController *)self _updatePreferredContentSize];
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)usesBackgroundView
{
  return 0;
}

- (BOOL)insetsMargins
{
  return 0;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_remoteContentSettings == a3) {
    [(CSProminentUISpacerViewController *)self _updatePreferredContentSize];
  }
}

- (void)_updatePreferredContentSize
{
  double width = self->_containerSize.width;
  double topMarginToMimic = self->_topMarginToMimic;
  -[CSProminentUISpacerViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, topMarginToMimic);
  id v5 = [(CSProminentUISpacerViewController *)self viewIfLoaded];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, width, topMarginToMimic);
}

- (double)topMarginToMimic
{
  return self->_topMarginToMimic;
}

- (CSDashBoardRemoteContentSettings)remoteContentSettings
{
  return self->_remoteContentSettings;
}

- (void)setRemoteContentSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end