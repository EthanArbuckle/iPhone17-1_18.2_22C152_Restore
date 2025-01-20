@interface RootViewController
- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (RootViewController)initWithCoder:(id)a3;
- (RootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setPreview:(id)a3;
- (void)setVisibleInClientWindow:(id)a3;
- (void)setupWithClientBundleID:(id)a3 bagType:(int64_t)a4;
- (void)setupWithCustomNavigationItem:(id)a3 promptString:(id)a4 askToBuy:(BOOL)a5;
- (void)storeButtonPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RootViewController

- (RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10077BCB0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (RootViewController *)sub_100752E68(v5, v7, a4);
}

- (RootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100759B80();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  id v4 = v5.receiver;
  [(RootViewController *)&v5 viewWillAppear:v3];
  sub_100754CBC();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  id v4 = v5.receiver;
  [(RootViewController *)&v5 viewDidAppear:v3];
  v4[OBJC_IVAR___RootViewController_isViewAppeared] = 1;
  if (v4[OBJC_IVAR___RootViewController_isVisibleInClientWindow] == 1) {
    sub_100777840();
  }
  sub_100754CBC();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  id v4 = v5.receiver;
  [(RootViewController *)&v5 viewWillDisappear:v3];
  if (*(void *)&v4[OBJC_IVAR___RootViewController_adAttributionManager])
  {
    swift_retain();
    sub_100771BE0();
    swift_release();
  }
  v4[OBJC_IVAR___RootViewController_startedDisappearTransition] = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100754A10(a3);
}

- (void)setupWithClientBundleID:(id)a3 bagType:(int64_t)a4
{
  uint64_t v5 = sub_10077BCB0();
  uint64_t v7 = v6;
  id v8 = self;
  sub_10075A208(v5, v7);

  swift_bridgeObjectRelease();
}

- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4
{
  uint64_t v6 = sub_10077BB40();
  id v7 = a3;
  id v8 = self;
  id v9 = sub_100753B58(v7, v6);
  sub_1007599E0();
  v10 = *(void **)&v8->SKProductPageExtension_opaque[OBJC_IVAR___RootViewController_rootViewController];
  *(void *)&v8->SKProductPageExtension_opaque[OBJC_IVAR___RootViewController_rootViewController] = v9;
  id v11 = v9;

  sub_100754B08();
  if (qword_10094A020 != -1) {
    swift_once();
  }
  qword_10096ED90 = (uint64_t)&off_1008A8918;
  swift_unknownObjectWeakAssign();

  swift_bridgeObjectRelease();
  return 0;
}

- (void)setupWithCustomNavigationItem:(id)a3 promptString:(id)a4 askToBuy:(BOOL)a5
{
  if (a4)
  {
    uint64_t v8 = sub_10077BCB0();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = a3;
  v12 = self;
  sub_100756174(v11, v8, v10, a5);

  swift_bridgeObjectRelease();
}

- (void)storeButtonPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10075A42C();
}

- (void)setVisibleInClientWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RootViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(RootViewController *)&v6 setVisibleInClientWindow:v4];
  sub_100752CD0((char)objc_msgSend(v4, "BOOLValue", v6.receiver, v6.super_class));
}

- (void)setPreview:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10075636C(v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  swift_bridgeObjectRelease();
}

@end