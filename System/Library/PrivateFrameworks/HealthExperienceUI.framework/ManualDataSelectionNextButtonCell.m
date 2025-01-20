@interface ManualDataSelectionNextButtonCell
- (_TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell)initWithFrame:(CGRect)a3;
@end

@implementation ManualDataSelectionNextButtonCell

- (_TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_didTapAction);
  ButtonCell = (objc_class *)type metadata accessor for ManualDataSelectionNextButtonCell();
  void *v9 = 0;
  v9[1] = 0;
  v12.receiver = self;
  v12.super_class = ButtonCell;
  return -[ManualDataSelectionNextButtonCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_didTapAction);
  ButtonCell = (objc_class *)type metadata accessor for ManualDataSelectionNextButtonCell();
  void *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = ButtonCell;
  return [(ManualDataSelectionNextButtonCell *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_item);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_didTapAction);
  sub_1AD1E4514(v3);
}

@end