@interface FamilySyncEngine.SharingCoordinator
- (_TtCC19FamilyControlsAgent16FamilySyncEngine18SharingCoordinator)init;
- (void)manager:(id)a3 incomingInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4;
- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4;
@end

@implementation FamilySyncEngine.SharingCoordinator

- (_TtCC19FamilyControlsAgent16FamilySyncEngine18SharingCoordinator)init
{
  result = (_TtCC19FamilyControlsAgent16FamilySyncEngine18SharingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s19FamilyControlsAgent18AuthorizationStoreVwxx_0((uint64_t)self + OBJC_IVAR____TtCC19FamilyControlsAgent16FamilySyncEngine18SharingCoordinator_container);
  _s19FamilyControlsAgent18AuthorizationStoreVwxx_0((uint64_t)self + OBJC_IVAR____TtCC19FamilyControlsAgent16FamilySyncEngine18SharingCoordinator_database);
  _s19FamilyControlsAgent18AuthorizationStoreVwxx_0((uint64_t)self + OBJC_IVAR____TtCC19FamilyControlsAgent16FamilySyncEngine18SharingCoordinator_invitationManager);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC19FamilyControlsAgent16FamilySyncEngine18SharingCoordinator_invitationQueue);
}

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100028CAC(v7, (uint64_t)v8);
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