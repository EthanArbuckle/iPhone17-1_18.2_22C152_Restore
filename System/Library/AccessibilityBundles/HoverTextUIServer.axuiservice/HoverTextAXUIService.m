@interface HoverTextAXUIService
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(int64_t)a3;
+ (id)sharedInstance;
- (HoverTextAXUIService)init;
- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (id)styleProviderForAlertWithIdentifier:(id)a3;
- (void)externalDisplaySceneConnected:(id)a3;
- (void)externalDisplaySceneDisconnected:(id)a3;
@end

@implementation HoverTextAXUIService

+ (id)sharedInstance
{
  swift_getObjCClassMetadata();
  id v2 = sub_37C4();

  return v2;
}

- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  if (a3) {
    unint64_t v8 = sub_6688();
  }
  else {
    unint64_t v8 = 0;
  }
  uint64_t v9 = sub_66B8();
  unint64_t v11 = v10;
  v12 = self;
  sub_386C(v8, a4, v9, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v13.super.isa = sub_6678().super.isa;
  swift_bridgeObjectRelease();

  return v13.super.isa;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(int64_t)a3
{
  NSString v3 = sub_66A8();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)externalDisplaySceneConnected:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_4F34(a3, "External display scene connected", (uint64_t)&unk_84B0, (uint64_t)&unk_CB80);
}

- (void)externalDisplaySceneDisconnected:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_4F34(a3, "External display scene disconnected", (uint64_t)&unk_8460, (uint64_t)&unk_CB60);
}

- (id)styleProviderForAlertWithIdentifier:(id)a3
{
  if (a3) {
    sub_66B8();
  }
  id v4 = objc_allocWithZone((Class)AXUIHoverTextAlertStyleProvider);
  id v5 = self;
  id v6 = [v4 init];

  swift_bridgeObjectRelease();

  return v6;
}

- (HoverTextAXUIService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator) = 0;
  uint64_t v4 = OBJC_IVAR___HoverTextAXUIService_mainActorQueue;
  sub_6638();
  id v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_6628();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return [(HoverTextAXUIService *)&v7 init];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end