@interface MUAmenityItemImageView
- (MUAmenityItemImageView)initWithFrame:(CGRect)a3;
- (void)_contentSizeDidChange;
- (void)_setupImageView;
@end

@implementation MUAmenityItemImageView

- (MUAmenityItemImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUAmenityItemImageView;
  v3 = -[MKViewWithHairline initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MUAmenityItemImageView *)v3 _setupImageView];
  }
  return v4;
}

- (void)_setupImageView
{
  v59[7] = *MEMORY[0x1E4F143B8];
  _createAmenityImageView();
  v3 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  nfcImageView = self->_nfcImageView;
  self->_nfcImageView = v3;

  v5 = self->_nfcImageView;
  objc_super v6 = (void *)MEMORY[0x1E4FB1830];
  v7 = [MEMORY[0x1E4F30EA8] sharedManager];
  v8 = [v7 bodyFont];
  v9 = [v6 configurationWithFont:v8];
  [(UIImageView *)v5 setPreferredSymbolConfiguration:v9];

  v10 = self->_nfcImageView;
  v11 = (void *)MEMORY[0x1E4FB1818];
  v12 = (void *)MEMORY[0x1E4FB1830];
  v13 = [MEMORY[0x1E4F30EA8] sharedManager];
  v14 = [v13 bodyFont];
  v15 = [v12 configurationWithFont:v14];
  v16 = [v11 _systemImageNamed:@"nfc" withConfiguration:v15];
  [(UIImageView *)v10 setImage:v16];

  [(MUAmenityItemImageView *)self addSubview:self->_nfcImageView];
  _createAmenityImageView();
  v17 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  applePayImageView = self->_applePayImageView;
  self->_applePayImageView = v17;

  v19 = self->_applePayImageView;
  v20 = (void *)MEMORY[0x1E4FB1830];
  v21 = [MEMORY[0x1E4F30EA8] sharedManager];
  v22 = [v21 bodyFont];
  v23 = [v20 configurationWithFont:v22];
  [(UIImageView *)v19 setPreferredSymbolConfiguration:v23];

  v24 = self->_applePayImageView;
  v25 = (void *)MEMORY[0x1E4FB1818];
  v26 = (void *)MEMORY[0x1E4FB1830];
  v27 = [MEMORY[0x1E4F30EA8] sharedManager];
  v28 = [v27 bodyFont];
  v29 = [v26 configurationWithFont:v28];
  v30 = objc_msgSend(v25, "_mapsui_customSymbolImageNamed:withConfiguration:", @"applePay", v29);
  [(UIImageView *)v24 setImage:v30];

  [(MUAmenityItemImageView *)self addSubview:self->_applePayImageView];
  v31 = [(UIImageView *)self->_nfcImageView leadingAnchor];
  v32 = [(MUAmenityItemImageView *)self leadingAnchor];
  v33 = [MEMORY[0x1E4F30EA8] sharedManager];
  v34 = [v33 bodyFont];
  [v34 _scaledValueForValue:34.0];
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingConstraint = self->_leadingConstraint;
  self->_leadingConstraint = v35;

  v37 = _MULocalizedStringFromThisBundle(@"Accepts Apple Pay [AX Label]");
  [(UIImageView *)self->_applePayImageView setAccessibilityLabel:v37];

  [(UIImageView *)self->_applePayImageView setIsAccessibilityElement:1];
  [(UIImageView *)self->_applePayImageView setAccessibilityTraits:*MEMORY[0x1E4FB2570]];
  v52 = (void *)MEMORY[0x1E4F28DC8];
  v59[0] = self->_leadingConstraint;
  v58 = [(UIImageView *)self->_nfcImageView topAnchor];
  v57 = [(MUAmenityItemImageView *)self topAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v59[1] = v56;
  v55 = [(UIImageView *)self->_nfcImageView bottomAnchor];
  v54 = [(MUAmenityItemImageView *)self bottomAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v59[2] = v53;
  v51 = [(UIImageView *)self->_nfcImageView trailingAnchor];
  v50 = [(UIImageView *)self->_applePayImageView leadingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:-8.0];
  v59[3] = v49;
  v48 = [(UIImageView *)self->_applePayImageView trailingAnchor];
  v38 = [(MUAmenityItemImageView *)self trailingAnchor];
  v39 = [v48 constraintLessThanOrEqualToAnchor:v38];
  v59[4] = v39;
  v40 = [(UIImageView *)self->_applePayImageView topAnchor];
  v41 = [(MUAmenityItemImageView *)self topAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  v59[5] = v42;
  v43 = [(UIImageView *)self->_applePayImageView bottomAnchor];
  v44 = [(MUAmenityItemImageView *)self bottomAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  v59[6] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:7];
  [v52 activateConstraints:v46];

  v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v47 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)_contentSizeDidChange
{
  id v4 = [MEMORY[0x1E4F30EA8] sharedManager];
  v3 = [v4 bodyFont];
  [v3 _scaledValueForValue:34.0];
  -[NSLayoutConstraint setConstant:](self->_leadingConstraint, "setConstant:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_applePayImageView, 0);
  objc_storeStrong((id *)&self->_nfcImageView, 0);
}

@end