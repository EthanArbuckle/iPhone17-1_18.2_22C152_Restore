@interface SingleValueView
- (_TtC15HealthRecordsUI15SingleValueView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI15SingleValueView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SingleValueView

- (_TtC15HealthRecordsUI15SingleValueView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI15SingleValueView *)SingleValueView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI15SingleValueView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView_viewData;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_OWORD *)v4 + 5) = 0u;
  *(void *)(v4 + 93) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView_activeConstraints) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView____lazy_storage___textualValueView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView____lazy_storage___textualTitleView) = 0;
  id v5 = a3;

  result = (_TtC15HealthRecordsUI15SingleValueView *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SingleValueView();
  id v2 = v3.receiver;
  [(SingleValueView *)&v3 didMoveToSuperview];
  sub_1C234D404();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C234C710(a3);
}

- (void).cxx_destruct
{
  sub_1C22AC064(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView_viewData), *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView_viewData), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView_viewData), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView_viewData), *(void **)((char *)&self->super._cachedTraitCollection + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView_viewData), *(void **)((char *)&self->super._swiftAnimationInfo + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView_viewData), *(void **)((char *)&self->super._traitChangeRegistry + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView_viewData));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView____lazy_storage___textualValueView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI15SingleValueView____lazy_storage___textualTitleView);
}

@end