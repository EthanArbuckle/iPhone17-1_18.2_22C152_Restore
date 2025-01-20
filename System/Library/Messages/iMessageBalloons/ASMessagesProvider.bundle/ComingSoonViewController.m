@interface ComingSoonViewController
- (_TtC18ASMessagesProvider24ComingSoonViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider24ComingSoonViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
@end

@implementation ComingSoonViewController

- (void)loadView
{
  v2 = self;
  sub_6FEA40();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(ComingSoonViewController *)v2 traitCollection];
  v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&def_270DE0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (_TtC18ASMessagesProvider24ComingSoonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_77D670();
    id v6 = a4;
    NSString v7 = sub_77D640();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ComingSoonViewController();
  v9 = [(ComingSoonViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18ASMessagesProvider24ComingSoonViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ComingSoonViewController();
  return [(ComingSoonViewController *)&v5 initWithCoder:a3];
}

@end