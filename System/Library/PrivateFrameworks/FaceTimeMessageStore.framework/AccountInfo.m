@interface AccountInfo
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC20FaceTimeMessageStore11AccountInfo)init;
@end

@implementation AccountInfo

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24DF1F3B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = AccountInfo.isEqual(_:)((uint64_t)v8);

  sub_24DE4CFD4((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  v2 = self;
  AccountInfo.description.getter();

  v3 = (void *)sub_24DF1ECA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC20FaceTimeMessageStore11AccountInfo)init
{
}

@end