@interface FIUIWheelchairStatusProvider
- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4;
@end

@implementation FIUIWheelchairStatusProvider

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2F780);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21E4D0C50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  sub_21E4D0C30();
  id v11 = a3;
  swift_retain();
  swift_retain();
  uint64_t v12 = sub_21E4D0C20();
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = MEMORY[0x263F8F500];
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v14;
  *(void *)(v13 + 32) = v10;
  *(unsigned char *)(v13 + 40) = a4;
  swift_release();
  sub_21E484AA0((uint64_t)v8, (uint64_t)&unk_267D2F818, v13);

  swift_release();
  swift_release();
}

@end