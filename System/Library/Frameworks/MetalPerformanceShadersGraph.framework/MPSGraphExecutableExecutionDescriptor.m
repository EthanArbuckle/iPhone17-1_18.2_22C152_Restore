@interface MPSGraphExecutableExecutionDescriptor
- (BOOL)breakUpMetalEncoders;
- (BOOL)briefProfilingOpNames;
- (BOOL)disableANECaching;
- (BOOL)disableANEFallback;
- (BOOL)disableSynchronizeResults;
- (BOOL)enableCommitAndContinue;
- (BOOL)enableProfilingOpNames;
- (BOOL)generateRuntimeExecutionReport;
- (BOOL)simulateANECompileFailure;
- (BOOL)simulateANELoadModelFailure;
- (BOOL)waitUntilCompleted;
- (MPSGraphExecutableCompletionHandler)completionHandler;
- (MPSGraphExecutableExecutionDescriptor)init;
- (MPSGraphExecutableExecutionDescriptor)initWithGraphExecutionDescriptor:(id)a3;
- (MPSGraphExecutableScheduledHandler)scheduledHandler;
- (NSDictionary)fileSymbolMap;
- (id)completionGraphHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (id)scheduledGraphHandler;
- (unint64_t)maximumNumberOfEncodingThreads;
- (unint64_t)numberOfCommitsByMPSGraph;
- (void)requestProfilingStatsWithDictionary:(id)a3 profilingCallback:(id)a4;
- (void)setBreakUpMetalEncoders:(BOOL)a3;
- (void)setBriefProfilingOpNames:(BOOL)a3;
- (void)setCompletionGraphHandler:(id)a3;
- (void)setCompletionHandler:(MPSGraphExecutableCompletionHandler)completionHandler;
- (void)setDisableANECaching:(BOOL)a3;
- (void)setDisableANEFallback:(BOOL)a3;
- (void)setDisableSynchronizeResults:(BOOL)a3;
- (void)setEnableCommitAndContinue:(BOOL)a3;
- (void)setEnableProfilingOpNames:(BOOL)a3;
- (void)setFileSymbolMap:(id)a3;
- (void)setGenerateRuntimeExecutionReport:(BOOL)a3;
- (void)setMaximumNumberOfEncodingThreads:(unint64_t)a3;
- (void)setScheduledGraphHandler:(id)a3;
- (void)setScheduledHandler:(MPSGraphExecutableScheduledHandler)scheduledHandler;
- (void)setSimulateANECompileFailure:(BOOL)a3;
- (void)setSimulateANELoadModelFailure:(BOOL)a3;
- (void)setWaitUntilCompleted:(BOOL)waitUntilCompleted;
- (void)signalEvent:(id)event atExecutionEvent:(MPSGraphExecutionStage)executionStage value:(uint64_t)value;
- (void)waitForANEPrePowerUpEvent:(id)a3 value:(unint64_t)a4;
- (void)waitForEvent:(id)event value:(uint64_t)value;
@end

@implementation MPSGraphExecutableExecutionDescriptor

- (void)requestProfilingStatsWithDictionary:(id)a3 profilingCallback:(id)a4
{
  id v13 = a3;
  v6 = (void *)MEMORY[0x1852FE7D0](a4);
  id profilingCallback = self->_profilingCallback;
  self->_id profilingCallback = v6;

  v8 = (NSMutableDictionary *)[v13 mutableCopy];
  profilingDictionary = self->_profilingDictionary;
  self->_profilingDictionary = v8;

  v10 = [(NSMutableDictionary *)self->_profilingDictionary objectForKey:@"MPSGRAPH_PROFILING_BEFORE_FIRST_COMMIT_TIMESTAMP"];

  if (v10) {
    self->_profilingBitmap |= 1uLL;
  }
  v11 = [(NSMutableDictionary *)self->_profilingDictionary objectForKey:@"MPSGRAPH_PROFILING_AFTER_FIRST_COMMIT_TIMESTAMP"];

  if (v11) {
    self->_profilingBitmap |= 2uLL;
  }
  v12 = [(NSMutableDictionary *)self->_profilingDictionary objectForKey:@"MPSGRAPH_PROFILING_FIRST_MTLCOMMANDBUFFER_SCHEDULED_TIMESTAMP"];

  if (v12) {
    self->_profilingBitmap |= 4uLL;
  }
}

- (MPSGraphExecutableExecutionDescriptor)init
{
  v15.receiver = self;
  v15.super_class = (Class)MPSGraphExecutableExecutionDescriptor;
  v2 = [(MPSGraphExecutableExecutionDescriptor *)&v15 init];
  v2->_waitUntilCompleted = 0;
  id completionHandler = v2->_completionHandler;
  v2->_id completionHandler = 0;

  id scheduledHandler = v2->_scheduledHandler;
  v2->_id scheduledHandler = 0;

  id scheduledGraphHandler = v2->_scheduledGraphHandler;
  v2->_id scheduledGraphHandler = 0;

  id completionGraphHandler = v2->_completionGraphHandler;
  v2->_id completionGraphHandler = 0;

  v2->_enableCommitAndContinue = 1;
  v2->_enableProfilingOpNames = 0;
  v2->_briefProfilingOpNames = 0;
  v2->_simulateANECompileFailure = 0;
  v2->_simulateANELoadModelFailure = 0;
  v2->_breakUpMetalEncoders = 0;
  v2->_generateRuntimeExecutionReport = 0;
  waitEvents = v2->_waitEvents;
  v2->_waitEvents = 0;

  anePowerWaitEvents = v2->_anePowerWaitEvents;
  v2->_anePowerWaitEvents = 0;

  signalEvents = v2->_signalEvents;
  v2->_signalEvents = 0;

  v2->_maximumNumberOfEncodingThreads = 0;
  v2->_disableSynchronizeResults = 0;
  id profilingCallback = v2->_profilingCallback;
  v2->_id profilingCallback = 0;

  profilingDictionary = v2->_profilingDictionary;
  v2->_profilingDictionary = 0;

  v2->_profilingBitmap = 0;
  v2->_numberOfCommitsByMPSGraph = 0;
  v2->_disableANECaching = 0;
  v2->_disableANEFallback = 0;
  uint64_t v12 = objc_opt_new();
  fileSymbolMap = v2->_fileSymbolMap;
  v2->_fileSymbolMap = (NSDictionary *)v12;

  return v2;
}

- (MPSGraphExecutableExecutionDescriptor)initWithGraphExecutionDescriptor:(id)a3
{
  v4 = (id *)a3;
  v5 = [(MPSGraphExecutableExecutionDescriptor *)self init];
  v5->_waitUntilCompleted = [v4 waitUntilCompleted];
  id completionHandler = v5->_completionHandler;
  v5->_id completionHandler = 0;

  id scheduledHandler = v5->_scheduledHandler;
  v5->_id scheduledHandler = 0;

  uint64_t v8 = [v4 scheduledHandler];
  id scheduledGraphHandler = v5->_scheduledGraphHandler;
  v5->_id scheduledGraphHandler = (id)v8;

  uint64_t v10 = [v4 completionHandler];
  id completionGraphHandler = v5->_completionGraphHandler;
  v5->_id completionGraphHandler = (id)v10;

  v5->_enableCommitAndContinue = [v4 enableCommitAndContinue];
  v5->_enableProfilingOpNames = [v4 enableProfilingOpNames];
  v5->_briefProfilingOpNames = [v4 briefProfilingOpNames];
  v5->_simulateANECompileFailure = [v4 simulateANECompileFailure];
  v5->_simulateANELoadModelFailure = [v4 simulateANELoadModelFailure];
  v5->_breakUpMetalEncoders = [v4 breakUpMetalEncoders];
  v5->_generateRuntimeExecutionReport = [v4 generateRuntimeExecutionReport];
  objc_storeStrong((id *)&v5->_waitEvents, v4[1]);
  objc_storeStrong((id *)&v5->_anePowerWaitEvents, v4[3]);
  objc_storeStrong((id *)&v5->_signalEvents, v4[2]);
  v5->_maximumNumberOfEncodingThreads = [v4 maximumNumberOfEncodingThreads];
  v5->_disableSynchronizeResults = [v4 disableSynchronizeResults];
  v5->_disableANECaching = [v4 disableANECaching];
  v5->_disableANEFallback = [v4 disableANEFallback];
  uint64_t v12 = [v4 fileSymbolMap];
  uint64_t v13 = [v12 copy];
  fileSymbolMap = v5->_fileSymbolMap;
  v5->_fileSymbolMap = (NSDictionary *)v13;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPSGraphExecutableExecutionDescriptor alloc];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setCompletionHandler:self->_completionHandler];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setScheduledHandler:self->_scheduledHandler];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setScheduledGraphHandler:self->_scheduledGraphHandler];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setCompletionGraphHandler:self->_completionGraphHandler];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setEnableCommitAndContinue:self->_enableCommitAndContinue];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setEnableProfilingOpNames:self->_enableProfilingOpNames];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setBriefProfilingOpNames:self->_briefProfilingOpNames];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setSimulateANECompileFailure:self->_simulateANECompileFailure];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setSimulateANELoadModelFailure:self->_simulateANELoadModelFailure];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setBreakUpMetalEncoders:self->_breakUpMetalEncoders];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setGenerateRuntimeExecutionReport:self->_generateRuntimeExecutionReport];
  uint64_t v5 = [(NSMutableArray *)self->_waitEvents copy];
  waitEvents = v4->_waitEvents;
  v4->_waitEvents = (NSMutableArray *)v5;

  uint64_t v7 = [(NSMutableArray *)self->_signalEvents copy];
  signalEvents = v4->_signalEvents;
  v4->_signalEvents = (NSMutableArray *)v7;

  [(MPSGraphExecutableExecutionDescriptor *)v4 setMaximumNumberOfEncodingThreads:self->_maximumNumberOfEncodingThreads];
  [(MPSGraphExecutableExecutionDescriptor *)v4 setDisableSynchronizeResults:self->_disableSynchronizeResults];
  uint64_t v9 = MEMORY[0x1852FE7D0](self->_profilingCallback);
  id profilingCallback = v4->_profilingCallback;
  v4->_id profilingCallback = (id)v9;

  uint64_t v11 = [(NSMutableDictionary *)self->_profilingDictionary mutableCopy];
  profilingDictionary = v4->_profilingDictionary;
  v4->_profilingDictionary = (NSMutableDictionary *)v11;

  v4->_profilingBitmap = self->_profilingBitmap;
  v4->_numberOfCommitsByMPSGraph = self->_numberOfCommitsByMPSGraph;
  v4->_disableANECaching = self->_disableANECaching;
  v4->_disableANEFallback = self->_disableANEFallback;
  uint64_t v13 = [(NSDictionary *)self->_fileSymbolMap copy];
  fileSymbolMap = v4->_fileSymbolMap;
  v4->_fileSymbolMap = (NSDictionary *)v13;

  return v4;
}

- (void)waitForEvent:(id)event value:(uint64_t)value
{
  id v10 = event;
  v6 = [[MPSGraphWaitEvent alloc] initWithEvent:v10 value:value];
  waitEvents = self->_waitEvents;
  if (!waitEvents)
  {
    uint64_t v8 = (NSMutableArray *)objc_opt_new();
    uint64_t v9 = self->_waitEvents;
    self->_waitEvents = v8;

    waitEvents = self->_waitEvents;
  }
  [(NSMutableArray *)waitEvents addObject:v6];
}

- (void)signalEvent:(id)event atExecutionEvent:(MPSGraphExecutionStage)executionStage value:(uint64_t)value
{
  id v12 = event;
  uint64_t v8 = [[MPSGraphSignalEvent alloc] initWithEvent:v12 executionStage:executionStage value:value];
  signalEvents = self->_signalEvents;
  if (!signalEvents)
  {
    id v10 = (NSMutableArray *)objc_opt_new();
    uint64_t v11 = self->_signalEvents;
    self->_signalEvents = v10;

    signalEvents = self->_signalEvents;
  }
  [(NSMutableArray *)signalEvents addObject:v8];
}

- (void)waitForANEPrePowerUpEvent:(id)a3 value:(unint64_t)a4
{
  id v10 = a3;
  anePowerWaitEvents = self->_anePowerWaitEvents;
  if (!anePowerWaitEvents)
  {
    uint64_t v7 = (NSMutableArray *)objc_opt_new();
    uint64_t v8 = self->_anePowerWaitEvents;
    self->_anePowerWaitEvents = v7;

    anePowerWaitEvents = self->_anePowerWaitEvents;
  }
  [(NSMutableArray *)anePowerWaitEvents count];
  if ([(NSMutableArray *)self->_anePowerWaitEvents count] && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  uint64_t v9 = [[MPSGraphWaitEvent alloc] initWithEvent:v10 value:a4];
  [(NSMutableArray *)self->_anePowerWaitEvents addObject:v9];
}

- (unint64_t)numberOfCommitsByMPSGraph
{
  return self->_numberOfCommitsByMPSGraph;
}

- (MPSGraphExecutableScheduledHandler)scheduledHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setScheduledHandler:(MPSGraphExecutableScheduledHandler)scheduledHandler
{
}

- (MPSGraphExecutableCompletionHandler)completionHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setCompletionHandler:(MPSGraphExecutableCompletionHandler)completionHandler
{
}

- (BOOL)waitUntilCompleted
{
  return self->_waitUntilCompleted;
}

- (void)setWaitUntilCompleted:(BOOL)waitUntilCompleted
{
  self->_waitUntilCompleted = waitUntilCompleted;
}

- (BOOL)enableCommitAndContinue
{
  return self->_enableCommitAndContinue;
}

- (void)setEnableCommitAndContinue:(BOOL)a3
{
  self->_enableCommitAndContinue = a3;
}

- (id)scheduledGraphHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setScheduledGraphHandler:(id)a3
{
}

- (id)completionGraphHandler
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setCompletionGraphHandler:(id)a3
{
}

- (BOOL)simulateANECompileFailure
{
  return self->_simulateANECompileFailure;
}

- (void)setSimulateANECompileFailure:(BOOL)a3
{
  self->_simulateANECompileFailure = a3;
}

- (BOOL)simulateANELoadModelFailure
{
  return self->_simulateANELoadModelFailure;
}

- (void)setSimulateANELoadModelFailure:(BOOL)a3
{
  self->_simulateANELoadModelFailure = a3;
}

- (BOOL)disableSynchronizeResults
{
  return self->_disableSynchronizeResults;
}

- (void)setDisableSynchronizeResults:(BOOL)a3
{
  self->_disableSynchronizeResults = a3;
}

- (BOOL)disableANECaching
{
  return self->_disableANECaching;
}

- (void)setDisableANECaching:(BOOL)a3
{
  self->_disableANECaching = a3;
}

- (BOOL)disableANEFallback
{
  return self->_disableANEFallback;
}

- (void)setDisableANEFallback:(BOOL)a3
{
  self->_disableANEFallback = a3;
}

- (BOOL)enableProfilingOpNames
{
  return self->_enableProfilingOpNames;
}

- (void)setEnableProfilingOpNames:(BOOL)a3
{
  self->_enableProfilingOpNames = a3;
}

- (BOOL)briefProfilingOpNames
{
  return self->_briefProfilingOpNames;
}

- (void)setBriefProfilingOpNames:(BOOL)a3
{
  self->_briefProfilingOpNames = a3;
}

- (BOOL)breakUpMetalEncoders
{
  return self->_breakUpMetalEncoders;
}

- (void)setBreakUpMetalEncoders:(BOOL)a3
{
  self->_breakUpMetalEncoders = a3;
}

- (BOOL)generateRuntimeExecutionReport
{
  return self->_generateRuntimeExecutionReport;
}

- (void)setGenerateRuntimeExecutionReport:(BOOL)a3
{
  self->_generateRuntimeExecutionReport = a3;
}

- (unint64_t)maximumNumberOfEncodingThreads
{
  return self->_maximumNumberOfEncodingThreads;
}

- (void)setMaximumNumberOfEncodingThreads:(unint64_t)a3
{
  self->_maximumNumberOfEncodingThreads = a3;
}

- (NSDictionary)fileSymbolMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFileSymbolMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSymbolMap, 0);
  objc_storeStrong(&self->_completionGraphHandler, 0);
  objc_storeStrong(&self->_scheduledGraphHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_scheduledHandler, 0);
  objc_storeStrong((id *)&self->_profilingDictionary, 0);
  objc_storeStrong(&self->_profilingCallback, 0);
  objc_storeStrong((id *)&self->_anePowerWaitEvents, 0);
  objc_storeStrong((id *)&self->_signalEvents, 0);

  objc_storeStrong((id *)&self->_waitEvents, 0);
}

@end