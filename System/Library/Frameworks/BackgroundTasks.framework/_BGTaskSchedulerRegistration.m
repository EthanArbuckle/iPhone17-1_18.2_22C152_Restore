@interface _BGTaskSchedulerRegistration
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (_BGTaskSchedulerRegistration)initWithIdentifier:(id)a3 queue:(id)a4 launchHandler:(id)a5;
- (id)launchHandler;
- (void)setIdentifier:(id)a3;
- (void)setLaunchHandler:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _BGTaskSchedulerRegistration

- (_BGTaskSchedulerRegistration)initWithIdentifier:(id)a3 queue:(id)a4 launchHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_BGTaskSchedulerRegistration;
  v12 = [(_BGTaskSchedulerRegistration *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_queue, a4);
    uint64_t v14 = MEMORY[0x21D4B0AB0](v11);
    id launchHandler = v13->_launchHandler;
    v13->_id launchHandler = (id)v14;
  }
  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)launchHandler
{
  return self->_launchHandler;
}

- (void)setLaunchHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_launchHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end