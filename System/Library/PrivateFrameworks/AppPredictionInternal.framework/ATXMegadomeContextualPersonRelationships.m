@interface ATXMegadomeContextualPersonRelationships
- (ATXMegadomeContextualPersonRelationships)init;
- (id)megadomePersonIDFromContactID:(id)a3 error:(id *)a4;
- (id)megadomePersonIDFromName:(id)a3 error:(id *)a4;
- (id)megadomePersonIDFromPhoneNumber:(id)a3 error:(id *)a4;
- (void)entityRelationshipsFrom:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation ATXMegadomeContextualPersonRelationships

- (id)megadomePersonIDFromName:(id)a3 error:(id *)a4
{
  return sub_1D13B735C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1D13B8A68);
}

- (id)megadomePersonIDFromContactID:(id)a3 error:(id *)a4
{
  return sub_1D13B735C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1D13B8C04);
}

- (id)megadomePersonIDFromPhoneNumber:(id)a3 error:(id *)a4
{
  return sub_1D13B735C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1D13B8D3C);
}

- (void)entityRelationshipsFrom:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD23A30);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_1D13F27D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA64E2A8;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA64E2B0;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_1D1399050((uint64_t)v10, (uint64_t)&unk_1EA64E2B8, (uint64_t)v15);
  swift_release();
}

- (ATXMegadomeContextualPersonRelationships)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MegadomeContextualPersonRelationships();
  return [(ATXMegadomeContextualPersonRelationships *)&v3 init];
}

@end