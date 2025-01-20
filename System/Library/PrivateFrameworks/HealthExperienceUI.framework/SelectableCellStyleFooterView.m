@interface SelectableCellStyleFooterView
- (_TtC18HealthExperienceUI29SelectableCellStyleFooterView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI29SelectableCellStyleFooterView)initWithFrame:(CGRect)a3;
- (void)didSelect;
@end

@implementation SelectableCellStyleFooterView

- (_TtC18HealthExperienceUI29SelectableCellStyleFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI29SelectableCellStyleFooterView *)SelectableCellStyleFooterView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI29SelectableCellStyleFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD33B088();
}

- (void)didSelect
{
  v2 = self;
  sub_1AD33A62C();
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29SelectableCellStyleFooterView_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29SelectableCellStyleFooterView_contentView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI29SelectableCellStyleFooterView_titleLabel);
}

@end