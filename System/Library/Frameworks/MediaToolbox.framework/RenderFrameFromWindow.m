@interface RenderFrameFromWindow
@end

@implementation RenderFrameFromWindow

void *__customVideoCompositor_RenderFrameFromWindow_block_invoke(void *result)
{
  uint64_t v1 = result[4];
  v2 = *(uint64_t (**)(void, void, void, void))(v1 + 176);
  if (v2) {
    return (void *)v2(*(void *)(v1 + 184), result[5], 0, result[6]);
  }
  return result;
}

@end