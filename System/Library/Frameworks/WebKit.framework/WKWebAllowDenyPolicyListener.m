@interface WKWebAllowDenyPolicyListener
- (WKWebAllowDenyPolicyListener)initWithCompletionHandler:(void *)a3;
- (id).cxx_construct;
- (void)allow;
- (void)deny;
@end

@implementation WKWebAllowDenyPolicyListener

- (WKWebAllowDenyPolicyListener)initWithCompletionHandler:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WKWebAllowDenyPolicyListener;
  v4 = [(WKWebAllowDenyPolicyListener *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)a3;
    *(void *)a3 = 0;
    value = v4->_completionHandler.m_callableWrapper.__ptr_.__value_;
    v5->_completionHandler.m_callableWrapper.__ptr_.__value_ = v6;
    if (value) {
      (*(void (**)(void *))(*(void *)value + 8))(value);
    }
  }
  return v5;
}

- (void)allow
{
}

- (void)deny
{
}

- (void).cxx_destruct
{
  value = self->_completionHandler.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_callableWrapper.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end