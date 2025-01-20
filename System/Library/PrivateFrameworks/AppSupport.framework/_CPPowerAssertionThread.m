@interface _CPPowerAssertionThread
- (void)addAssertion:(id)a3;
- (void)didTimeOut:(id)a3;
- (void)main;
@end

@implementation _CPPowerAssertionThread

- (void)main
{
  self->_earliest = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] distantFuture];
  v3 = (void *)[MEMORY[0x1E4F1CAC0] currentRunLoop];
  v4 = (NSTimer *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:self->_earliest interval:self target:sel_didTimeOut_ selector:0 userInfo:1 repeats:60.0];
  self->_timer = v4;
  [v3 addTimer:v4 forMode:*MEMORY[0x1E4F1C3A0]];
  [v3 run];
}

- (void)addAssertion:(id)a3
{
  pthread_mutex_lock(&_PowerAssertionsLock);
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  [a3 timeout];
  v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  uint64_t v7 = [v6 earlierDate:self->_earliest];
  earliest = self->_earliest;
  if ((NSDate *)v7 == earliest)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:");
    objc_msgSend(a3, "setTimeout:");
    CFIndex Count = CFArrayGetCount((CFArrayRef)_PowerAssertions);
    v19.location = 0;
    v19.length = Count;
    CFIndex v17 = CFArrayBSearchValues((CFArrayRef)_PowerAssertions, v19, a3, (CFComparatorFunction)_CompareAssertionTimeouts, 0);
    if (v17 <= Count) {
      CFArrayInsertValueAtIndex((CFMutableArrayRef)_PowerAssertions, v17, a3);
    }
    else {
      CFArrayAppendValue((CFMutableArrayRef)_PowerAssertions, a3);
    }
  }
  else
  {
    [(NSDate *)earliest timeIntervalSinceDate:v6];
    double v10 = v9;
    CFIndex v11 = CFArrayGetCount((CFArrayRef)_PowerAssertions);
    if (v11 >= 1)
    {
      CFIndex v12 = v11;
      for (CFIndex i = 0; i != v12; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)_PowerAssertions, i);
        [ValueAtIndex timeout];
        [ValueAtIndex setTimeout:v10 + v15];
      }
    }

    self->_earliest = (NSDate *)v6;
    [a3 setTimeout:0.0];
    CFArrayInsertValueAtIndex((CFMutableArrayRef)_PowerAssertions, 0, a3);
    [(NSTimer *)self->_timer setFireDate:v6];
  }
  pthread_mutex_unlock(&_PowerAssertionsLock);
}

- (void)didTimeOut:(id)a3
{
  pthread_mutex_lock(&_PowerAssertionsLock);
  CFIndex Count = CFArrayGetCount((CFArrayRef)_PowerAssertions);

  self->_earliest = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] distantFuture];
  if (Count >= 1)
  {
    CFIndex v5 = 0;
    double v6 = 0.0;
    CFIndex v7 = -1;
    do
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)_PowerAssertions, v5);
      [ValueAtIndex timeout];
      if (v9 == 0.0)
      {
        [ValueAtIndex timedout];
      }
      else
      {
        if (v6 == 0.0)
        {
          [ValueAtIndex timeout];
          double v6 = v10;

          self->_earliest = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:v6];
          CFIndex v7 = v5;
        }
        [ValueAtIndex timeout];
        [ValueAtIndex setTimeout:v11 - v6];
      }
      ++v5;
    }
    while (Count != v5);
    if (v7 != -1)
    {
      v13.location = 0;
      v13.length = v7;
      CFArrayReplaceValues((CFMutableArrayRef)_PowerAssertions, v13, 0, 0);
    }
  }
  [(NSTimer *)self->_timer setFireDate:self->_earliest];
  pthread_mutex_unlock(&_PowerAssertionsLock);
}

@end