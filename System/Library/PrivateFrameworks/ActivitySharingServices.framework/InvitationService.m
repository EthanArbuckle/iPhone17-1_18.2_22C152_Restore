@interface InvitationService
- (_TtC23ActivitySharingServices17InvitationService)init;
- (void)manager:(id)a3 incomingInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4;
- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4;
@end

@implementation InvitationService

- (_TtC23ActivitySharingServices17InvitationService)init
{
  result = (_TtC23ActivitySharingServices17InvitationService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices17InvitationService_invitationListener);

  swift_release();
}

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
}

- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4
{
}

- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4
{
}

- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4
{
}

@end