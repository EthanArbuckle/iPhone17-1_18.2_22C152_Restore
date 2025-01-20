@interface CKSingleContactDetailsCell
+ (BOOL)shouldHighlight;
+ (id)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKSingleContactDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)chervonImageView;
- (UILabel)subTitleLabel;
- (UILabel)titleLabel;
- (void)initConstraints;
- (void)layoutSubviews;
- (void)setChervonImageView:(id)a3;
- (void)setSubTitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CKSingleContactDetailsCell

- (CKSingleContactDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v53.receiver = self;
  v53.super_class = (Class)CKSingleContactDetailsCell;
  v4 = [(CKDetailsCell *)&v53 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CKSingleContactDetailsCell *)v4 setSelectionStyle:0];
    id v6 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    [(CKSingleContactDetailsCell *)v5 setTitleLabel:v11];

    v12 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438A0] addingSymbolicTraits:0x8000 options:0];
    v13 = [(CKSingleContactDetailsCell *)v5 titleLabel];
    v14 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v12 size:0.0];
    [v13 setFont:v14];

    v15 = [(CKSingleContactDetailsCell *)v5 titleLabel];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(CKSingleContactDetailsCell *)v5 titleLabel];
    v17 = CKFrameworkBundle();
    v18 = [v17 localizedStringForKey:@"CONTACT_DETAILS_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v16 setText:v18];

    v19 = [(CKSingleContactDetailsCell *)v5 titleLabel];
    [v19 setContentMode:4];

    v20 = [(CKSingleContactDetailsCell *)v5 titleLabel];
    [v20 setNumberOfLines:0];

    v21 = [(CKSingleContactDetailsCell *)v5 titleLabel];
    [v21 setLineBreakMode:0];

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v7, v8, v9, v10);
    [(CKSingleContactDetailsCell *)v5 setSubTitleLabel:v22];

    v23 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438C8] addingSymbolicTraits:0x8000 options:0];
    v24 = [(CKSingleContactDetailsCell *)v5 subTitleLabel];
    v25 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v23 size:0.0];
    [v24 setFont:v25];

    v26 = [(CKSingleContactDetailsCell *)v5 subTitleLabel];
    v27 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v26 setTextColor:v27];

    v28 = [(CKSingleContactDetailsCell *)v5 subTitleLabel];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

    v29 = [(CKSingleContactDetailsCell *)v5 subTitleLabel];
    v30 = CKFrameworkBundle();
    v31 = [v30 localizedStringForKey:@"CONTACT_DETAILS_SUBTITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v29 setText:v31];

    v32 = [(CKSingleContactDetailsCell *)v5 subTitleLabel];
    [v32 setContentMode:4];

    v33 = [(CKSingleContactDetailsCell *)v5 subTitleLabel];
    [v33 setNumberOfLines:0];

    v34 = [(CKSingleContactDetailsCell *)v5 subTitleLabel];
    [v34 setLineBreakMode:0];

    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v7, v8, v9, v10);
    [(CKSingleContactDetailsCell *)v5 setChervonImageView:v35];

    v36 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    v37 = [v36 fontDescriptor];

    v38 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v37 size:0.0];
    v39 = [MEMORY[0x1E4F42A98] configurationWithFont:v38];
    v40 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.forward.circle" withConfiguration:v39];
    v41 = [(CKSingleContactDetailsCell *)v5 chervonImageView];
    [v41 setImage:v40];

    v42 = [(CKSingleContactDetailsCell *)v5 chervonImageView];
    [v42 setTranslatesAutoresizingMaskIntoConstraints:0];

    v43 = [(CKSingleContactDetailsCell *)v5 chervonImageView];
    v44 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
    [v43 setTintColor:v44];

    v45 = [(CKSingleContactDetailsCell *)v5 contentView];
    v46 = [(CKSingleContactDetailsCell *)v5 titleLabel];
    [v45 addSubview:v46];

    v47 = [(CKSingleContactDetailsCell *)v5 contentView];
    v48 = [(CKSingleContactDetailsCell *)v5 subTitleLabel];
    [v47 addSubview:v48];

    v49 = [(CKSingleContactDetailsCell *)v5 contentView];
    v50 = [(CKSingleContactDetailsCell *)v5 chervonImageView];
    [v49 addSubview:v50];

    v51 = [(CKSingleContactDetailsCell *)v5 contentView];
    [v51 setBackgroundColor:0];

    [(CKSingleContactDetailsCell *)v5 initConstraints];
  }
  return v5;
}

+ (id)reuseIdentifier
{
  return @"CKDetailSingleContactsCell";
}

+ (BOOL)shouldHighlight
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(CKSingleContactDetailsCell *)self titleLabel];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7 + 10.0 + 2.0;
  double v9 = [(CKSingleContactDetailsCell *)self subTitleLabel];
  objc_msgSend(v9, "sizeThatFits:", width, height);
  double v11 = v8 + v10 + 10.0;

  double v12 = width;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)initConstraints
{
  v37[6] = *MEMORY[0x1E4F143B8];
  v36 = [MEMORY[0x1E4F1CA48] array];
  v35 = [(CKSingleContactDetailsCell *)self titleLabel];
  v33 = [v35 leadingAnchor];
  v34 = [(CKSingleContactDetailsCell *)self contentView];
  v32 = [v34 layoutMarginsGuide];
  v31 = [v32 leadingAnchor];
  v30 = [v33 constraintEqualToAnchor:v31];
  v37[0] = v30;
  v29 = [(CKSingleContactDetailsCell *)self titleLabel];
  v27 = [v29 topAnchor];
  v28 = [(CKSingleContactDetailsCell *)self contentView];
  v26 = [v28 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:10.0];
  v37[1] = v25;
  v24 = [(CKSingleContactDetailsCell *)self subTitleLabel];
  v22 = [v24 leadingAnchor];
  v23 = [(CKSingleContactDetailsCell *)self titleLabel];
  v21 = [v23 leadingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v37[2] = v20;
  v19 = [(CKSingleContactDetailsCell *)self subTitleLabel];
  v17 = [v19 topAnchor];
  v18 = [(CKSingleContactDetailsCell *)self titleLabel];
  v16 = [v18 bottomAnchor];
  v15 = [v17 constraintEqualToAnchor:v16 constant:2.0];
  v37[3] = v15;
  v14 = [(CKSingleContactDetailsCell *)self chervonImageView];
  double v13 = [v14 centerYAnchor];
  v3 = [(CKSingleContactDetailsCell *)self contentView];
  v4 = [v3 centerYAnchor];
  v5 = [v13 constraintEqualToAnchor:v4];
  v37[4] = v5;
  id v6 = [(CKSingleContactDetailsCell *)self chervonImageView];
  double v7 = [v6 trailingAnchor];
  double v8 = [(CKSingleContactDetailsCell *)self contentView];
  double v9 = [v8 layoutMarginsGuide];
  double v10 = [v9 trailingAnchor];
  double v11 = [v7 constraintEqualToAnchor:v10];
  v37[5] = v11;
  double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];
  [v36 addObjectsFromArray:v12];

  [MEMORY[0x1E4F28DC8] activateConstraints:v36];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKSingleContactDetailsCell;
  [(CKDetailsCell *)&v5 layoutSubviews];
  v3 = [(CKDetailsCell *)self topSeperator];
  [v3 setHidden:1];

  v4 = [(CKDetailsCell *)self bottomSeperator];
  [v4 setHidden:1];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (void)setSubTitleLabel:(id)a3
{
}

- (UIImageView)chervonImageView
{
  return self->_chervonImageView;
}

- (void)setChervonImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chervonImageView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end