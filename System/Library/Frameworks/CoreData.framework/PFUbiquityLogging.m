@interface PFUbiquityLogging
+ (BOOL)canLogMessageAtLevel:(int)a3;
+ (void)initialize;
+ (void)setLoggingLevel:(int)a3;
- (PFUbiquityLogging)init;
- (int)desiredLogLevel;
- (void)dealloc;
- (void)setDesiredLogLevel:(int)a3;
- (void)userDefaultsChanged:(id)a3;
@end

@implementation PFUbiquityLogging

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _singleton = objc_alloc_init(PFUbiquityLogging);
  }
}

- (PFUbiquityLogging)init
{
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityLogging;
  v2 = [(PFUbiquityLogging *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_desiredLogLevel = 0;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__PFUbiquityLogging_init__block_invoke;
    block[3] = &unk_1E544B868;
    block[4] = v3;
    dispatch_async(global_queue, block);
  }
  return v3;
}

void __25__PFUbiquityLogging_init__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C127630]();
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel_userDefaultsChanged_ name:*MEMORY[0x1E4F28AC8] object:v3];
  id v5 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, @"com.apple.coredata.ubiquity.logLevel");
  if (v5)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = [v5 intValue];
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    if (v6) {
      objc_msgSend(v6, "setDesiredLogLevel:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "integerForKey:", @"com.apple.coredata.ubiquity.logLevel"));
    }
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PFUbiquityLogging;
  [(PFUbiquityLogging *)&v2 dealloc];
}

- (void)userDefaultsChanged:(id)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PFUbiquityLogging_userDefaultsChanged___block_invoke;
  block[3] = &unk_1E544B868;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __41__PFUbiquityLogging_userDefaultsChanged___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    objc_msgSend(v3, "setDesiredLogLevel:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "integerForKey:", @"com.apple.coredata.ubiquity.logLevel"));
  }

  return [v2 drain];
}

+ (void)setLoggingLevel:(int)a3
{
}

+ (BOOL)canLogMessageAtLevel:(int)a3
{
  return [(id)_singleton desiredLogLevel] >= a3;
}

- (int)desiredLogLevel
{
  return self->_desiredLogLevel;
}

- (void)setDesiredLogLevel:(int)a3
{
  self->_desiredLogLevel = a3;
}

@end