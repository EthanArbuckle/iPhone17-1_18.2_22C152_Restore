@interface PaymentButtonView.Coordinator
- (void)callback;
@end

@implementation PaymentButtonView.Coordinator

- (void)callback
{
  v2 = *(void (**)(uint64_t))self->action;
  uint64_t v3 = swift_retain();
  v2(v3);

  swift_release();
}

@end