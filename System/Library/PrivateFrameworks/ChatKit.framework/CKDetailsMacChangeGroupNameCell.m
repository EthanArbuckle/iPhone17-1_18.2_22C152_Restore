@interface CKDetailsMacChangeGroupNameCell
+ (id)identifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKDetailsMacChangeGroupNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)cellGlpyh;
- (UILabel)changeNameLabel;
- (void)layoutSubviews;
- (void)setCellGlpyh:(id)a3;
- (void)setChangeNameLabel:(id)a3;
@end

@implementation CKDetailsMacChangeGroupNameCell

+ (id)identifier
{
  return @"mac_change_groupName";
}

- (CKDetailsMacChangeGroupNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v49.receiver = self;
  v49.super_class = (Class)CKDetailsMacChangeGroupNameCell;
  v4 = [(CKDetailsCell *)&v49 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    [(CKDetailsMacChangeGroupNameCell *)v4 setChangeNameLabel:v10];

    v11 = [(CKDetailsMacChangeGroupNameCell *)v4 changeNameLabel];
    v12 = CKFrameworkBundle();
    v13 = [v12 localizedStringForKey:@"CHANGE_GROUP_NAME_AND_PHOTO" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v11 setText:v13];

    LODWORD(v12) = CKIsRunningInMacCatalyst();
    v14 = [(CKDetailsMacChangeGroupNameCell *)v4 changeNameLabel];
    if (v12)
    {
      v15 = [(CKDetailsMacChangeGroupNameCell *)v4 tintColor];
      [v14 setTextColor:v15];
    }
    else
    {
      v15 = +[CKUIBehavior sharedBehaviors];
      v16 = [v15 theme];
      v17 = [v16 appTintColor];
      [v14 setTextColor:v17];
    }
    v18 = [(CKDetailsMacChangeGroupNameCell *)v4 changeNameLabel];
    [v18 setEnabled:1];

    v19 = [(CKDetailsMacChangeGroupNameCell *)v4 changeNameLabel];
    [v19 sizeToFit];

    v20 = [(CKDetailsMacChangeGroupNameCell *)v4 contentView];
    v21 = [(CKDetailsMacChangeGroupNameCell *)v4 changeNameLabel];
    [v20 addSubview:v21];

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v6, v7, v8, v9);
    [(CKDetailsMacChangeGroupNameCell *)v4 setCellGlpyh:v22];

    v23 = [(CKDetailsMacChangeGroupNameCell *)v4 cellGlpyh];
    [v23 setBackgroundColor:0];

    v24 = [(CKDetailsMacChangeGroupNameCell *)v4 cellGlpyh];
    [v24 setContentMode:4];

    v25 = [(CKDetailsMacChangeGroupNameCell *)v4 cellGlpyh];
    v26 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.2.fill"];
    v27 = (void *)MEMORY[0x1E4F42A98];
    v28 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    v29 = [v27 configurationWithFont:v28];
    v30 = [v26 imageWithConfiguration:v29];
    [v25 setImage:v30];

    v31 = [(CKDetailsMacChangeGroupNameCell *)v4 cellGlpyh];
    v32 = [(CKDetailsMacChangeGroupNameCell *)v4 tintColor];
    [v31 setTintColor:v32];

    v33 = [(CKDetailsMacChangeGroupNameCell *)v4 cellGlpyh];
    v34 = +[CKUIBehavior sharedBehaviors];
    [v34 transcriptDrawerContactImageDiameter];
    double v36 = v35;
    v37 = +[CKUIBehavior sharedBehaviors];
    [v37 transcriptDrawerContactImageDiameter];
    objc_msgSend(v33, "setBounds:", 0.0, 0.0, v36, v38);

    v39 = [(CKDetailsMacChangeGroupNameCell *)v4 cellGlpyh];
    v40 = [MEMORY[0x1E4F428B8] quaternaryLabelColor];
    [v39 setBackgroundColor:v40];

    v41 = [(CKDetailsMacChangeGroupNameCell *)v4 cellGlpyh];
    v42 = [v41 layer];
    v43 = +[CKUIBehavior sharedBehaviors];
    [v43 transcriptDrawerContactImageDiameter];
    [v42 setCornerRadius:v44 * 0.5];

    v45 = [(CKDetailsMacChangeGroupNameCell *)v4 contentView];
    v46 = [(CKDetailsMacChangeGroupNameCell *)v4 cellGlpyh];
    [v45 addSubview:v46];

    v47 = [(CKDetailsMacChangeGroupNameCell *)v4 contentView];
    [v47 setBackgroundColor:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)CKDetailsMacChangeGroupNameCell;
  [(CKDetailsCell *)&v48 layoutSubviews];
  uint64_t v3 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  v4 = [(CKDetailsMacChangeGroupNameCell *)self contentView];
  [v4 layoutMargins];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(CKDetailsMacChangeGroupNameCell *)self cellGlpyh];
  [v9 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v15 = v14;
  double v17 = v16;

  if (v3)
  {
    v18 = [(CKDetailsMacChangeGroupNameCell *)self contentView];
    [v18 bounds];
    double v20 = v19 - v8;
    v49.origin.x = v11;
    v49.origin.y = v13;
    v49.size.width = v15;
    v49.size.height = v17;
    double v21 = v20 - CGRectGetWidth(v49);
    [(CKDetailsMacChangeGroupNameCell *)self bounds];
    double v23 = v22;
    v50.origin.x = v11;
    v50.origin.y = v13;
    v50.size.width = v15;
    v50.size.height = v17;
    double v24 = (v23 - CGRectGetHeight(v50)) * 0.5;
    if (CKMainScreenScale_once_103 != -1) {
      dispatch_once(&CKMainScreenScale_once_103, &__block_literal_global_273);
    }
    double v25 = *(double *)&CKMainScreenScale_sMainScreenScale_103;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_103 == 0.0) {
      double v25 = 1.0;
    }
    double v26 = floor(v21 * v25) / v25;
    double v27 = floor(v24 * v25) / v25;
  }
  else
  {
    [(CKDetailsMacChangeGroupNameCell *)self bounds];
    double v29 = v28;
    v51.origin.x = v11;
    v51.origin.y = v13;
    v51.size.width = v15;
    v51.size.height = v17;
    double v30 = (v29 - CGRectGetHeight(v51)) * 0.5 + 6.0;
    if (CKMainScreenScale_once_103 != -1) {
      dispatch_once(&CKMainScreenScale_once_103, &__block_literal_global_273);
    }
    double v31 = *(double *)&CKMainScreenScale_sMainScreenScale_103;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_103 == 0.0) {
      double v31 = 1.0;
    }
    double v26 = floor(v6 * v31) / v31;
    double v27 = floor(v30 * v31) / v31;
  }
  v32 = [(CKDetailsMacChangeGroupNameCell *)self cellGlpyh];
  objc_msgSend(v32, "setFrame:", v26, v27, v15, v17);

  v33 = [(CKDetailsMacChangeGroupNameCell *)self contentView];
  [v33 bounds];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  double v40 = v26;
  double v41 = v27;
  double v42 = v15;
  double v43 = v17;
  if (v3)
  {
    double v44 = CGRectGetMinX(*(CGRect *)&v40) + -10.0;
  }
  else
  {
    double v35 = CGRectGetMaxX(*(CGRect *)&v40) + 10.0;
    double v37 = v37 + 6.0;
    v45 = [(CKDetailsMacChangeGroupNameCell *)self contentView];
    [v45 bounds];
    double v44 = v46 - v35;
  }
  v47 = [(CKDetailsMacChangeGroupNameCell *)self changeNameLabel];
  objc_msgSend(v47, "setFrame:", v35, v37, v44, v39);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (CKIsRunningInMacCatalyst())
  {
    double v6 = 60.0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKDetailsMacChangeGroupNameCell;
    -[CKDetailsMacChangeGroupNameCell sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
    double width = v7;
  }
  double v8 = width;
  result.double height = v6;
  result.double width = v8;
  return result;
}

- (UIImageView)cellGlpyh
{
  return self->_cellGlpyh;
}

- (void)setCellGlpyh:(id)a3
{
}

- (UILabel)changeNameLabel
{
  return self->_changeNameLabel;
}

- (void)setChangeNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNameLabel, 0);

  objc_storeStrong((id *)&self->_cellGlpyh, 0);
}

@end