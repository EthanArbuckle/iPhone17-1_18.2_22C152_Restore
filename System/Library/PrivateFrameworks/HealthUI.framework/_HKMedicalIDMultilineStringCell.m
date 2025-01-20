@interface _HKMedicalIDMultilineStringCell
+ (NSString)defaultReuseIdentifier;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (_HKMedicalIDMultilineStringCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)description;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_updateTextColor;
- (void)dealloc;
- (void)setDetailLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setupSubviews;
- (void)tintColorDidChange;
@end

@implementation _HKMedicalIDMultilineStringCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)@"_HKMedicalIDMultilineStringCell";
}

- (_HKMedicalIDMultilineStringCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_HKMedicalIDMultilineStringCell;
  v4 = [(_HKMedicalIDMultilineStringCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(_HKMedicalIDMultilineStringCell *)v4 setupSubviews];
    [(_HKMedicalIDMultilineStringCell *)v5 setUpConstraints];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_HKMedicalIDMultilineStringCell;
  [(_HKMedicalIDMultilineStringCell *)&v4 dealloc];
}

- (void)setupSubviews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(_HKMedicalIDMultilineStringCell *)self setTitleLabel:v3];

  objc_super v4 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  [v4 setNumberOfLines:0];

  v5 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(_HKMedicalIDMultilineStringCell *)self _updateTextColor];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(_HKMedicalIDMultilineStringCell *)self setDetailLabel:v6];

  v7 = [(_HKMedicalIDMultilineStringCell *)self detailLabel];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v8 = [(_HKMedicalIDMultilineStringCell *)self detailLabel];
  [v8 setNumberOfLines:0];

  v9 = [(_HKMedicalIDMultilineStringCell *)self contentView];
  v10 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  [v9 addSubview:v10];

  v11 = [(_HKMedicalIDMultilineStringCell *)self contentView];
  v12 = [(_HKMedicalIDMultilineStringCell *)self detailLabel];
  [v11 addSubview:v12];

  [(_HKMedicalIDMultilineStringCell *)self _contentSizeCategoryDidChange:0];
}

- (void)setUpConstraints
{
  id v3 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  objc_super v4 = [v3 firstBaselineAnchor];
  v5 = [(_HKMedicalIDMultilineStringCell *)self contentView];
  id v6 = [v5 topAnchor];
  v7 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  objc_super v8 = [v7 font];
  [v8 _scaledValueForValue:25.0];
  v9 = objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6);
  [v9 setActive:1];

  v10 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  v11 = [v10 leadingAnchor];
  v12 = [(_HKMedicalIDMultilineStringCell *)self contentView];
  v13 = [v12 leadingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13 constant:16.0];
  [v14 setActive:1];

  v15 = [(_HKMedicalIDMultilineStringCell *)self contentView];
  v16 = [v15 trailingAnchor];
  v17 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18 constant:16.0];
  [v19 setActive:1];

  v20 = [(_HKMedicalIDMultilineStringCell *)self detailLabel];
  v21 = [v20 firstBaselineAnchor];
  v22 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  v23 = [v22 lastBaselineAnchor];
  v24 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  v25 = [v24 font];
  [v25 _scaledValueForValue:24.0];
  v26 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23);
  [v26 setActive:1];

  v27 = [(_HKMedicalIDMultilineStringCell *)self detailLabel];
  v28 = [v27 leadingAnchor];
  v29 = [(_HKMedicalIDMultilineStringCell *)self contentView];
  v30 = [v29 leadingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30 constant:16.0];
  [v31 setActive:1];

  v32 = [(_HKMedicalIDMultilineStringCell *)self contentView];
  v33 = [v32 trailingAnchor];
  v34 = [(_HKMedicalIDMultilineStringCell *)self detailLabel];
  v35 = [v34 trailingAnchor];
  v36 = [v33 constraintEqualToAnchor:v35 constant:16.0];
  [v36 setActive:1];

  id v43 = [(_HKMedicalIDMultilineStringCell *)self contentView];
  v37 = [v43 bottomAnchor];
  v38 = [(_HKMedicalIDMultilineStringCell *)self detailLabel];
  v39 = [v38 lastBaselineAnchor];
  v40 = [(_HKMedicalIDMultilineStringCell *)self detailLabel];
  v41 = [v40 font];
  [v41 _scaledValueForValue:15.0];
  v42 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39);
  [v42 setActive:1];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  objc_super v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v5 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  [v5 setFont:v4];

  id v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  id v6 = [(_HKMedicalIDMultilineStringCell *)self detailLabel];
  [v6 setFont:v7];
}

- (id)description
{
  id v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  id v7 = [v6 text];
  objc_super v8 = [(_HKMedicalIDMultilineStringCell *)self detailLabel];
  v9 = [v8 text];
  v10 = [v3 stringWithFormat:@"<%@:%p titleLabel.text: %@ detailLabel.text: %@>", v5, self, v7, v9];

  return v10;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_HKMedicalIDMultilineStringCell;
  [(_HKMedicalIDMultilineStringCell *)&v3 tintColorDidChange];
  [(_HKMedicalIDMultilineStringCell *)self _updateTextColor];
}

- (void)_updateTextColor
{
  id v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  objc_super v3 = [(_HKMedicalIDMultilineStringCell *)self titleLabel];
  [v3 setTextColor:v4];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end