@interface LTMComputeRef
- (LTMComputeRef)init;
- (int)computeLTM:(const sLtmComputeInput *)a3 withMetadata:(const sLtmComputeMeta *)a4 to:(sLtmComputeOutput *)a5;
@end

@implementation LTMComputeRef

- (LTMComputeRef)init
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)LTMComputeRef;
  v2 = [(LTMComputeRef *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v3;
}

- (int)computeLTM:(const sLtmComputeInput *)a3 withMetadata:(const sLtmComputeMeta *)a4 to:(sLtmComputeOutput *)a5
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  operator new();
}

@end