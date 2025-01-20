@interface MigratorCache
+ (id)cacheFileNameWithPersonaIdentifier:(id)a3;
+ (id)migratorCacheURLFor:(id)a3;
- (BOOL)isEmpty;
- (BOOL)writeTo:(id)a3 error:(id *)a4;
- (NSSet)bundleIDs;
- (_TtC18RestorePostProcess13MigratorCache)init;
- (_TtC18RestorePostProcess13MigratorCache)initWithUrl:(id)a3 error:(id *)a4;
- (void)addBundleID:(id)a3;
- (void)setBundleIDs:(id)a3;
@end

@implementation MigratorCache

+ (id)migratorCacheURLFor:(id)a3
{
  uint64_t v3 = sub_19F40();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_19F90();
  sub_174A0(v7, v8);
  swift_bridgeObjectRelease();
  sub_19F00(v9);
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v11;
}

- (NSSet)bundleIDs
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_19FC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v2.super.isa;
}

- (void)setBundleIDs:(id)a3
{
  uint64_t v4 = sub_19FD0();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_bundleIDs);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)isEmpty
{
  NSSet v2 = (char *)self + OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_bundleIDs;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16) == 0;
}

- (void)addBundleID:(id)a3
{
  Swift::Int v4 = sub_19F90();
  Swift::Int v6 = v5;
  uint64_t v7 = self;
  sub_178E8(v4, v6);

  swift_bridgeObjectRelease();
}

- (_TtC18RestorePostProcess13MigratorCache)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_lock;
  type metadata accessor for MBUnfairLock();
  Swift::Int v5 = (objc_class *)swift_allocObject();
  Swift::Int v6 = self;
  uint64_t v7 = (_DWORD *)swift_slowAlloc();
  *((void *)v5 + 2) = v7;
  *uint64_t v7 = 0;
  *(Class *)((char *)&self->super.isa + v4) = v5;
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC18RestorePostProcess13MigratorCache_bundleIDs) = (Class)&_swiftEmptySetSingleton;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return [(MigratorCache *)&v9 init];
}

- (BOOL)writeTo:(id)a3 error:(id *)a4
{
  swift_getObjectType();
  uint64_t v5 = sub_19F40();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  unint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19F20();
  sub_19EC0();
  swift_allocObject();
  objc_super v9 = self;
  sub_19EB0();
  v14[1] = v9;
  sub_18B68(&qword_2E920);
  uint64_t v10 = sub_19EA0();
  unint64_t v12 = v11;
  swift_release();
  sub_19F60();
  sub_18AB8(v10, v12);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (_TtC18RestorePostProcess13MigratorCache)initWithUrl:(id)a3 error:(id *)a4
{
  sub_19F40();
  __chkstk_darwin();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19F20();
  return (_TtC18RestorePostProcess13MigratorCache *)sub_1831C((uint64_t)v5);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

+ (id)cacheFileNameWithPersonaIdentifier:(id)a3
{
  sub_19F90();
  sub_1A010(22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6._object = (void *)0x8000000000021670;
  v6._countAndFlagsBits = 0xD000000000000014;
  sub_19FB0(v6);
  swift_bridgeObjectRelease();
  NSString v3 = sub_19F80();
  swift_bridgeObjectRelease();

  return v3;
}

@end