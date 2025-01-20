@interface BGSystemTaskSchedulerRegistration
- (BGSystemTaskRequest)taskRequest;
- (BGSystemTaskSchedulerRegistration)initWithIdentifier:(id)a3 launchQueue:(id)a4 launchHandler:(id)a5;
- (NSString)identifier;
- (OS_dispatch_queue)launchQueue;
- (OS_xpc_object)descriptor;
- (id)launchHandler;
- (void)setDescriptor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLaunchHandler:(id)a3;
- (void)setLaunchQueue:(id)a3;
- (void)setTaskRequest:(id)a3;
@end

@implementation BGSystemTaskSchedulerRegistration

- (BGSystemTaskSchedulerRegistration)initWithIdentifier:(id)a3 launchQueue:(id)a4 launchHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BGSystemTaskSchedulerRegistration;
  v12 = [(BGSystemTaskSchedulerRegistration *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_launchQueue, a4);
    uint64_t v14 = MEMORY[0x1E0165700](v11);
    id launchHandler = v13->_launchHandler;
    v13->_id launchHandler = (id)v14;
  }
  return v13;
}

- (void)setTaskRequest:(id)a3
{
}

- (void)setDescriptor:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (OS_dispatch_queue)launchQueue
{
  return self->_launchQueue;
}

- (void)setLaunchQueue:(id)a3
{
}

- (id)launchHandler
{
  return self->_launchHandler;
}

- (void)setLaunchHandler:(id)a3
{
}

- (BGSystemTaskRequest)taskRequest
{
  return self->_taskRequest;
}

- (OS_xpc_object)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_taskRequest, 0);
  objc_storeStrong(&self->_launchHandler, 0);
  objc_storeStrong((id *)&self->_launchQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end