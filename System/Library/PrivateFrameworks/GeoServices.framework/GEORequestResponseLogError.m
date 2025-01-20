@interface GEORequestResponseLogError
@end

@implementation GEORequestResponseLogError

void ___GEORequestResponseLogError_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = rrPersister(*(void **)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v2) {
    [v3 persistResponseTask:v4 error:*(void *)(a1 + 32)];
  }
  else {
    [v3 persistResponseTaskCanceled:v4];
  }
}

@end