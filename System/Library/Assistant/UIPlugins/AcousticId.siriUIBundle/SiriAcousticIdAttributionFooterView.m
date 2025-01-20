@interface SiriAcousticIdAttributionFooterView
+ (double)defaultHeight;
- (SAUIAppPunchOut)attributionPunchOut;
- (SiriAcousticIdAttributionFooterView)initWithFrame:(CGRect)a3;
- (SiriAcousticIdAttributionFooterViewDelegate)delegate;
- (UIButton)attributionButton;
- (void)_attributionButtonClicked:(id)a3;
- (void)_updateAttributionButton:(id)a3 withImage:(id)a4;
- (void)layoutSubviews;
- (void)setAttributionButton:(id)a3;
- (void)setAttributionPunchOut:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SiriAcousticIdAttributionFooterView

- (SiriAcousticIdAttributionFooterView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriAcousticIdAttributionFooterView;
  v3 = -[SiriAcousticIdAttributionFooterView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    attributionButton = v3->_attributionButton;
    v3->_attributionButton = v4;

    -[UIButton _setTouchInsets:](v3->_attributionButton, "_setTouchInsets:", -0.3, -0.3, -0.3, -0.3);
    [(UIButton *)v3->_attributionButton setEnabled:0];
    [(UIButton *)v3->_attributionButton addTarget:v3 action:"_attributionButtonClicked:" forControlEvents:64];
    [(SiriAcousticIdAttributionFooterView *)v3 addSubview:v3->_attributionButton];
  }
  return v3;
}

- (void)_attributionButtonClicked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained attributionFooterViewButtonWasTapped:self];
}

- (void)setAttributionPunchOut:(id)a3
{
  v5 = (SAUIAppPunchOut *)a3;
  if (self->_attributionPunchOut != v5)
  {
    objc_storeStrong((id *)&self->_attributionPunchOut, a3);
    v6 = +[SiriUIAttributionImage attributionImageFromAppPunchOut:self->_attributionPunchOut];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_3534;
    v7[3] = &unk_8298;
    v7[4] = self;
    v8 = v5;
    [v6 getLogoWithCompletion:v7];
  }
}

- (void)_updateAttributionButton:(id)a3 withImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[UIColor siriui_maskingColor];
  v9 = [v7 _flatImageWithColor:v8];

  [v6 setImage:v9 forState:0];
  v10 = +[UIColor siriui_maskingHighlightColor];
  v11 = [v7 _flatImageWithColor:v10];

  [v6 setImage:v11 forState:4];
  [v7 size];
  double v13 = v12;
  [v7 size];
  double v15 = v14;

  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v13, v15);
  [v6 setEnabled:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_37B4;
  v17[3] = &unk_82C0;
  id v18 = v6;
  id v16 = v6;
  +[UIView animateWithDuration:v17 animations:0.2];
  [(SiriAcousticIdAttributionFooterView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  [(SiriAcousticIdAttributionFooterView *)self setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
  v12.receiver = self;
  v12.super_class = (Class)SiriAcousticIdAttributionFooterView;
  [(SiriAcousticIdAttributionFooterView *)&v12 layoutSubviews];
  v3 = (int *)[(SiriAcousticIdAttributionFooterView *)self semanticContentAttribute];
  [(UIButton *)self->_attributionButton frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (v3 != &dword_4)
  {
    CGFloat v11 = v4;
    [(SiriAcousticIdAttributionFooterView *)self bounds];
    CGRectGetWidth(v13);
    v14.origin.x = v11;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    CGRectGetWidth(v14);
  }
  [(SiriAcousticIdAttributionFooterView *)self bounds];
  UIRectCenteredYInRect();
  -[UIButton setFrame:](self->_attributionButton, "setFrame:");
}

+ (double)defaultHeight
{
  return 36.0;
}

- (SAUIAppPunchOut)attributionPunchOut
{
  return self->_attributionPunchOut;
}

- (SiriAcousticIdAttributionFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SiriAcousticIdAttributionFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)attributionButton
{
  return self->_attributionButton;
}

- (void)setAttributionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionButton, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_attributionPunchOut, 0);
}

@end