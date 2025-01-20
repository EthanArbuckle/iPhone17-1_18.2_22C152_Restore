@interface AMSDialogButton
+ (id)buttonWithTitle:(id)a3 handler:(id)a4;
+ (id)buttonWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (AMSDialogButton)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (NSString)title;
- (id)handler;
- (int64_t)style;
- (void)setHandler:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation AMSDialogButton

- (AMSDialogButton)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDialogButton;
  v10 = [(AMSDialogButton *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_title, a3);
    v12 = _Block_copy(v9);
    id handler = v11->_handler;
    v11->_id handler = v12;

    v11->_style = 0;
  }

  return v11;
}

+ (id)buttonWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [[AMSDialogButton alloc] initWithTitle:v8 style:a4 handler:v7];

  return v9;
}

+ (id)buttonWithTitle:(id)a3 handler:(id)a4
{
  return (id)[a1 buttonWithTitle:a3 style:0 handler:a4];
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end