@interface ACXDeviceConnectionProtocolInterface
+ (id)interface;
+ (id)interfaceProtocol;
+ (id)new;
+ (void)configureInterface:(id)a3;
- (ACXDeviceConnectionProtocolInterface)init;
@end

@implementation ACXDeviceConnectionProtocolInterface

- (ACXDeviceConnectionProtocolInterface)init
{
  result = (ACXDeviceConnectionProtocolInterface *)_os_crash();
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
  return &unk_1F38B5570;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v7 forSelector:sel_fetchLocalizedValuesFromAllDevicesForInfoPlistKeys_forAppWithBundleID_fetchingFirstMatchingLocalizationInList_completion_ argumentIndex:0 ofReply:1];
}

@end