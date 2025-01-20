@interface _NSFileAccessAsynchronousProcessAssertion
- (_NSFileAccessAsynchronousProcessAssertion)initWithPID:(int)a3 name:(id)a4;
- (int)PID;
- (void)beginAssertion;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _NSFileAccessAsynchronousProcessAssertion

- (void)beginAssertion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(BKSProcessAssertion *)self->_assertion invalidate];

  self->_assertion = 0;
  v3 = _NSFCProcessMonitorLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int pid = self->_pid;
    name = self->_name;
    v6[0] = 67109378;
    v6[1] = pid;
    __int16 v7 = 2114;
    v8 = name;
    _os_log_debug_impl(&dword_181795000, v3, OS_LOG_TYPE_DEBUG, "Preventing suspension of pid %d for activity: %{public}@", (uint8_t *)v6, 0x12u);
  }
  self->_assertion = (BKSProcessAssertion *)[objc_alloc(objc_lookUpClass("BKSProcessAssertion")) initWithPID:self->_pid flags:3 reason:4 name:self->_name withHandler:&__block_literal_global_89];
}

- (_NSFileAccessAsynchronousProcessAssertion)initWithPID:(int)a3 name:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_NSFileAccessAsynchronousProcessAssertion;
  v6 = [(_NSFileAccessAsynchronousProcessAssertion *)&v9 init];
  __int16 v7 = v6;
  if (v6)
  {
    v6->_int pid = a3;
    v6->_name = (NSString *)[a4 copy];
  }
  return v7;
}

- (void)invalidate
{
  self->_assertion = 0;
}

- (int)PID
{
  return self->_pid;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(BKSProcessAssertion *)self->_assertion invalidate];

  v3.receiver = self;
  v3.super_class = (Class)_NSFileAccessAsynchronousProcessAssertion;
  [(_NSFileAccessAsynchronousProcessAssertion *)&v3 dealloc];
}

@end