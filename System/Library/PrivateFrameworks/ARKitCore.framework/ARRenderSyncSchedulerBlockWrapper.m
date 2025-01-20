@interface ARRenderSyncSchedulerBlockWrapper
- (NSDate)entryTimestamp;
- (id)block;
- (void)setBlock:(id)a3;
- (void)setEntryTimestamp:(id)a3;
@end

@implementation ARRenderSyncSchedulerBlockWrapper

- (NSDate)entryTimestamp
{
  return self->_entryTimestamp;
}

- (void)setEntryTimestamp:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_entryTimestamp, 0);
}

@end