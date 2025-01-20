@interface AVTCollectionViewCell
+ (id)reuseIdentifier;
- (UIView)subview;
- (void)setSubview:(id)a3;
@end

@implementation AVTCollectionViewCell

+ (id)reuseIdentifier
{
  return @"AVTCollectionViewCell";
}

- (void)setSubview:(id)a3
{
  v5 = (UIView *)a3;
  subview = self->_subview;
  if (subview != v5)
  {
    v11 = v5;
    v7 = [(UIView *)subview superview];
    v8 = [(AVTCollectionViewCell *)self contentView];

    if (v7 == v8) {
      [(UIView *)self->_subview removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_subview, a3);
    v9 = [(AVTCollectionViewCell *)self contentView];
    [v9 bounds];
    -[UIView setFrame:](v11, "setFrame:");

    [(UIView *)v11 setAutoresizingMask:18];
    v10 = [(AVTCollectionViewCell *)self contentView];
    [v10 addSubview:v11];

    v5 = v11;
  }
  MEMORY[0x270F9A758](subview, v5);
}

- (UIView)subview
{
  return self->_subview;
}

- (void).cxx_destruct
{
}

@end