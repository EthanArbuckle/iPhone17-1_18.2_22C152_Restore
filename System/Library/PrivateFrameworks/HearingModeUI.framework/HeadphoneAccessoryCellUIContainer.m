@interface HeadphoneAccessoryCellUIContainer
+ (NSString)deviceKey;
+ (NSString)embeddedViewKey;
+ (NSString)fullBoundsTreatmentKey;
- (_TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer)initWithCoder:(id)a3;
- (_TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation HeadphoneAccessoryCellUIContainer

+ (NSString)embeddedViewKey
{
  v2 = (void *)sub_2512C47C8();
  return (NSString *)v2;
}

+ (NSString)fullBoundsTreatmentKey
{
  v2 = (void *)sub_2512C47C8();
  return (NSString *)v2;
}

+ (NSString)deviceKey
{
  if (qword_269B2F8E8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2512C47C8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_2512C47F8();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer *)sub_2512A4E24(a3, v7, v9, a5);
}

- (_TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_2512C47F8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer *)sub_2512A5100(a3, (uint64_t)a4, v6);
}

- (_TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer_traiRegestration) = 0;
  id v4 = a3;

  result = (_TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer *)sub_2512C4B48();
  __break(1u);
  return result;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_2512A53F4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI33HeadphoneAccessoryCellUIContainer____lazy_storage___stackView));
  swift_unknownObjectRelease();
}

@end