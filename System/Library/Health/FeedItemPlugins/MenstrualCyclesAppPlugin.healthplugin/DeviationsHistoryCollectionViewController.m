@interface DeviationsHistoryCollectionViewController
- (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DeviationsHistoryCollectionViewController

- (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController____lazy_storage___dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController____lazy_storage___coordinator) = 0;
  id v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *)sub_241633038();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_241263F00();
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
  sub_2412658D0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController____lazy_storage___dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin41DeviationsHistoryCollectionViewController_analysisProvider));

  swift_release();
}

@end