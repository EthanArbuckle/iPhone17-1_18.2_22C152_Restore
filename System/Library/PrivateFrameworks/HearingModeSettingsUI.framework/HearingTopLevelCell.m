@interface HearingTopLevelCell
+ (NSString)deviceKey;
+ (NSString)hideDisclosureKey;
+ (NSString)useCaseKey;
- (_TtC21HearingModeSettingsUI19HearingTopLevelCell)initWithCoder:(id)a3;
- (_TtC21HearingModeSettingsUI19HearingTopLevelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC21HearingModeSettingsUI19HearingTopLevelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation HearingTopLevelCell

+ (NSString)useCaseKey
{
  v2 = (void *)sub_25126C458();
  return (NSString *)v2;
}

+ (NSString)deviceKey
{
  if (qword_269B2C308 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)hideDisclosureKey
{
  v2 = (void *)sub_25126C458();
  return (NSString *)v2;
}

- (_TtC21HearingModeSettingsUI19HearingTopLevelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_25126C488();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC21HearingModeSettingsUI19HearingTopLevelCell *)sub_25124F704(a3, v7, v9, a5);
}

- (_TtC21HearingModeSettingsUI19HearingTopLevelCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_25126C488();
    v6 = (void *)sub_25126C458();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HearingTopLevelCell();
  uint64_t v7 = [(HearingTopLevelCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  [(HearingTopLevelCell *)v7 setAccessoryType:1];
  return v7;
}

- (_TtC21HearingModeSettingsUI19HearingTopLevelCell)initWithCoder:(id)a3
{
  result = (_TtC21HearingModeSettingsUI19HearingTopLevelCell *)sub_25126C8B8();
  __break(1u);
  return result;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_25124FA24(a3);
}

@end