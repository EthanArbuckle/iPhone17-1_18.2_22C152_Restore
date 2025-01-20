@interface AVCaptureSynchronizedMetadataObjectData
+ (void)initialize;
- (NSArray)metadataObjects;
- (id)_initWithMetadataObjectCollection:(id)a3;
- (id)handledMetadataObjectTypes;
- (void)addSynchronizedData:(id)a3;
- (void)dealloc;
@end

@implementation AVCaptureSynchronizedMetadataObjectData

+ (void)initialize
{
}

- (id)_initWithMetadataObjectCollection:(id)a3
{
  if (![a3 metadataObjects])
  {
    v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0;
  }
  if (a3) {
    [a3 time];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  v9.receiver = self;
  v9.super_class = (Class)AVCaptureSynchronizedMetadataObjectData;
  v6 = [(AVCaptureSynchronizedData *)&v9 _initWithTimestamp:v10];
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptureSynchronizedMetadataObjectDataInternal);
    v6[2] = v7;
    if (v7)
    {
      *(void *)(v6[2] + 16) = (id)[a3 handledMetadataObjectTypes];
      *(void *)(v6[2] + 8) = (id)[a3 metadataObjects];
      return v6;
    }

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureSynchronizedMetadataObjectData;
  [(AVCaptureSynchronizedData *)&v4 dealloc];
}

- (NSArray)metadataObjects
{
  return self->_internal->metadataObjects;
}

- (id)handledMetadataObjectTypes
{
  return self->_internal->handledMetadataObjectTypes;
}

- (void)addSynchronizedData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  memset(&v22[1], 0, sizeof(CMTime));
  if (self) {
    [(AVCaptureSynchronizedData *)self timestamp];
  }
  memset(v22, 0, 24);
  if (a3) {
    [a3 timestamp];
  }
  if (v22[1].flags & 1) != 0 && (v22[0].flags)
  {
    CMTime time1 = v22[0];
    CMTime time2 = v22[1];
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      CMTime time1 = v22[0];
      [(AVCaptureSynchronizedData *)self setTimestampOverride:&time1];
    }
  }
  v5 = -[NSSet setByAddingObjectsFromSet:](self->_internal->handledMetadataObjectTypes, "setByAddingObjectsFromSet:", [a3 handledMetadataObjectTypes]);

  self->_internal->handledMetadataObjectTypes = v5;
  v14 = self;
  v6 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->_internal->metadataObjects];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = (void *)[a3 metadataObjects];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __63__AVCaptureSynchronizedMetadataObjectData_addSynchronizedData___block_invoke;
        v15[3] = &unk_1E5A79A28;
        v15[4] = v12;
        uint64_t v13 = [v6 indexOfObjectPassingTest:v15];
        if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
          [v6 addObject:v12];
        }
        else {
          [v6 insertObject:v12 atIndex:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v9);
  }

  v14->_internal->metadataObjects = (NSArray *)v6;
}

BOOL __63__AVCaptureSynchronizedMetadataObjectData_addSynchronizedData___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2) {
    [a2 time];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  v6 = *(void **)(a1 + 32);
  if (v6) {
    [v6 time];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  int32_t v7 = CMTimeCompare(&time1, &v9);
  if (v7 >= 1) {
    *a4 = 1;
  }
  return v7 > 0;
}

@end