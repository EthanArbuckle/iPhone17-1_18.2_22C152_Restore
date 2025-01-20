@interface CNActionItem
- (BOOL)disabled;
- (CNActionItem)initWithImage:(id)a3 type:(id)a4;
- (NSString)title;
- (NSString)type;
- (UIImage)image;
- (id)description;
- (void)setDisabled:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation CNActionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)type
{
  return self->_type;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNActionItem *)self title];
  id v5 = (id)[v3 appendName:@"title" object:v4];

  v6 = [(CNActionItem *)self type];
  id v7 = (id)[v3 appendName:@"type" object:v6];

  id v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"disabled", -[CNActionItem disabled](self, "disabled"));
  v9 = [v3 build];

  return v9;
}

- (CNActionItem)initWithImage:(id)a3 type:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNActionItem;
  v9 = [(CNActionItem *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_image, a3);
    objc_storeStrong((id *)&v10->_type, a4);
    v11 = v10;
  }

  return v10;
}

@end