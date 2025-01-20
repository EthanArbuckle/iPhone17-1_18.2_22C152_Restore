@interface SFDefaultBrowserScrollInstructionView
- (SFDefaultBrowserScrollInstructionView)initWithFrame:(CGRect)a3;
@end

@implementation SFDefaultBrowserScrollInstructionView

- (SFDefaultBrowserScrollInstructionView)initWithFrame:(CGRect)a3
{
  v45[4] = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)SFDefaultBrowserScrollInstructionView;
  v3 = -[SFDefaultBrowserScrollInstructionView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(SFDefaultBrowserScrollInstructionView *)v3 setBackgroundColor:v4];

    [(SFDefaultBrowserScrollInstructionView *)v3 setHidden:1];
    [(SFDefaultBrowserScrollInstructionView *)v3 layoutMargins];
    [(SFDefaultBrowserScrollInstructionView *)v3 setLayoutMargins:20.0];
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v7 = [MEMORY[0x1E4FB1618] separatorColor];
    [v6 setBackgroundColor:v7];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFDefaultBrowserScrollInstructionView *)v3 addSubview:v6];
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [v6 leadingAnchor];
    v38 = [(SFDefaultBrowserScrollInstructionView *)v3 leadingAnchor];
    v36 = [v40 constraintEqualToAnchor:v38];
    v45[0] = v36;
    v8 = [v6 trailingAnchor];
    v9 = [(SFDefaultBrowserScrollInstructionView *)v3 trailingAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v45[1] = v10;
    v42 = v6;
    v11 = [v6 topAnchor];
    v12 = [(SFDefaultBrowserScrollInstructionView *)v3 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v45[2] = v13;
    v14 = [v6 heightAnchor];
    v15 = [v14 constraintEqualToConstant:0.5];
    v45[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
    [v34 activateConstraints:v16];

    id v17 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v18 = objc_msgSend(MEMORY[0x1E4FB1798], "_sf_preferredFontForTextStyle:weight:compatibleWithTraitCollection:", *MEMORY[0x1E4FB28C8], 0, *MEMORY[0x1E4FB29D0]);
    [v17 setFont:v18];

    [v17 setNumberOfLines:0];
    v19 = _WBSLocalizedString();
    [v17 setText:v19];

    [v17 setTextAlignment:1];
    v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v17 setTextColor:v20];

    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 setAdjustsFontForContentSizeCategory:1];
    [v17 setMaximumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    [(SFDefaultBrowserScrollInstructionView *)v3 addSubview:v17];
    v21 = [(SFDefaultBrowserScrollInstructionView *)v3 layoutMarginsGuide];
    v32 = (void *)MEMORY[0x1E4F28DC8];
    v41 = [v17 topAnchor];
    v39 = [v21 topAnchor];
    v37 = [v41 constraintEqualToAnchor:v39];
    v44[0] = v37;
    v35 = [v17 bottomAnchor];
    v33 = [v21 bottomAnchor];
    v31 = [v35 constraintEqualToAnchor:v33];
    v44[1] = v31;
    v22 = [v17 leadingAnchor];
    v23 = [v21 leadingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v44[2] = v24;
    v25 = [v17 trailingAnchor];
    v26 = [v21 trailingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v44[3] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
    [v32 activateConstraints:v28];

    v29 = v3;
  }

  return v3;
}

@end