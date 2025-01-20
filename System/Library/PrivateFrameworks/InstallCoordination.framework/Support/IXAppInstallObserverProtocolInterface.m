@interface IXAppInstallObserverProtocolInterface
+ (id)interface;
+ (id)interfaceProtocol;
+ (id)new;
- (IXAppInstallObserverProtocolInterface)init;
@end

@implementation IXAppInstallObserverProtocolInterface

- (IXAppInstallObserverProtocolInterface)init
{
  result = (IXAppInstallObserverProtocolInterface *)_os_crash();
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
  WeakRetained = objc_loadWeakRetained(&qword_100109FB8);
  if (!WeakRetained)
  {
    v4 = [v2 interfaceProtocol];
    WeakRetained = +[NSXPCInterface interfaceWithProtocol:v4];

    [v2 configureInterface:WeakRetained];
    objc_storeWeak(&qword_100109FB8, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &OBJC_PROTOCOL___IXAppInstallObserverProtocol;
}

@end