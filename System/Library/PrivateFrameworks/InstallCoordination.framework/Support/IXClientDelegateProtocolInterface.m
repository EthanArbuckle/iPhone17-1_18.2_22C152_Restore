@interface IXClientDelegateProtocolInterface
+ (id)interface;
+ (id)interfaceProtocol;
+ (id)new;
- (IXClientDelegateProtocolInterface)init;
@end

@implementation IXClientDelegateProtocolInterface

- (IXClientDelegateProtocolInterface)init
{
  result = (IXClientDelegateProtocolInterface *)_os_crash();
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

+ (id)interface
{
  id v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&qword_100109FD8);
  if (!WeakRetained)
  {
    v4 = [v2 interfaceProtocol];
    WeakRetained = +[NSXPCInterface interfaceWithProtocol:v4];

    [v2 configureInterface:WeakRetained];
    objc_storeWeak(&qword_100109FD8, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &OBJC_PROTOCOL___IXClientDelegateProtocol;
}

@end