@interface DDUIAction
- (DDAction)dd_action;
- (id)dd_handler;
- (void)dd_performAction;
- (void)dd_performActionWithRect:(CGRect)a3;
- (void)setDd_action:(id)a3;
- (void)setDd_handler:(id)a3;
@end

@implementation DDUIAction

- (void)dd_performAction
{
  v3 = [(DDUIAction *)self dd_handler];

  if (v3)
  {
    v4 = [(DDUIAction *)self dd_handler];
    v4[2](v4, self);
  }
}

- (void)dd_performActionWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(DDUIAction *)self dd_action];
  objc_msgSend(v8, "updateSourceRect:", x, y, width, height);

  [(DDUIAction *)self dd_performAction];
}

- (DDAction)dd_action
{
  return self->_dd_action;
}

- (void)setDd_action:(id)a3
{
}

- (id)dd_handler
{
  return self->_dd_handler;
}

- (void)setDd_handler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dd_handler, 0);
  objc_storeStrong((id *)&self->_dd_action, 0);
}

@end