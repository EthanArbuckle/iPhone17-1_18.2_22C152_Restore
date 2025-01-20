@interface HKExportPDFControl
- (HKExportPDFControl)initWithText:(id)a3 layoutMargins:(UIEdgeInsets)a4 accessibilityIdentifierPrefix:(id)a5;
- (void)_setupUIWithText:(id)a3 layoutMargins:(UIEdgeInsets)a4 accessibilityIdentifier:(id)a5;
@end

@implementation HKExportPDFControl

- (HKExportPDFControl)initWithText:(id)a3 layoutMargins:(UIEdgeInsets)a4 accessibilityIdentifierPrefix:(id)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKExportPDFControl;
  v13 = -[HKExportPDFControl initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v13)
  {
    v14 = [v12 stringByAppendingString:@".exportPDFButton"];
    -[HKExportPDFControl _setupUIWithText:layoutMargins:accessibilityIdentifier:](v13, "_setupUIWithText:layoutMargins:accessibilityIdentifier:", v11, v14, top, left, bottom, right);
  }
  return v13;
}

- (void)_setupUIWithText:(id)a3 layoutMargins:(UIEdgeInsets)a4 accessibilityIdentifier:(id)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v11 = a5;
  id v12 = a3;
  [(HKExportPDFControl *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(HKExportPDFControl *)self heightAnchor];
  v14 = [v13 constraintGreaterThanOrEqualToConstant:44.0];
  [v14 setActive:1];

  v43 = objc_alloc_init(HKSeparatorLineView);
  [(HKSeparatorLineView *)v43 setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
  [(HKSeparatorLineView *)v43 setColor:v15];

  [(HKSeparatorLineView *)v43 setSeparatorThickness:HKUIFloorToScreenScale(0.5)];
  [(HKExportPDFControl *)self addSubview:v43];
  id v16 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setText:v12];

  v17 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
  [v16 setTextColor:v17];

  [v16 setAdjustsFontSizeToFitWidth:1];
  [v16 setTextAlignment:4];
  [v16 setNumberOfLines:0];
  [v16 setAccessibilityIdentifier:v11];

  v18 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0x8000 options:0];
  v19 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v18 size:0.0];
  [v16 setFont:v19];

  [(HKExportPDFControl *)self addSubview:v16];
  v20 = [v16 leadingAnchor];
  v21 = [(HKExportPDFControl *)self layoutMarginsGuide];
  v22 = [v21 leadingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:left];
  [v23 setActive:1];

  v24 = [(HKExportPDFControl *)self layoutMarginsGuide];
  v25 = [v24 trailingAnchor];
  v26 = [v16 trailingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26 constant:right];
  [v27 setActive:1];

  v28 = [v16 topAnchor];
  v29 = [(HKExportPDFControl *)self topAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:top];
  [v30 setActive:1];

  v31 = [(HKExportPDFControl *)self bottomAnchor];
  v32 = [v16 bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:bottom];
  [v33 setActive:1];

  v34 = [(HKSeparatorLineView *)v43 leadingAnchor];
  v35 = [v16 leadingAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v36 setActive:1];

  v37 = [(HKSeparatorLineView *)v43 trailingAnchor];
  v38 = [(HKExportPDFControl *)self trailingAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  [v39 setActive:1];

  v40 = [(HKSeparatorLineView *)v43 topAnchor];
  v41 = [(HKExportPDFControl *)self topAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v42 setActive:1];
}

@end