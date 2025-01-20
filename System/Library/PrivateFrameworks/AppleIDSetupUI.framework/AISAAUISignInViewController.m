@interface AISAAUISignInViewController
- (_TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController)initWithCoder:(id)a3;
- (_TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AISAAUISignInViewController

- (void)didMoveToParentViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AISAAUISignInViewController();
  id v4 = v9.receiver;
  id v5 = a3;
  [(AISAAUISignInViewController *)&v9 didMoveToParentViewController:v5];
  if (v5)
  {
    id v6 = objc_msgSend(v5, sel_navigationItem, v9.receiver, v9.super_class);
    id v7 = objc_msgSend(v4, sel_navigationItem);
    id v8 = objc_msgSend(v7, sel_rightBarButtonItems);

    objc_msgSend(v6, sel_setRightBarButtonItems_, v8);
    id v4 = v8;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_2482C8090(a3);
}

- (_TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_24835D418();
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController_triggerNextButtonTappedOnAppear) = 1;
    id v6 = a4;
    id v7 = (void *)sub_24835D3E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController_triggerNextButtonTappedOnAppear) = 1;
    id v8 = a4;
    id v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AISAAUISignInViewController();
  objc_super v9 = [(AAUISignInViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC14AppleIDSetupUIP33_E382F6B143EEB082937A88704104402727AISAAUISignInViewController_triggerNextButtonTappedOnAppear) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AISAAUISignInViewController();
  return [(AAUISignInViewController *)&v5 initWithCoder:a3];
}

@end