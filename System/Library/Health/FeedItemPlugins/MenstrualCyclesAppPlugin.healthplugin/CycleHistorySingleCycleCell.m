@interface CycleHistorySingleCycleCell
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)cycleViewPanned:(id)a3;
- (void)cycleViewPressed:(id)a3;
- (void)cycleViewTapped:(id)a3;
- (void)prepareForReuse;
- (void)respondToHorizontalSizeChanges;
@end

@implementation CycleHistorySingleCycleCell

- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell *)sub_241459F4C(v4, v5);
}

- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_singleCycleView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for CycleHistorySingleCycleView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_press) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_tap) = 0;

  result = (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistorySingleCycleCell();
  id v2 = v3.receiver;
  [(CycleHistorySingleCycleCell *)&v3 prepareForReuse];
  sub_24133CC94();
}

- (void)respondToHorizontalSizeChanges
{
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_24162F0E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162F0D8();
  v8 = self;
  sub_241459044();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)cycleViewTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24145A0CC();
}

- (void)cycleViewPanned:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2414598E0(v4);
}

- (void)cycleViewPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_241459A00(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_press);
  return v4 && v4 == a3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_singleCycleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_press));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_tap);
}

@end