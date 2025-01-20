@interface GKMetricsReportingSessionDelegate
- (GKMetricsReportingSessionDelegate)init;
- (GKMetricsReportingSessionDelegate)initWithReporter:(id)a3;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation GKMetricsReportingSessionDelegate

- (GKMetricsReportingSessionDelegate)initWithReporter:(id)a3
{
  return (GKMetricsReportingSessionDelegate *)MetricsReportingSessionDelegate.init(reporter:)((uint64_t)a3);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  MetricsReportingSessionDelegate.urlSession(_:task:didFinishCollecting:)((NSURLSession)v11, (NSURLSessionTask)v9, (NSURLSessionTaskMetrics)v10);
}

- (GKMetricsReportingSessionDelegate)init
{
}

- (void).cxx_destruct
{
}

@end