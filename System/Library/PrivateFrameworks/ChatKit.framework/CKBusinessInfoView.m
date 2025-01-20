@interface CKBusinessInfoView
- (BOOL)hasValidGreeting;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKBusinessInfoView)initWithLayoutType:(int64_t)a3;
- (CKBusinessInfoViewDelegate)delegate;
- (CKStandardButton)infoButton;
- (NSString)descriptionText;
- (NSString)greetingText;
- (UILabel)descriptionTextLabel;
- (UILabel)greetingTextLabel;
- (int64_t)layoutType;
- (void)infoButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionTextLabel:(id)a3;
- (void)setGreetingText:(id)a3;
- (void)setGreetingTextLabel:(id)a3;
- (void)setInfoButton:(id)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setup;
@end

@implementation CKBusinessInfoView

- (CKBusinessInfoView)initWithLayoutType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKBusinessInfoView;
  v4 = [(CKBusinessInfoView *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_layoutType = a3;
    [(CKBusinessInfoView *)v4 setup];
  }
  return v5;
}

- (void)setup
{
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  greetingTextLabel = self->_greetingTextLabel;
  self->_greetingTextLabel = v3;

  v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  descriptionTextLabel = self->_descriptionTextLabel;
  self->_descriptionTextLabel = v5;

  objc_super v7 = objc_alloc_init(CKStandardButton);
  infoButton = self->_infoButton;
  self->_infoButton = v7;

  [(CKBusinessInfoView *)self addSubview:self->_greetingTextLabel];
  [(CKBusinessInfoView *)self addSubview:self->_descriptionTextLabel];
  [(CKBusinessInfoView *)self addSubview:self->_infoButton];
  [(CKStandardButton *)self->_infoButton addTarget:self action:sel_infoButtonTapped_ forControlEvents:64];
  v9 = +[CKUIBehavior sharedBehaviors];
  v10 = [v9 theme];
  v11 = [v10 businessInfoViewGreetingTextColor];
  [(UILabel *)self->_greetingTextLabel setTextColor:v11];

  v12 = +[CKUIBehavior sharedBehaviors];
  v13 = [v12 theme];
  v14 = [v13 businessInfoViewDescriptionTextColor];
  [(UILabel *)self->_descriptionTextLabel setTextColor:v14];

  v15 = self->_greetingTextLabel;
  v16 = +[CKUIBehavior sharedBehaviors];
  v17 = [v16 businessInfoViewGreetingTextFont];
  [(UILabel *)v15 setFont:v17];

  v18 = self->_descriptionTextLabel;
  v19 = +[CKUIBehavior sharedBehaviors];
  v20 = [v19 businessInfoViewDescriptionTextFont];
  [(UILabel *)v18 setFont:v20];

  v21 = [(CKStandardButton *)self->_infoButton titleLabel];
  v22 = +[CKUIBehavior sharedBehaviors];
  v23 = [v22 businessInfoViewTitleLabelFont];
  [v21 setFont:v23];

  [(UILabel *)self->_greetingTextLabel setNumberOfLines:0];
  [(UILabel *)self->_descriptionTextLabel setNumberOfLines:0];
  v24 = (void *)MEMORY[0x1E4F83AC8];
  v25 = [MEMORY[0x1E4F83A88] bundleWithIdentifier:@"com.apple.onboarding.businesschat"];
  id v29 = [v24 flowWithBundle:v25];

  v26 = self->_infoButton;
  v27 = [v29 localizedButtonTitle];
  [(CKStandardButton *)v26 setTitle:v27 forState:0];

  -[CKStandardButton setContentEdgeInsets:](self->_infoButton, "setContentEdgeInsets:", -1.0, 0.0, -1.0, 0.0);
  if ([(CKBusinessInfoView *)self layoutType])
  {
    if ([(CKBusinessInfoView *)self layoutType] != 1) {
      goto LABEL_6;
    }
    uint64_t v28 = 4;
  }
  else
  {
    uint64_t v28 = 1;
    [(UILabel *)self->_greetingTextLabel setTextAlignment:1];
  }
  [(UILabel *)self->_descriptionTextLabel setTextAlignment:v28];
LABEL_6:
}

- (void)layoutSubviews
{
  v80.receiver = self;
  v80.super_class = (Class)CKBusinessInfoView;
  [(CKBusinessInfoView *)&v80 layoutSubviews];
  [(CKBusinessInfoView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  if (![(CKBusinessInfoView *)self layoutType])
  {
    double v7 = -60.0;
    goto LABEL_5;
  }
  double v7 = -30.0;
  if ([(CKBusinessInfoView *)self layoutType] == 1)
  {
LABEL_5:
    [(CKBusinessInfoView *)self bounds];
    double v9 = v8;
    [(CKBusinessInfoView *)self layoutMargins];
    double v11 = v10;
    [(CKBusinessInfoView *)self layoutMargins];
    double v4 = v9 - (v11 + v12) + v7;
    [(CKBusinessInfoView *)self bounds];
    double v6 = v13;
  }
  v14 = [(CKBusinessInfoView *)self greetingTextLabel];
  objc_msgSend(v14, "sizeThatFits:", v4, v6);
  double v16 = v15;

  v17 = [(CKBusinessInfoView *)self descriptionTextLabel];
  objc_msgSend(v17, "sizeThatFits:", v4, v6);
  double v19 = v18;

  v20 = [(CKBusinessInfoView *)self infoButton];
  objc_msgSend(v20, "sizeThatFits:", v4, v6);
  double v22 = v21;

  int64_t v23 = [(CKBusinessInfoView *)self layoutType];
  if (v23 == 1)
  {
    [(CKBusinessInfoView *)self layoutMargins];
    double v59 = v58 + 15.0;
    [(CKBusinessInfoView *)self frame];
    double v61 = v60;
    [(CKBusinessInfoView *)self layoutMargins];
    double v63 = v62;
    [(CKBusinessInfoView *)self layoutMargins];
    double v65 = v61 - (v63 + v64) + -30.0;
    v66 = [(CKBusinessInfoView *)self descriptionTextLabel];
    objc_msgSend(v66, "setFrame:", v59, 10.0, v65, v19);

    [(CKBusinessInfoView *)self frame];
    double v68 = v67;
    [(CKBusinessInfoView *)self layoutMargins];
    double v70 = v69;
    [(CKBusinessInfoView *)self layoutMargins];
    double v51 = v68 - (v70 + v71) + -30.0;
    v72 = [(CKBusinessInfoView *)self infoButton];
    objc_msgSend(v72, "sizeThatFits:", v51, 1.79769313e308);
    double v74 = v73;

    if (v51 >= v74) {
      double v51 = v74;
    }
    if ([(CKBusinessInfoView *)self _shouldReverseLayoutDirection])
    {
      [(CKBusinessInfoView *)self frame];
      double v76 = v75 - v51 + -15.0;
      [(CKBusinessInfoView *)self layoutMargins];
      double v56 = v76 - v77;
    }
    else
    {
      [(CKBusinessInfoView *)self layoutMargins];
      double v56 = v78 + 15.0;
    }
    double v57 = v19 + 10.0;
  }
  else
  {
    if (v23) {
      return;
    }
    double v24 = *MEMORY[0x1E4F1DB28];
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v28 = 15.0;
    if ([(CKBusinessInfoView *)self hasValidGreeting])
    {
      id v29 = [(CKBusinessInfoView *)self traitCollection];
      uint64_t v30 = [v29 verticalSizeClass];

      if (v30 != 1)
      {
        [(CKBusinessInfoView *)self layoutMargins];
        double v24 = v31 + 30.0;
        [(CKBusinessInfoView *)self frame];
        double v33 = v32;
        [(CKBusinessInfoView *)self layoutMargins];
        double v35 = v34;
        [(CKBusinessInfoView *)self layoutMargins];
        double v26 = v33 - (v35 + v36) + -60.0;
        double v25 = 15.0;
        double v28 = v16 + 30.0 + 15.0;
        double v27 = v16;
      }
    }
    v37 = [(CKBusinessInfoView *)self greetingTextLabel];
    objc_msgSend(v37, "setFrame:", v24, v25, v26, v27);

    [(CKBusinessInfoView *)self layoutMargins];
    double v39 = v38 + 30.0;
    [(CKBusinessInfoView *)self frame];
    double v41 = v40;
    [(CKBusinessInfoView *)self layoutMargins];
    double v43 = v42;
    [(CKBusinessInfoView *)self layoutMargins];
    double v45 = v41 - (v43 + v44) + -60.0;
    v46 = [(CKBusinessInfoView *)self descriptionTextLabel];
    objc_msgSend(v46, "setFrame:", v39, v28, v45, v19);

    double v47 = v19 + 0.0 + v28;
    v48 = [(CKBusinessInfoView *)self infoButton];
    [(CKBusinessInfoView *)self frame];
    objc_msgSend(v48, "sizeThatFits:", v49, 1.79769313e308);
    double v51 = v50;

    [(CKBusinessInfoView *)self center];
    double v53 = v52 + v51 * -0.5;
    v54 = [(CKBusinessInfoView *)self traitCollection];
    [v54 displayScale];
    double v56 = round(v53 * v55) / v55;
    double v57 = round(v47 * v55) / v55;
  }
  v79 = [(CKBusinessInfoView *)self infoButton];
  objc_msgSend(v79, "setFrame:", v56, v57, v51, v22);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if (![(CKBusinessInfoView *)self layoutType])
  {
    double v6 = -60.0;
    goto LABEL_5;
  }
  double v5 = 0.0;
  double v6 = -30.0;
  if ([(CKBusinessInfoView *)self layoutType] == 1)
  {
LABEL_5:
    [(CKBusinessInfoView *)self layoutMargins];
    double v8 = v7;
    [(CKBusinessInfoView *)self layoutMargins];
    double v5 = width - (v8 + v9) + v6;
  }
  double v10 = [(CKBusinessInfoView *)self greetingTextLabel];
  objc_msgSend(v10, "sizeThatFits:", v5, 1.79769313e308);
  double v12 = v11;
  double v14 = v13;

  double v15 = [(CKBusinessInfoView *)self descriptionTextLabel];
  objc_msgSend(v15, "sizeThatFits:", v5, 1.79769313e308);
  double v17 = v16;
  double v19 = v18;

  v20 = [(CKBusinessInfoView *)self infoButton];
  objc_msgSend(v20, "sizeThatFits:", v5, 1.79769313e308);
  double v22 = v21;

  int64_t v23 = [(CKBusinessInfoView *)self layoutType];
  if (v23 == 1)
  {
    double v27 = v19 + v22 + 10.0 + 10.0;
  }
  else if (v23)
  {
    double v17 = *MEMORY[0x1E4F1DB30];
    double v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v24 = v19 + 15.0 + v22 + 15.0;
    BOOL v25 = [(CKBusinessInfoView *)self hasValidGreeting];
    double v26 = v14 + 30.0;
    if (!v25) {
      double v26 = -0.0;
    }
    double v27 = v24 + v26;
    if (v12 >= v17) {
      double v17 = v12;
    }
  }
  double v28 = v17;
  result.height = v27;
  result.double width = v28;
  return result;
}

- (void)setGreetingText:(id)a3
{
  objc_storeStrong((id *)&self->_greetingText, a3);
  id v5 = a3;
  double v6 = [(CKBusinessInfoView *)self greetingTextLabel];
  [v6 setText:v5];

  [(CKBusinessInfoView *)self setNeedsLayout];
}

- (void)setDescriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionText, a3);
  id v5 = a3;
  double v6 = [(CKBusinessInfoView *)self descriptionTextLabel];
  [v6 setText:v5];

  [(CKBusinessInfoView *)self setNeedsLayout];
}

- (void)infoButtonTapped:(id)a3
{
  id v8 = a3;
  double v4 = [(CKBusinessInfoView *)self delegate];

  if (v4)
  {
    id v5 = [(CKBusinessInfoView *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = [(CKBusinessInfoView *)self delegate];
      [v7 businessInfoView:self infoButtonTapped:v8];
    }
  }
}

- (BOOL)hasValidGreeting
{
  double v3 = [(CKBusinessInfoView *)self greetingText];
  if ([v3 length])
  {
    double v4 = [(CKBusinessInfoView *)self greetingText];
    int v5 = [v4 isEqualToString:@"$EMPTY$"] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CKBusinessInfoViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBusinessInfoViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (NSString)greetingText
{
  return self->_greetingText;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (UILabel)greetingTextLabel
{
  return self->_greetingTextLabel;
}

- (void)setGreetingTextLabel:(id)a3
{
}

- (UILabel)descriptionTextLabel
{
  return self->_descriptionTextLabel;
}

- (void)setDescriptionTextLabel:(id)a3
{
}

- (CKStandardButton)infoButton
{
  return self->_infoButton;
}

- (void)setInfoButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_descriptionTextLabel, 0);
  objc_storeStrong((id *)&self->_greetingTextLabel, 0);
  objc_storeStrong((id *)&self->_greetingText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end