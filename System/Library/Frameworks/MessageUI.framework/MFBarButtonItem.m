@interface MFBarButtonItem
- (MFBarButtonItem)initWithImage:(id)a3 disabledImage:(id)a4 style:(int64_t)a5 target:(id)a6 action:(SEL)a7;
- (UIImage)disabledImage;
- (UIImage)enabledImage;
- (void)setDisabledImage:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabledImage:(id)a3;
@end

@implementation MFBarButtonItem

- (MFBarButtonItem)initWithImage:(id)a3 disabledImage:(id)a4 style:(int64_t)a5 target:(id)a6 action:(SEL)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MFBarButtonItem;
  v15 = [(MFBarButtonItem *)&v18 initWithImage:v13 style:a5 target:a6 action:a7];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_enabledImage, a3);
    objc_storeStrong((id *)&v16->_disabledImage, a4);
  }

  return v16;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFBarButtonItem;
  -[MFBarButtonItem setEnabled:](&v7, sel_setEnabled_);
  v5 = [(MFBarButtonItem *)self disabledImage];

  if (v5)
  {
    if (v3) {
      [(MFBarButtonItem *)self enabledImage];
    }
    else {
    v6 = [(MFBarButtonItem *)self disabledImage];
    }
    [(MFBarButtonItem *)self setImage:v6];
  }
}

- (UIImage)enabledImage
{
  return self->_enabledImage;
}

- (void)setEnabledImage:(id)a3
{
}

- (UIImage)disabledImage
{
  return self->_disabledImage;
}

- (void)setDisabledImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledImage, 0);

  objc_storeStrong((id *)&self->_enabledImage, 0);
}

@end