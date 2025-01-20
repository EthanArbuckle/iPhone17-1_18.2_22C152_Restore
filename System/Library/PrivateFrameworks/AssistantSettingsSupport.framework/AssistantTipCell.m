@interface AssistantTipCell
- (_TtC24AssistantSettingsSupport16AssistantTipCell)initWithCoder:(id)a3;
- (_TtC24AssistantSettingsSupport16AssistantTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC24AssistantSettingsSupport16AssistantTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AssistantTipCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_220C5CBC4();
}

- (_TtC24AssistantSettingsSupport16AssistantTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_220C74E00();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC24AssistantSettingsSupport16AssistantTipCell *)sub_220C5C830(a3, v7, v9, a5);
}

- (_TtC24AssistantSettingsSupport16AssistantTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_220C74E00();
    a4 = v8;
  }
  uint64_t v9 = OBJC_IVAR____TtC24AssistantSettingsSupport16AssistantTipCell_tipsManager;
  uint64_t v10 = qword_267F2BA70;
  v11 = self;
  if (v10 != -1) {
    swift_once();
  }
  v12 = (void *)qword_267F2BC88;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)qword_267F2BC88;
  id v13 = v12;

  if (a4)
  {
    v14 = (void *)sub_220C74DD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  v17.receiver = v11;
  v17.super_class = ObjectType;
  v15 = [(AssistantTipCell *)&v17 initWithStyle:a3 reuseIdentifier:v14];

  return v15;
}

- (_TtC24AssistantSettingsSupport16AssistantTipCell)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC24AssistantSettingsSupport16AssistantTipCell_tipsManager;
  uint64_t v7 = qword_267F2BA70;
  id v8 = a3;
  uint64_t v9 = self;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)qword_267F2BC88;
  *(Class *)((char *)&v9->super.super.super.super.super.isa + v6) = (Class)qword_267F2BC88;
  id v11 = v10;

  v14.receiver = v9;
  v14.super_class = ObjectType;
  v12 = [(AssistantTipCell *)&v14 initWithCoder:v8];

  return v12;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24AssistantSettingsSupport16AssistantTipCell_tipsManager));
}

@end