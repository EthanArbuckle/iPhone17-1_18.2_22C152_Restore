@interface CKPinnedConversationContactItemAvatarView
- (CKPinnedConversationContactItem)pinnedConversationContactItem;
- (CKPinnedConversationContactItemAvatarView)init;
- (void)_updateContactItemViewShadows;
- (void)setPinnedConversationContactItem:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKPinnedConversationContactItemAvatarView

- (CKPinnedConversationContactItemAvatarView)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKPinnedConversationContactItemAvatarView;
  v2 = [(CKAvatarView *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CNAvatarView *)v2 setAsynchronousRendering:1];
    [(CKPinnedConversationContactItemAvatarView *)v3 setUserInteractionEnabled:0];
    [(CNAvatarView *)v3 setShowsContactOnTap:0];
    [(CNAvatarView *)v3 setBypassActionValidation:1];
    id v4 = [MEMORY[0x1E4F428B8] blackColor];
    uint64_t v5 = [v4 CGColor];
    v6 = [(CKPinnedConversationContactItemAvatarView *)v3 layer];
    [v6 setShadowColor:v5];

    [(CKPinnedConversationContactItemAvatarView *)v3 _updateContactItemViewShadows];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationContactItemAvatarView;
  [(CNAvatarView *)&v4 traitCollectionDidChange:a3];
  [(CKPinnedConversationContactItemAvatarView *)self _updateContactItemViewShadows];
}

- (void)_updateContactItemViewShadows
{
  v3 = [(CKPinnedConversationContactItemAvatarView *)self traitCollection];
  unint64_t v4 = [v3 userInterfaceStyle];

  if (v4 > 2)
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    int v5 = 0;
    double v6 = 0.0;
  }
  else
  {
    int v5 = dword_18F81D178[v4];
    double v6 = 4.0;
    double v7 = 0.0;
    double v8 = 3.0;
  }
  v9 = [(CKPinnedConversationContactItemAvatarView *)self layer];
  LODWORD(v10) = v5;
  [v9 setShadowOpacity:v10];

  v11 = [(CKPinnedConversationContactItemAvatarView *)self layer];
  [v11 setShadowRadius:v6];

  id v12 = [(CKPinnedConversationContactItemAvatarView *)self layer];
  objc_msgSend(v12, "setShadowOffset:", v7, v8);
}

- (CKPinnedConversationContactItem)pinnedConversationContactItem
{
  return self->_pinnedConversationContactItem;
}

- (void)setPinnedConversationContactItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end