@interface IMBAuthenticationViewController
- (BOOL)shouldHandleRedirectURI:(id)a3;
- (_TtC8Business31IMBAuthenticationViewController)initWithCoder:(id)a3;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (void)didChangeNavigationURL:(id)a3;
- (void)didChangeSecureStatus:(BOOL)a3;
- (void)didReceiveCallbackRequest:(id)a3;
- (void)dismiss;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation IMBAuthenticationViewController

- (_TtC8Business31IMBAuthenticationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000518E8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10004E964();
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id result = *(Class *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_aswasWindow);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IMBAuthenticationViewController();
  v4 = v5.receiver;
  [(IMBAuthenticationViewController *)&v5 viewDidAppear:v3];
  if ((v4[OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_didShowAuth] & 1) == 0)
  {
    v4[OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_didShowAuth] = 1;
    sub_10004EAC8();
  }
}

- (BOOL)shouldHandleRedirectURI:(id)a3
{
  uint64_t v4 = sub_1000BB138();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB0F8();
  v9 = self;
  unsigned __int8 v10 = sub_100050374();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v10 & 1;
}

- (void)didReceiveCallbackRequest:(id)a3
{
  uint64_t v4 = sub_1000BAFC8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BAF98();
  v9 = self;
  sub_100050510();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)didChangeSecureStatus:(BOOL)a3
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_webViewController);
  uint64_t v4 = self;
  id v5 = v3;
  sub_10007DE90();
}

- (void)didChangeNavigationURL:(id)a3
{
  uint64_t v4 = sub_1000BB138();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB0F8();
  v9 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_webViewController);
  uint64_t v10 = self;
  id v11 = v9;
  sub_10007DE90();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)dismiss
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v9 = self;
  swift_unknownObjectRelease();
  if (Strong)
  {
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v5 = *((void *)v3 + 1);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v7 = *(void (**)(_TtC8Business31IMBAuthenticationViewController *, uint64_t, uint64_t, uint64_t))(v5 + 16);
      uint64_t v8 = type metadata accessor for IMBAuthenticationViewController();
      v7(v9, v8, ObjectType, v5);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_authenticationManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_webViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_session));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business31IMBAuthenticationViewController_aswasWindow);
}

@end