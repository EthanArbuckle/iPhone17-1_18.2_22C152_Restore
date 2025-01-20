@interface DataTypeDetailChartCell
- (NSString)chartOverlayVersion;
- (NSString)description;
- (_TtC18HealthExperienceUI23DataTypeDetailChartCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI23DataTypeDetailChartCell)initWithFrame:(CGRect)a3;
@end

@implementation DataTypeDetailChartCell

- (NSString)description
{
  swift_getObjectType();
  v3 = self;
  sub_1AD740E30();
  sub_1AD73F300();
  swift_bridgeObjectRelease();
  sub_1AD73F300();
  sub_1AD740840();

  v4 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC18HealthExperienceUI23DataTypeDetailChartCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_chartViewController) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_item;
  v9 = (objc_class *)type metadata accessor for DataTypeDetailChartCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[DataTypeDetailChartCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI23DataTypeDetailChartCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_chartViewController) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_item;
  v6 = (objc_class *)type metadata accessor for DataTypeDetailChartCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(DataTypeDetailChartCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_chartViewController));
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI23DataTypeDetailChartCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
}

- (NSString)chartOverlayVersion
{
  v2 = self;
  id v3 = DataTypeDetailChartCell.chartOverlayVersion.getter();

  return (NSString *)v3;
}

@end