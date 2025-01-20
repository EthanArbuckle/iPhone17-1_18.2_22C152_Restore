@interface SecureCloudKitDelegate
- (_TtC23ActivitySharingServices22SecureCloudKitDelegate)init;
- (id)copySecureCloudChangeTokenCache;
- (id)sharedLegacyZoneIDsToSkip;
- (void)cloudKitManager:(ASCloudKitManager *)a3 fetchPrivateDatabaseChangesWithCache:(ASCloudKitServerChangeTokenCache *)a4 priority:(int64_t)a5 activity:(OS_xpc_object *)a6 group:(CKOperationGroup *)a7 fetchConfigurations:(NSDictionary *)a8 completion:(id)a9;
- (void)cloudKitManager:(ASCloudKitManager *)a3 fetchSharedDatabaseChangesWithCache:(ASCloudKitServerChangeTokenCache *)a4 priority:(int64_t)a5 activity:(OS_xpc_object *)a6 group:(CKOperationGroup *)a7 completion:(id)a8;
- (void)cloudKitManagerDidClearServerChangeToken:(id)a3;
- (void)persistCurrentSecureCloudChangeTokenCache;
- (void)updateSecureCloudChangeTokenCache:(id)a3;
@end

@implementation SecureCloudKitDelegate

- (_TtC23ActivitySharingServices22SecureCloudKitDelegate)init
{
  result = (_TtC23ActivitySharingServices22SecureCloudKitDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ActivitySharingServices22SecureCloudKitDelegate_contactsManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices22SecureCloudKitDelegate_secureCloudFetchService);
  v3 = (char *)self + OBJC_IVAR____TtC23ActivitySharingServices22SecureCloudKitDelegate_serverChangeTokenCacheStore;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)cloudKitManagerDidClearServerChangeToken:(id)a3
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC23ActivitySharingServices22SecureCloudKitDelegate_serverChangeTokenCacheStore), *(void *)&self->secureCloudFetchService[OBJC_IVAR____TtC23ActivitySharingServices22SecureCloudKitDelegate_serverChangeTokenCacheStore+ 8]);
  id v5 = a3;
  v6 = self;
  sub_247632794();
}

- (void)persistCurrentSecureCloudChangeTokenCache
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC23ActivitySharingServices22SecureCloudKitDelegate_serverChangeTokenCacheStore), *(void *)&self->secureCloudFetchService[OBJC_IVAR____TtC23ActivitySharingServices22SecureCloudKitDelegate_serverChangeTokenCacheStore+ 8]);
  v3 = self;
  sub_247632898();
}

- (void)updateSecureCloudChangeTokenCache:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2476AE1FC();
}

- (id)copySecureCloudChangeTokenCache
{
  v2 = self;
  v3 = sub_2476AE3A4();

  return v3;
}

- (id)sharedLegacyZoneIDsToSkip
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC23ActivitySharingServices22SecureCloudKitDelegate_contactsManager);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_contacts);
  if (v4)
  {
    id v5 = v4;
    sub_247589018(0, (unint64_t *)&qword_26B12F530);
    sub_2475994D8();
    uint64_t v6 = sub_2476B2C18();

    sub_2476ADBF8(v6);
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  sub_247589018(0, (unint64_t *)&qword_26B12E680);
  v7 = (void *)sub_2476B2B38();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)cloudKitManager:(ASCloudKitManager *)a3 fetchPrivateDatabaseChangesWithCache:(ASCloudKitServerChangeTokenCache *)a4 priority:(int64_t)a5 activity:(OS_xpc_object *)a6 group:(CKOperationGroup *)a7 fetchConfigurations:(NSDictionary *)a8 completion:(id)a9
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v16 - 8);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a9);
  v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = v19;
  v20[9] = self;
  uint64_t v21 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_26925BB90;
  v22[5] = v20;
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_26925BB98;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  swift_unknownObjectRetain();
  v26 = a7;
  v27 = a8;
  v28 = self;
  sub_2476AF394((uint64_t)v18, (uint64_t)&unk_26925BBA0, (uint64_t)v23);
  swift_release();
}

- (void)cloudKitManager:(ASCloudKitManager *)a3 fetchSharedDatabaseChangesWithCache:(ASCloudKitServerChangeTokenCache *)a4 priority:(int64_t)a5 activity:(OS_xpc_object *)a6 group:(CKOperationGroup *)a7 completion:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v19[7] = v18;
  v19[8] = self;
  uint64_t v20 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_26925BB40;
  v21[5] = v19;
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_269259B20;
  v22[5] = v21;
  v23 = a3;
  v24 = a4;
  swift_unknownObjectRetain();
  v25 = a7;
  v26 = self;
  sub_2476AF394((uint64_t)v17, (uint64_t)&unk_26925A870, (uint64_t)v22);
  swift_release();
}

@end