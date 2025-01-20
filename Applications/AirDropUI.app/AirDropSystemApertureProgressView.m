@interface AirDropSystemApertureProgressView
- (CGSize)intrinsicContentSize;
- (_TtC9AirDropUI33AirDropSystemApertureProgressView)init;
- (_TtC9AirDropUI33AirDropSystemApertureProgressView)initWithCoder:(id)a3;
- (void)touchedDownCancelButton;
- (void)touchedUpCancelButton;
@end

@implementation AirDropSystemApertureProgressView

- (CGSize)intrinsicContentSize
{
  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_overrideIntrinsicContentSize);
  if (self->progress[OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_overrideIntrinsicContentSize])
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for AirDropSystemApertureProgressView();
    [(AirDropSystemApertureProgressView *)&v5 intrinsicContentSize];
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

- (_TtC9AirDropUI33AirDropSystemApertureProgressView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_progress;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 progressWithTotalUnitCount:1000];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_cancelAction) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_isTouchingDownButton) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_didPostAccessibilityLayoutChangeNotification) = 0;

  CGSize result = (_TtC9AirDropUI33AirDropSystemApertureProgressView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)touchedDownCancelButton
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_isTouchingDownButton) = 1;
  v2 = self;
  sub_10011C6D0();
}

- (void)touchedUpCancelButton
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_isTouchingDownButton) = 0;
  v2 = self;
  sub_10011C6D0();
}

- (_TtC9AirDropUI33AirDropSystemApertureProgressView)init
{
  CGSize result = (_TtC9AirDropUI33AirDropSystemApertureProgressView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_progress));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_cancelAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_progressMicaView));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9AirDropUI33AirDropSystemApertureProgressView_transparentCancelButton);
}

@end