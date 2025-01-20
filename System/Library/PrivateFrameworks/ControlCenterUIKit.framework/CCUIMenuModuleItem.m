@interface CCUIMenuModuleItem
- (BOOL)isBusy;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (BOOL)isSelected;
- (BOOL)performAction;
- (CCUIMenuModuleItem)initWithTitle:(id)a3 identifier:(id)a4 handler:(id)a5;
- (CCUIMenuModuleItem)initWithTitle:(id)a3 identifier:(id)a4 image:(id)a5 handler:(id)a6;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)image;
- (id)description;
- (id)handler;
- (unint64_t)hash;
- (void)setBusy:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CCUIMenuModuleItem

- (CCUIMenuModuleItem)initWithTitle:(id)a3 identifier:(id)a4 handler:(id)a5
{
  return [(CCUIMenuModuleItem *)self initWithTitle:a3 identifier:a4 image:0 handler:a5];
}

- (CCUIMenuModuleItem)initWithTitle:(id)a3 identifier:(id)a4 image:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CCUIMenuModuleItem;
  v15 = [(CCUIMenuModuleItem *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_identifier, a4);
    uint64_t v17 = [v14 copy];
    id handler = v16->_handler;
    v16->_id handler = (id)v17;

    uint64_t v19 = [v13 copy];
    image = v16->_image;
    v16->_image = (UIImage *)v19;
  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CCUIMenuModuleItem *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(CCUIMenuModuleItem *)self identifier];
      v7 = [(CCUIMenuModuleItem *)v5 identifier];
      if (!BSEqualObjects())
      {
        char v13 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v8 = [(CCUIMenuModuleItem *)self title];
      v9 = [(CCUIMenuModuleItem *)v5 title];
      if (!BSEqualObjects())
      {
        char v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v10 = [(CCUIMenuModuleItem *)self image];
      id v11 = [(CCUIMenuModuleItem *)v5 image];
      if (!BSEqualObjects())
      {
        char v13 = 0;
LABEL_18:

        goto LABEL_19;
      }
      id v12 = [(CCUIMenuModuleItem *)self subtitle];
      v15 = [(CCUIMenuModuleItem *)v5 subtitle];
      if (!BSEqualObjects()) {
        goto LABEL_15;
      }
      [(CCUIMenuModuleItem *)self isBusy];
      [(CCUIMenuModuleItem *)v5 isBusy];
      if (!BSEqualBools())
      {
        char v13 = 0;
        goto LABEL_17;
      }
      [(CCUIMenuModuleItem *)self isPlaceholder];
      [(CCUIMenuModuleItem *)v5 isPlaceholder];
      if (BSEqualBools())
      {
        [(CCUIMenuModuleItem *)self isSelected];
        [(CCUIMenuModuleItem *)v5 isSelected];
        char v13 = BSEqualBools();
      }
      else
      {
LABEL_15:
        char v13 = 0;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v13 = 0;
  }
LABEL_21:

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v4 = [(CCUIMenuModuleItem *)self identifier];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(CCUIMenuModuleItem *)self title];
  id v7 = (id)[v3 appendObject:v6];

  v8 = [(CCUIMenuModuleItem *)self image];

  if (v8)
  {
    v9 = [(CCUIMenuModuleItem *)self image];
    id v10 = (id)[v3 appendObject:v9];
  }
  id v11 = [(CCUIMenuModuleItem *)self subtitle];
  id v12 = (id)[v3 appendObject:v11];

  id v13 = (id)objc_msgSend(v3, "appendBool:", -[CCUIMenuModuleItem isBusy](self, "isBusy"));
  id v14 = (id)objc_msgSend(v3, "appendBool:", -[CCUIMenuModuleItem isPlaceholder](self, "isPlaceholder"));
  id v15 = (id)objc_msgSend(v3, "appendBool:", -[CCUIMenuModuleItem isSelected](self, "isSelected"));
  unint64_t v16 = [v3 hash];

  return v16;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(CCUIMenuModuleItem *)self identifier];
  [v3 appendString:v4 withName:@"identifier"];

  id v5 = [(CCUIMenuModuleItem *)self title];
  [v3 appendString:v5 withName:@"title"];

  v6 = [(CCUIMenuModuleItem *)self image];
  id v7 = (id)[v3 appendObject:v6 withName:@"image" skipIfNil:1];

  v8 = [(CCUIMenuModuleItem *)self subtitle];
  [v3 appendString:v8 withName:@"subtitle" skipIfEmpty:1];

  id v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[CCUIMenuModuleItem isPlaceholder](self, "isPlaceholder"), @"placeholder", 1);
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[CCUIMenuModuleItem isSelected](self, "isSelected"), @"selected", 1);
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[CCUIMenuModuleItem isBusy](self, "isBusy"), @"busy", 1);
  id v12 = [v3 build];

  return v12;
}

- (BOOL)performAction
{
  id handler = (uint64_t (**)(void))self->_handler;
  if (handler) {
    LOBYTE(handler) = handler[2]();
  }
  return (char)handler;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (BOOL)isBusy
{
  return self->_busy;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end