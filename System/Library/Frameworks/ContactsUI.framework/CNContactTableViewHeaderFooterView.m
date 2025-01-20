@interface CNContactTableViewHeaderFooterView
- (CNContactTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (NSAttributedString)attributedString;
- (UILabel)titleLabel;
- (void)setAttributedString:(id)a3;
@end

@implementation CNContactTableViewHeaderFooterView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  v7 = (NSAttributedString *)a3;
  if (self->_attributedString != v7)
  {
    objc_storeStrong((id *)&self->_attributedString, a3);
    v5 = [(CNContactTableViewHeaderFooterView *)self titleLabel];
    [v5 setAttributedText:v7];

    v6 = [(CNContactTableViewHeaderFooterView *)self titleLabel];
    [v6 sizeToFit];

    [(CNContactTableViewHeaderFooterView *)self invalidateIntrinsicContentSize];
  }
}

- (CNContactTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v36[4] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)CNContactTableViewHeaderFooterView;
  v3 = [(CNContactTableViewHeaderFooterView *)&v35 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    [(UILabel *)v3->_titleLabel setTextAlignment:0];
    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v7) = 1148846080;
    [(UILabel *)v3->_titleLabel setContentCompressionResistancePriority:1 forAxis:v7];
    v8 = [(CNContactTableViewHeaderFooterView *)v3 contentView];
    [v8 addSubview:v3->_titleLabel];

    v34 = [(CNContactTableViewHeaderFooterView *)v3 contentView];
    v32 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v33 = [(CNContactTableViewHeaderFooterView *)v3 contentView];
    v31 = [v33 layoutMarginsGuide];
    v30 = [v31 leadingAnchor];
    v29 = [v32 constraintEqualToAnchor:v30];
    v36[0] = v29;
    v27 = [(UILabel *)v3->_titleLabel topAnchor];
    v28 = [(CNContactTableViewHeaderFooterView *)v3 contentView];
    v26 = [v28 layoutMarginsGuide];
    v25 = [v26 topAnchor];
    v24 = [v27 constraintEqualToAnchor:v25];
    v36[1] = v24;
    v22 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v23 = [(CNContactTableViewHeaderFooterView *)v3 contentView];
    v21 = [v23 layoutMarginsGuide];
    v9 = [v21 trailingAnchor];
    v10 = [v22 constraintEqualToAnchor:v9];
    v36[2] = v10;
    v11 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v12 = [(CNContactTableViewHeaderFooterView *)v3 contentView];
    v13 = [v12 layoutMarginsGuide];
    v14 = [v13 bottomAnchor];
    v15 = [v11 constraintEqualToAnchor:v14];
    v36[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
    [v34 addConstraints:v16];

    v17 = [(CNContactTableViewHeaderFooterView *)v3 textLabel];
    v18 = [v17 font];
    [(UILabel *)v3->_titleLabel setFont:v18];

    v19 = v3;
  }

  return v3;
}

@end