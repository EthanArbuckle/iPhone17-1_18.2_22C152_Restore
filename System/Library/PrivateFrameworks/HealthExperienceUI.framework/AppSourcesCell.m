@interface AppSourcesCell
- (_TtC18HealthExperienceUI14AppSourcesCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI14AppSourcesCell)initWithFrame:(CGRect)a3;
@end

@implementation AppSourcesCell

- (_TtC18HealthExperienceUI14AppSourcesCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI14AppSourcesCell_iconPublisher) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AppSourcesCell();
  return -[IconWithNameCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI14AppSourcesCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI14AppSourcesCell_iconPublisher) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AppSourcesCell();
  return [(IconWithNameCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end