@interface RegisterForScreenIsBlankedByProximitySensorNotification
@end

@implementation RegisterForScreenIsBlankedByProximitySensorNotification

uint64_t __cmsmdevicestate_RegisterForScreenIsBlankedByProximitySensorNotification_block_invoke()
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(dword_1E935896C, &state64);
  if (result) {
    BOOL v1 = 1;
  }
  else {
    BOOL v1 = state64 == 0;
  }
  char v2 = !v1;
  byte_1E9358968 = v2;
  return result;
}

@end