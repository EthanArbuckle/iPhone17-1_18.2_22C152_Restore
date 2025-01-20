@interface FamilyActivityDrawer
- (CGImage)imageWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (_TtC19FamilyControlsAgent20FamilyActivityDrawer)init;
- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
@end

@implementation FamilyActivityDrawer

- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v8 = sub_10001A468(v6, (uint64_t)v10);

  _s19FamilyControlsAgent18AuthorizationStoreVwxx_0((uint64_t)v10);

  return v8;
}

- (CGImage)imageWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_10001A634(v8);

  return (CGImage *)v10;
}

- (_TtC19FamilyControlsAgent20FamilyActivityDrawer)init
{
  v3 = (char *)self + OBJC_IVAR____TtC19FamilyControlsAgent20FamilyActivityDrawer__displayScale;
  *(void *)v3 = swift_getKeyPath();
  v3[8] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FamilyActivityDrawer();
  return [(FamilyActivityDrawer *)&v5 init];
}

- (void).cxx_destruct
{
}

@end