@interface TransitIncidentRowView
- (_TtC6MapsUI22TransitIncidentRowView)initWithCoder:(id)a3;
- (_TtC6MapsUI22TransitIncidentRowView)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation TransitIncidentRowView

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_1932093E4(a3, a4);
}

- (_TtC6MapsUI22TransitIncidentRowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI22TransitIncidentRowView_incidentViewModel) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[MUDisclosureActionRowView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC6MapsUI22TransitIncidentRowView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC6MapsUI22TransitIncidentRowView_incidentViewModel) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(TransitIncidentRowView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MapsUI22TransitIncidentRowView_incidentViewModel));
}

@end