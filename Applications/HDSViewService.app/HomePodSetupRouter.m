@interface HomePodSetupRouter
- (_TtC14HDSViewService18HomePodSetupRouter)init;
- (void)proxCardFlowDidDismiss;
@end

@implementation HomePodSetupRouter

- (_TtC14HDSViewService18HomePodSetupRouter)init
{
  return (_TtC14HDSViewService18HomePodSetupRouter *)sub_1000644A0();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14HDSViewService18HomePodSetupRouter_navigationController));
  sub_1000647CC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14HDSViewService18HomePodSetupRouter_didDismiss));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC14HDSViewService18HomePodSetupRouter_prepareForPresentation);

  sub_1000647CC(v3);
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_100064628();
}

@end