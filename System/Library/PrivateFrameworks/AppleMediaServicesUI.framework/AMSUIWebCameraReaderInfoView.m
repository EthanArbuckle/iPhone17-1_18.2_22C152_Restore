@interface AMSUIWebCameraReaderInfoView
- (AMSUIWebActionRunnable)bottomLinkAction;
- (AMSUIWebCameraReaderInfoView)initWithFrame:(CGRect)a3;
- (UIButton)bottomLink;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (id)_createButtonWithTarget:(id)a3 selector:(SEL)a4;
- (id)_createLabelWithLines:(int64_t)a3 title:(BOOL)a4;
- (void)_bottomLinkSelected:(id)a3;
- (void)layoutSubviews;
- (void)setBottomLink:(id)a3;
- (void)setBottomLinkAction:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
@end

@implementation AMSUIWebCameraReaderInfoView

- (AMSUIWebCameraReaderInfoView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebCameraReaderInfoView;
  v3 = -[AMSUICommonView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[AMSUIWebAppearance systemBackgroundColor];
    [(UIView *)v3 ams_setBackgroundColor:v4];

    v5 = [(AMSUIWebCameraReaderInfoView *)v3 _createLabelWithLines:1 title:1];
    [(AMSUIWebCameraReaderInfoView *)v3 setPrimaryLabel:v5];

    v6 = [(AMSUIWebCameraReaderInfoView *)v3 primaryLabel];
    [(AMSUIWebCameraReaderInfoView *)v3 addSubview:v6];

    v7 = [(AMSUIWebCameraReaderInfoView *)v3 _createLabelWithLines:0 title:0];
    [(AMSUIWebCameraReaderInfoView *)v3 setSecondaryLabel:v7];

    v8 = [(AMSUIWebCameraReaderInfoView *)v3 secondaryLabel];
    [(AMSUIWebCameraReaderInfoView *)v3 addSubview:v8];

    v9 = [(AMSUIWebCameraReaderInfoView *)v3 _createButtonWithTarget:v3 selector:sel__bottomLinkSelected_];
    [(AMSUIWebCameraReaderInfoView *)v3 setBottomLink:v9];

    v10 = [(AMSUIWebCameraReaderInfoView *)v3 bottomLink];
    [(AMSUIWebCameraReaderInfoView *)v3 addSubview:v10];
  }
  return v3;
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)AMSUIWebCameraReaderInfoView;
  [(AMSUIWebCameraReaderInfoView *)&v46 layoutSubviews];
  [(AMSUIWebCameraReaderInfoView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(AMSUIWebCameraReaderInfoView *)self safeAreaInsets];
  double v13 = v8 - (v11 + v12);
  double v14 = v4 + v9 + 16.0;
  double v15 = v6 - (v9 + v10) + -32.0;
  double v16 = (v13 + -25.0 + -32.0) / 3.0;
  v17 = [(AMSUIWebCameraReaderInfoView *)self primaryLabel];
  objc_msgSend(v17, "sizeThatFits:", v15, v13);
  double v19 = v18;

  if (v16 < v19) {
    double v19 = (v13 + -25.0 + -32.0) / 3.0;
  }
  v20 = [(AMSUIWebCameraReaderInfoView *)self primaryLabel];
  objc_msgSend(v20, "setFrame:", v14, 25.0, v15, v19);

  v21 = [(AMSUIWebCameraReaderInfoView *)self bottomLink];
  v22 = [v21 titleLabel];
  v23 = [v22 text];
  uint64_t v24 = [v23 length];

  if (v24) {
    double v25 = (v13 + -25.0 + -32.0) / 3.0;
  }
  else {
    double v25 = v16 + v16;
  }
  v26 = [(AMSUIWebCameraReaderInfoView *)self secondaryLabel];
  objc_msgSend(v26, "sizeThatFits:", v15, v13);
  double v28 = v27;

  if (v25 < v28) {
    double v28 = v25;
  }
  v47.origin.y = 25.0;
  v47.origin.x = v14;
  v47.size.width = v15;
  v47.size.height = v19;
  CGFloat v29 = CGRectGetMaxY(v47) + 16.0;
  v30 = [(AMSUIWebCameraReaderInfoView *)self secondaryLabel];
  objc_msgSend(v30, "setFrame:", v14, v29, v15, v28);

  v31 = [(AMSUIWebCameraReaderInfoView *)self bottomLink];
  v32 = [v31 titleLabel];
  objc_msgSend(v32, "sizeThatFits:", v15, v13);
  double v34 = v33;

  [(AMSUIWebCameraReaderInfoView *)self bounds];
  double v36 = v35;
  [(AMSUIWebCameraReaderInfoView *)self safeAreaInsets];
  double v38 = v37;
  v39 = [(AMSUIWebCameraReaderInfoView *)self bottomLinkAction];
  if (v39)
  {
    v40 = [(AMSUIWebCameraReaderInfoView *)self bottomLink];
    v41 = [v40 titleLabel];
    v42 = [v41 text];
    BOOL v43 = [v42 length] == 0;
  }
  else
  {
    BOOL v43 = 1;
  }
  if (v16 < v34) {
    double v34 = v16;
  }

  v44 = [(AMSUIWebCameraReaderInfoView *)self bottomLink];
  [v44 setHidden:v43];

  v45 = [(AMSUIWebCameraReaderInfoView *)self bottomLink];
  objc_msgSend(v45, "setFrame:", v14, v36 - v38 - v34 + -16.0, v15, v34);
}

- (void)_bottomLinkSelected:(id)a3
{
  id v4 = [(AMSUIWebCameraReaderInfoView *)self bottomLinkAction];
  id v3 = (id)[v4 runAction];
}

- (id)_createButtonWithTarget:(id)a3 selector:(SEL)a4
{
  double v5 = (objc_class *)MEMORY[0x263F824E8];
  id v6 = a3;
  id v7 = [v5 alloc];
  double v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  double v10 = [v8 titleLabel];
  [v10 setFont:v9];

  double v11 = [v8 titleLabel];
  [v11 setLineBreakMode:4];

  double v12 = [v8 titleLabel];
  [v12 setNumberOfLines:1];

  double v13 = [v8 titleLabel];
  [v13 setTextAlignment:1];

  double v14 = [MEMORY[0x263F825C8] systemBlueColor];
  [v8 setTitleColor:v14 forState:0];

  [v8 addTarget:v6 action:a4 forControlEvents:64];
  return v8;
}

- (id)_createLabelWithLines:(int64_t)a3 title:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F828E0]);
  id v7 = (id)*MEMORY[0x263F83570];
  if (v4)
  {
    id v8 = (id)*MEMORY[0x263F835E0];

    id v7 = v8;
  }
  double v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:v7];
  [v6 setFont:v9];

  [v6 setNumberOfLines:a3];
  [v6 setTextAlignment:1];

  return v6;
}

- (UIButton)bottomLink
{
  return self->_bottomLink;
}

- (void)setBottomLink:(id)a3
{
}

- (AMSUIWebActionRunnable)bottomLinkAction
{
  return self->_bottomLinkAction;
}

- (void)setBottomLinkAction:(id)a3
{
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_bottomLinkAction, 0);
  objc_storeStrong((id *)&self->_bottomLink, 0);
}

@end