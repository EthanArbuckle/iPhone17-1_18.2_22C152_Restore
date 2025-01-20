@interface FigExternalStorageDeviceManager
@end

@implementation FigExternalStorageDeviceManager

uint64_t __FigExternalStorageDeviceManager_BeginMonitoring_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __fedm_startMonitoringForExternalDevices_block_invoke;
  v3[3] = &__block_descriptor_40_e34_v24__0__NSDictionary_8__NSError_16l;
  v3[4] = v1;
  uint64_t result = [MEMORY[0x1E4F25D68] beginMonitoringProviderDomainChangesWithHandler:v3];
  *(void *)(v1 + 24) = result;
  return result;
}

@end