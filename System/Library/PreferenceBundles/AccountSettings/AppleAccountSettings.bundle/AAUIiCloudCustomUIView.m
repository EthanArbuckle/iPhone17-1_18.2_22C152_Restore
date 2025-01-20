@interface AAUIiCloudCustomUIView
- (UIColor)lockedColor;
- (void)setBackgroundColor:(id)a3;
- (void)setLockedColor:(id)a3;
@end

@implementation AAUIiCloudCustomUIView

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  v5 = [(AAUIiCloudCustomUIView *)self lockedColor];

  if (v5)
  {
    id v6 = [(AAUIiCloudCustomUIView *)self lockedColor];
  }
  else
  {
    id v6 = v4;
  }
  v7 = v6;
  v8.receiver = self;
  v8.super_class = (Class)AAUIiCloudCustomUIView;
  [(AAUIiCloudCustomUIView *)&v8 setBackgroundColor:v6];
}

- (UIColor)lockedColor
{
  return self->_lockedColor;
}

- (void)setLockedColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end