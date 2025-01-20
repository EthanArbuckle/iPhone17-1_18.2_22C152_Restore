@interface CKVisionTranscriptTitleView
+ (id)titleViewWithConversation:(id)a3 tapHandler:(id)a4;
- (CKAvatarButton)avatarButton;
- (CKVisionKTBadgeView)ktBadgeImageView;
- (CKVisionTranscriptTitleView)initWithConversation:(id)a3 tapHandler:(id)a4;
- (id)tapHandler;
- (void)layoutSubviews;
- (void)setAvatarButton:(id)a3;
- (void)setKtBadgeImageView:(id)a3;
- (void)setTapHandler:(id)a3;
@end

@implementation CKVisionTranscriptTitleView

+ (id)titleViewWithConversation:(id)a3 tapHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConversation:v6 tapHandler:v5];

  return v7;
}

- (CKVisionTranscriptTitleView)initWithConversation:(id)a3 tapHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKVisionTranscriptTitleView;
  v8 = [(CKVisionTranscriptTitleView *)&v17 init];
  if (v8)
  {
    +[StyleSupport transcriptTitleViewHeight];
    -[_UINavigationBarTitleView setHeight:](v8, "setHeight:");
    v9 = (void *)MEMORY[0x1E4F426E8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__CKVisionTranscriptTitleView_initWithConversation_tapHandler___block_invoke;
    v15[3] = &unk_1E5624780;
    id v16 = v7;
    v10 = [v9 actionWithHandler:v15];
    v11 = [[CKAvatarButton alloc] initWithPrimaryAction:v10];
    [(CKAvatarButton *)v11 updateWithConversation:v6];
    [(CKVisionTranscriptTitleView *)v8 addSubview:v11];
    [(CKVisionTranscriptTitleView *)v8 setAvatarButton:v11];
    v12 = [[CKVisionKTBadgeView alloc] initWithConversation:v6];
    ktBadgeImageView = v8->_ktBadgeImageView;
    v8->_ktBadgeImageView = v12;

    [(CKVisionTranscriptTitleView *)v8 addSubview:v8->_ktBadgeImageView];
  }

  return v8;
}

uint64_t __63__CKVisionTranscriptTitleView_initWithConversation_tapHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)CKVisionTranscriptTitleView;
  [(CKVisionTranscriptTitleView *)&v22 layoutSubviews];
  +[StyleSupport transcriptTitleViewAvatarButtonDiameter];
  double v4 = v3;
  +[StyleSupport transcriptTitleViewAvatarButtonDiameter];
  double v6 = v5;
  id v7 = [(CKVisionTranscriptTitleView *)self avatarButton];
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v4, v6);

  [(CKVisionTranscriptTitleView *)self center];
  double v9 = v8;
  double v11 = v10;
  v12 = [(CKVisionTranscriptTitleView *)self avatarButton];
  objc_msgSend(v12, "setCenter:", v9, v11);

  [(CKAvatarButton *)self->_avatarButton frame];
  double MaxX = CGRectGetMaxX(v23);
  +[StyleSupport transcriptTitleViewKTBadgePadding];
  double v15 = MaxX + v14;
  [(CKVisionTranscriptTitleView *)self bounds];
  double Height = CGRectGetHeight(v24);
  +[StyleSupport transcriptTitleViewKTBadgeDiameter];
  double v18 = (Height - v17) * 0.5;
  +[StyleSupport transcriptTitleViewKTBadgeDiameter];
  double v20 = v19;
  +[StyleSupport transcriptTitleViewKTBadgeDiameter];
  -[CKVisionKTBadgeView setFrame:](self->_ktBadgeImageView, "setFrame:", v15, v18, v20, v21);
}

- (CKAvatarButton)avatarButton
{
  return self->_avatarButton;
}

- (void)setAvatarButton:(id)a3
{
}

- (CKVisionKTBadgeView)ktBadgeImageView
{
  return self->_ktBadgeImageView;
}

- (void)setKtBadgeImageView:(id)a3
{
}

- (id)tapHandler
{
  return self->_tapHandler;
}

- (void)setTapHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapHandler, 0);
  objc_storeStrong((id *)&self->_ktBadgeImageView, 0);

  objc_storeStrong((id *)&self->_avatarButton, 0);
}

@end