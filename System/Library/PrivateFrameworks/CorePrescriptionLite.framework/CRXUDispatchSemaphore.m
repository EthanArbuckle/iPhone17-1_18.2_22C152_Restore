@interface CRXUDispatchSemaphore
- (BOOL)waitFor:(double)a3;
- (CRXUDispatchSemaphore)init;
- (CRXUDispatchSemaphore)initWithValue:(unint64_t)a3;
- (id)debugDescription;
- (void)signal;
- (void)wait;
@end

@implementation CRXUDispatchSemaphore

- (CRXUDispatchSemaphore)initWithValue:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRXUDispatchSemaphore;
  v4 = [(CRXUDispatchSemaphore *)&v8 init];
  if (v4)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(a3);
    sem = v4->_sem;
    v4->_sem = (OS_dispatch_semaphore *)v5;
  }
  return v4;
}

- (CRXUDispatchSemaphore)init
{
  return [(CRXUDispatchSemaphore *)self initWithValue:0];
}

- (void)signal
{
}

- (void)wait
{
}

- (BOOL)waitFor:(double)a3
{
  sem = self->_sem;
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  return dispatch_semaphore_wait(sem, v4) == 0;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"%@<%p>", objc_opt_class(), self];
}

- (void).cxx_destruct
{
}

@end