@interface MediaControlsRouteView
- (BOOL)displayMessage;
- (BOOL)isLabelHidden;
- (CCUICAPackageView)packageView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTVisualStylingProvider)visualStylingProvider;
- (MediaControlsRouteView)initWithFrame:(CGRect)a3;
- (NSString)packageName;
- (NSString)title;
- (NSTimer)messageTimer;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (void)_contentSizeCategoryDidChange;
- (void)_updateLabelVisualStyling;
- (void)layoutSubviews;
- (void)setDisplayMessage:(BOOL)a3;
- (void)setGlyphState:(id)a3;
- (void)setLabelHidden:(BOOL)a3;
- (void)setMessageLabel:(id)a3;
- (void)setMessageTimer:(id)a3;
- (void)setPackageName:(id)a3;
- (void)setPackageView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)showMessage:(id)a3;
@end

@implementation MediaControlsRouteView

- (MediaControlsRouteView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)MediaControlsRouteView;
  v7 = -[MediaControlsRouteView initWithFrame:](&v19, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5ADE0]), "initWithFrame:", x, y, width, height);
    packageView = v7->_packageView;
    v7->_packageView = (CCUICAPackageView *)v8;

    [(CCUICAPackageView *)v7->_packageView setUserInteractionEnabled:0];
    [(CCUICAPackageView *)v7->_packageView setScale:1.5];
    [(MediaControlsRouteView *)v7 addSubview:v7->_packageView];
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", x, y, width, height);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v10;

    [(UILabel *)v7->_titleLabel setTextAlignment:1];
    [(UILabel *)v7->_titleLabel setNumberOfLines:2];
    [(MediaControlsRouteView *)v7 addSubview:v7->_titleLabel];
    id v12 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    messageLabel = v7->_messageLabel;
    v7->_messageLabel = (UILabel *)v13;

    [(UILabel *)v7->_messageLabel setNumberOfLines:2];
    [(UILabel *)v7->_messageLabel setTextAlignment:1];
    LODWORD(v15) = 1051931443;
    [(UILabel *)v7->_messageLabel _setHyphenationFactor:v15];
    [(UILabel *)v7->_messageLabel setAlpha:0.0];
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v7->_messageLabel setTextColor:v16];

    [(MediaControlsRouteView *)v7 addSubview:v7->_messageLabel];
    [(MediaControlsRouteView *)v7 _contentSizeCategoryDidChange];
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v7 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v7;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)MediaControlsRouteView;
  [(MediaControlsRouteView *)&v54 layoutSubviews];
  [(MediaControlsRouteView *)self bounds];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  if (self->_labelHidden)
  {
    [(MediaControlsRouteView *)self bounds];
    UIRectCenteredIntegralRect();
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    -[CCUICAPackageView setFrame:](self->_packageView, "setFrame:");
    v55.origin.CGFloat x = v12;
    v55.origin.CGFloat y = v14;
    v55.size.CGFloat width = v16;
    v55.size.CGFloat height = v18;
    CGRectGetMaxY(v55);
    UIRectInset();
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v25 = v19;
    CGFloat v26 = v20;
    uint64_t v27 = 440;
  }
  else
  {
    CGFloat v28 = CGRectGetHeight(*(CGRect *)&v3) + -48.0;
    v56.origin.CGFloat x = v7;
    v56.origin.CGFloat y = v8;
    v56.size.CGFloat width = v9;
    v56.size.CGFloat height = v10;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGRectGetWidth(v56), v28);
    uint64_t v53 = v29;
    UIRectCenteredXInRect();
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    -[CCUICAPackageView setFrame:](self->_packageView, "setFrame:");
    v57.origin.CGFloat x = v31;
    v57.origin.CGFloat y = v33;
    v57.size.CGFloat width = v35;
    v57.size.CGFloat height = v37;
    CGRectGetMaxY(v57);
    UIRectInset();
    CGFloat x = v58.origin.x;
    CGFloat y = v58.origin.y;
    CGFloat width = v58.size.width;
    CGFloat height = v58.size.height;
    CGRectGetMinY(v58);
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    CGRectGetWidth(v59);
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.CGFloat width = width;
    v60.size.CGFloat height = height;
    CGRectGetHeight(v60);
    UIRectCenteredXInRect();
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:");
    v61.origin.CGFloat x = v43;
    v61.origin.CGFloat y = v45;
    v61.size.CGFloat width = v47;
    v61.size.CGFloat height = v49;
    CGRectGetHeight(v61);
    UIRectInset();
    CGFloat v22 = v50;
    CGFloat v24 = v51;
    CGFloat v25 = v19;
    CGFloat v26 = v20;
    uint64_t v27 = 456;
  }
  v52 = (id *)((char *)&self->super.super.super.isa + v27);
  objc_msgSend(*v52, "sizeThatFits:", v19, v20, v53);
  v62.origin.CGFloat x = v22;
  v62.origin.CGFloat y = v24;
  v62.size.CGFloat width = v25;
  v62.size.CGFloat height = v26;
  CGRectGetMinY(v62);
  v63.origin.CGFloat x = v22;
  v63.origin.CGFloat y = v24;
  v63.size.CGFloat width = v25;
  v63.size.CGFloat height = v26;
  CGRectGetWidth(v63);
  v64.origin.CGFloat x = v22;
  v64.origin.CGFloat y = v24;
  v64.size.CGFloat width = v25;
  v64.size.CGFloat height = v26;
  CGRectGetHeight(v64);
  UIRectCenteredXInRect();
  objc_msgSend(*v52, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  if (self->_labelHidden)
  {
    double v4 = 48.0;
  }
  else
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, a3.height);
    double v4 = v5 + 48.0;
  }
  double v6 = width;
  result.CGFloat height = v4;
  result.CGFloat width = v6;
  return result;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(UILabel *)self->_titleLabel setText:v5];

  [(MediaControlsRouteView *)self setNeedsLayout];
}

- (void)setPackageName:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_packageName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_packageName, a3);
    id v5 = (void *)MEMORY[0x1E4F5ADD8];
    double v6 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    CGFloat v7 = [v5 descriptionForPackageNamed:v8 inBundle:v6];
    [(CCUICAPackageView *)self->_packageView setPackageDescription:v7];
  }
}

- (void)setGlyphState:(id)a3
{
}

- (void)setVisualStylingProvider:(id)a3
{
  id v5 = (MTVisualStylingProvider *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    CGFloat v7 = v5;
    [(MTVisualStylingProvider *)visualStylingProvider _removeObserver:self];
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    [(MTVisualStylingProvider *)self->_visualStylingProvider _addObserver:self];
    [(MediaControlsRouteView *)self _updateLabelVisualStyling];
    id v5 = v7;
  }
}

- (void)setLabelHidden:(BOOL)a3
{
  self->_labelHidden = a3;
  [(MediaControlsRouteView *)self _updateLabelVisualStyling];

  [(MediaControlsRouteView *)self setNeedsLayout];
}

- (void)showMessage:(id)a3
{
  [(UILabel *)self->_messageLabel setText:a3];
  [(MediaControlsRouteView *)self setNeedsLayout];
  [(MediaControlsRouteView *)self layoutIfNeeded];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MediaControlsRouteView_showMessage___block_invoke;
  v4[3] = &unk_1E5F0D7F8;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateKeyframesWithDuration:0 delay:v4 options:0 animations:2.5 completion:0.0];
}

uint64_t __38__MediaControlsRouteView_showMessage___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MediaControlsRouteView_showMessage___block_invoke_2;
  v4[3] = &unk_1E5F0D7F8;
  v4[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.1];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__MediaControlsRouteView_showMessage___block_invoke_3;
  v3[3] = &unk_1E5F0D7F8;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] addKeyframeWithRelativeStartTime:v3 relativeDuration:0.9 animations:0.1];
}

uint64_t __38__MediaControlsRouteView_showMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDisplayMessage:1];
}

uint64_t __38__MediaControlsRouteView_showMessage___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDisplayMessage:0];
}

- (void)setDisplayMessage:(BOOL)a3
{
  self->_displayMessage = a3;
  [(MediaControlsRouteView *)self _updateLabelVisualStyling];
}

- (void)_updateLabelVisualStyling
{
  if (self->_labelHidden)
  {
    titleLabel = self->_titleLabel;
    double v4 = 0.0;
LABEL_3:
    [(UILabel *)titleLabel setAlpha:v4];
    goto LABEL_6;
  }
  visualStylingProvider = self->_visualStylingProvider;
  double v6 = self->_titleLabel;
  if (!visualStylingProvider)
  {
    double v4 = 1.0;
    titleLabel = self->_titleLabel;
    goto LABEL_3;
  }
  CGFloat v7 = [(MTVisualStylingProvider *)visualStylingProvider _visualStylingForStyle:0];
  [(UILabel *)v6 mt_replaceVisualStyling:v7];

LABEL_6:
  messageLabel = self->_messageLabel;
  if (self->_displayMessage)
  {
    id v10 = [(MTVisualStylingProvider *)self->_visualStylingProvider _visualStylingForStyle:0];
    [(UILabel *)messageLabel mt_replaceVisualStyling:v10];
  }
  else
  {
    CGFloat v9 = self->_messageLabel;
    [(UILabel *)v9 setAlpha:0.0];
  }
}

- (void)_contentSizeCategoryDidChange
{
  uint64_t v3 = *MEMORY[0x1E4FB27B0];
  double v4 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2908] maximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
  [(UILabel *)self->_titleLabel setFont:v4];

  id v5 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28D8] maximumContentSizeCategory:v3];
  [(UILabel *)self->_messageLabel setFont:v5];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (BOOL)isLabelHidden
{
  return self->_labelHidden;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (CCUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (NSTimer)messageTimer
{
  return self->_messageTimer;
}

- (void)setMessageTimer:(id)a3
{
}

- (BOOL)displayMessage
{
  return self->_displayMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_packageName, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end