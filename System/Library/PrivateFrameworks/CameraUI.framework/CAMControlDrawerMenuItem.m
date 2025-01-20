@interface CAMControlDrawerMenuItem
- (CAMControlDrawerMenuItem)initWithTitle:(id)a3 selectedTitle:(id)a4 value:(id)a5;
- (CAMControlDrawerMenuItem)initWithTitle:(id)a3 value:(id)a4;
- (NSNumber)value;
- (NSString)selectedTitle;
- (NSString)title;
@end

@implementation CAMControlDrawerMenuItem

- (CAMControlDrawerMenuItem)initWithTitle:(id)a3 value:(id)a4
{
  return [(CAMControlDrawerMenuItem *)self initWithTitle:a3 selectedTitle:a3 value:a4];
}

- (CAMControlDrawerMenuItem)initWithTitle:(id)a3 selectedTitle:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CAMControlDrawerMenuItem;
  v11 = [(CAMControlDrawerMenuItem *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    selectedTitle = v11->_selectedTitle;
    v11->_selectedTitle = (NSString *)v14;

    objc_storeStrong((id *)&v11->_value, a5);
  }

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)selectedTitle
{
  return self->_selectedTitle;
}

- (NSNumber)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_selectedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end