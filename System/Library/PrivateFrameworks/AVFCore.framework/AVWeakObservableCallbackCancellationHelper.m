@interface AVWeakObservableCallbackCancellationHelper
- (AVWeakObservableCallbackCancellationHelper)init;
- (void)addCallbackToCancel:(id)a3;
- (void)cancelAllCallbacks;
- (void)dealloc;
@end

@implementation AVWeakObservableCallbackCancellationHelper

- (AVWeakObservableCallbackCancellationHelper)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVWeakObservableCallbackCancellationHelper;
  v2 = [(AVWeakObservableCallbackCancellationHelper *)&v4 init];
  if (v2) {
    v2->_callbackRegistrations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)addCallbackToCancel:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVWeakObservableCallbackCancellationHelper;
  [(AVWeakObservableCallbackCancellationHelper *)&v3 dealloc];
}

- (void)cancelAllCallbacks
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  callbackRegistrations = self->_callbackRegistrations;
  uint64_t v3 = [(NSMutableArray *)callbackRegistrations countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(callbackRegistrations);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) cancelCallbacks];
      }
      uint64_t v4 = [(NSMutableArray *)callbackRegistrations countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

@end