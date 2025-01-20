@interface DDQGroup
+ (NSSet)allGroups;
+ (NSSet)mutableGroups;
+ (id)groupWithGID:(unsigned int)a3;
+ (id)groupWithName:(id)a3;
+ (id)groupWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DDQGroup)groupWithGID:(unsigned int)a3;
- (DDQGroup)groupWithName:(id)a3;
- (DDQGroup)groupWithUUID:(id)a3;
- (DDQGroup)init;
- (NSSet)members;
- (NSString)name;
- (NSUUID)uuid;
- (int64_t)hash;
- (unsigned)gid;
@end

@implementation DDQGroup

+ (NSSet)allGroups
{
  return (NSSet *)sub_24C90A28C((uint64_t)a1, (uint64_t)a2, sub_24C90C794);
}

+ (NSSet)mutableGroups
{
  return (NSSet *)sub_24C90A28C((uint64_t)a1, (uint64_t)a2, sub_24C90CC40);
}

- (NSUUID)uuid
{
  return (NSUUID *)sub_24C90A354(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for Group, &OBJC_IVAR___DDQGroup__group, (uint64_t (*)(void))type metadata accessor for Group);
}

- (unsigned)gid
{
  return sub_24C90A534(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for Group, &OBJC_IVAR___DDQGroup__group, (uint64_t (*)(void))type metadata accessor for Group);
}

- (NSString)name
{
  return (NSString *)sub_24C90A648(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for Group, &OBJC_IVAR___DDQGroup__group, (uint64_t (*)(void))type metadata accessor for Group);
}

- (NSSet)members
{
  v2 = self;
  sub_24C90A7F8();

  type metadata accessor for DDQUser(v3);
  sub_24C90D1D8(&qword_2697FC368, v4, (void (*)(uint64_t))type metadata accessor for DDQUser);
  v5 = (void *)sub_24C91A2C0();
  swift_bridgeObjectRelease();
  return (NSSet *)v5;
}

- (DDQGroup)groupWithUUID:(id)a3
{
}

- (DDQGroup)groupWithGID:(unsigned int)a3
{
  result = (DDQGroup *)sub_24C91A420();
  __break(1u);
  return result;
}

- (DDQGroup)groupWithName:(id)a3
{
  result = (DDQGroup *)sub_24C91A420();
  __break(1u);
  return result;
}

- (DDQGroup)init
{
  result = (DDQGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (id)groupWithUUID:(id)a3
{
  uint64_t v3 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v3);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC308);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC360);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_24C91A260();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  v15 = &v19[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24C91A230();
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v20[3] = &type metadata for ProviderSideEffects;
  v20[4] = &off_26FEFD820;
  v20[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v20[0] + 16);
  v16 = __swift_project_boxed_opaque_existential_1(v20, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v13 + 16))(v5, v15, v12);
  swift_storeEnumTagMultiPayload();
  sub_24C910DB4((uint64_t)v5, (uint64_t)v8);
  sub_24C90C734((uint64_t)v5, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90881C((uint64_t)v20, (uint64_t)v19);
  sub_24C906470((uint64_t)v8, (uint64_t)v19, (uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  id v17 = sub_24C90CF30((uint64_t)v11);
  (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
  return v17;
}

+ (id)groupWithGID:(unsigned int)a3
{
  uint64_t v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (unsigned int *)&v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC308);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC360);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v17[3] = &type metadata for ProviderSideEffects;
  v17[4] = &off_26FEFD820;
  v17[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v17[0] + 16);
  uint64_t v13 = __swift_project_boxed_opaque_existential_1(v17, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  *uint64_t v6 = a3;
  swift_storeEnumTagMultiPayload();
  sub_24C910DB4((uint64_t)v6, (uint64_t)v9);
  sub_24C90C734((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90881C((uint64_t)v17, (uint64_t)v16);
  sub_24C906470((uint64_t)v9, (uint64_t)v16, (uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  id v14 = sub_24C90CF30((uint64_t)v12);
  return v14;
}

+ (id)groupWithName:(id)a3
{
  uint64_t v3 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (uint64_t *)&v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC308);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC360);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_24C91A290();
  uint64_t v14 = v13;
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v19[3] = &type metadata for ProviderSideEffects;
  v19[4] = &off_26FEFD820;
  v19[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v19[0] + 16);
  v15 = __swift_project_boxed_opaque_existential_1(v19, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  uint64_t *v5 = v12;
  v5[1] = v14;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_24C910DB4((uint64_t)v5, (uint64_t)v8);
  sub_24C90C734((uint64_t)v5, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90881C((uint64_t)v19, (uint64_t)v18);
  sub_24C906470((uint64_t)v8, (uint64_t)v18, (uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  id v16 = sub_24C90CF30((uint64_t)v11);
  swift_bridgeObjectRelease();
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  return sub_24C90B710(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DDQGroup.isEqual(_:));
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = DDQGroup.hash.getter();

  return v3;
}

@end