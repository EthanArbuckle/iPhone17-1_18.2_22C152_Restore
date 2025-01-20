@interface SelectAccountsUIXPCService
- (void)cancelled;
- (void)failedWith:(id)a3;
- (void)updated:(id)a3;
@end

@implementation SelectAccountsUIXPCService

- (void)updated:(id)a3
{
  uint64_t v3 = *(void *)((char *)a3 + OBJC_IVAR___XPCAccountSelectionResult_value);
  uint64_t v4 = *(void *)self->continuationState;
  uint64_t v5 = v4 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v4 + 16);
  v6 = (os_unfair_lock_s *)(v4 + ((*(unsigned int *)(*(void *)v4 + 48) + 3) & 0x1FFFFFFFCLL));
  id v7 = a3;
  swift_retain();
  sub_243380AC0(v3);
  os_unfair_lock_lock(v6);
  sub_2436766B4(v5);
  os_unfair_lock_unlock(v6);
  sub_243380B54(v3);

  swift_release();
}

- (void)cancelled
{
  uint64_t v2 = *(void *)self->continuationState;
  uint64_t v3 = v2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v2 + 16);
  uint64_t v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(void *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_2436766B4(v3);
  os_unfair_lock_unlock(v4);
  swift_release();
}

- (void)failedWith:(id)a3
{
  uint64_t v3 = *(void *)self->continuationState;
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  id v6 = a3;
  swift_retain();
  os_unfair_lock_lock(v5);
  sub_2436766B4(v4);
  os_unfair_lock_unlock(v5);
  swift_release();
}

@end