@interface DisplayRelease
@end

@implementation DisplayRelease

void ____DisplayRelease_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 12504)) {
    CFXRelease(*(void ***)(*(void *)(a1 + 32) + 12504));
  }
  if (*(void *)(*(void *)(a1 + 32) + 12480))
  {
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 12480));
    *(void *)(*(void *)(a1 + 32) + 12480) = 0;
  }
  if (*(void *)(*(void *)(a1 + 32) + 12576))
  {
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 12576));
    *(void *)(*(void *)(a1 + 32) + 12576) = 0;
  }
}

@end