@interface WFAvailableListeningModesForRoute
@end

@implementation WFAvailableListeningModesForRoute

__CFString *__WFAvailableListeningModesForRoute_block_invoke(uint64_t a1, void *a2)
{
  return WFListeningModeFromRawAVOutputDeviceBluetoothListeningModeValue(a2);
}

@end