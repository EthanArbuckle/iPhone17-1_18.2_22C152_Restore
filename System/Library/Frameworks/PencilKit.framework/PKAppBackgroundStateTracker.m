@interface PKAppBackgroundStateTracker
+ (id)sharedInstance;
- (PKAppBackgroundStateTracker)init;
- (void)_updateState;
- (void)_updateStateOnMainThread;
@end

@implementation PKAppBackgroundStateTracker

- (void)_updateStateOnMainThread
{
  if (a1)
  {
    v2 = [*(id *)(a1 + 16) sharedApplication];
    unsigned __int8 v3 = [v2 applicationState] == 2;

    atomic_store(v3, (unsigned __int8 *)(a1 + 8));
  }
}

void __43__PKAppBackgroundStateTracker__updateState__block_invoke(uint64_t a1)
{
}

void __45__PKAppBackgroundStateTracker_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKAppBackgroundStateTracker);
  v1 = (void *)qword_1EB3C5F48;
  qword_1EB3C5F48 = (uint64_t)v0;
}

- (PKAppBackgroundStateTracker)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKAppBackgroundStateTracker;
  v2 = [(PKAppBackgroundStateTracker *)&v11 init];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    atomic_store(0, (unsigned __int8 *)&v2->_inBackground);
    Class v4 = NSClassFromString(&cfstr_Uiapplication.isa);
    v3->_applicationClass = v4;
    if (v4)
    {
      if ((_UIApplicationIsExtension() & 1) == 0)
      {
        v5 = [MEMORY[0x1E4F28B50] mainBundle];
        v6 = [v5 bundleIdentifier];
        char v7 = [v6 isEqualToString:@"com.apple.ScreenshotServicesService"];

        if ((v7 & 1) == 0)
        {
          v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v8 addObserver:v3 selector:sel__updateState name:*MEMORY[0x1E4FB2640] object:0];

          v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v9 addObserver:v3 selector:sel__updateState name:*MEMORY[0x1E4FB2628] object:0];

          [(PKAppBackgroundStateTracker *)v3 _updateState];
        }
      }
    }
  }
  return v3;
}

- (void)_updateState
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    -[PKAppBackgroundStateTracker _updateStateOnMainThread]((uint64_t)self);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PKAppBackgroundStateTracker__updateState__block_invoke;
    block[3] = &unk_1E64C61C0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

+ (id)sharedInstance
{
  self;
  if (_MergedGlobals_130 != -1) {
    dispatch_once(&_MergedGlobals_130, &__block_literal_global_35);
  }
  v0 = (void *)qword_1EB3C5F48;

  return v0;
}

@end