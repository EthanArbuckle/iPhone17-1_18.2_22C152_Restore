@interface CNAvatarViewController_LegacyAvatarView
- (BOOL)_canShowWhileLocked;
- (BOOL)isThreeDTouchEnabled;
- (CNAvatarView)avatarView;
- (CNAvatarViewController_LegacyAvatarView)initWithSettings:(id)a3;
- (CNContactStore)contactStore;
- (CNSchedulerProvider)schedulerProvider;
- (CNUILikenessRendering)imageRenderer;
- (NSObject)delegate;
- (id)contacts;
- (id)descriptorForRequiredKeys;
- (id)presentingViewControllerForAvatarView:(id)a3;
- (unint64_t)style;
- (void)didUpdateContentForAvatarView:(id)a3;
- (void)loadView;
- (void)setAllowStaleRendering:(BOOL)a3;
- (void)setAvatarView:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setThreeDTouchEnabled:(BOOL)a3;
- (void)updateViewWithGroupIdentity:(id)a3;
@end

@implementation CNAvatarViewController_LegacyAvatarView

- (void)didUpdateContentForAvatarView:(id)a3
{
  v4 = [(CNAvatarViewController_LegacyAvatarView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNAvatarViewController_LegacyAvatarView *)self delegate];
    [v6 didUpdateContentForAvatarViewController:self];
  }
}

- (NSObject)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setContacts:(id)a3
{
  id v9 = a3;
  v4 = (NSArray *)[v9 copy];
  contacts = self->_contacts;
  self->_contacts = v4;

  id v6 = v9;
  if (v9)
  {
    int v7 = [(CNAvatarViewController_LegacyAvatarView *)self isViewLoaded];
    id v6 = v9;
    if (v7)
    {
      v8 = [(CNAvatarViewController_LegacyAvatarView *)self avatarView];
      [v8 setContacts:v9];

      id v6 = v9;
    }
  }
}

- (void)loadView
{
  v3 = [CNAvatarView alloc];
  v4 = [(CNAvatarViewController_LegacyAvatarView *)self imageRenderer];
  BOOL v5 = [(CNAvatarViewController_LegacyAvatarView *)self isThreeDTouchEnabled];
  id v6 = [(CNAvatarViewController_LegacyAvatarView *)self contactStore];
  unint64_t v7 = [(CNAvatarViewController_LegacyAvatarView *)self style];
  v8 = [(CNAvatarViewController_LegacyAvatarView *)self schedulerProvider];
  v13 = [(CNAvatarView *)v3 initWithImageRenderer:v4 threeDTouchEnabled:v5 contactStore:v6 style:v7 schedulerProvider:v8 backgroundStyle:0];

  [(CNAvatarViewController_LegacyAvatarView *)self setView:v13];
  [(CNAvatarViewController_LegacyAvatarView *)self setAvatarView:v13];
  id v9 = [(CNAvatarViewController_LegacyAvatarView *)self avatarView];
  [v9 setDelegate:self];

  v10 = [(CNAvatarViewController_LegacyAvatarView *)self contacts];

  if (v10)
  {
    v11 = [(CNAvatarViewController_LegacyAvatarView *)self avatarView];
    v12 = [(CNAvatarViewController_LegacyAvatarView *)self contacts];
    [v11 setContacts:v12];
  }
}

- (CNAvatarView)avatarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_avatarView);

  return (CNAvatarView *)WeakRetained;
}

- (id)contacts
{
  return self->_contacts;
}

- (BOOL)isThreeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setAvatarView:(id)a3
{
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUILikenessRendering)imageRenderer
{
  return self->_imageRenderer;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNAvatarViewController_LegacyAvatarView)initWithSettings:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarViewController_LegacyAvatarView;
  BOOL v5 = [(CNAvatarViewController *)&v13 initWithSettings:v4];
  if (v5)
  {
    uint64_t v6 = [v4 likenessRenderer];
    imageRenderer = v5->_imageRenderer;
    v5->_imageRenderer = (CNUILikenessRendering *)v6;

    v5->_threeDTouchEnabled = [v4 threeDTouchEnabled];
    uint64_t v8 = [v4 schedulerProvider];
    schedulerProvider = v5->_schedulerProvider;
    v5->_schedulerProvider = (CNSchedulerProvider *)v8;

    v5->_style = [v4 style];
    uint64_t v10 = [v4 contactStore];
    contactStore = v5->_contactStore;
    v5->_contactStore = (CNContactStore *)v10;
  }
  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDelegate:(id)a3
{
}

- (id)descriptorForRequiredKeys
{
  BOOL v2 = [(CNAvatarViewController_LegacyAvatarView *)self isThreeDTouchEnabled];

  return +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:v2];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_avatarView);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageRenderer, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  id v4 = [(CNAvatarViewController *)self objectViewControllerDelegate];
  BOOL v5 = [v4 hostingViewControllerForController:self];

  if (!v5) {
    BOOL v5 = self;
  }

  return v5;
}

- (void)setAllowStaleRendering:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNAvatarViewController_LegacyAvatarView *)self avatarView];
  [v4 setAllowStaleRendering:v3];
}

- (void)updateViewWithGroupIdentity:(id)a3
{
  id v6 = a3;
  id v4 = [(CNAvatarViewController_LegacyAvatarView *)self avatarView];
  id v5 = (id)[v4 updateViewWithGroupIdentity:v6];
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  if (self->_threeDTouchEnabled != a3)
  {
    BOOL v3 = a3;
    self->_threeDTouchEnabled = a3;
    id v4 = [(CNAvatarViewController_LegacyAvatarView *)self avatarView];
    [v4 setThreeDTouchEnabled:v3];
  }
}

@end