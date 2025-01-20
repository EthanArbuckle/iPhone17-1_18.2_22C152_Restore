@interface APNSPackMetrics
- (APNSPackMetrics)initWithDecoder:(id)a3;
- (APNSPackMetrics)initWithEncoder:(id)a3;
- (const)metrics;
- (unint64_t)messageCount;
- (unint64_t)totalPackedSize;
- (unint64_t)totalUnpackedSize;
- (void)dealloc;
- (void)setMetrics:(const Metrics *)a3;
@end

@implementation APNSPackMetrics

- (APNSPackMetrics)initWithEncoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)APNSPackMetrics;
  v5 = [(APNSPackMetrics *)&v7 init];
  if (v5) {
    v5->_metrics = (const Metrics *)sub_100018944((uint64_t)[v4 encoder]);
  }

  return v5;
}

- (APNSPackMetrics)initWithDecoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)APNSPackMetrics;
  v5 = [(APNSPackMetrics *)&v7 init];
  if (v5) {
    v5->_metrics = (const Metrics *)sub_100013348((uint64_t)[v4 decoder]);
  }

  return v5;
}

- (void)dealloc
{
  if (self->_metrics) {
    operator delete();
  }
  v2.receiver = self;
  v2.super_class = (Class)APNSPackMetrics;
  [(APNSPackMetrics *)&v2 dealloc];
}

- (unint64_t)messageCount
{
  return self->_metrics->var0;
}

- (unint64_t)totalUnpackedSize
{
  return self->_metrics->var1;
}

- (unint64_t)totalPackedSize
{
  return self->_metrics->var2;
}

- (const)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(const Metrics *)a3
{
  self->_metrics = a3;
}

@end