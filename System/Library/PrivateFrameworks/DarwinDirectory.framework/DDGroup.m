@interface DDGroup
+ (DDGroup)groupWithName:(id)a3 fullName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DDGroup)groupWithName:(id)a3 fullName:(id)a4;
- (DDGroup)init;
- (NSSet)aliases;
- (NSSet)nestedGroups;
- (NSString)fullName;
- (NSString)name;
- (NSUUID)uuid;
- (int64_t)hash;
- (unsigned)gid;
- (void)setAliases:(id)a3;
- (void)setFullName:(id)a3;
- (void)setGid:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setNestedGroups:(id)a3;
@end

@implementation DDGroup

- (NSUUID)uuid
{
  return (NSUUID *)sub_24C89AE18(self, (uint64_t)a2, (void (*)(void))type metadata accessor for Group, &OBJC_IVAR___DDGroup__group, (uint64_t (*)(void))type metadata accessor for Group);
}

- (unsigned)gid
{
  return sub_24C89B010(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for Group, &OBJC_IVAR___DDGroup__group, (uint64_t (*)(void))type metadata accessor for Group);
}

- (void)setGid:(unsigned int)a3
{
}

- (NSString)name
{
  return (NSString *)sub_24C89B2A8(self, (uint64_t)a2, (void (*)(void))type metadata accessor for Group, &OBJC_IVAR___DDGroup__group, (uint64_t (*)(void))type metadata accessor for Group);
}

- (void)setName:(id)a3
{
}

- (NSString)fullName
{
  return (NSString *)sub_24C89B590(self, (uint64_t)a2, (void (*)(void))type metadata accessor for Group, &OBJC_IVAR___DDGroup__group, (uint64_t (*)(void))type metadata accessor for Group);
}

- (void)setFullName:(id)a3
{
}

- (NSSet)aliases
{
  uint64_t v3 = type metadata accessor for Group();
  MEMORY[0x270FA5388](v3);
  v5 = v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v6 = (char *)self + OBJC_IVAR___DDGroup__group;
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v6, (uint64_t)v11);
  v7 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_24C8A2A40((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Group);

  v8 = (void *)sub_24C8A7718();
  swift_bridgeObjectRelease();

  return (NSSet *)v8;
}

- (void)setAliases:(id)a3
{
  uint64_t v4 = sub_24C8A7728();
  v5 = self;
  sub_24C89BA90(v4);
}

- (NSSet)nestedGroups
{
  return (NSSet *)sub_24C89BBE4(self, (uint64_t)a2, (void (*)(void))sub_24C89BC88);
}

- (void)setNestedGroups:(id)a3
{
}

- (DDGroup)groupWithName:(id)a3 fullName:(id)a4
{
  result = (DDGroup *)sub_24C8A78C8();
  __break(1u);
  return result;
}

- (DDGroup)init
{
  result = (DDGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (DDGroup)groupWithName:(id)a3 fullName:(id)a4
{
  uint64_t v4 = (int *)type metadata accessor for Group();
  MEMORY[0x270FA5388](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24C8A76E8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_24C8A76E8();
  uint64_t v12 = v11;
  uint64_t v13 = MEMORY[0x263F8EE88];
  *(void *)&v6[v4[8]] = MEMORY[0x263F8EE88];
  *(void *)&v6[v4[9]] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24C8A76A8();
  *(_DWORD *)&v6[v4[5]] = sub_24C8989E0();
  v14 = (uint64_t *)&v6[v4[6]];
  uint64_t *v14 = v7;
  v14[1] = v9;
  v15 = (uint64_t *)&v6[v4[7]];
  uint64_t *v15 = v10;
  v15[1] = v12;
  v16 = (char *)objc_allocWithZone((Class)DDGroup);
  v17 = (uint64_t *)&v16[OBJC_IVAR___DDGroup__group];
  v17[3] = (uint64_t)v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v17);
  sub_24C8A29D8((uint64_t)v6, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for Group);
  v21.receiver = v16;
  v21.super_class = (Class)DDGroup;
  id v19 = objc_msgSendSuper2(&v21, sel_init);
  sub_24C8A2A40((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (DDGroup *)v19;
}

- (BOOL)isEqual:(id)a3
{
  return sub_24C89C9D4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DDGroup.isEqual(_:));
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = DDGroup.hash.getter();

  return v3;
}

@end