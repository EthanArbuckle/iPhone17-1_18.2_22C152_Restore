@interface CommitTrackingView
- (_TtC27ActionButtonConfigurationUI18CommitTrackingView)initWithCoder:(id)a3;
- (_TtC27ActionButtonConfigurationUI18CommitTrackingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CommitTrackingView

- (void)layoutSubviews
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_2473D7FA8((uint64_t)v2);
    v2(v3);
    sub_2473D81A0((uint64_t)v2);
  }
}

- (_TtC27ActionButtonConfigurationUI18CommitTrackingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler);
  void *v9 = 0;
  v9[1] = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[CommitTrackingView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC27ActionButtonConfigurationUI18CommitTrackingView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler);
  void *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(CommitTrackingView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_2473D81A0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler));
}

@end