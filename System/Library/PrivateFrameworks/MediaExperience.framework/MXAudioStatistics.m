@interface MXAudioStatistics
+ (id)sharedInstance;
- (id)initInternal;
- (void)sendSingleMessageWithDictionary:(id)a3 eventCategory:(unsigned int)a4 eventType:(unsigned __int16)a5;
- (void)sendSinglePerformanceMessageForAssertion:(const char *)a3 explanation:(id)a4 activity:(id)a5;
- (void)sendSinglePerformanceMessageForRoutine:(const char *)a3 operationTime:(int64_t)a4 details:(id)a5;
@end

@implementation MXAudioStatistics

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_37);
  }
  return (id)gAudioStatistics;
}

- (void)sendSinglePerformanceMessageForRoutine:(const char *)a3 operationTime:(int64_t)a4 details:(id)a5
{
  if (a4 >= 250000000)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11 = (void *)[[NSString alloc] initWithCString:a3 encoding:4];
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:a4];
    [v10 setObject:v11 forKey:@"RoutineName"];
    [v10 setObject:v12 forKey:@"OperationDurationInNanoseconds"];
    if (a5) {
      [v10 setObject:a5 forKey:@"OperationDetails"];
    }
    ((void (*)(id, uint64_t, uint64_t))self->mSendSingleMessage)(v10, 13, 11);
  }
}

- (void)sendSinglePerformanceMessageForAssertion:(const char *)a3 explanation:(id)a4 activity:(id)a5
{
  if (MX_FeatureFlags_IsAssertionActivityReportingEnabled())
  {
    v9 = (void *)MEMORY[0x1997179E0]();
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11 = (void *)[[NSString alloc] initWithCString:a3 encoding:4];
    [v10 setObject:v11 forKey:@"RoutineName"];
    [v10 setObject:a4 forKey:@"AssertionExplanation"];
    [v10 setObject:a5 forKey:@"AssertionActivity"];
    ((void (*)(id, uint64_t, uint64_t))self->mSendSingleMessage)(v10, 13, 11);
  }
}

void *__35__MXAudioStatistics_sharedInstance__block_invoke()
{
  result = dlopen("/usr/lib/libAudioStatistics.dylib", 1);
  if (result)
  {
    v1 = result;
    gAudioStatistics = [[MXAudioStatistics alloc] initInternal];
    result = dlsym(v1, "CAReportingClientSendSingleMessage");
    *(void *)(gAudioStatistics + 8) = result;
  }
  return result;
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)MXAudioStatistics;
  return [(MXAudioStatistics *)&v3 init];
}

- (void)sendSingleMessageWithDictionary:(id)a3 eventCategory:(unsigned int)a4 eventType:(unsigned __int16)a5
{
}

@end