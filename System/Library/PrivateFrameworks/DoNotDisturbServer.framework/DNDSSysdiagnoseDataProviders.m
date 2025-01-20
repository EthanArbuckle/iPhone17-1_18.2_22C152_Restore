@interface DNDSSysdiagnoseDataProviders
@end

@implementation DNDSSysdiagnoseDataProviders

uint64_t ___DNDSSysdiagnoseDataProviders_block_invoke()
{
  _sysdiagnoseInProgress = 0;
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.sysdiagnose.statehandler", v0);
  v2 = (void *)_sysdiagnoseQueue;
  _sysdiagnoseQueue = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  uint64_t v4 = _DNDSSysdiagnoseDataProviders_sysdiagnoseDataProviders;
  _DNDSSysdiagnoseDataProviders_sysdiagnoseDataProviders = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

@end