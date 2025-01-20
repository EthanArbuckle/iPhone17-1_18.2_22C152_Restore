@interface FigNeroPlayServerEnqueueAudioBufferOnValeria
@end

@implementation FigNeroPlayServerEnqueueAudioBufferOnValeria

void ___FigNeroPlayServerEnqueueAudioBufferOnValeria_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void *)(a1[4] + 32);
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 40);
  if (v6) {
    v6(v3, v2);
  }
  v7 = (const void *)a1[5];
  if (v7) {
    CFRelease(v7);
  }
  v8 = (const void *)a1[6];
  if (v8)
  {
    CFRelease(v8);
  }
}

@end