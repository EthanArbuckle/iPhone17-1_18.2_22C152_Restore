@interface FSAgentClientDelegate
- (id)instanceDeathHandler;
- (void)instanceExited:(id)a3 instanceUUID:(id)a4;
- (void)setInstanceDeathHandler:(id)a3;
@end

@implementation FSAgentClientDelegate

- (void)instanceExited:(id)a3 instanceUUID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  instanceDeathHandler = (void (**)(id, id, id))v7->_instanceDeathHandler;
  if (instanceDeathHandler) {
    instanceDeathHandler[2](instanceDeathHandler, v9, v6);
  }
  objc_sync_exit(v7);
}

- (id)instanceDeathHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setInstanceDeathHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end