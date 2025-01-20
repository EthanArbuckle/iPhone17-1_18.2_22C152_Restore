@interface HUGridCircularButtonView
- (HUGridCircularButtonView)initWithCoder:(id)a3;
- (HUGridCircularButtonView)initWithFrame:(CGRect)a3;
- (HUGridCircularButtonView)initWithImage:(id)a3 title:(id)a4;
- (HUGridCircularButtonViewDelegate)delegate;
- (NSString)title;
- (UIButton)button;
- (UIImage)buttonImage;
- (UIListContentView)label;
- (void)setButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation HUGridCircularButtonView

- (HUGridCircularButtonView)initWithImage:(id)a3 title:(id)a4
{
  v70[7] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v69.receiver = self;
  v69.super_class = (Class)HUGridCircularButtonView;
  v8 = -[HUGridCircularButtonView initWithFrame:](&v69, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v8)
  {
    v9 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
    v65 = [MEMORY[0x1E4F427B0] clearConfiguration];
    v10 = [MEMORY[0x1E4F428B8] blackColor];
    v11 = [v10 colorWithAlphaComponent:0.2];
    [v65 setBackgroundColor:v11];

    [v65 setCornerRadius:30.0];
    v12 = v9;
    [v9 setBackground:v65];
    [v9 setCornerStyle:-1];
    [v9 setButtonSize:3];
    v13 = [MEMORY[0x1E4F42A98] configurationWithPointSize:18.0];
    [v9 setPreferredSymbolConfigurationForImage:v13];

    [v9 setImage:v6];
    v14 = [MEMORY[0x1E4F428B8] whiteColor];
    v64 = v9;
    [v9 setBaseForegroundColor:v14];

    v15 = (void *)MEMORY[0x1E4F426E8];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __48__HUGridCircularButtonView_initWithImage_title___block_invoke;
    v67[3] = &unk_1E6386758;
    v16 = v8;
    v68 = v16;
    v63 = [v15 actionWithHandler:v67];
    v17 = [MEMORY[0x1E4F427E0] buttonWithConfiguration:v12 primaryAction:v63];
    [(HUGridCircularButtonView *)v16 setButton:v17];

    v18 = [(HUGridCircularButtonView *)v16 button];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(HUGridCircularButtonView *)v16 button];
    [(HUGridCircularButtonView *)v16 addSubview:v19];

    v20 = [MEMORY[0x1E4F42B58] plainFooterConfiguration];
    v21 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    v22 = [v20 textProperties];
    [v22 setColor:v21];

    v62 = v20;
    [v20 setText:v7];
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F42B60]) initWithConfiguration:v20];
    [(HUGridCircularButtonView *)v16 setLabel:v23];

    v24 = [(HUGridCircularButtonView *)v16 label];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

    v25 = [(HUGridCircularButtonView *)v16 label];
    [(HUGridCircularButtonView *)v16 addSubview:v25];

    v49 = (void *)MEMORY[0x1E4F28DC8];
    v61 = [(HUGridCircularButtonView *)v16 button];
    v60 = [v61 topAnchor];
    v59 = [(HUGridCircularButtonView *)v16 topAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v70[0] = v58;
    v57 = [(HUGridCircularButtonView *)v16 button];
    v56 = [v57 heightAnchor];
    v55 = [v56 constraintEqualToConstant:60.0];
    v70[1] = v55;
    v54 = [(HUGridCircularButtonView *)v16 button];
    v53 = [v54 widthAnchor];
    v52 = [v53 constraintEqualToConstant:60.0];
    v70[2] = v52;
    v51 = [(HUGridCircularButtonView *)v16 button];
    v50 = [v51 centerXAnchor];
    v48 = [(HUGridCircularButtonView *)v16 centerXAnchor];
    v47 = [v50 constraintEqualToAnchor:v48];
    v70[3] = v47;
    v46 = [(HUGridCircularButtonView *)v16 label];
    v45 = [v46 textLayoutGuide];
    v43 = [v45 topAnchor];
    v44 = [(HUGridCircularButtonView *)v16 button];
    v42 = [v44 bottomAnchor];
    v41 = [v43 constraintEqualToAnchor:v42 constant:8.0];
    v70[4] = v41;
    v40 = [(HUGridCircularButtonView *)v16 label];
    v39 = [v40 textLayoutGuide];
    v38 = [v39 centerXAnchor];
    v26 = [(HUGridCircularButtonView *)v16 centerXAnchor];
    v27 = [v38 constraintEqualToAnchor:v26];
    v70[5] = v27;
    v28 = [(HUGridCircularButtonView *)v16 label];
    [v28 bottomAnchor];
    v29 = v66 = v8;
    v30 = [(HUGridCircularButtonView *)v16 bottomAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v70[6] = v31;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:7];
    id v32 = v7;
    v34 = id v33 = v6;
    [v49 activateConstraints:v34];

    id v6 = v33;
    id v7 = v32;

    v8 = v66;
    v35 = [(HUGridCircularButtonView *)v16 button];
    LODWORD(v36) = 1132134400;
    [v35 setContentHuggingPriority:1 forAxis:v36];
  }
  return v8;
}

void __48__HUGridCircularButtonView_initWithImage_title___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    v4 = *(void **)(a1 + 32);
    v5 = [v4 button];
    [v6 buttonView:v4 buttonWasTapped:v5];
  }
}

- (HUGridCircularButtonView)initWithFrame:(CGRect)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = NSStringFromSelector(sel_initWithImage_title_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUGridCircularButtonView.m", 79, @"%s is unavailable; use %@ instead",
    "-[HUGridCircularButtonView initWithFrame:]",
    v6);

  return 0;
}

- (HUGridCircularButtonView)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(sel_initWithImage_title_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUGridCircularButtonView.m", 84, @"%s is unavailable; use %@ instead",
    "-[HUGridCircularButtonView initWithCoder:]",
    v6);

  return 0;
}

- (UIImage)buttonImage
{
  return self->_buttonImage;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (HUGridCircularButtonViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (HUGridCircularButtonViewDelegate *)a3;
}

- (UIListContentView)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_button, 0);

  objc_storeStrong((id *)&self->_buttonImage, 0);
}

@end