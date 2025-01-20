@interface DRDebugDot
+ (id)dotWithTitle:(id)a3 color:(id)a4;
+ (id)dotWithTitle:(id)a3 color:(id)a4 diameter:(double)a5;
- (NSString)title;
- (void)setTitle:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DRDebugDot

+ (id)dotWithTitle:(id)a3 color:(id)a4
{
  return +[DRDebugDot dotWithTitle:a3 color:a4 diameter:10.0];
}

+ (id)dotWithTitle:(id)a3 color:(id)a4 diameter:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [DRDebugDot alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v13 = -[DRDebugDot initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(DRDebugDot *)v13 setTintColor:v7];
  id v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, a5, a5);
  v15 = [v14 layer];
  [v15 setCornerRadius:a5 * 0.5];

  v16 = +[UIColor tintColor];
  [v14 setBackgroundColor:v16];

  double v17 = CGPointZero.y;
  objc_msgSend(v14, "setCenter:", CGPointZero.x, v17);
  v18 = [v14 layer];
  [v18 setAllowsEdgeAntialiasing:1];

  [(DRDebugDot *)v13 addSubview:v14];
  v19 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(UILabel *)v19 setText:v8];

  [(UILabel *)v19 setTextAlignment:1];
  v20 = +[UIColor whiteColor];
  [(UILabel *)v19 setTextColor:v20];

  v21 = +[UIFont boldSystemFontOfSize:9.0];
  [(UILabel *)v19 setFont:v21];

  v22 = [(UILabel *)v19 layer];
  objc_msgSend(v22, "setAnchorPoint:", CGPointZero.x, v17);

  v23 = +[UIColor tintColor];
  [(UILabel *)v19 setBackgroundColor:v23];

  [(UILabel *)v19 sizeToFit];
  [(UILabel *)v19 bounds];
  CGRect v35 = CGRectInset(v34, -3.0, -1.0);
  -[UILabel setBounds:](v19, "setBounds:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
  -[UILabel setCenter:](v19, "setCenter:", 9.0, 3.0);
  id v24 = v7;
  id v25 = [v24 CGColor];

  v26 = [(UILabel *)v19 layer];
  [v26 setBorderColor:v25];

  v27 = [(UILabel *)v19 layer];
  [v27 setBorderWidth:1.0];

  v28 = [(UILabel *)v19 layer];
  [v28 setAllowsEdgeAntialiasing:1];

  v29 = [(UILabel *)v19 layer];
  [v29 setCornerRadius:3.0];

  v30 = [(UILabel *)v19 layer];
  [v30 setCornerCurve:kCACornerCurveContinuous];

  [(UILabel *)v19 setClipsToBounds:1];
  [(DRDebugDot *)v13 addSubview:v19];
  label = v13->_label;
  v13->_label = v19;

  return v13;
}

- (NSString)title
{
  return [(UILabel *)self->_label text];
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_label setText:a3];
  [(UILabel *)self->_label sizeToFit];
  [(UILabel *)self->_label bounds];
  CGRect v7 = CGRectInset(v6, -3.0, -1.0);
  label = self->_label;
  -[UILabel setBounds:](label, "setBounds:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)DRDebugDot;
  [(DRDebugDot *)&v6 tintColorDidChange];
  id v3 = [(DRDebugDot *)self tintColor];
  id v4 = [v3 CGColor];
  v5 = [(UILabel *)self->_label layer];
  [v5 setBorderColor:v4];
}

- (void).cxx_destruct
{
}

@end