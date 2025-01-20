@interface CNBadgingAvatarViewController
- (BOOL)isDoNotDisturb;
- (BOOL)isMarkedForSyndication;
- (CNAvatarAccessoryView)mediaContextBadge;
- (CNAvatarViewController)avatarViewController;
- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings;
- (CNBadgingAvatarView)badgingAvatarView;
- (CNBadgingAvatarViewController)init;
- (CNBadgingAvatarViewController)initWithSettings:(id)a3;
- (CNUIObjectViewControllerDelegate)objectViewControllerDelegate;
- (NSArray)contacts;
- (UIImage)badgeImage;
- (UIView)containerView;
- (UIView)view;
- (id)descriptorForRequiredKeys;
- (id)hostingViewControllerForController:(id)a3;
- (void)setAvatarViewController:(id)a3;
- (void)setBadgeImage:(id)a3;
- (void)setBadgeStyleSettings:(id)a3;
- (void)setBadgingAvatarView:(id)a3;
- (void)setContacts:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setIsDoNotDisturb:(BOOL)a3;
- (void)setIsMarkedForSyndication:(BOOL)a3;
- (void)setMediaContextBadge:(id)a3;
- (void)setObjectViewControllerDelegate:(id)a3;
- (void)setupContainerViewIfNeeded;
@end

@implementation CNBadgingAvatarViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_badgingAvatarView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_badgeStyleSettings, 0);
  objc_storeStrong((id *)&self->_badgeImage, 0);

  objc_destroyWeak((id *)&self->objectViewControllerDelegate);
}

- (void)setIsDoNotDisturb:(BOOL)a3
{
  self->_isDoNotDisturb = a3;
}

- (BOOL)isDoNotDisturb
{
  return self->_isDoNotDisturb;
}

- (void)setIsMarkedForSyndication:(BOOL)a3
{
  self->_isMarkedForSyndication = a3;
}

- (BOOL)isMarkedForSyndication
{
  return self->_isMarkedForSyndication;
}

- (void)setMediaContextBadge:(id)a3
{
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (void)setAvatarViewController:(id)a3
{
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setBadgingAvatarView:(id)a3
{
}

- (CNBadgingAvatarView)badgingAvatarView
{
  return self->_badgingAvatarView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings
{
  return self->_badgeStyleSettings;
}

- (UIImage)badgeImage
{
  return self->_badgeImage;
}

- (void)setObjectViewControllerDelegate:(id)a3
{
}

- (CNUIObjectViewControllerDelegate)objectViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->objectViewControllerDelegate);

  return (CNUIObjectViewControllerDelegate *)WeakRetained;
}

- (id)hostingViewControllerForController:(id)a3
{
  v4 = [(CNBadgingAvatarViewController *)self objectViewControllerDelegate];
  v5 = [v4 hostingViewControllerForController:self];

  return v5;
}

- (void)setBadgeStyleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_badgeStyleSettings, a3);
  id v5 = a3;
  id v6 = [(CNBadgingAvatarViewController *)self badgingAvatarView];
  [v6 setBadgeStyleSettings:v5];
}

- (void)setBadgeImage:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImage, a3);
  id v5 = a3;
  id v6 = [(CNBadgingAvatarViewController *)self badgingAvatarView];
  [v6 setBadgeImage:v5];
}

- (void)setupContainerViewIfNeeded
{
  v3 = [(CNBadgingAvatarViewController *)self containerView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNBadgingAvatarViewController *)self setContainerView:v5];

    id v6 = [(CNBadgingAvatarViewController *)self containerView];
    v7 = [(CNBadgingAvatarViewController *)self badgingAvatarView];
    [v6 addSubview:v7];

    v8 = [(CNBadgingAvatarViewController *)self containerView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [(CNBadgingAvatarViewController *)self badgingAvatarView];
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    id v18 = [(CNBadgingAvatarViewController *)self badgingAvatarView];
    [v18 setAutoresizingMask:18];
  }
}

- (UIView)view
{
  [(CNBadgingAvatarViewController *)self setupContainerViewIfNeeded];

  return [(CNBadgingAvatarViewController *)self containerView];
}

- (NSArray)contacts
{
  v2 = [(CNBadgingAvatarViewController *)self avatarViewController];
  v3 = [v2 contacts];

  return (NSArray *)v3;
}

- (void)setContacts:(id)a3
{
  id v4 = a3;
  id v5 = [(CNBadgingAvatarViewController *)self avatarViewController];
  [v5 setContacts:v4];
}

- (CNBadgingAvatarViewController)init
{
  v3 = +[CNAvatarViewControllerSettings defaultSettings];
  id v4 = [(CNBadgingAvatarViewController *)self initWithSettings:v3];

  return v4;
}

- (CNBadgingAvatarViewController)initWithSettings:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNBadgingAvatarViewController;
  id v5 = [(CNBadgingAvatarViewController *)&v12 init];
  if (v5)
  {
    id v6 = [[CNAvatarViewController alloc] initWithSettings:v4];
    avatarViewController = v5->_avatarViewController;
    v5->_avatarViewController = v6;

    [(CNAvatarViewController *)v5->_avatarViewController setObjectViewControllerDelegate:v5];
    v8 = [[CNBadgingAvatarView alloc] initWithAvatarViewController:v5->_avatarViewController];
    badgingAvatarView = v5->_badgingAvatarView;
    v5->_badgingAvatarView = v8;

    double v10 = v5;
  }

  return v5;
}

- (id)descriptorForRequiredKeys
{
  id v4 = [(CNBadgingAvatarViewController *)self avatarViewController];

  if (!v4)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CNBadgingAvatarViewController.m" lineNumber:336 description:@"CNBadgingAvatarViewController - Avatar View Controller required to get descriptorsForRequiredKeys"];
  }
  id v5 = [(CNBadgingAvatarViewController *)self avatarViewController];
  id v6 = [v5 descriptorForRequiredKeys];

  return v6;
}

@end