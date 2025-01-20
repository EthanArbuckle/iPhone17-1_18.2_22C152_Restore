@interface ABDelayedBlockExecutor
- (void)_cancelScheduledBlock;
- (void)cancelPendingBlock;
- (void)pause;
- (void)reschedulePendingBlock;
- (void)resume;
- (void)scheduleBlock:(double)a3 delay:;
@end

@implementation ABDelayedBlockExecutor

- (void)scheduleBlock:(double)a3 delay:
{
  id v12 = a2;
  if (a1)
  {
    [(id)a1 _cancelScheduledBlock];
    uint64_t v5 = MEMORY[0x24C555A80](v12);
    v6 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v5;

    uint64_t v7 = [NSNumber numberWithDouble:a3];
    v8 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v7;

    if (!*(unsigned char *)(a1 + 32))
    {
      dispatch_block_t v9 = dispatch_block_create((dispatch_block_flags_t)0, *(dispatch_block_t *)(a1 + 8));
      v10 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v9;

      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      dispatch_after(v11, MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 16));
    }
  }
}

- (void)reschedulePendingBlock
{
  if (a1)
  {
    v2 = *(void **)(a1 + 24);
    if (v2)
    {
      [v2 doubleValue];
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        -[ABDelayedBlockExecutor scheduleBlock:delay:](a1, v4, v3);
      }
    }
  }
}

- (void)cancelPendingBlock
{
  if (a1)
  {
    [a1 _cancelScheduledBlock];
    v2 = (void *)a1[1];
    a1[1] = 0;

    double v3 = (void *)a1[3];
    a1[3] = 0;
  }
}

- (void)pause
{
  if (a1)
  {
    if (!*((unsigned char *)a1 + 32))
    {
      *((unsigned char *)a1 + 32) = 1;
      return (void *)[a1 _cancelScheduledBlock];
    }
  }
  return a1;
}

- (void)resume
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 32))
    {
      *(unsigned char *)(a1 + 32) = 0;
      -[ABDelayedBlockExecutor reschedulePendingBlock](a1);
    }
  }
}

- (void)_cancelScheduledBlock
{
  id scheduledBlock = self->_scheduledBlock;
  if (scheduledBlock)
  {
    dispatch_block_cancel(scheduledBlock);
    id v4 = self->_scheduledBlock;
    self->_id scheduledBlock = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delay, 0);
  objc_storeStrong(&self->_scheduledBlock, 0);

  objc_storeStrong(&self->_block, 0);
}

@end