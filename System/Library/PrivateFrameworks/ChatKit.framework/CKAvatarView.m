@interface CKAvatarView
- (CKAvatarView)init;
- (CKAvatarView)initWithFrame:(CGRect)a3;
- (NSString)_ck_contextToken;
- (NSString)preferredHandle;
- (UIViewController)presentingViewController;
- (void)_ck_setContextToken:(id)a3;
- (void)layoutSubviews;
- (void)setPreferredHandle:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation CKAvatarView

- (void)setPresentingViewController:(id)a3
{
}

- (CKAvatarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(CKAvatarView *)self init];
  -[CKAvatarView setFrame:](v7, "setFrame:", x, y, width, height);
  return v7;
}

- (CKAvatarView)init
{
  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global_203);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKAvatarView;
  return [(CNAvatarView *)&v4 initWithSettings:init_s_settings];
}

- (void)_ck_setContextToken:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(CNAvatarView *)self setContextToken:v4];
  }
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CKAvatarView;
  [(CNAvatarView *)&v2 layoutSubviews];
}

void __20__CKAvatarView_init__block_invoke()
{
  v0 = +[CKUIBehavior sharedBehaviors];
  uint64_t v1 = [v0 contactsSettingsCacheSize];

  uint64_t v2 = [MEMORY[0x1E4F1BB50] defaultSettingsWithCacheSize:v1 threeDTouchEnabled:1];
  v3 = (void *)init_s_settings;
  init_s_settings = v2;
}

- (NSString)_ck_contextToken
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [(CNAvatarView *)self contextToken];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (NSString)preferredHandle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredHandle);

  return (NSString *)WeakRetained;
}

- (void)setPreferredHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferredHandle);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end