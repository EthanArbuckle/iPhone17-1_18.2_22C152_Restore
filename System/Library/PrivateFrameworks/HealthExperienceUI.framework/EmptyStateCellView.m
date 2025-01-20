@interface EmptyStateCellView
- (_TtC18HealthExperienceUI18EmptyStateCellView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI18EmptyStateCellView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EmptyStateCellView

- (_TtC18HealthExperienceUI18EmptyStateCellView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___label) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___spinner) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___stackView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for EmptyStateCellView();
  v8 = -[EmptyStateCellView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1AD6BD540();

  return v8;
}

- (_TtC18HealthExperienceUI18EmptyStateCellView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI18EmptyStateCellView *)sub_1AD6BD48C(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD6BD9F8();
}

- (void).cxx_destruct
{
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___spinner));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___stackView);
}

@end