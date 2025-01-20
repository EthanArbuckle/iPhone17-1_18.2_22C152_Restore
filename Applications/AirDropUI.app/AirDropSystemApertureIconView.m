@interface AirDropSystemApertureIconView
- (CGSize)intrinsicContentSize;
- (_TtC9AirDropUI29AirDropSystemApertureIconView)init;
- (_TtC9AirDropUI29AirDropSystemApertureIconView)initWithCoder:(id)a3;
@end

@implementation AirDropSystemApertureIconView

- (CGSize)intrinsicContentSize
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_overrideIntrinsicContentSize);
  if (self->progress[OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_overrideIntrinsicContentSize])
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for AirDropSystemApertureIconView();
    [(AirDropSystemApertureIconView *)&v5 intrinsicContentSize];
  }
  else
  {
    double v3 = *v2;
    double v4 = v2[1];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9AirDropUI29AirDropSystemApertureIconView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_progress) = 0;
  objc_super v5 = (char *)self + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_transferState;
  uint64_t v6 = enum case for SFAirDropReceive.Transfer.State.created(_:);
  uint64_t v7 = type metadata accessor for SFAirDropReceive.Transfer.State();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_thumbnailImage) = 0;
  id v8 = a3;

  CGSize result = (_TtC9AirDropUI29AirDropSystemApertureIconView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC9AirDropUI29AirDropSystemApertureIconView)init
{
  CGSize result = (_TtC9AirDropUI29AirDropSystemApertureIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = (char *)self + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_transferState;
  uint64_t v4 = type metadata accessor for SFAirDropReceive.Transfer.State();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_airDropMicaView));
  objc_super v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9AirDropUI29AirDropSystemApertureIconView_thumbnailImage);
}

@end