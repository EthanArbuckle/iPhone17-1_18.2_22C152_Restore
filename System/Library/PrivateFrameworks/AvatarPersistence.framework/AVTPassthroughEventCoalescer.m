@interface AVTPassthroughEventCoalescer
- (id)handler;
- (void)eventDidOccur:(id)a3;
- (void)registerEventForCoalescingWithLabel:(id)a3 handler:(id)a4;
- (void)setHandler:(id)a3;
@end

@implementation AVTPassthroughEventCoalescer

- (void)registerEventForCoalescingWithLabel:(id)a3 handler:(id)a4
{
}

- (void)eventDidOccur:(id)a3
{
  id v6 = a3;
  v4 = [(AVTPassthroughEventCoalescer *)self handler];
  v4[2]();

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    v5 = v6;
  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end