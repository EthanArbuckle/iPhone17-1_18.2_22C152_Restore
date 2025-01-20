@interface HPSVisionOSSubtitleOnOffIndicatorCell
+ (NSString)cellDisabledKey;
+ (NSString)onOffKey;
- (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell)initWithCoder:(id)a3;
- (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation HPSVisionOSSubtitleOnOffIndicatorCell

+ (NSString)onOffKey
{
  v2 = (void *)sub_1E4CBF1C0();

  return (NSString *)v2;
}

+ (NSString)cellDisabledKey
{
  v2 = (void *)sub_1E4CBF1C0();

  return (NSString *)v2;
}

- (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
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
  return (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell *)sub_1E4C9997C(a3, v7, v9, a5);
}

- (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1E4CBF1F0();
    v6 = (void *)sub_1E4CBF1C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HPSVisionOSSubtitleOnOffIndicatorCell();
  uint64_t v7 = [(HPSVisionOSSubtitleOnOffIndicatorCell *)&v10 initWithStyle:a3 reuseIdentifier:v6];

  uint64_t v8 = v7;
  [(HPSVisionOSSubtitleOnOffIndicatorCell *)v8 setAccessoryType:0];
  [(HPSVisionOSSubtitleOnOffIndicatorCell *)v8 setHoverStyle:0];

  return v8;
}

- (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell)initWithCoder:(id)a3
{
  result = (_TtC16HeadphoneConfigs37HPSVisionOSSubtitleOnOffIndicatorCell *)sub_1E4CBF640();
  __break(1u);
  return result;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E4C99CF8(a3);
}

@end