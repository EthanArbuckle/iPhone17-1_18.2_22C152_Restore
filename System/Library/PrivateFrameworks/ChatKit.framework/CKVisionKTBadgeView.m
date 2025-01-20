@interface CKVisionKTBadgeView
- (CKConversation)conversation;
- (CKVisionKTBadgeView)initWithConversation:(id)a3;
- (UIImageView)badgeImageView;
- (id)_ktImageForStatus:(unint64_t)a3;
- (void)_updateBadge;
- (void)layoutSubviews;
- (void)setBadgeImageView:(id)a3;
- (void)setConversation:(id)a3;
@end

@implementation CKVisionKTBadgeView

- (CKVisionKTBadgeView)initWithConversation:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVisionKTBadgeView;
  v6 = -[CKVisionKTBadgeView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conversation, a3);
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    badgeImageView = v7->_badgeImageView;
    v7->_badgeImageView = v8;

    v10 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIImageView *)v7->_badgeImageView setTintColor:v10];

    [(CKVisionKTBadgeView *)v7 addSubview:v7->_badgeImageView];
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel__updateBadge name:*MEMORY[0x1E4F6B998] object:0];

    [(CKVisionKTBadgeView *)v7 _updateBadge];
  }

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKVisionKTBadgeView;
  [(CKVisionKTBadgeView *)&v3 layoutSubviews];
  [(CKVisionKTBadgeView *)self bounds];
  -[UIImageView setFrame:](self->_badgeImageView, "setFrame:");
}

- (void)_updateBadge
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CKVisionKTBadgeView__updateBadge__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __35__CKVisionKTBadgeView__updateBadge__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) conversation];
  objc_super v3 = [v2 chat];
  uint64_t v4 = [v3 keyTransparencyStatusForAffectedHandles:0];

  id v6 = [*(id *)(a1 + 32) _ktImageForStatus:v4];
  id v5 = [*(id *)(a1 + 32) badgeImageView];
  [v5 setImage:v6];
}

- (id)_ktImageForStatus:(unint64_t)a3
{
  unint64_t v5 = a3 - 4;
  if (a3 - 4 <= 7 && ((0xBFu >> v5) & 1) != 0)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F42A80], "systemImageNamed:", off_1E5629B98[v5], v3);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
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

  objc_storeStrong((id *)&self->_badgeImageView, 0);
}

@end