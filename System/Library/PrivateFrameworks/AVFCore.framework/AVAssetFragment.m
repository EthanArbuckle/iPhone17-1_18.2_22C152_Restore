@interface AVAssetFragment
+ (id)fragmentWithSequenceNumber:(int64_t)a3;
- (AVAssetFragment)init;
- (AVAssetFragment)initWithSequenceNumber:(int64_t)a3;
- (int64_t)sequenceNumber;
- (void)dealloc;
@end

@implementation AVAssetFragment

+ (id)fragmentWithSequenceNumber:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithSequenceNumber:a3];
  return v3;
}

- (AVAssetFragment)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_initWithSequenceNumber_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVAssetFragment)initWithSequenceNumber:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAssetFragment;
  v4 = [(AVAssetFragment *)&v7 init];
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(AVAssetFragmentInternal);
    v4->_internal = v5;
    if (v5)
    {
      v5->_sequenceNumber = a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetFragment;
  [(AVAssetFragment *)&v3 dealloc];
}

- (int64_t)sequenceNumber
{
  return self->_internal->_sequenceNumber;
}

@end