@interface DataTypeDetailUnitCell
- (_TtC18HealthExperienceUI22DataTypeDetailUnitCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI22DataTypeDetailUnitCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)configureCell;
@end

@implementation DataTypeDetailUnitCell

- (_TtC18HealthExperienceUI22DataTypeDetailUnitCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI22DataTypeDetailUnitCell *)DataTypeDetailUnitCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI22DataTypeDetailUnitCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeDetailUnitCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  id v6 = a3;

  result = (_TtC18HealthExperienceUI22DataTypeDetailUnitCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)configureCell
{
  v2 = self;
  sub_1AD5A7C28();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  v9 = (void *)sub_1AD73CD80();
  v10 = (objc_class *)type metadata accessor for DataTypeDetailUnitCell();
  v11.receiver = v8;
  v11.super_class = v10;
  [(DataTypeDetailUnitCell *)&v11 _bridgedUpdateConfigurationUsingState:v9];

  sub_1AD45BE74();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
}

@end