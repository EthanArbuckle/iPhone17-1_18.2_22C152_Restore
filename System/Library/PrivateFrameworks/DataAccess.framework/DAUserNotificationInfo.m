@interface DAUserNotificationInfo
- (NSString)groupIdentifier;
- (OS_dispatch_queue)callbackQueue;
- (id)handler;
- (void)setCallbackQueue:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation DAUserNotificationInfo

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  self->_callbackQueue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end