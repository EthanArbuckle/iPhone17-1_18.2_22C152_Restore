@interface FBKSFeedback_FrameworkPrivateName
- (FBKSFeedback_FrameworkPrivateName)init;
- (NSDate)submissionDate;
- (NSString)build;
- (NSString)description;
- (NSString)formIdentifier;
- (int64_t)id;
@end

@implementation FBKSFeedback_FrameworkPrivateName

- (NSString)formIdentifier
{
  return (NSString *)sub_24DFFEB64();
}

- (NSDate)submissionDate
{
  v2 = (void *)sub_24E001CF0();
  return (NSDate *)v2;
}

- (NSString)build
{
  return (NSString *)sub_24DFFEB64();
}

- (int64_t)id
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_id);
}

- (NSString)description
{
  return (NSString *)sub_24DFFEE74(self, (uint64_t)a2, (void (*)(void))FBKSFeedback.description.getter);
}

- (FBKSFeedback_FrameworkPrivateName)init
{
  result = (FBKSFeedback_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___FBKSFeedback_FrameworkPrivateName_submissionDate;
  uint64_t v4 = sub_24E001D20();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end