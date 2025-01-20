@interface RPFlatVideoOverlayButton
- (RPFlatVideoOverlayButton)initWithStyle:(int64_t)a3;
- (SEL)action;
- (id)_createOverlayImageWithBackgroundWhite:(double)a3 backgroundAlpha:(double)a4 glyphAlpha:(double)a5;
- (id)_highlightedButtonImage;
- (id)_normalButtonImage;
- (id)target;
- (int64_t)style;
- (void)_handleTap:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation RPFlatVideoOverlayButton

- (RPFlatVideoOverlayButton)initWithStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RPFlatVideoOverlayButton;
  v4 = -[RPFlatVideoOverlayButton initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = [(RPFlatVideoOverlayButton *)v4 _normalButtonImage];
    [(RPFlatVideoOverlayButton *)v5 setImage:v6 forState:0];

    v7 = [(RPFlatVideoOverlayButton *)v5 _highlightedButtonImage];
    [(RPFlatVideoOverlayButton *)v5 setImage:v7 forState:1];

    [(RPFlatVideoOverlayButton *)v5 sizeToFit];
    [(RPFlatVideoOverlayButton *)v5 setDeliversTouchesForGesturesToSuperview:0];
    [(RPFlatVideoOverlayButton *)v5 addTarget:v5 action:"_handleTap:" forControlEvents:64];
  }
  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  self->_action = a4;
}

- (void)_handleTap:(id)a3
{
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(p_target);
    [v7 performSelector:self->_action withObject:self];
  }
}

- (id)_normalButtonImage
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D4D0;
  block[3] = &unk_100018578;
  block[4] = self;
  if (qword_10001F510 != -1) {
    dispatch_once(&qword_10001F510, block);
  }
  return (id)qword_10001F508;
}

- (id)_highlightedButtonImage
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D5B0;
  block[3] = &unk_100018578;
  block[4] = self;
  if (qword_10001F520 != -1) {
    dispatch_once(&qword_10001F520, block);
  }
  return (id)qword_10001F518;
}

- (id)_createOverlayImageWithBackgroundWhite:(double)a3 backgroundAlpha:(double)a4 glyphAlpha:(double)a5
{
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v9 = +[UIImage imageNamed:@"RPVideoOverlayBackgroundMask" inBundle:v8];
  v10 = +[UIImage imageNamed:@"RPVideoOverlayGlyphMask" inBundle:v8];
  double y = CGPointZero.y;
  [v9 size];
  CGFloat width = v17.width;
  CGFloat height = v17.height;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetGrayFillColor(CurrentContext, a3, a4);
  v18.origin.x = CGPointZero.x;
  v18.origin.double y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v18);
  objc_msgSend(v9, "drawAtPoint:blendMode:alpha:", 23, CGPointZero.x, y, 1.0);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 23, CGPointZero.x, y, 1.0);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 0, CGPointZero.x, y, a5);
  v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
}

@end