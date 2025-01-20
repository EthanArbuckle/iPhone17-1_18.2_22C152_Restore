@interface LiveSpeechAXUIServiceInstance
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(int64_t)a3;
+ (id)sharedInstance;
- (LiveSpeechAXUIServiceInstance)init;
- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)externalDisplaySceneConnected:(id)a3;
- (void)externalDisplaySceneDisconnected:(id)a3;
@end

@implementation LiveSpeechAXUIServiceInstance

+ (id)sharedInstance
{
  swift_getObjCClassMetadata();
  id v2 = sub_2A514();

  return v2;
}

- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  if (a3) {
    uint64_t v8 = sub_A7140();
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = sub_A71D0();
  unint64_t v11 = v10;
  v12 = self;
  sub_2A5BC(v8, a4, v9, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v13.super.isa = sub_A7130().super.isa;
  swift_bridgeObjectRelease();

  return v13.super.isa;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(int64_t)a3
{
  NSString v3 = sub_A71A0();

  return v3;
}

- (void)externalDisplaySceneConnected:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2B9C8(a3, "External display scene connected", (uint64_t)&unk_CFF08, (uint64_t)&unk_D8BE8);
}

- (void)externalDisplaySceneDisconnected:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2B9C8(a3, "External display scene disconnected", (uint64_t)&unk_CFEE0, (uint64_t)&unk_D8BD8);
}

- (LiveSpeechAXUIServiceInstance)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___LiveSpeechAXUIServiceInstance____lazy_storage___coordinator) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(LiveSpeechAXUIServiceInstance *)&v5 init];
}

- (void).cxx_destruct
{
}

@end