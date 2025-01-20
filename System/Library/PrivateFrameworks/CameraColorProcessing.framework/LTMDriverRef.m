@interface LTMDriverRef
- (LTMDriverRef)init;
- (int)computeLtmComputeInput:(const sCLRProcHITHStat *)a3 withMetadata:(const sRefDriverInputs *)a4 to:(sLtmComputeInput *)a5 computeInputMetadata:(sLtmComputeMeta *)a6;
- (void)dealloc;
@end

@implementation LTMDriverRef

- (LTMDriverRef)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v4.receiver = self;
  v4.super_class = (Class)LTMDriverRef;
  if ([(LTMDriverRef *)&v4 init]) {
    operator new();
  }
  v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  return 0;
}

- (void)dealloc
{
  ltmDriver = self->_ltmDriver;
  if (ltmDriver) {
    (*((void (**)(LTMDriver *, SEL))ltmDriver->var0 + 1))(ltmDriver, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)LTMDriverRef;
  [(LTMDriverRef *)&v4 dealloc];
}

- (int)computeLtmComputeInput:(const sCLRProcHITHStat *)a3 withMetadata:(const sRefDriverInputs *)a4 to:(sLtmComputeInput *)a5 computeInputMetadata:(sLtmComputeMeta *)a6
{
  if (LTMDriver::Process(self->_ltmDriver, a3, (sRefDriverInputs *)a4, a5))
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -1;
  }
  else
  {
    memcpy(a6, &self->_ltmDriver->var2, sizeof(sLtmComputeMeta));
    return 0;
  }
}

@end