@interface FBSDispatchSerialQueue
+ (id)_mainQueue;
- (BOOL)isEqual:(id)a3;
- (id)_initWithQueue:(id *)a1;
- (id)backingQueueIfExists;
- (id)description;
- (unint64_t)hash;
- (void)assertBarrierOnQueue;
- (void)performAfter:(double)a3 withBlock:(id)a4;
- (void)performAsync:(id)a3;
- (void)performAsync:(id)a3 withHandoff:(id)a4;
@end

@implementation FBSDispatchSerialQueue

- (void)assertBarrierOnQueue
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)performAsync:(id)a3
{
  if (a3) {
    dispatch_async((dispatch_queue_t)self->_queue, a3);
  }
}

- (void)performAsync:(id)a3 withHandoff:(id)a4
{
  dispatch_block_t block = a3;
  id v6 = a4;
  if (block)
  {
    if (v6) {
      xpc_dictionary_handoff_reply();
    }
    else {
      dispatch_async((dispatch_queue_t)self->_queue, block);
    }
  }
}

- (id)_initWithQueue:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FBSSerialQueue;
    uint64_t v5 = (id *)[super init];
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

+ (id)_mainQueue
{
  self;
  if (_mainQueue_onceToken != -1) {
    dispatch_once(&_mainQueue_onceToken, &__block_literal_global_27);
  }
  v0 = (void *)_mainQueue_mainQueue;

  return v0;
}

void __36__FBSDispatchSerialQueue__mainQueue__block_invoke()
{
  v0 = [FBSDispatchSerialQueue alloc];
  SEL v1 = -[FBSDispatchSerialQueue _initWithQueue:]((id *)&v0->super.super.isa, MEMORY[0x1E4F14428]);
  v2 = (void *)_mainQueue_mainQueue;
  _mainQueue_mainQueue = (uint64_t)v1;

  *(unsigned char *)(_mainQueue_mainQueue + 16) = 1;
}

- (void)performAfter:(double)a3 withBlock:(id)a4
{
  if (a4)
  {
    int64_t v5 = (uint64_t)(a3 * 1000000000.0);
    dispatch_block_t block = a4;
    dispatch_time_t v6 = dispatch_time(0, v5);
    dispatch_after(v6, (dispatch_queue_t)self->_queue, block);
  }
}

- (id)backingQueueIfExists
{
  return self->_queue;
}

- (unint64_t)hash
{
  return [(OS_dispatch_queue *)self->_queue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class()
    && [(OS_dispatch_queue *)self->_queue isEqual:v4[1]]
    && self->_main == *((unsigned __int8 *)v4 + 16);

  return v6;
}

- (id)description
{
  v3 = [off_1E58F44F0 builderWithObject:self];
  id v4 = v3;
  if (self->_main) {
    id v5 = (id)[v3 appendBool:1 withName:@"main"];
  }
  else {
    id v6 = (id)[v3 appendQueue:self->_queue withName:@"dispatchQueue"];
  }
  objc_super v7 = [v4 build];

  return v7;
}

- (void).cxx_destruct
{
}

@end