@interface DeviationsCompactCalendarViewController
- (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DeviationsCompactCalendarViewController

- (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController_subscriptions) = (Class)MEMORY[0x263F8EE88];
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *)sub_241633038();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2415970F4();
}

- (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39DeviationsCompactCalendarViewController_delegate);
  swift_release();

  swift_bridgeObjectRelease();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  swift_retain();
  int64_t v7 = sub_2414349C8();

  swift_release();
  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  id v12 = sub_241597CA4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_241598198(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end