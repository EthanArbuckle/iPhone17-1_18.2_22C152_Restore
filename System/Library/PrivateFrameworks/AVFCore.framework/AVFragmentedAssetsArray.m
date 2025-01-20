@interface AVFragmentedAssetsArray
- (AVFragmentedAssetsArray)init;
- (AVFragmentedAssetsArray)initWithCount:(unint64_t)a3 firstSequenceNumber:(unint64_t)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation AVFragmentedAssetsArray

- (AVFragmentedAssetsArray)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_initWithCount_firstSequenceNumber_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVFragmentedAssetsArray)initWithCount:(unint64_t)a3 firstSequenceNumber:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVFragmentedAssetsArray;
  v6 = [(AVFragmentedAssetsArray *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_count = a3;
    v6->_firstSequenceNumber = a4;
    v6->_cachedFragments = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVFragmentedAssetsArray;
  [(AVFragmentedAssetsArray *)&v3 dealloc];
}

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (self->_count <= a3)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"index %d out of bounds.", v3, v4, v5, v6, v7, a3), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v11 = (AVAssetFragment *)[(NSMutableDictionary *)self->_cachedFragments objectForKey:v10];
  if (!v11)
  {
    uint64_t v11 = +[AVAssetFragment fragmentWithSequenceNumber:self->_firstSequenceNumber + a3];
    [(NSMutableDictionary *)self->_cachedFragments setObject:v11 forKey:v10];
  }
  return v11;
}

@end