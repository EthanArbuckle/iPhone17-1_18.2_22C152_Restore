@interface CUIKAlertAction
+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (CUIKAlertAction)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (NSString)title;
- (id)handler;
- (int64_t)style;
@end

@implementation CUIKAlertAction

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithTitle:v9 style:a4 handler:v8];

  return v10;
}

- (CUIKAlertAction)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CUIKAlertAction;
  v11 = [(CUIKAlertAction *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    v12->_style = a4;
    v13 = _Block_copy(v10);
    id handler = v12->_handler;
    v12->_id handler = v13;
  }
  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)style
{
  return self->_style;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end