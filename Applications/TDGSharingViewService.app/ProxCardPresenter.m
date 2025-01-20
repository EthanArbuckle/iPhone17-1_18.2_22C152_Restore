@interface ProxCardPresenter
- (_TtC21TDGSharingViewService17ProxCardPresenter)init;
- (void)proxCardFlowDidDismiss;
@end

@implementation ProxCardPresenter

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_10000CFBC();
}

- (_TtC21TDGSharingViewService17ProxCardPresenter)init
{
  result = (_TtC21TDGSharingViewService17ProxCardPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_navigationController));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21TDGSharingViewService17ProxCardPresenter_deferredViewController);
}

@end