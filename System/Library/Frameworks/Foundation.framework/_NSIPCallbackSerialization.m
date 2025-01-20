@interface _NSIPCallbackSerialization
- (_NSIPCallbackSerialization)init;
- (void)dealloc;
- (void)sendBeginBlock:(uint64_t)a1;
- (void)sendEndBlock:(uint64_t)a1;
@end

@implementation _NSIPCallbackSerialization

- (_NSIPCallbackSerialization)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)_NSIPCallbackSerialization;
  v2 = [(_NSIPCallbackSerialization *)&v4 init];
  if (v2) {
    v2->_UUID = objc_alloc_init(NSUUID);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSIPCallbackSerialization;
  [(_NSIPCallbackSerialization *)&v3 dealloc];
}

- (void)sendBeginBlock:(uint64_t)a1
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
    block[3] = &unk_1E51F9B10;
    block[4] = a1;
    block[5] = a2;
    _NSIPDispatchAsyncCallback(block);
  }
}

- (void)sendEndBlock:(uint64_t)a1
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E51F9B10;
    block[4] = a1;
    block[5] = a2;
    _NSIPDispatchAsyncCallback(block);
  }
}

@end