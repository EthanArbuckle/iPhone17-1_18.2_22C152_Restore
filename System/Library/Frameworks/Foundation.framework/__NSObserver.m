@interface __NSObserver
+ (void)observerWithCenter:(uint64_t)a1;
- (id)block;
- (unint64_t)token;
- (void)dealloc;
- (void)setBlock:(id)a3;
- (void)setToken:(unint64_t)a3;
@end

@implementation __NSObserver

- (unint64_t)token
{
  return self->_token;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&_MergedGlobals_9);
  nc = self->nc;
  self->nc = 0;
  os_unfair_lock_unlock(&_MergedGlobals_9);
  id block = self->_block;
  if (block) {
    _Block_release(block);
  }
  [(NSNotificationCenter *)nc removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)__NSObserver;
  [(__NSObserver *)&v5 dealloc];
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

+ (void)observerWithCenter:(uint64_t)a1
{
  self;
  v3 = objc_opt_new();
  v3[1] = a2;
  if (qword_1EB1ECF80 != -1) {
    dispatch_once(&qword_1EB1ECF80, &__block_literal_global_26);
  }
  os_unfair_lock_lock(&_MergedGlobals_9);
  CFSetAddValue((CFMutableSetRef)qword_1EB1ECF88, v3);
  os_unfair_lock_unlock(&_MergedGlobals_9);
  return v3;
}

- (id)block
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setBlock:(id)a3
{
}

@end