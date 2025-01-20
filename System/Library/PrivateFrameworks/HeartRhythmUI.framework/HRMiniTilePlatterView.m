@interface HRMiniTilePlatterView
- (HKSeparatorLineView)separatorView;
- (HRMiniTilePlatterView)initWithtitle:(id)a3 body:(id)a4 footnote:(id)a5 icon:(id)a6 actionText:(id)a7;
- (NSString)actionText;
- (NSString)body;
- (NSString)footnote;
- (NSString)title;
- (UIImage)icon;
- (UIImageView)iconImageView;
- (UILabel)actionLabel;
- (UILabel)bodyLabel;
- (UILabel)footnoteLabel;
- (UILabel)titleLabel;
- (double)_bodyBottomToFootnoteTop;
- (double)_titleBottomToBodyTop;
- (id)_actionFont;
- (id)_actionTextStyle;
- (id)_bodyFont;
- (id)_bodyFontTextStyle;
- (id)_footnoteFont;
- (id)_footnoteTextStyle;
- (id)_titleFont;
- (id)_titleFontTextStyle;
- (void)_setupConstraints;
- (void)_setupView;
- (void)setActionLabel:(id)a3;
- (void)setActionText:(id)a3;
- (void)setBody:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation HRMiniTilePlatterView

- (HRMiniTilePlatterView)initWithtitle:(id)a3 body:(id)a4 footnote:(id)a5 icon:(id)a6 actionText:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HRMiniTilePlatterView;
  v17 = -[HRMiniTilePlatterView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_body, a4);
    objc_storeStrong((id *)&v18->_footnote, a5);
    objc_storeStrong((id *)&v18->_icon, a6);
    objc_storeStrong((id *)&v18->_actionText, a7);
    [(HRMiniTilePlatterView *)v18 _setupView];
    [(HRMiniTilePlatterView *)v18 _setupConstraints];
  }

  return v18;
}

- (void)_setupView
{
  [(HRMiniTilePlatterView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [MEMORY[0x263F1C550] systemGroupedBackgroundColor];
  [(HRMiniTilePlatterView *)self setBackgroundColor:v3];

  [(UIView *)self hrui_maskAllCornersWithRadius:*MEMORY[0x263F463A8]];
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  v10 = [(HRMiniTilePlatterView *)self icon];
  [v9 setImage:v10];

  [v9 setContentMode:4];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HRMiniTilePlatterView *)self setIconImageView:v9];

  v11 = [(HRMiniTilePlatterView *)self iconImageView];
  [(HRMiniTilePlatterView *)self addSubview:v11];

  v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v5, v6, v7, v8);
  id v13 = [(HRMiniTilePlatterView *)self title];
  [v12 setText:v13];

  id v14 = [(HRMiniTilePlatterView *)self _titleFont];
  [v12 setFont:v14];

  [v12 setAdjustsFontForContentSizeCategory:1];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 setNumberOfLines:0];
  [(HRMiniTilePlatterView *)self setTitleLabel:v12];

  id v15 = [(HRMiniTilePlatterView *)self titleLabel];
  [(HRMiniTilePlatterView *)self addSubview:v15];

  id v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v5, v6, v7, v8);
  v17 = [(HRMiniTilePlatterView *)self body];
  [v16 setText:v17];

  v18 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v16 setTextColor:v18];

  v19 = [(HRMiniTilePlatterView *)self _bodyFont];
  [v16 setFont:v19];

  [v16 setAdjustsFontForContentSizeCategory:1];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setNumberOfLines:0];
  [(HRMiniTilePlatterView *)self setBodyLabel:v16];

  id v20 = [(HRMiniTilePlatterView *)self bodyLabel];
  [(HRMiniTilePlatterView *)self addSubview:v20];

  objc_super v21 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v5, v6, v7, v8);
  v22 = [(HRMiniTilePlatterView *)self footnote];
  [v21 setText:v22];

  v23 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v21 setTextColor:v23];

  v24 = [(HRMiniTilePlatterView *)self _footnoteFont];
  [v21 setFont:v24];

  [v21 setAdjustsFontForContentSizeCategory:1];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v21 setNumberOfLines:0];
  [(HRMiniTilePlatterView *)self setFootnoteLabel:v21];

  v25 = [(HRMiniTilePlatterView *)self footnoteLabel];
  [(HRMiniTilePlatterView *)self addSubview:v25];

  v26 = objc_msgSend(objc_alloc(MEMORY[0x263F46968]), "initWithFrame:", v5, v6, v7, v8);
  v27 = [MEMORY[0x263F1C550] separatorColor];
  [v26 setColor:v27];

  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HRMiniTilePlatterView *)self setSeparatorView:v26];

  v28 = [(HRMiniTilePlatterView *)self separatorView];
  [(HRMiniTilePlatterView *)self addSubview:v28];

  v29 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v5, v6, v7, v8);
  v30 = [(HRMiniTilePlatterView *)self actionText];
  [v29 setText:v30];

  v31 = objc_msgSend(MEMORY[0x263F1C550], "hk_appKeyColor");
  [v29 setTextColor:v31];

  v32 = [(HRMiniTilePlatterView *)self _actionFont];
  [v29 setFont:v32];

  [v29 setAdjustsFontForContentSizeCategory:1];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v29 setNumberOfLines:0];
  [(HRMiniTilePlatterView *)self setActionLabel:v29];

  id v33 = [(HRMiniTilePlatterView *)self actionLabel];
  [(HRMiniTilePlatterView *)self addSubview:v33];
}

- (void)_setupConstraints
{
  v3 = [(HRMiniTilePlatterView *)self iconImageView];
  id v4 = [v3 widthAnchor];
  double v5 = [v4 constraintEqualToConstant:45.0];
  [v5 setActive:1];

  double v6 = [(HRMiniTilePlatterView *)self iconImageView];
  double v7 = [v6 heightAnchor];
  double v8 = [v7 constraintEqualToConstant:45.0];
  [v8 setActive:1];

  v9 = [(HRMiniTilePlatterView *)self iconImageView];
  v10 = [v9 topAnchor];
  v11 = [(HRMiniTilePlatterView *)self topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:12.0];
  [v12 setActive:1];

  id v13 = [(HRMiniTilePlatterView *)self iconImageView];
  id v14 = [v13 leadingAnchor];
  id v15 = [(HRMiniTilePlatterView *)self leadingAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15 constant:14.0];
  [v16 setActive:1];

  v17 = [(HRMiniTilePlatterView *)self titleLabel];
  v18 = [v17 topAnchor];
  v19 = [(HRMiniTilePlatterView *)self iconImageView];
  id v20 = [v19 topAnchor];
  objc_super v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [(HRMiniTilePlatterView *)self titleLabel];
  v23 = [v22 leadingAnchor];
  v24 = [(HRMiniTilePlatterView *)self iconImageView];
  v25 = [v24 trailingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25 constant:11.0];
  [v26 setActive:1];

  v27 = [(HRMiniTilePlatterView *)self titleLabel];
  v28 = [v27 trailingAnchor];
  v29 = [(HRMiniTilePlatterView *)self trailingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:-14.0];
  [v30 setActive:1];

  v31 = [(HRMiniTilePlatterView *)self bodyLabel];
  v32 = [v31 topAnchor];
  id v33 = [(HRMiniTilePlatterView *)self titleLabel];
  v34 = [v33 bottomAnchor];
  [(HRMiniTilePlatterView *)self _titleBottomToBodyTop];
  v35 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34);
  [v35 setActive:1];

  v36 = [(HRMiniTilePlatterView *)self bodyLabel];
  v37 = [(HRMiniTilePlatterView *)self titleLabel];
  objc_msgSend(v36, "hk_alignHorizontalConstraintsWithView:margin:", v37, 0.0);

  v38 = [(HRMiniTilePlatterView *)self footnoteLabel];
  v39 = [v38 topAnchor];
  v40 = [(HRMiniTilePlatterView *)self bodyLabel];
  v41 = [v40 bottomAnchor];
  [(HRMiniTilePlatterView *)self _bodyBottomToFootnoteTop];
  v42 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41);
  [v42 setActive:1];

  v43 = [(HRMiniTilePlatterView *)self footnoteLabel];
  v44 = [(HRMiniTilePlatterView *)self bodyLabel];
  objc_msgSend(v43, "hk_alignHorizontalConstraintsWithView:margin:", v44, 0.0);

  v45 = [(HRMiniTilePlatterView *)self separatorView];
  v46 = [v45 topAnchor];
  v47 = [(HRMiniTilePlatterView *)self footnoteLabel];
  v48 = [v47 bottomAnchor];
  v49 = [v46 constraintEqualToAnchor:v48 constant:12.0];
  [v49 setActive:1];

  v50 = [(HRMiniTilePlatterView *)self separatorView];
  v51 = [v50 heightAnchor];
  v52 = [(HRMiniTilePlatterView *)self separatorView];
  [v52 separatorThickness];
  v53 = objc_msgSend(v51, "constraintEqualToConstant:");
  [v53 setActive:1];

  v54 = [(HRMiniTilePlatterView *)self separatorView];
  v55 = [v54 leadingAnchor];
  v56 = [(HRMiniTilePlatterView *)self footnoteLabel];
  v57 = [v56 leadingAnchor];
  v58 = [v55 constraintEqualToAnchor:v57];
  [v58 setActive:1];

  v59 = [(HRMiniTilePlatterView *)self separatorView];
  v60 = [v59 trailingAnchor];
  v61 = [(HRMiniTilePlatterView *)self trailingAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  [v62 setActive:1];

  v63 = [(HRMiniTilePlatterView *)self actionLabel];
  v64 = [v63 topAnchor];
  v65 = [(HRMiniTilePlatterView *)self separatorView];
  v66 = [v65 bottomAnchor];
  v67 = [v64 constraintEqualToAnchor:v66 constant:12.0];
  [v67 setActive:1];

  v68 = [(HRMiniTilePlatterView *)self actionLabel];
  v69 = [v68 bottomAnchor];
  v70 = [(HRMiniTilePlatterView *)self bottomAnchor];
  v71 = [v69 constraintEqualToAnchor:v70 constant:-12.0];
  [v71 setActive:1];

  id v73 = [(HRMiniTilePlatterView *)self actionLabel];
  v72 = [(HRMiniTilePlatterView *)self footnoteLabel];
  objc_msgSend(v73, "hk_alignHorizontalConstraintsWithView:margin:", v72, 0.0);
}

- (id)_titleFontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_titleFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  v3 = [(HRMiniTilePlatterView *)self _titleFontTextStyle];
  id v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

- (id)_bodyFontTextStyle
{
  return (id)*MEMORY[0x263F1D2C0];
}

- (id)_bodyFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  v3 = [(HRMiniTilePlatterView *)self _bodyFontTextStyle];
  id v4 = [v2 preferredFontForTextStyle:v3];

  return v4;
}

- (id)_footnoteTextStyle
{
  return (id)*MEMORY[0x263F1D280];
}

- (id)_footnoteFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  v3 = [(HRMiniTilePlatterView *)self _footnoteTextStyle];
  id v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

- (id)_actionTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

- (id)_actionFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  v3 = [(HRMiniTilePlatterView *)self _actionTextStyle];
  id v4 = objc_msgSend(v2, "hk_scalableFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

- (double)_titleBottomToBodyTop
{
  v2 = [(HRMiniTilePlatterView *)self _bodyFont];
  [v2 _scaledValueForValue:4.0];
  double v4 = v3;

  return v4;
}

- (double)_bodyBottomToFootnoteTop
{
  v2 = [(HRMiniTilePlatterView *)self _bodyFont];
  [v2 _scaledValueForValue:6.0];
  double v4 = v3;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)actionText
{
  return self->_actionText;
}

- (void)setActionText:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (UILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (HKSeparatorLineView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UILabel)actionLabel
{
  return self->_actionLabel;
}

- (void)setActionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_actionText, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end