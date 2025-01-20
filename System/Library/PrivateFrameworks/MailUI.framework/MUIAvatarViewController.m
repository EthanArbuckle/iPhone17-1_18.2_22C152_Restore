@interface MUIAvatarViewController
+ (id)avatarControllerWithContacts:(id)a3;
- (CNAvatarViewController)avatarViewController;
- (MUIAvatarViewController)initWithContacts:(id)a3;
- (UIView)view;
- (void)setAvatarViewController:(id)a3;
- (void)updateContacts:(id)a3;
@end

@implementation MUIAvatarViewController

- (MUIAvatarViewController)initWithContacts:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUIAvatarViewController;
  v5 = [(MUIAvatarViewController *)&v9 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1BB40]);
    [(MUIAvatarViewController *)v5 setAvatarViewController:v6];

    v7 = [(MUIAvatarViewController *)v5 avatarViewController];
    [v7 setThreeDTouchEnabled:0];

    [(MUIAvatarViewController *)v5 updateContacts:v4];
  }

  return v5;
}

+ (id)avatarControllerWithContacts:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithContacts:v4];

  return v5;
}

- (void)updateContacts:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4 || ![v4 count])
  {
    id v6 = objc_opt_new();
    v11[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

    v5 = (void *)v7;
  }
  v8 = [(MUIAvatarViewController *)self avatarViewController];
  [v8 setContacts:v5];

  BOOL v9 = [v5 count] == 0;
  v10 = [(MUIAvatarViewController *)self view];
  [v10 setHidden:v9];
}

- (UIView)view
{
  view = self->_view;
  id v4 = [(MUIAvatarViewController *)self avatarViewController];
  v5 = [v4 view];

  if (view != v5)
  {
    id v6 = [(MUIAvatarViewController *)self avatarViewController];
    uint64_t v7 = [v6 view];
    v8 = self->_view;
    self->_view = v7;

    [(UIView *)self->_view setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  BOOL v9 = self->_view;
  return v9;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end