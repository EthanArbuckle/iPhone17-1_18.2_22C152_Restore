@interface SelectRouteDescriptorWithCompletionCallback
@end

@implementation SelectRouteDescriptorWithCompletionCallback

uint64_t __routingContextResilientRemote_SelectRouteDescriptorWithCompletionCallback_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 216);
  if (!v9) {
    return 4294954514;
  }
  return v9(a2, v3, v4, v5, v6);
}

@end