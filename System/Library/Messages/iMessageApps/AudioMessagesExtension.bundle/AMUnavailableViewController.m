@interface AMUnavailableViewController
- (UILabel)label;
- (_TtC22AudioMessagesExtension27AMUnavailableViewController)initWithCoder:(id)a3;
- (_TtC22AudioMessagesExtension27AMUnavailableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setLabel:(id)a3;
- (void)viewDidLoad;
@end

@implementation AMUnavailableViewController

- (UILabel)label
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setLabel:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_3DEB4();
}

- (_TtC22AudioMessagesExtension27AMUnavailableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_467B0();
    swift_unknownObjectWeakInit();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC22AudioMessagesExtension27AMUnavailableViewController_conversation) = 0;
    id v6 = a4;
    NSString v7 = sub_467A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectWeakInit();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC22AudioMessagesExtension27AMUnavailableViewController_conversation) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AMUnavailableViewController();
  v9 = [(AMUnavailableViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC22AudioMessagesExtension27AMUnavailableViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22AudioMessagesExtension27AMUnavailableViewController_conversation) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AMUnavailableViewController();
  return [(AMUnavailableViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22AudioMessagesExtension27AMUnavailableViewController_conversation);
}

@end