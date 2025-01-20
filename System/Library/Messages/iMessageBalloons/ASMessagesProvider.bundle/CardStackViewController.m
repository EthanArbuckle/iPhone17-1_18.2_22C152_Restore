@interface CardStackViewController
- (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B423CardStackViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B423CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)popWithCard:(id)a3;
- (void)viewDidLoad;
@end

@implementation CardStackViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_5A5D84();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  unint64_t v3 = sub_5A6260();

  return v3;
}

- (void)popWithCard:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_5A634C(v4);
}

- (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B423CardStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_77D670();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B423CardStackViewController *)sub_5A73C4(v5, v7, a4);
}

- (_TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B423CardStackViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B423CardStackViewController_cardStackView) = 0;
  *(void *)&self->cardStackView[OBJC_IVAR____TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B423CardStackViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B423CardStackViewController_maximumNumberOfCards) = (Class)(&def_270DE0 + 3);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CardStackViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B423CardStackViewController_cardStackView));
  unint64_t v3 = (char *)self
     + OBJC_IVAR____TtC18ASMessagesProviderP33_B2CE61E316D584CC4A2ADF6070E311B423CardStackViewController_delegate;

  sub_174B8((uint64_t)v3);
}

@end