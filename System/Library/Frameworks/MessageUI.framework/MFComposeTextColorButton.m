@interface MFComposeTextColorButton
+ (MFComposeTextColorButton)buttonWithColor:(id)a3;
- (UIColor)color;
- (UIView)colorRingView;
- (UIView)colorView;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setColorRingView:(id)a3;
- (void)setColorView:(id)a3;
@end

@implementation MFComposeTextColorButton

+ (MFComposeTextColorButton)buttonWithColor:(id)a3
{
  v52[8] = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  v3 = +[MFComposeTextColorButton buttonWithType:0];
  [v3 setColor:v50];
  v4 = (void *)MEMORY[0x1E4FB1818];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v4 imageNamed:@"format-color-wheel" inBundle:v5 compatibleWithTraitCollection:0];
  [v3 setBackgroundImage:v6 forState:0];

  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F73CA0]];
  id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v51 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
  v12 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v51 setBackgroundColor:v12];

  v13 = [v51 layer];
  [v13 setMasksToBounds:1];

  [v51 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v51 setUserInteractionEnabled:0];
  [v3 addSubview:v51];
  [v3 setColorRingView:v51];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v8, v9, v10, v11);
  [v14 setBackgroundColor:v50];
  id v15 = [MEMORY[0x1E4FB1618] separatorColor];
  uint64_t v16 = [v15 CGColor];
  v17 = [v14 layer];
  [v17 setBorderColor:v16];

  v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v18 scale];
  double v20 = v19;
  v21 = [v14 layer];
  [v21 setBorderWidth:1.0 / v20];

  v22 = [v14 layer];
  [v22 setMasksToBounds:1];

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 setUserInteractionEnabled:0];
  [v3 addSubview:v14];
  [v3 setColorView:v14];
  v23 = (void *)MEMORY[0x1E4F28DC8];
  v49 = [v51 widthAnchor];
  v43 = [v3 widthAnchor];
  v42 = objc_msgSend(v49, "constraintEqualToAnchor:multiplier:", 0.81);
  v52[0] = v42;
  v48 = [v51 heightAnchor];
  v41 = [v3 heightAnchor];
  v40 = objc_msgSend(v48, "constraintEqualToAnchor:multiplier:", 0.81);
  v52[1] = v40;
  v47 = [v51 centerXAnchor];
  v39 = [v3 centerXAnchor];
  v38 = objc_msgSend(v47, "constraintEqualToAnchor:");
  v52[2] = v38;
  v46 = [v51 centerYAnchor];
  v37 = [v3 centerYAnchor];
  v36 = objc_msgSend(v46, "constraintEqualToAnchor:");
  v52[3] = v36;
  v45 = [v14 widthAnchor];
  v35 = [v3 widthAnchor];
  v34 = objc_msgSend(v45, "constraintEqualToAnchor:multiplier:", 0.65);
  v52[4] = v34;
  v44 = [v14 heightAnchor];
  v33 = [v3 heightAnchor];
  v32 = objc_msgSend(v44, "constraintEqualToAnchor:multiplier:", 0.65);
  v52[5] = v32;
  v24 = [v14 centerXAnchor];
  v25 = [v3 centerXAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v52[6] = v26;
  v27 = [v14 centerYAnchor];
  v28 = [v3 centerYAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v52[7] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:8];
  [v23 activateConstraints:v30];

  return (MFComposeTextColorButton *)v3;
}

- (void)setColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    v6 = [(MFComposeTextColorButton *)self colorView];
    [v6 setBackgroundColor:v7];

    v5 = v7;
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)MFComposeTextColorButton;
  [(MFComposeTextColorButton *)&v16 layoutSubviews];
  [(MFComposeTextColorButton *)self bounds];
  double v4 = v3 * 0.5;
  v5 = [(MFComposeTextColorButton *)self layer];
  [v5 setCornerRadius:v4];

  v6 = [(MFComposeTextColorButton *)self colorView];
  [v6 frame];
  double v8 = v7;
  double v9 = [(MFComposeTextColorButton *)self colorView];
  double v10 = [v9 layer];
  [v10 setCornerRadius:v8 * 0.5];

  double v11 = [(MFComposeTextColorButton *)self colorRingView];
  [v11 frame];
  double v13 = v12;
  v14 = [(MFComposeTextColorButton *)self colorRingView];
  id v15 = [v14 layer];
  [v15 setCornerRadius:v13 * 0.5];
}

- (UIColor)color
{
  return self->_color;
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
}

- (UIView)colorRingView
{
  return self->_colorRingView;
}

- (void)setColorRingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorRingView, 0);
  objc_storeStrong((id *)&self->_colorView, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end