@interface AirDropSystemApertureView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9AirDropUI25AirDropSystemApertureView)init;
- (_TtC9AirDropUI25AirDropSystemApertureView)initWithCoder:(id)a3;
- (_TtC9AirDropUI25AirDropSystemApertureView)initWithFrame:(CGRect)a3;
@end

@implementation AirDropSystemApertureView

- (_TtC9AirDropUI25AirDropSystemApertureView)init
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9AirDropUI25AirDropSystemApertureView_expanded) = 0;
  if (qword_10017F7C8 != -1) {
    swift_once();
  }
  double v3 = *(double *)&qword_10018D160;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AirDropSystemApertureView();
  return -[AirDropSystemApertureView initWithFrame:](&v5, "initWithFrame:", 0.0, 0.0, v3, v3);
}

- (_TtC9AirDropUI25AirDropSystemApertureView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9AirDropUI25AirDropSystemApertureView_expanded) = 0;
  id v4 = a3;

  result = (_TtC9AirDropUI25AirDropSystemApertureView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if ((*(uint64_t (**)(__n128, __n128))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x58))((__n128)a3, *(__n128 *)&a3.height))
  {
    uint64_t v4 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    uint64_t v5 = qword_10017F7C8;
    v6 = self;
    if (v5 != -1) {
      swift_once();
    }
    uint64_t v4 = qword_10018D160;
  }
  double v7 = *(double *)&v4;
  double v8 = *(double *)&v4;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  if (((*(uint64_t (**)(__n128, __n128, float, float))((swift_isaMask & (uint64_t)self->super.super.super.isa)
                                                                + 0x58))((__n128)a3, *(__n128 *)&a3.height, a4, a5) & 1) != 0)
  {
    uint64_t v6 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    uint64_t v7 = qword_10017F7C8;
    double v8 = self;
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v6 = qword_10018D160;
  }
  double v9 = *(double *)&v6;
  double v10 = *(double *)&v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  if ((unint64_t)(a4 + 1) >= 3 && (unint64_t)(a4 - 2) > 1)
  {
    uint64_t v7 = 0x40482AA9930BE0DFLL;
  }
  else
  {
    uint64_t v5 = qword_10017F7C8;
    uint64_t v6 = self;
    if (v5 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_10018D160;
  }
  double v8 = *(double *)&v7;
  double v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC9AirDropUI25AirDropSystemApertureView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9AirDropUI25AirDropSystemApertureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end