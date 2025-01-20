@interface IdentityProofingWatchPendingStateBaseViewController
- (_TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)updateUI:(id)a3 previousTraitCollection:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation IdentityProofingWatchPendingStateBaseViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingStateBaseViewController();
  id v2 = v6.receiver;
  [(IdentityProofingWatchPendingStateBaseViewController *)&v6 viewDidLoad];
  objc_msgSend(v2, sel_setOverrideUserInterfaceStyle_, 2, v6.receiver, v6.super_class);
  id v3 = objc_msgSend(v2, sel_view);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(self, sel_blackColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IdentityProofingWatchPendingStateBaseViewController();
  id v2 = v3.receiver;
  [(IdentityProofingWatchPendingStateBaseViewController *)&v3 viewDidLayoutSubviews];
  sub_21F51C5C4();
}

- (void)updateUI:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_21F51E0EC(a4);
}

- (_TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_21F5515A0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController *)sub_21F51D1EC(v5, v7, a4);
}

- (_TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController *)sub_21F51D4D8(a3);
}

- (void).cxx_destruct
{
  sub_21F476EE4((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_config);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_primaryStackView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI51IdentityProofingWatchPendingStateBaseViewController_tableView);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  int64_t v6 = sub_21F51E298();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_21F51E414(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_21F54EC80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F54EC50();
  id v10 = a3;
  v11 = self;
  id v12 = sub_21F51D8DC(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

@end