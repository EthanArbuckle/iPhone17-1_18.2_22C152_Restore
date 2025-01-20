@interface ContentConfigurationTableViewCell
- (_TtC18HealthExperienceUI33ContentConfigurationTableViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI33ContentConfigurationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation ContentConfigurationTableViewCell

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  sub_1AD1CECFC();
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (objc_class *)type metadata accessor for ContentConfigurationTableViewCell();
  v13.receiver = self;
  v13.super_class = v10;
  v11 = self;
  [(ContentConfigurationTableViewCell *)&v13 setSelected:v5 animated:v4];
  sub_1AD55D80C(v5, (int)[(ContentConfigurationTableViewCell *)v11 isHighlighted], (uint64_t)v9);
  uint64_t v12 = sub_1AD73CE60();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 0, 1, v12);
  MEMORY[0x1B3E65E00](v9);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  sub_1AD1CECFC();
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (objc_class *)type metadata accessor for ContentConfigurationTableViewCell();
  v13.receiver = self;
  v13.super_class = v10;
  v11 = self;
  [(ContentConfigurationTableViewCell *)&v13 setHighlighted:v5 animated:v4];
  sub_1AD55D80C((char)[(ContentConfigurationTableViewCell *)v11 isSelected], v5, (uint64_t)v9);
  uint64_t v12 = sub_1AD73CE60();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 0, 1, v12);
  MEMORY[0x1B3E65E00](v9);
}

- (_TtC18HealthExperienceUI33ContentConfigurationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33ContentConfigurationTableViewCell_item;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((void *)v6 + 4) = 0;
    uint64_t v7 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33ContentConfigurationTableViewCell_item;
    *(_OWORD *)uint64_t v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((void *)v8 + 4) = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ContentConfigurationTableViewCell();
  v9 = [(ContentConfigurationTableViewCell *)&v11 initWithStyle:a3 reuseIdentifier:v7];

  return v9;
}

- (_TtC18HealthExperienceUI33ContentConfigurationTableViewCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI33ContentConfigurationTableViewCell *)sub_1AD55DE84((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC18HealthExperienceUI33ContentConfigurationTableViewCell_item, type metadata accessor for ContentConfigurationTableViewCell);
}

- (void).cxx_destruct
{
}

@end