@interface COMeshControllerQueuedCommand
- (COMeshCommand)command;
- (COMeshControllerQueuedCommand)initWithCommand:(id)a3 completionHandler:(id)a4;
- (COMeshNode)destination;
- (id)completionHandler;
- (void)invokeCallbackWithError:(id)a3;
- (void)setDestination:(id)a3;
@end

@implementation COMeshControllerQueuedCommand

- (COMeshControllerQueuedCommand)initWithCommand:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COMeshControllerQueuedCommand;
  v9 = [(COMeshControllerQueuedCommand *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_command, a3);
    uint64_t v11 = [v8 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v11;
  }
  return v10;
}

- (void)invokeCallbackWithError:(id)a3
{
  id v4 = a3;
  v6 = [(COMeshControllerQueuedCommand *)self completionHandler];
  v5 = [(COMeshControllerQueuedCommand *)self command];
  v6[2](v6, v5, v4);
}

- (COMeshCommand)command
{
  return self->_command;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (COMeshNode)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end