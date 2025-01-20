@interface _CPPowerAssertion
- (_CPPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4;
- (double)timeout;
- (void)dealloc;
- (void)setTimeout:(double)a3;
- (void)timedout;
@end

@implementation _CPPowerAssertion

- (_CPPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_CPPowerAssertion;
  v6 = [(_CPPowerAssertion *)&v11 init];
  v7 = v6;
  if (v6)
  {
    if (a4 <= 0.0)
    {
      uint64_t v8 = IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, (CFStringRef)a3, &v6->_assertion);
      if (v8) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v8 = IOPMAssertionCreateWithDescription(@"NoIdleSleepAssertion", (CFStringRef)a3, 0, 0, 0, a4 + 60.0, @"TimeoutActionTurnOff", &v6->_assertion);
      if (v8)
      {
LABEL_4:
        v7->_assertion = 0;
        NSLog((NSString *)@"Unable to create the power assertion for \"%@\" (%d).", a3, v8);

        return 0;
      }
    }
    v7->_identifier = (NSString *)[a3 copy];
    v7->_timeout = a4;
    id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    v7->_stack = (NSArray *)(id)[MEMORY[0x1E4F29060] callStackReturnAddresses];
    if (a4 > 0.0)
    {
      pthread_mutex_lock(&_PowerAssertionsLock);
      if (!_PowerAssertions) {
        _PowerAssertions = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
      }
      if (!_PowerAssertionTimerThread)
      {
        _PowerAssertionTimerThread = objc_alloc_init(_CPPowerAssertionThread);
        [(id)_PowerAssertionTimerThread start];
      }
      pthread_mutex_unlock(&_PowerAssertionsLock);
      [(id)_PowerAssertionTimerThread performSelector:sel_addAssertion_ onThread:_PowerAssertionTimerThread withObject:v7 waitUntilDone:0];
    }
    [v9 drain];
  }
  return v7;
}

- (void)dealloc
{
  pthread_mutex_lock(&_PowerAssertionsLock);
  CFArrayRef v3 = (const __CFArray *)_PowerAssertions;
  if (_PowerAssertions)
  {
    v9.length = CFArrayGetCount((CFArrayRef)_PowerAssertions);
    v9.location = 0;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v9, self);
    if (FirstIndexOfValue != -1) {
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)_PowerAssertions, FirstIndexOfValue);
    }
  }
  pthread_mutex_unlock(&_PowerAssertionsLock);
  IOPMAssertionID assertion = self->_assertion;
  if (assertion)
  {
    uint64_t v6 = IOPMAssertionRelease(assertion);
    if (v6)
    {
      NSLog((NSString *)@"Unable to properly release the power assertion for \"%@\" (%d).  Dropping it instead.", self->_identifier, v6);
      uint64_t v7 = getpid();
      NSLog((NSString *)@"Backtrace for power assertion: pid %d %@", v7, self->_stack);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)_CPPowerAssertion;
  [(_CPPowerAssertion *)&v8 dealloc];
}

- (void)timedout
{
  id v4 = (id)[[NSString alloc] initWithFormat:@"Power assertion timeout for \"%@\".  Simply releasing it now.\nBacktrace for power assertion: pid %d %@", self->_identifier, getpid(), self->_stack];
  NSLog((NSString *)@"%@", v4);
  uint64_t v3 = IOPMAssertionRelease(self->_assertion);
  if (v3) {
    NSLog((NSString *)@"Unable to properly release the power assertion though (%d).  Just dropping it.", v3);
  }
  self->_IOPMAssertionID assertion = 0;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

@end