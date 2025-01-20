@interface DiscoveryArticleViewController
- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithArticleLayout:(id)a3 referrerIdentifier:(id)a4 cardTemplateInformation:(id)a5;
- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithCoder:(id)a3;
- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithItemIdentifier:(id)a3 referrerIdentifier:(id)a4;
- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)setArticleLayout:(id)a3 animated:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DiscoveryArticleViewController

- (void)dealloc
{
  v2 = self;
  sub_22884F5FC();
}

- (void).cxx_destruct
{
  sub_2288110C0((uint64_t)self + OBJC_IVAR____TtC15ProximityReader30DiscoveryArticleViewController_isDismissed, &qword_268269098);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC15ProximityReader30DiscoveryArticleViewController_disappearHandler);

  sub_22883A0F4(v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_22884FA08(v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_22884FDB4((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (void)setArticleLayout:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_22884BC8C((uint64_t)v6, a4);
}

- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithItemIdentifier:(id)a3 referrerIdentifier:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    return (_TtC15ProximityReader30DiscoveryArticleViewController *)sub_22885112C(v5, v7, v8, v10);
  }
  uint64_t v5 = sub_228915C70();
  uint64_t v7 = v6;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = sub_228915C70();
  uint64_t v10 = v9;
  return (_TtC15ProximityReader30DiscoveryArticleViewController *)sub_22885112C(v5, v7, v8, v10);
}

- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithArticleLayout:(id)a3 referrerIdentifier:(id)a4 cardTemplateInformation:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_228915C70();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = a5;
  return (_TtC15ProximityReader30DiscoveryArticleViewController *)sub_22885130C(a3, v7, v9, a5);
}

- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_228915C70();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC15ProximityReader30DiscoveryArticleViewController *)sub_2288514D0(v5, v7, a4);
}

- (_TtC15ProximityReader30DiscoveryArticleViewController)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader30DiscoveryArticleViewController *)sub_228851658(a3);
}

@end