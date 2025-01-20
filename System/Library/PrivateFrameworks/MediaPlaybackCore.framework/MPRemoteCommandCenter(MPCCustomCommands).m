@interface MPRemoteCommandCenter(MPCCustomCommands)
- (id)debugCommand;
- (id)shareQueueCommand;
@end

@implementation MPRemoteCommandCenter(MPCCustomCommands)

- (id)debugCommand
{
  v2 = objc_getAssociatedObject(a1, "debugCommand");
  if (!v2)
  {
    v2 = [a1 _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:99990];
    objc_setAssociatedObject(a1, "debugCommand", v2, (void *)1);
  }

  return v2;
}

- (id)shareQueueCommand
{
  v2 = objc_getAssociatedObject(a1, "shareQueueCommand");
  if (!v2)
  {
    v2 = [a1 _createRemoteCommandWithConcreteClass:objc_opt_class() mediaRemoteType:25020];
    objc_setAssociatedObject(a1, "shareQueueCommand", v2, (void *)1);
  }

  return v2;
}

@end