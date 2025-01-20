@interface SaveOrderUIXPCService
- (void)added;
- (void)cancelled;
- (void)failedWith:(id)a3;
@end

@implementation SaveOrderUIXPCService

- (void)added
{
  uint64_t v2 = *(void *)self->continuationState;
  uint64_t v3 = v2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(void *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_243946044(v3);
  os_unfair_lock_unlock(v4);
  swift_release();
}

- (void)cancelled
{
  uint64_t v2 = *(void *)self->continuationState;
  uint64_t v3 = v2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(void *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_243946044(v3);
  os_unfair_lock_unlock(v4);
  swift_release();
}

- (void)failedWith:(id)a3
{
  uint64_t v3 = *(void *)self->continuationState;
  uint64_t v4 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  id v6 = a3;
  swift_retain();
  os_unfair_lock_lock(v5);
  sub_243946044(v4);
  os_unfair_lock_unlock(v5);
  swift_release();
}

@end