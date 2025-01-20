@interface LPContactsBadgeView
- (CGRect)layoutExclusionRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPContactsBadgeView)initWithHost:(id)a3;
- (LPContactsBadgeView)initWithHost:(id)a3 contacts:(id)a4 highlighted:(BOOL)a5 style:(id)a6;
- (void)dealloc;
- (void)layoutComponentView;
@end

@implementation LPContactsBadgeView

- (LPContactsBadgeView)initWithHost:(id)a3
{
  return 0;
}

- (LPContactsBadgeView)initWithHost:(id)a3 contacts:(id)a4 highlighted:(BOOL)a5 style:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v39 = a6;
  v40.receiver = self;
  v40.super_class = (Class)LPContactsBadgeView;
  v12 = [(LPComponentView *)&v40 initWithHost:v10];
  v13 = v12;
  if (v12)
  {
    p_style = (id *)&v12->_style;
    objc_storeStrong((id *)&v12->_style, a6);
    [(LPContactsBadgeView *)v13 setUserInteractionEnabled:0];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2050000000;
    v15 = (void *)getCNAvatarViewClass_softClass;
    uint64_t v45 = getCNAvatarViewClass_softClass;
    if (!getCNAvatarViewClass_softClass)
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __getCNAvatarViewClass_block_invoke;
      v41[3] = &unk_1E5B04EB8;
      v41[4] = &v42;
      __getCNAvatarViewClass_block_invoke((uint64_t)v41);
      v15 = (void *)v43[3];
    }
    v16 = v15;
    _Block_object_dispose(&v42, 8);
    id v17 = objc_alloc_init(v16);
    [v17 setContacts:v11];
    objc_storeStrong((id *)&v13->_avatarView, v17);
    [(LPContactsBadgeView *)v13 addSubview:v13->_avatarView];
    if (v7)
    {
      v18 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      highlightIndicatorView = v13->_highlightIndicatorView;
      v13->_highlightIndicatorView = v18;

      v20 = objc_msgSend(MEMORY[0x1E4FB1818], "_lp_systemImageNamed:", @"pin.fill");
      v21 = objc_msgSend(MEMORY[0x1E4FB1830], "_lp_configurationWithPointSize:", 11.0);
      v22 = objc_msgSend(v20, "_lp_imageByApplyingSymbolConfiguration:", v21);
      [(UIImageView *)v13->_highlightIndicatorView setImage:v22];

      v23 = v13->_highlightIndicatorView;
      v24 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UIImageView *)v23 _lp_setTintColor:v24];

      v25 = v13->_highlightIndicatorView;
      v26 = [MEMORY[0x1E4FB1618] systemYellowColor];
      [(UIImageView *)v25 _lp_setBackgroundColor:v26];

      [(UIView *)v13 _lp_insertSubview:v13->_highlightIndicatorView belowSubview:v13->_avatarView];
      [(UIImageView *)v13->_highlightIndicatorView setContentMode:4];
      if ([*p_style useShadow])
      {
        v27 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        highlightShadowView = v13->_highlightShadowView;
        v13->_highlightShadowView = v27;

        [(UIView *)v13->_highlightShadowView _lp_setShadowRadius:10.0];
        -[UIView _lp_setShadowOffset:](v13->_highlightShadowView, "_lp_setShadowOffset:", 0.0, 3.0);
        [(UIView *)v13->_highlightShadowView _lp_setShadowOpacity:0.5];
        v29 = v13->_highlightShadowView;
        v30 = [MEMORY[0x1E4FB1618] systemYellowColor];
        [(UIView *)v29 _lp_setShadowColor:v30];

        [(UIView *)v13 _lp_insertSubview:v13->_highlightShadowView belowSubview:v13->_highlightIndicatorView];
      }
      v31 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      maskLayer = v13->_maskLayer;
      v13->_maskLayer = v31;

      [(CAShapeLayer *)v13->_maskLayer setFillRule:*MEMORY[0x1E4F39FB8]];
      id v33 = [MEMORY[0x1E4FB1618] blackColor];
      -[CAShapeLayer setFillColor:](v13->_maskLayer, "setFillColor:", [v33 CGColor]);

      v34 = v13->_maskLayer;
      v35 = [(UIImageView *)v13->_highlightIndicatorView layer];
      [v35 setMask:v34];
    }
    if ([*p_style useShadow])
    {
      [(UIView *)v13 _lp_setShadowRadius:4.0];
      -[UIView _lp_setShadowOffset:](v13, "_lp_setShadowOffset:", 0.0, 2.0);
      [(UIView *)v13 _lp_setShadowOpacity:0.5];
      v36 = [MEMORY[0x1E4FB1618] blackColor];
      [(UIView *)v13 _lp_setShadowColor:v36];
    }
    v37 = v13;
  }
  return v13;
}

- (void)layoutComponentView
{
  [(LPContactsBadgeStyle *)self->_style margin];
  double v4 = v3;
  [(LPContactsBadgeStyle *)self->_style margin];
  double v6 = v5;
  BOOL v7 = [(LPContactsBadgeStyle *)self->_style size];
  [v7 value];
  double v9 = v8;
  id v10 = [(LPContactsBadgeStyle *)self->_style size];
  [v10 value];
  -[UIView setFrame:](self->_avatarView, "setFrame:", v4, v6, v9, v11);

  if (self->_highlightIndicatorView)
  {
    [(LPContactsBadgeStyle *)self->_style margin];
    double v13 = v12;
    v14 = [(LPContactsBadgeStyle *)self->_style size];
    [v14 value];
    double v16 = v15;
    [(LPContactsBadgeStyle *)self->_style margin];
    double v18 = v17;
    v19 = [(LPContactsBadgeStyle *)self->_style size];
    [v19 value];
    double v21 = v20;
    v22 = [(LPContactsBadgeStyle *)self->_style size];
    [v22 value];
    -[UIImageView setFrame:](self->_highlightIndicatorView, "setFrame:", v13 + v16 * 0.5 + 2.0, v18, v21, v23);

    highlightIndicatorView = self->_highlightIndicatorView;
    v25 = [(LPContactsBadgeStyle *)self->_style size];
    [v25 value];
    [(UIImageView *)highlightIndicatorView _lp_setCornerRadius:v26 * 0.5];

    if ([(LPContactsBadgeStyle *)self->_style useShadow])
    {
      [(UIImageView *)self->_highlightIndicatorView frame];
      -[UIView setFrame:](self->_highlightShadowView, "setFrame:");
      Mutable = CGPathCreateMutable();
      [(UIView *)self->_highlightShadowView bounds];
      CGPathAddEllipseInRect(Mutable, 0, v39);
      v28 = [(UIView *)self->_highlightShadowView layer];
      [v28 setShadowPath:Mutable];

      CGPathRelease(Mutable);
    }
    v29 = CGPathCreateMutable();
    v30 = [(LPContactsBadgeStyle *)self->_style size];
    [v30 value];
    double v32 = v31;
    id v33 = [(LPContactsBadgeStyle *)self->_style size];
    [v33 value];
    double v35 = v34;
    v36 = [(LPContactsBadgeStyle *)self->_style size];
    [v36 value];
    v40.size.width = v35 + 4.0;
    v40.size.height = v37 + 4.0;
    v40.origin.y = -2.0;
    v40.origin.x = v32 * -0.5 + -4.0;
    CGPathAddEllipseInRect(v29, 0, v40);

    [(UIImageView *)self->_highlightIndicatorView bounds];
    CGPathAddRect(v29, 0, v41);
    [(CAShapeLayer *)self->_maskLayer setPath:v29];
    CGPathRelease(v29);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  highlightIndicatorView = self->_highlightIndicatorView;
  double v5 = [(LPContactsBadgeStyle *)self->_style size];
  [v5 value];
  double v7 = v6;
  if (highlightIndicatorView)
  {
    double v8 = [(LPContactsBadgeStyle *)self->_style size];
    [v8 value];
    double v10 = v9;
    [(LPContactsBadgeStyle *)self->_style margin];
    double v12 = v11;
    double v13 = [(LPContactsBadgeStyle *)self->_style size];
    [v13 value];
    double v15 = v14;
    [(LPContactsBadgeStyle *)self->_style margin];
    double v16 = v7 + v10 * 0.5 + v12 * 2.0 + 2.0;
    double v18 = v15 + v17 * 2.0;
  }
  else
  {
    [(LPContactsBadgeStyle *)self->_style margin];
    double v20 = v19;
    double v8 = [(LPContactsBadgeStyle *)self->_style size];
    [v8 value];
    double v22 = v21;
    [(LPContactsBadgeStyle *)self->_style margin];
    double v16 = v7 + v20 * 2.0;
    double v18 = v22 + v23 * 2.0;
  }

  double v24 = v16;
  double v25 = v18;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGRect)layoutExclusionRect
{
  highlightIndicatorView = self->_highlightIndicatorView;
  [(UIView *)self->_avatarView frame];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if (highlightIndicatorView)
  {
    [(UIImageView *)self->_highlightIndicatorView frame];
    v24.origin.CGFloat x = v12;
    v24.origin.CGFloat y = v13;
    v24.size.CGFloat width = v14;
    v24.size.CGFloat height = v15;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectUnion(v21, v24);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;

  return CGRectInset(*(CGRect *)&v16, -6.0, -6.0);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)LPContactsBadgeView;
  [(LPContactsBadgeView *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_highlightShadowView, 0);
  objc_storeStrong((id *)&self->_highlightIndicatorView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

@end