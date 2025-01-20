@interface ObjCBootstrap
- (_TtC23FindMyLocateObjCWrapper13ObjCBootstrap)init;
- (id)cachedFriendsFollowingMyLocation;
- (id)cachedFriendsSharingLocationWithMe;
- (id)cachedFriendsWithPendingOffers;
- (id)cachedLocationFor:(id)a3 includeAddress:(BOOL)a4;
- (id)cachedOfferExpirationFor:(id)a3 groupId:(id)a4;
- (id)friendshipUpdateCallback;
- (id)locationUpdateCallback;
- (id)meDeviceUpdateCallback;
- (int64_t)cachedCanShareLocationWithHandle:(id)a3 isFromGroup:(BOOL)a4;
- (void)canShareLocationWithHandle:(FMLHandle *)a3 isFromGroup:(BOOL)a4 completionHandler:(id)a5;
- (void)friendshipStateWithHandle:(FMLHandle *)a3 isFromGroup:(BOOL)a4 completionHandler:(id)a5;
- (void)getActiveLocationSharingDeviceWithCompletionHandler:(id)a3;
- (void)getFriendsWith:(int64_t)a3 completionHandler:(id)a4;
- (void)getOfferExpirationForHandle:(FMLHandle *)a3 groupId:(NSString *)a4 completionHandler:(id)a5;
- (void)sendFriendshipInviteTo:(FMLHandle *)a3 from:(FMLHandle *)a4 isFromGroup:(BOOL)a5 completionHandler:(id)a6;
- (void)sendFriendshipOfferTo:(NSArray *)a3 from:(FMLHandle *)a4 end:(int64_t)a5 isFromGroup:(BOOL)a6 completionHandler:(id)a7;
- (void)setActiveLocationSharingDevice:(NSString *)a3 completionHandler:(id)a4;
- (void)setFriendshipUpdateCallback:(id)a3;
- (void)setLocationUpdateCallback:(id)a3;
- (void)setMeDeviceUpdateCallback:(id)a3;
- (void)startMonitoringActiveLocationSharingDeviceWithCompletionHandler:(id)a3;
- (void)startRefreshingLocationFor:(NSArray *)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 reverseGeocode:(BOOL)a6 completionHandler:(id)a7;
- (void)startUpdatingFriendsWithInitialUpdates:(BOOL)a3 completionHandler:(id)a4;
- (void)stopRefreshingLocationFor:(NSArray *)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 completionHandler:(id)a6;
- (void)stopRefreshingLocationWithCompletionHandler:(id)a3;
- (void)stopSharingLocationWith:(NSArray *)a3 from:(FMLHandle *)a4 isFromGroup:(BOOL)a5 completionHandler:(id)a6;
- (void)stopUpdatingFriendsWithCompletionHandler:(id)a3;
@end

@implementation ObjCBootstrap

- (id)locationUpdateCallback
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24E4ACE1C;
    aBlock[3] = &block_descriptor_53;
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

- (void)setLocationUpdateCallback:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_24E4B01E4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_24E4ACF64(v7);
}

- (id)friendshipUpdateCallback
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24E4AD238;
    aBlock[3] = &block_descriptor_47;
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
    v4 = sub_24E4B01E4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_24E4ACF64(v7);
}

- (id)meDeviceUpdateCallback
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24E4AD698;
    aBlock[3] = &block_descriptor_41;
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

- (void)setMeDeviceUpdateCallback:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_24E4B01D0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_24E4ACF64(v7);
}

- (_TtC23FindMyLocateObjCWrapper13ObjCBootstrap)init
{
  return (_TtC23FindMyLocateObjCWrapper13ObjCBootstrap *)ObjCBootstrap.init()();
}

- (void).cxx_destruct
{
  sub_24E4ACF64(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationUpdateCallback));
  sub_24E4ACF64(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendshipUpdateCallback));
  sub_24E4ACF64(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_meDeviceUpdateCallback));
  sub_24E4B09A4((uint64_t)self + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_locationRefreshTaskLock, &qword_2698EDAF0);
  sub_24E4B09A4((uint64_t)self + OBJC_IVAR____TtC23FindMyLocateObjCWrapper13ObjCBootstrap_friendsUpdateTaskLock, &qword_2698EDAF0);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)sendFriendshipOfferTo:(NSArray *)a3 from:(FMLHandle *)a4 end:(int64_t)a5 isFromGroup:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(void *)(v17 + 32) = a5;
  *(unsigned char *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_2698EDDC8;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_2698EDDD0;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = self;
  sub_24E4CA8F4((uint64_t)v15, (uint64_t)&unk_2698EDDD8, (uint64_t)v20);
  swift_release();
}

- (void)sendFriendshipInviteTo:(FMLHandle *)a3 from:(FMLHandle *)a4 isFromGroup:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(unsigned char *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2698EDDA8;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2698EDDB0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = self;
  sub_24E4CA8F4((uint64_t)v13, (uint64_t)&unk_2698EDDB8, (uint64_t)v18);
  swift_release();
}

- (void)stopSharingLocationWith:(NSArray *)a3 from:(FMLHandle *)a4 isFromGroup:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(unsigned char *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2698EDD88;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2698EDD90;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = self;
  sub_24E4CA8F4((uint64_t)v13, (uint64_t)&unk_2698EDD98, (uint64_t)v18);
  swift_release();
}

- (void)startRefreshingLocationFor:(NSArray *)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 reverseGeocode:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(unsigned char *)(v17 + 32) = a5;
  *(unsigned char *)(v17 + 33) = a6;
  *(void *)(v17 + 40) = v16;
  *(void *)(v17 + 48) = self;
  uint64_t v18 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_2698EDD68;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_2698EDD70;
  v20[5] = v19;
  v21 = a3;
  uint64_t v22 = self;
  sub_24E4CA8F4((uint64_t)v15, (uint64_t)&unk_2698EDD78, (uint64_t)v20);
  swift_release();
}

- (void)stopRefreshingLocationFor:(NSArray *)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(unsigned char *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2698EDD48;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2698EDD50;
  v18[5] = v17;
  v19 = a3;
  v20 = self;
  sub_24E4CA8F4((uint64_t)v13, (uint64_t)&unk_2698EDD58, (uint64_t)v18);
  swift_release();
}

- (void)stopRefreshingLocationWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2698EDD28;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2698EDD30;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24E4CA8F4((uint64_t)v7, (uint64_t)&unk_2698EDD38, (uint64_t)v12);
  swift_release();
}

- (void)startUpdatingFriendsWithInitialUpdates:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2698EDD08;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2698EDD10;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_24E4CA8F4((uint64_t)v9, (uint64_t)&unk_2698EDD18, (uint64_t)v14);
  swift_release();
}

- (void)stopUpdatingFriendsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2698EDCE8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2698EDCF0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24E4CA8F4((uint64_t)v7, (uint64_t)&unk_2698EDCF8, (uint64_t)v12);
  swift_release();
}

- (void)startMonitoringActiveLocationSharingDeviceWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2698EDCC8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2698EDCD0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24E4CA8F4((uint64_t)v7, (uint64_t)&unk_2698EDCD8, (uint64_t)v12);
  swift_release();
}

- (void)setActiveLocationSharingDevice:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2698EDCA8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2698EDCB0;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_24E4CA8F4((uint64_t)v9, (uint64_t)&unk_2698EDCB8, (uint64_t)v14);
  swift_release();
}

- (void)getActiveLocationSharingDeviceWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2698EDC88;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2698EDC90;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24E4CA8F4((uint64_t)v7, (uint64_t)&unk_2698EDC98, (uint64_t)v12);
  swift_release();
}

- (void)getFriendsWith:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2698EDC68;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2698EDC70;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_24E4CA8F4((uint64_t)v9, (uint64_t)&unk_2698EDC78, (uint64_t)v14);
  swift_release();
}

- (void)canShareLocationWithHandle:(FMLHandle *)a3 isFromGroup:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2698EDC48;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2698EDC50;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = self;
  sub_24E4CA8F4((uint64_t)v11, (uint64_t)&unk_2698EDC58, (uint64_t)v16);
  swift_release();
}

- (void)friendshipStateWithHandle:(FMLHandle *)a3 isFromGroup:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2698EDC28;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2698EDC30;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = self;
  sub_24E4CA8F4((uint64_t)v11, (uint64_t)&unk_2698EDC38, (uint64_t)v16);
  swift_release();
}

- (void)getOfferExpirationForHandle:(FMLHandle *)a3 groupId:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1360);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24E4D1DB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2698EDBE8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2698EDBF8;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = self;
  sub_24E4CA8F4((uint64_t)v11, (uint64_t)&unk_2698EDC08, (uint64_t)v16);
  swift_release();
}

- (id)cachedLocationFor:(id)a3 includeAddress:(BOOL)a4
{
  swift_getObjectType();
  id v4 = a3;
  uint64_t v5 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C12F8);
  sub_24E4D1E50();

  return v9;
}

- (id)cachedFriendsSharingLocationWithMe
{
  return sub_24E4C660C(self);
}

- (id)cachedFriendsFollowingMyLocation
{
  return sub_24E4C660C(self);
}

- (id)cachedFriendsWithPendingOffers
{
  return sub_24E4C660C(self);
}

- (id)cachedOfferExpirationFor:(id)a3 groupId:(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698ED9C8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a4)
  {
    uint64_t v11 = sub_24E4D1CC0();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  *(void *)&v19[-48] = MEMORY[0x270FA5388](v11);
  *(void *)&v19[-40] = a4;
  *(void *)&v19[-32] = self;
  *(void *)&v19[-24] = a3;
  *(void *)&v19[-16] = ObjectType;
  id v13 = a3;
  uint64_t v14 = self;
  sub_24E4D1E50();

  swift_bridgeObjectRelease();
  uint64_t v15 = sub_24E4D16F0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = 0;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v16 + 48))(v10, 1, v15) != 1)
  {
    uint64_t v17 = (void *)sub_24E4D16C0();
    (*(void (**)(unsigned char *, uint64_t))(v16 + 8))(v10, v15);
  }

  return v17;
}

- (int64_t)cachedCanShareLocationWithHandle:(id)a3 isFromGroup:(BOOL)a4
{
  swift_getObjectType();
  type metadata accessor for FMLLocationShareState(0);
  id v4 = a3;
  uint64_t v5 = self;
  sub_24E4D1E50();

  return v9;
}

@end