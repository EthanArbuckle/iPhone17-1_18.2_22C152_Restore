@interface AIMLExperimentationAnalyticsManager
- (AIMLExperimentationAnalyticsManager)init;
- (AIMLExperimentationAnalyticsManagerInternal)underlyingObject;
- (void)cacheTrialExperimentsForCodePathID:(id)a3 completionHandler:(id)a4;
- (void)cacheTrialExperimentsIdentifiersForCodePathID:(id)a3 namespaces:(id)a4 completionHandler:(id)a5;
- (void)emitTriggerForCodePathID:(id)a3 requestID:(id)a4 completionHandler:(id)a5;
- (void)emitTriggerForCodePathID:(id)a3 withNamespace:(id)a4 requestID:(id)a5 completionHandler:(id)a6;
- (void)emitTriggerFromCacheForCodePathID:(id)a3 requestID:(id)a4 completionHandler:(id)a5;
@end

@implementation AIMLExperimentationAnalyticsManager

- (AIMLExperimentationAnalyticsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AIMLExperimentationAnalyticsManager;
  v2 = [(AIMLExperimentationAnalyticsManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    underlyingObject = v2->_underlyingObject;
    v2->_underlyingObject = (AIMLExperimentationAnalyticsManagerInternal *)v3;
  }
  return v2;
}

- (void)emitTriggerForCodePathID:(id)a3 requestID:(id)a4 completionHandler:(id)a5
{
}

- (void)cacheTrialExperimentsForCodePathID:(id)a3 completionHandler:(id)a4
{
}

- (void)cacheTrialExperimentsIdentifiersForCodePathID:(id)a3 namespaces:(id)a4 completionHandler:(id)a5
{
}

- (void)emitTriggerFromCacheForCodePathID:(id)a3 requestID:(id)a4 completionHandler:(id)a5
{
}

- (void)emitTriggerForCodePathID:(id)a3 withNamespace:(id)a4 requestID:(id)a5 completionHandler:(id)a6
{
}

- (AIMLExperimentationAnalyticsManagerInternal)underlyingObject
{
  return self->_underlyingObject;
}

- (void).cxx_destruct
{
}

@end