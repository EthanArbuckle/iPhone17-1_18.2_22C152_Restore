@interface SegmentedControlCell
- (_TtC18HealthExperienceUI20SegmentedControlCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI20SegmentedControlCell)initWithFrame:(CGRect)a3;
- (void)segmentedControlChanged:(id)a3;
@end

@implementation SegmentedControlCell

- (_TtC18HealthExperienceUI20SegmentedControlCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI20SegmentedControlCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  uint64_t v9 = OBJC_IVAR____TtC18HealthExperienceUI20SegmentedControlCell_segmentedControl;
  id v10 = objc_allocWithZone(MEMORY[0x1E4FB1C10]);
  v11 = self;
  v12 = (void *)sub_1AD73F490();
  v13 = (objc_class *)objc_msgSend(v10, sel_initWithItems_, v12);

  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = v13;
  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for SegmentedControlCell();
  v14 = -[SegmentedControlCell initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  sub_1AD612104();

  return v14;
}

- (_TtC18HealthExperienceUI20SegmentedControlCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI20SegmentedControlCell *)SegmentedControlCell.init(coder:)(a3);
}

- (void)segmentedControlChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD612484(v4);
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI20SegmentedControlCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI20SegmentedControlCell_segmentedControl);
}

@end