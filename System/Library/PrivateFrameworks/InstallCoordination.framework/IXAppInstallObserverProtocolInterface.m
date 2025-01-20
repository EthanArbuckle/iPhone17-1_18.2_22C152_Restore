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
  WeakRetained = objc_loadWeakRetained(&interface_weakInterface);
  if (!WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E4F29280];
    v5 = [v2 interfaceProtocol];
    WeakRetained = [v4 interfaceWithProtocol:v5];

    [v2 configureInterface:WeakRetained];
    objc_storeWeak(&interface_weakInterface, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &unk_1EFE0C308;
}

@end