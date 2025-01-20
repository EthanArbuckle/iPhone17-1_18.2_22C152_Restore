@interface SlotDrawer
- (_TtC28ManagedAppDistributionDaemon10SlotDrawer)init;
- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
@end

@implementation SlotDrawer

- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000144C8((uint64_t)v14, (uint64_t)v13);
  type metadata accessor for SecureButtonTag();
  if (swift_dynamicCast())
  {
    objc_allocWithZone((Class)type metadata accessor for SecureButton());
    id v9 = v7;
    id v10 = sub_1003ED0AC(v9, v12, a5);
  }
  else
  {

    id v10 = 0;
  }
  sub_100014524((uint64_t)v14);

  return v10;
}

- (_TtC28ManagedAppDistributionDaemon10SlotDrawer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SlotDrawer();
  return [(SlotDrawer *)&v3 init];
}

@end