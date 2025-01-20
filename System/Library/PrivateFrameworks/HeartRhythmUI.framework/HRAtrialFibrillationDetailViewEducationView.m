@interface HRAtrialFibrillationDetailViewEducationView
- (HRAtrialFibrillationDetailViewEducationView)init;
- (id)_labelWithText:(id)a3 fontTextStyle:(id)a4 symbolicTraits:(unsigned int)a5;
- (void)_setupUI;
@end

@implementation HRAtrialFibrillationDetailViewEducationView

- (HRAtrialFibrillationDetailViewEducationView)init
{
  v5.receiver = self;
  v5.super_class = (Class)HRAtrialFibrillationDetailViewEducationView;
  v2 = -[HRAtrialFibrillationDetailViewEducationView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v3 = v2;
  if (v2) {
    [(HRAtrialFibrillationDetailViewEducationView *)v2 _setupUI];
  }
  return v3;
}

- (void)_setupUI
{
  v3 = [MEMORY[0x263F1C550] secondarySystemGroupedBackgroundColor];
  [(HRAtrialFibrillationDetailViewEducationView *)self setBackgroundColor:v3];

  v4 = HRHeartRhythmUIFrameworkBundle();
  objc_super v5 = [v4 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETAIL_EDUCATION_TITLE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  id v34 = [(HRAtrialFibrillationDetailViewEducationView *)self _labelWithText:v5 fontTextStyle:*MEMORY[0x263F1D2F8] symbolicTraits:2];

  [(HRAtrialFibrillationDetailViewEducationView *)self addSubview:v34];
  v6 = [v34 leadingAnchor];
  v7 = [(HRAtrialFibrillationDetailViewEducationView *)self layoutMarginsGuide];
  v8 = [v7 leadingAnchor];
  v9 = [v6 constraintEqualToAnchor:v8 constant:12.0];
  [v9 setActive:1];

  v10 = [(HRAtrialFibrillationDetailViewEducationView *)self layoutMarginsGuide];
  v11 = [v10 trailingAnchor];
  v12 = [v34 trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:12.0];
  [v13 setActive:1];

  v14 = [v34 topAnchor];
  v15 = [(HRAtrialFibrillationDetailViewEducationView *)self topAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:22.0];
  [v16 setActive:1];

  v17 = HRHeartRhythmUIFrameworkBundle();
  v18 = [v17 localizedStringForKey:@"ATRIAL_FIBRILLATION_DETAIL_EDUCATION_BODY" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable-Antimony"];
  v19 = [(HRAtrialFibrillationDetailViewEducationView *)self _labelWithText:v18 fontTextStyle:*MEMORY[0x263F1D260] symbolicTraits:0x8000];

  [(HRAtrialFibrillationDetailViewEducationView *)self addSubview:v19];
  v20 = [v19 leadingAnchor];
  v21 = [(HRAtrialFibrillationDetailViewEducationView *)self layoutMarginsGuide];
  v22 = [v21 leadingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:12.0];
  [v23 setActive:1];

  v24 = [(HRAtrialFibrillationDetailViewEducationView *)self layoutMarginsGuide];
  v25 = [v24 trailingAnchor];
  v26 = [v19 trailingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26 constant:12.0];
  [v27 setActive:1];

  v28 = [v19 topAnchor];
  v29 = [v34 bottomAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:12.0];
  [v30 setActive:1];

  v31 = [(HRAtrialFibrillationDetailViewEducationView *)self bottomAnchor];
  v32 = [v19 bottomAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:16.0];
  [v33 setActive:1];
}

- (id)_labelWithText:(id)a3 fontTextStyle:(id)a4 symbolicTraits:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v7 = (objc_class *)MEMORY[0x263F1C768];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9];

  id v12 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v12 setParagraphSpacing:10.0];
  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x263F1C268], v12, 0, objc_msgSend(v11, "length"));
  [v10 setAttributedText:v11];
  v13 = [MEMORY[0x263F1C550] labelColor];
  [v10 setTextColor:v13];

  [v10 setAdjustsFontForContentSizeCategory:1];
  [v10 setTextAlignment:4];
  [v10 setNumberOfLines:0];
  v14 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:v8 addingSymbolicTraits:v5 options:0];

  v15 = [MEMORY[0x263F1C658] fontWithDescriptor:v14 size:0.0];
  [v10 setFont:v15];

  return v10;
}

@end