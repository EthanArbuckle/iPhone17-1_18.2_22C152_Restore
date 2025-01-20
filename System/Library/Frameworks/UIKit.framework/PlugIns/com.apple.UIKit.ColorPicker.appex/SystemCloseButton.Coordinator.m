@interface SystemCloseButton.Coordinator
- (void)primaryAction;
@end

@implementation SystemCloseButton.Coordinator

- (void)primaryAction
{
  v2 = *(void (**)(uint64_t))self->action;
  swift_retain();
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();

  swift_release();
}

@end