@interface RecommendationsViewController
- (_TtC21CloudRecommendationUI29RecommendationsViewController)initWithCoder:(id)a3;
- (_TtC21CloudRecommendationUI29RecommendationsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RecommendationsViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RecommendationsViewController();
  id v4 = v7.receiver;
  [(RecommendationsViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 1, 0);

    id v4 = v6;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RecommendationsViewController();
  id v4 = v7.receiver;
  [(RecommendationsViewController *)&v7 viewWillDisappear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 0, v3);

    id v4 = v6;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_24A343BFC();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RecommendationsViewController();
  id v4 = (char *)v5.receiver;
  [(RecommendationsViewController *)&v5 viewDidAppear:v3];
  if (*(void *)&v4[OBJC_IVAR____TtC21CloudRecommendationUI29RecommendationsViewController_recommendationsController])
  {
    swift_retain();
    sub_24A321334();

    swift_release();
  }
  else
  {
  }
}

- (_TtC21CloudRecommendationUI29RecommendationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_24A3983F8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC21CloudRecommendationUI29RecommendationsViewController *)sub_24A34499C(v5, v7, a4);
}

- (_TtC21CloudRecommendationUI29RecommendationsViewController)initWithCoder:(id)a3
{
  return (_TtC21CloudRecommendationUI29RecommendationsViewController *)sub_24A344AC4(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI29RecommendationsViewController_mailAccountProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI29RecommendationsViewController_accountManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI29RecommendationsViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI29RecommendationsViewController_activeRecommendation));
  swift_release();
}

@end