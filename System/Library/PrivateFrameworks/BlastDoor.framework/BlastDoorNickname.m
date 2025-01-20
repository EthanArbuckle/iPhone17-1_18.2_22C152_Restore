@interface BlastDoorNickname
- (BlastDoorAvatarImage)avatar;
- (BlastDoorMorphology)pronouns;
- (BlastDoorNickname)init;
- (BlastDoorWallpaper)wallpaper;
- (NSString)description;
- (NSString)firstName;
- (NSString)lastName;
@end

@implementation BlastDoorNickname

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for Nickname, &OBJC_IVAR___BlastDoorNickname_nickname, type metadata accessor for Nickname);
}

- (NSString)firstName
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorNickname_nickname);
}

- (NSString)lastName
{
  return (NSString *)sub_1B17AD14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorNickname_nickname);
}

- (BlastDoorAvatarImage)avatar
{
  v2 = self;
  id v3 = sub_1B178F9C4();

  return (BlastDoorAvatarImage *)v3;
}

- (BlastDoorWallpaper)wallpaper
{
  v2 = self;
  id v3 = sub_1B178FB14();

  return (BlastDoorWallpaper *)v3;
}

- (BlastDoorMorphology)pronouns
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorNickname_nickname;
  id v3 = &v2[*(int *)(type metadata accessor for Nickname(0) + 32)];
  uint64_t v4 = *((void *)v3 + 1);
  if (v4)
  {
    uint64_t v5 = *(void *)v3;
    uint64_t v6 = *(void *)v3 >> 8;
    uint64_t v7 = *(void *)v3 >> 16;
    v8 = (objc_class *)type metadata accessor for _ObjCMorphologyWrapper();
    v9 = (char *)objc_allocWithZone(v8);
    v10 = &v9[OBJC_IVAR___BlastDoorMorphology_morphology];
    char *v10 = v5;
    v10[1] = v6;
    v10[2] = v7;
    *((void *)v10 + 1) = v4;
    v13.receiver = v9;
    v13.super_class = v8;
    swift_bridgeObjectRetain();
    v11 = [(BlastDoorNickname *)&v13 init];
  }
  else
  {
    v11 = 0;
  }
  return (BlastDoorMorphology *)v11;
}

- (BlastDoorNickname)init
{
  result = (BlastDoorNickname *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end