@interface AVTToolbarButton
- (AVTToolbarButton)initWithTitle:(id)a3 isDefault:(BOOL)a4;
- (BOOL)isDefault;
- (NSString)title;
@end

@implementation AVTToolbarButton

- (AVTToolbarButton)initWithTitle:(id)a3 isDefault:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTToolbarButton;
  v8 = [(AVTToolbarButton *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_isDefault = a4;
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void).cxx_destruct
{
}

@end