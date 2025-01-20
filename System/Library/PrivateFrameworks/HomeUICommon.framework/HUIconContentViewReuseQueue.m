@interface HUIconContentViewReuseQueue
+ (id)globalReuseQueueForContentViewClass:(Class)a3;
- (Class)contentViewClass;
- (HUIconContentViewReuseQueue)init;
- (HUIconContentViewReuseQueue)initWithContentViewClass:(Class)a3;
- (NSMutableArray)reuseStack;
- (id)dequeueContentView;
- (void)reapContentView:(id)a3;
@end

@implementation HUIconContentViewReuseQueue

HUIconContentViewReuseQueue *__67__HUIconContentViewReuseQueue_globalReuseQueueForContentViewClass___block_invoke_3(uint64_t a1)
{
  v1 = [[HUIconContentViewReuseQueue alloc] initWithContentViewClass:*(void *)(a1 + 32)];
  return v1;
}

- (HUIconContentViewReuseQueue)initWithContentViewClass:(Class)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUIconContentViewReuseQueue;
  v4 = [(HUIconContentViewReuseQueue *)&v9 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_contentViewClass, a3);
    uint64_t v6 = objc_opt_new();
    reuseStack = v5->_reuseStack;
    v5->_reuseStack = (NSMutableArray *)v6;
  }
  return v5;
}

- (id)dequeueContentView
{
  v3 = [(HUIconContentViewReuseQueue *)self reuseStack];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(HUIconContentViewReuseQueue *)self reuseStack];
    id v6 = [v5 lastObject];

    v7 = [(HUIconContentViewReuseQueue *)self reuseStack];
    [v7 removeLastObject];
  }
  else
  {
    id v6 = objc_alloc_init([(HUIconContentViewReuseQueue *)self contentViewClass]);
  }
  return v6;
}

- (NSMutableArray)reuseStack
{
  return self->_reuseStack;
}

- (Class)contentViewClass
{
  return self->_contentViewClass;
}

+ (id)globalReuseQueueForContentViewClass:(Class)a3
{
  if (_MergedGlobals_8 != -1) {
    dispatch_once(&_MergedGlobals_8, &__block_literal_global_3_0);
  }
  id v4 = (id)qword_26B22BA80;
  v5 = NSStringFromClass(a3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__HUIconContentViewReuseQueue_globalReuseQueueForContentViewClass___block_invoke_3;
  v8[3] = &__block_descriptor_40_e34___HUIconContentViewReuseQueue_8__0lu32l8;
  v8[4] = a3;
  id v6 = objc_msgSend(v4, "na_objectForKey:withDefaultValue:", v5, v8);

  return v6;
}

uint64_t __67__HUIconContentViewReuseQueue_globalReuseQueueForContentViewClass___block_invoke_2()
{
  qword_26B22BA80 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (HUIconContentViewReuseQueue)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithContentViewClass_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUIconContentViewReuseQueue.m", 27, @"%s is unavailable; use %@ instead",
    "-[HUIconContentViewReuseQueue init]",
    v5);

  return 0;
}

- (void)reapContentView:(id)a3
{
  id v4 = a3;
  id v5 = [(HUIconContentViewReuseQueue *)self reuseStack];
  [v5 addObject:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseStack, 0);
  objc_storeStrong((id *)&self->_contentViewClass, 0);
}

@end