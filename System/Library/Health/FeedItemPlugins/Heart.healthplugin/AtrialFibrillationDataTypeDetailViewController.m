@interface AtrialFibrillationDataTypeDetailViewController
- (BOOL)isPinned;
- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithCoder:(id)a3;
- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5;
- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithStyle:(int64_t)a3;
- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithUsingInsetStyling:(BOOL)a3;
- (id)featureStatusCells;
- (id)featureStatusFooterView;
- (id)makeInternalSettingsControllerWithHealthStore:(id)a3;
- (void)didSelectRegulatoryRow;
- (void)featureStatusCellTappedAtIndexPath:(id)a3;
- (void)recomputeTotalSampleCount;
- (void)setPinned:(BOOL)a3;
- (void)showAddDataVC;
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
- (void)viewDidLoad;
@end

@implementation AtrialFibrillationDataTypeDetailViewController

- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_240ACB7E8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_240AC7C60();
}

- (BOOL)isPinned
{
  v2 = self;
  char v3 = sub_240AC8070();

  return v3 & 1;
}

- (void)setPinned:(BOOL)a3
{
  v4 = self;
  sub_240AC82D8(a3);
}

- (void)recomputeTotalSampleCount
{
  v2 = self;
  sub_240AC84D0();
}

- (void)showAddDataVC
{
  v2 = self;
  sub_240AC86DC();
}

- (void)didSelectRegulatoryRow
{
  v2 = self;
  sub_240AC8B98();
}

- (id)featureStatusCells
{
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_allFeatureStatusCellsFromFeedItems);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v15 = self;
    uint64_t v16 = sub_240BB7900();
    swift_bridgeObjectRelease();
    sub_240BB4850();
    uint64_t v17 = sub_240BB7900();
    swift_bridgeObjectRelease();
    if (v17 < 0) {
      __break(1u);
    }
    if (v16 >= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v16;
    }
    if (v16 < 0) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v18;
    }
    sub_240BB4850();
    uint64_t v20 = sub_240BB7900();
    swift_bridgeObjectRelease();
    if (v20 < v19) {
      __break(1u);
    }
    uint64_t v4 = v19;
  }
  else
  {
    if (*(uint64_t *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    sub_240BB4850();
    v5 = self;
  }
  uint64_t v6 = sub_240ACAB88(0, v4, v3);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  sub_240ACB8E8(v6, v8, v10, v12);

  sub_240BB50A0();
  sub_240A34DC4(0, &qword_268CA0168);
  v13 = (void *)sub_240BB6EF0();
  swift_bridgeObjectRelease();

  return v13;
}

- (id)featureStatusFooterView
{
  v2 = self;
  unint64_t v3 = (void *)sub_240AC9AF8();

  return v3;
}

- (void)featureStatusCellTappedAtIndexPath:(id)a3
{
  uint64_t v4 = sub_240BB2F80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240BB2F30();
  uint64_t v8 = self;
  sub_240ACA024();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)makeInternalSettingsControllerWithHealthStore:(id)a3
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for IRNInternalSettingsViewController()), sel_initWithHealthStore_, a3);

  return v3;
}

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  sub_240ACB4F0();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_240BB6DE0();
  unint64_t v13 = v12;
  sub_240BB5BF0();
  v14 = self;
  sub_240ACB9D8(v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  result = (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithUsingInsetStyling:(BOOL)a3
{
  result = (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Heart46AtrialFibrillationDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_240ACB6D0((uint64_t)self + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_consumedHealthExperienceStore, &qword_268C9F668, (unint64_t *)&qword_268CA06E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_providedHealthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_objectType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_displayType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_viewControllerFactory));
  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart46AtrialFibrillationDataTypeDetailViewController_pinnedContentManager);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end