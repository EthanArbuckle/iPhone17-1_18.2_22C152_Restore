@interface CUIRuntimeStatistics
+ (id)sharedRuntimeStatistics;
+ (void)generateLog;
- (CUIRuntimeStatistics)init;
- (int64_t)shortCircuitImageLookup;
- (void)_logStatistics:(uint64_t)a3;
- (void)addStatisticAllocatedImageSize:(unint64_t)a3 roundedSize:(unint64_t)a4;
- (void)dealloc;
- (void)incrementMissedLookup;
- (void)incrementStaticsInitialLookup;
- (void)incrementStaticsProbe;
- (void)incrementStatisticDidShortCircuitImageLookup;
- (void)incrementStatisticLookup;
@end

@implementation CUIRuntimeStatistics

+ (id)sharedRuntimeStatistics
{
  if (__once != -1) {
    dispatch_once(&__once, &__block_literal_global_4);
  }
  return (id)__sharedInstance;
}

- (void)incrementStatisticLookup
{
}

- (void)incrementStatisticDidShortCircuitImageLookup
{
}

- (void)incrementStaticsProbe
{
}

- (void)incrementMissedLookup
{
}

- (void)incrementStaticsInitialLookup
{
}

- (void)addStatisticAllocatedImageSize:(unint64_t)a3 roundedSize:(unint64_t)a4
{
}

CUIRuntimeStatistics *__47__CUIRuntimeStatistics_sharedRuntimeStatistics__block_invoke()
{
  result = objc_alloc_init(CUIRuntimeStatistics);
  __sharedInstance = (uint64_t)result;
  return result;
}

- (CUIRuntimeStatistics)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUIRuntimeStatistics;
  v2 = [(CUIRuntimeStatistics *)&v6 init];
  v3 = dispatch_queue_create("com.apple.coreui.statistics", 0);
  v2->_queue = (OS_dispatch_queue *)v3;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __28__CUIRuntimeStatistics_init__block_invoke;
  handler[3] = &unk_1E5A51C00;
  handler[4] = v2;
  notify_register_dispatch("com.apple.coreui.statistics", &v2->_notify_token, v3, handler);
  return v2;
}

void __28__CUIRuntimeStatistics_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_logStatistics:(uint64_t)a3
{
  if (a1)
  {
    atomic_load(a1 + 1);
    uint64_t v9 = atomic_load(a1 + 2);
    atomic_load(a1 + 3);
    atomic_load(a1 + 4);
    atomic_load(a1 + 6);
    atomic_load(a1 + 5);
    atomic_load(a1 + 7);
    _CUILog(2, (uint64_t)"CoreUI: Wasted Size: %lld/%lld=%.2f%% Short Circuit lookups: %lld/%lld=%.2f%% lookups:%lld probes:%lld Missed lookups %lld/%lld=%.2f%%\n", a3, a4, a5, a6, a7, a8, v9);
    atomic_store(0, a1 + 6);
    atomic_store(0, a1 + 5);
  }
}

- (void)dealloc
{
  notify_cancel(self->_notify_token);
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)CUIRuntimeStatistics;
  [(CUIRuntimeStatistics *)&v3 dealloc];
}

+ (void)generateLog
{
}

- (int64_t)shortCircuitImageLookup
{
  return atomic_load((unint64_t *)&self->_shortCircuitImageLookup);
}

@end