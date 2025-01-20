@interface NSRunLoop(NSRunLoop)
+ (id)_new:()NSRunLoop;
+ (uint64_t)currentRunLoop;
+ (uint64_t)mainRunLoop;
- (CFArrayRef)allModes;
- (__CFRunLoop)currentMode;
- (__CFString)description;
- (id)dealloc;
- (uint64_t)_addPort:()NSRunLoop forMode:;
- (uint64_t)_containsPort:()NSRunLoop forMode:;
- (uint64_t)_enumerateInfoPairsWithBlock:()NSRunLoop;
- (uint64_t)_portInvalidated:()NSRunLoop;
- (uint64_t)_removePort:()NSRunLoop forMode:;
- (uint64_t)acceptInputForMode:()NSRunLoop beforeDate:;
- (uint64_t)addPort:()NSRunLoop forMode:;
- (uint64_t)containsPort:()NSRunLoop forMode:;
- (uint64_t)containsTimer:()NSRunLoop forMode:;
- (uint64_t)init;
- (uint64_t)limitDateForMode:()NSRunLoop;
- (uint64_t)performBlock:()NSRunLoop;
- (uint64_t)portsForMode:()NSRunLoop;
- (uint64_t)removePort:()NSRunLoop forMode:;
- (uint64_t)run;
- (uint64_t)runBeforeDate:()NSRunLoop;
- (uint64_t)runMode:()NSRunLoop beforeDate:;
- (uint64_t)runMode:()NSRunLoop untilDate:;
- (uint64_t)timersForMode:()NSRunLoop;
- (void)_wakeup;
- (void)addTimer:()NSRunLoop forMode:;
- (void)performInModes:()NSRunLoop block:;
- (void)removeTimer:()NSRunLoop forMode:;
- (void)runUntilDate:()NSRunLoop;
@end

@implementation NSRunLoop(NSRunLoop)

- (uint64_t)run
{
  uint64_t v2 = *MEMORY[0x1E4F1D418];
  do
    uint64_t result = objc_msgSend(a1, "runMode:beforeDate:", v2, objc_msgSend(MEMORY[0x1E4F1C9C8], "distantFuture"));
  while ((result & 1) != 0);
  return result;
}

- (uint64_t)runMode:()NSRunLoop beforeDate:
{
  v5 = a3;
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  if (![(objc_class *)a1 getCFRunLoop] || !_CFRunLoopIsCurrent()) {
    return 0;
  }
  if ([(__CFString *)v5 isEqual:@"NSDefaultRunLoopMode"]) {
    v5 = (__CFString *)*MEMORY[0x1E4F1D418];
  }
  if (_CFRunLoopFinished()) {
    return 0;
  }
  _CFAutoreleasePoolPush();
  [a4 timeIntervalSinceReferenceDate];
  double v11 = v10;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v8 = 1;
  CFRunLoopRunInMode(v5, v11 - Current, 1u);
  _CFAutoreleasePoolPop();
  return v8;
}

+ (id)_new:()NSRunLoop
{
  v4 = (objc_class *)self;
  id v5 = NSAllocateObject(v4, 0, 0);
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  [v5 _initWithRl:a3 dperf:v6 perft:v7 info:v8 ports:objc_opt_new()];

  return v5;
}

+ (uint64_t)mainRunLoop
{
  _CFAutoreleasePoolPush();
  CFRunLoopGetMain();
  uint64_t v0 = _CFRunLoopGet2();
  _CFAutoreleasePoolPop();
  return v0;
}

- (uint64_t)performBlock:()NSRunLoop
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F1C3A0];
  return objc_msgSend(a1, "performInModes:block:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 1), a3);
}

- (void)performInModes:()NSRunLoop block:
{
  if (!a4)
  {
    v9 = +[NSString stringWithFormat:@"%@: block targets for run loops cannot be nil", _NSMethodExceptionProem(a1, a2)];
LABEL_9:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v9 userInfo:0]);
  }
  if (!a3 || ![a3 count])
  {
    v9 = +[NSString stringWithFormat:@"%@: modes for block performers on run loops cannot be nil or contain no elements", _NSMethodExceptionProem(a1, a2)];
    goto LABEL_9;
  }
  uint64_t v8 = (__CFRunLoop *)[(objc_class *)a1 getCFRunLoop];
  CFRunLoopPerformBlock(v8, a3, a4);

  CFRunLoopWakeUp(v8);
}

+ (uint64_t)currentRunLoop
{
  _CFAutoreleasePoolPush();
  CFRunLoopGetCurrent();
  uint64_t v0 = _CFRunLoopGet2();
  _CFAutoreleasePoolPop();
  return v0;
}

- (void)runUntilDate:()NSRunLoop
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F1D418];
  do
  {
    if (![a1 runMode:v5 beforeDate:a3]) {
      break;
    }
    [a3 timeIntervalSinceReferenceDate];
  }
  while (v6 > CFAbsoluteTimeGetCurrent());
}

- (void)addTimer:()NSRunLoop forMode:
{
  id v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    double v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  uint64_t v8 = [(objc_class *)a1 getCFRunLoop];
  if (v8)
  {
    v9 = (__CFRunLoop *)v8;
    if ([(__CFString *)v4 isEqual:@"NSDefaultRunLoopMode"]) {
      id v4 = (__CFString *)*MEMORY[0x1E4F1D418];
    }
    if (v4 == (__CFString *)*MEMORY[0x1E4F1C4B0]
      || [(__CFString *)v4 isEqual:@"kCFRunLoopCommonModes"])
    {
      id v4 = (__CFString *)*MEMORY[0x1E4F1D410];
    }
    CFRunLoopAddTimer(v9, a3, v4);
  }
}

- (__CFRunLoop)currentMode
{
  uint64_t result = (__CFRunLoop *)[a1 getCFRunLoop];
  if (result)
  {
    uint64_t v2 = (__CFString *)CFRunLoopCopyCurrentMode(result);
    return (__CFRunLoop *)v2;
  }
  return result;
}

- (uint64_t)_enumerateInfoPairsWithBlock:()NSRunLoop
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v11 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (void *)[a1 _info];
  uint64_t result = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v4);
        }
        if ((v7 + v10))
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, char *))(a3 + 16))(a3, v8, *(void *)(*((void *)&v13 + 1) + 8 * v10), v7 + v10 - 1, &v11);
          if (v11) {
            return result;
          }
        }
        else
        {
          uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        }
        ++v10;
      }
      while (v6 != v10);
      uint64_t result = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
      uint64_t v6 = result;
      v7 += v10;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_portInvalidated:()NSRunLoop
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(a1);
  _CFAutoreleasePoolPush();
  id v5 = (id)[a3 object];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = +[NSIndexSet indexSet];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__NSRunLoop_NSRunLoop___portInvalidated___block_invoke;
  v12[3] = &unk_1E51FA338;
  v12[4] = v5;
  v12[5] = v6;
  v12[6] = v7;
  [a1 _enumerateInfoPairsWithBlock:v12];
  objc_msgSend((id)objc_msgSend(a1, "_info"), "removeObjectsAtIndexes:", v7);
  while (objc_msgSend((id)objc_msgSend(a1, "_ports"), "member:", v5))
    objc_msgSend((id)objc_msgSend(a1, "_ports"), "removeObject:", v5);
  [+[NSNotificationCenter defaultCenter] removeObserver:a1 name:@"NSPortDidBecomeInvalidNotification" object:v5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 removeFromRunLoop:a1 forMode:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v8);
  }
  _CFAutoreleasePoolPop();
  return objc_sync_exit(a1);
}

- (uint64_t)_containsPort:()NSRunLoop forMode:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  objc_sync_enter(a1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__NSRunLoop_NSRunLoop___containsPort_forMode___block_invoke;
  v9[3] = &unk_1E51FA360;
  v9[4] = a3;
  v9[5] = a4;
  v9[6] = &v10;
  [a1 _enumerateInfoPairsWithBlock:v9];
  objc_sync_exit(a1);
  uint64_t v7 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (uint64_t)_addPort:()NSRunLoop forMode:
{
  objc_sync_enter(a1);
  _CFAutoreleasePoolPush();
  if (a3 && !objc_msgSend((id)objc_msgSend(a1, "_ports"), "member:", a3))
  {
    [+[NSNotificationCenter defaultCenter] addObserver:a1 selector:sel__portInvalidated_ name:@"NSPortDidBecomeInvalidNotification" object:a3];
    int v7 = 1;
  }
  else
  {
    int v7 = [a1 _containsPort:a3 forMode:a4] ^ 1;
  }
  objc_msgSend((id)objc_msgSend(a1, "_ports"), "addObject:", a3);
  objc_msgSend((id)objc_msgSend(a1, "_info"), "addObject:", a3);
  uint64_t v8 = (void *)[a4 copy];
  objc_msgSend((id)objc_msgSend(a1, "_info"), "addObject:", v8);

  if (v7) {
    [a3 scheduleInRunLoop:a1 forMode:v8];
  }
  _CFAutoreleasePoolPop();

  return objc_sync_exit(a1);
}

- (uint64_t)_removePort:()NSRunLoop forMode:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(a1);
  _CFAutoreleasePoolPush();
  id v7 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__NSRunLoop_NSRunLoop___removePort_forMode___block_invoke;
  v11[3] = &unk_1E51FA388;
  v11[4] = a3;
  v11[5] = a4;
  v11[6] = &v16;
  v11[7] = &v12;
  [a1 _enumerateInfoPairsWithBlock:v11];
  if (v17[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = (void *)[a1 _info];
    objc_msgSend(v8, "removeObjectsInRange:", v17[3], 2);
  }
  uint64_t v9 = (void *)[a1 _ports];
  [v9 removeObject:a3];
  if (![v9 countForObject:a3]) {
    [+[NSNotificationCenter defaultCenter] removeObserver:a1 name:@"NSPortDidBecomeInvalidNotification" object:a3];
  }
  if (*((unsigned char *)v13 + 24)) {
    [a3 removeFromRunLoop:a1 forMode:a4];
  }
  _CFAutoreleasePoolPop();
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return objc_sync_exit(a1);
}

- (uint64_t)init
{
  return 0;
}

- (id)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [+[NSNotificationCenter defaultCenter] removeObserver:a1 name:@"NSPortDidBecomeInvalidNotification" object:0];
  [a1 _deallocHelper];
  v3.receiver = a1;
  v3.super_class = (Class)&off_1ECAF23A8;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

- (__CFString)description
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (const void *)[a1 getCFRunLoop];
  if (v2)
  {
    objc_super v3 = (__CFString *)CFCopyDescription(v2);
    return v3;
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&off_1ECAF23A8;
    return (__CFString *)objc_msgSendSuper2(&v5, sel_description);
  }
}

- (uint64_t)addPort:()NSRunLoop forMode:
{
  uint64_t v4 = a4;
  if ((!a3 || !a4) && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v9 = _NSMethodExceptionProem(a1, a2);
    uint64_t v10 = "port";
    if (a3) {
      uint64_t v10 = "mode";
    }
    char v11 = +[NSString stringWithFormat:@"%@: %s argument cannot be nil", v9, v10];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
  }
  uint64_t result = [(objc_class *)a1 getCFRunLoop];
  if (result)
  {
    if ([v4 isEqual:@"NSDefaultRunLoopMode"]) {
      uint64_t v4 = (void *)*MEMORY[0x1E4F1D418];
    }
    if (v4 == (void *)*MEMORY[0x1E4F1C4B0]
      || [v4 isEqual:@"kCFRunLoopCommonModes"])
    {
      uint64_t v4 = (void *)*MEMORY[0x1E4F1D410];
    }
    return [(objc_class *)a1 _addPort:a3 forMode:v4];
  }
  return result;
}

- (uint64_t)removePort:()NSRunLoop forMode:
{
  uint64_t v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  uint64_t result = [(objc_class *)a1 getCFRunLoop];
  if (a3 && result)
  {
    if ([v4 isEqual:@"NSDefaultRunLoopMode"]) {
      uint64_t v4 = (void *)*MEMORY[0x1E4F1D418];
    }
    if (v4 == (void *)*MEMORY[0x1E4F1C4B0]
      || [v4 isEqual:@"kCFRunLoopCommonModes"])
    {
      uint64_t v4 = (void *)*MEMORY[0x1E4F1D410];
    }
    return [(objc_class *)a1 _removePort:a3 forMode:v4];
  }
  return result;
}

- (uint64_t)containsPort:()NSRunLoop forMode:
{
  uint64_t v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  uint64_t v8 = [(objc_class *)a1 getCFRunLoop];
  if (!a3 || !v8) {
    return 0;
  }
  if ([v4 isEqual:@"NSDefaultRunLoopMode"]) {
    uint64_t v4 = (void *)*MEMORY[0x1E4F1D418];
  }
  if (v4 == (void *)*MEMORY[0x1E4F1C4B0] || [v4 isEqual:@"kCFRunLoopCommonModes"]) {
    uint64_t v4 = (void *)*MEMORY[0x1E4F1D410];
  }

  return [(objc_class *)a1 _containsPort:a3 forMode:v4];
}

- (uint64_t)portsForMode:()NSRunLoop
{
  return [MEMORY[0x1E4F1C978] array];
}

- (void)removeTimer:()NSRunLoop forMode:
{
  uint64_t v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  uint64_t v8 = [(objc_class *)a1 getCFRunLoop];
  if (v8)
  {
    uint64_t v9 = (__CFRunLoop *)v8;
    if ([(__CFString *)v4 isEqual:@"NSDefaultRunLoopMode"]) {
      uint64_t v4 = (__CFString *)*MEMORY[0x1E4F1D418];
    }
    if (v4 == (__CFString *)*MEMORY[0x1E4F1C4B0]
      || [(__CFString *)v4 isEqual:@"kCFRunLoopCommonModes"])
    {
      uint64_t v4 = (__CFString *)*MEMORY[0x1E4F1D410];
    }
    CFRunLoopRemoveTimer(v9, a3, v4);
  }
}

- (uint64_t)timersForMode:()NSRunLoop
{
  return [MEMORY[0x1E4F1C978] array];
}

- (uint64_t)containsTimer:()NSRunLoop forMode:
{
  uint64_t v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  uint64_t result = [(objc_class *)a1 getCFRunLoop];
  if (result)
  {
    uint64_t v9 = (__CFRunLoop *)result;
    if ([(__CFString *)v4 isEqual:@"NSDefaultRunLoopMode"]) {
      uint64_t v4 = (__CFString *)*MEMORY[0x1E4F1D418];
    }
    if (v4 == (__CFString *)*MEMORY[0x1E4F1C4B0]
      || [(__CFString *)v4 isEqual:@"kCFRunLoopCommonModes"])
    {
      uint64_t v4 = (__CFString *)*MEMORY[0x1E4F1D410];
    }
    return CFRunLoopContainsTimer(v9, a3, v4) != 0;
  }
  return result;
}

- (CFArrayRef)allModes
{
  v1 = (__CFRunLoop *)[a1 getCFRunLoop];
  if (v1)
  {
    CFArrayRef v2 = CFRunLoopCopyAllModes(v1);
    return v2;
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    return (CFArrayRef)[v4 array];
  }
}

- (uint64_t)limitDateForMode:()NSRunLoop
{
  objc_super v3 = a3;
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    char v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  uint64_t v6 = [(objc_class *)a1 getCFRunLoop];
  if (!v6) {
    return 0;
  }
  id v7 = (__CFRunLoop *)v6;
  if (!_CFRunLoopIsCurrent()) {
    return 0;
  }
  if ([(__CFString *)v3 isEqual:@"NSDefaultRunLoopMode"]) {
    objc_super v3 = (__CFString *)*MEMORY[0x1E4F1D418];
  }
  CFRunLoopRunInMode(v3, -10.0, 1u);
  if (_CFRunLoopFinished()) {
    return 0;
  }
  CFAbsoluteTime NextTimerFireDate = CFRunLoopGetNextTimerFireDate(v7, v3);
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
  if (NextTimerFireDate == 0.0)
  {
    return [v10 distantFuture];
  }
  else
  {
    return objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  }
}

- (void)_wakeup
{
  v1 = (__CFRunLoop *)[a1 getCFRunLoop];
  if (v1)
  {
    CFArrayRef v2 = v1;
    CFRunLoopStop(v1);
    CFRunLoopWakeUp(v2);
  }
}

- (uint64_t)acceptInputForMode:()NSRunLoop beforeDate:
{
  objc_super v5 = a3;
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    char v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  uint64_t result = [(objc_class *)a1 getCFRunLoop];
  if (result)
  {
    uint64_t result = _CFRunLoopIsCurrent();
    if (result)
    {
      if ([(__CFString *)v5 isEqual:@"NSDefaultRunLoopMode"]) {
        objc_super v5 = (__CFString *)*MEMORY[0x1E4F1D418];
      }
      [a4 timeIntervalSinceReferenceDate];
      double v10 = v9;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v12 = v10 - v11;
      return CFRunLoopRunInMode(v5, v12, 1u);
    }
  }
  return result;
}

- (uint64_t)runMode:()NSRunLoop untilDate:
{
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  if (![(objc_class *)a1 getCFRunLoop]) {
    return 0;
  }
  id v8 = a4;
  if ([(objc_class *)a1 runMode:a3 beforeDate:a4])
  {
    [a4 timeIntervalSinceReferenceDate];
    double v10 = v9;
    double Current = CFAbsoluteTimeGetCurrent();
    if (v10 <= Current)
    {
      unsigned int v12 = 1;
    }
    else
    {
      do
      {
        unsigned int v12 = [(objc_class *)a1 runMode:a3 beforeDate:a4];
        if (!v12) {
          break;
        }
        [a4 timeIntervalSinceReferenceDate];
      }
      while (v13 > CFAbsoluteTimeGetCurrent());
    }
    if (v10 > Current) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v12;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (uint64_t)runBeforeDate:()NSRunLoop
{
  return [a1 runMode:*MEMORY[0x1E4F1D418] beforeDate:a3];
}

@end