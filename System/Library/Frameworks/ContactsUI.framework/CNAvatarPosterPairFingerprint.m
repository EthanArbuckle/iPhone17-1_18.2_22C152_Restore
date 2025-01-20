@interface CNAvatarPosterPairFingerprint
- (BOOL)isEqual:(id)a3;
- (_TtC10ContactsUI29CNAvatarPosterPairFingerprint)init;
- (int64_t)hash;
@end

@implementation CNAvatarPosterPairFingerprint

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18B986518();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_18B6644AC((uint64_t)v8);

  sub_18B667D34((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_18B664898();

  return v3;
}

- (_TtC10ContactsUI29CNAvatarPosterPairFingerprint)init
{
  result = (_TtC10ContactsUI29CNAvatarPosterPairFingerprint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairFingerprint_avatarFingerprint));
  int64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI29CNAvatarPosterPairFingerprint_posterFingerprint);
}

@end