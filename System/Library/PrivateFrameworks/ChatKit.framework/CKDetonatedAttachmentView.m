@interface CKDetonatedAttachmentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKDetonatedAttachmentView)initWithFrame:(CGRect)a3;
- (UIImageView)iconImageView;
- (UILabel)titleLabel;
- (void)layoutSubviews;
@end

@implementation CKDetonatedAttachmentView

- (CKDetonatedAttachmentView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)CKDetonatedAttachmentView;
  v3 = -[CKDetonatedAttachmentView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = (UIImageView *)v9;

    v11 = +[CKUIBehavior sharedBehaviors];
    v12 = [v11 genericDocumentIcon];
    [(UIImageView *)v3->_iconImageView setImage:v12];

    v13 = [(UIImageView *)v3->_iconImageView image];

    if (!v13)
    {
      v14 = IMLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CKDetonatedAttachmentView initWithFrame:](v14);
      }
    }
    v15 = [(UIImageView *)v3->_iconImageView layer];
    [v15 setBorderColor:0];
    [v15 setBorderWidth:0.0];
    [v15 setCornerRadius:0.0];
    [(CKDetonatedAttachmentView *)v3 addSubview:v3->_iconImageView];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v16;

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setOpaque:0];
    v18 = v3->_titleLabel;
    v19 = +[CKUIBehavior sharedBehaviors];
    v20 = [v19 attachmentTextFont];
    [(UILabel *)v18 setFont:v20];

    v21 = v3->_titleLabel;
    v22 = +[CKUIBehavior sharedBehaviors];
    v23 = [v22 theme];
    v24 = [v23 attachmentBalloonTitleTextColor];
    [(UILabel *)v21 setTextColor:v24];

    v25 = v3->_titleLabel;
    v26 = IMSharedUtilitiesFrameworkBundle();
    v27 = [v26 localizedStringForKey:@"LOCKDOWN_ATTACHMENT_BALLOON_ONE_ATTACHMENT" value:&stru_1EDE4CA38 table:@"IMSharedUtilities-Offramp"];
    [(UILabel *)v25 setText:v27];

    [(CKDetonatedAttachmentView *)v3 addSubview:v3->_titleLabel];
    [(CKDetonatedAttachmentView *)v3 setUserInteractionEnabled:0];
    [(CKDetonatedAttachmentView *)v3 setOpaque:0];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 detonatedItemBalloonViewSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)CKDetonatedAttachmentView;
  [(CKDetonatedAttachmentView *)&v35 layoutSubviews];
  [(CKDetonatedAttachmentView *)self bounds];
  double v4 = v3;
  double v34 = v5;
  double v7 = v6;
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, v8);
  double v11 = v10;
  double v13 = v12;
  if (CKMainScreenScale_once_32 != -1) {
    dispatch_once(&CKMainScreenScale_once_32, &__block_literal_global_77);
  }
  double v14 = *(double *)&CKMainScreenScale_sMainScreenScale_32;
  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 detonatedItemDocumentIconSize];
  double v17 = v16;
  double v19 = v18;

  if (CKMainScreenScale_once_32 != -1) {
    dispatch_once(&CKMainScreenScale_once_32, &__block_literal_global_77);
  }
  if (v14 == 0.0) {
    double v20 = 1.0;
  }
  else {
    double v20 = v14;
  }
  double v32 = v13 * v20 * (1.0 / v20);
  double v21 = v11 * v20;
  double v22 = v11 * v20 * (1.0 / v20);
  double v23 = 1.0 / v20 * (v4 * v20 + floor((v7 * v20 - v21) * 0.5));
  double v24 = *(double *)&CKMainScreenScale_sMainScreenScale_32;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_32 == 0.0) {
    double v24 = 1.0;
  }
  double v25 = v17 * v24;
  CGFloat v26 = 1.0 / v24 * (v4 * v24 + floor((v7 * v24 - v17 * v24) * 0.5));
  double v27 = 1.0 / v24 * (v34 * v24 + floor((v9 * v24 - v19 * v24) * 0.5));
  CGFloat v28 = v25 * (1.0 / v24);
  CGFloat v29 = v19 * v24 * (1.0 / v24);
  [(UILabel *)self->_titleLabel frame];
  CGFloat v31 = v27 - v30 * 0.5;
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v26, v31, v28, v29);
  v36.origin.x = v26;
  v36.origin.y = v31;
  v36.size.width = v28;
  v36.size.height = v29;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v23, CGRectGetMaxY(v36), v22, v33);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

- (void)initWithFrame:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "genericDocumentIcon is Nil", v1, 2u);
}

@end