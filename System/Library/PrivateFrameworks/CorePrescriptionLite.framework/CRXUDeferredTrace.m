@interface CRXUDeferredTrace
+ (id)deferredTraceWithCode:(unint64_t)a3 arg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7;
- (CRXUDeferredTrace)initWithCode:(unint64_t)a3 arg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7;
- (unint64_t)arg1;
- (unint64_t)arg2;
- (unint64_t)arg3;
- (unint64_t)arg4;
- (unint64_t)code;
- (void)dealloc;
- (void)setArg1:(unint64_t)a3;
- (void)setArg2:(unint64_t)a3;
- (void)setArg3:(unint64_t)a3;
- (void)setArg4:(unint64_t)a3;
- (void)setCode:(unint64_t)a3;
@end

@implementation CRXUDeferredTrace

+ (id)deferredTraceWithCode:(unint64_t)a3 arg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7
{
  v7 = (void *)[objc_alloc((Class)a1) initWithCode:a3 arg1:a4 arg2:a5 arg3:a6 arg4:a7];
  return v7;
}

- (CRXUDeferredTrace)initWithCode:(unint64_t)a3 arg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)CRXUDeferredTrace;
  result = [(CRXUDeferredTrace *)&v13 init];
  if (result)
  {
    result->_code = a3;
    result->_arg1 = a4;
    result->_arg2 = a5;
    result->_arg3 = a6;
    result->_arg4 = a7;
  }
  return result;
}

- (void)dealloc
{
  kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)CRXUDeferredTrace;
  [(CRXUDeferredTrace *)&v3 dealloc];
}

- (unint64_t)code
{
  return self->_code;
}

- (void)setCode:(unint64_t)a3
{
  self->_code = a3;
}

- (unint64_t)arg1
{
  return self->_arg1;
}

- (void)setArg1:(unint64_t)a3
{
  self->_arg1 = a3;
}

- (unint64_t)arg2
{
  return self->_arg2;
}

- (void)setArg2:(unint64_t)a3
{
  self->_arg2 = a3;
}

- (unint64_t)arg3
{
  return self->_arg3;
}

- (void)setArg3:(unint64_t)a3
{
  self->_arg3 = a3;
}

- (unint64_t)arg4
{
  return self->_arg4;
}

- (void)setArg4:(unint64_t)a3
{
  self->_arg4 = a3;
}

@end