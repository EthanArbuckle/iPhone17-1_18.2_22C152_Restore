@interface RegisterForScreenIsBlankedNotification
@end

@implementation RegisterForScreenIsBlankedNotification

uint64_t __cmsmdevicestate_RegisterForScreenIsBlankedNotification_block_invoke()
{
  uint64_t v0 = byte_1E9358950;
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(dword_1E9358954, &state64);
  if (result) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = state64 == 0;
  }
  char v3 = !v2;
  byte_1E9358950 = v3;
  if (off_1E9358960) {
    return ((uint64_t (*)(uint64_t))off_1E9358960)(v0);
  }
  return result;
}

@end