@interface DispatchHelper
@end

@implementation DispatchHelper

void __pap_DispatchHelper_block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (!*(unsigned char *)v2 && (uint64_t v11 = *(void *)(v2 + 280)) != 0 && v11 == a1[7])
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v3 = a1[4];
    if (v3) {
      dispatch_semaphore_signal(v3);
    }
  }
  v4 = (const void *)a1[7];
  if (v4) {
    CFRelease(v4);
  }
  v5 = (const void *)a1[8];
  if (v5) {
    CFRelease(v5);
  }
  v6 = (const void *)a1[9];
  if (v6) {
    CFRelease(v6);
  }
  v7 = a1[4];
  if (v7) {
    dispatch_release(v7);
  }
  v8 = (const void *)a1[10];
  if (v8) {
    CFRelease(v8);
  }
  v9 = (const void *)a1[11];
  if (v9) {
    CFRelease(v9);
  }
  v10 = (const void *)a1[12];
  if (v10)
  {
    CFRelease(v10);
  }
}

@end