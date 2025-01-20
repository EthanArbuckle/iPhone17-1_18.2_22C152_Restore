@interface BWBufferometer
+ (int64_t)totalTrackedBuffersInFlight;
+ (int64_t)totalTrackedSizeInFlight;
+ (void)initialize;
+ (void)trackBuffer:(void *)a3 trackedSize:(int64_t)a4;
+ (void)trackBuffer:(void *)a3 trackedSize:(int64_t)a4 tag:(id)a5 bufferType:(id)a6;
@end

@implementation BWBufferometer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (void)trackBuffer:(void *)a3 trackedSize:(int64_t)a4
{
  self;
  +[BWBufferometerTracker trackBuffer:trackedSize:tag:bufferType:]((uint64_t)BWBufferometerTracker, a3, a4, 0, 0);
}

+ (void)trackBuffer:(void *)a3 trackedSize:(int64_t)a4 tag:(id)a5 bufferType:(id)a6
{
}

+ (int64_t)totalTrackedSizeInFlight
{
  return atomic_fetch_add_explicit(&sBufferometerTotalSize, 0, memory_order_relaxed);
}

+ (int64_t)totalTrackedBuffersInFlight
{
  return atomic_fetch_add_explicit(&sBufferometerTotalCount, 0, memory_order_relaxed);
}

@end