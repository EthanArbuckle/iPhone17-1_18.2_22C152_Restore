@interface BWSubjectRelightingCalculatorResult
- (BOOL)relightingRequired;
- (BOOL)waitForResult;
- (BWSubjectRelightingCalculatorResult)init;
- (float)curveParameter;
- (void)_completeWithRelightingRequired:(BOOL)a3 curveParameter:(float)a4;
- (void)dealloc;
@end

@implementation BWSubjectRelightingCalculatorResult

- (BWSubjectRelightingCalculatorResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWSubjectRelightingCalculatorResult;
  v2 = [(BWSubjectRelightingCalculatorResult *)&v5 init];
  if (v2)
  {
    v3 = dispatch_group_create();
    v2->_group = (OS_dispatch_group *)v3;
    dispatch_group_enter(v3);
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSubjectRelightingCalculatorResult;
  [(BWSubjectRelightingCalculatorResult *)&v3 dealloc];
}

- (BOOL)relightingRequired
{
  return self->_relightingRequired;
}

- (float)curveParameter
{
  return self->_curveParameter;
}

- (BOOL)waitForResult
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  intptr_t v4 = dispatch_group_wait((dispatch_group_t)self->_group, 0);
  if (v4) {
    dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
  }
  os_unfair_lock_unlock(p_lock);
  return v4 != 0;
}

- (void)_completeWithRelightingRequired:(BOOL)a3 curveParameter:(float)a4
{
  self->_relightingRequired = a3;
  self->_curveParameter = a4;
  dispatch_group_leave((dispatch_group_t)self->_group);
}

@end