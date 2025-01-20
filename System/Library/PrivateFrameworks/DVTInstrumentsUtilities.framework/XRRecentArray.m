@interface XRRecentArray
- (BOOL)containsEntry:(id)a3;
- (XRRecentArray)init;
- (XRRecentArray)initWithMaximumRecentCount:(unint64_t)a3;
- (id)entries;
- (id)entryAtIndex:(unint64_t)a3;
- (unint64_t)maximumRecentCount;
- (void)addEntry:(id)a3;
- (void)removeEntry:(id)a3;
- (void)removeEntryAtIndex:(unint64_t)a3;
- (void)setMaximumRecentCount:(unint64_t)a3;
@end

@implementation XRRecentArray

- (XRRecentArray)init
{
  return (XRRecentArray *)((uint64_t (*)(XRRecentArray *, char *, uint64_t))MEMORY[0x270F9A6D0])(self, sel_initWithMaximumRecentCount_, 10);
}

- (XRRecentArray)initWithMaximumRecentCount:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)XRRecentArray;
  v4 = [(XRRecentArray *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_maximumRecentCount = a3;
    uint64_t v6 = objc_opt_new();
    entries = v5->_entries;
    v5->_entries = (NSMutableArray *)v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    lock = v5->_lock;
    v5->_lock = (OS_dispatch_semaphore *)v8;
  }
  return v5;
}

- (void)setMaximumRecentCount:(unint64_t)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  self->_unint64_t maximumRecentCount = a3;
  unint64_t v9 = [self->_entries countWithOptions:v5 range:v6];
  unint64_t maximumRecentCount = self->_maximumRecentCount;
  if (v9 > maximumRecentCount)
  {
    entries = self->_entries;
    uint64_t v16 = [entries countWithOptions:v10 usingComparator:v11 usingComparatorContext:v12 usingComparatorContextSize:v13];
    [entries removeObjectsInRange:NSMakeRange(v17, v16 - self->_maximumRecentCount)];
  }
  lock = self->_lock;

  dispatch_semaphore_signal(lock);
}

- (unint64_t)maximumRecentCount
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t maximumRecentCount = self->_maximumRecentCount;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
  return maximumRecentCount;
}

- (void)addEntry:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  dispatch_semaphore_wait(lock, 0xFFFFFFFFFFFFFFFFLL);
  [self->_entries removeObject:v6];
  [self->_entries insertObject:v9 atIndex:(uint64_t)v5];

  if ([self->_entries count] > self->_maximumRecentCount) {
    [self->_entries removeLastObject];
  }
  v19 = self->_lock;

  dispatch_semaphore_signal(v19);
}

- (void)removeEntry:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  dispatch_semaphore_wait(lock, 0xFFFFFFFFFFFFFFFFLL);
  [self->_entries removeObject:v6];

  unint64_t v9 = self->_lock;

  dispatch_semaphore_signal(v9);
}

- (void)removeEntryAtIndex:(unint64_t)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  if ([self->_entries countWithOptions:v5 range:v6] > a3) {
    [self->_entries removeObjectAtIndex:v9];
  }
  lock = self->_lock;

  dispatch_semaphore_signal(lock);
}

- (id)entries
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = [self->_entries copyWithZone:v3];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);

  return v7;
}

- (id)entryAtIndex:(unint64_t)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  if ([self->_entries count] <= a3)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [self->_entries objectAtIndexedSubscript:v9];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);

  return v12;
}

- (BOOL)containsEntry:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  dispatch_semaphore_wait(lock, 0xFFFFFFFFFFFFFFFFLL);
  [self->_entries containsObject:v6];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
  return (char)lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_entries, 0);
}

@end