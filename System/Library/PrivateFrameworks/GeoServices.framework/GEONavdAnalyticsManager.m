@interface GEONavdAnalyticsManager
+ (id)sharedManager;
- (GEONavdAnalyticsReporter)analyticsReporter;
- (void)setAnalyticsReporter:(id)a3;
@end

@implementation GEONavdAnalyticsManager

+ (id)sharedManager
{
  if (qword_1EB29F5B8 != -1) {
    dispatch_once(&qword_1EB29F5B8, &__block_literal_global_14);
  }
  v2 = (void *)_MergedGlobals_188;

  return v2;
}

void __40__GEONavdAnalyticsManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(GEONavdAnalyticsManager);
  v1 = (void *)_MergedGlobals_188;
  _MergedGlobals_188 = (uint64_t)v0;
}

- (GEONavdAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end