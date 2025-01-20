@interface HKElectrocardiogramMetadataHeaderView
- (HKElectrocardiogramMetadataHeaderView)initWithText:(id)a3 date:(id)a4;
- (UIButton)detailButton;
- (void)_setupUIWithText:(id)a3 date:(id)a4;
@end

@implementation HKElectrocardiogramMetadataHeaderView

- (HKElectrocardiogramMetadataHeaderView)initWithText:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKElectrocardiogramMetadataHeaderView;
  v8 = -[HKElectrocardiogramMetadataHeaderView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8) {
    [(HKElectrocardiogramMetadataHeaderView *)v8 _setupUIWithText:v6 date:v7];
  }

  return v9;
}

- (void)_setupUIWithText:(id)a3 date:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v56 = [v6 healthAccessibilityIdentifier:1 suffix:@"SessionDetails"];
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setText:v8];

  v10 = [MEMORY[0x1E4FB1618] labelColor];
  [v9 setTextColor:v10];

  [v9 setAdjustsFontForContentSizeCategory:1];
  [v9 setTextAlignment:4];
  [v9 setNumberOfLines:0];
  objc_super v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredRoundedFontForTextStyle:additionalSymbolicTraits:", *MEMORY[0x1E4FB2988], 2);
  [v9 setFont:v11];

  v12 = [v56 stringByAppendingString:@".Title"];
  [v9 setAccessibilityIdentifier:v12];

  [(HKElectrocardiogramMetadataHeaderView *)self addSubview:v9];
  v13 = [v9 topAnchor];
  v14 = [(HKElectrocardiogramMetadataHeaderView *)self topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [v9 leadingAnchor];
  v17 = [(HKElectrocardiogramMetadataHeaderView *)self leadingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [MEMORY[0x1E4FB14D0] buttonWithType:2];
  detailButton = self->_detailButton;
  self->_detailButton = v19;

  [(UIButton *)self->_detailButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_detailButton setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  v21 = [v56 stringByAppendingString:@".InfoButton"];
  [(UIButton *)self->_detailButton setAccessibilityIdentifier:v21];

  [(HKElectrocardiogramMetadataHeaderView *)self addSubview:self->_detailButton];
  v22 = [(UIButton *)self->_detailButton centerYAnchor];
  v23 = [v9 topAnchor];
  v24 = [v9 font];
  [v24 lineHeight];
  v26 = [v22 constraintEqualToAnchor:v23 constant:v25 * 0.5];
  [v26 setActive:1];

  v27 = [(UIButton *)self->_detailButton leadingAnchor];
  v28 = [v9 trailingAnchor];
  v29 = [v27 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v28 multiplier:1.0];
  [v29 setActive:1];

  v30 = [(UIButton *)self->_detailButton heightAnchor];
  v31 = [(UIButton *)self->_detailButton widthAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  v33 = [(HKElectrocardiogramMetadataHeaderView *)self trailingAnchor];
  v34 = [(UIButton *)self->_detailButton trailingAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  v36 = HKDateFormatterFromTemplate(33);
  v37 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v36 setTimeZone:v37];

  id v38 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
  v39 = [v36 stringFromDate:v7];

  [v38 setText:v39];
  [v38 setAdjustsFontForContentSizeCategory:1];
  [v38 setTextAlignment:4];
  v40 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v38 setTextColor:v40];

  [v38 setNumberOfLines:0];
  v41 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x8000 options:0];
  v42 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v41 size:0.0];
  [v38 setFont:v42];

  v43 = [v56 stringByAppendingString:@".Date"];
  [v38 setAccessibilityIdentifier:v43];

  [(HKElectrocardiogramMetadataHeaderView *)self addSubview:v38];
  v44 = [v38 topAnchor];
  v45 = [v9 bottomAnchor];
  v46 = [v44 constraintEqualToAnchor:v45 constant:2.0];
  [v46 setActive:1];

  v47 = [v38 bottomAnchor];
  v48 = [(HKElectrocardiogramMetadataHeaderView *)self bottomAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  v50 = [v38 leadingAnchor];
  v51 = [(HKElectrocardiogramMetadataHeaderView *)self leadingAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v53 = [v38 trailingAnchor];
  v54 = [(HKElectrocardiogramMetadataHeaderView *)self trailingAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  [v55 setActive:1];
}

- (UIButton)detailButton
{
  return self->_detailButton;
}

- (void).cxx_destruct
{
}

@end