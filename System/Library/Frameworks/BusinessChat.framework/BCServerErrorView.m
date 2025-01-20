@interface BCServerErrorView
- (BCServerErrorView)init;
@end

@implementation BCServerErrorView

- (BCServerErrorView)init
{
  v66[6] = *MEMORY[0x263EF8340];
  v64.receiver = self;
  v64.super_class = (Class)BCServerErrorView;
  v2 = [(BCServerErrorView *)&v64 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [MEMORY[0x263F1C550] colorNamed:@"ServerErrorMessageColor" inBundle:v3 compatibleWithTraitCollection:0];
    v5 = [MEMORY[0x263F1C550] colorNamed:@"ServerErrorBackgroundColor" inBundle:v3 compatibleWithTraitCollection:0];
    [(BCServerErrorView *)v2 setBackgroundColor:v5];
    uint64_t v6 = objc_opt_new();
    contentView = v2->_contentView;
    v2->_contentView = (UIView *)v6;

    uint64_t v8 = objc_opt_new();
    messageLabel = v2->_messageLabel;
    v2->_messageLabel = (UILabel *)v8;

    v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [(UILabel *)v2->_messageLabel setFont:v10];

    [(UILabel *)v2->_messageLabel setTextColor:v4];
    v11 = +[BCShared classBundle]();
    v12 = [v11 localizedStringForKey:@"SERVER_ERROR_MESSAGE" value:&stru_26DD2B2A8 table:0];
    [(UILabel *)v2->_messageLabel setText:v12];

    [(UILabel *)v2->_messageLabel setTextAlignment:1];
    [(UILabel *)v2->_messageLabel setNumberOfLines:0];
    v13 = v2->_messageLabel;
    v14 = v2->_contentView;
    [(UIView *)v14 addSubview:v13];

    [(BCServerErrorView *)v2 addSubview:v2->_contentView];
    [(UIView *)v2->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v2->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v44 = (void *)MEMORY[0x263F08938];
    v62 = v2->_contentView;
    v60 = [(UIView *)v62 topAnchor];
    v58 = [(BCServerErrorView *)v2 topAnchor];
    v56 = [v60 constraintGreaterThanOrEqualToAnchor:v58 constant:20.0];
    v66[0] = v56;
    v54 = v2->_contentView;
    v52 = [(UIView *)v54 leftAnchor];
    v50 = [(BCServerErrorView *)v2 leftAnchor];
    v48 = [v52 constraintGreaterThanOrEqualToAnchor:v50 constant:20.0];
    v66[1] = v48;
    v46 = v2->_contentView;
    v42 = [(UIView *)v46 rightAnchor];
    v40 = [(BCServerErrorView *)v2 rightAnchor];
    v38 = [v42 constraintLessThanOrEqualToAnchor:v40 constant:-20.0];
    v66[2] = v38;
    v37 = v2->_contentView;
    v36 = [(UIView *)v37 bottomAnchor];
    v35 = [(BCServerErrorView *)v2 bottomAnchor];
    v34 = [v36 constraintLessThanOrEqualToAnchor:v35 constant:-20.0];
    v66[3] = v34;
    v15 = v2->_contentView;
    v16 = [(UIView *)v15 centerXAnchor];
    v17 = [(BCServerErrorView *)v2 centerXAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v66[4] = v18;
    v19 = v2->_contentView;
    v20 = [(UIView *)v19 centerYAnchor];
    v21 = [(BCServerErrorView *)v2 centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v66[5] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:6];
    [v44 activateConstraints:v23];

    v47 = (void *)MEMORY[0x263F08938];
    v63 = v2->_messageLabel;
    v61 = [(UILabel *)v63 topAnchor];
    v59 = v2->_contentView;
    v57 = [(UIView *)v59 topAnchor];
    v55 = [v61 constraintEqualToAnchor:v57];
    v65[0] = v55;
    v53 = v2->_messageLabel;
    v51 = [(UILabel *)v53 leadingAnchor];
    v49 = v2->_contentView;
    v45 = [(UIView *)v49 leadingAnchor];
    v43 = [v51 constraintEqualToAnchor:v45];
    v65[1] = v43;
    v41 = v2->_messageLabel;
    v39 = [(UILabel *)v41 trailingAnchor];
    v24 = v2->_contentView;
    v25 = [(UIView *)v24 trailingAnchor];
    v26 = [v39 constraintEqualToAnchor:v25];
    v65[2] = v26;
    v27 = v2->_messageLabel;
    v28 = [(UILabel *)v27 bottomAnchor];
    v29 = v2->_contentView;
    v30 = [(UIView *)v29 bottomAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    v65[3] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:4];
    [v47 activateConstraints:v32];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end