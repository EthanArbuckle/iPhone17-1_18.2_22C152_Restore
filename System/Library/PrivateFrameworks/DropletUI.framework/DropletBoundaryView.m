@interface DropletBoundaryView
- (_TtC9DropletUI19DropletBoundaryView)initWithCoder:(id)a3;
- (void)layoutSubviews;
@end

@implementation DropletBoundaryView

- (_TtC9DropletUI19DropletBoundaryView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9DropletUI19DropletBoundaryView_boundaryReferenceBounds);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  id v5 = a3;

  result = (_TtC9DropletUI19DropletBoundaryView *)sub_24D149448();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DropletBoundaryView();
  id v2 = v3.receiver;
  [(DropletBoundaryView *)&v3 layoutSubviews];
  sub_24D12E158((uint64_t)v2 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_lastParticipantGeometry, (uint64_t)v6);
  sub_24D12E158((uint64_t)v6, (uint64_t)v7);
  if (!sub_24D12C02C(v7))
  {
    v4[10] = v7[10];
    v4[11] = v7[11];
    v4[12] = v7[12];
    uint64_t v5 = v8;
    v4[6] = v7[6];
    v4[7] = v7[7];
    v4[8] = v7[8];
    v4[9] = v7[9];
    v4[2] = v7[2];
    v4[3] = v7[3];
    v4[4] = v7[4];
    v4[5] = v7[5];
    v4[0] = v7[0];
    v4[1] = v7[1];
    sub_24D148A58((double *)v4);
  }
}

@end