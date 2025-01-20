@interface SummarySharingSelectableDataTypeCell
- (_TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell)initWithFrame:(CGRect)a3;
- (void)switchUpdated;
@end

@implementation SummarySharingSelectableDataTypeCell

- (void)switchUpdated
{
  v2 = self;
  sub_1AD4F1868();
}

- (_TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell_selectionSwitch;
  id v9 = objc_allocWithZone(MEMORY[0x1E4FB1CD0]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v11 = OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell_font;
  *(Class *)((char *)&v10->super.super.super.super.super.super.super.isa + v11) = (Class)sub_1AD1F454C((void *)*MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB09D8], 0, 0x8000, 0, 0, 1);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for SummarySharingSelectableDataTypeCell();
  return -[IconWithNameCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell *)SummarySharingSelectableDataTypeCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell_selectionSwitch));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell_font);
}

@end