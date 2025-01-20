@interface DDUser
+ (id)userWithName:(id)a3 fullName:(id)a4 primaryGroup:(id)a5;
- (BOOL)isEqual:(id)a3;
- (DDGroup)primaryGroup;
- (DDUser)init;
- (DDUser)userWithName:(id)a3 fullName:(id)a4 primaryGroup:(id)a5;
- (NSSet)aliases;
- (NSSet)memberships;
- (NSString)fullName;
- (NSString)homeDirectory;
- (NSString)name;
- (NSString)shell;
- (NSUUID)uuid;
- (int64_t)hash;
- (unsigned)uid;
- (void)setAliases:(id)a3;
- (void)setFullName:(id)a3;
- (void)setHomeDirectory:(id)a3;
- (void)setMemberships:(id)a3;
- (void)setName:(id)a3;
- (void)setPrimaryGroup:(id)a3;
- (void)setShell:(id)a3;
- (void)setUid:(unsigned int)a3;
@end

@implementation DDUser

- (NSUUID)uuid
{
  return (NSUUID *)sub_24C89AE18(self, (uint64_t)a2, (void (*)(void))type metadata accessor for User, &OBJC_IVAR___DDUser__user, (uint64_t (*)(void))type metadata accessor for User);
}

- (unsigned)uid
{
  return sub_24C89B010(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for User, &OBJC_IVAR___DDUser__user, (uint64_t (*)(void))type metadata accessor for User);
}

- (void)setUid:(unsigned int)a3
{
}

- (NSString)name
{
  return (NSString *)sub_24C89B2A8(self, (uint64_t)a2, (void (*)(void))type metadata accessor for User, &OBJC_IVAR___DDUser__user, (uint64_t (*)(void))type metadata accessor for User);
}

- (void)setName:(id)a3
{
}

- (NSString)fullName
{
  return (NSString *)sub_24C89B590(self, (uint64_t)a2, (void (*)(void))type metadata accessor for User, &OBJC_IVAR___DDUser__user, (uint64_t (*)(void))type metadata accessor for User);
}

- (void)setFullName:(id)a3
{
}

- (NSString)homeDirectory
{
  type metadata accessor for User();
  MEMORY[0x270FA5388]();
  v4 = v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v5 = (char *)self + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v5, (uint64_t)v10);
  v6 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_24C8A2A40((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for User);

  v7 = (void *)sub_24C8A76D8();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (void)setHomeDirectory:(id)a3
{
}

- (DDGroup)primaryGroup
{
  v2 = self;
  id v3 = sub_24C899670();

  return (DDGroup *)v3;
}

- (void)setPrimaryGroup:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_24C8A1D88((uint64_t)v5);
}

- (NSString)shell
{
  uint64_t v3 = type metadata accessor for User();
  MEMORY[0x270FA5388](v3);
  id v5 = v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v6 = (char *)self + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v6, (uint64_t)v11);
  v7 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_24C8A2A40((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for User);

  v8 = (void *)sub_24C8A76D8();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (void)setShell:(id)a3
{
}

- (NSSet)aliases
{
  uint64_t v3 = type metadata accessor for User();
  MEMORY[0x270FA5388](v3);
  id v5 = v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v6 = (char *)self + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v6, (uint64_t)v11);
  v7 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_24C8A2A40((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for User);

  v8 = (void *)sub_24C8A7718();
  swift_bridgeObjectRelease();

  return (NSSet *)v8;
}

- (void)setAliases:(id)a3
{
  uint64_t v4 = sub_24C8A7728();
  id v5 = self;
  sub_24C899D84(v4);
}

- (NSSet)memberships
{
  return (NSSet *)sub_24C89BBE4(self, (uint64_t)a2, (void (*)(void))sub_24C899ED8);
}

- (void)setMemberships:(id)a3
{
}

- (DDUser)userWithName:(id)a3 fullName:(id)a4 primaryGroup:(id)a5
{
  result = (DDUser *)sub_24C8A78C8();
  __break(1u);
  return result;
}

- (DDUser)init
{
  result = (DDUser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (id)userWithName:(id)a3 fullName:(id)a4 primaryGroup:(id)a5
{
  uint64_t v6 = sub_24C8A76E8();
  uint64_t v8 = v7;
  uint64_t v9 = sub_24C8A76E8();
  uint64_t v11 = v10;
  id v12 = a5;
  id v13 = sub_24C8A2584(v6, v8, v9, v11, (uint64_t)v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  return sub_24C89C9D4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DDUser.isEqual(_:));
}

- (int64_t)hash
{
  uint64_t v3 = type metadata accessor for User();
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)self + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v6, (uint64_t)v10);
  uint64_t v7 = self;
  swift_dynamicCast();
  sub_24C8A7908();
  User.hash(into:)(v10);
  int64_t v8 = sub_24C8A7948();
  sub_24C8A2A40((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for User);

  return v8;
}

@end