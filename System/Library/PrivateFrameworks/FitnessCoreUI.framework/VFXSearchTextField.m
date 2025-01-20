@interface VFXSearchTextField
- (_TtC13FitnessCoreUI18VFXSearchTextField)initWithCoder:(id)a3;
- (_TtC13FitnessCoreUI18VFXSearchTextField)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VFXSearchTextField

- (void)layoutSubviews
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_24EEA6708();
  swift_release();
}

- (_TtC13FitnessCoreUI18VFXSearchTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField_backgroundVisualEffect) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField____lazy_storage___backgroundVisuallEffectView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for VFXSearchTextField();
  v8 = -[VFXSearchTextField initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  swift_release();
  return v8;
}

- (_TtC13FitnessCoreUI18VFXSearchTextField)initWithCoder:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField_backgroundVisualEffect) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField____lazy_storage___backgroundVisuallEffectView) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VFXSearchTextField();
  v5 = [(UISearchTextField *)&v7 initWithCoder:a3];
  swift_release();
  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField_backgroundVisualEffect));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC13FitnessCoreUI18VFXSearchTextField____lazy_storage___backgroundVisuallEffectView);
}

@end