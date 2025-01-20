@interface CKAvatarButton
- (CKAvatarButton)initWithPrimaryAction:(id)a3;
- (CKConversation)conversation;
- (CNAvatarView)avatarView;
- (void)_handleConversationChange:(id)a3;
- (void)layoutSubviews;
- (void)setAvatarView:(id)a3;
- (void)setConversation:(id)a3;
- (void)updateWithConversation:(id)a3;
@end

@implementation CKAvatarButton

- (CKAvatarButton)initWithPrimaryAction:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F427E8];
  id v5 = a3;
  v6 = [v4 borderlessButtonConfiguration];
  v7 = +[CKAvatarButton buttonWithConfiguration:v6 primaryAction:v5];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1BB38]);
    v9 = [MEMORY[0x1E4F1BB50] defaultSettings];
    uint64_t v10 = [v8 initWithSettings:v9];
    avatarView = v7->_avatarView;
    v7->_avatarView = (CNAvatarView *)v10;

    [(CNAvatarView *)v7->_avatarView setUserInteractionEnabled:0];
    [(CKAvatarButton *)v7 addSubview:v7->_avatarView];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__handleConversationChange_ name:*MEMORY[0x1E4F6B8B0] object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v7 selector:sel__handleConversationChange_ name:*MEMORY[0x1E4F6B898] object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v7 selector:sel__handleConversationChange_ name:*MEMORY[0x1E4F6B9C8] object:0];
  }
  return v7;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)CKAvatarButton;
  [(CKAvatarButton *)&v17 layoutSubviews];
  [(CKAvatarButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKAvatarButton *)self avatarView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(CKAvatarButton *)self avatarView];
  [v12 bounds];
  double v14 = v13 * 0.5;
  v15 = [(CKAvatarButton *)self configuration];
  v16 = [v15 background];
  [v16 setCornerRadius:v14];
}

- (void)updateWithConversation:(id)a3
{
  id v16 = a3;
  objc_storeStrong((id *)&self->_conversation, a3);
  uint64_t v5 = [MEMORY[0x1E4F1BB38] maxContactAvatars];
  double v6 = [v16 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:v5];
  double v7 = [(CKAvatarButton *)self avatarView];
  id v8 = (id)[v7 updateViewWithGroupIdentity:v6];

  uint64_t v9 = [v16 isBusinessConversation];
  double v10 = [(CKAvatarButton *)self avatarView];
  [v10 setStyle:v9];

  [(CKAvatarButton *)self setToolTip:0];
  v11 = [(CKAvatarButton *)self conversation];
  char v12 = [v11 hasDisplayName];
  double v13 = [(CKAvatarButton *)self conversation];
  double v14 = v13;
  if (v12) {
    [v13 displayName];
  }
  else {
  v15 = [v13 name];
  }
  [(CKAvatarButton *)self setToolTip:v15];
}

- (void)_handleConversationChange:(id)a3
{
  id v10 = [a3 object];
  double v4 = [v10 chatIdentifier];
  uint64_t v5 = [(CKAvatarButton *)self conversation];
  double v6 = [v5 chat];
  double v7 = [v6 chatIdentifier];
  int v8 = [v4 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [(CKAvatarButton *)self conversation];
    [(CKAvatarButton *)self updateWithConversation:v9];
  }
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end