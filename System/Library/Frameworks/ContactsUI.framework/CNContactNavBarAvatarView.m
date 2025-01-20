@interface CNContactNavBarAvatarView
- (BOOL)showing;
- (CNAvatarView)avatarView;
- (CNContact)contact;
- (CNContactNavBarAvatarView)initWithFrame:(CGRect)a3;
- (void)setAvatarView:(id)a3;
- (void)setContact:(id)a3;
- (void)setShowing:(BOOL)a3;
- (void)setShowing:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation CNContactNavBarAvatarView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setShowing:(BOOL)a3
{
  self->_showing = a3;
}

- (BOOL)showing
{
  return self->_showing;
}

- (void)setAvatarView:(id)a3
{
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setShowing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showing != a3)
  {
    BOOL v4 = a4;
    self->_showing = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__CNContactNavBarAvatarView_setShowing_animated___block_invoke;
    aBlock[3] = &unk_1E5499510;
    aBlock[4] = self;
    BOOL v11 = a3;
    v5 = (void (**)(void))_Block_copy(aBlock);
    v6 = v5;
    if (v4)
    {
      v7 = (void *)MEMORY[0x1E4FB1EB0];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__CNContactNavBarAvatarView_setShowing_animated___block_invoke_2;
      v8[3] = &unk_1E549B8A0;
      v9 = v5;
      [v7 animateWithDuration:v8 animations:0.15];
    }
    else
    {
      v5[2](v5);
    }
  }
}

void __49__CNContactNavBarAvatarView_setShowing_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) avatarView];
  [v2 setAlpha:v1];
}

uint64_t __49__CNContactNavBarAvatarView_setShowing_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setContact:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  if (v5)
  {
    v12[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v7 = [(CNContactNavBarAvatarView *)self avatarView];
  v8 = [v7 contacts];
  int v9 = objc_msgSend(v8, "_cn_isIdenticalToArray:", v6);

  v10 = [(CNContactNavBarAvatarView *)self avatarView];
  BOOL v11 = v10;
  if (v9) {
    [v10 contactDidChange];
  }
  else {
    [v10 setContacts:v6];
  }
}

- (CNContactNavBarAvatarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CNContactNavBarAvatarView;
  v7 = -[CNContactNavBarAvatarView initWithFrame:](&v12, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_alloc_init(CNAvatarView);
    avatarView = v7->_avatarView;
    v7->_avatarView = v8;

    [(CNAvatarView *)v7->_avatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNAvatarView *)v7->_avatarView setAlpha:0.0];
    -[CNAvatarView setFrame:](v7->_avatarView, "setFrame:", x, y, width, height);
    v7->_showing = 0;
    [(CNContactNavBarAvatarView *)v7 addSubview:v7->_avatarView];
    v10 = v7;
  }

  return v7;
}

@end