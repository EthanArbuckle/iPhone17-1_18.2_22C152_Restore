@interface BMPendingWrite
+ (id)pendingWriteWithEvent:(id)a3 timestamp:(double)a4;
- (double)timestamp;
- (id)event;
@end

@implementation BMPendingWrite

+ (id)pendingWriteWithEvent:(id)a3 timestamp:(double)a4
{
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  v9 = (double *)v8;
  if (v8)
  {
    objc_storeStrong((id *)v8 + 1, a3);
    v9[2] = a4;
  }

  return v9;
}

- (id)event
{
  return self->_event;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end