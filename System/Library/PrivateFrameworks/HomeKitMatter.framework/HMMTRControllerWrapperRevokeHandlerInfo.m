@interface HMMTRControllerWrapperRevokeHandlerInfo
- (HMMTRControllerWrapperRevokeHandlerInfo)initWithHandler:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (id)handler;
@end

@implementation HMMTRControllerWrapperRevokeHandlerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)handler
{
  return self->_handler;
}

- (HMMTRControllerWrapperRevokeHandlerInfo)initWithHandler:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRControllerWrapperRevokeHandlerInfo;
  v8 = [(HMMTRControllerWrapperRevokeHandlerInfo *)&v12 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x2533B66E0](v6);
    id handler = v8->_handler;
    v8->_id handler = (id)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
  }

  return v8;
}

@end