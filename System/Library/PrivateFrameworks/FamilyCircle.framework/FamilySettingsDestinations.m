@interface FamilySettingsDestinations
+ (id)urlDestinationTo:(int64_t)a3 error:(id *)a4;
+ (id)urlDestinationTo:(int64_t)a3 params:(id)a4 error:(id *)a5;
- (FamilySettingsDestinations)init;
@end

@implementation FamilySettingsDestinations

+ (id)urlDestinationTo:(int64_t)a3 error:(id *)a4
{
  uint64_t v5 = sub_1D25AA520();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjCClassMetadata();
  static FamilySettingsDestinations.urlDestination(to:)(a3);
  v9 = (void *)sub_1D25AA4E0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

+ (id)urlDestinationTo:(int64_t)a3 params:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1D25AA520();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1D25AA920();
  static FamilySettingsDestinations.urlDestination(to:params:)(a3, v10, (uint64_t)v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_1D25AA4E0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (FamilySettingsDestinations)init
{
  v3.receiver = self;
  v3.super_class = (Class)FamilySettingsDestinations;
  return [(FamilySettingsDestinations *)&v3 init];
}

@end