@interface _NSThreadData
- (_NSThreadData)init;
- (uint64_t)setTarget:(uint64_t)result;
- (unint64_t)setSelector:(unint64_t)result;
- (void)setArgument:(void *)result;
@end

@implementation _NSThreadData

- (uint64_t)setTarget:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void *)(result + 8);
    unint64_t v3 = atomic_load((unint64_t *)(result + 32));
    if (v2 != v3) {
      _NSThreadPoisoned();
    }
    *(void *)(result + 8) = a2;
    atomic_store(result + 16, (unint64_t *)(result + 32));
  }
  return result;
}

- (void)setArgument:(void *)result
{
  if (result)
  {
    uint64_t v2 = result[1];
    unint64_t v3 = atomic_load(result + 4);
    if (v2 != v3) {
      _NSThreadPoisoned();
    }
    result[3] = a2;
    atomic_store((unint64_t)(result + 2), result + 4);
  }
  return result;
}

- (unint64_t)setSelector:(unint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void *)(result + 8);
    unint64_t v3 = atomic_load((unint64_t *)(result + 32));
    if (v2 != v3) {
      _NSThreadPoisoned();
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
    else {
      *(void *)(result + 16) = 0;
    }
    atomic_store(result & 0xFFFFFFFFFFFFLL | 0x2E49000000000000, (unint64_t *)(result + 32));
  }
  return result;
}

- (_NSThreadData)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSThreadData;
  result = [(_NSThreadData *)&v3 init];
  atomic_store((unint64_t)result->_target, &result->_pac_signature);
  return result;
}

@end