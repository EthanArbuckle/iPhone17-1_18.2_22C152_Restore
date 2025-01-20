@interface TUTestState
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (int)signalCount;
- (int)waitWithTimeout:(double)a3;
- (void)incrementIntegerForKey:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)signal;
@end

@implementation TUTestState

- (void).cxx_destruct
{
}

- (int)signalCount
{
  return self->_signalCount;
}

- (int)waitWithTimeout:(double)a3
{
  int signalCount = self->_signalCount;
  if (signalCount > 0) {
    goto LABEL_4;
  }
  if (CFRunLoopRunEx(a3) == 2)
  {
    int signalCount = self->_signalCount;
LABEL_4:
    int result = 0;
    self->_int signalCount = signalCount - 1;
    return result;
  }
  return -6722;
}

- (void)signal
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__TUTestState_signal__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __21__TUTestState_signal__block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(void *)(a1 + 32) + 16);
  Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

- (void)incrementIntegerForKey:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  id v7 = [(TUTestState *)self objectForKeyedSubscript:v5];
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
  [(TUTestState *)self setObject:v6 forKeyedSubscript:v5];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  objects = v7->_objects;
  if (v11)
  {
    if (!objects)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v10 = v7->_objects;
      v7->_objects = v9;

      objects = v7->_objects;
    }
    [(NSMutableDictionary *)objects setObject:v11 forKeyedSubscript:v6];
  }
  else
  {
    [(NSMutableDictionary *)objects removeObjectForKey:v6];
  }
  objc_sync_exit(v7);
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_objects objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (id)description
{
  return NSPrintF((uint64_t)"TUTestState %{ptr} %@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
}

@end