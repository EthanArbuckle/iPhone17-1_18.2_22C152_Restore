@interface FBKSCampaign_FrameworkPrivateName
- (FBKSCampaign_FrameworkPrivateName)init;
- (NSDate)updatedAt;
- (NSString)description;
- (int64_t)state;
@end

@implementation FBKSCampaign_FrameworkPrivateName

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_state);
}

- (NSDate)updatedAt
{
  v2 = (void *)sub_24E001CF0();
  return (NSDate *)v2;
}

- (NSString)description
{
  return (NSString *)sub_24DFFEE74(self, (uint64_t)a2, (void (*)(void))FBKSCampaign.description.getter);
}

- (FBKSCampaign_FrameworkPrivateName)init
{
  result = (FBKSCampaign_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___FBKSCampaign_FrameworkPrivateName_updatedAt;
  uint64_t v3 = sub_24E001D20();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end