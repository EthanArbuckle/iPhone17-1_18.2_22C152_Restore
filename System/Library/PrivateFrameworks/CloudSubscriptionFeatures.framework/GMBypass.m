@interface GMBypass
+ (BOOL)admBypassState;
+ (BOOL)gmEligibilityBypass;
+ (void)setADMBypass:(BOOL)a3;
+ (void)setGMEligibilityBypass:(BOOL)a3;
- (_TtC25CloudSubscriptionFeatures8GMBypass)init;
@end

@implementation GMBypass

+ (BOOL)gmEligibilityBypass
{
  return sub_1A8D4D590();
}

+ (void)setGMEligibilityBypass:(BOOL)a3
{
}

+ (BOOL)admBypassState
{
  return sub_1A8D4D590();
}

+ (void)setADMBypass:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v4 - 8, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (sub_1A8D419C0())
  {
    if (qword_1EB5EA2D8 != -1) {
      swift_once();
    }
    v9 = (void *)qword_1EB5EA2D0;
    v10 = (void *)sub_1A8D59BC0();
    objc_msgSend(v9, sel_setBool_forKey_, v3, v10);

    uint64_t v11 = sub_1A8D59E10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = 0;
    *(void *)(v12 + 24) = 0;
    *(void *)(v12 + 32) = ObjCClassMetadata;
    *(unsigned char *)(v12 + 40) = v3;
    sub_1A8C82C08((uint64_t)v7, (uint64_t)&unk_1E979FB30, v12);
    swift_release();
  }
}

- (_TtC25CloudSubscriptionFeatures8GMBypass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GMBypass();
  return [(GMBypass *)&v3 init];
}

@end