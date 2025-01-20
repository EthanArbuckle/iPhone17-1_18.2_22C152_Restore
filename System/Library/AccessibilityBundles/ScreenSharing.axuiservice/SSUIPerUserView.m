@interface SSUIPerUserView
- (CGPoint)hotspotAdjustmentForCursorFrame:(CGRect)a3;
- (SSUIPerUserView)init;
- (SSUIPerUserView)initWithFrame:(CGRect)a3;
- (SSUIPerUserView)initWithImageNamed:(id)a3;
- (UIImage)currentUserCursorImage;
- (UIImage)userCursorImage;
- (UIImageView)imageView;
- (UITextView)textView;
- (unsigned)incomingFlags;
- (void)setCurrentUserCursorImage:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEventFlags:(unsigned int)a3;
- (void)setFrameOriginWithPoint:(CGPoint)a3;
- (void)setImageView:(id)a3;
- (void)setIncomingFlags:(unsigned int)a3;
- (void)setTextView:(id)a3;
- (void)setUserCursorImage:(id)a3;
- (void)setWindowCoordinates:(CGPoint)a3;
- (void)viewDidMoveToWindow;
@end

@implementation SSUIPerUserView

- (SSUIPerUserView)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "init", v12, 2u);
  }
  v3 = +[SSUICursorViewController serviceBundle];
  v4 = +[UIImage imageNamed:@"red-circle" inBundle:v3 compatibleWithTraitCollection:0];
  [(SSUIPerUserView *)self setUserCursorImage:v4];

  v5 = [(SSUIPerUserView *)self userCursorImage];
  [v5 size];
  double v7 = v6;
  v8 = [(SSUIPerUserView *)self userCursorImage];
  [v8 size];
  v10 = -[SSUIPerUserView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v7, v9);

  return v10;
}

- (SSUIPerUserView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "initWithFrame", buf, 2u);
  }
  v35.receiver = self;
  v35.super_class = (Class)SSUIPerUserView;
  v8 = -[SSUIPerUserView initWithFrame:](&v35, "initWithFrame:", x, y, width, height);
  if (v8)
  {
    double v9 = +[SSUICursorViewController serviceBundle];
    v10 = +[UIImage imageNamed:@"red-circle" inBundle:v9 compatibleWithTraitCollection:0];
    [(SSUIPerUserView *)v8 setUserCursorImage:v10];

    v11 = [(SSUIPerUserView *)v8 userCursorImage];

    if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_A828();
    }
    id v12 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", (width + -48.0) * 0.5, 0.0, 48.0, 48.0);
    [(SSUIPerUserView *)v8 setImageView:v12];

    v13 = [(SSUIPerUserView *)v8 userCursorImage];
    [(SSUIPerUserView *)v8 setCurrentUserCursorImage:v13];
    v14 = [(SSUIPerUserView *)v8 imageView];
    [v14 setImage:v13];

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    blinker = v8->blinker;
    v8->blinker = (OS_dispatch_semaphore *)v15;

    id v17 = objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", 0.0, height + -24.0, width, 24.0);
    [(SSUIPerUserView *)v8 setTextView:v17];

    v18 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v19 = [(SSUIPerUserView *)v8 textView];
    [v19 setBackgroundColor:v18];

    v20 = +[UIColor colorWithRed:1.0 green:0.5 blue:1.0 alpha:1.0];
    v21 = [(SSUIPerUserView *)v8 textView];
    [v21 setTextColor:v20];

    id v22 = objc_alloc((Class)NSMutableAttributedString);
    v23 = +[NSString stringWithFormat:@"%@\n", @"Unknown User"];
    v37[0] = NSForegroundColorAttributeName;
    v24 = +[UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];
    v38[0] = v24;
    v37[1] = NSBackgroundColorAttributeName;
    v25 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    v38[1] = v25;
    v26 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    id v27 = [v22 initWithString:v23 attributes:v26];

    v28 = [(SSUIPerUserView *)v8 textView];
    v29 = [v28 textStorage];
    [v29 setAttributedString:v27];

    v30 = [(SSUIPerUserView *)v8 textView];
    [v30 setTextAlignment:1];

    v31 = [(SSUIPerUserView *)v8 textView];
    [(SSUIPerUserView *)v8 addSubview:v31];

    v32 = [(SSUIPerUserView *)v8 imageView];
    v33 = [(SSUIPerUserView *)v8 textView];
    [(SSUIPerUserView *)v8 insertSubview:v32 belowSubview:v33];
  }
  return v8;
}

- (SSUIPerUserView)initWithImageNamed:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSUIPerUserView;
  v5 = [(SSUIPerUserView *)&v10 init];
  if (v5)
  {
    double v6 = +[UIImage imageNamed:v4];
    [(SSUIPerUserView *)v5 setCurrentUserCursorImage:v6];
    double v7 = [(SSUIPerUserView *)v5 imageView];
    [v7 setImage:v6];

    -[SSUIPerUserView setFrame:](v5, "setFrame:", 0.0, 0.0, 25.0, 36.0);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "init pointer image", v9, 2u);
    }
  }

  return v5;
}

- (void)setEventFlags:(unsigned int)a3
{
}

- (CGPoint)hotspotAdjustmentForCursorFrame:(CGRect)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFrameOriginWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(SSUIPerUserView *)self frame];

  -[SSUIPerUserView setFrame:](self, "setFrame:", x, y);
}

- (void)setWindowCoordinates:(CGPoint)a3
{
  if (!self->counter) {
    -[SSUIPerUserView setFrameOriginWithPoint:](self, "setFrameOriginWithPoint:", a3.x, a3.y);
  }
}

- (void)viewDidMoveToWindow
{
  v3 = [(SSUIPerUserView *)self window];

  if (v3)
  {
    id v5 = [(SSUIPerUserView *)self window];
    id v4 = +[UIColor colorWithWhite:0.0 alpha:0.0];
    [v5 setBackgroundColor:v4];
  }
}

- (void)setDisplayName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableParagraphStyle);
  double v6 = +[NSParagraphStyle defaultParagraphStyle];
  [v5 setParagraphStyle:v6];

  [v5 setLineBreakMode:4];
  id v7 = objc_alloc((Class)NSMutableAttributedString);
  v15[0] = NSForegroundColorAttributeName;
  v8 = +[UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];
  v16[0] = v8;
  v15[1] = NSBackgroundColorAttributeName;
  double v9 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  v15[2] = NSParagraphStyleAttributeName;
  v16[1] = v9;
  v16[2] = v5;
  objc_super v10 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  id v11 = [v7 initWithString:v4 attributes:v10];

  id v12 = [(SSUIPerUserView *)self textView];
  v13 = [v12 textStorage];
  [v13 setAttributedString:v11];

  v14 = [(SSUIPerUserView *)self textView];
  [v14 setTextAlignment:1];
}

- (UIImage)userCursorImage
{
  return (UIImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserCursorImage:(id)a3
{
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_getProperty(self, a2, 40, 1);
}

- (void)setImageView:(id)a3
{
}

- (UIImage)currentUserCursorImage
{
  return (UIImage *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentUserCursorImage:(id)a3
{
}

- (unsigned)incomingFlags
{
  return self->_incomingFlags;
}

- (void)setIncomingFlags:(unsigned int)a3
{
  self->_incomingFlags = a3;
}

- (UITextView)textView
{
  return (UITextView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_currentUserCursorImage, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_userCursorImage, 0);

  objc_storeStrong((id *)&self->blinker, 0);
}

@end