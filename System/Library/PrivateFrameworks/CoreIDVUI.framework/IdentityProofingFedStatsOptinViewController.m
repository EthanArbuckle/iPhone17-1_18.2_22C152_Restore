@interface IdentityProofingFedStatsOptinViewController
- (_TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureFonts;
- (void)confirmButtonClicked;
- (void)learnMoreButtonClicked;
- (void)scrollViewDidScroll:(id)a3;
- (void)sizeHeaderToFit;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation IdentityProofingFedStatsOptinViewController

- (_TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F4AC600();
}

- (void)learnMoreButtonClicked
{
  v2 = self;
  sub_21F4A9088();
}

- (void)sizeHeaderToFit
{
  v2 = self;
  sub_21F4A941C();
}

- (void)configureFonts
{
  v2 = self;
  sub_21F4A9644();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IdentityProofingFedStatsOptinViewController();
  id v2 = v3.receiver;
  [(IdentityProofingFedStatsOptinViewController *)&v3 viewDidLayoutSubviews];
  sub_21F4A941C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_21F4A99BC(a3, (SEL *)&selRef_viewDidAppear_, MEMORY[0x263F36270]);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_21F4A99BC(a3, (SEL *)&selRef_viewDidDisappear_, MEMORY[0x263F36278]);
}

- (void)confirmButtonClicked
{
  id v2 = self;
  sub_21F4AAF58();
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_21F4AB1FC();
}

- (_TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_uiConfig));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_primaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_confirmButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_tableView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_learnMoreButton);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v7 = (char *)self + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_viewModels;
  swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(*(void *)v7 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  unint64_t v8 = *(void *)(*(void *)v7 + 8 * a4 + 32);
  if (v8 >> 62)
  {
LABEL_8:
    id v11 = a3;
    v12 = self;
    swift_bridgeObjectRetain();
    int64_t v9 = sub_21F551B50();

    swift_bridgeObjectRelease();
    return v9;
  }
  return *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingFedStatsOptinViewController_viewModels;
  swift_beginAccess();
  return *(void *)(*(void *)v3 + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_21F54EC80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EC50();
  id v10 = a3;
  id v11 = self;
  id v12 = sub_21F4AB960(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_21F54EC80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EC50();
  id v10 = a3;
  id v11 = self;
  sub_21F4ABC24(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_21F54EC80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EC50();
  id v10 = a3;
  id v11 = self;
  sub_21F4AC9B0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21F4A941C();
}

@end