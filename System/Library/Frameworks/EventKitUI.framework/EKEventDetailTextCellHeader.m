@interface EKEventDetailTextCellHeader
- (BOOL)showsShowMoreLabel;
- (EKEventDetailTextCellHeader)initWithTitle:(id)a3;
- (EKEventDetailTextCellHeaderDelegate)delegate;
- (void)_tapped;
- (void)_updateConstraints;
- (void)setDelegate:(id)a3;
- (void)setShowsShowMoreLabel:(BOOL)a3;
@end

@implementation EKEventDetailTextCellHeader

- (EKEventDetailTextCellHeader)initWithTitle:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)EKEventDetailTextCellHeader;
  v5 = [(EKEventDetailTextCellHeader *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    constraints = v5->_constraints;
    v5->_constraints = (NSMutableArray *)v6;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v8;

    [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v10 = *MEMORY[0x1E4FB28C8];
    v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v5->_titleLabel setFont:v11];

    v12 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v5->_titleLabel setTextColor:v12];

    [(UILabel *)v5->_titleLabel setText:v4];
    LODWORD(v13) = 1144766464;
    [(UILabel *)v5->_titleLabel setContentCompressionResistancePriority:0 forAxis:v13];
    [(EKEventDetailTextCellHeader *)v5 addSubview:v5->_titleLabel];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    showMoreLabel = v5->_showMoreLabel;
    v5->_showMoreLabel = v14;

    [(UILabel *)v5->_showMoreLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10];
    [(UILabel *)v5->_showMoreLabel setFont:v16];

    v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5->_showMoreLabel setTextColor:v17];

    v18 = EventKitUIBundle();
    v19 = [v18 localizedStringForKey:@"Show more" value:&stru_1F0CC2140 table:0];
    [(UILabel *)v5->_showMoreLabel setText:v19];

    id v20 = objc_alloc(MEMORY[0x1E4FB1838]);
    v21 = [(EKEventDetailTextCellHeader *)v5 traitCollection];
    v22 = TableViewDisclosureIndicatorImage(v21);
    uint64_t v23 = [v20 initWithImage:v22];
    showMoreChevron = v5->_showMoreChevron;
    v5->_showMoreChevron = (UIImageView *)v23;

    LODWORD(v25) = 1148846080;
    [(UIImageView *)v5->_showMoreChevron setContentCompressionResistancePriority:0 forAxis:v25];
    [(UIImageView *)v5->_showMoreChevron setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v5 action:sel__tapped];
    [(EKEventDetailTextCellHeader *)v5 addGestureRecognizer:v26];
    [(EKEventDetailTextCellHeader *)v5 _updateConstraints];
  }
  return v5;
}

- (void)_tapped
{
  if (self->_showsShowMoreLabel)
  {
    id v2 = [(EKEventDetailTextCellHeader *)self delegate];
    [v2 cellHeaderTapped];
  }
}

- (void)setShowsShowMoreLabel:(BOOL)a3
{
  if (self->_showsShowMoreLabel != a3)
  {
    self->_showsShowMoreLabel = a3;
    [(EKEventDetailTextCellHeader *)self _updateConstraints];
  }
}

- (void)_updateConstraints
{
  v47[8] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F28000uLL;
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  if (self->_showsShowMoreLabel)
  {
    [(EKEventDetailTextCellHeader *)self addSubview:self->_showMoreLabel];
    [(EKEventDetailTextCellHeader *)self addSubview:self->_showMoreChevron];
    constraints = self->_constraints;
    v38 = [(UILabel *)self->_titleLabel leadingAnchor];
    uint64_t v37 = [(EKEventDetailTextCellHeader *)self leadingAnchor];
    uint64_t v34 = [v38 constraintEqualToAnchor:v37];
    v47[0] = v34;
    v33 = [(UILabel *)self->_titleLabel topAnchor];
    uint64_t v35 = [(EKEventDetailTextCellHeader *)self topAnchor];
    v45 = [v33 constraintEqualToAnchor:v35];
    v47[1] = v45;
    id v4 = [(UILabel *)self->_titleLabel bottomAnchor];
    uint64_t v32 = [(EKEventDetailTextCellHeader *)self bottomAnchor];
    v44 = v4;
    v43 = [v4 constraintEqualToAnchor:v32];
    v47[2] = v43;
    v31 = [(UILabel *)self->_showMoreLabel leadingAnchor];
    v42 = [(UILabel *)self->_titleLabel trailingAnchor];
    v41 = objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:", 6.0);
    v47[3] = v41;
    v5 = [(UIImageView *)self->_showMoreChevron leadingAnchor];
    v29 = [(UILabel *)self->_showMoreLabel trailingAnchor];
    v30 = [(UILabel *)self->_showMoreLabel font];
    [v30 _scaledValueForValue:8.0];
    v39 = v5;
    objc_super v28 = objc_msgSend(v5, "constraintEqualToAnchor:constant:", v29);
    v47[4] = v28;
    v27 = [(UIImageView *)self->_showMoreChevron trailingAnchor];
    uint64_t v6 = [(EKEventDetailTextCellHeader *)self trailingAnchor];
    v7 = [v27 constraintEqualToAnchor:v6];
    v47[5] = v7;
    v8 = [(UILabel *)self->_showMoreLabel firstBaselineAnchor];
    v9 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    uint64_t v10 = [v8 constraintEqualToAnchor:v9];
    v47[6] = v10;
    v11 = [(UIImageView *)self->_showMoreChevron firstBaselineAnchor];
    v12 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    v47[7] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:8];
    [(NSMutableArray *)constraints addObjectsFromArray:v14];

    v15 = v33;
    v16 = (void *)v34;

    unint64_t v3 = 0x1E4F28000;
    v17 = (void *)v37;

    v18 = (void *)v32;
    v19 = v38;

    id v20 = v31;
    v21 = (void *)v35;
  }
  else
  {
    [(UILabel *)self->_showMoreLabel removeFromSuperview];
    [(UIImageView *)self->_showMoreChevron removeFromSuperview];
    v40 = self->_constraints;
    v19 = [(UILabel *)self->_titleLabel leadingAnchor];
    v17 = [(EKEventDetailTextCellHeader *)self leadingAnchor];
    v16 = [v19 constraintEqualToAnchor:v17];
    v46[0] = v16;
    v15 = [(UILabel *)self->_titleLabel topAnchor];
    v21 = [(EKEventDetailTextCellHeader *)self topAnchor];
    v45 = [v15 constraintEqualToAnchor:v21];
    v46[1] = v45;
    uint64_t v22 = [(UILabel *)self->_titleLabel bottomAnchor];
    uint64_t v23 = [(EKEventDetailTextCellHeader *)self bottomAnchor];
    v44 = (void *)v22;
    v24 = (void *)v22;
    v18 = (void *)v23;
    v43 = [v24 constraintEqualToAnchor:v23];
    v46[2] = v43;
    id v20 = [(UILabel *)self->_titleLabel trailingAnchor];
    v42 = [(EKEventDetailTextCellHeader *)self trailingAnchor];
    v41 = objc_msgSend(v20, "constraintEqualToAnchor:");
    v46[3] = v41;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
    v26 = v40;
    v39 = (void *)v25;
    -[NSMutableArray addObjectsFromArray:](v26, "addObjectsFromArray:");
  }

  [*(id *)(v3 + 3528) activateConstraints:self->_constraints];
}

- (BOOL)showsShowMoreLabel
{
  return self->_showsShowMoreLabel;
}

- (EKEventDetailTextCellHeaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKEventDetailTextCellHeaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_showMoreChevron, 0);
  objc_storeStrong((id *)&self->_showMoreLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end