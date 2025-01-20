@interface NSPersistentCloudKitContainerOptions(HomeEnergyDaemon)
+ (id)homeenergyd_optionsWithContainerIdentifier:()HomeEnergyDaemon apnsServiceName:;
@end

@implementation NSPersistentCloudKitContainerOptions(HomeEnergyDaemon)

+ (id)homeenergyd_optionsWithContainerIdentifier:()HomeEnergyDaemon apnsServiceName:
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setUseZoneWidePCS:1];
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF1F0]) initWithContainerIdentifier:v6];

  [v8 setUseDeviceToDeviceEncryption:1];
  [v8 setAutomaticallyScheduleImportAndExportOperations:1];
  [v8 setContainerOptions:v7];
  [v8 setApsConnectionMachServiceName:v5];

  id v9 = v8;

  return v9;
}

@end