@interface CSUserPictureViewController
+ (BOOL)isUserPictureSupported;
+ (Class)viewClass;
- (BOOL)handleEvent:(id)a3;
- (CSUserPictureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)view;
- (int64_t)presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationType;
- (void)aggregateAppearance:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CSUserPictureViewController

- (CSUserPictureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CSUserPictureViewController;
  v4 = [(CSCoverSheetViewControllerBase *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v6 = [v5 currentUser];
    user = v4->_user;
    v4->_user = (UMUser *)v6;
  }
  return v4;
}

+ (BOOL)isUserPictureSupported
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  char v3 = [v2 isMultiUser];

  return v3;
}

- (id)view
{
  v4.receiver = self;
  v4.super_class = (Class)CSUserPictureViewController;
  v2 = [(CSUserPictureViewController *)&v4 view];

  return v2;
}

- (void)viewDidLoad
{
  char v3 = [(CSUserPictureViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4F1B8F8] contactForUser:self->_user];
  [v3 setContact:v4];

  [(CSCoverSheetViewControllerBase *)self registerView:v3 forRole:2];
  v5.receiver = self;
  v5.super_class = (Class)CSUserPictureViewController;
  [(CSCoverSheetViewControllerBase *)&v5 viewDidLoad];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  userPictureView = self->_userPictureView;
  id v8 = a4;
  -[CSUserPictureView setFrame:](userPictureView, "setFrame:", 0.0, 0.0, width, height);
  v9.receiver = self;
  v9.super_class = (Class)CSUserPictureViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)aggregateAppearance:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSUserPictureViewController;
  id v3 = a3;
  [(CSCoverSheetViewControllerBase *)&v7 aggregateAppearance:v3];
  objc_super v4 = objc_opt_new();
  objc_super v5 = objc_msgSend(v4, "priority:", 60, v7.receiver, v7.super_class);
  uint64_t v6 = [v5 style:&unk_1F306BEA8];
  [v3 addComponent:v6];
}

- (int64_t)presentationPriority
{
  return 1;
}

- (int64_t)presentationStyle
{
  return 1;
}

- (int64_t)presentationType
{
  return 2;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUserPictureViewController;
  if ([(CSCoverSheetViewControllerBase *)&v10 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
    char v5 = [v4 isConsumable];
  }
  else
  {
    if ([v4 type] == 1)
    {
      userPictureView = self->_userPictureView;
      objc_super v7 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
      id v8 = [v7 legibilitySettings];
      [(CSUserPictureView *)userPictureView setLegibilitySettings:v8];
    }
    char v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPictureView, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end