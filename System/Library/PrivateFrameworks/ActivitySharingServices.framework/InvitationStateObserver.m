@interface InvitationStateObserver
- (BOOL)isReadyToProcessChanges;
- (_TtC23ActivitySharingServices23InvitationStateObserver)init;
- (void)cloudKitManager:(id)a3 didHandleServerPushWithCloudKitGroup:(id)a4;
- (void)cloudKitManager:(id)a3 didUpdateAccountStatus:(int64_t)a4;
- (void)friendListDidUpdate:(id)a3;
@end

@implementation InvitationStateObserver

- (_TtC23ActivitySharingServices23InvitationStateObserver)init
{
  result = (_TtC23ActivitySharingServices23InvitationStateObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices23InvitationStateObserver_accountService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices23InvitationStateObserver_appInstallationCoordinator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices23InvitationStateObserver_cloudKitCoordinator);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ActivitySharingServices23InvitationStateObserver_contactsManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices23InvitationStateObserver_friendListCoordinator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices23InvitationStateObserver_invitationListener);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC23ActivitySharingServices23InvitationStateObserver_relationshipFinalizationCoordinator);
  v3 = (char *)self + OBJC_IVAR____TtC23ActivitySharingServices23InvitationStateObserver_secureCloudCoalescer;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (BOOL)isReadyToProcessChanges
{
  return 1;
}

- (void)cloudKitManager:(id)a3 didUpdateAccountStatus:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_247598F34((uint64_t)&unk_26FBAA840, (uint64_t)&unk_26FBAA868, (uint64_t)&unk_269259850);
}

- (void)cloudKitManager:(id)a3 didHandleServerPushWithCloudKitGroup:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = qword_26B12F360;
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_2476B28F8();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B12F780);
  sub_247589ED8(0xD000000000000088, 0x80000002476B99B0, 0xD000000000000038, 0x80000002476B9A60);
  uint64_t v15 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v13;
  v16[5] = v12;
  id v17 = v12;
  v18 = v13;
  sub_247675354((uint64_t)v9, (uint64_t)&unk_269259830, (uint64_t)v16);

  swift_release();
}

- (void)friendListDidUpdate:(id)a3
{
  v3 = self;
  sub_247598F34((uint64_t)&unk_26FBAA7C8, (uint64_t)&unk_26FBAA7F0, (uint64_t)&unk_269259808);
}

@end