@interface AppProtectionManager
- (void)shieldViewUnlockButtonPressed:(id)a3;
@end

@implementation AppProtectionManager

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E3BD50);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2443BA9E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_2443BA950();
  id v9 = a3;
  swift_retain_n();
  id v10 = v9;
  uint64_t v11 = sub_2443BA940();
  v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v10;
  v12[5] = self;
  sub_243EACE30((uint64_t)v7, (uint64_t)&unk_268E444F8, (uint64_t)v12);

  swift_release();
  swift_release();
}

@end