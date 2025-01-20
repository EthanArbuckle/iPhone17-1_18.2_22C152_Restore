@interface AVResourceReclamationAssertion
- (AVResourceReclamationAssertion)initWithDetails:(id)a3;
- (id)details;
- (void)dealloc;
- (void)invalidate;
@end

@implementation AVResourceReclamationAssertion

- (AVResourceReclamationAssertion)initWithDetails:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVResourceReclamationAssertion;
  v4 = [(AVResourceReclamationAssertion *)&v6 init];
  if (v4) {
    v4->_details = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  [(AVResourceReclamationAssertion *)self invalidate];

  v3.receiver = self;
  v3.super_class = (Class)AVResourceReclamationAssertion;
  [(AVResourceReclamationAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D39C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(+[AVResourceReclamationController defaultController](AVResourceReclamationController, "defaultController", v4, v5), "_releaseResourceReclamationAssertion:", self);
}

- (id)details
{
  return self->_details;
}

@end