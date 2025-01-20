@interface TransitDepartureRowView
- (_TtC6MapsUI23TransitDepartureRowView)initWithCoder:(id)a3;
- (_TtC6MapsUI23TransitDepartureRowView)initWithFrame:(CGRect)a3;
@end

@implementation TransitDepartureRowView

- (_TtC6MapsUI23TransitDepartureRowView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19321B678();
}

- (_TtC6MapsUI23TransitDepartureRowView)initWithFrame:(CGRect)a3
{
  result = (_TtC6MapsUI23TransitDepartureRowView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC6MapsUI23TransitDepartureRowView_model);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI23TransitDepartureRowView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI23TransitDepartureRowView_secondaryMultipartLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI23TransitDepartureRowView_tertiaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI23TransitDepartureRowView_leadingStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI23TransitDepartureRowView_departureLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI23TransitDepartureRowView_departureDetailLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC6MapsUI23TransitDepartureRowView_trailingStackView);
}

@end