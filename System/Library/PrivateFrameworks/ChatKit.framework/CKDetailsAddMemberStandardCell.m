@interface CKDetailsAddMemberStandardCell
+ (double)preferredHeight;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKDetailsAddMemberStandardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)addIcon;
- (void)layoutSubviews;
- (void)setAddIcon:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation CKDetailsAddMemberStandardCell

+ (double)preferredHeight
{
  return 44.0;
}

- (CKDetailsAddMemberStandardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v36.receiver = self;
  v36.super_class = (Class)CKDetailsAddMemberStandardCell;
  v4 = [(CKDetailsAddMemberCell *)&v36 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKDetailsAddMemberStandardCell *)v4 setAddIcon:v6];

    v7 = [(CKDetailsAddMemberStandardCell *)v4 addIcon];
    [v7 setBackgroundColor:0];

    v8 = [(CKDetailsAddMemberStandardCell *)v4 addIcon];
    [v8 setContentMode:4];

    v9 = [(CKDetailsAddMemberStandardCell *)v4 addIcon];
    v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"plus"];
    v11 = (void *)MEMORY[0x1E4F42A98];
    v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    v13 = [v11 configurationWithFont:v12];
    v14 = [v10 imageWithConfiguration:v13];
    [v9 setImage:v14];

    v15 = [(CKDetailsAddMemberStandardCell *)v4 addIcon];
    v16 = +[CKUIBehavior sharedBehaviors];
    v17 = [v16 theme];
    v18 = [v17 detailsTextColor];
    [v15 setTintColor:v18];

    v19 = [(CKDetailsAddMemberStandardCell *)v4 addIcon];
    v20 = +[CKUIBehavior sharedBehaviors];
    [v20 detailsAddButtonDiameter];
    double v22 = v21;
    v23 = +[CKUIBehavior sharedBehaviors];
    [v23 detailsAddButtonDiameter];
    objc_msgSend(v19, "setBounds:", 0.0, 0.0, v22, v24);

    v25 = [(CKDetailsAddMemberStandardCell *)v4 addIcon];
    v26 = +[CKUIBehavior sharedBehaviors];
    v27 = [v26 theme];
    v28 = [v27 detailsAddButtonBackgroundColor];
    [v25 setBackgroundColor:v28];

    v29 = [(CKDetailsAddMemberStandardCell *)v4 addIcon];
    v30 = [v29 layer];
    v31 = +[CKUIBehavior sharedBehaviors];
    [v31 detailsAddButtonDiameter];
    [v30 setCornerRadius:v32 * 0.5];

    v33 = [(CKDetailsAddMemberStandardCell *)v4 contentView];
    v34 = [(CKDetailsAddMemberStandardCell *)v4 addIcon];
    [v33 addSubview:v34];
  }
  return v4;
}

- (void)layoutSubviews
{
  v75.receiver = self;
  v75.super_class = (Class)CKDetailsAddMemberStandardCell;
  [(CKDetailsCell *)&v75 layoutSubviews];
  v3 = [(CKDetailsAddMemberStandardCell *)self contentView];
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  v9 = [(CKDetailsAddMemberStandardCell *)self addIcon];
  [v9 sizeToFit];

  v10 = [(CKDetailsAddMemberStandardCell *)self addIcon];
  [v10 frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 detailsAddButtonDiameter];
  double v17 = v16;

  v18 = +[CKUIBehavior sharedBehaviors];
  [v18 detailsAddButtonDiameter];
  double v20 = v19;

  double v21 = +[CKUIBehavior sharedBehaviors];
  [v21 detailsContactAvatarLabelSpacing];
  double v23 = v22;

  if (v8)
  {
    double v24 = [(CKDetailsAddMemberStandardCell *)self contentView];
    [v24 bounds];
    double v26 = v25 - v7;
    v76.origin.x = v12;
    v76.origin.y = v14;
    v76.size.width = v20;
    v76.size.height = v17;
    double v27 = v26 - CGRectGetWidth(v76);
    [(CKDetailsAddMemberStandardCell *)self bounds];
    double v29 = v28;
    v77.origin.x = v12;
    v77.origin.y = v14;
    v77.size.width = v20;
    v77.size.height = v17;
    double v30 = (v29 - CGRectGetHeight(v77)) * 0.5;
    if (CKMainScreenScale_once_7 != -1) {
      dispatch_once(&CKMainScreenScale_once_7, &__block_literal_global_12);
    }
    double v31 = *(double *)&CKMainScreenScale_sMainScreenScale_7;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_7 == 0.0) {
      double v31 = 1.0;
    }
    double v32 = floor(v27 * v31) / v31;
    double v33 = floor(v30 * v31) / v31;
  }
  else
  {
    double v34 = v5 + 0.0;
    [(CKDetailsAddMemberStandardCell *)self bounds];
    double v36 = v35;
    v78.origin.x = v12;
    v78.origin.y = v14;
    v78.size.width = v20;
    v78.size.height = v17;
    double v37 = (v36 - CGRectGetHeight(v78)) * 0.5;
    if (CKMainScreenScale_once_7 != -1) {
      dispatch_once(&CKMainScreenScale_once_7, &__block_literal_global_12);
    }
    double v38 = *(double *)&CKMainScreenScale_sMainScreenScale_7;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_7 == 0.0) {
      double v38 = 1.0;
    }
    double v32 = floor(v34 * v38) / v38;
    double v33 = floor(v37 * v38) / v38;
  }
  v39 = [(CKDetailsAddMemberStandardCell *)self addIcon];
  objc_msgSend(v39, "setFrame:", v32, v33, v20, v17);

  v40 = [(CKDetailsAddMemberStandardCell *)self contentView];
  [v40 bounds];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;

  double v47 = v32;
  double v48 = v33;
  double v49 = v20;
  double v50 = v17;
  if (v8)
  {
    double v51 = CGRectGetMinX(*(CGRect *)&v47) - v23;
  }
  else
  {
    double v42 = v23 + CGRectGetMaxX(*(CGRect *)&v47);
    v52 = [(CKDetailsAddMemberStandardCell *)self contentView];
    [v52 bounds];
    double v51 = v53 - v42;
  }
  v54 = [(CKDetailsAddMemberCell *)self addLabel];
  objc_msgSend(v54, "setFrame:", v42, v44, v51, v46);

  v55 = [(CKDetailsCell *)self topSeperator];
  [v55 frame];
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;

  v62 = [(CKDetailsAddMemberStandardCell *)self contentView];
  [v62 layoutMargins];
  double v64 = v63;
  v65 = +[CKUIBehavior sharedBehaviors];
  [v65 detailsContactAvatarLabelSpacing];
  double v67 = v64 + v66;
  v68 = +[CKUIBehavior sharedBehaviors];
  [v68 detailsViewContactImageDiameter];
  double v70 = v67 + v69;

  double v71 = v70;
  if (v8)
  {
    v72 = [(CKDetailsAddMemberStandardCell *)self contentView];
    [v72 layoutMargins];
    double v71 = v73;
  }
  v74 = [(CKDetailsCell *)self topSeperator];
  objc_msgSend(v74, "setFrame:", v71, v57, v59 - v70, v61);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKDetailsAddMemberStandardCell;
  -[CKDetailsAddMemberCell setEnabled:](&v14, sel_setEnabled_);
  double v5 = [(CKDetailsAddMemberStandardCell *)self addIcon];
  double v6 = [MEMORY[0x1E4F42A80] systemImageNamed:@"plus"];
  double v7 = +[CKUIBehavior sharedBehaviors];
  uint64_t v8 = [v7 theme];
  v9 = v8;
  if (v3)
  {
    v10 = [v8 detailsTextColor];
    double v11 = [v6 _flatImageWithColor:v10];
    [v5 setImage:v11];
  }
  else
  {
    CGFloat v12 = [v8 lightGrayColor];
    double v13 = [v6 _flatImageWithColor:v12];
    [v5 setImage:v13];

    double v5 = [(CKDetailsAddMemberStandardCell *)self addIcon];
    double v6 = +[CKUIBehavior sharedBehaviors];
    double v7 = [v6 theme];
    v9 = [v7 lightGrayColor];
    [v5 setTintColor:v9];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = objc_alloc(+[CKDetailsContactsTableViewCell cellClass]);
  double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_msgSend(v5, "sizeThatFits:", width, 3.40282347e38);
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (UIImageView)addIcon
{
  return self->_addIcon;
}

- (void)setAddIcon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end