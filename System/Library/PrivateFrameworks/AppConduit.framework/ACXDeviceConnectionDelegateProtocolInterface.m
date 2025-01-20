@interface ACXDeviceConnectionDelegateProtocolInterface
+ (id)interface;
+ (id)interfaceProtocol;
+ (id)new;
+ (void)configureInterface:(id)a3;
- (ACXDeviceConnectionDelegateProtocolInterface)init;
@end

@implementation ACXDeviceConnectionDelegateProtocolInterface

- (ACXDeviceConnectionDelegateProtocolInterface)init
{
  result = (ACXDeviceConnectionDelegateProtocolInterface *)_os_crash();
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
  WeakRetained = objc_loadWeakRetained(&interface_weakInterface_137);
  if (!WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E4F29280];
    v5 = [v2 interfaceProtocol];
    WeakRetained = [v4 interfaceWithProtocol:v5];

    [v2 configureInterface:WeakRetained];
    objc_storeWeak(&interface_weakInterface_137, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &unk_1F38B0E48;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_applicationsInstalled_onDeviceWithPairingID_ argumentIndex:0 ofReply:0];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v9 forSelector:sel_applicationsUpdated_onDeviceWithPairingID_ argumentIndex:0 ofReply:0];
}

@end