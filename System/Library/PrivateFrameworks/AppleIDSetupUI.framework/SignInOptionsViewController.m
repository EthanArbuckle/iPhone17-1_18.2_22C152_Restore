@interface SignInOptionsViewController
- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:heightForRowAtIndexPath:;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)createAccountAction;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation SignInOptionsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2482F8850();
}

- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC14AppleIDSetupUI27SignInOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC14AppleIDSetupUI27SignInOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC14AppleIDSetupUI27SignInOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC14AppleIDSetupUI27SignInOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI27SignInOptionsViewController_appleIDLogoMicaView));
  sub_2482C3D88((uint64_t)self + OBJC_IVAR____TtC14AppleIDSetupUI27SignInOptionsViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)createAccountAction
{
  v2 = self;
  sub_2482F9030();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super._tab
                     + OBJC_IVAR____TtC14AppleIDSetupUI27SignInOptionsViewController_viewModel))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24835B818();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24835B7F8();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_2482F9220(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24835B818();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24835B7F8();
  id v10 = a3;
  v11 = self;
  sub_2482F94AC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:heightForRowAtIndexPath:
{
  uint64_t v0 = sub_24835B818();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24835B7F8();
  double v4 = *MEMORY[0x263F839B8];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

@end