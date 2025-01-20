@interface HeaderWithActionButtonCollectionViewCell
- (_TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation HeaderWithActionButtonCollectionViewCell

- (_TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell *)sub_2413BF7CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2413C1708();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_24162F0E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162F0D8();
  v8 = self;
  sub_2413C0514((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_2413C1454((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell_item, (unint64_t *)&qword_268CFFE30, (void (*)(uint64_t))sub_2411E1530);
  id v3 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell_listContentConfiguration;
  uint64_t v4 = sub_24162F338();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell_actionButtonConfiguration;
  uint64_t v6 = sub_241632B78();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell_actionButtonTrailingSideBySideConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell_actionButtonLeadingStackedConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell____lazy_storage___actionButton));
  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell____lazy_storage___titleLabel);
}

@end