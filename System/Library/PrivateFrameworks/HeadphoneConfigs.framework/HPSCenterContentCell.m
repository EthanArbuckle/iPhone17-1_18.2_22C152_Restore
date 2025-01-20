@interface HPSCenterContentCell
- (_TtC16HeadphoneConfigs20HPSCenterContentCell)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigs20HPSCenterContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC16HeadphoneConfigs20HPSCenterContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)addSubview:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation HPSCenterContentCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4C9FEEC();
}

- (void)addSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  [(HPSCenterContentCell *)&v4 addSubview:a3];
}

- (_TtC16HeadphoneConfigs20HPSCenterContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_1E4CBF1F0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC16HeadphoneConfigs20HPSCenterContentCell *)sub_1E4C9C408(a3, v7, v9, a5);
}

- (_TtC16HeadphoneConfigs20HPSCenterContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1E4CBF1F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label;
  uint64_t v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)sub_1E4C9C230();
  *(Class *)((char *)&v9->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice) = 0;

  if (v7)
  {
    id v10 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  v11 = [(HPSCenterContentCell *)&v13 initWithStyle:a3 reuseIdentifier:v10];

  return v11;
}

- (_TtC16HeadphoneConfigs20HPSCenterContentCell)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label;
  id v5 = a3;
  uint64_t v6 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_1E4C9C230();
  *(Class *)((char *)&v6->super.super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice) = 0;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  uint64_t v7 = [(HPSCenterContentCell *)&v9 initWithCoder:v5];

  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice);
}

@end