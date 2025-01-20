@interface AVVideoPerformanceMetrics
- (AVVideoPerformanceMetrics)init;
- (AVVideoPerformanceMetrics)initWithDictionary:(id)a3;
- (double)totalAccumulatedFrameDelay;
- (double)totalFrameDelay;
- (int64_t)numberOfCorruptedFrames;
- (int64_t)numberOfDroppedFrames;
- (int64_t)totalNumberOfFrames;
- (unint64_t)numberOfDisplayCompositedVideoFrames;
- (unint64_t)numberOfNonDisplayCompositedVideoFrames;
- (void)dealloc;
@end

@implementation AVVideoPerformanceMetrics

- (AVVideoPerformanceMetrics)init
{
  return [(AVVideoPerformanceMetrics *)self initWithDictionary:0];
}

- (AVVideoPerformanceMetrics)initWithDictionary:(id)a3
{
  if (!a3)
  {

    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AVVideoPerformanceMetrics;
  v4 = [(AVVideoPerformanceMetrics *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVVideoPerformanceMetricsInternal);
    v4->_performanceMetricsInternal = v5;
    if (v5)
    {
      CFRetain(v5);
      v4->_performanceMetricsInternal->_metricsDictionary = (NSDictionary *)a3;
      return v4;
    }

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  performanceMetricsInternal = self->_performanceMetricsInternal;
  if (performanceMetricsInternal)
  {

    CFRelease(self->_performanceMetricsInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVVideoPerformanceMetrics;
  [(AVVideoPerformanceMetrics *)&v4 dealloc];
}

- (int64_t)totalNumberOfFrames
{
  id v3 = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34C30]];
  id v4 = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34C00]];
  id v5 = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34C08]];
  id v6 = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34C18]];
  id v7 = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34C28]];
  if (v3)
  {
    return [v3 unsignedLongValue];
  }
  v9 = v7;
  if (!v4)
  {
    int64_t v10 = 0;
    if (!v5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int64_t v10 = [v4 unsignedLongValue];
  if (v5) {
LABEL_7:
  }
    v10 += [v5 unsignedLongValue];
LABEL_8:
  if (v6) {
    v10 += [v6 unsignedLongValue];
  }
  if (v9) {
    v10 += [v9 unsignedLongValue];
  }
  return v10;
}

- (int64_t)numberOfDroppedFrames
{
  id v3 = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34C20]];
  id v4 = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34C38]];
  id v5 = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34C18]];
  if (v3) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6 && v5 == 0) {
    return 0;
  }
  v8 = v5;
  uint64_t v9 = [v3 unsignedLongValue];
  uint64_t v10 = [v4 unsignedLongValue] + v9;
  return v10 + [v8 unsignedLongValue];
}

- (int64_t)numberOfCorruptedFrames
{
  int64_t result = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34BF0]];
  if (result)
  {
    return [(id)result unsignedLongValue];
  }
  return result;
}

- (double)totalAccumulatedFrameDelay
{
  [(AVVideoPerformanceMetrics *)self totalFrameDelay];
  return v2 / 1000000.0;
}

- (unint64_t)numberOfDisplayCompositedVideoFrames
{
  unint64_t result = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34BF8]];
  if (result)
  {
    return [(id)result unsignedLongValue];
  }
  return result;
}

- (unint64_t)numberOfNonDisplayCompositedVideoFrames
{
  unint64_t result = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34C40]];
  if (result)
  {
    return [(id)result unsignedLongValue];
  }
  return result;
}

- (double)totalFrameDelay
{
  id v2 = [(NSDictionary *)self->_performanceMetricsInternal->_metricsDictionary objectForKey:*MEMORY[0x1E4F34C48]];
  if (!v2) {
    return 0.0;
  }
  [v2 doubleValue];
  return result;
}

@end