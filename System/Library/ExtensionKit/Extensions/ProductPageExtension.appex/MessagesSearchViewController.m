@interface MessagesSearchViewController
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation MessagesSearchViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MessagesSearchViewController();
  v2 = (char *)v5.receiver;
  [(SearchViewController *)&v5 viewDidLoad];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension20SearchViewController_searchController], "setObscuresBackgroundDuringPresentation:", 0, v5.receiver, v5.super_class);
  id v3 = [v2 navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  id v4 = [v2 navigationItem];
  [v4 setHidesBackButton:1];
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1005E0AB0();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MessagesSearchViewController();
  id v4 = v5.receiver;
  [(SearchViewController *)&v5 viewDidAppear:v3];
  sub_10076E830();
  sub_10076E810();
  sub_10076E780();

  swift_release();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MessagesSearchViewController();
  id v4 = v5.receiver;
  [(MessagesSearchViewController *)&v5 viewDidDisappear:v3];
  sub_10076E830();
  sub_10076E810();
  sub_10076E780();

  swift_release();
}

@end