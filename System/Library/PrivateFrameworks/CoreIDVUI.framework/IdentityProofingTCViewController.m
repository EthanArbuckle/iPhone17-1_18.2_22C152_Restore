@interface IdentityProofingTCViewController
- (_TtC9CoreIDVUI32IdentityProofingTCViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI32IdentityProofingTCViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation IdentityProofingTCViewController

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IdentityProofingTCViewController();
  [(IdentityProofingTCViewController *)&v4 viewDidAppear:v3];
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_21F4F1AF4(a4);
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v8 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_onAppearance);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  if (v8)
  {
    uint64_t v12 = sub_21F47F790((uint64_t)v8);
    v8(v12);
    sub_21F47D8F8((uint64_t)v8);
  }
  sub_21F5502A0();
  sub_21F4EF900();

  swift_bridgeObjectRelease();
}

- (_TtC9CoreIDVUI32IdentityProofingTCViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC9CoreIDVUI32IdentityProofingTCViewController *)sub_21F4F158C(v5, v7, a4);
}

- (_TtC9CoreIDVUI32IdentityProofingTCViewController)initWithCoder:(id)a3
{
  return (_TtC9CoreIDVUI32IdentityProofingTCViewController *)sub_21F4F1750(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_activityIndicator));
  swift_weakDestroy();
  sub_21F47D8F8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_agreeClicked));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_config));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_onAppearance);

  sub_21F47D8F8(v3);
}

@end