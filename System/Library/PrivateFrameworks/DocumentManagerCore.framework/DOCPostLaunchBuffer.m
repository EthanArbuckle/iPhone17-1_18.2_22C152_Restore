@interface DOCPostLaunchBuffer
+ (DOCPostLaunchBuffer)shared;
- (DOCPostLaunchBuffer)initWithLabel:(id)a3 targetQueue:(id)a4;
- (void)performAfterLaunch:(id)a3;
- (void)performAfterLaunchAlwaysAsync:(BOOL)a3 block:(id)a4;
@end

@implementation DOCPostLaunchBuffer

- (void)performAfterLaunch:(id)a3
{
}

uint64_t __29__DOCPostLaunchBuffer_shared__block_invoke()
{
  shared_sharedInstance = [(DOCOperationBuffer *)[DOCPostLaunchBuffer alloc] initWithLabel:@"postLaunch"];
  return MEMORY[0x270F9A758]();
}

- (void)performAfterLaunchAlwaysAsync:(BOOL)a3 block:(id)a4
{
  v6 = (void (**)(void))a4;
  v9 = v6;
  if (a3
    || (BOOL v7 = [(DOCOperationBuffer *)self locked], v6 = v9, v7)
    || (int v8 = [MEMORY[0x263F08B88] isMainThread], v6 = v9, !v8))
  {
    [(DOCOperationBuffer *)self buffer:v6];
  }
  else
  {
    v9[2](v9);
  }
}

- (DOCPostLaunchBuffer)initWithLabel:(id)a3 targetQueue:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DOCPostLaunchBuffer;
  v4 = [(DOCOperationBuffer *)&v9 initWithLabel:a3 targetQueue:a4];
  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__DOCPostLaunchBuffer_initWithLabel_targetQueue___block_invoke;
    block[3] = &unk_2641B55D8;
    int v8 = v4;
    dispatch_after(v5, MEMORY[0x263EF83A0], block);
  }
  return v4;
}

+ (DOCPostLaunchBuffer)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)shared_sharedInstance;
  return (DOCPostLaunchBuffer *)v2;
}

uint64_t __49__DOCPostLaunchBuffer_initWithLabel_targetQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

@end