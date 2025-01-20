@interface _HKReportTableViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)reportImageView;
- (UILabel)reportLabel;
- (UIView)reportAreaView;
- (_HKReportTableViewCell)init;
- (double)minimumHeight;
- (void)setReportName:(id)a3 reportImage:(id)a4;
- (void)setUpUI;
@end

@implementation _HKReportTableViewCell

- (_HKReportTableViewCell)init
{
  v5.receiver = self;
  v5.super_class = (Class)_HKReportTableViewCell;
  v2 = [(_HKReportTableViewCell *)&v5 initWithStyle:0 reuseIdentifier:@"report_cell_identifier"];
  v3 = v2;
  if (v2) {
    [(_HKReportTableViewCell *)v2 setUpUI];
  }
  return v3;
}

- (void)setUpUI
{
  v44[8] = *MEMORY[0x1E4F143B8];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  reportAreaView = self->_reportAreaView;
  self->_reportAreaView = v3;

  [(UIView *)self->_reportAreaView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v5 = [(UIView *)self->_reportAreaView layer];
  [v5 setCornerRadius:15.0];

  v6 = [(UIView *)self->_reportAreaView layer];
  [v6 setMasksToBounds:1];

  v7 = [(UIView *)self->_reportAreaView layer];
  [v7 setBorderWidth:0.5];

  id v8 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v9 = [v8 CGColor];
  v10 = [(UIView *)self->_reportAreaView layer];
  [v10 setBorderColor:v9];

  v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  reportLabel = self->_reportLabel;
  self->_reportLabel = v11;

  [(UILabel *)self->_reportLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = self->_reportLabel;
  v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  [(UILabel *)v13 setFont:v14];

  [(UIView *)self->_reportAreaView addSubview:self->_reportLabel];
  v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  reportImageView = self->_reportImageView;
  self->_reportImageView = v15;

  [(UIImageView *)self->_reportImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_reportAreaView addSubview:self->_reportImageView];
  v17 = [(_HKReportTableViewCell *)self contentView];
  [v17 addSubview:self->_reportAreaView];

  v34 = (void *)MEMORY[0x1E4F28DC8];
  v43 = [(UIImageView *)self->_reportImageView topAnchor];
  v42 = [(UIView *)self->_reportAreaView topAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:30.0];
  v44[0] = v41;
  v40 = [(UIImageView *)self->_reportImageView centerXAnchor];
  v39 = [(UIView *)self->_reportAreaView centerXAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v44[1] = v38;
  v37 = [(UILabel *)self->_reportLabel topAnchor];
  v36 = [(UIImageView *)self->_reportImageView bottomAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:30.0];
  v44[2] = v35;
  v33 = [(UILabel *)self->_reportLabel centerXAnchor];
  v32 = [(UIView *)self->_reportAreaView centerXAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v44[3] = v31;
  v30 = [(UIView *)self->_reportAreaView heightAnchor];
  v29 = [v30 constraintEqualToConstant:160.0];
  v44[4] = v29;
  v28 = [(UIView *)self->_reportAreaView widthAnchor];
  v18 = [v28 constraintEqualToConstant:135.0];
  v44[5] = v18;
  v19 = [(UIView *)self->_reportAreaView centerYAnchor];
  v20 = [(_HKReportTableViewCell *)self contentView];
  v21 = [v20 centerYAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  v44[6] = v22;
  v23 = [(UIView *)self->_reportAreaView centerXAnchor];
  v24 = [(_HKReportTableViewCell *)self contentView];
  v25 = [v24 centerXAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v44[7] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:8];
  [v34 activateConstraints:v27];
}

- (void)setReportName:(id)a3 reportImage:(id)a4
{
  reportLabel = self->_reportLabel;
  id v7 = a4;
  [(UILabel *)reportLabel setText:a3];
  [(UIImageView *)self->_reportImageView setImage:v7];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKReportTableViewCell;
  -[_HKReportTableViewCell sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = fmax(v4, 215.0);
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (UILabel)reportLabel
{
  return self->_reportLabel;
}

- (UIImageView)reportImageView
{
  return self->_reportImageView;
}

- (UIView)reportAreaView
{
  return self->_reportAreaView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportAreaView, 0);
  objc_storeStrong((id *)&self->_reportImageView, 0);
  objc_storeStrong((id *)&self->_reportLabel, 0);
}

@end