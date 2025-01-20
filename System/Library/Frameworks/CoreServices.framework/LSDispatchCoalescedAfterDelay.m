@interface LSDispatchCoalescedAfterDelay
@end

@implementation LSDispatchCoalescedAfterDelay

void ___LSDispatchCoalescedAfterDelay_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  atomic_fetch_and(*(atomic_uchar *volatile *)(a1 + 40), 0x7Fu);

  JUMPOUT(0x185310460);
}

@end