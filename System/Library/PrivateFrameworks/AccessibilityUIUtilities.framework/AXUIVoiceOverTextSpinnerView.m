@interface AXUIVoiceOverTextSpinnerView
- (AXUIVoiceOverTextSpinnerView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (void)hideSpinner;
- (void)showSpinner;
@end

@implementation AXUIVoiceOverTextSpinnerView

- (AXUIVoiceOverTextSpinnerView)initWithSpecifier:(id)a3
{
  v45[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)AXUIVoiceOverTextSpinnerView;
  v5 = [(AXUIVoiceOverTextSpinnerView *)&v44 init];
  if (v5)
  {
    [v4 setProperty:v5 forKey:@"VoiceOverTextSpinnerView"];
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(AXUIVoiceOverTextSpinnerView *)v5 setBackgroundColor:v6];

    [(AXUIVoiceOverTextSpinnerView *)v5 setAutoresizingMask:2];
    uint64_t v7 = [objc_allocWithZone(MEMORY[0x1E4FB1930]) init];
    text = v5->_text;
    v5->_text = (UILabel *)v7;

    v9 = v5->_text;
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v9 setBackgroundColor:v10];

    v11 = v5->_text;
    v12 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [(UILabel *)v11 setFont:v12];

    v13 = v5->_text;
    v14 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UILabel *)v13 setTextColor:v14];

    -[UILabel setShadowOffset:](v5->_text, "setShadowOffset:", 0.0, 1.0);
    [(UILabel *)v5->_text setLineBreakMode:0];
    [(UILabel *)v5->_text setNumberOfLines:0];
    v15 = v5->_text;
    v16 = [v4 name];
    v17 = [v16 localizedUppercaseString];
    [(UILabel *)v15 setText:v17];

    [(UILabel *)v5->_text setAdjustsFontForContentSizeCategory:1];
    v18 = v5->_text;
    v43.receiver = v5;
    v43.super_class = (Class)AXUIVoiceOverTextSpinnerView;
    [(AXUIVoiceOverTextSpinnerView *)&v43 addSubview:v18];
    uint64_t v19 = [objc_allocWithZone(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v19;

    [(UIActivityIndicatorView *)v5->_spinner setHidesWhenStopped:1];
    id v41 = v4;
    v21 = [v4 propertyForKey:@"VoiceOverTextSpinnerViewEnabled"];
    LODWORD(v17) = [v21 BOOLValue];

    if (v17) {
      [(UIActivityIndicatorView *)v5->_spinner startAnimating];
    }
    v22 = v5->_spinner;
    v42.receiver = v5;
    v42.super_class = (Class)AXUIVoiceOverTextSpinnerView;
    [(AXUIVoiceOverTextSpinnerView *)&v42 addSubview:v22];
    [(UILabel *)v5->_text setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v5->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [(UILabel *)v5->_text leadingAnchor];
    v39 = [(AXUIVoiceOverTextSpinnerView *)v5 leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:15.0];
    v45[0] = v38;
    v37 = [(UIActivityIndicatorView *)v5->_spinner leadingAnchor];
    v36 = [(UILabel *)v5->_text trailingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:10.0];
    v45[1] = v35;
    v33 = [(UIActivityIndicatorView *)v5->_spinner trailingAnchor];
    v23 = [(AXUIVoiceOverTextSpinnerView *)v5 trailingAnchor];
    v24 = [v33 constraintLessThanOrEqualToAnchor:v23 constant:-10.0];
    v45[2] = v24;
    v25 = [(UILabel *)v5->_text centerYAnchor];
    v26 = [(AXUIVoiceOverTextSpinnerView *)v5 centerYAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v45[3] = v27;
    v28 = [(UIActivityIndicatorView *)v5->_spinner centerYAnchor];
    v29 = [(AXUIVoiceOverTextSpinnerView *)v5 centerYAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v45[4] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:5];
    [v34 activateConstraints:v31];

    id v4 = v41;
  }

  return v5;
}

- (double)preferredHeightForWidth:(double)a3
{
  -[UILabel sizeThatFits:](self->_text, "sizeThatFits:", a3 + -15.0, 3.40282347e38);
  return v3 + 18.0;
}

- (void)showSpinner
{
}

- (void)hideSpinner
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end