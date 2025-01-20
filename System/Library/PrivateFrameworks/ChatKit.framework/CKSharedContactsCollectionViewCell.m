@interface CKSharedContactsCollectionViewCell
+ (id)reuseIdentifier;
- (CNAvatarView)avatarView;
- (void)configureWithContact:(id)a3;
- (void)layoutSubviews;
- (void)setAvatarView:(id)a3;
@end

@implementation CKSharedContactsCollectionViewCell

+ (id)reuseIdentifier
{
  return @"CKSharedContactsCollectionViewCell_reuseIdentifier";
}

- (void)configureWithContact:(id)a3
{
  id v4 = a3;
  id v8 = [(CKSharedAssetCollectionViewCell *)self previewTitleLabel];
  v5 = [v4 fullName];
  v6 = [(CKSharedAssetCollectionViewCell *)self formattedTitleFromPreviewTitle:v5];
  [v8 setAttributedText:v6];

  v7 = [(CKSharedContactsCollectionViewCell *)self avatarView];
  [v7 setContact:v4];

  [(CKSharedContactsCollectionViewCell *)self setNeedsLayout];
  [(CKSharedContactsCollectionViewCell *)self layoutIfNeeded];
}

- (CNAvatarView)avatarView
{
  avatarView = self->_avatarView;
  if (!avatarView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1BB38]);
    v5 = (CNAvatarView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_avatarView;
    self->_avatarView = v5;

    [(CNAvatarView *)self->_avatarView setShowsContactOnTap:0];
    [(CNAvatarView *)self->_avatarView setForcePressView:self->_avatarView];
    [(CNAvatarView *)self->_avatarView setUserInteractionEnabled:1];
    [(CNAvatarView *)self->_avatarView setShowsActionsOnForcePress:1];
    v7 = [(CKSharedAssetCollectionViewCell *)self previewView];
    [v7 addSubview:self->_avatarView];

    avatarView = self->_avatarView;
  }

  return avatarView;
}

- (void)layoutSubviews
{
  *(void *)&rect.origin.y = self;
  *(void *)&rect.size.width = CKSharedContactsCollectionViewCell;
  [(CGFloat *)(objc_super *)&rect.origin.y layoutSubviews];
  v3 = [(CKSharedAssetCollectionViewCell *)self previewView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(CKSharedContactsCollectionViewCell *)self avatarView];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  rect.origin.x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  CGFloat v14 = CGRectGetWidth(v20) * 0.5;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  CGFloat v15 = CGRectGetHeight(v21) * 0.5;
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  CGFloat v16 = CGRectGetWidth(v22) * 0.5;
  v23.origin.x = rect.origin.x;
  v23.origin.y = v13;
  v23.size.width = v14;
  v23.size.height = v15;
  CGFloat v17 = v16 - CGRectGetWidth(v23) * 0.5;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  CGFloat v18 = CGRectGetHeight(v24) * 0.5;
  v25.origin.x = v17;
  v25.origin.y = v13;
  v25.size.width = v14;
  v25.size.height = v15;
  objc_msgSend(v12, "setFrame:", v17, v18 - CGRectGetHeight(v25) * 0.5, v14, v15);
}

- (void)setAvatarView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end