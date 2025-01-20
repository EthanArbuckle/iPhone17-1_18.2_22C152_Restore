@interface DropletParticipantTrackingView
- (_TtC9DropletUI30DropletParticipantTrackingView)initWithCoder:(id)a3;
- (_TtC9DropletUI30DropletParticipantTrackingView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation DropletParticipantTrackingView

- (_TtC9DropletUI30DropletParticipantTrackingView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry;
  sub_24D12BE48((uint64_t)v8);
  sub_24D12C03C((uint64_t)v8, (uint64_t)v5, &qword_26B189100);
  id v6 = a3;

  result = (_TtC9DropletUI30DropletParticipantTrackingView *)sub_24D149448();
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DropletParticipantTrackingView();
  v2 = v4.receiver;
  [(DropletParticipantTrackingView *)&v4 didMoveToSuperview];
  sub_24D12C03C((uint64_t)v2 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v7, &qword_26B189100);
  sub_24D12C03C((uint64_t)v7, (uint64_t)v8, &qword_26B189100);
  if (!sub_24D12C02C(v8))
  {
    v5[10] = v8[10];
    v5[11] = v8[11];
    v5[12] = v8[12];
    uint64_t v6 = v9;
    v5[6] = v8[6];
    v5[7] = v8[7];
    v5[8] = v8[8];
    v5[9] = v8[9];
    v5[2] = v8[2];
    v5[3] = v8[3];
    v5[4] = v8[4];
    v5[5] = v8[5];
    uint64_t v3 = *MEMORY[0x263F8EED0] & *v2;
    v5[0] = v8[0];
    v5[1] = v8[1];
    (*(void (**)(_OWORD *))(v3 + 144))(v5);
  }
}

- (_TtC9DropletUI30DropletParticipantTrackingView)initWithFrame:(CGRect)a3
{
  result = (_TtC9DropletUI30DropletParticipantTrackingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end