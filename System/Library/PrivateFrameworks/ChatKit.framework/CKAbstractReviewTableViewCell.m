@interface CKAbstractReviewTableViewCell
- (CKAbstractReviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)mainText;
- (NSString)subheadingText;
- (UILabel)lastModifiedLabel;
- (UILabel)nameLabel;
- (UILabel)sizeLabel;
- (unint64_t)size;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setLastModifiedLabel:(id)a3;
- (void)setMainText:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setSizeLabel:(id)a3;
- (void)setSubheadingText:(id)a3;
@end

@implementation CKAbstractReviewTableViewCell

- (CKAbstractReviewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v28.receiver = self;
  v28.super_class = (Class)CKAbstractReviewTableViewCell;
  v4 = [(CKAbstractReviewTableViewCell *)&v28 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = (UILabel *)v10;

    v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [(UILabel *)v4->_nameLabel setFont:v12];

    [(UILabel *)v4->_nameLabel setNumberOfLines:1];
    v13 = [MEMORY[0x1E4F428B8] labelColor];
    [(UILabel *)v4->_nameLabel setTextColor:v13];

    v14 = [(CKAbstractReviewTableViewCell *)v4 contentView];
    [v14 addSubview:v4->_nameLabel];

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
    lastModifiedLabel = v4->_lastModifiedLabel;
    v4->_lastModifiedLabel = (UILabel *)v15;

    v17 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    [(UILabel *)v4->_lastModifiedLabel setFont:v17];

    [(UILabel *)v4->_lastModifiedLabel setNumberOfLines:1];
    v18 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UILabel *)v4->_lastModifiedLabel setTextColor:v18];

    v19 = [(CKAbstractReviewTableViewCell *)v4 contentView];
    [v19 addSubview:v4->_lastModifiedLabel];

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
    sizeLabel = v4->_sizeLabel;
    v4->_sizeLabel = (UILabel *)v20;

    [(UILabel *)v4->_sizeLabel setTextAlignment:2];
    v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [(UILabel *)v4->_sizeLabel setFont:v22];

    [(UILabel *)v4->_sizeLabel setNumberOfLines:1];
    v23 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(UILabel *)v4->_sizeLabel setTextColor:v23];

    v24 = [(CKAbstractReviewTableViewCell *)v4 contentView];
    [v24 addSubview:v4->_sizeLabel];

    v25 = [(CKAbstractReviewTableViewCell *)v4 contentView];
    v26 = [(CKAbstractReviewTableViewCell *)v4 leftHandSideView];
    [v25 addSubview:v26];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKAbstractReviewTableViewCell;
  [(CKAbstractReviewTableViewCell *)&v3 prepareForReuse];
  [(CKAbstractReviewTableViewCell *)self setModelObject:0];
  [(CKAbstractReviewTableViewCell *)self setSize:0];
}

- (void)setMainText:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAbstractReviewTableViewCell *)self nameLabel];
  [v5 setText:v4];
}

- (NSString)mainText
{
  v2 = [(CKAbstractReviewTableViewCell *)self nameLabel];
  objc_super v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSubheadingText:(id)a3
{
  id v4 = a3;
  id v5 = [(CKAbstractReviewTableViewCell *)self lastModifiedLabel];
  [v5 setText:v4];
}

- (NSString)subheadingText
{
  v2 = [(CKAbstractReviewTableViewCell *)self lastModifiedLabel];
  objc_super v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
  if (a3)
  {
    id v5 = [MEMORY[0x1E4F28B68] stringFromByteCount:a3 countStyle:0];
  }
  else
  {
    id v5 = 0;
  }
  id v4 = [(CKAbstractReviewTableViewCell *)self sizeLabel];
  [v4 setText:v5];

  [(CKAbstractReviewTableViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v64.receiver = self;
  v64.super_class = (Class)CKAbstractReviewTableViewCell;
  [(CKAbstractReviewTableViewCell *)&v64 layoutSubviews];
  [(id)objc_opt_class() leftHandSideViewSize];
  double v4 = v3;
  double v6 = v5;
  [(id)objc_opt_class() requestedHeight];
  double v8 = (v7 - v6) * 0.5;
  double v9 = [(CKAbstractReviewTableViewCell *)self leftHandSideView];
  objc_msgSend(v9, "setFrame:", 15.0, v8, v4, v6);

  uint64_t v10 = [(CKAbstractReviewTableViewCell *)self contentView];
  [v10 frame];
  double v12 = (v11 + -15.0) * 0.5;
  v13 = [(CKAbstractReviewTableViewCell *)self contentView];
  [v13 frame];
  double v15 = v14;

  v16 = [(CKAbstractReviewTableViewCell *)self sizeLabel];
  objc_msgSend(v16, "sizeThatFits:", v12, v15);
  double v18 = v17;
  double v20 = v19;

  v21 = [(CKAbstractReviewTableViewCell *)self contentView];
  [v21 frame];
  double v23 = v22 + -15.0 - v18;
  v24 = [(CKAbstractReviewTableViewCell *)self contentView];
  [v24 frame];
  double v26 = (v25 - v20) * 0.5;
  v27 = [(CKAbstractReviewTableViewCell *)self sizeLabel];
  objc_msgSend(v27, "setFrame:", v23, v26, fmin(v18, v12), v20);

  objc_super v28 = [(CKAbstractReviewTableViewCell *)self contentView];
  [v28 frame];
  double v30 = v29;
  v31 = [(CKAbstractReviewTableViewCell *)self leftHandSideView];
  [v31 frame];
  double v33 = v30 - v32 + -15.0 + -20.0 - v18 + -15.0;
  v34 = [(CKAbstractReviewTableViewCell *)self contentView];
  [v34 frame];
  double v36 = v35 * 0.5;

  v37 = [(CKAbstractReviewTableViewCell *)self subheadingText];
  uint64_t v38 = [v37 length];

  v39 = [(CKAbstractReviewTableViewCell *)self nameLabel];
  objc_msgSend(v39, "sizeThatFits:", v33, v36);
  double v41 = v40;
  double v43 = v42;

  v44 = [(CKAbstractReviewTableViewCell *)self leftHandSideView];
  [v44 frame];
  double v45 = CGRectGetMaxX(v65) + 10.0;
  v46 = [(CKAbstractReviewTableViewCell *)self contentView];
  [v46 frame];
  double v48 = v47;
  double v49 = fmin(v33, v41);
  v50 = [(CKAbstractReviewTableViewCell *)self nameLabel];
  v51 = v50;
  double v52 = v48 * 0.5 - v43;
  if (!v38) {
    double v52 = (v48 - v43) * 0.5;
  }
  objc_msgSend(v50, "setFrame:", v45, v52, v49, v43);

  v53 = [(CKAbstractReviewTableViewCell *)self lastModifiedLabel];
  objc_msgSend(v53, "sizeThatFits:", v33, v36);
  double v55 = v54;
  double v57 = v56;

  v58 = [(CKAbstractReviewTableViewCell *)self leftHandSideView];
  [v58 frame];
  CGFloat v59 = CGRectGetMaxX(v66) + 10.0;
  v60 = [(CKAbstractReviewTableViewCell *)self contentView];
  [v60 frame];
  double v62 = v61 * 0.5;
  v63 = [(CKAbstractReviewTableViewCell *)self lastModifiedLabel];
  objc_msgSend(v63, "setFrame:", v59, v62, fmin(v33, v55), v57);
}

- (unint64_t)size
{
  return self->_size;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)lastModifiedLabel
{
  return self->_lastModifiedLabel;
}

- (void)setLastModifiedLabel:(id)a3
{
}

- (UILabel)sizeLabel
{
  return self->_sizeLabel;
}

- (void)setSizeLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_lastModifiedLabel, 0);

  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end