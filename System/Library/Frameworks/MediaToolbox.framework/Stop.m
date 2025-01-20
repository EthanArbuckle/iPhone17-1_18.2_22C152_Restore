@interface Stop
@end

@implementation Stop

void __fileWriterSink_Stop_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 32);

  _Block_release(v2);
}

@end