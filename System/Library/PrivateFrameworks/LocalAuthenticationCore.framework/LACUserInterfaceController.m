@interface LACUserInterfaceController
- (LACUserInterfaceController)init;
- (id)userInterface;
- (id)userInterfaceWithUUID:(id)a3;
- (void)terminateAllUserInterfacesWithReason:(id)a3;
- (void)terminateUserInterfaceWithUUID:(id)a3 reason:(id)a4;
@end

@implementation LACUserInterfaceController

- (void)terminateUserInterfaceWithUUID:(id)a3 reason:(id)a4
{
  activeUserInterfaces = self->_activeUserInterfaces;
  id v6 = a4;
  id v7 = [(NSMapTable *)activeUserInterfaces objectForKey:a3];
  [v7 terminateWithReason:v6];
}

- (LACUserInterfaceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)LACUserInterfaceController;
  v2 = [(LACUserInterfaceController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    activeUserInterfaces = v2->_activeUserInterfaces;
    v2->_activeUserInterfaces = (NSMapTable *)v3;
  }
  return v2;
}

- (id)userInterface
{
  uint64_t v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [(LACUserInterfaceController *)self userInterfaceWithUUID:v3];

  return v4;
}

- (id)userInterfaceWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [[LACUserInterfaceSpringBoardAdapter alloc] initWithBundleId:@"com.apple.CoreAuthUI" configurationId:@"RemoteAlert"];
  [(NSMapTable *)self->_activeUserInterfaces setObject:v5 forKey:v4];

  return v5;
}

- (void)terminateAllUserInterfacesWithReason:(id)a3
{
  id v8 = a3;
  id v4 = [(NSMapTable *)self->_activeUserInterfaces objectEnumerator];
  v5 = [v4 nextObject];

  if (v5)
  {
    do
    {
      [v5 terminateWithReason:v8];
      objc_super v6 = [(NSMapTable *)self->_activeUserInterfaces objectEnumerator];
      uint64_t v7 = [v6 nextObject];

      v5 = (void *)v7;
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end