@interface HKOutsideViewTapDetector
+ (id)_detectorSingleton;
+ (void)addOutsideTouchCallbackForView:(id)a3 outsideTapBlock:(id)a4;
+ (void)removeOutsideTouchCallbackForView:(id)a3;
- (HKOutsideViewTapDetector)init;
- (NSMutableArray)windowCallbacks;
- (id)_callbacksForWindow:(id)a3;
- (void)_removeCallbacksForView:(id)a3;
- (void)setWindowCallbacks:(id)a3;
@end

@implementation HKOutsideViewTapDetector

- (HKOutsideViewTapDetector)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKOutsideViewTapDetector;
  v2 = [(HKOutsideViewTapDetector *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    windowCallbacks = v2->_windowCallbacks;
    v2->_windowCallbacks = v3;
  }
  return v2;
}

+ (id)_detectorSingleton
{
  if (_detectorSingleton_onceToken != -1) {
    dispatch_once(&_detectorSingleton_onceToken, &__block_literal_global_47);
  }
  v2 = (void *)_detectorSingleton__detector;
  return v2;
}

uint64_t __46__HKOutsideViewTapDetector__detectorSingleton__block_invoke()
{
  v0 = objc_alloc_init(HKOutsideViewTapDetector);
  uint64_t v1 = _detectorSingleton__detector;
  _detectorSingleton__detector = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)addOutsideTouchCallbackForView:(id)a3 outsideTapBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = +[HKOutsideViewTapDetector _detectorSingleton];
  v7 = [v6 window];
  v8 = [v9 _callbacksForWindow:v7];

  [v8 addCallbackForView:v6 outsideTapBlock:v5];
}

+ (void)removeOutsideTouchCallbackForView:(id)a3
{
  id v3 = a3;
  id v4 = +[HKOutsideViewTapDetector _detectorSingleton];
  [v4 _removeCallbacksForView:v3];
}

- (id)_callbacksForWindow:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HKOutsideViewTapDetector *)self windowCallbacks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 matchesWindow:v4])
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v11 = [[_HKOutsideTapWindowCallbacks alloc] initWithWindow:v4];
  id v5 = [(HKOutsideViewTapDetector *)self windowCallbacks];
  [v5 addObject:v11];
LABEL_11:

  return v11;
}

- (void)_removeCallbacksForView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(HKOutsideViewTapDetector *)self windowCallbacks];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) removeCallbackForView:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSMutableArray)windowCallbacks
{
  return self->_windowCallbacks;
}

- (void)setWindowCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end