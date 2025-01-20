@interface IMAllocTracking
- (IMAllocTracking)retain;
- (void)_registerCallstack;
- (void)dealloc;
- (void)release;
@end

@implementation IMAllocTracking

- (void)_registerCallstack
{
  if (!self->_callStacks) {
    self->_callStacks = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v6 = objc_msgSend_callStackSymbols(MEMORY[0x1E4F29060], a2, v2, v3);
  callStacks = self->_callStacks;
  objc_msgSend_addObject_(callStacks, v5, v6, v7);
}

- (IMAllocTracking)retain
{
  objc_sync_enter(self);
  objc_msgSend__registerCallstack(self, v3, v4, v5);
  v8.receiver = self;
  v8.super_class = (Class)IMAllocTracking;
  uint64_t v6 = [(IMAllocTracking *)&v8 retain];
  objc_sync_exit(self);
  return v6;
}

- (void)release
{
  objc_sync_enter(self);
  objc_msgSend__registerCallstack(self, v3, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)IMAllocTracking;
  [(IMAllocTracking *)&v6 release];
  objc_sync_exit(self);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMAllocTracking;
  [(IMAllocTracking *)&v3 dealloc];
}

@end