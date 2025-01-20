@interface MPSGraphExecutionDescriptor
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
- (MPSGraphCompilationDescriptor)compilationDescriptor;
- (MPSGraphCompletionHandler)completionHandler;
- (MPSGraphExecutionDescriptor)init;
- (MPSGraphScheduledHandler)scheduledHandler;
- (NSDictionary)fileSymbolMap;
- (unint64_t)maximumNumberOfEncodingThreads;
- (void)setBreakUpMetalEncoders:(BOOL)a3;
- (void)setBriefProfilingOpNames:(BOOL)a3;
- (void)setCompilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor;
- (void)setCompletionHandler:(MPSGraphCompletionHandler)completionHandler;
- (void)setDisableANECaching:(BOOL)a3;
- (void)setDisableANEFallback:(BOOL)a3;
- (void)setDisableSynchronizeResults:(BOOL)a3;
- (void)setEnableCommitAndContinue:(BOOL)a3;
- (void)setEnableProfilingOpNames:(BOOL)a3;
- (void)setFileSymbolMap:(id)a3;
- (void)setGenerateRuntimeExecutionReport:(BOOL)a3;
- (void)setMaximumNumberOfEncodingThreads:(unint64_t)a3;
- (void)setScheduledHandler:(MPSGraphScheduledHandler)scheduledHandler;
- (void)setSimulateANECompileFailure:(BOOL)a3;
- (void)setSimulateANELoadModelFailure:(BOOL)a3;
- (void)setWaitUntilCompleted:(BOOL)waitUntilCompleted;
- (void)signalEvent:(id)event atExecutionEvent:(MPSGraphExecutionStage)executionStage value:(uint64_t)value;
- (void)waitForANEPrePowerUpEvent:(id)a3 value:(unint64_t)a4;
- (void)waitForEvent:(id)event value:(uint64_t)value;
@end

@implementation MPSGraphExecutionDescriptor

- (MPSGraphExecutionDescriptor)init
{
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphExecutionDescriptor;
  v2 = [(MPSGraphExecutionDescriptor *)&v13 init];
  compilationDescriptor = v2->_compilationDescriptor;
  v2->_compilationDescriptor = 0;

  v2->_enableCommitAndContinue = 1;
  v2->_enableProfilingOpNames = 0;
  v2->_briefProfilingOpNames = 0;
  v2->_simulateANECompileFailure = 0;
  v2->_simulateANELoadModelFailure = 0;
  v2->_breakUpMetalEncoders = 0;
  v2->_generateRuntimeExecutionReport = 0;
  uint64_t v4 = objc_opt_new();
  waitEvents = v2->_waitEvents;
  v2->_waitEvents = (NSMutableArray *)v4;

  uint64_t v6 = objc_opt_new();
  anePowerWaitEvents = v2->_anePowerWaitEvents;
  v2->_anePowerWaitEvents = (NSMutableArray *)v6;

  uint64_t v8 = objc_opt_new();
  signalEvents = v2->_signalEvents;
  v2->_signalEvents = (NSMutableArray *)v8;

  v2->_maximumNumberOfEncodingThreads = 0;
  uint64_t v10 = objc_opt_new();
  fileSymbolMap = v2->_fileSymbolMap;
  v2->_fileSymbolMap = (NSDictionary *)v10;

  return v2;
}

- (void)waitForEvent:(id)event value:(uint64_t)value
{
  id v7 = event;
  uint64_t v6 = [[MPSGraphWaitEvent alloc] initWithEvent:v7 value:value];
  [(NSMutableArray *)self->_waitEvents addObject:v6];
}

- (void)waitForANEPrePowerUpEvent:(id)a3 value:(unint64_t)a4
{
  id v7 = a3;
  [(NSMutableArray *)self->_anePowerWaitEvents count];
  if ([(NSMutableArray *)self->_anePowerWaitEvents count] && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  uint64_t v6 = [[MPSGraphWaitEvent alloc] initWithEvent:v7 value:a4];
  [(NSMutableArray *)self->_anePowerWaitEvents addObject:v6];
}

- (void)signalEvent:(id)event atExecutionEvent:(MPSGraphExecutionStage)executionStage value:(uint64_t)value
{
  id v9 = event;
  uint64_t v8 = [[MPSGraphSignalEvent alloc] initWithEvent:v9 executionStage:executionStage value:value];
  [(NSMutableArray *)self->_signalEvents addObject:v8];
}

- (MPSGraphCompilationDescriptor)compilationDescriptor
{
  return (MPSGraphCompilationDescriptor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor
{
}

- (MPSGraphScheduledHandler)scheduledHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setScheduledHandler:(MPSGraphScheduledHandler)scheduledHandler
{
}

- (MPSGraphCompletionHandler)completionHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setCompletionHandler:(MPSGraphCompletionHandler)completionHandler
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
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFileSymbolMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSymbolMap, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_scheduledHandler, 0);
  objc_storeStrong((id *)&self->_compilationDescriptor, 0);
  objc_storeStrong((id *)&self->_anePowerWaitEvents, 0);
  objc_storeStrong((id *)&self->_signalEvents, 0);

  objc_storeStrong((id *)&self->_waitEvents, 0);
}

@end