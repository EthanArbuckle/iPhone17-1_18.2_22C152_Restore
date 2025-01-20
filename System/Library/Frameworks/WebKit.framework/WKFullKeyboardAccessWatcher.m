@interface WKFullKeyboardAccessWatcher
+ (BOOL)fullKeyboardAccessEnabled;
- (WKFullKeyboardAccessWatcher)init;
- (void)notifyAllProcessPools;
- (void)retrieveKeyboardUIModeFromPreferences:(id)a3;
@end

@implementation WKFullKeyboardAccessWatcher

+ (BOOL)fullKeyboardAccessEnabled
{
  if (_MergedGlobals_120 == 1)
  {
    v2 = (WKFullKeyboardAccessWatcher *)qword_1E93CF690;
  }
  else
  {
    v2 = objc_alloc_init(WKFullKeyboardAccessWatcher);
    qword_1E93CF690 = (uint64_t)v2;
    _MergedGlobals_120 = 1;
  }
  return v2->fullKeyboardAccessEnabled;
}

- (WKFullKeyboardAccessWatcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)WKFullKeyboardAccessWatcher;
  v2 = [(WKFullKeyboardAccessWatcher *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(WKFullKeyboardAccessWatcher *)v2 retrieveKeyboardUIModeFromPreferences:0];
    v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    if (*MEMORY[0x1E4FB9140]) {
      [v4 addObserver:v3 selector:sel_retrieveKeyboardUIModeFromPreferences_ name:*MEMORY[0x1E4FB9140] object:0];
    }
  }
  return v3;
}

- (void)retrieveKeyboardUIModeFromPreferences:(id)a3
{
  int fullKeyboardAccessEnabled = self->fullKeyboardAccessEnabled;
  int v5 = _AXSFullKeyboardAccessEnabled() != 0;
  self->int fullKeyboardAccessEnabled = v5;
  if (fullKeyboardAccessEnabled != v5)
  {
    [(WKFullKeyboardAccessWatcher *)self notifyAllProcessPools];
  }
}

- (void)notifyAllProcessPools
{
  WebKit::WebProcessPool::allProcessPools((uint64_t)&v7);
  if (v8)
  {
    v4 = v7;
    uint64_t v5 = 8 * v8;
    do
    {
      uint64_t v6 = *v4++;
      BOOL fullKeyboardAccessEnabled = self->fullKeyboardAccessEnabled;
      WebKit::WebProcessPool::sendToAllProcesses<Messages::WebProcess::FullKeyboardAccessModeChanged>(v6, (char *)&fullKeyboardAccessEnabled, 0);
      v5 -= 8;
    }
    while (v5);
  }
  WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v7, v3);
}

@end