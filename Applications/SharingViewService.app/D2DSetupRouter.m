@interface D2DSetupRouter
- (_TtC18SharingViewService14D2DSetupRouter)init;
- (void)proxCardFlowDidDismiss;
@end

@implementation D2DSetupRouter

- (_TtC18SharingViewService14D2DSetupRouter)init
{
  return (_TtC18SharingViewService14D2DSetupRouter *)sub_10009CC04();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18SharingViewService14D2DSetupRouter_navigationController));
  sub_100017C38(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18SharingViewService14D2DSetupRouter_didDismiss));
  sub_100017C38(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18SharingViewService14D2DSetupRouter_prepareForPresentation));

  swift_unknownObjectWeakDestroy();
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_10009CD98();
}

@end