@interface HMFTimerManagerTimerContext
+ (id)comparator;
- (HMFTimerManagerTimerContext)initWithObject:(id)a3 expirationTime:(double)a4;
- (NSObject)object;
- (double)expirationTime;
@end

@implementation HMFTimerManagerTimerContext

+ (id)comparator
{
  if (_MergedGlobals_53 != -1) {
    dispatch_once(&_MergedGlobals_53, &__block_literal_global_1);
  }
  v2 = (void *)MEMORY[0x19F3A8A20](qword_1EB4EEC80);
  return v2;
}

void __41__HMFTimerManagerTimerContext_comparator__block_invoke()
{
  v0 = (void *)qword_1EB4EEC80;
  qword_1EB4EEC80 = (uint64_t)&__block_literal_global_3;
}

uint64_t __41__HMFTimerManagerTimerContext_comparator__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 expirationTime];
  double v7 = v6;
  [v5 expirationTime];
  if (v7 >= v8)
  {
    [v4 expirationTime];
    double v11 = v10;
    [v5 expirationTime];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (HMFTimerManagerTimerContext)initWithObject:(id)a3 expirationTime:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMFTimerManagerTimerContext;
  double v8 = [(HMFTimerManagerTimerContext *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_object, a3);
    v9->_expirationTime = a4;
  }

  return v9;
}

- (NSObject)object
{
  return objc_getProperty(self, a2, 8, 1);
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void).cxx_destruct
{
}

@end