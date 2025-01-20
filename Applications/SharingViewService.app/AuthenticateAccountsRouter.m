@interface AuthenticateAccountsRouter
- (_TtC18SharingViewService26AuthenticateAccountsRouter)init;
@end

@implementation AuthenticateAccountsRouter

- (_TtC18SharingViewService26AuthenticateAccountsRouter)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18SharingViewService26AuthenticateAccountsRouter_dismissed) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18SharingViewService26AuthenticateAccountsRouter_remoteViewControllerProxy) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18SharingViewService26AuthenticateAccountsRouter_currentCardViewController) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18SharingViewService26AuthenticateAccountsRouter_navigationController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AuthenticateAccountsRouter();
  return [(AuthenticateAccountsRouter *)&v3 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18SharingViewService26AuthenticateAccountsRouter_currentCardViewController));
  objc_super v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18SharingViewService26AuthenticateAccountsRouter_navigationController);
}

@end