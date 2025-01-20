@interface AAUIImageControl
- (AAUIImageControl)initWithCoder:(id)a3;
- (AAUIImageControl)initWithFrame:(CGRect)a3;
- (AAUILabel)label;
- (UIImageView)imageView;
- (void)_updateLabelVisibility;
- (void)_updateOverlayViewVisibility;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation AAUIImageControl

- (AAUIImageControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIImageControl;
  v3 = -[AAUIImageControl initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    sub_9180(v3);
  }
  return v4;
}

- (AAUIImageControl)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIImageControl;
  v3 = [(AAUIImageControl *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    sub_9180(v3);
  }
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AAUIImageControl;
  [(AAUIImageControl *)&v4 setEnabled:a3];
  [(AAUIImageControl *)self _updateLabelVisibility];
}

- (void)_updateLabelVisibility
{
  label = self->_label;
  uint64_t v3 = [(AAUIImageControl *)self isEnabled] ^ 1;

  [(AAUILabel *)label setHidden:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AAUIImageControl;
  -[AAUIImageControl setHighlighted:](&v5, "setHighlighted:");
  [(UIImageView *)self->_imageView setHighlighted:v3];
  [(AAUILabel *)self->_label setHighlighted:v3];
  [(AAUIImageControl *)self _updateOverlayViewVisibility];
}

- (void)_updateOverlayViewVisibility
{
  BOOL v3 = ![(AAUIImageControl *)self isEnabled]
    || ([(AAUIImageControl *)self isHighlighted] & 1) == 0;
  overlayView = self->_overlayView;

  [(UIView *)overlayView setHidden:v3];
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (AAUILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end