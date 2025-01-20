@interface FindMyLocateSession
+ (BOOL)hasCorrectPermissionsForLocationSharing;
- (_TtC10ContactsUI19FindMyLocateSession)init;
- (id)friendshipUpdateCallback;
- (int64_t)friendshipState:(id)a3;
- (void)getAllFriendIdsWithCompletion:(id)a3;
- (void)sendFriendshipOfferTo:(id)a3 end:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6;
- (void)setFriendshipUpdateCallback:(id)a3;
- (void)startUpdatingFriendsWithInitialUpdates:(BOOL)a3 completionHandler:(id)a4;
- (void)stopSharingLocationWith:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5;
- (void)stopUpdatingFriendsWithCompletionHandler:(id)a3;
@end

@implementation FindMyLocateSession

- (id)friendshipUpdateCallback
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI19FindMyLocateSession_friendshipUpdateCallback);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_18B67CB54;
    aBlock[3] = &block_descriptor_4;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setFriendshipUpdateCallback:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_18B686E1C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10ContactsUI19FindMyLocateSession_friendshipUpdateCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18B663E90(v7);
}

- (_TtC10ContactsUI19FindMyLocateSession)init
{
  return (_TtC10ContactsUI19FindMyLocateSession *)FindMyLocateSession.init()();
}

- (void)getAllFriendIdsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_18B67DCE8((uint64_t)sub_18B686E14, v5);
  swift_release();
}

- (int64_t)friendshipState:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_18B986258();

  swift_unknownObjectRelease();
  return v6;
}

- (void)stopSharingLocationWith:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913B5D0);
  MEMORY[0x1F4188790](v8 - 8, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = sub_18B985F88();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = sub_18B986078();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = 0;
  *(void *)(v16 + 24) = 0;
  *(void *)(v16 + 32) = v13;
  *(void *)(v16 + 40) = sub_18B687138;
  *(void *)(v16 + 48) = v14;
  *(void *)(v16 + 56) = self;
  *(unsigned char *)(v16 + 64) = a4;
  v17 = self;
  sub_18B984478();
  swift_retain();
  sub_18B67EAE8((uint64_t)v11, (uint64_t)&unk_1E913C768, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)sendFriendshipOfferTo:(id)a3 end:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913B5D0);
  MEMORY[0x1F4188790](v10 - 8, v11);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = sub_18B985F88();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = sub_18B986078();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 1, 1, v17);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = 0;
  *(void *)(v18 + 24) = 0;
  *(void *)(v18 + 32) = v15;
  *(void *)(v18 + 40) = sub_18B686D68;
  *(void *)(v18 + 48) = v16;
  *(void *)(v18 + 56) = self;
  *(void *)(v18 + 64) = a4;
  *(unsigned char *)(v18 + 72) = a5;
  v19 = self;
  sub_18B984478();
  swift_retain();
  sub_18B67EAE8((uint64_t)v13, (uint64_t)&unk_1E913C760, v18);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)startUpdatingFriendsWithInitialUpdates:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913B5D0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = v11;
  *(void *)(v12 + 32) = self;
  uint64_t v13 = sub_18B986078();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E913C748;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E913C750;
  v15[5] = v14;
  uint64_t v16 = self;
  sub_18B6868EC((uint64_t)v10, (uint64_t)&unk_1E913C758, (uint64_t)v15);
  swift_release();
}

- (void)stopUpdatingFriendsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913B5D0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_18B986078();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E913C708;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E913C718;
  v13[5] = v12;
  uint64_t v14 = self;
  sub_18B6868EC((uint64_t)v8, (uint64_t)&unk_1E913C728, (uint64_t)v13);
  swift_release();
}

+ (BOOL)hasCorrectPermissionsForLocationSharing
{
  return sub_18B983FE8() & 1;
}

- (void).cxx_destruct
{
  sub_18B663E90(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ContactsUI19FindMyLocateSession_friendshipUpdateCallback));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI19FindMyLocateSession_logger;
  uint64_t v4 = sub_18B984398();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end