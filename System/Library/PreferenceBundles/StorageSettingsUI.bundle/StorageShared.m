@interface StorageShared
- (_TtC17StorageSettingsUI13StorageShared)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
- (void)searchDidClose;
- (void)searchDidOpen;
- (void)searchDidUpdate:(id)a3;
- (void)startHandlers;
- (void)startMonitoring;
- (void)stopHandlers;
- (void)stopMonitoring;
@end

@implementation StorageShared

- (_TtC17StorageSettingsUI13StorageShared)init
{
  return (_TtC17StorageSettingsUI13StorageShared *)sub_2A870();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared_appProtectionSubscription);
  v5 = self;
  if (v4) {
    [v4 invalidate];
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(StorageShared *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared__volume;
  uint64_t v4 = sub_14F50(&qword_A36F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared__categories;
  uint64_t v6 = sub_14F50(&qword_A36A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared__recommendations;
  uint64_t v8 = sub_14F50(&qword_A3698);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared__followups;
  uint64_t v10 = sub_14F50(&qword_A3690);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared__visibleItems;
  uint64_t v12 = sub_14F50(&qword_A3688);
  v13 = *(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8);
  v13(v11, v12);
  v13((char *)self + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared__hiddenItems, v12);
  v13((char *)self + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared__systemItems, v12);
  v14 = (char *)self + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared__currentSearch;
  uint64_t v15 = sub_14F50(&qword_A3680);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared__gatheringFailed;
  uint64_t v17 = sub_14F50(&qword_A3678);
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_3A0D8((uint64_t)self + OBJC_IVAR____TtC17StorageSettingsUI13StorageShared_timeStats, (uint64_t (*)(void))&type metadata accessor for TimeStats);
}

- (void)startMonitoring
{
  v2 = self;
  sub_2C18C();
}

- (void)stopMonitoring
{
}

- (void)startHandlers
{
}

- (void)stopHandlers
{
}

- (void)searchDidOpen
{
}

- (void)searchDidClose
{
}

- (void)searchDidUpdate:(id)a3
{
  uint64_t v4 = sub_14F50(&qword_A3500);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_76C10();
  uint64_t v9 = v8;
  uint64_t v10 = sub_76D70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  sub_76D40();
  v11 = self;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_76D30();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  v13[5] = v7;
  v13[6] = v9;
  sub_52508((uint64_t)v6, (uint64_t)&unk_A35F0, (uint64_t)v13);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  uint64_t v5 = sub_14F50(&qword_A3500);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_76D70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_76D40();
  uint64_t v9 = self;
  swift_unknownObjectRetain();
  uint64_t v10 = sub_76D30();
  v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = &protocol witness table for MainActor;
  v11[4] = v9;
  sub_52508((uint64_t)v7, (uint64_t)&unk_A3510, (uint64_t)v11);
  swift_unknownObjectRelease();

  swift_release();
}

@end