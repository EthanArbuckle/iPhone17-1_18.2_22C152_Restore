@interface FBKSCampaignError_FrameworkPrivateName
- (FBKSCampaignError_FrameworkPrivateName)init;
- (NSDate)date;
- (NSString)description;
- (NSString)domain;
- (NSString)errorDescription;
- (int64_t)code;
@end

@implementation FBKSCampaignError_FrameworkPrivateName

- (NSDate)date
{
  v2 = (void *)sub_24E001CF0();
  return (NSDate *)v2;
}

- (int64_t)code
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_code);
}

- (NSString)domain
{
  return (NSString *)sub_24DFFEB64();
}

- (NSString)errorDescription
{
  return (NSString *)sub_24DFFEB64();
}

- (NSString)description
{
  return (NSString *)sub_24DFFEE74(self, (uint64_t)a2, (void (*)(void))FBKSCampaignError.description.getter);
}

- (FBKSCampaignError_FrameworkPrivateName)init
{
  result = (FBKSCampaignError_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___FBKSCampaignError_FrameworkPrivateName_date;
  uint64_t v3 = sub_24E001D20();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end