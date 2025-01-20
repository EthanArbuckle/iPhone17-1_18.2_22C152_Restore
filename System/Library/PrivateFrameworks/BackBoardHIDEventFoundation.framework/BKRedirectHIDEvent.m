@interface BKRedirectHIDEvent
@end

@implementation BKRedirectHIDEvent

void ___BKRedirectHIDEvent_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setDisplay:v3];
  [v4 setPid:*(unsigned int *)(a1 + 48)];
  [v4 setToken:*(void *)(a1 + 40)];
}

@end