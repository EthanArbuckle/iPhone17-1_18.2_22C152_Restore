@interface DDQUser
+ (NSSet)allUsers;
+ (NSSet)mutableUsers;
+ (id)userWithName:(id)a3;
+ (id)userWithUID:(unsigned int)a3;
+ (id)userWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DDQUser)init;
- (DDQUser)userWithName:(id)a3;
- (DDQUser)userWithUID:(unsigned int)a3;
- (DDQUser)userWithUUID:(id)a3;
- (NSString)fullName;
- (NSString)homeDirectory;
- (NSString)name;
- (NSString)shell;
- (NSUUID)uuid;
- (int64_t)hash;
- (unsigned)primaryGroupID;
- (unsigned)uid;
@end

@implementation DDQUser

+ (NSSet)allUsers
{
  return (NSSet *)sub_24C9095D4((uint64_t)a1, (uint64_t)a2, (unint64_t *)sub_24C917E4C);
}

+ (NSSet)mutableUsers
{
  return (NSSet *)sub_24C9095D4((uint64_t)a1, (uint64_t)a2, (unint64_t *)sub_24C9183C4);
}

- (NSUUID)uuid
{
  return (NSUUID *)sub_24C90A354(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for User, &OBJC_IVAR___DDQUser__user, (uint64_t (*)(void))type metadata accessor for User);
}

- (unsigned)uid
{
  return sub_24C90A534(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for User, &OBJC_IVAR___DDQUser__user, (uint64_t (*)(void))type metadata accessor for User);
}

- (NSString)name
{
  return (NSString *)sub_24C90A648(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for User, &OBJC_IVAR___DDQUser__user, (uint64_t (*)(void))type metadata accessor for User);
}

- (NSString)fullName
{
  uint64_t v3 = type metadata accessor for User();
  MEMORY[0x270FA5388](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24C909FA8((uint64_t)self + OBJC_IVAR___DDQUser__user, (uint64_t)v9);
  v6 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_24C90C734((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for User);

  v7 = (void *)sub_24C91A280();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)homeDirectory
{
  uint64_t v3 = type metadata accessor for User();
  MEMORY[0x270FA5388](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24C909FA8((uint64_t)self + OBJC_IVAR___DDQUser__user, (uint64_t)v9);
  v6 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_24C90C734((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for User);

  v7 = (void *)sub_24C91A280();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (unsigned)primaryGroupID
{
  uint64_t v3 = type metadata accessor for User();
  MEMORY[0x270FA5388](v3);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24C909FA8((uint64_t)self + OBJC_IVAR___DDQUser__user, (uint64_t)v8);
  v6 = self;
  swift_dynamicCast();
  LODWORD(v3) = *(_DWORD *)&v5[*(int *)(v3 + 36)];
  sub_24C90C734((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for User);

  return v3;
}

- (NSString)shell
{
  uint64_t v3 = type metadata accessor for User();
  MEMORY[0x270FA5388](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24C909FA8((uint64_t)self + OBJC_IVAR___DDQUser__user, (uint64_t)v9);
  v6 = self;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_24C90C734((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for User);

  v7 = (void *)sub_24C91A280();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (DDQUser)userWithUUID:(id)a3
{
}

- (DDQUser)userWithUID:(unsigned int)a3
{
  result = (DDQUser *)sub_24C91A420();
  __break(1u);
  return result;
}

- (DDQUser)userWithName:(id)a3
{
  result = (DDQUser *)sub_24C91A420();
  __break(1u);
  return result;
}

- (DDQUser)init
{
  result = (DDQUser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (id)userWithUUID:(id)a3
{
  uint64_t v3 = sub_24C91A260();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C91A230();
  id v7 = sub_24C90C040((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

+ (id)userWithUID:(unsigned int)a3
{
  id v3 = sub_24C90C264(a3);
  return v3;
}

+ (id)userWithName:(id)a3
{
  uint64_t v3 = sub_24C91A290();
  id v5 = sub_24C90C450(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return sub_24C90B710(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DDQUser.isEqual(_:));
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = DDQUser.hash.getter();

  return v3;
}

@end