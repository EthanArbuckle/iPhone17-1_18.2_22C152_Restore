@interface AVTCameraCollectionViewCell
- (AVTCameraCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIView)cameraCellView;
- (void)layoutSubviews;
- (void)setCameraCellView:(id)a3;
- (void)updateCameraViewFrame;
@end

@implementation AVTCameraCollectionViewCell

- (AVTCameraCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVTCameraCollectionViewCell;
  v3 = -[AVTStickerCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[AVTCameraItemView initWithFrame:]([AVTCameraItemView alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    [(AVTCameraCollectionViewCell *)v3 setCameraCellView:v4];

    v5 = [(AVTCameraCollectionViewCell *)v3 contentView];
    v6 = [(AVTCameraCollectionViewCell *)v3 cameraCellView];
    [v5 addSubview:v6];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTCameraCollectionViewCell;
  [(AVTStickerCollectionViewCell *)&v3 layoutSubviews];
  [(AVTCameraCollectionViewCell *)self updateCameraViewFrame];
}

- (void)updateCameraViewFrame
{
  objc_super v3 = [(AVTCameraCollectionViewCell *)self cameraCellView];
  [v3 setAutoresizingMask:18];

  v4 = [(AVTCameraCollectionViewCell *)self contentView];
  [v4 bounds];
  CGRect v16 = CGRectInset(v15, 20.0, 20.0);
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;

  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  CGRect v18 = CGRectInset(v17, fmax((width - fmin(width, 107.0)) * 0.5, 0.0), fmax((height - fmin(height, 107.0)) * 0.5, 0.0));
  double v9 = v18.origin.x;
  double v10 = v18.origin.y;
  double v11 = v18.size.width;
  double v12 = v18.size.height;
  id v13 = [(AVTCameraCollectionViewCell *)self cameraCellView];
  objc_msgSend(v13, "setFrame:", v9, v10, v11, v12);
}

- (UIView)cameraCellView
{
  return self->_cameraCellView;
}

- (void)setCameraCellView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end