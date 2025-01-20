@interface CUIPlaceholderCUIRuntimeStatistics
+ (id)sharedRuntimeStatistics;
+ (void)generateLog;
- (CUIPlaceholderCUIRuntimeStatistics)init;
- (int64_t)shortCircuitImageLookup;
- (unint64_t)_logStatistics:(unint64_t *)result;
- (void)addStatisticAllocatedImageSize:(unint64_t)a3 roundedSize:(unint64_t)a4;
- (void)dealloc;
- (void)incrementMissedLookup;
- (void)incrementStaticsInitialLookup;
- (void)incrementStaticsProbe;
- (void)incrementStatisticDidShortCircuitImageLookup;
- (void)incrementStatisticLookup;
@end

@implementation CUIPlaceholderCUIRuntimeStatistics

+ (id)sharedRuntimeStatistics
{
  if (__once != -1) {
    dispatch_once(&__once, &__block_literal_global_14);
  }
  return (id)__sharedInstance;
}

CUIPlaceholderCUIRuntimeStatistics *__61__CUIPlaceholderCUIRuntimeStatistics_sharedRuntimeStatistics__block_invoke()
{
  result = objc_alloc_init(CUIPlaceholderCUIRuntimeStatistics);
  __sharedInstance = (uint64_t)result;
  return result;
}

- (CUIPlaceholderCUIRuntimeStatistics)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPlaceholderCUIRuntimeStatistics;
  v2 = [(CUIPlaceholderCUIRuntimeStatistics *)&v6 init];
  v3 = dispatch_queue_create("com.apple.coreui.statistics", 0);
  v2->_queue = (OS_dispatch_queue *)v3;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__CUIPlaceholderCUIRuntimeStatistics_init__block_invoke;
  handler[3] = &unk_1E6C9C490;
  handler[4] = v2;
  notify_register_dispatch("com.apple.coreui.statistics", &v2->_notify_token, v3, handler);
  return v2;
}

unint64_t *__42__CUIPlaceholderCUIRuntimeStatistics_init__block_invoke(uint64_t a1)
{
  return -[CUIPlaceholderCUIRuntimeStatistics _logStatistics:](*(unint64_t **)(a1 + 32));
}

- (unint64_t)_logStatistics:(unint64_t *)result
{
  if (result)
  {
    v1 = result;
    atomic_load(result + 1);
    atomic_load(result + 2);
    atomic_load(result + 3);
    atomic_load(result + 4);
    atomic_load(result + 6);
    atomic_load(result + 5);
    atomic_load(result + 7);
    result = (unint64_t *)_CUILog();
    atomic_store(0, v1 + 6);
    atomic_store(0, v1 + 5);
  }
  return result;
}

- (void)dealloc
{
  notify_cancel(self->_notify_token);
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholderCUIRuntimeStatistics;
  [(CUIPlaceholderCUIRuntimeStatistics *)&v3 dealloc];
}

+ (void)generateLog
{
}

- (void)addStatisticAllocatedImageSize:(unint64_t)a3 roundedSize:(unint64_t)a4
{
}

- (void)incrementStatisticDidShortCircuitImageLookup
{
}

- (void)incrementStatisticLookup
{
}

- (void)incrementStaticsInitialLookup
{
}

- (void)incrementStaticsProbe
{
}

- (int64_t)shortCircuitImageLookup
{
  return atomic_load((unint64_t *)&self->_shortCircuitImageLookup);
}

- (void)incrementMissedLookup
{
}

@end