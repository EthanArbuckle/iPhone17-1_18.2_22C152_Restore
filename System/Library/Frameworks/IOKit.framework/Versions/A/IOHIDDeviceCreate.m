@interface IOHIDDeviceCreate
@end

@implementation IOHIDDeviceCreate

__n128 __IOHIDDeviceCreate_block_invoke()
{
  long long v0 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 32);
  xmmword_1E9133ED0 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
  *(_OWORD *)&qword_1E9133EE0 = v0;
  __n128 result = *(__n128 *)MEMORY[0x1E4F1D548];
  __callbackBaseSetCallbacks = *MEMORY[0x1E4F1D548];
  qword_1E9133EE0 = (uint64_t)__IOHIDDeviceCallbackBaseDataIsEqual;
  return result;
}

@end