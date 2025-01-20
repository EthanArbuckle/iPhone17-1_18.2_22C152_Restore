@interface Configuration
+ (CKContainerID)containerID;
+ (id)zoneNameForZoneUUID:(id)a3;
+ (id)zoneUUIDForHomeIdentifier:(id)a3;
+ (void)resetWithCompletion:(id)a3;
- (_TtC13HomeKitEvents13Configuration)init;
@end

@implementation Configuration

- (_TtC13HomeKitEvents13Configuration)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Configuration();
  return [(Configuration *)&v3 init];
}

+ (CKContainerID)containerID
{
  swift_getObjCClassMetadata();
  uint64_t v2 = sub_25242205C();
  id v3 = objc_allocWithZone(MEMORY[0x263EFD620]);
  v4 = (void *)sub_25247A830();
  id v5 = objc_msgSend(v3, sel_initWithContainerIdentifier_environment_, v4, v2);

  return (CKContainerID *)v5;
}

+ (id)zoneUUIDForHomeIdentifier:(id)a3
{
  uint64_t v3 = sub_25247A540();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v9 = (char *)&v13 - v8;
  sub_25247A500();
  static Configuration.zoneUUID(forHomeIdentifier:)((uint64_t)v7, (uint64_t)v9);
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v11 = (void *)sub_25247A4E0();
  v10(v9, v3);

  return v11;
}

+ (id)zoneNameForZoneUUID:(id)a3
{
  uint64_t v3 = sub_25247A540();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25247A500();
  uint64_t v13 = sub_25247A4D0();
  uint64_t v14 = v7;
  uint64_t v11 = 0x2D73746E657665;
  unint64_t v12 = 0xE700000000000000;
  uint64_t v11 = sub_25247A970();
  unint64_t v12 = v8;
  sub_25247A910();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v9 = (void *)sub_25247A830();
  swift_bridgeObjectRelease();

  return v9;
}

+ (void)resetWithCompletion:(id)a3
{
  uint64_t v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_getObjCClassMetadata();
  static Configuration.reset(completion:)((uint64_t)sub_252423D18, v4);

  swift_release();
}

@end