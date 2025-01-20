@interface BWBufferometerTracker
+ (void)trackBuffer:(int64_t)a3 trackedSize:(void *)a4 tag:(void *)a5 bufferType:;
- (unint64_t)initWithBuffer:(unint64_t)a3 trackedSize:(void *)a4 tag:(void *)a5 bufferType:;
- (void)dealloc;
@end

@implementation BWBufferometerTracker

+ (void)trackBuffer:(int64_t)a3 trackedSize:(void *)a4 tag:(void *)a5 bufferType:
{
  self;
  if (a2)
  {
    if (a3 >= 1)
    {
      v9 = -[BWBufferometerTracker initWithBuffer:trackedSize:tag:bufferType:]([BWBufferometerTracker alloc], (unint64_t)a2, a3, a4, a5);
      if (v9)
      {
        v10 = v9;
        objc_setAssociatedObject(a2, @"BufferometerTracer", v9, (void *)0x301);
      }
    }
  }
}

- (unint64_t)initWithBuffer:(unint64_t)a3 trackedSize:(void *)a4 tag:(void *)a5 bufferType:
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)BWBufferometerTracker;
  v9 = (unint64_t *)objc_msgSendSuper2(&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[3] = a2;
    v9[1] = a3;
    v9[4] = (unint64_t)a4;
    v10[5] = (unint64_t)a5;
    uint64_t v11 = sBufferometerTrackingSerialNumber++;
    v10[2] = v11;
    atomic_fetch_add_explicit(&sBufferometerTotalSize, v10[1], memory_order_relaxed);
    atomic_fetch_add_explicit(&sBufferometerTotalCount, 1uLL, memory_order_relaxed);
  }
  return v10;
}

- (void)dealloc
{
  atomic_fetch_add_explicit(&sBufferometerTotalSize, -self->_trackedSize, memory_order_relaxed);
  atomic_fetch_add_explicit(&sBufferometerTotalCount, 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed);

  v3.receiver = self;
  v3.super_class = (Class)BWBufferometerTracker;
  [(BWBufferometerTracker *)&v3 dealloc];
}

@end