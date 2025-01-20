@interface CardStackViewController
- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)popWithCard:(id)a3;
- (void)viewDidLoad;
@end

@implementation CardStackViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100708554();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  unint64_t v3 = sub_100708A30();

  return v3;
}

- (void)popWithCard:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100708B30(v4);
}

- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1007675F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController *)sub_100709BA8(v5, v7, a4);
}

- (_TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController_cardStackView) = 0;
  *(void *)&self->cardStackView[OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController_maximumNumberOfCards) = (Class)3;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CardStackViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController_cardStackView));
  unint64_t v3 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtensionP33_E5954FF992A6C09524C80223408D110623CardStackViewController_delegate;

  sub_10000FB1C((uint64_t)v3);
}

@end