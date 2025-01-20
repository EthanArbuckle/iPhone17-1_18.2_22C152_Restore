@interface FBKSFeedbackCount_FrameworkPrivateName
+ (id)fromJSONWithData:(id)a3;
+ (void)fetchCountsForFormWithIdentifier:(id)a3 completion:(id)a4;
- (FBKSCampaign_FrameworkPrivateName)currentCampaign;
- (FBKSFeedbackCount_FrameworkPrivateName)init;
- (NSArray)errors;
- (NSArray)feedbackFiled;
- (NSData)asJSON;
- (NSString)debugDescription;
- (NSString)description;
- (int64_t)declineCount;
@end

@implementation FBKSFeedbackCount_FrameworkPrivateName

- (NSData)asJSON
{
  v2 = self;
  uint64_t v3 = FBKSFeedbackCount.asJSON.getter();
  unint64_t v5 = v4;

  v6 = (void *)sub_24E001CC0();
  sub_24DF9311C(v3, v5);
  return (NSData *)v6;
}

+ (id)fromJSONWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_24E001CD0();
  unint64_t v6 = v5;

  v7 = (void *)_s15FeedbackService17FBKSFeedbackCountC8fromJSON4dataACSg10Foundation4DataV_tFZ_0();
  sub_24DF9311C(v4, v6);
  return v7;
}

- (FBKSCampaign_FrameworkPrivateName)currentCampaign
{
  return (FBKSCampaign_FrameworkPrivateName *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                      + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_currentCampaign));
}

- (NSArray)feedbackFiled
{
  return (NSArray *)sub_24DFFAF40((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_feedbackFiled, (void (*)(void))type metadata accessor for FBKSFeedback);
}

- (NSArray)errors
{
  return (NSArray *)sub_24DFFAF40((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_errors, (void (*)(void))type metadata accessor for FBKSCampaignError);
}

- (int64_t)declineCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___FBKSFeedbackCount_FrameworkPrivateName_declineCount);
}

+ (void)fetchCountsForFormWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  uint64_t v5 = sub_24E001E30();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  _s15FeedbackService17FBKSFeedbackCountC18fetchCountsForForm10identifier10completionySS_yACSg_So7NSErrorCSgtctFZ_0(v5, v7, (uint64_t)sub_24E001018, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

- (NSString)debugDescription
{
  return (NSString *)sub_24DFFEE74(self, (uint64_t)a2, (void (*)(void))FBKSFeedbackCount.debugDescription.getter);
}

- (NSString)description
{
  return (NSString *)sub_24DFFEE74(self, (uint64_t)a2, (void (*)(void))FBKSFeedbackCount.description.getter);
}

- (FBKSFeedbackCount_FrameworkPrivateName)init
{
  result = (FBKSFeedbackCount_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end