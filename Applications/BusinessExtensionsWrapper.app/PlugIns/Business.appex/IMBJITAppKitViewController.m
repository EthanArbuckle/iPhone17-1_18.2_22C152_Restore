@interface IMBJITAppKitViewController
- (_TtC8Business26IMBJITAppKitViewController)initWithCoder:(id)a3;
- (id)newErrorViewController:(id)a3;
- (void)applicationControllerError:(id)a3;
- (void)composeResponseWithNotification:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation IMBJITAppKitViewController

- (_TtC8Business26IMBJITAppKitViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000756B8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IMBJITAppKitViewController();
  v4 = v5.receiver;
  [(IMBJITAppKitViewController *)&v5 viewDidAppear:v3];
  v4[OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_viewDidAppearFired] = 1;
  sub_1000729FC();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000728D4(a3);
}

- (void)composeResponseWithNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1000740A4(v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_loadingIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_jitAppViewController));

  swift_bridgeObjectRelease();
}

- (id)newErrorViewController:(id)a3
{
  type metadata accessor for IMBJITAppKitErrorViewController();
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_super v5 = self;
  v6 = (char *)[v4 init];
  *(void *)&v6[OBJC_IVAR____TtC8Business31IMBJITAppKitErrorViewController_delegate + 8] = &off_1000E9410;
  swift_unknownObjectWeakAssign();

  return v6;
}

- (void)applicationControllerError:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100074D28();
}

@end