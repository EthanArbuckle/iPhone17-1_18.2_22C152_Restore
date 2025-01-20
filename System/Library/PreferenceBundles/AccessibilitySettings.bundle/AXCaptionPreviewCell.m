@interface AXCaptionPreviewCell
+ (CGSize)imageSize;
+ (CGSize)previewSize;
- (AXCaptionPreviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)cellEnabled;
- (double)xOffset;
- (id)captionPreviewView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
@end

@implementation AXCaptionPreviewCell

- (void)didMoveToSuperview
{
  v3 = [(AXCaptionPreviewCell *)self superview];

  if (v3)
  {
    captionPreviewView = self->_captionPreviewView;
    [(AXCaptionPreviewView *)captionPreviewView layoutSubviews];
  }
}

- (id)captionPreviewView
{
  return self->_captionPreviewView;
}

- (void)setFrame:(CGRect)a3
{
  double width = a3.size.width;
  [(id)objc_opt_class() previewSize];
  double v6 = v5 + 5.0;
  v7 = +[UIDevice currentDevice];
  double v8 = v6 - dbl_1A16E0[[v7 userInterfaceIdiom] == (char *)&dword_0 + 1];

  [(id)objc_opt_class() imageSize];
  double xOffset = self->_xOffset;
  v11.receiver = self;
  v11.super_class = (Class)AXCaptionPreviewCell;
  -[AXCaptionPreviewCell setFrame:](&v11, "setFrame:", xOffset, v8, width, v10);
}

+ (CGSize)previewSize
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (char *)&dword_0 + 1;

  double v4 = dbl_1A16F0[v3];
  double v5 = 0.0;
  result.height = v4;
  result.double width = v5;
  return result;
}

+ (CGSize)imageSize
{
  v2 = +[UIDevice currentDevice];
  double v3 = dbl_1A16E0[[v2 userInterfaceIdiom] == (char *)&dword_0 + 1];

  double v4 = 0.0;
  double v5 = v3;
  result.height = v5;
  result.double width = v4;
  return result;
}

- (AXCaptionPreviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)AXCaptionPreviewCell;
  double v5 = [(AXCaptionPreviewCell *)&v17 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    [(id)objc_opt_class() imageSize];
    double v7 = v6;
    double v9 = v8;
    double v10 = -[AXCaptionPreviewView initWithFrame:]([AXCaptionPreviewView alloc], "initWithFrame:", 0.0, 0.0, v6, v8);
    captionPreviewView = v5->_captionPreviewView;
    v5->_captionPreviewView = v10;

    v12 = +[UIColor whiteColor];
    [(AXCaptionPreviewView *)v5->_captionPreviewView setBackgroundColor:v12];

    id v13 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v7, v9);
    [v13 addSubview:v5->_captionPreviewView];
    [v13 setUserInteractionEnabled:1];
    [(AXCaptionPreviewView *)v5->_captionPreviewView frame];
    -[AXCaptionPreviewView setOriginalFrame:](v5->_captionPreviewView, "setOriginalFrame:");
    [(AXCaptionPreviewCell *)v5 setBackgroundView:v13];
    v14 = +[UIColor clearColor];
    [(AXCloudShadowView *)v5->_shadowView setBackgroundColor:v14];

    [(AXCloudShadowView *)v5->_shadowView setUserInteractionEnabled:0];
    [(AXCaptionPreviewCell *)v5 addSubview:v5->_shadowView];
    v15 = v5;
  }
  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(AXCaptionPreviewCell *)self isHidden])
  {
    double v8 = 0;
  }
  else
  {
    -[AXCaptionPreviewCell convertPoint:toView:](self, "convertPoint:toView:", self->_captionPreviewView, x, y);
    double v10 = v9;
    double v12 = v11;
    if (-[AXCaptionPreviewView pointInside:withEvent:](self->_captionPreviewView, "pointInside:withEvent:", v7))
    {
      uint64_t v13 = -[AXCaptionPreviewView hitTest:withEvent:](self->_captionPreviewView, "hitTest:withEvent:", v7, v10, v12);
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)AXCaptionPreviewCell;
      uint64_t v13 = -[AXCaptionPreviewCell hitTest:withEvent:](&v15, "hitTest:withEvent:", v7, x, y);
    }
    double v8 = (void *)v13;
  }

  return v8;
}

- (void)dealloc
{
  [(AXCaptionPreviewView *)self->_captionPreviewView stopBackgroundAnimation];
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXCaptionPreviewCell;
  [(AXCaptionPreviewCell *)&v4 dealloc];
}

- (BOOL)cellEnabled
{
  return 1;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)AXCaptionPreviewCell;
  [(AXCaptionPreviewCell *)&v33 layoutSubviews];
  [(AXCaptionPreviewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(AXCaptionPreviewCell *)self contentView];
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);

  double v12 = [(AXCaptionPreviewCell *)self contentView];
  uint64_t v13 = [v12 superview];
  objc_msgSend(v13, "setBounds:", v4, v6, v8, v10);

  v14 = [(AXCaptionPreviewCell *)self superview];
  objc_super v15 = 0;
  if (v14)
  {
    do
    {
      AXSafeClassFromString();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v14;

        objc_super v15 = v16;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(AXCaptionPreviewCell *)self frame];
          double v19 = v18;
          [v15 frame];
          double v21 = -v20;
          self->_double xOffset = -v20;
          [v14 frame];
          -[AXCaptionPreviewCell setFrame:](self, "setFrame:", v21, v19);
          [(AXCaptionPreviewCell *)self bounds];
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          v30 = [(AXCaptionPreviewCell *)self backgroundView];
          objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

          break;
        }
      }
      uint64_t v17 = [v14 superview];

      v14 = (void *)v17;
    }
    while (v17);
  }
  [(AXCaptionPreviewCell *)self bounds];
  [(AXCaptionPreviewView *)self->_captionPreviewView frame];
  -[AXCaptionPreviewView setFrame:](self->_captionPreviewView, "setFrame:");
  v31 = AXTableViewForCell(self);
  v32 = v31;
  if (v31) {
    [v31 contentOffset];
  }
  [(AXCaptionPreviewView *)self->_captionPreviewView visibleFrame];
  -[AXCloudShadowView setFrame:](self->_shadowView, "setFrame:");
  [(AXCloudShadowView *)self->_shadowView layoutSubviews];
}

- (double)xOffset
{
  return self->_xOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);

  objc_storeStrong((id *)&self->_captionPreviewView, 0);
}

@end