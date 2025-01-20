@interface IconWithNameCell
- (_TtC18HealthExperienceUI16IconWithNameCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI16IconWithNameCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
@end

@implementation IconWithNameCell

- (_TtC18HealthExperienceUI16IconWithNameCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI16IconWithNameCell_item;
  v9 = (objc_class *)type metadata accessor for IconWithNameCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v14.receiver = self;
  v14.super_class = v9;
  v10 = -[IconWithNameCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v10->super.super.super.super.super.super.isa) + 0x70);
  v12 = v10;
  v11();

  return v12;
}

- (_TtC18HealthExperienceUI16IconWithNameCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI16IconWithNameCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI16IconWithNameCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IconWithNameCell();
  v2 = v3.receiver;
  [(IconWithNameCell *)&v3 prepareForReuse];
  (*(void (**)(void, void, void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x88))(0, 0, 0);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1AD73CDB0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73CD90();
  v8 = self;
  sub_1AD5AC4AC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
}

@end