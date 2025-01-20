@interface CUIKIntegrationAlertAction
- (CUIKIntegrationAlertAction)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
- (NSString)title;
- (int64_t)style;
- (void)actionChosen;
@end

@implementation CUIKIntegrationAlertAction

- (CUIKIntegrationAlertAction)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CUIKIntegrationAlertAction;
  v11 = [(CUIKIntegrationAlertAction *)&v16 init];
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

- (void)actionChosen
{
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end