@interface AVAssetWriterInputPassDescription
- (AVAssetWriterInputPassDescription)init;
- (AVAssetWriterInputPassDescription)initWithTimeRanges:(id)a3;
- (NSArray)sourceTimeRanges;
- (id)description;
- (void)dealloc;
@end

@implementation AVAssetWriterInputPassDescription

- (AVAssetWriterInputPassDescription)init
{
  uint64_t v3 = [MEMORY[0x1E4F1C978] array];
  return [(AVAssetWriterInputPassDescription *)self initWithTimeRanges:v3];
}

- (AVAssetWriterInputPassDescription)initWithTimeRanges:(id)a3
{
  if (!a3)
  {
    v9 = self;
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"timeRanges != nil"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)AVAssetWriterInputPassDescription;
  v4 = [(AVAssetWriterInputPassDescription *)&v16 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVAssetWriterInputPassDescriptionInternal);
    v4->_internal = v5;
    if (v5)
    {
      CFRetain(v5);
      v4->_internal->timeRanges = (NSArray *)[a3 copy];
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
  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputPassDescription;
  [(AVAssetWriterInputPassDescription *)&v4 dealloc];
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  timeRanges = self->_internal->timeRanges;
  uint64_t v5 = [(NSArray *)timeRanges countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(timeRanges);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        memset(&v15, 0, sizeof(v15));
        if (v10) {
          [v10 CMTimeRangeValue];
        }
        CMTimeRange range = v15;
        objc_msgSend(v3, "addObject:", (id)CMTimeRangeCopyDescription(v8, &range));
      }
      uint64_t v6 = [(NSArray *)timeRanges countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  uint64_t v11 = NSString;
  uint64_t v12 = (objc_class *)objc_opt_class();
  return (id)[v11 stringWithFormat:@"<%@: %p, sourceTimeRanges=%@>", NSStringFromClass(v12), self, objc_msgSend(v3, "componentsJoinedByString:", @", ")];
}

- (NSArray)sourceTimeRanges
{
  return self->_internal->timeRanges;
}

@end