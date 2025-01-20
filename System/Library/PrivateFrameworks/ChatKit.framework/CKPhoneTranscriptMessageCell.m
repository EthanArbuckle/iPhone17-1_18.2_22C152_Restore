@interface CKPhoneTranscriptMessageCell
- (CKAvatarView)avatarView;
- (UIImageView)printableAvatarView;
- (id)contactImageView;
- (void)dealloc;
- (void)layoutSubviewsForContents;
- (void)setAvatarView:(id)a3;
- (void)setPrintableAvatarView:(id)a3;
- (void)setShowAvatarView:(BOOL)a3 withContact:(id)a4 preferredHandle:(id)a5 avatarViewDelegate:(id)a6;
@end

@implementation CKPhoneTranscriptMessageCell

- (void)dealloc
{
  [(CNAvatarView *)self->_avatarView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CKPhoneTranscriptMessageCell;
  [(CKPhoneTranscriptMessageCell *)&v3 dealloc];
}

- (id)contactImageView
{
  objc_super v3 = +[CKPrintController sharedInstance];
  int v4 = [v3 isPrinting];

  if (v4) {
    [(CKPhoneTranscriptMessageCell *)self printableAvatarView];
  }
  else {
  v5 = [(CKPhoneTranscriptMessageCell *)self avatarView];
  }

  return v5;
}

- (void)layoutSubviewsForContents
{
  v9.receiver = self;
  v9.super_class = (Class)CKPhoneTranscriptMessageCell;
  [(CKTranscriptMessageCell *)&v9 layoutSubviewsForContents];
  uint64_t v3 = [(CKPhoneTranscriptMessageCell *)self contactImageView];
  if (v3)
  {
    int v4 = (void *)v3;
    v5 = [(CKPhoneTranscriptMessageCell *)self contactImageView];
    v6 = [v5 superview];

    if (!v6)
    {
      v7 = [(CKEditableCollectionViewCell *)self contentView];
      v8 = [(CKPhoneTranscriptMessageCell *)self contactImageView];
      [v7 addSubview:v8];
    }
  }
}

- (void)setShowAvatarView:(BOOL)a3 withContact:(id)a4 preferredHandle:(id)a5 avatarViewDelegate:(id)a6
{
  BOOL v8 = a3;
  id v30 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = +[CKPrintController sharedInstance];
  int v13 = [v12 isPrinting];

  if (v13)
  {
    v14 = [(CKPhoneTranscriptMessageCell *)self printableAvatarView];
    v15 = +[CKUIBehavior sharedBehaviors];
    [v15 transcriptContactImageDiameter];
    double v17 = v16;

    if (v8)
    {
      if (!v14)
      {
        v14 = (CKAvatarView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
        -[CKAvatarView setFrame:](v14, "setFrame:", 0.0, 0.0, v17, v17);
        [(CKPhoneTranscriptMessageCell *)self setPrintableAvatarView:v14];
      }
      v18 = v14;
      uint64_t v19 = 0;
    }
    else
    {
      v18 = v14;
      uint64_t v19 = 1;
    }
    [(CKAvatarView *)v18 setHidden:v19];
    v25 = +[CKPrintController sharedInstance];
    v26 = [v25 avatarImageForContact:v30 diameter:v17];

    [(CKAvatarView *)v14 setImage:v26];
  }
  else
  {
    v20 = [(CKPhoneTranscriptMessageCell *)self avatarView];
    v14 = v20;
    if (v8)
    {
      if (!v20)
      {
        v21 = +[CKUIBehavior sharedBehaviors];
        [v21 transcriptContactImageDiameter];
        double v23 = v22;

        v14 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", 0.0, 0.0, v23, v23);
        [(CNAvatarView *)v14 setShowsContactOnTap:0];
        [(CKAvatarView *)v14 setPreferredHandle:v10];
        [(CNAvatarView *)v14 setForcePressView:v14];
        [(CKPhoneTranscriptMessageCell *)self setAvatarView:v14];
        [(CKPhoneTranscriptMessageCell *)self setNeedsLayout];
      }
      v20 = v14;
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v24 = 1;
    }
    [(CKAvatarView *)v20 setHidden:v24];
    v26 = [(CNAvatarView *)v14 contact];
    if (v30)
    {
      if (!v26
        || ([v30 identifier],
            v27 = objc_claimAutoreleasedReturnValue(),
            [v26 identifier],
            v28 = objc_claimAutoreleasedReturnValue(),
            char v29 = [v27 isEqualToString:v28],
            v28,
            v27,
            (v29 & 1) == 0))
      {
        [(CNAvatarView *)v14 setContact:v30];
      }
    }
    [(CNAvatarView *)v14 setDelegate:v11];
  }
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (UIImageView)printableAvatarView
{
  return self->_printableAvatarView;
}

- (void)setPrintableAvatarView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printableAvatarView, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end