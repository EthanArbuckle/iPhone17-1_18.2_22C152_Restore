@interface BSBlockSentinelSignalContext
+ (_WORD)failureContext;
- (BOOL)isComplete;
- (BOOL)isFailed;
- (id)context;
@end

@implementation BSBlockSentinelSignalContext

- (BOOL)isFailed
{
  return self->_failed;
}

- (void).cxx_destruct
{
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (id)context
{
  return self->_context;
}

+ (_WORD)failureContext
{
  v0 = objc_alloc_init((Class)self);
  if (v0) {
    v0[4] = 257;
  }
  return v0;
}

@end