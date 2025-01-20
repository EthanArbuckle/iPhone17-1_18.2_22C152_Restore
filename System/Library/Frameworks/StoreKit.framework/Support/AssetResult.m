@interface AssetResult
- (AssetDataConsumer)dataConsumer;
- (NSError)error;
- (NSURLSessionTaskMetrics)metrics;
- (unint64_t)bytesReceived;
- (void)setBytesReceived:(unint64_t)a3;
- (void)setDataConsumer:(id)a3;
- (void)setError:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation AssetResult

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void)setBytesReceived:(unint64_t)a3
{
  self->_bytesReceived = a3;
}

- (AssetDataConsumer)dataConsumer
{
  return (AssetDataConsumer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataConsumer:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
}

- (NSURLSessionTaskMetrics)metrics
{
  return (NSURLSessionTaskMetrics *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_dataConsumer, 0);
}

@end