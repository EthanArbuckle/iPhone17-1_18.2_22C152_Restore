@interface CNCountdownLatch
- (BOOL)awaitOnSemaphoreWithTimeout:(double)a3;
- (BOOL)awaitWhileSpinningRunloopWithTimeout:(double)a3;
- (BOOL)awaitWithTimeout:(double)a3;
- (BOOL)awaitWithTimeout:(double)a3 strategy:(unint64_t)a4;
- (BOOL)hasLatched;
- (CNCountdownLatch)init;
- (CNCountdownLatch)initWithStartingCount:(unint64_t)a3;
- (id)description;
- (void)await;
- (void)countDown;
@end

@implementation CNCountdownLatch

- (CNCountdownLatch)init
{
  return [(CNCountdownLatch *)self initWithStartingCount:0];
}

- (CNCountdownLatch)initWithStartingCount:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CNCountdownLatch;
  v4 = [(CNCountdownLatch *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v6 = objc_alloc_init(CNUnfairLock);
    lock = v5->_lock;
    v5->_lock = v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    latchedSemaphore = v5->_latchedSemaphore;
    v5->_latchedSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"count" unsignedInteger:self->_count];
  v5 = [v3 build];

  return v5;
}

- (void)countDown
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__CNCountdownLatch_countDown__block_invoke;
  v3[3] = &unk_1E569F9D8;
  v3[4] = self;
  CNRunWithLock(lock, v3);
}

intptr_t __29__CNCountdownLatch_countDown__block_invoke(intptr_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2)
  {
    *(void *)(v1 + 8) = v2 - 1;
    uint64_t v3 = *(void *)(result + 32);
    if (!*(void *)(v3 + 8)) {
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 24));
    }
  }
  return result;
}

- (void)await
{
}

- (BOOL)awaitWithTimeout:(double)a3
{
  return [(CNCountdownLatch *)self awaitWithTimeout:0 strategy:a3];
}

- (BOOL)awaitWithTimeout:(double)a3 strategy:(unint64_t)a4
{
  if (a3 <= 0.0) {
    return [(CNCountdownLatch *)self awaitImmediate];
  }
  if (a4 == 1) {
    return [(CNCountdownLatch *)self awaitWhileSpinningRunloopWithTimeout:"awaitWhileSpinningRunloopWithTimeout:"];
  }
  return [(CNCountdownLatch *)self awaitOnSemaphoreWithTimeout:"awaitOnSemaphoreWithTimeout:"];
}

- (BOOL)hasLatched
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CNCountdownLatch_hasLatched__block_invoke;
  v5[3] = &unk_1E569F9B0;
  v5[4] = self;
  v5[5] = &v6;
  CNRunWithLock(lock, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__CNCountdownLatch_hasLatched__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) == 0;
  return result;
}

- (BOOL)awaitOnSemaphoreWithTimeout:(double)a3
{
  BOOL v4 = CNDispatchSemaphoreWait(self->_latchedSemaphore, a3);
  if (v4) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_latchedSemaphore);
  }
  return v4;
}

- (BOOL)awaitWhileSpinningRunloopWithTimeout:(double)a3
{
  BOOL v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
  do
  {
    v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.1];
    uint64_t v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v6 runUntilDate:v5];

    BOOL v7 = [(CNCountdownLatch *)self hasLatched];
    [v4 timeIntervalSinceNow];
  }
  while (v8 > 0.0 && !v7);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latchedSemaphore, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end