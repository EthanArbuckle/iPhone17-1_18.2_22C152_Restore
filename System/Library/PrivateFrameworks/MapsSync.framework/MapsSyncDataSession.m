@interface MapsSyncDataSession
+ (BOOL)isInMemoryOnly;
+ (BOOL)shouldMoveStoreAsideWithError:(id)a3;
+ (BOOL)shouldRetryStoreLoadAfterErrorWithError:(id)a3;
+ (BOOL)useInMemoryOnly;
+ (_TtC8MapsSync19MapsSyncDataSession)defaultLocalOnlySession;
+ (_TtC8MapsSync19MapsSyncDataSession)defaultSession;
+ (void)disableNotifications;
+ (void)enableNotifications;
+ (void)reset;
+ (void)resetWithCompletion:(id)a3;
+ (void)resumeNotifications;
+ (void)setUseInMemoryOnly:(BOOL)a3;
+ (void)suppressNotifications;
+ (void)whenReadyWithCompletion:(id)a3;
- (BOOL)hasLoadedStore;
- (NSPersistentContainer)persistentContainer;
- (NSString)typeString;
- (_TtC8MapsSync19MapsSyncDataSession)init;
- (_TtC8MapsSync19MapsSyncDataSession)initWithPersisted:(BOOL)a3 deviceLocal:(BOOL)a4;
- (id)unsafeGetBackgroundReadContextAndReturnError:(id *)a3;
- (id)unsafeGetReadContextAndReturnError:(id *)a3;
- (id)unsafeGetWriteContextAndReturnError:(id *)a3;
- (uint64_t)resetInMemoryStore;
- (void)checkStoreLoadedWithCompletion:(void *)aBlock;
- (void)contextDidSaveWithNotification:(id)a3;
- (void)deleteAll;
- (void)getBackgroundReadContextWithCompletion:(id)a3;
- (void)getReadContextWithCompletion:(id)a3;
- (void)getWriteContextWithCompletion:(id)a3;
- (void)loadCoreDataStoresFor:(id)a3 completion:(id)a4;
- (void)loadStoresWithCompletion:(id)a3;
- (void)remoteChangeWithNotification:(id)a3;
- (void)resetInMemoryStoreWithCompletion:(id)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation MapsSyncDataSession

- (NSPersistentContainer)persistentContainer
{
  uint64_t v3 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__lock;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__lock);
  v5 = self;
  objc_msgSend(v4, sel_lock);
  v6 = *(Class *)((char *)&self->super.isa + v3);
  id v7 = *(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__persistentContainer);
  objc_msgSend(v6, sel_unlock);

  return (NSPersistentContainer *)v7;
}

- (void)setPersistentContainer:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__lock;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__lock);
  id v7 = a3;
  v8 = self;
  objc_msgSend(v6, sel_lock);
  v9 = *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__persistentContainer);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__persistentContainer) = (Class)a3;
  id v10 = v7;

  objc_msgSend(*(id *)((char *)&self->super.isa + v5), sel_unlock);
}

+ (void)suppressNotifications
{
  qword_1EB66F540 = 0x4008000000000000;
}

+ (void)resumeNotifications
{
  qword_1EB66F540 = 0;
}

+ (BOOL)useInMemoryOnly
{
  return byte_1E96E7990;
}

+ (void)setUseInMemoryOnly:(BOOL)a3
{
}

+ (void)disableNotifications
{
  byte_1E96E8818 = 1;
}

+ (void)enableNotifications
{
  byte_1E96E8818 = 0;
}

+ (_TtC8MapsSync19MapsSyncDataSession)defaultSession
{
  if (byte_1E96E7990 == 1)
  {
    if (qword_1E96E6F18 != -1) {
      swift_once();
    }
    v2 = &qword_1E96E7980;
  }
  else
  {
    if (qword_1EB671678 != -1) {
      swift_once();
    }
    v2 = qword_1EB670ED8;
  }
  uint64_t v3 = (void *)*v2;
  return (_TtC8MapsSync19MapsSyncDataSession *)v3;
}

+ (_TtC8MapsSync19MapsSyncDataSession)defaultLocalOnlySession
{
  if (byte_1E96E7990 == 1)
  {
    if (qword_1E96E6F20 != -1) {
      swift_once();
    }
    v2 = &qword_1E96E7988;
  }
  else
  {
    if (qword_1EB670280 != -1) {
      swift_once();
    }
    v2 = &qword_1EB670248;
  }
  uint64_t v3 = (void *)*v2;
  return (_TtC8MapsSync19MapsSyncDataSession *)v3;
}

+ (BOOL)isInMemoryOnly
{
  return byte_1E96E7990;
}

+ (void)reset
{
  if (byte_1E96E7990 == 1)
  {
    if (qword_1E96E6F18 != -1) {
      swift_once();
    }
    -[MapsSyncDataSession resetInMemoryStore]_0();
  }
}

+ (void)resetWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(void))_Block_copy(a3);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1A6F6B0D8(ObjCClassMetadata, v3);
  _Block_release(v3);
}

- (_TtC8MapsSync19MapsSyncDataSession)initWithPersisted:(BOOL)a3 deviceLocal:(BOOL)a4
{
  return (_TtC8MapsSync19MapsSyncDataSession *)sub_1A6F654C8(a3, a4);
}

- (void)getReadContextWithCompletion:(id)a3
{
}

- (id)unsafeGetReadContextAndReturnError:(id *)a3
{
  return sub_1A6F65C2C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__readContext);
}

- (void)getBackgroundReadContextWithCompletion:(id)a3
{
}

- (id)unsafeGetBackgroundReadContextAndReturnError:(id *)a3
{
  return sub_1A6F65C2C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__backgroundReadContext);
}

- (void)getWriteContextWithCompletion:(id)a3
{
}

- (id)unsafeGetWriteContextAndReturnError:(id *)a3
{
  return sub_1A6F65C2C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__writeContext);
}

- (void)deleteAll
{
  v2 = self;
  sub_1A6F65D1C();
}

- (void)resetInMemoryStoreWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  -[MapsSyncDataSession resetInMemoryStore]_0();
  sub_1A6F6AEF4((uint64_t)v5, (void (**)(void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)checkStoreLoadedWithCompletion:(void *)aBlock
{
  v4 = _Block_copy(aBlock);
  _Block_copy(v4);
  id v5 = a1;
  sub_1A6F6AEF4((uint64_t)v5, (void (**)(void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

+ (void)whenReadyWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(void))_Block_copy(a3);
  sub_1A6F694B4(v3);
  _Block_release(v3);
}

- (BOOL)hasLoadedStore
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__loadLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  char v4 = *((unsigned char *)&v3->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__hasLoadedStores);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (NSString)typeString
{
  type metadata accessor for MapsSyncXPCDataContainer();
  if (!swift_dynamicCastClass())
  {
    type metadata accessor for MapsSyncMemoryOnlyDataContainer();
    if (!swift_dynamicCastClass())
    {
      type metadata accessor for MapsSyncCloudKitDataContainer();
      swift_dynamicCastClass();
    }
  }
  v2 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)loadCoreDataStoresFor:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1A6F6B8F8(v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)loadStoresWithCompletion:(id)a3
{
  char v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1A6F66B78((uint64_t)sub_1A6F339E0, v5);

  swift_release();
}

+ (BOOL)shouldRetryStoreLoadAfterErrorWithError:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  id v4 = a3;
  LOBYTE(v3) = sub_1A6F6CCD8(v3);

  return v3 & 1;
}

+ (BOOL)shouldMoveStoreAsideWithError:(id)a3
{
  unint64_t v3 = (unint64_t)a3;
  id v4 = a3;
  LOBYTE(v3) = sub_1A6F6BD48(v3);

  return v3 & 1;
}

- (void)remoteChangeWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6F6D4BC();
}

- (void)contextDidSaveWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = (id)sub_1A709D428();
  MapsSyncPostNotification(v6);
}

- (_TtC8MapsSync19MapsSyncDataSession)init
{
  result = (_TtC8MapsSync19MapsSyncDataSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncDataSession__contextFetchLock);
}

- (uint64_t)resetInMemoryStore
{
  if (qword_1E96E6F18 != -1) {
    swift_once();
  }
  type metadata accessor for MapsSyncXPCDataContainer();
  if (swift_dynamicCastClass())
  {
    unint64_t v0 = 0xE300000000000000;
    uint64_t v1 = 4411480;
  }
  else
  {
    type metadata accessor for MapsSyncMemoryOnlyDataContainer();
    unint64_t v0 = 0xE600000000000000;
    if (swift_dynamicCastClass())
    {
      uint64_t v1 = 0x79726F6D654DLL;
    }
    else
    {
      type metadata accessor for MapsSyncCloudKitDataContainer();
      uint64_t v2 = swift_dynamicCastClass();
      if (v2) {
        uint64_t v1 = 0x74694B64756F6C43;
      }
      else {
        uint64_t v1 = 0x746365726944;
      }
      if (v2) {
        unint64_t v0 = 0xE800000000000000;
      }
    }
  }
  sub_1A709D6A8();
  if (qword_1EB671858 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB671820);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A70A52A0;
  uint64_t v4 = MEMORY[0x1E4FBB1A0];
  *(void *)(v3 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v5 = sub_1A6F024A0();
  *(void *)(v3 + 32) = v1;
  *(void *)(v3 + 40) = v0;
  *(void *)(v3 + 96) = v4;
  *(void *)(v3 + 104) = v5;
  *(void *)(v3 + 64) = v5;
  *(void *)(v3 + 72) = 0xD000000000000019;
  *(void *)(v3 + 80) = 0x80000001A70AD4E0;
  swift_bridgeObjectRetain();
  sub_1A709D2A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v6 = (objc_class *)type metadata accessor for MapsSyncDataSession();
  id v7 = objc_allocWithZone(v6);
  id v8 = sub_1A6F654C8(0, 0);
  v9 = (void *)qword_1E96E7980;
  qword_1E96E7980 = (uint64_t)v8;

  if (qword_1E96E6F20 != -1) {
    swift_once();
  }
  uint64_t v10 = 4411480;
  if (swift_dynamicCastClass())
  {
    unint64_t v11 = 0xE300000000000000;
  }
  else
  {
    type metadata accessor for MapsSyncMemoryOnlyDataContainer();
    unint64_t v11 = 0xE600000000000000;
    if (swift_dynamicCastClass())
    {
      uint64_t v10 = 0x79726F6D654DLL;
    }
    else
    {
      type metadata accessor for MapsSyncCloudKitDataContainer();
      uint64_t v12 = swift_dynamicCastClass();
      if (v12) {
        uint64_t v10 = 0x74694B64756F6C43;
      }
      else {
        uint64_t v10 = 0x746365726944;
      }
      if (v12) {
        unint64_t v11 = 0xE800000000000000;
      }
    }
  }
  sub_1A709D6A8();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1A70A52A0;
  *(void *)(v13 + 56) = v4;
  *(void *)(v13 + 64) = v5;
  *(void *)(v13 + 32) = v10;
  *(void *)(v13 + 40) = v11;
  *(void *)(v13 + 96) = v4;
  *(void *)(v13 + 104) = v5;
  *(void *)(v13 + 72) = 0xD00000000000001FLL;
  *(void *)(v13 + 80) = 0x80000001A70AD500;
  swift_bridgeObjectRetain();
  sub_1A709D2A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v14 = objc_allocWithZone(v6);
  qword_1E96E7988 = (uint64_t)sub_1A6F654C8(0, 0);
  return MEMORY[0x1F41817F8]();
}

@end