@interface SecureCloudPeriodicUpdaterDelegate
- (_TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate)init;
- (void)periodicUpdateManager:(ASPeriodicUpdateManager *)a3 fetchDidFailWithError:(NSError *)a4 activity:(OS_xpc_object *)a5 completion:(id)a6;
- (void)periodicUpdateManager:(ASPeriodicUpdateManager *)a3 requestChangedRecordsPushWithGroup:(CKOperationGroup *)a4 activity:(OS_xpc_object *)a5 completion:(id)a6;
- (void)periodicUpdateManager:(ASPeriodicUpdateManager *)a3 runSecureCloudTasksWithGroup:(CKOperationGroup *)a4 activity:(OS_xpc_object *)a5 completion:(id)a6;
@end

@implementation SecureCloudPeriodicUpdaterDelegate

- (_TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate)init
{
  result = (_TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate_analyticsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate_invitationListener);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate_secureCloudErrorDispatcher);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate_relationshipDowngradeService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate_relationshipMigrationService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate_relationshipRepairService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate_relationshipUpdateService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate_relationshipUpgradeService);
  v3 = (char *)self
     + OBJC_IVAR____TtC23ActivitySharingServices34SecureCloudPeriodicUpdaterDelegate_secureCloudUpdateCoalescer;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)periodicUpdateManager:(ASPeriodicUpdateManager *)a3 runSecureCloudTasksWithGroup:(CKOperationGroup *)a4 activity:(OS_xpc_object *)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26925A8A0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_26925B120;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  swift_unknownObjectRetain();
  v21 = self;
  sub_2476AF394((uint64_t)v13, (uint64_t)&unk_26925A8B0, (uint64_t)v18);
  swift_release();
}

- (void)periodicUpdateManager:(ASPeriodicUpdateManager *)a3 requestChangedRecordsPushWithGroup:(CKOperationGroup *)a4 activity:(OS_xpc_object *)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26925A880;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269259B50;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  swift_unknownObjectRetain();
  v21 = self;
  sub_2476AF394((uint64_t)v13, (uint64_t)&unk_26925A890, (uint64_t)v18);
  swift_release();
}

- (void)periodicUpdateManager:(ASPeriodicUpdateManager *)a3 fetchDidFailWithError:(NSError *)a4 activity:(OS_xpc_object *)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_26925A860;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269259B20;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  swift_unknownObjectRetain();
  v21 = self;
  sub_2476AF394((uint64_t)v13, (uint64_t)&unk_26925A870, (uint64_t)v18);
  swift_release();
}

@end