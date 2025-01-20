@interface AppRemovability
+ (void)isAllowedAndPossibleWithApp:(LSApplicationRecord *)a3 completionHandler:(id)a4;
- (_TtC17StorageSettingsUI15AppRemovability)init;
@end

@implementation AppRemovability

+ (void)isAllowedAndPossibleWithApp:(LSApplicationRecord *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_14F50(&qword_A3500);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_76D70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_A4478;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_A4488;
  v14[5] = v13;
  v15 = a3;
  sub_6068C((uint64_t)v9, (uint64_t)&unk_A4498, (uint64_t)v14);
  swift_release();
}

- (_TtC17StorageSettingsUI15AppRemovability)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppRemovability();
  return [(AppRemovability *)&v3 init];
}

@end