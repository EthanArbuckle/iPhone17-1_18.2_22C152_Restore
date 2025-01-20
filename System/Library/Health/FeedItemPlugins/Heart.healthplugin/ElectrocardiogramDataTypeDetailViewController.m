@interface ElectrocardiogramDataTypeDetailViewController
- (BOOL)isPinned;
- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithCoder:(id)a3;
- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5;
- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithStyle:(int64_t)a3;
- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithUsingInsetStyling:(BOOL)a3;
- (id)createDataProviderWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5;
- (void)didSelectRegulatoryRow;
- (void)setPinned:(BOOL)a3;
- (void)showAddDataVC;
- (void)viewDidLoad;
@end

@implementation ElectrocardiogramDataTypeDetailViewController

- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithCoder:(id)a3
{
  v5 = (char *)self
     + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_consumedHealthExperienceStore;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  uint64_t v6 = OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_objectType;
  v7 = self;
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_electrocardiogramType);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_cancellables) = (Class)MEMORY[0x263F8EE88];

  result = (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (id)createDataProviderWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = sub_240A8114C(v8, (uint64_t)v9, a5);

  return v11;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_240A8133C();
}

- (BOOL)isPinned
{
  v2 = self;
  char v3 = sub_240A81520();

  return v3 & 1;
}

- (void)setPinned:(BOOL)a3
{
  v4 = self;
  sub_240A81788(a3);
}

- (void)showAddDataVC
{
  v2 = self;
  sub_240A81980();
}

- (void)didSelectRegulatoryRow
{
  v2 = self;
  sub_240A81F04();
}

- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  result = (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithUsingInsetStyling:(BOOL)a3
{
  result = (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Heart45ElectrocardiogramDataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_240A831A0((uint64_t)self + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_consumedHealthExperienceStore, &qword_268C9F668, (void (*)(uint64_t))sub_240A83088);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_objectType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_displayType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_viewControllerFactory));
  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart45ElectrocardiogramDataTypeDetailViewController_pinnedContentManager);

  swift_bridgeObjectRelease();
}

@end