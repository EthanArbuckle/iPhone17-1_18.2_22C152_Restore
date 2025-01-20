@interface SecureCloudRelationshipDelegate
- (_TtC23ActivitySharingServices31SecureCloudRelationshipDelegate)init;
- (void)relationshipManager:(ASRelationshipManager *)a3 acceptedInviteForFriend:(NSUUID *)a4 completion:(id)a5;
- (void)relationshipManager:(ASRelationshipManager *)a3 relationshipBeganForFriend:(NSUUID *)a4 completion:(id)a5;
- (void)relationshipManager:(ASRelationshipManager *)a3 removeFriendWithUUID:(NSUUID *)a4 eventType:(unsigned __int16)a5 cloudKitGroup:(CKOperationGroup *)a6 completion:(id)a7;
- (void)relationshipManager:(ASRelationshipManager *)a3 updateActiveFriendWithUUID:(NSUUID *)a4 eventType:(unsigned __int16)a5 cloudKitGroup:(CKOperationGroup *)a6 completion:(id)a7;
@end

@implementation SecureCloudRelationshipDelegate

- (_TtC23ActivitySharingServices31SecureCloudRelationshipDelegate)init
{
  result = (_TtC23ActivitySharingServices31SecureCloudRelationshipDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC23ActivitySharingServices31SecureCloudRelationshipDelegate_relationshipFinalizationCoordinator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC23ActivitySharingServices31SecureCloudRelationshipDelegate_relationshipInviteAcceptService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices31SecureCloudRelationshipDelegate_relationshipUpdateService);
  v3 = (char *)self
     + OBJC_IVAR____TtC23ActivitySharingServices31SecureCloudRelationshipDelegate_relationshipRemovalService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)relationshipManager:(ASRelationshipManager *)a3 relationshipBeganForFriend:(NSUUID *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26925B138;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26925B140;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_2476AF394((uint64_t)v11, (uint64_t)&unk_26925B148, (uint64_t)v16);
  swift_release();
}

- (void)relationshipManager:(ASRelationshipManager *)a3 updateActiveFriendWithUUID:(NSUUID *)a4 eventType:(unsigned __int16)a5 cloudKitGroup:(CKOperationGroup *)a6 completion:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(_WORD *)(v17 + 32) = a5;
  *(void *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_26925B118;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_26925B120;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a6;
  v24 = self;
  sub_2476AF394((uint64_t)v15, (uint64_t)&unk_26925A8B0, (uint64_t)v20);
  swift_release();
}

- (void)relationshipManager:(ASRelationshipManager *)a3 removeFriendWithUUID:(NSUUID *)a4 eventType:(unsigned __int16)a5 cloudKitGroup:(CKOperationGroup *)a6 completion:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(_WORD *)(v17 + 32) = a5;
  *(void *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_26925B108;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_269259B50;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a6;
  v24 = self;
  sub_2476AF394((uint64_t)v15, (uint64_t)&unk_26925A890, (uint64_t)v20);
  swift_release();
}

- (void)relationshipManager:(ASRelationshipManager *)a3 acceptedInviteForFriend:(NSUUID *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B12F4D0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2476B2BE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26925B0F8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269259B20;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  sub_2476AF394((uint64_t)v11, (uint64_t)&unk_26925A870, (uint64_t)v16);
  swift_release();
}

@end