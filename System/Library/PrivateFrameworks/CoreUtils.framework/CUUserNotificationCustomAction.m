@interface CUUserNotificationCustomAction
- (UNNotificationAction)action;
- (id)handler;
- (void)setAction:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation CUUserNotificationCustomAction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setAction:(id)a3
{
}

- (UNNotificationAction)action
{
  return self->_action;
}

@end