@interface HWHandwritingItemColectionViewCell
+ (id)_jitterPositionAnimation;
+ (id)_jitterTransformAnimation;
- (BOOL)editing;
- (BOOL)jitter;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (HWHandwritingItemColectionViewCell)initWithCoder:(id)a3;
- (HWHandwritingItemColectionViewCell)initWithFrame:(CGRect)a3;
- (NSString)uuidString;
- (UIButton)deleteButton;
- (UIImageView)imageView;
- (UIView)borderView;
- (UIView)highlightOverlayView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_commonInit;
- (void)_updateCoronaColors;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBorderView:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlightOverlayView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setJitter:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUuidString:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HWHandwritingItemColectionViewCell

- (HWHandwritingItemColectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HWHandwritingItemColectionViewCell;
  v3 = -[HWHandwritingItemColectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HWHandwritingItemColectionViewCell *)v3 _commonInit];
  }
  return v4;
}

- (HWHandwritingItemColectionViewCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HWHandwritingItemColectionViewCell;
  v3 = [(HWHandwritingItemColectionViewCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(HWHandwritingItemColectionViewCell *)v3 _commonInit];
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HWHandwritingItemColectionViewCell;
  id v4 = a3;
  [(HWHandwritingItemColectionViewCell *)&v8 traitCollectionDidChange:v4];
  v5 = [(HWHandwritingItemColectionViewCell *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(HWHandwritingItemColectionViewCell *)self _updateCoronaColors];
  }
}

- (void)_updateCoronaColors
{
  id v3 = +[UIColor favoritesPickerItemBorderColor];
  id v4 = [v3 CGColor];
  v5 = [(HWHandwritingItemColectionViewCell *)self borderView];
  id v6 = [v5 layer];
  [v6 setBorderColor:v4];

  id v10 = +[UIColor colorWithRed:0.290196078 green:0.325490196 blue:0.376470588 alpha:0.24];
  id v7 = [v10 CGColor];
  objc_super v8 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  v9 = [v8 layer];
  [v9 setBorderColor:v7];
}

- (void)_commonInit
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(HWHandwritingItemColectionViewCell *)self setBorderView:v7];

  objc_super v8 = +[UIColor favoritesPickerItemBackgroundColor];
  v9 = [(HWHandwritingItemColectionViewCell *)self borderView];
  [v9 setBackgroundColor:v8];

  id v10 = +[UIColor favoritesPickerItemBorderColor];
  id v11 = [v10 CGColor];
  v12 = [(HWHandwritingItemColectionViewCell *)self borderView];
  v13 = [v12 layer];
  [v13 setBorderColor:v11];

  v14 = +[UIScreen mainScreen];
  [v14 scale];
  double v16 = 1.0 / v15;
  v17 = [(HWHandwritingItemColectionViewCell *)self borderView];
  v18 = [v17 layer];
  [v18 setBorderWidth:v16];

  v19 = [(HWHandwritingItemColectionViewCell *)self borderView];
  v20 = [v19 layer];
  [v20 setCornerRadius:5.0];

  v21 = [(HWHandwritingItemColectionViewCell *)self borderView];
  [v21 setHidden:0];

  id v22 = [objc_alloc((Class)UIImageView) initWithImage:0];
  [(HWHandwritingItemColectionViewCell *)self setImageView:v22];

  v23 = [(HWHandwritingItemColectionViewCell *)self imageView];
  [v23 setContentMode:4];

  id v24 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(HWHandwritingItemColectionViewCell *)self setHighlightOverlayView:v24];

  v25 = +[UIColor blackColor];
  v26 = [(HWHandwritingItemColectionViewCell *)self highlightOverlayView];
  [v26 setBackgroundColor:v25];

  v27 = [(HWHandwritingItemColectionViewCell *)self highlightOverlayView];
  v28 = [v27 layer];
  LODWORD(v29) = 1041865114;
  [v28 setOpacity:v29];

  v30 = [(HWHandwritingItemColectionViewCell *)self highlightOverlayView];
  v31 = [v30 layer];
  [v31 setCornerRadius:5.0];

  v32 = [(HWHandwritingItemColectionViewCell *)self highlightOverlayView];
  [v32 setHidden:1];

  v33 = -[HWButton initWithFrame:]([HWButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(HWHandwritingItemColectionViewCell *)self setDeleteButton:v33];

  v34 = +[NSBundle hw_handwritingPluginBundle];
  v35 = [v34 localizedStringForKey:@"Delete" value:&stru_28B68 table:@"HWFavoritesPickerView"];
  v36 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [v36 setAccessibilityLabel:v35];

  v37 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [v37 setHidden:1];

  v38 = +[UIColor colorWithWhite:1.0 alpha:0.95];
  v39 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [v39 setBackgroundColor:v38];

  v40 = +[UIColor colorWithRed:0.360784314 green:0.392156863 blue:0.439215686 alpha:1.0];
  v41 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [v41 setTintColor:v40];

  v42 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  v43 = [v42 layer];
  [v43 setShadowRadius:5.0];

  v44 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  v45 = [v44 layer];
  objc_msgSend(v45, "setShadowOffset:", 0.0, 4.0);

  v46 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  v47 = [v46 layer];
  LODWORD(v48) = 1039516303;
  [v47 setShadowOpacity:v48];

  id v49 = +[UIColor blackColor];
  id v50 = [v49 CGColor];
  v51 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  v52 = [v51 layer];
  [v52 setShadowColor:v50];

  v53 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  v54 = [v53 layer];
  [v54 setCornerRadius:11.0];

  id v55 = +[UIColor colorWithRed:0.290196078 green:0.325490196 blue:0.376470588 alpha:0.24];
  id v56 = [v55 CGColor];
  v57 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  v58 = [v57 layer];
  [v58 setBorderColor:v56];

  v59 = +[UIScreen mainScreen];
  [v59 scale];
  double v61 = 1.0 / v60;
  v62 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  v63 = [v62 layer];
  [v63 setBorderWidth:v61];

  v64 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [v64 setAlpha:1.0];

  v65 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:9.0];
  id v72 = +[UIImage systemImageNamed:@"xmark" withConfiguration:v65];

  v66 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [v66 setImage:v72 forState:0];

  v67 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [v67 sizeToFit];

  v68 = [(HWHandwritingItemColectionViewCell *)self borderView];
  [(HWHandwritingItemColectionViewCell *)self addSubview:v68];

  v69 = [(HWHandwritingItemColectionViewCell *)self imageView];
  [(HWHandwritingItemColectionViewCell *)self addSubview:v69];

  v70 = [(HWHandwritingItemColectionViewCell *)self highlightOverlayView];
  [(HWHandwritingItemColectionViewCell *)self addSubview:v70];

  v71 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [(HWHandwritingItemColectionViewCell *)self addSubview:v71];
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)HWHandwritingItemColectionViewCell;
  [(HWHandwritingItemColectionViewCell *)&v37 layoutSubviews];
  [(HWHandwritingItemColectionViewCell *)self bounds];
  double v4 = v3 + *(double *)algn_33698;
  double v6 = *(double *)&qword_33690 + v5;
  double v8 = v7 - (*(double *)algn_33698 + *((double *)&xmmword_336A0 + 1));
  double v10 = v9 - (*(double *)&qword_33690 + *(double *)&xmmword_336A0);
  id v11 = [(HWHandwritingItemColectionViewCell *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(HWHandwritingItemColectionViewCell *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(HWHandwritingItemColectionViewCell *)self borderView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  [(HWHandwritingItemColectionViewCell *)self bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v29 = [(HWHandwritingItemColectionViewCell *)self highlightOverlayView];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  v30 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [v30 bounds];
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v38.size.double width = 22.0;
  v38.size.double height = 22.0;
  v38.origin.x = v32;
  v38.origin.double y = v34;
  CGFloat v35 = -(CGRectGetHeight(v38) * 0.5 + -3.0);
  v36 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  objc_msgSend(v36, "setFrame:", v35, v35, 22.0, 22.0);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HWHandwritingItemColectionViewCell;
  if (-[HWHandwritingItemColectionViewCell pointInside:withEvent:](&v16, "pointInside:withEvent:", v7, x, y))
  {
    unsigned __int8 v8 = 1;
  }
  else if ([(HWHandwritingItemColectionViewCell *)self editing])
  {
    double v9 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    double v11 = v10;
    double v13 = v12;

    double v14 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
    unsigned __int8 v8 = objc_msgSend(v14, "pointInside:withEvent:", v7, v11, v13);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  unsigned __int8 v8 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  double v9 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
  double v10 = objc_msgSend(v8, "hitTest:withEvent:", v7);

  if (!v10)
  {
    v12.receiver = self;
    v12.super_class = (Class)HWHandwritingItemColectionViewCell;
    double v10 = -[HWHandwritingItemColectionViewCell hitTest:withEvent:](&v12, "hitTest:withEvent:", v7, x, y);
  }

  return v10;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)HWHandwritingItemColectionViewCell;
  [(HWHandwritingItemColectionViewCell *)&v5 prepareForReuse];
  double v3 = [(HWHandwritingItemColectionViewCell *)self imageView];
  [v3 setImage:0];

  double v4 = [(HWHandwritingItemColectionViewCell *)self highlightOverlayView];
  [v4 setHidden:1];

  [(HWHandwritingItemColectionViewCell *)self setUuidString:0];
  [(HWHandwritingItemColectionViewCell *)self setJitter:0];
  [(HWHandwritingItemColectionViewCell *)self setEditing:0];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HWHandwritingItemColectionViewCell;
  -[HWHandwritingItemColectionViewCell setSelected:](&v6, "setSelected:");
  objc_super v5 = [(HWHandwritingItemColectionViewCell *)self highlightOverlayView];
  [v5 setHidden:!v3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HWHandwritingItemColectionViewCell;
  -[HWHandwritingItemColectionViewCell setHighlighted:](&v12, "setHighlighted:");
  objc_super v5 = [(HWHandwritingItemColectionViewCell *)self highlightOverlayView];
  [v5 setHidden:!v3];

  if (!v3) {
    +[UIColor colorWithRed:0.360784314 green:0.392156863 blue:0.439215686 alpha:1.0];
  }
  else {
  objc_super v6 = +[UIColor colorWithWhite:0.0 alpha:1.0];
  }
  id v7 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [v7 setTintColor:v6];

  if (v3)
  {
    double v8 = 0.7;
    double v9 = 1.0;
  }
  else
  {
    double v9 = 0.95;
    double v8 = 1.0;
  }
  double v10 = +[UIColor colorWithWhite:v8 alpha:v9];
  double v11 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
  [v11 setBackgroundColor:v10];
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    BOOL v3 = a3;
    self->_editing = a3;
    [(UIButton *)self->_deleteButton setHidden:!a3];
    double v5 = 0.0;
    if (v3) {
      double v5 = 1.0;
    }
    [(UIButton *)self->_deleteButton setAlpha:v5];
    [(HWHandwritingItemColectionViewCell *)self setJitter:v3];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    BOOL v4 = a3;
    self->_editing = a3;
    if (a4)
    {
      objc_super v6 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
      [v6 setHidden:0];

      id v7 = [(HWHandwritingItemColectionViewCell *)self deleteButton];
      [v7 setAlpha:(double)(v4 ^ 1)];

      double v8 = self->_deleteButton;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10AC4;
      v16[3] = &unk_288E0;
      v16[4] = self;
      BOOL v17 = v4;
      double v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      objc_super v12 = sub_10B1C;
      double v13 = &unk_28908;
      double v14 = v8;
      BOOL v15 = v4;
      double v9 = v8;
      +[UIView animateWithDuration:0x10000 delay:v16 options:&v10 animations:0.18 completion:0.0];
    }
    else
    {
      [(UIButton *)self->_deleteButton setHidden:!a3];
    }
    -[HWHandwritingItemColectionViewCell setJitter:](self, "setJitter:", v4, v10, v11, v12, v13);
  }
}

+ (id)_jitterPositionAnimation
{
  v2 = +[CAKeyframeAnimation animation];
  [v2 setKeyPath:@"position"];
  [v2 setDuration:0.25];
  [v2 setAdditive:1];
  LODWORD(v3) = 2139095039;
  [v2 setRepeatCount:v3];
  [v2 setRemovedOnCompletion:0];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  uint32_t v5 = arc4random();
  double v6 = floorf((float)((float)((float)((float)(v5 % 0x3E8) / 1000.0) + (float)((float)(v5 % 0x3E8) / 1000.0)) * 0.25) + -0.25);
  uint32_t v7 = arc4random();
  double v8 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v6, floorf((float)((float)((float)((float)(v7 % 0x3E8) / 1000.0) + (float)((float)(v7 % 0x3E8) / 1000.0)) * 0.25) + -0.25));
  [v4 addObject:v8];
  uint32_t v9 = arc4random();
  double v10 = floorf((float)((float)((float)((float)(v9 % 0x3E8) / 1000.0) + (float)((float)(v9 % 0x3E8) / 1000.0)) * 0.25) + -0.25);
  uint32_t v11 = arc4random();
  objc_super v12 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v10, floorf((float)((float)((float)((float)(v11 % 0x3E8) / 1000.0) + (float)((float)(v11 % 0x3E8) / 1000.0)) * 0.25) + -0.25));
  [v4 addObject:v12];

  uint32_t v13 = arc4random();
  double v14 = floorf((float)((float)((float)((float)(v13 % 0x3E8) / 1000.0) + (float)((float)(v13 % 0x3E8) / 1000.0)) * 0.25)+ -0.25);
  uint32_t v15 = arc4random();
  objc_super v16 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v14, floorf((float)((float)((float)((float)(v15 % 0x3E8) / 1000.0) + (float)((float)(v15 % 0x3E8) / 1000.0)) * 0.25) + -0.25));
  [v4 addObject:v16];

  uint32_t v17 = arc4random();
  double v18 = floorf((float)((float)((float)((float)(v17 % 0x3E8) / 1000.0) + (float)((float)(v17 % 0x3E8) / 1000.0)) * 0.25)+ -0.25);
  uint32_t v19 = arc4random();
  v20 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v18, floorf((float)((float)((float)((float)(v19 % 0x3E8) / 1000.0) + (float)((float)(v19 % 0x3E8) / 1000.0)) * 0.25) + -0.25));
  [v4 addObject:v20];

  [v4 addObject:v8];
  [v2 setBeginTime:(float)(ceilf((float)(arc4random() % 0x3E8 + 1) * 0.2) * 0.05)];
  [v2 setValues:v4];

  return v2;
}

+ (id)_jitterTransformAnimation
{
  v2 = +[CAKeyframeAnimation animation];
  [v2 setKeyPath:@"transform"];
  [v2 setDuration:0.25];
  double v3 = +[CAValueFunction functionWithName:kCAValueFunctionRotateZ];
  [v2 setValueFunction:v3];

  [v2 setAdditive:1];
  LODWORD(v4) = 2139095039;
  [v2 setRepeatCount:v4];
  [v2 setRemovedOnCompletion:0];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  LODWORD(v6) = -1122998213;
  uint32_t v7 = +[NSNumber numberWithFloat:v6];
  [v5 addObject:v7];

  LODWORD(v8) = 1024485435;
  uint32_t v9 = +[NSNumber numberWithFloat:v8];
  [v5 addObject:v9];

  LODWORD(v10) = -1122998213;
  uint32_t v11 = +[NSNumber numberWithFloat:v10];
  [v5 addObject:v11];

  [v2 setBeginTime:(float)(ceilf((float)(arc4random() % 0x3E8 + 1) * 0.2) * 0.05)];
  [v2 setValues:v5];

  return v2;
}

- (void)setJitter:(BOOL)a3
{
  if (self->_jitter != a3)
  {
    self->_jitter = a3;
    id v6 = [(HWHandwritingItemColectionViewCell *)self layer];
    if (self->_jitter)
    {
      [(HWHandwritingItemColectionViewCell *)self setHighlighted:0];
      double v4 = [(id)objc_opt_class() _jitterPositionAnimation];
      [v6 addAnimation:v4 forKey:@"HWIconPosition"];

      id v5 = [(id)objc_opt_class() _jitterTransformAnimation];
      [v6 addAnimation:v5 forKey:@"HWIconTransform"];
    }
    else
    {
      [v6 removeAnimationForKey:@"HWIconPosition"];
      [v6 removeAnimationForKey:@"HWIconTransform"];
    }
  }
}

- (UIView)highlightOverlayView
{
  return self->_highlightOverlayView;
}

- (void)setHighlightOverlayView:(id)a3
{
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)jitter
{
  return self->_jitter;
}

- (NSString)uuidString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUuidString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);

  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
}

@end