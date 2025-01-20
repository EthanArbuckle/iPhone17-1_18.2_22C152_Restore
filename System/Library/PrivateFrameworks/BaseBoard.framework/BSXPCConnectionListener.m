@interface BSXPCConnectionListener
- (id)description;
- (void)dealloc;
@end

@implementation BSXPCConnectionListener

- (void)dealloc
{
  if (self)
  {
    connection = self->_connection;
    self->_connection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BSXPCConnectionListener;
  [(BSXPCConnectionListener *)&v4 dealloc];
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_service withName:@"service"];
  id v5 = (id)[v3 appendQueue:self->_queue withName:@"queue"];
  v6 = [v3 build];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end